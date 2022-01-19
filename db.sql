-- phpMyAdmin SQL Dump
-- version 5.1.2-dev+20211221.119eaaa671
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 19, 2022 at 12:10 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loandb`
--

-- --------------------------------------------------------

--
-- Table structure for table `emis`
--

CREATE TABLE `emis` (
  `id` bigint UNSIGNED NOT NULL,
  `loan_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=unpaid, 1=Paid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emis`
--

INSERT INTO `emis` (`id`, `loan_id`, `user_id`, `amount`, `date`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '8.500', '2022-01-19', 1, '2022-01-19 01:58:01', '2022-01-19 03:13:17'),
(2, 2, 2, '8.500', '2022-01-26', 1, '2022-01-19 01:58:01', '2022-01-19 03:16:09'),
(3, 2, 2, '8.500', '2022-02-02', 0, '2022-01-19 01:58:01', '2022-01-19 01:58:01'),
(4, 2, 2, '8.500', '2022-02-09', 0, '2022-01-19 01:58:01', '2022-01-19 01:58:01'),
(5, 2, 2, '8.500', '2022-02-16', 0, '2022-01-19 01:58:01', '2022-01-19 01:58:01'),
(6, 2, 2, '8.500', '2022-02-23', 0, '2022-01-19 01:58:01', '2022-01-19 01:58:01'),
(7, 2, 2, '8.500', '2022-03-02', 0, '2022-01-19 01:58:01', '2022-01-19 01:58:01'),
(8, 2, 2, '8.500', '2022-03-09', 0, '2022-01-19 01:58:01', '2022-01-19 01:58:01'),
(9, 2, 2, '8.500', '2022-03-16', 0, '2022-01-19 01:58:01', '2022-01-19 01:58:01'),
(10, 2, 2, '8.500', '2022-03-23', 0, '2022-01-19 01:58:01', '2022-01-19 01:58:01'),
(11, 2, 2, '8.500', '2022-03-30', 0, '2022-01-19 01:58:01', '2022-01-19 01:58:01'),
(12, 2, 2, '8.500', '2022-04-06', 0, '2022-01-19 01:58:01', '2022-01-19 01:58:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `is_approved` tinyint NOT NULL DEFAULT '0' COMMENT '0=not-approved, 1=approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest_rate` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Paid, 2=Completed, 3=UnPaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `user_id`, `type`, `period`, `amount`, `is_approved`, `created_at`, `updated_at`, `interest_rate`, `status`) VALUES
(2, 2, 'personal loan', '12', '100.000', 1, '2022-01-19 00:33:51', '2022-01-19 01:58:01', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(42, '2014_10_12_000000_create_users_table', 1),
(43, '2014_10_12_100000_create_password_resets_table', 1),
(44, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(45, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(46, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(47, '2016_06_01_000004_create_oauth_clients_table', 1),
(48, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(49, '2019_08_19_000000_create_failed_jobs_table', 1),
(50, '2022_01_18_161130_update_users_table_to_include_type', 1),
(59, '2022_01_18_171450_create_loans_table', 2),
(60, '2022_01_18_180559_update_loan_table_to_include_status', 2),
(61, '2022_01_19_060612_create_emis_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00b8ec33fe4cbf880d4e1268c74ce2c6828834a8ed4c85131764ebf458cadc74d3a242563aed6834', 3, 1, 'TOKEN', '[]', 0, '2022-01-19 01:10:14', '2022-01-19 01:10:14', '2023-01-19 06:40:14'),
('0c2f9c9619cf3e4bd231e9907a0696d0c4908df604662472addd6f26880fea7ae23c234a96361b57', 2, 1, 'TOKEN', '[]', 0, '2022-01-18 12:04:20', '2022-01-18 12:04:20', '2023-01-18 17:34:20'),
('cb6a029cf3dea8026f22a4520619a546c1439962f0d9130cdda0516085a2837e9b2dac29ce6fc979', 4, 1, 'TOKEN', '[]', 0, '2022-01-19 04:43:57', '2022-01-19 04:43:57', '2023-01-19 10:13:57'),
('e9f6356fc9d959a2535870ef2e283a2b12f76f427e5d907c79cd1bcc60fcd76734722a63a24f1898', 4, 1, 'TOKEN', '[]', 0, '2022-01-19 04:46:09', '2022-01-19 04:46:09', '2023-01-19 10:16:09'),
('ec796869505030a09c067806717bcd699ed5ee52d712d6f017685f91ff8b22c5fec7cefd749d1397', 3, 1, 'TOKEN', '[]', 0, '2022-01-19 01:09:45', '2022-01-19 01:09:45', '2023-01-19 06:39:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int UNSIGNED NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'LoanApp Personal Access Client', 'JvA7kDbgxOLAhSSXoOhcbYfC1KUkN9k0YR5WpJLf', 'http://localhost', 1, 0, 0, '2022-01-18 12:03:16', '2022-01-18 12:03:16'),
(2, NULL, 'LoanApp Password Grant Client', '7ScX0RLbR073iNwndb5xmW7sbAGRQr2N2NsE4DLj', 'http://localhost', 0, 1, 0, '2022-01-18 12:03:16', '2022-01-18 12:03:16'),
(3, NULL, 'LoanApp Personal Access Client', 'yljlhWidj9KRl1bZom238DzRsBXQgL9aeL7QoVRZ', 'http://localhost', 1, 0, 0, '2022-01-19 05:11:32', '2022-01-19 05:11:32'),
(4, NULL, 'LoanApp Password Grant Client', 'tC72q8D8TErUxPoNgDlheTonzDlqB7SIcZdZY5n8', 'http://localhost', 0, 1, 0, '2022-01-19 05:11:32', '2022-01-19 05:11:32'),
(5, NULL, 'LoanApp Personal Access Client', 'JEp8A2GNQRV8WcqYZvK0vejphrhhCgLb5rspgaes', 'http://localhost', 1, 0, 0, '2022-01-19 05:12:37', '2022-01-19 05:12:37'),
(6, NULL, 'LoanApp Personal Access Client', 'UI6RKVHHPpCwXLY468ut0oESOtMtXAlwjuEU6XV8', 'http://localhost', 1, 0, 0, '2022-01-19 05:14:56', '2022-01-19 05:14:56'),
(7, NULL, 'LoanApp Password Grant Client', 'nyq7Bxbgzxkh6qvOnF0oF4YQPQURJdqD6xKOdx7c', 'http://localhost', 0, 1, 0, '2022-01-19 05:14:56', '2022-01-19 05:14:56'),
(8, NULL, 'LoanApp Personal Access Client', 'M8v2mUUm3vuPtn9G6aN9YxlNdg3cKy5ptr6ER6pm', 'http://localhost', 1, 0, 0, '2022-01-19 05:15:44', '2022-01-19 05:15:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int UNSIGNED NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-01-18 12:03:16', '2022-01-18 12:03:16'),
(2, 3, '2022-01-19 05:11:32', '2022-01-19 05:11:32'),
(3, 5, '2022-01-19 05:12:37', '2022-01-19 05:12:37'),
(4, 6, '2022-01-19 05:14:56', '2022-01-19 05:14:56'),
(5, 8, '2022-01-19 05:15:44', '2022-01-19 05:15:44');

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
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `type`) VALUES
(2, 'harshit', 'harshit1@gmail.com', NULL, '$2y$10$jAXu3pp7vde3rzCzSi1RuOGTvc7ydyl8NQSFnycTyI0pU9EEQ8cKm', NULL, '2022-01-18 12:04:20', '2022-01-18 12:04:20', 0),
(3, 'admin', 'admin@gmail.com', NULL, '$2y$10$fnXHSRKGskUpS5dK68UZMuU.Vbe51/FqcG4RNS3bdlkb2qakYwsJq', NULL, '2022-01-19 01:09:45', '2022-01-19 01:09:45', 1),
(4, 'harshit', 'harshit@gmail.com', NULL, '$2y$10$IQgKZ7mzntHh5EoAX8O60eneWS45trXCb4XmupVfK7nQAuJ/quEs6', NULL, '2022-01-19 04:43:57', '2022-01-19 04:43:57', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emis`
--
ALTER TABLE `emis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emis_loan_id_foreign` (`loan_id`),
  ADD KEY `emis_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loans_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `emis`
--
ALTER TABLE `emis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emis`
--
ALTER TABLE `emis`
  ADD CONSTRAINT `emis_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`),
  ADD CONSTRAINT `emis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
