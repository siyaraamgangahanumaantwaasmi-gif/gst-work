# gst-work

This repository contains a database-driven GST operations slice. The public entry point now lives in `public/main_entry.php`, which bootstraps the app by extracting bundled app files from the `app_files` table and then loading `app/bootstrap.php`.

## Quick setup

1. Import the SQL files in `sql/` (UI, master, txn, and `05_app_files_bundle.sql`).
2. Point your Apache document root to `public/` and ensure `public/.htaccess` is enabled.
3. Visit the app to trigger extraction of the bundled app files.
