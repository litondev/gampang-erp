-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2025 at 10:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Table structure for table `account_balances`
--

CREATE TABLE `account_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `saldo` decimal(20,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(20,2) NOT NULL DEFAULT 0.00,
  `debit` decimal(20,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `parent_id`, `code`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'JBK', 'Jakarta Bogor Karawang', 'Wilayah Untuk Jakarta Bogor Karawang', '2025-08-16 01:48:12', '2025-08-16 01:48:12', NULL),
(2, NULL, 'SSS', 'Sukoharjo Sragen Solo', 'Wilayah Sukoharjo Sragen Solo', '2025-08-16 01:48:12', '2025-08-16 01:48:12', NULL),
(3, NULL, 'SML', 'Surabaya Malang Lampung', 'Wilayah Surabaya Malang Lampung', '2025-08-16 01:48:12', '2025-08-16 01:48:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `area_maps`
--

CREATE TABLE `area_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zoom` int(11) NOT NULL DEFAULT 0,
  `lat` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `lng` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `background_processes`
--

CREATE TABLE `background_processes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `reference` varchar(255) DEFAULT NULL,
  `reference_type` varchar(255) DEFAULT NULL,
  `is_hide` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'PROCESS',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `background_process_infos`
--

CREATE TABLE `background_process_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `background_process_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_mrdfs`
--

CREATE TABLE `batch_mrdfs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_mrd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `formula_material_item_quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `smallest_formula_material_item_quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_mrdf_identities`
--

CREATE TABLE `batch_mrdf_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_mrdf_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_mrdf_pcs`
--

CREATE TABLE `batch_mrdf_pcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_mrdf_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_mrds`
--

CREATE TABLE `batch_mrds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_mr_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_wo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_wod_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_mrd_steps`
--

CREATE TABLE `batch_mrd_steps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_mrd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('JOB','OVERHEAT') NOT NULL DEFAULT 'JOB',
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `due_date_minute` int(11) NOT NULL DEFAULT 0,
  `due_date_hour` int(11) NOT NULL DEFAULT 0,
  `due_date_day` int(11) NOT NULL DEFAULT 0,
  `due_date_month` int(11) NOT NULL DEFAULT 0,
  `due_date_year` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_mrs`
--

CREATE TABLE `batch_mrs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_pndfs`
--

CREATE TABLE `batch_pndfs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_pnd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `formula_material_item_quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `smallest_formula_material_item_quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_pndf_identities`
--

CREATE TABLE `batch_pndf_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_pndf_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_pndf_pcs`
--

CREATE TABLE `batch_pndf_pcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_pndf_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_pnds`
--

CREATE TABLE `batch_pnds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_pn_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_mr_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_mrd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_wo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_wod_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `finish_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_pnd_steps`
--

CREATE TABLE `batch_pnd_steps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_pnd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('JOB','OVERHEAT') NOT NULL DEFAULT 'JOB',
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `due_date_minute` int(11) NOT NULL DEFAULT 0,
  `due_date_hour` int(11) NOT NULL DEFAULT 0,
  `due_date_day` int(11) NOT NULL DEFAULT 0,
  `due_date_month` int(11) NOT NULL DEFAULT 0,
  `due_date_year` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_pns`
--

CREATE TABLE `batch_pns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_stwdfs`
--

CREATE TABLE `batch_stwdfs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_stwd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `smallest_formula_material_item_quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_stwdf_identities`
--

CREATE TABLE `batch_stwdf_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_stwdf_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_stwdf_pcs`
--

CREATE TABLE `batch_stwdf_pcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_stwdf_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_stwds`
--

CREATE TABLE `batch_stwds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_stw_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_pn_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_pnd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_mr_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_mrd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_wo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_wod_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `grandtotal_step` decimal(20,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_stwd_identities`
--

CREATE TABLE `batch_stwd_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_stwd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_stwd_pcs`
--

CREATE TABLE `batch_stwd_pcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_stwd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_stws`
--

CREATE TABLE `batch_stws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `is_include_step_in_cogs` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_wods`
--

CREATE TABLE `batch_wods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_wo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `is_using_tax` tinyint(1) NOT NULL DEFAULT 1,
  `is_free_tax` tinyint(1) NOT NULL DEFAULT 0,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_wos`
--

CREATE TABLE `batch_wos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'PROCESS',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_wo_user_approvals`
--

CREATE TABLE `batch_wo_user_approvals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_wo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_ins`
--

CREATE TABLE `cash_ins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'PENDING',
  `description` text DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_in_details`
--

CREATE TABLE `cash_in_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cash_in_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_mutations`
--

CREATE TABLE `cash_mutations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_mutation_details`
--

CREATE TABLE `cash_mutation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cash_mutation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_to_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_from_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_outs`
--

CREATE TABLE `cash_outs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'PENDING',
  `description` text DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_out_details`
--

CREATE TABLE `cash_out_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cash_out_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `rule_type` varchar(25) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `saldo` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_hide` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `parent_id`, `code`, `name`, `type`, `rule_type`, `description`, `saldo`, `is_hide`, `created_at`, `updated_at`) VALUES
(1, NULL, '1-0000', 'Kas', 'HARTA', NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(2, 1, '1-0001', 'Kas Besar', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(3, 1, '1-0002', 'Kas Kecil', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(4, 1, '1-0003', 'Kas Donasi', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(5, 1, '1-0004', 'Tabungan Karyawan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(6, 1, '1-0005', 'Uang Titipan Pemasok', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(7, NULL, '2-0000', 'Bank', 'Harta', NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(8, 7, '2-0001', 'Bank Bca', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(9, 7, '2-0002', 'Bank Bri', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(10, 7, '2-0003', 'Bank Mandiri', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(11, NULL, '3-0000', 'Persediaan barang', 'HARTA', NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(12, 11, '3-0001', 'Persediaan Barang', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(13, 11, '3-0002', 'Persediaan Barang Belum Dikirim', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(14, NULL, '4-0000', 'Piutang Dagang', 'HARTA', NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(15, 14, '4-0001', 'Piutang Dagang', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(16, 14, '4-0002', 'Piutang Giro / Giro Mundur', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(17, 14, '4-0003', 'Piutang Lain-Lain', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(18, NULL, '5-0000', 'Pph', 'HARTA', NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(19, 18, '5-0001', 'Ppn Masukan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(20, 18, '5-0002', 'PPh Pasal 4 Ayat 2', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(21, 18, '5-0003', 'PPh Pasal 25', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(22, 18, '5-0004', 'PPh Pasal 22', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(23, 18, '5-0005', 'PPh Pasal 23', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(24, 18, '5-0006', 'PPh Pasal 29', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:12', '2025-08-16 01:48:12'),
(25, 18, '5-0007', 'Pajak Dibayar Dimuka', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(26, 18, '5-0008', 'Biaya / Beban Dibayar Dimuka', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(27, 18, '5-0009', 'Penghasilan Yang Masih Harus Diterima', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(28, 18, '5-0010', 'Uang Muka Sewa / Sewa dibayar dimuka', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(29, NULL, '6-0000', 'Asset', 'HARTA', NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(30, 29, '6-0001', 'Gedung', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(31, 29, '6-0002', 'Peralatan dan Perlengkapan Toko', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(32, 29, '6-0003', 'Inventaris Kantor', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(33, 29, '6-0004', 'Kendaraan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(34, 29, '6-0005', 'Tempat Parkir', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(35, 29, '6-0006', 'Akm. Penyusutan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(36, 29, '6-0007', 'Akum. Penyusutan Peralatan Pabrik', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(37, 29, '6-0008', 'Akum. Penyusutan Inventaris Kantor', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(38, 29, '6-0009', 'Akum. Penyusutan Kendaraan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(39, 29, '6-0010', 'Akum. Penyusutan Tempat Parkir', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(40, NULL, '7-0000', 'Hutang', 'KEWAJIBAN', NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(41, 40, '7-0001', 'Hutang Usaha', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(42, 40, '7-0002', 'Hutang PPh Pasal 23', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(43, 40, '7-0003', 'Hutang PPh Pasal 25', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(44, 40, '7-0004', 'Hutang PPh Pasal 4(2)', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(45, 40, '7-0005', 'Hutang PPh Pasal 29', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(46, 40, '7-0006', 'Hutang Kendaraan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(47, 40, '7-0007', 'Hutang Biaya / Beban', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(48, 40, '7-0008', 'Hutang lain-lain', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(49, 40, '7-0009', 'Hutang Karyawan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(50, 40, '7-0010', 'Hutang Pemilik', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(51, 40, '7-0011', 'Hutang Bank', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(52, 40, '7-0012', 'Biaya / Beban Yang Masih Harus Dibayar', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(53, NULL, '8-0000', 'Ppn', 'KEWAJIBAN', NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(54, 53, '8-0001', 'Ppn Keluaran', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(55, NULL, '9-0000', 'Modal', 'MODAL', NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(56, 55, '9-0001', 'Pemilik Modal', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(57, 55, '9-0002', 'Tambahan Modal', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(58, NULL, '10-0000', 'Laba Perbulan', 'MODAL', NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(59, NULL, '11-0000', 'Laba Pertahun', 'MODAL', NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(60, NULL, '12-0000', 'Laba Ditahan', 'MODAL', NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(61, NULL, '13-0000', 'Prive', 'MODAL', NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(62, NULL, '14-0000', 'Pajak Penghasilan', 'MODAL', NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(63, NULL, '15-0000', 'Pendapatan / Penghasilan', 'PENDAPATAN', NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(64, 63, '15-0001', 'Penjualan Barang', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(65, 63, '15-0002', 'Retur Penjualan Barang', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(66, 63, '15-0003', 'Potongan Pembelian', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(67, 63, '15-0004', 'Pengurangan Biaya / Beban Pembelian', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(68, 63, '15-0005', 'Penambahan Biaya / Beban Penjualan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(69, 63, '15-0006', 'Selisih Pembelian', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(70, 63, '15-0007', 'Pembulatan Penjualan Ke Atas', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(71, 63, '15-0008', 'Penghasilan Donasi', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(72, 63, '15-0009', 'Pengalihan Harta', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(73, 63, '15-0010', 'Penghasilan Sewa Tenant', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(74, 63, '15-0011', 'Penghasilan Sewa Gondola', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(75, 63, '15-0012', 'Penghasilan Sewa Billboard', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(76, 63, '15-0013', 'Penghasilan Kerjasama Planogram', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(77, 63, '15-0014', 'Penghasilan Partisipasi', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(78, 63, '15-0015', 'Penghasilan Floordisplay', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(79, 63, '15-0016', 'Bunga Bank/Jasa Giro', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(80, 63, '15-0017', 'Penggantian Klaim Asuransi', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(81, 63, '15-0018', 'Penghasilan Lain-Lain', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(82, 63, '15-0019', 'Debit Note Pembelian', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(83, 63, '15-0020', 'Uang Titipan Pelanggan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(84, NULL, '16-0000', 'Biaya / Beban', 'BIAYA', NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(85, 84, '16-0001', 'Hpp Penjualan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(86, 84, '16-0002', 'Hpp Barang Rusak', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(87, 84, '16-0003', 'Hpp Barang Keluar', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(88, 84, '16-0004', 'Hpp Barang Hilang', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(89, 84, '16-0005', 'Hpp Barang Kadaluarsa', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(90, 84, '16-0006', 'Hpp Barang Sampel', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(91, 84, '16-0007', 'Biaya / Beban Produksi', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(92, 84, '16-0008', 'Beban Pegawai', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(93, 84, '16-0009', 'Beban Asuransi Tenaga Kerja', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(94, 84, '16-0010', 'Perjalanan Dinas', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(95, 84, '16-0011', 'Biaya / Beban Konsultan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(96, 84, '16-0012', 'BBM', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(97, 84, '16-0013', 'Jasa Angkut', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(98, 84, '16-0014', 'Iklan/Promosi', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(99, 84, '16-0015', 'Komisi Penjualan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(100, 84, '16-0016', 'Bongkar Muat', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(101, 84, '16-0017', 'x', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(102, 84, '16-0018', 'Beban Rumah Tangga Perusahaan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(103, 84, '16-0019', 'Beban Telpon dan Internet', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(104, 84, '16-0020', 'Beban Perijinan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(105, 84, '16-0021', 'Beban Iuran dan Sumbangan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(106, 84, '16-0022', 'Beban Perlengkapan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(107, 84, '16-0023', 'Beban Keperluan Toko', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(108, 84, '16-0024', 'Beban Asuransi', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(109, 84, '16-0025', 'Beban Sewa', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(110, 84, '16-0026', 'Beban Perbaikan dan Pemeliharaan Aktiva', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(111, 84, '16-0027', 'Beban Profesional', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(112, 84, '16-0028', 'Beban Pajak', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(113, 84, '16-0029', 'Beban Penyusutan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(114, 84, '16-0030', 'Beban Lain-Lain', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(115, 84, '16-0031', 'Beban Listrik dan Air', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(116, 84, '16-0032', 'Beban Keamanan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(117, 84, '16-0033', 'Biaya / Beban Bunga', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(118, 84, '16-0034', 'Biaya / Beban Bank', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(119, 84, '16-0035', 'Beban PPh Sewa', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(120, 84, '16-0036', 'Beban Bank', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(121, 84, '16-0037', 'Beban Lain-Lain Di luar Usaha', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(122, 84, '16-0038', 'Potongan Penjualan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(123, 84, '16-0039', 'Poin Penjualan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(124, 84, '16-0040', 'Penambahan Biaya / Beban Pembelian', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(125, 84, '16-0041', 'Pengurangan Biaya / Beban Penjualan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(126, 84, '16-0042', 'Selisih Penjualan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(127, 84, '16-0043', 'Pembulatan Penjualan Ke Bawah', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(128, 84, '16-0044', 'Kredit Note Penjualan', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(129, 84, '16-0045', 'Biaya Ongkir', NULL, NULL, NULL, 0.00, 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_account_transactions`
--

CREATE TABLE `chart_of_account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `opsional` tinyint(1) NOT NULL DEFAULT 0,
  `action` varchar(50) NOT NULL DEFAULT 'DEBIT',
  `type` varchar(200) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `group_status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_account_transactions`
--

INSERT INTO `chart_of_account_transactions` (`id`, `chart_of_account_id`, `name`, `title`, `description`, `opsional`, `action`, `type`, `group`, `group_status`, `created_at`, `updated_at`) VALUES
(1, 12, 'total persediaan', 'Total Persediaan', 'Total Detail Pembelian Kecuali Ppn (digunakan jika stok sudah masuk)', 0, 'DEBIT', 'PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(2, 19, 'ppn masukan', 'Ppn Masukan', 'Total Detail Ppn Pembelian', 1, 'DEBIT', 'PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(3, 13, 'persediaan barang belum dikirim', 'Persediaan Barang Belum Dikirim', 'Total Detail Pembelian Dengan Ppn (digunakan jika stok belum masuk)', 0, 'DEBIT', 'PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(4, 124, 'penambahan biaya pembelian', 'Penambahan Biaya Pembelian', 'Total Penambahan Biaya Pembelian', 1, 'DEBIT', 'PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(5, 6, 'uang titipan pemasok uang kembalian', 'Uang Titipan Pemasok Uang Kembalian', 'Total Uang Titipan Pemasok', 0, 'DEBIT', 'PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(6, 3, 'kas', 'Kas', 'Grand Total Atau Yang Harus Dibayar', 0, 'CREDIT', 'PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(7, 41, 'hutang dagang', 'Hutang Dagang', 'Total Hutang Jika Pembayaran Tidak Lunas', 0, 'CREDIT', 'PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(8, 67, 'pengurangan biaya pembelian', 'Pengurangan Biaya Pembelian', 'Total Pengurangan Biaya Pembelian', 1, 'CREDIT', 'PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(9, 66, 'potongan pembelian', 'Potongan Pembelian', 'Potongan Pembelian', 1, 'CREDIT', 'PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(10, 3, 'kas titipan pemasok uang kembalian', 'Kas Titipan Pemasok Uang Kembalian', 'Total Uang Titipan Pelanggan', 0, 'CREDIT', 'PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(11, 41, 'hutang dagang', 'Hutang Dagang', 'Hutang Yang Dilunasi', 0, 'DEBIT', 'PURCHASEING_DEBT', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(12, 6, 'uang titipan pemasok', 'Uang Titipan Pemasok', 'Total Uang Titipan Pemasok', 0, 'DEBIT', 'PURCHASEING_DEBT', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(13, 3, 'kas', 'Kas', 'Pembayaran Hutang', 0, 'CREDIT', 'PURCHASEING_DEBT', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(14, 82, 'debit note pembelian', 'Debit Note Pembelian', 'Total Debit Note Pembelian', 1, 'CREDIT', 'PURCHASEING_DEBT', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(15, 3, 'kas', 'Kas', 'Pembayaran Yang Dikurangi', 0, 'DEBIT', 'PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(16, 41, 'hutang dagang', 'Hutang Dagang', 'Hutang Yang Dikurangi', 0, 'DEBIT', 'PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(17, 69, 'selisih pembelian', 'Selisih Pembelian', 'Jika Pembelian Dan Retur Pembelian Terdapat Selisih Grand Total', 0, 'DEBIT', 'PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(18, 6, 'uang titipan pemasok', 'Uang Titipan Pemasok', 'Total Uang Titipan Pemasok', 0, 'DEBIT', 'PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(19, 12, 'total persediaan', 'Total Persediaan', 'Total Detail Return Pembelian Kecuali Ppn', 0, 'CREDIT', 'PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(20, 19, 'ppn masukan', 'Ppn Masukan', 'Total Detail Ppn Return Pembelian', 1, 'CREDIT', 'PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(21, 87, 'hpp barang keluar', 'Hpp Barang Keluar', 'Total Hpp Item Detail Yang Dikeluarkan', 0, 'DEBIT', 'STOCK_OUT_WITHOUT_PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(22, 86, 'hpp barang rusak', 'Hpp Barang Rusak', 'Total Hpp Item Detail Yang Dikeluarkan (jika rusak)', 0, 'DEBIT', 'STOCK_OUT_WITHOUT_PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(23, 89, 'hpp barang kadaluarsa', 'Hpp Barang Kadaluarsa', 'Total Hpp Item Detail Yang Dikeluarkan (jika kadaluarsa)', 0, 'DEBIT', 'STOCK_OUT_WITHOUT_PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(24, 90, 'hpp barang sampel', 'Hpp Barang Sampel', 'Total Hpp Item Detail Yang Dikeluarkan (jika digunakan untuk sampel)', 0, 'DEBIT', 'STOCK_OUT_WITHOUT_PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(25, 12, 'total persediaan', 'Total Persediaan', 'Total Hpp Item Detail', 0, 'CREDIT', 'STOCK_OUT_WITHOUT_PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(26, 3, 'kas', 'Kas', 'Pembayaran Yang Dikurangi', 0, 'DEBIT', 'STOCK_OUT_WITH_PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(27, 41, 'hutang dagang', 'Hutang Dagang', 'Hutang Yang Dikurangi', 0, 'DEBIT', 'STOCK_OUT_WITH_PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(28, 69, 'selisih pembelian', 'Selisih Pembelian', 'Jika Pembelian Dan Retur Pembelian Terdapat Selisih Grand Total', 0, 'DEBIT', 'STOCK_OUT_WITH_PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(29, 12, 'total persediaan', 'Total Persediaan', 'Total Detail Return Pembelian Kecuali Ppn', 0, 'CREDIT', 'STOCK_OUT_WITH_PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(30, 19, 'ppn masukan', 'Ppn Masukan', 'Total Detail Ppn Return Pembelian', 1, 'CREDIT', 'STOCK_OUT_WITH_PURCHASEING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(31, 12, 'total persediaan', 'Total Persediaan', 'Total Hpp Item Detail', 0, 'DEBIT', 'STOCK_IN_WITHOUT_PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(32, 85, 'hpp penjualan', 'Hpp Penjualan', 'Total Hpp Item Detail', 0, 'CREDIT', 'STOCK_IN_WITHOUT_PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(33, 12, 'total persediaan', 'Total Persediaan', 'Total Detail Pembelian Kecuali Ppn', 0, 'DEBIT', 'STOCK_IN_WITH_PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(34, 19, 'ppn masukan', 'Ppn Masukan', 'Total Detail Ppn Pembelian', 1, 'DEBIT', 'STOCK_IN_WITH_PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(35, 13, 'persediaan barang belum dikirim', 'Persediaan Barang Belum Dikirim', 'Total Detail Pembelian Dengan Ppn', 0, 'CREDIT', 'STOCK_IN_WITH_PURCHASEING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(36, 12, 'total persediaan', 'Total Persediaan', 'Total Hpp Item Detail', 0, 'DEBIT', 'STOCK_OPNAME_PLUS', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(37, 85, 'hpp penjualan', 'Hpp Penjualan', 'Total Hpp Item Detail', 0, 'CREDIT', 'STOCK_OPNAME_PLUS', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(38, 56, 'modal', 'Modal', 'Total Hpp Item Detail', 0, 'CREDIT', 'STOCK_OPNAME_PLUS', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(39, 87, 'hpp barang keluar', 'Hpp Barang Keluar', 'Total Hpp Item Detail', 0, 'DEBIT', 'STOCK_OPNAME_MINUS', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(40, 88, 'hpp barang hilang', 'Hpp Barang Hilang', 'Total Hpp Item Detail(jika hilang)', 0, 'DEBIT', 'STOCK_OPNAME_MINUS', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(41, 12, 'total persediaan', 'Total Persediaan', 'Total Hpp Item Detail', 0, 'CREDIT', 'STOCK_OPNAME_MINUS', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(42, 3, 'kas', 'Kas', 'Grand Total Atau Yang Harus Dibayar', 0, 'DEBIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(43, 15, 'piutang penjualan', 'Piutang Penjualan', 'Total Piutang Jika Pembayaran Tidak Lunas', 0, 'DEBIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(44, 122, 'potongan penjualan', 'Potongan Penjualan', 'Potongan Penjualan', 1, 'DEBIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(45, 125, 'pengurangan biaya penjualan', 'Pengurangan Biaya Penjualan', 'Total Pengurangan Biaya Penjualan', 1, 'DEBIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(46, 85, 'hpp penjualan', 'Hpp Penjualan', 'Total Hpp Item Detail', 0, 'DEBIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(47, 4, 'kas donasi', 'Kas Donasi', 'Kas Donasi', 1, 'DEBIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(48, 127, 'pembulatan penjualan ke bawah', 'Pembulatan Penjualan Ke Bawah', 'Pembulatan Penjualan Ke Bawah', 1, 'DEBIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(49, 123, 'poin penjualan', 'Poin Penjualan', 'Poin Penjualan', 1, 'DEBIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(50, 3, 'kas titipan pelanggan uang kembalian', 'Kas Titipan Pelanggan Uang Kembalian', 'Total Uang Titipan Pelanggan', 0, 'DEBIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(51, 85, 'hpp item gratis', 'Hpp Item Gratis', 'Total Hpp Item Gartis', 0, 'DEBIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(52, 64, 'penjualan', 'Penjualan', 'Total Detail Penjualan Kecuali Ppn', 0, 'CREDIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(53, 54, 'ppn keluaran', 'Ppn Keluaran', 'Total Detail Ppn Penjualan', 1, 'CREDIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(54, 68, 'penambahan biaya penjualan', 'Penambahan Biaya Penjualan', 'Total Penambahan Biaya Penjualan', 1, 'CREDIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(55, 12, 'total persediaan', 'Total Persediaan', 'Total Hpp Item Detail', 0, 'CREDIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(56, 71, 'pendapatan donasi', 'Pendapatan Donasi', 'Pendapatan Donasi', 1, 'CREDIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(57, 70, 'pembulatan penjualan ke atas', 'Pembulatan Penjualan Ke Atas', 'Pembulatan Penjualan Ke Atas', 1, 'CREDIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(58, 83, 'uang titipan pelanggan uang kembalian', 'Uang Titipan Pelanggan Uang Kembalian', 'Total Uang Titipan Pelanggan', 0, 'CREDIT', 'SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(59, 3, 'kas', 'Kas', 'Pembayaran Piutang', 0, 'DEBIT', 'SELLING_RECEIVABLE', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(60, 123, 'poin penjualan', 'Poin Penjualan', 'Poin Penjualan', 1, 'DEBIT', 'SELLING_RECEIVABLE', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(61, 128, 'credit note penjualan', 'Kredit Note Penjualan', 'Total Kredit Note Penjualan', 1, 'DEBIT', 'SELLING_RECEIVABLE', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(62, 15, 'piutang penjualan', 'Piutang Penjualan', 'Piutang Yang Dilunasi', 0, 'CREDIT', 'SELLING_RECEIVABLE', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(63, 83, 'uang titipan pelanggan', 'Uang Titipan Pelanggan', 'Total Uang Titipan Pelanggan', 0, 'CREDIT', 'SELLING_RECEIVABLE', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(64, 65, 'penjualan', 'Penjualan', 'Total Detail Penjualan Kecuali Ppn', 0, 'DEBIT', 'SELLING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(65, 54, 'ppn keluaran', 'Ppn Keluaran', 'Total Detail Ppn Penjualan', 1, 'DEBIT', 'SELLING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(66, 12, 'total persediaan', 'Total Persediaan', 'Total Hpp Item Detail', 0, 'DEBIT', 'SELLING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(67, 3, 'kas', 'Kas', 'Pembayaran Yang Dikurangi', 0, 'CREDIT', 'SELLING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(68, 15, 'piutang penjualan', 'Piutang Penjualan', 'Piutang Yang Dikurangi', 0, 'CREDIT', 'SELLING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(69, 126, 'selisih penjualan', 'Selisih Penjualan', 'Jika Penjualan Dan Retur Penjualan Terdapat Selisih Grand Total', 1, 'CREDIT', 'SELLING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(70, 85, 'hpp penjualan', 'Hpp Penjualan', 'Total Hpp Item Detail', 0, 'CREDIT', 'SELLING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(71, 83, 'uang titipan pelanggan', 'Uang Titipan Pelanggan', 'Total Uang Titipan Pelanggan', 0, 'CREDIT', 'SELLING_RETURN', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(72, 99, 'komisi sales', 'Komisi Sales', 'Komisi Sales', 0, 'DEBIT', 'COMMISSION_SAlES_TRANSFER', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(73, 3, 'kas', 'Kas', 'Pembayaran Komisi', 0, 'CREDIT', 'COMMISSION_SAlES_TRANSFER', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(74, 91, 'biaya produksi', 'Biaya Produksi', 'Biaya Produksi', 0, 'DEBIT', 'PRODUCTION_COST', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(75, 12, 'total persediaan', 'Total Persediaan', 'Total Hpp Item Detail', 0, 'DEBIT', 'PRODUCTION_COST', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(76, 3, 'kas', 'Kas', 'Total Biaya Produksi', 0, 'CREDIT', 'PRODUCTION_COST', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(77, 12, 'total persediaan', 'Total Persediaan', 'Total Hpp Item Detail', 0, 'CREDIT', 'PRODUCTION_COST', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(78, 5, 'tabungan karyawan', 'Tabungan / Saldo Karyawan', 'Tabungan / Saldo Karyawan', 0, 'DEBIT', 'EMPLOYE_SALDO', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(79, 3, 'kas', 'Kas', 'Tabungan / Saldo Karyawan', 0, 'DEBIT', 'EMPLOYE_SALDO', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(80, 3, 'kas', 'Kas', 'Tabungan / Saldo Karyawan', 0, 'CREDIT', 'EMPLOYE_SALDO', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(81, 5, 'tabungan karyawan', 'Tabungan / Saldo Karyawan', 'Tabungan / Saldo Karyawan', 0, 'CREDIT', 'EMPLOYE_SALDO', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(82, 83, 'uang titipan pelanggan', 'Uang Titipan Pelanggan', 'Total Uang Titipan Pelanggan', 0, 'DEBIT', 'CUSTOMER_RECEIVABLE_SALDO', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(83, 3, 'kas', 'Kas', 'Total Uang Titipan Pelanggan', 0, 'DEBIT', 'CUSTOMER_RECEIVABLE_SALDO', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(84, 3, 'kas', 'Kas', 'Total Uang Titipan Pelanggan', 0, 'CREDIT', 'CUSTOMER_RECEIVABLE_SALDO', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(85, 83, 'uang titipan pelanggan', 'Uang Titipan Pelanggan', 'Total Uang Titipan Pelanggan', 0, 'CREDIT', 'CUSTOMER_RECEIVABLE_SALDO', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(86, 6, 'uang titipan pemasok', 'Uang Titipan Pemasok', 'Total Uang Titipan Pemasok', 0, 'DEBIT', 'SUPPLIER_DEBT_SALDO', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(87, 3, 'kas', 'Kas', 'Total Uang Titipan Pelanggan', 0, 'DEBIT', 'SUPPLIER_DEBT_SALDO', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(88, 3, 'kas', 'Kas', 'Total Uang Titipan Pelanggan', 0, 'CREDIT', 'SUPPLIER_DEBT_SALDO', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(89, 6, 'uang titipan pemasok', 'Uang Titipan Pemasok', 'Total Uang Titipan Pemasok', 0, 'CREDIT', 'SUPPLIER_DEBT_SALDO', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(90, 3, 'kas', 'Kas', 'Total Ongkir', 0, 'DEBIT', 'CORRECTION_PAYMENT_SHIPPING_COST_SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(91, 129, 'biaya ongkir', 'Biaya Ongkir', 'Total Ongkir', 0, 'DEBIT', 'CORRECTION_PAYMENT_SHIPPING_COST_SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(92, 3, 'kas', 'Kas', 'Total Ongkir', 0, 'CREDIT', 'CORRECTION_PAYMENT_SHIPPING_COST_SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(93, 129, 'biaya ongkir', 'Biaya Ongkir', 'Total Ongkir', 0, 'CREDIT', 'CORRECTION_PAYMENT_SHIPPING_COST_SELLING', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(94, 3, 'kas', 'Kas', 'Total Uang Titipan Pelanggan', 0, 'DEBIT', 'PO_CUSTOMER', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(95, 83, 'uang titipan pelanggan', 'Uang Titipan Pelanggan', 'Total Uang Titipan Pelanggan', 0, 'CREDIT', 'PO_CUSTOMER', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(96, 6, 'uang titipan pemasok', 'Uang Titipan Pemasok', 'Total Uang Titipan Pemasok', 0, 'DEBIT', 'PO_SUPPLIER', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(97, 3, 'kas', 'Kas', 'Total Uang Titipan Pelanggan', 0, 'CREDIT', 'PO_SUPPLIER', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `province_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `is_city` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `province_id`, `name`, `is_city`, `created_at`, `updated_at`) VALUES
(1, 1, 'Surabaya', 1, NULL, NULL),
(2, 1, 'Jember', 0, NULL, NULL),
(3, 1, 'Malang', 0, NULL, NULL),
(4, 1, 'Lamongan', 0, NULL, NULL),
(5, 1, 'Bojonegoro', 0, NULL, NULL),
(6, 1, 'Sidoarjo', 0, NULL, NULL),
(7, 1, 'Kediri', 0, NULL, NULL),
(8, 1, 'Banyuwangi', 0, NULL, NULL),
(9, 1, 'Pasuruan', 0, NULL, NULL),
(10, 1, 'Probolinggo', 0, NULL, NULL),
(11, 1, 'Sumenep', 0, NULL, NULL),
(12, 1, 'Gresik', 0, NULL, NULL),
(13, 1, 'Bangkalan', 0, NULL, NULL),
(14, 1, 'Tuban', 0, NULL, NULL),
(15, 1, 'Blitar', 0, NULL, NULL),
(16, 1, 'Nganjuk', 0, NULL, NULL),
(17, 1, 'Sampang', 0, NULL, NULL),
(18, 1, 'Jombang', 0, NULL, NULL),
(19, 1, 'Bondowoso', 0, NULL, NULL),
(20, 1, 'Pamekasan', 0, NULL, NULL),
(21, 1, 'Tulungagung', 0, NULL, NULL),
(22, 1, 'Lumajang', 0, NULL, NULL),
(23, 1, 'Mojokerto', 0, NULL, NULL),
(24, 1, 'Ngawi', 0, NULL, NULL),
(25, 1, 'Ponorogo', 0, NULL, NULL),
(26, 1, 'Pacitan', 0, NULL, NULL),
(27, 1, 'Situbondo', 0, NULL, NULL),
(28, 1, 'Magetan', 0, NULL, NULL),
(29, 1, 'Trenggalek', 0, NULL, NULL),
(30, 1, 'Madiun', 0, NULL, NULL),
(31, 1, 'Malang', 1, NULL, NULL),
(32, 1, 'Kediri', 1, NULL, NULL),
(33, 1, 'Probolinggo', 1, NULL, NULL),
(34, 1, 'Pasuruan', 1, NULL, NULL),
(35, 1, 'Batu', 1, NULL, NULL),
(36, 1, 'Madiun', 1, NULL, NULL),
(37, 1, 'Blitar', 1, NULL, NULL),
(38, 1, 'Mojokerto', 1, NULL, NULL),
(39, 2, 'Bogor', 0, NULL, NULL),
(40, 2, 'Garut', 0, NULL, NULL),
(41, 2, 'Sukabumi', 0, NULL, NULL),
(42, 2, 'Bandung', 0, NULL, NULL),
(43, 2, 'Cianjur', 0, NULL, NULL),
(44, 2, 'Tasikmalaya', 0, NULL, NULL),
(45, 2, 'Bekasi', 0, NULL, NULL),
(46, 2, 'Karawang', 0, NULL, NULL),
(47, 2, 'Bekasi', 1, NULL, NULL),
(48, 2, 'Subang', 0, NULL, NULL),
(49, 2, 'Bandung', 1, NULL, NULL),
(50, 2, 'Indramayu', 0, NULL, NULL),
(51, 2, 'Cirebon', 0, NULL, NULL),
(52, 2, 'Bandung Barat', 0, NULL, NULL),
(53, 2, 'Depok', 1, NULL, NULL),
(54, 2, 'Ciamis', 0, NULL, NULL),
(55, 2, 'Sumedang', 0, NULL, NULL),
(56, 2, 'Kuningan', 0, NULL, NULL),
(57, 2, 'Majalengka', 0, NULL, NULL),
(58, 2, 'Purwakarta', 0, NULL, NULL),
(59, 2, 'Bogor', 1, NULL, NULL),
(60, 2, 'Tasikmalaya', 1, NULL, NULL),
(61, 2, 'Pangandaran', 0, NULL, NULL),
(62, 2, 'Cimahi', 1, NULL, NULL),
(63, 2, 'Cirebon', 1, NULL, NULL),
(64, 2, 'Sukabumi', 1, NULL, NULL),
(65, 2, 'Banjar', 1, NULL, NULL),
(66, 3, 'Cilacap', 0, NULL, NULL),
(67, 3, 'Banyumas', 0, NULL, NULL),
(68, 3, 'Grobogan', 0, NULL, NULL),
(69, 3, 'Brebes', 0, NULL, NULL),
(70, 3, 'Semarang', 1, NULL, NULL),
(71, 3, 'Kebumen', 0, NULL, NULL),
(72, 3, 'Klaten', 0, NULL, NULL),
(73, 3, 'Wonogiri', 0, NULL, NULL),
(74, 3, 'Pati', 0, NULL, NULL),
(75, 3, 'Pemalang', 0, NULL, NULL),
(76, 3, 'Jepara', 0, NULL, NULL),
(77, 3, 'Tegal', 0, NULL, NULL),
(78, 3, 'Magelang', 0, NULL, NULL),
(79, 3, 'Sragen', 0, NULL, NULL),
(80, 3, 'Demak', 0, NULL, NULL),
(81, 3, 'Kendal', 0, NULL, NULL),
(82, 3, 'Boyolali', 0, NULL, NULL),
(83, 3, 'Blora', 0, NULL, NULL),
(84, 3, 'Karanganyar', 0, NULL, NULL),
(85, 3, 'Purworejo', 0, NULL, NULL),
(86, 3, 'Banjarnegara', 0, NULL, NULL),
(87, 3, 'Semarang', 0, NULL, NULL),
(88, 3, 'Pekalongan', 0, NULL, NULL),
(89, 3, 'Rembang', 0, NULL, NULL),
(90, 3, 'Wonosobo', 0, NULL, NULL),
(91, 3, 'Purbalingga', 0, NULL, NULL),
(92, 3, 'Sukoharjo', 0, NULL, NULL),
(93, 3, 'Batang', 0, NULL, NULL),
(94, 3, 'Temanggung', 0, NULL, NULL),
(95, 3, 'Kudus', 0, NULL, NULL),
(96, 3, 'Surakarta', 1, NULL, NULL),
(97, 3, 'Pekalongan', 1, NULL, NULL),
(98, 3, 'Tegal', 1, NULL, NULL),
(99, 3, 'Salatiga', 1, NULL, NULL),
(100, 3, 'Magelang', 1, NULL, NULL),
(101, 4, 'Deli Serdang', 0, NULL, NULL),
(102, 4, 'Medan', 1, NULL, NULL),
(103, 4, 'Langkat', 0, NULL, NULL),
(104, 4, 'Simalungun', 0, NULL, NULL),
(105, 4, 'Serdang Bedagai', 0, NULL, NULL),
(106, 4, 'Asahan', 0, NULL, NULL),
(107, 4, 'Nias Selatan', 0, NULL, NULL),
(108, 4, 'Mandailing Natal', 0, NULL, NULL),
(109, 4, 'Tapanuli Utara', 0, NULL, NULL),
(110, 4, 'Labuhan Batu', 0, NULL, NULL),
(111, 4, 'Batubara', 0, NULL, NULL),
(112, 4, 'Tapanuli Tengah', 0, NULL, NULL),
(113, 4, 'Karo', 0, NULL, NULL),
(114, 4, 'Labuhan Batu Utara', 0, NULL, NULL),
(115, 4, 'Dairi', 0, NULL, NULL),
(116, 4, 'Tapanuli Selatan', 0, NULL, NULL),
(117, 4, 'Humbang Hasudutan', 0, NULL, NULL),
(118, 4, 'Toba Samosir', 0, NULL, NULL),
(119, 4, 'Padang Lawas', 0, NULL, NULL),
(120, 4, 'Labuhan Batu Selatan', 0, NULL, NULL),
(121, 4, 'Nias Utara', 0, NULL, NULL),
(122, 4, 'Pematangsiantar', 1, NULL, NULL),
(123, 4, 'Padang Lawas utara', 0, NULL, NULL),
(124, 4, 'Binjai', 1, NULL, NULL),
(125, 4, 'Samosir', 0, NULL, NULL),
(126, 4, 'Nias', 0, NULL, NULL),
(127, 4, 'Nias Barat', 0, NULL, NULL),
(128, 4, 'Tebing Tinggi', 1, NULL, NULL),
(129, 4, 'Padang Sidimpuan', 1, NULL, NULL),
(130, 4, 'Gunungsitoli', 1, NULL, NULL),
(131, 4, 'Tanjung Balai', 1, NULL, NULL),
(132, 4, 'Pakpak Bharat', 0, NULL, NULL),
(133, 4, 'Sibolga', 1, NULL, NULL),
(134, 5, 'Makassar', 1, NULL, NULL),
(135, 5, 'Bone', 0, NULL, NULL),
(136, 5, 'Gowa', 0, NULL, NULL),
(137, 5, 'Wajo', 0, NULL, NULL),
(138, 5, 'Bulukumba', 0, NULL, NULL),
(139, 5, 'Jeneponto', 0, NULL, NULL),
(140, 5, 'Pangkajene Kepulauan', 0, NULL, NULL),
(141, 5, 'Luwu', 0, NULL, NULL),
(142, 5, 'Pinrang', 0, NULL, NULL),
(143, 5, 'Sinjai', 0, NULL, NULL),
(144, 5, 'Maros', 0, NULL, NULL),
(145, 5, 'Sidenreng Rappang', 0, NULL, NULL),
(146, 5, 'Tana Toraja', 0, NULL, NULL),
(147, 5, 'Takalar', 0, NULL, NULL),
(148, 5, 'Luwu Utara', 0, NULL, NULL),
(149, 5, 'Enrekang', 0, NULL, NULL),
(150, 5, 'Toraja Utara', 0, NULL, NULL),
(151, 5, 'Barru', 0, NULL, NULL),
(152, 5, 'Soppeng', 0, NULL, NULL),
(153, 5, 'Luwu Timur', 0, NULL, NULL),
(154, 5, 'Kepulauan Selayar', 0, NULL, NULL),
(155, 5, 'Bantaeng', 0, NULL, NULL),
(156, 5, 'Palopo', 1, NULL, NULL),
(157, 5, 'Parepare', 1, NULL, NULL),
(158, 6, 'Tangerang', 0, NULL, NULL),
(159, 6, 'Serang', 0, NULL, NULL),
(160, 6, 'Pandeglang', 0, NULL, NULL),
(161, 6, 'Lebak', 0, NULL, NULL),
(162, 6, 'Tangerang', 1, NULL, NULL),
(163, 6, 'Tangerang Selatan', 1, NULL, NULL),
(164, 6, 'Serang', 1, NULL, NULL),
(165, 6, 'Cilegon', 1, NULL, NULL),
(166, 7, 'Timor Tengah Selatan', 0, NULL, NULL),
(167, 7, 'Kupang', 0, NULL, NULL),
(168, 7, 'Sikka', 0, NULL, NULL),
(169, 7, 'Ende', 0, NULL, NULL),
(170, 7, 'Alor', 0, NULL, NULL),
(171, 7, 'Timor Tengah Utara', 0, NULL, NULL),
(172, 7, 'Flores Timur', 0, NULL, NULL),
(173, 7, 'Sumba Barat Daya', 0, NULL, NULL),
(174, 7, 'Manggarai Timur', 0, NULL, NULL),
(175, 7, 'Manggarai', 0, NULL, NULL),
(176, 7, 'Kupang', 1, NULL, NULL),
(177, 7, 'Manggarai Barat', 0, NULL, NULL),
(178, 7, 'Sumba Timur', 0, NULL, NULL),
(179, 7, 'Malaka', 0, NULL, NULL),
(180, 7, 'Belu', 0, NULL, NULL),
(181, 7, 'Ngada', 0, NULL, NULL),
(182, 7, 'Nagakeo', 0, NULL, NULL),
(183, 7, 'Lembata', 0, NULL, NULL),
(184, 7, 'Rote-Ndao', 0, NULL, NULL),
(185, 7, 'Sumba Barat', 0, NULL, NULL),
(186, 7, 'Sabu Raijua', 0, NULL, NULL),
(187, 7, 'Sumba Tengah', 0, NULL, NULL),
(188, 8, 'Lampung Tengah', 0, NULL, NULL),
(189, 8, 'Lampung Timur', 0, NULL, NULL),
(190, 8, 'Lampung Selatan', 0, NULL, NULL),
(191, 8, 'Bandar Lampung', 1, NULL, NULL),
(192, 8, 'Lampung Utara', 0, NULL, NULL),
(193, 8, 'Tanggamus', 0, NULL, NULL),
(194, 8, 'Way Kanan', 0, NULL, NULL),
(195, 8, 'Pesawaran', 0, NULL, NULL),
(196, 8, 'Tulang Bawang', 0, NULL, NULL),
(197, 8, 'Pringsewu', 0, NULL, NULL),
(198, 8, 'Lampung Barat', 0, NULL, NULL),
(199, 8, 'Tulang Bawang Barat', 0, NULL, NULL),
(200, 8, 'Mesuji', 0, NULL, NULL),
(201, 8, 'Pesisir Barat', 0, NULL, NULL),
(202, 8, 'Metro', 1, NULL, NULL),
(203, 9, 'Palembang', 1, NULL, NULL),
(204, 9, 'Banyuasin', 0, NULL, NULL),
(205, 9, 'Ogan Komering Ilir', 0, NULL, NULL),
(206, 9, 'Musi Banyuasin', 0, NULL, NULL),
(207, 9, 'Ogan Komering Ulu Timur', 0, NULL, NULL),
(208, 9, 'Muara Enim', 0, NULL, NULL),
(209, 9, 'Lahat', 0, NULL, NULL),
(210, 9, 'Ogan Ilir', 0, NULL, NULL),
(211, 9, 'Musi Rawas', 0, NULL, NULL),
(212, 9, 'Ogan Komering Ulu Selatan', 0, NULL, NULL),
(213, 9, 'Ogan Komering Ulu', 0, NULL, NULL),
(214, 9, 'Empat Lawang', 0, NULL, NULL),
(215, 9, 'Musi Rawas Utara', 0, NULL, NULL),
(216, 9, 'Penukal Abab Lematang Ilir', 0, NULL, NULL),
(217, 9, 'Lubuk Linggau', 1, NULL, NULL),
(218, 9, 'Prabumulih', 1, NULL, NULL),
(219, 9, 'Pagar Alam', 1, NULL, NULL),
(220, 10, 'Padang', 1, NULL, NULL),
(221, 10, 'Pesisir Selatan', 0, NULL, NULL),
(222, 10, 'Padang Pariaman', 0, NULL, NULL),
(223, 10, 'Agam', 0, NULL, NULL),
(224, 10, 'Solok', 0, NULL, NULL),
(225, 10, 'Tanah Datar', 0, NULL, NULL),
(226, 10, 'Sijunjung', 0, NULL, NULL),
(227, 10, 'Lima Puluh Koto', 0, NULL, NULL),
(228, 10, 'Pasaman Barat', 0, NULL, NULL),
(229, 10, 'Pasaman', 0, NULL, NULL),
(230, 10, 'Dharmasraya', 0, NULL, NULL),
(231, 10, 'Solok Selatan', 0, NULL, NULL),
(232, 10, 'Kepulauan Mentawai', 0, NULL, NULL),
(233, 10, 'Payakumbuh', 1, NULL, NULL),
(234, 10, 'Bukittinggi', 1, NULL, NULL),
(235, 10, 'Pariaman', 1, NULL, NULL),
(236, 10, 'Sawah Lunto', 1, NULL, NULL),
(237, 10, 'Padang Panjang', 1, NULL, NULL),
(238, 10, 'Solok', 1, NULL, NULL),
(239, 11, 'Aceh Utara', 0, NULL, NULL),
(240, 11, 'Bireuen', 0, NULL, NULL),
(241, 11, 'Aceh Timur', 0, NULL, NULL),
(242, 11, 'Aceh Besar', 0, NULL, NULL),
(243, 11, 'Aceh Selatan', 0, NULL, NULL),
(244, 11, 'Pidie', 0, NULL, NULL),
(245, 11, 'Aceh Tenggara', 0, NULL, NULL),
(246, 11, 'Aceh Tengah', 0, NULL, NULL),
(247, 11, 'Aceh Barat', 0, NULL, NULL),
(248, 11, 'Aceh Tamiang', 0, NULL, NULL),
(249, 11, 'Bener Meriah', 0, NULL, NULL),
(250, 11, 'Aceh Jaya', 0, NULL, NULL),
(251, 11, 'Nagan Raya', 0, NULL, NULL),
(252, 11, 'Banda Aceh', 1, NULL, NULL),
(253, 11, 'Aceh Singkil', 0, NULL, NULL),
(254, 11, 'Simeulue', 0, NULL, NULL),
(255, 11, 'Aceh Barat Daya', 0, NULL, NULL),
(256, 11, 'Pidie Jaya', 0, NULL, NULL),
(257, 11, 'Lhokseumawe', 1, NULL, NULL),
(258, 11, 'Subulussalam', 1, NULL, NULL),
(259, 11, 'Langsa', 1, NULL, NULL),
(260, 11, 'Gayo Lues', 0, NULL, NULL),
(261, 11, 'Sabang', 1, NULL, NULL),
(262, 12, 'Kampar', 0, NULL, NULL),
(263, 12, 'Pekanbaru', 1, NULL, NULL),
(264, 12, 'Rokan Hulu', 0, NULL, NULL),
(265, 12, 'Indragiri Hilir', 0, NULL, NULL),
(266, 12, 'Rokan Hilir', 0, NULL, NULL),
(267, 12, 'Bengkalis', 0, NULL, NULL),
(268, 12, 'Siak', 0, NULL, NULL),
(269, 12, 'Kuantan Singingi', 0, NULL, NULL),
(270, 12, 'Indragiri Hulu', 0, NULL, NULL),
(271, 12, 'Pelalawan', 0, NULL, NULL),
(272, 12, 'Kepulauan Meranti', 0, NULL, NULL),
(273, 12, 'Dumai', 1, NULL, NULL),
(274, 13, 'Lombok Timur', 0, NULL, NULL),
(275, 13, 'Lombok Tengah', 0, NULL, NULL),
(276, 13, 'Bima', 0, NULL, NULL),
(277, 13, 'Sumbawa', 0, NULL, NULL),
(278, 13, 'Lombok Barat', 0, NULL, NULL),
(279, 13, 'Dompu', 0, NULL, NULL),
(280, 13, 'Mataram', 1, NULL, NULL),
(281, 13, 'Lombok Utara', 0, NULL, NULL),
(282, 13, 'Bima', 1, NULL, NULL),
(283, 13, 'Sumbawa Barat', 0, NULL, NULL),
(284, 14, 'Ketapang', 0, NULL, NULL),
(285, 14, 'Sambas', 0, NULL, NULL),
(286, 14, 'Kuburaya', 0, NULL, NULL),
(287, 14, 'Sanggau', 0, NULL, NULL),
(288, 14, 'Landak', 0, NULL, NULL),
(289, 14, 'Sintang', 0, NULL, NULL),
(290, 14, 'Kapuas Hulu', 0, NULL, NULL),
(291, 14, 'Pontianak', 1, NULL, NULL),
(292, 14, 'Bengkayang', 0, NULL, NULL),
(293, 14, 'Melawi', 0, NULL, NULL),
(294, 14, 'Sekadau', 0, NULL, NULL),
(295, 14, 'Mempawah', 0, NULL, NULL),
(296, 14, 'Singkawang', 1, NULL, NULL),
(297, 14, 'Kayong Utara', 0, NULL, NULL),
(298, 15, 'Jakarta Timur', 1, NULL, NULL),
(299, 15, 'Jakarta Barat', 1, NULL, NULL),
(300, 15, 'Jakarta Selatan', 1, NULL, NULL),
(301, 15, 'Jakarta Utara', 1, NULL, NULL),
(302, 15, 'Jakarta Pusat', 1, NULL, NULL),
(303, 15, 'Kepulauan Seribu', 0, NULL, NULL),
(304, 16, 'Banjar', 0, NULL, NULL),
(305, 16, 'Banjarmasin', 1, NULL, NULL),
(306, 16, 'Barito Kuala', 0, NULL, NULL),
(307, 16, 'Kotabaru', 0, NULL, NULL),
(308, 16, 'Tanah Laut', 0, NULL, NULL),
(309, 16, 'Hulu Sungai Selatan', 0, NULL, NULL),
(310, 16, 'Tabalong', 0, NULL, NULL),
(311, 16, 'Hulu Sungai Tengah', 0, NULL, NULL),
(312, 16, 'Tanah Bumbu', 0, NULL, NULL),
(313, 16, 'Hulu Sungai Utara', 0, NULL, NULL),
(314, 16, 'Banjarbaru', 1, NULL, NULL),
(315, 16, 'Balangan', 0, NULL, NULL),
(316, 16, 'Tapin', 0, NULL, NULL),
(317, 17, 'Bantul', 0, NULL, NULL),
(318, 17, 'Gunung Kidul', 0, NULL, NULL),
(319, 17, 'Sleman', 0, NULL, NULL),
(320, 17, 'Kulon Progo', 0, NULL, NULL),
(321, 17, 'Yogyakarta', 1, NULL, NULL),
(322, 18, 'Parigi Moutong', 0, NULL, NULL),
(323, 18, 'Banggai', 0, NULL, NULL),
(324, 18, 'Donggala', 0, NULL, NULL),
(325, 18, 'Sigi', 0, NULL, NULL),
(326, 18, 'Poso', 0, NULL, NULL),
(327, 18, 'Palu', 1, NULL, NULL),
(328, 18, 'Tolitoli', 0, NULL, NULL),
(329, 18, 'Tojo Una-Una', 0, NULL, NULL),
(330, 18, 'Morowali', 0, NULL, NULL),
(331, 18, 'Morowali Utara', 0, NULL, NULL),
(332, 18, 'Banggai Kepulauan', 0, NULL, NULL),
(333, 18, 'Buol', 0, NULL, NULL),
(334, 18, 'Banggai Laut', 0, NULL, NULL),
(335, 19, 'Sarolangun', 0, NULL, NULL),
(336, 19, 'Merangin', 0, NULL, NULL),
(337, 19, 'Jambi', 1, NULL, NULL),
(338, 19, 'Kerinci', 0, NULL, NULL),
(339, 19, 'Muaro Jambi', 0, NULL, NULL),
(340, 19, 'Batang Hari', 0, NULL, NULL),
(341, 19, 'Bungo', 0, NULL, NULL),
(342, 19, 'Tebo', 0, NULL, NULL),
(343, 19, 'Tanjung Jabung Barat', 0, NULL, NULL),
(344, 19, 'Tanjung Jabung Timur', 0, NULL, NULL),
(345, 19, 'Sungai Penuh', 1, NULL, NULL),
(346, 20, 'Kapuas', 0, NULL, NULL),
(347, 20, 'Kotawaringin Timur', 0, NULL, NULL),
(348, 20, 'Murung Raya', 0, NULL, NULL),
(349, 20, 'Katingan', 0, NULL, NULL),
(350, 20, 'Barito Utara', 0, NULL, NULL),
(351, 20, 'Kotawaringin Barat', 0, NULL, NULL),
(352, 20, 'Barito Timur', 0, NULL, NULL),
(353, 20, 'Pulang Pisau', 0, NULL, NULL),
(354, 20, 'Palangka Raya', 1, NULL, NULL),
(355, 20, 'Gunung Mas', 0, NULL, NULL),
(356, 20, 'Seruyan', 0, NULL, NULL),
(357, 20, 'Barito Selatan', 0, NULL, NULL),
(358, 20, 'Lamandau', 0, NULL, NULL),
(359, 20, 'Sukamara', 0, NULL, NULL),
(360, 21, 'Konawe Selatan', 0, NULL, NULL),
(361, 21, 'Konawe', 0, NULL, NULL),
(362, 21, 'Muna', 0, NULL, NULL),
(363, 21, 'Bombana', 0, NULL, NULL),
(364, 21, 'Kolaka', 0, NULL, NULL),
(365, 21, 'Kendari', 1, NULL, NULL),
(366, 21, 'Kolaka Timur', 0, NULL, NULL),
(367, 21, 'Buton', 0, NULL, NULL),
(368, 21, 'Wakatobi', 0, NULL, NULL),
(369, 21, 'Kolaka Utara', 0, NULL, NULL),
(370, 21, 'Konawe Utara', 0, NULL, NULL),
(371, 21, 'Muna Barat', 0, NULL, NULL),
(372, 21, 'Buton Tengah', 0, NULL, NULL),
(373, 21, 'Buton Utara', 0, NULL, NULL),
(374, 21, 'Baubau', 1, NULL, NULL),
(375, 21, 'Buton Selatan', 0, NULL, NULL),
(376, 21, 'Konawe Kepulauan', 0, NULL, NULL),
(377, 22, 'Minahasa', 0, NULL, NULL),
(378, 22, 'Manado', 1, NULL, NULL),
(379, 22, 'Bolaang Mongondow', 0, NULL, NULL),
(380, 22, 'Minahasa Selatan', 0, NULL, NULL),
(381, 22, 'Minahasa Utara', 0, NULL, NULL),
(382, 22, 'Kep. Sangihe', 0, NULL, NULL),
(383, 22, 'Kepulauan Talaud', 0, NULL, NULL),
(384, 22, 'Minahasa Tenggara', 0, NULL, NULL),
(385, 22, 'Bitung', 1, NULL, NULL),
(386, 22, 'Bolaang Mongondow Utara', 0, NULL, NULL),
(387, 22, 'Kepulauan Siau Tagulandang Biaro', 0, NULL, NULL),
(388, 22, 'Bolaang Mongondow Timur', 0, NULL, NULL),
(389, 22, 'Kotamobagu', 1, NULL, NULL),
(390, 22, 'Bolaang Mongondow Selatan', 0, NULL, NULL),
(391, 22, 'Tomohon', 1, NULL, NULL),
(392, 23, 'Kutai Kartanegara', 0, NULL, NULL),
(393, 23, 'Samarinda', 1, NULL, NULL),
(394, 23, 'Balikpapan', 1, NULL, NULL),
(395, 23, 'Kutai Timur', 0, NULL, NULL),
(396, 23, 'Paser', 0, NULL, NULL),
(397, 23, 'Berau', 0, NULL, NULL),
(398, 23, 'Kutai Barat', 0, NULL, NULL),
(399, 23, 'Penajam Paser Utara', 0, NULL, NULL),
(400, 23, 'Bontang', 1, NULL, NULL),
(401, 23, 'Mahakam Ulu', 0, NULL, NULL),
(402, 24, 'Merauke', 0, NULL, NULL),
(403, 24, 'Jayapura', 0, NULL, NULL),
(404, 24, 'Jaya Wijaya', 0, NULL, NULL),
(405, 24, 'Biak Numfor', 0, NULL, NULL),
(406, 24, 'Mimika', 0, NULL, NULL),
(407, 24, 'Nabire', 0, NULL, NULL),
(408, 24, 'Jayapura', 1, NULL, NULL),
(409, 24, 'Yahukimo', 0, NULL, NULL),
(410, 24, 'Kepulauan Yapen', 0, NULL, NULL),
(411, 24, 'Mappi', 0, NULL, NULL),
(412, 24, 'Keerom', 0, NULL, NULL),
(413, 24, 'Asmat', 0, NULL, NULL),
(414, 24, 'Boven Digoel', 0, NULL, NULL),
(415, 24, 'Paniai', 0, NULL, NULL),
(416, 24, 'Lanny Jaya', 0, NULL, NULL),
(417, 24, 'Sarmi', 0, NULL, NULL),
(418, 24, 'Pegunungan Bintang', 0, NULL, NULL),
(419, 24, 'Tolikara', 0, NULL, NULL),
(420, 24, 'Waropen', 0, NULL, NULL),
(421, 24, 'Memberamo Raya', 0, NULL, NULL),
(422, 24, 'Supiori', 0, NULL, NULL),
(423, 24, 'Deiyai', 0, NULL, NULL),
(424, 24, 'Dogiyai', 0, NULL, NULL),
(425, 24, 'Yalimo', 0, NULL, NULL),
(426, 24, 'Membramo Tengah', 0, NULL, NULL),
(427, 24, 'Puncak', 0, NULL, NULL),
(428, 24, 'Intan Jaya', 0, NULL, NULL),
(429, 24, 'Puncak Jaya', 0, NULL, NULL),
(430, 24, 'Nduga', 0, NULL, NULL),
(431, 25, 'Buleleng', 0, NULL, NULL),
(432, 25, 'Denpasar', 1, NULL, NULL),
(433, 25, 'Tabanan', 0, NULL, NULL),
(434, 25, 'Badung', 0, NULL, NULL),
(435, 25, 'Karang Asem', 0, NULL, NULL),
(436, 25, 'Gianyar', 0, NULL, NULL),
(437, 25, 'Jembrana', 0, NULL, NULL),
(438, 25, 'Bangli', 0, NULL, NULL),
(439, 25, 'Klungkung', 0, NULL, NULL),
(440, 26, 'Maluku Tengah', 0, NULL, NULL),
(441, 26, 'Ambon', 1, NULL, NULL),
(442, 26, 'Seram Bagian Barat', 0, NULL, NULL),
(443, 26, 'Maluku Tenggara', 0, NULL, NULL),
(444, 26, 'Maluku Barat Daya', 0, NULL, NULL),
(445, 26, 'Buru', 0, NULL, NULL),
(446, 26, 'Seram Bagian Timur', 0, NULL, NULL),
(447, 26, 'Kepulauan Tanimbar', 0, NULL, NULL),
(448, 26, 'Kepulauan Aru', 0, NULL, NULL),
(449, 26, 'Buru Selatan', 0, NULL, NULL),
(450, 26, 'Tual', 1, NULL, NULL),
(451, 27, 'Bengkulu', 1, NULL, NULL),
(452, 27, 'Bengkulu Utara', 0, NULL, NULL),
(453, 27, 'Seluma', 0, NULL, NULL),
(454, 27, 'Bengkulu Selatan', 0, NULL, NULL),
(455, 27, 'Kaur', 0, NULL, NULL),
(456, 27, 'Muko-muko', 0, NULL, NULL),
(457, 27, 'Rejang Lebong', 0, NULL, NULL),
(458, 27, 'Lebong', 0, NULL, NULL),
(459, 27, 'Bengkulu Tengah', 0, NULL, NULL),
(460, 27, 'Kepahiang', 0, NULL, NULL),
(461, 28, 'Polewali Mandar', 0, NULL, NULL),
(462, 28, 'Mamasa', 0, NULL, NULL),
(463, 28, 'Mamuju', 0, NULL, NULL),
(464, 28, 'Majene', 0, NULL, NULL),
(465, 28, 'Pasangkayu', 0, NULL, NULL),
(466, 28, 'Mamuju Tengah', 0, NULL, NULL),
(467, 29, 'Halmahera Selatan', 0, NULL, NULL),
(468, 29, 'halmahera Utara', 0, NULL, NULL),
(469, 29, 'Halmahera Barat', 0, NULL, NULL),
(470, 29, 'Kepulauan Sula', 0, NULL, NULL),
(471, 29, 'Ternate', 1, NULL, NULL),
(472, 29, 'Tidore Kepulauan', 1, NULL, NULL),
(473, 29, 'Halmahera Timur', 0, NULL, NULL),
(474, 29, 'Pulau Taliabu', 0, NULL, NULL),
(475, 29, 'Kepulauan Morotai', 0, NULL, NULL),
(476, 29, 'Halmahera Tengah', 0, NULL, NULL),
(477, 30, 'Gorontalo', 0, NULL, NULL),
(478, 30, 'Bone Bolango', 0, NULL, NULL),
(479, 30, 'Boalemo', 0, NULL, NULL),
(480, 30, 'Pohuwato', 0, NULL, NULL),
(481, 30, 'Gorontalo Utara', 0, NULL, NULL),
(482, 30, 'Gorontalo', 1, NULL, NULL),
(490, 31, 'Batam', 1, NULL, NULL),
(491, 31, 'Karimun', 0, NULL, NULL),
(492, 31, 'Bintan', 0, NULL, NULL),
(493, 31, 'Lingga', 0, NULL, NULL),
(494, 31, 'Natuna', 0, NULL, NULL),
(495, 31, 'Tanjungpinang', 1, NULL, NULL),
(496, 31, 'Kepulauan Anambas', 0, NULL, NULL),
(497, 32, 'Manokwari', 0, NULL, NULL),
(498, 32, 'Sorong', 0, NULL, NULL),
(499, 32, 'Sorong', 1, NULL, NULL),
(500, 32, 'Raja Ampat', 0, NULL, NULL),
(501, 32, 'Fak-Fak', 0, NULL, NULL),
(502, 32, 'Teluk Bintuni', 0, NULL, NULL),
(503, 32, 'Sorong Selatan', 0, NULL, NULL),
(504, 32, 'Kaimana', 0, NULL, NULL),
(505, 32, 'Teluk Wondama', 0, NULL, NULL),
(506, 32, 'Tambrauw', 0, NULL, NULL),
(507, 32, 'Maybrat', 0, NULL, NULL),
(508, 32, 'Pegunungan Arfak', 0, NULL, NULL),
(509, 32, 'Manokwari Selatan', 0, NULL, NULL),
(510, 33, 'Bangka', 0, NULL, NULL),
(511, 33, 'Bangka Barat', 0, NULL, NULL),
(512, 33, 'Bangka Tengah', 0, NULL, NULL),
(513, 33, 'Belitung', 0, NULL, NULL),
(514, 33, 'Pangkalpinang', 1, NULL, NULL),
(515, 33, 'Bangka Selatan', 0, NULL, NULL),
(516, 33, 'Belitung Timur', 0, NULL, NULL),
(532, 34, 'Bulungan', 0, NULL, NULL),
(533, 34, 'Nunukan', 0, NULL, NULL),
(534, 34, 'Malinau', 0, NULL, NULL),
(535, 34, 'Tarakan', 1, NULL, NULL),
(536, 34, 'Tana Tidung', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `city_maps`
--

CREATE TABLE `city_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zoom` int(11) NOT NULL DEFAULT 0,
  `lat` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `lng` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission_sales_cards`
--

CREATE TABLE `commission_sales_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `in` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `out` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `saldo_seller` decimal(20,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission_sales_transfers`
--

CREATE TABLE `commission_sales_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `proof` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission_sales_transfer_details`
--

CREATE TABLE `commission_sales_transfer_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `commission_sales_transfer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `proof` varchar(100) DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `action_nominal` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `action_description` text DEFAULT NULL,
  `action_type` varchar(50) NOT NULL DEFAULT 'CREDIT',
  `last_amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cost_of_products_sold_cards`
--

CREATE TABLE `cost_of_products_sold_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cost_of_products_sold` decimal(20,2) NOT NULL DEFAULT 0.00000000000000,
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cost_of_products_sold_cards`
--

INSERT INTO `cost_of_products_sold_cards` (`id`, `user_id`, `item_id`, `cost_of_products_sold`, `description`, `reference_code`, `date`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 1000.00000000000000, 'Pembuatan Harga Nilai Barang', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(2, NULL, 2, 3000.00000000000000, 'Pembuatan Harga Nilai Barang', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(3, NULL, 3, 2000.00000000000000, 'Pembuatan Harga Nilai Barang', NULL, NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(4, NULL, 4, 1000.00000000000000, 'Pembuatan Harga Nilai Barang', NULL, NULL, '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(5, NULL, 5, 0.00000000000000, 'Pembuatan Harga Nilai Barang', NULL, NULL, '2025-08-16 01:48:14', '2025-08-16 01:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `iso` varchar(2) DEFAULT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `phone_code` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `nickname`, `iso`, `iso3`, `phone_code`, `created_at`, `updated_at`) VALUES
(1, 'AFGHANISTAN', 'Afghanistan', 'AF', 'AFG', 93, NULL, NULL),
(2, 'ALBANIA', 'Albania', 'AL', 'ALB', 355, NULL, NULL),
(3, 'ALGERIA', 'Algeria', 'DZ', 'DZA', 213, NULL, NULL),
(4, 'AMERICAN SAMOA', 'American Samoa', 'AS', 'ASM', 1684, NULL, NULL),
(5, 'ANDORRA', 'Andorra', 'AD', 'AND', 376, NULL, NULL),
(6, 'ANGOLA', 'Angola', 'AO', 'AGO', 244, NULL, NULL),
(7, 'ANGUILLA', 'Anguilla', 'AI', 'AIA', 1264, NULL, NULL),
(8, 'ANTARCTICA', 'Antarctica', 'AQ', NULL, 0, NULL, NULL),
(9, 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'AG', 'ATG', 1268, NULL, NULL),
(10, 'ARGENTINA', 'Argentina', 'AR', 'ARG', 54, NULL, NULL),
(11, 'ARMENIA', 'Armenia', 'AM', 'ARM', 374, NULL, NULL),
(12, 'ARUBA', 'Aruba', 'AW', 'ABW', 297, NULL, NULL),
(13, 'AUSTRALIA', 'Australia', 'AU', 'AUS', 61, NULL, NULL),
(14, 'AUSTRIA', 'Austria', 'AT', 'AUT', 43, NULL, NULL),
(15, 'AZERBAIJAN', 'Azerbaijan', 'AZ', 'AZE', 994, NULL, NULL),
(16, 'BAHAMAS', 'Bahamas', 'BS', 'BHS', 1242, NULL, NULL),
(17, 'BAHRAIN', 'Bahrain', 'BH', 'BHR', 973, NULL, NULL),
(18, 'BANGLADESH', 'Bangladesh', 'BD', 'BGD', 880, NULL, NULL),
(19, 'BARBADOS', 'Barbados', 'BB', 'BRB', 1246, NULL, NULL),
(20, 'BELARUS', 'Belarus', 'BY', 'BLR', 375, NULL, NULL),
(21, 'BELGIUM', 'Belgium', 'BE', 'BEL', 32, NULL, NULL),
(22, 'BELIZE', 'Belize', 'BZ', 'BLZ', 501, NULL, NULL),
(23, 'BENIN', 'Benin', 'BJ', 'BEN', 229, NULL, NULL),
(24, 'BERMUDA', 'Bermuda', 'BM', 'BMU', 1441, NULL, NULL),
(25, 'BHUTAN', 'Bhutan', 'BT', 'BTN', 975, NULL, NULL),
(26, 'BOLIVIA', 'Bolivia', 'BO', 'BOL', 591, NULL, NULL),
(27, 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BA', 'BIH', 387, NULL, NULL),
(28, 'BOTSWANA', 'Botswana', 'BW', 'BWA', 267, NULL, NULL),
(29, 'BOUVET ISLAND', 'Bouvet Island', 'BV', NULL, 0, NULL, NULL),
(30, 'BRAZIL', 'Brazil', 'BR', 'BRA', 55, NULL, NULL),
(31, 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', 'IO', NULL, 246, NULL, NULL),
(32, 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BN', 'BRN', 673, NULL, NULL),
(33, 'BULGARIA', 'Bulgaria', 'BG', 'BGR', 359, NULL, NULL),
(34, 'BURKINA FASO', 'Burkina Faso', 'BF', 'BFA', 226, NULL, NULL),
(35, 'BURUNDI', 'Burundi', 'BI', 'BDI', 257, NULL, NULL),
(36, 'CAMBODIA', 'Cambodia', 'KH', 'KHM', 855, NULL, NULL),
(37, 'CAMEROON', 'Cameroon', 'CM', 'CMR', 237, NULL, NULL),
(38, 'CANADA', 'Canada', 'CA', 'CAN', 1, NULL, NULL),
(39, 'CAPE VERDE', 'Cape Verde', 'CV', 'CPV', 238, NULL, NULL),
(40, 'CAYMAN ISLANDS', 'Cayman Islands', 'KY', 'CYM', 1345, NULL, NULL),
(41, 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CF', 'CAF', 236, NULL, NULL),
(42, 'CHAD', 'Chad', 'TD', 'TCD', 235, NULL, NULL),
(43, 'CHILE', 'Chile', 'CL', 'CHL', 56, NULL, NULL),
(44, 'CHINA', 'China', 'CN', 'CHN', 86, NULL, NULL),
(45, 'CHRISTMAS ISLAND', 'Christmas Island', 'CX', NULL, 61, NULL, NULL),
(46, 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', 'CC', NULL, 672, NULL, NULL),
(47, 'COLOMBIA', 'Colombia', 'CO', 'COL', 57, NULL, NULL),
(48, 'COMOROS', 'Comoros', 'KM', 'COM', 269, NULL, NULL),
(49, 'CONGO', 'Congo', 'CG', 'COG', 242, NULL, NULL),
(50, 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'CD', 'COD', 242, NULL, NULL),
(51, 'COOK ISLANDS', 'Cook Islands', 'CK', 'COK', 682, NULL, NULL),
(52, 'COSTA RICA', 'Costa Rica', 'CR', 'CRI', 506, NULL, NULL),
(53, 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CI', 'CIV', 225, NULL, NULL),
(54, 'CROATIA', 'Croatia', 'HR', 'HRV', 385, NULL, NULL),
(55, 'CUBA', 'Cuba', 'CU', 'CUB', 53, NULL, NULL),
(56, 'CYPRUS', 'Cyprus', 'CY', 'CYP', 357, NULL, NULL),
(57, 'CZECH REPUBLIC', 'Czech Republic', 'CZ', 'CZE', 420, NULL, NULL),
(58, 'DENMARK', 'Denmark', 'DK', 'DNK', 45, NULL, NULL),
(59, 'DJIBOUTI', 'Djibouti', 'DJ', 'DJI', 253, NULL, NULL),
(60, 'DOMINICA', 'Dominica', 'DM', 'DMA', 1767, NULL, NULL),
(61, 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DO', 'DOM', 1809, NULL, NULL),
(62, 'ECUADOR', 'Ecuador', 'EC', 'ECU', 593, NULL, NULL),
(63, 'EGYPT', 'Egypt', 'EG', 'EGY', 20, NULL, NULL),
(64, 'EL SALVADOR', 'El Salvador', 'SV', 'SLV', 503, NULL, NULL),
(65, 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GQ', 'GNQ', 240, NULL, NULL),
(66, 'ERITREA', 'Eritrea', 'ER', 'ERI', 291, NULL, NULL),
(67, 'ESTONIA', 'Estonia', 'EE', 'EST', 372, NULL, NULL),
(68, 'ETHIOPIA', 'Ethiopia', 'ET', 'ETH', 251, NULL, NULL),
(69, 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FK', 'FLK', 500, NULL, NULL),
(70, 'FAROE ISLANDS', 'Faroe Islands', 'FO', 'FRO', 298, NULL, NULL),
(71, 'FIJI', 'Fiji', 'FJ', 'FJI', 679, NULL, NULL),
(72, 'FINLAND', 'Finland', 'FI', 'FIN', 358, NULL, NULL),
(73, 'FRANCE', 'France', 'FR', 'FRA', 33, NULL, NULL),
(74, 'FRENCH GUIANA', 'French Guiana', 'GF', 'GUF', 594, NULL, NULL),
(75, 'FRENCH POLYNESIA', 'French Polynesia', 'PF', 'PYF', 689, NULL, NULL),
(76, 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', 'TF', NULL, 0, NULL, NULL),
(77, 'GABON', 'Gabon', 'GA', 'GAB', 241, NULL, NULL),
(78, 'GAMBIA', 'Gambia', 'GM', 'GMB', 220, NULL, NULL),
(79, 'GEORGIA', 'Georgia', 'GE', 'GEO', 995, NULL, NULL),
(80, 'GERMANY', 'Germany', 'DE', 'DEU', 49, NULL, NULL),
(81, 'GHANA', 'Ghana', 'GH', 'GHA', 233, NULL, NULL),
(82, 'GIBRALTAR', 'Gibraltar', 'GI', 'GIB', 350, NULL, NULL),
(83, 'GREECE', 'Greece', 'GR', 'GRC', 30, NULL, NULL),
(84, 'GREENLAND', 'Greenland', 'GL', 'GRL', 299, NULL, NULL),
(85, 'GRENADA', 'Grenada', 'GD', 'GRD', 1473, NULL, NULL),
(86, 'GUADELOUPE', 'Guadeloupe', 'GP', 'GLP', 590, NULL, NULL),
(87, 'GUAM', 'Guam', 'GU', 'GUM', 1671, NULL, NULL),
(88, 'GUATEMALA', 'Guatemala', 'GT', 'GTM', 502, NULL, NULL),
(89, 'GUINEA', 'Guinea', 'GN', 'GIN', 224, NULL, NULL),
(90, 'GUINEA-BISSAU', 'Guinea-Bissau', 'GW', 'GNB', 245, NULL, NULL),
(91, 'GUYANA', 'Guyana', 'GY', 'GUY', 592, NULL, NULL),
(92, 'HAITI', 'Haiti', 'HT', 'HTI', 509, NULL, NULL),
(93, 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', 'HM', NULL, 0, NULL, NULL),
(94, 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VA', 'VAT', 39, NULL, NULL),
(95, 'HONDURAS', 'Honduras', 'HN', 'HND', 504, NULL, NULL),
(96, 'HONG KONG', 'Hong Kong', 'HK', 'HKG', 852, NULL, NULL),
(97, 'HUNGARY', 'Hungary', 'HU', 'HUN', 36, NULL, NULL),
(98, 'ICELAND', 'Iceland', 'IS', 'ISL', 354, NULL, NULL),
(99, 'INDIA', 'India', 'IN', 'IND', 91, NULL, NULL),
(100, 'INDONESIA', 'Indonesia', 'ID', 'IDN', 62, NULL, NULL),
(101, 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IR', 'IRN', 98, NULL, NULL),
(102, 'IRAQ', 'Iraq', 'IQ', 'IRQ', 964, NULL, NULL),
(103, 'IRELAND', 'Ireland', 'IE', 'IRL', 353, NULL, NULL),
(104, 'ISRAEL', 'Israel', 'IL', 'ISR', 972, NULL, NULL),
(105, 'ITALY', 'Italy', 'IT', 'ITA', 39, NULL, NULL),
(106, 'JAMAICA', 'Jamaica', 'JM', 'JAM', 1876, NULL, NULL),
(107, 'JAPAN', 'Japan', 'JP', 'JPN', 81, NULL, NULL),
(108, 'JORDAN', 'Jordan', 'JO', 'JOR', 962, NULL, NULL),
(109, 'KAZAKHSTAN', 'Kazakhstan', 'KZ', 'KAZ', 7, NULL, NULL),
(110, 'KENYA', 'Kenya', 'KE', 'KEN', 254, NULL, NULL),
(111, 'KIRIBATI', 'Kiribati', 'KI', 'KIR', 686, NULL, NULL),
(112, 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'KP', 'PRK', 850, NULL, NULL),
(113, 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KR', 'KOR', 82, NULL, NULL),
(114, 'KUWAIT', 'Kuwait', 'KW', 'KWT', 965, NULL, NULL),
(115, 'KYRGYZSTAN', 'Kyrgyzstan', 'KG', 'KGZ', 996, NULL, NULL),
(116, 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LA', 'LAO', 856, NULL, NULL),
(117, 'LATVIA', 'Latvia', 'LV', 'LVA', 371, NULL, NULL),
(118, 'LEBANON', 'Lebanon', 'LB', 'LBN', 961, NULL, NULL),
(119, 'LESOTHO', 'Lesotho', 'LS', 'LSO', 266, NULL, NULL),
(120, 'LIBERIA', 'Liberia', 'LR', 'LBR', 231, NULL, NULL),
(121, 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LY', 'LBY', 218, NULL, NULL),
(122, 'LIECHTENSTEIN', 'Liechtenstein', 'LI', 'LIE', 423, NULL, NULL),
(123, 'LITHUANIA', 'Lithuania', 'LT', 'LTU', 370, NULL, NULL),
(124, 'LUXEMBOURG', 'Luxembourg', 'LU', 'LUX', 352, NULL, NULL),
(125, 'MACAO', 'Macao', 'MO', 'MAC', 853, NULL, NULL),
(126, 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MK', 'MKD', 389, NULL, NULL),
(127, 'MADAGASCAR', 'Madagascar', 'MG', 'MDG', 261, NULL, NULL),
(128, 'MALAWI', 'Malawi', 'MW', 'MWI', 265, NULL, NULL),
(129, 'MALAYSIA', 'Malaysia', 'MY', 'MYS', 60, NULL, NULL),
(130, 'MALDIVES', 'Maldives', 'MV', 'MDV', 960, NULL, NULL),
(131, 'MALI', 'Mali', 'ML', 'MLI', 223, NULL, NULL),
(132, 'MALTA', 'Malta', 'MT', 'MLT', 356, NULL, NULL),
(133, 'MARSHALL ISLANDS', 'Marshall Islands', 'MH', 'MHL', 692, NULL, NULL),
(134, 'MARTINIQUE', 'Martinique', 'MQ', 'MTQ', 596, NULL, NULL),
(135, 'MAURITANIA', 'Mauritania', 'MR', 'MRT', 222, NULL, NULL),
(136, 'MAURITIUS', 'Mauritius', 'MU', 'MUS', 230, NULL, NULL),
(137, 'MAYOTTE', 'Mayotte', 'YT', NULL, 269, NULL, NULL),
(138, 'MEXICO', 'Mexico', 'MX', 'MEX', 52, NULL, NULL),
(139, 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FM', 'FSM', 691, NULL, NULL),
(140, 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MD', 'MDA', 373, NULL, NULL),
(141, 'MONACO', 'Monaco', 'MC', 'MCO', 377, NULL, NULL),
(142, 'MONGOLIA', 'Mongolia', 'MN', 'MNG', 976, NULL, NULL),
(143, 'MONTSERRAT', 'Montserrat', 'MS', 'MSR', 1664, NULL, NULL),
(144, 'MOROCCO', 'Morocco', 'MA', 'MAR', 212, NULL, NULL),
(145, 'MOZAMBIQUE', 'Mozambique', 'MZ', 'MOZ', 258, NULL, NULL),
(146, 'MYANMAR', 'Myanmar', 'MM', 'MMR', 95, NULL, NULL),
(147, 'NAMIBIA', 'Namibia', 'NA', 'NAM', 264, NULL, NULL),
(148, 'NAURU', 'Nauru', 'NR', 'NRU', 674, NULL, NULL),
(149, 'NEPAL', 'Nepal', 'NP', 'NPL', 977, NULL, NULL),
(150, 'NETHERLANDS', 'Netherlands', 'NL', 'NLD', 31, NULL, NULL),
(151, 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'AN', 'ANT', 599, NULL, NULL),
(152, 'NEW CALEDONIA', 'New Caledonia', 'NC', 'NCL', 687, NULL, NULL),
(153, 'NEW ZEALAND', 'New Zealand', 'NZ', 'NZL', 64, NULL, NULL),
(154, 'NICARAGUA', 'Nicaragua', 'NI', 'NIC', 505, NULL, NULL),
(155, 'NIGER', 'Niger', 'NE', 'NER', 227, NULL, NULL),
(156, 'NIGERIA', 'Nigeria', 'NG', 'NGA', 234, NULL, NULL),
(157, 'NIUE', 'Niue', 'NU', 'NIU', 683, NULL, NULL),
(158, 'NORFOLK ISLAND', 'Norfolk Island', 'NF', 'NFK', 672, NULL, NULL),
(159, 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MP', 'MNP', 1670, NULL, NULL),
(160, 'NORWAY', 'Norway', 'NO', 'NOR', 47, NULL, NULL),
(161, 'OMAN', 'Oman', 'OM', 'OMN', 968, NULL, NULL),
(162, 'PAKISTAN', 'Pakistan', 'PK', 'PAK', 92, NULL, NULL),
(163, 'PALAU', 'Palau', 'PW', 'PLW', 680, NULL, NULL),
(164, 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', 'PS', NULL, 970, NULL, NULL),
(165, 'PANAMA', 'Panama', 'PA', 'PAN', 507, NULL, NULL),
(166, 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PG', 'PNG', 675, NULL, NULL),
(167, 'PARAGUAY', 'Paraguay', 'PY', 'PRY', 595, NULL, NULL),
(168, 'PERU', 'Peru', 'PE', 'PER', 51, NULL, NULL),
(169, 'PHILIPPINES', 'Philippines', 'PH', 'PHL', 63, NULL, NULL),
(170, 'PITCAIRN', 'Pitcairn', 'PN', 'PCN', 0, NULL, NULL),
(171, 'POLAND', 'Poland', 'PL', 'POL', 48, NULL, NULL),
(172, 'PORTUGAL', 'Portugal', 'PT', 'PRT', 351, NULL, NULL),
(173, 'PUERTO RICO', 'Puerto Rico', 'PR', 'PRI', 1787, NULL, NULL),
(174, 'QATAR', 'Qatar', 'QA', 'QAT', 974, NULL, NULL),
(175, 'REUNION', 'Reunion', 'RE', 'REU', 262, NULL, NULL),
(176, 'ROMANIA', 'Romania', 'RO', 'ROM', 40, NULL, NULL),
(177, 'RUSSIAN FEDERATION', 'Russian Federation', 'RU', 'RUS', 70, NULL, NULL),
(178, 'RWANDA', 'Rwanda', 'RW', 'RWA', 250, NULL, NULL),
(179, 'SAINT HELENA', 'Saint Helena', 'SH', 'SHN', 290, NULL, NULL),
(180, 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KN', 'KNA', 1869, NULL, NULL),
(181, 'SAINT LUCIA', 'Saint Lucia', 'LC', 'LCA', 1758, NULL, NULL),
(182, 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'PM', 'SPM', 508, NULL, NULL),
(183, 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1784, NULL, NULL),
(184, 'SAMOA', 'Samoa', 'WS', 'WSM', 684, NULL, NULL),
(185, 'SAN MARINO', 'San Marino', 'SM', 'SMR', 378, NULL, NULL),
(186, 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'ST', 'STP', 239, NULL, NULL),
(187, 'SAUDI ARABIA', 'Saudi Arabia', 'SA', 'SAU', 966, NULL, NULL),
(188, 'SENEGAL', 'Senegal', 'SN', 'SEN', 221, NULL, NULL),
(189, 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', 'CS', NULL, 381, NULL, NULL),
(190, 'SEYCHELLES', 'Seychelles', 'SC', 'SYC', 248, NULL, NULL),
(191, 'SIERRA LEONE', 'Sierra Leone', 'SL', 'SLE', 232, NULL, NULL),
(192, 'SINGAPORE', 'Singapore', 'SG', 'SGP', 65, NULL, NULL),
(193, 'SLOVAKIA', 'Slovakia', 'SK', 'SVK', 421, NULL, NULL),
(194, 'SLOVENIA', 'Slovenia', 'SI', 'SVN', 386, NULL, NULL),
(195, 'SOLOMON ISLANDS', 'Solomon Islands', 'SB', 'SLB', 677, NULL, NULL),
(196, 'SOMALIA', 'Somalia', 'SO', 'SOM', 252, NULL, NULL),
(197, 'SOUTH AFRICA', 'South Africa', 'ZA', 'ZAF', 27, NULL, NULL),
(198, 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', 'GS', NULL, 0, NULL, NULL),
(199, 'SPAIN', 'Spain', 'ES', 'ESP', 34, NULL, NULL),
(200, 'SRI LANKA', 'Sri Lanka', 'LK', 'LKA', 94, NULL, NULL),
(201, 'SUDAN', 'Sudan', 'SD', 'SDN', 249, NULL, NULL),
(202, 'SURINAME', 'Suriname', 'SR', 'SUR', 597, NULL, NULL),
(203, 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJ', 'SJM', 47, NULL, NULL),
(204, 'SWAZILAND', 'Swaziland', 'SZ', 'SWZ', 268, NULL, NULL),
(205, 'SWEDEN', 'Sweden', 'SE', 'SWE', 46, NULL, NULL),
(206, 'SWITZERLAND', 'Switzerland', 'CH', 'CHE', 41, NULL, NULL),
(207, 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SY', 'SYR', 963, NULL, NULL),
(208, 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TW', 'TWN', 886, NULL, NULL),
(209, 'TAJIKISTAN', 'Tajikistan', 'TJ', 'TJK', 992, NULL, NULL),
(210, 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZ', 'TZA', 255, NULL, NULL),
(211, 'THAILAND', 'Thailand', 'TH', 'THA', 66, NULL, NULL),
(212, 'TIMOR-LESTE', 'Timor-Leste', 'TL', NULL, 670, NULL, NULL),
(213, 'TOGO', 'Togo', 'TG', 'TGO', 228, NULL, NULL),
(214, 'TOKELAU', 'Tokelau', 'TK', 'TKL', 690, NULL, NULL),
(215, 'TONGA', 'Tonga', 'TO', 'TON', 676, NULL, NULL),
(216, 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TT', 'TTO', 1868, NULL, NULL),
(217, 'TUNISIA', 'Tunisia', 'TN', 'TUN', 216, NULL, NULL),
(218, 'TURKEY', 'Turkey', 'TR', 'TUR', 90, NULL, NULL),
(219, 'TURKMENISTAN', 'Turkmenistan', 'TM', 'TKM', 7370, NULL, NULL),
(220, 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TC', 'TCA', 1649, NULL, NULL),
(221, 'TUVALU', 'Tuvalu', 'TV', 'TUV', 688, NULL, NULL),
(222, 'UGANDA', 'Uganda', 'UG', 'UGA', 256, NULL, NULL),
(223, 'UKRAINE', 'Ukraine', 'UA', 'UKR', 380, NULL, NULL),
(224, 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'AE', 'ARE', 971, NULL, NULL),
(225, 'UNITED KINGDOM', 'United Kingdom', 'GB', 'GBR', 44, NULL, NULL),
(226, 'UNITED STATES', 'United States', 'US', 'USA', 1, NULL, NULL),
(227, 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', 'UM', NULL, 1, NULL, NULL),
(228, 'URUGUAY', 'Uruguay', 'UY', 'URY', 598, NULL, NULL),
(229, 'UZBEKISTAN', 'Uzbekistan', 'UZ', 'UZB', 998, NULL, NULL),
(230, 'VANUATU', 'Vanuatu', 'VU', 'VUT', 678, NULL, NULL),
(231, 'VENEZUELA', 'Venezuela', 'VE', 'VEN', 58, NULL, NULL),
(232, 'VIET NAM', 'Viet Nam', 'VN', 'VNM', 84, NULL, NULL),
(233, 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VG', 'VGB', 1284, NULL, NULL),
(234, 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VI', 'VIR', 1340, NULL, NULL),
(235, 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WF', 'WLF', 681, NULL, NULL),
(236, 'WESTERN SAHARA', 'Western Sahara', 'EH', 'ESH', 212, NULL, NULL),
(237, 'YEMEN', 'Yemen', 'YE', 'YEM', 967, NULL, NULL),
(238, 'ZAMBIA', 'Zambia', 'ZM', 'ZMB', 260, NULL, NULL),
(239, 'ZIMBABWE', 'Zimbabwe', 'ZW', 'ZWE', 263, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `poin` bigint(20) NOT NULL DEFAULT 0,
  `receivable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `receivable_saldo` decimal(20,2) NOT NULL DEFAULT 0.00,
  `saldo` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_priority_term_of_payment` tinyint(1) NOT NULL DEFAULT 0,
  `is_nonactive_tax` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_maps`
--

CREATE TABLE `customer_address_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zoom` int(11) NOT NULL DEFAULT 0,
  `lat` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `lng` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_banks`
--

CREATE TABLE `customer_banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bank` varchar(200) DEFAULT NULL,
  `account` varchar(200) DEFAULT NULL,
  `account_number` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_contacts`
--

CREATE TABLE `customer_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_files`
--

CREATE TABLE `customer_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ANGGOTA', 'Kelompok pelanggan untuk anggota', '2025-08-16 01:48:13', '2025-08-16 01:48:13', NULL),
(2, 'VIP', 'Kelompok pelanggan untuk vip', '2025-08-16 01:48:13', '2025-08-16 01:48:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_identities`
--

CREATE TABLE `customer_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `card` varchar(50) NOT NULL DEFAULT 'IDENTITY_CARD',
  `number` varchar(200) DEFAULT NULL,
  `gender` varchar(50) NOT NULL DEFAULT 'MALE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_saldo_cards`
--

CREATE TABLE `customer_saldo_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `in` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `out` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `customer_saldo` decimal(20,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_taxes`
--

CREATE TABLE `customer_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_number` varchar(25) DEFAULT NULL,
  `tax_name` varchar(50) DEFAULT NULL,
  `tax_address` text DEFAULT NULL,
  `tax_verified_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_term_of_payments`
--

CREATE TABLE `customer_term_of_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `term` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` varchar(50) NOT NULL DEFAULT 'GRAND_TOTAL_INVOICE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debt_cards`
--

CREATE TABLE `debt_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `in` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `out` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `debt` decimal(20,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debt_saldo_cards`
--

CREATE TABLE `debt_saldo_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `in` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `out` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `debt_saldo` decimal(20,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_using_finance` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_orders`
--

CREATE TABLE `delivery_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_order_customer_addresses`
--

CREATE TABLE `delivery_order_customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_order_customer_contacts`
--

CREATE TABLE `delivery_order_customer_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_order_details`
--

CREATE TABLE `delivery_order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_order_shippings`
--

CREATE TABLE `delivery_order_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'NONE',
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `origin` varchar(200) DEFAULT NULL,
  `destination` varchar(200) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `reciept_number` varchar(100) DEFAULT NULL,
  `estimation_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Pemasaran', NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(2, 'Produksi', NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(3, 'Pembelian', NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(4, 'Penjualan', NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(5, 'Gudang', NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(6, 'Keuangan', NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `department_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Umum', NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(2, 2, 'Umum', NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(3, 3, 'Umum', NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(4, 4, 'Umum', NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(5, 5, 'Umum', NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(6, 6, 'Umum', NULL, '2025-08-16 01:48:13', '2025-08-16 01:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `expeditions`
--

CREATE TABLE `expeditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `origin` varchar(200) DEFAULT NULL,
  `destination` varchar(200) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expeditions`
--

INSERT INTO `expeditions` (`id`, `code`, `name`, `description`, `origin`, `destination`, `weight`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'EN0001', 'JNE(Jawa Tengah - Riau)', 'Pengiriman dari jawa tengah ke riau', 'Jawa Tengah,Solo', 'Riau,Papar', 500.00, '2025-08-16 01:48:13', '2025-08-16 01:48:13', NULL),
(2, 'EN0002', 'JNE(Jawa Tengah - Jawa Barat)', 'Pengiriman dari jawa tengah ke jawa barat', 'Jawa Tengah,Solo', 'Jawa Barat,Bandung', 100.00, '2025-08-16 01:48:13', '2025-08-16 01:48:13', NULL),
(3, 'EN0003', 'JNE(Jawa Tengah - Jawa Timur)', 'Pengiriman dari jawa tengah ke jawa timur', 'Jawa Tengah,Solo', 'Jawa Timur,Surabaya', 150.00, '2025-08-16 01:48:13', '2025-08-16 01:48:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expedition_destination_maps`
--

CREATE TABLE `expedition_destination_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expedition_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zoom` int(11) NOT NULL DEFAULT 0,
  `lat` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `lng` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expedition_origin_maps`
--

CREATE TABLE `expedition_origin_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expedition_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zoom` int(11) NOT NULL DEFAULT 0,
  `lat` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `lng` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expedition_prices`
--

CREATE TABLE `expedition_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expedition_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expedition_prices`
--

INSERT INTO `expedition_prices` (`id`, `expedition_id`, `name`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'JNE(Express)', 'Lewat jalur laut', 100000.00, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(2, 1, 'JNE(Ekonomi)', 'Lewat jalur darat', 50000.00, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(3, 1, 'JNE(Reguler)', 'Lewat jalur udara', 20000.00, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(4, 2, 'JNE(Express)', 'Lewat jalur laut', 10000.00, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(5, 2, 'JNE(Ekonomi)', 'Lewat jalur darat', 5000.00, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(6, 2, 'JNE(Reguler)', 'Lewat jalur udara', 1000.00, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(7, 3, 'JNE(Express)', 'Lewat jalur laut', 20000.00, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(8, 3, 'JNE(Ekonomi)', 'Lewat jalur darat', 10000.00, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(9, 3, 'JNE(Reguler)', 'Lewat jalur udara', 20000.00, '2025-08-16 01:48:13', '2025-08-16 01:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_assets`
--

CREATE TABLE `fixed_assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(15) NOT NULL,
  `name` varchar(200) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `unit` varchar(30) DEFAULT 'Unit',
  `group_asset_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_acquisition` date DEFAULT NULL,
  `nominal` decimal(20,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fixed_assets`
--

INSERT INTO `fixed_assets` (`id`, `code`, `name`, `quantity`, `unit`, `group_asset_id`, `user_id`, `date_acquisition`, `nominal`, `created_at`, `updated_at`) VALUES
(1, 'A52023090001', 'MEJA', 3, 'Unit', 12, NULL, '2022-07-30', 2500000.00, '2023-09-14 00:56:18', '2023-09-15 07:38:32'),
(2, 'A52023090002', 'KURSI', 4, 'Unit', 12, NULL, '2022-07-30', 50000000.00, '2023-09-14 00:57:04', '2023-09-24 20:52:08'),
(3, 'A52023090003', 'KOMPUTER', 2, 'Unit', 13, NULL, '2022-07-30', 11000000.00, '2023-09-14 00:59:01', '2023-09-15 02:55:59'),
(4, 'A52023090004', 'PRINTER', 2, 'Unit', 13, NULL, '2022-07-30', 3000000.00, '2023-09-14 01:00:02', '2023-09-15 02:56:24'),
(5, 'A52023090005', 'ETALASE KACA', 2, 'Unit', 37, NULL, '2022-07-30', 4000000.00, '2023-09-14 01:01:41', '2023-09-15 03:00:17'),
(6, 'A52023090006', 'RAK BESI SUSUN', 16, 'Unit', 37, NULL, '2022-07-30', 14000000.00, '2023-09-14 01:02:43', '2023-09-15 03:00:38'),
(7, 'A52023090007', 'AC', 1, 'Unit', 37, NULL, '2022-07-30', 3500000.00, '2023-09-14 01:04:17', '2023-09-14 01:08:06'),
(8, 'A52023090008', 'KIPAS ANGIN', 2, 'Unit', 37, NULL, '2022-07-30', 400000.00, '2023-09-14 01:12:07', '2023-09-15 03:01:00'),
(9, 'A52023090009', 'SHOWCASE PENDINGIN', 2, 'Unit', 37, NULL, '2022-07-30', 3600000.00, '2023-09-14 01:13:17', '2023-09-15 03:01:21'),
(10, 'A52023090010', 'DISPENSER GALON', 1, 'Unit', 37, NULL, '2022-07-30', 400000.00, '2023-09-14 01:14:01', '2023-09-14 01:14:01'),
(13, 'A132023090001', 'KOMPUTER', 4, 'UNIT', 252, NULL, '2022-01-01', 32000000.00, '2023-09-23 21:31:39', '2023-09-23 21:31:39'),
(14, 'A132023090002', 'PRINTER', 5, 'UNIT', 252, NULL, '2022-01-01', 10000000.00, '2023-09-23 21:32:24', '2023-09-23 21:32:24'),
(15, 'A132023090003', 'UPS', 4, 'UNIT', 252, NULL, '2022-01-01', 4400000.00, '2023-09-23 21:32:56', '2023-09-23 21:32:56'),
(16, 'A132023090004', 'CCTV', 1, 'UNIT', 252, NULL, '2022-01-01', 14000000.00, '2023-09-23 21:33:33', '2023-09-23 21:33:33'),
(17, 'A132023090005', 'GENSET 900WATT', 1, 'UNIT', 252, NULL, '2022-01-01', 7350000.00, '2023-09-23 21:34:09', '2023-09-23 21:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `formula_material_items`
--

CREATE TABLE `formula_material_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formula_material_item_details`
--

CREATE TABLE `formula_material_item_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `formula_material_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formula_material_item_steps`
--

CREATE TABLE `formula_material_item_steps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `formula_material_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grants`
--

CREATE TABLE `grants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grants`
--

INSERT INTO `grants` (`id`, `group_role_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(2, 1, 4, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(3, 1, 5, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(4, 1, 6, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(5, 1, 7, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(6, 1, 8, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(7, 1, 9, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(8, 1, 10, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(9, 1, 11, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(10, 1, 12, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(11, 1, 13, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(12, 1, 15, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(13, 1, 16, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(14, 1, 17, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(15, 1, 18, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(16, 1, 19, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(17, 1, 21, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(18, 1, 22, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(19, 1, 23, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(20, 1, 24, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(21, 1, 25, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(22, 1, 27, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(23, 1, 28, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(24, 1, 29, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(25, 1, 30, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(26, 1, 31, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(27, 1, 32, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(28, 1, 33, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(29, 1, 35, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(30, 1, 36, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(31, 1, 37, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(32, 1, 38, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(33, 1, 39, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(34, 1, 40, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(35, 1, 41, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(36, 1, 42, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(37, 1, 43, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(38, 1, 45, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(39, 1, 46, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(40, 1, 47, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(41, 1, 48, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(42, 1, 50, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(43, 1, 51, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(44, 1, 52, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(45, 1, 53, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(46, 1, 54, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(47, 1, 55, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(48, 1, 56, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(49, 1, 57, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(50, 1, 58, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(51, 1, 59, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(52, 1, 61, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(53, 1, 62, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(54, 1, 63, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(55, 1, 64, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(56, 1, 65, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(57, 1, 66, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(58, 1, 67, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(59, 1, 68, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(60, 1, 70, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(61, 1, 71, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(62, 1, 72, '2025-08-16 01:48:13', '2025-08-16 01:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `grant_operators`
--

CREATE TABLE `grant_operators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `operator` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grant_operators`
--

INSERT INTO `grant_operators` (`id`, `grant_id`, `operator`, `created_at`, `updated_at`) VALUES
(1, 1, 'all', NULL, NULL),
(2, 2, 'all', NULL, NULL),
(3, 3, 'all', NULL, NULL),
(4, 4, 'all', NULL, NULL),
(5, 5, 'all', NULL, NULL),
(6, 6, 'all', NULL, NULL),
(7, 7, 'all', NULL, NULL),
(8, 8, 'all', NULL, NULL),
(9, 9, 'all', NULL, NULL),
(10, 10, 'all', NULL, NULL),
(11, 11, 'all', NULL, NULL),
(12, 12, 'all', NULL, NULL),
(13, 13, 'all', NULL, NULL),
(14, 14, 'all', NULL, NULL),
(15, 15, 'all', NULL, NULL),
(16, 16, 'all', NULL, NULL),
(17, 17, 'all', NULL, NULL),
(18, 18, 'all', NULL, NULL),
(19, 19, 'all', NULL, NULL),
(20, 20, 'all', NULL, NULL),
(21, 21, 'all', NULL, NULL),
(22, 22, 'all', NULL, NULL),
(23, 23, 'all', NULL, NULL),
(24, 24, 'all', NULL, NULL),
(25, 25, 'all', NULL, NULL),
(26, 26, 'all', NULL, NULL),
(27, 27, 'all', NULL, NULL),
(28, 28, 'all', NULL, NULL),
(29, 29, 'all', NULL, NULL),
(30, 30, 'all', NULL, NULL),
(31, 31, 'all', NULL, NULL),
(32, 32, 'all', NULL, NULL),
(33, 33, 'all', NULL, NULL),
(34, 34, 'all', NULL, NULL),
(35, 35, 'all', NULL, NULL),
(36, 36, 'all', NULL, NULL),
(37, 37, 'all', NULL, NULL),
(38, 38, 'all', NULL, NULL),
(39, 39, 'all', NULL, NULL),
(40, 40, 'all', NULL, NULL),
(41, 41, 'all', NULL, NULL),
(42, 42, 'all', NULL, NULL),
(43, 43, 'all', NULL, NULL),
(44, 44, 'all', NULL, NULL),
(45, 45, 'all', NULL, NULL),
(46, 46, 'all', NULL, NULL),
(47, 47, 'all', NULL, NULL),
(48, 48, 'all', NULL, NULL),
(49, 49, 'all', NULL, NULL),
(50, 50, 'all', NULL, NULL),
(51, 51, 'all', NULL, NULL),
(52, 52, 'all', NULL, NULL),
(53, 53, 'all', NULL, NULL),
(54, 54, 'all', NULL, NULL),
(55, 55, 'all', NULL, NULL),
(56, 56, 'all', NULL, NULL),
(57, 57, 'all', NULL, NULL),
(58, 58, 'all', NULL, NULL),
(59, 59, 'all', NULL, NULL),
(60, 60, 'all', NULL, NULL),
(61, 61, 'all', NULL, NULL),
(62, 62, 'all', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_assets`
--

CREATE TABLE `group_assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `rates` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `economic_age` int(10) UNSIGNED DEFAULT NULL,
  `groups` enum('KELOMPOK HARTA','JENIS USAHA','JENIS HARTA') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_assets`
--

INSERT INTO `group_assets` (`id`, `code`, `name`, `rates`, `parent_id`, `economic_age`, `groups`, `created_at`, `updated_at`) VALUES
(1, '1', 'KELOMPOK 1', 4, NULL, 48, 'KELOMPOK HARTA', '2023-09-13 22:30:31', '2023-09-13 22:30:31'),
(2, '2', 'KELOMPOK 2', 8, NULL, 96, 'KELOMPOK HARTA', '2023-09-13 22:30:57', '2023-09-13 22:32:26'),
(3, '3', 'KELOMPOK 3', 16, NULL, 192, 'KELOMPOK HARTA', '2023-09-13 22:31:56', '2023-09-13 22:31:56'),
(4, '4', 'KELOMPOK 4', 20, NULL, 240, 'KELOMPOK HARTA', '2023-09-13 22:32:56', '2023-09-13 22:32:56'),
(5, '1', 'Semua Jenis Usaha', 0, 1, 0, 'JENIS USAHA', '2023-09-13 22:40:40', '2023-09-13 22:40:40'),
(6, '2', 'Pertanian, perkebunan, kehutanan,', 0, 1, 0, 'JENIS USAHA', '2023-09-13 22:40:58', '2023-09-13 22:40:58'),
(7, '3', 'Industri makanan dan minuman', 0, 1, 0, 'JENIS USAHA', '2023-09-13 22:41:06', '2023-09-13 22:41:06'),
(8, '4', 'Transportasi dan Pergudangan', 0, 1, 0, 'JENIS USAHA', '2023-09-13 22:41:15', '2023-09-13 22:41:15'),
(9, '5', 'Industri semi konduktor', 0, 1, 0, 'JENIS USAHA', '2023-09-13 22:41:24', '2023-09-13 22:41:24'),
(10, '6', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 1, 0, 'JENIS USAHA', '2023-09-13 22:41:33', '2023-09-13 22:41:33'),
(11, '7', 'Jasa telekomunikasi selular', 0, 1, 0, 'JENIS USAHA', '2023-09-13 22:41:44', '2023-09-13 22:41:44'),
(12, '1', 'Mebel dan peralatan dari kayu atau rotan termasuk meja, bangku, kursi, lemari dan sejenisnya yang bu', 0, 5, 0, 'JENIS HARTA', '2023-09-13 22:41:56', '2023-09-13 22:41:56'),
(13, '2', 'Mesin kantor seperti mesin tik, mesin hitung, duplikator, mesin fotokopi, mesin akunting/pembukuan, ', 0, 5, 0, 'JENIS HARTA', '2023-09-13 22:42:04', '2023-09-13 22:42:04'),
(14, '3', 'Perlengkapan lainnya seperti amplifier, tape/cassette, video recorder, televisi dan sejenisnya.', 0, 5, 0, 'JENIS HARTA', '2023-09-13 22:42:12', '2023-09-13 22:42:12'),
(15, '4', 'Sepeda motor, sepeda dan becak.', 0, 5, 0, 'JENIS HARTA', '2023-09-13 22:42:21', '2023-09-13 22:42:21'),
(16, '5', 'Alat perlengkapan khusus (tools) bagi industri/jasa yang bersangkutan.', 0, 5, 0, 'JENIS HARTA', '2023-09-13 22:42:30', '2023-09-13 22:42:30'),
(17, '6', 'Alat Dapur', 0, 5, 0, 'JENIS HARTA', '2023-09-13 22:42:39', '2023-09-13 22:42:39'),
(18, '7', 'Dies, jigs, dan mould.', 0, 5, 0, 'JENIS HARTA', '2023-09-13 22:42:48', '2023-09-13 22:42:48'),
(19, '8', 'Alat-alat komunikasi seperti pesawat telepon, faksimile, telepon seluler dan sejenisnya.', 0, 5, 0, 'JENIS HARTA', '2023-09-13 22:42:59', '2023-09-13 22:42:59'),
(20, '1', 'Alat yang digerakkan bukan dengan mesin seperti cangkul, peternakan, perikanan, garu dan lain-lain.', 0, 6, 0, 'JENIS HARTA', '2023-09-13 22:43:17', '2023-09-13 22:43:17'),
(21, '1', 'Mesin ringan yang dapat dipindah-pindahkan seperti, huller, pemecah kulit, penyosoh, pengering, pall', 0, 7, 0, 'JENIS HARTA', '2023-09-13 22:43:29', '2023-09-13 22:43:29'),
(22, '1', 'Mobil taksi, bus dan truk yang digunakan sebagai angkutan umum.', 0, 8, 0, 'JENIS HARTA', '2023-09-13 22:44:17', '2023-09-13 22:44:17'),
(23, '1', 'Falsh memory tester, writer machine, biporar test system, elimination (PE8-1), pose checker.', 0, 9, 0, 'JENIS HARTA', '2023-09-13 22:44:28', '2023-09-13 22:44:28'),
(24, '1', 'Anchor, Anchor Chains, Polyester Rope, Steel Buoys, Steel Wire Ropes, Mooring Accessoris.', 0, 10, 0, 'JENIS HARTA', '2023-09-13 22:44:40', '2023-09-13 22:44:40'),
(25, '1', 'Base Station Controller', 0, 11, 0, 'JENIS HARTA', '2023-09-13 22:44:50', '2023-09-13 22:44:50'),
(26, '1', 'Semua jenis usaha', 0, 2, 0, 'JENIS USAHA', '2023-09-13 22:45:02', '2023-09-13 22:45:02'),
(27, '2', 'Pertanian, perkebunan, kehutanan, perikanan', 0, 2, 0, 'JENIS USAHA', '2023-09-13 22:45:11', '2023-09-13 22:45:11'),
(28, '3', 'Industri makanan dan minuman', 0, 2, 0, 'JENIS USAHA', '2023-09-13 22:45:21', '2023-09-13 22:45:21'),
(29, '4', 'Industri mesin', 0, 2, 0, 'JENIS USAHA', '2023-09-13 22:45:30', '2023-09-13 22:45:30'),
(30, '5', 'Perkayuan, kehutanan', 0, 2, 0, 'JENIS USAHA', '2023-09-13 22:45:44', '2023-09-13 22:45:44'),
(31, '6', 'Konstruksi', 0, 2, 0, 'JENIS USAHA', '2023-09-13 22:45:55', '2023-09-13 22:45:55'),
(32, '7', 'Transportasi dan Pergudangan', 0, 2, 0, 'JENIS USAHA', '2023-09-13 22:46:04', '2023-09-13 22:46:04'),
(33, '8', 'Telekomunikasi', 0, 2, 0, 'JENIS USAHA', '2023-09-13 22:46:24', '2023-09-13 22:46:24'),
(34, '9', 'Industri semi konduktor', 0, 2, 0, 'JENIS USAHA', '2023-09-13 22:46:33', '2023-09-13 22:46:33'),
(35, '10', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 2, 0, 'JENIS USAHA', '2023-09-13 22:46:44', '2023-09-13 22:46:44'),
(36, '11', 'Jasa Telekomunikasi Seluler', 0, 2, 0, 'JENIS USAHA', '2023-09-13 22:46:55', '2023-09-13 22:46:55'),
(37, '1', 'Mebel dan peralatan dari logam termasuk meja, bangku, kursi, lemari dan sejenisnya yang bukan merupa', 0, 26, 0, 'JENIS HARTA', '2023-09-13 22:47:10', '2023-09-13 22:47:10'),
(38, '2', 'Mobil, bus, truk, speed boat dan sejenisnya.', 0, 26, 0, 'JENIS HARTA', '2023-09-13 22:47:22', '2023-09-13 22:47:22'),
(39, '3', 'Container dan sejenisnya.', 0, 26, 0, 'JENIS HARTA', '2023-09-13 22:47:31', '2023-09-13 22:47:31'),
(40, '1', 'KELOMPOK 1', 4, NULL, 48, 'KELOMPOK HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(41, '1', 'Semua Jenis Usaha', 0, 40, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(42, '1', 'Mebel dan peralatan dari kayu atau rotan termasuk meja, bangku, kursi, lemari dan sejenisnya yang bu', 0, 41, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(43, '2', 'KELOMPOK 2', 8, 41, 96, 'KELOMPOK HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(44, '3', 'KELOMPOK 3', 16, 41, 192, 'KELOMPOK HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(45, '4', 'KELOMPOK 4', 20, 41, 240, 'KELOMPOK HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(46, '5', 'Alat perlengkapan khusus (tools) bagi industri/jasa yang bersangkutan.', 0, 41, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(47, '6', 'Alat Dapur', 0, 41, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(48, '7', 'Dies, jigs, dan mould.', 0, 41, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(49, '8', 'Alat-alat komunikasi seperti pesawat telepon, faksimile, telepon seluler dan sejenisnya.', 0, 41, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(50, '2', 'Pertanian, perkebunan, kehutanan,', 0, 40, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(51, '1', 'Alat yang digerakkan bukan dengan mesin seperti cangkul, peternakan, perikanan, garu dan lain-lain.', 0, 50, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(52, '3', 'Industri makanan dan minuman', 0, 40, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(53, '1', 'Mesin ringan yang dapat dipindah-pindahkan seperti, huller, pemecah kulit, penyosoh, pengering, pall', 0, 52, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(54, '4', 'Transportasi dan Pergudangan', 0, 40, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(55, '1', 'Mobil taksi, bus dan truk yang digunakan sebagai angkutan umum.', 0, 54, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(56, '5', 'Industri semi konduktor', 0, 40, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(57, '1', 'Falsh memory tester, writer machine, biporar test system, elimination (PE8-1), pose checker.', 0, 56, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(58, '6', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 40, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(59, '1', 'Anchor, Anchor Chains, Polyester Rope, Steel Buoys, Steel Wire Ropes, Mooring Accessoris.', 0, 58, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(60, '7', 'Jasa telekomunikasi selular', 0, 40, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(61, '1', 'Base Station Controller', 0, 60, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(62, '1', 'Semua jenis usaha', 0, 61, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(63, '1', 'Mebel dan peralatan dari logam termasuk meja, bangku, kursi, lemari dan sejenisnya yang bukan merupa', 0, 62, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(64, '2', 'Mobil, bus, truk, speed boat dan sejenisnya.', 0, 62, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(65, '3', 'Container dan sejenisnya.', 0, 62, 0, 'JENIS HARTA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(66, '2', 'Pertanian, perkebunan, kehutanan, perikanan', 0, 61, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(67, '3', 'Industri makanan dan minuman', 0, 61, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(68, '4', 'Industri mesin', 0, 61, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(69, '5', 'Perkayuan, kehutanan', 0, 61, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(70, '6', 'Konstruksi', 0, 61, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(71, '7', 'Transportasi dan Pergudangan', 0, 61, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(72, '8', 'Telekomunikasi', 0, 61, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(73, '9', 'Industri semi konduktor', 0, 61, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(74, '10', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 61, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(75, '11', 'Jasa Telekomunikasi Seluler', 0, 61, 0, 'JENIS USAHA', '2023-09-15 22:15:00', '2023-09-15 22:15:00'),
(76, '1', 'Semua Jenis Usaha', 0, 75, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(77, '1', 'Mebel dan peralatan dari kayu atau rotan termasuk meja, bangku, kursi, lemari dan sejenisnya yang bu', 0, 76, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(78, '2', 'Mesin kantor seperti mesin tik, mesin hitung, duplikator, mesin fotokopi, mesin akunting/pembukuan, ', 0, 76, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(79, '3', 'Perlengkapan lainnya seperti amplifier, tape/cassette, video recorder, televisi dan sejenisnya.', 0, 76, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(80, '4', 'Sepeda motor, sepeda dan becak.', 0, 76, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(81, '5', 'Alat perlengkapan khusus (tools) bagi industri/jasa yang bersangkutan.', 0, 76, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(82, '6', 'Alat Dapur', 0, 76, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(83, '7', 'Dies, jigs, dan mould.', 0, 76, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(84, '8', 'Alat-alat komunikasi seperti pesawat telepon, faksimile, telepon seluler dan sejenisnya.', 0, 76, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(85, '2', 'Pertanian, perkebunan, kehutanan,', 0, 75, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(86, '1', 'Alat yang digerakkan bukan dengan mesin seperti cangkul, peternakan, perikanan, garu dan lain-lain.', 0, 85, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(87, '3', 'Industri makanan dan minuman', 0, 75, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(88, '1', 'Mesin ringan yang dapat dipindah-pindahkan seperti, huller, pemecah kulit, penyosoh, pengering, pall', 0, 87, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(89, '4', 'Transportasi dan Pergudangan', 0, 75, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(90, '1', 'Mobil taksi, bus dan truk yang digunakan sebagai angkutan umum.', 0, 89, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(91, '5', 'Industri semi konduktor', 0, 75, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(92, '1', 'Falsh memory tester, writer machine, biporar test system, elimination (PE8-1), pose checker.', 0, 91, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(93, '6', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 75, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(94, '1', 'Anchor, Anchor Chains, Polyester Rope, Steel Buoys, Steel Wire Ropes, Mooring Accessoris.', 0, 93, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(95, '7', 'Jasa telekomunikasi selular', 0, 75, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(96, '1', 'Base Station Controller', 0, 95, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(97, '1', 'Semua jenis usaha', 0, 96, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(98, '1', 'Mebel dan peralatan dari logam termasuk meja, bangku, kursi, lemari dan sejenisnya yang bukan merupa', 0, 97, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(99, '2', 'Mobil, bus, truk, speed boat dan sejenisnya.', 0, 97, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(100, '3', 'Container dan sejenisnya.', 0, 97, 0, 'JENIS HARTA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(101, '2', 'Pertanian, perkebunan, kehutanan, perikanan', 0, 96, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(102, '3', 'Industri makanan dan minuman', 0, 96, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(103, '4', 'Industri mesin', 0, 96, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(104, '5', 'Perkayuan, kehutanan', 0, 96, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(105, '6', 'Konstruksi', 0, 96, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(106, '7', 'Transportasi dan Pergudangan', 0, 96, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(107, '8', 'Telekomunikasi', 0, 96, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(108, '9', 'Industri semi konduktor', 0, 96, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(109, '10', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 96, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(110, '11', 'Jasa Telekomunikasi Seluler', 0, 96, 0, 'JENIS USAHA', '2023-09-17 19:22:04', '2023-09-17 19:22:04'),
(111, '1', 'Semua Jenis Usaha', 0, 110, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(112, '1', 'Mebel dan peralatan dari kayu atau rotan termasuk meja, bangku, kursi, lemari dan sejenisnya yang bu', 0, 111, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(113, '2', 'Mesin kantor seperti mesin tik, mesin hitung, duplikator, mesin fotokopi, mesin akunting/pembukuan, ', 0, 111, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(114, '3', 'Perlengkapan lainnya seperti amplifier, tape/cassette, video recorder, televisi dan sejenisnya.', 0, 111, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(115, '4', 'Sepeda motor, sepeda dan becak.', 0, 111, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(116, '5', 'Alat perlengkapan khusus (tools) bagi industri/jasa yang bersangkutan.', 0, 111, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(117, '6', 'Alat Dapur', 0, 111, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(118, '7', 'Dies, jigs, dan mould.', 0, 111, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(119, '8', 'Alat-alat komunikasi seperti pesawat telepon, faksimile, telepon seluler dan sejenisnya.', 0, 111, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(120, '2', 'Pertanian, perkebunan, kehutanan,', 0, 110, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(121, '1', 'Alat yang digerakkan bukan dengan mesin seperti cangkul, peternakan, perikanan, garu dan lain-lain.', 0, 120, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(122, '3', 'Industri makanan dan minuman', 0, 110, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(123, '1', 'Mesin ringan yang dapat dipindah-pindahkan seperti, huller, pemecah kulit, penyosoh, pengering, pall', 0, 122, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(124, '4', 'Transportasi dan Pergudangan', 0, 110, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(125, '1', 'Mobil taksi, bus dan truk yang digunakan sebagai angkutan umum.', 0, 124, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(126, '5', 'Industri semi konduktor', 0, 110, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(127, '1', 'Falsh memory tester, writer machine, biporar test system, elimination (PE8-1), pose checker.', 0, 126, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(128, '6', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 110, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(129, '1', 'Anchor, Anchor Chains, Polyester Rope, Steel Buoys, Steel Wire Ropes, Mooring Accessoris.', 0, 128, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(130, '7', 'Jasa telekomunikasi selular', 0, 110, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(131, '1', 'Base Station Controller', 0, 130, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(132, '1', 'Semua jenis usaha', 0, 131, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(133, '1', 'Mebel dan peralatan dari logam termasuk meja, bangku, kursi, lemari dan sejenisnya yang bukan merupa', 0, 132, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(134, '2', 'Mobil, bus, truk, speed boat dan sejenisnya.', 0, 132, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(135, '3', 'Container dan sejenisnya.', 0, 132, 0, 'JENIS HARTA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(136, '2', 'Pertanian, perkebunan, kehutanan, perikanan', 0, 131, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(137, '3', 'Industri makanan dan minuman', 0, 131, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(138, '4', 'Industri mesin', 0, 131, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(139, '5', 'Perkayuan, kehutanan', 0, 131, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(140, '6', 'Konstruksi', 0, 131, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(141, '7', 'Transportasi dan Pergudangan', 0, 131, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(142, '8', 'Telekomunikasi', 0, 131, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(143, '9', 'Industri semi konduktor', 0, 131, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(144, '10', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 131, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(145, '11', 'Jasa Telekomunikasi Seluler', 0, 131, 0, 'JENIS USAHA', '2023-09-17 19:24:32', '2023-09-17 19:24:32'),
(146, '1', 'Semua Jenis Usaha', 0, 145, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(147, '1', 'Mebel dan peralatan dari kayu atau rotan termasuk meja, bangku, kursi, lemari dan sejenisnya yang bu', 0, 146, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(148, '2', 'Mesin kantor seperti mesin tik, mesin hitung, duplikator, mesin fotokopi, mesin akunting/pembukuan, ', 0, 146, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(149, '3', 'Perlengkapan lainnya seperti amplifier, tape/cassette, video recorder, televisi dan sejenisnya.', 0, 146, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(150, '4', 'Sepeda motor, sepeda dan becak.', 0, 146, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(151, '5', 'Alat perlengkapan khusus (tools) bagi industri/jasa yang bersangkutan.', 0, 146, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(152, '6', 'Alat Dapur', 0, 146, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(153, '7', 'Dies, jigs, dan mould.', 0, 146, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(154, '8', 'Alat-alat komunikasi seperti pesawat telepon, faksimile, telepon seluler dan sejenisnya.', 0, 146, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(155, '2', 'Pertanian, perkebunan, kehutanan,', 0, 145, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(156, '1', 'Alat yang digerakkan bukan dengan mesin seperti cangkul, peternakan, perikanan, garu dan lain-lain.', 0, 155, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(157, '3', 'Industri makanan dan minuman', 0, 145, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(158, '1', 'Mesin ringan yang dapat dipindah-pindahkan seperti, huller, pemecah kulit, penyosoh, pengering, pall', 0, 157, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(159, '4', 'Transportasi dan Pergudangan', 0, 145, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(160, '1', 'Mobil taksi, bus dan truk yang digunakan sebagai angkutan umum.', 0, 159, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(161, '5', 'Industri semi konduktor', 0, 145, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(162, '1', 'Falsh memory tester, writer machine, biporar test system, elimination (PE8-1), pose checker.', 0, 161, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(163, '6', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 145, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(164, '1', 'Anchor, Anchor Chains, Polyester Rope, Steel Buoys, Steel Wire Ropes, Mooring Accessoris.', 0, 163, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(165, '7', 'Jasa telekomunikasi selular', 0, 145, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(166, '1', 'Base Station Controller', 0, 165, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(167, '1', 'Semua jenis usaha', 0, 166, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(168, '1', 'Mebel dan peralatan dari logam termasuk meja, bangku, kursi, lemari dan sejenisnya yang bukan merupa', 0, 167, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(169, '2', 'Mobil, bus, truk, speed boat dan sejenisnya.', 0, 167, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(170, '3', 'Container dan sejenisnya.', 0, 167, 0, 'JENIS HARTA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(171, '2', 'Pertanian, perkebunan, kehutanan, perikanan', 0, 166, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(172, '3', 'Industri makanan dan minuman', 0, 166, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(173, '4', 'Industri mesin', 0, 166, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(174, '5', 'Perkayuan, kehutanan', 0, 166, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(175, '6', 'Konstruksi', 0, 166, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(176, '7', 'Transportasi dan Pergudangan', 0, 166, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(177, '8', 'Telekomunikasi', 0, 166, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(178, '9', 'Industri semi konduktor', 0, 166, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(179, '10', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 166, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(180, '11', 'Jasa Telekomunikasi Seluler', 0, 166, 0, 'JENIS USAHA', '2023-09-17 19:24:42', '2023-09-17 19:24:42'),
(181, '1', 'Pertambangan selain minyak dan gas', 0, 3, 0, 'JENIS USAHA', '2023-09-17 19:38:18', '2023-09-17 19:38:18'),
(183, '2', 'Permintalan, pertenunan dan pencelupan', 0, 3, 0, 'JENIS USAHA', '2023-09-17 19:40:01', '2023-09-17 19:40:01'),
(184, '1', 'Mesin-mesin yang dipakai dalam bidang pertambangan, termasuk mesin-mesin yang mengolah produk pelika', 0, 181, 0, 'JENIS HARTA', '2023-09-17 19:40:34', '2023-09-17 19:58:57'),
(185, '1', 'Mesin yang mengolah/menghasilkan produk-produk tekstil (misalnya kain katun, sutra, serat-serat buat', 0, 183, 0, 'JENIS HARTA', '2023-09-17 19:40:54', '2023-09-17 19:59:43'),
(186, '2', 'Mesin untuk yang preparation, bleaching, dyeing, printing, finishing, texturing, packaging dan sejen', 0, 183, 0, 'JENIS HARTA', '2023-09-17 19:41:10', '2023-09-17 20:00:23'),
(187, '3', 'Perkayuan', 0, 3, 0, 'JENIS USAHA', '2023-09-17 19:41:28', '2023-09-17 19:41:28'),
(188, '1', 'Mesin yang mengolah/menghasilkan produk-produk kayu, barang-barang dari jerami, rumput dan bahan any', 0, 187, 0, 'JENIS HARTA', '2023-09-17 19:41:44', '2023-09-17 20:00:51'),
(189, '2', 'Mesin dan peralatan penggergajian kayu.', 0, 187, 0, 'JENIS HARTA', '2023-09-17 19:41:59', '2023-09-17 19:41:59'),
(190, '4', 'Industri kimia', 0, 3, 0, 'JENIS USAHA', '2023-09-17 19:42:16', '2023-09-17 19:42:16'),
(193, '5', 'Industri mesin', 0, 3, 0, 'JENIS USAHA', '2023-09-17 19:44:18', '2023-09-17 19:44:18'),
(194, '1', 'Mesin yang menghasilkan/memproduksi mesin menengah dan berat (misalnya mesin mobil, mesin kapal).', 0, 193, 0, 'JENIS HARTA', '2023-09-17 19:44:37', '2023-09-17 19:44:37'),
(195, '6', 'Transportasi dan Pergudangan', 0, 3, 0, 'JENIS USAHA', '2023-09-17 19:44:55', '2023-09-17 19:44:55'),
(196, '1', 'Kapal penumpang, kapal barang, kapal khusus dibuat untuk pengangkutan barang-barang tertentu (misaln', 0, 195, 0, 'JENIS HARTA', '2023-09-17 19:45:31', '2023-09-17 19:55:29'),
(197, '2', 'Kapal dibuat khusus untuk mengela atau mendorong kapal, kapal suar, kapal pemadam kebakaran, kapal k', 0, 195, 0, 'JENIS HARTA', '2023-09-17 19:45:49', '2023-09-17 19:56:09'),
(198, '3', 'Dok terapung.', 0, 195, 0, 'JENIS HARTA', '2023-09-17 19:46:11', '2023-09-17 19:46:11'),
(199, '4', 'Perahu layar pakai atau tanpa motor yang mempunyai berat di atas 250 DWT.', 0, 195, 0, 'JENIS HARTA', '2023-09-17 19:46:25', '2023-09-17 19:46:25'),
(200, '5', 'Pesawat terbang dan helikopter-helikopter segala jenis.', 0, 195, 0, 'JENIS HARTA', '2023-09-17 19:46:39', '2023-09-17 19:46:39'),
(201, '7', 'Telekomunikasi', 0, 3, 0, 'JENIS USAHA', '2023-09-17 19:46:54', '2023-09-17 19:46:54'),
(202, '1', 'Perangkat radio navigasi, radar dan kendali jarak jauh.', 0, 201, 0, 'JENIS HARTA', '2023-09-17 19:47:09', '2023-09-17 19:47:09'),
(203, '1', 'Konstruksi', 0, 4, 0, 'JENIS USAHA', '2023-09-17 19:47:33', '2023-09-17 19:47:33'),
(204, '1', 'Mesin berat untuk konstruksi', 0, 203, 0, 'JENIS HARTA', '2023-09-17 19:47:50', '2023-09-17 19:47:50'),
(205, '2', 'Transportasi dan Pergudangan', 0, 4, 0, 'JENIS USAHA', '2023-09-17 19:48:05', '2023-09-17 19:48:05'),
(206, '1', 'Lokomotif uap dan tender atas rel.', 0, 205, 0, 'JENIS HARTA', '2023-09-17 19:48:21', '2023-09-17 19:48:21'),
(207, '2', 'Lokomotif listrik atas rel, dijalankan dengan batere atau dengan tenaga listrik dari sumber luar.', 0, 205, 0, 'JENIS HARTA', '2023-09-17 19:48:38', '2023-09-17 19:48:38'),
(208, '3', 'Lokomotif atas rel lainnya.', 0, 205, 0, 'JENIS HARTA', '2023-09-17 19:48:55', '2023-09-17 19:48:55'),
(209, '4', 'Kapal penumpang, kapal barang, kapal khusus dibuat untuk pengangkutan barang-barang tertentu (misaln', 0, 205, 0, 'JENIS HARTA', '2023-09-17 19:49:14', '2023-09-17 19:56:56'),
(210, '5', 'Kapal dibuat khusus untuk menghela atau mendorong kapal, kapal suar, kapal pemadam kebakaran, kapal ', 0, 205, 0, 'JENIS HARTA', '2023-09-17 19:49:30', '2023-09-17 19:57:25'),
(211, '6', 'Dok-dok terapung.', 0, 205, 0, 'JENIS HARTA', '2023-09-17 19:49:46', '2023-09-17 19:49:46'),
(212, '1', 'Mesin peralatan yang mengolah/menghasilkan produk industri kimia dan industri yang ada hubungannya d', 0, 190, 0, 'JENIS HARTA', '2023-09-17 19:53:47', '2023-09-17 19:53:47'),
(213, '2', 'Mesin yang mengolah/menghasilkan produk industri lainnya (misalnya damar tiruan, bahan plastik, este', 0, 190, 0, 'JENIS HARTA', '2023-09-17 19:54:46', '2023-09-17 19:54:46'),
(215, '1', 'KELOMPOK 1', 4, 214, 48, 'KELOMPOK HARTA', '2023-09-23 18:53:54', '2023-09-24 18:45:52'),
(216, '1', 'Mebel dan peralatan dari kayu atau rotan termasuk meja, bangku, kursi, lemari dan sejenisnya yang bu', 0, 215, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(220, '5', 'Alat perlengkapan khusus (tools) bagi industri/jasa yang bersangkutan.', 0, 215, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(221, '6', 'Alat Dapur', 0, 215, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(222, '7', 'Dies, jigs, dan mould.', 0, 215, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(223, '8', 'Alat-alat komunikasi seperti pesawat telepon, faksimile, telepon seluler dan sejenisnya.', 0, 215, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(224, '2', 'KELOMPOK 2', 8, 214, 96, 'KELOMPOK HARTA', '2023-09-23 18:53:54', '2023-09-24 18:45:52'),
(225, '1', 'Alat yang digerakkan bukan dengan mesin seperti cangkul, peternakan, perikanan, garu dan lain-lain.', 0, 224, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(226, '3', 'KELOMPOK 3', 16, 214, 192, 'KELOMPOK HARTA', '2023-09-23 18:53:54', '2023-09-24 18:45:52'),
(227, '1', 'Mesin ringan yang dapat dipindah-pindahkan seperti, huller, pemecah kulit, penyosoh, pengering, pall', 0, 226, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(228, '4', 'KELOMPOK 4', 20, 214, 240, 'KELOMPOK HARTA', '2023-09-23 18:53:54', '2023-09-24 18:45:52'),
(229, '1', 'Mobil taksi, bus dan truk yang digunakan sebagai angkutan umum.', 0, 228, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(230, '5', 'Industri semi konduktor', 0, 214, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(231, '1', 'Falsh memory tester, writer machine, biporar test system, elimination (PE8-1), pose checker.', 0, 230, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(232, '6', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 214, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(233, '1', 'Anchor, Anchor Chains, Polyester Rope, Steel Buoys, Steel Wire Ropes, Mooring Accessoris.', 0, 232, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(234, '7', 'Jasa telekomunikasi selular', 0, 214, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(235, '1', 'Base Station Controller', 0, 234, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(236, '1', 'Semua jenis usaha', 0, 235, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(237, '1', 'Mebel dan peralatan dari logam termasuk meja, bangku, kursi, lemari dan sejenisnya yang bukan merupa', 0, 236, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(238, '2', 'Mobil, bus, truk, speed boat dan sejenisnya.', 0, 236, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(239, '3', 'Container dan sejenisnya.', 0, 236, 0, 'JENIS HARTA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(240, '2', 'Pertanian, perkebunan, kehutanan, perikanan', 0, 235, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(241, '3', 'Industri makanan dan minuman', 0, 235, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(242, '4', 'Industri mesin', 0, 235, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(243, '5', 'Perkayuan, kehutanan', 0, 235, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(244, '6', 'Konstruksi', 0, 235, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(245, '7', 'Transportasi dan Pergudangan', 0, 235, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(246, '8', 'Telekomunikasi', 0, 235, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(247, '9', 'Industri semi konduktor', 0, 235, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(248, '10', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 235, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(249, '11', 'Jasa Telekomunikasi Seluler', 0, 235, 0, 'JENIS USAHA', '2023-09-23 18:53:54', '2023-09-23 18:53:54'),
(250, '1', 'KELOMPOK 1', 4, NULL, 48, 'KELOMPOK HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(251, '1', 'Semua Jenis Usaha', 0, 250, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(252, '1', 'Mebel dan peralatan dari kayu atau rotan termasuk meja, bangku, kursi, lemari dan sejenisnya yang bu', 0, 251, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(256, '5', 'Alat perlengkapan khusus (tools) bagi industri/jasa yang bersangkutan.', 0, 251, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(257, '6', 'Alat Dapur', 0, 251, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(258, '7', 'Dies, jigs, dan mould.', 0, 251, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(259, '8', 'Alat-alat komunikasi seperti pesawat telepon, faksimile, telepon seluler dan sejenisnya.', 0, 251, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(260, '2', 'Pertanian, perkebunan, kehutanan,', 0, 250, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(261, '1', 'Alat yang digerakkan bukan dengan mesin seperti cangkul, peternakan, perikanan, garu dan lain-lain.', 0, 260, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(262, '3', 'Industri makanan dan minuman', 0, 250, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(263, '1', 'Mesin ringan yang dapat dipindah-pindahkan seperti, huller, pemecah kulit, penyosoh, pengering, pall', 0, 262, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(264, '4', 'Transportasi dan Pergudangan', 0, 250, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(265, '1', 'Mobil taksi, bus dan truk yang digunakan sebagai angkutan umum.', 0, 264, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(266, '5', 'Industri semi konduktor', 0, 250, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(267, '1', 'Falsh memory tester, writer machine, biporar test system, elimination (PE8-1), pose checker.', 0, 266, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(268, '6', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 250, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(269, '1', 'Anchor, Anchor Chains, Polyester Rope, Steel Buoys, Steel Wire Ropes, Mooring Accessoris.', 0, 268, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(270, '7', 'Jasa telekomunikasi selular', 0, 250, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(271, '1', 'Base Station Controller', 0, 270, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(272, '1', 'Semua jenis usaha', 0, 271, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(273, '1', 'Mebel dan peralatan dari logam termasuk meja, bangku, kursi, lemari dan sejenisnya yang bukan merupa', 0, 272, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(274, '2', 'Mobil, bus, truk, speed boat dan sejenisnya.', 0, 272, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(275, '3', 'Container dan sejenisnya.', 0, 272, 0, 'JENIS HARTA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(276, '2', 'Pertanian, perkebunan, kehutanan, perikanan', 0, 271, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(277, '3', 'Industri makanan dan minuman', 0, 271, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(278, '4', 'Industri mesin', 0, 271, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(279, '5', 'Perkayuan, kehutanan', 0, 271, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(280, '6', 'Konstruksi', 0, 271, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(281, '7', 'Transportasi dan Pergudangan', 0, 271, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(282, '8', 'Telekomunikasi', 0, 271, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(283, '9', 'Industri semi konduktor', 0, 271, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(284, '10', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 271, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(285, '11', 'Jasa Telekomunikasi Seluler', 0, 271, 0, 'JENIS USAHA', '2023-09-23 20:55:13', '2023-09-23 20:55:13'),
(286, '1', 'Semua Jenis Usaha', 0, 285, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(287, '1', 'Mebel dan peralatan dari kayu atau rotan termasuk meja, bangku, kursi, lemari dan sejenisnya yang bu', 0, 286, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(288, '2', 'Mesin kantor seperti mesin tik, mesin hitung, duplikator, mesin fotokopi, mesin akunting/pembukuan, ', 0, 286, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(289, '3', 'Perlengkapan lainnya seperti amplifier, tape/cassette, video recorder, televisi dan sejenisnya.', 0, 286, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(290, '4', 'Sepeda motor, sepeda dan becak.', 0, 286, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(291, '5', 'Alat perlengkapan khusus (tools) bagi industri/jasa yang bersangkutan.', 0, 286, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(292, '6', 'Alat Dapur', 0, 286, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(293, '7', 'Dies, jigs, dan mould.', 0, 286, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(294, '8', 'Alat-alat komunikasi seperti pesawat telepon, faksimile, telepon seluler dan sejenisnya.', 0, 286, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(295, '2', 'Pertanian, perkebunan, kehutanan,', 0, 285, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(296, '1', 'Alat yang digerakkan bukan dengan mesin seperti cangkul, peternakan, perikanan, garu dan lain-lain.', 0, 295, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(297, '3', 'Industri makanan dan minuman', 0, 285, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(298, '1', 'Mesin ringan yang dapat dipindah-pindahkan seperti, huller, pemecah kulit, penyosoh, pengering, pall', 0, 297, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(299, '4', 'Transportasi dan Pergudangan', 0, 285, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(300, '1', 'Mobil taksi, bus dan truk yang digunakan sebagai angkutan umum.', 0, 299, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(301, '5', 'Industri semi konduktor', 0, 285, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(302, '1', 'Falsh memory tester, writer machine, biporar test system, elimination (PE8-1), pose checker.', 0, 301, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(303, '6', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 285, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(304, '1', 'Anchor, Anchor Chains, Polyester Rope, Steel Buoys, Steel Wire Ropes, Mooring Accessoris.', 0, 303, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(305, '7', 'Jasa telekomunikasi selular', 0, 285, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(306, '1', 'Base Station Controller', 0, 305, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(307, '1', 'Semua jenis usaha', 0, 306, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(308, '1', 'Mebel dan peralatan dari logam termasuk meja, bangku, kursi, lemari dan sejenisnya yang bukan merupa', 0, 307, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(309, '2', 'Mobil, bus, truk, speed boat dan sejenisnya.', 0, 307, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(310, '3', 'Container dan sejenisnya.', 0, 307, 0, 'JENIS HARTA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(311, '2', 'Pertanian, perkebunan, kehutanan, perikanan', 0, 306, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(312, '3', 'Industri makanan dan minuman', 0, 306, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(313, '4', 'Industri mesin', 0, 306, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(314, '5', 'Perkayuan, kehutanan', 0, 306, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(315, '6', 'Konstruksi', 0, 306, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(316, '7', 'Transportasi dan Pergudangan', 0, 306, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(317, '8', 'Telekomunikasi', 0, 306, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(318, '9', 'Industri semi konduktor', 0, 306, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(319, '10', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 306, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(320, '11', 'Jasa Telekomunikasi Seluler', 0, 306, 0, 'JENIS USAHA', '2023-09-24 18:45:52', '2023-09-24 18:45:52'),
(321, '1', 'KELOMPOK 1', 4, NULL, 48, 'KELOMPOK HARTA', '2023-09-24 20:08:03', '2023-09-24 20:08:03'),
(322, '1', 'Semua Jenis Usaha', 0, 321, 0, 'JENIS USAHA', '2023-09-24 20:08:03', '2023-09-24 20:08:03'),
(323, '1', 'Mebel dan peralatan dari kayu atau rotan termasuk meja, bangku, kursi, lemari dan sejenisnya yang bu', 0, 322, 0, 'JENIS HARTA', '2023-09-24 20:08:03', '2023-09-24 20:08:03'),
(324, '2', 'Mesin kantor seperti mesin tik, mesin hitung, duplikator, mesin fotokopi, mesin akunting/pembukuan, ', 0, 322, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(325, '3', 'Perlengkapan lainnya seperti amplifier, tape/cassette, video recorder, televisi dan sejenisnya.', 0, 322, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(326, '4', 'Sepeda motor, sepeda dan becak.', 0, 322, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(327, '5', 'Alat perlengkapan khusus (tools) bagi industri/jasa yang bersangkutan.', 0, 322, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(328, '6', 'Alat Dapur', 0, 322, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(329, '7', 'Dies, jigs, dan mould.', 0, 322, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(330, '8', 'Alat-alat komunikasi seperti pesawat telepon, faksimile, telepon seluler dan sejenisnya.', 0, 322, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(331, '2', 'Pertanian, perkebunan, kehutanan,', 0, 321, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(332, '1', 'Alat yang digerakkan bukan dengan mesin seperti cangkul, peternakan, perikanan, garu dan lain-lain.', 0, 331, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(333, '3', 'Industri makanan dan minuman', 0, 321, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(334, '1', 'Mesin ringan yang dapat dipindah-pindahkan seperti, huller, pemecah kulit, penyosoh, pengering, pall', 0, 333, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(335, '4', 'Transportasi dan Pergudangan', 0, 321, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(336, '1', 'Mobil taksi, bus dan truk yang digunakan sebagai angkutan umum.', 0, 335, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(337, '5', 'Industri semi konduktor', 0, 321, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(338, '1', 'Falsh memory tester, writer machine, biporar test system, elimination (PE8-1), pose checker.', 0, 337, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(339, '6', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 321, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(340, '1', 'Anchor, Anchor Chains, Polyester Rope, Steel Buoys, Steel Wire Ropes, Mooring Accessoris.', 0, 339, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(341, '7', 'Jasa telekomunikasi selular', 0, 321, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(342, '1', 'Base Station Controller', 0, 341, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(343, '2', 'KELOMPOK 2', 8, NULL, 96, 'KELOMPOK HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(344, '1', 'Semua jenis usaha', 0, 343, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(345, '1', 'Mebel dan peralatan dari logam termasuk meja, bangku, kursi, lemari dan sejenisnya yang bukan merupa', 0, 344, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(346, '2', 'Mobil, bus, truk, speed boat dan sejenisnya.', 0, 344, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(347, '3', 'Container dan sejenisnya.', 0, 344, 0, 'JENIS HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(348, '2', 'Pertanian, perkebunan, kehutanan, perikanan', 0, 343, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(349, '3', 'Industri makanan dan minuman', 0, 343, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(350, '4', 'Industri mesin', 0, 343, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(351, '5', 'Perkayuan, kehutanan', 0, 343, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(352, '6', 'Konstruksi', 0, 343, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(353, '7', 'Transportasi dan Pergudangan', 0, 343, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(354, '8', 'Telekomunikasi', 0, 343, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(355, '9', 'Industri semi konduktor', 0, 343, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(356, '10', 'Jasa Persewaan Peralatan Tambat Air Dalam', 0, 343, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(357, '11', 'Jasa Telekomunikasi Seluler', 0, 343, 0, 'JENIS USAHA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(358, '3', 'KELOMPOK 3', 16, NULL, 192, 'KELOMPOK HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04'),
(359, '4', 'KELOMPOK 4', 20, NULL, 240, 'KELOMPOK HARTA', '2023-09-24 20:08:04', '2023-09-24 20:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `group_roles`
--

CREATE TABLE `group_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_roles`
--

INSERT INTO `group_roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Serba Bisa', 'Memiliki semua hak akses', '2025-08-16 01:48:13', '2025-08-16 01:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'INVENTORY',
  `status_type` varchar(50) NOT NULL DEFAULT 'PRODUCT',
  `name` varchar(255) DEFAULT NULL,
  `alias_name` varchar(255) DEFAULT NULL,
  `image_primary` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_using_tax` tinyint(1) NOT NULL DEFAULT 1,
  `is_free_tax` tinyint(1) NOT NULL DEFAULT 0,
  `is_using_serial_number` tinyint(1) NOT NULL DEFAULT 0,
  `is_using_production_code` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_category_id`, `supplier_id`, `customer_id`, `code`, `type`, `status_type`, `name`, `alias_name`, `image_primary`, `description`, `is_using_tax`, `is_free_tax`, `is_using_serial_number`, `is_using_production_code`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, NULL, NULL, 'IM0001', 'INVENTORY', 'PRODUCT', 'Frestea 350ml', 'FTA', 0, 'Frestea 350ml', 1, 0, 0, 0, 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13', NULL),
(2, NULL, NULL, NULL, 'IM0002', 'INVENTORY', 'PRODUCT', 'Teh Pucuk 250ml', 'TP', 0, 'Teh Pucuk 250ml', 1, 0, 0, 0, 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13', NULL),
(3, NULL, NULL, NULL, 'IM0003', 'INVENTORY', 'PRODUCT', 'Teh Pucuk 200ml', 'TP', 0, 'Teh Pucuk 200ml', 1, 0, 0, 0, 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13', NULL),
(4, NULL, NULL, NULL, 'IM0004', 'INVENTORY', 'PRODUCT', 'Teh Pucuk 150ml', 'TP', 0, 'Teh Pucuk 150ml', 1, 0, 0, 0, 1, '2025-08-16 01:48:14', '2025-08-16 01:48:14', NULL),
(5, NULL, NULL, NULL, 'IM0005', 'NON_INVENTORY', 'SERVICE', 'Servis Leptop', 'SL', 0, 'Servis Leptop', 1, 0, 0, 0, 1, '2025-08-16 01:48:14', '2025-08-16 01:48:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'GROUP',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `parent_id`, `name`, `description`, `image`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Merek', 'Kategori untuk merek', NULL, 'GROUP', '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(2, 1, 'Merek Motor', 'Merek Motor', NULL, 'SUB_GROUP', '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(3, 2, 'Motor Honda', 'Khusus motor Honda', NULL, 'VALUE', '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(4, 2, 'Motor Yamaha', 'Khusu motor Yamaha', NULL, 'VALUE', '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(5, 1, 'Merek Leptop', 'Merek Leptop', NULL, 'SUB_GROUP', '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(6, 5, 'Acer', 'Khusus Merek Acer', NULL, 'VALUE', '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(7, 5, 'Samsung', 'Khusus Merek Samsung', NULL, 'VALUE', '2025-08-16 01:48:13', '2025-08-16 01:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `item_detail_categories`
--

CREATE TABLE `item_detail_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_item_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_identities`
--

CREATE TABLE `item_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `in_date` timestamp NULL DEFAULT NULL,
  `out_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_images`
--

CREATE TABLE `item_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_prices`
--

CREATE TABLE `item_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `purchase_price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `selling_price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit` varchar(50) DEFAULT NULL,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `minimum_stock` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `safe_stock` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) UNSIGNED NOT NULL,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_prices`
--

INSERT INTO `item_prices` (`id`, `customer_group_id`, `item_id`, `code`, `purchase_price`, `selling_price`, `unit`, `cost_of_products_sold`, `minimum_stock`, `safe_stock`, `quantity`, `rack`, `weight`, `unit_mass`, `width`, `height`, `length`, `thickness`, `unit_metric`, `warranty`, `warranty_type`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, '1', 1000.00, 10000.00, 'pcs', 1000.00, 10.00, 20.00, 1.00, NULL, 0.00, 'g', 0.00, 0.00, 0.00, 0.00, 'cm', 0, 'NONE', '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(2, NULL, 2, '12', 3000.00, 30000.00, 'pcs', 3000.00, 10.00, 20.00, 1.00, NULL, 0.00, 'g', 0.00, 0.00, 0.00, 0.00, 'cm', 0, 'NONE', '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(3, NULL, 2, '12', 30000.00, 300000.00, 'box', 30000.00, 0.00, 0.00, 10.00, NULL, 0.00, 'g', 0.00, 0.00, 0.00, 0.00, 'cm', 0, 'NONE', '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(4, NULL, 3, '123', 2000.00, 20000.00, 'pcs', 2000.00, 10.00, 20.00, 1.00, NULL, 0.00, 'g', 0.00, 0.00, 0.00, 0.00, 'cm', 0, 'NONE', '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(5, NULL, 3, '123', 20000.00, 200000.00, 'box', 20000.00, 0.00, 0.00, 10.00, NULL, 0.00, 'g', 0.00, 0.00, 0.00, 0.00, 'cm', 0, 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(6, NULL, 4, '12345', 1000.00, 10000.00, 'pcs', 1000.00, 10.00, 20.00, 1.00, NULL, 0.00, 'g', 0.00, 0.00, 0.00, 0.00, 'cm', 0, 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(7, NULL, 4, '123456', 10000.00, 100000.00, 'box', 10000.00, 0.00, 0.00, 10.00, NULL, 0.00, 'g', 0.00, 0.00, 0.00, 0.00, 'cm', 0, 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(8, NULL, 5, NULL, 0.00, 300000.00, 'unit', 0.00, 0.00, 0.00, 1.00, NULL, 0.00, 'g', 0.00, 0.00, 0.00, 0.00, 'cm', 0, 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `item_price_commissions`
--

CREATE TABLE `item_price_commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_price_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum` decimal(20,2) NOT NULL DEFAULT 0.00,
  `minimum` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_multiple` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL DEFAULT 'ITEM_AMOUNT_SELLING',
  `type_nominal` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `accumulation_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `start_date_accumulation` date DEFAULT NULL,
  `end_date_accumulation` date DEFAULT NULL,
  `start_day_accumulation` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `end_day_accumulation` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `start_hour_accumulation` time DEFAULT NULL,
  `end_hour_accumulation` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_price_poins`
--

CREATE TABLE `item_price_poins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_price_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum` decimal(20,2) NOT NULL DEFAULT 0.00,
  `minimum` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_multiple` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL DEFAULT 'ITEM_AMOUNT_SELLING',
  `type_nominal` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `accumulation_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `start_date_accumulation` date DEFAULT NULL,
  `end_date_accumulation` date DEFAULT NULL,
  `start_day_accumulation` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `end_day_accumulation` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `start_hour_accumulation` time DEFAULT NULL,
  `end_hour_accumulation` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_price_promotions`
--

CREATE TABLE `item_price_promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_price_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `used` bigint(20) NOT NULL DEFAULT 0,
  `limit` bigint(20) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_voucher` tinyint(1) NOT NULL DEFAULT 0,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'PENDING',
  `term_minimum_grand_total` decimal(20,2) NOT NULL DEFAULT 0.00,
  `term_minimum_quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type_reward` varchar(50) NOT NULL,
  `poin_type` varchar(50) NOT NULL,
  `poin` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_poin` decimal(20,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) NOT NULL,
  `discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `cashback_type` varchar(50) NOT NULL,
  `cashback` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_cashback` decimal(20,2) NOT NULL DEFAULT 0.00,
  `active_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `start_day` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `end_day` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_hour` time DEFAULT NULL,
  `end_hour` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_price_promotion_discounts`
--

CREATE TABLE `item_price_promotion_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_price_promotion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_price_promotion_free_items`
--

CREATE TABLE `item_price_promotion_free_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_price_promotion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `unit` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_price_promotion_vouchers`
--

CREATE TABLE `item_price_promotion_vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_price_promotion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `voucher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_price_quantities`
--

CREATE TABLE `item_price_quantities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_price_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL,
  `selling_price` decimal(20,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount_credit` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount_debit` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journal_details`
--

CREATE TABLE `journal_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `journal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'CREDIT',
  `description` text DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2007_07_27_122322_create_countries_table', 1),
(2, '2007_07_27_122323_create_provinces_table', 1),
(3, '2007_07_27_122324_create_province_maps_table', 1),
(4, '2007_07_27_122327_create_cities_table', 1),
(5, '2007_07_27_122327_create_city_maps_table', 1),
(6, '2007_07_27_122328_create_warehouses_table', 1),
(7, '2007_07_27_122329_create_warehouse_addresses_table', 1),
(8, '2007_07_27_122330_create_warehouse_address_maps_table', 1),
(9, '2007_07_27_122330_create_warehouse_contacts_table', 1),
(10, '2013_07_05_093412_create_areas_table', 1),
(11, '2013_07_05_093413_create_area_maps_table', 1),
(12, '2013_07_05_093414_create_departments_table', 1),
(13, '2013_07_05_093414_create_divisions_table', 1),
(14, '2013_07_05_093414_create_positions_table', 1),
(15, '2013_07_05_093415_create_expeditions_table', 1),
(16, '2013_07_05_093416_create_expedition_prices_table', 1),
(17, '2013_07_05_093417_create_expedition_destination_maps_table', 1),
(18, '2013_07_05_093418_create_expedition_origin_maps_table', 1),
(19, '2013_07_05_093427_create_group_roles_table', 1),
(20, '2013_07_05_093428_create_roles_table', 1),
(21, '2013_07_05_093433_create_grants_table', 1),
(22, '2013_07_05_093434_create_grant_operators_table', 1),
(23, '2014_10_12_000000_create_users_table', 1),
(24, '2014_10_12_000001_create_user_addresses_table', 1),
(25, '2014_10_12_000002_create_user_address_maps_table', 1),
(26, '2014_10_12_000002_create_user_banks_table', 1),
(27, '2014_10_12_000003_create_user_taxes_table', 1),
(28, '2014_10_12_000004_create_user_contacts_table', 1),
(29, '2014_10_12_000006_create_user_files_table', 1),
(30, '2014_10_12_000007_create_user_shifts_table', 1),
(31, '2014_10_12_000008_create_user_shift_hours_table', 1),
(32, '2014_10_12_000009_create_user_personal_datas_table', 1),
(33, '2014_10_12_000010_create_user_commissions_table', 1),
(34, '2019_12_14_000002_create_chart_of_accounts_table', 1),
(35, '2019_12_14_000003_create_chart_of_account_transactions_table', 1),
(36, '2022_07_05_093544_create_background_processes_table', 1),
(37, '2022_07_05_093545_create_background_process_infos_table', 1),
(38, '2022_07_05_093545_create_notifications_table', 1),
(39, '2022_09_28_092500_create_settings_table', 1),
(40, '2022_09_28_092501_create_setting_codes_table', 1),
(41, '2022_10_03_165627_create_setting_approvals_table', 1),
(42, '2022_11_02_09520_create_units_table', 1),
(43, '2022_11_02_095229_create_suppliers_table', 1),
(44, '2022_11_02_095230_create_supplier_banks_table', 1),
(45, '2022_11_02_095231_create_supplier_addresses_table', 1),
(46, '2022_11_02_095232_create_supplier_address_maps_table', 1),
(47, '2022_11_02_095232_create_supplier_taxes_table', 1),
(48, '2022_11_02_095233_create_supplier_contacts_table', 1),
(49, '2022_11_02_095234_create_supplier_files_table', 1),
(50, '2022_11_02_095235_create_supplier_identities_table', 1),
(51, '2022_11_02_095258_create_customer_groups_table', 1),
(52, '2022_11_02_095606_create_customers_table', 1),
(53, '2022_11_02_095608_create_customer_term_of_payments_table', 1),
(54, '2022_11_02_095609_create_customer_addresses_table', 1),
(55, '2022_11_02_095610_create_customer_address_maps_table', 1),
(56, '2022_11_02_095610_create_customer_contacts_table', 1),
(57, '2022_11_02_095611_create_customer_taxes_table', 1),
(58, '2022_11_02_095612_create_customer_banks_table', 1),
(59, '2022_11_02_095613_create_customer_files_table', 1),
(60, '2022_11_02_095614_create_customer_identities_table', 1),
(61, '2022_11_02_095625_create_item_categories_table', 1),
(62, '2022_11_02_095626_create_items_table', 1),
(63, '2022_11_02_095627_create_item_identities_table', 1),
(64, '2022_11_02_095627_create_item_images_table', 1),
(65, '2022_11_14_165847_create_item_detail_categories_table', 1),
(66, '2022_11_14_165850_create_item_prices_table', 1),
(67, '2022_11_14_165851_create_item_price_commissions_table', 1),
(68, '2022_11_14_165852_create_item_price_poins_table', 1),
(69, '2022_11_14_165853_create_item_price_quantities_table', 1),
(70, '2022_11_14_165854_create_item_price_promotions_table', 1),
(71, '2022_11_14_165855_create_item_price_promotion_free_items_table', 1),
(72, '2022_11_14_165856_create_item_price_promotion_vouchers_table', 1),
(73, '2022_11_14_165857_create_item_price_promotion_discounts_table', 1),
(74, '2022_11_14_165857_create_setting_promotions_table', 1),
(75, '2022_11_14_165858_create_setting_promotion_free_items_table', 1),
(76, '2022_11_14_165859_create_setting_promotion_vouchers_table', 1),
(77, '2022_11_14_165860_create_setting_promotion_discounts_table', 1),
(78, '2023_01_12_153943_create_quotations_table', 1),
(79, '2023_01_12_153944_create_quotation_mutiple_discounts_table', 1),
(80, '2023_01_12_153944_create_quotation_user_approvals_table', 1),
(81, '2023_01_12_153948_create_quotation_details_table', 1),
(82, '2023_01_12_153949_create_quotation_detail_multiple_discounts_table', 1),
(83, '2023_01_16_100400_create_quotation_addionals_table', 1),
(84, '2023_01_16_100411_create_quotation_shippings_table', 1),
(85, '2023_01_16_101246_create_quotation_customer_contacts_table', 1),
(86, '2023_01_16_101251_create_quotation_customer_addresses_table', 1),
(87, '2023_03_18_115001_create_po_customers_table', 1),
(88, '2023_03_18_115002_create_po_customer_multiple_accounts_table', 1),
(89, '2023_03_18_115002_create_po_customer_multiple_discounts_table', 1),
(90, '2023_03_18_115003_create_po_customer_user_approvals_table', 1),
(91, '2023_03_18_115038_create_po_customer_details_table', 1),
(92, '2023_03_18_115039_create_po_customer_detail_multiple_discounts_table', 1),
(93, '2023_03_18_115115_create_po_customer_addionals_table', 1),
(94, '2023_03_18_115129_create_po_customer_shippings_table', 1),
(95, '2023_03_18_115138_create_po_customer_customer_contacts_table', 1),
(96, '2023_03_18_115146_create_po_customer_customer_addresses_table', 1),
(97, '2023_03_23_133852_create_po_suppliers_table', 1),
(98, '2023_03_23_133854_create_po_supplier_multiple_accounts_table', 1),
(99, '2023_03_23_133855_create_po_supplier_multiple_discounts_table', 1),
(100, '2023_03_23_133856_create_po_supplier_user_approvals_table', 1),
(101, '2023_03_23_133902_create_po_supplier_details_table', 1),
(102, '2023_03_23_133903_create_po_supplier_detail_multiple_discounts_table', 1),
(103, '2023_03_23_133915_create_po_supplier_addionals_table', 1),
(104, '2023_03_23_134012_create_po_supplier_supplier_contacts_table', 1),
(105, '2023_03_23_134017_create_po_supplier_supplier_addresses_table', 1),
(106, '2023_03_23_134033_create_purchaseings_table', 1),
(107, '2023_03_23_134034_create_purchaseing_multiple_accounts_table', 1),
(108, '2023_03_23_134034_create_purchaseing_multiple_discounts_table', 1),
(109, '2023_03_23_134041_create_purchaseing_details_table', 1),
(110, '2023_03_23_134042_create_purchaseing_detail_multiple_discounts_table', 1),
(111, '2023_03_23_134045_create_purchaseing_detail_identities_table', 1),
(112, '2023_03_23_134046_create_purchaseing_detail_pcs_table', 1),
(113, '2023_03_23_134057_create_purchaseing_addionals_table', 1),
(114, '2023_03_23_134108_create_purchaseing_supplier_contacts_table', 1),
(115, '2023_03_23_134112_create_purchaseing_supplier_addresses_table', 1),
(116, '2023_03_23_134120_create_purchaseing_debts_table', 1),
(117, '2023_03_23_134121_create_purchaseing_debt_details_table', 1),
(118, '2023_03_23_134121_create_purchaseing_debt_multiple_accounts_table', 1),
(119, '2023_03_23_134200_create_purchaseing_returns_table', 1),
(120, '2023_03_23_134205_create_purchaseing_return_detail_multiple_discounts_table', 1),
(121, '2023_03_23_134205_create_purchaseing_return_details_table', 1),
(122, '2023_03_23_134209_create_purchaseing_return_detail_identities_table', 1),
(123, '2023_03_23_134210_create_purchaseing_return_detail_pcs_table', 1),
(124, '2023_03_23_134348_create_purchaseing_return_contacts_table', 1),
(125, '2023_03_23_134352_create_purchaseing_return_addresses_table', 1),
(126, '2023_03_23_134442_create_sellings_table', 1),
(127, '2023_03_23_134443_create_selling_commission_saleses_table', 1),
(128, '2023_03_23_134443_create_selling_mutliple_discounts_table', 1),
(129, '2023_03_23_134443_create_selling_poins_table', 1),
(130, '2023_03_23_134443_create_selling_promotions_table', 1),
(131, '2023_03_23_134444_create_selling_promotion_items_table', 1),
(132, '2023_03_23_134444_create_selling_promotion_nested_discounts_table', 1),
(133, '2023_03_23_134446_create_selling_details_table', 1),
(134, '2023_03_23_134446_create_selling_multiple_accounts_table', 1),
(135, '2023_03_23_134447_create_selling_detail_commission_saleses_table', 1),
(136, '2023_03_23_134447_create_selling_detail_pcs_table', 1),
(137, '2023_03_23_134448_create_selling_detail_mutliple_discounts_table', 1),
(138, '2023_03_23_134449_create_selling_detail_poins_table', 1),
(139, '2023_03_23_134450_create_selling_detail_identities_table', 1),
(140, '2023_03_23_134452_create_selling_detail_promotions_table', 1),
(141, '2023_03_23_134453_create_selling_detail_promotion_items_table', 1),
(142, '2023_03_23_134453_create_selling_detail_promotion_nested_discounts_table', 1),
(143, '2023_03_23_134506_create_selling_addionals_table', 1),
(144, '2023_03_23_134522_create_selling_shippings_table', 1),
(145, '2023_03_23_134533_create_selling_customer_contacts_table', 1),
(146, '2023_03_23_134537_create_selling_customer_addresses_table', 1),
(147, '2023_03_23_134547_create_selling_receivables_table', 1),
(148, '2023_03_23_134548_create_selling_receivable_details_table', 1),
(149, '2023_03_23_134548_create_selling_receivable_multiple_accounts_table', 1),
(150, '2023_03_23_134558_create_selling_returns_table', 1),
(151, '2023_03_23_134602_create_selling_return_details_table', 1),
(152, '2023_03_23_134603_create_selling_return_detail_multiple_discounts_table', 1),
(153, '2023_03_23_134607_create_selling_return_detail_identities_table', 1),
(154, '2023_03_23_134631_create_selling_return_contacts_table', 1),
(155, '2023_03_23_134636_create_selling_return_addresses_table', 1),
(156, '2023_03_23_134805_create_delivery_orders_table', 1),
(157, '2023_03_23_134813_create_delivery_order_details_table', 1),
(158, '2023_03_23_134919_create_delivery_order_shippings_table', 1),
(159, '2023_03_23_134929_create_delivery_order_customer_contacts_table', 1),
(160, '2023_03_23_134934_create_delivery_order_customer_addresses_table', 1),
(161, '2023_03_23_134935_create_commission_sales_transfers_table', 1),
(162, '2023_03_23_134936_create_commission_sales_transfer_details_table', 1),
(163, '2023_03_23_135036_create_stock_cards_table', 1),
(164, '2023_03_23_135037_create_debt_cards_table', 1),
(165, '2023_03_23_135038_create_receivable_cards_table', 1),
(166, '2023_03_23_135039_create_cost_of_products_sold_cards_table', 1),
(167, '2023_03_23_135040_create_commission_sales_cards_table', 1),
(168, '2023_03_23_135041_create_poin_cards_table', 1),
(169, '2023_03_23_135042_create_warehouse_stocks_table', 1),
(170, '2023_03_23_135045_create_stock_opnames_table', 1),
(171, '2023_03_23_135046_create_stock_opname_details_table', 1),
(172, '2023_03_23_135046_create_stock_opname_identities_table', 1),
(173, '2023_03_23_135047_create_stock_opname_pcs_table', 1),
(174, '2023_03_23_135049_create_stock_mutations_table', 1),
(175, '2023_03_23_135050_create_stock_mutation_details_table', 1),
(176, '2023_03_23_135051_create_stock_mutation_detail_pcs_table', 1),
(177, '2023_03_23_135053_create_stock_outs_table', 1),
(178, '2023_03_23_135057_create_stock_out_details_table', 1),
(179, '2023_03_23_135058_create_stock_out_detail_identities_table', 1),
(180, '2023_03_23_135059_create_stock_out_detail_pcs_table', 1),
(181, '2023_03_23_135105_create_stock_ins_table', 1),
(182, '2023_03_23_135109_create_stock_in_details_table', 1),
(183, '2023_03_23_135110_create_stock_in_detail_identities_table', 1),
(184, '2023_03_23_135120_create_stock_in_detail_pcs_table', 1),
(185, '2023_03_23_135250_create_formula_material_items_table', 1),
(186, '2023_03_23_135255_create_formula_material_item_details_table', 1),
(187, '2023_03_23_135256_create_formula_material_item_steps_table', 1),
(188, '2023_03_23_135317_create_production_divisions_table', 1),
(189, '2023_03_23_135349_create_account_balances_table', 1),
(190, '2023_03_23_135353_create_cash_ins_table', 1),
(191, '2023_03_23_135356_create_cash_in_details_table', 1),
(192, '2023_03_23_135403_create_cash_outs_table', 1),
(193, '2023_03_23_135407_create_cash_out_details_table', 1),
(194, '2023_03_23_135420_create_journals_table', 1),
(195, '2023_03_23_135425_create_journal_details_table', 1),
(196, '2023_03_23_135426_create_cash_mutations_table', 1),
(197, '2023_03_23_135427_create_cash_mutation_details_table', 1),
(198, '2023_06_18_212201_create_receivable_saldo_cards_table', 1),
(199, '2023_06_18_212212_create_debt_saldo_cards_table', 1),
(200, '2023_07_12_211801_create_summary_transactions_table', 1),
(201, '2024_02_17_150131_create_selling_return_detail_pcs_table', 1),
(202, '2024_04_19_112237_create_group_assets_table', 1),
(203, '2024_04_19_112533_create_fixed_assets_table', 1),
(204, '2024_06_26_205511_create_customer_saldo_cards_table', 1),
(205, '2024_07_15_163428_create_user_saldo_cards_table', 1),
(206, '2024_09_28_113538_create_batch_wos_table', 1),
(207, '2024_09_28_113539_create_batch_wo_user_approvals_table', 1),
(208, '2024_09_28_113757_create_batch_wods_table', 1),
(209, '2024_09_28_113803_create_batch_mrs_table', 1),
(210, '2024_09_28_113809_create_batch_mrds_table', 1),
(211, '2024_09_28_113814_create_batch_mrdfs_table', 1),
(212, '2024_09_28_113829_create_batch_mrdf_pcs_table', 1),
(213, '2024_09_28_113837_create_batch_mrd_steps_table', 1),
(214, '2024_09_28_113837_create_batch_mrdf_identities_table', 1),
(215, '2024_09_28_113915_create_batch_pns_table', 1),
(216, '2024_09_28_113924_create_batch_pnds_table', 1),
(217, '2024_09_28_113927_create_batch_pnd_steps_table', 1),
(218, '2024_09_28_113927_create_batch_pndf_identities_table', 1),
(219, '2024_09_28_113927_create_batch_pndf_pcs_table', 1),
(220, '2024_09_28_113927_create_batch_pndfs_table', 1),
(221, '2024_09_28_113940_create_batch_stws_table', 1),
(222, '2024_09_28_113943_create_batch_stwds_table', 1),
(223, '2024_09_28_113947_create_batch_stwd_pcs_table', 1),
(224, '2024_09_28_113952_create_batch_stwd_identities_table', 1),
(225, '2025_03_11_105805_create_batch_stwdfs_table', 1),
(226, '2025_03_11_105844_create_batch_stwdf_identities_table', 1),
(227, '2025_03_11_105855_create_batch_stwdf_pcs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `link` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poin_cards`
--

CREATE TABLE `poin_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `in` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `out` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `poin` bigint(20) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `division_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Karyawan', NULL, '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(2, 2, 'Karyawan', NULL, '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(3, 3, 'Karyawan', NULL, '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(4, 4, 'Karyawan', NULL, '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(5, 5, 'Karyawan', NULL, '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(6, 6, 'Karyawan', NULL, '2025-08-16 01:48:14', '2025-08-16 01:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `po_customers`
--

CREATE TABLE `po_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `quotation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `expired_date` timestamp NULL DEFAULT NULL,
  `total` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `grand_total` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `description` text DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'PROCESS',
  `down_payment` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `receivable` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `change` decimal(20,2) NOT NULL DEFAULT 0.00,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_value_other` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_core_tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `rounding_selling` varchar(50) NOT NULL DEFAULT 'NO_ROUNDING',
  `rounding_divider_selling` decimal(20,2) NOT NULL,
  `is_tax_selling_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_discount_selling_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_connected_sales_selling` tinyint(1) NOT NULL DEFAULT 0,
  `is_show_shipping_selling` tinyint(1) NOT NULL DEFAULT 0,
  `using_down_payment_selling` tinyint(1) NOT NULL DEFAULT 0,
  `is_using_multiple_discount` tinyint(1) NOT NULL DEFAULT 0,
  `is_include_tax_selling` tinyint(1) NOT NULL DEFAULT 1,
  `is_using_multi_payment_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_customer_addionals`
--

CREATE TABLE `po_customer_addionals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `action` varchar(50) NOT NULL DEFAULT 'CREDIT',
  `position` varchar(50) NOT NULL DEFAULT 'AFTER_TOTAL',
  `nominal` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_customer_customer_addresses`
--

CREATE TABLE `po_customer_customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_customer_customer_contacts`
--

CREATE TABLE `po_customer_customer_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_customer_details`
--

CREATE TABLE `po_customer_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `selling_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `tax` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `is_using_tax` tinyint(1) NOT NULL DEFAULT 1,
  `is_free_tax` tinyint(1) NOT NULL DEFAULT 0,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `fullfilled_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `is_using_multiple_discount` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_customer_detail_multiple_discounts`
--

CREATE TABLE `po_customer_detail_multiple_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_customer_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_customer_multiple_accounts`
--

CREATE TABLE `po_customer_multiple_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_customer_multiple_discounts`
--

CREATE TABLE `po_customer_multiple_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_customer_shippings`
--

CREATE TABLE `po_customer_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'NONE',
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `origin` varchar(200) DEFAULT NULL,
  `destination` varchar(200) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `reciept_number` varchar(100) DEFAULT NULL,
  `estimation_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_customer_user_approvals`
--

CREATE TABLE `po_customer_user_approvals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_suppliers`
--

CREATE TABLE `po_suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `expired_date` timestamp NULL DEFAULT NULL,
  `total` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `grand_total` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'PROCESS',
  `down_payment` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `receivable` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `change` decimal(20,2) NOT NULL DEFAULT 0.00,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_value_other` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_core_tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_tax_purchaseing_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_discount_purchaseing_active` tinyint(1) NOT NULL DEFAULT 1,
  `using_down_payment_purchaseing` tinyint(1) NOT NULL DEFAULT 0,
  `is_using_multiple_discount` tinyint(1) NOT NULL DEFAULT 0,
  `is_include_tax_selling` tinyint(1) NOT NULL DEFAULT 1,
  `is_using_multi_payment_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_supplier_addionals`
--

CREATE TABLE `po_supplier_addionals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `action` varchar(50) NOT NULL DEFAULT 'CREDIT',
  `position` varchar(50) NOT NULL DEFAULT 'AFTER_TOTAL',
  `nominal` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_supplier_details`
--

CREATE TABLE `po_supplier_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `selling_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `tax` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `is_using_tax` tinyint(1) NOT NULL DEFAULT 1,
  `is_free_tax` tinyint(1) NOT NULL DEFAULT 0,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `is_using_multiple_discount` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_supplier_detail_multiple_discounts`
--

CREATE TABLE `po_supplier_detail_multiple_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_supplier_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_supplier_multiple_accounts`
--

CREATE TABLE `po_supplier_multiple_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_supplier_multiple_discounts`
--

CREATE TABLE `po_supplier_multiple_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_supplier_supplier_addresses`
--

CREATE TABLE `po_supplier_supplier_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_supplier_supplier_contacts`
--

CREATE TABLE `po_supplier_supplier_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_supplier_user_approvals`
--

CREATE TABLE `po_supplier_user_approvals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_divisions`
--

CREATE TABLE `production_divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` enum('JOB','OVERHEAT') NOT NULL DEFAULT 'JOB',
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `due_date_minute` int(11) NOT NULL DEFAULT 0,
  `due_date_hour` int(11) NOT NULL DEFAULT 0,
  `due_date_day` int(11) NOT NULL DEFAULT 0,
  `due_date_month` int(11) NOT NULL DEFAULT 0,
  `due_date_year` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Jawa Timur', NULL, NULL),
(2, 'Jawa Barat', NULL, NULL),
(3, 'Jawa Tengah', NULL, NULL),
(4, 'Sumatera Utara', NULL, NULL),
(5, 'Sulawesi Selatan', NULL, NULL),
(6, 'Banten', NULL, NULL),
(7, 'Nusa Tenggara Timur', NULL, NULL),
(8, 'Lampung', NULL, NULL),
(9, 'Sumatera Selatan', NULL, NULL),
(10, 'Sumatera Barat', NULL, NULL),
(11, 'Aceh', NULL, NULL),
(12, 'Riau', NULL, NULL),
(13, 'Nusa Tenggara Barat', NULL, NULL),
(14, 'Kalimantan Barat', NULL, NULL),
(15, 'D.K.I. Jakarta', NULL, NULL),
(16, 'Kalimantan Selatan', NULL, NULL),
(17, 'D.I. Yogyakarta', NULL, NULL),
(18, 'Sulawesi Tengah', NULL, NULL),
(19, 'Jambi', NULL, NULL),
(20, 'Kalimantan Tengah', NULL, NULL),
(21, 'Sulawesi Tenggara', NULL, NULL),
(22, 'Sulawesi Utara', NULL, NULL),
(23, 'Kalimantan Timur', NULL, NULL),
(24, 'Papua', NULL, NULL),
(25, 'Bali', NULL, NULL),
(26, 'Maluku', NULL, NULL),
(27, 'Bengkulu', NULL, NULL),
(28, 'Sulawesi Barat', NULL, NULL),
(29, 'Maluku Utara', NULL, NULL),
(30, 'Gorontalo', NULL, NULL),
(31, 'Kepulauan Riau', NULL, NULL),
(32, 'Papua Barat', NULL, NULL),
(33, 'Kepulauan Bangka Belitung', NULL, NULL),
(34, 'Kalimantan Utara', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `province_maps`
--

CREATE TABLE `province_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `province_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zoom` int(11) NOT NULL DEFAULT 0,
  `lat` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `lng` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseings`
--

CREATE TABLE `purchaseings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `po_supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `debt_due_date` timestamp NULL DEFAULT NULL,
  `total` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `grand_total` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'DONE',
  `payed` decimal(20,2) NOT NULL DEFAULT 0.00,
  `debt` decimal(20,2) NOT NULL DEFAULT 0.00,
  `change` decimal(20,2) NOT NULL DEFAULT 0.00,
  `change_debt_supplier` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_value_other` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_core_tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_tax_purchaseing_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_discount_purchaseing_active` tinyint(1) NOT NULL DEFAULT 1,
  `proses_stock_through_purchaseing` tinyint(1) NOT NULL DEFAULT 1,
  `is_using_multiple_discount` tinyint(1) NOT NULL DEFAULT 0,
  `is_include_tax_selling` tinyint(1) NOT NULL DEFAULT 1,
  `is_using_multi_payment_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_addionals`
--

CREATE TABLE `purchaseing_addionals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `action` varchar(50) NOT NULL DEFAULT 'CREDIT',
  `position` varchar(50) NOT NULL DEFAULT 'AFTER_TOTAL',
  `nominal` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_debts`
--

CREATE TABLE `purchaseing_debts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_debt_details`
--

CREATE TABLE `purchaseing_debt_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_debt_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchaseing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change` decimal(20,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `credit_note` decimal(20,2) NOT NULL DEFAULT 0.00,
  `debit_note` decimal(20,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `is_using_debt_supplier_saldo` tinyint(1) NOT NULL DEFAULT 0,
  `is_using_multi_payment_purchaseing` tinyint(1) NOT NULL DEFAULT 0,
  `debt_supplier_saldo` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_debt_detail_multiple_accounts`
--

CREATE TABLE `purchaseing_debt_detail_multiple_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_debt_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_details`
--

CREATE TABLE `purchaseing_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_supplier_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `selling_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `tax` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `is_using_tax` tinyint(1) NOT NULL DEFAULT 1,
  `is_free_tax` tinyint(1) NOT NULL DEFAULT 0,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `is_using_multiple_discount` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_detail_identities`
--

CREATE TABLE `purchaseing_detail_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_detail_multiple_discounts`
--

CREATE TABLE `purchaseing_detail_multiple_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_detail_pcs`
--

CREATE TABLE `purchaseing_detail_pcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_multiple_accounts`
--

CREATE TABLE `purchaseing_multiple_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_multiple_discounts`
--

CREATE TABLE `purchaseing_multiple_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_returns`
--

CREATE TABLE `purchaseing_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `purchaseing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `grand_total` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `debt` decimal(20,2) NOT NULL DEFAULT 0.00,
  `payed` decimal(20,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `description` text DEFAULT NULL,
  `is_using_debt_supplier_saldo` tinyint(1) NOT NULL DEFAULT 0,
  `debt_supplier_saldo` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `document` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'DONE',
  `tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_value_other` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_core_tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_tax_purchaseing_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_discount_purchaseing_active` tinyint(1) NOT NULL DEFAULT 1,
  `proses_stock_through_purchaseing` tinyint(1) NOT NULL DEFAULT 1,
  `is_include_tax_selling` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_return_addresses`
--

CREATE TABLE `purchaseing_return_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_return_contacts`
--

CREATE TABLE `purchaseing_return_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_return_details`
--

CREATE TABLE `purchaseing_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchaseing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchaseing_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `selling_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `tax` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `is_using_tax` tinyint(1) NOT NULL DEFAULT 1,
  `is_free_tax` tinyint(1) NOT NULL DEFAULT 0,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `is_using_multiple_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_header` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_return_detail_identities`
--

CREATE TABLE `purchaseing_return_detail_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_return_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_return_detail_multiple_discounts`
--

CREATE TABLE `purchaseing_return_detail_multiple_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_return_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_return_detail_pcs`
--

CREATE TABLE `purchaseing_return_detail_pcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_return_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_supplier_addresses`
--

CREATE TABLE `purchaseing_supplier_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseing_supplier_contacts`
--

CREATE TABLE `purchaseing_supplier_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `expired_date` timestamp NULL DEFAULT NULL,
  `total` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `grand_total` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `description` text DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `revision_number` bigint(20) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'PENDING',
  `tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_value_other` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_core_tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `rounding_selling` varchar(50) NOT NULL DEFAULT 'NO_ROUNDING',
  `rounding_divider_selling` decimal(20,2) NOT NULL,
  `is_tax_selling_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_discount_selling_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_include_tax_selling` tinyint(1) NOT NULL DEFAULT 1,
  `is_connected_sales_selling` tinyint(1) NOT NULL DEFAULT 0,
  `is_show_shipping_selling` tinyint(1) NOT NULL DEFAULT 0,
  `is_using_multiple_discount` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_addionals`
--

CREATE TABLE `quotation_addionals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `action` varchar(50) NOT NULL DEFAULT 'CREDIT',
  `position` varchar(50) NOT NULL DEFAULT 'AFTER_TOTAL',
  `nominal` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_customer_addresses`
--

CREATE TABLE `quotation_customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_customer_contacts`
--

CREATE TABLE `quotation_customer_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_details`
--

CREATE TABLE `quotation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `selling_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `tax` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `is_using_tax` tinyint(1) NOT NULL DEFAULT 1,
  `is_free_tax` tinyint(1) NOT NULL DEFAULT 0,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `is_using_multiple_discount` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_detail_multiple_discounts`
--

CREATE TABLE `quotation_detail_multiple_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_multiple_discounts`
--

CREATE TABLE `quotation_multiple_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_shippings`
--

CREATE TABLE `quotation_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'NONE',
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `origin` varchar(200) DEFAULT NULL,
  `destination` varchar(200) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `reciept_number` varchar(100) DEFAULT NULL,
  `estimation_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_user_approvals`
--

CREATE TABLE `quotation_user_approvals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quotation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receivable_cards`
--

CREATE TABLE `receivable_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `in` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `out` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `receivable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receivable_saldo_cards`
--

CREATE TABLE `receivable_saldo_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `in` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `out` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `receivable_saldo` decimal(20,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_using_finance` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `table` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `icon` varchar(50) NOT NULL DEFAULT 'scroll',
  `show` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `parent_id`, `name`, `table`, `title`, `icon`, `show`, `created_at`, `updated_at`) VALUES
(1, NULL, 'dashboard-module', NULL, 'Dashboard', 'gauge', 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(2, 1, 'dashboard', NULL, 'Dashboard', 'gauge', 0, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(3, NULL, 'master', NULL, 'Master', 'brain', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(4, 3, 'warehouse', 'warehouses', 'Gudang', 'warehouse', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(5, 3, 'supplier', 'suppliers', 'Pemasok', 'parachute-box', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(6, 3, 'customer-group', 'customer_groups', 'Kelompok Pelanggan', 'th', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(7, 3, 'customer', 'customers', 'Pelanggan', 'user', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(8, 3, 'area', 'areas', 'Wilayah', 'map', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(9, 3, 'item-category', 'item_categories', 'Kategori Item', 'rectangle-list', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(10, 3, 'unit', 'units', 'Satuan', 'tag', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(11, 3, 'expedition', 'expeditions', 'Expedisi', 'road', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(12, 3, 'seller', 'users', 'Sales', 'users', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(13, 3, 'item', 'items', 'Item', 'box', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(14, NULL, 'marketing', NULL, 'Pemasaran', 'ranking-star', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(15, 14, 'quotation', 'quotations', 'Penawaran', 'handshake', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(16, 14, 'po-customer', 'po_customers', 'Pesanan Pelanggan', 'file-invoice-dollar', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(17, 14, 'work-order', 'work_orders', 'Surat Perintah Kerja', 'mitten', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(18, 14, 'promotion-item', 'item_price_promotions', 'Promosi Item', 'percentage', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(19, 14, 'promotion', 'setting_promotions', 'Promosi', 'percentage', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(20, NULL, 'purchaseing-module', NULL, 'Pembelian', 'hand-holding-usd', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(21, 20, 'po-supplier', 'po_suppliers', 'Pesanan Pembelian', 'truck-moving', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(22, 20, 'purchaseing', 'purchaseings', 'Pembelian', 'cart-shopping', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(23, 20, 'purchaseing-return', 'purchaseing_returns', 'Retur Pembelian', 'hand-holding', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(24, 20, 'purchaseing-list-debt', 'purchasieng-debts', 'Daftar Hutang', 'comment-dollar', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(25, 20, 'purchaseing-debt', 'purchaseing_debts', 'Pembayaran Hutang', 'comments-dollar', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(26, NULL, 'selling-module', NULL, 'Penjualan', 'shop', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(27, 26, 'selling', 'sellings', 'Penjualan', 'store', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(28, 26, 'selling-return', 'selling_returns', 'Retur Penjualan', 'hand-holding', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(29, 26, 'selling-list-receivable', 'selling_list_reveivables', 'Daftar Piutang', 'search-dollar', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(30, 26, 'selling-receivable', 'selling_receivables', 'Pembayaran Piutang', 'comments-dollar', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(31, 26, 'delivery-order', 'delivery_orders', 'Pengiriman Ke Pelanggan', 'truck-front', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(32, 26, 'commission-sales-transfer', 'commission_sales_transfers', 'Pembayaran Komisi Sales', 'money-bills', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(33, 26, 'export-tax', NULL, 'Export Pajak', 'clipboard', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(34, NULL, 'inventory', NULL, 'Persediaan', 'cart-flatbed', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(35, 34, 'stock', 'stocks', 'Stok', 'cubes', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(36, 34, 'stock-cost-of-products-sold', NULL, 'Nilai Barang', 'cubes-stacked', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(37, 34, 'stock-identity', NULL, 'Identitas Stok', 'passport', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(38, 34, 'stock-card', 'stock_cards', 'Kartu Stok', 'th', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(39, 34, 'stock-opname', 'stock_opnames', 'Penyesuaian Stok', 'th-list', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(40, 34, 'stock-mutation', 'stock_mutations', 'Mutasi Stok', 'arrows-left-right', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(41, 34, 'stock-in', 'stock_ins', 'Stok Masuk', 'sign-in-alt', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(42, 34, 'stock-out', 'stock_outs', 'Stok Keluar', 'sign-out-alt', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(43, 34, 'stock-production-code', NULL, 'Kode Produksi', 'key', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(44, NULL, 'manufactur', NULL, 'Manufaktur', 'industry', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(45, 44, 'formula-material-item', 'formula_material_items', 'Rumus Bahan Baku Item', 'bong', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(46, 44, 'material-requirement', 'material_requirements', 'Kebutuhan Bahan Baku', 'book', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(47, 44, 'production', 'productions', 'Produksi', 'people-carry-box', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(48, 44, 'sent-to-warehouse', 'sent_to_warehouses', 'Kirim Ke Gudang', 'truck-ramp-box', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(49, NULL, 'finance', NULL, 'Keuangan', 'dollar-sign', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(50, 49, 'chart-of-account', 'chart_of_accounts', 'Akun', 'th-list', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(51, 49, 'chart-of-account-transaction', 'chart_of_account_transactions', 'Transaksi Akun', 'arrows-rotate', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(52, 49, 'journal', 'journals', 'Jurnal', 'search-dollar', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(53, 49, 'cash-in', 'cash_ins', 'Penerimaan Kas', 'wallet', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(54, 49, 'cash-out', 'cash_outs', 'Pengeluaran Kas', 'money-bill-trend-up', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(55, 49, 'cash-mutation', 'cash_mutations', 'Mutasi Kas', 'money-bill-transfer', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(56, 49, 'general-ledger', NULL, 'Buku Besar', 'money-check', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(57, 49, 'balance', NULL, 'Neraca Saldo', 'money-bill-wave-alt', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(58, 49, 'profit-and-lose', NULL, 'Laba / Rugi', 'dollar-sign', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(59, 49, 'modal-change', NULL, 'Perubahan Modal', 'circle-dollar-to-slot', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(60, NULL, 'report', NULL, 'Laporan', 'clipboard', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(61, 60, 'customer-report', NULL, 'Pelanggan', 'user', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(62, 60, 'supplier-report', NULL, 'Pemasok', 'parachute-box', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(63, 60, 'purchaseing-report', NULL, 'Pembelian', 'cart-shopping', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(64, 60, 'selling-report', NULL, 'Penjualan', 'store', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(65, 60, 'seller-report', NULL, 'Sales', 'users', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(66, 60, 'finance-report', NULL, 'Keuangan', 'dollar-sign', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(67, 60, 'stock-report', NULL, 'Stok', 'warehouse', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(68, 60, 'manufactur-report', NULL, 'Manufaktur', 'industry', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(69, NULL, 'depreciation', NULL, 'Asset Tetap', 'university', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(70, 69, 'group-asset', 'group_assets', 'Kelompok Harta', 'object-group', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(71, 69, 'fixed-asset', 'fixed_assets', 'Asset', 'crop', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13'),
(72, 69, 'depreciation-calculation', NULL, 'Penyusutan Asset', 'plus-square', 1, '2025-08-16 01:48:13', '2025-08-16 01:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `sellings`
--

CREATE TABLE `sellings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `receivable_due_date` timestamp NULL DEFAULT NULL,
  `total` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `grand_total` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'DONE',
  `payed` decimal(20,2) NOT NULL DEFAULT 0.00,
  `receivable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `change` decimal(20,2) NOT NULL DEFAULT 0.00,
  `change_receivable_customer` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_value_other` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_core_tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_tax_selling_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_discount_selling_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_show_shipping_selling` tinyint(1) NOT NULL DEFAULT 0,
  `is_poin_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_connected_sales_selling` tinyint(1) NOT NULL DEFAULT 0,
  `is_commission_sales_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_using_multiple_discount` tinyint(1) NOT NULL DEFAULT 0,
  `is_include_tax_selling` tinyint(1) NOT NULL DEFAULT 1,
  `is_using_multi_payment_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_addionals`
--

CREATE TABLE `selling_addionals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `action` varchar(50) NOT NULL DEFAULT 'CREDIT',
  `position` varchar(50) NOT NULL DEFAULT 'AFTER_TOTAL',
  `nominal` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_commission_saleses`
--

CREATE TABLE `selling_commission_saleses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type_commission_sales` varchar(50) NOT NULL DEFAULT 'GRAND_TOTAL',
  `type_nominal_commission_sales` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `nominal_commission_sales` decimal(20,2) NOT NULL DEFAULT 0.00,
  `minimum_commission_sales` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_commission_sales` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_multiple_commission_sales` tinyint(1) NOT NULL DEFAULT 0,
  `total_commission_sales` int(11) NOT NULL DEFAULT 0,
  `accumulation_commission_sales_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `start_day_accumulation_commission_sales` varchar(50) DEFAULT NULL,
  `end_day_accumulation_commission_sales` varchar(50) DEFAULT NULL,
  `start_hour_accumulation_commission_sales` varchar(50) DEFAULT NULL,
  `end_hour_accumulation_commission_sales` varchar(50) DEFAULT NULL,
  `start_date_accumulation_commission_sales` varchar(50) DEFAULT NULL,
  `end_date_accumulation_commission_sales` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_customer_addresses`
--

CREATE TABLE `selling_customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_customer_contacts`
--

CREATE TABLE `selling_customer_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_details`
--

CREATE TABLE `selling_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_customer_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `selling_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `tax` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `is_using_tax` tinyint(1) NOT NULL DEFAULT 1,
  `is_free_tax` tinyint(1) NOT NULL DEFAULT 0,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00000000000000,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `is_using_multiple_discount` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_detail_commission_saleses`
--

CREATE TABLE `selling_detail_commission_saleses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type_commission_sales` varchar(50) NOT NULL DEFAULT 'GRAND_TOTAL',
  `type_nominal_commission_sales` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `nominal_commission_sales` decimal(20,2) NOT NULL DEFAULT 0.00,
  `minimum_commission_sales` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_commission_sales` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_multiple_commission_sales` tinyint(1) NOT NULL DEFAULT 0,
  `total_commission_sales` int(11) NOT NULL DEFAULT 0,
  `accumulation_commission_sales_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `start_day_accumulation_commission_sales` varchar(50) DEFAULT NULL,
  `end_day_accumulation_commission_sales` varchar(50) DEFAULT NULL,
  `start_hour_accumulation_commission_sales` varchar(50) DEFAULT NULL,
  `end_hour_accumulation_commission_sales` varchar(50) DEFAULT NULL,
  `start_date_accumulation_commission_sales` varchar(50) DEFAULT NULL,
  `end_date_accumulation_commission_sales` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_detail_identities`
--

CREATE TABLE `selling_detail_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_detail_multiple_discounts`
--

CREATE TABLE `selling_detail_multiple_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_detail_pcs`
--

CREATE TABLE `selling_detail_pcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_detail_poins`
--

CREATE TABLE `selling_detail_poins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type_poin` varchar(50) NOT NULL DEFAULT 'GRAND_TOTAL',
  `type_nominal_poin` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `nominal_poin` decimal(20,2) NOT NULL DEFAULT 0.00,
  `minimum_poin` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_poin` int(11) NOT NULL DEFAULT 0,
  `is_multiple_poin` tinyint(1) NOT NULL DEFAULT 0,
  `total_poin` int(11) NOT NULL DEFAULT 0,
  `accumulation_poin_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `start_day_accumulation_poin` varchar(50) DEFAULT NULL,
  `end_day_accumulation_poin` varchar(50) DEFAULT NULL,
  `start_hour_accumulation_poin` varchar(50) DEFAULT NULL,
  `end_hour_accumulation_poin` varchar(50) DEFAULT NULL,
  `start_date_accumulation_poin` varchar(50) DEFAULT NULL,
  `end_date_accumulation_poin` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_detail_promotions`
--

CREATE TABLE `selling_detail_promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `term_minimum_grand_total` decimal(20,2) NOT NULL DEFAULT 0.00,
  `term_minimum_quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type_reward` varchar(50) NOT NULL DEFAULT 'DISCOUNT',
  `discount_type` varchar(50) NOT NULL,
  `discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `poin_type` varchar(50) NOT NULL,
  `poin` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_poin` decimal(20,2) NOT NULL DEFAULT 0.00,
  `active_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `start_day` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `end_day` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_hour` time DEFAULT NULL,
  `end_hour` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_detail_promotion_items`
--

CREATE TABLE `selling_detail_promotion_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_detail_promotion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `selling_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_detail_promotion_nested_discounts`
--

CREATE TABLE `selling_detail_promotion_nested_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_detail_promotion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_multiple_accounts`
--

CREATE TABLE `selling_multiple_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_multiple_discounts`
--

CREATE TABLE `selling_multiple_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_poins`
--

CREATE TABLE `selling_poins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `poin_to_nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `accept_amount_poin` int(11) NOT NULL DEFAULT 0,
  `customer_non_member_reward_poin` tinyint(1) NOT NULL DEFAULT 0,
  `type_poin` varchar(50) NOT NULL DEFAULT 'GRAND_TOTAL',
  `type_nominal_poin` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `nominal_poin` decimal(20,2) NOT NULL DEFAULT 0.00,
  `minimum_poin` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_poin` int(11) NOT NULL DEFAULT 0,
  `is_multiple_poin` tinyint(1) NOT NULL DEFAULT 0,
  `total_poin` int(11) NOT NULL DEFAULT 0,
  `accumulation_poin_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `start_day_accumulation_poin` varchar(50) DEFAULT NULL,
  `end_day_accumulation_poin` varchar(50) DEFAULT NULL,
  `start_hour_accumulation_poin` varchar(50) DEFAULT NULL,
  `end_hour_accumulation_poin` varchar(50) DEFAULT NULL,
  `start_date_accumulation_poin` varchar(50) DEFAULT NULL,
  `end_date_accumulation_poin` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_promotions`
--

CREATE TABLE `selling_promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `term_minimum_grand_total` decimal(20,2) NOT NULL DEFAULT 0.00,
  `term_minimum_quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type_reward` varchar(50) NOT NULL DEFAULT 'DISCOUNT',
  `discount_type` varchar(50) NOT NULL,
  `discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `poin_type` varchar(50) NOT NULL,
  `poin` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_poin` decimal(20,2) NOT NULL DEFAULT 0.00,
  `active_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `start_day` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `end_day` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_hour` time DEFAULT NULL,
  `end_hour` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_promotion_items`
--

CREATE TABLE `selling_promotion_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_promotion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `selling_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_promotion_nested_discounts`
--

CREATE TABLE `selling_promotion_nested_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_promotion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_receivables`
--

CREATE TABLE `selling_receivables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_receivable_details`
--

CREATE TABLE `selling_receivable_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_receivable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change` decimal(20,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `credit_note` decimal(20,2) NOT NULL DEFAULT 0.00,
  `debit_note` decimal(20,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `is_using_receivable_customer_saldo` tinyint(1) NOT NULL DEFAULT 0,
  `is_using_multi_payment_selling` tinyint(1) NOT NULL DEFAULT 0,
  `receivable_customer_saldo` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_receivable_detail_multiple_accounts`
--

CREATE TABLE `selling_receivable_detail_multiple_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_receivable_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_returns`
--

CREATE TABLE `selling_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `grand_total` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `receivable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `payed` decimal(20,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) NOT NULL DEFAULT 'NOMINAL',
  `description` text DEFAULT NULL,
  `is_using_receivable_customer_saldo` tinyint(1) NOT NULL DEFAULT 0,
  `receivable_customer_saldo` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `document` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'DONE',
  `tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_value_other` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_core_tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_tax_selling_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_discount_selling_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_include_tax_selling` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_return_addresses`
--

CREATE TABLE `selling_return_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_return_contacts`
--

CREATE TABLE `selling_return_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_return_details`
--

CREATE TABLE `selling_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `selling_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `selling_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `tax` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `is_using_tax` tinyint(1) NOT NULL DEFAULT 1,
  `is_free_tax` tinyint(1) NOT NULL DEFAULT 0,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00000000000000,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `is_using_multiple_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_header` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_return_detail_identities`
--

CREATE TABLE `selling_return_detail_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_return_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_return_detail_multiple_discounts`
--

CREATE TABLE `selling_return_detail_multiple_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_return_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(20,2) NOT NULL DEFAULT 0.00,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_return_detail_pcs`
--

CREATE TABLE `selling_return_detail_pcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_return_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_shippings`
--

CREATE TABLE `selling_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `selling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'NONE',
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `origin` varchar(200) DEFAULT NULL,
  `destination` varchar(200) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `reciept_number` varchar(100) DEFAULT NULL,
  `estimation_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'unique_name', 'gampang-erp-12345', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(2, 'is_data_application_already_reset', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(3, 'name', 'Marlin Pos', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(4, 'address', 'Berkantor di Perumahan Graha Harmony 1. Bulakrejo, Kec. Sukoharjo, Kabupaten Sukoharjo, Jawa Tengah 57551', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(5, 'maps', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(6, 'email', 'marlinpos@marlinpos.id', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(7, 'phone', '+6281335344967', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(8, 'website', 'https://marlinpos.id', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(9, 'logo', 'defualt.png', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(10, 'logo_print', 'default.png', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(11, 'customer_card', 'default.png', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(12, 'employe_card', 'default.png', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(13, 'account_facebook', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(14, 'account_youtube', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(15, 'account_tiktok', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(16, 'account_instagram', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(17, 'account_twitter', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(18, 'account_linkedin', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(19, 'is_term_of_payment_active', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(20, 'term_of_payment_amount_total_invoice', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(21, 'term_of_payment_grand_total_invoice', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(22, 'term_of_payment_date', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(23, 'supplier_term_of_payment_amount_total_invoice', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(24, 'supplier_term_of_payment_grand_total_invoice', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(25, 'supplier_term_of_payment_date', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(26, 'tax', '11', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(27, 'tax_number', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(28, 'tax_verified_date', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(29, 'language', 'Indonesia', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(30, 'timezone', 'Asia/Jakarta', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(31, 'format_date', 'dd/mm/yyyy', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(32, 'format_time', '24 Jam', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(33, 'format_decimal', '2', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(34, 'format_nominal', '1.000,00', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(35, 'currency', 'IDR', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(36, 'currency_symbol', 'Rp', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(37, 'currency_symbol_position', 'PREFIX', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(38, 'auto_update_purchase_price_purchaseing', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(39, 'show_image_purchaseing', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(40, 'is_discount_purchaseing_active', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(41, 'item_price_changeable_purchaseing', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(42, 'default_supplier_purchaseing', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(43, 'input_template_supplier_purchaseing', '[NAMA]', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(44, 'default_warehouse_purchaseing', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(45, 'input_template_warehouse_purchaseing', '[NAMA]', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(46, 'is_tax_purchaseing_active', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(47, 'proses_stock_through_purchaseing', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(48, 'show_item_price_before_purchaseing', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(49, 'using_down_payment_purchaseing', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(50, 'show_stock_purchaseing', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(51, 'default_discount_type_purchaseing', 'NOMINAL', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(52, 'auto_update_selling_price_selling', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(53, 'show_image_selling', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(54, 'is_discount_selling_active', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(55, 'item_price_changeable_selling', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(56, 'is_tax_selling_active', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(57, 'rounding_selling', 'NO_ROUNDING', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(58, 'rounding_divider_selling', '1000', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(59, 'default_customer_selling', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(60, 'input_template_customer_selling', '[NAMA]', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(61, 'default_warehouse_selling', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(62, 'input_template_warehouse_selling', '[NAMA]', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(63, 'using_down_payment_selling', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(64, 'show_stock_selling', '1', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(65, 'hide_stock_when_zero_selling', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(66, 'default_discount_type_selling', 'NOMINAL', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(67, 'show_margin_profit_selling', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(68, 'is_connected_sales_selling', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(69, 'is_show_shipping_selling', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(70, 'transaction_shortcut_keyboard', '[{\"keyboard\":\"shift+h\",\"name\":\"show-shortcut-keyboard\",\"title\":\"Tampilkan Jalan Pintas Keyboard\"},{\"keyboard\":\"shift+b\",\"name\":\"show-badge-grand-total\",\"title\":\"Tampilkan Lencana Grand Total\"},{\"keyboard\":\"shift+s\",\"name\":\"show-setting\",\"title\":\"Tampilkan Pengaturan\"},{\"keyboard\":\"shift+r\",\"name\":\"show-revision-quotation\",\"title\":\"Tampilkan Revisi Penawaran\"},{\"keyboard\":\"ctrl+shift+r\",\"name\":\"revision-quotation\",\"title\":\"Kirim Revisi Penawaran\"},{\"keyboard\":\"ctrl+alt+r\",\"name\":\"revision-quotation-print\",\"title\":\"Kirim Revisi Penawaran Dan Print\"},{\"keyboard\":\"shift+d\",\"name\":\"draft\",\"title\":\"Kirim Sebagai Konsep\"},{\"keyboard\":\"ctrl+shift+d\",\"name\":\"search-draft\",\"title\":\"Mencari Sebagai Konsep\"},{\"keyboard\":\"shift+i\",\"name\":\"show-addional-information\",\"title\":\"Tampilkan Informasi Tambahan\"},{\"keyboard\":\"shift+c\",\"name\":\"show-customer-info\",\"title\":\"Tampilkan Info Pelanggan\"},{\"keyboard\":\"ctrl+shift+c\",\"name\":\"search-customer\",\"title\":\"Mencari Pelanggan\"},{\"keyboard\":\"ctrl+shift+alt+c\",\"name\":\"focus-to-cursor-search-customer\",\"title\":\"Fokus Kursor Ke Mencari Pelanggan\"},{\"keyboard\":\"shift+w\",\"name\":\"show-warehouse-info\",\"title\":\"Tampilkan Info Gudang\"},{\"keyboard\":\"ctrl+shift+e\",\"name\":\"search-warehouse\",\"title\":\"Mencari Gudang\"},{\"keyboard\":\"ctrl+shift+alt+w\",\"name\":\"focus-to-cursor-search-warehouse\",\"title\":\"Fokus Kursor Ke Mencari Gudang\"},{\"keyboard\":\"shift+u\",\"name\":\"show-supplier-info\",\"title\":\"Tampilkan Info Pemasok\"},{\"keyboard\":\"ctrl+shift+y\",\"name\":\"search-supplier\",\"title\":\"Mencari Pemasok\"},{\"keyboard\":\"ctrl+shift+alt+u\",\"name\":\"focus-to-cursor-search-supplier\",\"title\":\"Fokus Kursor Ke Mencari Pemasok\"},{\"keyboard\":\"f1\",\"name\":\"search-item\",\"title\":\"Mencari Item\"},{\"keyboard\":\"ctrl+f1\",\"name\":\"focus-to-cursor-search-item\",\"title\":\"Fokus Kursor Ke Mencari Item\"},{\"keyboard\":\"shift+f1\",\"name\":\"add-row-item\",\"title\":\"Tambah baris Item\"},{\"keyboard\":\"shift+f2\",\"name\":\"delete-all-item\",\"title\":\"Hapus Semua Item\"},{\"keyboard\":\"shift+f3\",\"name\":\"show-total-information-item\",\"title\":\"Tampilkan Informasi Total Item\"},{\"keyboard\":\"f2\",\"name\":\"show-after-total\",\"title\":\"Tampilkan Biaya Setelah Total\"},{\"keyboard\":\"f3\",\"name\":\"show-before-grand-total\",\"title\":\"Tampilkan Biaya Sebelum Grand Total\"},{\"keyboard\":\"f4\",\"name\":\"send-data\",\"title\":\"Mengirim Data\"},{\"keyboard\":\"f6\",\"name\":\"send-data-and-print\",\"title\":\"Mengirim Data Dan Print\"},{\"keyboard\":\"f7\",\"name\":\"reset-data\",\"title\":\"Reset Data\"},{\"keyboard\":\"f8\",\"name\":\"payment\",\"title\":\"Bayar\"},{\"keyboard\":\"f9\",\"name\":\"send-data-and-edit\",\"title\":\"Mengirim Data Dan Edit\"},{\"keyboard\":\"ctrl+1\",\"name\":\"delete-item\",\"title\":\"Hapus Item\"},{\"keyboard\":\"ctrl+2\",\"name\":\"show-detail-information-item\",\"title\":\"Tampilkkan Informasi Item Detail\"},{\"keyboard\":\"ctrl+3\",\"name\":\"change-item-price\",\"title\":\"Ubah Item Harga\"},{\"keyboard\":\"ctrl+4\",\"name\":\"change-item-unit\",\"title\":\"Ubah Item Satuan\"},{\"keyboard\":\"ctrl+5\",\"name\":\"change-item-quantity\",\"title\":\"Ubah Item Jumlah\"}]', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(71, 'is_poin_active', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(72, 'poin_to_nominal', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(73, 'accept_amount_poin', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(74, 'customer_non_member_reward_poin', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(75, 'reset_poin', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(76, 'is_minus_poin_reset', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(77, 'reset_poin_when', 'START_OF_MONTH', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(78, 'type_poin', 'GRAND_TOTAL', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(79, 'poin_exchange_type', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(80, 'start_day_exchange_poin', 'MONDAY', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(81, 'end_day_exchange_poin', 'MONDAY', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(82, 'start_date_exchange_poin', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(83, 'end_date_exchange_poin', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(84, 'start_hour_exchange_poin', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(85, 'end_hour_exchange_poin', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(86, 'type_nominal_poin', 'NOMINAL', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(87, 'nominal_poin', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(88, 'minimum_poin', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(89, 'maximum_poin', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(90, 'is_multiple_poin', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(91, 'accumulation_poin_type', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(92, 'start_day_accumulation_poin', 'MONDAY', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(93, 'end_day_accumulation_poin', 'MONDAY', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(94, 'start_date_accumulation_poin', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(95, 'end_date_accumulation_poin', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(96, 'start_hour_accumulation_poin', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(97, 'end_hour_accumulation_poin', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(98, 'is_commission_sales_active', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(99, 'reset_commission_sales', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(100, 'is_minus_commission_sales_reset', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(101, 'reset_commission_sales_when', 'START_OF_MONTH', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(102, 'type_commission_sales', 'GRAND_TOTAL', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(103, 'type_nominal_commission_sales', 'NOMINAL', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(104, 'nominal_commission_sales', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(105, 'minimum_commission_sales', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(106, 'maximum_commission_sales', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(107, 'is_multiple_commission_sales', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(108, 'accumulation_commission_sales_type', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(109, 'start_day_accumulation_commission_sales', 'MONDAY', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(110, 'end_day_accumulation_commission_sales', 'MONDAY', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(111, 'start_date_accumulation_commission_sales', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(112, 'end_date_accumulation_commission_sales', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(113, 'start_hour_accumulation_commission_sales', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(114, 'end_hour_accumulation_commission_sales', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(115, 'set_item_based_on_supplier', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(116, 'using_redirect_page_message', '1', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(117, 'type_printing_transaction_selling', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(118, 'type_printing_transaction_quotation', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(119, 'type_printing_transaction_po_customer', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(120, 'type_printing_transaction_work_order', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(121, 'type_printing_transaction_po_supplier', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(122, 'type_printing_transaction_delivery_order', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(123, 'type_printing_transaction_selling_receivable', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(124, 'type_printing_transaction_selling_return', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(125, 'type_printing_transaction_receivable_billing', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(126, 'type_printing_transaction_list_delivery_order', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(127, 'type_printing_transaction_stock_in', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(128, 'type_printing_transaction_stock_out', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(129, 'type_printing_transaction_packageing_list', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(130, 'type_printing_transaction_sent_to_production', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(131, 'type_printing_transaction_formula_material_item', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(132, 'type_printing_transaction_material_requirement', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(133, 'type_printing_transaction_production', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(134, 'type_printing_transaction_sent_to_warehouse', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(135, 'type_printing_transaction_cash_in', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(136, 'type_printing_transaction_cash_out', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(137, 'is_update_transaction_with_date', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(138, 'type_printing_transaction_seller_hold_stock', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(139, 'type_printing_transaction_seller_order_stock', 'PRINT_PDF', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(140, 'filter_default_period', 'default', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(141, 'finance_inventory_multi_coa', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(142, 'pending_warehouse', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(143, 'is_sidebar_color', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(144, 'sidebar_color', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(145, 'is_topbar_color', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(146, 'topbar_color', '', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(147, 'is_background_login', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(148, 'background_login', 'default.png', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(149, 'chart_of_account_nested', '2', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(150, 'finance_inventory_tax_multi_coa', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(151, 'is_description_approval_document', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(152, 'is_using_multi_payment_selling', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(153, 'is_using_multi_payment_selling_coa', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(154, 'is_using_multi_payment_purchaseing', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(155, 'is_using_multi_payment_purchaseing_coa', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(156, 'is_show_chart_of_account_in_frontend', '1', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(157, 'is_include_tax_purchaseing', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(158, 'is_include_tax_selling', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(159, 'finance_hide_zero_coa_nominal', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(160, 'tax_value_other', '0.91666666667', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(161, 'tax_core_tax', '12', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(162, 'is_include_step_in_cogs', '0', '2025-08-16 01:48:14', '2025-08-16 01:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `setting_approvals`
--

CREATE TABLE `setting_approvals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `signature_owner` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting_codes`
--

CREATE TABLE `setting_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rules` varchar(50) DEFAULT NULL,
  `digits` bigint(20) NOT NULL DEFAULT 4,
  `is_automatic` tinyint(1) NOT NULL DEFAULT 1,
  `last_code` varchar(50) DEFAULT NULL,
  `raw_last_code` varchar(50) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `reset_type` varchar(50) NOT NULL DEFAULT 'MONTH',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting_codes`
--

INSERT INTO `setting_codes` (`id`, `role_id`, `rules`, `digits`, `is_automatic`, `last_code`, `raw_last_code`, `link`, `reset_type`, `created_at`, `updated_at`) VALUES
(1, 4, 'WE-#CODE', 4, 1, NULL, NULL, '/master/warehouse', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(2, 5, 'SR-#CODE', 4, 1, NULL, NULL, '/master/supplier', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(3, 7, 'CR-#CODE', 4, 1, NULL, NULL, '/master/customer', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(4, 8, 'AA-#CODE', 4, 1, NULL, NULL, '/master/area', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(5, 13, 'IM-#CODE', 4, 1, NULL, NULL, '/master/item', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(6, 11, 'EN-#CODE', 4, 1, NULL, NULL, '/master/expedition', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(7, 15, 'QN-#CODE', 4, 1, NULL, NULL, '/marketing/quotation', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(8, 16, 'POC-#CODE', 4, 1, NULL, NULL, '/marketing/po-customer', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(9, 17, 'WO-#CODE', 4, 1, NULL, NULL, '/marketing/work-order', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(10, 21, 'POS-#CODE', 4, 1, NULL, NULL, '/purchaseing-module/po-supplier', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(11, 22, 'PG-#CODE', 4, 1, NULL, NULL, '/purchaseing-module/purchaseing', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(12, 23, 'PR-#CODE', 4, 1, NULL, NULL, '/purchaseing-module/purchaseing-return', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(13, 25, 'PD-#CODE', 4, 1, NULL, NULL, '/purchaseing-module/purchaseing-debt', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(14, 27, 'SG-#CODE', 4, 1, NULL, NULL, '/selling-module/selling', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(15, 28, 'SR-#CODE', 4, 1, NULL, NULL, '/seling-module/selling-return', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(16, 31, 'DR-#CODE', 4, 1, NULL, NULL, '/selling-module/delivery-order', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(17, 32, 'CST-#CODE', 4, 1, NULL, NULL, '/selling-module/commission-sales-transfer', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(18, 30, 'SRE-#CODE', 4, 1, NULL, NULL, '/selling-module/selling-receivable', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(19, 41, 'SI-#CODE', 4, 1, NULL, NULL, '/inventory/stock-in', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(20, 42, 'SO-#CODE', 4, 1, NULL, NULL, '/inventory/stock-out', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(21, 40, 'SM-#CODE', 4, 1, NULL, NULL, '/inventory/stock-mutation', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(22, 39, 'SOE-#CODE', 4, 1, NULL, NULL, '/inventory/stock-opname', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(23, 45, 'FMI-#CODE', 4, 1, NULL, NULL, '/manufactur/formula-material-item', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(24, 46, 'MR-#CODE', 4, 1, NULL, NULL, '/manufactur/material-requirement', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(25, 47, 'PN-#CODE', 4, 1, NULL, NULL, '/manufactur/production', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(26, 48, 'STE-#CODE', 4, 1, NULL, NULL, '/manufactur/sent-to-warehouse', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(27, 50, '#PARENT-#CHILD', 4, 1, NULL, NULL, '/finance/chart-of-account', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(28, 53, 'CI-#CODE', 4, 1, NULL, NULL, '/finance/cash-in', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(29, 54, 'CO-#CODE', 4, 1, NULL, NULL, '/finance/cash-out', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(30, 52, 'JL-#CODE', 4, 1, NULL, NULL, '/finance/journal', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(31, 55, 'CM-#CODE', 4, 1, NULL, NULL, '/finance/cash-mutation', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(32, 71, 'FA-#CODE', 4, 1, NULL, NULL, '/depreciation/fixed-asset', 'NONE', '2025-08-16 01:48:14', '2025-08-16 01:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `setting_promotions`
--

CREATE TABLE `setting_promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `used` bigint(20) NOT NULL DEFAULT 0,
  `limit` bigint(20) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_voucher` tinyint(1) NOT NULL DEFAULT 0,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'PENDING',
  `term_minimum_grand_total` decimal(20,2) NOT NULL DEFAULT 0.00,
  `term_minimum_quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type_reward` varchar(50) NOT NULL,
  `poin_type` varchar(50) NOT NULL,
  `poin` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_poin` decimal(20,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) NOT NULL,
  `discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `cashback_type` varchar(50) NOT NULL,
  `cashback` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_cashback` decimal(20,2) NOT NULL DEFAULT 0.00,
  `active_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `start_day` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `end_day` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_hour` time DEFAULT NULL,
  `end_hour` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting_promotion_discounts`
--

CREATE TABLE `setting_promotion_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_promotion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting_promotion_free_items`
--

CREATE TABLE `setting_promotion_free_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_promotion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `unit` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting_promotion_vouchers`
--

CREATE TABLE `setting_promotion_vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_promotion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `voucher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_cards`
--

CREATE TABLE `stock_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `in` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `out` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `stock` decimal(20,2) NOT NULL DEFAULT 0.00,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `in_nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `out_nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `cost_of_products_sold_old` decimal(20,2) NOT NULL DEFAULT 0.00000000000000,
  `cost_of_products_sold_new` decimal(20,2) NOT NULL DEFAULT 0.00000000000000,
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_ins`
--

CREATE TABLE `stock_ins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchaseing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_in_details`
--

CREATE TABLE `stock_in_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_in_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `selling_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00000000000000,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_in_detail_identities`
--

CREATE TABLE `stock_in_detail_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_in_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_in_detail_pcs`
--

CREATE TABLE `stock_in_detail_pcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_in_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_mutations`
--

CREATE TABLE `stock_mutations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_mutation_details`
--

CREATE TABLE `stock_mutation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_mutation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_to_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_from_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00000000000000,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_mutation_detail_pcs`
--

CREATE TABLE `stock_mutation_detail_pcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_mutation_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_opnames`
--

CREATE TABLE `stock_opnames` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_opname_details`
--

CREATE TABLE `stock_opname_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_opname_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `system_stock` decimal(20,2) NOT NULL DEFAULT 0.00,
  `real_stock` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `backend_stock` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `frontend_stock` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `difference_stock` decimal(20,2) NOT NULL DEFAULT 0.00,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00000000000000,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_opname_detail_identities`
--

CREATE TABLE `stock_opname_detail_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_opname_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_opname_detail_pcs`
--

CREATE TABLE `stock_opname_detail_pcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_opname_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_outs`
--

CREATE TABLE `stock_outs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchaseing_return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'OUT',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_out_details`
--

CREATE TABLE `stock_out_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_out_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `smallest_unit` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `selling_price` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `real_quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost_of_products_sold` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00000000000000,
  `rack` varchar(50) DEFAULT NULL,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_mass` varchar(50) NOT NULL DEFAULT 'g',
  `width` decimal(20,2) NOT NULL DEFAULT 0.00,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `length` decimal(20,2) NOT NULL DEFAULT 0.00,
  `thickness` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_metric` varchar(50) NOT NULL DEFAULT 'cm',
  `description` text DEFAULT NULL,
  `warranty` bigint(20) NOT NULL DEFAULT 0,
  `warranty_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_out_detail_identities`
--

CREATE TABLE `stock_out_detail_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_out_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_out_detail_pcs`
--

CREATE TABLE `stock_out_detail_pcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_out_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `quantity` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `summary_transactions`
--

CREATE TABLE `summary_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `debt` decimal(20,2) NOT NULL DEFAULT 0.00,
  `debt_saldo` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_priority_term_of_payment` tinyint(1) NOT NULL DEFAULT 0,
  `is_nonactive_tax` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `code`, `name`, `company_name`, `description`, `debt`, `debt_saldo`, `is_priority_term_of_payment`, `is_nonactive_tax`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SR0001', 'Bambang Botak', 'Pt Jaya Abadi', 'Hargane luweih murah seko sek liyane', 0.00, 0.00, 0, 0, '2025-08-16 01:48:14', '2025-08-16 01:48:14', NULL),
(2, 'SR0002', 'Rahma', 'Pt Jaya Petir', 'Hargane luweih larang seko sek liyane', 0.00, 0.00, 0, 0, '2025-08-16 01:48:14', '2025-08-16 01:48:14', NULL),
(3, 'SR0003', 'Squired Word', 'Pt Jaya Abadi Maju Jaya', 'Hargane luweih larang banget seko sek liyane', 0.00, 0.00, 0, 0, '2025-08-16 01:48:14', '2025-08-16 01:48:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_addresses`
--

CREATE TABLE `supplier_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_addresses`
--

INSERT INTO `supplier_addresses` (`id`, `supplier_id`, `name`, `address`, `country`, `province`, `city`, `district`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Gudang', 'Bertempat di wadok,provinsi jawa tengah kota semarang kecamatan kali urang kode pos 5790222', 'Indonesia', 'Jawa Tengah', 'Semarang', 'Kali Urang', '5790222', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(2, 2, 'Gudang', 'Bertempat di wadok,provinsi jawa tengah kota semarang kecamatan kali ijo kode pos 57903332', 'Indonesia', 'Jawa Tengah', 'Semarang', 'Kali Ijo', '57903332', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(3, 3, 'Gudang', 'Bertempat di wadok,provinsi jawa tengah kota semarang kecamatan kali ijo kode pos 57903332', 'Indonesia', 'Jawa Tengah', 'Semarang', 'Kali Ijo', '57903332', '2025-08-16 01:48:14', '2025-08-16 01:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_address_maps`
--

CREATE TABLE `supplier_address_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zoom` int(11) NOT NULL DEFAULT 0,
  `lat` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `lng` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_banks`
--

CREATE TABLE `supplier_banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bank` varchar(200) DEFAULT NULL,
  `account` varchar(200) DEFAULT NULL,
  `account_number` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_banks`
--

INSERT INTO `supplier_banks` (`id`, `supplier_id`, `bank`, `account`, `account_number`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bank Bri', 'Bambang', '09827384738783748834', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(2, 2, 'Bank Bri', 'Rahma', '98787878345545', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(3, 3, 'Bank Bri', 'Squired Word', '34533534534535', '2025-08-16 01:48:14', '2025-08-16 01:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_contacts`
--

CREATE TABLE `supplier_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_contacts`
--

INSERT INTO `supplier_contacts` (`id`, `supplier_id`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 1, 'Anwar (Gudang)', 'anwar123@gmail.com', '+628576543254', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(2, 2, 'Petrick (Gudang)', 'pertrick@gmail.com', '+62857654543254', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(3, 3, 'Agung Jaya (Gudang)', 'agungJaya@gmail.com', '+62857445654543254', '2025-08-16 01:48:14', '2025-08-16 01:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_files`
--

CREATE TABLE `supplier_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_identities`
--

CREATE TABLE `supplier_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `card` varchar(50) NOT NULL DEFAULT 'IDENTITY_CARD',
  `number` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_identities`
--

INSERT INTO `supplier_identities` (`id`, `supplier_id`, `card`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 'IDENTITY_CARD', '03837464652870', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(2, 2, 'IDENTITY_CARD', '33242423423424', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(3, 3, 'IDENTITY_CARD', '33245552423423424', '2025-08-16 01:48:14', '2025-08-16 01:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_taxes`
--

CREATE TABLE `supplier_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_number` varchar(25) DEFAULT NULL,
  `tax_name` varchar(50) DEFAULT NULL,
  `tax_address` text DEFAULT NULL,
  `tax_verified_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_taxes`
--

INSERT INTO `supplier_taxes` (`id`, `supplier_id`, `tax_number`, `tax_name`, `tax_address`, `tax_verified_date`, `created_at`, `updated_at`) VALUES
(1, 1, '12343645454545645645', 'Bambang', NULL, '2025-08-16', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(2, 2, '3453434536767', 'Rahma', NULL, '2025-08-16', '2025-08-16 01:48:14', '2025-08-16 01:48:14'),
(3, 3, '44444444545454', 'Squired Word', NULL, '2025-08-16', '2025-08-16 01:48:14', '2025-08-16 01:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pcs', '1 Box biasanya mempunyai berat lebih dari 3 kg', '2025-08-16 01:48:14', '2025-08-16 01:48:14', NULL),
(2, 'Box', '1 Box biasanya mempunyai berat lebih dari 3 kg', '2025-08-16 01:48:14', '2025-08-16 01:48:14', NULL),
(3, 'Karton', '1 Kartun biasanya mempunyai berat lebih dari 5 kg', '2025-08-16 01:48:14', '2025-08-16 01:48:14', NULL),
(4, 'Unit', 'Unit satuan yang sering digunakan untuk layanan', '2025-08-16 01:48:14', '2025-08-16 01:48:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employe_identity` varchar(25) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_priority_commission_sales` tinyint(1) NOT NULL DEFAULT 0,
  `is_sales` tinyint(1) NOT NULL DEFAULT 0,
  `saldo_seller` decimal(20,2) NOT NULL DEFAULT 0.00,
  `saldo` decimal(20,2) NOT NULL DEFAULT 0.00,
  `status` varchar(50) NOT NULL DEFAULT 'ACTIVE',
  `employe_status` varchar(50) NOT NULL DEFAULT 'FULLTIME_PERMANENT',
  `join_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `parent_id`, `department_id`, `division_id`, `position_id`, `group_role_id`, `area_id`, `warehouse_id`, `employe_identity`, `username`, `password`, `fullname`, `first_name`, `last_name`, `description`, `is_priority_commission_sales`, `is_sales`, `saldo_seller`, `saldo`, `status`, `employe_status`, `join_date`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$ipeZA1qi21bonYgUuEnsjuhjUTGQPpf8w85uQ/FR765MrrC0y3Xua', 'Superadmin', NULL, NULL, NULL, 0, 0, 0.00, 0.00, 'ACTIVE', 'FULLTIME_PERMANENT', NULL, '2025-08-16 01:48:15', '2025-08-16 01:48:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_address_maps`
--

CREATE TABLE `user_address_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zoom` int(11) NOT NULL DEFAULT 0,
  `lat` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `lng` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_banks`
--

CREATE TABLE `user_banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bank` varchar(200) DEFAULT NULL,
  `account` varchar(200) DEFAULT NULL,
  `account_number` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_commissions`
--

CREATE TABLE `user_commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nominal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `minimum` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_multiple` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL DEFAULT 'GRAND_TOTAL',
  `type_nominal` varchar(50) NOT NULL DEFAULT 'PERCENTAGE',
  `accumulation_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `start_date_accumulation` date DEFAULT NULL,
  `end_date_accumulation` date DEFAULT NULL,
  `start_day_accumulation` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `end_day_accumulation` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `start_hour_accumulation` time DEFAULT NULL,
  `end_hour_accumulation` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_files`
--

CREATE TABLE `user_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_personal_datas`
--

CREATE TABLE `user_personal_datas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `identity_card` varchar(25) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `birthplace` varchar(50) DEFAULT NULL,
  `civil_status` varchar(50) DEFAULT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `height` decimal(20,2) NOT NULL DEFAULT 0.00,
  `weight` decimal(20,2) NOT NULL DEFAULT 0.00,
  `gender` varchar(50) NOT NULL DEFAULT 'MALE',
  `blood_type` varchar(50) NOT NULL DEFAULT 'NONE',
  `religion` varchar(50) NOT NULL DEFAULT 'Islam',
  `last_education` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_saldo_cards`
--

CREATE TABLE `user_saldo_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employe_id` bigint(20) UNSIGNED DEFAULT NULL,
  `in` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `out` decimal(20,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `saldo` decimal(20,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `reference_code` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_using_finance` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_shifts`
--

CREATE TABLE `user_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_apply_on_login` tinyint(1) NOT NULL DEFAULT 0,
  `day` varchar(50) NOT NULL DEFAULT 'MONDAY',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_shift_hours`
--

CREATE TABLE `user_shift_hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_shift_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `start_hour` time DEFAULT NULL,
  `end_hour` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_taxes`
--

CREATE TABLE `user_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_number` varchar(100) DEFAULT NULL,
  `tax_verified_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `function` varchar(50) NOT NULL DEFAULT 'WAREHOUSE',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `code`, `name`, `function`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'WE0001', 'Gudang Utama', 'MAIN', 'Gudang utama untuk stok item', '2025-08-16 01:48:15', '2025-08-16 01:48:15', NULL),
(2, 'WE0002', 'Gudang Lain', 'WAREHOUSE', 'Gudang lain untuk stok item', '2025-08-16 01:48:15', '2025-08-16 01:48:15', NULL),
(3, 'WE0003', 'Gudang Baru', 'BRANCH', 'Gudang baru untuk stok item', '2025-08-16 01:48:15', '2025-08-16 01:48:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_addresses`
--

CREATE TABLE `warehouse_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_addresses`
--

INSERT INTO `warehouse_addresses` (`id`, `warehouse_id`, `name`, `address`, `country`, `province`, `city`, `district`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Gudang', 'Bertempat di perumahan,provinsi jawa tengah kota semarang kecamatan banyumanik kode pos 57902', 'Indonesia', 'Jawa Tengah', 'Semarang', 'Banyumanik', '57902', '2025-08-16 01:48:15', '2025-08-16 01:48:15'),
(2, 2, 'Gudang Lain', 'Bertempat di perumahan,provinsi jawa tengah kota solo kecamatan palang baru kode pos 537902', 'Indonesia', 'Jawa Tengah', 'Solo', 'Palang Baru', '537902', '2025-08-16 01:48:15', '2025-08-16 01:48:15'),
(3, 3, 'Gudang Baru', 'Bertempat di perumahan,provinsi jawa tengah kota solo kecamatan manahan kode pos 5888', 'Indonesia', 'Jawa Tengah', 'Solo', 'Manahan', '5888', '2025-08-16 01:48:15', '2025-08-16 01:48:15');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_address_maps`
--

CREATE TABLE `warehouse_address_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zoom` int(11) NOT NULL DEFAULT 0,
  `lat` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `lng` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_contacts`
--

CREATE TABLE `warehouse_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_contacts`
--

INSERT INTO `warehouse_contacts` (`id`, `warehouse_id`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 1, 'Wahyu Subroto', 'wahyu@gmail.com', '08978698767673', '2025-08-16 01:48:15', '2025-08-16 01:48:15'),
(2, 2, 'Bayu Agung', 'bayu@gmail.com', '+62897338698763', '2025-08-16 01:48:15', '2025-08-16 01:48:15'),
(3, 3, 'kates', 'kates@gmail.com', '+6284538698763', '2025-08-16 01:48:15', '2025-08-16 01:48:15');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_stocks`
--

CREATE TABLE `warehouse_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` decimal(20,2) NOT NULL DEFAULT 0.00,
  `production_code_date` date DEFAULT NULL,
  `production_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_balances`
--
ALTER TABLE `account_balances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_balances_user_id_foreign` (`user_id`),
  ADD KEY `account_balances_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `account_balances_reference_code_index` (`reference_code`),
  ADD KEY `account_balances_date_index` (`date`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `areas_code_unique` (`code`),
  ADD KEY `areas_parent_id_foreign` (`parent_id`),
  ADD KEY `areas_name_index` (`name`);

--
-- Indexes for table `area_maps`
--
ALTER TABLE `area_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_maps_area_id_foreign` (`area_id`);

--
-- Indexes for table `background_processes`
--
ALTER TABLE `background_processes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `background_processes_user_id_foreign` (`user_id`),
  ADD KEY `background_processes_title_index` (`title`);

--
-- Indexes for table `background_process_infos`
--
ALTER TABLE `background_process_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `background_process_infos_background_process_id_foreign` (`background_process_id`);

--
-- Indexes for table `batch_mrdfs`
--
ALTER TABLE `batch_mrdfs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_mrdfs_item_id_foreign` (`item_id`),
  ADD KEY `batch_mrdfs_batch_mrd_id_foreign` (`batch_mrd_id`);

--
-- Indexes for table `batch_mrdf_identities`
--
ALTER TABLE `batch_mrdf_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_mrdf_identities_batch_mrdf_id_foreign` (`batch_mrdf_id`);

--
-- Indexes for table `batch_mrdf_pcs`
--
ALTER TABLE `batch_mrdf_pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_mrdf_pcs_batch_mrdf_id_foreign` (`batch_mrdf_id`);

--
-- Indexes for table `batch_mrds`
--
ALTER TABLE `batch_mrds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_mrds_item_id_foreign` (`item_id`),
  ADD KEY `batch_mrds_batch_mr_id_foreign` (`batch_mr_id`),
  ADD KEY `batch_mrds_batch_wo_id_foreign` (`batch_wo_id`),
  ADD KEY `batch_mrds_batch_wod_id_foreign` (`batch_wod_id`),
  ADD KEY `batch_mrds_po_customer_id_foreign` (`po_customer_id`),
  ADD KEY `batch_mrds_po_customer_detail_id_foreign` (`po_customer_detail_id`);

--
-- Indexes for table `batch_mrd_steps`
--
ALTER TABLE `batch_mrd_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_mrd_steps_batch_mrd_id_foreign` (`batch_mrd_id`),
  ADD KEY `batch_mrd_steps_production_division_id_foreign` (`production_division_id`),
  ADD KEY `batch_mrd_steps_division_id_foreign` (`division_id`);

--
-- Indexes for table `batch_mrs`
--
ALTER TABLE `batch_mrs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `batch_mrs_code_unique` (`code`),
  ADD KEY `batch_mrs_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `batch_mrs_user_id_foreign` (`user_id`);

--
-- Indexes for table `batch_pndfs`
--
ALTER TABLE `batch_pndfs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_pndfs_item_id_foreign` (`item_id`),
  ADD KEY `batch_pndfs_batch_pnd_id_foreign` (`batch_pnd_id`);

--
-- Indexes for table `batch_pndf_identities`
--
ALTER TABLE `batch_pndf_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_pndf_identities_batch_pndf_id_foreign` (`batch_pndf_id`);

--
-- Indexes for table `batch_pndf_pcs`
--
ALTER TABLE `batch_pndf_pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_pndf_pcs_batch_pndf_id_foreign` (`batch_pndf_id`);

--
-- Indexes for table `batch_pnds`
--
ALTER TABLE `batch_pnds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_pnds_item_id_foreign` (`item_id`),
  ADD KEY `batch_pnds_batch_pn_id_foreign` (`batch_pn_id`),
  ADD KEY `batch_pnds_batch_mr_id_foreign` (`batch_mr_id`),
  ADD KEY `batch_pnds_batch_mrd_id_foreign` (`batch_mrd_id`),
  ADD KEY `batch_pnds_batch_wo_id_foreign` (`batch_wo_id`),
  ADD KEY `batch_pnds_batch_wod_id_foreign` (`batch_wod_id`),
  ADD KEY `batch_pnds_po_customer_id_foreign` (`po_customer_id`),
  ADD KEY `batch_pnds_po_customer_detail_id_foreign` (`po_customer_detail_id`);

--
-- Indexes for table `batch_pnd_steps`
--
ALTER TABLE `batch_pnd_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_pnd_steps_batch_pnd_id_foreign` (`batch_pnd_id`),
  ADD KEY `batch_pnd_steps_production_division_id_foreign` (`production_division_id`),
  ADD KEY `batch_pnd_steps_division_id_foreign` (`division_id`);

--
-- Indexes for table `batch_pns`
--
ALTER TABLE `batch_pns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `batch_pns_code_unique` (`code`),
  ADD KEY `batch_pns_user_id_foreign` (`user_id`),
  ADD KEY `batch_pns_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `batch_stwdfs`
--
ALTER TABLE `batch_stwdfs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_stwdfs_item_id_foreign` (`item_id`),
  ADD KEY `batch_stwdfs_batch_stwd_id_foreign` (`batch_stwd_id`);

--
-- Indexes for table `batch_stwdf_identities`
--
ALTER TABLE `batch_stwdf_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_stwdf_identities_batch_stwdf_id_foreign` (`batch_stwdf_id`);

--
-- Indexes for table `batch_stwdf_pcs`
--
ALTER TABLE `batch_stwdf_pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_stwdf_pcs_batch_stwdf_id_foreign` (`batch_stwdf_id`);

--
-- Indexes for table `batch_stwds`
--
ALTER TABLE `batch_stwds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_stwds_item_id_foreign` (`item_id`),
  ADD KEY `batch_stwds_batch_stw_id_foreign` (`batch_stw_id`),
  ADD KEY `batch_stwds_batch_pn_id_foreign` (`batch_pn_id`),
  ADD KEY `batch_stwds_batch_pnd_id_foreign` (`batch_pnd_id`),
  ADD KEY `batch_stwds_batch_mr_id_foreign` (`batch_mr_id`),
  ADD KEY `batch_stwds_batch_mrd_id_foreign` (`batch_mrd_id`),
  ADD KEY `batch_stwds_batch_wo_id_foreign` (`batch_wo_id`),
  ADD KEY `batch_stwds_batch_wod_id_foreign` (`batch_wod_id`),
  ADD KEY `batch_stwds_po_customer_id_foreign` (`po_customer_id`),
  ADD KEY `batch_stwds_po_customer_detail_id_foreign` (`po_customer_detail_id`);

--
-- Indexes for table `batch_stwd_identities`
--
ALTER TABLE `batch_stwd_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_stwd_identities_batch_stwd_id_foreign` (`batch_stwd_id`);

--
-- Indexes for table `batch_stwd_pcs`
--
ALTER TABLE `batch_stwd_pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_stwd_pcs_batch_stwd_id_foreign` (`batch_stwd_id`);

--
-- Indexes for table `batch_stws`
--
ALTER TABLE `batch_stws`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `batch_stws_code_unique` (`code`),
  ADD KEY `batch_stws_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `batch_stws_user_id_foreign` (`user_id`),
  ADD KEY `batch_stws_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `batch_wods`
--
ALTER TABLE `batch_wods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_wods_item_id_foreign` (`item_id`),
  ADD KEY `batch_wods_batch_wo_id_foreign` (`batch_wo_id`),
  ADD KEY `batch_wods_po_customer_id_foreign` (`po_customer_id`),
  ADD KEY `batch_wods_po_customer_detail_id_foreign` (`po_customer_detail_id`);

--
-- Indexes for table `batch_wos`
--
ALTER TABLE `batch_wos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `batch_wos_code_unique` (`code`),
  ADD KEY `batch_wos_user_id_foreign` (`user_id`),
  ADD KEY `batch_wos_department_id_foreign` (`department_id`),
  ADD KEY `batch_wos_division_id_foreign` (`division_id`),
  ADD KEY `batch_wos_position_id_foreign` (`position_id`);

--
-- Indexes for table `batch_wo_user_approvals`
--
ALTER TABLE `batch_wo_user_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_wo_user_approvals_user_id_foreign` (`user_id`),
  ADD KEY `batch_wo_user_approvals_batch_wo_id_foreign` (`batch_wo_id`);

--
-- Indexes for table `cash_ins`
--
ALTER TABLE `cash_ins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cash_ins_code_unique` (`code`),
  ADD KEY `cash_ins_user_id_foreign` (`user_id`),
  ADD KEY `cash_ins_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `cash_ins_po_customer_id_foreign` (`po_customer_id`);

--
-- Indexes for table `cash_in_details`
--
ALTER TABLE `cash_in_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_in_details_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `cash_in_details_cash_in_id_foreign` (`cash_in_id`);

--
-- Indexes for table `cash_mutations`
--
ALTER TABLE `cash_mutations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cash_mutations_code_unique` (`code`),
  ADD KEY `cash_mutations_user_id_foreign` (`user_id`);

--
-- Indexes for table `cash_mutation_details`
--
ALTER TABLE `cash_mutation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_mutation_details_cash_mutation_id_foreign` (`cash_mutation_id`),
  ADD KEY `cash_mutation_details_chart_of_account_to_id_foreign` (`chart_of_account_to_id`),
  ADD KEY `cash_mutation_details_chart_of_account_from_id_foreign` (`chart_of_account_from_id`);

--
-- Indexes for table `cash_outs`
--
ALTER TABLE `cash_outs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cash_outs_code_unique` (`code`),
  ADD KEY `cash_outs_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `cash_outs_user_id_foreign` (`user_id`),
  ADD KEY `cash_outs_po_customer_id_foreign` (`po_customer_id`);

--
-- Indexes for table `cash_out_details`
--
ALTER TABLE `cash_out_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_out_details_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `cash_out_details_cash_out_id_foreign` (`cash_out_id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chart_of_accounts_code_unique` (`code`),
  ADD KEY `chart_of_accounts_parent_id_foreign` (`parent_id`),
  ADD KEY `chart_of_accounts_name_index` (`name`);

--
-- Indexes for table `chart_of_account_transactions`
--
ALTER TABLE `chart_of_account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chart_of_account_transactions_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `chart_of_account_transactions_name_index` (`name`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_province_id_foreign` (`province_id`),
  ADD KEY `cities_name_index` (`name`);

--
-- Indexes for table `city_maps`
--
ALTER TABLE `city_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_maps_city_id_foreign` (`city_id`);

--
-- Indexes for table `commission_sales_cards`
--
ALTER TABLE `commission_sales_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commission_sales_cards_user_id_foreign` (`user_id`),
  ADD KEY `commission_sales_cards_seller_id_foreign` (`seller_id`),
  ADD KEY `commission_sales_cards_reference_code_index` (`reference_code`),
  ADD KEY `commission_sales_cards_date_index` (`date`);

--
-- Indexes for table `commission_sales_transfers`
--
ALTER TABLE `commission_sales_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commission_sales_transfers_user_id_foreign` (`user_id`);

--
-- Indexes for table `commission_sales_transfer_details`
--
ALTER TABLE `commission_sales_transfer_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commission_sales_transfer_details_seller_id_foreign` (`seller_id`),
  ADD KEY `commission_sales_transfer_details_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `cost_of_products_sold_cards`
--
ALTER TABLE `cost_of_products_sold_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cost_of_products_sold_cards_user_id_foreign` (`user_id`),
  ADD KEY `cost_of_products_sold_cards_item_id_foreign` (`item_id`),
  ADD KEY `cost_of_products_sold_cards_reference_code_index` (`reference_code`),
  ADD KEY `cost_of_products_sold_cards_date_index` (`date`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_name_index` (`name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_code_unique` (`code`),
  ADD KEY `customers_seller_id_foreign` (`seller_id`),
  ADD KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `customers_name_index` (`name`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_addresses_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `customer_address_maps`
--
ALTER TABLE `customer_address_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_address_maps_customer_address_id_foreign` (`customer_address_id`);

--
-- Indexes for table `customer_banks`
--
ALTER TABLE `customer_banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_banks_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_contacts_email_unique` (`email`),
  ADD UNIQUE KEY `customer_contacts_phone_unique` (`phone`),
  ADD KEY `customer_contacts_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `customer_files`
--
ALTER TABLE `customer_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_files_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_groups_name_unique` (`name`);

--
-- Indexes for table `customer_identities`
--
ALTER TABLE `customer_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_identities_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `customer_saldo_cards`
--
ALTER TABLE `customer_saldo_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_saldo_cards_user_id_foreign` (`user_id`),
  ADD KEY `customer_saldo_cards_customer_id_foreign` (`customer_id`),
  ADD KEY `customer_saldo_cards_reference_code_index` (`reference_code`),
  ADD KEY `customer_saldo_cards_date_index` (`date`);

--
-- Indexes for table `customer_taxes`
--
ALTER TABLE `customer_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_taxes_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `customer_term_of_payments`
--
ALTER TABLE `customer_term_of_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_term_of_payments_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `debt_cards`
--
ALTER TABLE `debt_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `debt_cards_user_id_foreign` (`user_id`),
  ADD KEY `debt_cards_supplier_id_foreign` (`supplier_id`),
  ADD KEY `debt_cards_reference_code_index` (`reference_code`),
  ADD KEY `debt_cards_date_index` (`date`);

--
-- Indexes for table `debt_saldo_cards`
--
ALTER TABLE `debt_saldo_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `debt_saldo_cards_user_id_foreign` (`user_id`),
  ADD KEY `debt_saldo_cards_supplier_id_foreign` (`supplier_id`),
  ADD KEY `debt_saldo_cards_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `debt_saldo_cards_reference_code_index` (`reference_code`),
  ADD KEY `debt_saldo_cards_date_index` (`date`);

--
-- Indexes for table `delivery_orders`
--
ALTER TABLE `delivery_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_orders_code_unique` (`code`),
  ADD KEY `delivery_orders_user_id_foreign` (`user_id`),
  ADD KEY `delivery_orders_selling_id_foreign` (`selling_id`),
  ADD KEY `delivery_orders_customer_id_foreign` (`customer_id`),
  ADD KEY `delivery_orders_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `delivery_orders_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `delivery_orders_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `delivery_orders_po_customer_id_foreign` (`po_customer_id`);

--
-- Indexes for table `delivery_order_customer_addresses`
--
ALTER TABLE `delivery_order_customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_order_customer_addresses_delivery_order_id_foreign` (`delivery_order_id`);

--
-- Indexes for table `delivery_order_customer_contacts`
--
ALTER TABLE `delivery_order_customer_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_order_customer_contacts_delivery_order_id_foreign` (`delivery_order_id`);

--
-- Indexes for table `delivery_order_details`
--
ALTER TABLE `delivery_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_order_details_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `delivery_order_details_item_id_foreign` (`item_id`),
  ADD KEY `delivery_order_details_delivery_order_id_foreign` (`delivery_order_id`),
  ADD KEY `delivery_order_details_po_customer_id_foreign` (`po_customer_id`),
  ADD KEY `delivery_order_details_po_customer_detail_id_foreign` (`po_customer_detail_id`);

--
-- Indexes for table `delivery_order_shippings`
--
ALTER TABLE `delivery_order_shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_order_shippings_delivery_order_id_foreign` (`delivery_order_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `divisions_department_id_foreign` (`department_id`),
  ADD KEY `divisions_name_index` (`name`);

--
-- Indexes for table `expeditions`
--
ALTER TABLE `expeditions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expeditions_code_unique` (`code`),
  ADD KEY `expeditions_name_index` (`name`);

--
-- Indexes for table `expedition_destination_maps`
--
ALTER TABLE `expedition_destination_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expedition_destination_maps_expedition_id_foreign` (`expedition_id`);

--
-- Indexes for table `expedition_origin_maps`
--
ALTER TABLE `expedition_origin_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expedition_origin_maps_expedition_id_foreign` (`expedition_id`);

--
-- Indexes for table `expedition_prices`
--
ALTER TABLE `expedition_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expedition_prices_expedition_id_foreign` (`expedition_id`),
  ADD KEY `expedition_prices_name_index` (`name`);

--
-- Indexes for table `fixed_assets`
--
ALTER TABLE `fixed_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fixed_assets_code_unique` (`code`),
  ADD KEY `fixed_assets_group_asset_id_foreign` (`group_asset_id`),
  ADD KEY `fixed_assets_name_index` (`name`);

--
-- Indexes for table `formula_material_items`
--
ALTER TABLE `formula_material_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `formula_material_items_code_unique` (`code`),
  ADD KEY `formula_material_items_item_id_foreign` (`item_id`),
  ADD KEY `formula_material_items_user_id_foreign` (`user_id`);

--
-- Indexes for table `formula_material_item_details`
--
ALTER TABLE `formula_material_item_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formula_material_item_details_item_id_foreign` (`item_id`),
  ADD KEY `formula_material_item_details_formula_material_item_id_foreign` (`formula_material_item_id`);

--
-- Indexes for table `formula_material_item_steps`
--
ALTER TABLE `formula_material_item_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formula_material_item_steps_formula_material_item_id_foreign` (`formula_material_item_id`),
  ADD KEY `formula_material_item_steps_production_division_id_foreign` (`production_division_id`);

--
-- Indexes for table `grants`
--
ALTER TABLE `grants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grants_group_role_id_foreign` (`group_role_id`),
  ADD KEY `grants_role_id_foreign` (`role_id`);

--
-- Indexes for table `grant_operators`
--
ALTER TABLE `grant_operators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grant_operators_grant_id_foreign` (`grant_id`);

--
-- Indexes for table `group_assets`
--
ALTER TABLE `group_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_assets_parent_id_foreign` (`parent_id`),
  ADD KEY `group_assets_code_index` (`code`),
  ADD KEY `group_assets_name_index` (`name`);

--
-- Indexes for table `group_roles`
--
ALTER TABLE `group_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_roles_name_unique` (`name`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_code_unique` (`code`),
  ADD KEY `items_supplier_id_foreign` (`supplier_id`),
  ADD KEY `items_customer_id_foreign` (`customer_id`),
  ADD KEY `items_item_category_id_foreign` (`item_category_id`),
  ADD KEY `items_type_index` (`type`),
  ADD KEY `items_status_type_index` (`status_type`),
  ADD KEY `items_name_index` (`name`),
  ADD KEY `items_is_using_tax_index` (`is_using_tax`),
  ADD KEY `items_is_free_tax_index` (`is_free_tax`),
  ADD KEY `items_is_using_serial_number_index` (`is_using_serial_number`),
  ADD KEY `items_is_using_production_code_index` (`is_using_production_code`),
  ADD KEY `items_active_index` (`active`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_categories_parent_id_foreign` (`parent_id`),
  ADD KEY `item_categories_name_index` (`name`);

--
-- Indexes for table `item_detail_categories`
--
ALTER TABLE `item_detail_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_detail_categories_item_id_foreign` (`item_id`),
  ADD KEY `item_detail_categories_item_category_id_foreign` (`item_category_id`),
  ADD KEY `item_detail_categories_child_item_category_id_foreign` (`child_item_category_id`);

--
-- Indexes for table `item_identities`
--
ALTER TABLE `item_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_identities_item_id_foreign` (`item_id`),
  ADD KEY `item_identities_serial_number_index` (`serial_number`);

--
-- Indexes for table `item_images`
--
ALTER TABLE `item_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_images_item_id_foreign` (`item_id`);

--
-- Indexes for table `item_prices`
--
ALTER TABLE `item_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_prices_item_id_foreign` (`item_id`),
  ADD KEY `item_prices_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `item_price_commissions`
--
ALTER TABLE `item_price_commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_price_commissions_item_id_foreign` (`item_id`),
  ADD KEY `item_price_commissions_item_price_id_foreign` (`item_price_id`);

--
-- Indexes for table `item_price_poins`
--
ALTER TABLE `item_price_poins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_price_poins_item_id_foreign` (`item_id`),
  ADD KEY `item_price_poins_item_price_id_foreign` (`item_price_id`);

--
-- Indexes for table `item_price_promotions`
--
ALTER TABLE `item_price_promotions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_price_promotions_code_unique` (`code`),
  ADD KEY `item_price_promotions_item_id_foreign` (`item_id`),
  ADD KEY `item_price_promotions_customer_id_foreign` (`customer_id`),
  ADD KEY `item_price_promotions_item_price_id_foreign` (`item_price_id`),
  ADD KEY `item_price_promotions_user_id_foreign` (`user_id`);

--
-- Indexes for table `item_price_promotion_discounts`
--
ALTER TABLE `item_price_promotion_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_price_promotion_discounts_item_price_promotion_id_foreign` (`item_price_promotion_id`);

--
-- Indexes for table `item_price_promotion_free_items`
--
ALTER TABLE `item_price_promotion_free_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_price_promotion_free_items_item_id_foreign` (`item_id`),
  ADD KEY `item_price_promotion_free_items_item_price_promotion_id_foreign` (`item_price_promotion_id`);

--
-- Indexes for table `item_price_promotion_vouchers`
--
ALTER TABLE `item_price_promotion_vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_price_promotion_vouchers_item_price_promotion_id_foreign` (`item_price_promotion_id`),
  ADD KEY `item_price_promotion_vouchers_voucher_id_foreign` (`voucher_id`);

--
-- Indexes for table `item_price_quantities`
--
ALTER TABLE `item_price_quantities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_price_quantities_item_id_foreign` (`item_id`),
  ADD KEY `item_price_quantities_item_price_id_foreign` (`item_price_id`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `journals_code_unique` (`code`),
  ADD KEY `journals_user_id_foreign` (`user_id`);

--
-- Indexes for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_details_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `journal_details_journal_id_foreign` (`journal_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`),
  ADD KEY `notifications_title_index` (`title`);

--
-- Indexes for table `poin_cards`
--
ALTER TABLE `poin_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poin_cards_user_id_foreign` (`user_id`),
  ADD KEY `poin_cards_customer_id_foreign` (`customer_id`),
  ADD KEY `poin_cards_reference_code_index` (`reference_code`),
  ADD KEY `poin_cards_date_index` (`date`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `positions_division_id_foreign` (`division_id`),
  ADD KEY `positions_name_index` (`name`);

--
-- Indexes for table `po_customers`
--
ALTER TABLE `po_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `po_customers_code_unique` (`code`),
  ADD KEY `po_customers_quotation_id_foreign` (`quotation_id`),
  ADD KEY `po_customers_customer_id_foreign` (`customer_id`),
  ADD KEY `po_customers_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `po_customers_user_id_foreign` (`user_id`),
  ADD KEY `po_customers_seller_id_foreign` (`seller_id`),
  ADD KEY `po_customers_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `po_customer_addionals`
--
ALTER TABLE `po_customer_addionals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_customer_addionals_po_customer_id_foreign` (`po_customer_id`);

--
-- Indexes for table `po_customer_customer_addresses`
--
ALTER TABLE `po_customer_customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_customer_customer_addresses_po_customer_id_foreign` (`po_customer_id`);

--
-- Indexes for table `po_customer_customer_contacts`
--
ALTER TABLE `po_customer_customer_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_customer_customer_contacts_po_customer_id_foreign` (`po_customer_id`);

--
-- Indexes for table `po_customer_details`
--
ALTER TABLE `po_customer_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_customer_details_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `po_customer_details_seller_id_foreign` (`seller_id`),
  ADD KEY `po_customer_details_item_id_foreign` (`item_id`),
  ADD KEY `po_customer_details_po_customer_id_foreign` (`po_customer_id`);

--
-- Indexes for table `po_customer_detail_multiple_discounts`
--
ALTER TABLE `po_customer_detail_multiple_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `po_customer_multiple_accounts`
--
ALTER TABLE `po_customer_multiple_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_customer_multiple_accounts_po_customer_id_foreign` (`po_customer_id`),
  ADD KEY `po_customer_multiple_accounts_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `po_customer_multiple_discounts`
--
ALTER TABLE `po_customer_multiple_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_customer_multiple_discounts_po_customer_id_foreign` (`po_customer_id`);

--
-- Indexes for table `po_customer_shippings`
--
ALTER TABLE `po_customer_shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_customer_shippings_po_customer_id_foreign` (`po_customer_id`);

--
-- Indexes for table `po_customer_user_approvals`
--
ALTER TABLE `po_customer_user_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_customer_user_approvals_user_id_foreign` (`user_id`),
  ADD KEY `po_customer_user_approvals_po_customer_id_foreign` (`po_customer_id`);

--
-- Indexes for table `po_suppliers`
--
ALTER TABLE `po_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `po_suppliers_code_unique` (`code`),
  ADD KEY `po_suppliers_user_id_foreign` (`user_id`),
  ADD KEY `po_suppliers_supplier_id_foreign` (`supplier_id`),
  ADD KEY `po_suppliers_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `po_supplier_addionals`
--
ALTER TABLE `po_supplier_addionals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_supplier_addionals_po_supplier_id_foreign` (`po_supplier_id`);

--
-- Indexes for table `po_supplier_details`
--
ALTER TABLE `po_supplier_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_supplier_details_item_id_foreign` (`item_id`),
  ADD KEY `po_supplier_details_po_supplier_id_foreign` (`po_supplier_id`);

--
-- Indexes for table `po_supplier_detail_multiple_discounts`
--
ALTER TABLE `po_supplier_detail_multiple_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `po_supplier_multiple_accounts`
--
ALTER TABLE `po_supplier_multiple_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_supplier_multiple_accounts_po_supplier_id_foreign` (`po_supplier_id`),
  ADD KEY `po_supplier_multiple_accounts_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `po_supplier_multiple_discounts`
--
ALTER TABLE `po_supplier_multiple_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_supplier_multiple_discounts_po_supplier_id_foreign` (`po_supplier_id`);

--
-- Indexes for table `po_supplier_supplier_addresses`
--
ALTER TABLE `po_supplier_supplier_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_supplier_supplier_addresses_po_supplier_id_foreign` (`po_supplier_id`);

--
-- Indexes for table `po_supplier_supplier_contacts`
--
ALTER TABLE `po_supplier_supplier_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_supplier_supplier_contacts_po_supplier_id_foreign` (`po_supplier_id`);

--
-- Indexes for table `po_supplier_user_approvals`
--
ALTER TABLE `po_supplier_user_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_supplier_user_approvals_user_id_foreign` (`user_id`),
  ADD KEY `po_supplier_user_approvals_po_supplier_id_foreign` (`po_supplier_id`);

--
-- Indexes for table `production_divisions`
--
ALTER TABLE `production_divisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_divisions_division_id_foreign` (`division_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provinces_name_index` (`name`);

--
-- Indexes for table `province_maps`
--
ALTER TABLE `province_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_maps_province_id_foreign` (`province_id`);

--
-- Indexes for table `purchaseings`
--
ALTER TABLE `purchaseings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchaseings_code_unique` (`code`),
  ADD KEY `purchaseings_user_id_foreign` (`user_id`),
  ADD KEY `purchaseings_po_supplier_id_foreign` (`po_supplier_id`),
  ADD KEY `purchaseings_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchaseings_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `purchaseings_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `purchaseing_addionals`
--
ALTER TABLE `purchaseing_addionals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_addionals_purchaseing_id_foreign` (`purchaseing_id`);

--
-- Indexes for table `purchaseing_debts`
--
ALTER TABLE `purchaseing_debts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchaseing_debts_code_unique` (`code`),
  ADD KEY `purchaseing_debts_user_id_foreign` (`user_id`);

--
-- Indexes for table `purchaseing_debt_details`
--
ALTER TABLE `purchaseing_debt_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_debt_details_purchaseing_debt_id_foreign` (`purchaseing_debt_id`),
  ADD KEY `purchaseing_debt_details_purchaseing_id_foreign` (`purchaseing_id`),
  ADD KEY `purchaseing_debt_details_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `purchaseing_debt_detail_multiple_accounts`
--
ALTER TABLE `purchaseing_debt_detail_multiple_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchaseing_details`
--
ALTER TABLE `purchaseing_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_details_item_id_foreign` (`item_id`),
  ADD KEY `purchaseing_details_purchaseing_id_foreign` (`purchaseing_id`),
  ADD KEY `purchaseing_details_po_supplier_id_foreign` (`po_supplier_id`),
  ADD KEY `purchaseing_details_po_supplier_detail_id_foreign` (`po_supplier_detail_id`);

--
-- Indexes for table `purchaseing_detail_identities`
--
ALTER TABLE `purchaseing_detail_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_detail_identities_purchaseing_detail_id_foreign` (`purchaseing_detail_id`);

--
-- Indexes for table `purchaseing_detail_multiple_discounts`
--
ALTER TABLE `purchaseing_detail_multiple_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchaseing_detail_pcs`
--
ALTER TABLE `purchaseing_detail_pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_detail_pcs_purchaseing_detail_id_foreign` (`purchaseing_detail_id`);

--
-- Indexes for table `purchaseing_multiple_accounts`
--
ALTER TABLE `purchaseing_multiple_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_multiple_accounts_purchaseing_id_foreign` (`purchaseing_id`),
  ADD KEY `purchaseing_multiple_accounts_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `purchaseing_multiple_discounts`
--
ALTER TABLE `purchaseing_multiple_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_multiple_discounts_purchaseing_id_foreign` (`purchaseing_id`);

--
-- Indexes for table `purchaseing_returns`
--
ALTER TABLE `purchaseing_returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchaseing_returns_code_unique` (`code`),
  ADD KEY `purchaseing_returns_user_id_foreign` (`user_id`),
  ADD KEY `purchaseing_returns_purchaseing_id_foreign` (`purchaseing_id`),
  ADD KEY `purchaseing_returns_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchaseing_returns_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `purchaseing_returns_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `purchaseing_return_addresses`
--
ALTER TABLE `purchaseing_return_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_return_addresses_purchaseing_return_id_foreign` (`purchaseing_return_id`);

--
-- Indexes for table `purchaseing_return_contacts`
--
ALTER TABLE `purchaseing_return_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_return_contacts_purchaseing_return_id_foreign` (`purchaseing_return_id`);

--
-- Indexes for table `purchaseing_return_details`
--
ALTER TABLE `purchaseing_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_return_details_item_id_foreign` (`item_id`),
  ADD KEY `purchaseing_return_details_purchaseing_return_id_foreign` (`purchaseing_return_id`),
  ADD KEY `purchaseing_return_details_purchaseing_id_foreign` (`purchaseing_id`),
  ADD KEY `purchaseing_return_details_purchaseing_detail_id_foreign` (`purchaseing_detail_id`);

--
-- Indexes for table `purchaseing_return_detail_identities`
--
ALTER TABLE `purchaseing_return_detail_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_return_detail_identities_detail_id_foreign` (`purchaseing_return_detail_id`);

--
-- Indexes for table `purchaseing_return_detail_multiple_discounts`
--
ALTER TABLE `purchaseing_return_detail_multiple_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchaseing_return_detail_pcs`
--
ALTER TABLE `purchaseing_return_detail_pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_return_detail_ps_detail_id_foreign` (`purchaseing_return_detail_id`);

--
-- Indexes for table `purchaseing_supplier_addresses`
--
ALTER TABLE `purchaseing_supplier_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_supplier_addresses_purchaseing_id_foreign` (`purchaseing_id`);

--
-- Indexes for table `purchaseing_supplier_contacts`
--
ALTER TABLE `purchaseing_supplier_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseing_supplier_contacts_purchaseing_id_foreign` (`purchaseing_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `quotations_code_unique` (`code`),
  ADD KEY `quotations_customer_id_foreign` (`customer_id`),
  ADD KEY `quotations_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `quotations_user_id_foreign` (`user_id`),
  ADD KEY `quotations_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `quotation_addionals`
--
ALTER TABLE `quotation_addionals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_addionals_quotation_id_foreign` (`quotation_id`);

--
-- Indexes for table `quotation_customer_addresses`
--
ALTER TABLE `quotation_customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_customer_addresses_quotation_id_foreign` (`quotation_id`);

--
-- Indexes for table `quotation_customer_contacts`
--
ALTER TABLE `quotation_customer_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_customer_contacts_quotation_id_foreign` (`quotation_id`);

--
-- Indexes for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_details_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `quotation_details_seller_id_foreign` (`seller_id`),
  ADD KEY `quotation_details_item_id_foreign` (`item_id`),
  ADD KEY `quotation_details_quotation_id_foreign` (`quotation_id`);

--
-- Indexes for table `quotation_detail_multiple_discounts`
--
ALTER TABLE `quotation_detail_multiple_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_detail_multiple_discounts_quotation_detail_id_foreign` (`quotation_detail_id`);

--
-- Indexes for table `quotation_multiple_discounts`
--
ALTER TABLE `quotation_multiple_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_multiple_discounts_quotation_id_foreign` (`quotation_id`);

--
-- Indexes for table `quotation_shippings`
--
ALTER TABLE `quotation_shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_shippings_quotation_id_foreign` (`quotation_id`);

--
-- Indexes for table `quotation_user_approvals`
--
ALTER TABLE `quotation_user_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_user_approvals_user_id_foreign` (`user_id`),
  ADD KEY `quotation_user_approvals_quotation_id_foreign` (`quotation_id`);

--
-- Indexes for table `receivable_cards`
--
ALTER TABLE `receivable_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receivable_cards_user_id_foreign` (`user_id`),
  ADD KEY `receivable_cards_customer_id_foreign` (`customer_id`),
  ADD KEY `receivable_cards_reference_code_index` (`reference_code`),
  ADD KEY `receivable_cards_date_index` (`date`);

--
-- Indexes for table `receivable_saldo_cards`
--
ALTER TABLE `receivable_saldo_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receivable_saldo_cards_user_id_foreign` (`user_id`),
  ADD KEY `receivable_saldo_cards_customer_id_foreign` (`customer_id`),
  ADD KEY `receivable_saldo_cards_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `receivable_saldo_cards_reference_code_index` (`reference_code`),
  ADD KEY `receivable_saldo_cards_date_index` (`date`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD KEY `roles_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `sellings`
--
ALTER TABLE `sellings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellings_code_unique` (`code`),
  ADD KEY `sellings_po_customer_id_foreign` (`po_customer_id`),
  ADD KEY `sellings_customer_id_foreign` (`customer_id`),
  ADD KEY `sellings_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `sellings_user_id_foreign` (`user_id`),
  ADD KEY `sellings_seller_id_foreign` (`seller_id`),
  ADD KEY `sellings_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `sellings_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `sellings_division_id_foreign` (`division_id`);

--
-- Indexes for table `selling_addionals`
--
ALTER TABLE `selling_addionals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_addionals_selling_id_foreign` (`selling_id`);

--
-- Indexes for table `selling_commission_saleses`
--
ALTER TABLE `selling_commission_saleses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_commission_saleses_selling_id_foreign` (`selling_id`);

--
-- Indexes for table `selling_customer_addresses`
--
ALTER TABLE `selling_customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_customer_addresses_selling_id_foreign` (`selling_id`);

--
-- Indexes for table `selling_customer_contacts`
--
ALTER TABLE `selling_customer_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_customer_contacts_selling_id_foreign` (`selling_id`);

--
-- Indexes for table `selling_details`
--
ALTER TABLE `selling_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_details_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `selling_details_item_id_foreign` (`item_id`),
  ADD KEY `selling_details_selling_id_foreign` (`selling_id`),
  ADD KEY `selling_details_seller_id_foreign` (`seller_id`),
  ADD KEY `selling_details_po_customer_id_foreign` (`po_customer_id`),
  ADD KEY `selling_details_po_customer_detail_id_foreign` (`po_customer_detail_id`);

--
-- Indexes for table `selling_detail_commission_saleses`
--
ALTER TABLE `selling_detail_commission_saleses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_detail_commission_saleses_selling_detail_id_foreign` (`selling_detail_id`);

--
-- Indexes for table `selling_detail_identities`
--
ALTER TABLE `selling_detail_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_detail_identities_selling_detail_id_foreign` (`selling_detail_id`);

--
-- Indexes for table `selling_detail_multiple_discounts`
--
ALTER TABLE `selling_detail_multiple_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_detail_multiple_discounts_selling_detail_id_foreign` (`selling_detail_id`);

--
-- Indexes for table `selling_detail_pcs`
--
ALTER TABLE `selling_detail_pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_detail_pcs_selling_detail_id_foreign` (`selling_detail_id`);

--
-- Indexes for table `selling_detail_poins`
--
ALTER TABLE `selling_detail_poins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_detail_poins_selling_detail_id_foreign` (`selling_detail_id`);

--
-- Indexes for table `selling_detail_promotions`
--
ALTER TABLE `selling_detail_promotions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selling_detail_promotions_code_unique` (`code`),
  ADD KEY `selling_detail_promotions_selling_detail_id_foreign` (`selling_detail_id`),
  ADD KEY `selling_detail_promotions_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `selling_detail_promotion_items`
--
ALTER TABLE `selling_detail_promotion_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_detail_promotion_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `selling_detail_promotion_nested_discounts`
--
ALTER TABLE `selling_detail_promotion_nested_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selling_multiple_accounts`
--
ALTER TABLE `selling_multiple_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_multiple_accounts_selling_id_foreign` (`selling_id`),
  ADD KEY `selling_multiple_accounts_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `selling_multiple_discounts`
--
ALTER TABLE `selling_multiple_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_multiple_discounts_selling_id_foreign` (`selling_id`);

--
-- Indexes for table `selling_poins`
--
ALTER TABLE `selling_poins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_poins_selling_id_foreign` (`selling_id`);

--
-- Indexes for table `selling_promotions`
--
ALTER TABLE `selling_promotions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selling_promotions_code_unique` (`code`),
  ADD KEY `selling_promotions_selling_id_foreign` (`selling_id`),
  ADD KEY `selling_promotions_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `selling_promotion_items`
--
ALTER TABLE `selling_promotion_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_promotion_items_selling_promotion_id_foreign` (`selling_promotion_id`),
  ADD KEY `selling_promotion_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `selling_promotion_nested_discounts`
--
ALTER TABLE `selling_promotion_nested_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_promotion_nested_discounts_selling_promotion_id_foreign` (`selling_promotion_id`);

--
-- Indexes for table `selling_receivables`
--
ALTER TABLE `selling_receivables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selling_receivables_code_unique` (`code`),
  ADD KEY `selling_receivables_user_id_foreign` (`user_id`);

--
-- Indexes for table `selling_receivable_details`
--
ALTER TABLE `selling_receivable_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_receivable_details_selling_receivable_id_foreign` (`selling_receivable_id`),
  ADD KEY `selling_receivable_details_selling_id_foreign` (`selling_id`),
  ADD KEY `selling_receivable_details_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `selling_receivable_detail_multiple_accounts`
--
ALTER TABLE `selling_receivable_detail_multiple_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `srma_selling_receivable_id_foreign` (`selling_receivable_detail_id`),
  ADD KEY `srma_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `selling_returns`
--
ALTER TABLE `selling_returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selling_returns_code_unique` (`code`),
  ADD KEY `selling_returns_selling_id_foreign` (`selling_id`),
  ADD KEY `selling_returns_customer_id_foreign` (`customer_id`),
  ADD KEY `selling_returns_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `selling_returns_user_id_foreign` (`user_id`),
  ADD KEY `selling_returns_seller_id_foreign` (`seller_id`),
  ADD KEY `selling_returns_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `selling_returns_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `selling_return_addresses`
--
ALTER TABLE `selling_return_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_return_addresses_selling_return_id_foreign` (`selling_return_id`);

--
-- Indexes for table `selling_return_contacts`
--
ALTER TABLE `selling_return_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_return_contacts_selling_return_id_foreign` (`selling_return_id`);

--
-- Indexes for table `selling_return_details`
--
ALTER TABLE `selling_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_return_details_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `selling_return_details_seller_id_foreign` (`seller_id`),
  ADD KEY `selling_return_details_item_id_foreign` (`item_id`),
  ADD KEY `selling_return_details_selling_return_id_foreign` (`selling_return_id`),
  ADD KEY `selling_return_details_selling_id_foreign` (`selling_id`),
  ADD KEY `selling_return_details_selling_detail_id_foreign` (`selling_detail_id`);

--
-- Indexes for table `selling_return_detail_identities`
--
ALTER TABLE `selling_return_detail_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_return_detail_identities_detail_id_foreign` (`selling_return_detail_id`);

--
-- Indexes for table `selling_return_detail_multiple_discounts`
--
ALTER TABLE `selling_return_detail_multiple_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selling_return_detail_pcs`
--
ALTER TABLE `selling_return_detail_pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_return_detail_pcs_selling_return_detail_id_foreign` (`selling_return_detail_id`);

--
-- Indexes for table `selling_shippings`
--
ALTER TABLE `selling_shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_shippings_selling_id_foreign` (`selling_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Indexes for table `setting_approvals`
--
ALTER TABLE `setting_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_approvals_role_id_foreign` (`role_id`),
  ADD KEY `setting_approvals_user_id_foreign` (`user_id`);

--
-- Indexes for table `setting_codes`
--
ALTER TABLE `setting_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_codes_role_id_foreign` (`role_id`);

--
-- Indexes for table `setting_promotions`
--
ALTER TABLE `setting_promotions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_promotions_code_unique` (`code`),
  ADD KEY `setting_promotions_customer_id_foreign` (`customer_id`),
  ADD KEY `setting_promotions_user_id_foreign` (`user_id`);

--
-- Indexes for table `setting_promotion_discounts`
--
ALTER TABLE `setting_promotion_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_promotion_discounts_setting_promotion_id_foreign` (`setting_promotion_id`);

--
-- Indexes for table `setting_promotion_free_items`
--
ALTER TABLE `setting_promotion_free_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_promotion_free_items_item_id_foreign` (`item_id`),
  ADD KEY `setting_promotion_free_items_setting_promotion_id_foreign` (`setting_promotion_id`);

--
-- Indexes for table `setting_promotion_vouchers`
--
ALTER TABLE `setting_promotion_vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_promotion_vouchers_setting_promotion_id_foreign` (`setting_promotion_id`),
  ADD KEY `setting_promotion_vouchers_voucher_id_foreign` (`voucher_id`);

--
-- Indexes for table `stock_cards`
--
ALTER TABLE `stock_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_cards_user_id_foreign` (`user_id`),
  ADD KEY `stock_cards_item_id_foreign` (`item_id`),
  ADD KEY `stock_cards_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `stock_cards_production_code_date_index` (`production_code_date`),
  ADD KEY `stock_cards_production_code_index` (`production_code`),
  ADD KEY `stock_cards_reference_code_index` (`reference_code`),
  ADD KEY `stock_cards_date_index` (`date`);

--
-- Indexes for table `stock_ins`
--
ALTER TABLE `stock_ins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_ins_code_unique` (`code`),
  ADD KEY `stock_ins_user_id_foreign` (`user_id`),
  ADD KEY `stock_ins_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `stock_ins_purchaseing_id_foreign` (`purchaseing_id`);

--
-- Indexes for table `stock_in_details`
--
ALTER TABLE `stock_in_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_in_details_stock_in_id_foreign` (`stock_in_id`),
  ADD KEY `stock_in_details_item_id_foreign` (`item_id`);

--
-- Indexes for table `stock_in_detail_identities`
--
ALTER TABLE `stock_in_detail_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_in_detail_identities_stock_in_detail_id_foreign` (`stock_in_detail_id`);

--
-- Indexes for table `stock_in_detail_pcs`
--
ALTER TABLE `stock_in_detail_pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_in_detail_pcs_stock_in_detail_id_foreign` (`stock_in_detail_id`);

--
-- Indexes for table `stock_mutations`
--
ALTER TABLE `stock_mutations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_mutations_code_unique` (`code`),
  ADD KEY `stock_mutations_user_id_foreign` (`user_id`);

--
-- Indexes for table `stock_mutation_details`
--
ALTER TABLE `stock_mutation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_mutation_details_item_id_foreign` (`item_id`),
  ADD KEY `stock_mutation_details_stock_mutation_id_foreign` (`stock_mutation_id`),
  ADD KEY `stock_mutation_details_warehouse_to_id_foreign` (`warehouse_to_id`),
  ADD KEY `stock_mutation_details_warehouse_from_id_foreign` (`warehouse_from_id`);

--
-- Indexes for table `stock_mutation_detail_pcs`
--
ALTER TABLE `stock_mutation_detail_pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_mutation_detail_pcs_stock_mutation_detail_id_foreign` (`stock_mutation_detail_id`);

--
-- Indexes for table `stock_opnames`
--
ALTER TABLE `stock_opnames`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_opnames_code_unique` (`code`),
  ADD KEY `stock_opnames_user_id_foreign` (`user_id`),
  ADD KEY `stock_opnames_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `stock_opname_details`
--
ALTER TABLE `stock_opname_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_opname_details_stock_opname_id_foreign` (`stock_opname_id`),
  ADD KEY `stock_opname_details_item_id_foreign` (`item_id`);

--
-- Indexes for table `stock_opname_detail_identities`
--
ALTER TABLE `stock_opname_detail_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_opname_detail_identities_stock_opname_detail_id_foreign` (`stock_opname_detail_id`);

--
-- Indexes for table `stock_opname_detail_pcs`
--
ALTER TABLE `stock_opname_detail_pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_opname_detail_pcs_stock_opname_detail_id_foreign` (`stock_opname_detail_id`);

--
-- Indexes for table `stock_outs`
--
ALTER TABLE `stock_outs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_outs_code_unique` (`code`),
  ADD KEY `stock_outs_user_id_foreign` (`user_id`),
  ADD KEY `stock_outs_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `stock_outs_purchaseing_return_id_foreign` (`purchaseing_return_id`),
  ADD KEY `stock_outs_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `stock_out_details`
--
ALTER TABLE `stock_out_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_out_details_stock_out_id_foreign` (`stock_out_id`),
  ADD KEY `stock_out_details_item_id_foreign` (`item_id`);

--
-- Indexes for table `stock_out_detail_identities`
--
ALTER TABLE `stock_out_detail_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_out_detail_identities_stock_out_detail_id_foreign` (`stock_out_detail_id`);

--
-- Indexes for table `stock_out_detail_pcs`
--
ALTER TABLE `stock_out_detail_pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_out_detail_pcs_stock_out_detail_id_foreign` (`stock_out_detail_id`);

--
-- Indexes for table `summary_transactions`
--
ALTER TABLE `summary_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `summary_transactions_name_index` (`name`),
  ADD KEY `summary_transactions_start_date_index` (`start_date`),
  ADD KEY `summary_transactions_end_date_index` (`end_date`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_code_unique` (`code`),
  ADD KEY `suppliers_name_index` (`name`);

--
-- Indexes for table `supplier_addresses`
--
ALTER TABLE `supplier_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_addresses_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `supplier_address_maps`
--
ALTER TABLE `supplier_address_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_address_maps_supplier_address_id_foreign` (`supplier_address_id`);

--
-- Indexes for table `supplier_banks`
--
ALTER TABLE `supplier_banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_banks_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `supplier_contacts`
--
ALTER TABLE `supplier_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `supplier_contacts_email_unique` (`email`),
  ADD UNIQUE KEY `supplier_contacts_phone_unique` (`phone`),
  ADD KEY `supplier_contacts_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `supplier_files`
--
ALTER TABLE `supplier_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_files_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `supplier_identities`
--
ALTER TABLE `supplier_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_identities_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `supplier_taxes`
--
ALTER TABLE `supplier_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_taxes_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `units_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_employe_identity_unique` (`employe_identity`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_parent_id_foreign` (`parent_id`),
  ADD KEY `users_group_role_id_foreign` (`group_role_id`),
  ADD KEY `users_department_id_foreign` (`department_id`),
  ADD KEY `users_division_id_foreign` (`division_id`),
  ADD KEY `users_position_id_foreign` (`position_id`),
  ADD KEY `users_area_id_foreign` (`area_id`),
  ADD KEY `users_fullname_index` (`fullname`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_address_maps`
--
ALTER TABLE `user_address_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_address_maps_user_address_id_foreign` (`user_address_id`);

--
-- Indexes for table `user_banks`
--
ALTER TABLE `user_banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_banks_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_commissions`
--
ALTER TABLE `user_commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_commissions_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_contacts_email_unique` (`email`),
  ADD UNIQUE KEY `user_contacts_phone_unique` (`phone`),
  ADD KEY `user_contacts_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_files`
--
ALTER TABLE `user_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_files_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_personal_datas`
--
ALTER TABLE `user_personal_datas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_personal_datas_identity_card_unique` (`identity_card`),
  ADD KEY `user_personal_datas_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_saldo_cards`
--
ALTER TABLE `user_saldo_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_saldo_cards_user_id_foreign` (`user_id`),
  ADD KEY `user_saldo_cards_employe_id_foreign` (`employe_id`),
  ADD KEY `user_saldo_cards_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `user_saldo_cards_reference_code_index` (`reference_code`),
  ADD KEY `user_saldo_cards_date_index` (`date`);

--
-- Indexes for table `user_shifts`
--
ALTER TABLE `user_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_shifts_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_shift_hours`
--
ALTER TABLE `user_shift_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_shift_hours_user_id_foreign` (`user_id`),
  ADD KEY `user_shift_hours_user_shift_id_foreign` (`user_shift_id`);

--
-- Indexes for table `user_taxes`
--
ALTER TABLE `user_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_taxes_user_id_foreign` (`user_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouses_code_unique` (`code`),
  ADD KEY `warehouses_name_index` (`name`);

--
-- Indexes for table `warehouse_addresses`
--
ALTER TABLE `warehouse_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_addresses_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `warehouse_address_maps`
--
ALTER TABLE `warehouse_address_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_address_maps_warehouse_address_id_foreign` (`warehouse_address_id`);

--
-- Indexes for table `warehouse_contacts`
--
ALTER TABLE `warehouse_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouse_contacts_email_unique` (`email`),
  ADD UNIQUE KEY `warehouse_contacts_phone_unique` (`phone`),
  ADD KEY `warehouse_contacts_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `warehouse_stocks`
--
ALTER TABLE `warehouse_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_stocks_item_id_foreign` (`item_id`),
  ADD KEY `warehouse_stocks_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `warehouse_stocks_production_code_date_index` (`production_code_date`),
  ADD KEY `warehouse_stocks_production_code_index` (`production_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_balances`
--
ALTER TABLE `account_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `area_maps`
--
ALTER TABLE `area_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `background_processes`
--
ALTER TABLE `background_processes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `background_process_infos`
--
ALTER TABLE `background_process_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_mrdfs`
--
ALTER TABLE `batch_mrdfs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_mrdf_identities`
--
ALTER TABLE `batch_mrdf_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_mrdf_pcs`
--
ALTER TABLE `batch_mrdf_pcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_mrds`
--
ALTER TABLE `batch_mrds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_mrd_steps`
--
ALTER TABLE `batch_mrd_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_mrs`
--
ALTER TABLE `batch_mrs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_pndfs`
--
ALTER TABLE `batch_pndfs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_pndf_identities`
--
ALTER TABLE `batch_pndf_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_pndf_pcs`
--
ALTER TABLE `batch_pndf_pcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_pnds`
--
ALTER TABLE `batch_pnds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_pnd_steps`
--
ALTER TABLE `batch_pnd_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_pns`
--
ALTER TABLE `batch_pns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_stwdfs`
--
ALTER TABLE `batch_stwdfs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_stwdf_identities`
--
ALTER TABLE `batch_stwdf_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_stwdf_pcs`
--
ALTER TABLE `batch_stwdf_pcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_stwds`
--
ALTER TABLE `batch_stwds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_stwd_identities`
--
ALTER TABLE `batch_stwd_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_stwd_pcs`
--
ALTER TABLE `batch_stwd_pcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_stws`
--
ALTER TABLE `batch_stws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_wods`
--
ALTER TABLE `batch_wods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_wos`
--
ALTER TABLE `batch_wos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_wo_user_approvals`
--
ALTER TABLE `batch_wo_user_approvals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_ins`
--
ALTER TABLE `cash_ins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_in_details`
--
ALTER TABLE `cash_in_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_mutations`
--
ALTER TABLE `cash_mutations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_mutation_details`
--
ALTER TABLE `cash_mutation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_outs`
--
ALTER TABLE `cash_outs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_out_details`
--
ALTER TABLE `cash_out_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `chart_of_account_transactions`
--
ALTER TABLE `chart_of_account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=537;

--
-- AUTO_INCREMENT for table `city_maps`
--
ALTER TABLE `city_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commission_sales_cards`
--
ALTER TABLE `commission_sales_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commission_sales_transfers`
--
ALTER TABLE `commission_sales_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commission_sales_transfer_details`
--
ALTER TABLE `commission_sales_transfer_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cost_of_products_sold_cards`
--
ALTER TABLE `cost_of_products_sold_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_address_maps`
--
ALTER TABLE `customer_address_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_banks`
--
ALTER TABLE `customer_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_files`
--
ALTER TABLE `customer_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_identities`
--
ALTER TABLE `customer_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_saldo_cards`
--
ALTER TABLE `customer_saldo_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_taxes`
--
ALTER TABLE `customer_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_term_of_payments`
--
ALTER TABLE `customer_term_of_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debt_cards`
--
ALTER TABLE `debt_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debt_saldo_cards`
--
ALTER TABLE `debt_saldo_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_orders`
--
ALTER TABLE `delivery_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_order_customer_addresses`
--
ALTER TABLE `delivery_order_customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_order_customer_contacts`
--
ALTER TABLE `delivery_order_customer_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_order_details`
--
ALTER TABLE `delivery_order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_order_shippings`
--
ALTER TABLE `delivery_order_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expeditions`
--
ALTER TABLE `expeditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expedition_destination_maps`
--
ALTER TABLE `expedition_destination_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expedition_origin_maps`
--
ALTER TABLE `expedition_origin_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expedition_prices`
--
ALTER TABLE `expedition_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fixed_assets`
--
ALTER TABLE `fixed_assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `formula_material_items`
--
ALTER TABLE `formula_material_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formula_material_item_details`
--
ALTER TABLE `formula_material_item_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formula_material_item_steps`
--
ALTER TABLE `formula_material_item_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grants`
--
ALTER TABLE `grants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `grant_operators`
--
ALTER TABLE `grant_operators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `group_assets`
--
ALTER TABLE `group_assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;

--
-- AUTO_INCREMENT for table `group_roles`
--
ALTER TABLE `group_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `item_detail_categories`
--
ALTER TABLE `item_detail_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_identities`
--
ALTER TABLE `item_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_images`
--
ALTER TABLE `item_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_prices`
--
ALTER TABLE `item_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `item_price_commissions`
--
ALTER TABLE `item_price_commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_price_poins`
--
ALTER TABLE `item_price_poins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_price_promotions`
--
ALTER TABLE `item_price_promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_price_promotion_discounts`
--
ALTER TABLE `item_price_promotion_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_price_promotion_free_items`
--
ALTER TABLE `item_price_promotion_free_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_price_promotion_vouchers`
--
ALTER TABLE `item_price_promotion_vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_price_quantities`
--
ALTER TABLE `item_price_quantities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journal_details`
--
ALTER TABLE `journal_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poin_cards`
--
ALTER TABLE `poin_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `po_customers`
--
ALTER TABLE `po_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_customer_addionals`
--
ALTER TABLE `po_customer_addionals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_customer_customer_addresses`
--
ALTER TABLE `po_customer_customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_customer_customer_contacts`
--
ALTER TABLE `po_customer_customer_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_customer_details`
--
ALTER TABLE `po_customer_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_customer_detail_multiple_discounts`
--
ALTER TABLE `po_customer_detail_multiple_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_customer_multiple_accounts`
--
ALTER TABLE `po_customer_multiple_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_customer_multiple_discounts`
--
ALTER TABLE `po_customer_multiple_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_customer_shippings`
--
ALTER TABLE `po_customer_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_customer_user_approvals`
--
ALTER TABLE `po_customer_user_approvals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_suppliers`
--
ALTER TABLE `po_suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_supplier_addionals`
--
ALTER TABLE `po_supplier_addionals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_supplier_details`
--
ALTER TABLE `po_supplier_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_supplier_detail_multiple_discounts`
--
ALTER TABLE `po_supplier_detail_multiple_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_supplier_multiple_accounts`
--
ALTER TABLE `po_supplier_multiple_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_supplier_multiple_discounts`
--
ALTER TABLE `po_supplier_multiple_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_supplier_supplier_addresses`
--
ALTER TABLE `po_supplier_supplier_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_supplier_supplier_contacts`
--
ALTER TABLE `po_supplier_supplier_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_supplier_user_approvals`
--
ALTER TABLE `po_supplier_user_approvals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_divisions`
--
ALTER TABLE `production_divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `province_maps`
--
ALTER TABLE `province_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseings`
--
ALTER TABLE `purchaseings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_addionals`
--
ALTER TABLE `purchaseing_addionals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_debts`
--
ALTER TABLE `purchaseing_debts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_debt_details`
--
ALTER TABLE `purchaseing_debt_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_debt_detail_multiple_accounts`
--
ALTER TABLE `purchaseing_debt_detail_multiple_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_details`
--
ALTER TABLE `purchaseing_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_detail_identities`
--
ALTER TABLE `purchaseing_detail_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_detail_multiple_discounts`
--
ALTER TABLE `purchaseing_detail_multiple_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_detail_pcs`
--
ALTER TABLE `purchaseing_detail_pcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_multiple_accounts`
--
ALTER TABLE `purchaseing_multiple_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_multiple_discounts`
--
ALTER TABLE `purchaseing_multiple_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_returns`
--
ALTER TABLE `purchaseing_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_return_addresses`
--
ALTER TABLE `purchaseing_return_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_return_contacts`
--
ALTER TABLE `purchaseing_return_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_return_details`
--
ALTER TABLE `purchaseing_return_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_return_detail_identities`
--
ALTER TABLE `purchaseing_return_detail_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_return_detail_multiple_discounts`
--
ALTER TABLE `purchaseing_return_detail_multiple_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_return_detail_pcs`
--
ALTER TABLE `purchaseing_return_detail_pcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_supplier_addresses`
--
ALTER TABLE `purchaseing_supplier_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseing_supplier_contacts`
--
ALTER TABLE `purchaseing_supplier_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_addionals`
--
ALTER TABLE `quotation_addionals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_customer_addresses`
--
ALTER TABLE `quotation_customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_customer_contacts`
--
ALTER TABLE `quotation_customer_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_details`
--
ALTER TABLE `quotation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_detail_multiple_discounts`
--
ALTER TABLE `quotation_detail_multiple_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_multiple_discounts`
--
ALTER TABLE `quotation_multiple_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_shippings`
--
ALTER TABLE `quotation_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_user_approvals`
--
ALTER TABLE `quotation_user_approvals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receivable_cards`
--
ALTER TABLE `receivable_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receivable_saldo_cards`
--
ALTER TABLE `receivable_saldo_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `sellings`
--
ALTER TABLE `sellings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_addionals`
--
ALTER TABLE `selling_addionals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_commission_saleses`
--
ALTER TABLE `selling_commission_saleses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_customer_addresses`
--
ALTER TABLE `selling_customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_customer_contacts`
--
ALTER TABLE `selling_customer_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_details`
--
ALTER TABLE `selling_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_detail_commission_saleses`
--
ALTER TABLE `selling_detail_commission_saleses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_detail_identities`
--
ALTER TABLE `selling_detail_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_detail_multiple_discounts`
--
ALTER TABLE `selling_detail_multiple_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_detail_pcs`
--
ALTER TABLE `selling_detail_pcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_detail_poins`
--
ALTER TABLE `selling_detail_poins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_detail_promotions`
--
ALTER TABLE `selling_detail_promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_detail_promotion_items`
--
ALTER TABLE `selling_detail_promotion_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_detail_promotion_nested_discounts`
--
ALTER TABLE `selling_detail_promotion_nested_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_multiple_accounts`
--
ALTER TABLE `selling_multiple_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_multiple_discounts`
--
ALTER TABLE `selling_multiple_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_poins`
--
ALTER TABLE `selling_poins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_promotions`
--
ALTER TABLE `selling_promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_promotion_items`
--
ALTER TABLE `selling_promotion_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_promotion_nested_discounts`
--
ALTER TABLE `selling_promotion_nested_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_receivables`
--
ALTER TABLE `selling_receivables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_receivable_details`
--
ALTER TABLE `selling_receivable_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_receivable_detail_multiple_accounts`
--
ALTER TABLE `selling_receivable_detail_multiple_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_returns`
--
ALTER TABLE `selling_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_return_addresses`
--
ALTER TABLE `selling_return_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_return_contacts`
--
ALTER TABLE `selling_return_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_return_details`
--
ALTER TABLE `selling_return_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_return_detail_identities`
--
ALTER TABLE `selling_return_detail_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_return_detail_multiple_discounts`
--
ALTER TABLE `selling_return_detail_multiple_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_return_detail_pcs`
--
ALTER TABLE `selling_return_detail_pcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_shippings`
--
ALTER TABLE `selling_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `setting_approvals`
--
ALTER TABLE `setting_approvals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting_codes`
--
ALTER TABLE `setting_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `setting_promotions`
--
ALTER TABLE `setting_promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting_promotion_discounts`
--
ALTER TABLE `setting_promotion_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting_promotion_free_items`
--
ALTER TABLE `setting_promotion_free_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting_promotion_vouchers`
--
ALTER TABLE `setting_promotion_vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_cards`
--
ALTER TABLE `stock_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_ins`
--
ALTER TABLE `stock_ins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_in_details`
--
ALTER TABLE `stock_in_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_in_detail_identities`
--
ALTER TABLE `stock_in_detail_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_in_detail_pcs`
--
ALTER TABLE `stock_in_detail_pcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_mutations`
--
ALTER TABLE `stock_mutations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_mutation_details`
--
ALTER TABLE `stock_mutation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_mutation_detail_pcs`
--
ALTER TABLE `stock_mutation_detail_pcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_opnames`
--
ALTER TABLE `stock_opnames`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_opname_details`
--
ALTER TABLE `stock_opname_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_opname_detail_identities`
--
ALTER TABLE `stock_opname_detail_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_opname_detail_pcs`
--
ALTER TABLE `stock_opname_detail_pcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_outs`
--
ALTER TABLE `stock_outs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_out_details`
--
ALTER TABLE `stock_out_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_out_detail_identities`
--
ALTER TABLE `stock_out_detail_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_out_detail_pcs`
--
ALTER TABLE `stock_out_detail_pcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `summary_transactions`
--
ALTER TABLE `summary_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_addresses`
--
ALTER TABLE `supplier_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_address_maps`
--
ALTER TABLE `supplier_address_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_banks`
--
ALTER TABLE `supplier_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_contacts`
--
ALTER TABLE `supplier_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_files`
--
ALTER TABLE `supplier_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_identities`
--
ALTER TABLE `supplier_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_taxes`
--
ALTER TABLE `supplier_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_address_maps`
--
ALTER TABLE `user_address_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_banks`
--
ALTER TABLE `user_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_commissions`
--
ALTER TABLE `user_commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_files`
--
ALTER TABLE `user_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_personal_datas`
--
ALTER TABLE `user_personal_datas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_saldo_cards`
--
ALTER TABLE `user_saldo_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_shifts`
--
ALTER TABLE `user_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_shift_hours`
--
ALTER TABLE `user_shift_hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_taxes`
--
ALTER TABLE `user_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warehouse_addresses`
--
ALTER TABLE `warehouse_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warehouse_address_maps`
--
ALTER TABLE `warehouse_address_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse_contacts`
--
ALTER TABLE `warehouse_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warehouse_stocks`
--
ALTER TABLE `warehouse_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_balances`
--
ALTER TABLE `account_balances`
  ADD CONSTRAINT `account_balances_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `account_balances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `area_maps`
--
ALTER TABLE `area_maps`
  ADD CONSTRAINT `area_maps_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `background_processes`
--
ALTER TABLE `background_processes`
  ADD CONSTRAINT `background_processes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `background_process_infos`
--
ALTER TABLE `background_process_infos`
  ADD CONSTRAINT `background_process_infos_background_process_id_foreign` FOREIGN KEY (`background_process_id`) REFERENCES `background_processes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_mrdfs`
--
ALTER TABLE `batch_mrdfs`
  ADD CONSTRAINT `batch_mrdfs_batch_mrd_id_foreign` FOREIGN KEY (`batch_mrd_id`) REFERENCES `batch_mrds` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_mrdfs_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_mrdf_identities`
--
ALTER TABLE `batch_mrdf_identities`
  ADD CONSTRAINT `batch_mrdf_identities_batch_mrdf_id_foreign` FOREIGN KEY (`batch_mrdf_id`) REFERENCES `batch_mrdfs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_mrdf_pcs`
--
ALTER TABLE `batch_mrdf_pcs`
  ADD CONSTRAINT `batch_mrdf_pcs_batch_mrdf_id_foreign` FOREIGN KEY (`batch_mrdf_id`) REFERENCES `batch_mrdfs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_mrds`
--
ALTER TABLE `batch_mrds`
  ADD CONSTRAINT `batch_mrds_batch_mr_id_foreign` FOREIGN KEY (`batch_mr_id`) REFERENCES `batch_mrs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_mrds_batch_wo_id_foreign` FOREIGN KEY (`batch_wo_id`) REFERENCES `batch_wos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_mrds_batch_wod_id_foreign` FOREIGN KEY (`batch_wod_id`) REFERENCES `batch_wods` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_mrds_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_mrds_po_customer_detail_id_foreign` FOREIGN KEY (`po_customer_detail_id`) REFERENCES `po_customer_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_mrds_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_mrd_steps`
--
ALTER TABLE `batch_mrd_steps`
  ADD CONSTRAINT `batch_mrd_steps_batch_mrd_id_foreign` FOREIGN KEY (`batch_mrd_id`) REFERENCES `batch_mrds` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_mrd_steps_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_mrd_steps_production_division_id_foreign` FOREIGN KEY (`production_division_id`) REFERENCES `production_divisions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_mrs`
--
ALTER TABLE `batch_mrs`
  ADD CONSTRAINT `batch_mrs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_mrs_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_pndfs`
--
ALTER TABLE `batch_pndfs`
  ADD CONSTRAINT `batch_pndfs_batch_pnd_id_foreign` FOREIGN KEY (`batch_pnd_id`) REFERENCES `batch_pnds` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_pndfs_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_pndf_identities`
--
ALTER TABLE `batch_pndf_identities`
  ADD CONSTRAINT `batch_pndf_identities_batch_pndf_id_foreign` FOREIGN KEY (`batch_pndf_id`) REFERENCES `batch_pndfs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_pndf_pcs`
--
ALTER TABLE `batch_pndf_pcs`
  ADD CONSTRAINT `batch_pndf_pcs_batch_pndf_id_foreign` FOREIGN KEY (`batch_pndf_id`) REFERENCES `batch_pndfs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_pnds`
--
ALTER TABLE `batch_pnds`
  ADD CONSTRAINT `batch_pnds_batch_mr_id_foreign` FOREIGN KEY (`batch_mr_id`) REFERENCES `batch_mrs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_pnds_batch_mrd_id_foreign` FOREIGN KEY (`batch_mrd_id`) REFERENCES `batch_mrds` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_pnds_batch_pn_id_foreign` FOREIGN KEY (`batch_pn_id`) REFERENCES `batch_pns` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_pnds_batch_wo_id_foreign` FOREIGN KEY (`batch_wo_id`) REFERENCES `batch_wos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_pnds_batch_wod_id_foreign` FOREIGN KEY (`batch_wod_id`) REFERENCES `batch_wods` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_pnds_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_pnds_po_customer_detail_id_foreign` FOREIGN KEY (`po_customer_detail_id`) REFERENCES `po_customer_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_pnds_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_pnd_steps`
--
ALTER TABLE `batch_pnd_steps`
  ADD CONSTRAINT `batch_pnd_steps_batch_pnd_id_foreign` FOREIGN KEY (`batch_pnd_id`) REFERENCES `batch_pnds` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_pnd_steps_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_pnd_steps_production_division_id_foreign` FOREIGN KEY (`production_division_id`) REFERENCES `production_divisions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_pns`
--
ALTER TABLE `batch_pns`
  ADD CONSTRAINT `batch_pns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_pns_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_stwdfs`
--
ALTER TABLE `batch_stwdfs`
  ADD CONSTRAINT `batch_stwdfs_batch_stwd_id_foreign` FOREIGN KEY (`batch_stwd_id`) REFERENCES `batch_stwds` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_stwdfs_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_stwdf_identities`
--
ALTER TABLE `batch_stwdf_identities`
  ADD CONSTRAINT `batch_stwdf_identities_batch_stwdf_id_foreign` FOREIGN KEY (`batch_stwdf_id`) REFERENCES `batch_stwdfs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_stwdf_pcs`
--
ALTER TABLE `batch_stwdf_pcs`
  ADD CONSTRAINT `batch_stwdf_pcs_batch_stwdf_id_foreign` FOREIGN KEY (`batch_stwdf_id`) REFERENCES `batch_stwdfs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_stwds`
--
ALTER TABLE `batch_stwds`
  ADD CONSTRAINT `batch_stwds_batch_mr_id_foreign` FOREIGN KEY (`batch_mr_id`) REFERENCES `batch_mrs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_stwds_batch_mrd_id_foreign` FOREIGN KEY (`batch_mrd_id`) REFERENCES `batch_mrds` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_stwds_batch_pn_id_foreign` FOREIGN KEY (`batch_pn_id`) REFERENCES `batch_pns` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_stwds_batch_pnd_id_foreign` FOREIGN KEY (`batch_pnd_id`) REFERENCES `batch_pnds` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_stwds_batch_stw_id_foreign` FOREIGN KEY (`batch_stw_id`) REFERENCES `batch_stws` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_stwds_batch_wo_id_foreign` FOREIGN KEY (`batch_wo_id`) REFERENCES `batch_wos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_stwds_batch_wod_id_foreign` FOREIGN KEY (`batch_wod_id`) REFERENCES `batch_wods` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_stwds_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_stwds_po_customer_detail_id_foreign` FOREIGN KEY (`po_customer_detail_id`) REFERENCES `po_customer_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_stwds_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_stwd_identities`
--
ALTER TABLE `batch_stwd_identities`
  ADD CONSTRAINT `batch_stwd_identities_batch_stwd_id_foreign` FOREIGN KEY (`batch_stwd_id`) REFERENCES `batch_stwds` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_stwd_pcs`
--
ALTER TABLE `batch_stwd_pcs`
  ADD CONSTRAINT `batch_stwd_pcs_batch_stwd_id_foreign` FOREIGN KEY (`batch_stwd_id`) REFERENCES `batch_stwds` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_stws`
--
ALTER TABLE `batch_stws`
  ADD CONSTRAINT `batch_stws_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_stws_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_stws_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_wods`
--
ALTER TABLE `batch_wods`
  ADD CONSTRAINT `batch_wods_batch_wo_id_foreign` FOREIGN KEY (`batch_wo_id`) REFERENCES `batch_wos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_wods_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_wods_po_customer_detail_id_foreign` FOREIGN KEY (`po_customer_detail_id`) REFERENCES `po_customer_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_wods_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_wos`
--
ALTER TABLE `batch_wos`
  ADD CONSTRAINT `batch_wos_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_wos_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_wos_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_wos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `batch_wo_user_approvals`
--
ALTER TABLE `batch_wo_user_approvals`
  ADD CONSTRAINT `batch_wo_user_approvals_batch_wo_id_foreign` FOREIGN KEY (`batch_wo_id`) REFERENCES `batch_wos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `batch_wo_user_approvals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `cash_ins`
--
ALTER TABLE `cash_ins`
  ADD CONSTRAINT `cash_ins_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cash_ins_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cash_ins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `cash_in_details`
--
ALTER TABLE `cash_in_details`
  ADD CONSTRAINT `cash_in_details_cash_in_id_foreign` FOREIGN KEY (`cash_in_id`) REFERENCES `cash_ins` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cash_in_details_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `cash_mutations`
--
ALTER TABLE `cash_mutations`
  ADD CONSTRAINT `cash_mutations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `cash_mutation_details`
--
ALTER TABLE `cash_mutation_details`
  ADD CONSTRAINT `cash_mutation_details_cash_mutation_id_foreign` FOREIGN KEY (`cash_mutation_id`) REFERENCES `cash_mutations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cash_mutation_details_chart_of_account_from_id_foreign` FOREIGN KEY (`chart_of_account_from_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cash_mutation_details_chart_of_account_to_id_foreign` FOREIGN KEY (`chart_of_account_to_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `cash_outs`
--
ALTER TABLE `cash_outs`
  ADD CONSTRAINT `cash_outs_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cash_outs_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cash_outs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `cash_out_details`
--
ALTER TABLE `cash_out_details`
  ADD CONSTRAINT `cash_out_details_cash_out_id_foreign` FOREIGN KEY (`cash_out_id`) REFERENCES `cash_outs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cash_out_details_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD CONSTRAINT `chart_of_accounts_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `chart_of_account_transactions`
--
ALTER TABLE `chart_of_account_transactions`
  ADD CONSTRAINT `chart_of_account_transactions_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `city_maps`
--
ALTER TABLE `city_maps`
  ADD CONSTRAINT `city_maps_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `commission_sales_cards`
--
ALTER TABLE `commission_sales_cards`
  ADD CONSTRAINT `commission_sales_cards_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `commission_sales_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `commission_sales_transfers`
--
ALTER TABLE `commission_sales_transfers`
  ADD CONSTRAINT `commission_sales_transfers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `commission_sales_transfer_details`
--
ALTER TABLE `commission_sales_transfer_details`
  ADD CONSTRAINT `commission_sales_transfer_details_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `commission_sales_transfer_details_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `cost_of_products_sold_cards`
--
ALTER TABLE `cost_of_products_sold_cards`
  ADD CONSTRAINT `cost_of_products_sold_cards_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cost_of_products_sold_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_maps`
--
ALTER TABLE `customer_address_maps`
  ADD CONSTRAINT `customer_address_maps_customer_address_id_foreign` FOREIGN KEY (`customer_address_id`) REFERENCES `customer_addresses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customer_banks`
--
ALTER TABLE `customer_banks`
  ADD CONSTRAINT `customer_banks_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  ADD CONSTRAINT `customer_contacts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customer_files`
--
ALTER TABLE `customer_files`
  ADD CONSTRAINT `customer_files_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customer_identities`
--
ALTER TABLE `customer_identities`
  ADD CONSTRAINT `customer_identities_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customer_saldo_cards`
--
ALTER TABLE `customer_saldo_cards`
  ADD CONSTRAINT `customer_saldo_cards_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_saldo_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customer_taxes`
--
ALTER TABLE `customer_taxes`
  ADD CONSTRAINT `customer_taxes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customer_term_of_payments`
--
ALTER TABLE `customer_term_of_payments`
  ADD CONSTRAINT `customer_term_of_payments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `debt_cards`
--
ALTER TABLE `debt_cards`
  ADD CONSTRAINT `debt_cards_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `debt_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `debt_saldo_cards`
--
ALTER TABLE `debt_saldo_cards`
  ADD CONSTRAINT `debt_saldo_cards_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `debt_saldo_cards_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `debt_saldo_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `delivery_orders`
--
ALTER TABLE `delivery_orders`
  ADD CONSTRAINT `delivery_orders_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_orders_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_orders_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_orders_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_orders_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `delivery_order_customer_addresses`
--
ALTER TABLE `delivery_order_customer_addresses`
  ADD CONSTRAINT `delivery_order_customer_addresses_delivery_order_id_foreign` FOREIGN KEY (`delivery_order_id`) REFERENCES `delivery_orders` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `delivery_order_customer_contacts`
--
ALTER TABLE `delivery_order_customer_contacts`
  ADD CONSTRAINT `delivery_order_customer_contacts_delivery_order_id_foreign` FOREIGN KEY (`delivery_order_id`) REFERENCES `delivery_orders` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `delivery_order_details`
--
ALTER TABLE `delivery_order_details`
  ADD CONSTRAINT `delivery_order_details_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_order_details_delivery_order_id_foreign` FOREIGN KEY (`delivery_order_id`) REFERENCES `delivery_orders` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_order_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_order_details_po_customer_detail_id_foreign` FOREIGN KEY (`po_customer_detail_id`) REFERENCES `po_customer_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_order_details_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `delivery_order_shippings`
--
ALTER TABLE `delivery_order_shippings`
  ADD CONSTRAINT `delivery_order_shippings_delivery_order_id_foreign` FOREIGN KEY (`delivery_order_id`) REFERENCES `delivery_orders` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `divisions`
--
ALTER TABLE `divisions`
  ADD CONSTRAINT `divisions_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `expedition_destination_maps`
--
ALTER TABLE `expedition_destination_maps`
  ADD CONSTRAINT `expedition_destination_maps_expedition_id_foreign` FOREIGN KEY (`expedition_id`) REFERENCES `expeditions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `expedition_origin_maps`
--
ALTER TABLE `expedition_origin_maps`
  ADD CONSTRAINT `expedition_origin_maps_expedition_id_foreign` FOREIGN KEY (`expedition_id`) REFERENCES `expeditions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `expedition_prices`
--
ALTER TABLE `expedition_prices`
  ADD CONSTRAINT `expedition_prices_expedition_id_foreign` FOREIGN KEY (`expedition_id`) REFERENCES `expeditions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `fixed_assets`
--
ALTER TABLE `fixed_assets`
  ADD CONSTRAINT `fixed_assets_group_asset_id_foreign` FOREIGN KEY (`group_asset_id`) REFERENCES `group_assets` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `formula_material_items`
--
ALTER TABLE `formula_material_items`
  ADD CONSTRAINT `formula_material_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `formula_material_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `formula_material_item_details`
--
ALTER TABLE `formula_material_item_details`
  ADD CONSTRAINT `formula_material_item_details_formula_material_item_id_foreign` FOREIGN KEY (`formula_material_item_id`) REFERENCES `formula_material_items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `formula_material_item_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `formula_material_item_steps`
--
ALTER TABLE `formula_material_item_steps`
  ADD CONSTRAINT `formula_material_item_steps_formula_material_item_id_foreign` FOREIGN KEY (`formula_material_item_id`) REFERENCES `formula_material_items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `formula_material_item_steps_production_division_id_foreign` FOREIGN KEY (`production_division_id`) REFERENCES `production_divisions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `grants`
--
ALTER TABLE `grants`
  ADD CONSTRAINT `grants_group_role_id_foreign` FOREIGN KEY (`group_role_id`) REFERENCES `group_roles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `grants_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `grant_operators`
--
ALTER TABLE `grant_operators`
  ADD CONSTRAINT `grant_operators_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `grants` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `group_assets`
--
ALTER TABLE `group_assets`
  ADD CONSTRAINT `group_assets_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `group_assets` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `items_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `items_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD CONSTRAINT `item_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `item_categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_detail_categories`
--
ALTER TABLE `item_detail_categories`
  ADD CONSTRAINT `item_detail_categories_child_item_category_id_foreign` FOREIGN KEY (`child_item_category_id`) REFERENCES `item_categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `item_detail_categories_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `item_detail_categories_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_identities`
--
ALTER TABLE `item_identities`
  ADD CONSTRAINT `item_identities_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_images`
--
ALTER TABLE `item_images`
  ADD CONSTRAINT `item_images_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_prices`
--
ALTER TABLE `item_prices`
  ADD CONSTRAINT `item_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `item_prices_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_price_commissions`
--
ALTER TABLE `item_price_commissions`
  ADD CONSTRAINT `item_price_commissions_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `item_price_commissions_item_price_id_foreign` FOREIGN KEY (`item_price_id`) REFERENCES `item_prices` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_price_poins`
--
ALTER TABLE `item_price_poins`
  ADD CONSTRAINT `item_price_poins_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `item_price_poins_item_price_id_foreign` FOREIGN KEY (`item_price_id`) REFERENCES `item_prices` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_price_promotions`
--
ALTER TABLE `item_price_promotions`
  ADD CONSTRAINT `item_price_promotions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `item_price_promotions_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `item_price_promotions_item_price_id_foreign` FOREIGN KEY (`item_price_id`) REFERENCES `item_prices` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `item_price_promotions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_price_promotion_discounts`
--
ALTER TABLE `item_price_promotion_discounts`
  ADD CONSTRAINT `item_price_promotion_discounts_item_price_promotion_id_foreign` FOREIGN KEY (`item_price_promotion_id`) REFERENCES `item_price_promotions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_price_promotion_free_items`
--
ALTER TABLE `item_price_promotion_free_items`
  ADD CONSTRAINT `item_price_promotion_free_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `item_price_promotion_free_items_item_price_promotion_id_foreign` FOREIGN KEY (`item_price_promotion_id`) REFERENCES `item_price_promotions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_price_promotion_vouchers`
--
ALTER TABLE `item_price_promotion_vouchers`
  ADD CONSTRAINT `item_price_promotion_vouchers_item_price_promotion_id_foreign` FOREIGN KEY (`item_price_promotion_id`) REFERENCES `item_price_promotions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `item_price_promotion_vouchers_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `item_price_promotions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_price_quantities`
--
ALTER TABLE `item_price_quantities`
  ADD CONSTRAINT `item_price_quantities_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `item_price_quantities_item_price_id_foreign` FOREIGN KEY (`item_price_id`) REFERENCES `item_prices` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `journals`
--
ALTER TABLE `journals`
  ADD CONSTRAINT `journals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD CONSTRAINT `journal_details_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `journal_details_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `poin_cards`
--
ALTER TABLE `poin_cards`
  ADD CONSTRAINT `poin_cards_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `poin_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_customers`
--
ALTER TABLE `po_customers`
  ADD CONSTRAINT `po_customers_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_customers_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_customers_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_customer_addionals`
--
ALTER TABLE `po_customer_addionals`
  ADD CONSTRAINT `po_customer_addionals_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_customer_customer_addresses`
--
ALTER TABLE `po_customer_customer_addresses`
  ADD CONSTRAINT `po_customer_customer_addresses_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_customer_customer_contacts`
--
ALTER TABLE `po_customer_customer_contacts`
  ADD CONSTRAINT `po_customer_customer_contacts_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_customer_details`
--
ALTER TABLE `po_customer_details`
  ADD CONSTRAINT `po_customer_details_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_customer_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_customer_details_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_customer_details_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_customer_multiple_accounts`
--
ALTER TABLE `po_customer_multiple_accounts`
  ADD CONSTRAINT `po_customer_multiple_accounts_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_customer_multiple_accounts_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_customer_multiple_discounts`
--
ALTER TABLE `po_customer_multiple_discounts`
  ADD CONSTRAINT `po_customer_multiple_discounts_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_customer_shippings`
--
ALTER TABLE `po_customer_shippings`
  ADD CONSTRAINT `po_customer_shippings_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_customer_user_approvals`
--
ALTER TABLE `po_customer_user_approvals`
  ADD CONSTRAINT `po_customer_user_approvals_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_customer_user_approvals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_suppliers`
--
ALTER TABLE `po_suppliers`
  ADD CONSTRAINT `po_suppliers_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_suppliers_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_suppliers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_supplier_addionals`
--
ALTER TABLE `po_supplier_addionals`
  ADD CONSTRAINT `po_supplier_addionals_po_supplier_id_foreign` FOREIGN KEY (`po_supplier_id`) REFERENCES `po_suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_supplier_details`
--
ALTER TABLE `po_supplier_details`
  ADD CONSTRAINT `po_supplier_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_supplier_details_po_supplier_id_foreign` FOREIGN KEY (`po_supplier_id`) REFERENCES `po_suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_supplier_multiple_accounts`
--
ALTER TABLE `po_supplier_multiple_accounts`
  ADD CONSTRAINT `po_supplier_multiple_accounts_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_supplier_multiple_accounts_po_supplier_id_foreign` FOREIGN KEY (`po_supplier_id`) REFERENCES `po_suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_supplier_multiple_discounts`
--
ALTER TABLE `po_supplier_multiple_discounts`
  ADD CONSTRAINT `po_supplier_multiple_discounts_po_supplier_id_foreign` FOREIGN KEY (`po_supplier_id`) REFERENCES `po_suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_supplier_supplier_addresses`
--
ALTER TABLE `po_supplier_supplier_addresses`
  ADD CONSTRAINT `po_supplier_supplier_addresses_po_supplier_id_foreign` FOREIGN KEY (`po_supplier_id`) REFERENCES `po_suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_supplier_supplier_contacts`
--
ALTER TABLE `po_supplier_supplier_contacts`
  ADD CONSTRAINT `po_supplier_supplier_contacts_po_supplier_id_foreign` FOREIGN KEY (`po_supplier_id`) REFERENCES `po_suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_supplier_user_approvals`
--
ALTER TABLE `po_supplier_user_approvals`
  ADD CONSTRAINT `po_supplier_user_approvals_po_supplier_id_foreign` FOREIGN KEY (`po_supplier_id`) REFERENCES `po_suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `po_supplier_user_approvals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `production_divisions`
--
ALTER TABLE `production_divisions`
  ADD CONSTRAINT `production_divisions_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `province_maps`
--
ALTER TABLE `province_maps`
  ADD CONSTRAINT `province_maps_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseings`
--
ALTER TABLE `purchaseings`
  ADD CONSTRAINT `purchaseings_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseings_po_supplier_id_foreign` FOREIGN KEY (`po_supplier_id`) REFERENCES `po_suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseings_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseings_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_addionals`
--
ALTER TABLE `purchaseing_addionals`
  ADD CONSTRAINT `purchaseing_addionals_purchaseing_id_foreign` FOREIGN KEY (`purchaseing_id`) REFERENCES `purchaseings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_debts`
--
ALTER TABLE `purchaseing_debts`
  ADD CONSTRAINT `purchaseing_debts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_debt_details`
--
ALTER TABLE `purchaseing_debt_details`
  ADD CONSTRAINT `purchaseing_debt_details_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_debt_details_purchaseing_debt_id_foreign` FOREIGN KEY (`purchaseing_debt_id`) REFERENCES `purchaseing_debts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_debt_details_purchaseing_id_foreign` FOREIGN KEY (`purchaseing_id`) REFERENCES `purchaseings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_details`
--
ALTER TABLE `purchaseing_details`
  ADD CONSTRAINT `purchaseing_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_details_po_supplier_detail_id_foreign` FOREIGN KEY (`po_supplier_detail_id`) REFERENCES `po_supplier_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_details_po_supplier_id_foreign` FOREIGN KEY (`po_supplier_id`) REFERENCES `po_suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_details_purchaseing_id_foreign` FOREIGN KEY (`purchaseing_id`) REFERENCES `purchaseings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_detail_identities`
--
ALTER TABLE `purchaseing_detail_identities`
  ADD CONSTRAINT `purchaseing_detail_identities_purchaseing_detail_id_foreign` FOREIGN KEY (`purchaseing_detail_id`) REFERENCES `purchaseing_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_detail_pcs`
--
ALTER TABLE `purchaseing_detail_pcs`
  ADD CONSTRAINT `purchaseing_detail_pcs_purchaseing_detail_id_foreign` FOREIGN KEY (`purchaseing_detail_id`) REFERENCES `purchaseing_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_multiple_accounts`
--
ALTER TABLE `purchaseing_multiple_accounts`
  ADD CONSTRAINT `purchaseing_multiple_accounts_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_multiple_accounts_purchaseing_id_foreign` FOREIGN KEY (`purchaseing_id`) REFERENCES `purchaseings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_multiple_discounts`
--
ALTER TABLE `purchaseing_multiple_discounts`
  ADD CONSTRAINT `purchaseing_multiple_discounts_purchaseing_id_foreign` FOREIGN KEY (`purchaseing_id`) REFERENCES `purchaseings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_returns`
--
ALTER TABLE `purchaseing_returns`
  ADD CONSTRAINT `purchaseing_returns_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_returns_purchaseing_id_foreign` FOREIGN KEY (`purchaseing_id`) REFERENCES `purchaseings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_returns_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_returns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_returns_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_return_addresses`
--
ALTER TABLE `purchaseing_return_addresses`
  ADD CONSTRAINT `purchaseing_return_addresses_purchaseing_return_id_foreign` FOREIGN KEY (`purchaseing_return_id`) REFERENCES `purchaseing_returns` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_return_contacts`
--
ALTER TABLE `purchaseing_return_contacts`
  ADD CONSTRAINT `purchaseing_return_contacts_purchaseing_return_id_foreign` FOREIGN KEY (`purchaseing_return_id`) REFERENCES `purchaseing_returns` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_return_details`
--
ALTER TABLE `purchaseing_return_details`
  ADD CONSTRAINT `purchaseing_return_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_return_details_purchaseing_detail_id_foreign` FOREIGN KEY (`purchaseing_detail_id`) REFERENCES `purchaseing_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_return_details_purchaseing_id_foreign` FOREIGN KEY (`purchaseing_id`) REFERENCES `purchaseings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseing_return_details_purchaseing_return_id_foreign` FOREIGN KEY (`purchaseing_return_id`) REFERENCES `purchaseing_returns` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_return_detail_identities`
--
ALTER TABLE `purchaseing_return_detail_identities`
  ADD CONSTRAINT `purchaseing_return_detail_identities_detail_id_foreign` FOREIGN KEY (`purchaseing_return_detail_id`) REFERENCES `purchaseing_return_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_return_detail_pcs`
--
ALTER TABLE `purchaseing_return_detail_pcs`
  ADD CONSTRAINT `purchaseing_return_detail_ps_detail_id_foreign` FOREIGN KEY (`purchaseing_return_detail_id`) REFERENCES `purchaseing_return_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_supplier_addresses`
--
ALTER TABLE `purchaseing_supplier_addresses`
  ADD CONSTRAINT `purchaseing_supplier_addresses_purchaseing_id_foreign` FOREIGN KEY (`purchaseing_id`) REFERENCES `purchaseings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchaseing_supplier_contacts`
--
ALTER TABLE `purchaseing_supplier_contacts`
  ADD CONSTRAINT `purchaseing_supplier_contacts_purchaseing_id_foreign` FOREIGN KEY (`purchaseing_id`) REFERENCES `purchaseings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `quotations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `quotations_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `quotations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `quotation_addionals`
--
ALTER TABLE `quotation_addionals`
  ADD CONSTRAINT `quotation_addionals_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `quotation_customer_addresses`
--
ALTER TABLE `quotation_customer_addresses`
  ADD CONSTRAINT `quotation_customer_addresses_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `quotation_customer_contacts`
--
ALTER TABLE `quotation_customer_contacts`
  ADD CONSTRAINT `quotation_customer_contacts_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD CONSTRAINT `quotation_details_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `quotation_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `quotation_details_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `quotation_details_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `quotation_detail_multiple_discounts`
--
ALTER TABLE `quotation_detail_multiple_discounts`
  ADD CONSTRAINT `quotation_detail_multiple_discounts_quotation_detail_id_foreign` FOREIGN KEY (`quotation_detail_id`) REFERENCES `quotation_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `quotation_multiple_discounts`
--
ALTER TABLE `quotation_multiple_discounts`
  ADD CONSTRAINT `quotation_multiple_discounts_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `quotation_shippings`
--
ALTER TABLE `quotation_shippings`
  ADD CONSTRAINT `quotation_shippings_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `quotation_user_approvals`
--
ALTER TABLE `quotation_user_approvals`
  ADD CONSTRAINT `quotation_user_approvals_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `quotation_user_approvals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `receivable_cards`
--
ALTER TABLE `receivable_cards`
  ADD CONSTRAINT `receivable_cards_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `receivable_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `receivable_saldo_cards`
--
ALTER TABLE `receivable_saldo_cards`
  ADD CONSTRAINT `receivable_saldo_cards_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `receivable_saldo_cards_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `receivable_saldo_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sellings`
--
ALTER TABLE `sellings`
  ADD CONSTRAINT `sellings_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `sellings_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `sellings_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `sellings_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `sellings_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `sellings_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `sellings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `sellings_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_addionals`
--
ALTER TABLE `selling_addionals`
  ADD CONSTRAINT `selling_addionals_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_commission_saleses`
--
ALTER TABLE `selling_commission_saleses`
  ADD CONSTRAINT `selling_commission_saleses_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_customer_addresses`
--
ALTER TABLE `selling_customer_addresses`
  ADD CONSTRAINT `selling_customer_addresses_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_customer_contacts`
--
ALTER TABLE `selling_customer_contacts`
  ADD CONSTRAINT `selling_customer_contacts_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_details`
--
ALTER TABLE `selling_details`
  ADD CONSTRAINT `selling_details_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_details_po_customer_detail_id_foreign` FOREIGN KEY (`po_customer_detail_id`) REFERENCES `po_customer_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_details_po_customer_id_foreign` FOREIGN KEY (`po_customer_id`) REFERENCES `po_customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_details_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_details_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_detail_commission_saleses`
--
ALTER TABLE `selling_detail_commission_saleses`
  ADD CONSTRAINT `selling_detail_commission_saleses_selling_detail_id_foreign` FOREIGN KEY (`selling_detail_id`) REFERENCES `selling_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_detail_identities`
--
ALTER TABLE `selling_detail_identities`
  ADD CONSTRAINT `selling_detail_identities_selling_detail_id_foreign` FOREIGN KEY (`selling_detail_id`) REFERENCES `selling_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_detail_multiple_discounts`
--
ALTER TABLE `selling_detail_multiple_discounts`
  ADD CONSTRAINT `selling_detail_multiple_discounts_selling_detail_id_foreign` FOREIGN KEY (`selling_detail_id`) REFERENCES `selling_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_detail_pcs`
--
ALTER TABLE `selling_detail_pcs`
  ADD CONSTRAINT `selling_detail_pcs_selling_detail_id_foreign` FOREIGN KEY (`selling_detail_id`) REFERENCES `selling_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_detail_poins`
--
ALTER TABLE `selling_detail_poins`
  ADD CONSTRAINT `selling_detail_poins_selling_detail_id_foreign` FOREIGN KEY (`selling_detail_id`) REFERENCES `selling_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_detail_promotions`
--
ALTER TABLE `selling_detail_promotions`
  ADD CONSTRAINT `selling_detail_promotions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_detail_promotions_selling_detail_id_foreign` FOREIGN KEY (`selling_detail_id`) REFERENCES `selling_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_detail_promotion_items`
--
ALTER TABLE `selling_detail_promotion_items`
  ADD CONSTRAINT `selling_detail_promotion_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_multiple_accounts`
--
ALTER TABLE `selling_multiple_accounts`
  ADD CONSTRAINT `selling_multiple_accounts_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_multiple_accounts_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_multiple_discounts`
--
ALTER TABLE `selling_multiple_discounts`
  ADD CONSTRAINT `selling_multiple_discounts_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_poins`
--
ALTER TABLE `selling_poins`
  ADD CONSTRAINT `selling_poins_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_promotions`
--
ALTER TABLE `selling_promotions`
  ADD CONSTRAINT `selling_promotions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_promotions_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_promotion_items`
--
ALTER TABLE `selling_promotion_items`
  ADD CONSTRAINT `selling_promotion_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_promotion_items_selling_promotion_id_foreign` FOREIGN KEY (`selling_promotion_id`) REFERENCES `selling_promotions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_promotion_nested_discounts`
--
ALTER TABLE `selling_promotion_nested_discounts`
  ADD CONSTRAINT `selling_promotion_nested_discounts_selling_promotion_id_foreign` FOREIGN KEY (`selling_promotion_id`) REFERENCES `selling_promotions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_receivables`
--
ALTER TABLE `selling_receivables`
  ADD CONSTRAINT `selling_receivables_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_receivable_details`
--
ALTER TABLE `selling_receivable_details`
  ADD CONSTRAINT `selling_receivable_details_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_receivable_details_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_receivable_details_selling_receivable_id_foreign` FOREIGN KEY (`selling_receivable_id`) REFERENCES `selling_receivables` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_receivable_detail_multiple_accounts`
--
ALTER TABLE `selling_receivable_detail_multiple_accounts`
  ADD CONSTRAINT `srma_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `srma_selling_receivable_id_foreign` FOREIGN KEY (`selling_receivable_detail_id`) REFERENCES `selling_receivable_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_returns`
--
ALTER TABLE `selling_returns`
  ADD CONSTRAINT `selling_returns_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_returns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_returns_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_returns_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_returns_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_returns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_returns_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_return_addresses`
--
ALTER TABLE `selling_return_addresses`
  ADD CONSTRAINT `selling_return_addresses_selling_return_id_foreign` FOREIGN KEY (`selling_return_id`) REFERENCES `selling_returns` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_return_contacts`
--
ALTER TABLE `selling_return_contacts`
  ADD CONSTRAINT `selling_return_contacts_selling_return_id_foreign` FOREIGN KEY (`selling_return_id`) REFERENCES `selling_returns` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_return_details`
--
ALTER TABLE `selling_return_details`
  ADD CONSTRAINT `selling_return_details_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_return_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_return_details_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_return_details_selling_detail_id_foreign` FOREIGN KEY (`selling_detail_id`) REFERENCES `selling_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_return_details_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_return_details_selling_return_id_foreign` FOREIGN KEY (`selling_return_id`) REFERENCES `selling_returns` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_return_detail_identities`
--
ALTER TABLE `selling_return_detail_identities`
  ADD CONSTRAINT `selling_return_detail_identities_detail_id_foreign` FOREIGN KEY (`selling_return_detail_id`) REFERENCES `selling_return_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_return_detail_pcs`
--
ALTER TABLE `selling_return_detail_pcs`
  ADD CONSTRAINT `selling_return_detail_pcs_selling_return_detail_id_foreign` FOREIGN KEY (`selling_return_detail_id`) REFERENCES `selling_return_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `selling_shippings`
--
ALTER TABLE `selling_shippings`
  ADD CONSTRAINT `selling_shippings_selling_id_foreign` FOREIGN KEY (`selling_id`) REFERENCES `sellings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `setting_approvals`
--
ALTER TABLE `setting_approvals`
  ADD CONSTRAINT `setting_approvals_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `setting_approvals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `setting_codes`
--
ALTER TABLE `setting_codes`
  ADD CONSTRAINT `setting_codes_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `setting_promotions`
--
ALTER TABLE `setting_promotions`
  ADD CONSTRAINT `setting_promotions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `setting_promotions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `setting_promotion_discounts`
--
ALTER TABLE `setting_promotion_discounts`
  ADD CONSTRAINT `setting_promotion_discounts_setting_promotion_id_foreign` FOREIGN KEY (`setting_promotion_id`) REFERENCES `setting_promotions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `setting_promotion_free_items`
--
ALTER TABLE `setting_promotion_free_items`
  ADD CONSTRAINT `setting_promotion_free_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `setting_promotion_free_items_setting_promotion_id_foreign` FOREIGN KEY (`setting_promotion_id`) REFERENCES `setting_promotions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `setting_promotion_vouchers`
--
ALTER TABLE `setting_promotion_vouchers`
  ADD CONSTRAINT `setting_promotion_vouchers_setting_promotion_id_foreign` FOREIGN KEY (`setting_promotion_id`) REFERENCES `setting_promotions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `setting_promotion_vouchers_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `setting_promotions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_cards`
--
ALTER TABLE `stock_cards`
  ADD CONSTRAINT `stock_cards_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_cards_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_ins`
--
ALTER TABLE `stock_ins`
  ADD CONSTRAINT `stock_ins_purchaseing_id_foreign` FOREIGN KEY (`purchaseing_id`) REFERENCES `purchaseings` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_ins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_ins_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_in_details`
--
ALTER TABLE `stock_in_details`
  ADD CONSTRAINT `stock_in_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_in_details_stock_in_id_foreign` FOREIGN KEY (`stock_in_id`) REFERENCES `stock_ins` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_in_detail_identities`
--
ALTER TABLE `stock_in_detail_identities`
  ADD CONSTRAINT `stock_in_detail_identities_stock_in_detail_id_foreign` FOREIGN KEY (`stock_in_detail_id`) REFERENCES `stock_in_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_in_detail_pcs`
--
ALTER TABLE `stock_in_detail_pcs`
  ADD CONSTRAINT `stock_in_detail_pcs_stock_in_detail_id_foreign` FOREIGN KEY (`stock_in_detail_id`) REFERENCES `stock_in_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_mutations`
--
ALTER TABLE `stock_mutations`
  ADD CONSTRAINT `stock_mutations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_mutation_details`
--
ALTER TABLE `stock_mutation_details`
  ADD CONSTRAINT `stock_mutation_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_mutation_details_stock_mutation_id_foreign` FOREIGN KEY (`stock_mutation_id`) REFERENCES `stock_mutations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_mutation_details_warehouse_from_id_foreign` FOREIGN KEY (`warehouse_from_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_mutation_details_warehouse_to_id_foreign` FOREIGN KEY (`warehouse_to_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_mutation_detail_pcs`
--
ALTER TABLE `stock_mutation_detail_pcs`
  ADD CONSTRAINT `stock_mutation_detail_pcs_stock_mutation_detail_id_foreign` FOREIGN KEY (`stock_mutation_detail_id`) REFERENCES `stock_mutation_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_opnames`
--
ALTER TABLE `stock_opnames`
  ADD CONSTRAINT `stock_opnames_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_opnames_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_opname_details`
--
ALTER TABLE `stock_opname_details`
  ADD CONSTRAINT `stock_opname_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_opname_details_stock_opname_id_foreign` FOREIGN KEY (`stock_opname_id`) REFERENCES `stock_opnames` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_opname_detail_identities`
--
ALTER TABLE `stock_opname_detail_identities`
  ADD CONSTRAINT `stock_opname_detail_identities_stock_opname_detail_id_foreign` FOREIGN KEY (`stock_opname_detail_id`) REFERENCES `stock_opname_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_opname_detail_pcs`
--
ALTER TABLE `stock_opname_detail_pcs`
  ADD CONSTRAINT `stock_opname_detail_pcs_stock_opname_detail_id_foreign` FOREIGN KEY (`stock_opname_detail_id`) REFERENCES `stock_opname_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_outs`
--
ALTER TABLE `stock_outs`
  ADD CONSTRAINT `stock_outs_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_outs_purchaseing_return_id_foreign` FOREIGN KEY (`purchaseing_return_id`) REFERENCES `purchaseing_returns` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_outs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_outs_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_out_details`
--
ALTER TABLE `stock_out_details`
  ADD CONSTRAINT `stock_out_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_out_details_stock_out_id_foreign` FOREIGN KEY (`stock_out_id`) REFERENCES `stock_outs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_out_detail_identities`
--
ALTER TABLE `stock_out_detail_identities`
  ADD CONSTRAINT `stock_out_detail_identities_stock_out_detail_id_foreign` FOREIGN KEY (`stock_out_detail_id`) REFERENCES `stock_out_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_out_detail_pcs`
--
ALTER TABLE `stock_out_detail_pcs`
  ADD CONSTRAINT `stock_out_detail_pcs_stock_out_detail_id_foreign` FOREIGN KEY (`stock_out_detail_id`) REFERENCES `stock_out_details` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `supplier_addresses`
--
ALTER TABLE `supplier_addresses`
  ADD CONSTRAINT `supplier_addresses_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `supplier_address_maps`
--
ALTER TABLE `supplier_address_maps`
  ADD CONSTRAINT `supplier_address_maps_supplier_address_id_foreign` FOREIGN KEY (`supplier_address_id`) REFERENCES `supplier_addresses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `supplier_banks`
--
ALTER TABLE `supplier_banks`
  ADD CONSTRAINT `supplier_banks_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `supplier_contacts`
--
ALTER TABLE `supplier_contacts`
  ADD CONSTRAINT `supplier_contacts_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `supplier_files`
--
ALTER TABLE `supplier_files`
  ADD CONSTRAINT `supplier_files_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `supplier_identities`
--
ALTER TABLE `supplier_identities`
  ADD CONSTRAINT `supplier_identities_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `supplier_taxes`
--
ALTER TABLE `supplier_taxes`
  ADD CONSTRAINT `supplier_taxes_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_group_role_id_foreign` FOREIGN KEY (`group_role_id`) REFERENCES `group_roles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_address_maps`
--
ALTER TABLE `user_address_maps`
  ADD CONSTRAINT `user_address_maps_user_address_id_foreign` FOREIGN KEY (`user_address_id`) REFERENCES `user_addresses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_banks`
--
ALTER TABLE `user_banks`
  ADD CONSTRAINT `user_banks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_commissions`
--
ALTER TABLE `user_commissions`
  ADD CONSTRAINT `user_commissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD CONSTRAINT `user_contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_files`
--
ALTER TABLE `user_files`
  ADD CONSTRAINT `user_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_personal_datas`
--
ALTER TABLE `user_personal_datas`
  ADD CONSTRAINT `user_personal_datas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_saldo_cards`
--
ALTER TABLE `user_saldo_cards`
  ADD CONSTRAINT `user_saldo_cards_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_saldo_cards_employe_id_foreign` FOREIGN KEY (`employe_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_saldo_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_shifts`
--
ALTER TABLE `user_shifts`
  ADD CONSTRAINT `user_shifts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_shift_hours`
--
ALTER TABLE `user_shift_hours`
  ADD CONSTRAINT `user_shift_hours_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_shift_hours_user_shift_id_foreign` FOREIGN KEY (`user_shift_id`) REFERENCES `user_shifts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_taxes`
--
ALTER TABLE `user_taxes`
  ADD CONSTRAINT `user_taxes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `warehouse_addresses`
--
ALTER TABLE `warehouse_addresses`
  ADD CONSTRAINT `warehouse_addresses_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `warehouse_address_maps`
--
ALTER TABLE `warehouse_address_maps`
  ADD CONSTRAINT `warehouse_address_maps_warehouse_address_id_foreign` FOREIGN KEY (`warehouse_address_id`) REFERENCES `warehouse_addresses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `warehouse_contacts`
--
ALTER TABLE `warehouse_contacts`
  ADD CONSTRAINT `warehouse_contacts_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `warehouse_stocks`
--
ALTER TABLE `warehouse_stocks`
  ADD CONSTRAINT `warehouse_stocks_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_stocks_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
