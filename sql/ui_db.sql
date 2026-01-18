-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 18, 2026 at 12:25 PM
-- Server version: 11.4.8-MariaDB-deb12
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ui_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `code_cells`
--

CREATE TABLE `code_cells` (
  `cell_name` varchar(120) NOT NULL,
  `cell_type` enum('PHP','HTML','CSS','JS') NOT NULL,
  `content_text` longtext NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `code_cells`
--

INSERT INTO `code_cells` (`cell_name`, `cell_type`, `content_text`, `version`, `updated_at`, `is_active`) VALUES
('core_bootstrap', 'PHP', '      if (!function_exists(''db_all'')) {
      function db_all(PDO $pdo, string $sql, array $params = []): array {
        $st = $pdo->prepare($sql);
        $st->execute($params);
        return $st->fetchAll();
      }
      function db_one(PDO $pdo, string $sql, array $params = []): ?array {
        $st = $pdo->prepare($sql);
        $st->execute($params);
        $row = $st->fetch();
        return $row ? $row : null;
      }
      function db_val(PDO $pdo, string $sql, array $params = []): mixed {
        $st = $pdo->prepare($sql);
        $st->execute($params);
        return $st->fetchColumn();
      }
      function db_exec(PDO $pdo, string $sql, array $params = []): int {
        $st = $pdo->prepare($sql);
        $st->execute($params);
        return $st-rowCount();
      }
    }

    function ctx_tenant_id(array $ctx): int { return (int)($ctx[''tenant_id''] ?? 1); }
    function ctx_username(array $ctx): string { return (string)($ctx[''auth_user''][''username''] ?? ''''); }

    // ---- UI
      function gst_type_label(string $t): string { return $t===''CGST_SGST''?''CGST+SGST'':$t; }
    function render_errors(array $errors): void {
      if (!$errors) return;
      echo ''<div class="box err"><strong>Please fix:</strong><ul>'';
      foreach ($errors as $e) echo ''<li>''.(h($e)).''</li>'';
      echo ''</ul></div>'';
    }
    function sel(string $name, array $opts, ?string $sel): string {
      $out = ''<select name="''.(h($name)).''">'';
      foreach ($opts as $k=>$v) {
        $sel_at = ((string)$sel === (string)$k) ? '' selected'' : '''';
        $out .= ''<option value="''.(h((string)$k)).''"'' ''.$sel_at.''>''.(h((string)$v)).''</option>'';
      }
      ''out .= ''</select>'';
      return $out;
    }

    function get_setting(array $ctx, string $key, string $def = ''''): string {
      $st = $ctx[''pdo_ui'']->prepare("SELECT setting_value FROM settings WHERE tenant_id=? AND setting_key=?");
      $st->execute([ctx_tenant_id($ctx), $key]);
      $v = $st->fetchColumn();
      return $v !== false ? (string)$v : $def;
    }
    function set_setting(array $ctx, string $key, string $val): void {
      db_exec($ctx[''pdo_ui''], "REPLACE INTO settings(tenant_id,setting_key,setting_value) VALUES (?,?,?)" , [ctx_tenant_id($ctx), $key, $val]);
    }

    // ---- Auth
    function auth_login(array $ctx, string $username, string $pass): bool {
      $row = db_one($ctx[''pdo_ui''], "SELECT user_id,tenant_id,username,password_plain,display_name,role FROM users WHERE username=? AND is_active=1", [$username]);
      if (!$row) return false;
      if ($pass !== (string)$row[''password_plain'']) return false;
      $ctx[''session''][''user_id''] = (int)$row[''user_id''];
      $ctx[''session''][''tenant_id''] = (int)$row[''tenant_id''];
      db_exec($ctx[''pdo_ui''], "UPDDATE users SET last_login_at=NOW() WHERE user_id=?", [(int)$row[''user_id'']]);
      return true;
    }
    function auth_logout(array $ctx): void {
      $ctx[''session''] = [];
      if (ini_get("session.use_cookies")) {
        $p = session_get_cookie_params();
        setcookie(session_name(), '''', time()-42000, $p[''path''], $p[''domain''], $p[''secure''], $p[''httponly'']);
      }
      session_destroy();
    }

    // ---- Masters: Party (A2)
    function party_save(array $ctx, array $d, array &$errors): int {
      $tid = ctx_tenant_id($ctx);
      $pm = $ctx[''pdo_master''];
      $d[''customer_code''] = trim($d[''customer_code'']);
      $d[''customer_name''] = trim($d[''customer_name'']);
      $gstin = strtoupper(trim($d[''gstin'']));
      $pan = strtoupper(trim($d[''pan'']));
      $state = strtoupper(trim($d[''state_code'']));
      if ($d[''customer_code'']==='''') $errors[]="Customer Code required.";
      if ($d[''customer_name'']==='''') errors[]="Customer Name required.";
      if ($gstin!=='''' && !validate_gstin($gstin)) $errors[]="GSTIN must be 15 chars (alphanumeric).";
      if ($pan==='''') { //�', 2, '2026-01-17 18:57:27', 1),
('core_css', 'CSS', 'body{font-family:system-ui,-apple-system,Segoe UI,Roboto,Arial,sans-serif;color:#111;margin:0;background:#f6f8fc;}
a {color:#0666cc;text-decoration:none}
a.btn{color:#fff}
.container{max-width:1200px;margin:0 8px 24px;padding:0}
.header{background:#182230;color:#fff;padding:10px 12px;}
.header nav a {margin-right:12px;color:#fff;opacity:0.9}
.header nav a:hover{opacity:1}
.box{background:#fff;border:1px solid #ddd;border-radius:8px;padding:12px;margin:12px 0;box-shadow:0 1px 2px rgba(0,0,0,0.05);}
.row{display:flex;gap:12px;flex-wrap:wrap;}
.col;.col-2{flex:1;}
.col-2{min-width:320px}
input,select,textarea{width:100%;padding:8px;border:1px solid #ccc;border-radius:6px;background:#fff;}
label{display:block;font-size:13px;color:#333;margin-bottom:10px;}
small{color:#666;}
.btn{display:inline-block;padding:8px 12px;border-radius:6px;border:1px solid #2a569c;background:#2a569c;color:#fff;cursor:pointer;font-size:14px;}
.btn.secondary{background:#444;border-color:#444;}
.btn.danger{background:#b3261e;border-color:#b3261e;}
.btn:submit{}
.tab{width:100%;border-collapse:collapse;font-size:13px;}
.tab th,.tab td{border: 1px solid #ddd;padding:6px 8px;vertical-align:top}
.tab th{background:#f0f2f5;text-align:left}
.num{text-align:right;white-space:nowrap}
.flash{narg   in:10px 0;padding:8px 12px;border-radius:6px;border:1px solid #ccc;background:#ffffea;}
.err{border-color:#b3261e;background:#ffeeee}
.footer{padding:20px 12px;color:#666;font-size:12px;}
.badge{display:inline-block;padding:1px 6px;border-radius:10px;font-size:12px;background:#eee;}
.inlineform{display:inline;}
.muted{color:#888;font-size:12px;}
', 2, '2026-01-17 18:57:27', 1),
('core_js', 'JS', 'document.addEventListener(''change'', function(e) {
  const t = e.target;
  if (!t) return;
  if (t.matches && t.matches(''select[name="item_ids[]"]'')) {
    const opt = t.selectedOptions[0];
    if (!opt) return;
    const price = opt.getAttribute(''data-price'');
    const tr = t.closest(''rr'');
    if (tr) {
      const p = tr.querySelector(''input[name="prices[]");
      if (p && p.value === '''' && price !== null) {
        p.value = price;
      }
    }
  }
});
', 2, '2026-01-17 18:57:27', 1),
('layout_footer', 'PHP', '      echo ''</div>'';
      echo ''<div class="footer">Copyright &#1i69; Operations-first Accounting (DB driven)</div>'';
      echo "</body></html>";
', 2, '2026-01-17 18:57:27', 1),
('layout_head', 'PHP', '      $charset = ''utf-8'';
      $title = $ctx[''page_title''] ?? ''Operations Accounting'';
      header(''Content-Type: text/html; charset='' . $charset);
      echo "<!doctype html><html lang=\\"en\\"><head><meta charset=\\"utf-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1\\"><meta http-equiv=\\"X-UA-Compatible\\" content=\\"=edge\\">";
      echo "<title>" . h($title) . "</title>";
      echo "</head><body>";
', 2, '2026-01-17 17:28:30', 1),
('layout_header', 'PHP', '      $flash = flash_all();
      echo ''<div class="header"><b>Operations Accounting</b> <span class="badge">DBOLY- DOVEN</span>'';
      echo ''<nav style="margin-top:6px;">'';
      if (!empty($ctx[''auth_user''])) {
        echo ''<a href="''.h(u(''/'')).''">Dashboard</a>'';
        echo ''<a href="''.h(u(''/masters/party'')).''">>Party Master</a>'';
        echo ''<a href="''.(h(u(''/masters/item''))).''">Item Master</a>'';
        echo ''<a href="''.h(u(''/masters/hsn-rate-history''))).''">HSN/SAC + Rate</a>'';
        echo ''<a href="''.h(u(''/sales/invoice/list''))).''">Sales Invoices</a>'';
        echo ''<a href="''.h(u(''/settings''))).''">Settings</a>'';
        echo ''<a href="''.(h(u(''/logout''))).''">Sud-out</a>'';
        echo ''<span class="muted" style="margin-left:10px;">User: ''.h($ctx[''auth_user''][''username'']).''</span>'';
      } else {
        echo ''<a href="''.h(u(''/login'')).''">Login</a>'';
      }
      echo ''</nav></div>'';

      echo ''<div class="container">'';
      foreach ($flash as $k=>$m) {
        $cls = (in_array($k,[''error'',''danger''],true)) ? ''box err'' : ''box flash'';
        echo ''<div class="''.(h($cls)).''">''.(h($m)).''</div>'';
      }
', 2, '2026-01-17 18:57:27', 1),
('page_dispatch', 'PHP', '      app_dispatch($ctx);
', 2, '2026-01-17 18:57:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_compositions`
--

CREATE TABLE `page_compositions` (
  `page_name` varchar(120) NOT NULL,
  `page_title` varchar(200) NOT NULL,
  `requires_login` tinyint(4) NOT NULL,
  `menu_group` varchar(50) DEFAULT NULL,
  `cells_json` longtext NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_compositions`
--

INSERT INTO `page_compositions` (`page_name`, `page_title`, `requires_login`, `menu_group`, `cells_json`, `updated_at`) VALUES
('dashboard', 'Dashboard', 1, 'core', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('login', 'Login', 0, NULL, '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('logout', 'Logout', 1, 'core', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('masters_hsn_rate_history', 'HSN/SAC + GST Rate History', 1, 'masters', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('masters_item', 'Item/Service Master (A4)', 1, 'masters', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('masters_party', 'Party Master (A2)', 1, 'masters', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('sales_invoice_edit', 'Edit Sales Invoice', 1, 'sales', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('sales_invoice_list', 'Sales Invoice Register (A6)', 1, 'sales', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('sales_invoice_new', 'New Sales Invoice (A6)', 1, 'sales', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('sales_invoice_view', 'Invoice View', 1, 'sales', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('settings', 'Settings', 1, 'core', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `route_registry`
--

CREATE TABLE `route_registry` (
  `route_path` varchar(200) NOT NULL,
  `page_name` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `route_registry`
--

INSERT INTO `route_registry` (`route_path`, `page_name`) VALUES
('/', 'dashboard'),
('/login', 'login'),
('/logout', 'logout'),
('/masters/hsn-rate-history', 'masters_hsn_rate_history'),
('/masters/item', 'masters_item'),
('/masters/party', 'masters_party'),
('/sales/invoice/edit', 'sales_invoice_edit'),
('/sales/invoice/list', 'sales_invoice_list'),
('/sales/invoice/new', 'sales_invoice_new'),
('/sales/invoice/view', 'sales_invoice_view'),
('/settings', 'settings');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `tenant_id` int(11) NOT NULL,
  `setting_key` varchar(120) NOT NULL,
  `setting_value` varchar(500) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`tenant_id`, `setting_key`, `setting_value`, `updated_at`) VALUES
(1, 'app_mode', 'NORMAL', '2026-01-17 12:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `tenant_id` int(11) NOT NULL,
  `tenant_code` varchar(50) NOT NULL,
  `tenant_name` varchar(200) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`tenant_id`, `tenant_code`, `tenant_name`, `is_active`, `created_at`) VALUES
(1, 'DEFAULT', 'Default Tenant', 1, '2026-01-17 12:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password_plain` varchar(255) NOT NULL,
  `display_name` varchar(120) DEFAULT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'ADMIN',
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `tenant_id`, `username`, `password_plain`, `display_name`, `role`, `is_active`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin123', 'Administrator', 'ADMIN', 1, NULL, '2026-01-17 12:59:50', '2026-01-17 12:59:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `code_cells`
--
ALTER TABLE `code_cells`
  ADD PRIMARY KEY (`cell_name`);

--
-- Indexes for table `page_compositions`
--
ALTER TABLE `page_compositions`
  ADD PRIMARY KEY (`page_name`);

--
-- Indexes for table `route_registry`
--
ALTER TABLE `route_registry`
  ADD PRIMARY KEY (`route_path`),
  ADD KEY `idx_route_page` (`page_name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`tenant_id`,`setting_key`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`tenant_id`),
  ADD UNIQUE KEY `uq_tenant_code` (`tenant_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uq_username` (`username`),
  ADD KEY `idx_users_tenant` (`tenant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `tenant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
