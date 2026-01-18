<?php
declare(strict_types=1);

// =========================
// CONFIG (edit here)
// =========================
const APP_DEBUG = false; // true for verbose errors

// IMPORTANT: set a long random token before using maintenance endpoints.
const MAINT_TOKEN = "RESET_TOKEN";

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

if (session_status() !== PHP_SESSION_ACTIVE) {
    // Safe defaults for subfolder apps
    ini_set("session.use_strict_mode", "1");
    session_start();
}

// =========================
// App bundle loader
// =========================
function pdo_for_ui_db(): PDO
{
    $charset = "utf8mb4";

    if (DB_SOCKET !== "" && @is_file(DB_SOCKET)) {
        $dsn = "mysql:unix_socket=" . DB_SOCKET . ";dbname=" . UI_DB_NAME . ";charset=" . $charset;
    } else {
        $dsn = "mysql:host=" . DB_HOST . ";port=" . (string) DB_PORT . ";dbname=" . UI_DB_NAME . ";charset=" . $charset;
    }

    return new PDO($dsn, DB_USER, DB_PASS, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);
}

function extract_app_files(PDO $pdo, string $projectRoot): void
{
    $stmt = $pdo->query("SELECT file_path, content_text FROM app_files ORDER BY file_path");
    $rows = $stmt->fetchAll();

    foreach ($rows as $row) {
        $filePath = (string) ($row["file_path"] ?? "");
        $contentText = (string) ($row["content_text"] ?? "");
        if ($filePath === "") {
            continue;
        }

        $target = rtrim($projectRoot, DIRECTORY_SEPARATOR) . DIRECTORY_SEPARATOR . $filePath;
        $dir = dirname($target);
        if (!is_dir($dir)) {
            if (!mkdir($dir, 0755, true) && !is_dir($dir)) {
                throw new RuntimeException("Failed to create directory: " . $dir);
            }
        }

        if (is_file($target)) {
            $existing = file_get_contents($target);
            if ($existing === $contentText) {
                continue;
            }
        }

        if (file_put_contents($target, $contentText) === false) {
            throw new RuntimeException("Failed to write file: " . $target);
        }
    }
}

try {
    $pdo_ui = pdo_for_ui_db();
    $projectRoot = dirname(__DIR__);
    extract_app_files($pdo_ui, $projectRoot);
} catch (Throwable $e) {
    http_response_code(500);
    if (APP_DEBUG) {
        echo "<pre>App bootstrap failed.\n" . htmlspecialchars($e->getMessage(), ENT_QUOTES) . "</pre>";
    } else {
        echo "App bootstrap failed.";
    }
    exit();
}

require dirname(__DIR__) . "/app/bootstrap.php";
