-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 12, 2021 at 07:04 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `languafina_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `point_transactions`
--

DROP TABLE IF EXISTS `point_transactions`;
CREATE TABLE IF NOT EXISTS `point_transactions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pointable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pointable_id` bigint(20) UNSIGNED NOT NULL,
  `amount` bigint(20) NOT NULL,
  `current` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `point_transactions_pointable_type_pointable_id_index` (`pointable_type`,`pointable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `point_transactions`
--

INSERT INTO `point_transactions` (`id`, `message`, `pointable_type`, `pointable_id`, `amount`, `current`, `created_at`, `updated_at`) VALUES
(1, 'New user registration point', 'App\\User', 25, 500, 500, '2021-03-01 05:09:16', '2021-03-01 05:09:16'),
(2, 'Free Course Enrollment Point', 'App\\User', 25, 50, 50, '2021-03-01 06:00:24', '2021-03-01 06:00:24'),
(3, 'Free Course Enrollment Point', 'App\\User', 25, 50, 600, '2021-03-01 06:03:59', '2021-03-01 06:03:59'),
(4, 'Paid Course Enroll point', 'App\\User', 25, 100, 700, '2021-03-01 06:20:18', '2021-03-01 06:20:18'),
(5, 'Course Complete point', 'App\\User', 25, 200, 900, '2021-03-01 07:05:18', '2021-03-01 07:05:18'),
(6, 'Course Complete point', 'App\\User', 25, 200, 1100, '2021-03-01 07:07:22', '2021-03-01 07:07:22'),
(7, 'New User Registration Point', 'App\\User', 31, 500, 500, '2021-03-01 10:20:10', '2021-03-01 10:20:10'),
(8, 'New User Registration Point', 'App\\User', 32, 500, 500, '2021-03-01 10:26:27', '2021-03-01 10:26:27'),
(9, 'Free Course Enrollment Point', 'App\\User', 32, 50, 550, '2021-03-01 10:28:18', '2021-03-01 10:28:18'),
(10, 'Paid Course Enroll point', 'App\\User', 32, 100, 650, '2021-03-01 10:28:27', '2021-03-01 10:28:27'),
(11, 'Paid Course Enroll point', 'App\\User', 32, 100, 750, '2021-03-01 10:32:02', '2021-03-01 10:32:02'),
(12, 'Course Complete point', 'App\\User', 32, 200, 950, '2021-03-01 10:34:05', '2021-03-01 10:34:05'),
(13, 'Free Course Enrollment Point', 'App\\User', 31, 50, 550, '2021-03-01 10:46:50', '2021-03-01 10:46:50'),
(14, 'Paid Course Enroll point', 'App\\User', 31, 100, 650, '2021-03-01 10:46:59', '2021-03-01 10:46:59'),
(15, 'Paid Course Enroll point', 'App\\User', 31, 100, 750, '2021-03-01 10:49:22', '2021-03-01 10:49:22'),
(16, 'Free Course Enrollment Point', 'App\\User', 19, 50, 50, '2021-03-04 06:41:14', '2021-03-04 06:41:14'),
(17, 'Paid Course Enroll point', 'App\\User', 19, 100, 15000, '2021-03-04 06:41:28', '2021-03-04 06:41:28'),
(18, 'New Course Purchased', 'App\\User', 19, 10000, 15000, '2021-03-04 07:24:31', '2021-03-04 07:24:31'),
(19, 'New Course Purchased', 'App\\User', 19, 10000, 5000, '2021-03-04 07:25:20', '2021-03-04 07:25:20'),
(20, 'Paid Course Enroll point', 'App\\User', 19, 100, 5000, '2021-03-04 07:25:28', '2021-03-04 07:25:28'),
(21, 'New Course Purchased', 'App\\User', 19, 5000, 0, '2021-03-04 07:47:03', '2021-03-04 07:47:03'),
(22, 'New Course Purchased', 'App\\User', 31, 250, 500, '2021-03-04 07:59:33', '2021-03-04 07:59:33'),
(23, 'Purchased through Stripe', 'App\\User', 19, 20, 20, '2021-03-06 06:13:37', '2021-03-06 06:13:37'),
(24, 'Purchased through Stripe', 'App\\User', 19, 50, 70, '2021-03-06 06:14:14', '2021-03-06 06:14:14'),
(25, 'Purchased through Stripe', 'App\\User', 19, 100, 170, '2021-03-06 06:15:45', '2021-03-06 06:15:45'),
(26, 'Purchased through Stripe', 'App\\User', 19, 50, 220, '2021-03-06 07:03:50', '2021-03-06 07:03:50'),
(27, 'Purchased through Stripe', 'App\\User', 19, 10, 230, '2021-03-06 07:04:06', '2021-03-06 07:04:06'),
(28, 'Purchased through Stripe', 'App\\User', 19, 20, 250, '2021-03-06 08:15:09', '2021-03-06 08:15:09'),
(29, 'Purchased through Stripe', 'App\\User', 19, 20, 270, '2021-03-06 09:42:37', '2021-03-06 09:42:37'),
(30, 'New Course Purchased', 'App\\User', 19, 200, 70, '2021-03-06 10:19:47', '2021-03-06 10:19:47'),
(31, 'Purchased through Stripe', 'App\\User', 19, 10, 80, '2021-03-06 11:15:55', '2021-03-06 11:15:55');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
