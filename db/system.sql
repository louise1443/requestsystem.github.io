-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2025 at 09:28 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `password`, `date`) VALUES
(1, 'admin', '123', '2025-10-19 03:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `archive_barangay_assistance`
--

CREATE TABLE `archive_barangay_assistance` (
  `archive_id` int(11) NOT NULL,
  `assistance_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `fullname` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `assistance` varchar(20) NOT NULL,
  `reason` text NOT NULL,
  `date_requested` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_barangay_assistance`
--

INSERT INTO `archive_barangay_assistance` (`archive_id`, `assistance_id`, `user_id`, `admin_id`, `fullname`, `address`, `contact`, `assistance`, `reason`, `date_requested`, `deleted_at`) VALUES
(1, 200, 2, 1, 'JunMark Giducos', 'Purok Kinason', '09074332614', 'JHUKGJ,NBUK', 'KHKUJHHLK', '2025-11-07 08:09:09', '2025-11-07 08:09:09'),
(2, 201, 14, 0, 'JunMark Giducos', 'Purok Ipil Ipil', '09074332614', 'Financial', 'dakfhjaf', '2025-11-07 15:00:40', '2025-11-07 15:00:40'),
(3, 203, 2, 0, 'JunMark Giducos', 'Purok Bugsayan 2', '09074332614', 'Medical', 'jhmk', '2025-11-07 16:59:13', '2025-11-07 16:59:13'),
(4, 1, 2, 0, 'JunMark Giducos', 'Purok Bugsayan 2', '09074332614', 'Medical', 'jhmk', '2025-11-07 16:59:16', '2025-11-07 16:59:16'),
(5, 1, 2, 0, 'JunMark Giducos', 'Purok Kinason', '09074332610', 'JHUKGJ,NBUK', 'vaava', '2025-11-07 17:01:29', '2025-11-07 17:01:29');

-- --------------------------------------------------------

--
-- Table structure for table `archive_barangay_blotter`
--

CREATE TABLE `archive_barangay_blotter` (
  `archive_id` int(11) NOT NULL,
  `blotter_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `complainant` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `respondent` varchar(20) NOT NULL,
  `incident_date` date NOT NULL,
  `incident_place` varchar(20) NOT NULL,
  `details` text NOT NULL,
  `date_filed` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_barangay_blotter`
--

INSERT INTO `archive_barangay_blotter` (`archive_id`, `blotter_id`, `user_id`, `admin_id`, `complainant`, `address`, `contact`, `respondent`, `incident_date`, `incident_place`, `details`, `date_filed`, `deleted_at`) VALUES
(2, 4, 3, 1, 'Anna Marei', 'Purok Binga', '09074332611', 'kate Alontaga', '2004-03-12', 'court', 'fafukhkajf', '2025-10-06 09:01:16', '2025-10-06 09:13:54'),
(3, 3, 3, 1, 'Anna Marei', 'Purok Binga', '09074332611', 'kate Alontaga', '2004-03-12', 'court', 'fafukhkajf', '2025-10-06 09:01:13', '2025-10-06 09:13:58'),
(6, 7, 2, 1, 'JunMark Giducos', 'Purok Liswik', '09074332611', 'fahjnfm a', '2025-03-12', 'court', 'afgagag', '2025-10-12 15:46:13', '2025-10-16 05:11:56');

-- --------------------------------------------------------

--
-- Table structure for table `archive_barangay_certificate`
--

CREATE TABLE `archive_barangay_certificate` (
  `archive_id` int(11) NOT NULL,
  `certificate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `address` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_barangay_certificate`
--

INSERT INTO `archive_barangay_certificate` (`archive_id`, `certificate_id`, `user_id`, `admin_id`, `name`, `date_of_birth`, `civil_status`, `address`, `gender`, `contact`, `created_at`, `deleted_at`) VALUES
(1, 7, 2, 1, 'JunMark Giducos', '2004-12-04', 'Single', 'Purok Kalubihan', 'Male', '09074332614', '2025-10-29 14:31:03', '2025-10-29 14:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `archive_barangay_clearance`
--

CREATE TABLE `archive_barangay_clearance` (
  `archive_id` int(11) NOT NULL,
  `clearance_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `fullname` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(30) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `place_of_birth` varchar(50) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `purpose` text NOT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_barangay_clearance`
--

INSERT INTO `archive_barangay_clearance` (`archive_id`, `clearance_id`, `user_id`, `admin_id`, `fullname`, `gender`, `address`, `civil_status`, `dob`, `place_of_birth`, `contact`, `purpose`, `date_applied`, `deleted_at`) VALUES
(4, 13, 2, 1, 'JunMark Giducos', '', 'Purok Kinason', '', '1990-03-12', '', '09074332614', 'j,hiyoujh', '2025-10-12 10:56:14', '2025-10-12 11:15:43'),
(5, 14, 2, 1, 'JunMark Giducos', '', 'Purok Liswik', '', '2004-03-12', '', '09074332614', 'fagagaaga', '2025-10-12 11:20:20', '2025-10-12 11:20:35'),
(6, 15, 2, 1, 'JunMark Giducos', '', 'Purok Binga', '', '2004-03-12', '', '09074332614', 'afjualughajkfb', '2025-10-12 11:24:10', '2025-10-12 11:24:22'),
(9, 18, 2, 1, 'JunMark Giducos', '', 'Purok Binga', '', '2004-03-12', '', '09074332614', 'afjualughajkfb', '2025-10-12 11:30:24', '2025-10-12 13:10:42'),
(10, 19, 2, 1, 'JunMark Giducos', '', 'Purok Binga', '', '2004-03-12', '', '09074332614', 'afjualughajkfb', '2025-10-12 13:19:08', '2025-10-18 05:34:42'),
(13, 25, 2, 1, 'JunMark Giducos', 'Male', 'Kaongkod,Madridejos', 'Single', '2004-03-21', 'afkahfujakfjba', '09074332613', 'fafafaf', '2025-10-27 13:10:44', '2025-10-27 13:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `archive_barangay_indigency`
--

CREATE TABLE `archive_barangay_indigency` (
  `archive_id` int(11) NOT NULL,
  `indigency_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `fullname` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `contact` varchar(11) NOT NULL,
  `reason` text NOT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_barangay_indigency`
--

INSERT INTO `archive_barangay_indigency` (`archive_id`, `indigency_id`, `user_id`, `admin_id`, `fullname`, `address`, `civil_status`, `dob`, `contact`, `reason`, `date_applied`, `deleted_at`) VALUES
(4, 7, 3, 1, 'Anna Marei', 'Purok Kinason', '', '2000-02-12', '09074332614', 'fafafjahakg', '2025-10-06 05:33:34', '2025-10-06 05:35:37'),
(5, 9, 3, 1, 'Anna Marei', 'Purok Kinason', '', '2000-02-12', '09074332614', 'fafafjahakg', '2025-10-06 05:35:34', '2025-10-06 05:35:40'),
(6, 2, 2, 1, 'JunMark Giducos', 'Purok Kinason', '', '2004-03-12', '09074332614', 'uhkajfa', '2025-10-13 23:36:59', '2025-10-18 15:24:09'),
(7, 1, 2, 1, 'JunMark Giducos', 'Purok Kinason', 'Single', '2004-03-12', '09074332614', 'fagagaga', '2025-10-12 13:36:25', '2025-10-18 15:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `archive_barangay_issues`
--

CREATE TABLE `archive_barangay_issues` (
  `archive_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `fullname` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `issue_type` varchar(20) NOT NULL,
  `location` varchar(50) NOT NULL,
  `details` text NOT NULL,
  `date_reported` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_barangay_issues`
--

INSERT INTO `archive_barangay_issues` (`archive_id`, `issue_id`, `user_id`, `admin_id`, `fullname`, `address`, `gender`, `contact`, `issue_type`, `location`, `details`, `date_reported`, `deleted_at`) VALUES
(1, 2, 2, 1, 'JunMark Giducos', 'Purok Kinason', '', '09074332611', 'Noise Complaint', '', 'afa', '2025-10-04 15:08:25', '2025-10-06 06:11:49'),
(2, 1, 2, 1, 'JunMark Giducos', 'Purok Kinason', '', '09074332611', 'Noise Complaint', '', 'afa', '2025-10-04 15:07:36', '2025-10-12 13:16:38'),
(3, 4, 2, 1, 'JunMark Giducos', 'Purok Kinason', '', '09074332611', 'Street / Facility Da', '', 'nhyuukjhu', '2025-10-12 15:31:38', '2025-11-07 05:11:32'),
(4, 3, 2, 1, 'JunMark Giducos', 'Purok Binga', '', '09074332614', 'Garbage / Waste', '', 'avvfhhafj', '2025-10-12 13:40:54', '2025-11-07 05:11:38'),
(5, 5, 2, 0, 'JunMark Giducos', 'Dakungbaybay, Hilantagaan', 'M', '09074332618', 'dakjfha', 'dnhiaughja', 'dabuyfhjaf', '2025-11-07 05:09:25', '2025-11-07 17:04:15');

-- --------------------------------------------------------

--
-- Table structure for table `archive_barangay_officials`
--

CREATE TABLE `archive_barangay_officials` (
  `archive_id` int(11) NOT NULL,
  `officials_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `firstname` varchar(20) NOT NULL,
  `middlename` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `committee` varchar(50) NOT NULL,
  `term_start` date NOT NULL,
  `term_end` date NOT NULL,
  `contact` varchar(11) NOT NULL,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_barangay_officials`
--

INSERT INTO `archive_barangay_officials` (`archive_id`, `officials_id`, `admin_id`, `firstname`, `middlename`, `lastname`, `birth_date`, `age`, `address`, `position`, `committee`, `term_start`, `term_end`, `contact`, `archived_at`) VALUES
(13, 5, 1, 'William', 'G.', 'Marabi', '1990-03-12', 35, '', 'Kagawad', '', '2025-10-06', '2028-10-06', '09074332614', '2025-10-06 01:44:22'),
(14, 6, 1, 'William', '', 'Marabi', '1990-02-12', 35, '', 'Barangay Captain', '', '2025-10-06', '2028-10-06', '09074332610', '2025-10-06 02:45:40'),
(16, 9, 1, 'Marnie', 'G.', 'Marabi', '1990-02-12', 35, '', 'Barangay Captain', '', '2025-10-12', '2028-10-12', '09074332614', '2025-10-12 14:34:25'),
(17, 10, 1, 'Juan', 'G.', 'Marabi', '1991-12-12', 33, '', 'Barangay Captain', '', '2025-10-12', '2028-10-12', '09074332614', '2025-10-16 05:02:52'),
(19, 11, 1, 'Marnie', 'D.', 'Marabi', '1994-02-13', 31, 'Purok Kasagingan', 'Kagawad', '', '2025-10-12', '2028-10-12', '09074332611', '2025-10-16 05:05:23'),
(20, 13, 1, 'William', 'G.', 'Derder', '2005-03-12', 20, '', 'SK Chairperson', '', '2025-10-12', '2028-10-12', '09074332618', '2025-10-21 14:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `archive_barangay_tanod`
--

CREATE TABLE `archive_barangay_tanod` (
  `archive_id` int(11) NOT NULL,
  `tanod_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `extname` varchar(5) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_barangay_tanod`
--

INSERT INTO `archive_barangay_tanod` (`archive_id`, `tanod_id`, `admin_id`, `firstname`, `middlename`, `lastname`, `extname`, `gender`, `birthdate`, `date_started`, `contact`, `archived_at`) VALUES
(1, 120, NULL, 'Juan', 'Preston', 'Marabi', 'Jr', 'M', '2000-03-21', '2021-02-21', '09074332613', '2025-11-07 15:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `archive_bhw`
--

CREATE TABLE `archive_bhw` (
  `archive_id` int(11) NOT NULL,
  `bhw_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `no_of_hh` decimal(10,2) NOT NULL,
  `no_of_extended` decimal(10,2) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `archive_business_closure`
--

CREATE TABLE `archive_business_closure` (
  `archive_id` int(11) NOT NULL,
  `closure_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `business_location` varchar(50) NOT NULL,
  `closed_date` date NOT NULL,
  `contact` varchar(11) NOT NULL,
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_business_closure`
--

INSERT INTO `archive_business_closure` (`archive_id`, `closure_id`, `user_id`, `admin_id`, `name`, `address`, `gender`, `business_name`, `business_location`, `closed_date`, `contact`, `requested_at`, `deleted_at`) VALUES
(3, 3, 3, 1, 'JunMark Giducos', 'Dakungbaybay, Hilantagaan', 'Male', 'Bakeshop', 'Near High School', '2022-12-24', '09074332618', '2025-10-31 04:38:25', '2025-10-31 04:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `archive_business_permits`
--

CREATE TABLE `archive_business_permits` (
  `archive_id` int(11) NOT NULL,
  `permit_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `business_name` varchar(50) NOT NULL,
  `owner_name` varchar(20) NOT NULL,
  `business_type` varchar(20) NOT NULL,
  `business_location` varchar(50) NOT NULL,
  `address` varchar(30) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `capital_investment` decimal(15,2) DEFAULT 0.00,
  `employees` int(30) NOT NULL,
  `permit_start` date DEFAULT NULL,
  `permit_end` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_business_permits`
--

INSERT INTO `archive_business_permits` (`archive_id`, `permit_id`, `user_id`, `admin_id`, `business_name`, `owner_name`, `business_type`, `business_location`, `address`, `civil_status`, `contact`, `capital_investment`, `employees`, `permit_start`, `permit_end`, `created_at`, `deleted_at`) VALUES
(15, 12, 2, 1, 'Bakeshop', 'JunMark Giducos', 'Partnership', 'Near High School', 'Purok Binga', '', '09074332611', 50000.00, 30, '2025-10-14', '2026-10-14', '2025-10-14 01:25:23', '2025-10-14 01:25:23'),
(16, 14, 3, 1, 'Bakeshop', 'JunMark Giducos', 'Partnership', 'Near High School', 'Purok Maisan 1', '', '09074332618', 50000.00, 30, '2025-10-18', '2026-10-18', '2025-10-18 15:11:35', '2025-10-18 15:11:35'),
(17, 19, 14, 1, 'Dina', 'Dina Gilbuena', 'Partnership', 'Hilantagaan', 'Dakungbaybay, Hilantagaan', 'Married', '09074332613', 50000.00, 5, '2025-11-07', '2026-11-07', '2025-11-07 22:21:48', '2025-11-07 22:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `archive_construction_clearance`
--

CREATE TABLE `archive_construction_clearance` (
  `archive_id` int(11) NOT NULL,
  `construction_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `purpose` text NOT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_construction_clearance`
--

INSERT INTO `archive_construction_clearance` (`archive_id`, `construction_id`, `user_id`, `admin_id`, `name`, `address`, `gender`, `civil_status`, `contact`, `purpose`, `date_applied`, `deleted_at`) VALUES
(1, 1, 2, 1, 'JunMark Giducos', 'Purok Ipil Ipil', 'Male', 'Single', '09074332613', 'Elictricity', '2025-10-24 15:01:55', '2025-10-31 04:49:49'),
(2, 4, 12, 1, 'Anna Marei D. Manzanares', 'Purok Bugsayan 2', 'F', 'Single', '09074332614', 'jkhkdhafiyuaf', '2025-11-09 04:23:59', '2025-11-13 06:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `archive_fencing_permit`
--

CREATE TABLE `archive_fencing_permit` (
  `archive_id` int(11) NOT NULL,
  `fencing_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `address` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_fencing_permit`
--

INSERT INTO `archive_fencing_permit` (`archive_id`, `fencing_id`, `user_id`, `admin_id`, `name`, `date_of_birth`, `civil_status`, `address`, `gender`, `contact`, `requested_at`, `deleted_at`) VALUES
(1, 10, 3, 1, 'JunMark Giducos', '2004-12-04', 'Single', 'Dakungbaybay, Hilantagaan', 'Male', '09074332614', '2025-10-31 04:15:40', '2025-10-31 04:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `archive_lupon_tagapamayapa`
--

CREATE TABLE `archive_lupon_tagapamayapa` (
  `archive_id` int(11) NOT NULL,
  `lupon_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `extname` varchar(5) DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `training_attended` varchar(100) DEFAULT NULL,
  `conducted_by` varchar(100) DEFAULT NULL,
  `contact` varchar(11) DEFAULT NULL,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_lupon_tagapamayapa`
--

INSERT INTO `archive_lupon_tagapamayapa` (`archive_id`, `lupon_id`, `admin_id`, `firstname`, `middlename`, `lastname`, `extname`, `gender`, `birthdate`, `date_started`, `training_attended`, `conducted_by`, `contact`, `archived_at`) VALUES
(1, 1, 1, 'William', 'D.', 'Santillan', 'SR', 'M', '1981-02-17', '2018-01-02', 'dryhgh', 'vkghghj', '09074332618', '2025-11-07 15:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `archive_ownership`
--

CREATE TABLE `archive_ownership` (
  `archive_id` int(11) NOT NULL,
  `ownership_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `property` varchar(50) NOT NULL,
  `name_of_property` varchar(50) NOT NULL,
  `address` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact` varchar(11) NOT NULL,
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_ownership`
--

INSERT INTO `archive_ownership` (`archive_id`, `ownership_id`, `user_id`, `admin_id`, `name`, `gender`, `civil_status`, `property`, `name_of_property`, `address`, `date_of_birth`, `contact`, `requested_at`, `deleted_at`) VALUES
(5, 2, 2, 1, 'JunMark Giducos', 'Male', 'Single', 'Fishing Boat', 'RM3', 'Purok Maisan 1', '2004-12-04', '09074332610', '2025-10-24 14:55:11', '2025-10-31 04:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `archive_permit_2daysbenefitdance`
--

CREATE TABLE `archive_permit_2daysbenefitdance` (
  `archive_id` int(11) NOT NULL,
  `dancing_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `fullname` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `date_to_hold` varchar(30) NOT NULL,
  `chapel_name` varchar(40) NOT NULL,
  `start_end` varchar(30) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_permit_2daysbenefitdance`
--

INSERT INTO `archive_permit_2daysbenefitdance` (`archive_id`, `dancing_id`, `user_id`, `admin_id`, `fullname`, `address`, `civil_status`, `dob`, `date_to_hold`, `chapel_name`, `start_end`, `contact`, `date_applied`, `deleted_at`) VALUES
(2, 2, 14, 1, 'Jade Santarosa', 'kabay-ot, Hilantagaan', 'Married', '1999-11-09', '2025', 'Santa Rosa', '4:00 pm to 6:00 pm', '09074332613', '2025-11-07 11:35:36', '2025-11-07 22:21:32');

-- --------------------------------------------------------

--
-- Table structure for table `archive_permit_streetdancing`
--

CREATE TABLE `archive_permit_streetdancing` (
  `archive_id` int(11) NOT NULL,
  `dancing_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `fullname` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `date_to_hold` varchar(30) NOT NULL,
  `chapel_name` varchar(40) NOT NULL,
  `start_end` varchar(30) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_permit_streetdancing`
--

INSERT INTO `archive_permit_streetdancing` (`archive_id`, `dancing_id`, `user_id`, `admin_id`, `fullname`, `address`, `civil_status`, `dob`, `date_to_hold`, `chapel_name`, `start_end`, `contact`, `date_applied`, `deleted_at`) VALUES
(1, 1, 2, NULL, 'Mary Grace D. Illustrisimo', 'Purok kabay-ot', 'Single', '2004-03-21', '2025-10-25', 'Santa Rosa', '4:00 pm to 6:00 pm', '09074332610', '2025-10-24 14:59:34', '2025-10-31 05:07:28'),
(2, 2, 14, 1, 'Shane Carposa', 'Purok kabay-ot', 'Married', '2001-12-11', '2017-02-02', 'Santa Rosa', '4:00 pm to 6:00 pm', '09074332613', '2025-11-07 11:34:04', '2025-11-07 22:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `archive_solid_waste_management`
--

CREATE TABLE `archive_solid_waste_management` (
  `archive_id` int(11) NOT NULL,
  `waste_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `address` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_solid_waste_management`
--

INSERT INTO `archive_solid_waste_management` (`archive_id`, `waste_id`, `user_id`, `admin_id`, `name`, `business_name`, `address`, `gender`, `civil_status`, `contact`, `date_applied`, `deleted_at`) VALUES
(1, 1, 2, 1, 'JunMark Giducos', 'Bakeshop', 'Purok Kamanggahan', 'Male', 'Single', '09074332611', '2025-10-24 15:00:55', '2025-10-31 05:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `barangay_assistance`
--

CREATE TABLE `barangay_assistance` (
  `assistance_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `assistance` varchar(20) NOT NULL,
  `reason` text NOT NULL,
  `date_requested` timestamp NOT NULL DEFAULT current_timestamp(),
  `archive_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_assistance`
--

INSERT INTO `barangay_assistance` (`assistance_id`, `user_id`, `admin_id`, `fullname`, `address`, `contact`, `assistance`, `reason`, `date_requested`, `archive_id`) VALUES
(205, 12, 1, 'Anna Marei D. Manzanares', 'Purok Bugsayan 1', '09074332611', 'Financial', 'd kahmfhuaf', '2025-11-09 04:30:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangay_blotter`
--

CREATE TABLE `barangay_blotter` (
  `blotter_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `complainant` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `respondent` varchar(20) NOT NULL,
  `incident_date` date NOT NULL,
  `incident_place` varchar(20) NOT NULL,
  `details` text NOT NULL,
  `date_filed` timestamp NOT NULL DEFAULT current_timestamp(),
  `archive_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_blotter`
--

INSERT INTO `barangay_blotter` (`blotter_id`, `user_id`, `admin_id`, `complainant`, `address`, `contact`, `respondent`, `incident_date`, `incident_place`, `details`, `date_filed`, `archive_id`) VALUES
(8, 14, 1, 'Josa', 'Purok Bugsayan 2', '09074332610', 'James Francis', '2025-11-23', 'court', 'hgshjkv', '2025-11-07 11:40:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangay_budget`
--

CREATE TABLE `barangay_budget` (
  `budget_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `fiscal_year` year(4) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `allocated` decimal(12,2) DEFAULT NULL,
  `spent` decimal(12,2) DEFAULT NULL,
  `remaining` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_budget`
--

INSERT INTO `barangay_budget` (`budget_id`, `admin_id`, `fiscal_year`, `category`, `description`, `allocated`, `spent`, `remaining`, `created_at`) VALUES
(2, NULL, '2025', 'Projects', 'Rehabilitation of Perimeter Fence of Brgy. Multi-Purpose Building', 240000.00, 240000.00, 0.00, '2025-10-16 10:53:05'),
(3, NULL, '2024', 'General Fund', 'Relief goods', 100000.00, 90000.00, 10000.00, '2025-10-16 10:54:01'),
(4, NULL, '2023', 'General Fund', 'adiaofjkna', 200000.00, 100000.00, 100000.00, '2025-10-16 10:54:39'),
(10, NULL, '2025', 'Projects', 'Barangay Road Maintenance', 150000.00, 150000.00, 0.00, '2025-10-18 05:45:35'),
(11, NULL, '2025', 'General Fund', 'fafagagag', 50000.00, 49000.00, 1000.00, '2025-10-21 12:36:47');

-- --------------------------------------------------------

--
-- Table structure for table `barangay_certificate`
--

CREATE TABLE `barangay_certificate` (
  `certificate_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `civil_status` varchar(20) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `contact` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_certificate`
--

INSERT INTO `barangay_certificate` (`certificate_id`, `user_id`, `admin_id`, `name`, `date_of_birth`, `civil_status`, `address`, `gender`, `contact`, `created_at`, `archived_id`) VALUES
(10, 14, NULL, 'Dominic', '1995-12-09', 'Married', 'Purok Pukoton 1', 'Male', '09074332610', '2025-11-07 11:38:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangay_clearance`
--

CREATE TABLE `barangay_clearance` (
  `clearance_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `civil_status` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `place_of_birth` varchar(100) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `purpose` text NOT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp(),
  `archive_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_clearance`
--

INSERT INTO `barangay_clearance` (`clearance_id`, `user_id`, `admin_id`, `fullname`, `address`, `gender`, `civil_status`, `dob`, `place_of_birth`, `contact`, `purpose`, `date_applied`, `archive_id`) VALUES
(26, 11, 1, 'Argentina Corn Beef', 'kabay-ot, Hilantagaan', 'Female', 'Married', '1978-10-11', 'Natas an', '09074332610', 'idajhdfjafhka', '2025-10-31 05:24:28', NULL),
(27, 14, 1, 'Jessa', 'kabay-ot, Hilantagaan', 'F', 'Single', '2003-02-09', 'Natas an', '09074332618', 'ahgjfgj', '2025-11-07 11:28:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangay_construction_clearance`
--

CREATE TABLE `barangay_construction_clearance` (
  `construction_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `purpose` varchar(50) NOT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_construction_clearance`
--

INSERT INTO `barangay_construction_clearance` (`construction_id`, `user_id`, `admin_id`, `name`, `address`, `gender`, `civil_status`, `contact`, `purpose`, `date_applied`, `archived_id`) VALUES
(2, 14, NULL, 'Edlyn Derder', 'Purok Ipil Ipil', 'Female', 'Married', '09074332613', 'jfhgighj', '2025-11-07 11:41:22', NULL),
(3, 12, NULL, 'Anna Marei D. Manzanares', 'Purok Maisan 3', 'F', 'Single', '09074332610', 'iudkjahjfiuaadmnhfungjjko', '2025-11-09 04:19:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangay_indigency`
--

CREATE TABLE `barangay_indigency` (
  `indigency_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `fullname` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `contact` varchar(11) NOT NULL,
  `reason` text NOT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp(),
  `archive_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_indigency`
--

INSERT INTO `barangay_indigency` (`indigency_id`, `user_id`, `admin_id`, `fullname`, `address`, `civil_status`, `dob`, `contact`, `reason`, `date_applied`, `archive_id`) VALUES
(14, 14, 1, 'Kitty', 'Kaongkod,Madridejos', 'Single', '2002-04-04', '09074332613', 'gafgou', '2025-11-07 11:29:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangay_issues`
--

CREATE TABLE `barangay_issues` (
  `issue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `fullname` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `issue_type` varchar(20) NOT NULL,
  `location` varchar(50) NOT NULL,
  `details` text NOT NULL,
  `date_reported` timestamp NOT NULL DEFAULT current_timestamp(),
  `archive_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_issues`
--

INSERT INTO `barangay_issues` (`issue_id`, `user_id`, `admin_id`, `fullname`, `address`, `gender`, `contact`, `issue_type`, `location`, `details`, `date_reported`, `archive_id`) VALUES
(6, 14, 1, 'Danica', 'Purok Manlot', 'F', '09074332611', 'ngcmfn', 'ejf2h24', 'ekiyoi2gy', '2025-11-07 11:42:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangay_officials`
--

CREATE TABLE `barangay_officials` (
  `officials_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `firstname` varchar(20) NOT NULL,
  `middlename` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(30) NOT NULL,
  `position` varchar(20) NOT NULL,
  `committee` varchar(50) NOT NULL,
  `term_start` date NOT NULL,
  `term_end` date NOT NULL,
  `contact` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archive_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_officials`
--

INSERT INTO `barangay_officials` (`officials_id`, `admin_id`, `firstname`, `middlename`, `lastname`, `gender`, `birth_date`, `address`, `position`, `committee`, `term_start`, `term_end`, `contact`, `created_at`, `archive_id`) VALUES
(1, 1, 'Magdalena', 'Bautro', 'Marollano', 'F', '1954-05-08', 'Purok Maisan 1', 'Barangay Captain', '', '2025-10-21', '2028-10-21', '09074332614', '2025-10-21 14:30:54', NULL),
(2, 1, 'Tita', 'Cueva', 'Ilosorio', 'F', '1960-02-07', 'Purok Kasagingan 1', 'Barangay Kagawad', 'Committee On Health', '2025-10-21', '2028-10-21', '09074332610', '2025-10-21 14:32:03', NULL),
(3, 1, 'Edwin', 'Pilapil', 'Bautro', 'M', '1969-12-11', 'Purok Pukotan 1', 'Barangay Kagawad', 'Committee On Peace and Order', '2025-10-21', '2028-10-21', '09074332618', '2025-10-21 14:32:51', NULL),
(4, 1, 'Felix', 'Bautro', 'Locaylocay', 'M', '1971-05-09', 'Purok Maisan 2', 'Barangay Kagawad', 'Committee On Taxation', '2025-10-21', '2028-10-21', '09074332611', '2025-10-21 14:33:38', NULL),
(5, 1, 'Leonora', 'Maru', 'Cabasag', 'F', '1972-01-16', 'Purok Maisan 2', 'Barangay Kagawad', 'Committee On Budget and Appropriation', '2025-10-21', '2028-10-21', '09074332610', '2025-10-21 14:34:46', NULL),
(6, 1, 'Joe Carlo', 'Nedamo', 'Villacarlos', 'M', '1965-03-13', 'Purok Bugsayan 1', 'Barangay Kagawad', 'Committee On Infrastructure', '2025-10-22', '2028-10-22', '09074332618', '2025-10-22 04:30:55', NULL),
(7, 1, 'Allan', 'Bautro', 'Marollano', 'M', '1977-03-04', 'Purok Kamanggahan', 'Barangay Kagawad', 'Committee On Education', '2025-10-22', '2028-10-22', '09074332613', '2025-10-22 04:32:27', NULL),
(8, 1, 'Eupeniano', 'Pilapil', 'Bautro', 'M', '1952-09-09', 'Purok Maisan 2', 'Barangay Kagawad', 'Committee On Agriculture', '2025-10-22', '2028-10-22', '09074332618', '2025-10-22 04:34:41', NULL),
(9, 1, 'Yama', 'Suan', 'Desamparado', 'F', '2004-07-09', 'Purok Ipil Ipil', 'SK Chairperson', 'Committee On Sports', '2025-10-22', '2028-10-22', '09074332618', '2025-10-22 04:38:15', NULL),
(10, 1, 'Rosemarie', 'Ilustrisimo', 'Doble', 'F', '1991-02-06', 'Purok Bugsayan 2', 'Barangay Secretary', '', '2025-10-22', '2028-10-22', '09074332610', '2025-10-22 04:40:02', NULL),
(11, 1, 'Jupiter', 'Aniban', 'Layos', 'M', '1976-10-24', 'Purok Kasagingan', 'Barangay Treasurer', '', '2025-10-22', '2028-10-22', '09074332610', '2025-10-22 04:42:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangay_permit_2days_benefit_dance`
--

CREATE TABLE `barangay_permit_2days_benefit_dance` (
  `dancing_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `fullname` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `date_to_hold` varchar(30) NOT NULL,
  `chapel_name` varchar(40) NOT NULL,
  `start_end` varchar(30) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_permit_2days_benefit_dance`
--

INSERT INTO `barangay_permit_2days_benefit_dance` (`dancing_id`, `user_id`, `admin_id`, `fullname`, `address`, `civil_status`, `dob`, `date_to_hold`, `chapel_name`, `start_end`, `contact`, `date_applied`, `archived_id`) VALUES
(3, 12, 1, 'Anna Marei D. Manzanares', 'Purok Pukotan 1, Kaongkod, Madridejos, Cebu', 'Single', '2004-04-23', 'December 4-5, 2025', 'Santa Rosa', '4:00 pm to 6:00 pm', '09074332614', '2025-11-09 11:06:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangay_permit_streetdancing`
--

CREATE TABLE `barangay_permit_streetdancing` (
  `dancing_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `fullname` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `date_to_hold` varchar(30) NOT NULL,
  `chapel_name` varchar(40) NOT NULL,
  `start_end` varchar(30) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_permit_streetdancing`
--

INSERT INTO `barangay_permit_streetdancing` (`dancing_id`, `user_id`, `admin_id`, `fullname`, `address`, `civil_status`, `dob`, `date_to_hold`, `chapel_name`, `start_end`, `contact`, `date_applied`, `archived_id`) VALUES
(3, 12, 1, 'Mary Grace D. Illustrisimo', 'Purok Pukotan 1, Kaongkod, Madridejos, Cebu', 'Married', '1990-02-12', '2025-11-12', 'Santa Rosa', '4:00 pm to 6:00 pm', '09074332619', '2025-11-09 12:09:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangay_tanod`
--

CREATE TABLE `barangay_tanod` (
  `tanod_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `firstname` varchar(20) NOT NULL,
  `middlename` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `extname` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `birthdate` date NOT NULL,
  `date_started` date NOT NULL,
  `contact` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archive_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_tanod`
--

INSERT INTO `barangay_tanod` (`tanod_id`, `admin_id`, `firstname`, `middlename`, `lastname`, `extname`, `gender`, `birthdate`, `date_started`, `contact`, `created_at`, `archive_id`) VALUES
(1, 1, 'Edgar', 'Seville', 'Batoy', '', 'M', '1981-02-17', '2021-01-01', '09074332614', '2025-11-06 09:48:21', NULL),
(2, 1, 'Marjun', 'Nedamo', 'Bayon-on', '', 'M', '1985-12-31', '2021-01-01', '09074332619', '2025-11-06 10:00:12', NULL),
(3, 1, 'Juniver', 'Bautro', 'Cahutay', '', 'M', '1984-09-12', '2021-01-01', '09074332610', '2025-11-07 10:18:42', NULL),
(4, 1, 'Rico', 'Sepuesca', 'Roble', '', 'M', '1991-04-02', '2021-01-01', '09074332613', '2025-11-07 10:20:12', NULL),
(5, 1, 'Alfredo', 'Batoy', 'Maru', '', 'M', '1969-05-02', '2021-01-01', '09074332614', '2025-11-07 10:21:18', NULL),
(6, 1, 'Teotimo', 'Sevillejo', 'Maru', '', 'M', '1980-10-14', '2016-01-02', '09074332610', '2025-11-07 10:24:02', NULL),
(7, 1, 'Vicente', 'Ilosorio', 'Olinares', '', 'M', '1981-05-22', '2021-01-02', '09074332610', '2025-11-07 10:26:50', NULL),
(8, 1, 'Gino', 'Illustrisimo', 'Olinares', '', 'M', '1989-04-23', '2021-01-02', '09074332610', '2025-11-07 10:28:16', NULL),
(9, 1, 'Roy', 'Santillan', 'Olinares', '', 'M', '1975-11-19', '2021-01-02', '09074332611', '2025-11-07 10:29:32', NULL),
(10, 1, 'Ferdinand', 'Santillan', 'Olinares', '', 'M', '1971-08-19', '2007-01-02', '09074332614', '2025-11-07 10:30:39', NULL),
(11, 1, 'Ian', 'Aniban', 'Santillan', '', 'M', '1997-01-31', '2021-01-02', '09074332610', '2025-11-07 10:32:24', NULL),
(12, 1, 'Renante', 'Almonicar', 'Santillan', '', 'M', '1987-02-13', '2018-01-02', '09074332618', '2025-11-07 10:33:57', NULL),
(13, 1, 'Rodulfo', 'Montano', 'Santillan', '', 'M', '1970-08-07', '2018-01-02', '09074332613', '2025-11-07 10:35:20', NULL),
(14, 1, 'Nenita', 'Bautro', 'Supapo', '', 'F', '1984-12-08', '2015-01-02', '09074332619', '2025-11-07 10:36:37', NULL),
(15, 1, 'Roger', 'Abing', 'Tayactac', '', 'M', '1975-08-07', '2018-01-02', '09074332619', '2025-11-07 10:37:36', NULL),
(16, 1, 'Alexander', 'Negre', 'Villaester', '', 'M', '1980-11-04', '2021-12-21', '09074332611', '2025-11-07 10:38:52', NULL),
(17, 1, 'Juliet', 'Lawan', 'Villaester', '', 'F', '1991-05-22', '2021-01-02', '09074332614', '2025-11-07 10:39:53', NULL),
(18, 1, 'Jaymar', 'Doble', 'Villalon', '', 'M', '1986-08-13', '2021-01-02', '09074332610', '2025-11-07 10:40:58', NULL),
(19, 1, 'Gerardo', 'Marollano', 'Villalon', '', 'M', '1977-08-17', '2021-01-02', '09074332613', '2025-11-07 10:42:06', NULL),
(20, 1, 'Rodgen', 'Figuracion', 'Maupas', '', 'M', '1984-05-28', '2021-01-02', '09074332613', '2025-11-07 10:43:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bhw`
--

CREATE TABLE `bhw` (
  `bhw_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `no_of_hh` decimal(10,2) NOT NULL,
  `no_of_extended` decimal(10,2) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archive_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bhw`
--

INSERT INTO `bhw` (`bhw_id`, `admin_id`, `address`, `name`, `no_of_hh`, `no_of_extended`, `create_at`, `archive_id`) VALUES
(1, 1, 'Ipil Ipil', 'Edna I. Batoy', 59.00, 13.00, '2025-11-13 05:40:04', NULL),
(2, 1, 'Ipil Ipil', 'Analisa C. Maru', 56.00, 16.00, '2025-11-13 05:45:01', NULL),
(3, 1, 'Ipil Ipil', 'Melona O. Espino', 75.00, 15.00, '2025-11-13 05:47:01', NULL),
(4, 1, 'Bugsayan 1', 'Santas B. Bongo', 63.00, 18.00, '2025-11-13 05:48:03', NULL),
(5, 1, 'Bugsayan 2', 'Elizabeth I. Ilosorio', 50.00, 14.00, '2025-11-13 05:48:55', NULL),
(6, 1, 'Maisan 1', 'Elna N. Villanon', 46.00, 8.00, '2025-11-13 05:50:27', NULL),
(7, 1, 'Maisan 1', 'Eduarda B. Santillan', 40.00, 13.00, '2025-11-13 05:51:02', NULL),
(8, 1, 'Maisan 2', 'Rosita S Escario', 44.00, 7.00, '2025-11-13 05:51:44', NULL),
(9, 1, 'Maisan 2', 'Flora E. Pastorpide', 36.00, 7.00, '2025-11-13 05:52:17', NULL),
(10, 1, 'Maisan 3', 'Maria B. Bautro', 39.00, 9.00, '2025-11-13 05:52:48', NULL),
(11, 1, 'Kamanggahan', 'Mary Ann O. Oflas', 58.00, 5.00, '2025-11-13 05:53:20', NULL),
(12, 1, 'Kamanggahan', 'Margarita M. Nalla', 48.00, 15.00, '2025-11-13 05:53:52', NULL),
(13, 1, 'Kasagingan 1', 'Elvie M. Celestial', 66.00, 18.00, '2025-11-13 05:54:37', NULL),
(14, 1, 'Kasagingan 2', 'Maria Evelyn D. Ilosorio', 56.00, 17.00, '2025-11-13 05:55:14', NULL),
(15, 1, 'Kasagingan 2', 'Josephine D. Zamora', 63.00, 16.00, '2025-11-13 05:55:51', NULL),
(16, 1, 'Pukotan 1', 'Cerelyn D. Cabilan', 63.00, 22.00, '2025-11-13 05:56:26', NULL),
(17, 1, 'Pukotan 2', 'Editha B. Neido', 50.00, 18.00, '2025-11-13 05:56:49', NULL),
(18, 1, 'Kalubihan', 'Narcisa L. Locaylocay', 40.00, 11.00, '2025-11-13 05:57:17', NULL),
(19, 1, 'Kalubihan', 'Margelya A. Cabilan', 38.00, 17.00, '2025-11-13 05:57:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business_closure`
--

CREATE TABLE `business_closure` (
  `closure_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `business_name` varchar(30) NOT NULL,
  `business_location` varchar(50) NOT NULL,
  `closed_date` date DEFAULT NULL,
  `contact` varchar(11) NOT NULL,
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business_closure`
--

INSERT INTO `business_closure` (`closure_id`, `user_id`, `admin_id`, `name`, `address`, `gender`, `business_name`, `business_location`, `closed_date`, `contact`, `requested_at`, `archived_id`) VALUES
(5, 14, NULL, 'Psalmer James Batiancila', 'Dakungbaybay, Hilantagaan', 'Male', 'Sari2 Store', 'Hilantagaan', '1990-01-10', '09074332618', '2025-11-07 11:32:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business_permits`
--

CREATE TABLE `business_permits` (
  `permit_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `business_name` varchar(50) NOT NULL,
  `owner_name` varchar(20) NOT NULL,
  `business_type` varchar(20) NOT NULL,
  `business_location` varchar(50) NOT NULL,
  `address` varchar(30) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `capital_investment` decimal(15,2) DEFAULT 0.00,
  `employees` int(30) NOT NULL,
  `permit_start` date DEFAULT NULL,
  `permit_end` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archive_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business_permits`
--

INSERT INTO `business_permits` (`permit_id`, `user_id`, `admin_id`, `business_name`, `owner_name`, `business_type`, `business_location`, `address`, `civil_status`, `contact`, `capital_investment`, `employees`, `permit_start`, `permit_end`, `created_at`, `archive_id`) VALUES
(20, 12, 1, 'Sari2 Store', 'Dina Gilbuena', 'Sole Proprietorship', 'Near High School', 'Purok Pukotan 1', 'Widowed', '09074332611', 50000.00, 5, '2025-11-09', '2026-11-09', '2025-11-09 04:25:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `certification_of_ownership`
--

CREATE TABLE `certification_of_ownership` (
  `ownership_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `property` varchar(30) NOT NULL,
  `name_of_property` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `contact` varchar(11) NOT NULL,
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certification_of_ownership`
--

INSERT INTO `certification_of_ownership` (`ownership_id`, `user_id`, `admin_id`, `name`, `gender`, `civil_status`, `property`, `name_of_property`, `address`, `date_of_birth`, `contact`, `requested_at`, `archived_id`) VALUES
(3, 14, NULL, 'Cathy', 'Female', 'Single', 'Fishing Boat', 'RM3', 'Purok Kamanggahan', '2001-05-06', '09074332613', '2025-11-07 11:29:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cert_for_solid_waste_management`
--

CREATE TABLE `cert_for_solid_waste_management` (
  `waste_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cert_for_solid_waste_management`
--

INSERT INTO `cert_for_solid_waste_management` (`waste_id`, `user_id`, `admin_id`, `name`, `business_name`, `address`, `gender`, `civil_status`, `contact`, `date_applied`, `archived_id`) VALUES
(2, 14, NULL, 'Jude Delapena', 'Bakeshop', 'Purok Pukoton 1', 'Male', 'Married', '09074332613', '2025-11-07 11:36:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fencing_permit`
--

CREATE TABLE `fencing_permit` (
  `fencing_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `civil_status` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fencing_permit`
--

INSERT INTO `fencing_permit` (`fencing_id`, `user_id`, `admin_id`, `name`, `date_of_birth`, `civil_status`, `address`, `gender`, `contact`, `requested_at`, `archived_id`) VALUES
(11, 14, NULL, 'Lynlyn', '1995-06-05', 'Married', 'Kaongkod,Madridejos', 'Female', '09074332610', '2025-11-07 11:30:58', NULL),
(12, 12, 1, 'Anna Marei D. Manzanares', '2004-04-23', 'Single', 'Purok Pukotan 1', 'F', '09074332610', '2025-11-09 04:13:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lupon_tagapamayapa`
--

CREATE TABLE `lupon_tagapamayapa` (
  `lupon_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `firstname` varchar(20) NOT NULL,
  `middlename` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `extname` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `birthdate` date NOT NULL,
  `date_started` date NOT NULL,
  `training_attended` varchar(40) NOT NULL,
  `conducted_by` varchar(40) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archive_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lupon_tagapamayapa`
--

INSERT INTO `lupon_tagapamayapa` (`lupon_id`, `admin_id`, `firstname`, `middlename`, `lastname`, `extname`, `gender`, `birthdate`, `date_started`, `training_attended`, `conducted_by`, `contact`, `created_at`, `archive_id`) VALUES
(1, 1, 'Dorotea', 'Negre', 'Villaester', '', 'F', '1946-03-28', '2018-01-02', 'KP Training', 'DILG', '09074332611', '2025-11-08 12:59:53', NULL),
(2, 1, 'Felisa', 'Marollano', 'Villalon', '', 'F', '1956-11-13', '2021-01-02', 'KP Training', 'DILG', '09074332614', '2025-11-08 13:01:46', NULL),
(3, 1, 'Joel', 'Villaester', 'Legaspe', '', 'M', '1983-09-10', '2021-01-02', 'KP Training', 'DILG', '09074332610', '2025-11-08 13:03:04', NULL),
(4, 1, 'Vergie', 'Santillan', 'Monterola', '', 'F', '1960-06-24', '2016-01-02', 'KP Training', 'DILG', '09074332618', '2025-11-08 13:04:36', NULL),
(5, 1, 'Efrenio', 'Mulle', 'Descartin', '', 'M', '1955-10-10', '2008-01-02', 'KP Training', 'DILG', '09074332613', '2025-11-08 13:06:30', NULL),
(6, 1, 'Felomina', 'Aniban', 'Batoy', '', 'F', '1959-08-10', '2021-01-02', 'KP Training', 'DILG', '09074332619', '2025-11-08 13:08:01', NULL),
(7, 1, 'Rogelio', 'Ilosorio', 'Marollano', '', 'M', '1954-07-20', '2021-01-02', 'KP Training', 'DILG', '09074332611', '2025-11-08 13:09:31', NULL),
(8, 1, 'Ricardo', 'Marollano', 'Bayon-on', '', 'M', '1937-02-07', '2008-01-02', 'KP Training', 'DILG', '09074332614', '2025-11-08 13:10:57', NULL),
(9, 1, 'Marcelino', 'Gopong', 'Olinares', '', 'M', '1962-06-02', '2021-01-02', 'KP Training', 'DILG', '09074332618', '2025-11-08 13:12:38', NULL),
(10, 1, 'Feliciano', 'Bautro', 'Delapena', '', 'M', '1961-01-30', '2016-01-02', 'KP Training', 'DILG', '09074332619', '2025-11-08 13:14:29', NULL),
(11, 1, 'Ediltrudes', 'Marollano', 'Delapena', '', 'F', '1959-04-23', '2016-01-02', 'KP Training', 'DILG', '09074332613', '2025-11-08 13:16:04', NULL),
(12, 1, 'Quirino', 'Gido', 'Bautro', '', 'M', '1949-09-07', '2021-01-02', 'KP Training', 'DILG', '09074332610', '2025-11-08 13:17:40', NULL),
(13, 1, 'Quirino', 'Aropo', 'Desuyo', '', 'M', '1954-12-08', '2021-01-02', 'KP Training', 'DILG', '09074332613', '2025-11-08 13:18:57', NULL),
(14, 1, 'Betty', 'Santillan', 'Bautro', '', 'F', '1950-09-05', '2021-01-02', 'KP Training', 'DILG', '09074332610', '2025-11-08 13:20:14', NULL),
(15, 1, 'Tereso', 'Jumula', 'Ilosorio', '', 'M', '1970-08-18', '2021-01-02', 'KP Training', 'DILG', '09074332610', '2025-11-08 13:21:54', NULL),
(16, 1, 'Argentina', 'Pastorpride', 'Alolod', '', 'F', '1946-09-16', '2021-01-02', 'KP Training', 'DILG', '09074332613', '2025-11-08 13:23:26', NULL),
(17, 1, 'Primitva', 'Ilosorio', 'Santillan', '', 'F', '1947-11-12', '2021-01-02', 'KP Training', 'DILG', '09074332613', '2025-11-08 13:24:40', NULL),
(18, 1, 'Ignacio', 'Baulita', 'Ilosorio', '', 'M', '1947-02-01', '2021-01-02', 'KP Training', 'DILG', '09074332610', '2025-11-08 13:25:54', NULL),
(19, 1, 'Lucita', 'Ofianga', 'Abing', '', 'F', '1953-04-21', '2021-01-02', 'KP Training', 'DILG', '09074332613', '2025-11-08 13:27:24', NULL),
(20, 1, 'Rogelio', 'Almonicar', 'Ilustrisimo', '', 'M', '1962-06-16', '2021-01-02', 'KP Training', 'DILG', '09074332619', '2025-11-08 13:28:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notif_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notif_id`, `user_id`, `admin_id`, `title`, `message`, `is_read`, `created_at`) VALUES
(11, 14, NULL, 'vujmyhoj', 'ggf766uytu', 1, '2025-11-09 16:16:11'),
(12, 12, 1, 'hello', 'apa', 1, '2025-11-13 06:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `payment_records`
--

CREATE TABLE `payment_records` (
  `payment_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `resident_name` varchar(50) NOT NULL,
  `purok` varchar(20) NOT NULL,
  `payment_type` varchar(30) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('Paid','Unpaid') DEFAULT 'Unpaid',
  `paid_date` timestamp NULL DEFAULT current_timestamp(),
  `method` varchar(50) DEFAULT 'Cash',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_records`
--

INSERT INTO `payment_records` (`payment_id`, `admin_id`, `resident_name`, `purok`, `payment_type`, `amount`, `status`, `paid_date`, `method`, `created_at`) VALUES
(5, 1, 'JunMark Giducos', 'Purok Maisan 1', 'Business Permit', 2000.00, 'Paid', '2025-10-07 06:24:38', 'Cash', '2025-10-07 12:24:38'),
(7, 1, 'Anna Marei Manzanares', 'Purok Ipil Ipil', 'Permit', 2000.00, 'Paid', '2025-10-12 04:51:04', 'Cash', '2025-10-12 10:51:04'),
(18, 1, 'kate rosel alontaga', 'Purok Pukotan 1', 'Clearance', 1000.00, 'Paid', '2025-11-08 19:52:52', 'Cash', '2025-11-09 02:52:52'),
(19, 1, 'Christine Rebusit', 'Purok Kalubihan', 'Certificate', 154.00, 'Paid', '2025-11-08 19:56:01', 'Cash', '2025-11-09 02:56:01'),
(20, 1, 'Christine Rebusit', 'Purok Kalubihan', 'Certificate', 154.00, 'Paid', '2025-11-08 20:06:18', 'Cash', '2025-11-09 03:06:18'),
(21, 1, 'Christine Rebusit', 'Purok Kalubihan', 'Certificate', 154.00, 'Paid', '2025-11-08 20:20:59', 'Cash', '2025-11-09 03:20:59'),
(22, 1, 'Christine Rebusit', 'Purok Kalubihan', 'Certificate', 154.00, 'Paid', '2025-11-08 20:21:47', 'Cash', '2025-11-09 03:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `residents`
--

CREATE TABLE `residents` (
  `resident_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `middlename` varchar(20) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `purok` varchar(100) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `civil_status` enum('Single','Married','Widowed','Divorced') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `residents`
--

INSERT INTO `residents` (`resident_id`, `admin_id`, `firstname`, `middlename`, `lastname`, `purok`, `birth_date`, `gender`, `civil_status`, `created_at`) VALUES
(84, 1, 'NICOLE', 'C', 'Bates', 'Purok Bugsayan 1', '2006-02-01', 'Female', 'Single', '2025-10-15 06:47:47'),
(85, 1, 'Junie', 'V.', 'CHAVEZ', 'Purok Bugsayan 1', '2003-08-09', 'Male', 'Single', '2025-10-15 06:49:32'),
(86, 1, 'William', 'D.', 'Marabi', 'Purok Bugsayan 2', '2001-02-04', 'Male', 'Single', '2025-10-15 06:51:26'),
(87, 1, 'Michael', 'A.', 'Giducos', 'Purok Ipil Ipil', '2002-02-02', 'Female', 'Married', '2025-10-15 06:54:25'),
(88, 1, 'Marnie', 'B.', 'Derder', 'Purok Kamanggahan', '2000-02-01', 'Female', 'Married', '2025-10-15 06:55:36'),
(89, 1, 'Jamaica', 'R.', 'Santiago', 'Purok Kasagingan', '0000-00-00', 'Female', 'Single', '2025-10-15 06:57:48'),
(90, 1, 'Elmer', 'B.', 'Gidayawan', 'Purok Pukotan 1', '1990-11-08', 'Male', 'Single', '2025-10-15 07:05:58'),
(91, 1, 'Lance Gabrille', 'B.', 'Alontaga', 'Purok Pukotan 1', '2005-11-05', 'Male', 'Single', '2025-10-15 07:06:51'),
(92, 1, 'Kate Rosel', 'B.', 'Alontaga', 'Purok Pukotan 1', '2001-02-07', 'Female', 'Single', '2025-10-15 07:07:51'),
(93, 1, 'Meliza', 'A.', 'Tayactac', 'Purok Pukotan 1', '1986-12-06', 'Female', 'Single', '2025-10-15 07:13:38'),
(94, 1, 'Lilibeth', 'R.', 'Aropo', 'Purok Pukotan 1', '1990-03-08', 'Female', 'Married', '2025-10-15 07:17:07'),
(95, 1, 'Ronnie', 'D.', 'Aropo', 'Purok Pukotan 1', '1997-04-16', 'Male', 'Single', '2025-10-15 07:18:57'),
(96, 1, 'Juan', 'A.', 'Dela Cruz', 'Purok Pukotan 1', '1990-03-14', 'Male', 'Married', '2022-01-09 16:00:00'),
(97, 1, 'Maria', 'B.', 'Santos', 'Purok Pukotan 2', '1993-06-25', 'Female', 'Single', '2022-02-04 16:00:00'),
(98, 1, 'Jose', 'C.', 'Reyes', 'Purok Ipil Ipil', '1998-11-02', 'Male', 'Single', '2022-03-11 16:00:00'),
(99, 1, 'Ana', 'D.', 'Lopez', 'Purok Kalubihan', '2000-07-17', 'Female', 'Married', '2022-04-29 16:00:00'),
(100, 1, 'Carlo', 'E.', 'Garcia', 'Purok Kamanggahan', '2001-09-08', 'Male', 'Single', '2022-05-13 16:00:00'),
(101, 1, 'Ella', 'F.', 'Cruz', 'Purok Maisan 1', '1997-02-11', 'Female', 'Single', '2022-06-20 16:00:00'),
(102, 1, 'Bryan', 'G.', 'Ramos', 'Purok Maisan 2', '1995-10-10', 'Male', 'Married', '2022-07-17 16:00:00'),
(103, 1, 'Liza', 'H.', 'Perez', 'Purok Maisan 3', '2002-01-25', 'Female', 'Single', '2022-08-18 16:00:00'),
(104, 1, 'Nathan', 'I.', 'Mendoza', 'Purok Kasagingan', '1999-12-02', 'Male', 'Single', '2022-09-08 16:00:00'),
(105, 1, 'Grace', 'J.', 'Villanueva', 'Purok Bugsayan 1', '1989-05-27', 'Female', 'Married', '2022-10-04 16:00:00'),
(106, 1, 'Leo', 'K.', 'Castro', 'Purok Bugsayan 2', '1992-07-14', 'Male', 'Single', '2022-11-15 16:00:00'),
(107, 1, 'Patricia', 'L.', 'Navarro', 'Purok Pukotan 1', '2003-03-03', 'Female', 'Single', '2022-12-19 16:00:00'),
(108, 1, 'Ryan', 'M.', 'Domingo', 'Purok Kalubihan', '1994-01-11', 'Male', 'Married', '2022-09-11 16:00:00'),
(109, 1, 'Faye', 'N.', 'Valdez', 'Purok Kamanggahan', '2000-02-20', 'Female', 'Single', '2022-10-14 16:00:00'),
(110, 1, 'James', 'O.', 'Bautista', 'Purok Maisan 1', '1996-06-22', 'Male', 'Single', '2022-11-07 16:00:00'),
(111, 1, 'Ellaine', 'P.', 'Torres', 'Purok Maisan 3', '1991-04-05', 'Female', 'Married', '2022-12-24 16:00:00'),
(112, 1, 'Kyle', 'Q.', 'Flores', 'Purok Bugsayan 1', '1999-09-19', 'Male', 'Single', '2022-08-27 16:00:00'),
(113, 1, 'Rico', 'R.', 'Agustin', 'Purok Pukotan 2', '2001-01-09', 'Male', 'Single', '2023-01-14 16:00:00'),
(114, 1, 'Jasmine', 'S.', 'Estrada', 'Purok Ipil Ipil', '2004-02-13', 'Female', 'Single', '2023-02-24 16:00:00'),
(115, 1, 'Patrick', 'T.', 'Rosa', 'Purok Kalubihan', '1993-03-04', 'Male', 'Married', '2023-03-21 16:00:00'),
(116, 1, 'Lara', 'U.', 'Lim', 'Purok Kamanggahan', '1998-04-07', 'Female', 'Single', '2023-04-17 16:00:00'),
(117, 1, 'George', 'V.', 'Go', 'Purok Maisan 1', '1997-05-11', 'Male', 'Married', '2023-05-11 16:00:00'),
(118, 1, 'Diana', 'W.', 'Tan', 'Purok Maisan 2', '2000-06-23', 'Female', 'Single', '2023-06-23 16:00:00'),
(119, 1, 'Harold', 'X.', 'Uy', 'Purok Maisan 3', '2002-07-15', 'Male', 'Single', '2023-07-09 16:00:00'),
(120, 1, 'Ivy', 'Y.', 'Gomez', 'Purok Kasagingan', '1994-08-09', 'Female', 'Married', '2023-08-11 16:00:00'),
(121, 1, 'Earl', 'Z.', 'Vega', 'Purok Bugsayan 1', '2003-09-30', 'Male', 'Single', '2023-09-16 16:00:00'),
(122, 1, 'Tina', 'A.', 'Lopez', 'Purok Bugsayan 2', '1995-10-28', 'Female', 'Single', '2023-10-03 16:00:00'),
(123, 1, 'Nico', 'B.', 'Mata', 'Purok Pukotan 1', '2001-11-02', 'Male', 'Married', '2023-11-10 16:00:00'),
(124, 1, 'Bianca', 'C.', 'Reyes', 'Purok Pukotan 2', '1996-12-01', 'Female', 'Single', '2023-12-20 16:00:00'),
(125, 1, 'Sam', 'D.', 'Delos Reyes', 'Purok Kamanggahan', '1999-03-03', 'Male', 'Single', '2023-09-05 16:00:00'),
(126, 1, 'Cindy', 'E.', 'Lim', 'Purok Maisan 2', '1997-05-05', 'Female', 'Single', '2023-10-08 16:00:00'),
(127, 1, 'Oscar', 'F.', 'Tan', 'Purok Kasagingan', '1998-07-07', 'Male', 'Married', '2023-11-17 16:00:00'),
(128, 1, 'Fiona', 'G.', 'Go', 'Purok Bugsayan 1', '1992-08-08', 'Female', 'Single', '2023-12-24 16:00:00'),
(129, 1, 'Ralph', 'H.', 'Villanueva', 'Purok Bugsayan 2', '1993-09-09', 'Male', 'Single', '2023-08-15 16:00:00'),
(130, 1, 'JunMark', 'Batiancila', 'Giducos', 'Purok Ipil Ipil', '2004-12-04', 'Male', 'Single', '2024-05-19 16:00:00'),
(131, 1, 'Leah', 'I.', 'Santos', 'Purok Pukotan 1', '1995-11-12', 'Female', 'Married', '2024-01-21 16:00:00'),
(132, 1, 'Mark', 'J.', 'Dela Cruz', 'Purok Pukotan 2', '1990-03-10', 'Male', 'Single', '2024-02-14 16:00:00'),
(133, 1, 'Clarice', 'K.', 'Ramos', 'Purok Kalubihan', '1994-04-25', 'Female', 'Single', '2024-03-17 16:00:00'),
(134, 1, 'Vince', 'L.', 'Perez', 'Purok Kamanggahan', '1999-06-09', 'Male', 'Single', '2024-04-09 16:00:00'),
(135, 1, 'Bea', 'M.', 'Lopez', 'Purok Maisan 1', '2001-07-07', 'Female', 'Single', '2024-05-04 16:00:00'),
(136, 1, 'Carl', 'N.', 'Garcia', 'Purok Maisan 2', '2003-08-11', 'Male', 'Single', '2024-06-14 16:00:00'),
(137, 1, 'Hazel', 'O.', 'Torres', 'Purok Maisan 3', '1998-09-14', 'Female', 'Single', '2024-07-09 16:00:00'),
(138, 1, 'Ian', 'P.', 'Flores', 'Purok Kasagingan', '1996-10-03', 'Male', 'Married', '2024-08-08 16:00:00'),
(139, 1, 'Daisy', 'Q.', 'Navarro', 'Purok Bugsayan 1', '1993-11-21', 'Female', 'Single', '2024-09-19 16:00:00'),
(140, 1, 'Lloyd', 'R.', 'Villanueva', 'Purok Bugsayan 2', '1997-12-31', 'Male', 'Single', '2024-10-17 16:00:00'),
(141, 1, 'Gina', 'S.', 'Tan', 'Purok Pukotan 1', '1992-01-15', 'Female', 'Single', '2024-11-07 16:00:00'),
(142, 1, 'Kevin', 'T.', 'Agustin', 'Purok Kalubihan', '2000-02-28', 'Male', 'Single', '2024-12-11 16:00:00'),
(143, 1, 'Mae', 'U.', 'Reyes', 'Purok Kamanggahan', '1994-03-22', 'Female', 'Single', '2024-06-10 16:00:00'),
(144, 1, 'Tony', 'V.', 'Rosa', 'Purok Maisan 1', '1998-04-19', 'Male', 'Married', '2024-07-24 16:00:00'),
(145, 1, 'Shane', 'W.', 'Bautista', 'Purok Kasagingan', '1999-09-09', 'Female', 'Single', '2024-09-29 16:00:00'),
(146, 1, 'Juan', 'A.', 'Dela Cruz', 'Purok Pukotan 1', '1990-03-14', 'Male', 'Married', '2022-01-09 16:00:00'),
(147, 1, 'Maria', 'B.', 'Santos', 'Purok Pukotan 2', '1993-06-25', 'Female', 'Single', '2022-02-04 16:00:00'),
(148, 1, 'Jose', 'C.', 'Reyes', 'Purok Ipil Ipil', '1998-11-02', 'Male', 'Single', '2022-03-11 16:00:00'),
(149, 1, 'Ana', 'D.', 'Lopez', 'Purok Kalubihan', '2000-07-17', 'Female', 'Widowed', '2022-04-29 16:00:00'),
(150, 1, 'Carlo', 'E.', 'Garcia', 'Purok Kamanggahan', '2001-09-08', 'Male', 'Divorced', '2022-05-13 16:00:00'),
(151, 1, 'Ella', 'F.', 'Cruz', 'Purok Maisan 1', '1997-02-11', 'Female', 'Single', '2022-06-20 16:00:00'),
(152, 1, 'Bryan', 'G.', 'Ramos', 'Purok Maisan 2', '1995-10-10', 'Male', 'Married', '2022-07-17 16:00:00'),
(153, 1, 'Liza', 'H.', 'Perez', 'Purok Maisan 3', '2002-01-25', 'Female', 'Single', '2022-08-18 16:00:00'),
(154, 1, 'Nathan', 'I.', 'Mendoza', 'Purok Kasagingan', '1999-12-02', 'Male', 'Widowed', '2022-09-08 16:00:00'),
(155, 1, 'Grace', 'J.', 'Villanueva', 'Purok Bugsayan 1', '1989-05-27', 'Female', 'Divorced', '2022-10-04 16:00:00'),
(156, 1, 'Leo', 'K.', 'Castro', 'Purok Bugsayan 2', '1992-07-14', 'Male', 'Married', '2022-11-15 16:00:00'),
(157, 1, 'Patricia', 'L.', 'Navarro', 'Purok Pukotan 1', '2003-03-03', 'Female', 'Single', '2022-12-19 16:00:00'),
(158, 1, 'Ryan', 'M.', 'Domingo', 'Purok Kalubihan', '1994-01-11', 'Male', 'Widowed', '2022-09-11 16:00:00'),
(159, 1, 'Faye', 'N.', 'Valdez', 'Purok Kamanggahan', '2000-02-20', 'Female', 'Divorced', '2022-10-14 16:00:00'),
(160, 1, 'James', 'O.', 'Bautista', 'Purok Maisan 1', '1996-06-22', 'Male', 'Single', '2022-11-07 16:00:00'),
(161, 1, 'Ellaine', 'P.', 'Torres', 'Purok Maisan 3', '1991-04-05', 'Female', 'Married', '2022-12-24 16:00:00'),
(162, 1, 'Kyle', 'Q.', 'Flores', 'Purok Bugsayan 1', '1999-09-19', 'Male', 'Divorced', '2022-08-27 16:00:00'),
(163, 1, 'Rico', 'R.', 'Agustin', 'Purok Pukotan 2', '2001-01-09', 'Male', 'Single', '2023-01-14 16:00:00'),
(164, 1, 'Jasmine', 'S.', 'Estrada', 'Purok Ipil Ipil', '2004-02-13', 'Female', 'Married', '2023-02-24 16:00:00'),
(165, 1, 'Patrick', 'T.', 'Rosa', 'Purok Kalubihan', '1993-03-04', 'Male', 'Widowed', '2023-03-21 16:00:00'),
(166, 1, 'Lara', 'U.', 'Lim', 'Purok Kamanggahan', '1998-04-07', 'Female', 'Divorced', '2023-04-17 16:00:00'),
(167, 1, 'George', 'V.', 'Go', 'Purok Maisan 1', '1997-05-11', 'Male', 'Married', '2023-05-11 16:00:00'),
(168, 1, 'Diana', 'W.', 'Tan', 'Purok Maisan 2', '2000-06-23', 'Female', 'Single', '2023-06-23 16:00:00'),
(169, 1, 'Harold', 'X.', 'Uy', 'Purok Maisan 3', '2002-07-15', 'Male', 'Single', '2023-07-09 16:00:00'),
(170, 1, 'Ivy', 'Y.', 'Gomez', 'Purok Kasagingan', '1994-08-09', 'Female', 'Married', '2023-08-11 16:00:00'),
(171, 1, 'Earl', 'Z.', 'Vega', 'Purok Bugsayan 1', '2003-09-30', 'Male', 'Widowed', '2023-09-16 16:00:00'),
(172, 1, 'Tina', 'A.', 'Lopez', 'Purok Bugsayan 2', '1995-10-28', 'Female', 'Divorced', '2023-10-03 16:00:00'),
(173, 1, 'Nico', 'B.', 'Mata', 'Purok Pukotan 1', '2001-11-02', 'Male', 'Single', '2023-11-10 16:00:00'),
(174, 1, 'Bianca', 'C.', 'Reyes', 'Purok Pukotan 2', '1996-12-01', 'Female', 'Married', '2023-12-20 16:00:00'),
(175, 1, 'Sam', 'D.', 'Delos Reyes', 'Purok Kamanggahan', '1999-03-03', 'Male', 'Divorced', '2023-09-05 16:00:00'),
(176, 1, 'Cindy', 'E.', 'Lim', 'Purok Maisan 2', '1997-05-05', 'Female', 'Widowed', '2023-10-08 16:00:00'),
(177, 1, 'Oscar', 'F.', 'Tan', 'Purok Kasagingan', '1998-07-07', 'Male', 'Single', '2023-11-17 16:00:00'),
(178, 1, 'Fiona', 'G.', 'Go', 'Purok Bugsayan 1', '1992-08-08', 'Female', 'Married', '2023-12-24 16:00:00'),
(179, 1, 'Ralph', 'H.', 'Villanueva', 'Purok Bugsayan 2', '1993-09-09', 'Male', 'Widowed', '2023-08-15 16:00:00'),
(180, 1, 'JunMark', 'Batiancila', 'Giducos', 'Purok Ipil Ipil', '2004-12-04', 'Male', 'Single', '2024-05-19 16:00:00'),
(181, 1, 'Leah', 'I.', 'Santos', 'Purok Pukotan 1', '1995-11-12', 'Female', 'Divorced', '2024-01-21 16:00:00'),
(182, 1, 'Mark', 'J.', 'Dela Cruz', 'Purok Pukotan 2', '1990-03-10', 'Male', 'Married', '2024-02-14 16:00:00'),
(183, 1, 'Clarice', 'K.', 'Ramos', 'Purok Kalubihan', '1994-04-25', 'Female', 'Widowed', '2024-03-17 16:00:00'),
(184, 1, 'Vince', 'L.', 'Perez', 'Purok Kamanggahan', '1999-06-09', 'Male', 'Single', '2024-04-09 16:00:00'),
(185, 1, 'Bea', 'M.', 'Lopez', 'Purok Maisan 1', '2001-07-07', 'Female', 'Married', '2024-05-04 16:00:00'),
(186, 1, 'Carl', 'N.', 'Garcia', 'Purok Maisan 2', '2003-08-11', 'Male', 'Divorced', '2024-06-14 16:00:00'),
(187, 1, 'Hazel', 'O.', 'Torres', 'Purok Maisan 3', '1998-09-14', 'Female', 'Widowed', '2024-07-09 16:00:00'),
(188, 1, 'Ian', 'P.', 'Flores', 'Purok Kasagingan', '1996-10-03', 'Male', 'Married', '2024-08-08 16:00:00'),
(189, 1, 'Daisy', 'Q.', 'Navarro', 'Purok Bugsayan 1', '1993-11-21', 'Female', 'Single', '2024-09-19 16:00:00'),
(190, 1, 'Lloyd', 'R.', 'Villanueva', 'Purok Bugsayan 2', '1997-12-31', 'Male', 'Married', '2024-10-17 16:00:00'),
(191, 1, 'Gina', 'S.', 'Tan', 'Purok Pukotan 1', '1992-01-15', 'Female', 'Single', '2024-11-07 16:00:00'),
(192, 1, 'Kevin', 'T.', 'Agustin', 'Purok Kalubihan', '2000-02-28', 'Male', 'Widowed', '2024-12-11 16:00:00'),
(193, 1, 'Mae', 'U.', 'Reyes', 'Purok Kamanggahan', '1994-03-22', 'Female', 'Divorced', '2024-06-10 16:00:00'),
(194, 1, 'Tony', 'V.', 'Rosa', 'Purok Maisan 1', '1998-04-19', 'Male', 'Married', '2024-07-24 16:00:00'),
(195, 1, 'Shane', 'W.', 'Bautista', 'Purok Kasagingan', '1999-09-09', 'Female', 'Single', '2024-09-29 16:00:00'),
(196, 1, 'Noel', 'A.', 'Villanueva', 'Purok Pukotan 1', '1997-03-03', 'Male', 'Married', '2025-01-11 16:00:00'),
(197, 1, 'Jenny', 'B.', 'Reyes', 'Purok Pukotan 2', '1999-04-14', 'Female', 'Single', '2025-02-15 16:00:00'),
(198, 1, 'Clark', 'C.', 'Lopez', 'Purok Ipil Ipil', '2000-05-15', 'Male', 'Widowed', '2025-03-20 16:00:00'),
(199, 1, 'Rhea', 'D.', 'Santos', 'Purok Kalubihan', '1998-06-06', 'Female', 'Divorced', '2025-04-09 16:00:00'),
(200, 1, 'Harvey', 'E.', 'Torres', 'Purok Kamanggahan', '1995-07-09', 'Male', 'Single', '2025-05-11 16:00:00'),
(201, 1, 'Clara', 'F.', 'Mendoza', 'Purok Maisan 1', '2002-08-20', 'Female', 'Married', '2025-06-16 16:00:00'),
(202, 1, 'Roland', 'G.', 'Cruz', 'Purok Maisan 2', '1993-09-11', 'Male', 'Divorced', '2025-07-18 16:00:00'),
(203, 1, 'Andrea', 'H.', 'Valdez', 'Purok Maisan 3', '2001-10-23', 'Female', 'Widowed', '2025-08-24 16:00:00'),
(204, 1, 'Jason', 'I.', 'Go', 'Purok Kasagingan', '1994-11-12', 'Male', 'Married', '2025-09-06 16:00:00'),
(205, 1, 'Nina', 'J.', 'Tan', 'Purok Bugsayan 1', '1996-12-03', 'Female', 'Single', '2025-10-09 16:00:00'),
(206, 1, 'Allan', 'K.', 'Castro', 'Purok Bugsayan 2', '1991-01-22', 'Male', 'Widowed', '2025-11-14 16:00:00'),
(207, 1, 'Paula', 'L.', 'Domingo', 'Purok Pukotan 1', '1993-02-28', 'Female', 'Married', '2025-01-27 16:00:00'),
(208, 1, 'Miguel', 'M.', 'Ramos', 'Purok Kalubihan', '1995-03-25', 'Male', 'Divorced', '2025-02-13 16:00:00'),
(209, 1, 'Katrina', 'N.', 'Bautista', 'Purok Kamanggahan', '2000-04-20', 'Female', 'Single', '2025-03-18 16:00:00'),
(210, 1, 'Owen', 'O.', 'Perez', 'Purok Maisan 1', '2003-05-30', 'Male', 'Married', '2025-04-24 16:00:00'),
(211, 1, 'Louise', 'P.', 'Agustin', 'Purok Maisan 2', '1998-06-21', 'Female', 'Widowed', '2025-05-27 16:00:00'),
(212, 1, 'Daniel', 'Q.', 'Villanueva', 'Purok Bugsayan 1', '1999-07-19', 'Male', 'Single', '2025-06-29 16:00:00'),
(213, 1, 'Hannah', 'R.', 'Navarro', 'Purok Bugsayan 2', '1996-08-16', 'Female', 'Divorced', '2025-07-24 16:00:00'),
(214, 1, 'Victor', 'S.', 'Reyes', 'Purok Ipil Ipil', '1994-09-18', 'Male', 'Married', '2025-08-13 16:00:00'),
(215, 1, 'Melanie', 'T.', 'Lopez', 'Purok Kasagingan', '1993-10-22', 'Female', 'Single', '2025-09-08 16:00:00'),
(216, 1, 'Daisy', 'Q.', 'Navarro', 'Purok Bugsayan 1', '1993-11-21', 'Female', 'Single', '2024-09-19 16:00:00'),
(217, 1, 'Lloyd', 'R.', 'Villanueva', 'Purok Bugsayan 2', '1997-12-31', 'Male', 'Married', '2024-10-17 16:00:00'),
(218, 1, 'Gina', 'S.', 'Tan', 'Purok Pukotan 1', '1992-01-15', 'Female', 'Single', '2024-11-07 16:00:00'),
(219, 1, 'Kevin', 'T.', 'Agustin', 'Purok Kalubihan', '2000-02-28', 'Male', 'Widowed', '2024-12-11 16:00:00'),
(220, 1, 'Mae', 'U.', 'Reyes', 'Purok Kamanggahan', '1994-03-22', 'Female', 'Divorced', '2024-06-10 16:00:00'),
(221, 1, 'Tony', 'V.', 'Rosa', 'Purok Maisan 1', '1998-04-19', 'Male', 'Married', '2024-07-24 16:00:00'),
(222, 1, 'Shane', 'W.', 'Bautista', 'Purok Kasagingan', '1999-09-09', 'Female', 'Single', '2024-09-29 16:00:00'),
(223, 1, 'Noel', 'A.', 'Villanueva', 'Purok Pukotan 1', '1997-03-03', 'Male', 'Married', '2025-01-11 16:00:00'),
(224, 1, 'Jenny', 'B.', 'Reyes', 'Purok Pukotan 2', '1999-04-14', 'Female', 'Single', '2025-02-15 16:00:00'),
(225, 1, 'Clark', 'C.', 'Lopez', 'Purok Ipil Ipil', '2000-05-15', 'Male', 'Widowed', '2025-03-20 16:00:00'),
(226, 1, 'Rhea', 'D.', 'Santos', 'Purok Kalubihan', '1998-06-06', 'Female', 'Divorced', '2025-04-09 16:00:00'),
(227, 1, 'Harvey', 'E.', 'Torres', 'Purok Kamanggahan', '1995-07-09', 'Male', 'Single', '2026-05-11 16:00:00'),
(228, 1, 'Clara', 'F.', 'Mendoza', 'Purok Maisan 1', '2002-08-20', 'Female', 'Married', '2026-06-16 16:00:00'),
(229, 1, 'Roland', 'G.', 'Cruz', 'Purok Maisan 2', '1993-09-11', 'Male', 'Divorced', '2026-07-18 16:00:00'),
(230, 1, 'Andrea', 'H.', 'Valdez', 'Purok Maisan 3', '2001-10-23', 'Female', 'Widowed', '2026-08-24 16:00:00'),
(231, 1, 'Jason', 'I.', 'Go', 'Purok Kasagingan', '1994-11-12', 'Male', 'Married', '2026-09-06 16:00:00'),
(232, 1, 'Nina', 'J.', 'Tan', 'Purok Bugsayan 1', '1996-12-03', 'Female', 'Single', '2026-10-09 16:00:00'),
(233, 1, 'Allan', 'K.', 'Castro', 'Purok Bugsayan 2', '1991-01-22', 'Male', 'Widowed', '2026-11-14 16:00:00'),
(234, 1, 'Paula', 'L.', 'Domingo', 'Purok Pukotan 1', '1993-02-28', 'Female', 'Married', '2026-01-27 16:00:00'),
(235, 1, 'Miguel', 'M.', 'Ramos', 'Purok Kalubihan', '1995-03-25', 'Male', 'Divorced', '2026-02-13 16:00:00'),
(236, 1, 'Katrina', 'N.', 'Bautista', 'Purok Kamanggahan', '2000-04-20', 'Female', 'Single', '2026-03-18 16:00:00'),
(237, 1, 'Owen', 'O.', 'Perez', 'Purok Maisan 1', '2003-05-30', 'Male', 'Married', '2026-04-24 16:00:00'),
(238, 1, 'Louise', 'P.', 'Agustin', 'Purok Maisan 2', '1998-06-21', 'Female', 'Widowed', '2026-05-27 16:00:00'),
(239, 1, 'Daniel', 'Q.', 'Villanueva', 'Purok Bugsayan 1', '1999-07-19', 'Male', 'Single', '2026-06-29 16:00:00'),
(240, 1, 'Hannah', 'R.', 'Navarro', 'Purok Bugsayan 2', '1996-08-16', 'Female', 'Divorced', '2026-07-24 16:00:00'),
(241, 1, 'Victor', 'S.', 'Reyes', 'Purok Ipil Ipil', '1994-09-18', 'Male', 'Married', '2026-08-13 16:00:00'),
(242, 1, 'Melanie', 'T.', 'Lopez', 'Purok Kasagingan', '1993-10-22', 'Female', 'Single', '2026-09-08 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users_account`
--

CREATE TABLE `users_account` (
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_account`
--

INSERT INTO `users_account` (`user_id`, `admin_id`, `name`, `password`, `created_at`) VALUES
(7, 1, 'kate', '0000iiii', '2025-10-08 14:02:27'),
(11, 1, 'argentina', '1234cute', '2025-10-31 05:23:02'),
(12, 1, 'Anna Marei', 'bhie1234', '2025-11-07 11:19:18'),
(14, 1, 'Josa', 'tttt1111', '2025-11-07 11:24:01');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_barangay_officials`
-- (See below for the actual view)
--
CREATE TABLE `vw_barangay_officials` (
`officials_id` int(11)
,`admin_id` int(11)
,`firstname` varchar(20)
,`middlename` varchar(20)
,`lastname` varchar(20)
,`birth_date` date
,`age` bigint(21)
,`position` varchar(20)
,`term_start` date
,`term_end` date
,`contact` varchar(11)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Structure for view `vw_barangay_officials`
--
DROP TABLE IF EXISTS `vw_barangay_officials`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_barangay_officials`  AS SELECT `o`.`officials_id` AS `officials_id`, `o`.`admin_id` AS `admin_id`, `o`.`firstname` AS `firstname`, `o`.`middlename` AS `middlename`, `o`.`lastname` AS `lastname`, `o`.`birth_date` AS `birth_date`, timestampdiff(YEAR,`o`.`birth_date`,curdate()) AS `age`, `o`.`position` AS `position`, `o`.`term_start` AS `term_start`, `o`.`term_end` AS `term_end`, `o`.`contact` AS `contact`, `o`.`created_at` AS `created_at` FROM `barangay_officials` AS `o` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `archive_barangay_assistance`
--
ALTER TABLE `archive_barangay_assistance`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_barangay_blotter`
--
ALTER TABLE `archive_barangay_blotter`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_barangay_certificate`
--
ALTER TABLE `archive_barangay_certificate`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_barangay_clearance`
--
ALTER TABLE `archive_barangay_clearance`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_barangay_indigency`
--
ALTER TABLE `archive_barangay_indigency`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_barangay_issues`
--
ALTER TABLE `archive_barangay_issues`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_barangay_officials`
--
ALTER TABLE `archive_barangay_officials`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_barangay_tanod`
--
ALTER TABLE `archive_barangay_tanod`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_bhw`
--
ALTER TABLE `archive_bhw`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_business_closure`
--
ALTER TABLE `archive_business_closure`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_business_permits`
--
ALTER TABLE `archive_business_permits`
  ADD PRIMARY KEY (`archive_id`),
  ADD KEY `archive_business_permits_ibfk_1` (`permit_id`);

--
-- Indexes for table `archive_construction_clearance`
--
ALTER TABLE `archive_construction_clearance`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_fencing_permit`
--
ALTER TABLE `archive_fencing_permit`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_lupon_tagapamayapa`
--
ALTER TABLE `archive_lupon_tagapamayapa`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_ownership`
--
ALTER TABLE `archive_ownership`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_permit_2daysbenefitdance`
--
ALTER TABLE `archive_permit_2daysbenefitdance`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_permit_streetdancing`
--
ALTER TABLE `archive_permit_streetdancing`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archive_solid_waste_management`
--
ALTER TABLE `archive_solid_waste_management`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `barangay_assistance`
--
ALTER TABLE `barangay_assistance`
  ADD PRIMARY KEY (`assistance_id`),
  ADD KEY `assistance_user_ibtk_1` (`user_id`),
  ADD KEY `admin_ibtk_1` (`admin_id`),
  ADD KEY `archive_assistance_1` (`archive_id`);

--
-- Indexes for table `barangay_blotter`
--
ALTER TABLE `barangay_blotter`
  ADD PRIMARY KEY (`blotter_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `archive_blotter_ibtk_2` (`archive_id`),
  ADD KEY `admin_ibtk_2` (`admin_id`);

--
-- Indexes for table `barangay_budget`
--
ALTER TABLE `barangay_budget`
  ADD PRIMARY KEY (`budget_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `barangay_certificate`
--
ALTER TABLE `barangay_certificate`
  ADD PRIMARY KEY (`certificate_id`),
  ADD KEY `certificate_ibtk_1` (`user_id`),
  ADD KEY `admin_certificate_ibtk_6` (`admin_id`),
  ADD KEY `archived_ibtk_7` (`archived_id`);

--
-- Indexes for table `barangay_clearance`
--
ALTER TABLE `barangay_clearance`
  ADD PRIMARY KEY (`clearance_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `archive_ibtk_3` (`archive_id`),
  ADD KEY `admin_ibtk_3` (`admin_id`);

--
-- Indexes for table `barangay_construction_clearance`
--
ALTER TABLE `barangay_construction_clearance`
  ADD PRIMARY KEY (`construction_id`),
  ADD KEY `admin_ibtk_6` (`admin_id`),
  ADD KEY `user_ibtk_1` (`user_id`),
  ADD KEY `archived_ibtk_6` (`archived_id`);

--
-- Indexes for table `barangay_indigency`
--
ALTER TABLE `barangay_indigency`
  ADD PRIMARY KEY (`indigency_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `archive_ibtk_2` (`archive_id`),
  ADD KEY `admin_ibtk_4` (`admin_id`);

--
-- Indexes for table `barangay_issues`
--
ALTER TABLE `barangay_issues`
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `archive_issue_ibtk_2` (`archive_id`);

--
-- Indexes for table `barangay_officials`
--
ALTER TABLE `barangay_officials`
  ADD PRIMARY KEY (`officials_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `officials_ibfk_2` (`archive_id`);

--
-- Indexes for table `barangay_permit_2days_benefit_dance`
--
ALTER TABLE `barangay_permit_2days_benefit_dance`
  ADD PRIMARY KEY (`dancing_id`),
  ADD KEY `admin_ibtk_7` (`admin_id`),
  ADD KEY `user_ibtk_2` (`user_id`),
  ADD KEY `archived_ibtk_7` (`archived_id`);

--
-- Indexes for table `barangay_permit_streetdancing`
--
ALTER TABLE `barangay_permit_streetdancing`
  ADD PRIMARY KEY (`dancing_id`),
  ADD KEY `admin_ibtk_8` (`admin_id`),
  ADD KEY `user_ibtk_3` (`user_id`),
  ADD KEY `archived_ibtk_8` (`archived_id`);

--
-- Indexes for table `barangay_tanod`
--
ALTER TABLE `barangay_tanod`
  ADD PRIMARY KEY (`tanod_id`),
  ADD KEY `admin_ibtk1` (`admin_id`),
  ADD KEY `archive_ibtk10` (`archive_id`);

--
-- Indexes for table `bhw`
--
ALTER TABLE `bhw`
  ADD PRIMARY KEY (`bhw_id`),
  ADD KEY `archive_ibtk11` (`archive_id`);

--
-- Indexes for table `business_closure`
--
ALTER TABLE `business_closure`
  ADD PRIMARY KEY (`closure_id`),
  ADD KEY `admin_ibtk_9` (`admin_id`),
  ADD KEY `user_ibtk_4` (`user_id`),
  ADD KEY `archived_ibtk_10` (`archived_id`);

--
-- Indexes for table `business_permits`
--
ALTER TABLE `business_permits`
  ADD PRIMARY KEY (`permit_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `permit_ibtk_1` (`archive_id`),
  ADD KEY `admin_ibtk_5` (`admin_id`);

--
-- Indexes for table `certification_of_ownership`
--
ALTER TABLE `certification_of_ownership`
  ADD PRIMARY KEY (`ownership_id`),
  ADD KEY `admin_ibtk_10` (`admin_id`),
  ADD KEY `user_ibtk_5` (`user_id`),
  ADD KEY `archived_ibtk_12` (`archived_id`);

--
-- Indexes for table `cert_for_solid_waste_management`
--
ALTER TABLE `cert_for_solid_waste_management`
  ADD PRIMARY KEY (`waste_id`),
  ADD KEY `admin_ibtk_11` (`admin_id`),
  ADD KEY `user_ibtk_6` (`user_id`),
  ADD KEY `archived_ibtk_13` (`archived_id`);

--
-- Indexes for table `fencing_permit`
--
ALTER TABLE `fencing_permit`
  ADD PRIMARY KEY (`fencing_id`),
  ADD KEY `admin_ibtk_12` (`admin_id`),
  ADD KEY `user_ibtk_7` (`user_id`),
  ADD KEY `archived_ibtk_14` (`archived_id`);

--
-- Indexes for table `lupon_tagapamayapa`
--
ALTER TABLE `lupon_tagapamayapa`
  ADD PRIMARY KEY (`lupon_id`),
  ADD KEY `admin_ibtk2` (`admin_id`),
  ADD KEY `archive_ibtk12` (`archive_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notif_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `payment_records`
--
ALTER TABLE `payment_records`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `residents`
--
ALTER TABLE `residents`
  ADD PRIMARY KEY (`resident_id`),
  ADD KEY `resident_ibfk_1` (`admin_id`);

--
-- Indexes for table `users_account`
--
ALTER TABLE `users_account`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `users_account_ibfk_1` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archive_barangay_assistance`
--
ALTER TABLE `archive_barangay_assistance`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `archive_barangay_blotter`
--
ALTER TABLE `archive_barangay_blotter`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `archive_barangay_certificate`
--
ALTER TABLE `archive_barangay_certificate`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `archive_barangay_clearance`
--
ALTER TABLE `archive_barangay_clearance`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `archive_barangay_indigency`
--
ALTER TABLE `archive_barangay_indigency`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `archive_barangay_issues`
--
ALTER TABLE `archive_barangay_issues`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `archive_barangay_officials`
--
ALTER TABLE `archive_barangay_officials`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `archive_barangay_tanod`
--
ALTER TABLE `archive_barangay_tanod`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `archive_bhw`
--
ALTER TABLE `archive_bhw`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `archive_business_closure`
--
ALTER TABLE `archive_business_closure`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `archive_business_permits`
--
ALTER TABLE `archive_business_permits`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `archive_construction_clearance`
--
ALTER TABLE `archive_construction_clearance`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `archive_fencing_permit`
--
ALTER TABLE `archive_fencing_permit`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `archive_lupon_tagapamayapa`
--
ALTER TABLE `archive_lupon_tagapamayapa`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `archive_ownership`
--
ALTER TABLE `archive_ownership`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `archive_permit_2daysbenefitdance`
--
ALTER TABLE `archive_permit_2daysbenefitdance`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `archive_permit_streetdancing`
--
ALTER TABLE `archive_permit_streetdancing`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `archive_solid_waste_management`
--
ALTER TABLE `archive_solid_waste_management`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `barangay_assistance`
--
ALTER TABLE `barangay_assistance`
  MODIFY `assistance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `barangay_blotter`
--
ALTER TABLE `barangay_blotter`
  MODIFY `blotter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `barangay_budget`
--
ALTER TABLE `barangay_budget`
  MODIFY `budget_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `barangay_certificate`
--
ALTER TABLE `barangay_certificate`
  MODIFY `certificate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `barangay_clearance`
--
ALTER TABLE `barangay_clearance`
  MODIFY `clearance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `barangay_construction_clearance`
--
ALTER TABLE `barangay_construction_clearance`
  MODIFY `construction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `barangay_indigency`
--
ALTER TABLE `barangay_indigency`
  MODIFY `indigency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `barangay_issues`
--
ALTER TABLE `barangay_issues`
  MODIFY `issue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barangay_officials`
--
ALTER TABLE `barangay_officials`
  MODIFY `officials_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `barangay_permit_2days_benefit_dance`
--
ALTER TABLE `barangay_permit_2days_benefit_dance`
  MODIFY `dancing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `barangay_permit_streetdancing`
--
ALTER TABLE `barangay_permit_streetdancing`
  MODIFY `dancing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `barangay_tanod`
--
ALTER TABLE `barangay_tanod`
  MODIFY `tanod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `bhw`
--
ALTER TABLE `bhw`
  MODIFY `bhw_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `business_closure`
--
ALTER TABLE `business_closure`
  MODIFY `closure_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `business_permits`
--
ALTER TABLE `business_permits`
  MODIFY `permit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `certification_of_ownership`
--
ALTER TABLE `certification_of_ownership`
  MODIFY `ownership_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cert_for_solid_waste_management`
--
ALTER TABLE `cert_for_solid_waste_management`
  MODIFY `waste_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fencing_permit`
--
ALTER TABLE `fencing_permit`
  MODIFY `fencing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `lupon_tagapamayapa`
--
ALTER TABLE `lupon_tagapamayapa`
  MODIFY `lupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notif_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_records`
--
ALTER TABLE `payment_records`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `residents`
--
ALTER TABLE `residents`
  MODIFY `resident_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `users_account`
--
ALTER TABLE `users_account`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barangay_assistance`
--
ALTER TABLE `barangay_assistance`
  ADD CONSTRAINT `admin_ibtk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archive_assistance_1` FOREIGN KEY (`archive_id`) REFERENCES `archive_barangay_assistance` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assistance_user_ibtk_1` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_blotter`
--
ALTER TABLE `barangay_blotter`
  ADD CONSTRAINT `admin_ibtk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archive_blotter_ibtk_2` FOREIGN KEY (`archive_id`) REFERENCES `archive_barangay_blotter` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barangay_blotter_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_budget`
--
ALTER TABLE `barangay_budget`
  ADD CONSTRAINT `barangay_budget_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_certificate`
--
ALTER TABLE `barangay_certificate`
  ADD CONSTRAINT `admin_certificate_ibtk_6` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archived_ibtk_5` FOREIGN KEY (`archived_id`) REFERENCES `archive_barangay_certificate` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificate_ibtk_1` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_clearance`
--
ALTER TABLE `barangay_clearance`
  ADD CONSTRAINT `admin_ibtk_3` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archive_ibtk_3` FOREIGN KEY (`archive_id`) REFERENCES `archive_barangay_clearance` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barangay_clearance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_construction_clearance`
--
ALTER TABLE `barangay_construction_clearance`
  ADD CONSTRAINT `admin_ibtk_6` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archived_ibtk_6` FOREIGN KEY (`archived_id`) REFERENCES `archive_construction_clearance` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_ibtk_1` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_indigency`
--
ALTER TABLE `barangay_indigency`
  ADD CONSTRAINT `admin_ibtk_4` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archive_ibtk_2` FOREIGN KEY (`archive_id`) REFERENCES `archive_barangay_indigency` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barangay_indigency_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_issues`
--
ALTER TABLE `barangay_issues`
  ADD CONSTRAINT `archive_issue_ibtk_2` FOREIGN KEY (`archive_id`) REFERENCES `archive_barangay_issues` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barangay_issues_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_officials`
--
ALTER TABLE `barangay_officials`
  ADD CONSTRAINT `barangay_officials_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `officials_ibfk_2` FOREIGN KEY (`archive_id`) REFERENCES `archive_barangay_officials` (`archive_id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_permit_2days_benefit_dance`
--
ALTER TABLE `barangay_permit_2days_benefit_dance`
  ADD CONSTRAINT `admin_ibtk_7` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archived_ibtk_7` FOREIGN KEY (`archived_id`) REFERENCES `archive_permit_2daysbenefitdance` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_ibtk_2` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_permit_streetdancing`
--
ALTER TABLE `barangay_permit_streetdancing`
  ADD CONSTRAINT `admin_ibtk_8` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archived_ibtk_8` FOREIGN KEY (`archived_id`) REFERENCES `archive_permit_streetdancing` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_ibtk_3` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_tanod`
--
ALTER TABLE `barangay_tanod`
  ADD CONSTRAINT `admin_ibtk1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_ibtk5` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archive_ibtk10` FOREIGN KEY (`archive_id`) REFERENCES `archive_barangay_tanod` (`archive_id`) ON DELETE CASCADE;

--
-- Constraints for table `bhw`
--
ALTER TABLE `bhw`
  ADD CONSTRAINT `archive_ibtk11` FOREIGN KEY (`archive_id`) REFERENCES `archive_bhw` (`archive_id`) ON DELETE CASCADE;

--
-- Constraints for table `business_closure`
--
ALTER TABLE `business_closure`
  ADD CONSTRAINT `admin_ibtk_9` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archived_ibtk_10` FOREIGN KEY (`archived_id`) REFERENCES `archive_business_closure` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_ibtk_4` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `business_permits`
--
ALTER TABLE `business_permits`
  ADD CONSTRAINT `admin_ibtk_5` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_permits_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permit_ibtk_1` FOREIGN KEY (`archive_id`) REFERENCES `archive_business_permits` (`archive_id`) ON DELETE CASCADE;

--
-- Constraints for table `certification_of_ownership`
--
ALTER TABLE `certification_of_ownership`
  ADD CONSTRAINT `admin_ibtk_10` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archived_ibtk_12` FOREIGN KEY (`archived_id`) REFERENCES `archive_ownership` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_ibtk_5` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `cert_for_solid_waste_management`
--
ALTER TABLE `cert_for_solid_waste_management`
  ADD CONSTRAINT `admin_ibtk_11` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archived_ibtk_13` FOREIGN KEY (`archived_id`) REFERENCES `archive_solid_waste_management` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_ibtk_6` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `fencing_permit`
--
ALTER TABLE `fencing_permit`
  ADD CONSTRAINT `admin_ibtk_12` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archived_ibtk_14` FOREIGN KEY (`archived_id`) REFERENCES `archive_fencing_permit` (`archive_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_ibtk_7` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `lupon_tagapamayapa`
--
ALTER TABLE `lupon_tagapamayapa`
  ADD CONSTRAINT `admin_ibtk2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_ibtk6` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `archive_ibtk12` FOREIGN KEY (`archive_id`) REFERENCES `archive_lupon_tagapamayapa` (`archive_id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_records`
--
ALTER TABLE `payment_records`
  ADD CONSTRAINT `payment_records_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE SET NULL;

--
-- Constraints for table `residents`
--
ALTER TABLE `residents`
  ADD CONSTRAINT `resident_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE;

--
-- Constraints for table `users_account`
--
ALTER TABLE `users_account`
  ADD CONSTRAINT `users_account_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
