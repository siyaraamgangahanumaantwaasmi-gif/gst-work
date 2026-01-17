// file: main_entry.php
<?php
declare(strict_types=1);

/*
 * Single entry point for DB-driven micro-cellular UI.
 * Only responsibilities:
 *  - config
 *  - session init
 *  - PDO connections to 3 databases
 *  - router (path -> page_name)
 *  - page composition loader
 *  - code cell executor (PHP/HTML/CSS/JS)
 *  - maintenance endpoint to re-hash code_cells (infrastructure)
 */

// =========================
// CONFIG (edit here)
// =========================
const APP_DEBUG = false; // true for verbose errors

// IMPORTANT: set a long random token before using maintenance endpoints.
const MAINT_TOKEN = "hash_RESET_TOKEN";

// Database credentials
const DB_USER = "gstr1";
const DB_PASS = "gstLOCAL*123";

// Prefer unix socket on Debian; fallback to host/port if socket file missing.
const DB_SOCKET = "/var/run/mysqld/mysqld.sock";
const DB_HOST = "127.0.0.1";
const DB_PORT = 3306;

// DB names (as per your server): ui_db, master_db, txn_db
const UI_DB_NAME = "ui_db";
const MASTER_DB_NAME = "master_db";
const TXN_DB_NAME = "txn_db";

// =========================
// Runtime settings
// =========================
if (APP_DEBUG) {
    ini_set("display_errors", "1");
    ini_set("display_startup_errors", "1");
    error_reporting(E_ALL);
} else {
    ini_set("display_errors", "0");
    error_reporting(E_ALL);
}

header("X-Content-Type-Options: nosniff");

if (session_status() !== PHP_SESSION_ACTIVE) {
    // Safe defaults for subfolder apps
    ini_set("session.use_strict_mode", "1");
    session_start();
}

// =========================
// Helpers
// =========================
function h(?string $s): string
{
    return htmlspecialchars((string) $s, ENT_QUOTES | ENT_SUBSTITUTE, "UTF-8");
}

/** @return array<int, mixed> */
function json_array(string $json): array
{
    $json = trim($json);
    if ($json === "") {
        return [];
    }
    $decoded = json_decode($json, true);
    if (!is_array($decoded)) {
        return [];
    }
    return $decoded;
}

function base_path(): string
{
    // SCRIPT_NAME usually: /gst_work/main_entry.php
    $script = $_SERVER["SCRIPT_NAME"] ?? "";
    $dir = rtrim(str_replace("\\", "/", dirname($script)), "/");
    if ($dir === "" || $dir === ".") {
        return "";
    }
    if ($dir === "/") {
        return "";
    }
    return $dir;
}

function request_path(string $basePath): string
{
    $uri = $_SERVER["REQUEST_URI"] ?? "/";
    $path = parse_url($uri, PHP_URL_PATH);
    if (!is_string($path)) {
        $path = "/";
    }

    if ($basePath !== "" && str_starts_with($path, $basePath)) {
        $path = substr($path, strlen($basePath));
        if ($path === false) {
            $path = "/";
        }
    }

    $path = "/" . ltrim($path, "/");
    // Normalize: collapse multiple slashes
    $path = preg_replace("#/+#", "/", $path) ?? $path;
    return $path;
}

function redirect_to(string $url, int $code = 302): void
{
    header("Location: " . $url, true, $code);
    exit();
}

function timing_safe_equals(string $a, string $b): bool
{
    return hash_equals($a, $b);
}

function pdo_for_db(string $dbName): PDO
{
    $charset = "utf8mb4";

    $dsn = "";
    if (DB_SOCKET !== "" && @is_file(DB_SOCKET)) {
        $dsn =
            "mysql:unix_socket=" . DB_SOCKET . ";dbname=" . $dbName . ";charset=" . $charset;
    } else {
        $dsn =
            "mysql:host=" .
            DB_HOST .
            ";port=" .
            (string) DB_PORT .
            ";dbname=" .
            $dbName .
            ";charset=" .
            $charset;
    }

    $pdo = new PDO($dsn, DB_USER, DB_PASS, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);

    return $pdo;
}

function csrf_token(): string
{
    if (empty($_SESSION["_csrf_token"]) || !is_string($_SESSION["_csrf_token"])) {
        $_SESSION["_csrf_token"] = bin2hex(random_bytes(32));
    }
    return (string) $_SESSION["_csrf_token"];
}

function csrf_field(): string
{
    return '<input type="hidden" name="csrf_token" value="' . h(csrf_token()) . '">';
}

function csrf_check(): void
{
    if (($_SERVER["REQUEST_METHOD"] ?? "GET") !== "POST") {
        return;
    }
    $posted = $_POST["csrf_token"] ?? "";
    $sess = $_SESSION["_csrf_token"] ?? "";
    if (
        !is_string($posted) ||
        !is_string($sess) ||
        $posted === "" ||
        !hash_equals($sess, $posted)
    ) {
        http_response_code(400);
        echo "Bad Request (CSRF).";
        exit();
    }
}

function flash_set(string $key, string $msg): void
{
    $_SESSION["_flash"][$key] = $msg;
}

function flash_get(string $key): ?string
{
    if (!isset($_SESSION["_flash"][$key])) {
        return null;
    }
    $msg = $_SESSION["_flash"][$key];
    unset($_SESSION["_flash"][$key]);
    return is_string($msg) ? $msg : null;
}

/**
 * Fetch + decode code cell.
 *
 * @return array{cell_name:string, cell_type:string, content:string, sha_stored:string, sha_computed:string, version:int}
 */
function db_get_cell(PDO $pdo_ui, string $cellName, bool $verifyIntegrity = true): array
{
    $stmt = $pdo_ui->prepare(
        "SELECT cell_name, cell_type, content_base64, sha256, version FROM code_cells WHERE cell_name = :n AND is_active = 1 LIMIT 1",
    );
    $stmt->execute([":n" => $cellName]);
    $row = $stmt->fetch();

    if (!$row) {
        throw new RuntimeException("Missing code cell: " . $cellName);
    }

    $b64 = (string) ($row["content_base64"] ?? "");
    $storedSha = trim((string) ($row["sha256"] ?? ""));

    // base64_decode strict first. If DB has whitespace/newlines, strip them and retry.
    $decoded = base64_decode($b64, true);
    if ($decoded === false) {
        $b64_clean = preg_replace("/\s+/", "", $b64) ?? "";
        $decoded = base64_decode($b64_clean, true);
    }
    if ($decoded === false) {
        throw new RuntimeException("Invalid base64 in cell: " . $cellName);
    }

    $computedSha = hash("sha256", $decoded);

    if ($verifyIntegrity) {
        // normalize case to avoid "ABC" vs "abc" mismatch
        if (!hash_equals(strtolower($storedSha), strtolower($computedSha))) {
            throw new RuntimeException(
                "Integrity check failed (sha256) for cell: " . $cellName,
            );
        }
    }

    return [
        "cell_name" => (string) $row["cell_name"],
        "cell_type" => (string) $row["cell_type"],
        "content" => $decoded,
        "sha_stored" => $storedSha,
        "sha_computed" => $computedSha,
        "version" => (int) ($row["version"] ?? 1),
    ];
}

function exec_php_cell(string $php, array $ctx): void
{
    // Allow cells stored with or without PHP tags
    $php = preg_replace("/^\s*<\?php\s*/", "", $php) ?? $php;
    $php = preg_replace('/\?>\s*$/', "", $php) ?? $php;

    $runner = function () use ($php, $ctx): void {
        // Provide ctx into local scope
        $CTX = $ctx;
        // And also convenience variables
        extract($ctx, EXTR_SKIP);
        eval($php);
    };

    $runner();
}

function exec_cell(PDO $pdo_ui, array $cell, array $ctx): void
{
    $type = strtoupper(trim($cell["cell_type"]));
    $content = (string) $cell["content"];

    if ($type === "PHP") {
        exec_php_cell($content, $ctx);
        return;
    }

    if ($type === "HTML") {
        echo $content;
        return;
    }

    if ($type === "CSS") {
        echo "\n<style>\n" . $content . "\n</style>\n";
        return;
    }

    if ($type === "JS") {
        echo "\n<script>\n" . $content . "\n</script>\n";
        return;
    }

    throw new RuntimeException(
        "Unsupported cell_type: " . $type . " for cell " . ($cell["cell_name"] ?? ""),
    );
}

/**
 * Implements db_require_once("cell_name") for PHP cells.
 * The loaded-set is per-request.
 */
function db_require_once(string $cellName): void
{
    /** @var callable|null $loader */
    $loader = $GLOBALS["__db_cell_loader"] ?? null;
    if (!is_callable($loader)) {
        throw new RuntimeException("db_require_once() is not available in this context.");
    }
    $loader($cellName);
}

/**
 * Maintenance: recompute sha256 for all active code_cells.
 *
 * @return array{updated:int, ok:int, failed:int, details:array<int, array<string,string>>}
 */
function maint_rehash_cells(PDO $pdo_ui): array
{
    $q = $pdo_ui->query(
        "SELECT cell_name, content_base64, sha256 FROM code_cells WHERE is_active = 1 ORDER BY cell_name",
    );
    $rows = $q->fetchAll();

    $upd = $pdo_ui->prepare(
        "UPDATE code_cells SET sha256 = :sha, updated_at = NOW() WHERE cell_name = :n",
    );

    $updated = 0;
    $ok = 0;
    $failed = 0;
    $details = [];

    foreach ($rows as $r) {
        $name = (string) ($r["cell_name"] ?? "");
        $b64 = (string) ($r["content_base64"] ?? "");
        $stored = trim((string) ($r["sha256"] ?? ""));

        $decoded = base64_decode($b64, true);
        if ($decoded === false) {
            $b64_clean = preg_replace("/\s+/", "", $b64) ?? "";
            $decoded = base64_decode($b64_clean, true);
        }

        if ($decoded === false) {
            $failed++;
            $details[] = [
                "cell" => $name,
                "status" => "FAILED",
                "note" => "Invalid base64",
            ];
            continue;
        }

        $computed = hash("sha256", $decoded);
        $ok++;

        if (!hash_equals(strtolower($stored), strtolower($computed))) {
            $upd->execute([":sha" => $computed, ":n" => $name]);
            $updated++;
            $details[] = [
                "cell" => $name,
                "status" => "UPDATED",
                "note" => "sha256 reset",
            ];
        } else {
            $details[] = [
                "cell" => $name,
                "status" => "OK",
                "note" => "no change",
            ];
        }
    }

    return [
        "updated" => $updated,
        "ok" => $ok,
        "failed" => $failed,
        "details" => $details,
    ];
}

// =========================
// Connect DBs
// =========================
try {
    $pdo_ui = pdo_for_db(UI_DB_NAME);
    $pdo_master = pdo_for_db(MASTER_DB_NAME);
    $pdo_txn = pdo_for_db(TXN_DB_NAME);
} catch (Throwable $e) {
    http_response_code(500);
    if (APP_DEBUG) {
        echo '<pre>DB connection failed.\n' .
            h($e->getMessage()) .
            "\n" .
            h($e->getTraceAsString()) .
            "</pre>";
    } else {
        echo "DB connection failed.";
    }
    exit();
}

$basePath = base_path();
$path = request_path($basePath);

// =========================
// Maintenance endpoints (run before any code cell execution)
// =========================
$maintAction = null;
if (isset($_GET["__maint"]) && is_string($_GET["__maint"])) {
    $maintAction = $_GET["__maint"];
} elseif ($path === "/__maint/rehash") {
    $maintAction = "rehash";
}

if ($maintAction !== null) {
    $token = (string) ($_GET["token"] ?? "");
    if (!timing_safe_equals($token, MAINT_TOKEN)) {
        http_response_code(403);
        echo "Forbidden.";
        exit();
    }

    if ($maintAction === "rehash") {
        $res = maint_rehash_cells($pdo_ui);

        header("Content-Type: text/html; charset=utf-8");
        echo "<h2>Rehash code_cells</h2>";
        echo "<p>updated: " .
            (int) $res["updated"] .
            " | ok: " .
            (int) $res["ok"] .
            " | failed: " .
            (int) $res["failed"] .
            "</p>";

        echo '<table border="1" cellpadding="6" cellspacing="0">';
        echo "<tr><th>cell</th><th>status</th><th>note</th></tr>";
        foreach ($res["details"] as $d) {
            echo "<tr>";
            echo "<td>" . h($d["cell"] ?? "") . "</td>";
            echo "<td>" . h($d["status"] ?? "") . "</td>";
            echo "<td>" . h($d["note"] ?? "") . "</td>";
            echo "</tr>";
        }
        echo "</table>";

        exit();
    }

    http_response_code(400);
    echo "Unknown maintenance action.";
    exit();
}

// =========================
// Router: resolve page_name
// =========================
$pageName = null;
if (isset($_GET["p"]) && is_string($_GET["p"]) && trim($_GET["p"]) !== "") {
    $pageName = trim($_GET["p"]);
} else {
    // Try route_registry if exists
    try {
        $stmt = $pdo_ui->prepare(
            "SELECT page_name FROM route_registry WHERE route_path = :p LIMIT 1",
        );
        $stmt->execute([":p" => $path]);
        $row = $stmt->fetch();
        if ($row && isset($row["page_name"])) {
            $pageName = (string) $row["page_name"];
        }
    } catch (PDOException $e) {
        // 42S02 = table not found
        if (($e->getCode() ?? "") !== "42S02") {
            throw $e;
        }
    }

    if ($pageName === null) {
        $slug = trim($path, "/");
        $pageName = $slug !== "" ? $slug : "home";
    }
}

// =========================
// Load page composition
// =========================
$stmt = $pdo_ui->prepare(
    "SELECT page_title, requires_login, cells_json FROM page_compositions WHERE page_name = :n LIMIT 1",
);
$stmt->execute([":n" => $pageName]);
$page = $stmt->fetch();

if (!$page) {
    http_response_code(404);
    echo "Page not found.";
    exit();
}

$pageTitle = (string) ($page["page_title"] ?? $pageName);
$requiresLogin = (int) ($page["requires_login"] ?? 0) === 1;
$cells = json_array((string) ($page["cells_json"] ?? "[]"));

if ($requiresLogin && empty($_SESSION["user_id"])) {
    $next = $path;
    $loginUrl = $basePath . "/login?next=" . rawurlencode($next);
    redirect_to($loginUrl);
}

// =========================
// Context for PHP cells
// =========================
csrf_check();

$ctx = [
    "pdo_ui" => $pdo_ui,
    "pdo_master" => $pdo_master,
    "pdo_txn" => $pdo_txn,

    "base_path" => $basePath,
    "path" => $path,
    "page_name" => $pageName,
    "page_title" => $pageTitle,

    "get" => $_GET,
    "post" => $_POST,
    "req" => $_REQUEST,

    // session by reference
    "session" => &$_SESSION,

    // helpers
    "h" => fn(?string $s): string => h($s),
    "csrf_token" => fn(): string => csrf_token(),
    "csrf_field" => fn(): string => csrf_field(),
    "flash_get" => fn(string $k): ?string => flash_get($k),
    // NOTE: arrow functions cannot safely wrap void functions; use a normal closure.
    "flash_set" => function (string $k, string $m): void {
        flash_set($k, $m);
    },
    "url" => function (string $rel = "") use ($basePath): string {
        $rel = "/" . ltrim($rel, "/");
        return $basePath . $rel;
    },
    "redirect" => function (string $rel = "", int $code = 302) use ($basePath): void {
        $rel = "/" . ltrim($rel, "/");
        redirect_to($basePath . $rel, $code);
    },
];

$GLOBALS["__db_loaded_cells"] = [];
$GLOBALS["__db_cell_loader"] = function (string $cellName) use ($pdo_ui, &$ctx): void {
    $loaded = &$GLOBALS["__db_loaded_cells"];
    if (!is_array($loaded)) {
        $loaded = [];
    }
    if (isset($loaded[$cellName])) {
        return;
    }
    $cell = db_get_cell($pdo_ui, $cellName, true);
    if (strtoupper($cell["cell_type"]) !== "PHP") {
        throw new RuntimeException(
            "db_require_once can only load PHP cells. Got: " .
                $cell["cell_type"] .
                " for " .
                $cellName,
        );
    }
    $loaded[$cellName] = true;
    exec_cell($pdo_ui, $cell, $ctx);
};

// =========================
// Execute page cells in order
// =========================
try {
    header("Content-Type: text/html; charset=utf-8");

    foreach ($cells as $cellName) {
        if (!is_string($cellName) || trim($cellName) === "") {
            continue;
        }
        $cellName = trim($cellName);
        $cell = db_get_cell($pdo_ui, $cellName, true);
        exec_cell($pdo_ui, $cell, $ctx);
    }
} catch (Throwable $e) {
    http_response_code(500);

    if (APP_DEBUG) {
        echo '<pre>Runtime error\n' .
            h($e->getMessage()) .
            "\n\n" .
            h($e->getTraceAsString()) .
            "</pre>";
    } else {
        echo "Runtime error.";
    }
}

