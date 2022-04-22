-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2022 at 01:02 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mother`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `Acc_SlNo` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `Acc_Code` varchar(50) NOT NULL,
  `Acc_Tr_Type` varchar(25) DEFAULT NULL,
  `Acc_Name` varchar(200) NOT NULL,
  `Acc_Type` varchar(50) NOT NULL,
  `Acc_Description` varchar(255) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`Acc_SlNo`, `branch_id`, `Acc_Code`, `Acc_Tr_Type`, `Acc_Name`, `Acc_Type`, `Acc_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 1, 'A0001', '', 'Office Expense', '', 'Office Expense', 'a', 'Admin', '2022-01-26 13:43:34', 'Admin', '2022-02-10 18:37:07'),
(2, 1, 'A0002', '', 'Office Rent', '', '', 'a', 'Admin', '2022-01-26 13:43:46', NULL, NULL),
(3, 1, 'A0003', '', 'Staff Salary ', '', 'Staff Salary  ', 'a', 'Admin', '2022-02-10 18:34:48', 'Admin', '2022-02-10 18:40:39'),
(4, 1, 'A0004', '', 'House Rent ', '', '', 'a', 'Admin', '2022-02-10 18:35:28', NULL, NULL),
(5, 1, 'A0005', '', ' Daily Voucher ', '', 'Daily Voucher ', 'a', 'Admin', '2022-02-10 18:38:42', 'Admin', '2022-02-10 18:41:16'),
(6, 1, 'A0006', '', 'Others Expense', '', 'Others Expense', 'a', 'Admin', '2022-02-10 18:42:52', NULL, NULL),
(7, 1, 'A0007', '', 'C', '', '', 'a', 'Admin', '2022-02-12 14:40:44', NULL, NULL),
(8, 2, 'A0008', '', 'Transport', '', '', 'a', 'global', '2022-02-17 14:36:30', NULL, NULL),
(9, 2, 'A0009', '', 'Entertainment ', '', '', 'a', 'global', '2022-02-17 14:37:25', NULL, NULL),
(10, 2, 'A0010', '', 'Courier Charge', '', '', 'a', 'global', '2022-02-17 14:54:45', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assets`
--

CREATE TABLE `tbl_assets` (
  `as_id` int(11) NOT NULL,
  `as_date` date DEFAULT NULL,
  `as_name` varchar(50) DEFAULT NULL,
  `as_sp_name` varchar(100) DEFAULT NULL,
  `as_qty` int(11) DEFAULT NULL,
  `as_rate` decimal(10,2) DEFAULT NULL,
  `as_amount` decimal(10,2) DEFAULT NULL,
  `buy_or_sale` enum('buy','sale') NOT NULL DEFAULT 'buy',
  `valuation` decimal(20,2) DEFAULT 0.00,
  `unit_valuation` decimal(20,2) DEFAULT 0.00,
  `as_note` text DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `branchid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_accounts`
--

CREATE TABLE `tbl_bank_accounts` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(500) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `initial_balance` float NOT NULL,
  `description` varchar(2000) NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bank_accounts`
--

INSERT INTO `tbl_bank_accounts` (`account_id`, `account_name`, `account_number`, `account_type`, `bank_name`, `branch_name`, `initial_balance`, `description`, `saved_by`, `saved_datetime`, `updated_by`, `updated_datetime`, `branch_id`, `status`) VALUES
(1, 'Haque Enterprise ', '4032-789369-000', 'Bussines  ', 'AB Bank ', 'Shymoli ', 0, '', 1, '2022-02-10 18:24:46', NULL, NULL, 1, 1),
(2, 'Syed Nizamul ', '3736', 'Business ', 'Uttara ', 'Shymoli ', 0, '', 1, '2022-02-10 18:25:29', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_transactions`
--

CREATE TABLE `tbl_bank_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bank_transactions`
--

INSERT INTO `tbl_bank_transactions` (`transaction_id`, `account_id`, `transaction_date`, `transaction_type`, `amount`, `note`, `saved_by`, `saved_datetime`, `branch_id`, `status`) VALUES
(1, 1, '2022-02-02', 'deposit', 10000, '', 1, '2022-02-10 18:28:57', 1, 1),
(2, 2, '2022-02-09', 'deposit', 15000, '', 1, '2022-02-10 18:29:16', 1, 1),
(3, 1, '2022-02-10', 'deposit', 100000, '', 1, '2022-02-10 18:47:16', 1, 1),
(4, 2, '2022-02-10', 'deposit', 200000, '', 1, '2022-02-10 18:52:43', 1, 1),
(5, 2, '2022-02-10', 'withdraw', 5000, '', 1, '2022-02-10 18:52:59', 1, 1),
(6, 1, '2022-02-11', 'deposit', 5000, 'cash theke diposite', 1, '2022-02-11 18:17:58', 1, 1),
(7, 1, '2022-02-11', 'withdraw', 7000, '', 1, '2022-02-11 18:18:36', 1, 1),
(8, 1, '2022-02-12', 'withdraw', 20000, 'vctgfvyhvbvyhg', 1, '2022-02-12 13:52:07', 1, 1),
(9, 1, '2022-02-14', 'deposit', 5000, 'ttt', 1, '2022-02-14 16:16:27', 1, 1),
(10, 2, '2022-02-14', 'withdraw', 2000, '', 1, '2022-02-14 16:16:43', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_SiNo` int(11) NOT NULL,
  `ProductCategory_SlNo` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `status` char(2) NOT NULL,
  `brand_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brunch`
--

CREATE TABLE `tbl_brunch` (
  `brunch_id` int(11) NOT NULL,
  `Brunch_name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `Brunch_title` varchar(250) CHARACTER SET utf8 NOT NULL,
  `Brunch_address` text CHARACTER SET utf8 NOT NULL,
  `Brunch_sales` varchar(1) NOT NULL COMMENT 'Wholesales = 1, Retail = 2',
  `add_date` date NOT NULL,
  `add_time` datetime NOT NULL,
  `add_by` char(50) NOT NULL,
  `update_by` char(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brunch`
--

INSERT INTO `tbl_brunch` (`brunch_id`, `Brunch_name`, `Brunch_title`, `Brunch_address`, `Brunch_sales`, `add_date`, `add_time`, `add_by`, `update_by`, `status`) VALUES
(1, 'Head Branch', 'Head Branch', '31/B. Block-C, Monsurabad H/S Adabar-Dhaka-1207', '', '2022-01-25', '2022-01-25 15:53:41', '', 'Admin', 'a'),
(2, 'Branch-2', 'Branch-2, Dhaka', '31/B. Block-C, Monsurabad H/S Adabar-\nDhaka-1207\nPhone: 01911-978897', '2', '0000-00-00', '2022-02-17 12:01:52', 'Admin', '', 'a'),
(3, 'M/S AKON TRADING', 'retail sell', 'C office', '2', '0000-00-00', '2022-02-22 10:22:34', 'Admin', '', 'a'),
(4, 'Akon 3', 'akon3', 'c office 3', '2', '0000-00-00', '2022-02-22 10:42:27', 'Admin', '', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cashtransaction`
--

CREATE TABLE `tbl_cashtransaction` (
  `Tr_SlNo` int(11) NOT NULL,
  `Tr_Id` varchar(50) NOT NULL,
  `Tr_date` date NOT NULL,
  `Tr_Type` varchar(20) NOT NULL,
  `Tr_account_Type` varchar(50) NOT NULL,
  `Acc_SlID` int(11) NOT NULL,
  `Tr_Description` varchar(255) NOT NULL,
  `In_Amount` decimal(18,2) NOT NULL,
  `Out_Amount` decimal(18,2) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(100) NOT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Tr_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_cashtransaction`
--

INSERT INTO `tbl_cashtransaction` (`Tr_SlNo`, `Tr_Id`, `Tr_date`, `Tr_Type`, `Tr_account_Type`, `Acc_SlID`, `Tr_Description`, `In_Amount`, `Out_Amount`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Tr_branchid`) VALUES
(1, 'TR00001', '2022-02-02', 'Out Cash', '', 2, '', '0.00', '10000.00', 'a', 'Admin', '2022-02-10 18:15:04', NULL, NULL, 1),
(2, 'TR00002', '2022-02-10', 'Out Cash', '', 5, '', '0.00', '10000.00', 'a', 'Admin', '2022-02-10 18:51:18', NULL, NULL, 1),
(3, 'TR00003', '2022-02-10', 'Out Cash', '', 6, '', '0.00', '5000.00', 'a', 'Admin', '2022-02-10 18:51:33', NULL, NULL, 1),
(4, 'TR00004', '2022-02-10', 'Out Cash', '', 1, '', '0.00', '2000.00', 'a', 'Admin', '2022-02-10 18:52:06', NULL, NULL, 1),
(5, 'TR00005', '2022-02-11', 'Out Cash', '', 1, 'Al amin convense', '0.00', '1200.00', 'a', 'Admin', '2022-02-11 18:13:54', NULL, NULL, 1),
(6, 'TR00006', '2022-02-11', 'In Cash', '', 1, 'al amin recived', '200.00', '0.00', 'a', 'Admin', '2022-02-11 18:15:32', NULL, NULL, 1),
(7, 'TR00007', '2022-02-12', 'Out Cash', '', 7, 'greg', '0.00', '20.00', 'a', 'Admin', '2022-02-12 14:40:58', NULL, NULL, 1),
(8, 'TR00008', '2022-02-17', 'Out Cash', '', 8, 'products sale', '0.00', '500.00', 'a', 'global', '2022-02-17 14:39:28', NULL, NULL, 2),
(9, 'TR00009', '2022-02-17', 'In Cash', '', 9, 'return by xyz', '200.00', '0.00', 'a', 'global', '2022-02-17 14:40:29', 'global', '2022-02-17 14:41:48', 2),
(10, 'TR00010', '2022-02-17', 'Out Cash', '', 10, '', '0.00', '300.00', 'a', 'global', '2022-02-17 15:01:45', NULL, NULL, 2),
(11, 'TR00011', '2022-04-14', 'In Cash', '', 1, '10', '10000.00', '0.00', 'a', 'Admin', '2022-04-11 14:22:09', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checks`
--

CREATE TABLE `tbl_checks` (
  `id` int(20) UNSIGNED NOT NULL,
  `cus_id` int(20) DEFAULT NULL,
  `SM_id` int(20) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(250) DEFAULT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `check_no` varchar(250) DEFAULT NULL,
  `check_amount` decimal(18,2) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `check_date` timestamp NULL DEFAULT NULL,
  `remid_date` timestamp NULL DEFAULT NULL,
  `sub_date` timestamp NULL DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `check_status` char(5) DEFAULT 'Pe' COMMENT 'Pe =Pending, Pa = Paid',
  `status` char(5) NOT NULL DEFAULT 'a',
  `created_by` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `branch_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_color`
--

CREATE TABLE `tbl_color` (
  `color_SiNo` int(11) NOT NULL,
  `color_name` varchar(100) NOT NULL,
  `status` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `Company_SlNo` int(11) NOT NULL,
  `Company_Name` varchar(150) NOT NULL,
  `Repot_Heading` text NOT NULL,
  `Company_Logo_org` varchar(250) NOT NULL,
  `Company_Logo_thum` varchar(250) NOT NULL,
  `Invoice_Type` int(11) NOT NULL,
  `Currency_Name` varchar(50) DEFAULT NULL,
  `Currency_Symbol` varchar(10) DEFAULT NULL,
  `SubCurrency_Name` varchar(50) DEFAULT NULL,
  `print_type` int(11) NOT NULL,
  `company_BrunchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`Company_SlNo`, `Company_Name`, `Repot_Heading`, `Company_Logo_org`, `Company_Logo_thum`, `Invoice_Type`, `Currency_Name`, `Currency_Symbol`, `SubCurrency_Name`, `print_type`, `company_BrunchId`) VALUES
(1, 'M/S AKON TRADING', 'Head Office: \r\nPIROJPUR\r\nRajarhat.\r\nDhaka\r\n01979556663', 'photo_2020-06-21_17-40-36.jpg', 'photo_2020-06-21_17-40-36.jpg', 1, 'BDT', NULL, NULL, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `Country_SlNo` int(11) NOT NULL,
  `CountryName` varchar(50) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currentinventory`
--

CREATE TABLE `tbl_currentinventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_quantity` float NOT NULL,
  `purchase_return_quantity` float NOT NULL,
  `sales_quantity` float NOT NULL,
  `sales_return_quantity` float NOT NULL,
  `damage_quantity` float NOT NULL,
  `transfer_from_quantity` float NOT NULL,
  `transfer_to_quantity` float NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_currentinventory`
--

INSERT INTO `tbl_currentinventory` (`inventory_id`, `product_id`, `purchase_quantity`, `purchase_return_quantity`, `sales_quantity`, `sales_return_quantity`, `damage_quantity`, `transfer_from_quantity`, `transfer_to_quantity`, `branch_id`) VALUES
(1, 7, 2, 0, 1, 0, 0, 0, 0, 1),
(2, 6, 3, 0, 6, 0, 0, 0, 0, 1),
(3, 5, 3, 0, 0, 0, 0, 0, 0, 1),
(4, 3, 20, 0, 2, 1, 0, 0, 0, 1),
(5, 1, 3, 0, 1, 0, 0, 0, 0, 1),
(6, 15, 1010, 20, 178, 2, 0, 0, 0, 1),
(7, 14, 523, 0, 331, 21, 0, 0, 0, 1),
(8, 11, 1054, 0, 2, 0, 0, 0, 0, 1),
(9, 9, 462, 0, 69, 0, 5, 0, 0, 1),
(10, 10, 300, 0, 106, 0, 10, 0, 0, 1),
(11, 13, 215, 0, 114, 20, 20, 0, 0, 1),
(12, 12, 605, 0, 205, 0, 0, 0, 0, 1),
(13, 8, 600, 0, 80, 0, 0, 0, 0, 1),
(14, 16, 262, 0, 15, 1, 0, 0, 0, 1),
(15, 17, 20, 0, 8, 0, 0, 0, 0, 1),
(16, 19, 10, 0, 5, 0, 0, 0, 0, 2),
(17, 17, 3, 0, 2, 1, 0, 0, 0, 2),
(18, 20, 20, 0, 5, 0, 0, 0, 0, 1),
(19, 21, 155, 0, 29, 2, 0, 14, 0, 1),
(20, 21, 0, 0, 0, 0, 0, 0, 14, 3),
(21, 19, 100, 0, 7, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `Customer_SlNo` int(11) NOT NULL,
  `Customer_Code` varchar(50) NOT NULL,
  `Customer_Name` varchar(150) NOT NULL,
  `Customer_Type` varchar(50) NOT NULL,
  `Customer_Phone` varchar(50) NOT NULL,
  `Customer_Mobile` varchar(15) NOT NULL,
  `Customer_Email` varchar(50) NOT NULL,
  `Customer_OfficePhone` varchar(50) NOT NULL,
  `Customer_Address` varchar(300) NOT NULL,
  `owner_name` varchar(250) DEFAULT NULL,
  `Country_SlNo` int(11) NOT NULL,
  `area_ID` int(11) NOT NULL,
  `Customer_Web` varchar(50) NOT NULL,
  `Customer_Credit_Limit` decimal(18,2) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Customer_brunchid` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`Customer_SlNo`, `Customer_Code`, `Customer_Name`, `Customer_Type`, `Customer_Phone`, `Customer_Mobile`, `Customer_Email`, `Customer_OfficePhone`, `Customer_Address`, `owner_name`, `Country_SlNo`, `area_ID`, `Customer_Web`, `Customer_Credit_Limit`, `previous_due`, `image_name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Customer_brunchid`) VALUES
(1, 'C00001', 'Kamal Enterprise', 'retail', '', '01611978897', '', '', 'Nowabpur, Dhaka', 'Khamal Khan', 0, 1, '', '30000.00', '2000.00', NULL, 'd', 'Admin', '2022-01-29 13:33:46', NULL, NULL, 1),
(2, 'C00002', 'Nahian Trading Ltd.', 'wholesale', '', '01977', '', '', 'Adabar', 'Quazi Nahian Hassan', 0, 1, '', '20000.00', '0.00', NULL, 'd', 'Admin', '2022-01-29 13:34:46', 'Admin', '2022-02-09 11:23:11', 1),
(3, 'C00003', 'Haque Enterprise', 'wholesale', '', '0175', '', '02', 'Narayangonj ', 'Syed Rubel', 0, 1, '', '200000.00', '60000.00', NULL, 'a', 'Admin', '2022-02-09 11:24:19', NULL, NULL, 1),
(4, 'C00004', 'Khan Chem ', 'wholesale', '', '019', '', '025', 'Uttara', 'Abil Hasan', 0, 1, '', '100000.00', '50000.00', NULL, 'a', 'Admin', '2022-02-09 11:25:37', NULL, NULL, 1),
(5, 'C00005', 'Square Textile Ltd', 'retail', '', '0182', '', '028', 'Uttara', 'Mr. Topon ', 0, 1, '', '300000.00', '30000.00', NULL, 'a', 'Admin', '2022-02-09 11:27:37', NULL, NULL, 1),
(6, 'C00006', 'PA Knit Ltd. ', 'retail', '', '018524', '', '02658', 'Tejgaon ', 'Jamal ', 0, 1, '', '100000.00', '50000.00', NULL, 'a', 'Admin', '2022-02-09 11:28:46', NULL, NULL, 1),
(7, 'C00007', 'al amin', 'retail', '', '01979', '', '', 'n', 'ss', 0, 1, '', '500000.00', '0.00', NULL, 'a', 'Admin', '2022-02-12 14:29:15', NULL, NULL, 1),
(8, 'C00008', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'Admin', '2022-02-13 10:28:35', NULL, NULL, 1),
(9, 'C00009', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'Admin', '2022-02-13 10:36:19', NULL, NULL, 1),
(10, 'C00010', 'alamin Enterprice', 'retail', '', '98', '', '', 'mirpur', 'alamin', 0, 1, '', '0.00', '0.00', NULL, 'a', 'global', '2022-02-17 12:07:23', NULL, NULL, 2),
(11, 'C00011', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'Admin', '2022-02-17 12:53:37', NULL, NULL, 1),
(12, 'C00012', 'Md. Rezaul Karim Sharif', 'retail', '', '+8801723221122', '', '', '70 Senpara Parbata, Mirpur 10, Dhaka', '', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'global', '2022-02-17 13:42:35', NULL, NULL, 2),
(13, 'C00013', 'rasel traders', 'retail', '', '017', '', '56', 'rajarhat', 'Rasel', 0, 8, '', '50000.00', '2500.00', NULL, 'a', 'Admin', '2022-02-21 19:07:52', NULL, NULL, 1),
(46, 'C00046', 'Md. Rakib Hasan', 'wholesale', '01774266793', '01774266793', '', '', 'rajarhat', 'Shamim', 0, 1, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(47, 'C00047', 'Imran Hossain', 'wholesale', '', '01774266794', '', '', '', 'Imran', 0, 1, '', '0.00', '0.00', NULL, 'a', NULL, NULL, 'Admin', '2022-04-19 15:14:07', 1),
(48, 'C00048', 'Sujon', 'retail', '', '01774266798', '', '', '', 'Sujon', 0, 1, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(49, 'C00049', 'Md. Sazzat', 'wholesale', '', '01774266795', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(50, 'C00050', 'Masud', 'wholesale', '', '01774266797', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(51, 'C00051', 'Jewel Hasan', 'wholesale', '', '01774266777', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(52, 'C00052', 'Arif hasan', 'marchant', '', '0177444444', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(53, 'C00053', 'Mohin', 'marchant', '', '0177454521', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(54, 'C00054', 'Elit voluptas nostr', 'marchant', '', 'Enim non commod', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(55, 'C00055', 'Roky', 'marchant', '', '45125454', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(56, 'C00056', 'Shohag', 'wholesale', '', '01777777777', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(57, 'C00057', 'Shohag', 'wholesale', '', '01777777777', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(58, 'C00058', 'Shohana begum', 'wholesale', '', '017777451213', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(59, 'C00059', 'Shohana begum', 'wholesale', '', '017777451213', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(60, 'C00060', 'Sourov', '', '', '01777745441', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(61, 'C00061', 'Kamal Hossain', 'wholesale', '', '01744551254', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(62, 'C00062', 'Kamal Hossain', 'wholesale', '', '01744551254', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(63, 'C00063', 'Nuru', 'wholesale', '', '8542', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(64, 'C00064', 'sdfsd', 'wholesale', '', 'fsdf', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(65, 'C00065', 'test', 'wholesale', '', '9+594554+9', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(66, 'C00066', 'test', 'wholesale', '', '9+594554+9', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(67, 'C00067', 'Kim', 'wholesale', '', '017742645612', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', NULL, NULL, NULL, NULL, 1),
(68, 'C00068', 'test ', 'G', '', 'test', '', '', 'test', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'Admin', '2022-04-21 13:50:08', NULL, NULL, 1),
(69, 'C00069', 'test 2', 'G', '', '01745212', 'gmailc.com', '', 'test', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'Admin', '2022-04-21 13:52:42', NULL, NULL, 1),
(70, 'C00070', 'shamim', 'G', '', '01774266777', '', '', 'dhaka', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'Admin', '2022-04-21 14:55:08', NULL, NULL, 1),
(71, 'C00071', 'shamim', 'G', '', '01774266777', '', '', 'dhaka', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'Admin', '2022-04-21 14:55:10', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_payment`
--

CREATE TABLE `tbl_customer_payment` (
  `CPayment_id` int(11) NOT NULL,
  `CPayment_date` date DEFAULT NULL,
  `CPayment_invoice` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `CPayment_customerID` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `CPayment_TransactionType` varchar(20) DEFAULT NULL,
  `CPayment_amount` decimal(18,2) DEFAULT NULL,
  `out_amount` float NOT NULL DEFAULT 0,
  `CPayment_Paymentby` varchar(50) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `CPayment_notes` varchar(225) CHARACTER SET latin1 DEFAULT NULL,
  `CPayment_brunchid` int(11) DEFAULT NULL,
  `CPayment_previous_due` float NOT NULL DEFAULT 0,
  `CPayment_Addby` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `CPayment_AddDAte` date DEFAULT NULL,
  `CPayment_status` varchar(1) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `CPayment_UpdateDAte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer_payment`
--

INSERT INTO `tbl_customer_payment` (`CPayment_id`, `CPayment_date`, `CPayment_invoice`, `CPayment_customerID`, `CPayment_TransactionType`, `CPayment_amount`, `out_amount`, `CPayment_Paymentby`, `account_id`, `CPayment_notes`, `CPayment_brunchid`, `CPayment_previous_due`, `CPayment_Addby`, `CPayment_AddDAte`, `CPayment_status`, `update_by`, `CPayment_UpdateDAte`) VALUES
(1, '2022-02-09', 'TR00001', '6', 'CR', '50000.00', 0, 'cash', NULL, '', 1, 94500, 'Admin', '2022-02-09', 'a', NULL, NULL),
(2, '2022-02-10', 'TR00002', '5', 'CR', '10000.00', 0, 'bank', 1, '', 1, 50000, 'Admin', '2022-02-10', 'a', NULL, NULL),
(3, '2022-02-10', 'TR00003', '5', 'CR', '5000.00', 0, 'bank', 1, '', 1, 40000, 'Admin', '2022-02-10', 'a', NULL, NULL),
(4, '2022-02-10', 'TR00004', '3', 'CR', '50000.00', 0, 'cash', NULL, '', 1, 85000, 'Admin', '2022-02-10', 'a', NULL, NULL),
(5, '2022-02-11', 'TR00005', '6', 'CR', '20000.00', 0, 'cash', NULL, '0005', 1, 59300, 'Admin', '2022-02-11', 'a', NULL, NULL),
(6, '2022-02-11', 'TR00006', '6', 'CR', '5000.00', 0, 'bank', 1, '0006', 1, 39300, 'Admin', '2022-02-11', 'a', NULL, NULL),
(7, '2022-02-17', 'TR00007', '12', 'CR', '20000.00', 0, 'cash', NULL, '', 2, 20000, 'global', '2022-02-17', 'a', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damage`
--

CREATE TABLE `tbl_damage` (
  `Damage_SlNo` int(11) NOT NULL,
  `Damage_InvoiceNo` varchar(50) NOT NULL,
  `Damage_Date` date NOT NULL,
  `Damage_Description` varchar(300) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Damage_brunchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_damage`
--

INSERT INTO `tbl_damage` (`Damage_SlNo`, `Damage_InvoiceNo`, `Damage_Date`, `Damage_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Damage_brunchid`) VALUES
(1, 'D0001', '2022-02-09', '', 'd', 'Admin', '2022-02-09 00:41:28', NULL, NULL, 1),
(2, 'D0002', '2022-02-09', '', 'a', 'Admin', '2022-02-09 12:53:08', NULL, NULL, 1),
(3, 'D0003', '2022-02-09', '', 'a', 'Admin', '2022-02-09 12:53:23', NULL, NULL, 1),
(4, 'D0004', '2022-02-11', 'Reject product', 'a', 'Admin', '2022-02-11 17:49:09', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damagedetails`
--

CREATE TABLE `tbl_damagedetails` (
  `DamageDetails_SlNo` int(11) NOT NULL,
  `Damage_SlNo` int(11) NOT NULL,
  `Product_SlNo` int(11) NOT NULL,
  `DamageDetails_DamageQuantity` float NOT NULL,
  `damage_rate` float NOT NULL,
  `damage_amount` float NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_damagedetails`
--

INSERT INTO `tbl_damagedetails` (`DamageDetails_SlNo`, `Damage_SlNo`, `Product_SlNo`, `DamageDetails_DamageQuantity`, `damage_rate`, `damage_amount`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 1, 6, 1, 20, 20, 'd', 'Admin', '2022-02-09 00:41:28', NULL, NULL),
(2, 2, 13, 20, 300, 6000, 'a', 'Admin', '2022-02-09 12:53:08', NULL, NULL),
(3, 3, 10, 10, 200, 2000, 'a', 'Admin', '2022-02-09 12:53:23', NULL, NULL),
(4, 4, 9, 5, 200, 1000, 'a', 'Admin', '2022-02-11 17:49:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `Department_SlNo` int(11) NOT NULL,
  `Department_Name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`Department_SlNo`, `Department_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Marketing ', 'a', 'Admin', '2022-02-06 16:51:10', NULL, NULL),
(2, 'Admin ', 'a', 'Admin', '2022-02-06 16:51:24', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designation`
--

CREATE TABLE `tbl_designation` (
  `Designation_SlNo` int(11) NOT NULL,
  `Designation_Name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_designation`
--

INSERT INTO `tbl_designation` (`Designation_SlNo`, `Designation_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Asst. Manager', 'a', 'Admin', '2022-02-06 16:50:28', NULL, NULL),
(2, 'Sr. Officer', 'd', 'Admin', '2022-02-06 16:50:37', NULL, NULL),
(3, 'Executive', 'd', 'Admin', '2022-02-06 16:50:46', NULL, NULL),
(4, 'Marketing Manager ', 'a', 'Admin', '2022-02-10 10:32:56', NULL, NULL),
(5, 'Office Manager ', 'a', 'Admin', '2022-02-10 10:33:18', NULL, NULL),
(6, 'Marketing Asistant ', 'a', 'Admin', '2022-02-10 10:33:52', NULL, NULL),
(7, 'Accounts Officer ', 'a', 'Admin', '2022-02-10 10:34:46', NULL, NULL),
(8, 'Syed Nizamul Haque (Ripon)', 'd', 'Admin', '2022-02-10 10:35:22', NULL, NULL),
(9, 'Owner ', 'a', 'Admin', '2022-02-10 10:38:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `District_SlNo` int(11) NOT NULL,
  `District_Name` varchar(50) NOT NULL,
  `status` char(10) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`District_SlNo`, `District_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Dhaka', 'a', 'Admin', '2022-01-29 13:31:46', NULL, NULL),
(2, 'Khulna', 'a', 'Admin', '2022-01-29 13:31:53', NULL, NULL),
(3, 'Bogra', 'a', 'Admin', '2022-01-29 13:31:59', NULL, NULL),
(4, 'Chittagong', 'a', 'Admin', '2022-01-29 13:32:10', NULL, NULL),
(5, 'Mirpur 10', 'a', 'global', '2022-02-17 12:37:44', NULL, NULL),
(6, 'Savar', 'a', 'global', '2022-02-17 12:37:52', NULL, NULL),
(7, 'Polton', 'a', 'global', '2022-02-17 12:38:01', NULL, NULL),
(8, 'pirojpur', 'a', 'Admin', '2022-02-21 19:05:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `Employee_SlNo` int(11) NOT NULL,
  `Designation_ID` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  `Employee_ID` varchar(50) NOT NULL,
  `Employee_Name` varchar(150) NOT NULL,
  `Employee_JoinDate` date NOT NULL,
  `Employee_Gender` varchar(20) NOT NULL,
  `Employee_BirthDate` date NOT NULL,
  `Employee_NID` varchar(50) NOT NULL,
  `Employee_ContactNo` varchar(20) NOT NULL,
  `Employee_Email` varchar(50) NOT NULL,
  `Employee_MaritalStatus` varchar(50) NOT NULL,
  `Employee_FatherName` varchar(150) NOT NULL,
  `Employee_MotherName` varchar(150) NOT NULL,
  `Employee_PrasentAddress` text NOT NULL,
  `Employee_PermanentAddress` text NOT NULL,
  `Employee_Pic_org` varchar(250) NOT NULL,
  `Employee_Pic_thum` varchar(250) NOT NULL,
  `salary_range` int(11) NOT NULL,
  `Employee_Reference` text DEFAULT NULL,
  `status` char(10) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(50) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(50) NOT NULL,
  `Employee_brinchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`Employee_SlNo`, `Designation_ID`, `Department_ID`, `Employee_ID`, `Employee_Name`, `Employee_JoinDate`, `Employee_Gender`, `Employee_BirthDate`, `Employee_NID`, `Employee_ContactNo`, `Employee_Email`, `Employee_MaritalStatus`, `Employee_FatherName`, `Employee_MotherName`, `Employee_PrasentAddress`, `Employee_PermanentAddress`, `Employee_Pic_org`, `Employee_Pic_thum`, `salary_range`, `Employee_Reference`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Employee_brinchid`) VALUES
(1, 1, 1, 'E1001', 'Mirza JamilHasan', '2022-01-01', 'Male', '1995-10-18', '', '01979556662', 's', 'unmarried', 'A', 'A', 'A', 'S', '', '', 45000, '', 'd', 'Admin', '2022-02-06 16:52:31', '', '', 1),
(2, 1, 1, 'E1001', 'Mirza JamilHasan', '2022-01-01', 'Male', '1995-10-18', '', '01979556662', 's', 'unmarried', 'A', 'A', 'A', 'S', '', '', 45000, '', 'd', 'Admin', '2022-02-06 16:52:39', '', '', 1),
(3, 1, 1, 'E1002', 'Al Amin Islam', '2022-01-01', 'Male', '1992-07-16', '', '01979556663', 'd', 'married', 'd', 'd', 's', 'd', '', '', 45000, '', 'd', 'Admin', '2022-02-06 16:53:46', '', '', 1),
(4, 4, 1, 'E1003', 'Syed Nazmul Haque', '2022-02-10', 'Male', '1970-02-10', '', '01752720', 'haque', 'married', 'Syed Samsul Haque ', 'Mrs. Samsun Nahar', 'Monsurabad ', 'Dhulia', '', '', 15000, '', 'a', 'Admin', '2022-02-10 10:44:51', '', '', 1),
(5, 4, 1, 'E1003', 'Syed Nazmul Haque', '2022-02-10', 'Male', '1970-02-10', '', '01752720', 'haque', 'married', 'Syed Samsul Haque ', 'Mrs. Samsun Nahar', 'Monsurabad ', 'Dhulia', '', '', 15000, '', 'd', 'Admin', '2022-02-10 10:45:02', '', '', 1),
(6, 5, 2, 'E1004', 'Sanin ', '2022-01-01', 'Male', '2022-02-10', '', '01', '', 'married', 'f', 'f', 'D', 'D', '', '', 18000, '', 'a', 'Admin', '2022-02-10 18:19:43', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_payment`
--

CREATE TABLE `tbl_employee_payment` (
  `id` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `month_id` int(11) NOT NULL,
  `total_payment_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` char(2) DEFAULT 'a',
  `saved_by` int(11) NOT NULL,
  `saved_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_employee_payment`
--

INSERT INTO `tbl_employee_payment` (`id`, `payment_date`, `month_id`, `total_payment_amount`, `status`, `saved_by`, `saved_at`, `updated_by`, `updated_at`, `branch_id`) VALUES
(1, '2022-02-10', 2, '15000.00', 'a', 1, '2022-02-10 23:18:27', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_payment_details`
--

CREATE TABLE `tbl_employee_payment_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `salary` decimal(20,2) NOT NULL DEFAULT 0.00,
  `benefit` decimal(20,2) NOT NULL DEFAULT 0.00,
  `deduction` decimal(20,2) NOT NULL DEFAULT 0.00,
  `net_payable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `payment` decimal(20,2) NOT NULL DEFAULT 0.00,
  `comment` text DEFAULT NULL,
  `saved_by` int(11) UNSIGNED DEFAULT NULL,
  `saved_at` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` char(2) NOT NULL DEFAULT 'a',
  `branch_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_employee_payment_details`
--

INSERT INTO `tbl_employee_payment_details` (`id`, `payment_id`, `employee_id`, `salary`, `benefit`, `deduction`, `net_payable`, `payment`, `comment`, `saved_by`, `saved_at`, `updated_by`, `updated_at`, `status`, `branch_id`) VALUES
(1, 1, 4, '15000.00', '0.00', '0.00', '15000.00', '15000.00', '', 1, '2022-02-10 18:18:27', NULL, NULL, 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense_head`
--

CREATE TABLE `tbl_expense_head` (
  `id` int(11) NOT NULL,
  `head_name` varchar(100) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `status` enum('a','d') DEFAULT 'a',
  `saved_by` int(11) DEFAULT NULL,
  `saved_datetime` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_investment_account`
--

CREATE TABLE `tbl_investment_account` (
  `Acc_SlNo` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `Acc_Code` varchar(50) NOT NULL,
  `Acc_Tr_Type` varchar(25) DEFAULT NULL,
  `Acc_Name` varchar(200) NOT NULL,
  `Acc_Type` varchar(50) NOT NULL,
  `Acc_Description` varchar(255) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_investment_account`
--

INSERT INTO `tbl_investment_account` (`Acc_SlNo`, `branch_id`, `Acc_Code`, `Acc_Tr_Type`, `Acc_Name`, `Acc_Type`, `Acc_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 2, 'I0001', NULL, 'Chairman Sir', '', '', 'd', 'global', '2022-02-17 13:07:45', NULL, NULL),
(2, 2, 'I0002', NULL, 'Managing Director', '', '', 'a', 'global', '2022-02-17 13:08:03', NULL, NULL),
(3, 2, 'I0003', NULL, 'Director', '', '', 'a', 'global', '2022-02-17 13:08:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_investment_transactions`
--

CREATE TABLE `tbl_investment_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_investment_transactions`
--

INSERT INTO `tbl_investment_transactions` (`transaction_id`, `account_id`, `transaction_date`, `transaction_type`, `amount`, `note`, `saved_by`, `saved_datetime`, `branch_id`, `status`) VALUES
(1, 2, '2022-02-17', 'Receive', 500000, '', 4, '2022-02-17 13:10:45', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loan_accounts`
--

CREATE TABLE `tbl_loan_accounts` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(500) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `initial_balance` float NOT NULL,
  `description` varchar(2000) NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `save_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_loan_accounts`
--

INSERT INTO `tbl_loan_accounts` (`account_id`, `account_name`, `account_number`, `account_type`, `bank_name`, `branch_name`, `initial_balance`, `description`, `saved_by`, `saved_datetime`, `save_date`, `updated_by`, `updated_datetime`, `branch_id`, `status`) VALUES
(1, 'Raisa ', '5698726', 'SB', 'ISLAMI BANK', 'ring road', 5000, '', 1, '2022-02-11 18:27:20', '2022-02-11', NULL, NULL, 1, 1),
(2, 'ARAFAT', 'ARAFAT islam', 'personal', 'nill', 'nill', 25000, '', 1, '2022-02-11 18:29:09', '2022-02-11', NULL, NULL, 1, 1),
(3, 'Director', '003', 'personal', 'cash', '', 0, '', 4, '2022-02-17 13:13:31', '2022-02-17', NULL, NULL, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loan_transactions`
--

CREATE TABLE `tbl_loan_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(30) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_loan_transactions`
--

INSERT INTO `tbl_loan_transactions` (`transaction_id`, `account_id`, `transaction_date`, `transaction_type`, `amount`, `note`, `saved_by`, `saved_datetime`, `branch_id`, `status`) VALUES
(1, 2, '2022-02-11', 'Receive', 2000, '', 1, '2022-02-11 18:29:54', 1, 1),
(2, 1, '2022-02-11', 'Payment', 5000, '', 1, '2022-02-11 18:30:16', 1, 1),
(3, 3, '2022-02-17', 'Receive', 200000, '', 4, '2022-02-17 13:14:50', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_marchant_wholesaler`
--

CREATE TABLE `tbl_marchant_wholesaler` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `page_name` varchar(100) DEFAULT NULL,
  `nid` varchar(17) DEFAULT NULL,
  `customer_type` varchar(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `nid_image` varchar(255) DEFAULT NULL,
  `owner_image` varchar(255) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'p',
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_marchant_wholesaler`
--

INSERT INTO `tbl_marchant_wholesaler` (`id`, `name`, `mobile`, `email`, `username`, `password`, `page_name`, `nid`, `customer_type`, `customer_id`, `nid_image`, `owner_image`, `address`, `image`, `status`, `created_at`) VALUES
(1, 'Md. Shamim Miah', '01774266791', 'shamim520386@gmail.com', '01774266791', '202cb962ac59075b964b07152d234b70', '212545', '12345', NULL, NULL, 'kgfk15437-21.jpg', 'shamim-ap_(1).jpg', 'Dhaka', NULL, 'a', NULL),
(2, 'Rakib Hasan', '01774266799', NULL, '01774266799', '202cb962ac59075b964b07152d234b70', 'food ware', NULL, 'Marchant', NULL, NULL, NULL, NULL, NULL, 'p', NULL),
(3, 'Rakib Hasan', '01774266799', NULL, '01774266799', '202cb962ac59075b964b07152d234b70', 'food ware', NULL, 'Marchant', NULL, NULL, NULL, 'Dhaka', NULL, 'p', NULL),
(10, 'Marvin Fox', 'Vielka Hubbard', NULL, 'Vielka Hubbard', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', NULL, 'Hu Mcconnell', 'Wholeseller', 44, '496-4964657_thumb-punjabi-language-hd-png-download2.png', '43cfc935df0e91e22d26c4dc8dec5440--khadi-hd-images.jpg', 'Reiciendis nostrum e', NULL, 'p', NULL),
(11, 'Berk Mosley', 'Athena Mcneil', NULL, 'Athena Mcneil', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', NULL, 'Claudia Mclaughli', 'Wholeseller', 45, '7e0e036d944febe39930c2252b5275f9.jpg', '496-4964657_thumb-punjabi-language-hd-png-download.png', 'Quod quisquam qui se', NULL, 'p', NULL),
(12, 'Md. Shamim Hasan', '01774266792', NULL, '01774266792', 'c4ca4238a0b923820dcc509a6f75849b', 'Rakib Enterprise', '1254545', NULL, NULL, 'KGFK15232-4.jpg', 'download_(9).jpeg', 'dkhaka', NULL, 'a', NULL),
(13, 'Md. Rakib Hasan', '01774266793', NULL, '01774266793', 'e10adc3949ba59abbe56e057f20f883e', NULL, '1254566233', 'Wholeseller', 46, '496-4964657_thumb-punjabi-language-hd-png-download1.png', 'KGFK15232-4.jpg', 'Dhaka', NULL, 'p', NULL),
(14, 'Imran Hossain', '01774266794', NULL, '01774266794', 'e10adc3949ba59abbe56e057f20f883e', NULL, '1254566233', 'Wholeseller', 47, '496-4964657_thumb-punjabi-language-hd-png-download2.png', 'KGFK15232-41.jpg', 'Dhaka', NULL, 'p', NULL),
(15, 'Sujon', '01774266798', NULL, '01774266798', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', 'sujon ltd', NULL, 'Marchant', 48, NULL, NULL, 'Asperiores iusto mag', NULL, 'p', NULL),
(16, 'Md. Sazzat', '01774266795', NULL, '01774266795', 'c4ca4238a0b923820dcc509a6f75849b', NULL, '12345678', 'Wholeseller', 49, '43cfc935df0e91e22d26c4dc8dec5440--khadi-hd-images.jpg', 'KGFK15232-42.jpg', 'dhaka', NULL, 'a', NULL),
(17, 'Masud', '01774266797', NULL, '01774266797', 'c4ca4238a0b923820dcc509a6f75849b', NULL, '123456789', 'Wholeseller', 50, '28ba33193d57cf6595a748ab3b085f38.jpg', 'web-banner-1.jpg', 'dhaka', NULL, 'a', NULL),
(18, 'Jewel Hasan', '01774266777', NULL, '01774266777', 'c4ca4238a0b923820dcc509a6f75849b', NULL, '12345678945', 'wholesale', 51, '7e0e036d944febe39930c2252b5275f91.jpg', '43cfc935df0e91e22d26c4dc8dec5440--khadi-hd-images1.jpg', 'Dhaka', NULL, 'a', NULL),
(19, 'Arif hasan', '0177444444', NULL, '0177444444', 'c4ca4238a0b923820dcc509a6f75849b', NULL, '12345566', 'marchant', 52, '46c5e2521a3f391de70df0a0fd6e10d7.jpg', '43cfc935df0e91e22d26c4dc8dec5440--khadi-hd-images2.jpg', 'Dhaka', NULL, 'a', NULL),
(20, 'Mohin', '0177454521', NULL, '0177454521', 'c4ca4238a0b923820dcc509a6f75849b', NULL, '154621231', 'marchant', 53, '', '', 'dhaka', NULL, 'a', NULL),
(21, 'Elit voluptas nostr', 'Enim non commod', NULL, 'Enim non commodi ius', 'c4ca4238a0b923820dcc509a6f75849b', NULL, 'Quis occaecat sed', 'marchant', 54, '', '', 'Reprehenderit irure', NULL, 'a', NULL),
(22, 'Roky', '45125454', NULL, '45125454', 'c4ca4238a0b923820dcc509a6f75849b', NULL, '4585412', 'marchant', 55, '', '', 'mirpur', NULL, 'a', NULL),
(23, 'Shohag', '01777777777', NULL, '01777777777', 'c4ca4238a0b923820dcc509a6f75849b', NULL, '8451254451', 'wholesale', 56, '', '', 'Mirpur-10', NULL, 'a', NULL),
(24, 'Shohag', '01777777777', NULL, '01777777777', 'c4ca4238a0b923820dcc509a6f75849b', NULL, '8451254451', 'wholesale', 57, '', '', 'Mirpur-10', NULL, 'a', NULL),
(25, 'Shohana begum', '017777451213', NULL, '017777451213', 'c4ca4238a0b923820dcc509a6f75849b', 'Shohana Store', '1542145562', 'wholesale', 58, '', '', 'Dhaka', NULL, 'a', NULL),
(26, 'Shohana begum', '017777451213', NULL, '017777451213', 'c4ca4238a0b923820dcc509a6f75849b', 'Shohana Store', '1542145562', 'wholesale', 59, '', '40f93882808daceef2091662a5defb30.jpg', 'Dhaka', NULL, 'a', NULL),
(27, 'Sourov', '01777745441', NULL, '01777745441', 'c4ca4238a0b923820dcc509a6f75849b', 'Sourov Store', '125462123', '', 60, '', '', 'Dhaka', NULL, 'd', NULL),
(28, 'Kamal Hossain', '01744551254', NULL, '01744551254', 'c4ca4238a0b923820dcc509a6f75849b', 'Kamal Store', '4512545211', NULL, 61, NULL, NULL, 'Dhaka', NULL, 'a', NULL),
(29, 'Kamal Hossain', '01744551254', NULL, '01744551254', 'c4ca4238a0b923820dcc509a6f75849b', 'Kamal Enterprise', '4512545211', NULL, 62, '', '', 'Dhaka', NULL, 'a', NULL),
(30, 'Nuru', '8542', NULL, '8542', 'c4ca4238a0b923820dcc509a6f75849b', 'Nuru Store', '451265', 'wholesale', 63, '', '', '452126', NULL, 'a', NULL),
(31, 'sdfsd', 'fsdf', NULL, 'fsdf', 'c4ca4238a0b923820dcc509a6f75849b', 'fsdfsd', 'fsdf', 'wholesale', 64, '', 'Slider3_1512x.jpg', 'sdfsd', NULL, 'a', NULL),
(32, 'test', '9+594554+9', NULL, '9+594554+9', 'c4ca4238a0b923820dcc509a6f75849b', 'test', '4512', 'wholesale', 65, '', 'KGFK15232-4.jpg', 's fsd', NULL, 'a', NULL),
(33, 'test', '9+594554+9', NULL, '9+594554+9', 'c4ca4238a0b923820dcc509a6f75849b', 'test', '4512', 'wholesale', 66, '', '7e0e036d944febe39930c2252b5275f9.jpg', 's fsd', NULL, 'a', NULL),
(34, 'test', '9+594554+9', NULL, '9+594554+9', 'c4ca4238a0b923820dcc509a6f75849b', 'test', '4512', NULL, NULL, '496-4964657_thumb-punjabi-language-hd-png-download1.png', '40f93882808daceef2091662a5defb301.jpg', 's fsd', NULL, 'a', NULL),
(35, 'test', '9+594554+9', NULL, '9+594554+9', 'c4ca4238a0b923820dcc509a6f75849b', 'test', '4512', NULL, NULL, '496-4964657_thumb-punjabi-language-hd-png-download.png', '7e0e036d944febe39930c2252b5275f92.jpg', 's fsd', NULL, 'a', NULL),
(36, 'Kim', '017742645612', NULL, '017742645612', 'c4ca4238a0b923820dcc509a6f75849b', 'jimn', '4512325', NULL, 67, '7e0e036d944febe39930c2252b5275f91.jpg', '496-4964657_thumb-punjabi-language-hd-png-download2.png', 'dhaka', NULL, 'a', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_month`
--

CREATE TABLE `tbl_month` (
  `month_id` int(11) NOT NULL,
  `month_name` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_month`
--

INSERT INTO `tbl_month` (`month_id`, `month_name`) VALUES
(1, 'January-2021'),
(2, 'February-2022'),
(3, 'March-2022'),
(4, 'january');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `Product_SlNo` int(11) NOT NULL,
  `Product_Code` varchar(50) NOT NULL,
  `Product_Name` varchar(150) NOT NULL,
  `ProductCategory_ID` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `size` varchar(11) NOT NULL DEFAULT 'na',
  `vat` float NOT NULL,
  `Product_ReOrederLevel` int(11) NOT NULL,
  `Product_Purchase_Rate` decimal(18,2) NOT NULL,
  `Product_SellingPrice` decimal(18,2) NOT NULL,
  `Product_MinimumSellingPrice` decimal(18,2) NOT NULL,
  `Product_WholesaleRate` decimal(18,2) NOT NULL,
  `one_cartun_equal` varchar(20) NOT NULL,
  `is_service` varchar(10) NOT NULL DEFAULT 'false',
  `Unit_ID` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(100) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `Product_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(1, 'P00001', '3 Pice Bule', 1, 0, 0, 'na', 0, 2, '1200.00', '1200.00', '0.00', '1100.00', '', 'false', 1, 'd', 'Admin', '2022-01-29 13:36:49', '', '', 1),
(2, 'P00002', 'Kurti White With Katan ', 1, 0, 0, 'na', 0, 3, '1100.00', '1200.00', '0.00', '1200.00', '', 'false', 1, 'd', 'Admin', '2022-01-29 13:37:49', '', '', 1),
(3, 'P00003', 'Burger Big', 2, 0, 0, 'na', 15, 20, '100.00', '150.00', '0.00', '140.00', '', 'false', 1, 'd', 'Admin', '2022-01-29 13:38:24', '', '', 1),
(4, 'P00004', 'Samsung Galaxy J2', 3, 0, 0, 'na', 0, 2, '8000.00', '10000.00', '0.00', '9000.00', '', 'false', 1, 'd', 'Admin', '2022-01-29 13:39:00', '', '', 1),
(5, 'P00005', 'Samsung Galaxy J5', 3, 0, 0, 'na', 0, 2, '15000.00', '16000.00', '0.00', '16000.00', '', 'false', 1, 'd', 'Admin', '2022-01-29 13:39:31', '', '', 1),
(6, 'P00006', 'Sanitary Plastic Pipe 10\"', 4, 0, 0, 'na', 0, 3, '20.00', '22.00', '0.00', '21.50', '', 'false', 1, 'd', 'Admin', '2022-01-29 13:40:24', '', '', 1),
(7, 'P00007', 'Amon Chawl 50Kg Bag', 1, 0, 0, 'na', 0, 10, '2800.00', '3000.00', '0.00', '3000.00', '', 'false', 3, 'd', 'Admin', '2022-01-29 13:41:44', '', '', 1),
(8, 'P00008', '43T/130\"(80) White Mesh ', 5, 0, 0, 'na', 0, 50, '200.00', '350.00', '0.00', '275.00', '', 'false', 5, 'd', 'Admin', '2022-02-09 11:09:00', '', '', 1),
(9, 'P00009', '54T/130\"(55) White Mesh ', 5, 0, 0, 'na', 0, 200, '200.00', '350.00', '0.00', '275.00', '', 'false', 5, 'd', 'Admin', '2022-02-09 11:10:16', '', '', 1),
(10, 'P00010', '68T/130\"(64) White Mesh', 5, 0, 0, 'na', 0, 80, '200.00', '350.00', '0.00', '275.00', '', 'false', 5, 'd', 'Admin', '2022-02-09 11:10:55', '', '', 1),
(11, 'P00011', '43T/65\"(55) White Mesh', 5, 0, 0, 'na', 0, 20, '110.00', '200.00', '0.00', '150.00', '', 'false', 5, 'd', 'Admin', '2022-02-09 11:11:50', '', '', 1),
(12, 'P00012', '54T/65\"(55) White Mesh', 5, 0, 0, 'na', 0, 50, '110.00', '200.00', '0.00', '150.00', '', 'false', 5, 'd', 'Admin', '2022-02-09 11:12:39', '', '', 1),
(13, 'P00013', '90T/130\"(48) Yellow Mesh', 6, 0, 0, 'na', 0, 50, '300.00', '400.00', '0.00', '350.00', '', 'false', 5, 'd', 'Admin', '2022-02-09 11:13:34', '', '', 1),
(14, 'P00014', '100T/130\"(48) Yellow Mesh', 6, 0, 0, 'na', 0, 50, '300.00', '400.00', '0.00', '350.00', '', 'false', 5, 'd', 'Admin', '2022-02-09 11:14:09', '', '', 1),
(15, 'P00015', '90T/65\"(48) Yellow Mesh', 6, 0, 0, 'na', 0, 50, '200.00', '300.00', '0.00', '250.00', '', 'false', 5, 'd', 'Admin', '2022-02-09 11:14:36', '', '', 1),
(16, 'P00016', 'Dal', 7, 0, 0, 'na', 0, 10, '215.00', '230.00', '0.00', '225.00', '', 'false', 4, 'd', 'Admin', '2022-02-12 14:05:35', '', '', 1),
(17, 'P00017', 'Basic Chair', 8, 0, 0, 'na', 0, 10, '3700.00', '4900.00', '0.00', '4200.00', '', 'false', 6, 'a', 'Admin', '2022-02-16 22:04:09', '', '', 1),
(18, 'P00018', 'Boss chair', 10, 0, 0, 'na', 0, 12, '6500.00', '8500.00', '0.00', '8000.00', '', 'false', 6, 'a', 'global', '2022-02-17 12:40:34', '', '', 2),
(19, 'P00019', 'Regular Chair', 8, 0, 0, 'na', 0, 10, '4400.00', '4900.00', '0.00', '4700.00', '', 'false', 6, 'a', 'global', '2022-02-17 13:20:56', 'global', '2022-02-17 13:23:57', 2),
(20, 'P00020', 'xyz', 7, 0, 0, 'na', 0, 10, '15.00', '25.00', '0.00', '0.00', '', 'false', 6, 'a', 'Admin', '2022-02-20 15:01:07', '', '', 1),
(21, 'P00021', 'sunsilk', 11, 0, 0, 'na', 0, 2, '10.00', '12.00', '0.00', '11.00', '', 'false', 6, 'a', 'Admin', '2022-02-21 10:46:22', 'Admin', '2022-02-21 10:47:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productcategory`
--

CREATE TABLE `tbl_productcategory` (
  `ProductCategory_SlNo` int(11) NOT NULL,
  `ProductCategory_Name` varchar(150) NOT NULL,
  `ProductCategory_Description` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `category_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_productcategory`
--

INSERT INTO `tbl_productcategory` (`ProductCategory_SlNo`, `ProductCategory_Name`, `ProductCategory_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `category_branchid`) VALUES
(1, 'Others', 'Others', 'a', 'Admin', '2022-01-29 13:35:10', '', '', 1),
(2, 'Foods', '', 'd', 'Admin', '2022-01-29 13:35:18', '', '', 1),
(3, 'Electronics', 'Electronics', 'd', 'Admin', '2022-01-29 13:35:30', '', '', 1),
(4, 'Hardware', 'Hardware', 'a', 'Admin', '2022-01-29 13:35:38', '', '', 1),
(5, 'White-T-Mesh  ', '', 'a', 'Admin', '2022-02-09 10:57:01', '', '', 1),
(6, 'Yellow-T-Mesh ', '', 'a', 'Admin', '2022-02-09 10:57:18', '', '', 1),
(7, 'Pran', '', 'a', 'Admin', '2022-02-12 14:03:56', '', '', 1),
(8, 'Chair', 'Office', 'a', 'Admin', '2022-02-16 21:58:11', '', '', 1),
(9, 'Table', '', 'a', 'global', '2022-02-17 12:06:39', '', '', 2),
(10, 'Chair', '', 'a', 'global', '2022-02-17 12:38:45', '', '', 2),
(11, 'hair', 'sunsilk', 'a', 'Admin', '2022-02-21 10:42:48', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_images`
--

CREATE TABLE `tbl_product_images` (
  `id` int(11) NOT NULL,
  `SaleDetails_SlNo` int(11) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_images`
--

INSERT INTO `tbl_product_images` (`id`, `SaleDetails_SlNo`, `image`) VALUES
(373, 480, '2201200307)68T130(64)_White_Mesh.jpg'),
(374, 480, '2201200307)68T130(64)_White_Mesh1.jpg'),
(375, 481, '2201200308)68T130(64)_White_Mesh.jpg'),
(376, 481, '2201200308)68T130(64)_White_Mesh1.jpg'),
(377, 482, '2201200309)68T130(64)_White_Mesh.jpg'),
(378, 482, '2201200309)68T130(64)_White_Mesh1.jpg'),
(379, 483, '220100001)68T130(64)_White_Mesh.jpg'),
(380, 483, '220100001)68T130(64)_White_Mesh1.jpg'),
(381, 484, '220100001)100T130(48)_Yellow_Mesh.jpg'),
(382, 484, '220100001)100T130(48)_Yellow_Mesh1.jpg'),
(383, 485, '22000311)100T130(48)_Yellow_Mesh.jpg'),
(384, 485, '22000311)100T130(48)_Yellow_Mesh1.jpg'),
(385, 486, '22000312)68T130(64)_White_Mesh.jpg'),
(386, 486, '22000312)68T130(64)_White_Mesh1.jpg'),
(387, 487, '22000312)xyz.jpg'),
(388, 487, '22000312)xyz1.jpg'),
(389, 487, '22000312)xyz.jpeg'),
(390, 488, 'download_(10).jpeg'),
(391, 488, 'download_(9).jpeg'),
(392, 489, 'kgfk15437-2.jpg'),
(393, 489, 'kgfk15437-1.jpg'),
(394, 490, 'download_(10)1.jpeg'),
(395, 490, 'download_(9)1.jpeg'),
(396, 491, 'kgfk15437-21.jpg'),
(397, 491, 'kgfk15437-11.jpg'),
(398, 492, '22000315)68T130(64)_White_Mesh.jpeg'),
(399, 492, '22000315)68T130(64)_White_Mesh1.jpeg'),
(400, 493, '22000315)90T65(48)_Yellow_Mesh.jpg'),
(401, 493, '22000315)90T65(48)_Yellow_Mesh1.jpg'),
(402, 494, '22000316)68T130(64)_White_Mesh.jpeg'),
(403, 494, '22000316)68T130(64)_White_Mesh1.jpeg'),
(404, 495, '22000316)90T65(48)_Yellow_Mesh.jpg'),
(405, 495, '22000316)90T65(48)_Yellow_Mesh1.jpg'),
(406, 496, '22000317)68T130(64)_White_Mesh.jpeg'),
(407, 496, '22000317)68T130(64)_White_Mesh1.jpeg'),
(408, 497, '22000317)90T65(48)_Yellow_Mesh.jpg'),
(409, 497, '22000317)90T65(48)_Yellow_Mesh1.jpg'),
(410, 498, '22000318)68T130(64)_White_Mesh.jpeg'),
(411, 498, '22000318)68T130(64)_White_Mesh1.jpeg'),
(412, 499, '22000318)90T65(48)_Yellow_Mesh.jpg'),
(413, 499, '22000318)90T65(48)_Yellow_Mesh1.jpg'),
(414, 500, '22000319)68T130(64)_White_Mesh.jpeg'),
(415, 500, '22000319)68T130(64)_White_Mesh1.jpeg'),
(416, 501, '22000319)90T65(48)_Yellow_Mesh.jpg'),
(417, 501, '22000319)90T65(48)_Yellow_Mesh1.jpg'),
(418, 502, '22000320)68T130(64)_White_Mesh.jpeg'),
(419, 502, '22000320)68T130(64)_White_Mesh1.jpeg'),
(420, 503, '22000320)90T65(48)_Yellow_Mesh.jpg'),
(421, 503, '22000320)90T65(48)_Yellow_Mesh1.jpg'),
(422, 504, '22000321)54T130(55)_White_Mesh_.jpg'),
(423, 504, '22000321)54T130(55)_White_Mesh_1.jpg'),
(424, 505, '22000321)100T130(48)_Yellow_Mesh.jpg'),
(425, 505, '22000321)100T130(48)_Yellow_Mesh1.jpg'),
(426, 506, '22000322)54T130(55)_White_Mesh_.jpg'),
(427, 506, '22000322)54T130(55)_White_Mesh_1.jpg'),
(428, 507, '22000322)100T130(48)_Yellow_Mesh.jpg'),
(429, 507, '22000322)100T130(48)_Yellow_Mesh1.jpg'),
(430, 508, '22000323)54T130(55)_White_Mesh_.jpg'),
(431, 508, '22000323)54T130(55)_White_Mesh_1.jpg'),
(432, 509, '22000323)100T130(48)_Yellow_Mesh.jpg'),
(433, 509, '22000323)100T130(48)_Yellow_Mesh1.jpg'),
(434, 510, '22000324)100T130(48)_Yellow_Mesh.jpg'),
(435, 510, '22000324)100T130(48)_Yellow_Mesh1.jpg'),
(436, 511, '22000325)100T130(48)_Yellow_Mesh.jpg'),
(437, 511, '22000325)100T130(48)_Yellow_Mesh1.jpg'),
(438, 524, '2201200338)68T130(64)_White_Mesh.jpg'),
(439, 524, '2201200338)68T130(64)_White_Mesh1.jpg'),
(440, 529, '2201200342)68T130(64)_White_Mesh.jpg'),
(441, 529, '2201200342)68T130(64)_White_Mesh1.jpg'),
(442, 530, '2201200341)100T130(48)_Yellow_Mesh.jpg'),
(443, 530, '2201200341)100T130(48)_Yellow_Mesh1.jpg'),
(444, 531, '2201200341)Basic_Chair.jpg'),
(445, 531, '2201200341)Basic_Chair1.jpg'),
(446, 533, '2201200345)90T65(48)_Yellow_Mesh.jpg'),
(447, 533, '2201200345)90T65(48)_Yellow_Mesh1.jpg'),
(448, 534, '2201200345)Regular_Chair.jpg'),
(449, 534, '2201200345)Regular_Chair1.jpg'),
(450, 535, '2201200346)90T65(48)_Yellow_Mesh.jpg'),
(451, 535, '2201200346)90T65(48)_Yellow_Mesh1.jpg'),
(452, 536, '2201200346)Regular_Chair.jpg'),
(453, 536, '2201200346)Regular_Chair1.jpg'),
(454, 537, '2201200347)90T65(48)_Yellow_Mesh.jpg'),
(455, 537, '2201200347)90T65(48)_Yellow_Mesh1.jpg'),
(456, 538, '2201200347)Regular_Chair.jpg'),
(457, 538, '2201200347)Regular_Chair1.jpg'),
(458, 539, '2201200341)90T65(48)_Yellow_Mesh.jpg'),
(459, 539, '2201200341)90T65(48)_Yellow_Mesh1.jpg'),
(460, 540, '2201200341)Regular_Chair.jpg'),
(461, 540, '2201200341)Regular_Chair1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasedetails`
--

CREATE TABLE `tbl_purchasedetails` (
  `PurchaseDetails_SlNo` int(11) NOT NULL,
  `PurchaseMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `PurchaseDetails_TotalQuantity` float NOT NULL,
  `PurchaseDetails_Rate` decimal(18,2) NOT NULL,
  `purchase_cost` decimal(18,2) NOT NULL,
  `PurchaseDetails_Discount` decimal(18,2) NOT NULL,
  `PurchaseDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseDetails_branchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchasedetails`
--

INSERT INTO `tbl_purchasedetails` (`PurchaseDetails_SlNo`, `PurchaseMaster_IDNo`, `Product_IDNo`, `PurchaseDetails_TotalQuantity`, `PurchaseDetails_Rate`, `purchase_cost`, `PurchaseDetails_Discount`, `PurchaseDetails_TotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseDetails_branchID`) VALUES
(1, 1, 7, 2, '2800.00', '0.00', '0.00', '5600.00', 'a', 'Admin', '2022-01-31 18:41:11', NULL, NULL, 1),
(2, 1, 6, 3, '20.00', '0.00', '0.00', '60.00', 'a', 'Admin', '2022-01-31 18:41:11', NULL, NULL, 1),
(3, 1, 5, 3, '15000.00', '0.00', '0.00', '45000.00', 'a', 'Admin', '2022-01-31 18:41:11', NULL, NULL, 1),
(4, 1, 3, 20, '100.00', '0.00', '0.00', '2000.00', 'a', 'Admin', '2022-01-31 18:41:11', NULL, NULL, 1),
(5, 1, 1, 3, '1200.00', '0.00', '0.00', '3600.00', 'a', 'Admin', '2022-01-31 18:41:11', NULL, NULL, 1),
(14, 2, 15, 300, '200.00', '0.00', '0.00', '60000.00', 'a', NULL, NULL, 'Admin', '2022-02-09 12:01:17', 1),
(15, 2, 14, 250, '300.00', '0.00', '0.00', '75000.00', 'a', NULL, NULL, 'Admin', '2022-02-09 12:01:17', 1),
(16, 2, 11, 500, '110.00', '0.00', '0.00', '55000.00', 'a', NULL, NULL, 'Admin', '2022-02-09 12:01:17', 1),
(17, 2, 9, 450, '200.00', '0.00', '0.00', '90000.00', 'a', NULL, NULL, 'Admin', '2022-02-09 12:01:17', 1),
(18, 2, 10, 300, '200.00', '0.00', '0.00', '60000.00', 'a', NULL, NULL, 'Admin', '2022-02-09 12:01:17', 1),
(19, 2, 13, 200, '300.00', '0.00', '0.00', '60000.00', 'a', NULL, NULL, 'Admin', '2022-02-09 12:01:17', 1),
(20, 2, 12, 500, '110.00', '0.00', '0.00', '55000.00', 'a', NULL, NULL, 'Admin', '2022-02-09 12:01:17', 1),
(21, 2, 8, 600, '200.00', '0.00', '0.00', '120000.00', 'a', NULL, NULL, 'Admin', '2022-02-09 12:01:17', 1),
(22, 3, 14, 50, '300.00', '0.00', '0.00', '15000.00', 'a', 'Admin', '2022-02-09 14:06:30', NULL, NULL, 1),
(23, 3, 12, 50, '110.00', '0.00', '0.00', '5500.00', 'a', 'Admin', '2022-02-09 14:06:30', NULL, NULL, 1),
(24, 3, 15, 100, '200.00', '0.00', '0.00', '20000.00', 'a', 'Admin', '2022-02-09 14:06:30', NULL, NULL, 1),
(25, 4, 15, 500, '200.00', '0.00', '0.00', '100000.00', 'a', 'Admin', '2022-02-10 17:19:26', NULL, NULL, 1),
(26, 4, 14, 200, '300.00', '0.00', '0.00', '60000.00', 'a', 'Admin', '2022-02-10 17:19:26', NULL, NULL, 1),
(27, 4, 11, 500, '110.00', '0.00', '0.00', '55000.00', 'a', 'Admin', '2022-02-10 17:19:26', NULL, NULL, 1),
(28, 5, 15, 100, '200.00', '0.00', '0.00', '20000.00', 'a', 'Admin', '2022-02-12 13:46:28', NULL, NULL, 1),
(29, 6, 16, 20, '215.00', '0.00', '0.00', '4300.00', 'a', 'Admin', '2022-02-12 14:07:25', NULL, NULL, 1),
(30, 7, 11, 54, '110.00', '0.00', '0.00', '5940.00', 'a', 'Admin', '2022-02-13 12:36:12', NULL, NULL, 1),
(31, 7, 12, 43, '110.00', '0.00', '0.00', '4730.00', 'a', 'Admin', '2022-02-13 12:36:12', NULL, NULL, 1),
(32, 8, 12, 12, '110.00', '0.00', '0.00', '1320.00', 'a', 'Admin', '2022-02-13 13:19:30', NULL, NULL, 1),
(33, 9, 13, 15, '300.00', '0.00', '0.00', '4500.00', 'a', 'Admin', '2022-02-13 13:20:56', NULL, NULL, 1),
(34, 9, 14, 8, '300.00', '0.00', '0.00', '2400.00', 'a', 'Admin', '2022-02-13 13:20:56', NULL, NULL, 1),
(35, 9, 9, 12, '200.00', '0.00', '0.00', '2400.00', 'a', 'Admin', '2022-02-13 13:20:56', NULL, NULL, 1),
(36, 10, 14, 15, '300.00', '0.00', '0.00', '4500.00', 'a', 'tasinur', '2022-02-13 13:29:57', NULL, NULL, 1),
(37, 11, 16, 222, '215.00', '0.00', '0.00', '47730.00', 'a', 'Admin', '2022-02-13 14:17:29', NULL, NULL, 1),
(38, 12, 16, 20, '215.00', '0.00', '0.00', '4300.00', 'a', 'Admin', '2022-02-14 15:01:34', NULL, NULL, 1),
(39, 12, 15, 10, '200.00', '0.00', '0.00', '2000.00', 'a', 'Admin', '2022-02-14 15:01:34', NULL, NULL, 1),
(40, 13, 17, 20, '3700.00', '0.00', '0.00', '74000.00', 'a', 'Admin', '2022-02-17 12:40:22', NULL, NULL, 1),
(41, 14, 19, 10, '4400.00', '0.00', '0.00', '44000.00', 'a', 'global', '2022-02-17 13:29:22', NULL, NULL, 2),
(42, 14, 17, 3, '3700.00', '0.00', '0.00', '11100.00', 'a', 'global', '2022-02-17 13:29:22', NULL, NULL, 2),
(43, 15, 20, 20, '15.00', '0.00', '0.00', '300.00', 'a', 'Admin', '2022-02-20 15:01:48', NULL, NULL, 1),
(44, 16, 21, 55, '10.00', '0.00', '0.00', '550.00', 'a', 'Admin', '2022-02-21 19:16:05', NULL, NULL, 1),
(45, 17, 21, 100, '10.00', '0.00', '0.00', '1000.00', 'a', 'sakil', '2022-02-22 22:53:33', NULL, NULL, 1),
(46, 18, 19, 100, '4400.00', '0.00', '0.00', '440000.00', 'a', 'sakil', '2022-02-22 23:17:46', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasemaster`
--

CREATE TABLE `tbl_purchasemaster` (
  `PurchaseMaster_SlNo` int(11) NOT NULL,
  `Supplier_SlNo` int(11) NOT NULL,
  `Employee_SlNo` int(11) NOT NULL,
  `PurchaseMaster_InvoiceNo` varchar(50) NOT NULL,
  `PurchaseMaster_OrderDate` date NOT NULL,
  `PurchaseMaster_PurchaseFor` varchar(50) NOT NULL,
  `PurchaseMaster_Description` longtext NOT NULL,
  `PurchaseMaster_TotalAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_DiscountAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_Tax` decimal(18,2) NOT NULL,
  `PurchaseMaster_Freight` decimal(18,2) NOT NULL,
  `PurchaseMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_PaidAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_DueAmount` decimal(18,2) NOT NULL,
  `previous_due` float DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseMaster_BranchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchasemaster`
--

INSERT INTO `tbl_purchasemaster` (`PurchaseMaster_SlNo`, `Supplier_SlNo`, `Employee_SlNo`, `PurchaseMaster_InvoiceNo`, `PurchaseMaster_OrderDate`, `PurchaseMaster_PurchaseFor`, `PurchaseMaster_Description`, `PurchaseMaster_TotalAmount`, `PurchaseMaster_DiscountAmount`, `PurchaseMaster_Tax`, `PurchaseMaster_Freight`, `PurchaseMaster_SubTotalAmount`, `PurchaseMaster_PaidAmount`, `PurchaseMaster_DueAmount`, `previous_due`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseMaster_BranchID`) VALUES
(1, 1, 0, '2022000001', '2022-01-31', '1', '', '56260.00', '0.00', '0.00', '0.00', '56260.00', '56000.00', '260.00', 20000, 'a', 'Admin', '2022-01-31 18:41:11', NULL, NULL, 1),
(2, 2, 0, '2022000002', '2022-02-09', '1', '', '575000.00', '0.00', '0.00', '0.00', '575000.00', '575000.00', '0.00', 0, 'a', 'Admin', '2022-02-09 11:21:07', 'Admin', '2022-02-09 12:01:17', 1),
(3, 2, 0, '2022000003', '2022-02-09', '1', '', '40500.00', '0.00', '0.00', '0.00', '40500.00', '40500.00', '0.00', 0, 'a', 'Admin', '2022-02-09 14:06:30', NULL, NULL, 1),
(4, 2, 0, '2022000004', '2022-02-10', '1', '', '215000.00', '0.00', '0.00', '0.00', '215000.00', '215000.00', '0.00', 0, 'a', 'Admin', '2022-02-10 17:19:26', NULL, NULL, 1),
(5, 2, 0, '2022000005', '2022-02-12', '1', '', '20000.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '20000.00', -10000, 'a', 'Admin', '2022-02-12 13:46:28', NULL, NULL, 1),
(6, 2, 0, '2022000006', '2022-02-12', '1', '', '4300.00', '0.00', '0.00', '0.00', '4300.00', '0.00', '4300.00', 6000, 'a', 'Admin', '2022-02-12 14:07:25', NULL, NULL, 1),
(7, 2, 0, '2022000007', '2022-02-13', '1', '', '10670.00', '0.00', '0.00', '0.00', '10670.00', '0.00', '10670.00', 10300, 'a', 'Admin', '2022-02-13 12:36:12', NULL, NULL, 1),
(8, 2, 0, '2022000008', '2022-02-13', '1', '', '1320.00', '0.00', '0.00', '0.00', '1320.00', '0.00', '1320.00', 20970, 'a', 'Admin', '2022-02-13 13:19:30', NULL, NULL, 1),
(9, 2, 0, '2022000009', '2022-02-13', '1', '', '9300.00', '0.00', '0.00', '0.00', '9300.00', '0.00', '9300.00', 22290, 'a', 'Admin', '2022-02-13 13:20:56', NULL, NULL, 1),
(10, 2, 0, '2022000010', '2022-02-13', '1', '', '4500.00', '0.00', '0.00', '0.00', '4500.00', '0.00', '4500.00', 31590, 'a', 'tasinur', '2022-02-13 13:29:57', NULL, NULL, 1),
(11, 2, 0, '2022000011', '2022-02-13', '1', '', '47730.00', '0.00', '0.00', '0.00', '47730.00', '0.00', '47730.00', 36090, 'a', 'Admin', '2022-02-13 14:17:29', NULL, NULL, 1),
(12, 2, 0, '2022000012', '2022-02-14', '1', '', '6300.00', '0.00', '0.00', '0.00', '6300.00', '0.00', '6300.00', 73820, 'a', 'Admin', '2022-02-14 15:01:34', NULL, NULL, 1),
(13, 4, 0, '2022000013', '2022-02-17', '1', '', '74000.00', '0.00', '0.00', '0.00', '74000.00', '74000.00', '0.00', 0, 'a', 'Admin', '2022-02-17 12:40:22', NULL, NULL, 1),
(14, 6, 0, '2022000014', '2022-02-17', '2', '', '56100.00', '0.00', '0.00', '1000.00', '55100.00', '50000.00', '6100.00', 10000, 'a', 'global', '2022-02-17 13:29:22', NULL, NULL, 2),
(15, 2, 0, '2022000015', '2022-02-20', '1', '', '300.00', '0.00', '0.00', '0.00', '300.00', '0.00', '300.00', 80120, 'a', 'Admin', '2022-02-20 15:01:48', NULL, NULL, 1),
(16, 7, 0, '2022000016', '2022-02-21', '1', '', '550.00', '0.00', '0.00', '0.00', '550.00', '550.00', '0.00', 0, 'a', 'Admin', '2022-02-21 19:16:05', NULL, NULL, 1),
(17, 7, 0, '2022000017', '2022-02-22', '1', '', '1000.00', '0.00', '0.00', '0.00', '1000.00', '1000.00', '0.00', 0, 'a', 'sakil', '2022-02-22 22:53:33', NULL, NULL, 1),
(18, 3, 0, '2022000018', '2022-02-22', '1', '', '440000.00', '0.00', '0.00', '0.00', '440000.00', '440000.00', '0.00', 0, 'a', 'sakil', '2022-02-22 23:17:46', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasereturn`
--

CREATE TABLE `tbl_purchasereturn` (
  `PurchaseReturn_SlNo` int(11) NOT NULL,
  `PurchaseMaster_InvoiceNo` varchar(50) NOT NULL,
  `Supplier_IDdNo` int(11) NOT NULL,
  `PurchaseReturn_ReturnDate` date NOT NULL,
  `PurchaseReturn_ReturnAmount` decimal(18,2) NOT NULL,
  `PurchaseReturn_Description` varchar(300) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseReturn_brunchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchasereturn`
--

INSERT INTO `tbl_purchasereturn` (`PurchaseReturn_SlNo`, `PurchaseMaster_InvoiceNo`, `Supplier_IDdNo`, `PurchaseReturn_ReturnDate`, `PurchaseReturn_ReturnAmount`, `PurchaseReturn_Description`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseReturn_brunchID`) VALUES
(1, '2022000005', 2, '2022-02-12', '4000.00', '', 'a', 'Admin', '2022-02-12 13:50:13', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasereturndetails`
--

CREATE TABLE `tbl_purchasereturndetails` (
  `PurchaseReturnDetails_SlNo` int(11) NOT NULL,
  `PurchaseReturn_SlNo` int(11) NOT NULL,
  `PurchaseReturnDetailsProduct_SlNo` int(11) NOT NULL,
  `PurchaseReturnDetails_ReturnQuantity` float NOT NULL,
  `PurchaseReturnDetails_ReturnAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseReturnDetails_brachid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchasereturndetails`
--

INSERT INTO `tbl_purchasereturndetails` (`PurchaseReturnDetails_SlNo`, `PurchaseReturn_SlNo`, `PurchaseReturnDetailsProduct_SlNo`, `PurchaseReturnDetails_ReturnQuantity`, `PurchaseReturnDetails_ReturnAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseReturnDetails_brachid`) VALUES
(1, 1, 15, 20, '4000.00', 'a', 'Admin', '2022-02-12 13:50:13', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotaion_customer`
--

CREATE TABLE `tbl_quotaion_customer` (
  `quotation_customer_id` int(11) NOT NULL,
  `customer_name` char(50) NOT NULL,
  `contact_number` varchar(35) NOT NULL,
  `customer_address` text NOT NULL,
  `quation_customer_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_details`
--

CREATE TABLE `tbl_quotation_details` (
  `SaleDetails_SlNo` int(11) NOT NULL,
  `SaleMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `SaleDetails_TotalQuantity` float NOT NULL,
  `SaleDetails_Rate` decimal(18,2) NOT NULL,
  `SaleDetails_Discount` decimal(18,2) NOT NULL,
  `SaleDetails_Tax` decimal(18,2) NOT NULL,
  `SaleDetails_Freight` decimal(18,2) NOT NULL,
  `SaleDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleDetails_BranchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_quotation_details`
--

INSERT INTO `tbl_quotation_details` (`SaleDetails_SlNo`, `SaleMaster_IDNo`, `Product_IDNo`, `SaleDetails_TotalQuantity`, `SaleDetails_Rate`, `SaleDetails_Discount`, `SaleDetails_Tax`, `SaleDetails_Freight`, `SaleDetails_TotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleDetails_BranchId`) VALUES
(1, 1, 15, 350, '300.00', '0.00', '0.00', '0.00', '105000.00', 'a', 'Admin', '2022-02-09 12:32:15', NULL, NULL, 1),
(2, 1, 9, 360, '350.00', '0.00', '0.00', '0.00', '126000.00', 'a', 'Admin', '2022-02-09 12:32:15', NULL, NULL, 1),
(3, 1, 13, 500, '400.00', '0.00', '0.00', '0.00', '200000.00', 'a', 'Admin', '2022-02-09 12:32:15', NULL, NULL, 1),
(4, 2, 15, 1, '300.00', '0.00', '0.00', '0.00', '300.00', 'a', 'Admin', '2022-02-11 17:31:21', NULL, NULL, 1),
(5, 2, 12, 1, '200.00', '0.00', '0.00', '0.00', '200.00', 'a', 'Admin', '2022-02-11 17:31:21', NULL, NULL, 1),
(6, 2, 14, 1, '400.00', '0.00', '0.00', '0.00', '400.00', 'a', 'Admin', '2022-02-11 17:31:21', NULL, NULL, 1),
(7, 3, 19, 7, '4900.00', '0.00', '0.00', '0.00', '34300.00', 'a', 'global', '2022-02-17 14:12:24', NULL, NULL, 2),
(8, 3, 17, 3, '4900.00', '0.00', '0.00', '0.00', '14700.00', 'a', 'global', '2022-02-17 14:12:24', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_master`
--

CREATE TABLE `tbl_quotation_master` (
  `SaleMaster_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SaleMaster_customer_name` varchar(500) NOT NULL,
  `SaleMaster_customer_mobile` varchar(50) NOT NULL,
  `SaleMaster_customer_address` varchar(1000) NOT NULL,
  `SaleMaster_SaleDate` date NOT NULL,
  `SaleMaster_Description` longtext DEFAULT NULL,
  `SaleMaster_TotalSaleAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TotalDiscountAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TaxAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Freight` decimal(18,2) NOT NULL,
  `SaleMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleMaster_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_quotation_master`
--

INSERT INTO `tbl_quotation_master` (`SaleMaster_SlNo`, `SaleMaster_InvoiceNo`, `SaleMaster_customer_name`, `SaleMaster_customer_mobile`, `SaleMaster_customer_address`, `SaleMaster_SaleDate`, `SaleMaster_Description`, `SaleMaster_TotalSaleAmount`, `SaleMaster_TotalDiscountAmount`, `SaleMaster_TaxAmount`, `SaleMaster_Freight`, `SaleMaster_SubTotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleMaster_branchid`) VALUES
(1, 'Q-202200001', 'Reedisha Knit ', '0158', 'Gazipur ', '2022-02-09', NULL, '431000.00', '0.00', '0.00', '0.00', '431000.00', 'a', 'Admin', '2022-02-09 12:32:15', NULL, NULL, 1),
(2, 'Q-202200002', 'Al amin', '017', 'adabor', '2022-02-11', NULL, '900.00', '0.00', '0.00', '0.00', '900.00', 'a', 'Admin', '2022-02-11 17:31:21', NULL, NULL, 1),
(3, 'Q-202200003', 'Md. Sujon ', '09778', '70 Senpara Parbata, Mirpur 10, Dhaka', '2022-02-17', NULL, '52675.00', '0.00', '3675.00', '0.00', '49000.00', 'a', 'global', '2022-02-17 14:12:24', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saledetails`
--

CREATE TABLE `tbl_saledetails` (
  `SaleDetails_SlNo` int(11) NOT NULL,
  `SaleMaster_IDNo` int(11) NOT NULL,
  `SalseCustomer_IDNo` int(11) DEFAULT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `SaleDetails_TotalQuantity` float NOT NULL,
  `Purchase_Rate` decimal(18,2) DEFAULT NULL,
  `SaleDetails_Rate` decimal(18,2) NOT NULL,
  `SaleDetails_Discount` decimal(18,2) NOT NULL,
  `Discount_amount` decimal(18,2) DEFAULT NULL,
  `SaleDetails_Tax` decimal(18,2) NOT NULL,
  `SaleDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleDetails_BranchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_saledetails`
--

INSERT INTO `tbl_saledetails` (`SaleDetails_SlNo`, `SaleMaster_IDNo`, `SalseCustomer_IDNo`, `Product_IDNo`, `SaleDetails_TotalQuantity`, `Purchase_Rate`, `SaleDetails_Rate`, `SaleDetails_Discount`, `Discount_amount`, `SaleDetails_Tax`, `SaleDetails_TotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleDetails_BranchId`) VALUES
(483, 310, 63, 10, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'd', '1', '2022-04-21 18:52:11', NULL, NULL, 0),
(484, 310, 63, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'd', '1', '2022-04-21 18:52:11', NULL, NULL, 0),
(485, 311, 62, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'd', '1', '2022-04-22 10:25:54', NULL, NULL, 0),
(486, 312, 54, 10, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'd', '1', '2022-04-22 10:51:24', NULL, NULL, 0),
(487, 312, 54, 20, 1, '15.00', '0.00', '0.00', NULL, '0.00', '25.00', 'd', '1', '2022-04-22 10:51:24', NULL, NULL, 0),
(488, 313, 0, 9, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'p', '12', '2022-04-22 10:59:18', NULL, NULL, 0),
(489, 313, 0, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'p', '12', '2022-04-22 10:59:18', NULL, NULL, 0),
(490, 314, 0, 9, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'p', '12', '2022-04-22 11:02:43', NULL, NULL, 0),
(491, 314, 0, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'p', '12', '2022-04-22 11:02:43', NULL, NULL, 0),
(492, 315, 51, 10, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'd', 'Admin', '2022-04-22 11:04:45', NULL, NULL, 1),
(493, 315, 51, 15, 1, '200.00', '0.00', '0.00', NULL, '0.00', '300.00', 'd', 'Admin', '2022-04-22 11:04:45', NULL, NULL, 1),
(494, 316, 51, 10, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'd', 'Admin', '2022-04-22 11:06:01', NULL, NULL, 1),
(495, 316, 51, 15, 1, '200.00', '0.00', '0.00', NULL, '0.00', '300.00', 'd', 'Admin', '2022-04-22 11:06:01', NULL, NULL, 1),
(496, 317, 51, 10, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'd', 'Admin', '2022-04-22 11:12:50', NULL, NULL, 1),
(497, 317, 51, 15, 1, '200.00', '0.00', '0.00', NULL, '0.00', '300.00', 'd', 'Admin', '2022-04-22 11:12:50', NULL, NULL, 1),
(499, 318, 51, 15, 1, '200.00', '0.00', '0.00', NULL, '0.00', '300.00', 'd', 'Admin', '2022-04-22 11:17:13', NULL, NULL, 1),
(500, 319, 51, 10, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'd', 'Admin', '2022-04-22 11:18:44', NULL, NULL, 1),
(501, 319, 51, 15, 1, '200.00', '0.00', '0.00', NULL, '0.00', '300.00', 'd', 'Admin', '2022-04-22 11:18:44', NULL, NULL, 1),
(502, 320, 51, 10, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'd', 'Admin', '2022-04-22 11:19:10', NULL, NULL, 1),
(503, 320, 51, 15, 1, '200.00', '0.00', '0.00', NULL, '0.00', '300.00', 'd', 'Admin', '2022-04-22 11:19:10', NULL, NULL, 1),
(504, 321, 57, 9, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'd', 'Admin', '2022-04-22 11:29:08', NULL, NULL, 1),
(505, 321, 57, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'd', 'Admin', '2022-04-22 11:29:08', NULL, NULL, 1),
(506, 322, 57, 9, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'd', 'Admin', '2022-04-22 11:31:30', NULL, NULL, 1),
(507, 322, 57, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'd', 'Admin', '2022-04-22 11:31:30', NULL, NULL, 1),
(508, 323, 57, 9, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'd', 'Admin', '2022-04-22 11:32:35', NULL, NULL, 1),
(509, 323, 57, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'd', 'Admin', '2022-04-22 11:32:35', NULL, NULL, 1),
(510, 324, 6, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'd', 'Admin', '2022-04-22 11:35:14', NULL, NULL, 1),
(511, 325, 6, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'd', 'Admin', '2022-04-22 11:35:43', NULL, NULL, 1),
(512, 326, 0, 9, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'p', '12', '2022-04-22 11:44:43', NULL, NULL, 0),
(513, 327, 0, 15, 1, '200.00', '0.00', '0.00', NULL, '0.00', '300.00', 'p', '12', '2022-04-22 11:46:18', NULL, NULL, 0),
(514, 328, 0, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'p', '12', '2022-04-22 12:00:24', NULL, NULL, 0),
(515, 329, 65, 9, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'p', '12', '2022-04-22 12:04:17', NULL, NULL, 0),
(516, 330, 65, 9, 1, '200.00', '0.00', '0.00', NULL, '0.00', '200.00', 'p', '12', '2022-04-22 12:07:40', NULL, NULL, 0),
(517, 331, 65, 9, 1, '200.00', '0.00', '0.00', NULL, '0.00', '200.00', 'p', '12', '2022-04-22 12:08:14', NULL, NULL, 0),
(518, 332, 65, 9, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'p', '12', '2022-04-22 12:09:14', NULL, NULL, 0),
(519, 333, 63, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'p', '12', '2022-04-22 12:09:56', NULL, NULL, 0),
(520, 334, 63, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'p', '12', '2022-04-22 12:12:58', NULL, NULL, 0),
(521, 335, 63, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'p', '12', '2022-04-22 12:16:06', NULL, NULL, 0),
(522, 336, 63, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'p', '12', '2022-04-22 12:16:32', NULL, NULL, 0),
(523, 337, 66, 9, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'p', '12', '2022-04-22 12:17:31', NULL, NULL, 0),
(524, 338, 63, 10, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'p', '12', '2022-04-22 12:18:27', NULL, NULL, 0),
(525, 339, 65, 14, 1, '300.00', '0.00', '0.00', NULL, '0.00', '700.00', 'p', '12', '2022-04-22 12:58:04', NULL, NULL, 0),
(526, 339, 65, 15, 1, '200.00', '0.00', '0.00', NULL, '0.00', '700.00', 'p', '12', '2022-04-22 12:58:04', NULL, NULL, 0),
(527, 340, 3, 15, 1, '200.00', '0.00', '0.00', NULL, '0.00', '300.00', 'p', '12', '2022-04-22 12:59:42', NULL, NULL, 0),
(530, 343, 66, 400, 1, '300.00', '0.00', '0.00', NULL, '0.00', '400.00', 'd', 'Admin', '2022-04-22 16:09:16', NULL, NULL, 1),
(532, 344, 65, 9, 1, '200.00', '0.00', '0.00', NULL, '0.00', '350.00', 'p', '12', '2022-04-22 16:17:37', NULL, NULL, 0),
(533, 345, 7, 300, 1, '200.00', '0.00', '0.00', NULL, '0.00', '300.00', 'd', 'Admin', '2022-04-22 16:20:49', NULL, NULL, 1),
(534, 345, 7, 4900, 1, '4400.00', '0.00', '0.00', NULL, '0.00', '4900.00', 'd', 'Admin', '2022-04-22 16:20:49', NULL, NULL, 1),
(535, 346, 7, 300, 1, '200.00', '0.00', '0.00', NULL, '0.00', '300.00', 'd', 'Admin', '2022-04-22 16:28:33', NULL, NULL, 1),
(538, 347, 7, 19, 1, '4400.00', '4900.00', '0.00', NULL, '0.00', '4900.00', 'd', 'Admin', '2022-04-22 16:30:23', NULL, NULL, 1),
(539, 348, 7, 15, 1, '200.00', '300.00', '0.00', NULL, '0.00', '300.00', 'd', 'Admin', '2022-04-22 16:36:01', NULL, NULL, 1),
(540, 348, 7, 19, 1, '4400.00', '4900.00', '0.00', NULL, '0.00', '4900.00', 'd', 'Admin', '2022-04-22 16:36:01', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salereturn`
--

CREATE TABLE `tbl_salereturn` (
  `SaleReturn_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SaleReturn_ReturnDate` date NOT NULL,
  `SaleReturn_ReturnAmount` decimal(18,2) NOT NULL,
  `SaleReturn_Description` varchar(300) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleReturn_brunchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_salereturn`
--

INSERT INTO `tbl_salereturn` (`SaleReturn_SlNo`, `SaleMaster_InvoiceNo`, `SaleReturn_ReturnDate`, `SaleReturn_ReturnAmount`, `SaleReturn_Description`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleReturn_brunchId`) VALUES
(1, '220100002', '2022-02-02', '150.00', '', 'a', 'Admin', '2022-02-02 11:24:56', NULL, NULL, 1),
(2, '220100004', '2022-02-09', '7000.00', '', 'a', 'Admin', '2022-02-09 12:09:33', NULL, NULL, 1),
(3, '220100007', '2022-02-09', '8000.00', '', 'a', 'Admin', '2022-02-09 14:14:16', NULL, NULL, 1),
(4, '220100023', '2022-02-14', '1230.00', '', 'a', 'Admin', '2022-02-14 14:54:21', NULL, NULL, 1),
(5, '220200001', '2022-02-17', '4900.00', 'Damage ', 'a', 'global', '2022-02-17 14:31:30', NULL, NULL, 2),
(6, '220100035', '2022-02-22', '12.00', '', 'a', 'sakil', '2022-02-22 19:53:11', NULL, NULL, 1),
(7, '220100035', '2022-02-22', '12.00', '', 'a', 'sakil', '2022-02-22 22:47:37', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salereturndetails`
--

CREATE TABLE `tbl_salereturndetails` (
  `SaleReturnDetails_SlNo` int(11) NOT NULL,
  `SaleReturn_IdNo` int(11) NOT NULL,
  `SaleReturnDetailsProduct_SlNo` int(11) NOT NULL,
  `SaleReturnDetails_ReturnQuantity` float NOT NULL,
  `SaleReturnDetails_ReturnAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleReturnDetails_brunchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_salereturndetails`
--

INSERT INTO `tbl_salereturndetails` (`SaleReturnDetails_SlNo`, `SaleReturn_IdNo`, `SaleReturnDetailsProduct_SlNo`, `SaleReturnDetails_ReturnQuantity`, `SaleReturnDetails_ReturnAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleReturnDetails_brunchID`) VALUES
(3, 1, 3, 1, '150.00', 'a', 'Admin', '2022-02-02 11:24:56', NULL, NULL, 1),
(4, 2, 14, 20, '7000.00', 'a', 'Admin', '2022-02-09 12:09:33', NULL, NULL, 1),
(5, 3, 13, 20, '8000.00', 'a', 'Admin', '2022-02-09 14:14:16', NULL, NULL, 1),
(6, 4, 15, 2, '600.00', 'a', 'Admin', '2022-02-14 14:54:21', NULL, NULL, 1),
(7, 4, 14, 1, '400.00', 'a', 'Admin', '2022-02-14 14:54:21', NULL, NULL, 1),
(8, 4, 16, 1, '230.00', 'a', 'Admin', '2022-02-14 14:54:21', NULL, NULL, 1),
(9, 5, 17, 1, '4900.00', 'a', 'global', '2022-02-17 14:31:30', NULL, NULL, 2),
(10, 6, 21, 1, '12.00', 'a', 'sakil', '2022-02-22 19:53:11', NULL, NULL, 1),
(11, 7, 21, 1, '12.00', 'a', 'sakil', '2022-02-22 22:47:37', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salesmaster`
--

CREATE TABLE `tbl_salesmaster` (
  `SaleMaster_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SalseCustomer_IDNo` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `SaleMaster_SaleDate` date NOT NULL,
  `SaleMaster_Description` longtext DEFAULT NULL,
  `SaleMaster_SaleType` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT 'Cash',
  `SaleMaster_TotalSaleAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TotalDiscountAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TaxAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Freight` decimal(18,2) DEFAULT 0.00,
  `SaleMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `SaleMaster_PaidAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Advance` varchar(10) DEFAULT NULL,
  `SaleMaster_DueAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Previous_Due` double(18,2) DEFAULT NULL,
  `Transport_Cost` varchar(10) DEFAULT NULL,
  `Status` varchar(5) NOT NULL DEFAULT 'a',
  `is_service` varchar(10) NOT NULL DEFAULT 'false',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleMaster_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_salesmaster`
--

INSERT INTO `tbl_salesmaster` (`SaleMaster_SlNo`, `SaleMaster_InvoiceNo`, `SalseCustomer_IDNo`, `employee_id`, `SaleMaster_SaleDate`, `SaleMaster_Description`, `SaleMaster_SaleType`, `payment_type`, `SaleMaster_TotalSaleAmount`, `SaleMaster_TotalDiscountAmount`, `SaleMaster_TaxAmount`, `SaleMaster_Freight`, `SaleMaster_SubTotalAmount`, `SaleMaster_PaidAmount`, `SaleMaster_Advance`, `SaleMaster_DueAmount`, `SaleMaster_Previous_Due`, `Transport_Cost`, `Status`, `is_service`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleMaster_branchid`) VALUES
(310, '220100001', 63, NULL, '2022-04-21', '', NULL, 'cash', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '500.00', NULL, NULL, 'com', 'false', '1', '2022-04-21 18:52:11', NULL, NULL, 0),
(311, '22000311', 62, NULL, '2022-04-22', '', NULL, 'cash', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 10:25:54', NULL, NULL, 0),
(312, '22000312', 54, NULL, '2022-04-22', '', NULL, 'cash', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '215.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 10:51:24', NULL, NULL, 0),
(313, '2201200001', 0, NULL, '0000-00-00', 'test', NULL, 'advance', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '500', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 10:59:18', NULL, NULL, 0),
(314, '2201200314', 0, NULL, '0000-00-00', 'test', NULL, 'advance', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '500', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 11:02:43', NULL, NULL, 0),
(315, '22000315', 51, NULL, '2022-04-22', '', NULL, 'cash', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 11:04:45', NULL, NULL, 0),
(316, '22000316', 51, NULL, '2022-04-22', '', NULL, 'cash', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 11:06:01', NULL, NULL, 0),
(317, '22000317', 51, NULL, '2022-04-22', '', NULL, 'cash', '0.00', '0.00', '0.00', '0.00', '0.00', '450.00', NULL, '0.00', NULL, '50', 'com', 'false', '1', '2022-04-22 11:12:50', NULL, NULL, 0),
(318, '22000318', 51, NULL, '2022-04-22', '', NULL, 'cash', '0.00', '0.00', '0.00', '50.00', '0.00', '450.00', NULL, '0.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 11:17:13', NULL, NULL, 0),
(319, '22000319', 51, NULL, '2022-04-22', '', NULL, 'cash', '0.00', '0.00', '0.00', '50.00', '0.00', '450.00', NULL, '0.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 11:18:44', NULL, NULL, 0),
(320, '22000320', 51, NULL, '2022-04-22', '', NULL, 'cash', '0.00', '0.00', '0.00', '50.00', '400.00', '450.00', NULL, '0.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 11:19:10', NULL, NULL, 0),
(321, '22000321', 57, NULL, '2022-04-22', '', NULL, 'cash', '0.00', '0.00', '0.00', '50.00', '750.00', '800.00', NULL, '0.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 11:29:08', NULL, NULL, 0),
(322, '22000322', 57, NULL, '2022-04-22', '', NULL, 'cash', '0.00', '0.00', '0.00', '50.00', '750.00', '800.00', NULL, '0.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 11:31:30', NULL, NULL, 0),
(323, '22000323', 57, NULL, '2022-04-22', '', NULL, 'cash', '800.00', '0.00', '0.00', '50.00', '750.00', '800.00', NULL, '0.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 11:32:35', NULL, NULL, 0),
(324, '22000324', 6, NULL, '2022-04-22', '', NULL, 'cash', '450.00', '0.00', '0.00', '50.00', '400.00', '0.00', NULL, '450.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 11:35:14', NULL, NULL, 0),
(325, '22000325', 6, NULL, '2022-04-22', '', NULL, 'cash', '450.00', '0.00', '0.00', '50.00', '400.00', '450.00', NULL, '0.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 11:35:43', NULL, NULL, 0),
(326, '2201200326', 0, NULL, '0000-00-00', '', NULL, 'advance', '350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '350', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 11:44:43', NULL, NULL, 0),
(327, '2201200327', 0, NULL, '0000-00-00', '', NULL, 'advance', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', '300', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 11:46:18', NULL, NULL, 0),
(328, '2201200328', 0, NULL, '0000-00-00', '', NULL, 'advance', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '400', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 12:00:24', NULL, NULL, 0),
(329, '2201200329', 65, NULL, '0000-00-00', '', NULL, 'advance', '350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 12:04:17', NULL, NULL, 0),
(330, '2201200330', 65, NULL, '0000-00-00', '', NULL, 'advance', '350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 12:07:40', NULL, NULL, 0),
(331, '2201200331', 65, NULL, '0000-00-00', '', NULL, 'advance', '350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 12:08:14', NULL, NULL, 0),
(332, '2201200332', 65, NULL, '0000-00-00', '', NULL, 'advance', '350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 12:09:14', NULL, NULL, 0),
(333, '2201200333', 63, NULL, '0000-00-00', '', NULL, 'advance', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '400', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 12:09:56', NULL, NULL, 0),
(334, '2201200334', 63, NULL, '0000-00-00', '', NULL, 'advance', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '400', '0.00', NULL, NULL, 'com', 'false', '12', '2022-04-22 12:12:58', NULL, NULL, 0),
(335, '2201200335', 63, NULL, '0000-00-00', '', NULL, 'advance', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '400', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 12:16:06', NULL, NULL, 0),
(336, '2201200336', 63, NULL, '0000-00-00', '', NULL, 'advance', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '400', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 12:16:32', NULL, NULL, 0),
(337, '2201200337', 66, NULL, '0000-00-00', '', NULL, 'advance', '350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '350', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 12:17:31', NULL, NULL, 0),
(338, '2201200338', 63, NULL, '0000-00-00', '', NULL, 'advance', '350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 12:18:27', NULL, NULL, 0),
(339, '2201200339', 65, NULL, '0000-00-00', '', NULL, 'advance', '700.00', '0.00', '0.00', '0.00', '0.00', '0.00', '300', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 12:58:04', NULL, NULL, 0),
(340, '2201200340', 3, NULL, '0000-00-00', '', NULL, 'advance', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', NULL, NULL, 'p', 'false', '12', '2022-04-22 12:59:42', NULL, NULL, 0),
(348, '2201200341', 7, NULL, '2022-04-22', '', NULL, 'cash', '5200.00', '0.00', '0.00', '0.00', '5200.00', '5000.00', NULL, '200.00', NULL, NULL, 'com', 'false', '1', '2022-04-22 16:36:01', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms`
--

CREATE TABLE `tbl_sms` (
  `row_id` int(11) NOT NULL,
  `number` varchar(30) NOT NULL,
  `sms_text` varchar(500) NOT NULL,
  `sent_by` int(11) NOT NULL,
  `sent_datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms_settings`
--

CREATE TABLE `tbl_sms_settings` (
  `sms_enabled` varchar(10) NOT NULL DEFAULT 'false',
  `api_key` varchar(500) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `bulk_url` varchar(1000) NOT NULL,
  `sms_type` varchar(50) NOT NULL,
  `sender_id` varchar(200) NOT NULL,
  `sender_name` varchar(200) NOT NULL,
  `sender_phone` varchar(50) NOT NULL,
  `saved_by` int(11) DEFAULT NULL,
  `saved_datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sms_settings`
--

INSERT INTO `tbl_sms_settings` (`sms_enabled`, `api_key`, `url`, `bulk_url`, `sms_type`, `sender_id`, `sender_name`, `sender_phone`, `saved_by`, `saved_datetime`) VALUES
('false', 'C20036315d8f41beb57b36.68545984', 'http://esms.linktechbd.com/smsapi', 'http://esms.linktechbd.com/smsapimany', 'text', 'Link-UpTech', 'Link-Up Technology', '01911-978897', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `Supplier_SlNo` int(11) NOT NULL,
  `Supplier_Code` varchar(50) NOT NULL,
  `Supplier_Name` varchar(150) NOT NULL,
  `Supplier_Type` varchar(50) NOT NULL,
  `Supplier_Phone` varchar(50) NOT NULL,
  `Supplier_Mobile` varchar(15) NOT NULL,
  `Supplier_Email` varchar(50) NOT NULL,
  `Supplier_OfficePhone` varchar(50) NOT NULL,
  `Supplier_Address` varchar(300) NOT NULL,
  `contact_person` varchar(250) DEFAULT NULL,
  `District_SlNo` int(11) NOT NULL,
  `Country_SlNo` int(11) NOT NULL,
  `Supplier_Web` varchar(150) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Supplier_brinchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`Supplier_SlNo`, `Supplier_Code`, `Supplier_Name`, `Supplier_Type`, `Supplier_Phone`, `Supplier_Mobile`, `Supplier_Email`, `Supplier_OfficePhone`, `Supplier_Address`, `contact_person`, `District_SlNo`, `Country_SlNo`, `Supplier_Web`, `previous_due`, `image_name`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Supplier_brinchid`) VALUES
(1, 'S00001', 'Mojnu Trading', '', '', '01699115588', '', '', 'Dhaka', 'Mojnu Vai', 0, 0, '', '20000.00', NULL, 'd', 'Admin', '2022-01-29 13:44:47', NULL, NULL, 1),
(2, 'S00002', 'BH Ltd. ', '', '', '+86', '', '', 'China ', 'Mr. Liu Wie ', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2022-02-09 11:00:15', NULL, NULL, 1),
(3, 'S00003', 'Carnival Furniture', '', '', '01727009008', '', '', 'Banasree, Rampura, Dhaka', 'Millon Vai', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2022-02-16 21:56:10', NULL, NULL, 1),
(4, 'S00004', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', NULL, 'a', 'Admin', '2022-02-17 12:40:22', NULL, NULL, 1),
(5, 'S00005', 'Global trade', '', '', '0199', '', '', 'Mirpur', 'Hasan', 0, 0, '', '0.00', NULL, 'a', 'global', '2022-02-17 12:41:54', 'global', '2022-02-17 13:38:28', 2),
(6, 'S00006', 'FZ', '', '', '012', '', '', 'DHAKA', 'MILON', 0, 0, '', '10000.00', NULL, 'a', 'global', '2022-02-17 13:16:23', 'global', '2022-02-17 13:16:48', 2),
(7, 'S00007', 'imran traders', '', '', '01715605958', '', '', 'bolaka club', 'mohiuddin', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2022-02-21 10:38:59', 'Admin', '2022-02-21 10:39:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier_payment`
--

CREATE TABLE `tbl_supplier_payment` (
  `SPayment_id` int(11) NOT NULL,
  `SPayment_date` date DEFAULT NULL,
  `SPayment_invoice` varchar(20) DEFAULT NULL,
  `SPayment_customerID` varchar(20) DEFAULT NULL,
  `SPayment_TransactionType` varchar(25) DEFAULT NULL,
  `SPayment_amount` decimal(18,2) DEFAULT NULL,
  `SPayment_Paymentby` varchar(20) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `SPayment_notes` varchar(225) DEFAULT NULL,
  `SPayment_brunchid` int(11) DEFAULT NULL,
  `SPayment_status` varchar(2) DEFAULT NULL,
  `SPayment_Addby` varchar(100) DEFAULT NULL,
  `SPayment_AddDAte` date DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `SPayment_UpdateDAte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_supplier_payment`
--

INSERT INTO `tbl_supplier_payment` (`SPayment_id`, `SPayment_date`, `SPayment_invoice`, `SPayment_customerID`, `SPayment_TransactionType`, `SPayment_amount`, `SPayment_Paymentby`, `account_id`, `SPayment_notes`, `SPayment_brunchid`, `SPayment_status`, `SPayment_Addby`, `SPayment_AddDAte`, `update_by`, `SPayment_UpdateDAte`) VALUES
(1, '2022-02-11', 'TR00001', '2', 'CP', '10000.00', 'bank', 1, 'Advance payment by MR razon', 1, 'a', 'Admin', '2022-02-11', NULL, NULL),
(2, '2022-02-14', 'TR00002', '2', 'CP', '10000.00', 'cash', NULL, '', 1, 'a', 'Admin', '2022-02-14', NULL, NULL),
(3, '2022-02-17', 'TR00003', '6', 'CP', '16100.00', 'cash', NULL, '', 2, 'a', 'global', '2022-02-17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transferdetails`
--

CREATE TABLE `tbl_transferdetails` (
  `transferdetails_id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `purchase_rate` decimal(18,2) NOT NULL DEFAULT 0.00,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transferdetails`
--

INSERT INTO `tbl_transferdetails` (`transferdetails_id`, `transfer_id`, `product_id`, `quantity`, `purchase_rate`, `total`) VALUES
(1, 1, 21, 14, '10.00', '140.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transfermaster`
--

CREATE TABLE `tbl_transfermaster` (
  `transfer_id` int(11) NOT NULL,
  `transfer_date` date NOT NULL,
  `transfer_by` int(11) NOT NULL,
  `transfer_from` int(11) NOT NULL,
  `transfer_to` int(11) NOT NULL,
  `total_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `note` varchar(500) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transfermaster`
--

INSERT INTO `tbl_transfermaster` (`transfer_id`, `transfer_date`, `transfer_by`, `transfer_from`, `transfer_to`, `total_amount`, `note`, `added_by`, `added_datetime`, `updated_by`, `updated_datetime`) VALUES
(1, '2022-02-22', 4, 1, 3, '140.00', '', 0, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unit`
--

CREATE TABLE `tbl_unit` (
  `Unit_SlNo` int(11) NOT NULL,
  `Unit_Name` varchar(150) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_unit`
--

INSERT INTO `tbl_unit` (`Unit_SlNo`, `Unit_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'PCS', 'd', NULL, NULL, NULL, NULL),
(2, 'Sqf.', 'a', 'Admin', '2022-01-29 13:40:36', NULL, NULL),
(3, 'Bag', 'd', 'Admin', '2022-01-29 13:40:43', NULL, NULL),
(4, 'Kg', 'a', 'Admin', '2022-01-29 13:40:51', NULL, NULL),
(5, 'Meter', 'a', 'Admin', '2022-02-09 11:05:57', NULL, NULL),
(6, 'pc', 'a', 'Admin', '2022-02-12 14:04:42', NULL, NULL),
(7, 'c', 'a', 'Admin', '2022-02-16 12:03:04', NULL, NULL),
(8, 'Set', 'a', 'global', '2022-02-17 12:38:27', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `User_SlNo` int(11) NOT NULL,
  `User_ID` varchar(50) NOT NULL,
  `FullName` varchar(150) NOT NULL,
  `User_Name` varchar(150) NOT NULL,
  `UserEmail` varchar(200) NOT NULL,
  `userBrunch_id` int(11) NOT NULL,
  `User_Password` varchar(50) NOT NULL,
  `UserType` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `verifycode` int(11) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Brunch_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`User_SlNo`, `User_ID`, `FullName`, `User_Name`, `UserEmail`, `userBrunch_id`, `User_Password`, `UserType`, `status`, `verifycode`, `image_name`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Brunch_ID`) VALUES
(1, 'U0001', 'Admin', 'admin', 'admin@host.com', 1, 'c4ca4238a0b923820dcc509a6f75849b', 'm', 'a', 1, '1.jpg', NULL, NULL, NULL, NULL, 1),
(2, '', 'sakil', 'admin1', 'sakil@gmail.com', 1, 'c4ca4238a0b923820dcc509a6f75849b', 'u', 'a', 0, NULL, NULL, '2022-02-06 15:00:18', NULL, NULL, 1),
(3, '', 'tasinur', 'tasinur', 'tasin@gmail.com', 1, '202cb962ac59075b964b07152d234b70', 'u', 'a', 0, NULL, NULL, '2022-02-13 13:27:23', NULL, NULL, 1),
(4, '', 'global', 'global', 'global@gmail.com', 2, '9c70933aff6b2a6d08c687a6cbb6b765', 'a', 'a', 0, '4.jpeg', NULL, '2022-02-17 12:02:52', NULL, NULL, 2),
(5, '', 'tanu', 'tanu', 'tanu@gmai.com', 3, 'c81e728d9d4c2f636f067f89cc14862c', 'u', 'a', 0, NULL, NULL, '2022-02-22 10:41:18', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_access`
--

CREATE TABLE `tbl_user_access` (
  `access_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access` text NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user_access`
--

INSERT INTO `tbl_user_access` (`access_id`, `user_id`, `access`, `saved_by`, `saved_datetime`) VALUES
(1, 2, '[\"sales\\/product\",\"cashTransaction\",\"customerlist\",\"sales\\/service\",\"salesReturn\",\"salesrecord\",\"currentStock\",\"quotation\",\"bank_transactions\",\"customerPaymentPage\",\"supplierPayment\",\"cash_view\",\"account\",\"bank_accounts\",\"check\\/entry\",\"check\\/list\",\"check\\/reminder\\/list\",\"check\\/pending\\/list\",\"check\\/dis\\/list\",\"check\\/paid\\/list\",\"salesinvoice\",\"returnList\",\"sale_return_details\",\"customerDue\",\"customerPaymentReport\",\"customer_payment_history\",\"price_list\",\"quotation_invoice_report\",\"quotation_record\",\"TransactionReport\",\"bank_transaction_report\",\"cash_ledger\",\"bank_ledger\",\"cashStatment\",\"balance_sheet\",\"BalanceSheet\",\"profitLoss\",\"day_book\",\"purchase\",\"purchaseReturns\",\"purchaseRecord\",\"AssetsEntry\",\"salary_payment\",\"employee\",\"emplists\\/all\",\"emplists\\/active\",\"emplists\\/deactive\",\"designation\",\"depertment\",\"month\",\"salary_payment_report\",\"loan_transactions\",\"loan_view\",\"loan_transaction_report\",\"loan_ledger\",\"loan_accounts\",\"investment_transactions\",\"investment_view\",\"investment_transaction_report\",\"investment_ledger\",\"investment_accounts\",\"assets_report\",\"purchaseInvoice\",\"supplierDue\",\"supplierPaymentReport\",\"supplierList\",\"returnsList\",\"purchase_return_details\",\"reorder_list\",\"product\",\"productlist\",\"product_ledger\",\"damageEntry\",\"damageList\",\"product_transfer\",\"transfer_list\",\"received_list\",\"customer\",\"supplier\",\"category\",\"graph\",\"user\",\"order_hold\"]', 1, '2022-04-19 11:14:44'),
(2, 3, '[\"sales\\/product\",\"purchase\"]', 1, '2022-02-13 18:28:20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_activity`
--

CREATE TABLE `tbl_user_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  `status` char(2) NOT NULL DEFAULT 'a',
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user_activity`
--

INSERT INTO `tbl_user_activity` (`id`, `user_id`, `ip_address`, `login_time`, `logout_time`, `status`, `branch_id`) VALUES
(1, 1, '43.246.202.10', '2022-01-26 13:42:56', NULL, 'a', 1),
(2, 1, '43.246.202.10', '2022-01-27 10:41:06', NULL, 'a', 1),
(3, 1, '103.130.72.116', '2022-01-27 14:53:46', '2022-01-27 15:12:28', 'a', 1),
(4, 1, '149.202.98.190', '2022-01-29 10:06:27', NULL, 'a', 1),
(5, 1, '176.203.235.0', '2022-01-29 13:20:23', NULL, 'a', 1),
(6, 1, '43.246.202.10', '2022-01-29 13:22:15', NULL, 'a', 1),
(7, 1, '43.246.202.10', '2022-01-31 18:40:09', NULL, 'a', 1),
(8, 1, '149.202.98.191', '2022-02-01 15:01:10', NULL, 'a', 1),
(9, 1, '43.246.202.10', '2022-02-01 16:54:52', NULL, 'a', 1),
(10, 1, '43.246.202.10', '2022-02-02 11:23:33', NULL, 'a', 1),
(11, 1, '118.179.190.129', '2022-02-02 20:01:11', NULL, 'a', 1),
(12, 1, '103.88.140.104', '2022-02-02 21:39:03', NULL, 'a', 1),
(13, 1, '43.246.202.10', '2022-02-03 11:20:21', NULL, 'a', 1),
(14, 1, '103.166.88.4', '2022-02-03 14:50:23', NULL, 'a', 1),
(15, 1, '43.246.202.10', '2022-02-03 16:49:38', NULL, 'a', 1),
(16, 1, '43.246.202.10', '2022-02-05 14:30:27', NULL, 'a', 1),
(17, 1, '103.203.179.1', '2022-02-06 14:43:49', '2022-02-06 15:01:15', 'a', 1),
(18, 2, '103.203.179.1', '2022-02-06 15:01:32', NULL, 'a', 1),
(19, 1, '103.154.158.46', '2022-02-06 15:58:31', NULL, 'a', 1),
(20, 1, '43.246.202.10', '2022-02-06 16:43:24', '2022-02-06 18:32:46', 'a', 1),
(21, 1, '27.147.255.234', '2022-02-09 00:31:51', NULL, 'a', 1),
(22, 1, '27.147.255.234', '2022-02-09 04:16:54', NULL, 'a', 1),
(23, 1, '103.67.157.195', '2022-02-09 10:44:18', NULL, 'a', 1),
(24, 1, '163.47.158.206', '2022-02-09 10:48:50', NULL, 'a', 1),
(25, 1, '116.58.201.7', '2022-02-09 16:46:42', NULL, 'a', 1),
(26, 1, '43.246.202.10', '2022-02-09 20:28:37', '2022-02-09 20:39:16', 'a', 1),
(27, 1, '103.162.59.236', '2022-02-09 20:29:21', '2022-02-09 20:38:33', 'a', 1),
(28, 1, '163.47.158.206', '2022-02-10 10:19:45', NULL, 'a', 1),
(29, 1, '59.152.111.254', '2022-02-10 15:30:38', NULL, 'a', 1),
(30, 1, '163.47.158.206', '2022-02-10 15:42:52', NULL, 'a', 1),
(31, 1, '163.47.158.206', '2022-02-11 16:03:45', NULL, 'a', 1),
(32, 1, '37.111.212.128', '2022-02-12 13:40:05', NULL, 'a', 1),
(33, 1, '103.144.201.102', '2022-02-12 13:52:48', NULL, 'a', 1),
(34, 1, '103.112.236.78', '2022-02-13 10:28:08', NULL, 'a', 1),
(35, 1, '103.112.236.78', '2022-02-13 10:35:55', NULL, 'a', 1),
(36, 1, '103.67.157.221', '2022-02-13 11:46:23', NULL, 'a', 1),
(37, 1, '27.131.13.8', '2022-02-13 13:13:59', '2022-02-13 13:28:27', 'a', 1),
(38, 3, '27.131.13.8', '2022-02-13 13:28:39', '2022-02-13 13:30:20', 'a', 1),
(39, 1, '27.131.13.8', '2022-02-13 13:30:26', NULL, 'a', 1),
(40, 1, '43.245.120.120', '2022-02-13 13:43:45', NULL, 'a', 1),
(41, 1, '103.81.199.35', '2022-02-13 13:48:49', '2022-02-13 13:49:06', 'a', 1),
(42, 1, '43.245.120.120', '2022-02-13 14:09:49', NULL, 'a', 1),
(43, 1, '163.47.158.206', '2022-02-13 15:40:21', NULL, 'a', 1),
(44, 1, '163.47.158.206', '2022-02-14 10:05:55', NULL, 'a', 1),
(45, 1, '103.154.158.46', '2022-02-14 11:04:37', NULL, 'a', 1),
(46, 1, '103.107.132.167', '2022-02-14 14:52:05', NULL, 'a', 1),
(47, 1, '43.245.123.137', '2022-02-14 15:29:17', NULL, 'a', 1),
(48, 1, '43.246.202.10', '2022-02-15 16:57:46', NULL, 'a', 1),
(49, 1, '103.144.201.102', '2022-02-15 20:20:00', NULL, 'a', 1),
(50, 1, '103.144.201.102', '2022-02-15 20:28:40', NULL, 'a', 1),
(51, 1, '43.246.202.10', '2022-02-16 11:09:05', '2022-02-16 11:46:17', 'a', 1),
(52, 1, '43.245.140.186', '2022-02-16 11:48:27', NULL, 'a', 1),
(53, 1, '192.95.12.100', '2022-02-16 17:52:58', NULL, 'a', 1),
(54, 1, '103.144.201.102', '2022-02-16 20:14:17', NULL, 'a', 1),
(55, 1, '103.144.201.102', '2022-02-16 20:32:18', '2022-02-16 21:06:08', 'a', 1),
(56, 1, '103.144.201.102', '2022-02-16 21:14:31', NULL, 'a', 1),
(57, 1, '103.144.201.102', '2022-02-16 21:19:32', NULL, 'a', 1),
(58, 1, '163.47.158.206', '2022-02-17 11:14:48', NULL, 'a', 1),
(59, 1, '103.154.158.46', '2022-02-17 11:59:54', NULL, 'a', 1),
(60, 4, '43.246.202.10', '2022-02-17 12:04:55', NULL, 'a', 2),
(61, 4, '116.58.203.32', '2022-02-17 12:30:45', '2022-02-17 12:32:14', 'a', 2),
(62, 1, '116.58.203.32', '2022-02-17 12:32:19', '2022-02-17 12:36:29', 'a', 1),
(63, 4, '116.58.203.32', '2022-02-17 12:36:48', NULL, 'a', 2),
(64, 1, '182.48.66.237', '2022-02-17 12:38:29', NULL, 'a', 1),
(65, 4, '103.144.201.102', '2022-02-17 13:04:08', NULL, 'a', 2),
(66, 1, '103.109.214.182', '2022-02-17 15:07:22', '2022-02-17 15:17:18', 'a', 1),
(67, 1, '59.152.12.90', '2022-02-19 11:48:40', NULL, 'a', 1),
(68, 1, '37.111.212.242', '2022-02-19 12:18:53', NULL, 'a', 1),
(69, 1, '163.47.158.206', '2022-02-19 14:36:46', NULL, 'a', 1),
(70, 1, '43.246.202.10', '2022-02-19 16:00:12', '2022-02-19 16:58:04', 'a', 1),
(71, 1, '103.136.202.122', '2022-02-19 17:05:30', NULL, 'a', 1),
(72, 1, '43.245.140.186', '2022-02-20 00:33:47', NULL, 'a', 1),
(73, 1, '103.199.85.70', '2022-02-20 10:39:32', NULL, 'a', 1),
(74, 1, '103.199.85.70', '2022-02-20 13:00:44', NULL, 'a', 1),
(75, 1, '167.114.118.4', '2022-02-20 14:43:29', NULL, 'a', 1),
(76, 1, '37.187.147.158', '2022-02-20 14:52:55', NULL, 'a', 1),
(77, 1, '103.134.226.66', '2022-02-20 14:55:40', NULL, 'a', 1),
(78, 1, '163.47.158.206', '2022-02-20 16:26:23', NULL, 'a', 1),
(79, 1, '43.245.140.186', '2022-02-21 10:36:42', NULL, 'a', 1),
(80, 1, '43.245.140.186', '2022-02-21 18:49:51', NULL, 'a', 1),
(81, 1, '103.154.158.46', '2022-02-22 09:57:23', NULL, 'a', 1),
(82, 1, '43.245.140.186', '2022-02-22 10:08:31', '2022-02-22 10:43:47', 'a', 1),
(83, 5, '43.245.140.186', '2022-02-22 10:44:08', '2022-02-22 10:45:15', 'a', 3),
(84, 5, '43.245.140.186', '2022-02-22 10:47:18', '2022-02-22 10:47:45', 'a', 3),
(85, 5, '37.111.221.229', '2022-02-22 10:50:20', NULL, 'a', 3),
(86, 5, '37.111.221.229', '2022-02-22 10:50:50', NULL, 'a', 3),
(87, 5, '37.111.221.229', '2022-02-22 10:51:40', NULL, 'a', 3),
(88, 1, '103.154.158.46', '2022-02-22 15:41:23', '2022-02-22 15:45:17', 'a', 1),
(89, 2, '103.154.158.46', '2022-02-22 15:45:31', NULL, 'a', 1),
(90, 2, '43.246.202.10', '2022-02-22 15:51:02', NULL, 'a', 1),
(91, 2, '103.104.243.1', '2022-02-22 19:22:18', NULL, 'a', 1),
(92, 2, '37.111.233.171', '2022-02-22 22:36:04', '2022-02-22 22:37:30', 'a', 1),
(93, 2, '37.111.233.171', '2022-02-22 22:37:39', '2022-02-22 22:37:50', 'a', 1),
(94, 2, '37.111.233.171', '2022-02-22 22:37:59', '2022-02-22 22:38:10', 'a', 1),
(95, 2, '37.111.233.171', '2022-02-22 22:38:19', '2022-02-22 23:59:05', 'a', 1),
(96, 2, '37.111.233.171', '2022-02-22 23:59:35', NULL, 'a', 1),
(97, 2, '37.111.233.171', '2022-02-23 00:08:46', NULL, 'a', 1),
(98, 2, '37.111.233.171', '2022-02-23 01:07:45', NULL, 'a', 1),
(99, 2, '127.0.0.1', '2022-04-09 13:00:07', NULL, 'a', 1),
(100, 1, '::1', '2022-04-11 14:10:25', '2022-04-11 14:21:48', 'a', 1),
(101, 1, '::1', '2022-04-11 14:21:51', '2022-04-11 14:41:42', 'a', 1),
(102, 1, '::1', '2022-04-11 14:48:43', '2022-04-11 14:49:53', 'a', 1),
(103, 1, '::1', '2022-04-11 14:55:40', '2022-04-11 14:55:42', 'a', 1),
(104, 1, '::1', '2022-04-11 14:57:25', NULL, 'a', 1),
(105, 1, '::1', '2022-04-12 10:11:45', '2022-04-12 10:15:55', 'a', 1),
(106, 1, '::1', '2022-04-12 11:47:44', '2022-04-12 11:52:03', 'a', 1),
(107, 1, '::1', '2022-04-12 11:59:22', '2022-04-12 11:59:32', 'a', 1),
(108, 1, '::1', '2022-04-12 12:01:45', '2022-04-12 12:03:11', 'a', 1),
(109, 1, '::1', '2022-04-12 12:06:33', '2022-04-12 12:09:07', 'a', 1),
(110, 1, '::1', '2022-04-12 12:54:17', NULL, 'a', 1),
(111, 1, '::1', '2022-04-13 10:08:33', '2022-04-13 10:11:48', 'a', 1),
(112, 1, '::1', '2022-04-17 17:55:49', NULL, 'a', 1),
(113, 1, '::1', '2022-04-18 10:15:53', '2022-04-18 10:37:47', 'a', 1),
(114, 1, '::1', '2022-04-18 10:38:29', NULL, 'a', 1),
(115, 1, '::1', '2022-04-18 12:28:54', NULL, 'a', 1),
(116, 1, '::1', '2022-04-19 14:54:30', '2022-04-19 16:20:33', 'a', 1),
(117, 1, '::1', '2022-04-19 16:21:01', NULL, 'a', 1),
(118, 1, '::1', '2022-04-20 10:18:06', '2022-04-20 15:54:06', 'a', 1),
(119, 1, '::1', '2022-04-20 15:57:37', NULL, 'a', 1),
(120, 1, '::1', '2022-04-20 17:10:27', '2022-04-20 17:13:38', 'a', 1),
(121, 1, '::1', '2022-04-20 17:14:24', NULL, 'a', 1),
(122, 1, '::1', '2022-04-21 10:11:22', '2022-04-21 11:11:27', 'a', 1),
(123, 1, '::1', '2022-04-21 11:12:16', '2022-04-21 13:06:36', 'a', 1),
(124, 1, '::1', '2022-04-21 13:06:53', NULL, 'a', 1),
(125, 1, '::1', '2022-04-22 10:18:57', '2022-04-22 10:55:46', 'a', 1),
(126, 1, '::1', '2022-04-22 10:59:33', NULL, 'a', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`Acc_SlNo`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_assets`
--
ALTER TABLE `tbl_assets`
  ADD PRIMARY KEY (`as_id`),
  ADD KEY `as_date` (`as_date`),
  ADD KEY `status` (`status`),
  ADD KEY `branchid` (`branchid`);

--
-- Indexes for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_bank_transactions`
--
ALTER TABLE `tbl_bank_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `transaction_date` (`transaction_date`),
  ADD KEY `transaction_type` (`transaction_type`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_SiNo`),
  ADD KEY `ProductCategory_SlNo` (`ProductCategory_SlNo`),
  ADD KEY `status` (`status`),
  ADD KEY `brand_branchid` (`brand_branchid`);

--
-- Indexes for table `tbl_brunch`
--
ALTER TABLE `tbl_brunch`
  ADD PRIMARY KEY (`brunch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_cashtransaction`
--
ALTER TABLE `tbl_cashtransaction`
  ADD PRIMARY KEY (`Tr_SlNo`),
  ADD KEY `Tr_SlNo` (`Tr_SlNo`),
  ADD KEY `Tr_Id` (`Tr_Id`),
  ADD KEY `Tr_date` (`Tr_date`),
  ADD KEY `Tr_Type` (`Tr_Type`),
  ADD KEY `Acc_SlID` (`Acc_SlID`),
  ADD KEY `status` (`status`),
  ADD KEY `Tr_branchid` (`Tr_branchid`);

--
-- Indexes for table `tbl_checks`
--
ALTER TABLE `tbl_checks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `SM_id` (`SM_id`),
  ADD KEY `date` (`date`),
  ADD KEY `remid_date` (`remid_date`),
  ADD KEY `check_status` (`check_status`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_color`
--
ALTER TABLE `tbl_color`
  ADD PRIMARY KEY (`color_SiNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`Company_SlNo`),
  ADD KEY `Invoice_Type` (`Invoice_Type`),
  ADD KEY `print_type` (`print_type`),
  ADD KEY `company_BrunchId` (`company_BrunchId`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`Country_SlNo`),
  ADD KEY `Status` (`Status`);

--
-- Indexes for table `tbl_currentinventory`
--
ALTER TABLE `tbl_currentinventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `transfer_from_quantity` (`transfer_from_quantity`),
  ADD KEY `transfer_to_quantity` (`transfer_to_quantity`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`Customer_SlNo`),
  ADD KEY `Customer_Code` (`Customer_Code`),
  ADD KEY `Customer_Mobile` (`Customer_Mobile`),
  ADD KEY `Customer_Type` (`Customer_Type`),
  ADD KEY `Country_SlNo` (`Country_SlNo`),
  ADD KEY `area_ID` (`area_ID`),
  ADD KEY `status` (`status`),
  ADD KEY `Customer_brunchid` (`Customer_brunchid`);

--
-- Indexes for table `tbl_customer_payment`
--
ALTER TABLE `tbl_customer_payment`
  ADD PRIMARY KEY (`CPayment_id`),
  ADD KEY `CPayment_date` (`CPayment_date`),
  ADD KEY `CPayment_invoice` (`CPayment_invoice`),
  ADD KEY `CPayment_customerID` (`CPayment_customerID`),
  ADD KEY `CPayment_TransactionType` (`CPayment_TransactionType`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `CPayment_brunchid` (`CPayment_brunchid`),
  ADD KEY `CPayment_status` (`CPayment_status`);

--
-- Indexes for table `tbl_damage`
--
ALTER TABLE `tbl_damage`
  ADD PRIMARY KEY (`Damage_SlNo`),
  ADD KEY `Damage_InvoiceNo` (`Damage_InvoiceNo`),
  ADD KEY `Damage_Date` (`Damage_Date`),
  ADD KEY `status` (`status`),
  ADD KEY `Damage_brunchid` (`Damage_brunchid`);

--
-- Indexes for table `tbl_damagedetails`
--
ALTER TABLE `tbl_damagedetails`
  ADD PRIMARY KEY (`DamageDetails_SlNo`),
  ADD KEY `Damage_SlNo` (`Damage_SlNo`),
  ADD KEY `Product_SlNo` (`Product_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`Department_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  ADD PRIMARY KEY (`Designation_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`District_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`Employee_SlNo`),
  ADD KEY `Designation_ID` (`Designation_ID`),
  ADD KEY `Department_ID` (`Department_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`),
  ADD KEY `status` (`status`),
  ADD KEY `Employee_brinchid` (`Employee_brinchid`);

--
-- Indexes for table `tbl_employee_payment`
--
ALTER TABLE `tbl_employee_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_date` (`payment_date`),
  ADD KEY `month_id` (`month_id`),
  ADD KEY `status` (`status`),
  ADD KEY `paymentBranch_id` (`branch_id`),
  ADD KEY `saved_by` (`saved_by`);

--
-- Indexes for table `tbl_employee_payment_details`
--
ALTER TABLE `tbl_employee_payment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`) USING BTREE,
  ADD KEY `payment_id` (`payment_id`) USING BTREE,
  ADD KEY `employee_id` (`employee_id`) USING BTREE,
  ADD KEY `saved_by` (`saved_by`) USING BTREE;

--
-- Indexes for table `tbl_expense_head`
--
ALTER TABLE `tbl_expense_head`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_investment_account`
--
ALTER TABLE `tbl_investment_account`
  ADD PRIMARY KEY (`Acc_SlNo`),
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`) USING BTREE,
  ADD KEY `Acc_Code` (`Acc_Code`) USING BTREE;

--
-- Indexes for table `tbl_investment_transactions`
--
ALTER TABLE `tbl_investment_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `transaction_date` (`transaction_date`),
  ADD KEY `transaction_type` (`transaction_type`),
  ADD KEY `status` (`status`),
  ADD KEY `saved_by` (`saved_by`) USING BTREE,
  ADD KEY `account_id` (`account_id`) USING BTREE;

--
-- Indexes for table `tbl_loan_accounts`
--
ALTER TABLE `tbl_loan_accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `save_date` (`save_date`),
  ADD KEY `branch_id` (`branch_id`) USING BTREE,
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_loan_transactions`
--
ALTER TABLE `tbl_loan_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `transaction_date` (`transaction_date`),
  ADD KEY `transaction_type` (`transaction_type`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`),
  ADD KEY `saved_by` (`saved_by`) USING BTREE;

--
-- Indexes for table `tbl_marchant_wholesaler`
--
ALTER TABLE `tbl_marchant_wholesaler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_month`
--
ALTER TABLE `tbl_month`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`Product_SlNo`),
  ADD UNIQUE KEY `Product_Code` (`Product_Code`),
  ADD KEY `ProductCategory_ID` (`ProductCategory_ID`),
  ADD KEY `is_service` (`is_service`),
  ADD KEY `Unit_ID` (`Unit_ID`),
  ADD KEY `status` (`status`),
  ADD KEY `Product_branchid` (`Product_branchid`);

--
-- Indexes for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  ADD PRIMARY KEY (`ProductCategory_SlNo`),
  ADD KEY `status` (`status`),
  ADD KEY `category_branchid` (`category_branchid`);

--
-- Indexes for table `tbl_product_images`
--
ALTER TABLE `tbl_product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_purchasedetails`
--
ALTER TABLE `tbl_purchasedetails`
  ADD PRIMARY KEY (`PurchaseDetails_SlNo`),
  ADD KEY `PurchaseMaster_IDNo` (`PurchaseMaster_IDNo`),
  ADD KEY `Product_IDNo` (`Product_IDNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `PurchaseDetails_branchID` (`PurchaseDetails_branchID`);

--
-- Indexes for table `tbl_purchasemaster`
--
ALTER TABLE `tbl_purchasemaster`
  ADD PRIMARY KEY (`PurchaseMaster_SlNo`),
  ADD KEY `Supplier_SlNo` (`Supplier_SlNo`),
  ADD KEY `Employee_SlNo` (`Employee_SlNo`),
  ADD KEY `PurchaseMaster_InvoiceNo` (`PurchaseMaster_InvoiceNo`),
  ADD KEY `PurchaseMaster_OrderDate` (`PurchaseMaster_OrderDate`),
  ADD KEY `status` (`status`),
  ADD KEY `PurchaseMaster_BranchID` (`PurchaseMaster_BranchID`);

--
-- Indexes for table `tbl_purchasereturn`
--
ALTER TABLE `tbl_purchasereturn`
  ADD PRIMARY KEY (`PurchaseReturn_SlNo`),
  ADD KEY `PurchaseMaster_InvoiceNo` (`PurchaseMaster_InvoiceNo`),
  ADD KEY `Supplier_IDdNo` (`Supplier_IDdNo`),
  ADD KEY `PurchaseReturn_ReturnDate` (`PurchaseReturn_ReturnDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `PurchaseReturn_brunchID` (`PurchaseReturn_brunchID`);

--
-- Indexes for table `tbl_purchasereturndetails`
--
ALTER TABLE `tbl_purchasereturndetails`
  ADD PRIMARY KEY (`PurchaseReturnDetails_SlNo`),
  ADD KEY `PurchaseReturn_SlNo` (`PurchaseReturn_SlNo`),
  ADD KEY `PurchaseReturnDetailsProduct_SlNo` (`PurchaseReturnDetailsProduct_SlNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `PurchaseReturnDetails_brachid` (`PurchaseReturnDetails_brachid`);

--
-- Indexes for table `tbl_quotaion_customer`
--
ALTER TABLE `tbl_quotaion_customer`
  ADD PRIMARY KEY (`quotation_customer_id`),
  ADD KEY `quation_customer_branchid` (`quation_customer_branchid`);

--
-- Indexes for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  ADD PRIMARY KEY (`SaleDetails_SlNo`),
  ADD KEY `SaleMaster_IDNo` (`SaleMaster_IDNo`),
  ADD KEY `Product_IDNo` (`Product_IDNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleDetails_BranchId` (`SaleDetails_BranchId`);

--
-- Indexes for table `tbl_quotation_master`
--
ALTER TABLE `tbl_quotation_master`
  ADD PRIMARY KEY (`SaleMaster_SlNo`),
  ADD KEY `SaleMaster_InvoiceNo` (`SaleMaster_InvoiceNo`),
  ADD KEY `SaleMaster_SaleDate` (`SaleMaster_SaleDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleMaster_branchid` (`SaleMaster_branchid`);

--
-- Indexes for table `tbl_saledetails`
--
ALTER TABLE `tbl_saledetails`
  ADD PRIMARY KEY (`SaleDetails_SlNo`),
  ADD KEY `SaleMaster_IDNo` (`SaleMaster_IDNo`),
  ADD KEY `Product_IDNo` (`Product_IDNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleDetails_BranchId` (`SaleDetails_BranchId`);

--
-- Indexes for table `tbl_salereturn`
--
ALTER TABLE `tbl_salereturn`
  ADD PRIMARY KEY (`SaleReturn_SlNo`),
  ADD KEY `SaleMaster_InvoiceNo` (`SaleMaster_InvoiceNo`),
  ADD KEY `SaleReturn_ReturnDate` (`SaleReturn_ReturnDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleReturn_brunchId` (`SaleReturn_brunchId`);

--
-- Indexes for table `tbl_salereturndetails`
--
ALTER TABLE `tbl_salereturndetails`
  ADD PRIMARY KEY (`SaleReturnDetails_SlNo`),
  ADD KEY `SaleReturn_IdNo` (`SaleReturn_IdNo`),
  ADD KEY `SaleReturnDetailsProduct_SlNo` (`SaleReturnDetailsProduct_SlNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleReturnDetails_brunchID` (`SaleReturnDetails_brunchID`);

--
-- Indexes for table `tbl_salesmaster`
--
ALTER TABLE `tbl_salesmaster`
  ADD PRIMARY KEY (`SaleMaster_SlNo`),
  ADD KEY `SaleMaster_InvoiceNo` (`SaleMaster_InvoiceNo`),
  ADD KEY `SalseCustomer_IDNo` (`SalseCustomer_IDNo`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `SaleMaster_SaleDate` (`SaleMaster_SaleDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `is_service` (`is_service`),
  ADD KEY `SaleMaster_branchid` (`SaleMaster_branchid`);

--
-- Indexes for table `tbl_sms`
--
ALTER TABLE `tbl_sms`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`Supplier_SlNo`),
  ADD KEY `Supplier_Code` (`Supplier_Code`),
  ADD KEY `Supplier_Mobile` (`Supplier_Mobile`),
  ADD KEY `District_SlNo` (`District_SlNo`),
  ADD KEY `Country_SlNo` (`Country_SlNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `Supplier_brinchid` (`Supplier_brinchid`);

--
-- Indexes for table `tbl_supplier_payment`
--
ALTER TABLE `tbl_supplier_payment`
  ADD PRIMARY KEY (`SPayment_id`),
  ADD KEY `SPayment_date` (`SPayment_date`),
  ADD KEY `SPayment_invoice` (`SPayment_invoice`),
  ADD KEY `SPayment_customerID` (`SPayment_customerID`),
  ADD KEY `SPayment_TransactionType` (`SPayment_TransactionType`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `SPayment_brunchid` (`SPayment_brunchid`),
  ADD KEY `SPayment_status` (`SPayment_status`);

--
-- Indexes for table `tbl_transferdetails`
--
ALTER TABLE `tbl_transferdetails`
  ADD PRIMARY KEY (`transferdetails_id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_transfermaster`
--
ALTER TABLE `tbl_transfermaster`
  ADD PRIMARY KEY (`transfer_id`),
  ADD KEY `transfer_date` (`transfer_date`),
  ADD KEY `transfer_from` (`transfer_from`),
  ADD KEY `transfer_to` (`transfer_to`);

--
-- Indexes for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  ADD PRIMARY KEY (`Unit_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`User_SlNo`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `User_Name` (`User_Name`),
  ADD KEY `User_Password` (`User_Password`),
  ADD KEY `UserType` (`UserType`),
  ADD KEY `status` (`status`),
  ADD KEY `Brunch_ID` (`Brunch_ID`);

--
-- Indexes for table `tbl_user_access`
--
ALTER TABLE `tbl_user_access`
  ADD PRIMARY KEY (`access_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_user_activity`
--
ALTER TABLE `tbl_user_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `Acc_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_assets`
--
ALTER TABLE `tbl_assets`
  MODIFY `as_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_bank_transactions`
--
ALTER TABLE `tbl_bank_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_SiNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_brunch`
--
ALTER TABLE `tbl_brunch`
  MODIFY `brunch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_cashtransaction`
--
ALTER TABLE `tbl_cashtransaction`
  MODIFY `Tr_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_checks`
--
ALTER TABLE `tbl_checks`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_color`
--
ALTER TABLE `tbl_color`
  MODIFY `color_SiNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `Company_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `Country_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_currentinventory`
--
ALTER TABLE `tbl_currentinventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `Customer_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tbl_customer_payment`
--
ALTER TABLE `tbl_customer_payment`
  MODIFY `CPayment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_damage`
--
ALTER TABLE `tbl_damage`
  MODIFY `Damage_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_damagedetails`
--
ALTER TABLE `tbl_damagedetails`
  MODIFY `DamageDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `Department_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  MODIFY `Designation_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `District_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `Employee_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_employee_payment`
--
ALTER TABLE `tbl_employee_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_employee_payment_details`
--
ALTER TABLE `tbl_employee_payment_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_expense_head`
--
ALTER TABLE `tbl_expense_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_investment_account`
--
ALTER TABLE `tbl_investment_account`
  MODIFY `Acc_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_investment_transactions`
--
ALTER TABLE `tbl_investment_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_loan_accounts`
--
ALTER TABLE `tbl_loan_accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_loan_transactions`
--
ALTER TABLE `tbl_loan_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_marchant_wholesaler`
--
ALTER TABLE `tbl_marchant_wholesaler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_month`
--
ALTER TABLE `tbl_month`
  MODIFY `month_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `Product_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  MODIFY `ProductCategory_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_product_images`
--
ALTER TABLE `tbl_product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=462;

--
-- AUTO_INCREMENT for table `tbl_purchasedetails`
--
ALTER TABLE `tbl_purchasedetails`
  MODIFY `PurchaseDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_purchasemaster`
--
ALTER TABLE `tbl_purchasemaster`
  MODIFY `PurchaseMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_purchasereturn`
--
ALTER TABLE `tbl_purchasereturn`
  MODIFY `PurchaseReturn_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_purchasereturndetails`
--
ALTER TABLE `tbl_purchasereturndetails`
  MODIFY `PurchaseReturnDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_quotaion_customer`
--
ALTER TABLE `tbl_quotaion_customer`
  MODIFY `quotation_customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  MODIFY `SaleDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_quotation_master`
--
ALTER TABLE `tbl_quotation_master`
  MODIFY `SaleMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_saledetails`
--
ALTER TABLE `tbl_saledetails`
  MODIFY `SaleDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=541;

--
-- AUTO_INCREMENT for table `tbl_salereturn`
--
ALTER TABLE `tbl_salereturn`
  MODIFY `SaleReturn_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_salereturndetails`
--
ALTER TABLE `tbl_salereturndetails`
  MODIFY `SaleReturnDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_salesmaster`
--
ALTER TABLE `tbl_salesmaster`
  MODIFY `SaleMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT for table `tbl_sms`
--
ALTER TABLE `tbl_sms`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `Supplier_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_supplier_payment`
--
ALTER TABLE `tbl_supplier_payment`
  MODIFY `SPayment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_transferdetails`
--
ALTER TABLE `tbl_transferdetails`
  MODIFY `transferdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_transfermaster`
--
ALTER TABLE `tbl_transfermaster`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  MODIFY `Unit_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `User_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_user_access`
--
ALTER TABLE `tbl_user_access`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user_activity`
--
ALTER TABLE `tbl_user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
