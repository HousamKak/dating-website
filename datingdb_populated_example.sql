-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2022 at 10:24 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admirer_id` bigint(20) UNSIGNED NOT NULL,
  `favorited_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admirer_id` bigint(20) UNSIGNED NOT NULL,
  `favorited_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `admirer_id`, `favorited_id`, `created_at`, `updated_at`) VALUES
(4, 10, 9, '2022-10-05 15:35:27', '2022-10-05 15:35:27'),
(18, 13, 6, '2022-10-05 17:10:40', '2022-10-05 17:10:40'),
(19, 13, 5, '2022-10-05 17:10:42', '2022-10-05 17:10:42'),
(20, 13, 8, '2022-10-05 17:10:43', '2022-10-05 17:10:43');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `messager_id` bigint(20) UNSIGNED NOT NULL,
  `messaged_id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_10_02_170903_create_messages_table', 1),
(6, '2022_10_02_170917_create_favorites_table', 1),
(7, '2022_10_02_170933_create_blocks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '1ef2d61be777cc1bb86a33f3c777ace68b04df6c3d1827237a3692d994f58243', '[\"*\"]', NULL, NULL, '2022-10-04 14:28:40', '2022-10-04 14:28:40'),
(2, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '95f1a368fba23af0e6542d8bb95b39e2b055fecb9f576664d58e119ed19da014', '[\"*\"]', NULL, NULL, '2022-10-04 14:29:25', '2022-10-04 14:29:25'),
(3, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '54d353057898405b2ab4bfd68fca5c1eec76806a6cddf79233dd9cee7e2a2698', '[\"*\"]', NULL, NULL, '2022-10-04 14:39:18', '2022-10-04 14:39:18'),
(4, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '4e2ac395b8de2358cef523513a9bc5396388fe9cf887bf3c8e43f57ef26e2b57', '[\"*\"]', NULL, NULL, '2022-10-04 14:41:25', '2022-10-04 14:41:25'),
(5, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '42a00ebf74f982cc0278d1e66c7dfec8eb6763fff45569e2a323c8da26c4b5fa', '[\"*\"]', NULL, NULL, '2022-10-04 14:54:22', '2022-10-04 14:54:22'),
(6, 'App\\Models\\User', 11, 'Laravel Password Grant Client', 'f0124546e85be96efa53eed3c804b2bae248514fb72ba2005adae6e1bb89ad31', '[\"*\"]', NULL, NULL, '2022-10-04 14:55:29', '2022-10-04 14:55:29'),
(7, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '5fb155671b1460c0de2a305e1cc8c6530e038234db1e051c30fac5f3cbf927f5', '[\"*\"]', NULL, NULL, '2022-10-04 14:57:35', '2022-10-04 14:57:35'),
(8, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '96bbfab30bf07e1910768e9d6a1a7fc3f07e9a1279db07f4a527f83e64651ff5', '[\"*\"]', NULL, NULL, '2022-10-04 14:59:03', '2022-10-04 14:59:03'),
(9, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '39dc60d9dabc4a083c13f3ba00ad890f0aff9b8825267401305f724a2fbd22b7', '[\"*\"]', NULL, NULL, '2022-10-04 16:04:34', '2022-10-04 16:04:34'),
(10, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '3ec876281df7a53b604a17050e0e66e7540a9599e67b0662bbd15e4d32c5e714', '[\"*\"]', NULL, NULL, '2022-10-04 16:08:41', '2022-10-04 16:08:41'),
(11, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '1eeaf696fc30edf9be575a926f2ab59451c678649288535c4ba7d99ed26524de', '[\"*\"]', NULL, NULL, '2022-10-04 16:09:15', '2022-10-04 16:09:15'),
(12, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '45d84fd853b923070fbb199a9d9872e1226ecac6b44ae1e93ca3f6659d2fd1d9', '[\"*\"]', NULL, NULL, '2022-10-04 16:14:16', '2022-10-04 16:14:16'),
(13, 'App\\Models\\User', 11, 'Laravel Password Grant Client', 'd6e1b476ae93a59010b7cdb9e278be2d936c6f3d1096bdd872eb0bae210b3566', '[\"*\"]', NULL, NULL, '2022-10-04 16:20:11', '2022-10-04 16:20:11'),
(14, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '557cc26253524863278f810abba0333c43c5e60befe0178538924bad3a9651c6', '[\"*\"]', NULL, NULL, '2022-10-05 02:36:13', '2022-10-05 02:36:13'),
(15, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '3d6d6426affc68a2b99209e217c6dd0147115550268745a2cc13f32c81caed2d', '[\"*\"]', NULL, NULL, '2022-10-05 03:07:03', '2022-10-05 03:07:03'),
(16, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '75aeeed8483e8dadd07b43db053a5a1c7ed76340ba001f9c3b08a5ba69c4fe27', '[\"*\"]', NULL, NULL, '2022-10-05 03:23:02', '2022-10-05 03:23:02'),
(17, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '6a48184675678dc7af89087f8be8d481132832954e2f327ac8a338bb6a4dd55c', '[\"*\"]', NULL, NULL, '2022-10-05 03:24:33', '2022-10-05 03:24:33'),
(18, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '46cfc95a2683dea775424b856843bda0a0b35698ce7d500b7ca9fa6cd81acff9', '[\"*\"]', NULL, NULL, '2022-10-05 03:24:43', '2022-10-05 03:24:43'),
(19, 'App\\Models\\User', 11, 'Laravel Password Grant Client', '5f2e23e2e2c54a54090070d132c19d14a9c21d64d7d31f413748c2a856c42661', '[\"*\"]', NULL, NULL, '2022-10-05 03:27:55', '2022-10-05 03:27:55'),
(20, 'App\\Models\\User', 12, 'Laravel Password Grant Client', '347f917326cbe9860af96beaf3911d05966eb59648a320e90b33d007efd8b226', '[\"*\"]', NULL, NULL, '2022-10-05 04:32:51', '2022-10-05 04:32:51'),
(21, 'App\\Models\\User', 13, 'Laravel Password Grant Client', '5fd98c01c4fa5a22fcaac5c7f58ae3afca93fa5b464ea0e3d52a6e945a4d777a', '[\"*\"]', NULL, NULL, '2022-10-05 04:47:53', '2022-10-05 04:47:53'),
(22, 'App\\Models\\User', 13, 'Laravel Password Grant Client', '5902c8439476f9be54780335220e874b48e757c3b3bea419f8aa55fadc849ee6', '[\"*\"]', NULL, NULL, '2022-10-05 04:48:26', '2022-10-05 04:48:26'),
(23, 'App\\Models\\User', 13, 'Laravel Password Grant Client', '7189250601a13742f5454ec8307d01a1fb338bf4ed8eabd43be1ccca08a1182b', '[\"*\"]', NULL, NULL, '2022-10-05 04:56:19', '2022-10-05 04:56:19'),
(24, 'App\\Models\\User', 14, 'Laravel Password Grant Client', '3385ae76bfac1b0a31d9ca4260bda0f2e9cb857f3686ea3ca87b8746d3cd4ee3', '[\"*\"]', NULL, NULL, '2022-10-05 05:01:08', '2022-10-05 05:01:08'),
(25, 'App\\Models\\User', 13, 'Laravel Password Grant Client', 'e2713bd2d01c60168de1d5a11af446bcff36aff2571ae9cfbe90d5962889a626', '[\"*\"]', NULL, NULL, '2022-10-05 05:13:17', '2022-10-05 05:13:17'),
(26, 'App\\Models\\User', 13, 'Laravel Password Grant Client', '43a35af7609089369501ec7eb6e1a3615b0c43e8d6db1bf86e53ca22c18e4a37', '[\"*\"]', NULL, NULL, '2022-10-05 09:20:52', '2022-10-05 09:20:52'),
(27, 'App\\Models\\User', 15, 'Laravel Password Grant Client', 'c088b08a6c843ab369c4f333c7f1efe536680c74707664258adef796ed02a79b', '[\"*\"]', NULL, NULL, '2022-10-05 09:32:50', '2022-10-05 09:32:50'),
(28, 'App\\Models\\User', 13, 'Laravel Password Grant Client', '01aa4e375d804d60ce8e034f1777d85f12bca9113d520ec9033eff0e5764b39d', '[\"*\"]', NULL, NULL, '2022-10-05 10:01:51', '2022-10-05 10:01:51'),
(29, 'App\\Models\\User', 15, 'Laravel Password Grant Client', '98b27cb922d8c924a13e7c2557cd65b5409b15167e56001c91aedcb61160425e', '[\"*\"]', NULL, NULL, '2022-10-05 11:10:13', '2022-10-05 11:10:13'),
(30, 'App\\Models\\User', 13, 'Laravel Password Grant Client', 'c302dbb807318ae7526b871852e57d78ba40d2148da2cfd98d380fc608bb983c', '[\"*\"]', NULL, NULL, '2022-10-05 11:12:21', '2022-10-05 11:12:21'),
(31, 'App\\Models\\User', 13, 'Laravel Password Grant Client', '3f2500cbd8b86ffb56a7addf66fd0d30792be58d098de3937a89414b19c39e4b', '[\"*\"]', NULL, NULL, '2022-10-05 11:18:04', '2022-10-05 11:18:04'),
(32, 'App\\Models\\User', 13, 'Laravel Password Grant Client', '4cf46f31c797cbc19979d13ea3b13d70d21b3eb2a5e28a0d4f8c309e086c1ba6', '[\"*\"]', NULL, NULL, '2022-10-05 11:30:50', '2022-10-05 11:30:50'),
(33, 'App\\Models\\User', 13, 'Laravel Password Grant Client', 'c20318f705270b2773585694858260ab9db9340726ac622245c20fd84bfd301a', '[\"*\"]', NULL, NULL, '2022-10-05 12:20:43', '2022-10-05 12:20:43'),
(34, 'App\\Models\\User', 15, 'Laravel Password Grant Client', '64b8b117ac1bb382cfa66f12a8bb265484cfe0d0930515bb3765b59bab027860', '[\"*\"]', NULL, NULL, '2022-10-05 12:21:39', '2022-10-05 12:21:39'),
(35, 'App\\Models\\User', 13, 'Laravel Password Grant Client', '5161372128de2617826510f3b1bff032d3d7804d34d56c83f25809ae2b79018f', '[\"*\"]', NULL, NULL, '2022-10-05 12:29:47', '2022-10-05 12:29:47'),
(36, 'App\\Models\\User', 13, 'Laravel Password Grant Client', 'ca0fde2cf229b36dbe810665906d1be1a7cb0f1adc166067cf981a2b77210cbc', '[\"*\"]', NULL, NULL, '2022-10-05 12:50:07', '2022-10-05 12:50:07'),
(37, 'App\\Models\\User', 15, 'Laravel Password Grant Client', '856bdeccba22b615e91c8f95d16130e69ae547533af133d5f9e8f9408b275841', '[\"*\"]', NULL, NULL, '2022-10-05 12:50:27', '2022-10-05 12:50:27'),
(38, 'App\\Models\\User', 13, 'Laravel Password Grant Client', '5724c7ca25a094c679c2929ae497f35bd8628f28ec824e13ac266c229514e6c4', '[\"*\"]', NULL, NULL, '2022-10-05 12:52:09', '2022-10-05 12:52:09'),
(39, 'App\\Models\\User', 13, 'Laravel Password Grant Client', 'f53278415673b07ab571daf7591832b5823745303e0be32da60fbadf6601ff61', '[\"*\"]', NULL, NULL, '2022-10-05 13:23:59', '2022-10-05 13:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `bio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favorite_gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `age`, `bio`, `picture`, `gender`, `location`, `password`, `favorite_gender`, `created_at`, `updated_at`) VALUES
(1, 'Sada', 'sburmaster0@vk.com', 57, 'in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus', 'http://dummyimage.com/105x100.png/cc0000/ffffff', 'F', '[\"45.5226069\",\"43.880825\"]', 'UmuqGyLnd', 'F', NULL, NULL),
(2, 'Kamilah', 'ktethacot1@so-net.ne.jp', 48, 'nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam', 'http://dummyimage.com/171x100.png/ff4444/ffffff', 'F', '[\"33.5226069\",\"31.880825\"]', 'HfDJyBkx', 'F', NULL, NULL),
(3, 'Blakeley', 'binch2@ebay.co.uk', 6, 'dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla', 'http://dummyimage.com/207x100.png/ff4444/ffffff', 'F', '[\"30.5226069\",\"15.880825\"]', 'ZQFEMam3XYcO', 'F', NULL, NULL),
(4, 'Gavrielle', 'gvaggs3@hexun.com', 99, 'integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar', 'http://dummyimage.com/192x100.png/dddddd/000000', 'F', '[\"20.5226069\",\"33.880825\"]', '8aJcGq', 'F', NULL, NULL),
(5, 'Danika', 'dhargreave4@diigo.com', 18, 'nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis', 'http://dummyimage.com/243x100.png/cc0000/ffffff', 'F', '[\"17.5226069\",\"3.880825\"]', '77aEX5s2OTec', 'F', NULL, NULL),
(6, 'Bendix', 'bmaguire5@ameblo.jp', 12, 'tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia', 'http://dummyimage.com/105x100.png/dddddd/000000', 'F', '[\"30.5226069\",\"30.880825\"]', 'wuvgtcIZ', 'M', NULL, NULL),
(7, 'Sid', 'ssoff6@angelfire.com', 34, 'nunc donec quis orci eget orci vehicula condimentum curabitur in', 'http://dummyimage.com/191x100.png/dddddd/000000', 'M', '[\"31\",\"32\"]', '6zHOLqWU1CJY', 'M', NULL, NULL),
(8, 'Mortimer', 'mguymer7@google.co.jp', 86, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur', 'http://dummyimage.com/148x100.png/cc0000/ffffff', 'F', '[\"15\",\"10\"]', 'n61HEO0fD', 'M', NULL, NULL),
(9, 'Bertrand', 'bdeverall8@noaa.gov', 70, 'erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy', 'http://dummyimage.com/219x100.png/dddddd/000000', 'F', '[\"2\",\"5\"]', '0ulDpH', 'M', NULL, NULL),
(10, 'Berty', 'bbrugemann9@privacy.gov.au', 2, 'viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris', 'http://dummyimage.com/113x100.png/ff4444/ffffff', 'M', '[\"25.5226069\",\"3.880825\"]', 'h2HeXM', 'F', NULL, NULL),
(13, 'Housam', 'hhk18@mail.aub.edu', 12, 'I love Life', 'D:\\Acadamics and Work\\Work\\SE Factory\\Assignments\\dating-website\\server_images\\13.jpg', 'M', '[\"35.5226082\",\"33.8808276\"]', 'dd341e78c4b9051655448bb541ae9ebf97ae3c45b815242cbedc83f4222f313f', 'F', '2022-10-05 04:45:57', '2022-10-05 13:23:59'),
(14, 'Housam', 'hh@gmail.com', 22, 'askjdasdjasjdasdjasd', 'D:\\Acadamics and Work\\Work\\SE Factory\\Assignments\\dating-website\\server_images\\14.jpg', 'M', '[\"35.5225995\",\"33.8808219\"]', 'dd341e78c4b9051655448bb541ae9ebf97ae3c45b815242cbedc83f4222f313f', 'FF', '2022-10-05 05:00:56', '2022-10-05 11:09:09'),
(15, 'Jihane', 'jac14@mail.aub.edu', 22, 'Hey', 'D:\\Acadamics and Work\\Work\\SE Factory\\Assignments\\dating-website\\server_images\\15.jpg', 'F', '[\"34.5017767\",\"34.8937913\"]', 'dd341e78c4b9051655448bb541ae9ebf97ae3c45b815242cbedc83f4222f313f', 'M', '2022-10-05 09:32:36', '2022-10-05 12:21:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blocks_admirer_id_foreign` (`admirer_id`),
  ADD KEY `blocks_favorited_id_foreign` (`favorited_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_admirer_id_foreign` (`admirer_id`),
  ADD KEY `favorites_favorited_id_foreign` (`favorited_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `messages_messager_id_foreign` (`messager_id`),
  ADD KEY `messages_messaged_id_foreign` (`messaged_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blocks`
--
ALTER TABLE `blocks`
  ADD CONSTRAINT `blocks_admirer_id_foreign` FOREIGN KEY (`admirer_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `blocks_favorited_id_foreign` FOREIGN KEY (`favorited_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_admirer_id_foreign` FOREIGN KEY (`admirer_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `favorites_favorited_id_foreign` FOREIGN KEY (`favorited_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_messaged_id_foreign` FOREIGN KEY (`messaged_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `messages_messager_id_foreign` FOREIGN KEY (`messager_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
