-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2022 at 07:19 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `date`, `created_at`, `updated_at`) VALUES
(1, 9, '2022-05-25', '2022-05-23 09:03:57', '2022-05-23 09:03:57'),
(2, 9, '2022-05-23', '2022-05-23 09:16:45', '2022-05-23 09:16:45'),
(3, 9, '2022-05-24', '2022-05-23 09:45:45', '2022-05-23 09:45:45'),
(6, 9, '2022-05-27', '2022-05-26 13:06:11', '2022-05-26 13:06:11'),
(7, 11, '2022-05-27', '2022-05-27 09:48:26', '2022-05-27 09:48:26'),
(8, 11, '2022-05-28', '2022-05-27 09:49:06', '2022-05-27 09:49:06'),
(9, 9, '2022-05-29', '2022-05-27 10:53:06', '2022-05-27 10:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `teacher_id`, `time`, `status`, `created_at`, `updated_at`, `date`) VALUES
(7, 12, 11, '10.20am', 1, '2022-05-27 15:50:02', '2022-05-27 10:16:39', '2022-05-27'),
(10, 10, 9, '10.20am', 1, '2022-05-27 17:09:02', '2022-05-27 11:10:12', '2022-05-27');

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
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_for_appointment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_task` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `cause_for_appointment`, `user_id`, `teacher_id`, `date`, `add_task`, `comment`, `created_at`, `updated_at`) VALUES
(11, 'BEE-1 issu', 12, 11, '2022-05-27', 'math-1,math-1', 'ok', '2022-05-27 10:17:11', '2022-05-27 10:17:11'),
(14, 'Data structure  and algorithom problem slove', 10, 9, '2022-05-27', 'exerxise-1,exerxise-2', 'ok', '2022-05-27 11:11:27', '2022-05-27 11:11:27');

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
(19, '2014_10_12_000000_create_users_table', 1),
(20, '2014_10_12_100000_create_password_resets_table', 1),
(21, '2019_08_19_000000_create_failed_jobs_table', 1),
(22, '2022_05_21_170315_create_roles_table', 1),
(23, '2022_05_21_171029_add_gender_to_users_table', 1),
(24, '2022_05_23_105606_create_appointments_table', 2),
(25, '2022_05_23_121243_create_times_table', 2),
(26, '2022_05_25_060936_create_bookings_table', 3),
(27, '2022_05_25_070128_add_date_to_bookings_table', 4),
(28, '2022_05_26_111558_create_feedback_table', 5);

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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'teacher', '2022-05-21 11:53:38', '2022-05-21 11:53:38'),
(2, 'admin', '2022-05-21 11:53:38', '2022-05-21 11:53:38'),
(3, 'student', '2022-05-21 11:53:38', '2022-05-21 11:53:38');

-- --------------------------------------------------------

--
-- Table structure for table `times`
--

CREATE TABLE `times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `times`
--

INSERT INTO `times` (`id`, `appointment_id`, `time`, `status`, `created_at`, `updated_at`) VALUES
(49, 2, '6am', 0, '2022-05-23 09:16:45', '2022-05-23 09:16:45'),
(50, 2, '6.20am', 0, '2022-05-23 09:16:45', '2022-05-23 09:16:45'),
(51, 2, '10.20am', 0, '2022-05-23 09:16:45', '2022-05-23 09:16:45'),
(55, 1, '7am', 0, '2022-05-23 11:35:24', '2022-05-25 09:46:28'),
(56, 1, '7.20am', 0, '2022-05-23 11:35:24', '2022-05-25 01:41:00'),
(57, 1, '7.40am', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(58, 1, '8am', 0, '2022-05-23 11:35:24', '2022-05-25 09:02:05'),
(59, 1, '8.20am', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(60, 1, '8.40am', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(61, 1, '9am', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(62, 1, '9.20am', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(63, 1, '9.40am', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(64, 1, '10am', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(65, 1, '10.20am', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(66, 1, '10.40am', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(67, 1, '11am', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(68, 1, '11.20am', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(69, 1, '11.40am', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(70, 1, '12pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(71, 1, '12.20pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(72, 1, '12.40pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(73, 1, '1pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(74, 1, '1.20pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(75, 1, '1.40pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(76, 1, '2pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(77, 1, '2.20pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(78, 1, '2.40pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(79, 1, '3pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(80, 1, '3.20pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(81, 1, '3.40pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(82, 1, '4pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(83, 1, '4.20pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(84, 1, '4.40pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(85, 1, '5pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(86, 1, '5.20pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(87, 1, '5.40pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(88, 1, '6pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(89, 1, '6.20pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(90, 1, '6.40pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(91, 1, '7pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(92, 1, '7.20pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(93, 1, '7.40pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(94, 1, '8pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(95, 1, '8.20pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(96, 1, '8.40pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(97, 1, '9pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(98, 1, '9.20pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(99, 1, '9.40pm', 0, '2022-05-23 11:35:24', '2022-05-23 11:35:24'),
(100, 3, '6am', 0, '2022-05-24 13:18:14', '2022-05-24 13:18:14'),
(101, 3, '6.20am', 0, '2022-05-24 13:18:14', '2022-05-24 13:18:14'),
(102, 3, '6.40am', 0, '2022-05-24 13:18:14', '2022-05-24 13:18:14'),
(103, 3, '12pm', 0, '2022-05-24 13:18:14', '2022-05-24 13:18:14'),
(104, 4, '6am', 0, '2022-05-25 09:39:41', '2022-05-26 05:57:37'),
(105, 4, '6.20am', 0, '2022-05-25 09:39:41', '2022-05-25 09:39:41'),
(106, 4, '6.40am', 0, '2022-05-25 09:39:41', '2022-05-25 09:39:41'),
(107, 5, '6am', 0, '2022-05-26 12:48:55', '2022-05-26 12:48:55'),
(108, 5, '6.20am', 0, '2022-05-26 12:48:55', '2022-05-26 12:48:55'),
(109, 5, '6.40am', 0, '2022-05-26 12:48:55', '2022-05-26 12:48:55'),
(113, 7, '10.20am', 1, '2022-05-27 09:48:26', '2022-05-27 15:50:02'),
(114, 7, '10.40am', 0, '2022-05-27 09:48:26', '2022-05-27 09:48:26'),
(115, 7, '11am', 0, '2022-05-27 09:48:26', '2022-05-27 09:48:26'),
(116, 7, '11.20am', 0, '2022-05-27 09:48:26', '2022-05-27 09:48:26'),
(117, 7, '11.40am', 0, '2022-05-27 09:48:26', '2022-05-27 09:48:26'),
(118, 8, '10am', 0, '2022-05-27 09:49:06', '2022-05-27 09:49:06'),
(119, 8, '10.20am', 0, '2022-05-27 09:49:06', '2022-05-27 09:49:06'),
(120, 8, '10.40am', 0, '2022-05-27 09:49:06', '2022-05-27 09:49:06'),
(124, 9, '9.40am', 0, '2022-05-27 10:53:31', '2022-05-27 10:53:31'),
(125, 9, '10.20am', 0, '2022-05-27 10:53:31', '2022-05-27 10:53:31'),
(126, 9, '11am', 0, '2022-05-27 10:53:31', '2022-05-27 10:53:31'),
(127, 9, '11.40am', 0, '2022-05-27 10:53:31', '2022-05-27 10:53:31'),
(128, 6, '6am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(129, 6, '6.20am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(130, 6, '6.40am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(131, 6, '7am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(132, 6, '7.20am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(133, 6, '7.40am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(134, 6, '8am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(135, 6, '8.20am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(136, 6, '8.40am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(137, 6, '9am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(138, 6, '9.20am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(139, 6, '9.40am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(140, 6, '10am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(141, 6, '10.20am', 1, '2022-05-27 11:06:47', '2022-05-27 17:09:02'),
(142, 6, '10.40am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(143, 6, '11am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(144, 6, '11.20am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(145, 6, '11.40am', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(146, 6, '12pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(147, 6, '12.20pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(148, 6, '12.40pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(149, 6, '1pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(150, 6, '1.20pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(151, 6, '1.40pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(152, 6, '2pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(153, 6, '2.20pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(154, 6, '2.40pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(155, 6, '3pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(156, 6, '3.20pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(157, 6, '3.40pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(158, 6, '4pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(159, 6, '4.20pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(160, 6, '4.40pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(161, 6, '5pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(162, 6, '5.20pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(163, 6, '5.40pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(164, 6, '6pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(165, 6, '6.20pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(166, 6, '6.40pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(167, 6, '7pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(168, 6, '7.20pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(169, 6, '7.40pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(170, 6, '8pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(171, 6, '8.20pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(172, 6, '8.40pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(173, 6, '9pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(174, 6, '9.20pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47'),
(175, 6, '9.40pm', 0, '2022-05-27 11:06:47', '2022-05-27 11:06:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `std_department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `address`, `phone_number`, `student_id`, `department`, `image`, `education`, `course`, `remember_token`, `created_at`, `updated_at`, `std_department`) VALUES
(1, 'Suhel Roy', 'jagothjyotidey91@gmail.com', NULL, '$2y$10$kZYoFLl1UpFtcVnY7c9VMukaa6JmOYoCwTw71O.mt8mpHUEITROeO', 3, NULL, NULL, '182-122-022', NULL, NULL, NULL, NULL, NULL, '2022-05-21 11:55:27', '2022-05-21 11:55:27', 'CSE'),
(6, 'da@gmail.com', 'Roysuhel124@gmail.com', NULL, '$2y$10$ar1K7IsNI3H0FYaB25qQyOYnqnyrc2Q3F/uCKTVs7lR77gl4b3lDi', 1, 'sylhet', '898392983289', NULL, 'CSE & CS', 'sMS29hRmpZuRGN8mcQfQjgVIaAU90dNcvRNqmn2a.jpg', 'bsc in cse', 'data', NULL, '2022-05-23 01:36:50', '2022-05-26 08:15:05', 'male'),
(8, 'admin', 'admin@gmail.com', NULL, '$2y$10$ycgtzf2W6Gm5I8V.Y52O3.lCV3Lv7bao8e.XOAIvcOQZPftgItHce', 2, 'sylhet', '0178929292', NULL, 'CSE & CS', 'sHXSF8bdcYZa2g8gcDGVlJfC4Hanz9XjiqrL1HWH.png', 'bsc in cse', 'Data science', 'dgDbvTHLTFslsOiQX97C7BIjGsmEPpCUy0BwcfCxiPwtk3D6s9SsPmblaWk0', '2022-05-23 01:58:14', '2022-05-23 01:58:14', 'male'),
(9, 'Teacher', 'teacher@gmail.com', NULL, '$2y$10$UtxvoNboW4LULiJfxnRwcuuyiT1yjQ84zR8q4avtDw/1iCatKDVoe', 1, 'sylhet', '0178929292', NULL, 'EEE & CS', 'H7ldwJViYMehilidPbUH4FLpnypYJxMrBHubAx8c.png', 'bsc in EEE', 'BEE-1', 'svpQFieHoatisnnKK2RADzSLcLA455g6MCoXmTPmzjPT6FFGW4y1N9fXiY1h', '2022-05-23 02:00:05', '2022-05-23 02:00:05', 'male'),
(10, 'studenT', 'student@gmail.com', NULL, '$2y$10$Xjdeg4yzUpG/zvlo5eiQ3epOLyy7BDPmw1GYcefnkDUOXv5gBf7Wy', 3, NULL, '898392983289', '183-115-09', NULL, '1653506828.png', NULL, 'welcome', NULL, '2022-05-24 02:23:17', '2022-05-25 13:27:08', 'EEE'),
(11, 'john doe', 'j@gmail.com', NULL, '$2y$10$xwhXrDHoVpmrJASWdXzd3O0gk5rjy22x.8M2VS5A7JH7Vr65TRTHu', 1, 'sylhet', '0178929292', NULL, 'CSE', 'UiU5tNV0MfyacpNELJybOzeUFjGllAw02PmEIhqp.jpg', 'bsc in cse', 'Data structure', NULL, '2022-05-27 09:37:20', '2022-05-27 09:47:21', 'male'),
(12, 'RK', 'RK@gmail.com', NULL, '$2y$10$FBlOSTh.gGhr.PJSHoQWhO6nhz9VdbQPK.YadMeJJGskzIc4Mbi.y', 3, NULL, '0178929292', '182-133-09', NULL, '1653666785.png', NULL, 'welcome', NULL, '2022-05-27 09:44:39', '2022-05-27 09:59:37', 'CSE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `times`
--
ALTER TABLE `times`
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
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `times`
--
ALTER TABLE `times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
