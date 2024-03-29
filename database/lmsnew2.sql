-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 06, 2021 at 08:58 AM
-- Server version: 5.6.49-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lmsnew2`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_identifier` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `unique_identifier`, `version`, `activated`, `image`, `created_at`, `updated_at`) VALUES
(9, 'coupon', NULL, '1', 1, 'coupon-preview.jpg', '2021-02-25 10:01:29', '2021-02-25 10:01:29'),
(10, 'certificate', NULL, '1', 1, 'certificate-banner.jpg', '2021-02-25 10:02:31', '2021-02-25 10:02:31'),
(11, 'quiz', NULL, '1', 1, 'quiz-banner.jpg', '2021-02-25 10:03:18', '2021-02-25 10:03:18'),
(12, 'zoom', NULL, '1', 1, 'zoom-banner.jpg', '2021-02-25 10:14:30', '2021-02-25 10:14:30'),
(13, 'forum', NULL, '1', 1, 'forum-banner.jpg', '2021-02-25 10:15:32', '2021-02-25 10:15:32');

-- --------------------------------------------------------

--
-- Table structure for table `admin_earnings`
--

CREATE TABLE `admin_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `purposes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_earnings`
--

INSERT INTO `admin_earnings` (`id`, `amount`, `purposes`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'Sale Package', NULL, '2021-03-30 18:10:14', '2021-03-30 18:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `affiliates`
--

CREATE TABLE `affiliates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `student_account_id` bigint(20) UNSIGNED NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `refer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `is_cancel` tinyint(1) NOT NULL DEFAULT '0',
  `balance` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_histories`
--

CREATE TABLE `affiliate_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `affiliate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `refer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payments`
--

CREATE TABLE `affiliate_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `current_balance` double DEFAULT NULL,
  `process` enum('Bank','Paypal','Stripe') COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_account_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Request','Confirm') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `affiliate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `confirm_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_password_resets`
--

CREATE TABLE `api_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `tags` longtext COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_price` double DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `parent_category_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_item` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `is_popular`, `top`, `icon`, `is_published`, `parent_category_id`, `created_at`, `updated_at`, `is_item`) VALUES
(1, 'Language Learning', 'language-learning1', 1, 0, '/uploads/media_manager/10.png', 0, 0, '2020-06-09 09:48:52', '2021-04-05 18:39:57', 0),
(2, 'Leadership', 'leadership2', 1, 0, '/uploads/media_manager/14.png', 1, 0, '2020-06-09 10:35:08', '2021-03-29 15:03:45', 0),
(3, 'Personal Productivity', 'personal-productivity3', 1, 0, '/uploads/media_manager/13.png', 1, 0, '2020-06-10 02:01:03', '2021-03-29 15:02:10', 0),
(4, 'Personal Transformation', 'personal-transformation4', 1, 1, '/uploads/media_manager/15.png', 1, 0, '2020-06-10 02:01:48', '2021-03-29 15:03:54', 0),
(5, 'Personal Productivity', 'personal-productivity5', 1, 0, '/uploads/media_manager/12.png', 1, 0, '2020-06-10 02:02:49', '2021-03-29 15:03:15', 0),
(6, 'Photography', 'photography6', 1, 0, '/uploads/media_manager/17.png', 0, 0, '2020-06-10 02:19:05', '2021-03-29 15:05:28', 0),
(7, 'Career Development', 'career-development7', 1, 0, '/uploads/media_manager/11.png', 1, 0, '2020-06-10 02:19:58', '2021-03-29 15:04:27', 0),
(8, 'Parenting & Relationships', 'parenting-relationships8', 1, 0, '/uploads/media_manager/16.png', 1, 0, '2020-12-21 06:30:09', '2021-03-29 15:05:22', 0);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_text` longtext COLLATE utf8mb4_unicode_ci,
  `top_text` longtext COLLATE utf8mb4_unicode_ci,
  `header_text` longtext COLLATE utf8mb4_unicode_ci,
  `footer_text` longtext COLLATE utf8mb4_unicode_ci,
  `permissions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `badge` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `template_text`, `top_text`, `header_text`, `footer_text`, `permissions`, `image`, `badge`, `logo`, `created_at`, `updated_at`) VALUES
(1, NULL, 'CERTIFICATE OR ACHIEVEMENT', 'THIS CERTIFICATE IS PROUDLY PRESENTED TO Puneet Chaudhary', 'FOR THE SUCCESSFUL COMPLETION OF English speaking', 'YES', 'uploads/certificate/c-1.jpg', 'uploads/certificate/aio5kW0XqrpgDftg4w08m0ZDsONI7G5cmkbmskBv.png', 'uploads/certificate/eeozYqUveBgouCmTFoPsSCAyfCK1cJXxA2p60OhX.png', '2020-12-20 11:11:46', '2021-04-05 17:40:06'),
(2, NULL, 'CERTIFICATE OR ACHIEVEMENT', 'THIS CERTIFICATE IS PROUDLY PRESENTED TO', 'FOR THE SUCCESSFUL COMPLETION OF', 'NO', 'uploads/certificate/c-1.jpg', NULL, NULL, '2021-02-25 10:02:31', '2021-02-25 10:02:31');

-- --------------------------------------------------------

--
-- Table structure for table `certificate_stores`
--

CREATE TABLE `certificate_stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certificate_stores`
--

INSERT INTO `certificate_stores` (`id`, `uid`, `user_id`, `image`, `created_at`, `updated_at`) VALUES
(1, '2119', 19, 'uploads/certificate/2119.jpg', '2020-12-20 11:15:13', '2020-12-20 11:15:13');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `title`, `course_id`, `priority`, `is_published`, `deleted_at`, `created_at`, `updated_at`) VALUES
(5, 'Introduction', 11, 0, 1, NULL, '2020-06-10 07:33:45', '2020-06-10 07:33:45'),
(6, 'Basic knowledge', 11, 0, 1, NULL, '2020-06-10 07:34:53', '2020-06-10 07:34:53'),
(7, 'Diving into deep', 11, 0, 1, '2020-06-11 00:13:13', '2020-06-10 07:35:25', '2020-06-11 00:13:13'),
(8, 'Introduction', 1, 0, 1, NULL, '2020-06-10 07:33:45', '2020-06-10 07:33:45'),
(9, 'Basic knowledge', 1, 0, 1, NULL, '2020-06-10 07:34:53', '2020-06-10 07:34:53'),
(10, 'Diving into deep', 1, 0, 1, '2020-06-11 00:13:34', '2020-06-10 07:35:25', '2020-06-11 00:13:34'),
(11, 'Introduction', 2, 0, 1, NULL, '2020-06-10 07:33:45', '2020-06-10 07:33:45'),
(12, 'Basic knowledge', 2, 0, 1, NULL, '2020-06-10 07:34:53', '2020-06-10 07:34:53'),
(13, 'Diving into deep', 2, 0, 1, '2020-06-11 00:14:34', '2020-06-10 07:35:25', '2020-06-11 00:14:34'),
(14, 'Introduction', 5, 0, 1, NULL, '2020-06-10 07:33:45', '2020-06-10 07:33:45'),
(15, 'Basic knowledge', 5, 0, 1, NULL, '2020-06-10 07:34:53', '2020-06-10 07:34:53'),
(16, 'Diving into deep', 5, 0, 1, '2020-06-11 00:15:22', '2020-06-10 07:35:25', '2020-06-11 00:15:22'),
(17, 'Introduction', 6, 0, 1, NULL, '2020-06-10 07:33:45', '2020-06-10 07:33:45'),
(18, 'Basic knowledge', 6, 0, 1, NULL, '2020-06-10 07:34:53', '2020-06-10 07:34:53'),
(19, 'Diving into deep', 6, 0, 1, '2020-06-11 00:15:40', '2020-06-10 07:35:25', '2020-06-11 00:15:40'),
(20, 'Introduction', 9, 0, 1, NULL, '2020-06-10 07:33:45', '2020-06-10 07:33:45'),
(21, 'Basic knowledge', 9, 0, 1, NULL, '2020-06-10 07:34:53', '2020-06-10 07:34:53'),
(22, 'Diving into deep', 9, 0, 1, NULL, '2020-06-10 07:35:25', '2020-06-10 07:35:25'),
(23, 'Introduction', 19, 0, 1, NULL, '2020-06-11 00:30:52', '2020-06-11 00:30:52'),
(24, 'Basic knowledge', 19, 0, 1, NULL, '2020-06-11 00:31:04', '2020-06-11 00:31:04'),
(25, 'Introduction', 20, 0, 1, NULL, '2020-06-11 00:40:48', '2020-06-11 00:40:48'),
(26, 'Diving into deep', 20, 0, 1, NULL, '2020-06-11 00:40:59', '2020-06-11 00:40:59'),
(27, 'Introduction', 21, 0, 1, NULL, '2020-06-11 00:52:06', '2020-06-11 00:52:06'),
(28, 'Diving into deep', 21, 0, 1, NULL, '2020-06-11 00:52:13', '2020-06-11 00:52:13'),
(29, 'Introduction', 22, 0, 1, NULL, '2020-06-11 00:59:40', '2020-06-11 00:59:40'),
(30, 'IELTS Level 3', 27, 0, 1, NULL, '2021-04-05 18:41:06', '2021-04-05 18:41:06');

-- --------------------------------------------------------

--
-- Table structure for table `class_contents`
--

CREATE TABLE `class_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type` enum('Video','Document','Quiz') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` enum('Youtube','HTML5','Vimeo','File','Live','Quiz') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` longtext COLLATE utf8mb4_unicode_ci,
  `duration` int(11) DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `is_preview` tinyint(1) NOT NULL DEFAULT '0',
  `source_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meeting_id` bigint(20) DEFAULT NULL,
  `quiz_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_contents`
--

INSERT INTO `class_contents` (`id`, `title`, `content_type`, `provider`, `video_url`, `duration`, `file`, `description`, `class_id`, `priority`, `is_published`, `is_preview`, `source_code`, `deleted_at`, `created_at`, `updated_at`, `meeting_id`, `quiz_id`) VALUES
(5, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 5, 1, 1, 0, NULL, NULL, '2020-06-10 07:35:47', '2020-06-11 15:48:15', NULL, NULL),
(6, 'Starting from scratch', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 5, 2, 1, 0, NULL, NULL, '2020-06-10 07:36:20', '2020-06-11 15:48:15', NULL, NULL),
(7, 'Important Announcement', 'Document', NULL, NULL, NULL, 'uploads/class_contents/KBpAR5ae5YF9eisRvoxHOjfHIMO0IxFK0trBdH5F.jpeg', NULL, 5, 0, 1, 0, 'uploads/class_source_codes/DhPorF4ppJKg0fudLzFIxByrGvUWbGCIaKeae5fd.zip', '2020-06-11 00:12:45', '2020-06-10 07:37:26', '2020-06-11 00:12:45', NULL, NULL),
(8, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 6, 3, 1, 0, NULL, NULL, '2020-06-10 07:38:56', '2020-06-11 15:48:07', NULL, NULL),
(9, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 6, 4, 1, 0, NULL, NULL, '2020-06-10 07:39:18', '2020-06-11 15:48:07', NULL, NULL),
(10, 'Important Announcement', 'Video', NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:33', '2020-06-10 07:39:33', NULL, NULL),
(11, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 8, 0, 1, 0, NULL, NULL, '2020-06-10 07:35:47', '2020-06-10 07:35:47', NULL, NULL),
(12, 'Starting from scratch', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 8, 0, 1, 0, NULL, NULL, '2020-06-10 07:36:20', '2020-06-10 07:36:20', NULL, NULL),
(13, 'Important Announcement', 'Document', NULL, NULL, NULL, 'uploads/class_contents/KBpAR5ae5YF9eisRvoxHOjfHIMO0IxFK0trBdH5F.jpeg', NULL, 8, 0, 1, 0, 'uploads/class_source_codes/DhPorF4ppJKg0fudLzFIxByrGvUWbGCIaKeae5fd.zip', '2020-06-11 00:13:26', '2020-06-10 07:37:26', '2020-06-11 00:13:26', NULL, NULL),
(14, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 9, 0, 1, 0, NULL, NULL, '2020-06-10 07:38:56', '2020-06-10 07:38:56', NULL, NULL),
(15, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 9, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:18', '2020-06-10 07:39:18', NULL, NULL),
(16, 'Important Announcement', 'Video', NULL, NULL, NULL, NULL, NULL, 10, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:33', '2020-06-10 07:39:33', NULL, NULL),
(17, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 11, 0, 1, 0, NULL, NULL, '2020-06-10 07:35:47', '2020-06-10 07:35:47', NULL, NULL),
(18, 'Starting from scratch', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 11, 0, 1, 0, NULL, NULL, '2020-06-10 07:36:20', '2020-06-10 07:36:20', NULL, NULL),
(19, 'Important Announcement', 'Document', NULL, NULL, NULL, 'uploads/class_contents/KBpAR5ae5YF9eisRvoxHOjfHIMO0IxFK0trBdH5F.jpeg', NULL, 11, 0, 1, 0, 'uploads/class_source_codes/DhPorF4ppJKg0fudLzFIxByrGvUWbGCIaKeae5fd.zip', '2020-06-11 00:13:46', '2020-06-10 07:37:26', '2020-06-11 00:13:46', NULL, NULL),
(20, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 12, 0, 1, 0, NULL, NULL, '2020-06-10 07:38:56', '2020-06-10 07:38:56', NULL, NULL),
(21, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 12, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:18', '2020-06-10 07:39:18', NULL, NULL),
(22, 'Important Announcement', 'Video', NULL, NULL, NULL, NULL, NULL, 13, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:33', '2020-06-10 07:39:33', NULL, NULL),
(23, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 14, 0, 1, 0, NULL, NULL, '2020-06-10 07:35:47', '2020-06-10 07:35:47', NULL, NULL),
(24, 'Starting from scratch', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 14, 0, 1, 0, NULL, NULL, '2020-06-10 07:36:20', '2020-06-10 07:36:20', NULL, NULL),
(25, 'Important Announcement', 'Document', NULL, NULL, NULL, 'uploads/class_contents/KBpAR5ae5YF9eisRvoxHOjfHIMO0IxFK0trBdH5F.jpeg', NULL, 14, 0, 1, 0, 'uploads/class_source_codes/DhPorF4ppJKg0fudLzFIxByrGvUWbGCIaKeae5fd.zip', '2020-06-11 00:15:18', '2020-06-10 07:37:26', '2020-06-11 00:15:18', NULL, NULL),
(26, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 15, 0, 1, 0, NULL, NULL, '2020-06-10 07:38:56', '2020-06-10 07:38:56', NULL, NULL),
(27, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 15, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:18', '2020-06-10 07:39:18', NULL, NULL),
(28, 'Important Announcement', 'Video', NULL, NULL, NULL, NULL, NULL, 16, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:33', '2020-06-10 07:39:33', NULL, NULL),
(29, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 17, 0, 1, 0, NULL, NULL, '2020-06-10 07:35:47', '2020-06-10 07:35:47', NULL, NULL),
(30, 'Starting from scratch', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 17, 0, 1, 0, NULL, NULL, '2020-06-10 07:36:20', '2020-06-10 07:36:20', NULL, NULL),
(31, 'Important Announcement', 'Document', NULL, NULL, NULL, 'uploads/class_contents/KBpAR5ae5YF9eisRvoxHOjfHIMO0IxFK0trBdH5F.jpeg', NULL, 17, 0, 1, 0, 'uploads/class_source_codes/DhPorF4ppJKg0fudLzFIxByrGvUWbGCIaKeae5fd.zip', '2020-06-11 00:15:35', '2020-06-10 07:37:26', '2020-06-11 00:15:35', NULL, NULL),
(32, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 18, 0, 1, 0, NULL, NULL, '2020-06-10 07:38:56', '2020-06-10 07:38:56', NULL, NULL),
(33, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 18, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:18', '2020-06-10 07:39:18', NULL, NULL),
(34, 'Important Announcement', 'Video', NULL, NULL, NULL, NULL, NULL, 19, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:33', '2020-06-10 07:39:33', NULL, NULL),
(35, 'Starting from scratch', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 20, 0, 1, 0, NULL, NULL, '2020-06-10 07:36:20', '2020-06-10 07:36:20', NULL, NULL),
(36, 'Important Announcement', 'Document', NULL, NULL, NULL, 'uploads/class_contents/KBpAR5ae5YF9eisRvoxHOjfHIMO0IxFK0trBdH5F.jpeg', NULL, 20, 0, 1, 0, 'uploads/class_source_codes/DhPorF4ppJKg0fudLzFIxByrGvUWbGCIaKeae5fd.zip', '2020-06-11 00:16:09', '2020-06-10 07:37:26', '2020-06-11 00:16:09', NULL, NULL),
(37, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 20, 0, 1, 0, NULL, '2020-06-11 00:15:57', '2020-06-10 07:38:56', '2020-06-11 00:15:57', NULL, NULL),
(38, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 21, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:18', '2020-06-10 07:39:18', NULL, NULL),
(39, 'Important Announcement', 'Video', NULL, NULL, NULL, NULL, NULL, 21, 0, 1, 0, NULL, '2020-06-11 00:16:15', '2020-06-10 07:39:33', '2020-06-11 00:16:15', NULL, NULL),
(40, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 22, 0, 1, 0, NULL, NULL, '2020-06-10 07:35:47', '2020-06-10 07:35:47', NULL, NULL),
(41, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 23, 0, 1, 1, 'uploads/class_source_codes/Gda9sKA4sMA67soA3Mt4dSUL6nkl3buP8s8v6zZC.zip', NULL, '2020-06-11 00:31:28', '2020-06-11 00:34:40', NULL, NULL),
(42, 'Diving into deep', 'Document', NULL, NULL, NULL, 'uploads/class_contents/1l0Rgmmik4lXyi7qcPqBXyoR6iPxMqJtvWCihJ8B.zip', '<p>This is the document details</p>', 23, 0, 1, 0, NULL, NULL, '2020-06-11 00:32:01', '2020-06-11 00:34:39', NULL, NULL),
(43, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 24, 0, 1, 0, 'uploads/class_source_codes/WEWZmc9x803yfvW5NKseDULQcSTZrjWZ5q9rhU0U.zip', NULL, '2020-06-11 00:32:19', '2020-06-11 00:32:19', NULL, NULL),
(44, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 25, 0, 1, 1, NULL, NULL, '2020-06-11 00:41:12', '2020-06-11 00:56:00', NULL, NULL),
(45, 'Important Announcement', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 25, 0, 1, 1, 'uploads/class_source_codes/JYcW06ECKIkUW8YQKjKJX7GooG3RkhRCl9S8TJTo.zip', NULL, '2020-06-11 00:41:35', '2020-06-11 00:56:04', NULL, NULL),
(46, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 26, 0, 1, 0, NULL, NULL, '2020-06-11 00:41:49', '2020-06-11 00:41:49', NULL, NULL),
(47, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 27, 0, 1, 1, NULL, NULL, '2020-06-11 00:55:14', '2020-06-11 00:55:18', NULL, NULL),
(48, 'Basic knowledge', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 27, 0, 1, 1, NULL, NULL, '2020-06-11 00:55:32', '2020-06-11 00:55:34', NULL, NULL),
(49, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 28, 0, 1, 0, NULL, NULL, '2020-06-11 00:55:48', '2020-06-11 00:55:48', NULL, NULL),
(50, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 29, 0, 1, 1, NULL, NULL, '2020-06-11 00:59:56', '2020-06-11 01:00:01', NULL, NULL),
(51, 'PTE Introduction', 'Document', NULL, NULL, 90, 'uploads/class_contents/j91DwO6HbdgnLIT21He6V0NCCqLLLK0v4Uwwk7Kv.pdf', '<p>PTE Academic is the first entirely computer-based English language test for international</p><p>study and immigration that is accepted across the world. The test assesses the four skills:</p><p>- PTE Speaking &amp;amp; Writing</p><p>- PTE Reading</p><p>- PTE Listening</p>', 30, 1, 1, 1, '/uploads/media_manager/32.png', NULL, '2021-04-05 18:45:24', '2021-04-05 18:45:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `start_day` datetime NOT NULL,
  `end_day` datetime NOT NULL,
  `min_value` double DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('Beginner','Advanced','All Levels') COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `short_description` longtext COLLATE utf8mb4_unicode_ci,
  `big_description` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overview_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` enum('Youtube','HTML5','Vimeo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirement` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `outcome` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `tag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_free` tinyint(1) NOT NULL DEFAULT '0',
  `price` double DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_price` double DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'english',
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `slug`, `level`, `rating`, `short_description`, `big_description`, `image`, `overview_url`, `provider`, `requirement`, `outcome`, `tag`, `is_free`, `price`, `is_discount`, `discount_price`, `language`, `meta_title`, `meta_description`, `is_published`, `user_id`, `category_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Wordpress For Beginner', 'wordpress-for-beginner', 'Beginner', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'uploads/course/xdB5bQTHb3tXlrS58aoreimgMuTgE2lvrBkCCtMR.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Computer, Internet\"]', '[\"Web development\"]', '[\"Wordpres\"]', 1, NULL, 0, NULL, 'English', '[\"Meta\"]', 'Meta', 0, 5, 1, NULL, '2020-06-09 10:29:55', '2021-03-29 15:07:30'),
(2, 'Python for Beginners - Basics to Advanced Python', 'python-for-beginners-basics-to-advanced-python-development', 'Beginner', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'uploads/course/aB1WlGyFMa8LFRiBAZxtYcFwROmLe04mco9GSozl.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Basic of c,computer,internet\"]', '[\"learn new skill, skill development\"]', '[\"python, coding\"]', 0, 20, 1, 5, 'English', '[\"Meta\"]', 'Meta', 0, 5, 1, NULL, '2020-06-09 10:29:55', '2021-03-29 15:07:35'),
(5, 'Learn Photography', 'learn-photography', 'Beginner', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'uploads/course/hEiI5UjOI8DTYAgnBp3v0bkf7OhNwD9b2ySz4KnX.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Camera\",\" Lens\"]', '[\"Photography\",\" photographar\"]', '[\"dslr, camera, photography\"]', 1, NULL, 1, NULL, 'English', '[\"Photography\"]', 'Photography', 0, 5, 6, NULL, '2020-06-09 10:29:55', '2021-04-05 18:13:31'),
(6, 'Advance Wordpress', 'advance-wordpress', 'Advanced', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'uploads/course/dqsdqNqvQGmiPahTsQmAWWcy0IKs01YipDi2r463.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Basic wordpress knowledge,computer, internet\"]', '[\"Build website,learn coding\"]', '[\"wordpress\"]', 1, NULL, 0, NULL, 'English', '[\"Meta\"]', 'Meta', 0, 5, 1, NULL, '2020-06-09 10:29:55', '2021-03-29 15:08:12'),
(9, 'Learn how to play guitar', 'learn-how-to-play-guitar', 'Beginner', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'uploads/course/DBP1Nj0oBdMDEy4wnUpG1DVVpRTChH1jESjBNTqd.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"guitar,time,Patience\"]', '[\"Guitarist\"]', '[\"Guitar, Music\"]', 0, 30, 1, 10, 'English', '[\"Guitar Learning\"]', 'Learn how to play guitar', 0, 5, 7, NULL, '2020-06-09 10:29:55', '2021-03-29 15:08:13'),
(11, 'The Complete Skills Course 2020', 'the-complete-skills-course-2020', 'Beginner', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'uploads/course/cJND1JsRLhOOEONLmLK3QTgAs53m23xZeOZsEPB3.jpeg', 'https://www.youtube.com/watch?v=juKd26qkNAw', 'Youtube', '[\"Computer\",\"                                                         internet                                                            \",\"                                                        Eagerness\"]', '[\"Business statistic\",\"                                                                      Business policy\"]', '[\"business,policy\"]', 1, 20, 1, NULL, 'English', '[\"business policy\"]', 'Business course', 1, 5, 4, NULL, '2020-06-10 04:06:23', '2021-04-05 03:33:14'),
(19, 'Outcome Based Education (OBE) & Academic Quality Assurance', 'outcome-based-education-obe-and-academic-quality-assurance', 'Beginner', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'uploads/course/EOcKJ945IWhaeDE2MJCrWgUkMaj1nWL4UwUlfxRz.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Basic knowledge of digital marketing terms,Basic understanding of business,Pen and paper for taking notes,Internet connection\"]', '[\"Outcome Text, Outcome\"]', '[\"Education\"]', 1, 50, 1, 20, 'Bengali', '[\"meta title\"]', 'Meta description', 0, 5, 2, NULL, '2020-06-11 00:30:46', '2021-03-29 15:07:23'),
(20, 'increase your personal skills and join  our course', 'increase-your-personal-skills-and-join-our-course', 'Advanced', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'uploads/course/W3il4ig1WwQ8Cpn4QnVM0U8uHp9qVYLAJtjCu3GO.jpeg', 'https://youtu.be/RFQndQo4o8k', 'Youtube', '[\"Basic knowledge of digital marketing terms\",\"                                                        Basic understanding of business\"]', '[\"Basic understanding of business\"]', '[\"Basic understanding of business\"]', 1, 650, 1, NULL, 'English', '[\"Meta title\"]', 'Meta Description', 1, 5, 5, NULL, '2020-06-11 00:40:42', '2021-04-05 03:37:58'),
(21, 'Microsoft SQL Server 2019 for Everyone', 'microsoft-sql-server-2019-for-everyone', 'All Levels', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'uploads/course/DlolL30aMOQmC81xNCDfmnjdSL4OuZqsIlS4Hm7s.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Basic knowledge of digital marketing terms,Pen and paper for taking notes\"]', '[\"Basic knowledge of digital marketing terms\"]', '[\"Basic knowledge of digital marketing terms,Digital Marketing\"]', 1, 20, 0, NULL, 'English', '[\"Meta Title\"]', 'Meta Description', 0, 5, 3, NULL, '2020-06-11 00:46:21', '2021-03-29 15:07:21'),
(22, 'Personal Development Course', 'personal-development-course', 'Beginner', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'uploads/course/Kx9x37vpM42whMPQAUp61e21EWiJFCOWLknn3meo.jpeg', 'https://www.youtube.com/watch?v=juKd26qkNAw', 'Youtube', '[\"Basic knowledge of digital marketing terms\"]', '[\"Basic knowledge of digital marketing terms\"]', '[\"Basic knowledge of digital marketing terms\"]', 1, NULL, 1, NULL, 'English', '[\"Meta Title\"]', 'Meta Description', 1, 5, 4, NULL, '2020-06-11 00:59:33', '2021-04-05 03:32:39'),
(23, 'Flutter & Dart - The Complete Guide', 'flutter-and-dart-the-complete-guide', 'Beginner', '1', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">The entire course <strong style=\"margin: 0px; padding: 0px;\">was completely re-recorded and updated </strong>- it\'s totally up-to-date with the latest version of Flutter!</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">With the latest update, I also added <strong style=\"margin: 0px; padding: 0px;\">Push Notifications</strong> and <strong style=\"margin: 0px; padding: 0px;\">Image Upload</strong>!</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">---</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">Join the most comprehensive & bestselling Flutter course and learn how to build amazing iOS and Android apps!</strong></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">You don\'t need to learn Android/ Java and iOS/ Swift to build real native mobile apps!</strong></p>', '<p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">Flutter - a framework developed by Google - allows you to learn one language (Dart) and build beautiful native mobile apps in no time. Flutter is a SDK providing the tooling to compile Dart code into native code and it also gives you a rich set of pre-built and pre-styled UI elements (so called widgets) which you can use to compose your user interfaces.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">Flutter is extremely trending</strong> and gets used for major Google apps like their Adwords app - it\'s now marked as \"ready for production\", hence now is the time to jump in and learn it!</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">This course will teach Flutter & Dart from scratch, NO prior knowledge of either of the two is required! And you certainly don\'t need any Android or iOS development experience since the whole idea behind Flutter is to only learn one language.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">You\'ll learn Flutter not only in theory but <strong style=\"margin: 0px; padding: 0px;\">we\'ll build a complete, realistic app</strong> throughout this course. This app will feature both all the core basics as well as advanced features like using Google Maps, the device camera, adding animations and more!</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">With Flutter, you\'ll be able to write code only once and ship your apps both to the Apple AppStore and Google Play.</strong></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">Use Google\'s Material Design to build beautiful, yet fully customizable, apps in no time with almost zero effort. You can use the rich widget suite Flutter provides to add common UI elements like buttons, switches, forms, toolbars, lists and more - or you simply build your own widgets - Flutter makes that a breeze, too.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">Here\'s what\'s included in the course:</strong></p><ul style=\"margin: 0.8rem 0px 0px; padding: 0px 0px 0px 2.4rem; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><li style=\"margin: 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Detailed setup instructions for both macOS and Windows</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">A thorough introduction to Flutter, Dart and the concept behind widgets</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">An overview of the built-in widgets and how you may add your own ones</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Debugging tipps & tricks</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Page navigation with tabs, side drawers and stack-based navigation</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">State management solutions</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Handling and validating user input</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Connecting your Flutter app to backend servers by sending Http requests</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">User authentication</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Adding Google Maps</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Using native device features like the camera</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Adding beautiful animations & page transitions</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Image Upload</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Push Notifications - manual approach and automated</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">How to publish your app to the app stores</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">And more!</p></li></ul><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">This course is for you if ...</strong></p><ul style=\"margin: 0.8rem 0px 0px; padding: 0px 0px 0px 2.4rem; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><li style=\"margin: 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">You\'re interested in building real native mobile apps for the two most popular mobile platforms - iOS and Android</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">You want to explore the full set of features Flutter offers</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Don\'t want to spend hours learning two completely different languages</p></li></ul><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">Course prerequisites:</strong></p><ul style=\"margin: 0.8rem 0px 0px; padding: 0px 0px 0px 2.4rem; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><li style=\"margin: 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Basic programming language knowledge will help a lot but is not a hard requirement</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">You DON\'T need to know Flutter or Dart</p></li><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">You DON\'T need to know iOS (Swift/ObjectiveC) or Android (Java)</p></li></ul>', '/uploads/media_manager/19.jpg', 'https://youtu.be/I9ceqw5Ny-4', 'Youtube', '[\"Basic programming language will help but is not a must-have\",\"                                                        You can use either Windows\",\"                                                        NO prior iOS or Android development experience is required\"]', '[\"NO prior Flutter or Dart experience is required - this course starts at zero!\",\"                                                                      Learn Flutter and Dart from the ground up\",\"                                                                       step-by-step\"]', '[\"Flutter \",\"apk\",\"android\",\"ios\"]', 1, NULL, 0, NULL, 'English', '[\"\"]', NULL, 0, 21, 8, NULL, '2020-12-21 06:45:29', '2021-03-29 15:07:17');
INSERT INTO `courses` (`id`, `title`, `slug`, `level`, `rating`, `short_description`, `big_description`, `image`, `overview_url`, `provider`, `requirement`, `outcome`, `tag`, `is_free`, `price`, `is_discount`, `discount_price`, `language`, `meta_title`, `meta_description`, `is_published`, `user_id`, `category_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(24, 'The Complete Android N Developer Course', 'the-complete-android-n-developer-course', 'Beginner', '1', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\"><em style=\"margin: 0px; padding: 0px;\">Please note support for this course has now stopped, and that there is a newer version of the course (The Complete Android Oreo Developer Course) available.</em></strong></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><em style=\"margin: 0px; padding: 0px;\">In this Android N version of the course I use Android Studio versions 2.0 and 2.1.2, and recommend students do the same.</em></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><br style=\"margin: 0px; padding: 0px;\"></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">So you want to build your own apps?</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">And you want to build them… from the comfort of your home… in your own time… without having to attend class… or wade through endless textbooks (or online guides). <em style=\"margin: 0px; padding: 0px;\">Am I right?</em></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">And let me guess: you <em style=\"margin: 0px; padding: 0px;\">only</em> want the latest technology, software and techniques—because you’ve got big plans, big ideas—and let’s be honest… you’re impatient and you want to jump the queue?</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">My name’s Rob Percival, creator of the world’s best-selling online coding courses… andI’ve designed<strong style=\"margin: 0px; padding: 0px;\"> The Complete Android N Developer Course</strong>, especially for YOU.</p>', '<p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">Building on last year’s runaway success: The Complete Android Developer Course (Udemy’s best-ever-selling Android course, with over 50,000 happy students), <strong style=\"margin: 0px; padding: 0px;\">The Complete Android N Developer Course</strong> has been refined, honed and microscopically polished to deliver even more valuable content, all designed for the latest Android 7. </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">A huge range of technologies are covered, including open source Parse Server, Firebase, Admob, GDX (game development), Bluetooth and a whole lot more.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">This time, using hot-off-the-press <strong style=\"margin: 0px; padding: 0px;\">Android Nougat</strong> (putting unparalleled levels of performance, productivity and security directly into your hands), <strong style=\"margin: 0px; padding: 0px;\">The Complete Android N Developer Course </strong>includes building a WhatsApp clone PLUS three <em style=\"margin: 0px; padding: 0px;\">brand spanking new</em> chapters on how to market your apps—and start piling in the cash.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">What’s stopping you from signing up to today?</strong></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      You don’t have enough time: <em style=\"margin: 0px; padding: 0px;\">Not an issue</em>. We’ve designed this course so you can learn everything you need in as little as SIX WEEKS.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      You’re still weighing up the value: <em style=\"margin: 0px; padding: 0px;\">Listen. </em>We’ve made this course bigger, better and more affordable—with even more content and more insider money-making tips—than EVER before. In fact, if you don’t 100% get everything you need from it… we’ll give you your MONEY BACK.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      You don’t have any previous experience: <em style=\"margin: 0px; padding: 0px;\">Seriously, not a problem</em>. This course is expertly designed to teach everyone from complete beginners, right through to pro developers.  <em style=\"margin: 0px; padding: 0px;\">(And yes, even pro developers take this course to quickly absorb the latest skills, while refreshing existing ones).</em>    </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><em style=\"margin: 0px; padding: 0px;\">“Detailed instructions for beginners, easy to follow as all Rob\'s courses. I would definitely recommend this course :)”</em>   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><em style=\"margin: 0px; padding: 0px;\">“As a full time developer, I dreamed of writing a game, but never got anywhere. Too much analysis, object-oriented development training. Then Rob built flappy birds right before my eyes. Now I have a game going into the app store. This course is great for pro-developers too!”</em>   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">Straight up: No other course will take you to expert app developer in as fast a time as this. <em style=\"margin: 0px; padding: 0px;\">Have other courses done this for you?</em> </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><br style=\"margin: 0px; padding: 0px;\"></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">Buy this course today and this is what you’ll get.</strong></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">Firstly, using Java and Android Studio, I\'ll teach you how to build real, marketable apps by cloning WhatsApp, Uber and Instagram.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">And by the way—just like my other record-smashing courses—this course is project based, which means you build your own apps in REALTIME…As. You. Learn.     </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">Over half a million students tell me this is THE most motivating and effective way to absorb information.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      You\'ll start by downloading Android Studio and building an easy-peasy Currency Converter app.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      Next up: you\'ll build a Favourite Places app and a Brain Training app, before working your way up to WhatsApp, Uber and Instagram clones — using Parse Server.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      You\'ll also get a full guide on submitting your apps to Google Play, plus THREE BRAND NEW WALK-THROUGH chapters explaining exactly how to effectively market your apps—and generate revenue with Google Ads.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      You\'ll learn all the latest Android N features, including App Permissions and Android Pay.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      And finally, we\'ll take a look at Android Wear - the future of wearable computing.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">Can you believe you get all this (and more) for just $200?</strong>  </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><em style=\"margin: 0px; padding: 0px;\">“Amazing course that teaches you everything you want to learn about making android apps from the basic to the advanced. Even if you have no knowledge you can learn so much from this course.”</em>  </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">What else will I get if I buy this course now?</strong></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      FULL LIFETIME ACCESS (including video downloads and updates) for a ludicrously affordable one-off fee.    </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      $50 Amazon AWS Credit for hosting your own social apps.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      PEACE OF MIND: Learn from the creator of three of the most popular online courses, successfully teaching over 200,000 students and receiving 10,000 5* reviews.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      CONTINUOUS PROJECT SUPPORT: Whenever you need it, in the course forums.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      SUPERIOR LEARNING: Build your own real apps as you go, with not a yawnsome programming concept in sight.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      £300 WORTH OF EXCLUSIVE APP TEMPLATES, icons and backgrounds (designed for Android N)    </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      ONE YEAR’S FREE WEB HOSTING on Eco Web Hosting\'s Advanced Package, worth £119. *Limited to one year per student not per course*</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><em style=\"margin: 0px; padding: 0px;\">“So much more understandable than the other 6+ classes I have taken elsewhere. This course is a must! Thank you!”</em>  </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">Why learn to make Android apps?</strong>   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      Android is without a doubt THE biggest mobile platform in the world, with over 80% market share and over 1 billion devices sold in 2016 alone.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      You can develop for Android on a Windows, Mac or Linux computer.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      Java is a fantastic language to learn, allowing you to make apps for PC, Mac and the web, as well as Android.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      Android app discovery is way superior to the App Store, so your app has a far better chance of getting seen—and bought.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      Ad-based revenue is a lot more common on Android than on iOS, and a cinch to set up with Google Ads.  </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><em style=\"margin: 0px; padding: 0px;\">“Top class professional presentation of a well-constructed course. Consistently pitched at the right level to remain interesting and challenging, this course quickly brings the student to a point where generating their own applications is realistic and fun</em>.”  </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">Who is this for?</strong>   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">Anyone who wants to learn to code to become an app developer: This is a complete course, just like my Complete Web, iOS and Apple Watch courses. So once you’re up and coding like a demon app developer, it’ll ALSO teach you how to <em style=\"margin: 0px; padding: 0px;\">make money from your apps</em>.    </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">Sound good?   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">It’s also for anyone who wants to understand how computers work: Learning to code is so much more than being able to make apps - knowing how computers work opens news doors to our awesome digital world</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"> </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><em style=\"margin: 0px; padding: 0px;\">“Rob has a knack for explaining material in an easily digestible way. The mini challenges he presents within his lectures are an excellent way to commit things to memory. The lectures are well paced - fast enough to maintain your interest but not so fast that you get left in the dust!”</em>   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">Is this course right for me?</strong>   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">Look: if you’re still not convinced, I urge you to check out my 5* reviews. There’s over half a million of them on Udemy, alone.  No other course on the World Wide Web has achieved such consistent ratings.    </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><em style=\"margin: 0px; padding: 0px;\">Coding and app development is the future</em>. Whether you’ve got plans to create the next Facebook, or you want to get ahead at work and increase your earning potential, I GUARANTEE anyone will find <strong style=\"margin: 0px; padding: 0px;\">The Complete Android N Developer Course</strong> course show-stoppingly useful.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">A quick summary of why <strong style=\"margin: 0px; padding: 0px;\">The Complete Android N Developer Course</strong> is the number one resource for budding app developers, like you:   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      Time-tested, quick-to-pick up learning strategies   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      Quality insider tips, that only the pros normally know  </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      Home-based learning—so you can go as fast or slow as you please   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">·      Simple, jargon-free language and HD definition  </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><strong style=\"margin: 0px; padding: 0px;\">Who Am I?</strong>   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">I\'m Rob.    </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">I run three of the most successful online coding courses on the planet, and I’m so excited to share them with you.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">I have a degree in Mathematics from Cambridge University, and am a web and app developer based in Cambridge, UK. Since working as a secondary school teacher for 10 years, I’ve never lost my love for teaching.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">Maybe that’s why my goal is so simple: To get as many people benefitting from app development as possible. But more importantly, that my courses are enjoyable and deliver tangible results for you… Today and tomorrow.    </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">These are the things that drive me to keep pushing what’s possible in online learning.   </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\">OK, let’s begin… </p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><br style=\"margin: 0px; padding: 0px;\"></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: rgb(60, 59, 55); font-family: \"sf pro text\", -apple-system, BlinkMacSystemFont, Roboto, \"segoe ui\", Helvetica, Arial, sans-serif, \"apple color emoji\", \"segoe ui emoji\", \"segoe ui symbol\";\"><em style=\"margin: 0px; padding: 0px;\">“Outstanding! Rob delivers high quality content once more. It\'s not just the endless content and the clear explanations that you get but more importantly the confidence that you build. A must for any developer.”</em></p>', '/uploads/media_manager/20.jpg', 'https://youtu.be/aS__9RbCyHg', 'Youtube', '[\"A Windows PC\",\"                                                         Mac or Linux Computer\",\"                                                        ZERO programming knowledge required - I\'ll teach you everything you need to know\"]', '[\"ZERO programming knowledge required - I\'ll teach you everything you need to know\"]', '[\"Android\",\"kotlin\",\"java\"]', 1, NULL, 0, NULL, 'English', '[\"\"]', NULL, 0, 21, 8, NULL, '2020-12-21 06:52:47', '2021-03-29 15:08:04');
INSERT INTO `courses` (`id`, `title`, `slug`, `level`, `rating`, `short_description`, `big_description`, `image`, `overview_url`, `provider`, `requirement`, `outcome`, `tag`, `is_free`, `price`, `is_discount`, `discount_price`, `language`, `meta_title`, `meta_description`, `is_published`, `user_id`, `category_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(25, 'The Complete Communication Skills Master Class for Life', 'the-complete-communication-skills-master-class-for-life', 'Beginner', '1', 'Communication Skills for Persuasion, Assertiveness and all Business Communication Needs', '<div class=\"course-landing-page__main-content component-margin\" style=\"margin: 0px 4.8rem 3.2rem; padding: 0px; max-width: 70rem; color: rgb(60, 59, 55); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;;\"><div class=\"clp-component-render\" style=\"margin: 0px; padding: 0px;\"><div class=\"clp-component-render\" style=\"margin: 0px; padding: 0px;\"><div class=\"ud-component--course-landing-page-udlite--description\" data-component-props=\"{&quot;description&quot;:&quot;\\u003cp\\u003e\\u003cstrong\\u003eCommunication Skills\\u003c/strong\\u003e\\u0026nbsp;are the most important personal skills you can ever develop for your success in life. Life is a series of communications. Those who develop strong\\u0026nbsp;\\u003cstrong\\u003ecommunication\\u0026nbsp;skills\\u003c/strong\\u003e\\u0026nbsp;do well in school, secure jobs and promotions and often ascend to the highest levels of leadership in corporations, governments and civic life. People who fail to develop\\u0026nbsp;\\u003cstrong\\u003ecommunication\\u0026nbsp;skills\\u003c/strong\\u003e\\u0026nbsp;often have their careers stagnate or plateau in the mid-range. Sadly,\\u0026nbsp;\\u003cstrong\\u003epresentation skills\\u003c/strong\\u003e\\u0026nbsp;are either not taught in primary or secondary education or are taught poorly.\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eThe\\u003c/strong\\u003e\\u0026nbsp;\\u003cstrong\\u003eComplete Communication\\u0026nbsp;Skills Masterclass for Life\\u003c/strong\\u003e\\u0026nbsp;course is your way to get a Master\'s level education on how to \\u003cstrong\\u003ecommunicate\\u0026nbsp;effectively\\u003c/strong\\u003e.\\u003c/p\\u003e\\u003cp\\u003eThis course is designed to be a one stop shop for all your communication\\u0026nbsp;skills training needs. This course covers a vast array of communication needs and scenarios, from how to communicate during a job interview, pitching investors, asking for a raise, speaking one on one or to large groups. And it covers how to speak to big corporations\\u0026nbsp;when you have a problem with service, plus public speaking for kids, how to deliver a wedding speech and even a eulogy. You will also become a master of\\u003cstrong\\u003e persuasion, assertiveness \\u003c/strong\\u003eand all aspects of \\u003cstrong\\u003ebusiness\\u0026nbsp;communication. \\u003c/strong\\u003eYour \\u003cstrong\\u003eleadership\\u003c/strong\\u003e\\u0026nbsp;abilities will expand dramatically as your \\u003cstrong\\u003esocial skills\\u003c/strong\\u003e grow to allow you to \\u003cstrong\\u003ecommunicate effectively\\u003c/strong\\u003e in every situation.\\u003c/p\\u003e\\u003cp\\u003eThis course has the following:\\u003c/p\\u003e\\u003cp\\u003e1. More lectures on \\u003cstrong\\u003ecommunication\\u0026nbsp;skills\\u003c/strong\\u003e\\u0026nbsp;than any other course on Udemy, by far.\\u003c/p\\u003e\\u003cp\\u003e2. More hours of \\u003cstrong\\u003ecommunication skills\\u0026nbsp;\\u003c/strong\\u003etraining than any other course (30\\u0026nbsp;hours long. Sometimes More is More!)\\u003c/p\\u003e\\u003cp\\u003e3. More in-depth training techniques than any other course.\\u003c/p\\u003e\\u003cp\\u003e\\&quot;I\'ve devoted the last 30 years of my life conducting live, in-person \\u003cstrong\\u003ecommunication\\u0026nbsp;skills\\u003c/strong\\u003e\\u0026nbsp;to Presidents, Prime Ministers, CEOs, Entrepreneurs, Senators, Nobel Peace Prize Winners and Professional Athletes. Now, I\'m excited to bring to you these same insider secrets that will transform you into an excellent presenter. If you take this course and do a few simple homework assignments, I am absolutely convinced I can make your\\u003cstrong\\u003e\\u0026nbsp;communication\\u0026nbsp;skills\\u003c/strong\\u003e\\u0026nbsp;world-class. You WILL be able to do the following in EVERY \\u003cstrong\\u003ePresentation\\u003c/strong\\u003e:\\u003c/p\\u003e\\u003cp\\u003e1. Look comfortable, confident and relaxed, regardless of whether you are sitting or standing, regardless of audience size.\\u003c/p\\u003e\\u003cp\\u003e2. Communicate\\u0026nbsp;so your audience understands you.\\u003c/p\\u003e\\u003cp\\u003e3. Communicate\\u0026nbsp;so your audience remembers your messages (this is the hardest part).\\u003c/p\\u003e\\u003cp\\u003e4. Influence people\\u0026nbsp;to take the actions you want.\\&quot;\\u0026nbsp;\\u003cstrong\\u003e\\u003cem\\u003eTJ Walker\\u003c/em\\u003e\\u003c/strong\\u003e\\u003cem\\u003e, President of Media Training Worldwide and best-selling Udemy Instructor.\\u003c/em\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u201cTJ Walker\'s single-minded devotion to presentation has made him the #1 expert for executives seeking guidance on speaking to the public and media.\\&quot;\\u0026nbsp;\\u003cem\\u003eBob Bowdon, Anchor/Reporter, Bloomberg Television\\u003c/em\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u201cTJ Walker is the leading media trainer in the world.\\&quot;\\u0026nbsp;\\u003cem\\u003eStu Miller, Viacom News Producer\\u003c/em\\u003e\\u003c/p\\u003e\\u003cp\\u003e(TJ Walker\'s Media Training Worldwide) \\u201cThe world\'s leading presentation and media training firm.\\&quot;\\u0026nbsp;\\u003cem\\u003eGregg Jarrett, Fox News Channel Anchor\\u003c/em\\u003e\\u003c/p\\u003e\\u003cp\\u003eTJ Walker is the founder of Media Training Worldwide and has been conducting \\u003cstrong\\u003ecommunication skills\\u0026nbsp;\\u003c/strong\\u003etraining workshops and seminars since 1984. Walker has trained Presidents of countries, Prime Ministers, Nobel Peace Prize winners, Super Bowl winners, US Senators, Miss Universes and Members of Parliament. He has conducted\\u0026nbsp;\\u003cstrong\\u003ecommunication skills\\u003c/strong\\u003e\\u0026nbsp;workshops on six continents in more than two dozen countries.\\u003c/p\\u003e\\u003cp\\u003eHis book, \\&quot;Secret to Foolproof Presentations\\&quot; was a USA Today # 1 Bestseller, as well as a Wall Street Journal, and Business Week Bestseller.\\u003c/p\\u003e\\u003cp\\u003eWalker is also the author of \\&quot;Media Training AZ\\&quot; and \\&quot;Media Training Success.\\&quot;\\u003c/p\\u003e\\u003cp\\u003eIn 2009, Walker set the Guinness Book of World Records for Most Talk Radio Appearances ever in a 24-hour period.\\u003cbr\\u003e\\u003c/p\\u003e\\u003cp\\u003eWalker has also served as a former President of the National Speakers Association, New York City.\\u003c/p\\u003e\\u003cp\\u003ePlease note, this course is not for people who want to sit back and watch lots of flashy graphics, sound effects and take multiple-choice tests. The course is delivered by a world-class instructor who speaks to you directly. And he asks you to communicate back via posting video for critiques.\\u003c/p\\u003e\\u003cp\\u003eThis course is ideal for anyone looking to improve their skills in the following areas: \\u003cstrong\\u003ecommunication skills, leadership, assertiveness, social skills, public speaking, persuasion\\u003c/strong\\u003e and \\u003cstrong\\u003epresentation skills\\u003c/strong\\u003e.\\u003c/p\\u003e\\u003cp\\u003e\\u003cbr\\u003e\\u003c/p\\u003e\\u003cp\\u003eHere is what Udemy students say about this course:\\u003c/p\\u003e\\u003cp\\u003e\\&quot;Hi, My name is Cathy I am from South Africa, I have learned new ways to communicate better with my fellow workers, to get rid of my fear, and to stand up. Thank you TJ I did enjoy your training Course and is still learning\\&quot; \\u003cstrong\\u003e\\u003cem\\u003eCathy\\u003c/em\\u003e\\u003c/strong\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\&quot;Excellent teacher, love how he emphasize the basics of communication. Very calm and warm throughout the course. Will definitely do the exercises he recommends.\\&quot; \\u003cstrong\\u003e\\u003cem\\u003eAida Pestelic\\u003c/em\\u003e\\u003c/strong\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\&quot;Even a 2 min video is so informative and easy to understand! Points are put across very clearly and helpful too!\\&quot; \\u003cstrong\\u003e\\u003cem\\u003eNitika Gupta\\u003c/em\\u003e\\u003c/strong\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\&quot;Yes this course was a good match for me, as the previous topical areas and what was mentioned is exactly where I want to develop my communication skills.\\&quot; \\u003cstrong\\u003e\\u003cem\\u003eAnna Keane\\u003c/em\\u003e\\u003c/strong\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\&quot;TJ Walker knows exactly what he\'s talking about, and I love the way he passes the message.\\&quot; \\u003cstrong\\u003e\\u003cem\\u003eCesar Adolfo Correa Urbina\\u003c/em\\u003e\\u003c/strong\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\&quot;This course is a gem! TJ Walker is the best presenter I\'ve ever seen, and he shows you what he knows. He doesn\'t tell you theoretical stuff teachers learn and teach but haven\'t experienced. I completely see that TJ brings you everything he learned in his 30 years of experience. Sure: this course is long and repetitive. But that is the best. All the information of how to be a great presenter is not only in my mind, but in my blood. I feel much more confident about presenting in any situation after doing this course. I recommend it.\\&quot;\\u003cstrong\\u003e\\u003cem\\u003e Bruno Bastos\\u003c/em\\u003e\\u003c/strong\\u003e\\u003c/p\\u003e&quot;,&quot;target_audiences&quot;:[&quot;People who want to be outstanding communicators in their busienss and personal lives&quot;]}\" style=\"margin: 0px; padding: 0px;\"><div class=\"udlite-text-sm  styles--description--3y4KY\" data-purpose=\"course-description\" style=\"margin: 0px; padding: 0px; line-height: 1.4; font-size: 1.4rem;\"><div class=\"show-more--container--1QLmn\" style=\"margin: 0px; padding: 0px; display: flex; flex-direction: column; align-items: flex-start;\"><div class=\"show-more--content--isg5c show-more--with-gradient--2abmN\" style=\"margin: 0px; padding: 0px; overflow: visible; position: relative; width: 700px; max-height: 221px;\"><div style=\"margin: 0px; padding: 0px;\"><div data-purpose=\"safely-set-inner-html:description:description\" style=\"margin: 0px; padding: 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\"><strong style=\"margin: 0px; padding: 0px;\">Communication Skills</strong>&nbsp;are the most important personal skills you can ever develop for your success in life. Life is a series of communications. Those who develop strong&nbsp;<strong style=\"margin: 0px; padding: 0px;\">communication&nbsp;skills</strong>&nbsp;do well in school, secure jobs and promotions and often ascend to the highest levels of leadership in corporations, governments and civic life. People who fail to develop&nbsp;<strong style=\"margin: 0px; padding: 0px;\">communication&nbsp;skills</strong>&nbsp;often have their careers stagnate or plateau in the mid-range. Sadly,&nbsp;<strong style=\"margin: 0px; padding: 0px;\">presentation skills</strong>&nbsp;are either not taught in primary or secondary education or are taught poorly.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\"><strong style=\"margin: 0px; padding: 0px;\">The</strong>&nbsp;<strong style=\"margin: 0px; padding: 0px;\">Complete Communication&nbsp;Skills Masterclass for Life</strong>&nbsp;course is your way to get a Master\'s level education on how to&nbsp;<strong style=\"margin: 0px; padding: 0px;\">communicate&nbsp;effectively</strong>.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">This course is designed to be a one stop shop for all your communication&nbsp;skills training needs. This course covers a vast array of communication needs and scenarios, from how to communicate during a job interview, pitching investors, asking for a raise, speaking one on one or to large groups. And it covers how to speak to big corporations&nbsp;when you have a problem with service, plus public speaking for kids, how to deliver a wedding speech and even a eulogy. You will also become a master of<strong style=\"margin: 0px; padding: 0px;\">&nbsp;persuasion, assertiveness&nbsp;</strong>and all aspects of&nbsp;<strong style=\"margin: 0px; padding: 0px;\">business&nbsp;communication.&nbsp;</strong>Your&nbsp;<strong style=\"margin: 0px; padding: 0px;\">leadership</strong>&nbsp;abilities will expand dramatically as your&nbsp;<strong style=\"margin: 0px; padding: 0px;\">social skills</strong>&nbsp;grow to allow you to&nbsp;<strong style=\"margin: 0px; padding: 0px;\">communicate effectively</strong>&nbsp;in every situation.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">This course has the following:</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">1. More lectures on&nbsp;<strong style=\"margin: 0px; padding: 0px;\">communication&nbsp;skills</strong>&nbsp;than any other course on Udemy, by far.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">2. More hours of&nbsp;<strong style=\"margin: 0px; padding: 0px;\">communication skills&nbsp;</strong>training than any other course (30&nbsp;hours long. Sometimes More is More!)</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">3. More in-depth training techniques than any other course.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">\"I\'ve devoted the last 30 years of my life conducting live, in-person&nbsp;<strong style=\"margin: 0px; padding: 0px;\">communication&nbsp;skills</strong>&nbsp;to Presidents, Prime Ministers, CEOs, Entrepreneurs, Senators, Nobel Peace Prize Winners and Professional Athletes. Now, I\'m excited to bring to you these same insider secrets that will transform you into an excellent presenter. If you take this course and do a few simple homework assignments, I am absolutely convinced I can make your<strong style=\"margin: 0px; padding: 0px;\">&nbsp;communication&nbsp;skills</strong>&nbsp;world-class. You WILL be able to do the following in EVERY&nbsp;<strong style=\"margin: 0px; padding: 0px;\">Presentation</strong>:</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">1. Look comfortable, confident and relaxed, regardless of whether you are sitting or standing, regardless of audience size.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">2. Communicate&nbsp;so your audience understands you.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">3. Communicate&nbsp;so your audience remembers your messages (this is the hardest part).</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">4. Influence people&nbsp;to take the actions you want.\"&nbsp;<strong style=\"margin: 0px; padding: 0px;\"><em style=\"margin: 0px; padding: 0px;\">TJ Walker</em></strong><em style=\"margin: 0px; padding: 0px;\">, President of Media Training Worldwide and best-selling Udemy Instructor.</em></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">“TJ Walker\'s single-minded devotion to presentation has made him the #1 expert for executives seeking guidance on speaking to the public and media.\"&nbsp;<em style=\"margin: 0px; padding: 0px;\">Bob Bowdon, Anchor/Reporter, Bloomberg Television</em></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">“TJ Walker is the leading media trainer in the world.\"&nbsp;<em style=\"margin: 0px; padding: 0px;\">Stu Miller, Viacom News Producer</em></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">(TJ Walker\'s Media Training Worldwide) “The world\'s leading presentation and media training firm.\"&nbsp;<em style=\"margin: 0px; padding: 0px;\">Gregg Jarrett, Fox News Channel Anchor</em></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">TJ Walker is the founder of Media Training Worldwide and has been conducting&nbsp;<strong style=\"margin: 0px; padding: 0px;\">communication skills&nbsp;</strong>training workshops and seminars since 1984. Walker has trained Presidents of countries, Prime Ministers, Nobel Peace Prize winners, Super Bowl winners, US Senators, Miss Universes and Members of Parliament. He has conducted&nbsp;<strong style=\"margin: 0px; padding: 0px;\">communication skills</strong>&nbsp;workshops on six continents in more than two dozen countries.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">His book, \"Secret to Foolproof Presentations\" was a USA Today # 1 Bestseller, as well as a Wall Street Journal, and Business Week Bestseller.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Walker is also the author of \"Media Training AZ\" and \"Media Training Success.\"</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">In 2009, Walker set the Guinness Book of World Records for Most Talk Radio Appearances ever in a 24-hour period.<br style=\"margin: 0px; padding: 0px;\"></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Walker has also served as a former President of the National Speakers Association, New York City.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Please note, this course is not for people who want to sit back and watch lots of flashy graphics, sound effects and take multiple-choice tests. The course is delivered by a world-class instructor who speaks to you directly. And he asks you to communicate back via posting video for critiques.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">This course is ideal for anyone looking to improve their skills in the following areas:&nbsp;<strong style=\"margin: 0px; padding: 0px;\">communication skills, leadership, assertiveness, social skills, public speaking, persuasion</strong>&nbsp;and&nbsp;<strong style=\"margin: 0px; padding: 0px;\">presentation skills</strong>.</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\"><br style=\"margin: 0px; padding: 0px;\"></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Here is what Udemy students say about this course:</p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">\"Hi, My name is Cathy I am from South Africa, I have learned new ways to communicate better with my fellow workers, to get rid of my fear, and to stand up. Thank you TJ I did enjoy your training Course and is still learning\"&nbsp;<strong style=\"margin: 0px; padding: 0px;\"><em style=\"margin: 0px; padding: 0px;\">Cathy</em></strong></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">\"Excellent teacher, love how he emphasize the basics of communication. Very calm and warm throughout the course. Will definitely do the exercises he recommends.\"&nbsp;<strong style=\"margin: 0px; padding: 0px;\"><em style=\"margin: 0px; padding: 0px;\">Aida Pestelic</em></strong></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">\"Even a 2 min video is so informative and easy to understand! Points are put across very clearly and helpful too!\"&nbsp;<strong style=\"margin: 0px; padding: 0px;\"><em style=\"margin: 0px; padding: 0px;\">Nitika Gupta</em></strong></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">\"Yes this course was a good match for me, as the previous topical areas and what was mentioned is exactly where I want to develop my communication skills.\"&nbsp;<strong style=\"margin: 0px; padding: 0px;\"><em style=\"margin: 0px; padding: 0px;\">Anna Keane</em></strong></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">\"TJ Walker knows exactly what he\'s talking about, and I love the way he passes the message.\"&nbsp;<strong style=\"margin: 0px; padding: 0px;\"><em style=\"margin: 0px; padding: 0px;\">Cesar Adolfo Correa Urbina</em></strong></p><p style=\"margin: 0.8rem 0px 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">\"This course is a gem! TJ Walker is the best presenter I\'ve ever seen, and he shows you what he knows. He doesn\'t tell you theoretical stuff teachers learn and teach but haven\'t experienced. I completely see that TJ brings you everything he learned in his 30 years of experience. Sure: this course is long and repetitive. But that is the best. All the information of how to be a great presenter is not only in my mind, but in my blood. I feel much more confident about presenting in any situation after doing this course. I recommend it.\"<strong style=\"margin: 0px; padding: 0px;\"><em style=\"margin: 0px; padding: 0px;\">&nbsp;Bruno Bastos</em></strong></p></div><div class=\"styles--audience--2pZ0S\" data-purpose=\"target-audience\" style=\"margin: 3.2rem 0px 0px; padding: 0px;\"><h2 class=\"udlite-heading-xl styles--audience__title--1Sob_\" style=\"margin-right: 0px; margin-bottom: 1.6rem; margin-left: 0px; padding: 0px; font-size: 2.4rem; font-weight: 700; max-width: 118.4rem; font-family: &quot;sf pro display&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; letter-spacing: -0.02rem;\">Who this course is for:</h2><ul class=\"styles--audience__list--3NCqY\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 0px 2.4rem; font-size: inherit; max-width: 118.4rem;\"><li style=\"margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\">People who want to be outstanding communicators in their busienss and personal lives</li></ul></div></div></div><button type=\"button\" class=\"udlite-btn udlite-btn-medium udlite-btn-ghost udlite-heading-sm show-more--focusable-label--14fP5\" data-css-toggle-id=\"u58-show-more--1\" style=\"padding: 0px; background-image: none; font-family: &quot;sf pro display&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-weight: 700; line-height: 1.2; letter-spacing: -0.02rem; font-size: 1.4rem; position: relative; align-items: center; border-radius: 4px; border-width: initial; border-style: none; border-color: initial; display: inline-flex; min-width: auto; justify-content: center; user-select: none; vertical-align: bottom; white-space: nowrap; height: 4rem; color: rgb(15, 124, 144);\"><span style=\"margin: 0px; padding: 0px;\"><span class=\"show-more--show-less--3eSCX\" style=\"margin: 0px; padding: 0px;\">Show less</span></span><svg aria-hidden=\"true\" focusable=\"false\" class=\"udlite-icon udlite-icon-xsmall show-more--show-less--3eSCX\"><use xlink:href=\"#icon-collapse\"></use></svg></button></div></div></div></div></div></div><div class=\"course-landing-page__main-content component-margin\" style=\"margin: 0px 4.8rem 3.2rem; padding: 0px; max-width: 70rem; color: rgb(60, 59, 55); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;;\"><div class=\"clp-component-render\" style=\"margin: 0px; padding: 0px;\"><div class=\"clp-component-render\" style=\"margin: 0px; padding: 0px;\"><div class=\"ud-component--course-landing-page-udlite--featured-review\" data-component-props=\"{&quot;page&quot;:&quot;clp&quot;,&quot;review_info&quot;:{&quot;rating&quot;:5.0,&quot;_class&quot;:&quot;course_review&quot;,&quot;created&quot;:&quot;11 months ago&quot;,&quot;id&quot;:51243242,&quot;content&quot;:&quot;Totally a wonderful throught the course.I am so thankful to tj for making this course. He\'s an amazing mentor he goes into the details and covers almost every aspect. His teaching style is brilliant probably one of the best i have ever seen. He has put so much effort and is connected to his audience. I highly recommend this course if you want to be a pro at communication skills. Can\'t thank Tj enough for this course totally loved it. :D&quot;,&quot;user&quot;:{&quot;title&quot;:&quot;Harsh vardhan soni&quot;,&quot;name&quot;:&quot;Harsh vardhan&quot;,&quot;num_course_reviews&quot;:5,&quot;initials&quot;:&quot;HS&quot;,&quot;image_75x75&quot;:&quot;https://img-b.udemycdn.com/user/75x75/98320468_a236.jpg?secure=zfFsGMdtj2AMTbXg8aFRlw%3D%3D%2C1617047163&quot;,&quot;total_subscribed_courses&quot;:40,&quot;_class&quot;:&quot;user&quot;,&quot;image_50x50&quot;:&quot;https://img-a.udemycdn.com/user/50x50/98320468_a236.jpg?90Xs0jp1d43NKIRf8XBjf4hvQMgR7dHCZ3M2cxlcf4AbpKR_4xmvvW8NdTSeL64mtHUbK_cGnu92IDac6NONE5PNIPE7V-UitmujP1wEME3a_x_s4UNPo9y-iA&quot;,&quot;id&quot;:98320468,&quot;display_name&quot;:&quot;Harsh vardhan soni&quot;},&quot;course&quot;:{&quot;title&quot;:&quot;The Complete Communication Skills Master Class for Life&quot;,&quot;id&quot;:1802404,&quot;_class&quot;:&quot;course&quot;,&quot;url&quot;:&quot;/course/the-complete-communication-skills-master-class-for-life/&quot;}}}\" style=\"margin: 0px; padding: 0px;\"><div class=\"udlite-text-sm featured-review--background-wrapper--FamGn\" style=\"margin: 0px; padding: 2.4rem; line-height: 1.4; font-size: 1.4rem; background: rgb(251, 251, 248); border: 1px solid rgb(220, 218, 203); border-radius: 4px;\"><br class=\"Apple-interchange-newline\"></div></div></div></div></div>', '/uploads/media_manager/28.png', 'http://thehappyindianstore.com/', 'HTML5', '[\"english\"]', '[\"http:\\/\\/thehappyindianstore.com\\/\"]', '[\"english\"]', 0, 455, 0, NULL, 'English', '[\"\"]', NULL, 0, 5, 4, NULL, '2021-03-29 15:35:56', '2021-04-05 03:17:56'),
(26, 'what is articles', 'what-is-articles', 'Beginner', '1', '<div data-purpose=\"safely-set-inner-html:description:description\" style=\"margin: 0px; padding: 0px; color: rgb(28, 29, 31); font-family: &quot;sf pro text&quot;, -apple-system, system-ui, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">In this course, you will have access to 60+ videos and audio files detailing the consonants, vowels, stress, rhythm &amp; inflection that makes up the core of British English. For over 25 years, I have taught academics from the University of Cambridge, London School of Economics &amp; the Imperial College London and now I am sharing my knowledge with face-to-face videos that will break down the very centre of the English language - From the way your mouth moves to the correct use of stress in a sentence, this course will give you every tool you need to become an effective communicator in spoken English.</p><div><br></div></div><div class=\"styles--audience--2pZ0S\" data-purpose=\"target-audience\" style=\"margin: 3.2rem 0px 0px; padding: 0px; color: rgb(28, 29, 31); font-family: &quot;sf pro text&quot;, -apple-system, system-ui, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 14px;\"></div>', '<p><div class=\"styles--audience--2pZ0S\" data-purpose=\"target-audience\" style=\"box-sizing: border-box; margin: 3.2rem 0px 0px; padding: 0px; color: rgb(28, 29, 31); font-family: &quot;sf pro text&quot;, -apple-system, system-ui, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div></p><div data-purpose=\"safely-set-inner-html:description:description\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(28, 29, 31); font-family: &quot;sf pro text&quot;, -apple-system, system-ui, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; font-weight: 400; max-width: 118.4rem;\">In this course, you will have access to 60+ videos and audio files detailing the consonants, vowels, stress, rhythm &amp; inflection that makes up the core of British English. For over 25 years, I have taught academics from the University of Cambridge, London School of Economics &amp; the Imperial College London and now I am sharing my knowledge with face-to-face videos that will break down the very centre of the English language - From the way your mouth moves to the correct use of stress in a sentence, this course will give you every tool you need to become an effective communicator in spoken English.</p></div>', '/uploads/media_manager/29.jpeg', 'https://www.youtube.com/watch?v=UVYwjVqI_Bs', 'Youtube', '[\"Have a desire to speak British English clearly and with ease\"]', '[\"Good english speaking skills\"]', '[\"english\",\"speaking\",\"skills\"]', 0, 999, 0, NULL, 'English', '[\"\"]', NULL, 0, 5, 4, NULL, '2021-04-02 09:45:55', '2021-04-05 03:17:55'),
(27, 'IELTS Level 3', 'ielts-level-3', 'Advanced', '1', '<p>LANGUAFINA has simplified the English learning process for those who aspire to converse</p><p>confidently. This online course makes you speak English correctly and confidently through</p><p>one-on-one speaking classes via an audio call. <span style=\"background-color: transparent;\">The specialized trainers at LANGUAFINA from</span></p><p>around the country will now teach you by conversing with you on daily basis giving you an</p><p>environment where you can:</p><p>- Easily converse without any hesitation</p><p>- Improve English while practicing daily</p><p>- Have good command over the English Language</p><p>- Let the experts handle and correct the mistakes</p><p>- Enhance your Vocabulary</p><p>- Correct your grammar</p><p>- Increase your Fluency</p><p>- Gain Confidence</p>', '<p>Our practical approach towards language learning is what makes us separate from the rest.</p><p>English speaking practice is considered to be the best method to build one’s fluency and</p><p>remove hesitation. Our trainers are amongst the best in the Industry. They come from from</p><p>different parts of the country with rich experience in their respective domains, and have</p><p>been chosen as per our stringent selection criteria. By conversing in English with a trainer,</p><p>one can quickly build supreme confidence and fluency.</p><p>We, at LANGUAFINA believe that when we speak English on a daily basis, we train our mind</p><p>to understand and reply to anything said to us in language. Thereby, building the capability</p><p>to think in English and deliver it in the most effective manner is what we teach at</p><p>LANGUAFINA.</p>', '/uploads/media_manager/32.png', 'https://youtu.be/SvzeeJeeQEQ', 'Youtube', '[\"Baisc English\",\"                                                        English\",\"                                                        Speakig\",\"                                                        IELTS1\"]', '[\"English\",\"                                                                      Basic\"]', '[\"English\",\"Speaking\",\"IELETS\"]', 0, 5000, 0, NULL, 'English', '[\"\"]', 'IELETS level 2 classes online', 1, 5, 4, NULL, '2021-04-05 18:22:47', '2021-04-05 19:18:53');

-- --------------------------------------------------------

--
-- Table structure for table `course_comments`
--

CREATE TABLE `course_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` double DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `replay` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_purchase_histories`
--

CREATE TABLE `course_purchase_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `align` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `rate`, `is_published`, `align`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'INR', 'INR', '₹', 1, 1, 0, NULL, NULL, '2021-04-05 03:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forums`
--

CREATE TABLE `forums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `discussion` longtext COLLATE utf8mb4_unicode_ci,
  `category` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum_post_views`
--

CREATE TABLE `forum_post_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `helpful_answers`
--

CREATE TABLE `helpful_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_reply_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `linked` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tw` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` longtext COLLATE utf8mb4_unicode_ci,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `signature` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`id`, `name`, `email`, `phone`, `address`, `image`, `balance`, `linked`, `fb`, `tw`, `skype`, `about`, `package_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`, `signature`) VALUES
(3, 'amit', 'amitshrma22@gmail.com', '09888555806', 'H#20, R#20, Address City, Town', 'uploads/instructor/871P0pOWCBD6M27oMG5Y5Sj49FQ1zVlm8oCAWgd5.jpg', 331, 'https://www.linkedin.com/', 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.skypee.com/', 'This is my about us section.', 1, 5, NULL, '2020-06-10 04:08:06', '2021-03-30 18:07:04', NULL),
(8, 'rumon', 'rumon@mail.com', NULL, NULL, 'uploads/instructor/ZguHDula9P98arVGlSHNKhsp1SMZLaXFSfE6VmKj.jpg', 0, NULL, NULL, NULL, NULL, NULL, 1, 21, NULL, '2020-12-21 06:37:08', '2020-12-21 08:06:24', NULL),
(9, 'prince', 'prince@mail.com', NULL, NULL, 'uploads/instructor/G1v5q9RkbF9Qz8FbygQZpMoF6vDKWSotKwXvEdZw.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 22, NULL, '2020-12-21 07:12:31', '2020-12-21 07:13:57', NULL),
(10, 'Azharul Islam Naeem', 'naeem@mail.com', NULL, NULL, 'uploads/instructor/NC77i2wPd5e4s1OhlLBaKr5u95ifOMaeiHuNfOiu.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 23, NULL, '2020-12-21 07:34:31', '2020-12-21 07:35:28', NULL),
(11, 'puneet', 'design.lukee@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 25, NULL, '2021-03-30 18:10:14', '2021-03-30 18:10:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `instructor_accounts`
--

CREATE TABLE `instructor_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Bank',
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_number` int(11) DEFAULT NULL,
  `paypal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Paypal',
  `paypal_acc_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_acc_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Stripe',
  `stripe_acc_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_acc_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructor_earnings`
--

CREATE TABLE `instructor_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `course_price` double NOT NULL,
  `will_get` double NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructor_subscription_earnings`
--

CREATE TABLE `instructor_subscription_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructor_subscription_payments`
--

CREATE TABLE `instructor_subscription_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subscription_duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `know_abouts`
--

CREATE TABLE `know_abouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci,
  `align` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `know_abouts`
--

INSERT INTO `know_abouts` (`id`, `icon`, `title`, `desc`, `align`, `video`, `image`, `created_at`, `updated_at`) VALUES
(1, 'icofont-document-folder', 'Delectus commodo id', 'Nostrud repudiandae', 'left', 'https://www.medomogyko.org', 'uploads/know/87rNny7BLgp7GdyXrel4VYEACaLmfVRppenINEOB.png', '2020-12-09 10:04:00', '2020-12-09 10:11:35'),
(2, 'icofont-document-folder', 'Inventore quam maxim', 'Nulla adipisicing si', 'right', 'https://www.mujawoxataryjes.co.uk', NULL, '2020-12-09 10:06:39', '2020-12-09 10:06:39'),
(3, NULL, NULL, NULL, 'center', 'https://www.youtube.com/watch?v=Pzh27L4Y1YU', 'uploads/know/tD9JbJnB3RFkiHQNc1TE64uMDQkwDL0lM3eg2EFj.jpg', '2020-12-09 10:07:30', '2020-12-21 06:00:49'),
(4, 'icofont-document-folder', 'Id delectus id deb', 'Id molestiae veniam', 'left', 'https://www.doqehy.mobi', 'uploads/know/uG08D5XIjehzStEuFpXZ5HkABb3xPHFysqeI7QK9.png', '2020-12-09 10:08:00', '2020-12-09 10:08:00'),
(5, 'icofont-document-folder', 'Aut modi aliquip ali', 'Vel animi aperiam f', 'left', 'https://www.fahuxab.net', 'uploads/know/BB07a4L4KYYDfnTBOpBfy0Lcfm8SlSh6bcw7qLQs.png', '2020-12-09 10:09:10', '2020-12-09 10:09:10'),
(6, 'icofont-document-folder', 'Voluptatem sit ullam', 'Voluptatem sequi qu', 'right', NULL, NULL, '2020-12-09 10:55:24', '2020-12-21 06:02:03'),
(7, 'icofont-document-folder', 'Online Course', 'Explore a variety of fresh topics', 'top', NULL, NULL, '2020-12-13 03:11:37', '2020-12-13 03:11:37'),
(8, 'icofont-cubes', 'expert instruction', 'expert instruction', 'top', NULL, NULL, '2020-12-13 03:12:26', '2020-12-13 03:12:26'),
(9, 'icofont-gears', 'lifetime access', 'Learn on your schedule', 'top', NULL, NULL, '2020-12-13 03:13:09', '2020-12-13 03:13:09'),
(10, 'icofont-document-folder', 'Lorem Ipsum is simply dummy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has', 'right', NULL, NULL, '2020-12-21 06:17:17', '2020-12-21 06:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Eng', 'English', 'Flag_of_India.png', '2021-04-02 09:38:34', '2021-04-02 09:38:34');

-- --------------------------------------------------------

--
-- Table structure for table `laravel_logger_activity`
--

CREATE TABLE `laravel_logger_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `route` longtext COLLATE utf8mb4_unicode_ci,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `methodType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laravel_logger_activity`
--

INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4289, 'Viewed /', 'Guest', NULL, 'http://localhost/courselms-learning-management-system', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/', 'GET', '2021-02-25 09:59:40', '2021-02-25 09:59:40', NULL),
(4290, 'Logged In', 'Registered', 18, 'http://localhost/courselms-learning-management-system/login', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/login', 'POST', '2021-02-25 09:59:51', '2021-02-25 09:59:51', NULL),
(4291, 'Viewed dashboard/home', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/home', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/login', 'GET', '2021-02-25 09:59:52', '2021-02-25 09:59:52', NULL),
(4292, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/home', 'POST', '2021-02-25 09:59:54', '2021-02-25 09:59:54', NULL),
(4293, 'Viewed dashboard/addon/manager', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/home', 'GET', '2021-02-25 10:00:03', '2021-02-25 10:00:03', NULL),
(4294, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'POST', '2021-02-25 10:00:05', '2021-02-25 10:00:05', NULL),
(4295, 'Viewed dashboard/addon/index/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/index/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:00:05', '2021-02-25 10:00:05', NULL),
(4296, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:00:45', '2021-02-25 10:00:45', NULL),
(4297, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:00:46', '2021-02-25 10:00:46', NULL),
(4298, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:00:46', '2021-02-25 10:00:46', NULL),
(4299, 'Viewed dashboard/addon/setup/coupon', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/coupon', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:00:51', '2021-02-25 10:00:51', NULL),
(4300, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/coupon', 'POST', '2021-02-25 10:00:52', '2021-02-25 10:00:52', NULL),
(4301, 'Created dashboard/addon/install', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/coupon', 'POST', '2021-02-25 10:01:29', '2021-02-25 10:01:29', NULL),
(4302, 'Viewed dashboard/addon/manager', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/coupon', 'GET', '2021-02-25 10:01:30', '2021-02-25 10:01:30', NULL),
(4303, 'Viewed dashboard/addon/index/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/index/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:01:32', '2021-02-25 10:01:32', NULL),
(4304, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'POST', '2021-02-25 10:01:32', '2021-02-25 10:01:32', NULL),
(4305, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:01:46', '2021-02-25 10:01:46', NULL),
(4306, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:01:47', '2021-02-25 10:01:47', NULL),
(4307, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:01:47', '2021-02-25 10:01:47', NULL),
(4308, 'Viewed dashboard/addon/setup/certificate', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/certificate', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:01:53', '2021-02-25 10:01:53', NULL),
(4309, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/certificate', 'POST', '2021-02-25 10:01:54', '2021-02-25 10:01:54', NULL),
(4310, 'Created dashboard/addon/install', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/certificate', 'POST', '2021-02-25 10:02:31', '2021-02-25 10:02:31', NULL),
(4311, 'Viewed dashboard/addon/manager', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/certificate', 'GET', '2021-02-25 10:02:31', '2021-02-25 10:02:31', NULL),
(4312, 'Viewed dashboard/addon/index/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/index/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:02:33', '2021-02-25 10:02:33', NULL),
(4313, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'POST', '2021-02-25 10:02:33', '2021-02-25 10:02:33', NULL),
(4314, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:02:48', '2021-02-25 10:02:48', NULL),
(4315, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:02:50', '2021-02-25 10:02:50', NULL),
(4316, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:02:50', '2021-02-25 10:02:50', NULL),
(4317, 'Viewed dashboard/addon/setup/quiz', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/quiz', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:02:56', '2021-02-25 10:02:56', NULL),
(4318, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/quiz', 'POST', '2021-02-25 10:02:57', '2021-02-25 10:02:57', NULL),
(4319, 'Created dashboard/addon/install', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/quiz', 'POST', '2021-02-25 10:03:18', '2021-02-25 10:03:18', NULL),
(4320, 'Viewed dashboard/addon/manager', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/quiz', 'GET', '2021-02-25 10:03:18', '2021-02-25 10:03:18', NULL),
(4321, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'POST', '2021-02-25 10:03:20', '2021-02-25 10:03:20', NULL),
(4322, 'Viewed dashboard/addon/index/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/index/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:03:20', '2021-02-25 10:03:20', NULL),
(4323, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:03:27', '2021-02-25 10:03:27', NULL),
(4324, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:03:29', '2021-02-25 10:03:29', NULL),
(4325, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:03:29', '2021-02-25 10:03:29', NULL),
(4326, 'Viewed dashboard/addon/setup/zoom', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/zoom', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:03:41', '2021-02-25 10:03:41', NULL),
(4327, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:03:41', '2021-02-25 10:03:41', NULL),
(4328, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:03:42', '2021-02-25 10:03:42', NULL),
(4329, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:03:43', '2021-02-25 10:03:43', NULL),
(4330, 'Viewed dashboard/addon/setup/quiz', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/quiz', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:03:50', '2021-02-25 10:03:50', NULL),
(4331, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/quiz', 'POST', '2021-02-25 10:03:52', '2021-02-25 10:03:52', NULL),
(4332, 'Viewed dashboard/addon/manager', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/quiz', 'GET', '2021-02-25 10:04:11', '2021-02-25 10:04:11', NULL),
(4333, 'Viewed dashboard/addon/index/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/index/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:04:12', '2021-02-25 10:04:12', NULL),
(4334, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'POST', '2021-02-25 10:04:12', '2021-02-25 10:04:12', NULL),
(4335, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:04:14', '2021-02-25 10:04:14', NULL),
(4336, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:04:16', '2021-02-25 10:04:16', NULL),
(4337, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:04:16', '2021-02-25 10:04:16', NULL),
(4338, 'Viewed dashboard/addon/setup/zoom', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/zoom', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:04:18', '2021-02-25 10:04:18', NULL),
(4339, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:04:19', '2021-02-25 10:04:19', NULL),
(4340, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:04:20', '2021-02-25 10:04:20', NULL),
(4341, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:04:20', '2021-02-25 10:04:20', NULL),
(4342, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:07:17', '2021-02-25 10:07:17', NULL),
(4343, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:07:18', '2021-02-25 10:07:18', NULL),
(4344, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:07:18', '2021-02-25 10:07:18', NULL),
(4345, 'Viewed dashboard/addon/setup/zoom', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/zoom', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:07:21', '2021-02-25 10:07:21', NULL),
(4346, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:07:21', '2021-02-25 10:07:21', NULL),
(4347, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:07:22', '2021-02-25 10:07:22', NULL),
(4348, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:07:22', '2021-02-25 10:07:22', NULL),
(4349, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:07:47', '2021-02-25 10:07:47', NULL),
(4350, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:07:48', '2021-02-25 10:07:48', NULL),
(4351, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:07:48', '2021-02-25 10:07:48', NULL),
(4352, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:08:50', '2021-02-25 10:08:50', NULL),
(4353, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:08:51', '2021-02-25 10:08:51', NULL),
(4354, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:08:51', '2021-02-25 10:08:51', NULL),
(4355, 'Viewed dashboard/addon/setup/zoom', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/zoom', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:09:11', '2021-02-25 10:09:11', NULL),
(4356, 'Viewed dashboard/addon/setup/zoom', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/zoom', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:11:23', '2021-02-25 10:11:23', NULL),
(4357, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/zoom', 'POST', '2021-02-25 10:11:24', '2021-02-25 10:11:24', NULL),
(4358, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:11:26', '2021-02-25 10:11:26', NULL),
(4359, 'Viewed dashboard/addon/setup/paytm', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/paytm', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:11:31', '2021-02-25 10:11:31', NULL),
(4360, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/paytm', 'POST', '2021-02-25 10:11:33', '2021-02-25 10:11:33', NULL),
(4361, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:11:34', '2021-02-25 10:11:34', NULL),
(4362, 'Viewed dashboard/addon/setup/zoom', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/zoom', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:11:35', '2021-02-25 10:11:35', NULL),
(4363, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/zoom', 'POST', '2021-02-25 10:11:37', '2021-02-25 10:11:37', NULL),
(4364, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:11:38', '2021-02-25 10:11:38', NULL),
(4365, 'Viewed dashboard/addon/setup/quiz', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/quiz', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:11:39', '2021-02-25 10:11:39', NULL),
(4366, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/quiz', 'POST', '2021-02-25 10:11:41', '2021-02-25 10:11:41', NULL),
(4367, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:11:42', '2021-02-25 10:11:42', NULL),
(4368, 'Viewed dashboard/addon/setup/forum', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/forum', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:11:43', '2021-02-25 10:11:43', NULL),
(4369, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/forum', 'POST', '2021-02-25 10:11:45', '2021-02-25 10:11:45', NULL),
(4370, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:11:46', '2021-02-25 10:11:46', NULL),
(4371, 'Viewed dashboard/addon/setup/certificate', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/certificate', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:11:47', '2021-02-25 10:11:47', NULL),
(4372, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/certificate', 'POST', '2021-02-25 10:11:49', '2021-02-25 10:11:49', NULL),
(4373, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:11:50', '2021-02-25 10:11:50', NULL),
(4374, 'Viewed dashboard/addon/setup/subscription', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/subscription', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:11:51', '2021-02-25 10:11:51', NULL),
(4375, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/subscription', 'POST', '2021-02-25 10:11:53', '2021-02-25 10:11:53', NULL),
(4376, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:11:54', '2021-02-25 10:11:54', NULL),
(4377, 'Viewed dashboard/addon/setup/coupon', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/coupon', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:11:55', '2021-02-25 10:11:55', NULL),
(4378, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/coupon', 'POST', '2021-02-25 10:11:57', '2021-02-25 10:11:57', NULL),
(4379, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:11:59', '2021-02-25 10:11:59', NULL),
(4380, 'Viewed dashboard/addon/setup/zoom', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/zoom', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:14:07', '2021-02-25 10:14:07', NULL),
(4381, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/zoom', 'POST', '2021-02-25 10:14:10', '2021-02-25 10:14:10', NULL),
(4382, 'Created dashboard/addon/install', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/zoom', 'POST', '2021-02-25 10:14:30', '2021-02-25 10:14:30', NULL),
(4383, 'Viewed dashboard/addon/manager', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/zoom', 'GET', '2021-02-25 10:14:31', '2021-02-25 10:14:31', NULL),
(4384, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'POST', '2021-02-25 10:14:33', '2021-02-25 10:14:33', NULL),
(4385, 'Viewed dashboard/addon/index/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/index/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:14:33', '2021-02-25 10:14:33', NULL),
(4386, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:14:45', '2021-02-25 10:14:45', NULL),
(4387, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:14:47', '2021-02-25 10:14:47', NULL),
(4388, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:14:47', '2021-02-25 10:14:47', NULL),
(4389, 'Viewed dashboard/addon/setup/coupon', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/coupon', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:14:58', '2021-02-25 10:14:58', NULL),
(4390, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/coupon', 'POST', '2021-02-25 10:15:01', '2021-02-25 10:15:01', NULL),
(4391, 'Viewed dashboard/addon/manager', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/coupon', 'GET', '2021-02-25 10:15:01', '2021-02-25 10:15:01', NULL),
(4392, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'POST', '2021-02-25 10:15:04', '2021-02-25 10:15:04', NULL),
(4393, 'Viewed dashboard/addon/index/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/index/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:15:04', '2021-02-25 10:15:04', NULL),
(4394, 'Viewed dashboard/addon/installation', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:15:07', '2021-02-25 10:15:07', NULL),
(4395, 'Viewed dashboard/addon/install/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:15:09', '2021-02-25 10:15:09', NULL),
(4396, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'POST', '2021-02-25 10:15:09', '2021-02-25 10:15:09', NULL),
(4397, 'Viewed dashboard/addon/setup/forum', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/forum', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/installation', 'GET', '2021-02-25 10:15:13', '2021-02-25 10:15:13', NULL),
(4398, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/forum', 'POST', '2021-02-25 10:15:15', '2021-02-25 10:15:15', NULL),
(4399, 'Created dashboard/addon/install', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/install', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/forum', 'POST', '2021-02-25 10:15:32', '2021-02-25 10:15:32', NULL),
(4400, 'Viewed dashboard/addon/manager', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/setup/forum', 'GET', '2021-02-25 10:15:34', '2021-02-25 10:15:34', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4401, 'Viewed dashboard/addon/index/page', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/addon/index/page?_token=Yzs1St1D9bn9BhbdVhi7x9s71J6Ib9FwxEIPhjrp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'GET', '2021-02-25 10:15:36', '2021-02-25 10:15:36', NULL),
(4402, 'Created dashboard/media/manager/slide', 'Registered', 18, 'http://localhost/courselms-learning-management-system/dashboard/media/manager/slide', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'en-US,en;q=0.9', 'http://localhost/courselms-learning-management-system/dashboard/addon/manager', 'POST', '2021-02-25 10:15:36', '2021-02-25 10:15:36', NULL),
(4403, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.159.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/install/setup/admin/store', 'GET', '2021-03-28 13:38:11', '2021-03-28 13:38:11', NULL),
(4404, 'Crawler crawled http://thehappyindianstore.com', 'Crawler', NULL, 'http://thehappyindianstore.com', '157.39.159.111', 'WhatsApp/2.21.5.17 A', 'en', NULL, 'GET', '2021-03-28 13:39:16', '2021-03-28 13:39:16', NULL),
(4405, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Mobile/15E148 Safari/604.1', 'en-us', NULL, 'GET', '2021-03-28 17:16:17', '2021-03-28 17:16:17', NULL),
(4406, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Mobile/15E148 Safari/604.1', 'en-us', NULL, 'GET', '2021-03-28 17:16:17', '2021-03-28 17:16:17', NULL),
(4407, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-28 18:02:02', '2021-03-28 18:02:02', NULL),
(4408, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-28 18:02:12', '2021-03-28 18:02:12', NULL),
(4409, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-28 18:32:40', '2021-03-28 18:32:40', NULL),
(4410, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-28 18:32:46', '2021-03-28 18:32:46', NULL),
(4411, 'Viewed course/the-complete-android-n-developer-course', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-android-n-developer-course', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-28 18:33:01', '2021-03-28 18:33:01', NULL),
(4412, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '3.239.181.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:68.0) Gecko/20100101 Firefox/68.0', NULL, NULL, 'GET', '2021-03-28 18:47:32', '2021-03-28 18:47:32', NULL),
(4413, 'Viewed course/the-complete-android-n-developer-course', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-android-n-developer-course', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-28 23:37:11', '2021-03-28 23:37:11', NULL),
(4414, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/course/the-complete-android-n-developer-course', 'GET', '2021-03-29 00:18:58', '2021-03-29 00:18:58', NULL),
(4415, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/course/the-complete-android-n-developer-course', 'GET', '2021-03-29 00:18:58', '2021-03-29 00:18:58', NULL),
(4416, 'Viewed course/the-complete-android-n-developer-course', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-android-n-developer-course', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-29 00:18:58', '2021-03-29 00:18:58', NULL),
(4417, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-29 00:18:58', '2021-03-29 00:18:58', NULL),
(4418, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/course/the-complete-android-n-developer-course', 'GET', '2021-03-29 00:19:11', '2021-03-29 00:19:11', NULL),
(4419, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-29 02:34:16', '2021-03-29 02:34:16', NULL),
(4420, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-29 02:34:16', '2021-03-29 02:34:16', NULL),
(4421, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-29 02:34:16', '2021-03-29 02:34:16', NULL),
(4422, 'Viewed course/the-complete-android-n-developer-course', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-android-n-developer-course', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 02:34:25', '2021-03-29 02:34:25', NULL),
(4423, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.159.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-29 03:00:28', '2021-03-29 03:00:28', NULL),
(4424, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-29 06:01:27', '2021-03-29 06:01:27', NULL),
(4425, 'Viewed signup', 'Guest', NULL, 'http://thehappyindianstore.com/signup', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-29 06:01:47', '2021-03-29 06:01:47', NULL),
(4426, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-29 14:32:20', '2021-03-29 14:32:20', NULL),
(4427, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-29 14:36:58', '2021-03-29 14:36:58', NULL),
(4428, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-29 14:38:53', '2021-03-29 14:38:53', NULL),
(4429, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-29 14:38:54', '2021-03-29 14:38:54', NULL),
(4430, 'Viewed dashboard/theme/manager', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/theme/manager', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-29 14:39:16', '2021-03-29 14:39:16', NULL),
(4431, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-29 14:39:17', '2021-03-29 14:39:17', NULL),
(4432, 'Viewed dashboard/theme/index/page', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/theme/index/page?_token=Op9w3qRZGkSR2xIygPjNy8EqTNspn4vpZYYZgVId', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'GET', '2021-03-29 14:39:20', '2021-03-29 14:39:20', NULL),
(4433, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'POST', '2021-03-29 14:39:22', '2021-03-29 14:39:22', NULL),
(4434, 'Viewed dashboard/app/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/app/setting', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'GET', '2021-03-29 14:39:53', '2021-03-29 14:39:53', NULL),
(4435, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/app/setting', 'POST', '2021-03-29 14:39:56', '2021-03-29 14:39:56', NULL),
(4436, 'Viewed dashboard/slider/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/app/setting', 'GET', '2021-03-29 14:40:07', '2021-03-29 14:40:07', NULL),
(4437, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'POST', '2021-03-29 14:40:12', '2021-03-29 14:40:12', NULL),
(4438, 'Viewed dashboard/user/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/user/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-29 14:40:44', '2021-03-29 14:40:44', NULL),
(4439, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/user/index', 'POST', '2021-03-29 14:40:55', '2021-03-29 14:40:55', NULL),
(4440, 'Viewed dashboard/user/edit/18', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/user/edit/18', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/user/index', 'GET', '2021-03-29 14:41:07', '2021-03-29 14:41:07', NULL),
(4441, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/user/edit/18', 'POST', '2021-03-29 14:41:11', '2021-03-29 14:41:11', NULL),
(4442, 'Viewed dashboard/addon/manager', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/addon/manager', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/user/edit/18', 'GET', '2021-03-29 14:41:17', '2021-03-29 14:41:17', NULL),
(4443, 'Viewed dashboard/addon/index/page', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/addon/index/page?_token=Op9w3qRZGkSR2xIygPjNy8EqTNspn4vpZYYZgVId', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/addon/manager', 'GET', '2021-03-29 14:41:21', '2021-03-29 14:41:21', NULL),
(4444, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/addon/manager', 'POST', '2021-03-29 14:41:21', '2021-03-29 14:41:21', NULL),
(4445, 'Viewed dashboard/slider/edit/1', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/edit/1', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-29 14:41:23', '2021-03-29 14:41:23', NULL),
(4446, 'Viewed dashboard/media/manager/create', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/create', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-29 14:41:33', '2021-03-29 14:41:33', NULL),
(4447, 'Created dashboard/media/manager/store', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/store', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'POST', '2021-03-29 14:42:14', '2021-03-29 14:42:14', NULL),
(4448, 'Viewed dashboard/slider/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-29 14:42:26', '2021-03-29 14:42:26', NULL),
(4449, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'POST', '2021-03-29 14:42:30', '2021-03-29 14:42:30', NULL),
(4450, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-29 14:43:50', '2021-03-29 14:43:50', NULL),
(4451, 'Viewed dashboard/other/settings', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/other/settings', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-29 14:43:52', '2021-03-29 14:43:52', NULL),
(4452, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-29 14:43:53', '2021-03-29 14:43:53', NULL),
(4453, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/pages/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-29 14:43:54', '2021-03-29 14:43:54', NULL),
(4454, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'POST', '2021-03-29 14:43:55', '2021-03-29 14:43:55', NULL),
(4455, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'POST', '2021-03-29 14:43:58', '2021-03-29 14:43:58', NULL),
(4456, 'Created dashboard/site/setting/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting/update', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-29 14:46:12', '2021-03-29 14:46:12', NULL),
(4457, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-29 14:46:13', '2021-03-29 14:46:13', NULL),
(4458, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-29 14:46:15', '2021-03-29 14:46:15', NULL),
(4459, 'Created dashboard/site/setting/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting/update', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-29 14:46:41', '2021-03-29 14:46:41', NULL),
(4460, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-29 14:46:41', '2021-03-29 14:46:41', NULL),
(4461, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-29 14:46:45', '2021-03-29 14:46:45', NULL),
(4462, 'Created dashboard/other/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/other/setting', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'POST', '2021-03-29 14:46:52', '2021-03-29 14:46:52', NULL),
(4463, 'Viewed dashboard/other/settings', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/other/settings', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'GET', '2021-03-29 14:46:52', '2021-03-29 14:46:52', NULL),
(4464, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'POST', '2021-03-29 14:46:54', '2021-03-29 14:46:54', NULL),
(4465, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-29 14:46:58', '2021-03-29 14:46:58', NULL),
(4466, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-29 14:47:03', '2021-03-29 14:47:03', NULL),
(4467, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-29 14:47:08', '2021-03-29 14:47:08', NULL),
(4468, 'Created dashboard/other/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/other/setting', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'POST', '2021-03-29 14:47:16', '2021-03-29 14:47:16', NULL),
(4469, 'Viewed dashboard/other/settings', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/other/settings', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'GET', '2021-03-29 14:47:17', '2021-03-29 14:47:17', NULL),
(4470, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'POST', '2021-03-29 14:47:19', '2021-03-29 14:47:19', NULL),
(4471, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-29 14:47:22', '2021-03-29 14:47:22', NULL),
(4472, 'Viewed dashboard/slider/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-29 14:47:30', '2021-03-29 14:47:30', NULL),
(4473, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'POST', '2021-03-29 14:47:33', '2021-03-29 14:47:33', NULL),
(4474, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-29 14:47:35', '2021-03-29 14:47:35', NULL),
(4475, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-29 14:47:44', '2021-03-29 14:47:44', NULL),
(4476, 'Created dashboard/site/setting/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting/update', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-29 14:48:03', '2021-03-29 14:48:03', NULL),
(4477, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-29 14:48:05', '2021-03-29 14:48:05', NULL),
(4478, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-29 14:48:09', '2021-03-29 14:48:09', NULL),
(4479, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-29 14:48:11', '2021-03-29 14:48:11', NULL),
(4480, 'Viewed courses', 'Registered', 24, 'http://thehappyindianstore.com/courses', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 14:48:59', '2021-03-29 14:48:59', NULL),
(4481, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-29 14:49:34', '2021-03-29 14:49:34', NULL),
(4482, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-29 14:49:40', '2021-03-29 14:49:40', NULL),
(4483, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/courses', 'GET', '2021-03-29 14:50:49', '2021-03-29 14:50:49', NULL),
(4484, 'Viewed dashboard/category/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-29 14:58:07', '2021-03-29 14:58:07', NULL),
(4485, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 14:58:09', '2021-03-29 14:58:09', NULL),
(4486, 'Viewed dashboard/category/edit/1', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/edit/1', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 14:58:14', '2021-03-29 14:58:14', NULL),
(4487, 'Created dashboard/media/manager/filter/slider', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/filter/slider', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:00:16', '2021-03-29 15:00:16', NULL),
(4488, 'Created dashboard/media/manager/filter/organization', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/filter/organization', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:00:18', '2021-03-29 15:00:18', NULL),
(4489, 'Created dashboard/media/manager/filter/package', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/filter/package', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:00:19', '2021-03-29 15:00:19', NULL),
(4490, 'Created dashboard/media/manager/filter/source_code', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/filter/source_code', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:00:22', '2021-03-29 15:00:22', NULL),
(4491, 'Created dashboard/media/manager/filter/thumbnail', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/filter/thumbnail', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:00:25', '2021-03-29 15:00:25', NULL),
(4492, 'Created dashboard/media/manager/filter/thumbnail', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/filter/thumbnail', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:00:29', '2021-03-29 15:00:29', NULL),
(4493, 'Created dashboard/media/manager/filter/file', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/filter/file', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:00:30', '2021-03-29 15:00:30', NULL),
(4494, 'Viewed dashboard/media/manager/create', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/create', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:01:20', '2021-03-29 15:01:20', NULL),
(4495, 'Created dashboard/media/manager/store', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/store', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:01:35', '2021-03-29 15:01:35', NULL),
(4496, 'Viewed dashboard/category/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:01:36', '2021-03-29 15:01:36', NULL),
(4497, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:01:38', '2021-03-29 15:01:38', NULL),
(4498, 'Viewed dashboard/category/edit/3', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/edit/3', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:02:04', '2021-03-29 15:02:04', NULL),
(4499, 'Created dashboard/category/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/update', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:02:10', '2021-03-29 15:02:10', NULL),
(4500, 'Viewed dashboard/category/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:02:11', '2021-03-29 15:02:11', NULL),
(4501, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:02:14', '2021-03-29 15:02:14', NULL),
(4502, 'Viewed dashboard/category/edit/4', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/edit/4', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:02:20', '2021-03-29 15:02:20', NULL),
(4503, 'Viewed dashboard/category/edit/4', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/edit/4', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:02:42', '2021-03-29 15:02:42', NULL),
(4504, 'Created dashboard/category/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/update', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:02:49', '2021-03-29 15:02:49', NULL),
(4505, 'Viewed dashboard/category/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:02:50', '2021-03-29 15:02:50', NULL),
(4506, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:02:52', '2021-03-29 15:02:52', NULL),
(4507, 'Viewed dashboard/category/edit/5', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/edit/5', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:03:09', '2021-03-29 15:03:09', NULL),
(4508, 'Created dashboard/category/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/update', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:03:15', '2021-03-29 15:03:15', NULL),
(4509, 'Viewed dashboard/category/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:03:16', '2021-03-29 15:03:16', NULL),
(4510, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:03:18', '2021-03-29 15:03:18', NULL),
(4511, 'Viewed dashboard/category/edit/2', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/edit/2', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:03:41', '2021-03-29 15:03:41', NULL),
(4512, 'Created dashboard/category/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/update', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:03:45', '2021-03-29 15:03:45', NULL),
(4513, 'Viewed dashboard/category/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:03:46', '2021-03-29 15:03:46', NULL),
(4514, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:03:48', '2021-03-29 15:03:48', NULL),
(4515, 'Viewed dashboard/category/top', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/top?id=1', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:03:51', '2021-03-29 15:03:51', NULL),
(4516, 'Viewed dashboard/category/top', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/top?id=4', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:03:54', '2021-03-29 15:03:54', NULL),
(4517, 'Viewed dashboard/category/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/published?id=1', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:03:56', '2021-03-29 15:03:56', NULL),
(4518, 'Viewed dashboard/category/edit/7', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/edit/7', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:04:22', '2021-03-29 15:04:22', NULL),
(4519, 'Created dashboard/category/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/update', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:04:27', '2021-03-29 15:04:27', NULL),
(4520, 'Viewed dashboard/category/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:04:27', '2021-03-29 15:04:27', NULL),
(4521, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:04:30', '2021-03-29 15:04:30', NULL),
(4522, 'Viewed dashboard/category/destroy/6', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/destroy/6', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:04:50', '2021-03-29 15:04:50', NULL),
(4523, 'Viewed dashboard/category/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:04:51', '2021-03-29 15:04:51', NULL),
(4524, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:04:54', '2021-03-29 15:04:54', NULL),
(4525, 'Viewed dashboard/category/edit/8', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/edit/8', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:05:07', '2021-03-29 15:05:07', NULL),
(4526, 'Created dashboard/category/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/update', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:05:13', '2021-03-29 15:05:13', NULL),
(4527, 'Viewed dashboard/category/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:05:15', '2021-03-29 15:05:15', NULL),
(4528, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'POST', '2021-03-29 15:05:17', '2021-03-29 15:05:17', NULL),
(4529, 'Viewed dashboard/category/top', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/top?id=8', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:05:22', '2021-03-29 15:05:22', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4530, 'Viewed dashboard/category/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/category/published?id=6', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:05:28', '2021-03-29 15:05:28', NULL),
(4531, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/category/index', 'GET', '2021-03-29 15:05:35', '2021-03-29 15:05:35', NULL),
(4532, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-03-29 15:05:38', '2021-03-29 15:05:38', NULL),
(4533, 'Viewed dashboard/course/index/24/the-complete-android-n-developer-course', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index/24/the-complete-android-n-developer-course', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:05:48', '2021-03-29 15:05:48', NULL),
(4534, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/24/the-complete-android-n-developer-course', 'POST', '2021-03-29 15:05:57', '2021-03-29 15:05:57', NULL),
(4535, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:05:59', '2021-03-29 15:05:59', NULL),
(4536, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/24/the-complete-android-n-developer-course', 'GET', '2021-03-29 15:07:09', '2021-03-29 15:07:09', NULL),
(4537, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-03-29 15:07:11', '2021-03-29 15:07:11', NULL),
(4538, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=23', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:07:17', '2021-03-29 15:07:17', NULL),
(4539, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=22', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:07:18', '2021-03-29 15:07:18', NULL),
(4540, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=21', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:07:21', '2021-03-29 15:07:21', NULL),
(4541, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=20', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:07:22', '2021-03-29 15:07:22', NULL),
(4542, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=19', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:07:23', '2021-03-29 15:07:23', NULL),
(4543, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=11', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:07:29', '2021-03-29 15:07:29', NULL),
(4544, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=1', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:07:30', '2021-03-29 15:07:30', NULL),
(4545, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=2', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:07:35', '2021-03-29 15:07:35', NULL),
(4546, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=5', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:07:37', '2021-03-29 15:07:37', NULL),
(4547, 'Viewed dashboard/course/index/24/the-complete-android-n-developer-course', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index/24/the-complete-android-n-developer-course', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:07:54', '2021-03-29 15:07:54', NULL),
(4548, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/24/the-complete-android-n-developer-course', 'POST', '2021-03-29 15:07:59', '2021-03-29 15:07:59', NULL),
(4549, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/24/the-complete-android-n-developer-course', 'GET', '2021-03-29 15:08:01', '2021-03-29 15:08:01', NULL),
(4550, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-03-29 15:08:03', '2021-03-29 15:08:03', NULL),
(4551, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=24', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:08:04', '2021-03-29 15:08:04', NULL),
(4552, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index?page=2', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:08:06', '2021-03-29 15:08:06', NULL),
(4553, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index?page=2', 'POST', '2021-03-29 15:08:09', '2021-03-29 15:08:09', NULL),
(4554, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=6', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index?page=2', 'GET', '2021-03-29 15:08:12', '2021-03-29 15:08:12', NULL),
(4555, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=9', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index?page=2', 'GET', '2021-03-29 15:08:13', '2021-03-29 15:08:13', NULL),
(4556, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:08:20', '2021-03-29 15:08:20', NULL),
(4557, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index?page=2', 'GET', '2021-03-29 15:10:11', '2021-03-29 15:10:11', NULL),
(4558, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-29 15:10:13', '2021-03-29 15:10:13', NULL),
(4559, 'Created dashboard/site/setting/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting/update', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-29 15:10:23', '2021-03-29 15:10:23', NULL),
(4560, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-29 15:10:24', '2021-03-29 15:10:24', NULL),
(4561, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-29 15:10:26', '2021-03-29 15:10:26', NULL),
(4562, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:25:53', '2021-03-29 15:25:53', NULL),
(4563, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-29 15:26:28', '2021-03-29 15:26:28', NULL),
(4564, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-29 15:26:29', '2021-03-29 15:26:29', NULL),
(4565, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:26:38', '2021-03-29 15:26:38', NULL),
(4566, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-29 15:26:56', '2021-03-29 15:26:56', NULL),
(4567, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-29 15:26:57', '2021-03-29 15:26:57', NULL),
(4568, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-29 15:26:59', '2021-03-29 15:26:59', NULL),
(4569, 'Viewed dashboard/course/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/create', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-29 15:27:06', '2021-03-29 15:27:06', NULL),
(4570, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-29 15:27:09', '2021-03-29 15:27:09', NULL),
(4571, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-29 15:31:48', '2021-03-29 15:31:48', NULL),
(4572, 'Created dashboard/media/manager/store', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/store', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-29 15:32:01', '2021-03-29 15:32:01', NULL),
(4573, 'Viewed dashboard/course/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/create', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-29 15:32:02', '2021-03-29 15:32:02', NULL),
(4574, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-29 15:32:10', '2021-03-29 15:32:10', NULL),
(4575, 'Viewed dashboard/course/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-29 15:32:17', '2021-03-29 15:32:17', NULL),
(4576, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-03-29 15:32:23', '2021-03-29 15:32:23', NULL),
(4577, 'Viewed dashboard/course/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/create', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:32:38', '2021-03-29 15:32:38', NULL),
(4578, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-29 15:32:44', '2021-03-29 15:32:44', NULL),
(4579, 'Created dashboard/course/store', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/store', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-29 15:34:49', '2021-03-29 15:34:49', NULL),
(4580, 'Viewed dashboard/course/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/create', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-29 15:34:50', '2021-03-29 15:34:50', NULL),
(4581, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-29 15:34:53', '2021-03-29 15:34:53', NULL),
(4582, 'Created dashboard/course/store', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/store', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-29 15:35:56', '2021-03-29 15:35:56', NULL),
(4583, 'Viewed dashboard/course/index/25/the-complete-communication-skills-master-class-for-life', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/index/25/the-complete-communication-skills-master-class-for-life', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-29 15:35:57', '2021-03-29 15:35:57', NULL),
(4584, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/25/the-complete-communication-skills-master-class-for-life', 'POST', '2021-03-29 15:36:00', '2021-03-29 15:36:00', NULL),
(4585, 'Viewed dashboard/course/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/25/the-complete-communication-skills-master-class-for-life', 'GET', '2021-03-29 15:36:09', '2021-03-29 15:36:09', NULL),
(4586, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-03-29 15:36:12', '2021-03-29 15:36:12', NULL),
(4587, 'Logged Out', 'Registered', 5, 'http://thehappyindianstore.com/logout', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-03-29 15:36:26', '2021-03-29 15:36:26', NULL),
(4588, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:36:27', '2021-03-29 15:36:27', NULL),
(4589, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-29 15:36:40', '2021-03-29 15:36:40', NULL),
(4590, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-29 15:36:41', '2021-03-29 15:36:41', NULL),
(4591, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-29 15:36:43', '2021-03-29 15:36:43', NULL),
(4592, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-29 15:36:47', '2021-03-29 15:36:47', NULL),
(4593, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-03-29 15:36:50', '2021-03-29 15:36:50', NULL),
(4594, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=25', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-29 15:36:52', '2021-03-29 15:36:52', NULL),
(4595, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-29 15:36:59', '2021-03-29 15:36:59', NULL),
(4596, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-03-29 15:37:02', '2021-03-29 15:37:02', NULL),
(4597, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:38:35', '2021-03-29 15:38:35', NULL),
(4598, 'Viewed dashboard/slider/edit/1', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/edit/1', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-29 15:39:27', '2021-03-29 15:39:27', NULL),
(4599, 'Created dashboard/slider/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/update', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'POST', '2021-03-29 15:41:35', '2021-03-29 15:41:35', NULL),
(4600, 'Viewed dashboard/slider/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-29 15:41:37', '2021-03-29 15:41:37', NULL),
(4601, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'POST', '2021-03-29 15:41:42', '2021-03-29 15:41:42', NULL),
(4602, 'Viewed dashboard/slider/edit/1', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/edit/1', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-29 15:41:45', '2021-03-29 15:41:45', NULL),
(4603, 'Created dashboard/slider/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/update', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'POST', '2021-03-29 15:42:29', '2021-03-29 15:42:29', NULL),
(4604, 'Viewed dashboard/slider/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/index', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-29 15:42:29', '2021-03-29 15:42:29', NULL),
(4605, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'POST', '2021-03-29 15:42:32', '2021-03-29 15:42:32', NULL),
(4606, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:42:41', '2021-03-29 15:42:41', NULL),
(4607, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Registered', 24, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:42:58', '2021-03-29 15:42:58', NULL),
(4608, 'Viewed courses/personal-transformation4', 'Registered', 24, 'http://thehappyindianstore.com/courses/personal-transformation4', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:43:16', '2021-03-29 15:43:16', NULL),
(4609, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Registered', 24, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-03-29 15:43:28', '2021-03-29 15:43:28', NULL),
(4610, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:43:51', '2021-03-29 15:43:51', NULL),
(4611, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:45:16', '2021-03-29 15:45:16', NULL),
(4612, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:46:01', '2021-03-29 15:46:01', NULL),
(4613, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:48:14', '2021-03-29 15:48:14', NULL),
(4614, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:48:32', '2021-03-29 15:48:32', NULL),
(4615, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:49:07', '2021-03-29 15:49:07', NULL),
(4616, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:49:48', '2021-03-29 15:49:48', NULL),
(4617, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:52:23', '2021-03-29 15:52:23', NULL),
(4618, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:53:02', '2021-03-29 15:53:02', NULL),
(4619, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:55:04', '2021-03-29 15:55:04', NULL),
(4620, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:55:52', '2021-03-29 15:55:52', NULL),
(4621, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:57:27', '2021-03-29 15:57:27', NULL),
(4622, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 15:58:51', '2021-03-29 15:58:51', NULL),
(4623, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 16:00:56', '2021-03-29 16:00:56', NULL),
(4624, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 16:02:08', '2021-03-29 16:02:08', NULL),
(4625, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 16:07:33', '2021-03-29 16:07:33', NULL),
(4626, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 16:07:43', '2021-03-29 16:07:43', NULL),
(4627, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.135.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 16:07:44', '2021-03-29 16:07:44', NULL),
(4628, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1', 'en-us', NULL, 'GET', '2021-03-29 18:14:25', '2021-03-29 18:14:25', NULL),
(4629, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1', 'en-us', NULL, 'GET', '2021-03-29 18:14:25', '2021-03-29 18:14:25', NULL),
(4630, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-29 21:15:50', '2021-03-29 21:15:50', NULL),
(4631, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-29 21:15:56', '2021-03-29 21:15:56', NULL),
(4632, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:12', '2021-03-29 21:17:12', NULL),
(4633, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:14', '2021-03-29 21:17:14', NULL),
(4634, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:21', '2021-03-29 21:17:21', NULL),
(4635, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:21', '2021-03-29 21:17:21', NULL),
(4636, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:22', '2021-03-29 21:17:22', NULL),
(4637, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:23', '2021-03-29 21:17:23', NULL),
(4638, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:25', '2021-03-29 21:17:25', NULL),
(4639, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:26', '2021-03-29 21:17:26', NULL),
(4640, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:33', '2021-03-29 21:17:33', NULL),
(4641, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:35', '2021-03-29 21:17:35', NULL),
(4642, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:36', '2021-03-29 21:17:36', NULL),
(4643, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:36', '2021-03-29 21:17:36', NULL),
(4644, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-29 21:17:37', '2021-03-29 21:17:37', NULL),
(4645, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-29 21:32:59', '2021-03-29 21:32:59', NULL),
(4646, 'Crawler crawled https://www.thehappyindianstore.com', 'Crawler', NULL, 'https://www.thehappyindianstore.com', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:03', '2021-03-30 03:28:03', NULL),
(4647, 'Crawler crawled http://www.thehappyindianstore.com', 'Crawler', NULL, 'http://www.thehappyindianstore.com', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:05', '2021-03-30 03:28:05', NULL),
(4648, 'Crawler crawled https://www.thehappyindianstore.com/courses/personal-productivity3', 'Crawler', NULL, 'https://www.thehappyindianstore.com/courses/personal-productivity3', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:07', '2021-03-30 03:28:07', NULL),
(4649, 'Crawler crawled http://www.thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', 'Crawler', NULL, 'http://www.thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:08', '2021-03-30 03:28:08', NULL),
(4650, 'Crawler crawled https://www.thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', 'Crawler', NULL, 'https://www.thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:11', '2021-03-30 03:28:11', NULL),
(4651, 'Crawler crawled http://www.thehappyindianstore.com/instructor/register', 'Crawler', NULL, 'http://www.thehappyindianstore.com/instructor/register', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:15', '2021-03-30 03:28:15', NULL),
(4652, 'Crawler crawled https://www.thehappyindianstore.com/instructor/register', 'Crawler', NULL, 'https://www.thehappyindianstore.com/instructor/register', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:17', '2021-03-30 03:28:17', NULL),
(4653, 'Crawler crawled https://www.thehappyindianstore.com/signup', 'Crawler', NULL, 'https://www.thehappyindianstore.com/signup', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:18', '2021-03-30 03:28:18', NULL),
(4654, 'Crawler crawled http://www.thehappyindianstore.com/signup', 'Crawler', NULL, 'http://www.thehappyindianstore.com/signup', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:19', '2021-03-30 03:28:19', NULL),
(4655, 'Crawler crawled https://www.thehappyindianstore.com/courses/personal-productivity3', 'Crawler', NULL, 'https://www.thehappyindianstore.com/courses/personal-productivity3', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:21', '2021-03-30 03:28:21', NULL),
(4656, 'Crawler crawled http://www.thehappyindianstore.com/courses/leadership2', 'Crawler', NULL, 'http://www.thehappyindianstore.com/courses/leadership2', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:22', '2021-03-30 03:28:22', NULL),
(4657, 'Crawler crawled https://www.thehappyindianstore.com/courses/leadership2', 'Crawler', NULL, 'https://www.thehappyindianstore.com/courses/leadership2', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:25', '2021-03-30 03:28:25', NULL),
(4658, 'Crawler crawled http://www.thehappyindianstore.com/courses', 'Crawler', NULL, 'http://www.thehappyindianstore.com/courses', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:26', '2021-03-30 03:28:26', NULL),
(4659, 'Crawler crawled https://www.thehappyindianstore.com/instructor/details/amit1', 'Crawler', NULL, 'https://www.thehappyindianstore.com/instructor/details/amit1', '108.53.119.33', 'panscient.com', 'en', NULL, 'GET', '2021-03-30 03:28:28', '2021-03-30 03:28:28', NULL),
(4660, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '93.158.91.209', 'Mozilla/5.0 (Linux; Android 7.0; SM-G892A Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Mobile Safari/537.36', NULL, NULL, 'GET', '2021-03-30 03:44:47', '2021-03-30 03:44:47', NULL),
(4661, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-30 04:44:30', '2021-03-30 04:44:30', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4662, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-30 04:44:31', '2021-03-30 04:44:31', NULL),
(4663, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 04:44:42', '2021-03-30 04:44:42', NULL),
(4664, 'Viewed dashboard/course/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 04:45:03', '2021-03-30 04:45:03', NULL),
(4665, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-30 04:45:12', '2021-03-30 04:45:12', NULL),
(4666, 'Created dashboard/media/manager/filter/all', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/filter/all', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-30 04:48:59', '2021-03-30 04:48:59', NULL),
(4667, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:49:00', '2021-03-30 04:49:00', NULL),
(4668, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:50:23', '2021-03-30 04:50:23', NULL),
(4669, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:50:43', '2021-03-30 04:50:43', NULL),
(4670, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:51:11', '2021-03-30 04:51:11', NULL),
(4671, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:51:19', '2021-03-30 04:51:19', NULL),
(4672, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:51:26', '2021-03-30 04:51:26', NULL),
(4673, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:52:51', '2021-03-30 04:52:51', NULL),
(4674, 'Created dashboard/media/manager/store', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/store', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-30 04:53:06', '2021-03-30 04:53:06', NULL),
(4675, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:53:14', '2021-03-30 04:53:14', NULL),
(4676, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:53:19', '2021-03-30 04:53:19', NULL),
(4677, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:53:24', '2021-03-30 04:53:24', NULL),
(4678, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:53:25', '2021-03-30 04:53:25', NULL),
(4679, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:53:29', '2021-03-30 04:53:29', NULL),
(4680, 'Created dashboard/media/manager/store', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/store', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-30 04:53:41', '2021-03-30 04:53:41', NULL),
(4681, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:53:58', '2021-03-30 04:53:58', NULL),
(4682, 'Created dashboard/media/manager/store', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/store', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-30 04:54:08', '2021-03-30 04:54:08', NULL),
(4683, 'Viewed dashboard/course/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-03-30 04:54:09', '2021-03-30 04:54:09', NULL),
(4684, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-30 04:54:13', '2021-03-30 04:54:13', NULL),
(4685, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/quiz/create', 'POST', '2021-03-30 05:00:44', '2021-03-30 05:00:44', NULL),
(4686, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/quiz/create', 'POST', '2021-03-30 05:01:11', '2021-03-30 05:01:11', NULL),
(4687, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/quiz/list', 'POST', '2021-03-30 05:01:17', '2021-03-30 05:01:17', NULL),
(4688, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/quiz/questions/add/1', 'POST', '2021-03-30 05:01:23', '2021-03-30 05:01:23', NULL),
(4689, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/quiz/questions/add/1', 'POST', '2021-03-30 05:02:29', '2021-03-30 05:02:29', NULL),
(4690, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/quiz/list', 'POST', '2021-03-30 05:02:41', '2021-03-30 05:02:41', NULL),
(4691, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/quiz/list', 'POST', '2021-03-30 05:02:52', '2021-03-30 05:02:52', NULL),
(4692, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/quiz/list', 'GET', '2021-03-30 07:01:16', '2021-03-30 07:01:16', NULL),
(4693, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 07:01:19', '2021-03-30 07:01:19', NULL),
(4694, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 07:01:25', '2021-03-30 07:01:25', NULL),
(4695, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 07:01:30', '2021-03-30 07:01:30', NULL),
(4696, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '54.203.73.198', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:82.0) Gecko/20100101 Firefox/82.0', NULL, NULL, 'GET', '2021-03-30 09:12:01', '2021-03-30 09:12:01', NULL),
(4697, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-30 14:32:48', '2021-03-30 14:32:48', NULL),
(4698, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-30 14:42:09', '2021-03-30 14:42:09', NULL),
(4699, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-30 14:50:50', '2021-03-30 14:50:50', NULL),
(4700, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-30 14:50:56', '2021-03-30 14:50:56', NULL),
(4701, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-30 14:50:57', '2021-03-30 14:50:57', NULL),
(4702, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-30 14:50:58', '2021-03-30 14:50:58', NULL),
(4703, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-30 14:50:58', '2021-03-30 14:50:58', NULL),
(4704, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-03-30 14:50:58', '2021-03-30 14:50:58', NULL),
(4705, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '157.39.0.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-30 14:52:41', '2021-03-30 14:52:41', NULL),
(4706, 'Crawler crawled http://www.thehappyindianstore.com', 'Crawler', NULL, 'http://www.thehappyindianstore.com', '58.53.128.234', 'GRequests/0.10', 'zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,it;q=0.6', NULL, 'GET', '2021-03-30 14:55:33', '2021-03-30 14:55:33', NULL),
(4707, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 15:28:12', '2021-03-30 15:28:12', NULL),
(4708, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 15:28:12', '2021-03-30 15:28:12', NULL),
(4709, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-30 15:29:40', '2021-03-30 15:29:40', NULL),
(4710, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 15:29:51', '2021-03-30 15:29:51', NULL),
(4711, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '86.106.121.65', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.66 Safari/537.36', 'en-US,en;q=0.5', NULL, 'GET', '2021-03-30 16:55:51', '2021-03-30 16:55:51', NULL),
(4712, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 17:12:55', '2021-03-30 17:12:55', NULL),
(4713, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-30 17:13:41', '2021-03-30 17:13:41', NULL),
(4714, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-30 17:13:42', '2021-03-30 17:13:42', NULL),
(4715, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 17:14:16', '2021-03-30 17:14:16', NULL),
(4716, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/forum', 'GET', '2021-03-30 17:16:27', '2021-03-30 17:16:27', NULL),
(4717, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/forum/replies', 'POST', '2021-03-30 17:16:41', '2021-03-30 17:16:41', NULL),
(4718, 'Viewed dashboard/account/setup', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/account/setup', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/forum/replies', 'GET', '2021-03-30 17:16:50', '2021-03-30 17:16:50', NULL),
(4719, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/account/setup', 'POST', '2021-03-30 17:16:54', '2021-03-30 17:16:54', NULL),
(4720, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/zoom/setting', 'POST', '2021-03-30 17:17:12', '2021-03-30 17:17:12', NULL),
(4721, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/zoom/setting', 'POST', '2021-03-30 17:17:19', '2021-03-30 17:17:19', NULL),
(4722, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/zoom/create/meeting', 'POST', '2021-03-30 17:17:24', '2021-03-30 17:17:24', NULL),
(4723, 'Viewed dashboard/student/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/student/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/zoom/create/meeting', 'GET', '2021-03-30 17:17:29', '2021-03-30 17:17:29', NULL),
(4724, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/student/index', 'POST', '2021-03-30 17:17:31', '2021-03-30 17:17:31', NULL),
(4725, 'Viewed dashboard/message/inbox', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/message/inbox', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/student/index', 'GET', '2021-03-30 17:17:36', '2021-03-30 17:17:36', NULL),
(4726, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/message/inbox', 'POST', '2021-03-30 17:17:38', '2021-03-30 17:17:38', NULL),
(4727, 'Viewed dashboard/media/manager', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/message/inbox', 'GET', '2021-03-30 17:18:40', '2021-03-30 17:18:40', NULL),
(4728, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/media/manager', 'POST', '2021-03-30 17:18:42', '2021-03-30 17:18:42', NULL),
(4729, 'Created dashboard/media/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/media/manager', 'POST', '2021-03-30 17:18:42', '2021-03-30 17:18:42', NULL),
(4730, 'Viewed dashboard/comments/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/comments/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/media/manager', 'GET', '2021-03-30 17:18:51', '2021-03-30 17:18:51', NULL),
(4731, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/comments/index', 'POST', '2021-03-30 17:18:53', '2021-03-30 17:18:53', NULL),
(4732, 'Viewed dashboard/payments/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/payments/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/comments/index', 'GET', '2021-03-30 17:18:58', '2021-03-30 17:18:58', NULL),
(4733, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/payments/index', 'POST', '2021-03-30 17:19:00', '2021-03-30 17:19:00', NULL),
(4734, 'Viewed activity', 'Registered', 5, 'http://thehappyindianstore.com/activity', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/payments/index', 'GET', '2021-03-30 17:19:17', '2021-03-30 17:19:17', NULL),
(4735, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/activity', 'POST', '2021-03-30 17:19:19', '2021-03-30 17:19:19', NULL),
(4736, 'Viewed activity', 'Registered', 5, 'http://thehappyindianstore.com/activity?page=2', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/activity', 'GET', '2021-03-30 17:19:44', '2021-03-30 17:19:44', NULL),
(4737, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/activity?page=2', 'POST', '2021-03-30 17:19:47', '2021-03-30 17:19:47', NULL),
(4738, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/activity?page=2', 'GET', '2021-03-30 17:20:01', '2021-03-30 17:20:01', NULL),
(4739, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 17:20:05', '2021-03-30 17:20:05', NULL),
(4740, 'Viewed dashboard/profile/5', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/5', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 17:20:59', '2021-03-30 17:20:59', NULL),
(4741, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 17:21:08', '2021-03-30 17:21:08', NULL),
(4742, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'GET', '2021-03-30 17:22:26', '2021-03-30 17:22:26', NULL),
(4743, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'GET', '2021-03-30 17:22:32', '2021-03-30 17:22:32', NULL),
(4744, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 17:22:35', '2021-03-30 17:22:35', NULL),
(4745, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 17:22:37', '2021-03-30 17:22:37', NULL),
(4746, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 17:22:40', '2021-03-30 17:22:40', NULL),
(4747, 'Viewed dashboard/profile/5', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/5', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 17:22:42', '2021-03-30 17:22:42', NULL),
(4748, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 17:22:45', '2021-03-30 17:22:45', NULL),
(4749, 'Viewed dashboard/profile/5', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/5', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'GET', '2021-03-30 17:23:33', '2021-03-30 17:23:33', NULL),
(4750, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 17:23:38', '2021-03-30 17:23:38', NULL),
(4751, 'Viewed dashboard/media/manager', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'GET', '2021-03-30 17:24:32', '2021-03-30 17:24:32', NULL),
(4752, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/media/manager', 'POST', '2021-03-30 17:24:34', '2021-03-30 17:24:34', NULL),
(4753, 'Created dashboard/media/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/media/manager', 'POST', '2021-03-30 17:24:34', '2021-03-30 17:24:34', NULL),
(4754, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/media/manager', 'GET', '2021-03-30 17:24:37', '2021-03-30 17:24:37', NULL),
(4755, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 17:24:39', '2021-03-30 17:24:39', NULL),
(4756, 'Viewed dashboard/account/setup', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/account/setup', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 17:24:42', '2021-03-30 17:24:42', NULL),
(4757, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/account/setup', 'POST', '2021-03-30 17:24:44', '2021-03-30 17:24:44', NULL),
(4758, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/account/setup', 'GET', '2021-03-30 17:24:46', '2021-03-30 17:24:46', NULL),
(4759, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 17:24:48', '2021-03-30 17:24:48', NULL),
(4760, 'Viewed dashboard/profile/5', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/5', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 17:24:52', '2021-03-30 17:24:52', NULL),
(4761, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/account/setup', 'GET', '2021-03-30 17:24:57', '2021-03-30 17:24:57', NULL),
(4762, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/account/setup', 'GET', '2021-03-30 17:24:59', '2021-03-30 17:24:59', NULL),
(4763, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/account/setup', 'GET', '2021-03-30 17:25:00', '2021-03-30 17:25:00', NULL),
(4764, 'Viewed dashboard/profile/5', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/5', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 17:25:19', '2021-03-30 17:25:19', NULL),
(4765, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 17:25:22', '2021-03-30 17:25:22', NULL),
(4766, 'Viewed dashboard/profile/5', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/5', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'GET', '2021-03-30 17:56:05', '2021-03-30 17:56:05', NULL),
(4767, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 17:56:08', '2021-03-30 17:56:08', NULL),
(4768, 'Viewed dashboard/profile/5', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/5', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'GET', '2021-03-30 17:56:10', '2021-03-30 17:56:10', NULL),
(4769, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 17:56:13', '2021-03-30 17:56:13', NULL),
(4770, 'Viewed dashboard/notifications/5', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/notifications/5', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'GET', '2021-03-30 18:05:12', '2021-03-30 18:05:12', NULL),
(4771, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/notifications/5', 'POST', '2021-03-30 18:05:15', '2021-03-30 18:05:15', NULL),
(4772, 'Viewed dashboard/profile/5', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/5', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/notifications/5', 'GET', '2021-03-30 18:05:31', '2021-03-30 18:05:31', NULL),
(4773, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 18:05:34', '2021-03-30 18:05:34', NULL),
(4774, 'Created dashboard/profile/update', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/update', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 18:05:50', '2021-03-30 18:05:50', NULL),
(4775, 'Viewed dashboard/profile/5', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/5', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'GET', '2021-03-30 18:05:52', '2021-03-30 18:05:52', NULL),
(4776, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 18:05:55', '2021-03-30 18:05:55', NULL),
(4777, 'Created dashboard/profile/update', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/update', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 18:06:42', '2021-03-30 18:06:42', NULL),
(4778, 'Viewed dashboard/profile/5', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/5', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'GET', '2021-03-30 18:06:42', '2021-03-30 18:06:42', NULL),
(4779, 'Created dashboard/profile/update', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/update', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 18:06:47', '2021-03-30 18:06:47', NULL),
(4780, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 18:06:48', '2021-03-30 18:06:48', NULL),
(4781, 'Created dashboard/profile/update', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/update', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 18:07:04', '2021-03-30 18:07:04', NULL),
(4782, 'Viewed dashboard/profile/5', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/profile/5', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'GET', '2021-03-30 18:07:04', '2021-03-30 18:07:04', NULL),
(4783, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 18:07:07', '2021-03-30 18:07:07', NULL),
(4784, 'Logged Out', 'Registered', 5, 'http://thehappyindianstore.com/logout', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'POST', '2021-03-30 18:07:23', '2021-03-30 18:07:23', NULL),
(4785, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/profile/5', 'GET', '2021-03-30 18:07:24', '2021-03-30 18:07:24', NULL),
(4786, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-03-30 18:07:34', '2021-03-30 18:07:34', NULL),
(4787, 'Created instructor/create', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/instructor/register', 'POST', '2021-03-30 18:09:41', '2021-03-30 18:09:41', NULL),
(4788, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/instructor/register', 'GET', '2021-03-30 18:09:41', '2021-03-30 18:09:41', NULL),
(4789, 'Created instructor/create', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/instructor/register', 'POST', '2021-03-30 18:10:14', '2021-03-30 18:10:14', NULL),
(4790, 'Logged In', 'Registered', 25, 'http://thehappyindianstore.com/login', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-30 18:10:29', '2021-03-30 18:10:29', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4791, 'Logged Out', 'Registered', 25, 'http://thehappyindianstore.com/login', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-30 18:10:29', '2021-03-30 18:10:29', NULL),
(4792, 'Logged In', 'Registered', 25, 'http://thehappyindianstore.com/login', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-30 18:12:41', '2021-03-30 18:12:41', NULL),
(4793, 'Logged Out', 'Registered', 25, 'http://thehappyindianstore.com/login', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-30 18:12:41', '2021-03-30 18:12:41', NULL),
(4794, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-30 18:14:07', '2021-03-30 18:14:07', NULL),
(4795, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-30 18:14:36', '2021-03-30 18:14:36', NULL),
(4796, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-30 18:14:37', '2021-03-30 18:14:37', NULL),
(4797, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 18:14:41', '2021-03-30 18:14:41', NULL),
(4798, 'Logged Out', 'Registered', 5, 'http://thehappyindianstore.com/logout', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 18:14:53', '2021-03-30 18:14:53', NULL),
(4799, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 18:14:54', '2021-03-30 18:14:54', NULL),
(4800, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-30 18:15:29', '2021-03-30 18:15:29', NULL),
(4801, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-30 18:15:31', '2021-03-30 18:15:31', NULL),
(4802, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 18:15:33', '2021-03-30 18:15:33', NULL),
(4803, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/instructor/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 18:15:52', '2021-03-30 18:15:52', NULL),
(4804, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/instructor/index', 'POST', '2021-03-30 18:15:55', '2021-03-30 18:15:55', NULL),
(4805, 'Viewed dashboard/instructor/show/23', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/instructor/show/23', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/instructor/index', 'GET', '2021-03-30 18:16:07', '2021-03-30 18:16:07', NULL),
(4806, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/instructor/show/23', 'POST', '2021-03-30 18:16:10', '2021-03-30 18:16:10', NULL),
(4807, 'Created dashboard/users/banned', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/users/banned', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/instructor/show/23', 'POST', '2021-03-30 18:16:12', '2021-03-30 18:16:12', NULL),
(4808, 'Viewed dashboard/instructor/show/23', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/instructor/show/23', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/instructor/show/23', 'GET', '2021-03-30 18:16:13', '2021-03-30 18:16:13', NULL),
(4809, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/instructor/show/23', 'POST', '2021-03-30 18:16:19', '2021-03-30 18:16:19', NULL),
(4810, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/instructor/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/instructor/show/23', 'GET', '2021-03-30 18:16:22', '2021-03-30 18:16:22', NULL),
(4811, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/instructor/index', 'POST', '2021-03-30 18:16:26', '2021-03-30 18:16:26', NULL),
(4812, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/certificate/setup', 'POST', '2021-03-30 18:16:37', '2021-03-30 18:16:37', NULL),
(4813, 'Viewed dashboard/packages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/packages/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/certificate/setup', 'GET', '2021-03-30 18:16:48', '2021-03-30 18:16:48', NULL),
(4814, 'Viewed dashboard/packages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/packages/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/certificate/setup', 'GET', '2021-03-30 18:16:51', '2021-03-30 18:16:51', NULL),
(4815, 'Viewed dashboard/affiliate/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/setting', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/certificate/setup', 'GET', '2021-03-30 18:16:55', '2021-03-30 18:16:55', NULL),
(4816, 'Viewed dashboard/affiliate/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/setting', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/certificate/setup', 'GET', '2021-03-30 18:16:57', '2021-03-30 18:16:57', NULL),
(4817, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/setting', 'POST', '2021-03-30 18:17:00', '2021-03-30 18:17:00', NULL),
(4818, 'Viewed dashboard/affiliate/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/setting', 'GET', '2021-03-30 18:17:03', '2021-03-30 18:17:03', NULL),
(4819, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/index', 'POST', '2021-03-30 18:17:05', '2021-03-30 18:17:05', NULL),
(4820, 'Viewed dashboard/affiliate/payment/request', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/payment/request', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/index', 'GET', '2021-03-30 18:17:08', '2021-03-30 18:17:08', NULL),
(4821, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/payment/request', 'POST', '2021-03-30 18:17:10', '2021-03-30 18:17:10', NULL),
(4822, 'Viewed dashboard/admin/earning', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/admin/earning', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/payment/request', 'GET', '2021-03-30 18:17:11', '2021-03-30 18:17:11', NULL),
(4823, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/admin/earning', 'POST', '2021-03-30 18:17:13', '2021-03-30 18:17:13', NULL),
(4824, 'Viewed dashboard/ticket/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/ticket/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/admin/earning', 'GET', '2021-03-30 18:17:16', '2021-03-30 18:17:16', NULL),
(4825, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/ticket/index', 'POST', '2021-03-30 18:17:18', '2021-03-30 18:17:18', NULL),
(4826, 'Viewed dashboard/theme/manager', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/theme/manager', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/ticket/index', 'GET', '2021-03-30 18:17:32', '2021-03-30 18:17:32', NULL),
(4827, 'Viewed dashboard/theme/index/page', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/theme/index/page?_token=rrHlMIg1rk5APIgK79rH0BUuGKKSOdx5qMuSotVa', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'GET', '2021-03-30 18:17:35', '2021-03-30 18:17:35', NULL),
(4828, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'POST', '2021-03-30 18:17:35', '2021-03-30 18:17:35', NULL),
(4829, 'Viewed dashboard/addon/manager', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/addon/manager', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'GET', '2021-03-30 18:17:58', '2021-03-30 18:17:58', NULL),
(4830, 'Viewed dashboard/addon/manager', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/addon/manager', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'GET', '2021-03-30 18:18:02', '2021-03-30 18:18:02', NULL),
(4831, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/addon/manager', 'POST', '2021-03-30 18:18:05', '2021-03-30 18:18:05', NULL),
(4832, 'Viewed dashboard/addon/index/page', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/addon/index/page?_token=rrHlMIg1rk5APIgK79rH0BUuGKKSOdx5qMuSotVa', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/addon/manager', 'GET', '2021-03-30 18:18:05', '2021-03-30 18:18:05', NULL),
(4833, 'Viewed dashboard/app/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/app/setting', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/addon/manager', 'GET', '2021-03-30 18:19:59', '2021-03-30 18:19:59', NULL),
(4834, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/app/setting', 'POST', '2021-03-30 18:20:04', '2021-03-30 18:20:04', NULL),
(4835, 'Viewed dashboard/currency/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/currency/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/app/setting', 'GET', '2021-03-30 18:20:10', '2021-03-30 18:20:10', NULL),
(4836, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/currency/index', 'POST', '2021-03-30 18:20:12', '2021-03-30 18:20:12', NULL),
(4837, 'Viewed dashboard/language/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/language/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/currency/index', 'GET', '2021-03-30 18:20:24', '2021-03-30 18:20:24', NULL),
(4838, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'POST', '2021-03-30 18:20:27', '2021-03-30 18:20:27', NULL),
(4839, 'Viewed dashboard/language/destroy/1', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/language/destroy/1', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'GET', '2021-03-30 18:20:41', '2021-03-30 18:20:41', NULL),
(4840, 'Viewed dashboard/language/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/language/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'GET', '2021-03-30 18:20:42', '2021-03-30 18:20:42', NULL),
(4841, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'POST', '2021-03-30 18:20:43', '2021-03-30 18:20:43', NULL),
(4842, 'Viewed dashboard/language/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/language/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'GET', '2021-03-30 18:20:49', '2021-03-30 18:20:49', NULL),
(4843, 'Viewed dashboard/language/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/language/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'GET', '2021-03-30 18:20:54', '2021-03-30 18:20:54', NULL),
(4844, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'POST', '2021-03-30 18:20:56', '2021-03-30 18:20:56', NULL),
(4845, 'Viewed dashboard/smtp/create', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/smtp/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'GET', '2021-03-30 18:21:02', '2021-03-30 18:21:02', NULL),
(4846, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/smtp/create', 'POST', '2021-03-30 18:21:04', '2021-03-30 18:21:04', NULL),
(4847, 'Viewed dashboard/slider/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/smtp/create', 'GET', '2021-03-30 18:21:12', '2021-03-30 18:21:12', NULL),
(4848, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'POST', '2021-03-30 18:21:14', '2021-03-30 18:21:14', NULL),
(4849, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/pages/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-03-30 18:21:23', '2021-03-30 18:21:23', NULL),
(4850, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'POST', '2021-03-30 18:21:27', '2021-03-30 18:21:27', NULL),
(4851, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'GET', '2021-03-30 18:21:33', '2021-03-30 18:21:33', NULL),
(4852, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-30 18:21:36', '2021-03-30 18:21:36', NULL),
(4853, 'Created dashboard/site/setting/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting/update', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-30 18:24:05', '2021-03-30 18:24:05', NULL),
(4854, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-30 18:24:06', '2021-03-30 18:24:06', NULL),
(4855, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-30 18:24:08', '2021-03-30 18:24:08', NULL),
(4856, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-30 18:24:15', '2021-03-30 18:24:15', NULL),
(4857, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 18:24:19', '2021-03-30 18:24:19', NULL),
(4858, 'Viewed dashboard/user/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/user/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 18:24:26', '2021-03-30 18:24:26', NULL),
(4859, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/user/index', 'POST', '2021-03-30 18:24:28', '2021-03-30 18:24:28', NULL),
(4860, 'Created dashboard/site/setting/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting/update', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-30 18:25:13', '2021-03-30 18:25:13', NULL),
(4861, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-30 18:25:14', '2021-03-30 18:25:14', NULL),
(4862, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-30 18:25:15', '2021-03-30 18:25:15', NULL),
(4863, 'Created dashboard/site/setting/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting/update', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-30 18:25:32', '2021-03-30 18:25:32', NULL),
(4864, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-30 18:25:33', '2021-03-30 18:25:33', NULL),
(4865, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-30 18:25:35', '2021-03-30 18:25:35', NULL),
(4866, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-03-30 18:26:11', '2021-03-30 18:26:11', NULL),
(4867, 'Created dashboard/site/setting/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting/update', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-30 18:32:16', '2021-03-30 18:32:16', NULL),
(4868, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-30 18:32:17', '2021-03-30 18:32:17', NULL),
(4869, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-30 18:32:18', '2021-03-30 18:32:18', NULL),
(4870, 'Viewed dashboard/user/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/user/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 18:32:24', '2021-03-30 18:32:24', NULL),
(4871, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/user/index', 'POST', '2021-03-30 18:32:26', '2021-03-30 18:32:26', NULL),
(4872, 'Viewed dashboard/theme/manager', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/theme/manager', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/user/index', 'GET', '2021-03-30 18:32:39', '2021-03-30 18:32:39', NULL),
(4873, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'POST', '2021-03-30 18:32:41', '2021-03-30 18:32:41', NULL),
(4874, 'Viewed dashboard/addon/manager', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/addon/manager', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'GET', '2021-03-30 18:32:42', '2021-03-30 18:32:42', NULL),
(4875, 'Viewed dashboard/theme/index/page', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/theme/index/page?_token=rrHlMIg1rk5APIgK79rH0BUuGKKSOdx5qMuSotVa', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'GET', '2021-03-30 18:32:43', '2021-03-30 18:32:43', NULL),
(4876, 'Viewed dashboard/addon/index/page', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/addon/index/page?_token=rrHlMIg1rk5APIgK79rH0BUuGKKSOdx5qMuSotVa', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/addon/manager', 'GET', '2021-03-30 18:32:44', '2021-03-30 18:32:44', NULL),
(4877, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/addon/manager', 'POST', '2021-03-30 18:32:45', '2021-03-30 18:32:45', NULL),
(4878, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/addon/manager', 'GET', '2021-03-30 18:32:53', '2021-03-30 18:32:53', NULL),
(4879, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-30 18:32:58', '2021-03-30 18:32:58', NULL),
(4880, 'Created dashboard/site/setting/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting/update', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-30 18:34:13', '2021-03-30 18:34:13', NULL),
(4881, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-30 18:34:14', '2021-03-30 18:34:14', NULL),
(4882, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-03-30 18:34:16', '2021-03-30 18:34:16', NULL),
(4883, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/pages/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-30 18:34:23', '2021-03-30 18:34:23', NULL),
(4884, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'POST', '2021-03-30 18:34:27', '2021-03-30 18:34:27', NULL),
(4885, 'Viewed dashboard/pages/create', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/pages/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'GET', '2021-03-30 18:34:29', '2021-03-30 18:34:29', NULL),
(4886, 'Viewed dashboard/other/settings', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/other/settings', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'GET', '2021-03-30 18:35:07', '2021-03-30 18:35:07', NULL),
(4887, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'POST', '2021-03-30 18:35:09', '2021-03-30 18:35:09', NULL),
(4888, 'Created dashboard/other/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/other/setting', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'POST', '2021-03-30 18:35:15', '2021-03-30 18:35:15', NULL),
(4889, 'Viewed dashboard/other/settings', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/other/settings', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'GET', '2021-03-30 18:35:16', '2021-03-30 18:35:16', NULL),
(4890, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'POST', '2021-03-30 18:35:18', '2021-03-30 18:35:18', NULL),
(4891, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'POST', '2021-03-30 18:37:11', '2021-03-30 18:37:11', NULL),
(4892, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'GET', '2021-03-30 18:37:11', '2021-03-30 18:37:11', NULL),
(4893, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-30 18:37:39', '2021-03-30 18:37:39', NULL),
(4894, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-30 18:37:40', '2021-03-30 18:37:40', NULL),
(4895, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 18:37:42', '2021-03-30 18:37:42', NULL),
(4896, 'Viewed dashboard/payments/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/payments/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 18:37:53', '2021-03-30 18:37:53', NULL),
(4897, 'Viewed dashboard/payments/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/payments/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 18:37:56', '2021-03-30 18:37:56', NULL),
(4898, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/payments/index', 'POST', '2021-03-30 18:37:59', '2021-03-30 18:37:59', NULL),
(4899, 'Viewed dashboard/payments/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/payments/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/payments/index', 'GET', '2021-03-30 18:38:00', '2021-03-30 18:38:00', NULL),
(4900, 'Created dashboard/payments/store', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/payments/store', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/payments/index', 'POST', '2021-03-30 18:38:21', '2021-03-30 18:38:21', NULL),
(4901, 'Viewed dashboard/payments/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/payments/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/payments/index', 'GET', '2021-03-30 18:38:22', '2021-03-30 18:38:22', NULL),
(4902, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/payments/index', 'POST', '2021-03-30 18:38:25', '2021-03-30 18:38:25', NULL),
(4903, 'Viewed dashboard/payments/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/payments/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/payments/index', 'GET', '2021-03-30 18:38:31', '2021-03-30 18:38:31', NULL),
(4904, 'Created dashboard/payments/store', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/payments/store', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/payments/index', 'POST', '2021-03-30 18:38:43', '2021-03-30 18:38:43', NULL),
(4905, 'Viewed dashboard/payments/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/payments/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/payments/index', 'GET', '2021-03-30 18:38:44', '2021-03-30 18:38:44', NULL),
(4906, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/payments/index', 'POST', '2021-03-30 18:38:45', '2021-03-30 18:38:45', NULL),
(4907, 'Viewed dashboard/student/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/student/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/payments/index', 'GET', '2021-03-30 18:39:17', '2021-03-30 18:39:17', NULL),
(4908, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/student/index', 'POST', '2021-03-30 18:39:19', '2021-03-30 18:39:19', NULL),
(4909, 'Viewed dashboard/comments/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/comments/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/student/index', 'GET', '2021-03-30 18:39:21', '2021-03-30 18:39:21', NULL),
(4910, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/comments/index', 'POST', '2021-03-30 18:39:23', '2021-03-30 18:39:23', NULL),
(4911, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-03-30 20:01:20', '2021-03-30 20:01:20', NULL),
(4912, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 20:01:29', '2021-03-30 20:01:29', NULL),
(4913, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 20:01:37', '2021-03-30 20:01:37', NULL),
(4914, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-03-30 20:30:52', '2021-03-30 20:30:52', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4915, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-03-30 20:33:19', '2021-03-30 20:33:19', NULL),
(4916, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-03-30 20:33:24', '2021-03-30 20:33:24', NULL),
(4917, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-03-30 20:33:27', '2021-03-30 20:33:27', NULL),
(4918, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-03-30 20:33:33', '2021-03-30 20:33:33', NULL),
(4919, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-03-30 20:33:40', '2021-03-30 20:33:40', NULL),
(4920, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-03-30 20:33:40', '2021-03-30 20:33:40', NULL),
(4921, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-03-30 20:33:42', '2021-03-30 20:33:42', NULL),
(4922, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-03-30 20:33:43', '2021-03-30 20:33:43', NULL),
(4923, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'POST', '2021-03-30 20:34:12', '2021-03-30 20:34:12', NULL),
(4924, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-03-30 20:34:13', '2021-03-30 20:34:13', NULL),
(4925, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 20:34:36', '2021-03-30 20:34:36', NULL),
(4926, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-03-30 20:37:04', '2021-03-30 20:37:04', NULL),
(4927, 'Viewed dashboard/course/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 20:41:24', '2021-03-30 20:41:24', NULL),
(4928, 'Viewed dashboard/course/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-03-30 20:41:27', '2021-03-30 20:41:27', NULL),
(4929, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-30 20:42:34', '2021-03-30 20:42:34', NULL),
(4930, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/quiz/create', 'POST', '2021-03-30 20:42:46', '2021-03-30 20:42:46', NULL),
(4931, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 22:20:59', '2021-03-30 22:20:59', NULL),
(4932, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 22:20:59', '2021-03-30 22:20:59', NULL),
(4933, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 23:32:37', '2021-03-30 23:32:37', NULL),
(4934, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 23:32:37', '2021-03-30 23:32:37', NULL),
(4935, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 23:34:10', '2021-03-30 23:34:10', NULL),
(4936, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-30 23:34:44', '2021-03-30 23:34:44', NULL),
(4937, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-30 23:35:01', '2021-03-30 23:35:01', NULL),
(4938, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-30 23:35:02', '2021-03-30 23:35:02', NULL),
(4939, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-30 23:35:16', '2021-03-30 23:35:16', NULL),
(4940, 'Viewed dashboard/course/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/create', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-30 23:35:20', '2021-03-30 23:35:20', NULL),
(4941, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-03-30 23:35:24', '2021-03-30 23:35:24', NULL),
(4942, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-31 02:28:27', '2021-03-31 02:28:27', NULL),
(4943, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-31 02:28:40', '2021-03-31 02:28:40', NULL),
(4944, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-31 02:58:29', '2021-03-31 02:58:29', NULL),
(4945, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-31 03:07:46', '2021-03-31 03:07:46', NULL),
(4946, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-31 03:10:31', '2021-03-31 03:10:31', NULL),
(4947, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '92.204.170.186', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-03-31 07:59:36', '2021-03-31 07:59:36', NULL),
(4948, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '199.244.88.132', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36', NULL, NULL, 'HEAD', '2021-03-31 08:35:52', '2021-03-31 08:35:52', NULL),
(4949, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '158.69.124.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', NULL, NULL, 'GET', '2021-03-31 10:23:01', '2021-03-31 10:23:01', NULL),
(4950, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-03-31 14:43:26', '2021-03-31 14:43:26', NULL),
(4951, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-03-31 14:47:23', '2021-03-31 14:47:23', NULL),
(4952, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'POST', '2021-03-31 14:50:51', '2021-03-31 14:50:51', NULL),
(4953, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-03-31 14:50:54', '2021-03-31 14:50:54', NULL),
(4954, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-31 14:53:35', '2021-03-31 14:53:35', NULL),
(4955, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-31 15:19:57', '2021-03-31 15:19:57', NULL),
(4956, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-31 15:19:58', '2021-03-31 15:19:58', NULL),
(4957, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-31 15:22:09', '2021-03-31 15:22:09', NULL),
(4958, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-31 15:22:26', '2021-03-31 15:22:26', NULL),
(4959, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-03-31 15:23:14', '2021-03-31 15:23:14', NULL),
(4960, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-03-31 15:25:12', '2021-03-31 15:25:12', NULL),
(4961, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-03-31 15:25:22', '2021-03-31 15:25:22', NULL),
(4962, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '157.39.28.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-03-31 15:25:46', '2021-03-31 15:25:46', NULL),
(4963, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '181.214.99.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.66 Safari/537.36', 'en-US,en;q=0.5', NULL, 'GET', '2021-03-31 16:29:49', '2021-03-31 16:29:49', NULL),
(4964, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-31 17:20:46', '2021-03-31 17:20:46', NULL),
(4965, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-03-31 17:21:17', '2021-03-31 17:21:17', NULL),
(4966, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-03-31 17:21:18', '2021-03-31 17:21:18', NULL),
(4967, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-31 17:21:27', '2021-03-31 17:21:27', NULL),
(4968, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-31 17:21:33', '2021-03-31 17:21:33', NULL),
(4969, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-03-31 17:21:35', '2021-03-31 17:21:35', NULL),
(4970, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-31 17:21:38', '2021-03-31 17:21:38', NULL),
(4971, 'Viewed dashboard/theme/manager', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/theme/manager', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-03-31 17:21:40', '2021-03-31 17:21:40', NULL),
(4972, 'Viewed dashboard/theme/index/page', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/theme/index/page?_token=8xdq7xVGG1DI8GZ7sFoY9rAKZX9RpaRVB4p5p7Vc', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'GET', '2021-03-31 17:21:42', '2021-03-31 17:21:42', NULL),
(4973, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'POST', '2021-03-31 17:21:42', '2021-03-31 17:21:42', NULL),
(4974, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'GET', '2021-03-31 17:22:55', '2021-03-31 17:22:55', NULL),
(4975, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-03-31 17:22:57', '2021-03-31 17:22:57', NULL),
(4976, 'Crawler crawled http://www.thehappyindianstore.com', 'Crawler', NULL, 'http://www.thehappyindianstore.com', '194.9.191.20', 'Mozilla/5.0 (compatible; vuhuvBot/1.0; +http://vuhuv.com/bot.html)', 'tr,tr-TR,az,az-AZ,en-US,en;q=0.5', NULL, 'GET', '2021-03-31 20:35:46', '2021-03-31 20:35:46', NULL),
(4977, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-31 23:32:11', '2021-03-31 23:32:11', NULL),
(4978, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-03-31 23:32:11', '2021-03-31 23:32:11', NULL),
(4979, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 02:22:04', '2021-04-01 02:22:04', NULL),
(4980, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 02:22:05', '2021-04-01 02:22:05', NULL),
(4981, 'Viewed courses/leadership2', 'Guest', NULL, 'http://thehappyindianstore.com/courses/leadership2', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-01 02:22:46', '2021-04-01 02:22:46', NULL),
(4982, 'Viewed courses/leadership2', 'Guest', NULL, 'http://thehappyindianstore.com/courses/leadership2', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses/leadership2', 'GET', '2021-04-01 02:22:57', '2021-04-01 02:22:57', NULL),
(4983, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 03:11:49', '2021-04-01 03:11:49', NULL),
(4984, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-04-01 03:12:33', '2021-04-01 03:12:33', NULL),
(4985, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-01 03:12:34', '2021-04-01 03:12:34', NULL),
(4986, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-01 03:12:41', '2021-04-01 03:12:41', NULL),
(4987, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-01 03:13:18', '2021-04-01 03:13:18', NULL),
(4988, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-01 03:13:20', '2021-04-01 03:13:20', NULL),
(4989, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-01 03:14:37', '2021-04-01 03:14:37', NULL),
(4990, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-01 03:14:39', '2021-04-01 03:14:39', NULL),
(4991, 'Viewed courses/leadership2', 'Registered', 24, 'http://thehappyindianstore.com/courses/leadership2', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses/leadership2', 'GET', '2021-04-01 03:46:09', '2021-04-01 03:46:09', NULL),
(4992, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses/leadership2', 'GET', '2021-04-01 03:46:15', '2021-04-01 03:46:15', NULL),
(4993, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-01 03:46:26', '2021-04-01 03:46:26', NULL),
(4994, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-01 03:46:29', '2021-04-01 03:46:29', NULL),
(4995, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-01 03:46:31', '2021-04-01 03:46:31', NULL),
(4996, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-01 03:46:32', '2021-04-01 03:46:32', NULL),
(4997, 'Crawler crawled http://thehappyindianstore.com', 'Crawler', NULL, 'http://thehappyindianstore.com', '106.220.104.78', 'WhatsApp/2.21.50.15 i', 'en-us', NULL, 'GET', '2021-04-01 04:49:29', '2021-04-01 04:49:29', NULL),
(4998, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-01 05:30:52', '2021-04-01 05:30:52', NULL),
(4999, 'Viewed dashboard/user/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/user/index', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-01 05:30:52', '2021-04-01 05:30:52', NULL),
(5000, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/user/index', 'POST', '2021-04-01 05:30:55', '2021-04-01 05:30:55', NULL),
(5001, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '62.210.92.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5', NULL, 'GET', '2021-04-01 06:03:58', '2021-04-01 06:03:58', NULL),
(5002, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '34.254.242.42', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:81.0) Gecko/20100101 Firefox/81.0', NULL, NULL, 'GET', '2021-04-01 10:29:45', '2021-04-01 10:29:45', NULL),
(5003, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '34.242.8.173', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:81.0) Gecko/20100101 Firefox/81.0', NULL, NULL, 'GET', '2021-04-01 10:54:35', '2021-04-01 10:54:35', NULL),
(5004, 'Viewed /', 'Guest', NULL, 'https://thehappyindianstore.com', '54.149.88.74', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', NULL, NULL, 'GET', '2021-04-01 18:19:13', '2021-04-01 18:19:13', NULL),
(5005, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '34.219.26.156', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', NULL, NULL, 'GET', '2021-04-01 18:19:13', '2021-04-01 18:19:13', NULL),
(5006, 'Crawler crawled https://thehappyindianstore.com', 'Crawler', NULL, 'https://thehappyindianstore.com', '52.88.13.70', 'Go-http-client/1.1', NULL, NULL, 'GET', '2021-04-01 18:20:16', '2021-04-01 18:20:16', NULL),
(5007, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com', '49.36.228.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 19:30:01', '2021-04-01 19:30:01', NULL),
(5008, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com', '49.36.228.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 19:30:01', '2021-04-01 19:30:01', NULL),
(5009, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '49.36.228.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 19:30:01', '2021-04-01 19:30:01', NULL),
(5010, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '49.36.228.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 19:30:01', '2021-04-01 19:30:01', NULL),
(5011, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '49.36.228.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 19:30:23', '2021-04-01 19:30:23', NULL),
(5012, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '49.36.228.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-01 19:31:11', '2021-04-01 19:31:11', NULL),
(5013, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '49.36.228.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'POST', '2021-04-01 19:31:14', '2021-04-01 19:31:14', NULL),
(5014, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.228.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-01 19:31:16', '2021-04-01 19:31:16', NULL),
(5015, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.228.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-01 19:31:30', '2021-04-01 19:31:30', NULL),
(5016, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.228.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-01 19:31:33', '2021-04-01 19:31:33', NULL),
(5017, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '49.36.228.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-01 19:31:40', '2021-04-01 19:31:40', NULL),
(5018, 'Viewed courses', 'Guest', NULL, 'http://thehappyindianstore.com/courses', '49.36.228.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-01 19:31:50', '2021-04-01 19:31:50', NULL),
(5019, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 22:06:57', '2021-04-01 22:06:57', NULL),
(5020, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 22:06:57', '2021-04-01 22:06:57', NULL),
(5021, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 22:06:57', '2021-04-01 22:06:57', NULL),
(5022, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 22:07:16', '2021-04-01 22:07:16', NULL),
(5023, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-04-01 22:08:28', '2021-04-01 22:08:28', NULL),
(5024, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-01 22:08:32', '2021-04-01 22:08:32', NULL),
(5025, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-01 22:08:41', '2021-04-01 22:08:41', NULL),
(5026, 'Viewed dashboard/theme/manager', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/theme/manager', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-01 22:08:54', '2021-04-01 22:08:54', NULL),
(5027, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'POST', '2021-04-01 22:09:00', '2021-04-01 22:09:00', NULL),
(5028, 'Viewed dashboard/theme/index/page', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/theme/index/page?_token=ZgwYRL1xjuvKPeHIS1EnF3UPKdddLdFhHIofylMe', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'GET', '2021-04-01 22:09:00', '2021-04-01 22:09:00', NULL),
(5029, 'Viewed dashboard/addon/manager', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/addon/manager', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/theme/manager', 'GET', '2021-04-01 22:09:04', '2021-04-01 22:09:04', NULL),
(5030, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/addon/manager', 'POST', '2021-04-01 22:09:07', '2021-04-01 22:09:07', NULL),
(5031, 'Viewed dashboard/addon/index/page', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/addon/index/page?_token=ZgwYRL1xjuvKPeHIS1EnF3UPKdddLdFhHIofylMe', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/addon/manager', 'GET', '2021-04-01 22:09:07', '2021-04-01 22:09:07', NULL),
(5032, 'Viewed dashboard/other/settings', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/other/settings', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/addon/manager', 'GET', '2021-04-01 22:09:14', '2021-04-01 22:09:14', NULL),
(5033, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'POST', '2021-04-01 22:09:16', '2021-04-01 22:09:16', NULL),
(5034, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/pages/index', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/other/settings', 'GET', '2021-04-01 22:09:19', '2021-04-01 22:09:19', NULL),
(5035, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'POST', '2021-04-01 22:09:22', '2021-04-01 22:09:22', NULL),
(5036, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'GET', '2021-04-01 22:09:23', '2021-04-01 22:09:23', NULL),
(5037, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-04-01 22:09:26', '2021-04-01 22:09:26', NULL),
(5038, 'Created dashboard/site/setting/update', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting/update', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-04-01 22:10:58', '2021-04-01 22:10:58', NULL),
(5039, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-04-01 22:10:59', '2021-04-01 22:10:59', NULL),
(5040, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-04-01 22:11:00', '2021-04-01 22:11:00', NULL),
(5041, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-01 22:11:17', '2021-04-01 22:11:17', NULL),
(5042, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'POST', '2021-04-01 22:16:17', '2021-04-01 22:16:17', NULL),
(5043, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-01 22:16:17', '2021-04-01 22:16:17', NULL),
(5044, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '49.36.224.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-01 22:16:58', '2021-04-01 22:16:58', NULL),
(5045, 'Viewed /', 'Guest', NULL, 'https://thehappyindianstore.com', '138.246.253.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', NULL, NULL, 'HEAD', '2021-04-02 00:57:34', '2021-04-02 00:57:34', NULL),
(5046, 'Crawler crawled http://www.thehappyindianstore.com', 'Crawler', NULL, 'http://www.thehappyindianstore.com', '58.53.128.88', 'GRequests/0.10', 'zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,it;q=0.6', NULL, 'GET', '2021-04-02 05:09:36', '2021-04-02 05:09:36', NULL),
(5047, 'Viewed /', 'Guest', NULL, 'https://www.thehappyindianstore.com', '137.226.113.44', 'Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101 Firefox/84.0', NULL, NULL, 'GET', '2021-04-02 07:43:51', '2021-04-02 07:43:51', NULL),
(5048, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-02 07:59:25', '2021-04-02 07:59:25', NULL),
(5049, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-02 09:10:05', '2021-04-02 09:10:05', NULL),
(5050, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-02 09:31:22', '2021-04-02 09:31:22', NULL),
(5051, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-04-02 09:31:37', '2021-04-02 09:31:37', NULL),
(5052, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-02 09:31:37', '2021-04-02 09:31:37', NULL),
(5053, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-02 09:31:41', '2021-04-02 09:31:41', NULL),
(5054, 'Viewed dashboard/course/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/create', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-02 09:31:52', '2021-04-02 09:31:52', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5055, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-04-02 09:31:55', '2021-04-02 09:31:55', NULL),
(5056, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-02 09:32:32', '2021-04-02 09:32:32', NULL),
(5057, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Registered', 5, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-02 09:32:40', '2021-04-02 09:32:40', NULL),
(5058, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-02 09:37:46', '2021-04-02 09:37:46', NULL),
(5059, 'Logged Out', 'Registered', 5, 'http://thehappyindianstore.com/logout', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'POST', '2021-04-02 09:37:54', '2021-04-02 09:37:54', NULL),
(5060, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-02 09:37:54', '2021-04-02 09:37:54', NULL),
(5061, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-04-02 09:38:07', '2021-04-02 09:38:07', NULL),
(5062, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-02 09:38:07', '2021-04-02 09:38:07', NULL),
(5063, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-02 09:38:09', '2021-04-02 09:38:09', NULL),
(5064, 'Viewed dashboard/language/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/language/index', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-02 09:38:14', '2021-04-02 09:38:14', NULL),
(5065, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'POST', '2021-04-02 09:38:15', '2021-04-02 09:38:15', NULL),
(5066, 'Created dashboard/language/store', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/language/store', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'POST', '2021-04-02 09:38:34', '2021-04-02 09:38:34', NULL),
(5067, 'Viewed dashboard/language/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/language/index', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'GET', '2021-04-02 09:38:34', '2021-04-02 09:38:34', NULL),
(5068, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'POST', '2021-04-02 09:38:35', '2021-04-02 09:38:35', NULL),
(5069, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'GET', '2021-04-02 09:38:44', '2021-04-02 09:38:44', NULL),
(5070, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-04-02 09:38:45', '2021-04-02 09:38:45', NULL),
(5071, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/pages/index', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-04-02 09:38:47', '2021-04-02 09:38:47', NULL),
(5072, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'POST', '2021-04-02 09:38:48', '2021-04-02 09:38:48', NULL),
(5073, 'Viewed dashboard/slider/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/index', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'GET', '2021-04-02 09:38:49', '2021-04-02 09:38:49', NULL),
(5074, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'POST', '2021-04-02 09:38:50', '2021-04-02 09:38:50', NULL),
(5075, 'Viewed dashboard/smtp/create', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/smtp/create', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-04-02 09:38:51', '2021-04-02 09:38:51', NULL),
(5076, 'Viewed dashboard/language/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/language/index', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-04-02 09:38:54', '2021-04-02 09:38:54', NULL),
(5077, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'POST', '2021-04-02 09:38:57', '2021-04-02 09:38:57', NULL),
(5078, 'Viewed dashboard/course/create', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/create', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-02 09:39:05', '2021-04-02 09:39:05', NULL),
(5079, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-04-02 09:39:08', '2021-04-02 09:39:08', NULL),
(5080, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-04-02 09:39:11', '2021-04-02 09:39:11', NULL),
(5081, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-04-02 09:39:12', '2021-04-02 09:39:12', NULL),
(5082, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-04-02 09:39:22', '2021-04-02 09:39:22', NULL),
(5083, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-02 09:39:23', '2021-04-02 09:39:23', NULL),
(5084, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-02 09:39:24', '2021-04-02 09:39:24', NULL),
(5085, 'Viewed dashboard/course/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/create', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-02 09:39:31', '2021-04-02 09:39:31', NULL),
(5086, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-04-02 09:39:32', '2021-04-02 09:39:32', NULL),
(5087, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-02 09:42:11', '2021-04-02 09:42:11', NULL),
(5088, 'Viewed courses/personal-transformation4', 'Registered', 5, 'http://thehappyindianstore.com/courses/personal-transformation4', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-02 09:42:22', '2021-04-02 09:42:22', NULL),
(5089, 'Viewed courses/personal-transformation4', 'Registered', 5, 'http://thehappyindianstore.com/courses/personal-transformation4', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-02 09:42:26', '2021-04-02 09:42:26', NULL),
(5090, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Registered', 5, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-02 09:42:38', '2021-04-02 09:42:38', NULL),
(5091, 'Viewed dashboard/course/create', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/create', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-02 09:44:12', '2021-04-02 09:44:12', NULL),
(5092, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-04-02 09:44:14', '2021-04-02 09:44:14', NULL),
(5093, 'Created dashboard/course/store', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/store', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'POST', '2021-04-02 09:45:55', '2021-04-02 09:45:55', NULL),
(5094, 'Viewed dashboard/course/index/26/what-is-articles', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/index/26/what-is-articles', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/create', 'GET', '2021-04-02 09:45:56', '2021-04-02 09:45:56', NULL),
(5095, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/26/what-is-articles', 'POST', '2021-04-02 09:45:57', '2021-04-02 09:45:57', NULL),
(5096, 'Viewed courses/personal-transformation4', 'Registered', 5, 'http://thehappyindianstore.com/courses/personal-transformation4', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-02 09:46:06', '2021-04-02 09:46:06', NULL),
(5097, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-02 09:46:10', '2021-04-02 09:46:10', NULL),
(5098, 'Viewed courses/personal-transformation4', 'Registered', 5, 'http://thehappyindianstore.com/courses/personal-transformation4', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-02 09:46:22', '2021-04-02 09:46:22', NULL),
(5099, 'Viewed courses', 'Registered', 5, 'http://thehappyindianstore.com/courses?categories=4&instructor=&language=&slug=', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-02 09:46:28', '2021-04-02 09:46:28', NULL),
(5100, 'Viewed course/the-complete-communication-skills-master-class-for-life', 'Registered', 5, 'http://thehappyindianstore.com/course/the-complete-communication-skills-master-class-for-life', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses?slug=&categories=4&language=&instructor=', 'GET', '2021-04-02 09:46:36', '2021-04-02 09:46:36', NULL),
(5101, 'Viewed courses', 'Registered', 5, 'http://thehappyindianstore.com/courses?categories=4&cost=all&instructor=&language=&slug=leadership2', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses?slug=&categories=4&language=&instructor=', 'GET', '2021-04-02 09:46:50', '2021-04-02 09:46:50', NULL),
(5102, 'Viewed courses', 'Registered', 5, 'http://thehappyindianstore.com/courses?categories=4&cost=all&instructor=&language=&slug=leadership2', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses?slug=&categories=4&language=&instructor=', 'GET', '2021-04-02 09:46:51', '2021-04-02 09:46:51', NULL),
(5103, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses?slug=leadership2&categories=4&language=&cost=all&instructor=', 'GET', '2021-04-02 09:46:55', '2021-04-02 09:46:55', NULL),
(5104, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses?slug=leadership2&categories=4&language=&cost=all&instructor=', 'GET', '2021-04-02 09:46:55', '2021-04-02 09:46:55', NULL),
(5105, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses?slug=leadership2&categories=4&language=&cost=all&instructor=', 'GET', '2021-04-02 09:46:57', '2021-04-02 09:46:57', NULL),
(5106, 'Viewed courses/personal-transformation4', 'Registered', 5, 'http://thehappyindianstore.com/courses/personal-transformation4', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-02 09:47:06', '2021-04-02 09:47:06', NULL),
(5107, 'Logged Out', 'Registered', 5, 'http://thehappyindianstore.com/logout', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses/personal-transformation4', 'POST', '2021-04-02 09:47:17', '2021-04-02 09:47:17', NULL),
(5108, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-02 09:47:17', '2021-04-02 09:47:17', NULL),
(5109, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-04-02 09:47:28', '2021-04-02 09:47:28', NULL),
(5110, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-02 09:47:29', '2021-04-02 09:47:29', NULL),
(5111, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-02 09:47:30', '2021-04-02 09:47:30', NULL),
(5112, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-02 09:47:35', '2021-04-02 09:47:35', NULL),
(5113, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-02 09:47:37', '2021-04-02 09:47:37', NULL),
(5114, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=26', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-02 09:47:42', '2021-04-02 09:47:42', NULL),
(5115, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-02 09:47:55', '2021-04-02 09:47:55', NULL),
(5116, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-02 09:47:57', '2021-04-02 09:47:57', NULL),
(5117, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-02 09:47:58', '2021-04-02 09:47:58', NULL),
(5118, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-02 09:47:59', '2021-04-02 09:47:59', NULL),
(5119, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-02 09:48:02', '2021-04-02 09:48:02', NULL),
(5120, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-02 09:48:02', '2021-04-02 09:48:02', NULL),
(5121, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-04-02 09:48:14', '2021-04-02 09:48:14', NULL),
(5122, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-02 09:48:15', '2021-04-02 09:48:15', NULL),
(5123, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-02 09:48:16', '2021-04-02 09:48:16', NULL),
(5124, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-02 09:48:18', '2021-04-02 09:48:18', NULL),
(5125, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-02 09:48:20', '2021-04-02 09:48:20', NULL),
(5126, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-02 09:48:28', '2021-04-02 09:48:28', NULL),
(5127, 'Viewed course/what-is-articles', 'Registered', 5, 'http://thehappyindianstore.com/course/what-is-articles', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-02 09:48:33', '2021-04-02 09:48:33', NULL),
(5128, 'Viewed course/what-is-articles', 'Registered', 5, 'http://thehappyindianstore.com/course/what-is-articles', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-02 09:48:40', '2021-04-02 09:48:40', NULL),
(5129, 'Viewed courses/personal-transformation4', 'Registered', 5, 'http://thehappyindianstore.com/courses/personal-transformation4', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-02 09:48:48', '2021-04-02 09:48:48', NULL),
(5130, 'Viewed course/what-is-articles', 'Registered', 5, 'http://thehappyindianstore.com/course/what-is-articles', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-02 09:48:52', '2021-04-02 09:48:52', NULL),
(5131, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-02 09:49:03', '2021-04-02 09:49:03', NULL),
(5132, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '92.204.170.186', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-04-02 14:10:07', '2021-04-02 14:10:07', NULL),
(5133, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '44.234.65.32', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', NULL, NULL, 'GET', '2021-04-02 18:19:07', '2021-04-02 18:19:07', NULL),
(5134, 'Viewed /', 'Guest', NULL, 'https://thehappyindianstore.com', '34.219.147.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', NULL, NULL, 'GET', '2021-04-02 18:19:10', '2021-04-02 18:19:10', NULL),
(5135, 'Crawler crawled https://thehappyindianstore.com', 'Crawler', NULL, 'https://thehappyindianstore.com', '34.222.57.143', 'Go-http-client/1.1', NULL, NULL, 'GET', '2021-04-02 18:19:36', '2021-04-02 18:19:36', NULL),
(5136, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '212.102.60.146', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:50.0) Gecko/20100101 Firefox/50.0', NULL, NULL, 'GET', '2021-04-02 21:09:28', '2021-04-02 21:09:28', NULL),
(5137, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '216.19.195.6', 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.6', NULL, 'https://www.bing.com/', 'GET', '2021-04-02 21:50:42', '2021-04-02 21:50:42', NULL),
(5138, 'Viewed /', 'Guest', NULL, 'https://thehappyindianstore.com', '54.149.77.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', NULL, NULL, 'GET', '2021-04-03 18:19:26', '2021-04-03 18:19:26', NULL),
(5139, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '34.218.81.187', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', NULL, NULL, 'GET', '2021-04-03 18:19:26', '2021-04-03 18:19:26', NULL),
(5140, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '184.75.210.54', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.66 Safari/537.36', 'en-US,en;q=0.5', NULL, 'GET', '2021-04-04 03:25:04', '2021-04-04 03:25:04', NULL),
(5141, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '44.234.71.161', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', NULL, NULL, 'GET', '2021-04-04 18:18:48', '2021-04-04 18:18:48', NULL),
(5142, 'Viewed /', 'Guest', NULL, 'https://thehappyindianstore.com', '34.220.242.147', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', NULL, NULL, 'GET', '2021-04-04 18:18:48', '2021-04-04 18:18:48', NULL),
(5143, 'Crawler crawled https://thehappyindianstore.com', 'Crawler', NULL, 'https://thehappyindianstore.com', '34.222.195.246', 'Go-http-client/1.1', NULL, NULL, 'GET', '2021-04-04 18:19:14', '2021-04-04 18:19:14', NULL),
(5144, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-04 19:42:37', '2021-04-04 19:42:37', NULL),
(5145, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-04 19:50:13', '2021-04-04 19:50:13', NULL),
(5146, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'POST', '2021-04-04 20:04:16', '2021-04-04 20:04:16', NULL),
(5147, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 20:04:19', '2021-04-04 20:04:19', NULL),
(5148, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:09:15', '2021-04-04 20:09:15', NULL),
(5149, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 20:27:48', '2021-04-04 20:27:48', NULL),
(5150, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:28:02', '2021-04-04 20:28:02', NULL),
(5151, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 20:29:08', '2021-04-04 20:29:08', NULL),
(5152, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:29:13', '2021-04-04 20:29:13', NULL),
(5153, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 20:30:57', '2021-04-04 20:30:57', NULL),
(5154, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:31:03', '2021-04-04 20:31:03', NULL),
(5155, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 20:31:38', '2021-04-04 20:31:38', NULL),
(5156, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:31:46', '2021-04-04 20:31:46', NULL),
(5157, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 20:36:31', '2021-04-04 20:36:31', NULL),
(5158, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:36:33', '2021-04-04 20:36:33', NULL),
(5159, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 20:38:51', '2021-04-04 20:38:51', NULL),
(5160, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:38:53', '2021-04-04 20:38:53', NULL),
(5161, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:41:19', '2021-04-04 20:41:19', NULL),
(5162, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-04 20:41:20', '2021-04-04 20:41:20', NULL),
(5163, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 20:41:28', '2021-04-04 20:41:28', NULL),
(5164, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-04 20:46:32', '2021-04-04 20:46:32', NULL),
(5165, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-04 20:46:32', '2021-04-04 20:46:32', NULL),
(5166, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-04 20:46:32', '2021-04-04 20:46:32', NULL),
(5167, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-04 20:46:32', '2021-04-04 20:46:32', NULL),
(5168, 'Logged Out', 'Registered', 5, 'http://thehappyindianstore.com/logout', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'POST', '2021-04-04 20:47:05', '2021-04-04 20:47:05', NULL),
(5169, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 20:47:06', '2021-04-04 20:47:06', NULL),
(5170, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-04-04 20:47:17', '2021-04-04 20:47:17', NULL),
(5171, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 20:47:17', '2021-04-04 20:47:17', NULL),
(5172, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-04 20:47:45', '2021-04-04 20:47:45', NULL),
(5173, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:47:47', '2021-04-04 20:47:47', NULL),
(5174, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-04 20:48:04', '2021-04-04 20:48:04', NULL),
(5175, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-04 20:48:06', '2021-04-04 20:48:06', NULL),
(5176, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-04 20:48:09', '2021-04-04 20:48:09', NULL),
(5177, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-04 20:48:11', '2021-04-04 20:48:11', NULL),
(5178, 'Viewed dashboard/packages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/packages/index', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-04 20:48:11', '2021-04-04 20:48:11', NULL),
(5179, 'Viewed dashboard/packages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/packages/index', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-04 20:48:21', '2021-04-04 20:48:21', NULL),
(5180, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/packages/index', 'POST', '2021-04-04 20:48:23', '2021-04-04 20:48:23', NULL),
(5181, 'Viewed dashboard/affiliate/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/setting', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/packages/index', 'GET', '2021-04-04 20:48:54', '2021-04-04 20:48:54', NULL),
(5182, 'Viewed dashboard/affiliate/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/setting', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-04 20:49:09', '2021-04-04 20:49:09', NULL),
(5183, 'Viewed dashboard/affiliate/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/setting', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-04 20:49:19', '2021-04-04 20:49:19', NULL),
(5184, 'Viewed dashboard/affiliate/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/setting', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-04 20:49:24', '2021-04-04 20:49:24', NULL),
(5185, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/setting', 'POST', '2021-04-04 20:49:29', '2021-04-04 20:49:29', NULL),
(5186, 'Viewed dashboard/affiliate/payment/request', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/payment/request', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/setting', 'GET', '2021-04-04 20:49:33', '2021-04-04 20:49:33', NULL),
(5187, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/payment/request', 'POST', '2021-04-04 20:49:34', '2021-04-04 20:49:34', NULL),
(5188, 'Viewed dashboard/affiliate/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/index', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/payment/request', 'GET', '2021-04-04 20:49:35', '2021-04-04 20:49:35', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5189, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/index', 'POST', '2021-04-04 20:49:37', '2021-04-04 20:49:37', NULL),
(5190, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/index', 'GET', '2021-04-04 20:49:44', '2021-04-04 20:49:44', NULL),
(5191, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:49:47', '2021-04-04 20:49:47', NULL),
(5192, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 20:52:34', '2021-04-04 20:52:34', NULL),
(5193, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 20:54:27', '2021-04-04 20:54:27', NULL),
(5194, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'POST', '2021-04-04 20:55:25', '2021-04-04 20:55:25', NULL),
(5195, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 20:55:26', '2021-04-04 20:55:26', NULL),
(5196, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:55:28', '2021-04-04 20:55:28', NULL),
(5197, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 20:59:26', '2021-04-04 20:59:26', NULL),
(5198, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:59:29', '2021-04-04 20:59:29', NULL),
(5199, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 20:59:48', '2021-04-04 20:59:48', NULL),
(5200, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 20:59:51', '2021-04-04 20:59:51', NULL),
(5201, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 21:01:06', '2021-04-04 21:01:06', NULL),
(5202, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 21:01:09', '2021-04-04 21:01:09', NULL),
(5203, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 21:12:17', '2021-04-04 21:12:17', NULL),
(5204, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 21:12:20', '2021-04-04 21:12:20', NULL),
(5205, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 21:12:53', '2021-04-04 21:12:53', NULL),
(5206, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-04 21:12:54', '2021-04-04 21:12:54', NULL),
(5207, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'POST', '2021-04-04 21:13:08', '2021-04-04 21:13:08', NULL),
(5208, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 21:13:09', '2021-04-04 21:13:09', NULL),
(5209, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 21:13:12', '2021-04-04 21:13:12', NULL),
(5210, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '157.39.52.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-04 21:46:31', '2021-04-04 21:46:31', NULL),
(5211, 'Viewed /', 'Registered', 5, 'http://thehappyindianstore.com', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-04 21:53:07', '2021-04-04 21:53:07', NULL),
(5212, 'Logged Out', 'Registered', 5, 'http://thehappyindianstore.com/logout', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'POST', '2021-04-04 21:53:20', '2021-04-04 21:53:20', NULL),
(5213, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 21:53:22', '2021-04-04 21:53:22', NULL),
(5214, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 21:57:15', '2021-04-04 21:57:15', NULL),
(5215, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-04 22:27:48', '2021-04-04 22:27:48', NULL),
(5216, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '106.211.88.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-04 22:28:08', '2021-04-04 22:28:08', NULL),
(5217, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '106.196.85.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-04 22:31:19', '2021-04-04 22:31:19', NULL),
(5218, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '106.196.85.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 22:32:10', '2021-04-04 22:32:10', NULL),
(5219, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '106.196.85.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 22:32:11', '2021-04-04 22:32:11', NULL),
(5220, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '106.196.85.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-04 22:32:15', '2021-04-04 22:32:15', NULL),
(5221, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '106.196.85.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/certificate/setup', 'POST', '2021-04-04 22:32:47', '2021-04-04 22:32:47', NULL),
(5222, 'Viewed dashboard/user/show/24', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/user/show/24', '106.196.85.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/certificate/setup', 'GET', '2021-04-04 22:32:56', '2021-04-04 22:32:56', NULL),
(5223, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '106.196.85.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/user/show/24', 'POST', '2021-04-04 22:32:57', '2021-04-04 22:32:57', NULL),
(5224, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '106.196.85.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/user/show/24', 'POST', '2021-04-04 22:33:02', '2021-04-04 22:33:02', NULL),
(5225, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '106.196.85.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/user/show/24', 'GET', '2021-04-04 22:33:03', '2021-04-04 22:33:03', NULL),
(5226, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '106.196.85.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 22:33:20', '2021-04-04 22:33:20', NULL),
(5227, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '106.196.85.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 22:33:20', '2021-04-04 22:33:20', NULL),
(5228, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '106.196.85.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-04 22:33:21', '2021-04-04 22:33:21', NULL),
(5229, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 23:31:46', '2021-04-04 23:31:46', NULL),
(5230, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.44.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 23:49:27', '2021-04-04 23:49:27', NULL),
(5231, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.44.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 23:53:02', '2021-04-04 23:53:02', NULL),
(5232, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 23:53:31', '2021-04-04 23:53:31', NULL),
(5233, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.44.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 23:54:58', '2021-04-04 23:54:58', NULL),
(5234, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 23:55:12', '2021-04-04 23:55:12', NULL),
(5235, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.44.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 23:55:17', '2021-04-04 23:55:17', NULL),
(5236, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 23:55:18', '2021-04-04 23:55:18', NULL),
(5237, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.0.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-04 23:58:43', '2021-04-04 23:58:43', NULL),
(5238, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.44.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 00:04:23', '2021-04-05 00:04:23', NULL),
(5239, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.44.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 00:06:10', '2021-04-05 00:06:10', NULL),
(5240, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '223.225.160.111', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 00:50:22', '2021-04-05 00:50:22', NULL),
(5241, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '223.225.160.111', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 00:50:22', '2021-04-05 00:50:22', NULL),
(5242, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '223.225.160.111', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 00:50:25', '2021-04-05 00:50:25', NULL),
(5243, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '223.225.160.111', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 00:50:34', '2021-04-05 00:50:34', NULL),
(5244, 'Viewed course/what-is-articles', 'Guest', NULL, 'http://thehappyindianstore.com/course/what-is-articles', '223.225.160.111', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 00:54:04', '2021-04-05 00:54:04', NULL),
(5245, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '223.225.160.111', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 00:54:19', '2021-04-05 00:54:19', NULL),
(5246, 'Viewed course/what-is-articles', 'Guest', NULL, 'http://thehappyindianstore.com/course/what-is-articles', '223.225.160.111', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 00:55:48', '2021-04-05 00:55:48', NULL),
(5247, 'Viewed course/what-is-articles', 'Guest', NULL, 'http://thehappyindianstore.com/course/what-is-articles', '223.225.160.111', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 00:55:49', '2021-04-05 00:55:49', NULL),
(5248, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '223.225.160.111', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 01:35:59', '2021-04-05 01:35:59', NULL),
(5249, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '223.225.160.111', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 01:35:59', '2021-04-05 01:35:59', NULL),
(5250, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '223.225.160.111', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 01:36:00', '2021-04-05 01:36:00', NULL),
(5251, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 02:55:12', '2021-04-05 02:55:12', NULL),
(5252, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 02:55:30', '2021-04-05 02:55:30', NULL),
(5253, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-05 02:57:44', '2021-04-05 02:57:44', NULL),
(5254, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-04-05 02:59:37', '2021-04-05 02:59:37', NULL),
(5255, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-05 02:59:37', '2021-04-05 02:59:37', NULL),
(5256, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-05 02:59:40', '2021-04-05 02:59:40', NULL),
(5257, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-05 02:59:44', '2021-04-05 02:59:44', NULL),
(5258, 'Viewed courses/personal-transformation4', 'Guest', NULL, 'http://thehappyindianstore.com/courses/personal-transformation4', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 02:59:50', '2021-04-05 02:59:50', NULL),
(5259, 'Viewed dashboard/coupon/new', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/coupon/new', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-05 03:00:08', '2021-04-05 03:00:08', NULL),
(5260, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/coupon/new', 'POST', '2021-04-05 03:00:12', '2021-04-05 03:00:12', NULL),
(5261, 'Viewed course/what-is-articles', 'Guest', NULL, 'http://thehappyindianstore.com/course/what-is-articles', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-05 03:00:15', '2021-04-05 03:00:15', NULL),
(5262, 'Viewed dashboard/coupon/coupons', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/coupon/coupons', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/coupon/new', 'GET', '2021-04-05 03:00:25', '2021-04-05 03:00:25', NULL),
(5263, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/certificate/setup', 'POST', '2021-04-05 03:00:29', '2021-04-05 03:00:29', NULL),
(5264, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-05 03:00:46', '2021-04-05 03:00:46', NULL),
(5265, 'Viewed dashboard/affiliate/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/setting', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/certificate/setup', 'GET', '2021-04-05 03:00:47', '2021-04-05 03:00:47', NULL),
(5266, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/setting', 'POST', '2021-04-05 03:00:48', '2021-04-05 03:00:48', NULL),
(5267, 'Viewed dashboard/affiliate/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/setting', 'GET', '2021-04-05 03:00:53', '2021-04-05 03:00:53', NULL),
(5268, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/index', 'POST', '2021-04-05 03:00:55', '2021-04-05 03:00:55', NULL),
(5269, 'Viewed dashboard/affiliate/payment/request', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/affiliate/payment/request', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/index', 'GET', '2021-04-05 03:01:01', '2021-04-05 03:01:01', NULL),
(5270, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/payment/request', 'POST', '2021-04-05 03:01:03', '2021-04-05 03:01:03', NULL),
(5271, 'Viewed dashboard/app/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/app/setting', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/affiliate/payment/request', 'GET', '2021-04-05 03:01:19', '2021-04-05 03:01:19', NULL),
(5272, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/app/setting', 'POST', '2021-04-05 03:01:23', '2021-04-05 03:01:23', NULL),
(5273, 'Viewed dashboard/currency/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/currency/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/app/setting', 'GET', '2021-04-05 03:01:26', '2021-04-05 03:01:26', NULL),
(5274, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/currency/index', 'POST', '2021-04-05 03:01:29', '2021-04-05 03:01:29', NULL),
(5275, 'Viewed dashboard/currency/align', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/currency/align?id=1', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/currency/index', 'GET', '2021-04-05 03:01:38', '2021-04-05 03:01:38', NULL),
(5276, 'Viewed dashboard/currency/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/currency/published?id=1', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/currency/index', 'GET', '2021-04-05 03:01:45', '2021-04-05 03:01:45', NULL),
(5277, 'Viewed dashboard/currency/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/currency/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 03:01:51', '2021-04-05 03:01:51', NULL),
(5278, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/currency/index', 'POST', '2021-04-05 03:01:53', '2021-04-05 03:01:53', NULL),
(5279, 'Viewed dashboard/currency/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/currency/published?id=1', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/currency/index', 'GET', '2021-04-05 03:02:01', '2021-04-05 03:02:01', NULL),
(5280, 'Viewed dashboard/currency/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/currency/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 03:02:05', '2021-04-05 03:02:05', NULL),
(5281, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/currency/index', 'POST', '2021-04-05 03:02:07', '2021-04-05 03:02:07', NULL),
(5282, 'Viewed dashboard/language/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/language/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/currency/index', 'GET', '2021-04-05 03:02:09', '2021-04-05 03:02:09', NULL),
(5283, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'POST', '2021-04-05 03:02:13', '2021-04-05 03:02:13', NULL),
(5284, 'Viewed dashboard/smtp/create', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/smtp/create', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/language/index', 'GET', '2021-04-05 03:02:23', '2021-04-05 03:02:23', NULL),
(5285, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/smtp/create', 'POST', '2021-04-05 03:02:25', '2021-04-05 03:02:25', NULL),
(5286, 'Viewed dashboard/slider/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/smtp/create', 'GET', '2021-04-05 03:02:29', '2021-04-05 03:02:29', NULL),
(5287, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'POST', '2021-04-05 03:02:31', '2021-04-05 03:02:31', NULL),
(5288, 'Viewed dashboard/slider/create', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/slider/create', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-04-05 03:02:39', '2021-04-05 03:02:39', NULL),
(5289, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/pages/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-04-05 03:02:44', '2021-04-05 03:02:44', NULL),
(5290, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/pages/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-04-05 03:02:50', '2021-04-05 03:02:50', NULL),
(5291, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/pages/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-04-05 03:02:50', '2021-04-05 03:02:50', NULL),
(5292, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/pages/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-04-05 03:02:51', '2021-04-05 03:02:51', NULL),
(5293, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/pages/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-04-05 03:02:52', '2021-04-05 03:02:52', NULL),
(5294, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'POST', '2021-04-05 03:02:56', '2021-04-05 03:02:56', NULL),
(5295, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/pages/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/slider/index', 'GET', '2021-04-05 03:02:58', '2021-04-05 03:02:58', NULL),
(5296, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'POST', '2021-04-05 03:03:01', '2021-04-05 03:03:01', NULL),
(5297, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'GET', '2021-04-05 03:03:02', '2021-04-05 03:03:02', NULL),
(5298, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/site/setting', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/pages/index', 'GET', '2021-04-05 03:03:12', '2021-04-05 03:03:12', NULL),
(5299, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-04-05 03:03:15', '2021-04-05 03:03:15', NULL),
(5300, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-05 03:03:45', '2021-04-05 03:03:45', NULL),
(5301, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-05 03:04:28', '2021-04-05 03:04:28', NULL),
(5302, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-05 03:05:39', '2021-04-05 03:05:39', NULL),
(5303, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '184.75.210.52', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.66 Safari/537.36', 'en-US,en;q=0.5', NULL, 'GET', '2021-04-05 03:06:22', '2021-04-05 03:06:22', NULL),
(5304, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-05 03:06:58', '2021-04-05 03:06:58', NULL),
(5305, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-05 03:07:50', '2021-04-05 03:07:50', NULL),
(5306, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/courses/personal-transformation4', 'GET', '2021-04-05 03:11:04', '2021-04-05 03:11:04', NULL),
(5307, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'POST', '2021-04-05 03:11:35', '2021-04-05 03:11:35', NULL),
(5308, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-05 03:11:37', '2021-04-05 03:11:37', NULL),
(5309, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-05 03:11:40', '2021-04-05 03:11:40', NULL),
(5310, 'Viewed dashboard/course/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-05 03:12:05', '2021-04-05 03:12:05', NULL),
(5311, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:12:09', '2021-04-05 03:12:09', NULL),
(5312, 'Logged Out', 'Registered', 5, 'http://thehappyindianstore.com/logout', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:12:22', '2021-04-05 03:12:22', NULL),
(5313, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:12:23', '2021-04-05 03:12:23', NULL),
(5314, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'POST', '2021-04-05 03:12:52', '2021-04-05 03:12:52', NULL),
(5315, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-05 03:12:53', '2021-04-05 03:12:53', NULL),
(5316, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-05 03:12:56', '2021-04-05 03:12:56', NULL),
(5317, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-05 03:12:59', '2021-04-05 03:12:59', NULL),
(5318, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:13:02', '2021-04-05 03:13:02', NULL),
(5319, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:13:28', '2021-04-05 03:13:28', NULL),
(5320, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:13:29', '2021-04-05 03:13:29', NULL),
(5321, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'POST', '2021-04-05 03:13:40', '2021-04-05 03:13:40', NULL),
(5322, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-05 03:13:41', '2021-04-05 03:13:41', NULL),
(5323, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-05 03:13:44', '2021-04-05 03:13:44', NULL),
(5324, 'Viewed dashboard/course/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-05 03:13:48', '2021-04-05 03:13:48', NULL),
(5325, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:13:50', '2021-04-05 03:13:50', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5326, 'Viewed dashboard/course/edit/22/digital-finance-marketing-course', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/22/digital-finance-marketing-course', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:13:57', '2021-04-05 03:13:57', NULL),
(5327, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/22/digital-finance-marketing-course', 'POST', '2021-04-05 03:14:10', '2021-04-05 03:14:10', NULL),
(5328, 'Created dashboard/course/update', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/update', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/22/digital-finance-marketing-course', 'POST', '2021-04-05 03:14:43', '2021-04-05 03:14:43', NULL),
(5329, 'Viewed dashboard/course/edit/22/digital-finance-marketing-course', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/22/digital-finance-marketing-course', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/22/digital-finance-marketing-course', 'GET', '2021-04-05 03:14:44', '2021-04-05 03:14:44', NULL),
(5330, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/22/digital-finance-marketing-course', 'POST', '2021-04-05 03:14:48', '2021-04-05 03:14:48', NULL),
(5331, 'Viewed dashboard/course/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/22/digital-finance-marketing-course', 'GET', '2021-04-05 03:14:49', '2021-04-05 03:14:49', NULL),
(5332, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:14:56', '2021-04-05 03:14:56', NULL),
(5333, 'Viewed dashboard/course/edit/20/the-complete-digital-finance-marketing-course', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/20/the-complete-digital-finance-marketing-course', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:14:59', '2021-04-05 03:14:59', NULL),
(5334, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/20/the-complete-digital-finance-marketing-course', 'POST', '2021-04-05 03:15:03', '2021-04-05 03:15:03', NULL),
(5335, 'Created dashboard/course/update', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/update', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/20/the-complete-digital-finance-marketing-course', 'POST', '2021-04-05 03:16:12', '2021-04-05 03:16:12', NULL),
(5336, 'Viewed dashboard/course/edit/20/the-complete-digital-finance-marketing-course', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/20/the-complete-digital-finance-marketing-course', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/20/the-complete-digital-finance-marketing-course', 'GET', '2021-04-05 03:16:12', '2021-04-05 03:16:12', NULL),
(5337, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/20/the-complete-digital-finance-marketing-course', 'POST', '2021-04-05 03:16:16', '2021-04-05 03:16:16', NULL),
(5338, 'Viewed dashboard/course/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/20/the-complete-digital-finance-marketing-course', 'GET', '2021-04-05 03:16:17', '2021-04-05 03:16:17', NULL),
(5339, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:16:20', '2021-04-05 03:16:20', NULL),
(5340, 'Viewed dashboard/course/edit/11/the-complete-financial-analyst-course-2020', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-financial-analyst-course-2020', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:16:40', '2021-04-05 03:16:40', NULL),
(5341, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-financial-analyst-course-2020', 'POST', '2021-04-05 03:16:45', '2021-04-05 03:16:45', NULL),
(5342, 'Created dashboard/course/update', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/update', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-financial-analyst-course-2020', 'POST', '2021-04-05 03:16:58', '2021-04-05 03:16:58', NULL),
(5343, 'Viewed dashboard/course/edit/11/the-complete-financial-analyst-course-2020', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-financial-analyst-course-2020', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-financial-analyst-course-2020', 'GET', '2021-04-05 03:16:59', '2021-04-05 03:16:59', NULL),
(5344, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-financial-analyst-course-2020', 'POST', '2021-04-05 03:17:02', '2021-04-05 03:17:02', NULL),
(5345, 'Logged Out', 'Registered', 5, 'http://thehappyindianstore.com/logout', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-financial-analyst-course-2020', 'POST', '2021-04-05 03:17:05', '2021-04-05 03:17:05', NULL),
(5346, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-financial-analyst-course-2020', 'GET', '2021-04-05 03:17:06', '2021-04-05 03:17:06', NULL),
(5347, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'POST', '2021-04-05 03:17:18', '2021-04-05 03:17:18', NULL),
(5348, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/login', 'GET', '2021-04-05 03:17:19', '2021-04-05 03:17:19', NULL),
(5349, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-05 03:17:22', '2021-04-05 03:17:22', NULL),
(5350, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-05 03:17:49', '2021-04-05 03:17:49', NULL),
(5351, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:17:54', '2021-04-05 03:17:54', NULL),
(5352, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=26', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:17:55', '2021-04-05 03:17:55', NULL),
(5353, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=25', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:17:56', '2021-04-05 03:17:56', NULL),
(5354, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=22', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:18:01', '2021-04-05 03:18:01', NULL),
(5355, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=20', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:18:09', '2021-04-05 03:18:09', NULL),
(5356, 'Viewed dashboard/course/published', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/published?id=11', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:18:12', '2021-04-05 03:18:12', NULL),
(5357, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 03:18:21', '2021-04-05 03:18:21', NULL),
(5358, 'Viewed course/increase-your-personal-skills-and-join-our-course', 'Registered', 24, 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 03:18:31', '2021-04-05 03:18:31', NULL),
(5359, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:19:24', '2021-04-05 03:19:24', NULL),
(5360, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'POST', '2021-04-05 03:19:50', '2021-04-05 03:19:50', NULL),
(5361, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/site/setting', 'GET', '2021-04-05 03:19:50', '2021-04-05 03:19:50', NULL),
(5362, 'Viewed course/personal-development-course', 'Guest', NULL, 'http://thehappyindianstore.com/course/personal-development-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 03:20:13', '2021-04-05 03:20:13', NULL),
(5363, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-05 03:22:31', '2021-04-05 03:22:31', NULL),
(5364, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 03:24:18', '2021-04-05 03:24:18', NULL),
(5365, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 03:24:28', '2021-04-05 03:24:28', NULL),
(5366, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 03:24:35', '2021-04-05 03:24:35', NULL),
(5367, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 03:24:45', '2021-04-05 03:24:45', NULL),
(5368, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 03:24:59', '2021-04-05 03:24:59', NULL),
(5369, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:25:01', '2021-04-05 03:25:01', NULL),
(5370, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 03:26:03', '2021-04-05 03:26:03', NULL),
(5371, 'Logged In', 'Registered', 24, 'http://thehappyindianstore.com/login', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-04-05 03:28:26', '2021-04-05 03:28:26', NULL),
(5372, 'Viewed dashboard/home', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-05 03:28:26', '2021-04-05 03:28:26', NULL),
(5373, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-05 03:28:29', '2021-04-05 03:28:29', NULL),
(5374, 'Viewed dashboard/course/index', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-05 03:28:32', '2021-04-05 03:28:32', NULL),
(5375, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:28:34', '2021-04-05 03:28:34', NULL),
(5376, 'Viewed dashboard/course/index/22/personal-development-course', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index/22/personal-development-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:28:41', '2021-04-05 03:28:41', NULL),
(5377, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/22/personal-development-course', 'POST', '2021-04-05 03:28:46', '2021-04-05 03:28:46', NULL),
(5378, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:28:51', '2021-04-05 03:28:51', NULL),
(5379, 'Viewed dashboard/course/index/20/increase-your-personal-skills-and-join-our-course', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index/20/increase-your-personal-skills-and-join-our-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:28:54', '2021-04-05 03:28:54', NULL),
(5380, 'Viewed dashboard/course/index/11/the-complete-skills-course-2020', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index/11/the-complete-skills-course-2020', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:28:56', '2021-04-05 03:28:56', NULL),
(5381, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/20/increase-your-personal-skills-and-join-our-course', 'POST', '2021-04-05 03:28:58', '2021-04-05 03:28:58', NULL),
(5382, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/11/the-complete-skills-course-2020', 'POST', '2021-04-05 03:28:58', '2021-04-05 03:28:58', NULL),
(5383, 'Viewed dashboard/course/index/11/the-complete-skills-course-2020', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/course/index/11/the-complete-skills-course-2020', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:28:59', '2021-04-05 03:28:59', NULL),
(5384, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/11/the-complete-skills-course-2020', 'POST', '2021-04-05 03:29:03', '2021-04-05 03:29:03', NULL),
(5385, 'Viewed dashboard/class/content/show/46', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/class/content/show/46', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/20/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:29:10', '2021-04-05 03:29:10', NULL),
(5386, 'Viewed dashboard/class/content/show/45', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/class/content/show/45', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/20/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:29:19', '2021-04-05 03:29:19', NULL),
(5387, 'Viewed dashboard/class/content/source/code/45', 'Registered', 24, 'http://thehappyindianstore.com/dashboard/class/content/source/code/45', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/20/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:29:22', '2021-04-05 03:29:22', NULL),
(5388, 'Logged Out', 'Registered', 24, 'http://thehappyindianstore.com/logout', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/11/the-complete-skills-course-2020', 'POST', '2021-04-05 03:31:53', '2021-04-05 03:31:53', NULL),
(5389, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index/11/the-complete-skills-course-2020', 'GET', '2021-04-05 03:31:53', '2021-04-05 03:31:53', NULL),
(5390, 'Logged In', 'Registered', 5, 'http://thehappyindianstore.com/login', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'POST', '2021-04-05 03:32:13', '2021-04-05 03:32:13', NULL),
(5391, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-05 03:32:14', '2021-04-05 03:32:14', NULL),
(5392, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-05 03:32:17', '2021-04-05 03:32:17', NULL),
(5393, 'Viewed dashboard/course/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-05 03:32:19', '2021-04-05 03:32:19', NULL),
(5394, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:32:21', '2021-04-05 03:32:21', NULL),
(5395, 'Viewed dashboard/course/edit/22/personal-development-course', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/22/personal-development-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:32:26', '2021-04-05 03:32:26', NULL),
(5396, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/22/personal-development-course', 'POST', '2021-04-05 03:32:29', '2021-04-05 03:32:29', NULL),
(5397, 'Created dashboard/course/update', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/update', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/22/personal-development-course', 'POST', '2021-04-05 03:32:39', '2021-04-05 03:32:39', NULL),
(5398, 'Viewed dashboard/course/edit/22/personal-development-course', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/22/personal-development-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/22/personal-development-course', 'GET', '2021-04-05 03:32:40', '2021-04-05 03:32:40', NULL),
(5399, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/22/personal-development-course', 'POST', '2021-04-05 03:32:42', '2021-04-05 03:32:42', NULL),
(5400, 'Viewed dashboard/course/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/22/personal-development-course', 'GET', '2021-04-05 03:32:47', '2021-04-05 03:32:47', NULL),
(5401, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:32:49', '2021-04-05 03:32:49', NULL),
(5402, 'Viewed dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:32:54', '2021-04-05 03:32:54', NULL),
(5403, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', 'POST', '2021-04-05 03:32:58', '2021-04-05 03:32:58', NULL),
(5404, 'Viewed dashboard/course/edit/11/the-complete-skills-course-2020', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-skills-course-2020', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:32:58', '2021-04-05 03:32:58', NULL),
(5405, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-skills-course-2020', 'POST', '2021-04-05 03:33:00', '2021-04-05 03:33:00', NULL),
(5406, 'Created dashboard/course/update', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/update', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', 'POST', '2021-04-05 03:33:07', '2021-04-05 03:33:07', NULL),
(5407, 'Viewed dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:33:08', '2021-04-05 03:33:08', NULL),
(5408, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', 'POST', '2021-04-05 03:33:10', '2021-04-05 03:33:10', NULL),
(5409, 'Created dashboard/course/update', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/update', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-skills-course-2020', 'POST', '2021-04-05 03:33:14', '2021-04-05 03:33:14', NULL),
(5410, 'Viewed dashboard/course/edit/11/the-complete-skills-course-2020', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-skills-course-2020', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-skills-course-2020', 'GET', '2021-04-05 03:33:15', '2021-04-05 03:33:15', NULL),
(5411, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/11/the-complete-skills-course-2020', 'POST', '2021-04-05 03:33:18', '2021-04-05 03:33:18', NULL),
(5412, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 03:33:28', '2021-04-05 03:33:28', NULL),
(5413, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 03:34:21', '2021-04-05 03:34:21', NULL),
(5414, 'Viewed course/personal-development-course', 'Guest', NULL, 'http://thehappyindianstore.com/course/personal-development-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 03:34:28', '2021-04-05 03:34:28', NULL),
(5415, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 03:34:46', '2021-04-05 03:34:46', NULL),
(5416, 'Viewed course/increase-your-personal-skills-and-join-our-course', 'Guest', NULL, 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 03:34:52', '2021-04-05 03:34:52', NULL),
(5417, 'Viewed course/the-complete-skills-course-2020', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-skills-course-2020', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 03:35:19', '2021-04-05 03:35:19', NULL),
(5418, 'Viewed course/the-complete-skills-course-2020', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-skills-course-2020', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 03:35:21', '2021-04-05 03:35:21', NULL),
(5419, 'Viewed dashboard/course/edit/1/wordpress-for-beginner', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/1/wordpress-for-beginner', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'GET', '2021-04-05 03:35:37', '2021-04-05 03:35:37', NULL),
(5420, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/1/wordpress-for-beginner', 'POST', '2021-04-05 03:35:39', '2021-04-05 03:35:39', NULL),
(5421, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:37:15', '2021-04-05 03:37:15', NULL),
(5422, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', 'POST', '2021-04-05 03:37:25', '2021-04-05 03:37:25', NULL),
(5423, 'Created dashboard/course/update', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/update', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', 'POST', '2021-04-05 03:37:58', '2021-04-05 03:37:58', NULL),
(5424, 'Viewed dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:37:59', '2021-04-05 03:37:59', NULL),
(5425, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', 'POST', '2021-04-05 03:38:03', '2021-04-05 03:38:03', NULL),
(5426, 'Viewed dashboard/course/index', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/course/index', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/1/wordpress-for-beginner', 'GET', '2021-04-05 03:38:07', '2021-04-05 03:38:07', NULL),
(5427, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/index', 'POST', '2021-04-05 03:38:09', '2021-04-05 03:38:09', NULL),
(5428, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/course/edit/20/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:38:14', '2021-04-05 03:38:14', NULL),
(5429, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-05 03:38:16', '2021-04-05 03:38:16', NULL),
(5430, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-05 03:38:17', '2021-04-05 03:38:17', NULL),
(5431, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-05 03:38:20', '2021-04-05 03:38:20', NULL),
(5432, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-05 03:38:21', '2021-04-05 03:38:21', NULL),
(5433, 'Viewed dashboard/home', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/home', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-05 03:38:21', '2021-04-05 03:38:21', NULL),
(5434, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:38:22', '2021-04-05 03:38:22', NULL),
(5435, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://thehappyindianstore.com/dashboard/media/manager/slide', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-05 03:38:23', '2021-04-05 03:38:23', NULL),
(5436, 'Logged Out', 'Registered', 5, 'http://thehappyindianstore.com/logout', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'POST', '2021-04-05 03:38:24', '2021-04-05 03:38:24', NULL),
(5437, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/dashboard/home', 'GET', '2021-04-05 03:38:25', '2021-04-05 03:38:25', NULL),
(5438, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 03:41:49', '2021-04-05 03:41:49', NULL),
(5439, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:42:44', '2021-04-05 03:42:44', NULL),
(5440, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:42:48', '2021-04-05 03:42:48', NULL),
(5441, 'Viewed course/personal-development-course', 'Guest', NULL, 'http://thehappyindianstore.com/course/personal-development-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 03:43:24', '2021-04-05 03:43:24', NULL),
(5442, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-05 03:44:51', '2021-04-05 03:44:51', NULL),
(5443, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:46:26', '2021-04-05 03:46:26', NULL),
(5444, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 03:52:11', '2021-04-05 03:52:11', NULL),
(5445, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 03:52:18', '2021-04-05 03:52:18', NULL),
(5446, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:53:08', '2021-04-05 03:53:08', NULL),
(5447, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:55:32', '2021-04-05 03:55:32', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5448, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 03:56:35', '2021-04-05 03:56:35', NULL),
(5449, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 03:57:12', '2021-04-05 03:57:12', NULL),
(5450, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.12.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 03:57:24', '2021-04-05 03:57:24', NULL),
(5451, 'Viewed /', 'Registered', 24, 'http://thehappyindianstore.com', '157.39.56.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 03:58:58', '2021-04-05 03:58:58', NULL),
(5452, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 03:58:58', '2021-04-05 03:58:58', NULL),
(5453, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/instructor/register', 'GET', '2021-04-05 03:59:08', '2021-04-05 03:59:08', NULL),
(5454, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 05:29:17', '2021-04-05 05:29:17', NULL),
(5455, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 05:32:19', '2021-04-05 05:32:19', NULL),
(5456, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 05:33:02', '2021-04-05 05:33:02', NULL),
(5457, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 05:34:14', '2021-04-05 05:34:14', NULL),
(5458, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 06:11:16', '2021-04-05 06:11:16', NULL),
(5459, 'Viewed course/personal-development-course', 'Guest', NULL, 'http://thehappyindianstore.com/course/personal-development-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 06:11:33', '2021-04-05 06:11:33', NULL),
(5460, 'Viewed course/increase-your-personal-skills-and-join-our-course', 'Guest', NULL, 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 06:12:03', '2021-04-05 06:12:03', NULL),
(5461, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/course/increase-your-personal-skills-and-join-our-course', 'GET', '2021-04-05 06:13:05', '2021-04-05 06:13:05', NULL),
(5462, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 06:13:16', '2021-04-05 06:13:16', NULL),
(5463, 'Viewed course/the-complete-skills-course-2020', 'Guest', NULL, 'http://thehappyindianstore.com/course/the-complete-skills-course-2020', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 06:13:42', '2021-04-05 06:13:42', NULL),
(5464, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-05 06:14:12', '2021-04-05 06:14:12', NULL),
(5465, 'Crawler crawled http://thehappyindianstore.com', 'Crawler', NULL, 'http://thehappyindianstore.com', '223.225.160.111', 'WhatsApp/2.21.50.15 i', 'en-us', NULL, 'GET', '2021-04-05 06:17:10', '2021-04-05 06:17:10', NULL),
(5466, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 06:18:57', '2021-04-05 06:18:57', NULL),
(5467, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '106.196.82.6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', 'en-gb', NULL, 'GET', '2021-04-05 06:19:24', '2021-04-05 06:19:24', NULL),
(5468, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '106.196.82.6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', 'en-gb', NULL, 'GET', '2021-04-05 06:21:24', '2021-04-05 06:21:24', NULL),
(5469, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '223.225.160.111', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Mobile/15E148 Safari/604.1', 'en-us', NULL, 'GET', '2021-04-05 06:21:57', '2021-04-05 06:21:57', NULL),
(5470, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '42.109.244.157', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'en-US,en;q=0.5', NULL, 'GET', '2021-04-05 06:23:06', '2021-04-05 06:23:06', NULL),
(5471, 'Viewed instructor/register', 'Guest', NULL, 'http://thehappyindianstore.com/instructor/register', '42.109.244.157', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'en-US,en;q=0.5', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 06:25:09', '2021-04-05 06:25:09', NULL),
(5472, 'Viewed signup', 'Guest', NULL, 'http://thehappyindianstore.com/signup', '42.109.244.157', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'en-US,en;q=0.5', 'http://thehappyindianstore.com/instructor/register', 'GET', '2021-04-05 06:25:22', '2021-04-05 06:25:22', NULL),
(5473, 'Viewed courses', 'Guest', NULL, 'http://thehappyindianstore.com/courses', '42.109.244.157', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'en-US,en;q=0.5', 'http://thehappyindianstore.com/signup', 'GET', '2021-04-05 06:25:28', '2021-04-05 06:25:28', NULL),
(5474, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '42.109.244.157', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'en-US,en;q=0.5', NULL, 'GET', '2021-04-05 06:26:04', '2021-04-05 06:26:04', NULL),
(5475, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '42.109.244.157', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'en-US,en;q=0.5', NULL, 'GET', '2021-04-05 06:27:21', '2021-04-05 06:27:21', NULL),
(5476, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/login', 'GET', '2021-04-05 06:32:12', '2021-04-05 06:32:12', NULL),
(5477, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.231.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 06:36:35', '2021-04-05 06:36:35', NULL),
(5478, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '34.215.18.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko; compatible; BW/1.1; bit.ly/2W6Px8S) Chrome/84.0.4147.105 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 13:02:10', '2021-04-05 13:02:10', NULL),
(5479, 'Viewed /', 'Guest', NULL, 'http://www.thehappyindianstore.com', '34.215.18.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko; compatible; BW/1.1; bit.ly/2W6Px8S) Chrome/84.0.4147.105 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 13:02:11', '2021-04-05 13:02:11', NULL),
(5480, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '157.39.44.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 Edg/89.0.774.68', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 15:20:13', '2021-04-05 15:20:13', NULL),
(5481, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '157.39.44.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 Edg/89.0.774.68', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 15:28:40', '2021-04-05 15:28:40', NULL),
(5482, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '223.225.169.236', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Mobile/15E148 Safari/604.1', 'en-us', NULL, 'GET', '2021-04-05 15:41:43', '2021-04-05 15:41:43', NULL),
(5483, 'Viewed course/personal-development-course', 'Guest', NULL, 'http://languafina.com/course/personal-development-course', '223.225.169.236', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Mobile/15E148 Safari/604.1', 'en-us', 'http://languafina.com/', 'GET', '2021-04-05 15:42:03', '2021-04-05 15:42:03', NULL),
(5484, 'Crawler crawled http://languafina.com', 'Crawler', NULL, 'http://languafina.com', '223.225.169.236', 'WhatsApp/2.21.50.15 i', 'en-us', NULL, 'GET', '2021-04-05 15:44:00', '2021-04-05 15:44:00', NULL),
(5485, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '223.225.169.236', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Mobile/15E148 Safari/604.1', 'en-us', NULL, 'GET', '2021-04-05 15:44:42', '2021-04-05 15:44:42', NULL),
(5486, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '42.109.224.115', 'Mozilla/5.0 (Linux; Android 8.1.0; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', NULL, 'GET', '2021-04-05 15:44:45', '2021-04-05 15:44:45', NULL),
(5487, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 16:14:25', '2021-04-05 16:14:25', NULL),
(5488, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 16:15:48', '2021-04-05 16:15:48', NULL),
(5489, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-05 16:17:16', '2021-04-05 16:17:16', NULL),
(5490, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 16:17:17', '2021-04-05 16:17:17', NULL),
(5491, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:17:24', '2021-04-05 16:17:24', NULL),
(5492, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/certificate/setup', 'POST', '2021-04-05 16:17:42', '2021-04-05 16:17:42', NULL),
(5493, 'Viewed dashboard/affiliate/setting', 'Registered', 24, 'http://languafina.com/dashboard/affiliate/setting', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/certificate/setup', 'GET', '2021-04-05 16:17:58', '2021-04-05 16:17:58', NULL),
(5494, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/affiliate/setting', 'POST', '2021-04-05 16:18:00', '2021-04-05 16:18:00', NULL),
(5495, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://languafina.com/dashboard/site/setting', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/affiliate/setting', 'GET', '2021-04-05 16:18:04', '2021-04-05 16:18:04', NULL),
(5496, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/site/setting', 'POST', '2021-04-05 16:18:06', '2021-04-05 16:18:06', NULL),
(5497, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://languafina.com/dashboard/pages/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/site/setting', 'GET', '2021-04-05 16:18:21', '2021-04-05 16:18:21', NULL),
(5498, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/pages/index', 'POST', '2021-04-05 16:18:23', '2021-04-05 16:18:23', NULL),
(5499, 'Viewed dashboard/slider/index', 'Registered', 24, 'http://languafina.com/dashboard/slider/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/pages/index', 'GET', '2021-04-05 16:18:25', '2021-04-05 16:18:25', NULL),
(5500, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/slider/index', 'POST', '2021-04-05 16:18:27', '2021-04-05 16:18:27', NULL),
(5501, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://languafina.com/dashboard/pages/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/slider/index', 'GET', '2021-04-05 16:18:30', '2021-04-05 16:18:30', NULL),
(5502, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/pages/index', 'POST', '2021-04-05 16:18:31', '2021-04-05 16:18:31', NULL),
(5503, 'Viewed dashboard/pages/create', 'Registered', 24, 'http://languafina.com/dashboard/pages/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/pages/index', 'GET', '2021-04-05 16:18:32', '2021-04-05 16:18:32', NULL),
(5504, 'Viewed dashboard/slider/index', 'Registered', 24, 'http://languafina.com/dashboard/slider/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/pages/index', 'GET', '2021-04-05 16:18:39', '2021-04-05 16:18:39', NULL),
(5505, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/slider/index', 'POST', '2021-04-05 16:18:41', '2021-04-05 16:18:41', NULL),
(5506, 'Viewed dashboard/smtp/create', 'Registered', 24, 'http://languafina.com/dashboard/smtp/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/slider/index', 'GET', '2021-04-05 16:18:41', '2021-04-05 16:18:41', NULL),
(5507, 'Viewed dashboard/smtp/create', 'Registered', 24, 'http://languafina.com/dashboard/smtp/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/smtp/create', 'GET', '2021-04-05 16:18:44', '2021-04-05 16:18:44', NULL),
(5508, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/smtp/create', 'POST', '2021-04-05 16:18:46', '2021-04-05 16:18:46', NULL),
(5509, 'Viewed dashboard/language/index', 'Registered', 24, 'http://languafina.com/dashboard/language/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/smtp/create', 'GET', '2021-04-05 16:18:54', '2021-04-05 16:18:54', NULL),
(5510, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/language/index', 'POST', '2021-04-05 16:18:57', '2021-04-05 16:18:57', NULL),
(5511, 'Viewed dashboard/currency/index', 'Registered', 24, 'http://languafina.com/dashboard/currency/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/language/index', 'GET', '2021-04-05 16:18:58', '2021-04-05 16:18:58', NULL),
(5512, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/currency/index', 'POST', '2021-04-05 16:19:02', '2021-04-05 16:19:02', NULL),
(5513, 'Viewed dashboard/app/setting', 'Registered', 24, 'http://languafina.com/dashboard/app/setting', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/currency/index', 'GET', '2021-04-05 16:19:04', '2021-04-05 16:19:04', NULL),
(5514, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/app/setting', 'POST', '2021-04-05 16:19:06', '2021-04-05 16:19:06', NULL),
(5515, 'Viewed dashboard/affiliate/index', 'Registered', 24, 'http://languafina.com/dashboard/affiliate/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/app/setting', 'GET', '2021-04-05 16:19:14', '2021-04-05 16:19:14', NULL),
(5516, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/affiliate/index', 'POST', '2021-04-05 16:19:17', '2021-04-05 16:19:17', NULL),
(5517, 'Viewed dashboard/affiliate/payment/request', 'Registered', 24, 'http://languafina.com/dashboard/affiliate/payment/request', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/affiliate/index', 'GET', '2021-04-05 16:19:21', '2021-04-05 16:19:21', NULL),
(5518, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/affiliate/payment/request', 'POST', '2021-04-05 16:19:23', '2021-04-05 16:19:23', NULL),
(5519, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/affiliate/payment/request', 'GET', '2021-04-05 16:19:29', '2021-04-05 16:19:29', NULL),
(5520, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:19:33', '2021-04-05 16:19:33', NULL),
(5521, 'Viewed /', 'Registered', 24, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:20:09', '2021-04-05 16:20:09', NULL),
(5522, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:20:20', '2021-04-05 16:20:20', NULL),
(5523, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:20:22', '2021-04-05 16:20:22', NULL),
(5524, 'Viewed /', 'Registered', 24, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:20:24', '2021-04-05 16:20:24', NULL),
(5525, 'Viewed /', 'Registered', 24, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:22:23', '2021-04-05 16:22:23', NULL),
(5526, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:22:23', '2021-04-05 16:22:23', NULL),
(5527, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://thehappyindianstore.com/', 'GET', '2021-04-05 16:22:32', '2021-04-05 16:22:32', NULL),
(5528, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:22:33', '2021-04-05 16:22:33', NULL),
(5529, 'Viewed dashboard/addon/manager', 'Registered', 24, 'http://languafina.com/dashboard/addon/manager', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-05 16:22:40', '2021-04-05 16:22:40', NULL),
(5530, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/addon/manager', 'POST', '2021-04-05 16:22:43', '2021-04-05 16:22:43', NULL),
(5531, 'Viewed dashboard/addon/index/page', 'Registered', 24, 'http://languafina.com/dashboard/addon/index/page?_token=w0G3spJgQ6oOzTJZ7CTIW83UjsuSLeIJxovbFLCZ', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/addon/manager', 'GET', '2021-04-05 16:22:43', '2021-04-05 16:22:43', NULL),
(5532, 'Viewed dashboard/addon/manager', 'Registered', 24, 'http://languafina.com/dashboard/addon/manager', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 16:22:55', '2021-04-05 16:22:55', NULL),
(5533, 'Viewed dashboard/addon/index/page', 'Registered', 24, 'http://languafina.com/dashboard/addon/index/page?_token=w0G3spJgQ6oOzTJZ7CTIW83UjsuSLeIJxovbFLCZ', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/addon/manager', 'GET', '2021-04-05 16:22:57', '2021-04-05 16:22:57', NULL),
(5534, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/addon/manager', 'POST', '2021-04-05 16:22:57', '2021-04-05 16:22:57', NULL),
(5535, 'Viewed dashboard/user/show/24', 'Registered', 24, 'http://languafina.com/dashboard/user/show/24', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/addon/manager', 'GET', '2021-04-05 16:23:06', '2021-04-05 16:23:06', NULL),
(5536, 'Viewed dashboard/user/show/24', 'Registered', 24, 'http://languafina.com/dashboard/user/show/24', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/addon/manager', 'GET', '2021-04-05 16:23:11', '2021-04-05 16:23:11', NULL),
(5537, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/show/24', 'POST', '2021-04-05 16:23:13', '2021-04-05 16:23:13', NULL),
(5538, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/show/24', 'POST', '2021-04-05 16:23:17', '2021-04-05 16:23:17', NULL),
(5539, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/show/24', 'GET', '2021-04-05 16:23:18', '2021-04-05 16:23:18', NULL),
(5540, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-05 16:23:28', '2021-04-05 16:23:28', NULL),
(5541, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 16:23:29', '2021-04-05 16:23:29', NULL),
(5542, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:23:31', '2021-04-05 16:23:31', NULL),
(5543, 'Viewed dashboard/user/show/24', 'Registered', 24, 'http://languafina.com/dashboard/user/show/24', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:23:55', '2021-04-05 16:23:55', NULL),
(5544, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/show/24', 'POST', '2021-04-05 16:23:57', '2021-04-05 16:23:57', NULL),
(5545, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/show/24', 'GET', '2021-04-05 16:24:05', '2021-04-05 16:24:05', NULL),
(5546, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:24:07', '2021-04-05 16:24:07', NULL),
(5547, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:24:14', '2021-04-05 16:24:14', NULL),
(5548, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-05 16:24:17', '2021-04-05 16:24:17', NULL),
(5549, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-05 16:24:18', '2021-04-05 16:24:18', NULL),
(5550, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-05 16:24:20', '2021-04-05 16:24:20', NULL),
(5551, 'Viewed dashboard/student/index', 'Registered', 24, 'http://languafina.com/dashboard/student/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 16:24:23', '2021-04-05 16:24:23', NULL),
(5552, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-05 16:24:25', '2021-04-05 16:24:25', NULL),
(5553, 'Viewed dashboard/media/manager', 'Registered', 24, 'http://languafina.com/dashboard/media/manager', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-05 16:24:28', '2021-04-05 16:24:28', NULL),
(5554, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-05 16:24:31', '2021-04-05 16:24:31', NULL),
(5555, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:24:36', '2021-04-05 16:24:36', NULL),
(5556, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:24:36', '2021-04-05 16:24:36', NULL),
(5557, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:24:39', '2021-04-05 16:24:39', NULL),
(5558, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:24:46', '2021-04-05 16:24:46', NULL),
(5559, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:24:47', '2021-04-05 16:24:47', NULL),
(5560, 'Logged In', 'Registered', 5, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-05 16:25:54', '2021-04-05 16:25:54', NULL),
(5561, 'Viewed dashboard/home', 'Registered', 5, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 16:25:55', '2021-04-05 16:25:55', NULL),
(5562, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:25:56', '2021-04-05 16:25:56', NULL),
(5563, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/zoom/setting', 'POST', '2021-04-05 16:26:26', '2021-04-05 16:26:26', NULL),
(5564, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/zoom/setting', 'POST', '2021-04-05 16:26:31', '2021-04-05 16:26:31', NULL),
(5565, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/zoom/create/meeting', 'POST', '2021-04-05 16:26:36', '2021-04-05 16:26:36', NULL),
(5566, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/quiz/create', 'POST', '2021-04-05 16:26:43', '2021-04-05 16:26:43', NULL),
(5567, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/quiz/list', 'POST', '2021-04-05 16:26:47', '2021-04-05 16:26:47', NULL),
(5568, 'Viewed dashboard/student/index', 'Registered', 5, 'http://languafina.com/dashboard/student/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/quiz/list', 'GET', '2021-04-05 16:26:49', '2021-04-05 16:26:49', NULL),
(5569, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-05 16:26:51', '2021-04-05 16:26:51', NULL),
(5570, 'Viewed dashboard/comments/index', 'Registered', 5, 'http://languafina.com/dashboard/comments/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-05 16:26:52', '2021-04-05 16:26:52', NULL),
(5571, 'Viewed dashboard/comments/index', 'Registered', 5, 'http://languafina.com/dashboard/comments/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-05 16:26:55', '2021-04-05 16:26:55', NULL),
(5572, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/comments/index', 'POST', '2021-04-05 16:26:57', '2021-04-05 16:26:57', NULL),
(5573, 'Viewed dashboard/account/setup', 'Registered', 5, 'http://languafina.com/dashboard/account/setup', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/comments/index', 'GET', '2021-04-05 16:26:59', '2021-04-05 16:26:59', NULL),
(5574, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/account/setup', 'POST', '2021-04-05 16:27:00', '2021-04-05 16:27:00', NULL),
(5575, 'Logged Out', 'Registered', 5, 'http://languafina.com/logout', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/account/setup', 'POST', '2021-04-05 16:31:58', '2021-04-05 16:31:58', NULL),
(5576, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/account/setup', 'GET', '2021-04-05 16:31:59', '2021-04-05 16:31:59', NULL),
(5577, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-05 16:32:12', '2021-04-05 16:32:12', NULL),
(5578, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-05 16:32:57', '2021-04-05 16:32:57', NULL),
(5579, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'GET', '2021-04-05 16:32:58', '2021-04-05 16:32:58', NULL),
(5580, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-05 16:34:11', '2021-04-05 16:34:11', NULL),
(5581, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'GET', '2021-04-05 16:34:11', '2021-04-05 16:34:11', NULL),
(5582, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-05 16:34:36', '2021-04-05 16:34:36', NULL),
(5583, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'GET', '2021-04-05 16:34:37', '2021-04-05 16:34:37', NULL),
(5584, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-05 16:35:23', '2021-04-05 16:35:23', NULL),
(5585, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'GET', '2021-04-05 16:35:23', '2021-04-05 16:35:23', NULL),
(5586, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-05 16:35:41', '2021-04-05 16:35:41', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5587, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'GET', '2021-04-05 16:35:42', '2021-04-05 16:35:42', NULL),
(5588, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 16:35:58', '2021-04-05 16:35:58', NULL),
(5589, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-05 16:36:12', '2021-04-05 16:36:12', NULL),
(5590, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 16:36:13', '2021-04-05 16:36:13', NULL),
(5591, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:36:21', '2021-04-05 16:36:21', NULL),
(5592, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:36:35', '2021-04-05 16:36:35', NULL),
(5593, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-05 16:36:37', '2021-04-05 16:36:37', NULL),
(5594, 'Viewed dashboard/instructor/show/21', 'Registered', 24, 'http://languafina.com/dashboard/instructor/show/21', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 16:37:03', '2021-04-05 16:37:03', NULL),
(5595, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/21', 'POST', '2021-04-05 16:37:08', '2021-04-05 16:37:08', NULL),
(5596, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/21', 'GET', '2021-04-05 16:37:18', '2021-04-05 16:37:18', NULL),
(5597, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/21', 'GET', '2021-04-05 16:37:18', '2021-04-05 16:37:18', NULL),
(5598, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/21', 'GET', '2021-04-05 16:37:19', '2021-04-05 16:37:19', NULL),
(5599, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-05 16:37:20', '2021-04-05 16:37:20', NULL),
(5600, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 16:37:21', '2021-04-05 16:37:21', NULL),
(5601, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-05 16:37:23', '2021-04-05 16:37:23', NULL),
(5602, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-05 16:37:24', '2021-04-05 16:37:24', NULL),
(5603, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-05 16:37:26', '2021-04-05 16:37:26', NULL),
(5604, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 16:37:27', '2021-04-05 16:37:27', NULL),
(5605, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 16:37:29', '2021-04-05 16:37:29', NULL),
(5606, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-05 16:37:30', '2021-04-05 16:37:30', NULL),
(5607, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-05 16:37:33', '2021-04-05 16:37:33', NULL),
(5608, 'Viewed dashboard/user/destroy/18', 'Registered', 24, 'http://languafina.com/dashboard/user/destroy/18', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-05 16:37:42', '2021-04-05 16:37:42', NULL),
(5609, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-05 16:37:43', '2021-04-05 16:37:43', NULL),
(5610, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-05 16:37:44', '2021-04-05 16:37:44', NULL),
(5611, 'Viewed dashboard/student/index', 'Registered', 24, 'http://languafina.com/dashboard/student/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-05 16:37:49', '2021-04-05 16:37:49', NULL),
(5612, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-05 16:37:50', '2021-04-05 16:37:50', NULL),
(5613, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-05 16:38:00', '2021-04-05 16:38:00', NULL),
(5614, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:38:02', '2021-04-05 16:38:02', NULL),
(5615, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:38:04', '2021-04-05 16:38:04', NULL),
(5616, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:38:05', '2021-04-05 16:38:05', NULL),
(5617, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-05 16:38:09', '2021-04-05 16:38:09', NULL),
(5618, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-05 16:41:44', '2021-04-05 16:41:44', NULL),
(5619, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-05 16:42:08', '2021-04-05 16:42:08', NULL),
(5620, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 16:42:09', '2021-04-05 16:42:09', NULL),
(5621, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:42:11', '2021-04-05 16:42:11', NULL),
(5622, 'Viewed dashboard/course/index', 'Registered', 24, 'http://languafina.com/dashboard/course/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 16:42:23', '2021-04-05 16:42:23', NULL),
(5623, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-05 16:42:25', '2021-04-05 16:42:25', NULL),
(5624, 'Viewed dashboard/course/index/26/what-is-articles', 'Registered', 24, 'http://languafina.com/dashboard/course/index/26/what-is-articles', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 16:42:42', '2021-04-05 16:42:42', NULL),
(5625, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/26/what-is-articles', 'POST', '2021-04-05 16:42:46', '2021-04-05 16:42:46', NULL),
(5626, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/26/what-is-articles', 'GET', '2021-04-05 16:43:07', '2021-04-05 16:43:07', NULL),
(5627, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 16:43:09', '2021-04-05 16:43:09', NULL),
(5628, 'Viewed /', 'Registered', 24, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 16:45:28', '2021-04-05 16:45:28', NULL),
(5629, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'POST', '2021-04-05 16:45:35', '2021-04-05 16:45:35', NULL),
(5630, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-05 16:45:35', '2021-04-05 16:45:35', NULL),
(5631, 'Viewed course/personal-development-course', 'Guest', NULL, 'http://languafina.com/course/personal-development-course', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-05 16:45:41', '2021-04-05 16:45:41', NULL),
(5632, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 16:45:55', '2021-04-05 16:45:55', NULL),
(5633, 'Viewed course/the-complete-skills-course-2020', 'Guest', NULL, 'http://languafina.com/course/the-complete-skills-course-2020', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-05 16:46:02', '2021-04-05 16:46:02', NULL),
(5634, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 17:34:07', '2021-04-05 17:34:07', NULL),
(5635, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-05 17:34:42', '2021-04-05 17:34:42', NULL),
(5636, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-05 17:37:09', '2021-04-05 17:37:09', NULL),
(5637, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'GET', '2021-04-05 17:37:09', '2021-04-05 17:37:09', NULL),
(5638, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-05 17:37:46', '2021-04-05 17:37:46', NULL),
(5639, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'GET', '2021-04-05 17:37:47', '2021-04-05 17:37:47', NULL),
(5640, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-05 17:38:02', '2021-04-05 17:38:02', NULL),
(5641, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'GET', '2021-04-05 17:38:02', '2021-04-05 17:38:02', NULL),
(5642, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-05 17:38:16', '2021-04-05 17:38:16', NULL),
(5643, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 17:38:17', '2021-04-05 17:38:17', NULL),
(5644, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 17:38:24', '2021-04-05 17:38:24', NULL),
(5645, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/certificate/setup', 'POST', '2021-04-05 17:38:46', '2021-04-05 17:38:46', NULL),
(5646, 'Viewed dashboard/media/manager', 'Registered', 24, 'http://languafina.com/dashboard/media/manager', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/certificate/setup', 'GET', '2021-04-05 17:38:50', '2021-04-05 17:38:50', NULL),
(5647, 'Created dashboard/media/index', 'Registered', 24, 'http://languafina.com/dashboard/media/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/media/manager', 'POST', '2021-04-05 17:38:53', '2021-04-05 17:38:53', NULL),
(5648, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/media/manager', 'POST', '2021-04-05 17:38:53', '2021-04-05 17:38:53', NULL),
(5649, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/media/manager', 'GET', '2021-04-05 17:39:03', '2021-04-05 17:39:03', NULL),
(5650, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-05 17:39:05', '2021-04-05 17:39:05', NULL),
(5651, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-05 17:39:06', '2021-04-05 17:39:06', NULL),
(5652, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 17:39:08', '2021-04-05 17:39:08', NULL),
(5653, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 17:39:10', '2021-04-05 17:39:10', NULL),
(5654, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/certificate/setup', 'POST', '2021-04-05 17:39:17', '2021-04-05 17:39:17', NULL),
(5655, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/certificate/setup', 'POST', '2021-04-05 17:39:28', '2021-04-05 17:39:28', NULL),
(5656, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/certificate/setup', 'POST', '2021-04-05 17:39:58', '2021-04-05 17:39:58', NULL),
(5657, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/certificate/setup', 'POST', '2021-04-05 17:40:08', '2021-04-05 17:40:08', NULL),
(5658, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'en-US,en;q=0.5', NULL, 'GET', '2021-04-05 17:51:45', '2021-04-05 17:51:45', NULL),
(5659, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'en-US,en;q=0.5', NULL, 'GET', '2021-04-05 17:51:47', '2021-04-05 17:51:47', NULL),
(5660, 'Viewed courses/personal-transformation4', 'Guest', NULL, 'http://languafina.com/courses/personal-transformation4', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'en-US,en;q=0.5', 'http://languafina.com/', 'GET', '2021-04-05 17:52:22', '2021-04-05 17:52:22', NULL),
(5661, 'Viewed course/the-complete-skills-course-2020', 'Guest', NULL, 'http://languafina.com/course/the-complete-skills-course-2020', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'en-US,en;q=0.5', 'http://languafina.com/courses/personal-transformation4', 'GET', '2021-04-05 17:52:39', '2021-04-05 17:52:39', NULL),
(5662, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 17:56:11', '2021-04-05 17:56:11', NULL),
(5663, 'Viewed /', 'Guest', NULL, 'http://www.languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', NULL, 'GET', '2021-04-05 17:56:32', '2021-04-05 17:56:32', NULL),
(5664, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-05 18:01:23', '2021-04-05 18:01:23', NULL),
(5665, 'Viewed signup', 'Guest', NULL, 'http://languafina.com/signup', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-05 18:01:44', '2021-04-05 18:01:44', NULL),
(5666, 'Viewed courses', 'Guest', NULL, 'http://languafina.com/courses', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-05 18:01:59', '2021-04-05 18:01:59', NULL),
(5667, 'Viewed instructor/register', 'Guest', NULL, 'http://www.languafina.com/instructor/register', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/', 'GET', '2021-04-05 18:02:31', '2021-04-05 18:02:31', NULL),
(5668, 'Viewed signup', 'Guest', NULL, 'http://www.languafina.com/signup', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/instructor/register', 'GET', '2021-04-05 18:02:51', '2021-04-05 18:02:51', NULL),
(5669, 'Viewed /', 'Guest', NULL, 'http://www.languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/login', 'GET', '2021-04-05 18:03:29', '2021-04-05 18:03:29', NULL),
(5670, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-05 18:07:40', '2021-04-05 18:07:40', NULL),
(5671, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/certificate/setup', 'GET', '2021-04-05 18:10:08', '2021-04-05 18:10:08', NULL),
(5672, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 18:10:16', '2021-04-05 18:10:16', NULL),
(5673, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 18:10:19', '2021-04-05 18:10:19', NULL),
(5674, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 18:10:24', '2021-04-05 18:10:24', NULL),
(5675, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-05 18:10:54', '2021-04-05 18:10:54', NULL),
(5676, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 18:10:55', '2021-04-05 18:10:55', NULL),
(5677, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 18:10:56', '2021-04-05 18:10:56', NULL),
(5678, 'Viewed dashboard/course/index', 'Registered', 24, 'http://languafina.com/dashboard/course/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 18:10:59', '2021-04-05 18:10:59', NULL),
(5679, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-05 18:11:06', '2021-04-05 18:11:06', NULL),
(5680, 'Viewed dashboard/course/index/25/the-complete-communication-skills-master-class-for-life', 'Registered', 24, 'http://languafina.com/dashboard/course/index/25/the-complete-communication-skills-master-class-for-life', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 18:11:19', '2021-04-05 18:11:19', NULL),
(5681, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/25/the-complete-communication-skills-master-class-for-life', 'POST', '2021-04-05 18:11:25', '2021-04-05 18:11:25', NULL),
(5682, 'Viewed dashboard/course/index/25/the-complete-communication-skills-master-class-for-life', 'Registered', 24, 'http://languafina.com/dashboard/course/index/25/the-complete-communication-skills-master-class-for-life', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 18:11:27', '2021-04-05 18:11:27', NULL),
(5683, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/25/the-complete-communication-skills-master-class-for-life', 'POST', '2021-04-05 18:11:33', '2021-04-05 18:11:33', NULL),
(5684, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-05 18:11:35', '2021-04-05 18:11:35', NULL),
(5685, 'Viewed dashboard/course/index/26/what-is-articles', 'Registered', 24, 'http://languafina.com/dashboard/course/index/26/what-is-articles', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 18:11:39', '2021-04-05 18:11:39', NULL),
(5686, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/26/what-is-articles', 'POST', '2021-04-05 18:11:43', '2021-04-05 18:11:43', NULL),
(5687, 'Viewed dashboard/course/index', 'Registered', 24, 'http://languafina.com/dashboard/course/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/26/what-is-articles', 'GET', '2021-04-05 18:11:48', '2021-04-05 18:11:48', NULL),
(5688, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-05 18:11:53', '2021-04-05 18:11:53', NULL),
(5689, 'Viewed dashboard/course/index/19/outcome-based-education-obe-and-academic-quality-assurance', 'Registered', 24, 'http://languafina.com/dashboard/course/index/19/outcome-based-education-obe-and-academic-quality-assurance', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 18:11:55', '2021-04-05 18:11:55', NULL),
(5690, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/19/outcome-based-education-obe-and-academic-quality-assurance', 'POST', '2021-04-05 18:12:00', '2021-04-05 18:12:00', NULL),
(5691, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/19/outcome-based-education-obe-and-academic-quality-assurance', 'POST', '2021-04-05 18:12:11', '2021-04-05 18:12:11', NULL),
(5692, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/19/outcome-based-education-obe-and-academic-quality-assurance', 'GET', '2021-04-05 18:12:12', '2021-04-05 18:12:12', NULL),
(5693, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-05 18:12:15', '2021-04-05 18:12:15', NULL),
(5694, 'Logged In', 'Registered', 5, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-05 18:12:25', '2021-04-05 18:12:25', NULL),
(5695, 'Viewed dashboard/home', 'Registered', 5, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 18:12:26', '2021-04-05 18:12:26', NULL),
(5696, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 18:12:30', '2021-04-05 18:12:30', NULL),
(5697, 'Viewed dashboard/course/index', 'Registered', 5, 'http://languafina.com/dashboard/course/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 18:12:36', '2021-04-05 18:12:36', NULL),
(5698, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-05 18:12:38', '2021-04-05 18:12:38', NULL),
(5699, 'Viewed dashboard/course/edit/5/learn-photography', 'Registered', 5, 'http://languafina.com/dashboard/course/edit/5/learn-photography', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 18:13:01', '2021-04-05 18:13:01', NULL),
(5700, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/edit/5/learn-photography', 'POST', '2021-04-05 18:13:03', '2021-04-05 18:13:03', NULL),
(5701, 'Created dashboard/course/update', 'Registered', 5, 'http://languafina.com/dashboard/course/update', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/edit/5/learn-photography', 'POST', '2021-04-05 18:13:31', '2021-04-05 18:13:31', NULL),
(5702, 'Viewed dashboard/course/edit/5/learn-photography', 'Registered', 5, 'http://languafina.com/dashboard/course/edit/5/learn-photography', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/edit/5/learn-photography', 'GET', '2021-04-05 18:13:31', '2021-04-05 18:13:31', NULL),
(5703, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/edit/5/learn-photography', 'POST', '2021-04-05 18:13:34', '2021-04-05 18:13:34', NULL),
(5704, 'Viewed courses', 'Guest', NULL, 'http://languafina.com/courses', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-05 18:13:35', '2021-04-05 18:13:35', NULL),
(5705, 'Viewed dashboard/course/index', 'Registered', 5, 'http://languafina.com/dashboard/course/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/edit/5/learn-photography', 'GET', '2021-04-05 18:13:38', '2021-04-05 18:13:38', NULL),
(5706, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-05 18:13:39', '2021-04-05 18:13:39', NULL),
(5707, 'Viewed dashboard/course/create', 'Registered', 5, 'http://languafina.com/dashboard/course/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 18:13:55', '2021-04-05 18:13:55', NULL),
(5708, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/create', 'POST', '2021-04-05 18:13:58', '2021-04-05 18:13:58', NULL),
(5709, 'Viewed courses', 'Guest', NULL, 'http://languafina.com/courses', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-05 18:14:42', '2021-04-05 18:14:42', NULL),
(5710, 'Viewed courses', 'Guest', NULL, 'http://languafina.com/courses', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-05 18:15:41', '2021-04-05 18:15:41', NULL),
(5711, 'Viewed courses', 'Guest', NULL, 'http://languafina.com/courses', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-05 18:16:39', '2021-04-05 18:16:39', NULL),
(5712, 'Viewed dashboard/media/manager/create', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/create', 'GET', '2021-04-05 18:17:36', '2021-04-05 18:17:36', NULL),
(5713, 'Created dashboard/media/manager/store', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/store', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/create', 'POST', '2021-04-05 18:17:51', '2021-04-05 18:17:51', NULL),
(5714, 'Viewed dashboard/course/create', 'Registered', 5, 'http://languafina.com/dashboard/course/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/create', 'GET', '2021-04-05 18:17:52', '2021-04-05 18:17:52', NULL),
(5715, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/create', 'POST', '2021-04-05 18:17:55', '2021-04-05 18:17:55', NULL),
(5716, 'Created dashboard/course/store', 'Registered', 5, 'http://languafina.com/dashboard/course/store', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/create', 'POST', '2021-04-05 18:22:46', '2021-04-05 18:22:46', NULL),
(5717, 'Viewed dashboard/course/index/27/ielts-level-3', 'Registered', 5, 'http://languafina.com/dashboard/course/index/27/ielts-level-3', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/create', 'GET', '2021-04-05 18:22:47', '2021-04-05 18:22:47', NULL),
(5718, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'POST', '2021-04-05 18:22:50', '2021-04-05 18:22:50', NULL),
(5719, 'Viewed dashboard/class/content/create/27', 'Registered', 5, 'http://languafina.com/dashboard/class/content/create/27', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'GET', '2021-04-05 18:22:58', '2021-04-05 18:22:58', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5720, 'Viewed /', 'Registered', 5, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 18:26:00', '2021-04-05 18:26:00', NULL),
(5721, 'Viewed dashboard/home', 'Registered', 5, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-05 18:26:07', '2021-04-05 18:26:07', NULL),
(5722, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 18:26:10', '2021-04-05 18:26:10', NULL),
(5723, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 18:26:39', '2021-04-05 18:26:39', NULL),
(5724, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-05 18:27:16', '2021-04-05 18:27:16', NULL),
(5725, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'GET', '2021-04-05 18:27:17', '2021-04-05 18:27:17', NULL),
(5726, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 18:29:22', '2021-04-05 18:29:22', NULL),
(5727, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 18:39:21', '2021-04-05 18:39:21', NULL),
(5728, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 18:39:24', '2021-04-05 18:39:24', NULL),
(5729, 'Viewed dashboard/category/index', 'Registered', 24, 'http://languafina.com/dashboard/category/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 18:39:31', '2021-04-05 18:39:31', NULL),
(5730, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/category/index', 'POST', '2021-04-05 18:39:35', '2021-04-05 18:39:35', NULL),
(5731, 'Viewed dashboard/category/edit/1', 'Registered', 24, 'http://languafina.com/dashboard/category/edit/1', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/category/index', 'GET', '2021-04-05 18:39:41', '2021-04-05 18:39:41', NULL),
(5732, 'Created dashboard/category/update', 'Registered', 24, 'http://languafina.com/dashboard/category/update', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/category/index', 'POST', '2021-04-05 18:39:57', '2021-04-05 18:39:57', NULL),
(5733, 'Viewed dashboard/category/index', 'Registered', 24, 'http://languafina.com/dashboard/category/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/category/index', 'GET', '2021-04-05 18:39:58', '2021-04-05 18:39:58', NULL),
(5734, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/category/index', 'POST', '2021-04-05 18:40:00', '2021-04-05 18:40:00', NULL),
(5735, 'Viewed dashboard/category/destroy/8', 'Registered', 24, 'http://languafina.com/dashboard/category/destroy/8', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/category/index', 'GET', '2021-04-05 18:40:12', '2021-04-05 18:40:12', NULL),
(5736, 'Viewed dashboard/category/index', 'Registered', 24, 'http://languafina.com/dashboard/category/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/category/index', 'GET', '2021-04-05 18:40:13', '2021-04-05 18:40:13', NULL),
(5737, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/category/index', 'POST', '2021-04-05 18:40:15', '2021-04-05 18:40:15', NULL),
(5738, 'Viewed dashboard/course/index', 'Registered', 24, 'http://languafina.com/dashboard/course/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/category/index', 'GET', '2021-04-05 18:40:19', '2021-04-05 18:40:19', NULL),
(5739, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-05 18:40:21', '2021-04-05 18:40:21', NULL),
(5740, 'Viewed dashboard/class/create/27', 'Registered', 5, 'http://languafina.com/dashboard/class/create/27', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'GET', '2021-04-05 18:40:59', '2021-04-05 18:40:59', NULL),
(5741, 'Created dashboard/class/store', 'Registered', 5, 'http://languafina.com/dashboard/class/store', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'POST', '2021-04-05 18:41:06', '2021-04-05 18:41:06', NULL),
(5742, 'Viewed dashboard/course/index/27/ielts-level-3', 'Registered', 5, 'http://languafina.com/dashboard/course/index/27/ielts-level-3', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'GET', '2021-04-05 18:41:07', '2021-04-05 18:41:07', NULL),
(5743, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'POST', '2021-04-05 18:41:17', '2021-04-05 18:41:17', NULL),
(5744, 'Viewed dashboard/class/content/create/27', 'Registered', 5, 'http://languafina.com/dashboard/class/content/create/27', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'GET', '2021-04-05 18:42:49', '2021-04-05 18:42:49', NULL),
(5745, 'Created dashboard/class/content/store', 'Registered', 5, 'http://languafina.com/dashboard/class/content/store', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'POST', '2021-04-05 18:45:16', '2021-04-05 18:45:16', NULL),
(5746, 'Viewed dashboard/course/index/27/ielts-level-3', 'Registered', 5, 'http://languafina.com/dashboard/course/index/27/ielts-level-3', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'GET', '2021-04-05 18:45:24', '2021-04-05 18:45:24', NULL),
(5747, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'POST', '2021-04-05 18:45:27', '2021-04-05 18:45:27', NULL),
(5748, 'Viewed dashboard/content/preview', 'Registered', 5, 'http://languafina.com/dashboard/content/preview?id=51', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'GET', '2021-04-05 18:45:30', '2021-04-05 18:45:30', NULL),
(5749, 'Viewed dashboard/course/index', 'Registered', 5, 'http://languafina.com/dashboard/course/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'GET', '2021-04-05 18:45:42', '2021-04-05 18:45:42', NULL),
(5750, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-05 18:45:44', '2021-04-05 18:45:44', NULL),
(5751, 'Viewed dashboard/course/index/27/ielts-level-3', 'Registered', 5, 'http://languafina.com/dashboard/course/index/27/ielts-level-3', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 18:45:45', '2021-04-05 18:45:45', NULL),
(5752, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'POST', '2021-04-05 18:45:48', '2021-04-05 18:45:48', NULL),
(5753, 'Viewed dashboard/course/index', 'Registered', 5, 'http://languafina.com/dashboard/course/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/27/ielts-level-3', 'GET', '2021-04-05 18:45:48', '2021-04-05 18:45:48', NULL),
(5754, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-05 18:45:50', '2021-04-05 18:45:50', NULL),
(5755, 'Viewed dashboard/course/edit/27/ielts-level-3', 'Registered', 5, 'http://languafina.com/dashboard/course/edit/27/ielts-level-3', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 18:45:52', '2021-04-05 18:45:52', NULL),
(5756, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/edit/27/ielts-level-3', 'POST', '2021-04-05 18:45:54', '2021-04-05 18:45:54', NULL),
(5757, 'Created dashboard/course/update', 'Registered', 5, 'http://languafina.com/dashboard/course/update', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/edit/27/ielts-level-3', 'POST', '2021-04-05 18:46:22', '2021-04-05 18:46:22', NULL),
(5758, 'Viewed dashboard/course/edit/27/ielts-level-3', 'Registered', 5, 'http://languafina.com/dashboard/course/edit/27/ielts-level-3', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/edit/27/ielts-level-3', 'GET', '2021-04-05 18:46:24', '2021-04-05 18:46:24', NULL),
(5759, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/edit/27/ielts-level-3', 'POST', '2021-04-05 18:46:27', '2021-04-05 18:46:27', NULL),
(5760, 'Viewed dashboard/course/published', 'Registered', 24, 'http://languafina.com/dashboard/course/published?id=27', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 18:46:31', '2021-04-05 18:46:31', NULL),
(5761, 'Viewed dashboard/course/index', 'Registered', 5, 'http://languafina.com/dashboard/course/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/edit/27/ielts-level-3', 'GET', '2021-04-05 18:46:40', '2021-04-05 18:46:40', NULL),
(5762, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-05 18:46:43', '2021-04-05 18:46:43', NULL),
(5763, 'Viewed /', 'Registered', 5, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 18:46:46', '2021-04-05 18:46:46', NULL),
(5764, 'Viewed course/ielts-level-3', 'Registered', 5, 'http://languafina.com/course/ielts-level-3', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-05 18:46:56', '2021-04-05 18:46:56', NULL),
(5765, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 18:48:50', '2021-04-05 18:48:50', NULL),
(5766, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15', 'en-us', NULL, 'GET', '2021-04-05 18:48:56', '2021-04-05 18:48:56', NULL),
(5767, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-05 18:49:11', '2021-04-05 18:49:11', NULL),
(5768, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 18:49:27', '2021-04-05 18:49:27', NULL),
(5769, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-05 18:52:39', '2021-04-05 18:52:39', NULL),
(5770, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 18:52:40', '2021-04-05 18:52:40', NULL),
(5771, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'en-US,en;q=0.5', NULL, 'GET', '2021-04-05 18:53:46', '2021-04-05 18:53:46', NULL),
(5772, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 18:55:10', '2021-04-05 18:55:10', NULL),
(5773, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 18:57:11', '2021-04-05 18:57:11', NULL),
(5774, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 18:57:12', '2021-04-05 18:57:12', NULL),
(5775, 'Viewed course/ielts-level-3', 'Guest', NULL, 'http://languafina.com/course/ielts-level-3', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-05 18:57:57', '2021-04-05 18:57:57', NULL),
(5776, 'Viewed course/ielts-level-3', 'Guest', NULL, 'http://languafina.com/course/ielts-level-3', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-05 18:57:57', '2021-04-05 18:57:57', NULL),
(5777, 'Viewed course/ielts-level-3', 'Guest', NULL, 'http://languafina.com/course/ielts-level-3', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-05 18:58:35', '2021-04-05 18:58:35', NULL),
(5778, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/course/ielts-level-3', 'GET', '2021-04-05 19:02:04', '2021-04-05 19:02:04', NULL),
(5779, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 19:04:57', '2021-04-05 19:04:57', NULL),
(5780, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-05 19:10:56', '2021-04-05 19:10:56', NULL),
(5781, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-05 19:10:57', '2021-04-05 19:10:57', NULL),
(5782, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-05 19:10:59', '2021-04-05 19:10:59', NULL),
(5783, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-05 19:11:52', '2021-04-05 19:11:52', NULL),
(5784, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-05 19:11:55', '2021-04-05 19:11:55', NULL),
(5785, 'Viewed dashboard/user/create', 'Registered', 24, 'http://languafina.com/dashboard/user/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-05 19:12:01', '2021-04-05 19:12:01', NULL),
(5786, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/create', 'POST', '2021-04-05 19:12:33', '2021-04-05 19:12:33', NULL),
(5787, 'Created dashboard/user/store', 'Registered', 24, 'http://languafina.com/dashboard/user/store', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/create', 'POST', '2021-04-05 19:13:22', '2021-04-05 19:13:22', NULL),
(5788, 'Viewed dashboard/user/create', 'Registered', 24, 'http://languafina.com/dashboard/user/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/create', 'GET', '2021-04-05 19:13:26', '2021-04-05 19:13:26', NULL),
(5789, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/create', 'POST', '2021-04-05 19:13:27', '2021-04-05 19:13:27', NULL),
(5790, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/create', 'GET', '2021-04-05 19:13:31', '2021-04-05 19:13:31', NULL),
(5791, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/create', 'GET', '2021-04-05 19:13:33', '2021-04-05 19:13:33', NULL),
(5792, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-05 19:13:37', '2021-04-05 19:13:37', NULL),
(5793, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-05 19:13:59', '2021-04-05 19:13:59', NULL),
(5794, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-05 19:14:01', '2021-04-05 19:14:01', NULL),
(5795, 'Viewed dashboard/instructor/show/25', 'Registered', 24, 'http://languafina.com/dashboard/instructor/show/25', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 19:14:13', '2021-04-05 19:14:13', NULL),
(5796, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/25', 'POST', '2021-04-05 19:14:18', '2021-04-05 19:14:18', NULL),
(5797, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/25', 'GET', '2021-04-05 19:14:34', '2021-04-05 19:14:34', NULL),
(5798, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-05 19:14:36', '2021-04-05 19:14:36', NULL),
(5799, 'Viewed dashboard/instructor/show/21', 'Registered', 24, 'http://languafina.com/dashboard/instructor/show/21', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 19:14:40', '2021-04-05 19:14:40', NULL),
(5800, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/21', 'POST', '2021-04-05 19:14:42', '2021-04-05 19:14:42', NULL),
(5801, 'Created dashboard/users/banned', 'Registered', 24, 'http://languafina.com/dashboard/users/banned', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/21', 'POST', '2021-04-05 19:14:43', '2021-04-05 19:14:43', NULL),
(5802, 'Viewed dashboard/instructor/show/21', 'Registered', 24, 'http://languafina.com/dashboard/instructor/show/21', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/21', 'GET', '2021-04-05 19:14:44', '2021-04-05 19:14:44', NULL),
(5803, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/21', 'POST', '2021-04-05 19:14:47', '2021-04-05 19:14:47', NULL),
(5804, 'Created dashboard/users/banned', 'Registered', 24, 'http://languafina.com/dashboard/users/banned', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/21', 'POST', '2021-04-05 19:14:51', '2021-04-05 19:14:51', NULL),
(5805, 'Viewed dashboard/instructor/show/21', 'Registered', 24, 'http://languafina.com/dashboard/instructor/show/21', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/21', 'GET', '2021-04-05 19:14:52', '2021-04-05 19:14:52', NULL),
(5806, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/21', 'POST', '2021-04-05 19:14:55', '2021-04-05 19:14:55', NULL),
(5807, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/21', 'GET', '2021-04-05 19:14:59', '2021-04-05 19:14:59', NULL),
(5808, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-05 19:15:01', '2021-04-05 19:15:01', NULL),
(5809, 'Viewed dashboard/student/index', 'Registered', 24, 'http://languafina.com/dashboard/student/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 19:15:04', '2021-04-05 19:15:04', NULL),
(5810, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-05 19:15:07', '2021-04-05 19:15:07', NULL),
(5811, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-05 19:15:07', '2021-04-05 19:15:07', NULL),
(5812, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-05 19:15:09', '2021-04-05 19:15:09', NULL),
(5813, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index?search=amit', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 19:15:14', '2021-04-05 19:15:14', NULL),
(5814, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index?search=amit', 'POST', '2021-04-05 19:15:19', '2021-04-05 19:15:19', NULL),
(5815, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index?search=9888555806', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index?search=amit', 'GET', '2021-04-05 19:15:32', '2021-04-05 19:15:32', NULL),
(5816, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index?search=9888555806', 'GET', '2021-04-05 19:15:36', '2021-04-05 19:15:36', NULL),
(5817, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-05 19:15:43', '2021-04-05 19:15:43', NULL),
(5818, 'Viewed dashboard/student/index', 'Registered', 24, 'http://languafina.com/dashboard/student/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 19:16:11', '2021-04-05 19:16:11', NULL),
(5819, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-05 19:16:13', '2021-04-05 19:16:13', NULL),
(5820, 'Viewed dashboard/student/show/19', 'Registered', 24, 'http://languafina.com/dashboard/student/show/19', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-05 19:16:17', '2021-04-05 19:16:17', NULL),
(5821, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/show/19', 'POST', '2021-04-05 19:16:20', '2021-04-05 19:16:20', NULL),
(5822, 'Viewed dashboard/student/index', 'Registered', 24, 'http://languafina.com/dashboard/student/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/show/19', 'GET', '2021-04-05 19:16:27', '2021-04-05 19:16:27', NULL),
(5823, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-05 19:16:29', '2021-04-05 19:16:29', NULL),
(5824, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-05 19:16:29', '2021-04-05 19:16:29', NULL),
(5825, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-05 19:16:31', '2021-04-05 19:16:31', NULL),
(5826, 'Viewed dashboard/instructor/show/25', 'Registered', 24, 'http://languafina.com/dashboard/instructor/show/25', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 19:16:44', '2021-04-05 19:16:44', NULL),
(5827, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/25', 'POST', '2021-04-05 19:16:46', '2021-04-05 19:16:46', NULL),
(5828, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/25', 'GET', '2021-04-05 19:16:56', '2021-04-05 19:16:56', NULL),
(5829, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-05 19:16:58', '2021-04-05 19:16:58', NULL),
(5830, 'Viewed dashboard/instructor/show/25', 'Registered', 24, 'http://languafina.com/dashboard/instructor/show/25', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 19:17:14', '2021-04-05 19:17:14', NULL),
(5831, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/25', 'POST', '2021-04-05 19:17:17', '2021-04-05 19:17:17', NULL),
(5832, 'Viewed dashboard/student/index', 'Registered', 24, 'http://languafina.com/dashboard/student/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/25', 'GET', '2021-04-05 19:17:23', '2021-04-05 19:17:23', NULL),
(5833, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-05 19:17:25', '2021-04-05 19:17:25', NULL),
(5834, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-05 19:17:31', '2021-04-05 19:17:31', NULL),
(5835, 'Viewed dashboard/student/index', 'Registered', 24, 'http://languafina.com/dashboard/student/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-05 19:17:33', '2021-04-05 19:17:33', NULL),
(5836, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-05 19:17:37', '2021-04-05 19:17:37', NULL),
(5837, 'Viewed dashboard/category/index', 'Registered', 24, 'http://languafina.com/dashboard/category/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-05 19:17:43', '2021-04-05 19:17:43', NULL),
(5838, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/category/index', 'POST', '2021-04-05 19:17:46', '2021-04-05 19:17:46', NULL),
(5839, 'Viewed dashboard/category/create', 'Registered', 24, 'http://languafina.com/dashboard/category/create', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/category/index', 'GET', '2021-04-05 19:17:55', '2021-04-05 19:17:55', NULL),
(5840, 'Viewed dashboard/course/index', 'Registered', 24, 'http://languafina.com/dashboard/course/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/category/index', 'GET', '2021-04-05 19:18:25', '2021-04-05 19:18:25', NULL),
(5841, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-05 19:18:30', '2021-04-05 19:18:30', NULL),
(5842, 'Viewed dashboard/course/published', 'Registered', 24, 'http://languafina.com/dashboard/course/published?id=27', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 19:18:45', '2021-04-05 19:18:45', NULL),
(5843, 'Viewed dashboard/course/published', 'Registered', 24, 'http://languafina.com/dashboard/course/published?id=27', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 19:18:46', '2021-04-05 19:18:46', NULL),
(5844, 'Viewed dashboard/course/published', 'Registered', 24, 'http://languafina.com/dashboard/course/published?id=27', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 19:18:50', '2021-04-05 19:18:50', NULL),
(5845, 'Viewed dashboard/course/published', 'Registered', 24, 'http://languafina.com/dashboard/course/published?id=27', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 19:18:53', '2021-04-05 19:18:53', NULL),
(5846, 'Viewed dashboard/course/index/26/what-is-articles', 'Registered', 24, 'http://languafina.com/dashboard/course/index/26/what-is-articles', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 19:22:14', '2021-04-05 19:22:14', NULL),
(5847, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/26/what-is-articles', 'POST', '2021-04-05 19:22:18', '2021-04-05 19:22:18', NULL),
(5848, 'Viewed dashboard/course/index', 'Registered', 24, 'http://languafina.com/dashboard/course/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index/26/what-is-articles', 'GET', '2021-04-05 19:26:10', '2021-04-05 19:26:10', NULL),
(5849, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-05 19:26:12', '2021-04-05 19:26:12', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5850, 'Viewed dashboard/course/index/19/outcome-based-education-obe-and-academic-quality-assurance', 'Registered', 24, 'http://languafina.com/dashboard/course/index/19/outcome-based-education-obe-and-academic-quality-assurance', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-05 19:30:46', '2021-04-05 19:30:46', NULL),
(5851, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 19:34:52', '2021-04-05 19:34:52', NULL),
(5852, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-05 19:44:50', '2021-04-05 19:44:50', NULL),
(5853, 'Viewed signup', 'Guest', NULL, 'http://languafina.com/signup', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'GET', '2021-04-05 19:46:13', '2021-04-05 19:46:13', NULL),
(5854, 'Created student/create', 'Guest', NULL, 'http://languafina.com/student/create', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/signup', 'POST', '2021-04-05 19:47:58', '2021-04-05 19:47:58', NULL),
(5855, 'Viewed signup', 'Guest', NULL, 'http://languafina.com/signup', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/signup', 'GET', '2021-04-05 19:47:59', '2021-04-05 19:47:59', NULL),
(5856, 'Created student/create', 'Guest', NULL, 'http://languafina.com/student/create', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/signup', 'POST', '2021-04-05 19:49:03', '2021-04-05 19:49:03', NULL),
(5857, 'Logged In', 'Registered', 27, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-05 19:49:29', '2021-04-05 19:49:29', NULL),
(5858, 'Logged Out', 'Registered', 27, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-05 19:49:29', '2021-04-05 19:49:29', NULL),
(5859, 'Logged In', 'Registered', 27, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-05 19:56:30', '2021-04-05 19:56:30', NULL),
(5860, 'Logged Out', 'Registered', 27, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-05 19:56:30', '2021-04-05 19:56:30', NULL),
(5861, 'Viewed signup', 'Guest', NULL, 'http://www.languafina.com/signup', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/login', 'GET', '2021-04-05 19:57:12', '2021-04-05 19:57:12', NULL),
(5862, 'Created student/create', 'Guest', NULL, 'http://www.languafina.com/student/create', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/signup', 'POST', '2021-04-05 19:58:35', '2021-04-05 19:58:35', NULL),
(5863, 'Failed Login Attempt', 'Guest', NULL, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-05 20:01:08', '2021-04-05 20:01:08', NULL),
(5864, 'Logged In', 'Registered', 26, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-05 20:01:25', '2021-04-05 20:01:25', NULL),
(5865, 'Logged Out', 'Registered', 26, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-05 20:01:25', '2021-04-05 20:01:25', NULL),
(5866, 'Logged In', 'Registered', 28, 'http://www.languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/login', 'POST', '2021-04-05 20:06:10', '2021-04-05 20:06:10', NULL),
(5867, 'Logged Out', 'Registered', 28, 'http://www.languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/login', 'POST', '2021-04-05 20:06:10', '2021-04-05 20:06:10', NULL),
(5868, 'Viewed password/reset', 'Guest', NULL, 'http://www.languafina.com/password/reset', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/login', 'GET', '2021-04-05 20:07:34', '2021-04-05 20:07:34', NULL),
(5869, 'Viewed password/reset', 'Guest', NULL, 'http://languafina.com/password/reset', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'GET', '2021-04-05 20:09:58', '2021-04-05 20:09:58', NULL),
(5870, 'Viewed instructor/register', 'Guest', NULL, 'http://www.languafina.com/instructor/register', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/password/reset', 'GET', '2021-04-05 20:12:51', '2021-04-05 20:12:51', NULL),
(5871, 'Failed Login Attempt', 'Guest', NULL, 'http://www.languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/login', 'POST', '2021-04-05 20:14:21', '2021-04-05 20:14:21', NULL),
(5872, 'Logged In', 'Registered', 26, 'http://www.languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/login', 'POST', '2021-04-05 20:14:45', '2021-04-05 20:14:45', NULL),
(5873, 'Logged Out', 'Registered', 26, 'http://www.languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/login', 'POST', '2021-04-05 20:14:45', '2021-04-05 20:14:45', NULL),
(5874, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/password/reset', 'GET', '2021-04-05 20:26:41', '2021-04-05 20:26:41', NULL),
(5875, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/instructor/register', 'POST', '2021-04-05 20:27:18', '2021-04-05 20:27:18', NULL),
(5876, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/instructor/register', 'GET', '2021-04-05 20:27:19', '2021-04-05 20:27:19', NULL),
(5877, 'Failed Login Attempt', 'Guest', NULL, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-05 20:27:50', '2021-04-05 20:27:50', NULL),
(5878, 'Viewed signup', 'Guest', NULL, 'http://languafina.com/signup', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'GET', '2021-04-05 20:28:46', '2021-04-05 20:28:46', NULL),
(5879, 'Created student/create', 'Guest', NULL, 'http://languafina.com/student/create', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/signup', 'POST', '2021-04-05 20:29:29', '2021-04-05 20:29:29', NULL),
(5880, 'Logged In', 'Registered', 29, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-05 20:30:02', '2021-04-05 20:30:02', NULL),
(5881, 'Logged Out', 'Registered', 29, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-05 20:30:02', '2021-04-05 20:30:02', NULL),
(5882, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '93.158.91.193', 'Mozilla/5.0 (Linux; Android 7.0; SM-G892A Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Mobile Safari/537.36', NULL, NULL, 'GET', '2021-04-05 20:41:58', '2021-04-05 20:41:58', NULL),
(5883, 'Viewed /', 'Guest', NULL, 'http://www.languafina.com', '157.39.93.237', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15E148 Safari/604.1', 'en-us', NULL, 'GET', '2021-04-05 22:07:58', '2021-04-05 22:07:58', NULL),
(5884, 'Crawler crawled http://www.languafina.com', 'Crawler', NULL, 'http://www.languafina.com', '59.175.144.19', 'GRequests/0.10', 'zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,it;q=0.6', NULL, 'GET', '2021-04-05 22:37:50', '2021-04-05 22:37:50', NULL),
(5885, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-06 00:09:43', '2021-04-06 00:09:43', NULL),
(5886, 'Viewed /', 'Guest', NULL, 'https://languafina.com', '34.208.84.206', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', NULL, NULL, 'GET', '2021-04-06 00:15:29', '2021-04-06 00:15:29', NULL),
(5887, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '54.68.204.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', NULL, NULL, 'GET', '2021-04-06 00:16:37', '2021-04-06 00:16:37', NULL),
(5888, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '34.222.43.193', NULL, NULL, NULL, 'GET', '2021-04-06 00:17:51', '2021-04-06 00:17:51', NULL),
(5889, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '104.227.76.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', NULL, 'http://thehappyindianstore.com', 'GET', '2021-04-06 00:22:05', '2021-04-06 00:22:05', NULL),
(5890, 'Viewed course/personal-development-course', 'Guest', NULL, 'http://languafina.com/course/personal-development-course', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-06 00:27:53', '2021-04-06 00:27:53', NULL),
(5891, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/course/personal-development-course', 'GET', '2021-04-06 00:30:39', '2021-04-06 00:30:39', NULL),
(5892, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-06 00:41:06', '2021-04-06 00:41:06', NULL),
(5893, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-06 00:41:55', '2021-04-06 00:41:55', NULL),
(5894, 'Logged In', 'Registered', 26, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-06 00:43:15', '2021-04-06 00:43:15', NULL),
(5895, 'Logged Out', 'Registered', 26, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-06 00:43:15', '2021-04-06 00:43:15', NULL),
(5896, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-06 00:43:49', '2021-04-06 00:43:49', NULL),
(5897, 'Viewed courses', 'Guest', NULL, 'http://languafina.com/courses', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-06 00:45:13', '2021-04-06 00:45:13', NULL),
(5898, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-06 01:19:35', '2021-04-06 01:19:35', NULL),
(5899, 'Failed Login Attempt', 'Guest', NULL, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-06 01:20:20', '2021-04-06 01:20:20', NULL),
(5900, 'Failed Login Attempt', 'Guest', NULL, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-06 01:21:03', '2021-04-06 01:21:03', NULL),
(5901, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'GET', '2021-04-06 01:21:19', '2021-04-06 01:21:19', NULL),
(5902, 'Viewed password/reset', 'Guest', NULL, 'http://www.languafina.com/password/reset', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/login', 'GET', '2021-04-06 01:29:04', '2021-04-06 01:29:04', NULL),
(5903, 'Logged In', 'Registered', 26, 'http://www.languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/login', 'POST', '2021-04-06 01:30:54', '2021-04-06 01:30:54', NULL),
(5904, 'Logged Out', 'Registered', 26, 'http://www.languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'http://www.languafina.com/login', 'POST', '2021-04-06 01:30:54', '2021-04-06 01:30:54', NULL),
(5905, 'Viewed courses', 'Guest', NULL, 'http://languafina.com/courses', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-06 01:33:16', '2021-04-06 01:33:16', NULL),
(5906, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/courses', 'GET', '2021-04-06 01:34:08', '2021-04-06 01:34:08', NULL),
(5907, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-06 01:48:37', '2021-04-06 01:48:37', NULL),
(5908, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'GET', '2021-04-06 01:48:38', '2021-04-06 01:48:38', NULL),
(5909, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 01:48:44', '2021-04-06 01:48:44', NULL),
(5910, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 01:51:15', '2021-04-06 01:51:15', NULL),
(5911, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 01:51:18', '2021-04-06 01:51:18', NULL),
(5912, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 01:51:26', '2021-04-06 01:51:26', NULL),
(5913, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 01:51:26', '2021-04-06 01:51:26', NULL),
(5914, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 01:51:28', '2021-04-06 01:51:28', NULL),
(5915, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 01:52:43', '2021-04-06 01:52:43', NULL),
(5916, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 01:52:45', '2021-04-06 01:52:45', NULL),
(5917, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 01:55:47', '2021-04-06 01:55:47', NULL),
(5918, 'Viewed /', 'Registered', 24, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/courses', 'GET', '2021-04-06 02:00:40', '2021-04-06 02:00:40', NULL),
(5919, 'Viewed /', 'Registered', 24, 'http://languafina.com', '117.96.245.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-06 03:49:58', '2021-04-06 03:49:58', NULL),
(5920, 'Viewed /', 'Registered', 24, 'http://languafina.com', '117.96.245.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-06 03:51:57', '2021-04-06 03:51:57', NULL),
(5921, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-06 03:52:14', '2021-04-06 03:52:14', NULL),
(5922, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-06 03:52:16', '2021-04-06 03:52:16', NULL),
(5923, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '117.96.245.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'POST', '2021-04-06 03:53:50', '2021-04-06 03:53:50', NULL),
(5924, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '117.96.245.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-06 03:53:51', '2021-04-06 03:53:51', NULL),
(5925, 'Viewed courses/parenting-relationships8', 'Guest', NULL, 'http://languafina.com/courses/parenting-relationships8', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-06 04:02:34', '2021-04-06 04:02:34', NULL),
(5926, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/courses/parenting-relationships8', 'GET', '2021-04-06 04:02:45', '2021-04-06 04:02:45', NULL),
(5927, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/courses/parenting-relationships8', 'GET', '2021-04-06 04:02:49', '2021-04-06 04:02:49', NULL),
(5928, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/courses/parenting-relationships8', 'GET', '2021-04-06 04:02:50', '2021-04-06 04:02:50', NULL),
(5929, 'Viewed courses/leadership2', 'Guest', NULL, 'http://languafina.com/courses/leadership2', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-06 04:03:25', '2021-04-06 04:03:25', NULL),
(5930, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '117.96.245.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-06 04:05:44', '2021-04-06 04:05:44', NULL),
(5931, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '117.96.245.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'GET', '2021-04-06 04:05:44', '2021-04-06 04:05:44', NULL),
(5932, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '117.96.245.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 04:05:48', '2021-04-06 04:05:48', NULL),
(5933, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-06 04:06:26', '2021-04-06 04:06:26', NULL),
(5934, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-06 04:06:27', '2021-04-06 04:06:27', NULL),
(5935, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-06 04:07:12', '2021-04-06 04:07:12', NULL),
(5936, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-06 04:08:20', '2021-04-06 04:08:20', NULL),
(5937, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 04:08:22', '2021-04-06 04:08:22', NULL),
(5938, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 04:52:23', '2021-04-06 04:52:23', NULL),
(5939, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 04:52:24', '2021-04-06 04:52:24', NULL),
(5940, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '124.253.63.33', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', 'en-gb', NULL, 'GET', '2021-04-06 05:40:56', '2021-04-06 05:40:56', NULL),
(5941, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-06 06:53:32', '2021-04-06 06:53:32', NULL),
(5942, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '156.205.146.241', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'ar-EG,ar;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-04-06 06:53:32', '2021-04-06 06:53:32', NULL),
(5943, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '34.217.253.81', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/600.3.18 (KHTML, like Gecko) Version/8.0.3 Safari/600.3.18', NULL, NULL, 'HEAD', '2021-04-06 06:53:32', '2021-04-06 06:53:32', NULL),
(5944, 'Crawler crawled http://languafina.com', 'Crawler', NULL, 'http://languafina.com', '34.217.253.81', 'Mozilla/5.0 (compatible; DashLinkPreviews/5.1;)', NULL, NULL, 'GET', '2021-04-06 06:53:32', '2021-04-06 06:53:32', NULL),
(5945, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '34.217.253.81', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/600.3.18 (KHTML, like Gecko) Version/8.0.3 Safari/600.3.18', NULL, NULL, 'HEAD', '2021-04-06 06:53:32', '2021-04-06 06:53:32', NULL),
(5946, 'Crawler crawled http://languafina.com', 'Crawler', NULL, 'http://languafina.com', '34.217.253.81', 'Mozilla/5.0 (compatible; DashLinkPreviews/5.1;)', NULL, NULL, 'GET', '2021-04-06 06:53:34', '2021-04-06 06:53:34', NULL),
(5947, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '34.217.253.81', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/600.3.18 (KHTML, like Gecko) Version/8.0.3 Safari/600.3.18', NULL, NULL, 'HEAD', '2021-04-06 06:53:34', '2021-04-06 06:53:34', NULL),
(5948, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '34.217.253.81', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/600.3.18 (KHTML, like Gecko) Version/8.0.3 Safari/600.3.18', NULL, NULL, 'HEAD', '2021-04-06 06:53:35', '2021-04-06 06:53:35', NULL),
(5949, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '156.205.146.241', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'ar-EG,ar;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-04-06 06:53:41', '2021-04-06 06:53:41', NULL),
(5950, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-06 06:53:44', '2021-04-06 06:53:44', NULL),
(5951, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '156.205.146.241', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'ar-EG,ar;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-04-06 06:53:49', '2021-04-06 06:53:49', NULL),
(5952, 'Viewed courses', 'Guest', NULL, 'http://languafina.com/courses', '156.205.146.241', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'ar-EG,ar;q=0.9,en-US;q=0.8,en;q=0.7', 'http://languafina.com/', 'GET', '2021-04-06 06:54:31', '2021-04-06 06:54:31', NULL),
(5953, 'Viewed courses/leadership2', 'Guest', NULL, 'http://languafina.com/courses/leadership2', '156.205.146.241', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'ar-EG,ar;q=0.9,en-US;q=0.8,en;q=0.7', 'http://languafina.com/', 'GET', '2021-04-06 06:54:31', '2021-04-06 06:54:31', NULL),
(5954, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '41.187.114.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', 'en-US,en;q=0.9', 'https://www.google.com/', 'GET', '2021-04-06 07:09:42', '2021-04-06 07:09:42', NULL),
(5955, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '156.205.146.241', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'ar-EG,ar;q=0.9,en-US;q=0.8,en;q=0.7', 'http://languafina.com/login', 'GET', '2021-04-06 07:39:54', '2021-04-06 07:39:54', NULL),
(5956, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '156.205.146.241', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'ar-EG,ar;q=0.9,en-US;q=0.8,en;q=0.7', 'http://languafina.com/instructor/register', 'GET', '2021-04-06 07:40:01', '2021-04-06 07:40:01', NULL),
(5957, 'Viewed course/increase-your-personal-skills-and-join-our-course', 'Guest', NULL, 'http://languafina.com/course/increase-your-personal-skills-and-join-our-course', '156.205.146.241', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'ar-EG,ar;q=0.9,en-US;q=0.8,en;q=0.7', 'http://languafina.com/', 'GET', '2021-04-06 07:40:19', '2021-04-06 07:40:19', NULL),
(5958, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '156.205.146.241', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'ar-EG,ar;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-04-06 07:47:54', '2021-04-06 07:47:54', NULL),
(5959, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-06 08:09:34', '2021-04-06 08:09:34', NULL),
(5960, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-06 08:09:34', '2021-04-06 08:09:34', NULL),
(5961, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 08:09:38', '2021-04-06 08:09:38', NULL),
(5962, 'Viewed dashboard/course/index', 'Registered', 24, 'http://languafina.com/dashboard/course/index', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 08:09:50', '2021-04-06 08:09:50', NULL),
(5963, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-06 08:09:54', '2021-04-06 08:09:54', NULL),
(5964, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-06 08:11:25', '2021-04-06 08:11:25', NULL),
(5965, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-06 08:11:25', '2021-04-06 08:11:25', NULL),
(5966, 'Logged In', 'Registered', 5, 'http://languafina.com/login', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-06 08:11:36', '2021-04-06 08:11:36', NULL),
(5967, 'Viewed dashboard/home', 'Registered', 5, 'http://languafina.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-06 08:11:36', '2021-04-06 08:11:36', NULL),
(5968, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 08:11:38', '2021-04-06 08:11:38', NULL),
(5969, 'Viewed dashboard/course/create', 'Registered', 5, 'http://languafina.com/dashboard/course/create', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 08:11:43', '2021-04-06 08:11:43', NULL),
(5970, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/create', 'POST', '2021-04-06 08:11:46', '2021-04-06 08:11:46', NULL),
(5971, 'Viewed dashboard/student/index', 'Registered', 5, 'http://languafina.com/dashboard/student/index', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/course/create', 'GET', '2021-04-06 08:14:02', '2021-04-06 08:14:02', NULL),
(5972, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-06 08:14:04', '2021-04-06 08:14:04', NULL),
(5973, 'Viewed dashboard/student/index', 'Registered', 5, 'http://languafina.com/dashboard/student/index', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-06 08:14:09', '2021-04-06 08:14:09', NULL),
(5974, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-06 08:14:10', '2021-04-06 08:14:10', NULL),
(5975, 'Viewed dashboard/home', 'Registered', 5, 'http://languafina.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-06 08:14:45', '2021-04-06 08:14:45', NULL),
(5976, 'Viewed dashboard/home', 'Registered', 5, 'http://languafina.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-06 08:14:49', '2021-04-06 08:14:49', NULL),
(5977, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 08:14:51', '2021-04-06 08:14:51', NULL),
(5978, 'Viewed dashboard/home', 'Registered', 5, 'http://languafina.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 08:17:40', '2021-04-06 08:17:40', NULL),
(5979, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 08:17:41', '2021-04-06 08:17:41', NULL),
(5980, 'Viewed /', 'Registered', 5, 'http://languafina.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 08:17:41', '2021-04-06 08:17:41', NULL),
(5981, 'Viewed /', 'Registered', 5, 'http://languafina.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 08:18:35', '2021-04-06 08:18:35', NULL),
(5982, 'Viewed dashboard/home', 'Registered', 5, 'http://languafina.com/dashboard/home', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-06 08:21:23', '2021-04-06 08:21:23', NULL),
(5983, 'Logged Out', 'Registered', 5, 'http://languafina.com/logout', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'POST', '2021-04-06 08:21:30', '2021-04-06 08:21:30', NULL),
(5984, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-06 08:21:31', '2021-04-06 08:21:31', NULL),
(5985, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/', 'GET', '2021-04-06 08:21:38', '2021-04-06 08:21:38', NULL),
(5986, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-06 08:23:12', '2021-04-06 08:23:12', NULL),
(5987, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-06 08:23:16', '2021-04-06 08:23:16', NULL),
(5988, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'GET', '2021-04-06 08:23:16', '2021-04-06 08:23:16', NULL),
(5989, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-06 08:23:28', '2021-04-06 08:23:28', NULL),
(5990, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'GET', '2021-04-06 08:23:29', '2021-04-06 08:23:29', NULL),
(5991, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-06 08:23:53', '2021-04-06 08:23:53', NULL),
(5992, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'GET', '2021-04-06 08:23:53', '2021-04-06 08:23:53', NULL),
(5993, 'Created instructor/create', 'Guest', NULL, 'http://languafina.com/instructor/create', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'POST', '2021-04-06 08:24:34', '2021-04-06 08:24:34', NULL),
(5994, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '103.72.143.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/instructor/register', 'GET', '2021-04-06 08:24:35', '2021-04-06 08:24:35', NULL),
(5995, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '107.152.214.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', NULL, 'http://thehappyindianstore.com', 'GET', '2021-04-06 08:41:56', '2021-04-06 08:41:56', NULL),
(5996, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '156.205.146.241', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'ar-EG,ar;q=0.9,en-US;q=0.8,en;q=0.7', 'http://languafina.com/', 'GET', '2021-04-06 08:46:31', '2021-04-06 08:46:31', NULL),
(5997, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '199.192.23.87', NULL, NULL, NULL, 'GET', '2021-04-06 14:28:18', '2021-04-06 14:28:18', NULL),
(5998, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '199.192.23.87', NULL, NULL, NULL, 'GET', '2021-04-06 14:28:27', '2021-04-06 14:28:27', NULL),
(5999, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '199.192.23.87', NULL, NULL, NULL, 'GET', '2021-04-06 14:28:29', '2021-04-06 14:28:29', NULL),
(6000, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '157.39.9.108', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.114 Mobile Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', NULL, 'GET', '2021-04-06 16:29:28', '2021-04-06 16:29:28', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6001, 'Logged In', 'Registered', 5, 'http://languafina.com/login', '157.39.37.192', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.114 Mobile Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-06 16:31:01', '2021-04-06 16:31:01', NULL),
(6002, 'Viewed dashboard/home', 'Registered', 5, 'http://languafina.com/dashboard/home', '157.39.9.108', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.114 Mobile Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-06 16:31:02', '2021-04-06 16:31:02', NULL),
(6003, 'Created dashboard/media/manager/slide', 'Registered', 5, 'http://languafina.com/dashboard/media/manager/slide', '157.39.37.192', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.114 Mobile Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 16:31:10', '2021-04-06 16:31:10', NULL),
(6004, 'Logged Out', 'Registered', 5, 'http://languafina.com/logout', '157.39.37.192', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.114 Mobile Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 16:31:21', '2021-04-06 16:31:21', NULL),
(6005, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '157.39.37.192', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.114 Mobile Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 16:31:22', '2021-04-06 16:31:22', NULL),
(6006, 'Viewed signup', 'Guest', NULL, 'http://languafina.com/signup', '157.39.37.192', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.114 Mobile Safari/537.36', 'en-US,en;q=0.9,hi;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-06 16:31:50', '2021-04-06 16:31:50', NULL),
(6007, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '35.172.192.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en', NULL, 'GET', '2021-04-06 17:28:33', '2021-04-06 17:28:33', NULL),
(6008, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-06 17:44:50', '2021-04-06 17:44:50', NULL),
(6009, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-06 17:49:39', '2021-04-06 17:49:39', NULL),
(6010, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'GET', '2021-04-06 17:49:39', '2021-04-06 17:49:39', NULL),
(6011, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 17:49:45', '2021-04-06 17:49:45', NULL),
(6012, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 17:49:53', '2021-04-06 17:49:53', NULL),
(6013, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 17:49:55', '2021-04-06 17:49:55', NULL),
(6014, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 17:50:35', '2021-04-06 17:50:35', NULL),
(6015, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 17:50:40', '2021-04-06 17:50:40', NULL),
(6016, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 17:50:46', '2021-04-06 17:50:46', NULL),
(6017, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-06 17:50:48', '2021-04-06 17:50:48', NULL),
(6018, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-06 17:50:54', '2021-04-06 17:50:54', NULL),
(6019, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-06 17:50:56', '2021-04-06 17:50:56', NULL),
(6020, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-06 17:51:33', '2021-04-06 17:51:33', NULL),
(6021, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-06 17:51:35', '2021-04-06 17:51:35', NULL),
(6022, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-06 17:51:45', '2021-04-06 17:51:45', NULL),
(6023, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-06 17:51:47', '2021-04-06 17:51:47', NULL),
(6024, 'Viewed dashboard/student/index', 'Registered', 24, 'http://languafina.com/dashboard/student/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-06 17:51:57', '2021-04-06 17:51:57', NULL),
(6025, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-06 17:51:58', '2021-04-06 17:51:58', NULL),
(6026, 'Viewed dashboard/course/index', 'Registered', 24, 'http://languafina.com/dashboard/course/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-06 17:52:36', '2021-04-06 17:52:36', NULL),
(6027, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/course/index', 'POST', '2021-04-06 17:52:39', '2021-04-06 17:52:39', NULL),
(6028, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/course/index', 'GET', '2021-04-06 17:54:12', '2021-04-06 17:54:12', NULL),
(6029, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 17:54:14', '2021-04-06 17:54:14', NULL),
(6030, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 17:54:48', '2021-04-06 17:54:48', NULL),
(6031, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-06 17:54:49', '2021-04-06 17:54:49', NULL),
(6032, 'Viewed dashboard/student/index', 'Registered', 24, 'http://languafina.com/dashboard/student/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-06 17:54:59', '2021-04-06 17:54:59', NULL),
(6033, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-06 17:55:00', '2021-04-06 17:55:00', NULL),
(6034, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://languafina.com/dashboard/site/setting', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-06 17:55:32', '2021-04-06 17:55:32', NULL),
(6035, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/site/setting', 'POST', '2021-04-06 17:55:34', '2021-04-06 17:55:34', NULL),
(6036, 'Viewed dashboard/pages/index', 'Registered', 24, 'http://languafina.com/dashboard/pages/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/site/setting', 'GET', '2021-04-06 17:55:39', '2021-04-06 17:55:39', NULL),
(6037, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/pages/index', 'POST', '2021-04-06 17:55:44', '2021-04-06 17:55:44', NULL),
(6038, 'Viewed dashboard/slider/index', 'Registered', 24, 'http://languafina.com/dashboard/slider/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/pages/index', 'GET', '2021-04-06 17:55:45', '2021-04-06 17:55:45', NULL),
(6039, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/slider/index', 'POST', '2021-04-06 17:55:46', '2021-04-06 17:55:46', NULL),
(6040, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/slider/index', 'GET', '2021-04-06 17:57:24', '2021-04-06 17:57:24', NULL),
(6041, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-06 17:57:26', '2021-04-06 17:57:26', NULL),
(6042, 'Viewed /', 'Registered', 24, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-06 17:58:24', '2021-04-06 17:58:24', NULL),
(6043, 'Crawler crawled http://www.thehappyindianstore.com', 'Crawler', NULL, 'http://www.thehappyindianstore.com', '180.76.240.243', 'GRequests/0.10', 'zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,it;q=0.6', NULL, 'GET', '2021-04-06 17:58:26', '2021-04-06 17:58:26', NULL),
(6044, 'Viewed dashboard/affiliate/setting', 'Registered', 24, 'http://languafina.com/dashboard/affiliate/setting', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-06 17:58:40', '2021-04-06 17:58:40', NULL),
(6045, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/affiliate/setting', 'POST', '2021-04-06 17:58:41', '2021-04-06 17:58:41', NULL),
(6046, 'Viewed dashboard/affiliate/index', 'Registered', 24, 'http://languafina.com/dashboard/affiliate/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/affiliate/setting', 'GET', '2021-04-06 17:58:46', '2021-04-06 17:58:46', NULL),
(6047, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/affiliate/index', 'POST', '2021-04-06 17:58:48', '2021-04-06 17:58:48', NULL),
(6048, 'Viewed dashboard/affiliate/payment/request', 'Registered', 24, 'http://languafina.com/dashboard/affiliate/payment/request', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/affiliate/index', 'GET', '2021-04-06 17:58:51', '2021-04-06 17:58:51', NULL),
(6049, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/affiliate/payment/request', 'POST', '2021-04-06 17:58:52', '2021-04-06 17:58:52', NULL),
(6050, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/certificate/setup', 'POST', '2021-04-06 17:59:05', '2021-04-06 17:59:05', NULL),
(6051, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/certificate/setup', 'POST', '2021-04-06 17:59:07', '2021-04-06 17:59:07', NULL),
(6052, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/certificate/setup', 'GET', '2021-04-06 18:00:04', '2021-04-06 18:00:04', NULL),
(6053, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-06 18:00:06', '2021-04-06 18:00:06', NULL),
(6054, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-06 18:00:09', '2021-04-06 18:00:09', NULL),
(6055, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-06 18:00:10', '2021-04-06 18:00:10', NULL),
(6056, 'Viewed dashboard/student/index', 'Registered', 24, 'http://languafina.com/dashboard/student/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-06 18:00:16', '2021-04-06 18:00:16', NULL),
(6057, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-06 18:00:17', '2021-04-06 18:00:17', NULL),
(6058, 'Viewed dashboard/student/show/29', 'Registered', 24, 'http://languafina.com/dashboard/student/show/29', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-06 18:00:43', '2021-04-06 18:00:43', NULL),
(6059, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/show/29', 'POST', '2021-04-06 18:00:46', '2021-04-06 18:00:46', NULL),
(6060, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-06 18:00:52', '2021-04-06 18:00:52', NULL),
(6061, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-06 18:00:57', '2021-04-06 18:00:57', NULL),
(6062, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-06 18:00:58', '2021-04-06 18:00:58', NULL),
(6063, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-06 18:01:08', '2021-04-06 18:01:08', NULL),
(6064, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 18:01:10', '2021-04-06 18:01:10', NULL),
(6065, 'Viewed dashboard/student/index', 'Registered', 24, 'http://languafina.com/dashboard/student/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 18:01:26', '2021-04-06 18:01:26', NULL),
(6066, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-06 18:01:28', '2021-04-06 18:01:28', NULL),
(6067, 'Viewed dashboard/student/show/29', 'Registered', 24, 'http://languafina.com/dashboard/student/show/29', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-06 18:01:35', '2021-04-06 18:01:35', NULL),
(6068, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/show/29', 'POST', '2021-04-06 18:01:37', '2021-04-06 18:01:37', NULL),
(6069, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-06 18:01:58', '2021-04-06 18:01:58', NULL),
(6070, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-06 18:02:36', '2021-04-06 18:02:36', NULL),
(6071, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-06 18:02:37', '2021-04-06 18:02:37', NULL),
(6072, 'Viewed password/reset', 'Guest', NULL, 'http://languafina.com/password/reset', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'GET', '2021-04-06 18:03:19', '2021-04-06 18:03:19', NULL),
(6073, 'Viewed /', 'Guest', NULL, 'http://thehappyindianstore.com', '52.24.49.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', NULL, NULL, 'GET', '2021-04-06 18:09:06', '2021-04-06 18:09:06', NULL),
(6074, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Linux; Android 11; SM-M315F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Mobile Safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', NULL, 'GET', '2021-04-06 18:12:02', '2021-04-06 18:12:02', NULL),
(6075, 'Viewed /', 'Guest', NULL, 'http://www.languafina.com', '124.253.113.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-06 19:57:59', '2021-04-06 19:57:59', NULL),
(6076, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '223.185.11.222', 'Mozilla/5.0 (Linux; Android 8.1.0; SM-G615F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Mobile Safari/537.36', 'en,en-US;q=0.9,en-GB;q=0.8', NULL, 'GET', '2021-04-06 19:58:51', '2021-04-06 19:58:51', NULL),
(6077, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '223.185.11.222', 'Mozilla/5.0 (Linux; Android 8.1.0; SM-G615F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Mobile Safari/537.36', 'en,en-US;q=0.9,en-GB;q=0.8', NULL, 'GET', '2021-04-06 19:59:56', '2021-04-06 19:59:56', NULL),
(6078, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-06 21:26:04', '2021-04-06 21:26:04', NULL),
(6079, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-06 22:33:18', '2021-04-06 22:33:18', NULL),
(6080, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-06 23:00:53', '2021-04-06 23:00:53', NULL),
(6081, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-06 23:00:53', '2021-04-06 23:00:53', NULL),
(6082, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', NULL, 'GET', '2021-04-06 23:00:53', '2021-04-06 23:00:53', NULL),
(6083, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'POST', '2021-04-06 23:01:24', '2021-04-06 23:01:24', NULL),
(6084, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-06 23:01:25', '2021-04-06 23:01:25', NULL),
(6085, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/login', 'GET', '2021-04-06 23:01:30', '2021-04-06 23:01:30', NULL),
(6086, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-06 23:01:34', '2021-04-06 23:01:34', NULL),
(6087, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 23:01:45', '2021-04-06 23:01:45', NULL),
(6088, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 23:01:45', '2021-04-06 23:01:45', NULL),
(6089, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-06 23:01:47', '2021-04-06 23:01:47', NULL),
(6090, 'Viewed dashboard/instructor/show/25', 'Registered', 24, 'http://languafina.com/dashboard/instructor/show/25', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-06 23:01:50', '2021-04-06 23:01:50', NULL),
(6091, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '49.36.230.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'en-US,en;q=0.9,fr;q=0.8', 'http://languafina.com/dashboard/instructor/show/25', 'POST', '2021-04-06 23:02:02', '2021-04-06 23:02:02', NULL),
(6092, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'GET', '2021-04-06 23:02:04', '2021-04-06 23:02:04', NULL),
(6093, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-06 23:02:16', '2021-04-06 23:02:16', NULL),
(6094, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-06 23:02:28', '2021-04-06 23:02:28', NULL),
(6095, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-06 23:02:31', '2021-04-06 23:02:31', NULL),
(6096, 'Viewed dashboard/instructor/show/25', 'Registered', 24, 'http://languafina.com/dashboard/instructor/show/25', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-06 23:02:54', '2021-04-06 23:02:54', NULL),
(6097, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/show/25', 'POST', '2021-04-06 23:03:03', '2021-04-06 23:03:03', NULL),
(6098, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '203.145.168.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-06 23:03:11', '2021-04-06 23:03:11', NULL),
(6099, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-06 23:53:06', '2021-04-06 23:53:06', NULL),
(6100, 'Viewed course/personal-development-course', 'Guest', NULL, 'http://languafina.com/course/personal-development-course', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-06 23:54:35', '2021-04-06 23:54:35', NULL),
(6101, 'Viewed instructor/register', 'Guest', NULL, 'http://languafina.com/instructor/register', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'GET', '2021-04-06 23:55:08', '2021-04-06 23:55:08', NULL),
(6102, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '54.212.166.132', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', NULL, NULL, 'GET', '2021-04-07 00:16:09', '2021-04-07 00:16:09', NULL),
(6103, 'Viewed /', 'Guest', NULL, 'https://languafina.com', '54.212.79.37', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', NULL, NULL, 'GET', '2021-04-07 00:16:46', '2021-04-07 00:16:46', NULL),
(6104, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '52.88.23.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', NULL, NULL, 'GET', '2021-04-07 00:17:15', '2021-04-07 00:17:15', NULL),
(6105, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-07 00:45:31', '2021-04-07 00:45:31', NULL),
(6106, 'Logged In', 'Registered', 24, 'http://languafina.com/login', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'POST', '2021-04-07 00:47:28', '2021-04-07 00:47:28', NULL),
(6107, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/login', 'GET', '2021-04-07 00:47:29', '2021-04-07 00:47:29', NULL),
(6108, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-07 00:47:39', '2021-04-07 00:47:39', NULL),
(6109, 'Viewed dashboard/coupon/coupons', 'Registered', 24, 'http://languafina.com/dashboard/coupon/coupons', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-07 00:47:58', '2021-04-07 00:47:58', NULL),
(6110, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/coupon/coupons', 'POST', '2021-04-07 00:48:00', '2021-04-07 00:48:00', NULL),
(6111, 'Viewed dashboard/coupon/new', 'Registered', 24, 'http://languafina.com/dashboard/coupon/new', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/coupon/coupons', 'GET', '2021-04-07 00:48:03', '2021-04-07 00:48:03', NULL),
(6112, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/coupon/new', 'POST', '2021-04-07 00:48:06', '2021-04-07 00:48:06', NULL),
(6113, 'Viewed dashboard/user/index', 'Registered', 24, 'http://languafina.com/dashboard/user/index', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/coupon/new', 'GET', '2021-04-07 00:48:16', '2021-04-07 00:48:16', NULL),
(6114, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/index', 'POST', '2021-04-07 00:48:18', '2021-04-07 00:48:18', NULL),
(6115, 'Viewed dashboard/instructor/index', 'Registered', 24, 'http://languafina.com/dashboard/instructor/index', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/index', 'GET', '2021-04-07 00:48:31', '2021-04-07 00:48:31', NULL),
(6116, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'POST', '2021-04-07 00:48:34', '2021-04-07 00:48:34', NULL),
(6117, 'Viewed dashboard/student/index', 'Registered', 24, 'http://languafina.com/dashboard/student/index', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/instructor/index', 'GET', '2021-04-07 00:48:50', '2021-04-07 00:48:50', NULL),
(6118, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'POST', '2021-04-07 00:48:52', '2021-04-07 00:48:52', NULL),
(6119, 'Viewed dashboard/home', 'Registered', 24, 'http://languafina.com/dashboard/home', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/student/index', 'GET', '2021-04-07 00:49:01', '2021-04-07 00:49:01', NULL),
(6120, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'POST', '2021-04-07 00:49:06', '2021-04-07 00:49:06', NULL),
(6121, 'Viewed dashboard/site/setting', 'Registered', 24, 'http://languafina.com/dashboard/site/setting', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/home', 'GET', '2021-04-07 00:49:14', '2021-04-07 00:49:14', NULL),
(6122, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/site/setting', 'POST', '2021-04-07 00:49:17', '2021-04-07 00:49:17', NULL),
(6123, 'Viewed dashboard/user/show/24', 'Registered', 24, 'http://languafina.com/dashboard/user/show/24', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/site/setting', 'GET', '2021-04-07 00:49:38', '2021-04-07 00:49:38', NULL),
(6124, 'Created dashboard/media/manager/slide', 'Registered', 24, 'http://languafina.com/dashboard/media/manager/slide', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/show/24', 'POST', '2021-04-07 00:49:40', '2021-04-07 00:49:40', NULL),
(6125, 'Viewed /', 'Registered', 24, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/show/24', 'GET', '2021-04-07 00:49:49', '2021-04-07 00:49:49', NULL),
(6126, 'Logged Out', 'Registered', 24, 'http://languafina.com/logout', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/show/24', 'POST', '2021-04-07 00:49:55', '2021-04-07 00:49:55', NULL),
(6127, 'Viewed /', 'Guest', NULL, 'http://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/dashboard/user/show/24', 'GET', '2021-04-07 00:49:56', '2021-04-07 00:49:56', NULL),
(6128, 'Viewed course/ielts-level-3', 'Guest', NULL, 'http://languafina.com/course/ielts-level-3', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/', 'GET', '2021-04-07 00:50:42', '2021-04-07 00:50:42', NULL),
(6129, 'Viewed instructor/details/amit1', 'Guest', NULL, 'http://languafina.com/instructor/details/amit1', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/course/ielts-level-3', 'GET', '2021-04-07 00:50:59', '2021-04-07 00:50:59', NULL),
(6130, 'Viewed instructor/details/amit1', 'Guest', NULL, 'http://languafina.com/instructor/details/amit1', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/course/ielts-level-3', 'GET', '2021-04-07 00:51:09', '2021-04-07 00:51:09', NULL),
(6131, 'Viewed instructor/details/amit1', 'Guest', NULL, 'http://languafina.com/instructor/details/amit1', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'http://languafina.com/course/ielts-level-3', 'GET', '2021-04-07 00:51:51', '2021-04-07 00:51:51', NULL),
(6132, 'Viewed /', 'Guest', NULL, 'https://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', NULL, 'GET', '2021-04-07 00:57:36', '2021-04-07 00:57:36', NULL),
(6133, 'Viewed /', 'Guest', NULL, 'https://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'https://languafina.com/login', 'GET', '2021-04-07 00:58:36', '2021-04-07 00:58:36', NULL),
(6134, 'Viewed /', 'Guest', NULL, 'https://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'https://languafina.com/login', 'GET', '2021-04-07 00:59:16', '2021-04-07 00:59:16', NULL),
(6135, 'Viewed /', 'Guest', NULL, 'https://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'https://languafina.com/login', 'GET', '2021-04-07 00:59:27', '2021-04-07 00:59:27', NULL),
(6136, 'Viewed /', 'Guest', NULL, 'https://languafina.com', '49.36.230.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'en-US,en;q=0.9', 'https://languafina.com/login', 'GET', '2021-04-07 01:00:37', '2021-04-07 01:00:37', NULL),
(6137, 'Viewed /', 'Guest', NULL, 'https://languafina.com', '168.151.115.22', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Mobile/15E148 Safari/604.1', 'en-US', NULL, 'GET', '2021-04-07 02:12:36', '2021-04-07 02:12:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `massages`
--

CREATE TABLE `massages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enroll_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_managers`
--

CREATE TABLE `media_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `alt` longtext COLLATE utf8mb4_unicode_ci,
  `resolution` longtext COLLATE utf8mb4_unicode_ci,
  `size` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_managers`
--

INSERT INTO `media_managers` (`id`, `user_id`, `title`, `type`, `image`, `alt`, `resolution`, `size`, `created_at`, `updated_at`) VALUES
(1, 18, NULL, 'thumbnail', NULL, NULL, NULL, NULL, '2020-12-12 05:25:28', '2020-12-12 05:25:28'),
(2, 18, 'dsd', 'slider', NULL, NULL, NULL, NULL, '2020-12-12 05:25:52', '2020-12-12 05:25:52'),
(3, 18, 'kjlk', 'category', '/uploads/media_manager/3.png', 'image', '792x1738', '18', '2020-12-12 05:26:11', '2020-12-12 10:25:03'),
(4, 18, NULL, 'category', '/uploads/media_manager/4.png', 'image', '275x231', '15', '2020-12-12 06:14:02', '2020-12-12 06:14:02'),
(5, 18, 's', 'category', '/uploads/media_manager/5.png', 'image', '792x1738', '18', '2020-12-12 10:28:33', '2020-12-12 10:28:34'),
(6, 18, 'sds', 'category', '/uploads/media_manager/6.png', 'image', '517x156', '39', '2020-12-12 10:28:46', '2020-12-12 10:28:46'),
(7, 18, NULL, 'organization', '/uploads/media_manager/7.png', 'image', '275x231', '15', '2020-12-12 10:28:56', '2020-12-12 10:28:56'),
(8, 18, NULL, 'category', '/uploads/media_manager/8.png', 'image', '275x231', '15', '2020-12-12 10:30:35', '2020-12-12 10:30:35'),
(9, 18, NULL, 'category', '/uploads/media_manager/9.png', 'image', '84x84', '5', '2020-12-21 06:12:08', '2020-12-21 06:12:08'),
(10, 18, NULL, 'category', '/uploads/media_manager/10.png', 'image', '114x69', '3', '2020-12-21 06:12:39', '2020-12-21 06:12:39'),
(11, 18, NULL, 'category', '/uploads/media_manager/11.png', 'image', '116x82', '5', '2020-12-21 06:13:11', '2020-12-21 06:13:11'),
(12, 18, NULL, 'category', '/uploads/media_manager/12.png', 'image', '87x85', '8', '2020-12-21 06:13:28', '2020-12-21 06:13:28'),
(13, 18, NULL, 'category', '/uploads/media_manager/13.png', 'image', '89x79', '6', '2020-12-21 06:13:47', '2020-12-21 06:13:47'),
(14, 18, NULL, 'category', '/uploads/media_manager/14.png', 'image', '131x77', '3', '2020-12-21 06:14:04', '2020-12-21 06:14:04'),
(15, 18, NULL, 'category', '/uploads/media_manager/15.png', 'image', '126x94', '6', '2020-12-21 06:14:24', '2020-12-21 06:14:24'),
(16, 18, NULL, 'category', '/uploads/media_manager/16.png', 'image', '116x90', '5', '2020-12-21 06:14:55', '2020-12-21 06:14:55'),
(17, 18, NULL, 'category', '/uploads/media_manager/17.png', 'image', '125x62', '7', '2020-12-21 06:15:27', '2020-12-21 06:15:27'),
(18, 18, NULL, 'thumbnail', '/uploads/media_manager/18.jpg', 'image', '240x135', '13', '2020-12-21 06:35:49', '2020-12-21 06:35:49'),
(19, 21, NULL, 'thumbnail', '/uploads/media_manager/19.jpg', 'image', '240x135', '13', '2020-12-21 06:40:40', '2020-12-21 06:40:40'),
(20, 21, NULL, 'thumbnail', '/uploads/media_manager/20.jpg', 'image', '240x135', '16', '2020-12-21 06:48:09', '2020-12-21 06:48:09'),
(21, 18, NULL, 'thumbnail', '/uploads/media_manager/21.png', 'image', '700x318', '27', '2020-12-21 09:10:45', '2020-12-21 09:10:45'),
(22, 18, NULL, 'thumbnail', '/uploads/media_manager/22.jpeg', 'image', '1000x400', '72', '2020-12-21 09:10:56', '2020-12-21 09:10:56'),
(23, 18, NULL, 'thumbnail', '/uploads/media_manager/23.png', 'image', '700x241', '28', '2020-12-21 09:23:40', '2020-12-21 09:23:40'),
(24, 18, NULL, 'category', '/uploads/media_manager/24.png', 'image', '700x466', '539', '2020-12-21 09:23:52', '2020-12-21 09:23:52'),
(25, 18, NULL, 'thumbnail', '/uploads/media_manager/25.png', 'image', '600x402', '43', '2020-12-21 09:24:05', '2020-12-21 09:24:05'),
(26, 24, NULL, 'slider', '/uploads/media_manager/26.jpg', 'image', '5184x3456', '5207', '2021-03-29 14:42:14', '2021-03-29 14:42:24'),
(27, 24, NULL, 'thumbnail', '/uploads/media_manager/27.png', 'image', '256x256', '9', '2021-03-29 15:01:35', '2021-03-29 15:01:35'),
(28, 5, NULL, 'source_code', '/uploads/media_manager/28.png', 'image', '1024x683', '499', '2021-03-29 15:32:01', '2021-03-29 15:32:02'),
(29, 5, 'k', 'file', '/uploads/media_manager/29.jpeg', 'image', '1280x720', '293', '2021-03-30 04:53:06', '2021-03-30 04:53:06'),
(30, 5, NULL, 'file', '/uploads/media_manager/30.jpeg', 'image', '1280x720', '293', '2021-03-30 04:53:41', '2021-03-30 04:53:41'),
(31, 5, NULL, 'file', '/uploads/media_manager/31.jpeg', 'image', '1280x720', '293', '2021-03-30 04:54:08', '2021-03-30 04:54:08'),
(32, 5, 'IELTS', 'thumbnail', '/uploads/media_manager/32.png', 'image', '366x138', '10', '2021-04-05 18:17:51', '2021-04-05 18:17:51');

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meeting_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `owner_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_title` longtext COLLATE utf8mb4_unicode_ci,
  `start_time` datetime NOT NULL,
  `zoom_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_by` longtext COLLATE utf8mb4_unicode_ci,
  `type` longtext COLLATE utf8mb4_unicode_ci,
  `agenda` longtext COLLATE utf8mb4_unicode_ci,
  `course_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2020_02_18_053228_create_categories_table', 1),
(11, '2020_03_18_055630_create_languages_table', 1),
(12, '2020_03_18_085009_create_currencies_table', 1),
(13, '2020_03_18_101231_create_system_settings_table', 1),
(14, '2020_03_20_104650_create_packages_table', 1),
(15, '2020_03_20_104940_create_instructors_table', 1),
(16, '2020_03_20_105907_create_package_purchase_histories_table', 1),
(17, '2020_03_20_110758_create_courses_table', 1),
(18, '2020_03_20_115215_create_classes_table', 1),
(19, '2020_03_20_115803_create_class_contents_table', 1),
(20, '2020_03_20_120806_create_students_table', 1),
(21, '2020_03_20_121712_create_enrollments_table', 1),
(22, '2020_03_20_122043_create_carts_table', 1),
(23, '2020_03_20_123531_create_course_purchase_histories_table', 1),
(24, '2020_03_20_123839_create_wishlists_table', 1),
(25, '2020_03_20_124006_create_admin_earnings_table', 1),
(26, '2020_03_20_124108_create_support_tickets_table', 1),
(27, '2020_03_20_124319_create_support_ticket_replays_table', 1),
(28, '2020_04_01_045351_create_sliders_table', 1),
(29, '2020_04_03_082248_create_instructor_earnings_table', 1),
(30, '2020_04_14_032755_create_jobs_table', 1),
(31, '2020_04_17_061729_create_verify_users_table', 1),
(32, '2020_05_04_192324_create_seen_contents_table', 1),
(33, '2020_05_05_053312_create_api_password_resets_table', 1),
(34, '2020_05_05_074657_create_massages_table', 1),
(35, '2020_05_05_153038_create_course_comments_table', 1),
(36, '2020_05_12_131611_create_pages_table', 1),
(37, '2020_05_12_131737_create_page_contents_table', 1),
(38, '2020_05_14_093225_create_instructor_accounts_table', 1),
(39, '2020_05_14_093226_create_payments_table', 1),
(40, '2020_06_04_210613_create_notification_users_table', 1),
(41, '2020_07_22_091509_create_affiliates_table', 2),
(42, '2020_07_22_091735_create_student_accounts_table', 2),
(43, '2020_07_22_130558_create_affiliate_histories_table', 2),
(44, '2020_07_22_160131_create_affiliate_payments_table', 2),
(45, '2017_11_04_103444_create_laravel_logger_activity_table', 3),
(46, '2020_10_11_033846_create_media_managers_table', 3),
(47, '2020_10_18_094822_create_addons_table', 3),
(48, '2020_10_21_065301_create_zooms_table', 3),
(49, '2020_10_21_070224_create_meetings_table', 3),
(50, '2020_10_27_085339_create_quizzes_table', 3),
(51, '2020_10_28_060028_create_questions_table', 3),
(52, '2020_10_31_072548_create_quiz_scores_table', 3),
(53, '2020_11_04_084300_create_forums_table', 3),
(54, '2020_11_05_033142_create_post_replies_table', 3),
(55, '2020_11_05_053014_create_helpful_answers_table', 3),
(56, '2020_11_05_093812_create_forum_post_views_table', 3),
(57, '2020_11_07_034618_create_certificates_table', 3),
(58, '2020_11_07_103613_create_certificate_stores_table', 3),
(59, '2020_11_12_025008_create_subscriptions_table', 4),
(60, '2020_11_12_091519_create_subscription_courses_table', 5),
(61, '2020_11_12_092738_create_subscription_settings_table', 5),
(62, '2020_11_15_025521_create_subscription_enrollments_table', 5),
(63, '2020_11_15_041645_create_subscription_carts_table', 5),
(64, '2020_11_17_092014_create_instructor_subscription_payments_table', 6),
(65, '2020_11_17_131708_create_instructor_subscription_earnings_table', 6),
(66, '2020_11_19_093520_create_subscription_course_requests_table', 6),
(67, '2020_12_09_125134_create_know_abouts_table', 6),
(68, '2019_11_18_105032_create_pages_table', 7),
(69, '2019_11_18_105615_create_uploads_table', 7),
(70, '2020_04_18_064412_create_page_translations_table', 7),
(71, '2020_04_18_065546_create_settings_table', 7),
(73, '2020_12_10_152024_create_blogs_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `notification_users`
--

CREATE TABLE `notification_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_users`
--

INSERT INTO `notification_users` (`id`, `user_id`, `is_read`, `data`, `created_at`, `updated_at`) VALUES
(1, 5, 0, '{\"body\":\"The Complete Communication Skills Master Class for Life new course uploaded by amit\"}', '2021-03-29 15:35:56', '2021-03-29 15:35:56'),
(2, 5, 0, '{\"body\":\"amit profile updated \"}', '2021-03-30 18:05:51', '2021-03-30 18:05:51'),
(3, 5, 0, '{\"body\":\"amit profile updated \"}', '2021-03-30 18:06:42', '2021-03-30 18:06:42'),
(4, 5, 0, '{\"body\":\"amit profile updated \"}', '2021-03-30 18:06:47', '2021-03-30 18:06:47'),
(5, 5, 0, '{\"body\":\"amit profile updated \"}', '2021-03-30 18:07:04', '2021-03-30 18:07:04'),
(6, 5, 0, '{\"body\":\"What is articles new course uploaded by amit\"}', '2021-04-02 09:45:55', '2021-04-02 09:45:55'),
(7, 5, 0, '{\"body\":\"IELTS Level 3 new course uploaded by amit\"}', '2021-04-05 18:22:47', '2021-04-05 18:22:47'),
(8, 5, 0, '{\"body\":\"IELTS Level 3 new class uploaded by amit\"}', '2021-04-05 18:41:06', '2021-04-05 18:41:06'),
(9, 5, 0, '{\"body\":\"PTE Introduction new content uploaded by amit\"}', '2021-04-05 18:45:24', '2021-04-05 18:45:24');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `commission` double NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `image`, `price`, `commission`, `is_published`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'uploads/package/x1t7704KOJG6WYqqcMghQ5d0eIS3osh7MfJq6QvJ.jpeg', 0, 0, 1, NULL, '2020-06-09 09:49:18', '2020-06-10 14:02:54'),
(2, 'uploads/package/S5YUUuMRd7BLRP11SmhllvrgGaBoIwfImDS2VtcM.jpeg', 10, 20, 1, NULL, '2020-06-09 09:49:35', '2020-06-10 14:02:39'),
(3, 'uploads/package/aCRKkSZnF3IPWSsNMZ7eL1ZSePOmxdll0Gj7dqv1.jpeg', 30, 5, 1, NULL, '2020-06-10 01:55:32', '2020-06-10 14:02:31');

-- --------------------------------------------------------

--
-- Table structure for table `package_purchase_histories`
--

CREATE TABLE `package_purchase_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_purchase_histories`
--

INSERT INTO `package_purchase_histories` (`id`, `amount`, `payment_method`, `user_id`, `package_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 5, 1, NULL, '2020-12-20 11:26:08', '2020-12-20 11:26:08'),
(2, 0, NULL, 21, 1, NULL, '2020-12-21 06:37:08', '2020-12-21 06:37:08'),
(3, 0, NULL, 22, 1, NULL, '2020-12-21 07:12:31', '2020-12-21 07:12:31'),
(4, 0, NULL, 23, 1, NULL, '2020-12-21 07:34:31', '2020-12-21 07:34:31'),
(5, 0, NULL, 25, 1, NULL, '2021-03-30 18:10:14', '2021-03-30 18:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `slug` longtext COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_contents`
--

CREATE TABLE `page_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mehaktalwar.mt@gmail.com', '$2y$10$nIMQv/e./N6c5AOhUQ5MU.r69Dcw2/6b/6nGILy8/ZI9QO7FjDt5y', '2021-04-06 01:30:06');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `current_balance` double DEFAULT NULL,
  `process` enum('Bank','Paypal','Stripe') COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Request','Confirm') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_replies`
--

CREATE TABLE `post_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reply` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade` double(8,2) NOT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `user_id`, `quiz_id`, `question`, `grade`, `options`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 'what is articles', 2.00, '[{\"image\":null,\"index\":863138,\"correct\":\"false\",\"answer\":\"bla bla bla\"},{\"image\":null,\"index\":750295,\"correct\":\"false\",\"answer\":\"bla bla bla\"},{\"image\":null,\"index\":305746,\"correct\":\"false\",\"answer\":\"bla bla bla\"},{\"image\":null,\"index\":839796,\"correct\":\"false\",\"answer\":\"bla bla bla\"},{\"image\":null,\"index\":521542,\"correct\":\"false\",\"answer\":\"bla bla bla\"},{\"image\":null,\"index\":668773,\"correct\":\"false\",\"answer\":\"bla bla bla\"},{\"image\":null,\"index\":481040,\"correct\":\"false\",\"answer\":\"bla bla bla\"},{\"image\":null,\"index\":189469,\"correct\":\"false\",\"answer\":\"bla bla bla\"},{\"image\":null,\"index\":26398,\"correct\":\"false\",\"answer\":\"bla bla bla\"},{\"image\":null,\"index\":249188,\"correct\":\"false\",\"answer\":\"bla bla bla\"},{\"image\":null,\"index\":198785,\"correct\":\"false\",\"answer\":\"bla bla bla\"}]', 1, '2021-03-30 05:02:26', '2021-03-30 05:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_time` int(11) DEFAULT NULL,
  `pass_mark` double(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `number_of_attempts` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `name`, `user_id`, `course_id`, `quiz_time`, `pass_mark`, `status`, `number_of_attempts`, `created_at`, `updated_at`) VALUES
(2, 'English test 1', 5, 11, 10, 100.00, 1, NULL, '2021-03-30 05:01:04', '2021-03-30 05:01:04'),
(3, 'English test 1', 5, 11, 10, 100.00, 1, NULL, '2021-03-30 05:01:05', '2021-03-30 05:01:05');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_scores`
--

CREATE TABLE `quiz_scores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `minutes` int(11) NOT NULL,
  `score` double(8,2) NOT NULL,
  `wrong` double(8,2) NOT NULL,
  `right` double(8,2) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seen_contents`
--

CREATE TABLE `seen_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enroll_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `title`, `sub_title`, `url`, `is_published`, `created_at`, `updated_at`) VALUES
(1, '/uploads/media_manager/26.jpg', 'Learn things for a better & more open tomorrow', '10+ languages with top 1% teachers', 'http://thehappyindianstore.com/', 1, NULL, '2021-03-29 15:42:29');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tw` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linked` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `phone`, `address`, `about`, `image`, `fb`, `tw`, `linked`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'student', 'student@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, '2020-12-09 03:52:33', '2020-12-09 03:52:33'),
(2, 'Deepika', 'deepikaranalive@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, '2021-04-05 19:49:03', '2021-04-05 19:49:03'),
(3, 'Mehak Talwar', 'mehaktalwar.mt@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, '2021-04-05 19:58:36', '2021-04-05 19:58:36'),
(4, 'Ashish Rana', 'aroradeepi05@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, '2021-04-05 20:29:29', '2021-04-05 20:29:29');

-- --------------------------------------------------------

--
-- Table structure for table `student_accounts`
--

CREATE TABLE `student_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Bank',
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_number` int(11) DEFAULT NULL,
  `paypal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Paypal',
  `paypal_acc_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_acc_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Stripe',
  `stripe_acc_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_acc_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double DEFAULT NULL,
  `instructor_payment` double DEFAULT '0',
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `popular` tinyint(1) NOT NULL DEFAULT '0',
  `deactive` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `name`, `description`, `price`, `instructor_payment`, `duration`, `popular`, `deactive`, `created_at`, `updated_at`) VALUES
(1, 'Package one', '[\"This is for old student\"]', 0, NULL, 'Free', 1, 1, '2020-12-21 07:47:39', '2020-12-21 10:07:02'),
(2, 'Package tow', '[\"This is for new Student\"]', 10, 5, 'Weekly', 0, 1, '2020-12-21 07:48:15', '2020-12-21 07:49:05'),
(3, 'Package three', '[\"This is for any Student\"]', 20, 5, 'Monthly', 0, 1, '2020-12-21 07:48:56', '2020-12-21 07:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_carts`
--

CREATE TABLE `subscription_carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subscription_package` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_price` double NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_courses`
--

CREATE TABLE `subscription_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_courses`
--

INSERT INTO `subscription_courses` (`id`, `subscription_duration`, `course_id`, `user_id`, `is_published`, `created_at`, `updated_at`) VALUES
(1, '\"[\\\"Free\\\",\\\"Weekly\\\",\\\"Monthly\\\"]\"', 2, 5, 1, '2020-12-21 08:51:22', '2020-12-21 08:56:59'),
(2, '\"[\\\"Monthly\\\"]\"', 9, 5, 1, '2020-12-21 09:00:19', '2020-12-21 09:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_course_requests`
--

CREATE TABLE `subscription_course_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subscription_duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_course_requests`
--

INSERT INTO `subscription_course_requests` (`id`, `course_id`, `user_id`, `subscription_duration`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 5, 'Free', NULL, '2020-12-21 07:49:46', '2020-12-21 07:49:46'),
(2, 2, 5, 'Weekly', NULL, '2020-12-21 07:49:47', '2020-12-21 07:49:47'),
(3, 2, 5, 'Monthly', NULL, '2020-12-21 07:49:50', '2020-12-21 07:49:50'),
(4, 9, 5, 'Free', NULL, '2020-12-21 07:49:51', '2020-12-21 07:49:51'),
(5, 9, 5, 'Weekly', NULL, '2020-12-21 07:49:52', '2020-12-21 07:49:52'),
(6, 9, 5, 'Monthly', NULL, '2020-12-21 07:49:52', '2020-12-21 07:49:52');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_enrollments`
--

CREATE TABLE `subscription_enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_package` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_price` double NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_enrollments`
--

INSERT INTO `subscription_enrollments` (`id`, `subscription_package`, `subscription_price`, `user_id`, `start_at`, `end_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Free', 0, 19, '2020-12-21 16:23:10', '2020-12-21 16:08:39', NULL, '2020-12-21 10:23:10', '2020-12-21 10:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_settings`
--

CREATE TABLE `subscription_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_settings`
--

INSERT INTO `subscription_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(9, 'enable_instructor_request', '0', NULL, '2020-12-21 07:41:27'),
(10, 'enable_all_course', '1', NULL, '2020-12-21 07:41:27'),
(11, 'enable_free_trial', '1', NULL, '2020-12-21 07:41:27'),
(12, 'payment_schedule', 'Monthly', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `replay_count` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_replays`
--

CREATE TABLE `support_ticket_replays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'default_currencies', '1', NULL, NULL),
(2, 'type_logo', 'uploads/site/EL1ckCmK6hO20i0nIyySfChx4WB0yFuwIE65F8p5.png', NULL, '2021-03-30 18:25:32'),
(3, 'type_name', 'Languafina', NULL, '2021-03-29 14:46:12'),
(4, 'type_footer', 'Languafina', NULL, '2021-03-29 15:10:23'),
(5, 'type_mail', 'info@languafina.com', NULL, '2021-03-29 14:46:12'),
(6, 'type_address', 'Mohali, India', NULL, '2021-03-30 18:34:13'),
(7, 'type_fb', 'https://www.facebook.com/langua.fina/', NULL, '2021-04-01 22:10:58'),
(8, 'type_tw', 'https://twitter.com/FinaLangua', NULL, '2021-04-01 22:10:58'),
(9, 'type_number', '+91 9779787700', NULL, '2021-04-01 22:10:58'),
(10, 'type_google', 'https://www.instagram.com/languafina/', NULL, '2021-04-01 22:10:58'),
(11, 'footer_logo', 'uploads/site/4Canjr4Uw7vqdcKEi0B3LiUVWNlhsK1oGRsMidPJ.png', NULL, '2021-03-30 18:32:16'),
(12, 'favicon_icon', 'uploads/site/PnriqpU3BcmW4WHY3xIEPZdRYAFEzHCTERJ6hCd4.png', NULL, '2021-03-30 18:32:16'),
(13, 'default_currencies', '1', NULL, NULL),
(14, 'type_logo', '', NULL, NULL),
(15, 'type_name', '', NULL, NULL),
(16, 'type_footer', '', NULL, NULL),
(17, 'type_mail', '', NULL, NULL),
(18, 'type_address', '', NULL, NULL),
(19, 'type_fb', '', NULL, NULL),
(20, 'type_tw', '', NULL, NULL),
(21, 'type_number', '', NULL, NULL),
(22, 'type_google', '', NULL, NULL),
(23, 'footer_logo', '', NULL, NULL),
(24, 'favicon_icon', '', NULL, NULL),
(25, 'affiliate', 'Active', NULL, '2021-03-29 14:48:03'),
(26, 'commission', '1', NULL, NULL),
(27, 'withdraw_limit', '10', NULL, NULL),
(28, 'cookies_limit', '10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `slug`, `version`, `activated`, `image`, `created_at`, `updated_at`) VALUES
(1, 'frontend', 'frontend', '1.0', 0, 'default_banner.jpg', '2020-12-20 10:19:39', '2020-12-21 07:09:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` enum('Student','Instructor','Admin') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'uploads/user/user.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zoom_email` longtext COLLATE utf8mb4_unicode_ci,
  `jwt_token` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `slug`, `email`, `user_type`, `email_verified_at`, `verified`, `password`, `banned`, `provider_id`, `image`, `remember_token`, `created_at`, `updated_at`, `zoom_email`, `jwt_token`) VALUES
(5, 'amit', 'amit1', 'amitshrma22@gmail.com', 'Instructor', NULL, 1, '$2y$10$FCz2E7MX6dUHTfuY6Ti9ueO31RQNOLdy8WTsye0IoJHYT7cWPg97S', 0, NULL, 'uploads/instructor/871P0pOWCBD6M27oMG5Y5Sj49FQ1zVlm8oCAWgd5.jpg', 'uw6VWa0uTOgau9UDQpuCXUNqlvacLlOBikzTlRnHwKsH5NdJB2RFSpEVw3De', '2020-06-10 04:08:06', '2021-03-30 18:07:04', NULL, NULL),
(19, 'STUDENT', 'student', 'student@mail.com', 'Student', NULL, 1, '$2y$10$Y7fwyZA3C/8LV2/6SfHbieNiojqBjZK4UTLkmjcnrejgvy0dJ4Au.', 0, NULL, 'uploads/user/user.png', NULL, '2020-12-09 03:52:33', '2020-12-09 03:52:33', NULL, NULL),
(21, 'Rumon', 'rumon', 'rumon@mail.com', 'Instructor', NULL, 1, '$2y$10$9HW9tP5Z.jPMX5m6rDGcgORWCAtLVcQaszr9MtxuhgKWS8o5EzRaS', 0, NULL, 'uploads/instructor/ZguHDula9P98arVGlSHNKhsp1SMZLaXFSfE6VmKj.jpg', NULL, '2020-12-21 06:37:08', '2021-04-05 19:14:51', NULL, NULL),
(22, 'Prince', 'prince', 'prince@mail.com', 'Instructor', NULL, 1, '$2y$10$fRFX3/gPCa23MjiyRoLTnOipA1YkKaAHKreLm.bLbKoKnReHrVupm', 0, NULL, 'uploads/instructor/G1v5q9RkbF9Qz8FbygQZpMoF6vDKWSotKwXvEdZw.jpg', NULL, '2020-12-21 07:12:31', '2020-12-21 07:13:57', NULL, NULL),
(23, 'Azharul Islam Naeem', 'azharul-islam-naeem', 'naeem@mail.com', 'Instructor', NULL, 1, '$2y$10$KbYqaGH11Qje5MwJ6ajQlOJRGwYFdULHMSu7H/gGzk/J.bwOXOmiu', 1, NULL, 'uploads/instructor/NC77i2wPd5e4s1OhlLBaKr5u95ifOMaeiHuNfOiu.jpg', NULL, '2020-12-21 07:34:31', '2021-03-30 18:16:12', NULL, NULL),
(24, 'admin', 'admin', 'admin@gmail.com', 'Admin', NULL, 1, '$2y$10$IbideAKIUBIzES0x71Oabuj6dimBJIsFqlLvd.fdyAsfLESh2BQyW', 0, NULL, 'uploads/user/user.png', 'tk1gFz91EIFOZpBUpGBz8hlm92UfdFd3UsUewzkhnYGP08yr4KPqE54ougQe', '2021-03-28 13:38:06', '2021-03-28 13:38:06', NULL, NULL),
(25, 'puneet', 'puneet', 'design.lukee@gmail.com', 'Instructor', NULL, 0, '$2y$10$KudHo2cGWxZ2MFLtq0yXQ.n3068pcqXpnQefhTcUPLLuHtWBWmFbO', 0, NULL, 'uploads/user/user.png', 'ShTKKHvyYHMv5OWDvMQVhEkk9c832aLJwpNvxWhJYR6NEZvblOR8AbDneZsA', '2021-03-30 18:10:14', '2021-03-30 18:10:14', NULL, NULL),
(26, 'Puneet Chaudhary', 'puneet-chaudhary', 'pcadmin@gmail.com', 'Admin', NULL, 0, '$2y$10$kjHXqnNI3FVb7Tad0GKZp.ciWy9J2ZKe6NMFkcknb73.ZZKn2/uN6', 0, NULL, 'uploads/user/user.png', NULL, '2021-04-05 19:13:22', '2021-04-05 19:13:22', NULL, NULL),
(27, 'Deepika', 'deepika', 'deepikaranalive@yahoo.com', 'Student', NULL, 0, '$2y$10$yRuotOvVy/f95wHDdxTktOby.r0scWx5jTMrGg8/7NjFF.CT1Dusq', 0, NULL, 'uploads/user/user.png', NULL, '2021-04-05 19:49:03', '2021-04-05 19:49:03', NULL, NULL),
(28, 'Mehak Talwar', 'mehak-talwar', 'mehaktalwar.mt@gmail.com', 'Student', NULL, 0, '$2y$10$/5yqOTcNzOtmm8cHEQYfOu7zlEYjZu7eJLaHfFUIddoIau6GU19iq', 0, NULL, 'uploads/user/user.png', NULL, '2021-04-05 19:58:36', '2021-04-05 19:58:36', NULL, NULL),
(29, 'Ashish Rana', 'ashish-rana', 'aroradeepi05@gmail.com', 'Student', NULL, 0, '$2y$10$hoHGNPqDP3V7b3awGL5LQ.NPqaIHu5EFw6lwa3SnSy/2OxX8.drfe', 0, NULL, 'uploads/user/user.png', NULL, '2021-04-05 20:29:29', '2021-04-05 20:29:29', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verify_users`
--

CREATE TABLE `verify_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verify_users`
--

INSERT INTO `verify_users` (`id`, `user_id`, `token`, `created_at`, `updated_at`) VALUES
(1, 19, 'cbc75259022e1fd336f2c28b82b926e78ea5e1d3', '2020-12-09 03:53:09', '2020-12-09 03:53:09'),
(2, 25, '15e49c34f06d5a94afe3c316266f851901c9dce3', '2021-03-30 18:12:18', '2021-03-30 18:12:18'),
(3, 26, '254574784c187d55b95ed26b541e495e15e9aef8', '2021-04-05 19:13:22', '2021-04-05 19:13:22'),
(4, 27, '7e7ef9ba0fcf73d51591277813f74eccca287d83', '2021-04-05 19:57:26', '2021-04-05 19:57:26'),
(5, 28, '1b44c36459c78700c10506d7e113b762f97a6ce1', '2021-04-05 20:06:46', '2021-04-05 20:06:46');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_price` double DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zooms`
--

CREATE TABLE `zooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_earnings`
--
ALTER TABLE `admin_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliates`
--
ALTER TABLE `affiliates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_password_resets`
--
ALTER TABLE `api_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_password_resets_email_index` (`email`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_course_id_foreign` (`course_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificate_stores`
--
ALTER TABLE `certificate_stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_course_id_foreign` (`course_id`);

--
-- Indexes for table `class_contents`
--
ALTER TABLE `class_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_contents_class_id_foreign` (`class_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courses_slug_unique` (`slug`),
  ADD KEY `courses_user_id_foreign` (`user_id`),
  ADD KEY `courses_category_id_foreign` (`category_id`);

--
-- Indexes for table `course_comments`
--
ALTER TABLE `course_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_comments_course_id_foreign` (`course_id`),
  ADD KEY `course_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `course_purchase_histories`
--
ALTER TABLE `course_purchase_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_purchase_histories_enrollment_id_foreign` (`enrollment_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollments_course_id_foreign` (`course_id`),
  ADD KEY `enrollments_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_post_views`
--
ALTER TABLE `forum_post_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helpful_answers`
--
ALTER TABLE `helpful_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `instructors_email_unique` (`email`),
  ADD KEY `instructors_package_id_foreign` (`package_id`),
  ADD KEY `instructors_user_id_foreign` (`user_id`);

--
-- Indexes for table `instructor_accounts`
--
ALTER TABLE `instructor_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instructor_accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `instructor_earnings`
--
ALTER TABLE `instructor_earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instructor_earnings_enrollment_id_foreign` (`enrollment_id`),
  ADD KEY `instructor_earnings_package_id_foreign` (`package_id`),
  ADD KEY `instructor_earnings_user_id_foreign` (`user_id`);

--
-- Indexes for table `instructor_subscription_earnings`
--
ALTER TABLE `instructor_subscription_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructor_subscription_payments`
--
ALTER TABLE `instructor_subscription_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `know_abouts`
--
ALTER TABLE `know_abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laravel_logger_activity`
--
ALTER TABLE `laravel_logger_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `massages`
--
ALTER TABLE `massages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `massages_enroll_id_foreign` (`enroll_id`),
  ADD KEY `massages_user_id_foreign` (`user_id`);

--
-- Indexes for table `media_managers`
--
ALTER TABLE `media_managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_users`
--
ALTER TABLE `notification_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_purchase_histories`
--
ALTER TABLE `package_purchase_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_purchase_histories_user_id_foreign` (`user_id`),
  ADD KEY `package_purchase_histories_package_id_foreign` (`package_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_contents`
--
ALTER TABLE `page_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_contents_page_id_foreign` (`page_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_account_id_foreign` (`account_id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `post_replies`
--
ALTER TABLE `post_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_scores`
--
ALTER TABLE `quiz_scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seen_contents`
--
ALTER TABLE `seen_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seen_contents_enroll_id_foreign` (`enroll_id`),
  ADD KEY `seen_contents_course_id_foreign` (`course_id`),
  ADD KEY `seen_contents_class_id_foreign` (`class_id`),
  ADD KEY `seen_contents_content_id_foreign` (`content_id`),
  ADD KEY `seen_contents_user_id_foreign` (`user_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD KEY `students_user_id_foreign` (`user_id`);

--
-- Indexes for table `student_accounts`
--
ALTER TABLE `student_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_carts`
--
ALTER TABLE `subscription_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_courses`
--
ALTER TABLE `subscription_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_course_requests`
--
ALTER TABLE `subscription_course_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_enrollments`
--
ALTER TABLE `subscription_enrollments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_settings`
--
ALTER TABLE `subscription_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_tickets_user_id_foreign` (`user_id`);

--
-- Indexes for table `support_ticket_replays`
--
ALTER TABLE `support_ticket_replays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_ticket_replays_ticket_id_foreign` (`ticket_id`),
  ADD KEY `support_ticket_replays_user_id_foreign` (`user_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `verify_users`
--
ALTER TABLE `verify_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_course_id_foreign` (`course_id`);

--
-- Indexes for table `zooms`
--
ALTER TABLE `zooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `admin_earnings`
--
ALTER TABLE `admin_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliates`
--
ALTER TABLE `affiliates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_password_resets`
--
ALTER TABLE `api_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `certificate_stores`
--
ALTER TABLE `certificate_stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `class_contents`
--
ALTER TABLE `class_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `course_comments`
--
ALTER TABLE `course_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_purchase_histories`
--
ALTER TABLE `course_purchase_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forums`
--
ALTER TABLE `forums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_post_views`
--
ALTER TABLE `forum_post_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `helpful_answers`
--
ALTER TABLE `helpful_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `instructor_accounts`
--
ALTER TABLE `instructor_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructor_earnings`
--
ALTER TABLE `instructor_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructor_subscription_earnings`
--
ALTER TABLE `instructor_subscription_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructor_subscription_payments`
--
ALTER TABLE `instructor_subscription_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `know_abouts`
--
ALTER TABLE `know_abouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `laravel_logger_activity`
--
ALTER TABLE `laravel_logger_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6138;

--
-- AUTO_INCREMENT for table `massages`
--
ALTER TABLE `massages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_managers`
--
ALTER TABLE `media_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `notification_users`
--
ALTER TABLE `notification_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_purchase_histories`
--
ALTER TABLE `package_purchase_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_contents`
--
ALTER TABLE `page_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_replies`
--
ALTER TABLE `post_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quiz_scores`
--
ALTER TABLE `quiz_scores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seen_contents`
--
ALTER TABLE `seen_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_accounts`
--
ALTER TABLE `student_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscription_carts`
--
ALTER TABLE `subscription_carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_courses`
--
ALTER TABLE `subscription_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscription_course_requests`
--
ALTER TABLE `subscription_course_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subscription_enrollments`
--
ALTER TABLE `subscription_enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscription_settings`
--
ALTER TABLE `subscription_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_replays`
--
ALTER TABLE `support_ticket_replays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `verify_users`
--
ALTER TABLE `verify_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zooms`
--
ALTER TABLE `zooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_contents`
--
ALTER TABLE `class_contents`
  ADD CONSTRAINT `class_contents_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_comments`
--
ALTER TABLE `course_comments`
  ADD CONSTRAINT `course_comments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
