-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2021 at 12:34 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apitest`
--

-- --------------------------------------------------------

--
-- Table structure for table `cours`
--

CREATE TABLE `cours` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_cour` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_prof` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_matiere` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cours`
--

INSERT INTO `cours` (`id`, `created_at`, `updated_at`, `name_cour`, `id_prof`, `file`, `name_matiere`) VALUES
(3, '2021-05-17 20:20:21', '2021-05-17 20:20:21', 'uoyf', NULL, '3', 'ar'),
(4, '2021-05-17 20:44:38', '2021-05-17 20:44:38', 'eng', 20, 'person', 'alm');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(52, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(53, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 2),
(54, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(55, 11, 'name_cour', 'text', 'Name Cour', 0, 1, 1, 1, 1, 1, '{}', 4),
(56, 11, 'id_prof', 'text', 'Id Prof', 0, 1, 1, 1, 1, 1, '{}', 5),
(57, 11, 'file', 'text', 'File', 0, 1, 1, 1, 1, 1, '{}', 6),
(58, 11, 'name_matiere', 'text', 'Name Matiere', 0, 1, 1, 1, 1, 1, '{}', 7),
(59, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(60, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 2),
(61, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(62, 12, 'id_prof', 'text', 'Id Prof', 0, 1, 1, 1, 1, 1, '{}', 4),
(63, 12, 'name_tp', 'text', 'Name Tp', 0, 1, 1, 1, 1, 1, '{}', 5),
(64, 12, 'class', 'text', 'Class', 0, 1, 1, 1, 1, 1, '{}', 6),
(65, 12, 'file', 'text', 'File', 0, 1, 1, 1, 1, 1, '{}', 7),
(66, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(67, 13, 'id_prof', 'text', 'Id Prof', 0, 1, 1, 1, 1, 1, '{}', 2),
(68, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(69, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(70, 13, 'name_td', 'text', 'Name Td', 0, 1, 1, 1, 1, 1, '{}', 5),
(71, 13, 'name_matier', 'text', 'Name Matier', 0, 1, 1, 1, 1, 1, '{}', 6);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(11, 'cours', 'cours', 'Cour', 'Cours', NULL, 'App\\Cour', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-05-17 13:33:20', '2021-05-17 13:33:20'),
(12, 'tps', 'tps', 'Tp', 'Tps', NULL, 'App\\Tp', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-05-17 13:39:56', '2021-05-17 13:39:56'),
(13, 'tds', 'tds', 'Td', 'Tds', NULL, 'App\\Td', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-05-17 13:42:27', '2021-05-17 13:42:27');

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-03-26 23:04:44', '2021-03-26 23:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-03-26 23:04:44', '2021-03-26 23:04:44', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-03-26 23:04:44', '2021-03-26 23:04:44', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-03-26 23:04:44', '2021-03-26 23:04:44', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-03-26 23:04:44', '2021-03-26 23:04:44', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-03-26 23:04:44', '2021-03-26 23:04:44', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-03-26 23:04:44', '2021-03-26 23:04:44', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-03-26 23:04:44', '2021-03-26 23:04:44', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-03-26 23:04:44', '2021-03-26 23:04:44', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-03-26 23:04:44', '2021-03-26 23:04:44', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-03-26 23:04:44', '2021-03-26 23:04:44', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2021-03-26 23:04:44', '2021-03-26 23:04:44', 'voyager.hooks', NULL),
(17, 1, 'Cours', '', '_self', NULL, NULL, NULL, 15, '2021-05-17 13:33:20', '2021-05-17 13:33:20', 'voyager.cours.index', NULL),
(18, 1, 'Tps', '', '_self', NULL, NULL, NULL, 16, '2021-05-17 13:39:56', '2021-05-17 13:39:56', 'voyager.tps.index', NULL),
(19, 1, 'Tds', '', '_self', NULL, NULL, NULL, 17, '2021-05-17 13:42:27', '2021-05-17 13:42:27', 'voyager.tds.index', NULL);

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
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2021_03_26_153739_create_marhoujas_table', 2),
(4, '2016_01_01_000000_add_voyager_user_fields', 3),
(5, '2016_01_01_000000_create_data_types_table', 3),
(6, '2016_05_19_173453_create_menu_table', 3),
(7, '2016_10_21_190000_create_roles_table', 3),
(8, '2016_10_21_190000_create_settings_table', 3),
(9, '2016_11_30_135954_create_permission_table', 3),
(10, '2016_11_30_141208_create_permission_role_table', 3),
(11, '2016_12_26_201236_data_types__add__server_side', 3),
(12, '2017_01_13_000000_add_route_to_menu_items_table', 3),
(13, '2017_01_14_005015_create_translations_table', 3),
(14, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 3),
(15, '2017_03_06_000000_add_controller_to_data_types_table', 3),
(16, '2017_04_21_000000_add_order_to_data_rows_table', 3),
(17, '2017_07_05_210000_add_policyname_to_data_types_table', 3),
(18, '2017_08_05_000000_add_group_to_settings_table', 3),
(19, '2017_11_26_013050_add_user_role_relationship', 3),
(20, '2017_11_26_015000_create_user_roles_table', 3),
(21, '2018_03_11_000000_add_user_settings', 3),
(22, '2018_03_14_000000_add_details_to_data_types_table', 3),
(23, '2018_03_16_000000_make_settings_value_nullable', 3),
(24, '2014_10_12_100000_create_password_resets_table', 4),
(25, '2019_12_14_000001_create_personal_access_tokens_table', 4);

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(2, 'browse_bread', NULL, '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(3, 'browse_database', NULL, '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(4, 'browse_media', NULL, '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(5, 'browse_compass', NULL, '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(6, 'browse_menus', 'menus', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(7, 'read_menus', 'menus', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(8, 'edit_menus', 'menus', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(9, 'add_menus', 'menus', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(10, 'delete_menus', 'menus', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(11, 'browse_roles', 'roles', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(12, 'read_roles', 'roles', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(13, 'edit_roles', 'roles', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(14, 'add_roles', 'roles', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(15, 'delete_roles', 'roles', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(16, 'browse_users', 'users', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(17, 'read_users', 'users', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(18, 'edit_users', 'users', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(19, 'add_users', 'users', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(20, 'delete_users', 'users', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(21, 'browse_settings', 'settings', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(22, 'read_settings', 'settings', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(23, 'edit_settings', 'settings', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(24, 'add_settings', 'settings', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(25, 'delete_settings', 'settings', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(26, 'browse_hooks', NULL, '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(52, 'browse_cours', 'cours', '2021-05-17 13:33:20', '2021-05-17 13:33:20'),
(53, 'read_cours', 'cours', '2021-05-17 13:33:20', '2021-05-17 13:33:20'),
(54, 'edit_cours', 'cours', '2021-05-17 13:33:20', '2021-05-17 13:33:20'),
(55, 'add_cours', 'cours', '2021-05-17 13:33:20', '2021-05-17 13:33:20'),
(56, 'delete_cours', 'cours', '2021-05-17 13:33:20', '2021-05-17 13:33:20'),
(57, 'browse_tps', 'tps', '2021-05-17 13:39:56', '2021-05-17 13:39:56'),
(58, 'read_tps', 'tps', '2021-05-17 13:39:56', '2021-05-17 13:39:56'),
(59, 'edit_tps', 'tps', '2021-05-17 13:39:56', '2021-05-17 13:39:56'),
(60, 'add_tps', 'tps', '2021-05-17 13:39:56', '2021-05-17 13:39:56'),
(61, 'delete_tps', 'tps', '2021-05-17 13:39:56', '2021-05-17 13:39:56'),
(62, 'browse_tds', 'tds', '2021-05-17 13:42:27', '2021-05-17 13:42:27'),
(63, 'read_tds', 'tds', '2021-05-17 13:42:27', '2021-05-17 13:42:27'),
(64, 'edit_tds', 'tds', '2021-05-17 13:42:27', '2021-05-17 13:42:27'),
(65, 'add_tds', 'tds', '2021-05-17 13:42:27', '2021-05-17 13:42:27'),
(66, 'delete_tds', 'tds', '2021-05-17 13:42:27', '2021-05-17 13:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(16, 3),
(17, 1),
(17, 3),
(18, 1),
(18, 3),
(19, 1),
(19, 3),
(20, 1),
(20, 3),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 26, 'my-app-token', '9ca932cc2e2501ec84d00b79ca82515289aff128d48d65ec41094cc3eb72bea5', '[\"*\"]', NULL, '2021-05-17 16:16:27', '2021-05-17 16:16:27'),
(2, 'App\\User', 26, 'my-app-token', '5b4fd4b913868d106bf43f6cc75687d31865516888bf64686bb71f798cfbe914', '[\"*\"]', NULL, '2021-05-17 17:19:03', '2021-05-17 17:19:03'),
(3, 'App\\User', 26, 'my-app-token', '19b11f71bb64ea89a3423f367810296b550ee8976b1df54af6f706f38537b672', '[\"*\"]', '2021-05-17 20:29:49', '2021-05-17 20:05:53', '2021-05-17 20:29:49'),
(4, 'App\\User', 26, 'my-app-token', '2b22723ad3c058a8d7ff64ef8c38d1bee2c0ba7a1e23acf1ef80dfc8a7c00294', '[\"*\"]', '2021-05-17 21:00:51', '2021-05-17 20:42:12', '2021-05-17 21:00:51'),
(5, 'App\\User', 29, 'my-app-token', '051521488387fa6a9e8c67e87710ead075aa331cf66eaee24b44e8c6e7782a62', '[\"*\"]', NULL, '2021-05-17 21:26:00', '2021-05-17 21:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-03-26 23:04:44', '2021-03-26 23:04:44'),
(2, 'student', 'student', '2021-03-26 23:04:44', '2021-05-17 13:25:19'),
(3, 'prof', 'Prof', '2021-03-26 23:18:47', '2021-05-17 13:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\May2021\\pboMq2TRbpAHAClw4s5O.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Isimm', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'salut', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\May2021\\It3PASKvjz82fQfkoaKy.jpg', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tds`
--

CREATE TABLE `tds` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_prof` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_td` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_matier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tds`
--

INSERT INTO `tds` (`id`, `id_prof`, `created_at`, `updated_at`, `name_td`, `name_matier`, `file`, `class`) VALUES
(1, 2, '2021-05-17 21:00:46', '2021-05-17 21:00:46', 'uili', 'wwww', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tps`
--

CREATE TABLE `tps` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_prof` int(11) DEFAULT NULL,
  `name_tp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_matier` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tps`
--

INSERT INTO `tps` (`id`, `created_at`, `updated_at`, `id_prof`, `name_tp`, `class`, `file`, `name_matier`) VALUES
(1, '2021-05-17 20:55:35', '2021-05-17 20:55:35', 2, 'algo', 'tp1', 'yu/mli', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'saif', 'saifchtourou@ieee.org', 'users/default.png', NULL, '$2y$10$qZGg2/tEnqmRCbAPL23wQus12Udok8H4.qiRFJEkJzzImzm5DA5iO', 'xe5n2AxjgHwu7LFKqCBeXystUocKOBdSDAkhGzqKV1T26qlE5kusVTsCmWLm', '{\"locale\":\"en\"}', '2021-03-26 23:05:36', '2021-03-29 17:19:30'),
(2, 3, 'saif', 'saif@saif', 'users/default.png', NULL, '$2y$10$Tka85z2sGmEDouIjHWbT6uhZwCAQBaGlOucnsL0FjEk1xHme5Q/gq', NULL, '{\"locale\":\"fr\"}', '2021-03-26 23:19:29', '2021-03-27 20:56:25'),
(21, 1, 'yoldes', 'yoldes@dd', 'users/default.png', NULL, '$2y$10$hlZYvgo.OSgoQpoa1Yo4EuhjIihX4rJ5btXoDUBb30gEa5IQ8M0Nu', NULL, '{\"locale\":\"en\"}', '2021-03-28 00:23:16', '2021-03-28 00:23:16'),
(22, 2, 'sami', 'sami@sami', 'users/default.png', NULL, '$2y$10$4pT1i5RGf9TWjTktRsfimO1uslWnq/uenJZsLyt1VPjNsSvIFAiDe', NULL, '{\"locale\":\"id\"}', '2021-03-28 00:28:01', '2021-03-28 00:28:01'),
(23, 2, 'dbwbsbd', 'csf@hdg', 'users/default.png', NULL, '$2y$10$3iAGusRGpqHP3bcYebMrNuuSjMYvPI570fXgGDwiAu64cl1Mc4DiC', NULL, '{\"locale\":\"fr\"}', '2021-03-29 15:35:05', '2021-03-29 15:35:05'),
(24, 1, 'aaziz', 'aziz@aziz', 'users/default.png', NULL, '$2y$10$E7gd8xQXRTbOyFqrhdcPwO5h8ANIBbirnWh.YV2rRWjajY5q1AaPi', NULL, NULL, '2021-05-17 13:18:10', '2021-05-17 13:18:10'),
(25, NULL, 'saif', 'chtourou@chtourou', 'users/default.png', NULL, '$2y$10$CnwFhSDMzjJYDfXw0wVyzOZZDDO7x6oz95hh/ikVYcg4EItdLEA4.', NULL, '{\"locale\":\"en\"}', '2021-05-17 13:45:53', '2021-05-17 16:04:47'),
(26, NULL, 'John Doe', 'john@doe.com', 'users/default.png', NULL, '$2y$10$Fyy.8Us.CLROlYIjsgURM.hhHpjpn/hQTSCx4ok5ebdV/qr2SOnYu', NULL, NULL, NULL, NULL),
(27, NULL, 'abdou', 'aaa@aaa', 'users/default.png', NULL, '$2y$10$aLufM.S.2xiQ0J0WTpLceuDsbawEK3GMIWgSUew35M6wuor/6efvG', NULL, NULL, '2021-05-17 21:19:42', '2021-05-17 21:19:42'),
(28, NULL, 'slaim', 'slaim@aaa', 'users/default.png', NULL, '$2y$10$3kErLTCyKGnWKSK.5WH03eU7HCGzrbx1dXbby.iDclsvGgNF9ugCG', NULL, NULL, '2021-05-17 21:20:19', '2021-05-17 21:20:19'),
(29, NULL, 'loulou', 'loulou@aaa', 'users/default.png', NULL, '$2y$10$30Z25lfNNvdmikFJpdk.8e2d6bOecolwAKK9MkrWYWxm3J2HFU.Wa', NULL, NULL, '2021-05-17 21:26:00', '2021-05-17 21:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(21, 2),
(21, 3),
(22, 2),
(22, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `tds`
--
ALTER TABLE `tds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tps`
--
ALTER TABLE `tps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tds`
--
ALTER TABLE `tds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tps`
--
ALTER TABLE `tps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
