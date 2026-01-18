-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 18, 2026 at 12:22 PM
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
-- Database: `txn_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `gl_posting`
--

CREATE TABLE `gl_posting` (
  `posting_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `line_no` int(11) NOT NULL,
  `ledger_code` varchar(30) NOT NULL,
  `dr_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `cr_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gl_voucher`
--

CREATE TABLE `gl_voucher` (
  `voucher_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `source_type` varchar(30) NOT NULL,
  `source_id` int(11) NOT NULL,
  `voucher_date` date NOT NULL,
  `narration` varchar(300) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receivable_open_item`
--

CREATE TABLE `receivable_open_item` (
  `open_item_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `invoice_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `received_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `balance_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `status` char(1) NOT NULL DEFAULT 'O',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_header`
--

CREATE TABLE `sales_invoice_header` (
  `invoice_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `invoice_date` date NOT NULL,
  `party_id` int(11) NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `customer_gstin` varchar(15) DEFAULT NULL,
  `pos_state_code` char(2) NOT NULL,
  `supply_type` enum('L','I','E','SEZ') NOT NULL DEFAULT 'L',
  `gst_type` enum('CGST_SGST','IGST') NOT NULL,
  `payment_mode` enum('C','B','U') NOT NULL DEFAULT 'B',
  `status` char(1) NOT NULL DEFAULT 'O',
  `receipt_ref` varchar(120) DEFAULT NULL,
  `irn` varchar(120) DEFAULT NULL,
  `ewb_no` varchar(50) DEFAULT NULL,
  `ledger_folio` varchar(50) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `taxable_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `cgst_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `sgst_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `igst_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `cess_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `round_off` decimal(14,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `received_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `balance_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `revision_no` int(11) NOT NULL DEFAULT 0,
  `edit_reason` varchar(300) DEFAULT NULL,
  `lock_version` int(11) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_line`
--

CREATE TABLE `sales_invoice_line` (
  `line_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `line_no` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `hsn_sac_id` int(11) NOT NULL,
  `hsn_sac_code` varchar(20) NOT NULL,
  `hsn_sac_type` enum('HSN','SAC') NOT NULL,
  `qty` decimal(14,3) NOT NULL DEFAULT 0.000,
  `unit` varchar(20) NOT NULL,
  `price` decimal(14,2) NOT NULL DEFAULT 0.00,
  `taxable_value` decimal(14,2) NOT NULL DEFAULT 0.00,
  `applied_rate_profile_id` int(11) NOT NULL,
  `applied_rate_percent` decimal(6,2) NOT NULL,
  `cgst_percent` decimal(6,2) NOT NULL,
  `sgst_percent` decimal(6,2) NOT NULL,
  `igst_percent` decimal(6,2) NOT NULL,
  `cess_percent` decimal(6,2) NOT NULL,
  `cgst_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `sgst_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `igst_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `cess_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `line_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_move`
--

CREATE TABLE `stock_move` (
  `move_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `move_date` date NOT NULL,
  `source_type` varchar(30) NOT NULL,
  `source_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty_in` decimal(14,3) NOT NULL DEFAULT 0.000,
  `qty_out` decimal(14,3) NOT NULL DEFAULT 0.000,
  `unit` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gl_posting`
--
ALTER TABLE `gl_posting`
  ADD PRIMARY KEY (`posting_id`),
  ADD KEY `idx_post_voucher` (`tenant_id`,`voucher_id`),
  ADD KEY `idx_post_ledger` (`tenant_id`,`ledger_code`);

--
-- Indexes for table `gl_voucher`
--
ALTER TABLE `gl_voucher`
  ADD PRIMARY KEY (`voucher_id`),
  ADD UNIQUE KEY `uq_voucher_source` (`tenant_id`,`source_type`,`source_id`),
  ADD KEY `idx_voucher_date` (`tenant_id`,`voucher_date`);

--
-- Indexes for table `receivable_open_item`
--
ALTER TABLE `receivable_open_item`
  ADD PRIMARY KEY (`open_item_id`),
  ADD UNIQUE KEY `uq_open_item` (`tenant_id`,`invoice_id`),
  ADD KEY `idx_open_party` (`tenant_id`,`party_id`),
  ADD KEY `idx_open_due` (`tenant_id`,`due_date`),
  ADD KEY `idx_open_status` (`tenant_id`,`status`);

--
-- Indexes for table `sales_invoice_header`
--
ALTER TABLE `sales_invoice_header`
  ADD PRIMARY KEY (`invoice_id`),
  ADD UNIQUE KEY `uq_inv_no` (`tenant_id`,`invoice_no`),
  ADD KEY `idx_inv_date` (`tenant_id`,`invoice_date`),
  ADD KEY `idx_inv_party` (`tenant_id`,`party_id`),
  ADD KEY `idx_inv_status` (`tenant_id`,`status`);

--
-- Indexes for table `sales_invoice_line`
--
ALTER TABLE `sales_invoice_line`
  ADD PRIMARY KEY (`line_id`),
  ADD KEY `idx_line_inv` (`tenant_id`,`invoice_id`),
  ADD KEY `idx_line_item` (`tenant_id`,`item_id`);

--
-- Indexes for table `stock_move`
--
ALTER TABLE `stock_move`
  ADD PRIMARY KEY (`move_id`),
  ADD KEY `idx_stock_source` (`tenant_id`,`source_type`,`source_id`),
  ADD KEY `idx_stock_item` (`tenant_id`,`item_id`),
  ADD KEY `idx_stock_date` (`tenant_id`,`move_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gl_posting`
--
ALTER TABLE `gl_posting`
  MODIFY `posting_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gl_voucher`
--
ALTER TABLE `gl_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receivable_open_item`
--
ALTER TABLE `receivable_open_item`
  MODIFY `open_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_invoice_header`
--
ALTER TABLE `sales_invoice_header`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_invoice_line`
--
ALTER TABLE `sales_invoice_line`
  MODIFY `line_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_move`
--
ALTER TABLE `stock_move`
  MODIFY `move_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
