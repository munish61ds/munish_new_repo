-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 12, 2021 at 05:18 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `languafina_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `linked` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tw` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `package_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`id`, `name`, `email`, `phone`, `address`, `image`, `balance`, `linked`, `fb`, `tw`, `skype`, `about`, `package_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`, `signature`) VALUES
(3, 'amit', 'amitshrma22@gmail.com', '09888555806', 'H#20, R#20, Address City, Town', 'uploads/instructor/871P0pOWCBD6M27oMG5Y5Sj49FQ1zVlm8oCAWgd5.jpg', 331, 'https://www.linkedin.com/', 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.skypee.com/', 'This is my about us section.', 1, 5, NULL, '2020-06-10 04:08:06', '2021-03-30 18:07:04', NULL),
(8, 'rumon', 'rumon@mail.com', NULL, NULL, 'uploads/instructor/ZguHDula9P98arVGlSHNKhsp1SMZLaXFSfE6VmKj.jpg', 0, NULL, NULL, NULL, NULL, NULL, 1, 21, NULL, '2020-12-21 06:37:08', '2020-12-21 08:06:24', NULL),
(9, 'prince', 'prince@mail.com', NULL, NULL, 'uploads/instructor/G1v5q9RkbF9Qz8FbygQZpMoF6vDKWSotKwXvEdZw.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 22, NULL, '2020-12-21 07:12:31', '2020-12-21 07:13:57', NULL),
(10, 'Azharul Islam Naeem', 'naeem@mail.com', NULL, NULL, 'uploads/instructor/NC77i2wPd5e4s1OhlLBaKr5u95ifOMaeiHuNfOiu.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 23, NULL, '2020-12-21 07:34:31', '2020-12-21 07:35:28', NULL),
(11, 'puneet', 'design.lukee@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 25, NULL, '2021-03-30 18:10:14', '2021-03-30 18:10:14', NULL),
(12, 'Clark Estes', 'hihiq@mailinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 31, NULL, '2021-04-08 18:57:14', '2021-04-08 18:57:14', NULL),
(13, 'Malik Lara', 'qimomuwopi@mailinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 32, NULL, '2021-04-08 19:06:32', '2021-04-08 19:06:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `title`, `sub_title`, `url`, `is_published`, `attributes`, `created_at`, `updated_at`) VALUES
(1, '/uploads/media_manager/26.jpg', 'Learn things for a better & more open tomorrow & forever', '10+ languages with top 1% teachers', 'http://thehappyindianstore.com/', 1, '{\"have_button\":{\"status\":0,\"content\":\"Create your account now\",\"link\":\"\\/signup\"}}', NULL, '2021-04-09 17:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` enum('Student','Instructor','Admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'uploads/user/user.png',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zoom_email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jwt_token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `slug`, `email`, `user_type`, `email_verified_at`, `verified`, `password`, `banned`, `provider_id`, `image`, `remember_token`, `created_at`, `updated_at`, `zoom_email`, `jwt_token`) VALUES
(5, 'amit', 'amit1', 'amitshrma22@gmail.com', 'Instructor', NULL, 1, '$2y$10$FCz2E7MX6dUHTfuY6Ti9ueO31RQNOLdy8WTsye0IoJHYT7cWPg97S', 0, NULL, 'uploads/instructor/871P0pOWCBD6M27oMG5Y5Sj49FQ1zVlm8oCAWgd5.jpg', 'uw6VWa0uTOgau9UDQpuCXUNqlvacLlOBikzTlRnHwKsH5NdJB2RFSpEVw3De', '2020-06-10 04:08:06', '2021-03-30 18:07:04', NULL, NULL),
(19, 'STUDENT', 'student', 'student@gmail.com', 'Student', NULL, 1, '$2y$12$8ZE63ZhpEDgD18DLct7m.OEU7isISAaT0EP7yWDM1mfUscVrefVaC', 0, NULL, 'uploads/user/user.png', NULL, '2020-12-09 03:52:33', '2020-12-09 03:52:33', NULL, NULL),
(21, 'Rumon', 'rumon', 'rumon@mail.com', 'Instructor', NULL, 1, '$2y$10$9HW9tP5Z.jPMX5m6rDGcgORWCAtLVcQaszr9MtxuhgKWS8o5EzRaS', 0, NULL, 'uploads/instructor/ZguHDula9P98arVGlSHNKhsp1SMZLaXFSfE6VmKj.jpg', NULL, '2020-12-21 06:37:08', '2021-04-05 19:14:51', NULL, NULL),
(22, 'Prince', 'prince', 'prince@mail.com', 'Instructor', NULL, 1, '$2y$10$fRFX3/gPCa23MjiyRoLTnOipA1YkKaAHKreLm.bLbKoKnReHrVupm', 0, NULL, 'uploads/instructor/G1v5q9RkbF9Qz8FbygQZpMoF6vDKWSotKwXvEdZw.jpg', NULL, '2020-12-21 07:12:31', '2020-12-21 07:13:57', NULL, NULL),
(23, 'Azharul Islam Naeem', 'azharul-islam-naeem', 'naeem@mail.com', 'Instructor', NULL, 1, '$2y$10$KbYqaGH11Qje5MwJ6ajQlOJRGwYFdULHMSu7H/gGzk/J.bwOXOmiu', 1, NULL, 'uploads/instructor/NC77i2wPd5e4s1OhlLBaKr5u95ifOMaeiHuNfOiu.jpg', NULL, '2020-12-21 07:34:31', '2021-03-30 18:16:12', NULL, NULL),
(24, 'admin', 'admin', 'admin@gmail.com', 'Admin', NULL, 1, '$2y$12$y2GNYpeyre8/Zs.9Q/T1IO.QPRkfbp6VuOnEhC.IY37FarPlBpFIO', 0, NULL, 'uploads/user/user.png', 'tK9jEG8exRoVoKbtaUiSsKz4RXNO9CIMD4TX8x2L1xTGR3y5hlE8S6ebyl5D', '2021-03-28 13:38:06', '2021-03-28 13:38:06', NULL, NULL),
(25, 'puneet', 'puneet', 'design.lukee@gmail.com', 'Instructor', NULL, 0, '$2y$10$KudHo2cGWxZ2MFLtq0yXQ.n3068pcqXpnQefhTcUPLLuHtWBWmFbO', 0, NULL, 'uploads/user/user.png', 'ShTKKHvyYHMv5OWDvMQVhEkk9c832aLJwpNvxWhJYR6NEZvblOR8AbDneZsA', '2021-03-30 18:10:14', '2021-03-30 18:10:14', NULL, NULL),
(26, 'Puneet Chaudhary', 'puneet-chaudhary', 'pcadmin@gmail.com', 'Admin', NULL, 0, '$2y$10$kjHXqnNI3FVb7Tad0GKZp.ciWy9J2ZKe6NMFkcknb73.ZZKn2/uN6', 0, NULL, 'uploads/user/user.png', NULL, '2021-04-05 19:13:22', '2021-04-05 19:13:22', NULL, NULL),
(27, 'Deepika', 'deepika', 'deepikaranalive@yahoo.com', 'Student', NULL, 0, '$2y$10$yRuotOvVy/f95wHDdxTktOby.r0scWx5jTMrGg8/7NjFF.CT1Dusq', 0, NULL, 'uploads/user/user.png', NULL, '2021-04-05 19:49:03', '2021-04-05 19:49:03', NULL, NULL),
(28, 'Mehak Talwar', 'mehak-talwar', 'mehaktalwar.mt@gmail.com', 'Student', NULL, 0, '$2y$10$/5yqOTcNzOtmm8cHEQYfOu7zlEYjZu7eJLaHfFUIddoIau6GU19iq', 0, NULL, 'uploads/user/user.png', NULL, '2021-04-05 19:58:36', '2021-04-05 19:58:36', NULL, NULL),
(29, 'Ashish Rana', 'ashish-rana', 'aroradeepi05@gmail.com', 'Student', NULL, 0, '$2y$10$hoHGNPqDP3V7b3awGL5LQ.NPqaIHu5EFw6lwa3SnSy/2OxX8.drfe', 0, NULL, 'uploads/user/user.png', NULL, '2021-04-05 20:29:29', '2021-04-05 20:29:29', NULL, NULL),
(30, 'Ahmed', 'ahmed', 'ahmedsk128@gmail.com', 'Student', NULL, 0, '$2y$10$oWFqSIkGdiuqnH9Zpyk8OeYSiUiikxMU6ZtoMACTgp2fWxuy3qPv6', 0, NULL, 'uploads/user/user.png', NULL, '2021-04-08 11:15:19', '2021-04-08 11:15:19', NULL, NULL),
(31, 'Clark Estes', 'clark-estes', 'hihiq@mailinator.com', 'Instructor', NULL, 0, '$2y$12$lBHzZyONek4myskoY7029OzwxLvwpxLikDyDf2KkipNUfPIcDSVpu', 0, NULL, 'uploads/user/user.png', NULL, '2021-04-08 18:57:14', '2021-04-08 18:57:14', NULL, NULL),
(32, 'Malik Lara', 'malik-lara', 'qimomuwopi@mailinator.com', 'Instructor', NULL, 0, '$2y$10$hSBQ3E/yBgMekIf/9KixWeJF2Kfq2fOCN5bCMBC0bLOi5k7mc32N6', 0, NULL, 'uploads/user/user.png', NULL, '2021-04-08 19:06:32', '2021-04-08 19:06:32', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `instructors_email_unique` (`email`),
  ADD KEY `instructors_package_id_foreign` (`package_id`),
  ADD KEY `instructors_user_id_foreign` (`user_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
