-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2021 at 04:44 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mainproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `km` double(8,2) DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','pending','finished') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `days` int(11) NOT NULL,
  `date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `shop_id`, `status`, `particular`, `link`, `image`, `type`, `amount`, `days`, `date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, 'active', 'esewa account', 'www.globalcyberlife.com', 'advertisements\\July2021\\Iu0ftPuxRggDeSPUtNxQ.jpg', 'newarrival', 20.20, 12, '2020-02-22', 1, '2021-07-13 21:57:01', '2021-07-13 21:57:01'),
(2, 1, 'active', 'discount', 'www.academy.globalcyberlife.com', 'advertisements\\July2021\\rZcKQ3udSguCcP8h9mDp.jpg', 'advertisement', 20.20, 5, '2021-07-11', 1, '2021-07-24 10:13:30', '2021-07-24 10:13:30'),
(3, 1, 'active', 'folding daraz', 'www.globalcyberlife.com', 'advertisements\\July2021\\40Vw5NyTVbsrthDPpuYl.jpg', 'newarrival', 20.20, 6, '2021-07-03', 1, '2021-07-24 10:14:21', '2021-07-24 10:14:21');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `asset_type` enum('current','fixed','other') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'current',
  `value` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `balance_sheets`
--

CREATE TABLE `balance_sheets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `credit_amount` double(8,2) NOT NULL,
  `debit_amount` double(8,2) NOT NULL,
  `total_current_asset` double(8,2) NOT NULL,
  `total_fixed_asset` double(8,2) NOT NULL,
  `total_other_asset` double(8,2) NOT NULL,
  `total_current_liability` double(8,2) NOT NULL,
  `total_longterm_liability` double(8,2) NOT NULL,
  `total_capital` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `browsing_histories`
--

CREATE TABLE `browsing_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `knowledge` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capitals`
--

CREATE TABLE `capitals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_flows`
--

CREATE TABLE `cash_flows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `net_cash_flow_operation` double(8,2) NOT NULL,
  `net_cash_flow_investment` double(8,2) NOT NULL,
  `net_cash_flow_finance` double(8,2) NOT NULL,
  `net_cash_flow_increase` double(8,2) NOT NULL,
  `net_cash_beginning` double(8,2) NOT NULL,
  `net_cash_end_of_year` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'hemp products', 'hemp products', '2021-07-12 21:59:11', '2021-07-12 23:44:49'),
(2, NULL, 1, 'home decor', 'home', '2021-07-12 21:59:11', '2021-07-12 23:48:41'),
(3, 2, 1, 'folding products', 'folding-products', '2021-07-12 23:48:54', '2021-07-12 23:48:54'),
(4, 3, 1, 'folding item', 'folding-daraz', '2021-07-12 23:49:21', '2021-07-14 06:03:53'),
(5, NULL, 1, 'traditional dress', 'traditional-dress', '2021-07-13 21:41:33', '2021-07-13 21:41:33'),
(9, NULL, 1, 'cosmetics', 'cosmetics', '2021-07-25 01:05:27', '2021-07-25 01:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `comissions`
--

CREATE TABLE `comissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `percent` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comissions`
--

INSERT INTO `comissions` (`id`, `shop_id`, `percent`, `created_at`, `updated_at`) VALUES
(1, 1, 5.00, '2021-07-25 01:33:16', '2021-07-25 01:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complains`
--

CREATE TABLE `complains` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complain` text COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('REPORTED','SOLVED','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'REPORTED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `complains`
--

INSERT INTO `complains` (`id`, `user_id`, `product_id`, `shop_id`, `title`, `complain`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 'customer service', 'i am having a very bad customer service.i am looking to exchange product that i bought', NULL, 'PENDING', '2021-07-20 02:02:19', '2021-07-20 02:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount_amount` double(8,2) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `particular`, `code`, `discount_amount`, `description`, `is_active`, `shop_id`, `created_at`, `updated_at`) VALUES
(1, 'discount', '123', 200.00, 'disocunt ', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `credits`
--

CREATE TABLE `credits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `credit_limit` double(8,2) NOT NULL,
  `credit_amount` double(8,2) NOT NULL,
  `debit_amount` double(8,2) NOT NULL,
  `status` enum('REMAINING','PAID','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` double(8,2) NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_payments`
--

CREATE TABLE `customer_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `easy_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `credit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parcel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `paid` double(8,2) DEFAULT NULL,
  `remaining` double(8,2) DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `vat` double(8,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `discount_amount` double(8,2) DEFAULT NULL,
  `payment_method` enum('cash_on_delivery','card','mobile_wallet') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cash_on_delivery',
  `payment_type` enum('to_receive','to_pay') COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('completed','remaining','pending','verified') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_purchase_returns`
--

CREATE TABLE `customer_purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_charge` double(8,2) DEFAULT NULL,
  `type` enum('EXCHANGE','REFUND') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EXCHANGE',
  `status` enum('PENDING','COMPLETED','DECLINED') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_service_reports`
--

CREATE TABLE `customer_service_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `army_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `total_credit_amount` double(8,2) NOT NULL,
  `total_earning_amount` double(8,2) NOT NULL,
  `total_reward_amount` double(8,2) NOT NULL,
  `total_task_point` int(11) NOT NULL,
  `total_service_completed` int(11) NOT NULL,
  `total_service_failed` int(11) NOT NULL,
  `total_team_task_completed` int(11) NOT NULL,
  `total_team_task_failed` int(11) NOT NULL,
  `total_orders` double(8,2) NOT NULL,
  `report_type` enum('yearly','monthly','weekly','daily') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_service_tasks`
--

CREATE TABLE `customer_service_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `army_id` bigint(20) UNSIGNED NOT NULL,
  `task_status` enum('pending','on_way','completed','failed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `available_time` enum('morning','day','evening','night','all') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(58, 7, 'brand_name', 'text', 'Brand Name', 0, 1, 1, 1, 1, 1, '{}', 5),
(59, 7, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 6),
(60, 7, 'shop_id', 'number', 'Shop Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(61, 7, 'selling_price', 'number', 'Selling Price', 1, 1, 1, 1, 1, 1, '{}', 7),
(62, 7, 'cost_price', 'number', 'Cost Price', 1, 1, 1, 1, 1, 1, '{}', 8),
(63, 7, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{}', 9),
(64, 7, 'multiple_image', 'multiple_images', 'Multiple Image', 0, 1, 1, 1, 1, 1, '{}', 10),
(65, 7, 'contact', 'text', 'Contact', 1, 1, 1, 1, 1, 1, '{}', 11),
(66, 7, 'gift_id', 'number', 'Gift Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(67, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 12),
(68, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(69, 7, 'product_belongsto_shop_relationship', 'relationship', 'shops', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Shop\",\"table\":\"shops\",\"type\":\"belongsTo\",\"column\":\"shop_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(70, 8, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(71, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(72, 8, 'user_id', 'number', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(73, 8, 'is_active', 'checkbox', 'Is Active', 1, 1, 1, 1, 1, 1, '{\"active\":\"active\",\"notactive\":\"not active\",\"checked\":true}', 4),
(74, 8, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 5),
(75, 8, 'rating', 'number', 'Rating', 0, 1, 1, 1, 1, 1, '{}', 6),
(76, 8, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 7),
(77, 8, 'contact_no', 'text', 'Contact No', 0, 1, 1, 1, 1, 1, '{}', 8),
(78, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(79, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(80, 8, 'shop_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(81, 9, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 9, 'particular', 'text', 'Particular', 1, 1, 1, 1, 1, 1, '{}', 2),
(83, 9, 'description', 'text_area', 'Description', 1, 1, 1, 1, 1, 1, '{}', 3),
(84, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(85, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(86, 7, 'product_belongsto_gift_relationship', 'relationship', 'gifts', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Gift\",\"table\":\"gifts\",\"type\":\"belongsTo\",\"column\":\"gift_id\",\"key\":\"id\",\"label\":\"particular\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(87, 7, 'product_belongstomany_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_categories\",\"pivot\":\"1\",\"taggable\":\"0\"}', 16),
(88, 10, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(89, 10, 'shop_id', 'number', 'Shop Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(90, 10, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"active\",\"options\":{\"active\":\"active\",\"finished\":\"finished\",\"pending\":\"pending\"}}', 3),
(91, 10, 'particular', 'text', 'Particular', 1, 1, 1, 1, 1, 1, '{}', 4),
(92, 10, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, '{}', 5),
(93, 10, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 6),
(94, 10, 'type', 'text', 'Type', 0, 1, 1, 1, 1, 1, '{}', 7),
(95, 10, 'amount', 'number', 'Amount', 1, 1, 1, 1, 1, 1, '{}', 8),
(96, 10, 'days', 'number', 'Days', 1, 1, 1, 1, 1, 1, '{}', 9),
(97, 10, 'date', 'date', 'Date', 1, 1, 1, 1, 1, 1, '{}', 10),
(98, 10, 'is_active', 'checkbox', 'Is Active', 1, 1, 1, 1, 1, 1, '{\"active\":\"active\",\"notactive\":\"not active\",\"checked\":true}', 11),
(99, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 12),
(100, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(101, 10, 'advertisement_belongsto_shop_relationship', 'relationship', 'shops', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Shop\",\"table\":\"shops\",\"type\":\"belongsTo\",\"column\":\"shop_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(102, 11, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(103, 11, 'customer_query', 'text', 'Customer Query', 1, 1, 1, 1, 1, 1, '{}', 5),
(104, 11, 'answer', 'text', 'Answer', 0, 1, 1, 1, 1, 1, '{}', 6),
(105, 11, 'customer_id', 'number', 'Customer Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(106, 11, 'shop_id', 'number', 'Shop Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(107, 11, 'product_id', 'number', 'Product Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(108, 11, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"processing\",\"options\":{\"processing\":\"processing\",\"completed\":\"completed\",\"declined\":\"declined\"}}', 7),
(109, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(110, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(111, 12, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(112, 12, 'user_id', 'number', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(113, 12, 'shop_id', 'number', 'Shop Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(114, 12, 'credit_limit', 'number', 'Credit Limit', 1, 1, 1, 1, 1, 1, '{}', 4),
(115, 12, 'credit_amount', 'number', 'Credit Amount', 1, 1, 1, 1, 1, 1, '{}', 5),
(116, 12, 'debit_amount', 'number', 'Debit Amount', 1, 1, 1, 1, 1, 1, '{}', 6),
(117, 12, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"REMAINING\",\"options\":{\"REMAINING\":\"REMAINING\",\"PAID\":\"PAID\",\"PENDING\":\"PENDING\"}}', 7),
(118, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(119, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(120, 12, 'credit_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(121, 12, 'credit_belongsto_shop_relationship', 'relationship', 'shops', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Shop\",\"table\":\"shops\",\"type\":\"belongsTo\",\"column\":\"shop_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(132, 7, 'is_active', 'checkbox', 'Is Active', 0, 1, 1, 1, 1, 1, '{\"active\":\"active\",\"notactive\":\"not active\",\"checked\":true}', 12),
(133, 14, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(134, 14, 'product_id', 'number', 'Product Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(135, 14, 'is_active', 'checkbox', 'Is Active', 1, 1, 1, 1, 1, 1, '{\"active\":\"active\",\"notactive\":\"not active\",\"checked\":true}', 3),
(136, 14, 'color', 'text', 'Color', 0, 1, 1, 1, 1, 1, '{}', 4),
(137, 14, 'size', 'text', 'Size', 0, 1, 1, 1, 1, 1, '{}', 5),
(138, 14, 'quantity', 'number', 'Quantity', 0, 1, 1, 1, 1, 1, '{}', 6),
(139, 14, 'images', 'image', 'Images', 0, 1, 1, 1, 1, 1, '{}', 7),
(140, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(141, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(142, 14, 'stock_belongsto_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(143, 15, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(144, 15, 'shop_id', 'number', 'Shop Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(145, 15, 'percent', 'number', 'Percent', 0, 1, 1, 1, 1, 1, '{}', 3),
(146, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(147, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(148, 15, 'comission_belongsto_shop_relationship', 'relationship', 'shops', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Shop\",\"table\":\"shops\",\"type\":\"belongsTo\",\"column\":\"shop_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(149, 16, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(150, 16, 'starting_location', 'text', 'Starting Location', 0, 1, 1, 1, 1, 1, '{}', 4),
(151, 16, 'ending_location', 'text', 'Ending Location', 0, 1, 1, 1, 1, 1, '{}', 5),
(152, 16, 'route_name', 'text', 'Route Name', 1, 1, 1, 1, 1, 1, '{}', 6),
(153, 16, 'km', 'number', 'Km', 0, 1, 1, 1, 1, 1, '{}', 7),
(154, 16, 'total_count', 'number', 'Total Count', 0, 1, 1, 1, 1, 1, '{}', 8),
(155, 16, 'details', 'text', 'Details', 0, 1, 1, 1, 1, 1, '{}', 9),
(156, 16, 'rider_id', 'number', 'Rider Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(157, 16, 'shop_id', 'number', 'Shop Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(158, 16, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"collecting\",\"options\":{\"collecting\":\"collecting\",\"route\":\"route\",\"ready\":\"ready\",\"completed\":\"completed\"}}', 10),
(159, 16, 'time', 'select_dropdown', 'Time', 0, 1, 1, 1, 1, 1, '{\"default\":\"day\",\"options\":{\"morning\":\"morning\",\"day\":\"day\",\"evening\":\"evening\",\"night\":\"night\"}}', 11),
(160, 16, 'is_active', 'checkbox', 'Is Active', 1, 1, 1, 1, 1, 1, '{\"active\":\"active\",\"notactive\":\"notactive\",\"checked\":true}', 12),
(161, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 13),
(162, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(163, 16, 'route_belongsto_delivery_rider_relationship', 'relationship', 'delivery_riders', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\DeliveryRider\",\"table\":\"delivery_riders\",\"type\":\"belongsTo\",\"column\":\"rider_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(164, 16, 'route_belongsto_shop_relationship', 'relationship', 'shops', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Shop\",\"table\":\"shops\",\"type\":\"belongsTo\",\"column\":\"shop_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(165, 17, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(166, 17, 'particular', 'text', 'Particular', 1, 1, 1, 1, 1, 1, '{}', 3),
(167, 17, 'delivery_task', 'select_dropdown', 'Delivery Task', 1, 1, 1, 1, 1, 1, '{\"default\":\"parcel\",\"options\":{\"parcel\":\"parcel\",\"groceries\":\"groceries\",\"food\":\"food\",\"document\":\"document\",\"ridesharing\":\"ridesharing\",\"courier\":\"courier\"}}', 4),
(168, 17, 'delivery_rate', 'number', 'Delivery Rate', 0, 1, 1, 1, 1, 1, '{}', 5),
(169, 17, 'delivery_max_charge', 'number', 'Delivery Max Charge', 0, 1, 1, 1, 1, 1, '{}', 6),
(170, 17, 'delivery_rider_rate', 'number', 'Delivery Rider Rate', 0, 1, 1, 1, 1, 1, '{}', 7),
(171, 17, 'delivery_rider_max_charge', 'number', 'Delivery Rider Max Charge', 0, 1, 1, 1, 1, 1, '{}', 8),
(172, 17, 'total_days_of_delivery', 'text', 'Total Days Of Delivery', 0, 1, 1, 1, 1, 1, '{}', 9),
(173, 17, 'shop_id', 'number', 'Shop Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(174, 17, 'delivery_weight', 'number', 'Delivery Weight', 0, 1, 1, 1, 1, 1, '{}', 10),
(175, 17, 'delivery_distance', 'number', 'Delivery Distance', 0, 1, 1, 1, 1, 1, '{}', 11),
(176, 17, 'hourly_rate', 'number', 'Hourly Rate', 0, 1, 1, 1, 1, 1, '{}', 12),
(177, 17, 'delivery_additional_rate', 'number', 'Delivery Additional Rate', 0, 1, 1, 1, 1, 1, '{}', 13),
(178, 17, 'petrol_per_km', 'number', 'Petrol Per Km', 0, 1, 1, 1, 1, 1, '{}', 14),
(179, 17, 'recharge_amount', 'number', 'Recharge Amount', 0, 1, 1, 1, 1, 1, '{}', 15),
(180, 17, 'delivery_type', 'select_dropdown', 'Delivery Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"standard\",\"options\":{\"standard\":\"standard\",\"express\":\"express\",\"custom\":\"custom\",\"emergency\":\"emergency\"}}', 16),
(181, 17, 'delivery_vehicle', 'select_dropdown', 'Delivery Vehicle', 1, 1, 1, 1, 1, 1, '{\"default\":\"motorbike\",\"options\":{\"motorbike\":\"motorbike\",\"cycle\":\"cycle\",\"electric_bike\":\"electric bike\",\"electric_car\":\"electric car\",\"van\":\"van\",\"taxi\":\"taxi\",\"truck\":\"truck\",\"bus\":\"bus\",\"other\":\"others\"}}', 17),
(182, 17, 'state', 'number', 'State', 0, 1, 1, 1, 1, 1, '{}', 18),
(183, 17, 'district', 'text', 'District', 0, 1, 1, 1, 1, 1, '{}', 19),
(184, 17, 'address', 'text', 'Address', 0, 1, 1, 1, 1, 1, '{}', 20),
(185, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 21),
(186, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 22),
(187, 17, 'delivery_package_belongsto_shop_relationship', 'relationship', 'shops', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Shop\",\"table\":\"shops\",\"type\":\"belongsTo\",\"column\":\"shop_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 23);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-07-12 21:59:05', '2021-07-12 21:59:05'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-07-12 21:59:05', '2021-07-12 21:59:05'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-07-12 21:59:05', '2021-07-12 21:59:05'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-07-12 21:59:10', '2021-07-12 21:59:10'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-07-12 21:59:11', '2021-07-12 21:59:11'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-07-12 21:59:13', '2021-07-12 21:59:13'),
(7, 'products', 'products', 'Product', 'Products', 'voyager-treasure-open', 'App\\Models\\Product', 'App\\Policies\\ProductPolicy', 'App\\Http\\Controllers\\Admin\\ProductController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-12 23:01:09', '2021-07-24 10:51:45'),
(8, 'shops', 'shops', 'Shop', 'Shops', 'voyager-shop', 'App\\Models\\Shop', 'App\\Policies\\ShopPolicy', 'App\\Http\\Controllers\\Admin\\ShopController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-12 23:03:57', '2021-07-14 01:08:13'),
(9, 'gifts', 'gifts', 'Gift', 'Gifts', 'voyager-gift', 'App\\Models\\Gift', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-12 23:20:15', '2021-07-12 23:20:15'),
(10, 'advertisements', 'advertisements', 'Advertisement', 'Advertisements', 'voyager-brush', 'App\\Models\\Advertisement', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-13 21:50:39', '2021-07-13 21:56:14'),
(11, 'shop_customer_services', 'shop-customer-services', 'Shop Customer Service', 'Shop Customer Services', 'voyager-people', 'App\\Models\\ShopCustomerService', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-20 02:26:15', '2021-07-20 02:26:15'),
(12, 'credits', 'credits', 'Credit', 'Credits', 'voyager-logbook', 'App\\Models\\Credit', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-20 02:40:48', '2021-07-20 02:41:50'),
(14, 'stocks', 'stocks', 'Stock', 'Stocks', 'voyager-list', 'App\\Models\\Stock', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-24 11:16:16', '2021-07-24 11:18:58'),
(15, 'comissions', 'comissions', 'Comission', 'Comissions', 'voyager-pie-graph', 'App\\Models\\Comission', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-25 01:32:02', '2021-07-25 01:32:44'),
(16, 'routes', 'routes', 'Route', 'Routes', 'voyager-anchor', 'App\\Models\\Route', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-08 21:54:16', '2021-08-08 22:13:05'),
(17, 'delivery_packages', 'delivery-packages', 'Delivery Package', 'Delivery Packages', 'voyager-company', 'App\\Models\\Delivery_package', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-08 22:54:07', '2021-08-08 22:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `objective` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_type` enum('standard','express','custom','emergency','others') COLLATE utf8_unicode_ci NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `task` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_packages`
--

CREATE TABLE `delivery_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_task` enum('parcel','groceries','food','document','ridesharing','courier') COLLATE utf8_unicode_ci NOT NULL,
  `delivery_rate` double(8,2) DEFAULT NULL,
  `delivery_max_charge` double(8,2) DEFAULT NULL,
  `delivery_min_charge` double(8,2) DEFAULT NULL,
  `delivery_rider_rate` double(8,2) DEFAULT NULL,
  `delivery_rider_max_charge` double(8,2) DEFAULT NULL,
  `total_days_of_delivery` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_weight` double(8,2) DEFAULT NULL,
  `delivery_distance` double(8,2) DEFAULT NULL,
  `hourly_rate` double(8,2) DEFAULT NULL,
  `delivery_additional_rate` double(8,2) DEFAULT NULL,
  `petrol_per_km` double(8,2) DEFAULT NULL,
  `recharge_amount` double(8,2) DEFAULT NULL,
  `delivery_type` enum('standard','courier','express','custom','emergency') COLLATE utf8_unicode_ci NOT NULL,
  `delivery_vehicle` enum('motorbike','cycle','electric_bike','electric_car','van','truck','taxi','bus','other') COLLATE utf8_unicode_ci NOT NULL,
  `state` int(50) DEFAULT NULL,
  `district` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','notactive') COLLATE utf8_unicode_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `delivery_packages`
--

INSERT INTO `delivery_packages` (`id`, `particular`, `delivery_task`, `delivery_rate`, `delivery_max_charge`, `delivery_min_charge`, `delivery_rider_rate`, `delivery_rider_max_charge`, `total_days_of_delivery`, `shop_id`, `delivery_weight`, `delivery_distance`, `hourly_rate`, `delivery_additional_rate`, `petrol_per_km`, `recharge_amount`, `delivery_type`, `delivery_vehicle`, `state`, `district`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'standard', 'parcel', 15.00, 100.00, NULL, 60.00, 60.00, '3', 1, 1.00, 10.00, 0.00, 15.00, 35.00, 50.00, 'standard', 'motorbike', 3, 'kathmandu', 'koteshwor', 'active', NULL, NULL),
(2, 'standard', 'parcel', 15.00, 100.00, NULL, 60.00, 60.00, '3', 1, 1.00, 10.00, 0.00, 12.00, 35.00, 50.00, 'standard', 'motorbike', 3, 'lalitpur', 'sathdobato', 'active', NULL, NULL),
(3, 'standard', 'parcel', 15.00, 100.00, 45.00, 60.00, 603.00, '2-3', 1, 1.00, 10.00, 0.00, 15.00, 35.00, 50.00, 'standard', 'motorbike', 3, 'Bhaktapur', 'kaushaltar', 'active', NULL, NULL),
(4, 'courier', 'courier', 50.00, 200.00, NULL, 15.00, 75.00, '3', 1, 1.00, 10.00, NULL, 15.00, 35.00, 50.00, 'courier', 'bus', 3, 'Bhaktapur', 'lokanthali', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_package_addresses`
--

CREATE TABLE `delivery_package_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_package_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` double(8,4) DEFAULT NULL,
  `latitude` double(8,4) DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `delivery_package_addresses`
--

INSERT INTO `delivery_package_addresses` (`id`, `delivery_package_id`, `address`, `longitude`, `latitude`, `shop_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 3, 'koteshwor', 27.6755, 85.3659, 1, 1, '2021-09-02 21:06:25', NULL),
(2, 3, 'lokanthali', 27.6738, 85.3595, 1, 1, '2021-09-02 21:08:53', NULL),
(3, 3, 'naya thimi', 27.6735, 85.3853, 1, 1, '2021-09-02 21:09:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_parcels`
--

CREATE TABLE `delivery_parcels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `track` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sender` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available_time` enum('morning','day','evening','night') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'day',
  `total_amount_collection` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `km` double(8,2) DEFAULT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `delivery_charge` double(8,2) DEFAULT NULL,
  `status` enum('pending','packaging_completed','ready_to_deliver','delivery_completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `review` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `query` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_count` int(20) DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_type` enum('customer','supplier','user','return') COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `delivery_parcels`
--

INSERT INTO `delivery_parcels` (`id`, `track`, `pickup_address`, `delivery_address`, `pickup_contact_no`, `delivery_contact_no`, `delivery_package_id`, `particular`, `sender`, `receiver`, `available_time`, `total_amount_collection`, `weight`, `km`, `discount`, `delivery_charge`, `status`, `review`, `email`, `query`, `item_count`, `shop_id`, `order_id`, `delivery_type`, `user_id`, `is_paid`, `created_at`, `updated_at`) VALUES
(2, 'gfdgdfg', 'kathamdnu', 'bhaktapur', '984521542', '99845678548', NULL, 'dsfdfdsf', NULL, NULL, 'day', 1500.00, 5.00, 10.00, 10.00, 100.00, 'packaging_completed', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, '2021-08-09 00:21:53'),
(3, 'no-612a1e20e4356', NULL, 'bhaktapur', NULL, '+9779849594857', NULL, 'online shopping', NULL, NULL, 'day', 1500.00, NULL, NULL, NULL, NULL, 'packaging_completed', NULL, NULL, NULL, NULL, NULL, 116, 'customer', 1, 0, '2021-08-28 05:44:36', '2021-08-28 16:02:22'),
(4, 'no-6132abedecc79', NULL, 'Bhaktapur', NULL, '9849594857', NULL, 'online shopping', NULL, NULL, 'day', 1700.00, NULL, NULL, NULL, 100.00, 'pending', NULL, NULL, NULL, NULL, NULL, 117, 'customer', 1, 0, '2021-09-03 17:27:45', '2021-09-03 17:27:45'),
(5, 'no-6132b1bdc80de', NULL, 'om shanti ko ghar najikai', NULL, '+9779849594857', NULL, 'online shopping', NULL, NULL, 'day', 1700.00, NULL, NULL, NULL, 100.00, 'pending', NULL, NULL, NULL, NULL, NULL, 118, 'customer', 1, 0, '2021-09-03 17:52:33', '2021-09-03 17:52:33'),
(6, 'no-6132c7c31b4d0', NULL, 'trfddf', NULL, '+9779849594857', NULL, 'online shopping', NULL, NULL, 'day', 3445.00, NULL, NULL, NULL, 45.00, 'pending', NULL, NULL, NULL, NULL, NULL, 119, 'customer', 1, 0, '2021-09-03 19:26:31', '2021-09-03 19:26:31'),
(7, 'no-6132c88dbfaa5', NULL, 'tole bikas samiti', NULL, '+9779849594857', NULL, 'online shopping', NULL, NULL, 'day', 1700.00, NULL, NULL, NULL, 100.00, 'pending', NULL, NULL, NULL, NULL, NULL, 120, 'customer', 1, 0, '2021-09-03 19:29:53', '2021-09-03 19:29:53'),
(8, 'no-6132c9a210593', NULL, 'fgfgfg', NULL, '+9779849594857', NULL, 'online shopping', NULL, NULL, 'day', 3500.00, NULL, NULL, NULL, 100.00, 'pending', NULL, NULL, NULL, NULL, NULL, 121, 'customer', 1, 0, '2021-09-03 19:34:30', '2021-09-03 19:34:30'),
(9, 'no-6132cd7734837', NULL, 'fghfghghghghghghghghghgh', NULL, '+9779849594857', NULL, 'online shopping', NULL, NULL, 'day', 1700.00, NULL, NULL, NULL, 100.00, 'pending', NULL, NULL, NULL, NULL, NULL, 123, 'customer', 1, 0, '2021-09-03 19:50:51', '2021-09-03 19:50:51'),
(10, 'no-6132d073746dc', NULL, 'global bank pachadi', NULL, '9843777683', NULL, 'online shopping', NULL, NULL, 'day', 2200.00, NULL, NULL, NULL, 100.00, 'pending', NULL, NULL, NULL, NULL, NULL, 124, 'customer', 1, 0, '2021-09-03 20:03:35', '2021-09-03 20:03:35'),
(11, 'no-6132d1a05d483', 'kaushaltar', 'bank paxadi ko bata', '9843777683', '+9779849594857', NULL, 'online shopping', NULL, NULL, 'day', 1700.00, NULL, NULL, NULL, 100.00, 'pending', NULL, NULL, NULL, 1, NULL, 125, 'customer', 1, 0, '2021-09-03 20:08:36', '2021-09-03 20:08:36'),
(12, 'no-6132d73c3a718', 'koteshwor', 'baneshwor', '9849594857', '98556845', NULL, 'parcel', 'online shop', 'radhika', 'day', 1000.00, 3.00, NULL, NULL, NULL, 'pending', NULL, 'anushil.karki34@gmail.com', 'do it fast it wmergency', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL),
(13, 'no-6132d85d9b81d', 'baneshwor', 'budhanilkantha', '9856232565', '9856232565', NULL, 'parcel', 'online shop', 'radhika', 'day', 2000.00, 1.00, NULL, NULL, NULL, 'pending', NULL, 'manoj@manoj.com', 'fost', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_riders`
--

CREATE TABLE `delivery_riders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excitement` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vehicle_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vehicle_type` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vehicle_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_type` enum('part_time','full_time') COLLATE utf8_unicode_ci DEFAULT 'part_time',
  `job_shift` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `delivery_riders`
--

INSERT INTO `delivery_riders` (`id`, `team_id`, `user_id`, `name`, `address`, `email`, `working_address`, `phone`, `query`, `experience`, `excitement`, `vehicle_no`, `vehicle_type`, `vehicle_name`, `license_no`, `document_image`, `job_type`, `job_shift`, `joined_date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'anushil', 'kathmandu', NULL, NULL, '9843777683', NULL, NULL, NULL, NULL, 'bike', 'pulsar 220', NULL, NULL, 'part_time', NULL, NULL, 0, '2021-08-08 07:25:13', '2021-08-08 07:25:13'),
(3, NULL, 2, 'anushil', 'kathmandu', NULL, NULL, '9843777683', NULL, NULL, NULL, NULL, 'motorbike', 'pulsar 220', NULL, NULL, 'part_time', NULL, NULL, 0, '2021-08-12 04:28:18', '2021-08-12 04:28:18'),
(4, NULL, 1, 'anushil karki', 'bhaktapur', NULL, NULL, '9849594857', NULL, NULL, NULL, NULL, 'motorbike', 'pulsar 150', NULL, NULL, 'part_time', NULL, NULL, 0, '2021-09-03 19:02:21', '2021-09-03 19:02:21'),
(5, NULL, 1, 'Anushil karkiiii', 'kaushaltar,bhaktapur', NULL, NULL, '9849594857', NULL, NULL, NULL, NULL, 'motorbike', 'pulsar 150', NULL, NULL, 'part_time', NULL, NULL, 0, '2021-09-03 19:06:06', '2021-09-03 19:06:06'),
(6, NULL, NULL, 'nishan bhattarai', 'nala', 'nisan@gmail.com', 'Bhaktapur', '982021313', 'sdfsdfds', 'yes', 'large', NULL, 'cycle', 'bmx', NULL, NULL, 'part_time', 'day', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_rider_reports`
--

CREATE TABLE `delivery_rider_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rider_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `total_credit_amount` double(8,2) NOT NULL,
  `total_earning_amount` double(8,2) NOT NULL,
  `total_reward_amount` double(8,2) NOT NULL,
  `total_task_point` int(11) NOT NULL,
  `total_delivery_completed` int(11) NOT NULL,
  `total_delivery_failed` int(11) NOT NULL,
  `total_routes_covered` int(11) NOT NULL,
  `total_team_task_completed` int(11) NOT NULL,
  `total_team_task_failed` int(11) NOT NULL,
  `total_collected_amount` double(8,2) NOT NULL,
  `report_type` enum('yearly','monthly','weekly','daily') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_tasks`
--

CREATE TABLE `delivery_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_status` enum('pending','on_way','completed','failed','verified') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `delivery_id` bigint(20) UNSIGNED NOT NULL,
  `delivery` bigint(20) UNSIGNED DEFAULT NULL,
  `rider_earning` double(8,2) DEFAULT NULL,
  `route_id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `delivery_tasks`
--

INSERT INTO `delivery_tasks` (`id`, `task_status`, `delivery_id`, `delivery`, `rider_earning`, `route_id`, `reason`, `date`, `created_at`, `updated_at`) VALUES
(4, 'pending', 2, NULL, NULL, 1, NULL, NULL, '2021-08-09 00:21:53', '2021-08-09 00:21:53'),
(5, 'completed', 2, NULL, 4.00, 1, 'completed', NULL, NULL, '2021-08-27 15:52:13'),
(6, 'pending', 3, NULL, NULL, 1, NULL, NULL, '2021-08-28 16:02:22', '2021-08-28 16:02:22');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_amount` double(8,2) NOT NULL,
  `status` enum('NOTUSED','USED','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NOTUSED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distribution_centers`
--

CREATE TABLE `distribution_centers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` double(8,4) DEFAULT NULL,
  `longitude` double(8,4) DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `objective` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('pickndrop','warehouse','return','business','others') COLLATE utf8_unicode_ci NOT NULL,
  `joined_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `distribution_centers`
--

INSERT INTO `distribution_centers` (`id`, `shop_id`, `particular`, `location`, `latitude`, `longitude`, `contact`, `objective`, `type`, `joined_date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'kaushaltar', 'Bhaktapur', 27.6710, 85.4298, '9843777683', 'order dispatch from here for bhaktapur area', 'business', '2021-09-03', 1, '2021-09-02 20:30:34', '2021-09-02 20:30:34');

-- --------------------------------------------------------

--
-- Table structure for table `easy_orders`
--

CREATE TABLE `easy_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('processing','completed','declined') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'processing',
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `easy_orders`
--

INSERT INTO `easy_orders` (`id`, `product_id`, `user_id`, `note`, `name`, `phone_no`, `address`, `status`, `is_paid`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, NULL, '9849594857', 'bhaktapur', 'declined', 0, '2021-07-25 02:15:48', '2021-07-25 02:15:59');

-- --------------------------------------------------------

--
-- Table structure for table `employee_earnings`
--

CREATE TABLE `employee_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` double(8,2) NOT NULL,
  `date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_payments`
--

CREATE TABLE `employee_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `rider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `emp_id` bigint(20) UNSIGNED DEFAULT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` double(8,2) DEFAULT NULL,
  `paid` double(8,2) DEFAULT NULL,
  `remaining` double(8,2) DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `vat` double(8,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment_method` enum('cash_on_delivery','card','mobile_wallet') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cash_on_delivery',
  `payment_type` enum('to_receive','to_pay') COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('completed','remaining','pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_profiles`
--

CREATE TABLE `employee_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `objective` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` enum('marketing','customer','delivery','financial') COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_task_completed` int(11) NOT NULL,
  `total_task_failed` int(11) NOT NULL,
  `total_task_point` int(11) DEFAULT NULL,
  `total_report_submitted` int(11) DEFAULT NULL,
  `total_reward` int(11) DEFAULT NULL,
  `total_earning` double(8,2) DEFAULT NULL,
  `today_earning` double(8,2) DEFAULT NULL,
  `salary` double(8,2) DEFAULT NULL,
  `total_payment` int(110) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `goal_status` enum('not_completed','completed') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `franchises`
--

CREATE TABLE `franchises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `franchise_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `investment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excitement` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `franchises`
--

INSERT INTO `franchises` (`id`, `name`, `address`, `phone`, `franchise_location`, `education`, `investment`, `experience`, `excitement`, `email`, `query`, `created_at`, `updated_at`) VALUES
(1, 'anushil karki', 'bhaktapur', '+9779849594857', 'Sankhuwasabha', 'bachelor', 'medium', 'yes', 'medium', 'anushil.karki34@gmail.com', 'Submit', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gifts`
--

INSERT INTO `gifts` (`id`, `particular`, `description`, `created_at`, `updated_at`) VALUES
(1, 'new house gift', 'this gift is suitable for those who are changing new home and are in need of home applicances.', '2021-07-12 23:20:51', '2021-07-12 23:20:51'),
(2, 'birthday gift', 'This is type of gift that are given at birthday of someone special', '2021-07-20 02:49:26', '2021-07-20 02:49:26'),
(3, 'wedding gift', 'This type of gift is given to newly wedded couples.', '2021-07-24 10:05:18', '2021-07-24 10:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_statements`
--

CREATE TABLE `income_statements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `total_income` double(8,2) NOT NULL,
  `total_expense` double(8,2) NOT NULL,
  `net_income` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language_configurations`
--

CREATE TABLE `language_configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `configuration_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `liabilities`
--

CREATE TABLE `liabilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `liability_type` enum('current','long_term','bad_debt') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'current',
  `total_amount` double(8,2) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `intrest_rate` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketings`
--

CREATE TABLE `marketings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `task` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `objective` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `marketing_type` enum('product','service','supplier','shop') COLLATE utf8_unicode_ci NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_reports`
--

CREATE TABLE `marketing_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `army_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `total_credit_amount` double(8,2) NOT NULL,
  `total_earning_amount` double(8,2) NOT NULL,
  `total_reward_amount` double(8,2) NOT NULL,
  `total_task_point` int(11) NOT NULL,
  `total_marketing_completed` int(11) NOT NULL,
  `total_marketing_failed` int(11) NOT NULL,
  `total_team_task_completed` int(11) NOT NULL,
  `total_team_task_failed` int(11) NOT NULL,
  `total_orders` double(8,2) NOT NULL,
  `report_type` enum('yearly','monthly','weekly','daily') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_tasks`
--

CREATE TABLE `marketing_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `army_id` bigint(20) UNSIGNED NOT NULL,
  `task_status` enum('pending','on_way','completed','failed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `marketing_id` bigint(20) UNSIGNED NOT NULL,
  `head_earning` double(8,2) NOT NULL,
  `marketing_earning` double(8,2) NOT NULL,
  `available_time` enum('morning','day','evening','night') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-07-12 21:59:06', '2021-07-12 21:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-07-12 21:59:06', '2021-07-12 21:59:06', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-07-12 21:59:06', '2021-07-12 21:59:06', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-07-12 21:59:06', '2021-07-12 21:59:06', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-07-12 21:59:06', '2021-07-12 21:59:06', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-07-12 21:59:06', '2021-07-12 21:59:06', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-07-12 21:59:06', '2021-07-12 21:59:06', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-07-12 21:59:06', '2021-07-12 21:59:06', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-07-12 21:59:06', '2021-07-12 21:59:06', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-07-12 21:59:06', '2021-07-12 21:59:06', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-07-12 21:59:07', '2021-07-12 21:59:07', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2021-07-12 21:59:10', '2021-07-12 21:59:10', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2021-07-12 21:59:12', '2021-07-12 21:59:12', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2021-07-12 21:59:13', '2021-07-12 21:59:13', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2021-07-12 21:59:16', '2021-07-12 21:59:16', 'voyager.hooks', NULL),
(15, 1, 'Products', '', '_self', 'voyager-treasure-open', NULL, NULL, 15, '2021-07-12 23:01:10', '2021-07-12 23:01:10', 'voyager.products.index', NULL),
(16, 1, 'Shops', '', '_self', 'voyager-shop', NULL, NULL, 16, '2021-07-12 23:03:58', '2021-07-12 23:03:58', 'voyager.shops.index', NULL),
(17, 1, 'Gifts', '', '_self', 'voyager-gift', NULL, NULL, 17, '2021-07-12 23:20:15', '2021-07-12 23:20:15', 'voyager.gifts.index', NULL),
(18, 1, 'Advertisements', '', '_self', 'voyager-brush', NULL, NULL, 18, '2021-07-13 21:50:40', '2021-07-13 21:50:40', 'voyager.advertisements.index', NULL),
(19, 1, 'Shop Customer Services', '', '_self', 'voyager-people', NULL, NULL, 19, '2021-07-20 02:26:15', '2021-07-20 02:26:15', 'voyager.shop-customer-services.index', NULL),
(20, 1, 'Credits', '', '_self', 'voyager-logbook', NULL, NULL, 20, '2021-07-20 02:40:48', '2021-07-20 02:40:48', 'voyager.credits.index', NULL),
(22, 1, 'Stocks', '', '_self', 'voyager-list', NULL, NULL, 21, '2021-07-24 11:16:17', '2021-07-24 11:16:17', 'voyager.stocks.index', NULL),
(23, 1, 'Comissions', '', '_self', 'voyager-pie-graph', NULL, NULL, 22, '2021-07-25 01:32:03', '2021-07-25 01:32:03', 'voyager.comissions.index', NULL),
(24, 1, 'Routes', '', '_self', 'voyager-anchor', NULL, NULL, 23, '2021-08-08 21:54:16', '2021-08-08 21:54:16', 'voyager.routes.index', NULL),
(25, 1, 'Delivery Packages', '', '_self', 'voyager-company', NULL, NULL, 24, '2021-08-08 22:54:08', '2021-08-08 22:54:08', 'voyager.delivery-packages.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2016_01_01_000000_add_voyager_user_fields', 1),
(5, '2016_01_01_000000_create_data_types_table', 1),
(6, '2016_01_01_000000_create_pages_table', 1),
(7, '2016_01_01_000000_create_posts_table', 1),
(8, '2016_02_15_204651_create_categories_table', 1),
(9, '2016_05_19_173453_create_menu_table', 1),
(10, '2016_10_21_190000_create_roles_table', 1),
(11, '2016_10_21_190000_create_settings_table', 1),
(12, '2016_11_30_135954_create_permission_table', 1),
(13, '2016_11_30_141208_create_permission_role_table', 1),
(14, '2016_12_26_201236_data_types__add__server_side', 1),
(15, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(16, '2017_01_14_005015_create_translations_table', 1),
(17, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(18, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(19, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(20, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(21, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(22, '2017_08_05_000000_add_group_to_settings_table', 1),
(23, '2017_11_26_013050_add_user_role_relationship', 1),
(24, '2017_11_26_015000_create_user_roles_table', 1),
(25, '2018_03_11_000000_add_user_settings', 1),
(26, '2018_03_14_000000_add_details_to_data_types_table', 1),
(27, '2018_03_16_000000_make_settings_value_nullable', 1),
(28, '2019_08_19_000000_create_failed_jobs_table', 1),
(29, '2020_11_08_151501_create_shops_table', 1),
(30, '2020_11_08_151602_create_addresses_table', 1),
(31, '2020_11_08_152103_create_comments_table', 1),
(32, '2020_11_08_152211_create_gifts_table', 1),
(33, '2020_11_08_152212_create_products_table', 1),
(34, '2020_11_08_153036_create_product_categories_table', 1),
(35, '2020_11_08_153119_create_wishlists_table', 1),
(36, '2020_11_08_153205_create_product_discounts_table', 1),
(37, '2020_11_08_153434_create_product_reviews_table', 1),
(38, '2020_11_08_153537_create_complains_table', 1),
(39, '2020_11_08_153607_create_discounts_table', 1),
(40, '2020_11_08_153706_create_coupons_table', 1),
(41, '2020_11_08_153752_create_newsletters_table', 1),
(42, '2020_11_08_153818_create_browsing_histories_table', 1),
(43, '2020_11_08_153920_create_notes_table', 1),
(44, '2020_11_08_153958_create_credits_table', 1),
(45, '2020_11_08_154105_create_profiles_table', 1),
(46, '2020_11_08_154147_create_orders_table', 1),
(47, '2020_11_08_154607_create_sub_orders_table', 1),
(48, '2020_11_08_154710_create_sub_order_items_table', 1),
(49, '2020_11_08_155127_create_order_items_table', 1),
(50, '2020_11_08_155248_create_delivery_packages_table', 1),
(51, '2020_11_08_155345_create_stocks_table', 1),
(52, '2020_11_08_155448_create_language_configurations_table', 1),
(53, '2020_11_08_155639_create_advertisements_table', 1),
(54, '2020_11_08_155703_create_shop_goals_table', 1),
(55, '2020_11_08_155835_create_currencies_table', 1),
(56, '2020_11_08_155855_create_assets_table', 1),
(57, '2020_11_08_155916_create_sales_table', 1),
(58, '2020_11_08_155936_create_taxes_table', 1),
(59, '2020_11_08_160013_create_liabilities_table', 1),
(60, '2020_11_08_160036_create_capitals_table', 1),
(61, '2020_11_08_160059_create_incomes_table', 1),
(62, '2020_11_08_160117_create_expenses_table', 1),
(63, '2020_11_08_160501_create_shop_reports_table', 1),
(64, '2020_11_08_160848_create_delivery_parcels_table', 1),
(65, '2020_11_08_160852_create_shop_payments_table', 1),
(66, '2020_11_08_161118_create_routes_table', 1),
(67, '2020_11_08_161151_create_teams_table', 1),
(68, '2020_11_08_161241_create_team_members_table', 1),
(69, '2020_11_08_161300_create_notices_table', 1),
(70, '2020_11_08_161537_create_team_goals_table', 1),
(71, '2020_11_08_161601_create_marketings_table', 1),
(72, '2020_11_08_161602_create_services_table', 1),
(73, '2020_11_08_161603_create_deliveries_table', 1),
(74, '2020_11_08_161603_create_delivery_riders_table', 1),
(75, '2020_11_08_161603_create_distribution_centers_table', 1),
(76, '2020_11_08_161857_create_employee_profiles_table', 1),
(77, '2020_11_08_161858_create_schedule_meetings_table', 1),
(78, '2020_11_08_162017_create_employee_earnings_table', 1),
(79, '2020_11_08_162201_create_delivery_tasks_table', 1),
(80, '2020_11_08_162246_create_marketing_tasks_table', 1),
(81, '2020_11_08_162401_create_customer_service_tasks_table', 1),
(82, '2020_11_08_162559_create_delivery_rider_reports_table', 1),
(83, '2020_11_08_162701_create_marketing_reports_table', 1),
(84, '2020_11_08_162750_create_customer_service_reports_table', 1),
(85, '2020_11_08_163210_create_shop_ratings_table', 1),
(86, '2020_11_08_163300_create_employee_payments_table', 1),
(87, '2020_11_23_055934_create_inventories_table', 1),
(88, '2020_11_24_082658_create_team_reports_table', 1),
(89, '2020_11_26_105936_create_trial_balances_table', 1),
(90, '2020_11_26_110137_create_income_statements_table', 1),
(91, '2020_11_26_110234_create_balance_sheets_table', 1),
(92, '2020_11_26_110319_create_cash_flows_table', 1),
(93, '2021_07_08_073405_create_sub_order_returns_table', 1),
(94, '2022_11_08_154259_create_customer_purchase_returns_table', 1),
(95, '2023_11_08_153851_create_easy_orders_table', 1),
(96, '2024_11_08_153402_create_shop_customer_services_table', 1),
(97, '2024_11_08_160850_create_customer_payments_table', 1),
(98, '2025_07_02_025728_create_bank_account_table', 1),
(99, '2025_08_18_174739_add_seller_id_to_sub_orders_table', 1),
(100, '2025_11_08_154710_create_sub_order_items_table', 2),
(101, '2025_11_09_154607_create_sub_orders_table', 3),
(102, '2025_12_09_154607_create_comissions_table', 4),
(103, '2025_11_08_163300_create_employee_payments_table', 5),
(104, '2026_11_08_161118_create_routes_table', 6),
(105, '2021_08_27_225918_create_franchises_table', 7),
(106, '2021_09_02_205452_create_delivery_package_addresses_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `textarea` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `textarea`, `user_id`, `shop_id`, `title`, `created_at`, `updated_at`) VALUES
(4, 'dsfasdfdffgsdf', 4, NULL, '<script>function myfunction(p1, p2) {   return p1 * p2;   // The function returns the product of p1 and p2 }</script>', '2021-07-14 22:17:37', '2021-07-14 22:30:07'),
(5, '<script>alert(‘XSS’)</script>', 4, NULL, '<script>alert(‘XSS’)</script>', '2021-07-14 22:38:30', '2021-07-14 22:38:30'),
(6, '<script>alert(document.cookie)</script>', 4, NULL, '<script>alert(document.cookie)</script>', '2021-07-14 22:40:55', '2021-07-14 22:40:55'),
(7, 'customer seric shouldbe good', 1, NULL, 'customer service', '2021-07-20 02:05:05', '2021-07-20 02:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notice` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('processing','completed','declined','returned','exchanged') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'processing',
  `grand_total` double(8,2) DEFAULT NULL,
  `delivery_charge` double(8,2) DEFAULT NULL,
  `item_count` int(11) DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `payment_method` enum('cash_on_delivery','card','mobile_wallet','pre_payment') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cash_on_delivery',
  `order_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_type` enum('gift','shopping') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shopping',
  `shipping_fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_orderid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gift_id` bigint(20) UNSIGNED DEFAULT NULL,
  `review` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pickup_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `grand_total`, `delivery_charge`, `item_count`, `is_paid`, `payment_method`, `order_number`, `order_type`, `shipping_fullname`, `shipping_address`, `shipping_city`, `shipping_state`, `shipping_zipcode`, `shipping_phone`, `shipping_district`, `shipping_time`, `notes`, `paypal_orderid`, `billing_fullname`, `billing_address`, `billing_city`, `billing_state`, `billing_zipcode`, `billing_phone`, `gift_id`, `review`, `user_id`, `pickup_address`, `pickup_contact`, `delivery_time`, `created_at`, `updated_at`) VALUES
(28, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60ee94953df47', 'shopping', 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, NULL, NULL, 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 01:54:01', '2021-07-14 01:54:01'),
(29, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60ee962b5afde', 'shopping', 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, NULL, NULL, 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:00:47', '2021-07-14 02:00:47'),
(30, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60ee97c36c2ea', 'shopping', 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, NULL, NULL, 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:07:35', '2021-07-14 02:07:35'),
(31, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60ee98326420f', 'shopping', 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, NULL, NULL, 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:09:26', '2021-07-14 02:09:26'),
(32, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60ee98335eb5f', 'shopping', 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, NULL, NULL, 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:09:27', '2021-07-14 02:09:27'),
(33, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60ee988a63116', 'shopping', 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, NULL, NULL, 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:10:54', '2021-07-14 02:10:54'),
(34, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60ee98af7b38e', 'shopping', 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, NULL, NULL, 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:11:31', '2021-07-14 02:11:31'),
(35, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60ee9b86854ec', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:23:38', '2021-07-14 02:23:38'),
(36, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60ee9bbb07b1b', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:24:31', '2021-07-14 02:24:31'),
(37, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60ee9d6b9fcb2', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:31:43', '2021-07-14 02:31:43'),
(38, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60ee9fdacf172', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:42:06', '2021-07-14 02:42:06'),
(39, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60eea104ac30b', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:47:04', '2021-07-14 02:47:04'),
(40, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60eea2dc61bd2', 'shopping', 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, NULL, NULL, 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:54:56', '2021-07-14 02:54:56'),
(41, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60eea2ef50dd9', 'shopping', 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, NULL, NULL, 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:55:15', '2021-07-14 02:55:15'),
(42, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60eea32e6b615', 'shopping', 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, NULL, NULL, 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:56:18', '2021-07-14 02:56:18'),
(43, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60eea3e61acda', 'shopping', 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, NULL, NULL, 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 02:59:22', '2021-07-14 02:59:22'),
(44, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60eea44e302f9', 'shopping', 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, NULL, NULL, 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 03:01:06', '2021-07-14 03:01:06'),
(45, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60eea4b300d30', 'shopping', 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, NULL, NULL, 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 03:02:47', '2021-07-14 03:02:47'),
(46, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60eea4e4c1d53', 'shopping', 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, NULL, NULL, 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 03:03:36', '2021-07-14 03:03:36'),
(47, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60eec6648f89a', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 05:26:32', '2021-07-14 05:26:32'),
(48, 'processing', 2300.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60eec9eb1bc6e', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 5, NULL, NULL, NULL, '2021-07-14 05:41:35', '2021-07-14 05:41:35'),
(49, 'processing', 900.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60eecb0ccaa05', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 4, NULL, NULL, NULL, '2021-07-14 05:46:24', '2021-07-14 05:46:24'),
(50, 'processing', 4100.00, NULL, 2, 0, 'cash_on_delivery', 'OrderNumber-60fb9d654630e', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-23 23:11:05', '2021-07-23 23:11:05'),
(51, 'processing', 5900.00, NULL, 2, 0, 'cash_on_delivery', 'OrderNumber-60fb9def72774', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-23 23:13:23', '2021-07-23 23:13:23'),
(52, 'processing', 6800.00, NULL, 3, 0, 'cash_on_delivery', 'OrderNumber-60fb9eb796d17', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-23 23:16:43', '2021-07-23 23:16:43'),
(53, 'processing', 6800.00, NULL, 3, 0, 'cash_on_delivery', 'OrderNumber-60fb9f6257374', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-23 23:19:34', '2021-07-23 23:19:34'),
(54, 'processing', 6800.00, NULL, 3, 0, 'cash_on_delivery', 'OrderNumber-60fba0fae539b', 'shopping', 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, NULL, NULL, 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-23 23:26:22', '2021-07-23 23:26:22'),
(55, 'processing', 6800.00, NULL, 3, 0, 'cash_on_delivery', 'OrderNumber-60fba119241a0', 'shopping', 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, NULL, NULL, 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-23 23:26:53', '2021-07-23 23:26:53'),
(56, 'processing', 6800.00, NULL, 3, 0, 'cash_on_delivery', 'OrderNumber-60fba2028ab70', 'shopping', 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, NULL, NULL, 'manoj adhikari', 'bhaktapur', 'kaushaltar', 'divition', '2323', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-23 23:30:46', '2021-07-23 23:30:46'),
(57, 'processing', 6800.00, NULL, 3, 0, 'cash_on_delivery', 'OrderNumber-60fba37a1b920', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-23 23:37:02', '2021-07-23 23:37:02'),
(58, 'processing', 4800.00, NULL, 3, 0, 'cash_on_delivery', 'OrderNumber-60fc332966533', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, 4, NULL, NULL, NULL, '2021-07-24 09:50:05', '2021-07-24 09:50:05'),
(59, 'processing', 6900.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc5b4d71d3f', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 12:41:21', '2021-07-24 12:41:21'),
(60, 'processing', 6900.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc5b804b474', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 12:42:12', '2021-07-24 12:42:12'),
(61, 'processing', 2300.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc5cf435d3b', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9845956512', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9845956512', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 12:48:24', '2021-07-24 12:48:24'),
(62, 'processing', 2300.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc5d3915da9', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9845956512', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9845956512', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 12:49:33', '2021-07-24 12:49:33'),
(63, 'processing', 4100.00, NULL, 2, 0, 'cash_on_delivery', 'OrderNumber-60fc5ea0821f5', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', 'divition', '56565', '9849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', 'divition', '56565', '9849594857', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 12:55:32', '2021-07-24 12:55:32'),
(64, 'processing', 4600.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc5f3b61a45', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 12:58:07', '2021-07-24 12:58:07'),
(65, 'processing', 4600.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc5ffccd7c5', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:01:20', '2021-07-24 13:01:20'),
(66, 'processing', 4600.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc602b0387f', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', 'divition', '56565', '9849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', 'divition', '56565', '9849594857', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:02:07', '2021-07-24 13:02:07'),
(67, 'processing', 4600.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc605af393d', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:02:55', '2021-07-24 13:02:55'),
(68, 'processing', 4600.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc61e9ea1c0', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9845956512', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9845956512', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:09:33', '2021-07-24 13:09:33'),
(69, 'processing', 2300.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc632daacec', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:14:57', '2021-07-24 13:14:57'),
(70, 'processing', 2300.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc635c7ccfa', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:15:44', '2021-07-24 13:15:44'),
(71, 'processing', 2300.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc6405e8e1c', 'shopping', 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, NULL, NULL, 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:18:33', '2021-07-24 13:18:33'),
(72, 'processing', 4600.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc65bcc36e4', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:25:52', '2021-07-24 13:25:52'),
(73, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc65e9f2742', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:26:37', '2021-07-24 13:26:37'),
(74, 'processing', 6900.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc6607bf338', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:27:07', '2021-07-24 13:27:07'),
(75, 'processing', 6900.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc6892540c1', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:37:58', '2021-07-24 13:37:58'),
(76, 'processing', 4600.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc68abb6e87', 'shopping', 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, NULL, NULL, 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:38:23', '2021-07-24 13:38:23'),
(77, 'processing', 13800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc68f1a621a', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:39:33', '2021-07-24 13:39:33'),
(78, 'processing', 13800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc695c05e66', 'shopping', 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, NULL, NULL, 'admin', 'kathmandu', 'koteshwor', 'divition', '323232', '9856256541', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:41:20', '2021-07-24 13:41:20'),
(79, 'processing', 13800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc69d94fdba', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:43:25', '2021-07-24 13:43:25'),
(80, 'processing', 11500.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc6c3857831', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:53:32', '2021-07-24 13:53:32'),
(81, 'processing', 11500.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc6c82e61d3', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9845956512', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9845956512', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:54:46', '2021-07-24 13:54:46'),
(82, 'processing', 11500.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc6cbe9d592', 'shopping', 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, NULL, NULL, 'Anushil karki', 'kaushaltar,bhaktapur', 'kathmandu', 'divition', '44800', '9843777683', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:55:46', '2021-07-24 13:55:46'),
(83, 'processing', 6900.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fc6d9e47a1c', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-24 13:59:30', '2021-07-24 13:59:30'),
(84, 'processing', 4100.00, NULL, 2, 0, 'cash_on_delivery', 'OrderNumber-60fd0a5eabb6a', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-25 01:08:18', '2021-07-25 01:08:18'),
(85, 'processing', 2300.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fd0ab84eb4d', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-25 01:09:48', '2021-07-25 01:09:48'),
(86, 'processing', 3200.00, NULL, 2, 0, 'cash_on_delivery', 'OrderNumber-60fd0d3c702c0', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-25 01:20:32', '2021-07-25 01:20:32'),
(87, 'processing', 11800.00, NULL, 2, 0, 'cash_on_delivery', 'OrderNumber-60fd232568f59', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9856232565', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-25 02:54:01', '2021-07-25 02:54:01'),
(88, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60fd244dab3c0', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '+9779849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '+9779849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-07-25 02:58:57', '2021-07-25 02:58:57'),
(89, 'processing', 900.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-60ffe81f2a2e4', 'shopping', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, 1, NULL, NULL, NULL, '2021-07-27 05:18:59', '2021-07-27 05:18:59'),
(90, 'processing', 900.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-6109365501f5f', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, 1, NULL, NULL, NULL, '2021-08-03 06:43:05', '2021-08-03 06:43:05'),
(91, 'processing', 900.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-610938837b8f9', 'shopping', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '9849594857', NULL, NULL, 1, NULL, NULL, NULL, '2021-08-03 06:52:23', '2021-08-03 06:52:23'),
(92, 'processing', 900.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-6113506a6f47d', 'shopping', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, 1, NULL, NULL, NULL, '2021-08-10 22:37:02', '2021-08-10 22:37:02'),
(93, 'processing', 10000.00, NULL, 2, 0, 'cash_on_delivery', 'OrderNumber-61162e8700414', 'shopping', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, 1, NULL, NULL, NULL, '2021-08-13 02:49:15', '2021-08-13 02:49:15'),
(94, 'processing', 4600.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-611691e4819a4', 'shopping', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-13 09:53:12', '2021-08-13 09:53:12'),
(95, 'processing', 3000.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-6116940943c29', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-13 10:02:21', '2021-08-13 10:02:21'),
(96, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-61169d0a867a6', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, 4, NULL, NULL, NULL, '2021-08-13 10:40:46', '2021-08-13 10:40:46'),
(97, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-61169e092c269', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, 4, NULL, NULL, NULL, '2021-08-13 10:45:01', '2021-08-13 10:45:01'),
(98, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-6116a2a5de085', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, 4, NULL, NULL, NULL, '2021-08-13 11:04:41', '2021-08-13 11:04:41'),
(99, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-6116b1b24d091', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '55', '9849594857', NULL, NULL, 4, NULL, NULL, NULL, '2021-08-13 12:08:54', '2021-08-13 12:08:54'),
(100, 'processing', 900.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-61174ca4da3af', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', '2', '55', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', '2', '55', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-13 23:10:00', '2021-08-13 23:10:00'),
(101, 'processing', 5000.00, NULL, 2, 0, 'cash_on_delivery', 'OrderNumber-6117526603444', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-13 23:34:34', '2021-08-13 23:34:34'),
(102, 'processing', 5000.00, NULL, 2, 0, 'cash_on_delivery', 'OrderNumber-611752a4ceb27', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-13 23:35:36', '2021-08-13 23:35:36'),
(103, 'processing', 10400.00, NULL, 3, 0, 'cash_on_delivery', 'OrderNumber-611753ce5f479', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-13 23:40:34', '2021-08-13 23:40:34'),
(104, 'processing', 10400.00, NULL, 3, 0, 'cash_on_delivery', 'OrderNumber-611755544f8dd', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-13 23:47:04', '2021-08-13 23:47:04'),
(105, 'processing', 10400.00, NULL, 3, 0, 'cash_on_delivery', 'OrderNumber-6117562b58051', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-13 23:50:39', '2021-08-13 23:50:39'),
(106, 'processing', 10400.00, NULL, 3, 0, 'cash_on_delivery', 'OrderNumber-6117563f70a0c', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-13 23:50:59', '2021-08-13 23:50:59'),
(107, 'processing', 1800.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-611758641d359', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', '3', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', '3', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-14 00:00:08', '2021-08-14 00:00:08'),
(108, 'processing', 3600.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-6117593cbebc3', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-14 00:03:44', '2021-08-14 00:03:44'),
(109, 'processing', 4000.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-61175b55f0d63', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-14 00:12:41', '2021-08-14 00:12:41'),
(110, 'processing', 4000.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-61175cb731682', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-14 00:18:35', '2021-08-14 00:18:35'),
(111, 'processing', 6000.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-61175d9728eb7', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-14 00:22:19', '2021-08-14 00:22:19'),
(112, 'processing', 4000.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-61175e7e93e25', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-14 00:26:10', '2021-08-14 00:26:10'),
(113, 'processing', 2000.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-61176557e18e1', 'gift', 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, NULL, NULL, 'Anushil karki', 'balkumari', 'lalitpur', 'divition', '446200', '9849594857', NULL, NULL, 3, NULL, NULL, NULL, '2021-08-14 00:55:23', '2021-08-14 00:55:23'),
(114, 'processing', 1500.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-612a1cb7a1a14', 'gift', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '+9779849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '+9779849594857', NULL, NULL, 1, NULL, NULL, NULL, '2021-08-28 05:38:35', '2021-08-28 05:38:35'),
(115, 'processing', 1500.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-612a1ddc832eb', 'gift', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '+9779849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '+9779849594857', NULL, NULL, 1, NULL, NULL, NULL, '2021-08-28 05:43:28', '2021-08-28 05:43:28'),
(116, 'processing', 1500.00, NULL, 1, 0, 'cash_on_delivery', 'OrderNumber-612a1e20b7e87', 'gift', 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '+9779849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'bhaktapur', 'koteshwor', '4', '56565', '+9779849594857', NULL, NULL, 1, NULL, NULL, NULL, '2021-08-28 05:44:36', '2021-08-28 05:44:36'),
(117, 'processing', 1700.00, 100.00, 1, 0, 'cash_on_delivery', 'OrderNumber-6132abed8a2b5', 'gift', 'anushil karki', 'Bhaktapur', 'lokanthali', '3', NULL, '9849594857', NULL, NULL, NULL, NULL, 'anushil karki', 'Bhaktapur', 'lokanthali', '3', NULL, '9849594857', NULL, NULL, 1, 'kaushaltar', '9843777683', NULL, '2021-09-03 17:27:45', '2021-09-03 17:27:45'),
(118, 'processing', 1700.00, 100.00, 2, 0, 'cash_on_delivery', 'OrderNumber-6132b1bd8a5bb', 'gift', 'anushil karki', 'om shanti ko ghar najikai', 'koteshwor', '3', NULL, '+9779849594857', 'Bhaktapur', NULL, NULL, NULL, 'anushil karki', 'om shanti ko ghar najikai', 'koteshwor', '3', NULL, '+9779849594857', NULL, NULL, 1, 'kaushaltar', '9843777683', NULL, '2021-09-03 17:52:33', '2021-09-03 17:52:33'),
(119, 'processing', 3445.00, 45.00, 1, 0, 'cash_on_delivery', 'OrderNumber-6132c7c2ed994', 'gift', 'anushil karki', 'trfddf', 'koteshwor', '3', NULL, '+9779849594857', 'Bhaktapur', NULL, NULL, NULL, 'anushil karki', 'trfddf', 'koteshwor', '3', NULL, '+9779849594857', NULL, NULL, 1, 'kaushaltar', '9843777683', 'morning', '2021-09-03 19:26:30', '2021-09-03 19:26:30'),
(120, 'processing', 1700.00, 100.00, 1, 0, 'cash_on_delivery', 'OrderNumber-6132c88d9ce77', 'gift', 'anushil karki', 'tole bikas samiti', 'koteshwor', '3', NULL, '+9779849594857', 'Bhaktapur', NULL, NULL, NULL, 'anushil karki', 'tole bikas samiti', 'koteshwor', '3', NULL, '+9779849594857', NULL, NULL, 1, 'kaushaltar', '9843777683', 'day', '2021-09-03 19:29:53', '2021-09-03 19:29:53'),
(121, 'processing', 3500.00, 100.00, 1, 0, 'cash_on_delivery', 'OrderNumber-6132c9a1e2eaf', 'gift', 'anushil karki', 'fgfgfg', 'koteshwor', '3', NULL, '+9779849594857', 'Bhaktapur', NULL, NULL, NULL, 'anushil karki', 'fgfgfg', 'koteshwor', '3', NULL, '+9779849594857', NULL, NULL, 1, 'kaushaltar', '9843777683', 'morning', '2021-09-03 19:34:29', '2021-09-03 19:34:29'),
(122, 'processing', 1645.00, 45.00, 1, 0, 'cash_on_delivery', 'OrderNumber-6132cb93276f9', 'gift', 'anushil karki', 'kjk', 'koteshwor', '3', NULL, '+9779849594857', 'Bhaktapur', NULL, NULL, NULL, 'anushil karki', 'kjk', 'koteshwor', '3', NULL, '+9779849594857', NULL, NULL, 1, 'kaushaltar', '9843777683', 'morning', '2021-09-03 19:42:47', '2021-09-03 19:42:47'),
(123, 'processing', 1700.00, 100.00, 1, 0, 'cash_on_delivery', 'OrderNumber-6132cd770aa16', 'gift', 'anushil karki', 'fghfghghghghghghghghghgh', 'koteshwor', '3', NULL, '+9779849594857', 'Bhaktapur', NULL, NULL, NULL, 'anushil karki', 'fghfghghghghghghghghghgh', 'koteshwor', '3', NULL, '+9779849594857', NULL, NULL, 1, 'kaushaltar', '9843777683', 'morning', '2021-09-03 19:50:51', '2021-09-03 19:50:51'),
(124, 'processing', 2200.00, 100.00, 1, 0, 'cash_on_delivery', 'OrderNumber-6132d07352edf', 'gift', 'Anushil karki', 'global bank pachadi', 'koteshwor', '3', NULL, '9843777683', 'Bhaktapur', NULL, NULL, NULL, 'Anushil karki', 'global bank pachadi', 'koteshwor', '3', NULL, '9843777683', NULL, NULL, 1, 'kaushaltar', '9843777683', 'morning', '2021-09-03 20:03:35', '2021-09-03 20:03:35'),
(125, 'processing', 1700.00, 100.00, 1, 0, 'cash_on_delivery', 'OrderNumber-6132d1a035710', 'gift', 'anushil karki', 'bank paxadi ko bata', 'koteshwor', '3', NULL, '+9779849594857', 'Bhaktapur', NULL, NULL, NULL, 'anushil karki', 'bank paxadi ko bata', 'koteshwor', '3', NULL, '+9779849594857', NULL, NULL, 1, 'kaushaltar', '9843777683', 'morning', '2021-09-03 20:08:36', '2021-09-03 20:08:36');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price`, `quantity`, `color`, `size`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(3, 3, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(4, 4, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(5, 5, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(6, 6, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(7, 7, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(8, 8, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(9, 9, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(10, 10, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(11, 11, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(12, 12, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(13, 13, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(14, 14, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(15, 15, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(16, 16, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(17, 17, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(18, 18, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(19, 19, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(20, 20, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(21, 21, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(22, 21, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(23, 22, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(24, 22, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(25, 23, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(26, 23, 3, 900.00, 0, NULL, NULL, NULL, NULL, NULL),
(27, 24, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(28, 24, 3, 900.00, 0, NULL, NULL, NULL, NULL, NULL),
(29, 25, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(30, 25, 3, 900.00, 0, NULL, NULL, NULL, NULL, NULL),
(31, 26, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(32, 26, 3, 900.00, 0, NULL, NULL, NULL, NULL, NULL),
(33, 27, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(34, 27, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(35, 28, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(36, 29, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(37, 30, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(38, 31, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(39, 32, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(40, 33, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(41, 34, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(42, 35, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(43, 36, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(44, 37, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(45, 38, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(46, 39, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(47, 40, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(48, 41, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(49, 42, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(50, 43, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(51, 44, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(52, 45, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(53, 46, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(54, 47, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(55, 48, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(56, 49, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(57, 50, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(58, 50, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(59, 51, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(60, 51, 2, 1800.00, 2, NULL, NULL, NULL, NULL, NULL),
(61, 52, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(62, 52, 2, 1800.00, 2, NULL, NULL, NULL, NULL, NULL),
(63, 52, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(64, 53, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(65, 53, 2, 1800.00, 2, NULL, NULL, NULL, NULL, NULL),
(66, 53, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(67, 54, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(68, 54, 2, 1800.00, 2, NULL, NULL, NULL, NULL, NULL),
(69, 54, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(70, 55, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(71, 55, 2, 1800.00, 2, NULL, NULL, NULL, NULL, NULL),
(72, 55, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(73, 56, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(74, 56, 2, 1800.00, 2, NULL, NULL, NULL, NULL, NULL),
(75, 56, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(76, 57, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(77, 57, 2, 1800.00, 2, NULL, NULL, NULL, NULL, NULL),
(78, 57, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(79, 58, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(80, 58, 6, 1600.00, 1, NULL, NULL, NULL, NULL, NULL),
(81, 58, 9, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(82, 60, 1, 2300.00, 3, NULL, NULL, NULL, NULL, NULL),
(83, 61, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(84, 62, 1, 2300.00, 1, '', '', NULL, NULL, NULL),
(85, 63, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(86, 63, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(87, 68, 1, 2300.00, 2, NULL, NULL, NULL, NULL, NULL),
(88, 69, 1, 2300.00, 1, '', '', NULL, NULL, NULL),
(89, 70, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(90, 71, 1, 2300.00, 1, '', '', NULL, NULL, NULL),
(91, 72, 1, 2300.00, 2, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(92, 73, 2, 1800.00, 1, '', '', NULL, NULL, NULL),
(93, 74, 1, 2300.00, 3, 'blue', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(94, 75, 1, 2300.00, 3, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(95, 76, 1, 2300.00, 2, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(96, 77, 1, 2300.00, 6, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(97, 78, 1, 2300.00, 6, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(98, 79, 1, 2300.00, 6, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(99, 82, 1, 2300.00, 5, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(100, 83, 1, 2300.00, 3, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(101, 84, 2, 1800.00, 1, '', '', NULL, NULL, NULL),
(102, 84, 1, 2300.00, 1, '', '', NULL, NULL, NULL),
(103, 85, 1, 2300.00, 1, '', '', NULL, NULL, NULL),
(104, 86, 1, 2300.00, 1, '', '', NULL, NULL, NULL),
(105, 86, 3, 900.00, 1, '', '', NULL, NULL, NULL),
(106, 87, 7, 2000.00, 5, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(107, 87, 2, 1800.00, 1, '', '', NULL, NULL, NULL),
(108, 88, 2, 1800.00, 1, 'grey', '1 no', NULL, NULL, NULL),
(109, 89, 9, 900.00, 1, 'light blue', 'l', NULL, NULL, NULL),
(110, 90, 9, 900.00, 1, 'light blue', 'l', NULL, NULL, NULL),
(111, 91, 9, 900.00, 1, 'light blue', 'l', NULL, NULL, NULL),
(112, 92, 9, 900.00, 1, 'light blue', 'l', NULL, NULL, NULL),
(113, 93, 7, 2000.00, 3, 'yellow', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(114, 93, 7, 2000.00, 2, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(115, 94, 1, 2300.00, 2, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(116, 95, 10, 1500.00, 2, 'pink', 's', NULL, NULL, NULL),
(117, 96, 3, 900.00, 2, 'blue', 's', NULL, NULL, NULL),
(118, 97, 3, 900.00, 2, 'blue', 's', NULL, NULL, NULL),
(119, 98, 3, 900.00, 2, 'blue', 's', NULL, NULL, NULL),
(120, 99, 3, 900.00, 2, 'blue', 's', NULL, NULL, NULL),
(121, 100, 3, 900.00, 1, 'blue', 'm', NULL, NULL, NULL),
(122, 101, 6, 1600.00, 2, 'maroon', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(123, 101, 8, 900.00, 2, 'blue', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(124, 102, 6, 1600.00, 2, 'maroon', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(125, 102, 8, 900.00, 2, 'blue', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(126, 103, 6, 1600.00, 2, 'maroon', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(127, 103, 8, 900.00, 2, 'blue', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(128, 103, 2, 1800.00, 3, 'grey', '1 no', NULL, NULL, NULL),
(129, 104, 6, 1600.00, 2, 'maroon', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(130, 104, 8, 900.00, 2, 'blue', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(131, 104, 2, 1800.00, 3, 'grey', '1 no', NULL, NULL, NULL),
(132, 105, 6, 1600.00, 2, 'maroon', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(133, 105, 8, 900.00, 2, 'blue', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(134, 105, 2, 1800.00, 3, 'grey', '1 no', NULL, NULL, NULL),
(135, 106, 6, 1600.00, 2, 'maroon', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(136, 106, 8, 900.00, 2, 'blue', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(137, 106, 2, 1800.00, 3, 'grey', '1 no', NULL, NULL, NULL),
(138, 107, 9, 900.00, 2, 'light blue', 'l', NULL, NULL, NULL),
(139, 108, 2, 1800.00, 2, 'grey', '2 no', NULL, NULL, NULL),
(140, 109, 7, 2000.00, 2, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(141, 110, 7, 2000.00, 2, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(142, 111, 7, 2000.00, 3, 'yellow', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(143, 112, 7, 2000.00, 2, 'yellow', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(144, 113, 7, 2000.00, 1, 'yellow', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(145, 114, 10, 1500.00, 1, 'pink', 's', NULL, NULL, NULL),
(146, 115, 10, 1500.00, 1, 'pink', 's', NULL, NULL, NULL),
(147, 116, 10, 1500.00, 1, 'pink', 's', NULL, NULL, NULL),
(148, 117, 9, 900.00, 2, 'light blue', 'l', NULL, NULL, NULL),
(149, 118, 9, 900.00, 1, 'light blue', 'l', NULL, NULL, NULL),
(150, 118, 9, 900.00, 1, 'light blue', 'l', NULL, NULL, NULL),
(151, 119, 2, 1800.00, 2, 'blue', '1 no', NULL, NULL, NULL),
(152, 120, 9, 900.00, 2, 'light blue', 'l', NULL, NULL, NULL),
(153, 121, 9, 900.00, 4, 'light blue', 'l', NULL, NULL, NULL),
(154, 122, 2, 1800.00, 1, 'blue', '1 no', NULL, NULL, NULL),
(155, 123, 9, 900.00, 2, 'light blue', 'l', NULL, NULL, NULL),
(156, 124, 1, 2300.00, 1, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(157, 125, 9, 900.00, 2, 'light blue', 'l', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-07-12 21:59:14', '2021-07-12 21:59:14');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(2, 'browse_bread', NULL, '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(3, 'browse_database', NULL, '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(4, 'browse_media', NULL, '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(5, 'browse_compass', NULL, '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(6, 'browse_menus', 'menus', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(7, 'read_menus', 'menus', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(8, 'edit_menus', 'menus', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(9, 'add_menus', 'menus', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(10, 'delete_menus', 'menus', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(11, 'browse_roles', 'roles', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(12, 'read_roles', 'roles', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(13, 'edit_roles', 'roles', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(14, 'add_roles', 'roles', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(15, 'delete_roles', 'roles', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(16, 'browse_users', 'users', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(17, 'read_users', 'users', '2021-07-12 21:59:08', '2021-07-12 21:59:08'),
(18, 'edit_users', 'users', '2021-07-12 21:59:08', '2021-07-12 21:59:08'),
(19, 'add_users', 'users', '2021-07-12 21:59:08', '2021-07-12 21:59:08'),
(20, 'delete_users', 'users', '2021-07-12 21:59:08', '2021-07-12 21:59:08'),
(21, 'browse_settings', 'settings', '2021-07-12 21:59:08', '2021-07-12 21:59:08'),
(22, 'read_settings', 'settings', '2021-07-12 21:59:08', '2021-07-12 21:59:08'),
(23, 'edit_settings', 'settings', '2021-07-12 21:59:08', '2021-07-12 21:59:08'),
(24, 'add_settings', 'settings', '2021-07-12 21:59:08', '2021-07-12 21:59:08'),
(25, 'delete_settings', 'settings', '2021-07-12 21:59:08', '2021-07-12 21:59:08'),
(26, 'browse_categories', 'categories', '2021-07-12 21:59:10', '2021-07-12 21:59:10'),
(27, 'read_categories', 'categories', '2021-07-12 21:59:10', '2021-07-12 21:59:10'),
(28, 'edit_categories', 'categories', '2021-07-12 21:59:10', '2021-07-12 21:59:10'),
(29, 'add_categories', 'categories', '2021-07-12 21:59:10', '2021-07-12 21:59:10'),
(30, 'delete_categories', 'categories', '2021-07-12 21:59:10', '2021-07-12 21:59:10'),
(31, 'browse_posts', 'posts', '2021-07-12 21:59:12', '2021-07-12 21:59:12'),
(32, 'read_posts', 'posts', '2021-07-12 21:59:12', '2021-07-12 21:59:12'),
(33, 'edit_posts', 'posts', '2021-07-12 21:59:12', '2021-07-12 21:59:12'),
(34, 'add_posts', 'posts', '2021-07-12 21:59:12', '2021-07-12 21:59:12'),
(35, 'delete_posts', 'posts', '2021-07-12 21:59:12', '2021-07-12 21:59:12'),
(36, 'browse_pages', 'pages', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(37, 'read_pages', 'pages', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(38, 'edit_pages', 'pages', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(39, 'add_pages', 'pages', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(40, 'delete_pages', 'pages', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(41, 'browse_hooks', NULL, '2021-07-12 21:59:16', '2021-07-12 21:59:16'),
(42, 'browse_products', 'products', '2021-07-12 23:01:10', '2021-07-12 23:01:10'),
(43, 'read_products', 'products', '2021-07-12 23:01:10', '2021-07-12 23:01:10'),
(44, 'edit_products', 'products', '2021-07-12 23:01:10', '2021-07-12 23:01:10'),
(45, 'add_products', 'products', '2021-07-12 23:01:10', '2021-07-12 23:01:10'),
(46, 'delete_products', 'products', '2021-07-12 23:01:10', '2021-07-12 23:01:10'),
(47, 'browse_shops', 'shops', '2021-07-12 23:03:58', '2021-07-12 23:03:58'),
(48, 'read_shops', 'shops', '2021-07-12 23:03:58', '2021-07-12 23:03:58'),
(49, 'edit_shops', 'shops', '2021-07-12 23:03:58', '2021-07-12 23:03:58'),
(50, 'add_shops', 'shops', '2021-07-12 23:03:58', '2021-07-12 23:03:58'),
(51, 'delete_shops', 'shops', '2021-07-12 23:03:58', '2021-07-12 23:03:58'),
(52, 'browse_gifts', 'gifts', '2021-07-12 23:20:15', '2021-07-12 23:20:15'),
(53, 'read_gifts', 'gifts', '2021-07-12 23:20:15', '2021-07-12 23:20:15'),
(54, 'edit_gifts', 'gifts', '2021-07-12 23:20:15', '2021-07-12 23:20:15'),
(55, 'add_gifts', 'gifts', '2021-07-12 23:20:15', '2021-07-12 23:20:15'),
(56, 'delete_gifts', 'gifts', '2021-07-12 23:20:15', '2021-07-12 23:20:15'),
(57, 'browse_advertisements', 'advertisements', '2021-07-13 21:50:39', '2021-07-13 21:50:39'),
(58, 'read_advertisements', 'advertisements', '2021-07-13 21:50:39', '2021-07-13 21:50:39'),
(59, 'edit_advertisements', 'advertisements', '2021-07-13 21:50:39', '2021-07-13 21:50:39'),
(60, 'add_advertisements', 'advertisements', '2021-07-13 21:50:39', '2021-07-13 21:50:39'),
(61, 'delete_advertisements', 'advertisements', '2021-07-13 21:50:39', '2021-07-13 21:50:39'),
(62, 'browse_shop_customer_services', 'shop_customer_services', '2021-07-20 02:26:15', '2021-07-20 02:26:15'),
(63, 'read_shop_customer_services', 'shop_customer_services', '2021-07-20 02:26:15', '2021-07-20 02:26:15'),
(64, 'edit_shop_customer_services', 'shop_customer_services', '2021-07-20 02:26:15', '2021-07-20 02:26:15'),
(65, 'add_shop_customer_services', 'shop_customer_services', '2021-07-20 02:26:15', '2021-07-20 02:26:15'),
(66, 'delete_shop_customer_services', 'shop_customer_services', '2021-07-20 02:26:15', '2021-07-20 02:26:15'),
(67, 'browse_credits', 'credits', '2021-07-20 02:40:48', '2021-07-20 02:40:48'),
(68, 'read_credits', 'credits', '2021-07-20 02:40:48', '2021-07-20 02:40:48'),
(69, 'edit_credits', 'credits', '2021-07-20 02:40:48', '2021-07-20 02:40:48'),
(70, 'add_credits', 'credits', '2021-07-20 02:40:48', '2021-07-20 02:40:48'),
(71, 'delete_credits', 'credits', '2021-07-20 02:40:48', '2021-07-20 02:40:48'),
(77, 'browse_stocks', 'stocks', '2021-07-24 11:16:17', '2021-07-24 11:16:17'),
(78, 'read_stocks', 'stocks', '2021-07-24 11:16:17', '2021-07-24 11:16:17'),
(79, 'edit_stocks', 'stocks', '2021-07-24 11:16:17', '2021-07-24 11:16:17'),
(80, 'add_stocks', 'stocks', '2021-07-24 11:16:17', '2021-07-24 11:16:17'),
(81, 'delete_stocks', 'stocks', '2021-07-24 11:16:17', '2021-07-24 11:16:17'),
(82, 'browse_comissions', 'comissions', '2021-07-25 01:32:02', '2021-07-25 01:32:02'),
(83, 'read_comissions', 'comissions', '2021-07-25 01:32:02', '2021-07-25 01:32:02'),
(84, 'edit_comissions', 'comissions', '2021-07-25 01:32:02', '2021-07-25 01:32:02'),
(85, 'add_comissions', 'comissions', '2021-07-25 01:32:03', '2021-07-25 01:32:03'),
(86, 'delete_comissions', 'comissions', '2021-07-25 01:32:03', '2021-07-25 01:32:03'),
(87, 'browse_routes', 'routes', '2021-08-08 21:54:16', '2021-08-08 21:54:16'),
(88, 'read_routes', 'routes', '2021-08-08 21:54:16', '2021-08-08 21:54:16'),
(89, 'edit_routes', 'routes', '2021-08-08 21:54:16', '2021-08-08 21:54:16'),
(90, 'add_routes', 'routes', '2021-08-08 21:54:16', '2021-08-08 21:54:16'),
(91, 'delete_routes', 'routes', '2021-08-08 21:54:16', '2021-08-08 21:54:16'),
(92, 'browse_delivery_packages', 'delivery_packages', '2021-08-08 22:54:08', '2021-08-08 22:54:08'),
(93, 'read_delivery_packages', 'delivery_packages', '2021-08-08 22:54:08', '2021-08-08 22:54:08'),
(94, 'edit_delivery_packages', 'delivery_packages', '2021-08-08 22:54:08', '2021-08-08 22:54:08'),
(95, 'add_delivery_packages', 'delivery_packages', '2021-08-08 22:54:08', '2021-08-08 22:54:08'),
(96, 'delete_delivery_packages', 'delivery_packages', '2021-08-08 22:54:08', '2021-08-08 22:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(52, 1),
(52, 3),
(53, 1),
(53, 3),
(54, 1),
(54, 3),
(55, 1),
(55, 3),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(62, 3),
(63, 1),
(63, 3),
(64, 1),
(64, 3),
(65, 1),
(65, 3),
(66, 1),
(66, 3),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(77, 1),
(77, 3),
(78, 1),
(78, 3),
(79, 1),
(79, 3),
(80, 1),
(80, 3),
(81, 1),
(81, 3),
(82, 1),
(82, 3),
(83, 1),
(83, 3),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-07-12 21:59:12', '2021-07-12 21:59:12'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-07-12 21:59:13', '2021-07-12 21:59:13'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-07-12 21:59:13', '2021-07-12 21:59:13'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-07-12 21:59:13', '2021-07-12 21:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(5555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_story` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `selling_price` double(8,2) NOT NULL,
  `cost_price` double(8,2) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `multiple_image` varchar(2555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` text COLLATE utf8_unicode_ci NOT NULL,
  `gift_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `brand_name`, `description`, `product_story`, `shop_id`, `selling_price`, `cost_price`, `image`, `multiple_image`, `contact`, `gift_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'folding daraz', 'chinese', '1.Size- L- 85 cm, W -45 cm, H-165 cm. 2.Place it in your room or in the kids\' bedroom and reclaim that valuable space. 3.Long hanging spaces allow for evening dresses and occasional space suits, while shelves provide smaller spaces for foldable clothing, accessories, and shoes. 4.easy for for installation and no tools or skilled labour required.. 5.Portable wardrobe has hanging space and shelves which are very practical and the roll down cover keeps the dust out Comes in random colors. This portable cum folding Daraz is a great storage unit to keep your bedroom or kids room neat and tidy. Need extra space for your clothes? This double wardrobe with calico cloth cover is an absolutely ideal solution for storing clothes, shoes, books, toys and more! Perfect for any bedroom and comes with a non-woven cloth cover that not only offers a great look but also a fabulous way to hide any unsightly mess. Plus the cloth cover is washable.', NULL, 1, 2300.00, 1700.00, 'products\\July2021\\lRE6sgS1ySu8tJNmXYUr.jpg', '[\"products\\\\July2021\\\\AcQlL4VPDwenfamm6Blq.jpg\",\"products\\\\July2021\\\\LaqdYUpdiiaHKUcCosUb.jpg\"]', '9849594857', 1, 1, '2021-07-12 23:22:00', '2021-07-25 02:12:56'),
(2, 'daura surwal', 'traditional', 'daura surwal is nepal most known dress that comes from the history of nepal with a lot of historical importance.and it i known that jang bahadur rana startd wearing daura surwa with coat and khukuri.', NULL, 2, 1800.00, 1200.00, 'products\\July2021\\cmyUJ5DJvaUaZ5tRShjj.jpg', '[\"products\\\\July2021\\\\Z7NAiy2eoKKYkJ5fqWFf.png\"]', '9849594857', 1, 1, '2021-07-13 21:43:00', '2021-07-25 02:28:50'),
(3, 'hemp trouser', 'kathmandu hemp', 'This trouser is made from natural fiber.', NULL, 2, 900.00, 550.00, 'products\\July2021\\DSQWQ1Rv4PewfpElWYOO.jpg', '[\"products\\\\July2021\\\\PzQZjqZGi4zgXzWdZS1n.jpg\"]', '9849594857', 1, 1, '2021-07-13 21:45:00', '2021-07-25 02:12:45'),
(6, 'shoe rack', 'chinese', '1.Size- L- 85 cm, W -45 cm, H-165 cm. 2.Place it in your room or in the kids\' bedroom and reclaim that valuable space. 3.Long hanging spaces allow for evening dresses and occasional space suits, while shelves provide smaller spaces for foldable clothing, accessories, and shoes. 4.easy for for installation and no tools or skilled labour required.. 5.Portable wardrobe has hanging space and shelves which are very practical and the roll down cover keeps the dust out Comes in random colors. This portable cum folding Daraz is a great storage unit to keep your bedroom or kids room neat and tidy. Need extra space for your clothes? This double wardrobe with calico cloth cover is an absolutely ideal solution for storing clothes, shoes, books, toys and more! Perfect for any bedroom and comes with a non-woven cloth cover that not only offers a great look but also a fabulous way to hide any unsightly mess. Plus the cloth cover is washable.', NULL, 1, 1600.00, 800.00, 'products\\July2021\\fa8IrmuBj3S9eH3H6l9s.jpg', NULL, '9849594857', 1, 1, '2021-07-14 06:14:00', '2021-07-25 02:28:33'),
(7, 'plastic shoe rack', 'chinese', '1.Size- L- 85 cm, W -45 cm, H-165 cm. 2.Place it in your room or in the kids\' bedroom and reclaim that valuable space. 3.Long hanging spaces allow for evening dresses and occasional space suits, while shelves provide smaller spaces for foldable clothing, accessories, and shoes. 4.easy for for installation and no tools or skilled labour required.. 5.Portable wardrobe has hanging space and shelves which are very practical and the roll down cover keeps the dust out Comes in random colors. This portable cum folding Daraz is a great storage unit to keep your bedroom or kids room neat and tidy. Need extra space for your clothes? This double wardrobe with calico cloth cover is an absolutely ideal solution for storing clothes, shoes, books, toys and more! Perfect for any bedroom and comes with a non-woven cloth cover that not only offers a great look but also a fabulous way to hide any unsightly mess. Plus the cloth cover is washable.', NULL, 1, 2000.00, 1100.00, 'products\\July2021\\rD1T6F64SlrkAE2DRaXY.jpg', NULL, '9849594857', 1, 0, '2021-07-14 06:54:00', '2021-07-25 02:29:04'),
(8, 'Mosquito net', 'traditional', 'This is nepal made product made from natural fiber.this looks very cool on youths.', NULL, 2, 900.00, 100.00, 'products\\July2021\\9JSqeYb5Gc7ALoj6ls4z.jpg', '[\"products\\\\July2021\\\\y8Zf9nhLhNBclh7s5Xwt.jpg\"]', '9849594857', 1, 0, '2021-07-14 08:27:00', '2021-07-25 02:28:14'),
(9, 'hemp surwal', 'kathmandu hemp', 'This is nepali hemp product', NULL, 3, 900.00, 500.00, 'products\\July2021\\VmqOOecsBdp4yfWuVFON.jpg', '[\"products\\\\July2021\\\\75rb3VJqHp41C6JQYE0E.jpg\",\"products\\\\July2021\\\\ycZ7ZHvgYfmXD1Imksra.jpg\",\"products\\\\July2021\\\\QsoqBE39rUxamNLURj3U.jpg\",\"products\\\\July2021\\\\KUoGJ9WLGHuAZJVoUHta.jpg\"]', '9849594857', 2, 0, '2021-07-20 02:48:00', '2021-07-25 02:12:29'),
(10, 'makeup kit', 'beauty', 'Beauty product that can enhance your confidence', NULL, 2, 1500.00, 800.00, 'products\\July2021\\WDawkpsLoV9uUmzuYfDI.jpg', '[\"products\\\\July2021\\\\FEwRdwb8hdDvGp553uI8.jpg\"]', '9849594857', 2, 0, '2021-07-24 09:53:00', '2021-07-25 11:00:14'),
(11, 'shoe rack2', 'chinese', '1.Size- L- 85 cm, W -45 cm, H-165 cm. 2.Place it in your room or in the kids\' bedroom and reclaim that valuable space. 3.Long hanging spaces allow for evening dresses and occasional space suits, while shelves provide smaller spaces for foldable clothing, accessories, and shoes. 4.easy for for installation and no tools or skilled labour required.. 5.Portable wardrobe has hanging space and shelves which are very practical and the roll down cover keeps the dust out Comes in random colors. This portable cum folding Daraz is a great storage unit to keep your bedroom or kids room neat and tidy. Need extra space for your clothes? This double wardrobe with calico cloth cover is an absolutely ideal solution for storing clothes, shoes, books, toys and more! Perfect for any bedroom and comes with a non-woven cloth cover that not only offers a great look but also a fabulous way to hide any unsightly mess. Plus the cloth cover is washable.', NULL, 1, 1800.00, 1000.00, 'products\\July2021\\6YRPNEBXyEW93KUzVCoY.jpg', '[\"products\\\\July2021\\\\2Y6YkW2R4Ekp7tQTBBg1.jpg\"]', '9849594857', 1, 1, '2021-07-25 03:02:58', '2021-07-25 03:02:58');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, NULL, NULL),
(2, 2, 5, NULL, NULL),
(3, 3, 1, NULL, NULL),
(6, 6, 4, NULL, NULL),
(7, 7, 4, NULL, NULL),
(8, 8, 5, NULL, NULL),
(9, 9, 1, NULL, NULL),
(10, 11, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_discounts`
--

CREATE TABLE `product_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `discount_amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` double(8,2) DEFAULT NULL,
  `review` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_orders` int(11) DEFAULT NULL,
  `total_gifts` int(11) DEFAULT NULL,
  `total_return` int(11) DEFAULT NULL,
  `total_order_point` int(11) DEFAULT NULL,
  `phone_no` int(11) DEFAULT NULL,
  `habits` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intrest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profession` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `income` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lifestyle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_time_spent` int(11) DEFAULT NULL,
  `total_review` int(11) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(2, 'user', 'Normal User', '2021-07-12 21:59:07', '2021-07-12 21:59:07'),
(3, 'shopadmin', 'ShopAdmin', '2021-07-12 22:58:04', '2021-07-12 22:58:04'),
(4, 'rider', 'Delivery rider', '2021-08-07 11:03:10', '2021-08-07 11:03:10');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `starting_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ending_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `km` double(8,2) DEFAULT NULL,
  `total_count` double(8,2) DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rider_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('collecting','route','ready','completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'collecting',
  `time` enum('morning','day','evening','night') COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `starting_location`, `ending_location`, `route_name`, `km`, `total_count`, `details`, `rider_id`, `shop_id`, `status`, `time`, `is_active`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'bhaktapur1', NULL, NULL, 'he is rider from bhaktapur area.he handles delivery around bhaktapur area.', 1, 2, 'collecting', 'day', 1, '2021-08-08 22:11:50', '2021-08-08 22:11:50');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `total_amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_meetings`
--

CREATE TABLE `schedule_meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `objective` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meeting_details` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `meeting_type` enum('yearly','monthly','weekly','daily') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `task` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `objective` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_type` enum('product','shop','team','service') COLLATE utf8_unicode_ci NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` double(8,2) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `user_id`, `is_active`, `description`, `rating`, `email`, `contact_no`, `created_at`, `updated_at`) VALUES
(1, 'Bhaktapur', 3, 1, 'thsi shop is located bhaktapur.this promote nepali clothes and products.have delivery all over nepla using courier and home delivery service.', NULL, 'anushil.161707@ncit.edu.np', '9843777683', '2021-07-12 23:06:00', '2021-08-08 22:56:01'),
(2, 'Lalitpur', 4, 1, 'This shop has nepali product.most product are made from hemp,cotton,khaddar.\r\nThese materials for clothes are very good for skin', NULL, 'kathmanduhemp@globalcyberlife.com', '9843777654', '2021-07-13 21:37:00', '2021-08-08 22:55:46'),
(3, 'kathmandu', 6, 1, 'this is kathmandu mall', NULL, 'manoj@manoj.com', '9843777629', '2021-07-14 08:24:00', '2021-08-08 22:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_services`
--

CREATE TABLE `shop_customer_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_query` text COLLATE utf8_unicode_ci NOT NULL,
  `answer` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('processing','completed','declined') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'processing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_customer_services`
--

INSERT INTO `shop_customer_services` (`id`, `customer_query`, `answer`, `customer_id`, `shop_id`, `product_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'what is customer service contact no?', '9849594857', 1, NULL, NULL, 'processing', '2021-07-20 02:22:00', '2021-07-20 02:26:34');

-- --------------------------------------------------------

--
-- Table structure for table `shop_goals`
--

CREATE TABLE `shop_goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','pending','finished') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `goal_type` enum('yearly','monthly','daily') COLLATE utf8_unicode_ci NOT NULL,
  `target` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_payments`
--

CREATE TABLE `shop_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `asset_id` bigint(20) UNSIGNED DEFAULT NULL,
  `advertisement_id` bigint(20) UNSIGNED DEFAULT NULL,
  `liability_id` bigint(20) UNSIGNED DEFAULT NULL,
  `capital_id` bigint(20) UNSIGNED DEFAULT NULL,
  `income_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parcel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `paid` double(8,2) DEFAULT NULL,
  `remaining` double(8,2) DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `vat` double(8,2) DEFAULT NULL,
  `payment_method` enum('cash_on_delivery','card','mobile_wallet') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cash_on_delivery',
  `payment_type` enum('to_receive','to_pay') COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('completed','remaining','pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_ratings`
--

CREATE TABLE `shop_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` double(8,2) DEFAULT NULL,
  `review` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_reports`
--

CREATE TABLE `shop_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `total_credit_amount` double(8,2) NOT NULL,
  `total_expense_amount` double(8,2) NOT NULL,
  `total_income_amount` double(8,2) NOT NULL,
  `total_commision_amount` double(8,2) NOT NULL,
  `total_capital_amount` double(8,2) NOT NULL,
  `total_liability_amount` double(8,2) NOT NULL,
  `total_asset_amount` double(8,2) NOT NULL,
  `total_task_completed` int(11) NOT NULL,
  `total_task_failed` int(11) NOT NULL,
  `goal_completed` int(11) NOT NULL,
  `goal_failed` int(11) NOT NULL,
  `total_profit` double(8,2) NOT NULL,
  `total_sale` double(8,2) NOT NULL,
  `total_advertisement_amount` double(8,2) NOT NULL,
  `total_complain` int(11) NOT NULL,
  `total_customer_return_amount` double(8,2) NOT NULL,
  `total_shop_return_amount` double(8,2) NOT NULL,
  `total_delivery_completed` int(11) NOT NULL,
  `total_purchase_amount` double(8,2) NOT NULL,
  `total_order` int(11) NOT NULL,
  `total_teams` int(11) NOT NULL,
  `report_type` enum('yearly','monthly','weekly','daily') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `is_active`, `color`, `size`, `quantity`, `weight`, `images`, `created_at`, `updated_at`) VALUES
(5, 1, 1, 'blue', 'height 6 ft breadth 4.5 ft width 2.5 ft', 10, 3.50, 'stocks\\July2021\\HLL8q4G2Lt71jEnIVw9v.jpg', '2021-07-24 11:19:00', '2021-07-24 11:22:37'),
(6, 1, 0, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', 7, 3.50, 'stocks\\July2021\\00OCPonhQXGiU2MDSNB3.jpg', '2021-07-24 11:19:00', '2021-07-24 13:59:13'),
(7, 3, 1, 'blue', 's', 2, 0.50, 'stocks\\July2021\\bBmqiRhyHnW4M9GhLCAs.jpg', '2021-07-25 01:57:54', '2021-07-25 01:57:54'),
(8, 3, 1, 'yellow', 'm', 5, 0.50, 'stocks\\July2021\\DnF3652KPool2FlVUaKM.jpg', '2021-07-25 01:58:25', '2021-07-25 01:58:25'),
(9, 6, 0, 'maroon', 'height 6 ft breadth 4.5 ft width 2.5 ft', -8, 3.00, 'stocks\\July2021\\98ur3kmG0hizjIKYLpwQ.jpg', '2021-07-25 02:02:26', '2021-07-25 02:02:26'),
(10, 6, 1, 'blue', 'height 6 ft breadth 4.5 ft width 2.5 ft', 8, 3.50, 'stocks\\July2021\\C9fnnF2muOzuoR4SLTsM.jpg', '2021-07-25 02:02:48', '2021-07-25 02:02:48'),
(11, 8, 0, 'blue', 'height 6 ft breadth 4.5 ft width 2.5 ft', -8, 3.50, 'stocks\\July2021\\n1wIIenSTnxCfiG8NkqE.jpg', '2021-07-25 02:27:55', '2021-07-25 02:27:55'),
(12, 2, 0, 'grey', '1 no', -3, 0.30, 'stocks\\July2021\\SzvM7GsIM8w3ALVfkrtr.png', '2021-07-25 02:31:01', '2021-07-25 02:31:01'),
(13, 2, 1, 'blue', '2 no', 4, 0.20, 'stocks\\July2021\\8OHRUeidaPk0cfq0UwUp.jpg', '2021-07-25 02:31:31', '2021-07-25 02:31:31'),
(14, 7, 0, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', -7, 3.50, 'stocks\\July2021\\uwLvCn5RvIi5BK9uzWLO.jpg', '2021-07-25 02:31:58', '2021-07-25 02:31:58'),
(16, 9, 0, 'light blue', 'l', -16, 3.00, 'stocks\\July2021\\CJEp6AQ8Y2KzyfyPNMTU.jpg', '2021-07-25 02:33:12', '2021-07-25 02:33:12'),
(17, 7, 0, 'yellow', 'height 6 ft breadth 4.5 ft width 2.5 ft', 0, 3.50, 'stocks\\July2021\\IjSPrJ7HcSpFher6fdAy.jpg', '2021-07-25 02:48:40', '2021-07-25 02:48:40'),
(19, 10, 0, 'pink', 's', -1, 0.50, 'stocks\\July2021\\gZegS3xXLyNuGSU6OxUA.jpg', '2021-07-25 10:28:17', '2021-07-25 10:28:17'),
(20, 10, 0, 'pink', 's', -1, 0.50, 'stocks\\July2021\\1RHAOYGTQaseFUgtHLw3.jpg', '2021-07-25 10:29:44', '2021-07-25 10:29:44'),
(21, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\trQVVzOaV0dOjoUrfmAO.jpg', '2021-07-25 10:30:29', '2021-07-25 10:30:29'),
(22, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\vtSAdevJzPkqTNUpZgFf.jpg', '2021-07-25 10:31:40', '2021-07-25 10:31:40'),
(23, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\FbKJjWtwTZEcwcONOmzJ.jpg', '2021-07-25 10:32:24', '2021-07-25 10:32:24'),
(24, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\aDlhTZrxrkKg8H5lDLIK.jpg', '2021-07-25 10:32:55', '2021-07-25 10:32:55'),
(25, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\eLofDRsuB3GV7MUsjydR.jpg', '2021-07-25 10:35:08', '2021-07-25 10:35:08'),
(26, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\XXdvbvDdJT25bPdJY7u4.jpg', '2021-07-25 10:35:25', '2021-07-25 10:35:25'),
(27, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\GqN9L8psQznP6hJWd8GV.jpg', '2021-07-25 10:37:15', '2021-07-25 10:37:15'),
(28, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\rn9sXPOJfVmiYUSdV2e9.jpg', '2021-07-25 10:37:39', '2021-07-25 10:37:39'),
(29, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\0zVTcfxDNjEE6FJGELfd.jpg', '2021-07-25 10:38:47', '2021-07-25 10:38:47'),
(30, 10, 0, 'pink', 's', -1, NULL, NULL, '2021-07-25 10:41:25', '2021-07-25 10:41:25'),
(31, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\80ODpQdFpSdGksxc9hmF.jpg', '2021-07-25 10:41:39', '2021-07-25 10:41:39'),
(32, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\z4T78OnzSsSXS1nODx33.jpg', '2021-07-25 10:42:55', '2021-07-25 10:42:55'),
(33, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\6XE3By8lbTrww6hQlEK0.jpg', '2021-07-25 10:46:08', '2021-07-25 10:46:08'),
(34, 10, 0, 'pink', 's', -1, NULL, 'stocks\\July2021\\JtdAOk5CLhFypvZM5rhE.jpg', '2021-07-25 10:59:54', '2021-07-25 10:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `sub_orders`
--

CREATE TABLE `sub_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('processing','completed','declined','returned','exchanged') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'processing',
  `grand_total` double(8,2) DEFAULT NULL,
  `item_count` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `review` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_orders`
--

INSERT INTO `sub_orders` (`id`, `shop_id`, `order_id`, `user_id`, `status`, `grand_total`, `item_count`, `note`, `review`, `created_at`, `updated_at`) VALUES
(1, 1, 57, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-23 23:37:02', '2021-07-25 01:16:23'),
(2, 2, 57, 1, 'declined', 2700.00, 2, NULL, NULL, '2021-07-23 23:37:02', '2021-07-25 01:16:29'),
(3, 1, 58, 4, 'completed', 3900.00, 2, NULL, NULL, '2021-07-24 09:50:10', '2021-07-25 02:57:57'),
(4, 3, 58, 4, 'processing', 900.00, 1, NULL, NULL, '2021-07-24 09:50:15', '2021-07-24 09:50:15'),
(5, 1, 60, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 12:42:12', '2021-07-25 01:16:32'),
(6, 1, 61, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 12:48:24', '2021-07-25 01:16:36'),
(7, 1, 62, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 12:49:33', '2021-07-25 01:16:39'),
(8, 1, 63, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 12:55:32', '2021-07-25 01:16:42'),
(9, 2, 63, 1, 'declined', 1800.00, 1, NULL, NULL, '2021-07-24 12:55:33', '2021-07-25 01:16:45'),
(10, 1, 68, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:09:34', '2021-07-25 01:16:47'),
(11, 1, 69, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:14:58', '2021-07-25 01:16:50'),
(12, 1, 70, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:15:44', '2021-07-25 01:16:52'),
(13, 1, 71, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:18:34', '2021-07-25 01:16:55'),
(14, 1, 72, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:25:52', '2021-07-25 01:16:58'),
(15, 2, 73, 1, 'declined', 1800.00, 1, NULL, NULL, '2021-07-24 13:26:38', '2021-07-25 01:17:00'),
(16, 1, 74, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:27:07', '2021-07-25 01:17:05'),
(17, 1, 75, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:37:58', '2021-07-25 01:17:07'),
(18, 1, 76, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:38:23', '2021-07-25 01:17:15'),
(19, 1, 77, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:39:33', '2021-07-25 01:17:19'),
(20, 1, 78, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:41:20', '2021-07-25 01:17:22'),
(21, 1, 79, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:43:25', '2021-07-25 01:17:24'),
(22, 1, 82, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:55:46', '2021-07-25 01:17:26'),
(23, 1, 83, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-24 13:59:30', '2021-07-25 01:17:29'),
(24, 1, 84, 1, 'declined', 2300.00, 1, NULL, NULL, '2021-07-25 01:08:19', '2021-07-25 01:17:31'),
(25, 2, 84, 1, 'declined', 1800.00, 1, NULL, NULL, '2021-07-25 01:08:19', '2021-07-25 02:54:36'),
(26, 1, 85, 1, 'completed', 2300.00, 1, NULL, NULL, '2021-07-25 01:09:48', '2021-07-25 02:58:04'),
(27, 1, 86, 1, 'processing', 2300.00, 1, NULL, NULL, '2021-07-25 01:20:32', '2021-07-25 01:20:32'),
(28, 2, 86, 1, 'processing', 900.00, 1, NULL, NULL, '2021-07-25 01:20:32', '2021-07-25 01:20:32'),
(29, 2, 87, 1, 'processing', 1800.00, 1, NULL, NULL, '2021-07-25 02:54:01', '2021-07-25 02:54:01'),
(30, 1, 87, 1, 'processing', 2000.00, 1, NULL, NULL, '2021-07-25 02:54:01', '2021-07-25 02:54:01'),
(31, 2, 88, 3, 'declined', 1800.00, 1, NULL, NULL, '2021-07-25 02:58:57', '2021-08-13 10:00:29'),
(32, 3, 89, 1, 'processing', 900.00, 1, NULL, NULL, '2021-07-27 05:18:59', '2021-07-27 05:18:59'),
(33, 3, 91, 1, 'processing', 900.00, 1, NULL, NULL, '2021-08-03 06:52:23', '2021-08-03 06:52:23'),
(34, 3, 92, 1, 'processing', 900.00, 1, NULL, NULL, '2021-08-10 22:37:03', '2021-08-10 22:37:03'),
(35, 1, 93, 1, 'processing', 4000.00, 2, NULL, NULL, '2021-08-13 02:49:15', '2021-08-13 02:49:15'),
(36, 1, 94, 3, 'declined', 2300.00, 1, NULL, NULL, '2021-08-13 09:53:12', '2021-08-13 09:59:51'),
(37, 2, 95, 3, 'processing', 1500.00, 1, NULL, NULL, '2021-08-13 10:02:21', '2021-08-13 10:02:21'),
(38, 2, 98, 4, 'processing', 900.00, 1, NULL, NULL, '2021-08-13 11:04:42', '2021-08-13 11:04:42'),
(39, 2, 99, 4, 'processing', 900.00, 1, NULL, NULL, '2021-08-13 12:08:54', '2021-08-13 12:08:54'),
(40, 1, 101, 3, 'processing', 1600.00, 1, NULL, NULL, '2021-08-13 23:34:34', '2021-08-13 23:34:34'),
(41, 1, 102, 3, 'processing', 1600.00, 1, NULL, NULL, '2021-08-13 23:35:37', '2021-08-13 23:35:37'),
(42, 2, 103, 3, 'processing', 2700.00, 2, NULL, NULL, '2021-08-13 23:40:34', '2021-08-13 23:40:34'),
(43, 2, 105, 3, 'processing', 2700.00, 2, NULL, NULL, '2021-08-13 23:50:39', '2021-08-13 23:50:39'),
(44, 2, 106, 3, 'processing', 2700.00, 2, NULL, NULL, '2021-08-13 23:50:59', '2021-08-13 23:50:59'),
(45, 1, 106, 3, 'processing', 1600.00, 1, NULL, NULL, '2021-08-13 23:51:00', '2021-08-13 23:51:00'),
(46, 3, 107, 3, 'processing', 900.00, 1, NULL, NULL, '2021-08-14 00:00:08', '2021-08-14 00:00:08'),
(47, 2, 108, 3, 'processing', 0.00, 1, NULL, NULL, '2021-08-14 00:03:44', '2021-08-14 00:03:44'),
(48, 1, 110, 3, 'processing', 2000.00, 1, NULL, NULL, '2021-08-14 00:18:35', '2021-08-14 00:18:35'),
(49, 1, 111, 3, 'processing', 2000.00, 1, NULL, NULL, '2021-08-14 00:22:19', '2021-08-14 00:22:19'),
(50, 1, 112, 3, 'completed', 4000.00, 1, NULL, NULL, '2021-08-14 00:26:10', '2021-08-14 00:28:43'),
(51, 1, 113, 3, 'processing', 2000.00, 1, NULL, NULL, '2021-08-14 00:55:24', '2021-08-14 00:55:24'),
(52, 2, 116, 1, 'processing', 1500.00, 1, NULL, NULL, '2021-08-28 05:44:37', '2021-08-28 05:44:37'),
(53, 3, 117, 1, 'processing', 1800.00, 1, NULL, NULL, '2021-09-03 17:27:46', '2021-09-03 17:27:46'),
(54, 3, 118, 1, 'processing', 3600.00, 2, NULL, NULL, '2021-09-03 17:52:34', '2021-09-03 17:52:34'),
(55, 2, 119, 1, 'processing', 3600.00, 1, NULL, NULL, '2021-09-03 19:26:31', '2021-09-03 19:26:31'),
(56, 3, 120, 1, 'processing', 1800.00, 1, NULL, NULL, '2021-09-03 19:29:53', '2021-09-03 19:29:53'),
(57, 3, 121, 1, 'processing', 3600.00, 1, NULL, NULL, '2021-09-03 19:34:30', '2021-09-03 19:34:30'),
(58, 3, 123, 1, 'processing', 1800.00, 1, NULL, NULL, '2021-09-03 19:50:51', '2021-09-03 19:50:51'),
(59, 1, 124, 1, 'processing', 2300.00, 1, NULL, NULL, '2021-09-03 20:03:35', '2021-09-03 20:03:35'),
(60, 3, 125, 1, 'processing', 1800.00, 1, NULL, NULL, '2021-09-03 20:08:36', '2021-09-03 20:08:36');

-- --------------------------------------------------------

--
-- Table structure for table `sub_order_items`
--

CREATE TABLE `sub_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_order_items`
--

INSERT INTO `sub_order_items` (`id`, `sub_order_id`, `product_id`, `price`, `quantity`, `color`, `size`, `note`, `created_at`, `updated_at`) VALUES
(1, 44, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(2, 45, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(3, 46, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(4, 1, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(5, 2, 2, 1800.00, 2, NULL, NULL, NULL, NULL, NULL),
(6, 2, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(7, 3, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(8, 3, 6, 1600.00, 1, NULL, NULL, NULL, NULL, NULL),
(9, 4, 9, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(10, 5, 1, 2300.00, 3, NULL, NULL, NULL, NULL, NULL),
(11, 6, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(12, 7, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(13, 8, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(14, 9, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(15, 10, 1, 2300.00, 2, NULL, NULL, NULL, NULL, NULL),
(16, 11, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(17, 12, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(18, 13, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(19, 14, 1, 2300.00, 2, NULL, NULL, NULL, NULL, NULL),
(20, 15, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(21, 16, 1, 2300.00, 3, NULL, NULL, NULL, NULL, NULL),
(22, 17, 1, 2300.00, 3, NULL, NULL, NULL, NULL, NULL),
(23, 18, 1, 2300.00, 2, NULL, NULL, NULL, NULL, NULL),
(24, 19, 1, 2300.00, 6, NULL, NULL, NULL, NULL, NULL),
(25, 20, 1, 2300.00, 6, NULL, NULL, NULL, NULL, NULL),
(26, 21, 1, 2300.00, 6, NULL, NULL, NULL, NULL, NULL),
(27, 22, 1, 2300.00, 5, NULL, NULL, NULL, NULL, NULL),
(28, 23, 1, 2300.00, 3, NULL, NULL, NULL, NULL, NULL),
(29, 24, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(30, 25, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(31, 26, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(32, 27, 1, 2300.00, 1, NULL, NULL, NULL, NULL, NULL),
(33, 28, 3, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(34, 29, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(35, 30, 7, 2000.00, 5, NULL, NULL, NULL, NULL, NULL),
(36, 31, 2, 1800.00, 1, NULL, NULL, NULL, NULL, NULL),
(37, 32, 9, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(38, 33, 9, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(39, 34, 9, 900.00, 1, NULL, NULL, NULL, NULL, NULL),
(40, 35, 7, 2000.00, 3, NULL, NULL, NULL, NULL, NULL),
(41, 35, 7, 2000.00, 2, NULL, NULL, NULL, NULL, NULL),
(42, 36, 1, 2300.00, 2, NULL, NULL, NULL, NULL, NULL),
(43, 37, 10, 1500.00, 2, NULL, NULL, NULL, NULL, NULL),
(44, 44, 6, 1600.00, 2, 'maroon', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(45, 44, 8, 900.00, 2, 'blue', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(46, 44, 2, 1800.00, 3, 'grey', '1 no', NULL, NULL, NULL),
(47, 45, 6, 1600.00, 2, 'maroon', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(48, 45, 8, 900.00, 2, 'blue', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(49, 45, 2, 1800.00, 3, 'grey', '1 no', NULL, NULL, NULL),
(50, 46, 9, 900.00, 2, 'light blue', 'l', NULL, NULL, NULL),
(51, 47, 2, 1800.00, 2, 'grey', '2 no', NULL, NULL, NULL),
(52, 48, 7, 2000.00, 2, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(53, 49, 7, 2000.00, 3, 'yellow', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(54, 50, 7, 2000.00, 2, 'yellow', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(55, 51, 7, 2000.00, 1, 'yellow', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(56, 52, 10, 1500.00, 1, 'pink', 's', NULL, NULL, NULL),
(57, 53, 9, 900.00, 2, 'light blue', 'l', NULL, NULL, NULL),
(58, 54, 9, 900.00, 1, 'light blue', 'l', NULL, NULL, NULL),
(59, 54, 9, 900.00, 1, 'light blue', 'l', NULL, NULL, NULL),
(60, 55, 2, 1800.00, 2, 'blue', '1 no', NULL, NULL, NULL),
(61, 56, 9, 900.00, 2, 'light blue', 'l', NULL, NULL, NULL),
(62, 57, 9, 900.00, 4, 'light blue', 'l', NULL, NULL, NULL),
(63, 58, 9, 900.00, 2, 'light blue', 'l', NULL, NULL, NULL),
(64, 59, 1, 2300.00, 1, 'pink', 'height 6 ft breadth 4.5 ft width 2.5 ft', NULL, NULL, NULL),
(65, 60, 9, 900.00, 2, 'light blue', 'l', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_order_returns`
--

CREATE TABLE `sub_order_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_order_id` bigint(20) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_charge` double(8,2) DEFAULT NULL,
  `type` enum('EXCHANGE','REFUND') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EXCHANGE',
  `status` enum('PENDING','COMPLETED','DECLINED') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tax` double(8,2) NOT NULL,
  `vat` double(8,2) NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `team_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `team_points` int(11) NOT NULL,
  `team_leader_id` bigint(20) UNSIGNED NOT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_goals`
--

CREATE TABLE `team_goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `goal_type` enum('yearly','monthly','weekly','daily') COLLATE utf8_unicode_ci NOT NULL,
  `target_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_reports`
--

CREATE TABLE `team_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `total_team_points` int(11) NOT NULL,
  `total_earned_amount` double(8,2) NOT NULL,
  `total_team_task_completed` int(11) NOT NULL,
  `total_team_task_failed` int(11) NOT NULL,
  `report_type` enum('yearly','monthly','weekly','daily') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-07-12 21:59:14', '2021-07-12 21:59:14'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-07-12 21:59:15', '2021-07-12 21:59:15'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-07-12 21:59:15', '2021-07-12 21:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `trial_balances`
--

CREATE TABLE `trial_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `credit_amount` double(8,2) NOT NULL,
  `debit_amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$mBjD4V3QISLSDGZtQu1/vO0/BNoRchGYaPhhokytIo7foeNejIgMK', NULL, NULL, 'LoCPloZCO3zHWmRsoFIGyaS7sIjUAzmOgnB8f6cZOTRP5qoCuqPtntEBl2Y4', NULL, '2021-07-12 21:59:11', '2021-07-12 21:59:11'),
(2, 4, 'sabitra', 'sabitra@email.com', 'users/default.png', NULL, '$2y$10$LM/Te10ButT08cUhFP4xaufXUbkGqwlym/MPy8L7icX77FGn9NZYC', NULL, NULL, NULL, '{\"locale\":\"en\"}', '2021-07-12 22:00:03', '2021-08-11 02:21:12'),
(3, 3, 'anushil', 'anushil.karki34@gmail.com', 'users/default.png', NULL, '$2y$10$dnhL09ckxiWNo3SCI/9yNOoanydIrKAXYepYGzJDGgra7TnwU9e4u', NULL, NULL, NULL, '{\"locale\":\"en\"}', '2021-07-12 23:06:40', '2021-07-12 23:07:07'),
(4, 3, 'anup', 'anup@anup.com', 'users/default.png', NULL, '$2y$10$lUnDlj8lhyUWFv9jQ4ef5.a3cqGSYlePq7P5qU.oTfpLhGnuAwXjS', NULL, NULL, NULL, '{\"locale\":\"en\"}', '2021-07-13 21:37:48', '2021-07-13 21:38:07'),
(5, 2, 'bibek', 'bibek@bibek.com', 'users/default.png', NULL, '$2y$10$tBdY9Ur2pN4XB83PBbhPbOdQzpnIiXVko4zt1SqLpM4Ta15vS9HP.', NULL, NULL, NULL, NULL, '2021-07-14 01:53:44', '2021-07-14 01:53:44'),
(6, 3, 'anish', 'ansih@anish.com', 'users/default.png', NULL, '$2y$10$RaCb.7VgtdWXjbGaqkWPSuTBTChJ4ubgDve.PTQjeizQa4jRp4ttG', NULL, NULL, NULL, '{\"locale\":\"en\"}', '2021-07-14 08:23:32', '2021-07-14 08:25:01'),
(7, 4, 'rider', 'rider@rider.com', 'users/default.png', NULL, '$2y$10$7T/oKfMreoJu6i9ez/j1Je.HciDHgJfPD9CwHdENg6osAWjo4ieau', NULL, NULL, NULL, '{\"locale\":\"en\"}', '2021-08-08 22:04:28', '2021-08-08 22:04:28'),
(8, 2, 'dipesh', 'dipes@dipes.com', 'users/default.png', NULL, '$2y$10$7ZjuuKYy2tB7LgyT1NXL2urUGexld0eKZW8SiIy/b1TqRDBd5820W', NULL, NULL, NULL, NULL, '2021-08-12 04:29:23', '2021-08-12 04:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('NOT_FULLFILLED','FULLFILLED') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NOT_FULLFILLED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_shop_id_foreign` (`shop_id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisements_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `balance_sheets`
--
ALTER TABLE `balance_sheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balance_sheets_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_accounts_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `browsing_histories`
--
ALTER TABLE `browsing_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `browsing_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `capitals`
--
ALTER TABLE `capitals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `capitals_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `cash_flows`
--
ALTER TABLE `cash_flows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_flows_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `comissions`
--
ALTER TABLE `comissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comissions_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `complains`
--
ALTER TABLE `complains`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complains_user_id_foreign` (`user_id`),
  ADD KEY `complains_product_id_foreign` (`product_id`),
  ADD KEY `complains_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credits_user_id_foreign` (`user_id`),
  ADD KEY `credits_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_payments_user_id_foreign` (`user_id`),
  ADD KEY `customer_payments_shop_id_foreign` (`shop_id`),
  ADD KEY `customer_payments_order_id_foreign` (`order_id`),
  ADD KEY `customer_payments_easy_order_id_foreign` (`easy_order_id`),
  ADD KEY `customer_payments_credit_id_foreign` (`credit_id`),
  ADD KEY `customer_payments_return_id_foreign` (`return_id`),
  ADD KEY `customer_payments_parcel_id_foreign` (`parcel_id`);

--
-- Indexes for table `customer_purchase_returns`
--
ALTER TABLE `customer_purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_purchase_returns_order_id_foreign` (`order_id`);

--
-- Indexes for table `customer_service_reports`
--
ALTER TABLE `customer_service_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_service_reports_army_id_foreign` (`army_id`);

--
-- Indexes for table `customer_service_tasks`
--
ALTER TABLE `customer_service_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_service_tasks_army_id_foreign` (`army_id`),
  ADD KEY `customer_service_tasks_service_id_foreign` (`service_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deliveries_team_id_foreign` (`team_id`);

--
-- Indexes for table `delivery_packages`
--
ALTER TABLE `delivery_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_packages_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `delivery_package_addresses`
--
ALTER TABLE `delivery_package_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_package_addresses_delivery_package_id_foreign` (`delivery_package_id`),
  ADD KEY `delivery_package_addresses_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `delivery_parcels`
--
ALTER TABLE `delivery_parcels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_parcels_delivery_package_id_foreign` (`delivery_package_id`),
  ADD KEY `delivery_parcels_shop_id_foreign` (`shop_id`),
  ADD KEY `delivery_parcels_order_id_foreign` (`order_id`),
  ADD KEY `delivery_parcels_user_id_foreign` (`user_id`);

--
-- Indexes for table `delivery_riders`
--
ALTER TABLE `delivery_riders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_riders_team_id_foreign` (`team_id`),
  ADD KEY `delivery_riders_user_id_foreign` (`user_id`);

--
-- Indexes for table `delivery_rider_reports`
--
ALTER TABLE `delivery_rider_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_rider_reports_rider_id_foreign` (`rider_id`);

--
-- Indexes for table `delivery_tasks`
--
ALTER TABLE `delivery_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_tasks_delivery_id_foreign` (`delivery_id`),
  ADD KEY `delivery_tasks_delivery_foreign` (`delivery`),
  ADD KEY `delivery_tasks_route_id_foreign` (`route_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `distribution_centers`
--
ALTER TABLE `distribution_centers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distribution_centers_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `easy_orders`
--
ALTER TABLE `easy_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `easy_orders_product_id_foreign` (`product_id`),
  ADD KEY `easy_orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `employee_earnings`
--
ALTER TABLE `employee_earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_earnings_team_id_foreign` (`team_id`),
  ADD KEY `employee_earnings_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_payments`
--
ALTER TABLE `employee_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_payments_shop_id_foreign` (`shop_id`),
  ADD KEY `employee_payments_rider_id_foreign` (`rider_id`),
  ADD KEY `employee_payments_emp_id_foreign` (`emp_id`),
  ADD KEY `employee_payments_task_id_foreign` (`task_id`);

--
-- Indexes for table `employee_profiles`
--
ALTER TABLE `employee_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `franchises`
--
ALTER TABLE `franchises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incomes_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `income_statements`
--
ALTER TABLE `income_statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `income_statements_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventories_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `language_configurations`
--
ALTER TABLE `language_configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liabilities`
--
ALTER TABLE `liabilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `liabilities_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `marketings`
--
ALTER TABLE `marketings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketings_team_id_foreign` (`team_id`);

--
-- Indexes for table `marketing_reports`
--
ALTER TABLE `marketing_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_reports_army_id_foreign` (`army_id`);

--
-- Indexes for table `marketing_tasks`
--
ALTER TABLE `marketing_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_tasks_army_id_foreign` (`army_id`),
  ADD KEY `marketing_tasks_marketing_id_foreign` (`marketing_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `newsletters_user_id_foreign` (`user_id`),
  ADD KEY `newsletters_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_user_id_foreign` (`user_id`),
  ADD KEY `notes_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notices_team_id_foreign` (`team_id`),
  ADD KEY `notices_user_id_foreign` (`user_id`),
  ADD KEY `notices_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_gift_id_foreign` (`gift_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_shop_id_foreign` (`shop_id`),
  ADD KEY `products_gift_id_foreign` (`gift_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_discounts`
--
ALTER TABLE `product_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_discounts_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profiles_email_unique` (`email`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `routes_rider_id_foreign` (`rider_id`),
  ADD KEY `routes_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `schedule_meetings`
--
ALTER TABLE `schedule_meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_meetings_team_id_foreign` (`team_id`),
  ADD KEY `schedule_meetings_shop_id_foreign` (`shop_id`),
  ADD KEY `schedule_meetings_user_id_foreign` (`user_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_team_id_foreign` (`team_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shops_email_unique` (`email`),
  ADD UNIQUE KEY `shops_contact_no_unique` (`contact_no`),
  ADD KEY `shops_user_id_foreign` (`user_id`);

--
-- Indexes for table `shop_customer_services`
--
ALTER TABLE `shop_customer_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_customer_services_customer_id_foreign` (`customer_id`),
  ADD KEY `shop_customer_services_shop_id_foreign` (`shop_id`),
  ADD KEY `shop_customer_services_product_id_foreign` (`product_id`);

--
-- Indexes for table `shop_goals`
--
ALTER TABLE `shop_goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_goals_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `shop_payments`
--
ALTER TABLE `shop_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_payments_shop_id_foreign` (`shop_id`),
  ADD KEY `shop_payments_asset_id_foreign` (`asset_id`),
  ADD KEY `shop_payments_advertisement_id_foreign` (`advertisement_id`),
  ADD KEY `shop_payments_liability_id_foreign` (`liability_id`),
  ADD KEY `shop_payments_capital_id_foreign` (`capital_id`),
  ADD KEY `shop_payments_income_id_foreign` (`income_id`),
  ADD KEY `shop_payments_expense_id_foreign` (`expense_id`),
  ADD KEY `shop_payments_parcel_id_foreign` (`parcel_id`);

--
-- Indexes for table `shop_ratings`
--
ALTER TABLE `shop_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_ratings_shop_id_foreign` (`shop_id`),
  ADD KEY `shop_ratings_user_id_foreign` (`user_id`);

--
-- Indexes for table `shop_reports`
--
ALTER TABLE `shop_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_reports_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_product_id_foreign` (`product_id`);

--
-- Indexes for table `sub_orders`
--
ALTER TABLE `sub_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_orders_shop_id_foreign` (`shop_id`),
  ADD KEY `sub_orders_order_id_foreign` (`order_id`),
  ADD KEY `sub_orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `sub_order_items`
--
ALTER TABLE `sub_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_order_items_sub_order_id_foreign` (`sub_order_id`),
  ADD KEY `sub_order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `sub_order_returns`
--
ALTER TABLE `sub_order_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_order_returns_sub_order_id_foreign` (`sub_order_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_shop_id_foreign` (`shop_id`),
  ADD KEY `teams_team_leader_id_foreign` (`team_leader_id`);

--
-- Indexes for table `team_goals`
--
ALTER TABLE `team_goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_goals_team_id_foreign` (`team_id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_members_team_id_foreign` (`team_id`),
  ADD KEY `team_members_user_id_foreign` (`user_id`);

--
-- Indexes for table `team_reports`
--
ALTER TABLE `team_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_reports_team_id_foreign` (`team_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `trial_balances`
--
ALTER TABLE `trial_balances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trial_balances_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `balance_sheets`
--
ALTER TABLE `balance_sheets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `browsing_histories`
--
ALTER TABLE `browsing_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `capitals`
--
ALTER TABLE `capitals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_flows`
--
ALTER TABLE `cash_flows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comissions`
--
ALTER TABLE `comissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complains`
--
ALTER TABLE `complains`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `credits`
--
ALTER TABLE `credits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_payments`
--
ALTER TABLE `customer_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_purchase_returns`
--
ALTER TABLE `customer_purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_service_reports`
--
ALTER TABLE `customer_service_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_service_tasks`
--
ALTER TABLE `customer_service_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_packages`
--
ALTER TABLE `delivery_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `delivery_package_addresses`
--
ALTER TABLE `delivery_package_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery_parcels`
--
ALTER TABLE `delivery_parcels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `delivery_riders`
--
ALTER TABLE `delivery_riders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivery_rider_reports`
--
ALTER TABLE `delivery_rider_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_tasks`
--
ALTER TABLE `delivery_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distribution_centers`
--
ALTER TABLE `distribution_centers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `easy_orders`
--
ALTER TABLE `easy_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee_earnings`
--
ALTER TABLE `employee_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_payments`
--
ALTER TABLE `employee_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_profiles`
--
ALTER TABLE `employee_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `franchises`
--
ALTER TABLE `franchises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_statements`
--
ALTER TABLE `income_statements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language_configurations`
--
ALTER TABLE `language_configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `liabilities`
--
ALTER TABLE `liabilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketings`
--
ALTER TABLE `marketings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_reports`
--
ALTER TABLE `marketing_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_tasks`
--
ALTER TABLE `marketing_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_discounts`
--
ALTER TABLE `product_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule_meetings`
--
ALTER TABLE `schedule_meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_customer_services`
--
ALTER TABLE `shop_customer_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_goals`
--
ALTER TABLE `shop_goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_payments`
--
ALTER TABLE `shop_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_ratings`
--
ALTER TABLE `shop_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_reports`
--
ALTER TABLE `shop_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `sub_orders`
--
ALTER TABLE `sub_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `sub_order_items`
--
ALTER TABLE `sub_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `sub_order_returns`
--
ALTER TABLE `sub_order_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_goals`
--
ALTER TABLE `team_goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_reports`
--
ALTER TABLE `team_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `trial_balances`
--
ALTER TABLE `trial_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `advertisements_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `balance_sheets`
--
ALTER TABLE `balance_sheets`
  ADD CONSTRAINT `balance_sheets_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD CONSTRAINT `bank_accounts_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `browsing_histories`
--
ALTER TABLE `browsing_histories`
  ADD CONSTRAINT `browsing_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `capitals`
--
ALTER TABLE `capitals`
  ADD CONSTRAINT `capitals_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_flows`
--
ALTER TABLE `cash_flows`
  ADD CONSTRAINT `cash_flows_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `comissions`
--
ALTER TABLE `comissions`
  ADD CONSTRAINT `comissions_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `complains`
--
ALTER TABLE `complains`
  ADD CONSTRAINT `complains_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `complains_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `complains_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `credits`
--
ALTER TABLE `credits`
  ADD CONSTRAINT `credits_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `credits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD CONSTRAINT `customer_payments_credit_id_foreign` FOREIGN KEY (`credit_id`) REFERENCES `credits` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_payments_easy_order_id_foreign` FOREIGN KEY (`easy_order_id`) REFERENCES `easy_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_payments_parcel_id_foreign` FOREIGN KEY (`parcel_id`) REFERENCES `delivery_parcels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_payments_return_id_foreign` FOREIGN KEY (`return_id`) REFERENCES `customer_purchase_returns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_payments_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_purchase_returns`
--
ALTER TABLE `customer_purchase_returns`
  ADD CONSTRAINT `customer_purchase_returns_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_service_reports`
--
ALTER TABLE `customer_service_reports`
  ADD CONSTRAINT `customer_service_reports_army_id_foreign` FOREIGN KEY (`army_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_service_tasks`
--
ALTER TABLE `customer_service_tasks`
  ADD CONSTRAINT `customer_service_tasks_army_id_foreign` FOREIGN KEY (`army_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_service_tasks_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_packages`
--
ALTER TABLE `delivery_packages`
  ADD CONSTRAINT `delivery_packages_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_package_addresses`
--
ALTER TABLE `delivery_package_addresses`
  ADD CONSTRAINT `delivery_package_addresses_delivery_package_id_foreign` FOREIGN KEY (`delivery_package_id`) REFERENCES `delivery_packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_package_addresses_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_parcels`
--
ALTER TABLE `delivery_parcels`
  ADD CONSTRAINT `delivery_parcels_delivery_package_id_foreign` FOREIGN KEY (`delivery_package_id`) REFERENCES `delivery_packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_parcels_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_parcels_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_parcels_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_riders`
--
ALTER TABLE `delivery_riders`
  ADD CONSTRAINT `delivery_riders_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_riders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_rider_reports`
--
ALTER TABLE `delivery_rider_reports`
  ADD CONSTRAINT `delivery_rider_reports_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `delivery_riders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_tasks`
--
ALTER TABLE `delivery_tasks`
  ADD CONSTRAINT `delivery_tasks_delivery_foreign` FOREIGN KEY (`delivery`) REFERENCES `deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_tasks_delivery_id_foreign` FOREIGN KEY (`delivery_id`) REFERENCES `delivery_parcels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_tasks_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `distribution_centers`
--
ALTER TABLE `distribution_centers`
  ADD CONSTRAINT `distribution_centers_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `easy_orders`
--
ALTER TABLE `easy_orders`
  ADD CONSTRAINT `easy_orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `easy_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_earnings`
--
ALTER TABLE `employee_earnings`
  ADD CONSTRAINT `employee_earnings_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_earnings_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_payments`
--
ALTER TABLE `employee_payments`
  ADD CONSTRAINT `employee_payments_emp_id_foreign` FOREIGN KEY (`emp_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_payments_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `delivery_riders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_payments_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_payments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `delivery_tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_profiles`
--
ALTER TABLE `employee_profiles`
  ADD CONSTRAINT `employee_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `income_statements`
--
ALTER TABLE `income_statements`
  ADD CONSTRAINT `income_statements_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventories`
--
ALTER TABLE `inventories`
  ADD CONSTRAINT `inventories_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `liabilities`
--
ALTER TABLE `liabilities`
  ADD CONSTRAINT `liabilities_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marketings`
--
ALTER TABLE `marketings`
  ADD CONSTRAINT `marketings_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marketing_reports`
--
ALTER TABLE `marketing_reports`
  ADD CONSTRAINT `marketing_reports_army_id_foreign` FOREIGN KEY (`army_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marketing_tasks`
--
ALTER TABLE `marketing_tasks`
  ADD CONSTRAINT `marketing_tasks_army_id_foreign` FOREIGN KEY (`army_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `marketing_tasks_marketing_id_foreign` FOREIGN KEY (`marketing_id`) REFERENCES `marketings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD CONSTRAINT `newsletters_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `newsletters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notices_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_gift_id_foreign` FOREIGN KEY (`gift_id`) REFERENCES `gifts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_gift_id_foreign` FOREIGN KEY (`gift_id`) REFERENCES `gifts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_discounts`
--
ALTER TABLE `product_discounts`
  ADD CONSTRAINT `product_discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `delivery_riders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `routes_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedule_meetings`
--
ALTER TABLE `schedule_meetings`
  ADD CONSTRAINT `schedule_meetings_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedule_meetings_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedule_meetings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_customer_services`
--
ALTER TABLE `shop_customer_services`
  ADD CONSTRAINT `shop_customer_services_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_customer_services_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_customer_services_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_goals`
--
ALTER TABLE `shop_goals`
  ADD CONSTRAINT `shop_goals_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_payments`
--
ALTER TABLE `shop_payments`
  ADD CONSTRAINT `shop_payments_advertisement_id_foreign` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_payments_asset_id_foreign` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_payments_capital_id_foreign` FOREIGN KEY (`capital_id`) REFERENCES `capitals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_payments_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_payments_income_id_foreign` FOREIGN KEY (`income_id`) REFERENCES `incomes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_payments_liability_id_foreign` FOREIGN KEY (`liability_id`) REFERENCES `liabilities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_payments_parcel_id_foreign` FOREIGN KEY (`parcel_id`) REFERENCES `delivery_parcels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_payments_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_ratings`
--
ALTER TABLE `shop_ratings`
  ADD CONSTRAINT `shop_ratings_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_reports`
--
ALTER TABLE `shop_reports`
  ADD CONSTRAINT `shop_reports_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_orders`
--
ALTER TABLE `sub_orders`
  ADD CONSTRAINT `sub_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `sub_orders_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`),
  ADD CONSTRAINT `sub_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sub_order_items`
--
ALTER TABLE `sub_order_items`
  ADD CONSTRAINT `sub_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sub_order_items_sub_order_id_foreign` FOREIGN KEY (`sub_order_id`) REFERENCES `sub_orders` (`id`);

--
-- Constraints for table `sub_order_returns`
--
ALTER TABLE `sub_order_returns`
  ADD CONSTRAINT `sub_order_returns_sub_order_id_foreign` FOREIGN KEY (`sub_order_id`) REFERENCES `sub_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teams_team_leader_id_foreign` FOREIGN KEY (`team_leader_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_goals`
--
ALTER TABLE `team_goals`
  ADD CONSTRAINT `team_goals_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_members`
--
ALTER TABLE `team_members`
  ADD CONSTRAINT `team_members_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `team_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_reports`
--
ALTER TABLE `team_reports`
  ADD CONSTRAINT `team_reports_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trial_balances`
--
ALTER TABLE `trial_balances`
  ADD CONSTRAINT `trial_balances_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
