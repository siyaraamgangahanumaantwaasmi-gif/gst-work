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
-- Database: `master_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `coa_accounts`
--

CREATE TABLE `coa_accounts` (
  `tenant_id` int(11) NOT NULL,
  `ledger_code` varchar(30) NOT NULL,
  `ledger_name` varchar(200) NOT NULL,
  `ledger_type` enum('ASSET','LIABILITY','INCOME','EXPENSE') NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coa_accounts`
--

INSERT INTO `coa_accounts` (`tenant_id`, `ledger_code`, `ledger_name`, `ledger_type`, `is_active`, `created_at`) VALUES
(1, 'DEBTORS_CTRL', 'Debtors Control', 'ASSET', 1, '2026-01-17 12:59:50'),
(1, 'OUT_CESS', 'Output Cess', 'LIABILITY', 1, '2026-01-17 12:59:50'),
(1, 'OUT_CGST', 'Output CGST', 'LIABILITY', 1, '2026-01-17 12:59:50'),
(1, 'OUT_IGST', 'Output IGST', 'LIABILITY', 1, '2026-01-17 12:59:50'),
(1, 'OUT_SGST', 'Output SGST', 'LIABILITY', 1, '2026-01-17 12:59:50'),
(1, 'ROUND_OFF', 'Round Off', 'EXPENSE', 1, '2026-01-17 12:59:50'),
(1, 'SALES_REV', 'Sales / Revenue', 'INCOME', 1, '2026-01-17 12:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `gst_rate_profile`
--

CREATE TABLE `gst_rate_profile` (
  `rate_profile_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `total_rate_percent` decimal(6,2) NOT NULL,
  `cgst_percent` decimal(6,2) NOT NULL,
  `sgst_percent` decimal(6,2) NOT NULL,
  `igst_percent` decimal(6,2) NOT NULL,
  `cess_percent` decimal(6,2) NOT NULL DEFAULT 0.00,
  `is_exempt` tinyint(4) NOT NULL DEFAULT 0,
  `is_nil` tinyint(4) NOT NULL DEFAULT 0,
  `notes` varchar(300) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(80) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gst_rate_profile`
--

INSERT INTO `gst_rate_profile` (`rate_profile_id`, `tenant_id`, `total_rate_percent`, `cgst_percent`, `sgst_percent`, `igst_percent`, `cess_percent`, `is_exempt`, `is_nil`, `notes`, `created_at`, `created_by`, `updated_at`) VALUES
(1, 1, 18.00, 9.00, 9.00, 18.00, 0.00, 0, 0, 'Seed 18%', '2026-01-17 12:59:50', 'seed', '2026-01-17 12:59:50'),
(2, 1, 5.00, 2.50, 2.50, 5.00, 0.00, 0, 0, 'Seed 5%', '2026-01-17 12:59:50', 'seed', '2026-01-17 12:59:50');

--
-- Triggers `gst_rate_profile`
--
DELIMITER $$
CREATE TRIGGER `trg_gst_rate_profile_no_delete` BEFORE DELETE ON `gst_rate_profile` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'gst_rate_profile is immutable: delete blocked';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_gst_rate_profile_no_update` BEFORE UPDATE ON `gst_rate_profile` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'gst_rate_profile is immutable: update blocked';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hsn_gst_rate_history`
--

CREATE TABLE `hsn_gst_rate_history` (
  `history_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `hsn_sac_id` int(11) NOT NULL,
  `rate_profile_id` int(11) NOT NULL,
  `effective_from` date NOT NULL,
  `effective_to` date DEFAULT NULL,
  `change_reason` varchar(300) DEFAULT NULL,
  `created_by` varchar(80) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hsn_gst_rate_history`
--

INSERT INTO `hsn_gst_rate_history` (`history_id`, `tenant_id`, `hsn_sac_id`, `rate_profile_id`, `effective_from`, `effective_to`, `change_reason`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '2017-07-01', NULL, 'Seed mapping', 'seed', '2026-01-17 12:59:50', '2026-01-17 12:59:50'),
(2, 1, 2, 1, '2017-07-01', NULL, 'Seed mapping', 'seed', '2026-01-17 12:59:50', '2026-01-17 12:59:50');

--
-- Triggers `hsn_gst_rate_history`
--
DELIMITER $$
CREATE TRIGGER `trg_hsn_hist_no_overlap_ins` BEFORE INSERT ON `hsn_gst_rate_history` FOR EACH ROW BEGIN
  DECLARE v_to DATE;
  SET v_to = IFNULL(NEW.effective_to, '9999-12-31');
  IF EXISTS (
    SELECT 1 FROM hsn_gst_rate_history h
     WHERE h.tenant_id = NEW.tenant_id
       AND h.hsn_sac_id = NEW.hsn_sac_id
       AND NEW.effective_from <= IFNULL(h.effective_to, '9999-12-31')
       AND v_to >= h.effective_from
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'HSN GST history overlap detected';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_hsn_hist_no_overlap_upd` BEFORE UPDATE ON `hsn_gst_rate_history` FOR EACH ROW BEGIN
  DECLARE v_to DATE;
  SET v_to = IFNULL(NEW.effective_to, '9999-12-31');
  IF EXISTS (
    SELECT 1 FROM hsn_gst_rate_history h
     WHERE h.tenant_id = NEW.tenant_id
       AND h.hsn_sac_id = NEW.hsn_sac_id
       AND h.history_id <> OLD.history_id
       AND NEW.effective_from <= IFNULL(h.effective_to, '9999-12-31')
       AND v_to >= h.effective_from
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'HSN GST history overlap detected';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hsn_sac_master`
--

CREATE TABLE `hsn_sac_master` (
  `hsn_sac_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `hsn_sac_code` varchar(20) NOT NULL,
  `hsn_sac_type` enum('HSN','SAC') NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hsn_sac_master`
--

INSERT INTO `hsn_sac_master` (`hsn_sac_id`, `tenant_id`, `hsn_sac_code`, `hsn_sac_type`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '1001', 'HSN', 'Sample Goods', 1, '2026-01-17 12:59:50', '2026-01-17 12:59:50'),
(2, 1, '9983', 'SAC', 'Sample Services', 1, '2026-01-17 12:59:50', '2026-01-17 12:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `item_master`
--

CREATE TABLE `item_master` (
  `item_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `hsn_sac_id` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `sale_price` decimal(14,2) NOT NULL DEFAULT 0.00,
  `purchase_price` decimal(14,2) NOT NULL DEFAULT 0.00,
  `reorder_level` decimal(14,3) NOT NULL DEFAULT 0.000,
  `stock_type` enum('RM','FG','SVC') NOT NULL DEFAULT 'FG',
  `itc_category` enum('I','IS','CG') NOT NULL DEFAULT 'I',
  `status` char(1) NOT NULL DEFAULT 'O',
  `remarks` varchar(500) DEFAULT NULL,
  `lock_version` int(11) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_master`
--

INSERT INTO `item_master` (`item_id`, `tenant_id`, `item_code`, `description`, `hsn_sac_id`, `unit`, `sale_price`, `purchase_price`, `reorder_level`, `stock_type`, `itc_category`, `status`, `remarks`, `lock_version`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'FG001', 'Sample Product', 1, 'PCS', 100.00, 70.00, 0.000, 'FG', 'I', 'O', '', 1, 0, '2026-01-17 12:59:50', '2026-01-17 12:59:50'),
(2, 1, 'SVC001', 'Consulting Service', 2, 'HRS', 1000.00, 0.00, 0.000, 'SVC', 'IS', 'O', '', 1, 0, '2026-01-17 12:59:50', '2026-01-17 12:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `party_master`
--

CREATE TABLE `party_master` (
  `party_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `customer_code` varchar(50) NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `gstin` varchar(15) DEFAULT NULL,
  `pan` varchar(10) DEFAULT NULL,
  `state_code` char(2) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `contact` varchar(120) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `payment_terms_days` int(11) NOT NULL DEFAULT 0,
  `credit_limit` decimal(14,2) NOT NULL DEFAULT 0.00,
  `tcs_applicable` tinyint(4) NOT NULL DEFAULT 0,
  `status` char(1) NOT NULL DEFAULT 'O',
  `remarks` varchar(500) DEFAULT NULL,
  `lock_version` int(11) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `party_master`
--

INSERT INTO `party_master` (`party_id`, `tenant_id`, `customer_code`, `customer_name`, `gstin`, `pan`, `state_code`, `address`, `contact`, `email`, `payment_terms_days`, `credit_limit`, `tcs_applicable`, `status`, `remarks`, `lock_version`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'CUST001', 'Demo Customer', '', NULL, '27', 'Demo Address', '9999999999', 'demo@example.com', 30, 100000.00, 0, 'O', '', 1, 0, '2026-01-17 12:59:50', '2026-01-17 12:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `state_master`
--

CREATE TABLE `state_master` (
  `state_code` char(2) NOT NULL,
  `state_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `state_master`
--

INSERT INTO `state_master` (`state_code`, `state_name`) VALUES
('01', 'Jammu & Kashmir'),
('02', 'Himachal Pradesh'),
('03', 'Punjab'),
('04', 'Chandigarh'),
('05', 'Uttarakhand'),
('06', 'Haryana'),
('07', 'Delhi'),
('08', 'Rajasthan'),
('09', 'Uttar Pradesh'),
('10', 'Bihar'),
('11', 'Sikkim'),
('12', 'Arunachal Pradesh'),
('13', 'Nagaland'),
('14', 'Manipur'),
('15', 'Mizoram'),
('16', 'Tripura'),
('17', 'Meghalaya'),
('18', 'Assam'),
('19', 'West Bengal'),
('20', 'Jharkhand'),
('21', 'Odisha'),
('22', 'Chhattisgarh'),
('23', 'Madhya Pradesh'),
('24', 'Gujarat'),
('25', 'Daman & Diu'),
('26', 'Dadra & Nagar Haveli and Daman & Diu'),
('27', 'Maharashtra'),
('28', 'Andhra Pradesh'),
('29', 'Karnataka'),
('30', 'Goa'),
('31', 'Lakshadweep'),
('32', 'Kerala'),
('33', 'Tamil Nadu'),
('34', 'Puducherry'),
('35', 'Andaman & Nicobar Islands'),
('36', 'Telangana'),
('37', 'Andhra Pradesh (New)'),
('38', 'Ladakh'),
('97', 'Other Territory');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coa_accounts`
--
ALTER TABLE `coa_accounts`
  ADD PRIMARY KEY (`tenant_id`,`ledger_code`),
  ADD KEY `idx_coa_type` (`tenant_id`,`ledger_type`);

--
-- Indexes for table `gst_rate_profile`
--
ALTER TABLE `gst_rate_profile`
  ADD PRIMARY KEY (`rate_profile_id`),
  ADD KEY `idx_rate_tenant` (`tenant_id`,`total_rate_percent`);

--
-- Indexes for table `hsn_gst_rate_history`
--
ALTER TABLE `hsn_gst_rate_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `idx_hist_hsn` (`tenant_id`,`hsn_sac_id`,`effective_from`),
  ADD KEY `idx_hist_rate` (`tenant_id`,`rate_profile_id`);

--
-- Indexes for table `hsn_sac_master`
--
ALTER TABLE `hsn_sac_master`
  ADD PRIMARY KEY (`hsn_sac_id`),
  ADD UNIQUE KEY `uq_hsn_code` (`tenant_id`,`hsn_sac_type`,`hsn_sac_code`),
  ADD KEY `idx_hsn_type_code` (`tenant_id`,`hsn_sac_type`,`hsn_sac_code`);

--
-- Indexes for table `item_master`
--
ALTER TABLE `item_master`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `uq_item_code` (`tenant_id`,`item_code`),
  ADD KEY `idx_item_desc` (`tenant_id`,`description`),
  ADD KEY `idx_item_hsn` (`tenant_id`,`hsn_sac_id`);

--
-- Indexes for table `party_master`
--
ALTER TABLE `party_master`
  ADD PRIMARY KEY (`party_id`),
  ADD UNIQUE KEY `uq_party_code` (`tenant_id`,`customer_code`),
  ADD KEY `idx_party_name` (`tenant_id`,`customer_name`),
  ADD KEY `idx_party_state` (`tenant_id`,`state_code`);

--
-- Indexes for table `state_master`
--
ALTER TABLE `state_master`
  ADD PRIMARY KEY (`state_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gst_rate_profile`
--
ALTER TABLE `gst_rate_profile`
  MODIFY `rate_profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hsn_gst_rate_history`
--
ALTER TABLE `hsn_gst_rate_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hsn_sac_master`
--
ALTER TABLE `hsn_sac_master`
  MODIFY `hsn_sac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item_master`
--
ALTER TABLE `item_master`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `party_master`
--
ALTER TABLE `party_master`
  MODIFY `party_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
