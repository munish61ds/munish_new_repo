-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 16, 2021 at 01:38 AM
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
-- Database: `languafina`
--

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_tests`
--

DROP TABLE IF EXISTS `evaluation_tests`;
CREATE TABLE IF NOT EXISTS `evaluation_tests` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `test_time` int(11) DEFAULT NULL,
  `pass_mark` double(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `number_of_attempts` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `evaluation_tests`
--

INSERT INTO `evaluation_tests` (`id`, `name`, `user_id`, `category_id`, `test_time`, `pass_mark`, `status`, `number_of_attempts`, `created_at`, `updated_at`) VALUES
(1, 'Test TEE 1', 24, 1, 60, 55.00, 1, NULL, '2021-04-15 16:45:12', '2021-04-15 16:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_test_categories`
--

DROP TABLE IF EXISTS `evaluation_test_categories`;
CREATE TABLE IF NOT EXISTS `evaluation_test_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `evaluation_test_categories`
--

INSERT INTO `evaluation_test_categories` (`id`, `name`, `slug`, `icon`, `active_status`, `created_at`, `updated_at`) VALUES
(1, 'General test', 'general-test', NULL, NULL, '2021-04-15 16:44:43', '2021-04-15 16:44:43');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_test_questions`
--

DROP TABLE IF EXISTS `evaluation_test_questions`;
CREATE TABLE IF NOT EXISTS `evaluation_test_questions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `test_id` bigint(20) UNSIGNED NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade` double(8,2) NOT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `evaluation_test_questions`
--

INSERT INTO `evaluation_test_questions` (`id`, `user_id`, `test_id`, `question`, `grade`, `options`, `status`, `created_at`, `updated_at`) VALUES
(1, 24, 1, 'Question 1', 1.00, '[{\"image\":null,\"index\":\"358082\",\"correct\":\"true\",\"answer\":\"answer 1\"},{\"image\":null,\"index\":\"382865\",\"correct\":\"false\",\"answer\":\"answer 2\"},{\"image\":null,\"index\":\"405743\",\"correct\":\"false\",\"answer\":\"answer 3\"}]', 1, '2021-04-15 16:53:26', '2021-04-15 17:30:35'),
(2, 24, 1, 'Question 2', 1.00, '[{\"image\":null,\"index\":230899,\"correct\":\"false\",\"answer\":\"answer1\"},{\"image\":null,\"index\":357378,\"correct\":\"true\",\"answer\":\"answer2\"},{\"image\":null,\"index\":584200,\"correct\":\"false\",\"answer\":\"answer3\"}]', 1, '2021-04-15 17:29:55', '2021-04-15 17:29:55');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_test_results`
--

DROP TABLE IF EXISTS `evaluation_test_results`;
CREATE TABLE IF NOT EXISTS `evaluation_test_results` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `results` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `evaluation_test_results`
--

INSERT INTO `evaluation_test_results` (`id`, `user_id`, `test_id`, `results`, `attributes`, `created_at`, `updated_at`) VALUES
(3, 5, 1, '[{\"q_id\":1,\"is_corr\":false},{\"q_id\":2,\"is_corr\":false}]', '{\"eligible\": 0}', '2021-04-15 20:05:40', '2021-04-16 01:22:48');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
CREATE TABLE IF NOT EXISTS `instructors` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `about` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `signature` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `evaluation_test` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic',
  PRIMARY KEY (`id`),
  UNIQUE KEY `instructors_email_unique` (`email`),
  KEY `instructors_package_id_foreign` (`package_id`),
  KEY `instructors_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`id`, `name`, `email`, `phone`, `address`, `image`, `balance`, `linked`, `fb`, `tw`, `skype`, `about`, `package_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`, `signature`, `attributes`, `evaluation_test`, `type`) VALUES
(3, 'amit', 'amitshrma22@gmail.com', '09888555806', 'H#20, R#20, Address City, Town', 'uploads/instructor/871P0pOWCBD6M27oMG5Y5Sj49FQ1zVlm8oCAWgd5.jpg', 7695, 'https://www.linkedin.com/', 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.skypee.com/', 'This is my about us section.', 1, 5, NULL, '2020-06-10 04:08:06', '2021-04-16 04:40:36', NULL, NULL, 1, 'pro'),
(8, 'rumon', 'rumon@mail.com', NULL, NULL, 'uploads/instructor/ZguHDula9P98arVGlSHNKhsp1SMZLaXFSfE6VmKj.jpg', 0, NULL, NULL, NULL, NULL, NULL, 1, 21, NULL, '2020-12-21 06:37:08', '2020-12-21 08:06:24', NULL, NULL, 0, 'basic'),
(9, 'prince', 'prince@mail.com', NULL, NULL, 'uploads/instructor/G1v5q9RkbF9Qz8FbygQZpMoF6vDKWSotKwXvEdZw.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 22, NULL, '2020-12-21 07:12:31', '2021-04-16 04:27:28', NULL, NULL, 0, 'pro'),
(10, 'Azharul Islam Naeem', 'naeem@mail.com', NULL, NULL, 'uploads/instructor/NC77i2wPd5e4s1OhlLBaKr5u95ifOMaeiHuNfOiu.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 23, NULL, '2020-12-21 07:34:31', '2020-12-21 07:35:28', NULL, NULL, 0, 'basic'),
(11, 'puneet', 'design.lukee@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 25, NULL, '2021-03-30 18:10:14', '2021-04-16 04:27:26', NULL, NULL, 0, 'pro'),
(12, 'Clark Estes', 'hihiq@mailinator.com', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 31, NULL, '2021-04-08 18:57:14', '2021-04-16 04:27:26', NULL, NULL, 1, 'pro'),
(13, 'Malik Lara', 'qimomuwopi@mailinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 32, NULL, '2021-04-08 19:06:32', '2021-04-16 04:27:25', NULL, NULL, 0, 'pro'),
(14, 'Joshua Mullen', 'hijisasiny@mailinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, '2021-04-12 16:13:45', '2021-04-12 16:13:45', NULL, '{\"saluation\":\"mr\",\"first_name\":\"Joshua\",\"middle_name\":\"Eagan Campos\",\"last_name\":\"Mullen\",\"gender\":\"female\",\"dob\":\"2000-05-17\",\"phone_number\":\"+1 (418) 653-5736\",\"state\":\"Japan\",\"pin_code\":\"Elit ea sed quibusd\",\"city\":\"In deleniti nihil ve\",\"sub_address1\":\"921 Second Street\",\"sub_address2\":\"Deleniti ad adipisic\",\"qualification\":[{\"degree_type\":\"doctoral_degree\",\"year_of_passing\":\"2019-11-21\",\"board\":\"Pariatur Facere ess\",\"percentage\":\"64\"}],\"work_experiance\":[{\"company_name\":\"Buckner Craig Inc\",\"title\":\"Officiis voluptatibu\",\"tenure\":\"1to2\"}],\"agree_ev_test\":\"1\",\"agree_terms_cond\":\"1\"}', 0, 'basic'),
(15, 'Nyssa Macias', 'xuvajafu@mailinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, '2021-04-12 16:14:23', '2021-04-12 16:14:23', NULL, '{\"saluation\":\"mr\",\"first_name\":\"Nyssa\",\"middle_name\":\"Zachary Glass\",\"last_name\":\"Macias\",\"gender\":\"male\",\"dob\":\"2021-08-14\",\"phone_number\":\"+1 (418) 653-5736\",\"state\":\"Afghanistan\",\"pin_code\":\"Elit ea sed quibusd\",\"city\":\"In deleniti nihil ve\",\"sub_address1\":\"921 Second Street\",\"sub_address2\":\"Deleniti ad adipisic\",\"qualification\":[{\"degree_type\":\"associate_degree\",\"year_of_passing\":\"1984-01-14\",\"board\":\"Sed minus aut amet\",\"percentage\":\"19\"}],\"work_experiance\":[{\"company_name\":\"Reed Petty Trading\",\"title\":\"Laborum Est non in\",\"tenure\":\"5to10\"}],\"agree_ev_test\":\"1\",\"agree_terms_cond\":\"1\"}', 0, 'basic'),
(16, 'Ria House', 'sawed@mailinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, '2021-04-12 16:17:31', '2021-04-12 16:17:31', NULL, '{\"saluation\":\"mr\",\"first_name\":\"Ria\",\"middle_name\":\"Finn Howell\",\"last_name\":\"House\",\"gender\":\"male\",\"dob\":\"2020-10-24\",\"phone_number\":\"+1 (599) 673-7211\",\"state\":\"Eritrea\",\"pin_code\":\"Sint vero sit persp\",\"city\":\"Vel nihil accusamus\",\"sub_address1\":\"574 South Rocky First Boulevard\",\"sub_address2\":\"Ut voluptatum sint q\",\"qualification\":[{\"degree_type\":\"bachelor_degree\",\"year_of_passing\":\"1975-02-16\",\"board\":\"Aspernatur modi eos\",\"percentage\":\"30\"}],\"work_experiance\":[{\"company_name\":\"Beard and Bray Inc\",\"title\":\"Totam cumque qui imp\",\"tenure\":\"5to10\"}],\"agree_ev_test\":\"1\",\"agree_terms_cond\":\"1\"}', 0, 'basic'),
(17, 'Hector Burks', 'ahmedsk128@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, NULL, '2021-04-12 16:20:06', '2021-04-16 04:27:14', NULL, '{\"saluation\":\"ms\",\"first_name\":\"Hector\",\"middle_name\":\"Nicholas Flynn\",\"last_name\":\"Burks\",\"gender\":\"male\",\"dob\":\"1982-08-13\",\"phone_number\":\"+1 (885) 128-1205\",\"state\":\"Georgia\",\"pin_code\":\"Eligendi nobis dicta\",\"city\":\"Perspiciatis eos as\",\"sub_address1\":\"387 Clarendon Avenue\",\"sub_address2\":\"Dolore reprehenderit\",\"qualification\":[{\"degree_type\":\"master_degree\",\"year_of_passing\":\"2000-10-08\",\"board\":\"Nobis praesentium ei\",\"percentage\":\"97\"}],\"work_experiance\":[{\"company_name\":\"Fletcher Roberson Associates\",\"title\":\"Nisi in obcaecati se\",\"tenure\":\"2to5\"}],\"agree_ev_test\":\"1\",\"agree_terms_cond\":\"1\"}', 0, 'pro');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
