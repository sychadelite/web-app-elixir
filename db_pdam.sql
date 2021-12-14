-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2021 at 08:07 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pdam`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_news` int(11) NOT NULL,
  `id_pusat` int(11) NOT NULL,
  `headline` varchar(100) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date_created` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_news`, `id_pusat`, `headline`, `content`, `date_created`, `created_at`, `updated_at`) VALUES
(90001, 81010, 'Pembaruan Pipa Air', 'aetra air jakarta melakukan penanganan dan pengamatan perbaikan pipa', '2021-09-28', '2021-11-30 07:51:33', '2021-12-30 07:51:53'),
(90002, 81010, 'Relokasi Pipa Induk', 'aetra akan melakukan relokasi pipa induk diameter 600 mm dalam rangka sinkronisasi penyaluran air', '2021-10-29', '2021-12-29 07:52:01', '2021-12-29 07:52:06'),
(90004, 81011, 'Koordinasi Langganan', 'koordinasi bagian hubungan langganan pusat dengan cabang sukabumi 3', '2021-10-27', '2021-12-02 07:52:14', '2021-12-03 07:52:23'),
(90005, 81011, 'koordinasi bagian administrasi', 'koordinasi bagian administrasi dan keuangan pusat dengan cabang sukabumi 4', '2021-10-28', '2021-12-01 07:52:37', '2021-12-01 07:52:37'),
(90006, 81011, 'Rapat Koordinasi', 'rapat koordinasi bulan september 2021 cabang', '2021-10-29', '2021-11-25 07:52:37', '2021-12-03 07:52:37'),
(90007, 81011, 'Zoom Meeting Bersama WI.PLAT', 'lorem ipsum', '2021-10-30', '2021-12-03 07:52:37', '2021-12-04 07:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `cabang_pdam`
--

CREATE TABLE `cabang_pdam` (
  `id_cabang` int(11) NOT NULL,
  `id_pusat` int(11) NOT NULL,
  `nama_cabang` varchar(255) NOT NULL,
  `alamat_cabang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cabang_pdam`
--

INSERT INTO `cabang_pdam` (`id_cabang`, `id_pusat`, `nama_cabang`, `alamat_cabang`) VALUES
(72010, 81010, 'SBU UTARA', 'Jl. Tongkol No. 5 Tanjung Priok Jakarta Utara, 14310'),
(72011, 81010, 'SBU SELATAN', 'Jl. Raya Kalimalang No. 89 Jakarta Timur 13450'),
(72013, 81010, 'BUARAN PROJECT OFFICE (BPO)', 'Jl. Raya Kalimalang No. 89 Jakarta Timur 13450'),
(72014, 81010, 'GEDUNG WORKSHOP METER', 'Jl. Raya Kalimalang No. 89 Jakarta Timur 13450'),
(72015, 81011, 'Cabang Sukabumi 1', 'Jl. Kapt. Moch. Mahpud, Selabintana Batas No. 1'),
(72016, 81011, 'Cabang Sukabumi 2', 'Jl. Safir Raya No. 41-42 Perum Baros Kencana'),
(72017, 81011, 'Cabang Sukabumi 3', 'Jl. Suryakencana KM. 14, Desa Sukasari - Cisaat'),
(72018, 81011, 'Cabang Sukabumi 4', 'Perum Gading Kencana Asri Blok F2 No. 2'),
(72019, 81012, 'SEMARANG TIMUR', 'Jl. Parang Kesit Raya'),
(72020, 81012, 'SEMARANG BARAT', 'Jl. Sri Rejeki Utara No.8'),
(72021, 81012, 'NORTH SEMARANG BRANCH OFFICE', 'Jalan Dokter Cipto No.25');

-- --------------------------------------------------------

--
-- Table structure for table `data_sambungan`
--

CREATE TABLE `data_sambungan` (
  `id_data` int(11) NOT NULL,
  `nomor_sambungan` int(11) NOT NULL,
  `flow_rate` float NOT NULL,
  `total_milli_litres` int(11) NOT NULL,
  `total_litres` float NOT NULL,
  `value_distance` mediumint(9) NOT NULL,
  `date_record` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_sambungan`
--

INSERT INTO `data_sambungan` (`id_data`, `nomor_sambungan`, `flow_rate`, `total_milli_litres`, `total_litres`, `value_distance`, `date_record`) VALUES
(1, 21001, 3.5, 58, 251, 32, '2021-11-03 10:33:34'),
(2, 21002, 4.8, 60, 301, 35, '2021-11-04 07:05:12'),
(419, 21016, 0.19, 9, 0, 906, '2021-11-17 12:00:40'),
(420, 21016, 0, 9, 0, 652, '2021-11-17 12:00:48'),
(421, 21016, 0, 9, 0, 1207, '2021-11-17 12:00:56'),
(422, 21016, 11.31, 574, 0.19, 4, '2021-11-17 12:01:04'),
(423, 21016, 0, 574, 0.19, 0, '2021-11-17 12:01:14'),
(424, 21016, 0, 574, 0.19, 53, '2021-11-17 12:01:22'),
(425, 21016, 0, 574, 0.19, 261, '2021-11-17 12:01:30'),
(426, 21016, 0, 574, 0.19, 72, '2021-11-17 12:01:38'),
(427, 21016, 0, 574, 0.19, 48, '2021-11-17 12:01:46'),
(428, 21016, 0, 574, 0.19, 1082, '2021-11-17 12:01:54'),
(429, 21016, 5.63, 855, 0.29, 29, '2021-11-17 12:02:03'),
(430, 21016, 2.22, 965, 0.32, 27, '2021-11-17 12:02:11'),
(431, 21016, 0, 965, 0.32, 55, '2021-11-17 12:02:19'),
(432, 21016, 0, 965, 0.32, 26, '2021-11-17 12:02:27'),
(433, 21016, 3.38, 1134, 0.38, 52, '2021-11-17 12:02:35'),
(434, 21016, 6.15, 1441, 0.48, 52, '2021-11-17 12:02:44'),
(435, 21016, 10.25, 1953, 0.65, 52, '2021-11-17 12:02:52'),
(436, 21016, 19.41, 2923, 0.98, 52, '2021-11-17 12:03:00'),
(437, 21016, 6.26, 3235, 1.08, 55, '2021-11-17 12:03:08'),
(438, 21016, 11.69, 3819, 1.27, 390, '2021-11-17 12:03:16'),
(439, 21016, 13.95, 4516, 1.51, 36, '2021-11-17 12:03:25'),
(440, 21016, 0, 4516, 1.51, 48, '2021-11-17 12:03:33'),
(441, 21016, 5.65, 4798, 1.6, 32, '2021-11-17 12:03:41'),
(442, 21016, 3.54, 4974, 1.66, 33, '2021-11-17 12:03:49'),
(443, 21016, 10.23, 5485, 1.83, 389, '2021-11-17 12:03:57'),
(444, 21016, 3.44, 5656, 1.89, 390, '2021-11-17 12:04:05'),
(445, 21016, 2.27, 5769, 1.93, 1208, '2021-11-17 12:04:14'),
(446, 21016, 18.66, 6701, 2.24, 1208, '2021-11-17 12:04:22'),
(447, 21016, 19.25, 7663, 2.56, 56, '2021-11-17 12:04:30'),
(448, 21016, 20.4, 8683, 2.9, 58, '2021-11-17 12:04:38'),
(449, 21016, 10.08, 9187, 3.07, 59, '2021-11-17 12:04:46'),
(450, 21016, 7.88, 9581, 3.2, 57, '2021-11-17 12:04:54'),
(451, 21016, 15.82, 10372, 3.46, 56, '2021-11-17 12:05:02'),
(452, 21016, 0, 10372, 3.46, 15, '2021-11-17 12:05:11'),
(453, 21016, 0, 10372, 3.46, 89, '2021-11-17 12:05:19'),
(454, 21016, 0, 10372, 3.46, 88, '2021-11-17 12:05:27'),
(455, 21016, 0, 10372, 3.46, 89, '2021-11-17 12:05:35'),
(456, 21016, 18.88, 11316, 3.78, 64, '2021-11-17 12:05:43'),
(457, 21016, 5.54, 11592, 3.87, 1168, '2021-11-17 12:05:51'),
(458, 21016, 14.65, 12324, 4.11, 738, '2021-11-17 12:05:59'),
(459, 21016, 10.91, 12869, 4.29, 392, '2021-11-17 12:06:08'),
(460, 21016, 17.23, 13730, 4.58, 394, '2021-11-17 12:06:16'),
(461, 21016, 10.86, 14272, 4.76, 1208, '2021-11-17 12:06:24'),
(462, 21016, 10.05, 14774, 4.93, 54, '2021-11-17 12:06:32'),
(463, 21016, 7.33, 15140, 5.05, 54, '2021-11-17 12:06:40'),
(464, 21016, 16.04, 15942, 5.32, 55, '2021-11-17 12:06:49'),
(465, 21016, 0, 15942, 5.32, 55, '2021-11-17 12:06:57'),
(466, 21016, 0, 15942, 5.32, 54, '2021-11-17 12:07:05'),
(467, 21016, 0, 15942, 5.32, 54, '2021-11-17 12:07:13'),
(468, 21016, 0, 15942, 5.32, 55, '2021-11-17 12:07:21'),
(469, 21016, 0, 15942, 5.32, 56, '2021-11-17 12:07:30'),
(470, 21016, 0, 15942, 5.32, 63, '2021-11-17 12:07:40'),
(471, 21016, 0, 15942, 5.32, 55, '2021-11-17 12:07:43'),
(472, 21016, 0, 15942, 5.32, 55, '2021-11-17 12:07:48'),
(473, 21016, 0, 15942, 5.32, 54, '2021-11-17 12:07:56'),
(474, 21016, 0, 15942, 5.32, 49, '2021-11-17 12:08:04'),
(475, 21016, 0, 15942, 5.32, 54, '2021-11-17 12:08:12'),
(476, 21016, 0, 15942, 5.32, 55, '2021-11-17 12:08:21'),
(477, 21016, 0, 15942, 5.32, 54, '2021-11-17 12:08:29'),
(478, 21016, 0, 15942, 5.32, 54, '2021-11-17 12:08:37'),
(479, 21016, 0.48, 15966, 5.33, 56, '2021-11-17 12:08:45'),
(480, 21016, 0, 15966, 5.33, 54, '2021-11-17 12:08:53'),
(481, 21016, 0, 15966, 5.33, 54, '2021-11-17 12:09:02'),
(482, 21016, 2.64, 16097, 5.37, 55, '2021-11-17 12:09:10'),
(483, 21016, 6.89, 16441, 5.49, 55, '2021-11-17 12:09:18');

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
(5, '2021_11_06_080647_add_column_photo_to_users_table', 2),
(6, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(7, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(8, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(9, '2016_06_01_000004_create_oauth_clients_table', 3),
(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3),
(11, '2021_11_19_060613_add_column_username_to_users_table', 4),
(13, '2021_11_30_071008_create_cabang_pdams_table', 6),
(14, '2021_11_30_071128_create_sambungans_table', 6),
(15, '2021_11_30_071202_create_data_sambungans_table', 6),
(16, '2021_11_30_065039_create_news_table', 7),
(17, '2021_12_02_090639_add_column_timestamp_to_report_table', 8),
(18, '2021_12_02_090639_add_column_timestamp_to_berita_table', 9),
(19, '2021_12_04_081924_add_column_timestamp_keterangan_jumlah_biaya_foto_to_tagihan_table', 10),
(20, '2021_12_07_163459_add_column_timestamps_to_sambungan', 11);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('946859fbdfa6e10718b001cdf4fd339d96c985087ccc464ad2b0962762d5bb20a3dccc360e250350', NULL, 1, 'authToken', '[]', 0, '2021-11-08 18:25:03', '2021-11-08 18:25:03', '2022-11-09 01:25:03'),
('98afb13526446bb9808ac718db88b98b12eb30d99581ad4b19cc3f715085aa8780468b6c5513bcfe', NULL, 1, 'authToken', '[]', 0, '2021-11-08 18:24:54', '2021-11-08 18:24:54', '2022-11-09 01:24:54'),
('c4b4e967213e63bd7640422448e1150ce001bb24d9e528f8c7d058805955a91f063de9fdca0f27c7', NULL, 1, 'authToken', '[]', 0, '2021-11-08 18:25:54', '2021-11-08 18:25:54', '2022-11-09 01:25:54'),
('dbadfed8d80d7102af72dd7aaa3b434c0a5c982a635389d1c132748ff9ef064a3f93d1d21a4a9075', NULL, 1, 'authToken', '[]', 0, '2021-11-08 18:31:18', '2021-11-08 18:31:18', '2022-11-09 01:31:18');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'FI4RC0KJjqVIafFly3kuGh9HtAwo5To1fZ02BLA0', NULL, 'http://localhost', 1, 0, 0, '2021-11-08 17:41:44', '2021-11-08 17:41:44'),
(2, NULL, 'Laravel Password Grant Client', 'a9Jwk5EAnFrFOCz7U3azJ4sxWD8uYtlxM58DKLXz', 'users', 'http://localhost', 0, 1, 0, '2021-11-08 17:41:45', '2021-11-08 17:41:45');

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

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-11-08 17:41:45', '2021-11-08 17:41:45');

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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway`
--

CREATE TABLE `payment_gateway` (
  `id_partnership` int(11) NOT NULL,
  `nama_partner` int(11) NOT NULL,
  `metode_pembayaran` int(11) NOT NULL,
  `akses_pembayaran` int(11) NOT NULL,
  `api` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(208, 'App\\Models\\User', 10152, 'myapptoken', '4a0b8a06f9cbdf3972c8c1ca8d66f4f78c9a6a3f0a132b8ed051f033e2b671a1', '[\"*\"]', '2021-11-15 01:32:02', '2021-11-15 01:31:31', '2021-11-15 01:32:02'),
(209, 'App\\Models\\User', 10001, 'myapptoken', 'e0556e355b60c067dc9f4a3e870fc13d2e75cc4af58a83024145302ef89b3149', '[\"*\"]', '2021-11-15 04:39:37', '2021-11-15 02:21:59', '2021-11-15 04:39:37'),
(216, 'App\\Models\\User', 10154, 'myapptoken', '5dd6f3a626a1d2a4afb0c7bbfbce0113f2d977d5a144a53f9d5dcd66c7288b4e', '[\"*\"]', '2021-11-15 12:30:19', '2021-11-15 12:21:23', '2021-11-15 12:30:19'),
(224, 'App\\Models\\User', 10156, 'myapptoken', 'a72a966a5a21f8155bfae8f0f1ea46a1b243e212e2ff56f95f17f40cc029b5db', '[\"*\"]', '2021-11-17 06:04:26', '2021-11-16 15:20:13', '2021-11-17 06:04:26'),
(225, 'App\\Models\\User', 10001, 'myapptoken', 'd1a02e0bce4a0a0b1346a7da1dd15d57bf697821a38a3082c044519df9408032', '[\"*\"]', '2021-11-16 17:19:13', '2021-11-16 17:19:11', '2021-11-16 17:19:13'),
(230, 'App\\Models\\User', 10001, 'myapptoken', '5657fef5f122d024b5bcddcda3280f0f463a7c2ca653d0b78d2ad77d1764391a', '[\"*\"]', '2021-11-17 06:04:55', '2021-11-17 05:48:01', '2021-11-17 06:04:55'),
(235, 'App\\Models\\User', 10001, 'myapptoken', '19c374e66a81989b3e2f418f16efb11ac6c67dcdce94dc3a79d6e32126717494', '[\"*\"]', '2021-11-18 00:22:18', '2021-11-18 00:22:15', '2021-11-18 00:22:18'),
(238, 'App\\Models\\User', 10001, 'myapptoken', '66b23f492f5122a845feb754c2dc6b41548db1242a2d862696d40669fa975b12', '[\"*\"]', '2021-11-18 12:09:04', '2021-11-18 12:08:58', '2021-11-18 12:09:04'),
(239, 'App\\Models\\User', 10001, 'myapptoken', 'be0d06fe51d2d13b6359536b9326dac57b0717911850ed64b4dfd6f9e330181b', '[\"*\"]', NULL, '2021-11-18 12:09:05', '2021-11-18 12:09:05'),
(247, 'App\\Models\\User', 10001, 'myapptoken', '15bb609194c811208ac007b18ff010f9b57aa7c82290e7cfa6503853c5e12902', '[\"*\"]', '2021-11-19 02:59:09', '2021-11-19 02:27:10', '2021-11-19 02:59:09'),
(260, 'App\\Models\\User', 10158, 'myapptoken', '88ed37a88fe3441f86d5144c42d038d1d24d293c72c1726c461a5f552aa938f4', '[\"*\"]', '2021-11-19 07:16:37', '2021-11-19 07:10:40', '2021-11-19 07:16:37'),
(262, 'App\\Models\\User', 10001, 'myapptoken', 'a4e3e8fd0f869bc7d83cfd7bdd723ea53615cf24c0abc5f9b993b45678e8e79c', '[\"*\"]', '2021-11-19 20:59:06', '2021-11-19 17:56:01', '2021-11-19 20:59:06'),
(263, 'App\\Models\\User', 10001, 'myapptoken', 'a5bb4189b9a269a8239662afaa89e001d200f9e02d4ec293581c448e007ff2ef', '[\"*\"]', '2021-11-19 20:23:32', '2021-11-19 20:23:15', '2021-11-19 20:23:32'),
(264, 'App\\Models\\User', 10001, 'myapptoken', '1bde6947f0bc651b5bd648577fc736cc4e6d7c6ba57dadb70704922b5b2f972d', '[\"*\"]', '2021-11-20 01:10:32', '2021-11-20 01:10:29', '2021-11-20 01:10:32'),
(265, 'App\\Models\\User', 10001, 'myapptoken', '85a98f1e3b3c06277622377be8285378e46e149c0f27a48ba03be361ecb2a38e', '[\"*\"]', '2021-11-20 01:11:39', '2021-11-20 01:10:32', '2021-11-20 01:11:39'),
(303, 'App\\Models\\User', 10062, 'myapptoken', '2ff79331852ec3d5275ea47e83dbe9755d23c6294869c293c33027de01078aa2', '[\"*\"]', '2021-11-20 08:09:22', '2021-11-20 08:08:48', '2021-11-20 08:09:22'),
(307, 'App\\Models\\User', 10001, 'myapptoken', '0b7ad33d6458112f8b6c5f87d282b8b4fcf07ec57ef79616ec5e85ad97854ee2', '[\"*\"]', '2021-11-20 14:00:23', '2021-11-20 13:53:29', '2021-11-20 14:00:23'),
(309, 'App\\Models\\User', 10001, 'myapptoken', 'dc631d2b9674eca2cacb3c7d9facf7592a72d45bfa73f7c6d2b7bbf26e0562b0', '[\"*\"]', '2021-11-20 22:58:20', '2021-11-20 22:52:28', '2021-11-20 22:58:20'),
(311, 'App\\Models\\User', 10144, 'myapptoken', 'ca7093485970fa753a31b7b8f27dc70bac4bd533bda530ae37f37c935004c005', '[\"*\"]', '2021-11-20 23:23:43', '2021-11-20 23:19:10', '2021-11-20 23:23:43'),
(315, 'App\\Models\\User', 10001, 'myapptoken', '86dd7f15bddb42f74b459412b40141069c3b483e8259fb62b457795a6d5cedd5', '[\"*\"]', '2021-11-21 01:05:40', '2021-11-21 01:05:37', '2021-11-21 01:05:40'),
(316, 'App\\Models\\User', 10001, 'myapptoken', 'c4d7f9bb3fbe99120cbf87b6555eb6338763d155bad6c6c052f591c9f3e31561', '[\"*\"]', '2021-11-21 01:06:18', '2021-11-21 01:06:14', '2021-11-21 01:06:18'),
(317, 'App\\Models\\User', 10001, 'myapptoken', '7ecd53a70daeb2616b9aaa108e8a62a97640909ecdba888a05f23ea6965e5e0a', '[\"*\"]', '2021-11-21 01:07:06', '2021-11-21 01:07:01', '2021-11-21 01:07:06'),
(318, 'App\\Models\\User', 10001, 'myapptoken', '0b4b1dc04a3bacc18797d8bd8dbbdc0229010998ec242dbd619c1ebf5501bf4d', '[\"*\"]', '2021-11-21 01:07:41', '2021-11-21 01:07:30', '2021-11-21 01:07:41'),
(319, 'App\\Models\\User', 10001, 'myapptoken', '47d278ad6b9b37f0f1b637e961e039ce2e47b629e7d2c94e1e7cbf84b3e8310c', '[\"*\"]', '2021-11-21 01:08:24', '2021-11-21 01:08:19', '2021-11-21 01:08:24'),
(320, 'App\\Models\\User', 10001, 'myapptoken', 'b4b2311997a4238ebfaa2c9028ceb4ca326438dd057d1e17ba833c58e27478ad', '[\"*\"]', '2021-11-21 01:09:05', '2021-11-21 01:08:57', '2021-11-21 01:09:05'),
(321, 'App\\Models\\User', 10062, 'myapptoken', '26dd0ae4e73de38dbf6ebefbe7caba9bb727c68ff251e096cbb71eb7f4f9555a', '[\"*\"]', '2021-11-21 01:12:13', '2021-11-21 01:09:34', '2021-11-21 01:12:13'),
(322, 'App\\Models\\User', 10001, 'myapptoken', '7f768934c7cb064f04205d7469085091d05aba85b993de3d382f6de702c9b7a8', '[\"*\"]', '2021-11-21 01:12:53', '2021-11-21 01:12:27', '2021-11-21 01:12:53'),
(323, 'App\\Models\\User', 10001, 'myapptoken', '800fec4cfab0b886d5d6741991ecdd7bdeb49e4f3a673d5f23090d5c0ecd6446', '[\"*\"]', '2021-11-21 01:15:00', '2021-11-21 01:14:28', '2021-11-21 01:15:00'),
(324, 'App\\Models\\User', 10062, 'myapptoken', 'd8367e5147151d4b3d5d69699f4d2f8cce43510e0a92b2317ff5325f4f5a2c41', '[\"*\"]', '2021-11-21 01:15:40', '2021-11-21 01:15:15', '2021-11-21 01:15:40'),
(325, 'App\\Models\\User', 10158, 'myapptoken', 'ed6c72da831d27d866716b0d1902e37d865f1f13c7e22a2545dd9905815a497f', '[\"*\"]', '2021-11-21 01:16:36', '2021-11-21 01:16:02', '2021-11-21 01:16:36'),
(326, 'App\\Models\\User', 10062, 'myapptoken', 'd644463fda0358b9f13bcae7073cf32a94b43118ab9e7cd60bcf99a1b439dc63', '[\"*\"]', '2021-11-21 01:19:51', '2021-11-21 01:18:24', '2021-11-21 01:19:51'),
(327, 'App\\Models\\User', 10001, 'myapptoken', '375be975710f4d182733b11b91af765359c7ce44aae5ff37bff1adfb829969a4', '[\"*\"]', '2021-11-21 01:58:47', '2021-11-21 01:56:07', '2021-11-21 01:58:47'),
(328, 'App\\Models\\User', 10062, 'myapptoken', '4b5b78e121ee3078dc2feadcc2967552d27fa52eecfdd5f53506ac9cf520dd84', '[\"*\"]', '2021-11-21 02:02:50', '2021-11-21 02:00:01', '2021-11-21 02:02:50'),
(329, 'App\\Models\\User', 10177, 'myapptoken', 'ca4e6f940f33c7f644c0206572babe4b505fb5393df5d1a71f5667eea588644d', '[\"*\"]', '2021-11-21 02:11:56', '2021-11-21 02:04:55', '2021-11-21 02:11:56'),
(330, 'App\\Models\\User', 10001, 'myapptoken', '247c88e33c622d0e4fa9af69a49fbe232b368b416d07d8ef9c07c54f06c7e1a1', '[\"*\"]', '2021-11-21 02:12:31', '2021-11-21 02:12:11', '2021-11-21 02:12:31'),
(331, 'App\\Models\\User', 10001, 'myapptoken', '5c8426b928bb477a63dcbe0d65b0c97b9adb80bdd6192ca45949154025594919', '[\"*\"]', '2021-11-21 23:32:45', '2021-11-21 23:27:17', '2021-11-21 23:32:45'),
(332, 'App\\Models\\User', 10062, 'myapptoken', '7a640a013f7a6514c3d30ccbec8dc3618e570482215531608b721c3951b63539', '[\"*\"]', '2021-11-21 23:35:05', '2021-11-21 23:32:59', '2021-11-21 23:35:05'),
(333, 'App\\Models\\User', 10001, 'myapptoken', 'acf8d7c490bda813cbc069fd7cfd0e1f216b6fd8b8ace4d2a14032152c714a6e', '[\"*\"]', '2021-11-22 01:58:30', '2021-11-22 01:56:18', '2021-11-22 01:58:30'),
(334, 'App\\Models\\User', 10062, 'myapptoken', 'a7fb2465cabea3c51a15a5faee0c9935be0855245979ef58ce2107ce3308adc3', '[\"*\"]', '2021-11-22 01:59:43', '2021-11-22 01:58:45', '2021-11-22 01:59:43'),
(335, 'App\\Models\\User', 10144, 'myapptoken', '68355a43d692416d75316eab7b0ef355780073f4c70bb95d12853da1ae63b040', '[\"*\"]', '2021-11-22 02:01:29', '2021-11-22 02:00:17', '2021-11-22 02:01:29'),
(336, 'App\\Models\\User', 10001, 'myapptoken', '638e61caa56f5c1513ff0dea8ec21fcfe30e8b3cd4d47d659c9b600eed395a6c', '[\"*\"]', '2021-11-22 03:49:34', '2021-11-22 03:49:04', '2021-11-22 03:49:34'),
(337, 'App\\Models\\User', 10062, 'myapptoken', '3a610b17d71ebe92ae98b08d6a5e64d4695cd0a294b71d1339f5c99eb1c13ff0', '[\"*\"]', '2021-11-22 13:50:53', '2021-11-22 13:50:26', '2021-11-22 13:50:53'),
(338, 'App\\Models\\User', 10001, 'myapptoken', '0dd2078733f8e3b7ba69f1840ac66f4606ae8e12193968bc312bbcf91d304e5a', '[\"*\"]', '2021-11-22 17:23:24', '2021-11-22 13:56:02', '2021-11-22 17:23:24'),
(339, 'App\\Models\\User', 10062, 'myapptoken', 'a871c42a506e6803dada6e41832b92cc793c91142d03c8695fabea08d27d74b8', '[\"*\"]', '2021-11-22 17:23:54', '2021-11-22 17:23:39', '2021-11-22 17:23:54'),
(340, 'App\\Models\\User', 10001, 'myapptoken', '3d1ac5d88879499db6d6094a2ba00078597022c4c11911132fcd0d54d204a2ad', '[\"*\"]', '2021-11-22 17:27:30', '2021-11-22 17:24:07', '2021-11-22 17:27:30'),
(341, 'App\\Models\\User', 10001, 'myapptoken', '5a3c3b973d4d286d3146fda73170f6a9465d63a46712e681d40cdcef3fa87bc3', '[\"*\"]', '2021-11-22 17:36:54', '2021-11-22 17:29:21', '2021-11-22 17:36:54'),
(342, 'App\\Models\\User', 10001, 'myapptoken', '1717526931c2f54e3862863493f3c538b7dcf32ec4f41264f00c1ec046c8da57', '[\"*\"]', '2021-11-22 19:08:35', '2021-11-22 17:53:11', '2021-11-22 19:08:35'),
(343, 'App\\Models\\User', 10001, 'myapptoken', 'ee5dc7cbb3903a730cfb8765e8fe029aa0e083d53636c3a5c45476ba3c10de45', '[\"*\"]', '2021-11-22 23:22:03', '2021-11-22 23:11:20', '2021-11-22 23:22:03'),
(344, 'App\\Models\\User', 10001, 'myapptoken', '202ea6c8fa08cb15a71b0ef1a8e43830168aa15e3a453b9530e2d9fbaa483286', '[\"*\"]', '2021-11-22 23:33:43', '2021-11-22 23:31:59', '2021-11-22 23:33:43'),
(345, 'App\\Models\\User', 10001, 'myapptoken', 'fd1fafb7f2b835aa2e354c1748f7e1294c7c335c3f1067b41c1509cdcfc0fe0e', '[\"*\"]', '2021-11-23 02:35:56', '2021-11-23 01:14:12', '2021-11-23 02:35:56'),
(346, 'App\\Models\\User', 10001, 'myapptoken', '57bb7ddeb1ad666ea2ea1fa5401a4d97dd0c18fe9560e8fe57676af5c23590bc', '[\"*\"]', '2021-11-23 18:00:11', '2021-11-23 17:51:58', '2021-11-23 18:00:11'),
(347, 'App\\Models\\User', 10001, 'myapptoken', 'c898a13644e1efc0ab54497aad2f96cbe8c21b5788e5c706fd2dbd786c468e0c', '[\"*\"]', '2021-11-23 23:57:27', '2021-11-23 23:50:57', '2021-11-23 23:57:27'),
(348, 'App\\Models\\User', 10001, 'myapptoken', '30fe53ab726e76db4cd43a4bcbc1fb7ba51745ffad1728c84d8787908f9b44d4', '[\"*\"]', '2021-11-24 02:46:52', '2021-11-24 01:43:58', '2021-11-24 02:46:52'),
(349, 'App\\Models\\User', 10001, 'myapptoken', 'fa5a7fa3591c677e54d9bfa04e4137c14018b95dcf8328570da74814cf482fd0', '[\"*\"]', '2021-11-24 07:42:53', '2021-11-24 02:37:32', '2021-11-24 07:42:53'),
(350, 'App\\Models\\User', 10001, 'myapptoken', '1a6518097d7d5cb4853b4bfd70775f4194666c23aaad9afdb3e25de5b122083e', '[\"*\"]', '2021-11-24 10:08:26', '2021-11-24 03:05:23', '2021-11-24 10:08:26'),
(351, 'App\\Models\\User', 10001, 'myapptoken', '2aacea579c8736bfc1fadbd7f4c8b4a6a57ecaf5014e1e342f3de690889bf76f', '[\"*\"]', '2021-11-24 10:35:46', '2021-11-24 10:02:20', '2021-11-24 10:35:46'),
(352, 'App\\Models\\User', 10062, 'myapptoken', '069d78cc4d220628027fe703791797e36825c2a01f732c3fda63e74e67131e61', '[\"*\"]', '2021-11-24 10:38:58', '2021-11-24 10:36:35', '2021-11-24 10:38:58'),
(353, 'App\\Models\\User', 10001, 'myapptoken', '713fc116b6657f3a8657be0a64e790ea30ac29883f83031fc197b5a8c71a8e8f', '[\"*\"]', '2021-11-24 10:53:55', '2021-11-24 10:39:12', '2021-11-24 10:53:55'),
(354, 'App\\Models\\User', 10001, 'myapptoken', '55fe7837396d8c1bfcfa6dcc5980f62240ed502dc902e9846389aa3fd5bd4eb0', '[\"*\"]', '2021-11-24 10:54:40', '2021-11-24 10:54:11', '2021-11-24 10:54:40'),
(355, 'App\\Models\\User', 10001, 'myapptoken', 'bdcdd16fb8788dfebad934c4039bf95c627b9093824d10753fb2e38e8d262e0f', '[\"*\"]', '2021-11-24 10:58:48', '2021-11-24 10:55:04', '2021-11-24 10:58:48'),
(356, 'App\\Models\\User', 10001, 'myapptoken', 'beb367a01cadc955664cc002b90b11a35931c5cde0b28e404ed3f61d66d23bd6', '[\"*\"]', '2021-11-24 12:02:24', '2021-11-24 11:59:55', '2021-11-24 12:02:24'),
(357, 'App\\Models\\User', 10001, 'myapptoken', 'd523c4261ef39a07c6b95ee9667fcd7e4e669a32f7c5cad5311f7dd301b4b625', '[\"*\"]', '2021-11-25 00:59:59', '2021-11-24 21:22:52', '2021-11-25 00:59:59'),
(358, 'App\\Models\\User', 10001, 'myapptoken', 'e176df02c9a8acac945fef61ca83f0d476740c10962144af8d454ee02626769c', '[\"*\"]', '2021-11-25 01:27:04', '2021-11-25 01:19:39', '2021-11-25 01:27:04'),
(359, 'App\\Models\\User', 10062, 'myapptoken', '496453881f0fcc12375e224bfc21ec3bbb9e10ae86463db325fdd063d161f06f', '[\"*\"]', '2021-11-25 01:29:17', '2021-11-25 01:27:52', '2021-11-25 01:29:17'),
(360, 'App\\Models\\User', 10062, 'myapptoken', '55229a9c658aaae76f01680d4221f8af28bf9c0499ec2fca2a1cfca3e09ee0a2', '[\"*\"]', '2021-11-25 01:34:13', '2021-11-25 01:29:49', '2021-11-25 01:34:13'),
(361, 'App\\Models\\User', 10001, 'myapptoken', 'dd863523ee2c391b5e244c8ce20506ff0363e25a9cfc3a1b17dd7c68eaee8976', '[\"*\"]', '2021-11-26 21:15:40', '2021-11-26 21:04:00', '2021-11-26 21:15:40'),
(362, 'App\\Models\\User', 10001, 'myapptoken', '974974f5fdb00ee7ec1545d4a64da103c0df1f9274805cb3e67a25332bae9294', '[\"*\"]', '2021-11-26 21:50:24', '2021-11-26 21:23:40', '2021-11-26 21:50:24'),
(363, 'App\\Models\\User', 10001, 'myapptoken', 'e01790e32d8e3260089940de4353ebe8331a95030c6b2e37629c5e41b25872ba', '[\"*\"]', '2021-11-27 23:17:07', '2021-11-27 22:20:06', '2021-11-27 23:17:07'),
(364, 'App\\Models\\User', 10001, 'myapptoken', '3ab5ab4b044490dc0e583e774b0fd7e92ba6f4652a497340167b78d1d1e14ffb', '[\"*\"]', '2021-11-28 04:57:48', '2021-11-28 04:57:35', '2021-11-28 04:57:48'),
(365, 'App\\Models\\User', 10001, 'myapptoken', 'ddb27d3174cf4b2815efe3292c262c8caecee8c22d86ab58a25741a853c65fe1', '[\"*\"]', '2021-11-28 04:58:11', '2021-11-28 04:57:50', '2021-11-28 04:58:11'),
(366, 'App\\Models\\User', 10178, 'myapptoken', 'ddf6701f6969ac5aebb949e2020092e0007ff1be187ed3e8e5f897c008b31772', '[\"*\"]', '2021-11-28 05:09:01', '2021-11-28 05:08:58', '2021-11-28 05:09:01'),
(367, 'App\\Models\\User', 10181, 'myapptoken', 'b33b42a79817b9b499b3b29a6922f456ed895ae2f8bf8dc6211d1caabe1e46b0', '[\"*\"]', '2021-11-28 05:21:23', '2021-11-28 05:21:21', '2021-11-28 05:21:23'),
(368, 'App\\Models\\User', 10001, 'myapptoken', '34a40baad3e7bb90b0964f8aac24008efbcfa98d350eb3e153b659557bbbe28f', '[\"*\"]', '2021-11-28 05:48:49', '2021-11-28 05:21:31', '2021-11-28 05:48:49'),
(369, 'App\\Models\\User', 10001, 'myapptoken', 'f783646a04aa197708ee26009b82e8cc9e625d420bd322fb1e2669a7194f42c5', '[\"*\"]', '2021-11-28 06:02:30', '2021-11-28 05:50:48', '2021-11-28 06:02:30'),
(370, 'App\\Models\\User', 10001, 'myapptoken', '12c89f5d4dec78356b516cdd5822f5c9928613202e02492c07cea67912e9d519', '[\"*\"]', '2021-11-29 04:21:21', '2021-11-28 21:42:18', '2021-11-29 04:21:21'),
(371, 'App\\Models\\User', 10001, 'myapptoken', '17b7cc52783aa80a37d9daf6fcf88e74d22c80f9f32e30cebe800903f14c1fdf', '[\"*\"]', '2021-11-29 00:46:59', '2021-11-29 00:24:40', '2021-11-29 00:46:59'),
(372, 'App\\Models\\User', 10001, 'myapptoken', '03847dd893f4bf7793defb8bdc42e1744e15d82033bbcaf4d3574696a666acdd', '[\"*\"]', '2021-11-29 02:18:39', '2021-11-29 01:59:37', '2021-11-29 02:18:39'),
(373, 'App\\Models\\User', 10001, 'myapptoken', '7e8215ba39184c14db4671fcdc27d21f76d19b39ce508bfc0d5bfd1f2b5dfe89', '[\"*\"]', '2021-11-29 02:29:07', '2021-11-29 02:26:11', '2021-11-29 02:29:07'),
(374, 'App\\Models\\User', 10001, 'myapptoken', '180dcee9cfd3b0a483430b4b5887d5ec93b9f18bd8554a0eea4585b06f34c6c8', '[\"*\"]', '2021-11-29 07:55:43', '2021-11-29 07:55:01', '2021-11-29 07:55:43'),
(375, 'App\\Models\\User', 10001, 'myapptoken', '11aec6aa12baf24c56f638aaa97eeb6351af40a93831950bcee5958491e2a9c6', '[\"*\"]', '2021-11-29 23:10:31', '2021-11-29 23:02:13', '2021-11-29 23:10:31'),
(376, 'App\\Models\\User', 10001, 'myapptoken', '68ddcf8d911108637e5ebb25be8e431256defdc8194b89c96a12f0ac7f346125', '[\"*\"]', '2021-11-30 04:40:03', '2021-11-29 23:19:57', '2021-11-30 04:40:03'),
(377, 'App\\Models\\User', 10001, 'myapptoken', 'f0108a4222a25c7d8c59b73adfa3144065f771dd1c1ce862f942147b7aae29c7', '[\"*\"]', '2021-12-01 10:48:19', '2021-12-01 10:46:21', '2021-12-01 10:48:19'),
(378, 'App\\Models\\User', 10001, 'myapptoken', 'bfbfb2988f7828f160e3fae8c70e2f12bb819cb7a888196821569c4db3df42d7', '[\"*\"]', '2021-12-01 12:52:35', '2021-12-01 12:41:18', '2021-12-01 12:52:35'),
(379, 'App\\Models\\User', 10001, 'myapptoken', 'c06311bea1b7cc9976c3ea78fe2c28dbe58972f4b9aace78ace20cdb7a348770', '[\"*\"]', '2021-12-02 23:20:36', '2021-12-01 21:53:39', '2021-12-02 23:20:36'),
(380, 'App\\Models\\User', 10001, 'myapptoken', '765fa228a4a3f70ee66f276b8aee25dc72b32f2e1b26419c131a65d4698708ad', '[\"*\"]', '2021-12-02 04:16:22', '2021-12-02 02:33:26', '2021-12-02 04:16:22'),
(381, 'App\\Models\\User', 10062, 'myapptoken', '90cb84a0128c9b191d0eaf72858dec412502f645a2b8c0e4c87ae58b2f75510a', '[\"*\"]', '2021-12-02 04:25:36', '2021-12-02 04:23:41', '2021-12-02 04:25:36'),
(382, 'App\\Models\\User', 10062, 'myapptoken', '66e0aa4f1d9a46808fe4e8b261ffc595025e201926c660cf0d98013cb2ea1bb6', '[\"*\"]', '2021-12-02 05:02:49', '2021-12-02 04:59:01', '2021-12-02 05:02:49'),
(383, 'App\\Models\\User', 10001, 'myapptoken', '5c5110e8aff8c5e5493f956eb1ac6f1d62a178eb518538c308cdd1cd29c5752c', '[\"*\"]', '2021-12-02 05:06:49', '2021-12-02 05:03:26', '2021-12-02 05:06:49'),
(384, 'App\\Models\\User', 10062, 'myapptoken', '8f02437bfb027919607e268bc8cee2699f6a2e4bcf8fdfe67df14166735ac9a1', '[\"*\"]', '2021-12-02 05:07:52', '2021-12-02 05:07:12', '2021-12-02 05:07:52'),
(385, 'App\\Models\\User', 10001, 'myapptoken', '81e16746888dea33e30aee51a6745384c50322735b99cfb5d1ed8242d136b73b', '[\"*\"]', '2021-12-02 05:25:20', '2021-12-02 05:24:33', '2021-12-02 05:25:20'),
(386, 'App\\Models\\User', 10062, 'myapptoken', '2244a5c4b2114666e8d9d87c45476e3817d024d4311b8e81a846286bc14d2730', '[\"*\"]', '2021-12-02 05:35:07', '2021-12-02 05:25:34', '2021-12-02 05:35:07'),
(387, 'App\\Models\\User', 10001, 'myapptoken', '2214a2530c2a81d48c3cf46bbdc8c3f4d2919dab6a460ec2388a8db95868f28b', '[\"*\"]', '2021-12-02 05:37:03', '2021-12-02 05:35:43', '2021-12-02 05:37:03'),
(388, 'App\\Models\\User', 10062, 'myapptoken', '9a6d9ff4e0f005bb730089aa3c79a2d5e60fb12d73013d7a9a61c0558c8b56ab', '[\"*\"]', '2021-12-02 12:26:53', '2021-12-02 05:37:16', '2021-12-02 12:26:53'),
(389, 'App\\Models\\User', 10062, 'myapptoken', '11f0426a560e663d1d68888a1496e748049ae2555f221b95ad22f2f3b5c31e13', '[\"*\"]', '2021-12-02 05:59:35', '2021-12-02 05:53:43', '2021-12-02 05:59:35'),
(390, 'App\\Models\\User', 10062, 'myapptoken', 'afe5b75a08de3b5fd4d93c8c7f87714efe8e2e4997c369b78c1f612b74bd2e1f', '[\"*\"]', '2021-12-02 06:47:40', '2021-12-02 05:59:57', '2021-12-02 06:47:40'),
(391, 'App\\Models\\User', 10001, 'myapptoken', 'c7a297bc182c5603596bc1c2f659dbfa7c8a7d506d4447e07d77a18c4bb2be51', '[\"*\"]', '2021-12-02 07:38:52', '2021-12-02 06:48:12', '2021-12-02 07:38:52'),
(392, 'App\\Models\\User', 10062, 'myapptoken', 'afd7fed1da8c984469d29070cfdf4fa4b95a0a8528efb92c2243a992503907e0', '[\"*\"]', '2021-12-02 07:41:58', '2021-12-02 07:39:10', '2021-12-02 07:41:58'),
(393, 'App\\Models\\User', 10001, 'myapptoken', 'da0e3d4b16d3c9fc1b0e525aca02925bb5405eff75289574192c1cdb1113e125', '[\"*\"]', '2021-12-02 07:42:18', '2021-12-02 07:42:16', '2021-12-02 07:42:18'),
(394, 'App\\Models\\User', 10062, 'myapptoken', '56396ecffdd9f22e0bd1deb47fe431cef7a30ef0b7a245927238a06d6023e27f', '[\"*\"]', '2021-12-02 07:49:51', '2021-12-02 07:42:30', '2021-12-02 07:49:51'),
(395, 'App\\Models\\User', 10001, 'myapptoken', '41456f82f1801d3d0b3c8549ed7aeaf1db7a169a2e0497829482fafa4cf1a4e2', '[\"*\"]', '2021-12-02 07:52:05', '2021-12-02 07:50:05', '2021-12-02 07:52:05'),
(396, 'App\\Models\\User', 10001, 'myapptoken', 'f2fd4a8eaf95a7ddc437d9f510990ca0b7421d2efec4256babf6649ef218602b', '[\"*\"]', '2021-12-02 08:05:25', '2021-12-02 07:54:25', '2021-12-02 08:05:25'),
(397, 'App\\Models\\User', 10062, 'myapptoken', '72e94e2112a510a364cb3bad5cb2bedaa6821b965e5d67331e62a6044107b61d', '[\"*\"]', '2021-12-02 08:13:01', '2021-12-02 08:05:33', '2021-12-02 08:13:01'),
(398, 'App\\Models\\User', 10001, 'myapptoken', '99e19999b8ce7e1532a4871a447512cb395ccb69d9fae6416b89441be66e7e06', '[\"*\"]', '2021-12-02 08:13:22', '2021-12-02 08:13:20', '2021-12-02 08:13:22'),
(399, 'App\\Models\\User', 10001, 'myapptoken', 'cd0c3c1fb5b71b283c0ef22701841fdb9c2c656d7cfb795e1ee40716af7c7614', '[\"*\"]', '2021-12-02 08:26:42', '2021-12-02 08:22:05', '2021-12-02 08:26:42'),
(400, 'App\\Models\\User', 10001, 'myapptoken', '42d6d17c8da2045441ae624a8b1c6a95a13e94164316d6fbe057213ae25ac916', '[\"*\"]', '2021-12-02 08:27:43', '2021-12-02 08:27:38', '2021-12-02 08:27:43'),
(401, 'App\\Models\\User', 10001, 'myapptoken', 'fd2c8cc7833e57968567dcaa62a285140ee6d558c023a75a448ca7a69afef468', '[\"*\"]', '2021-12-02 08:28:06', '2021-12-02 08:27:40', '2021-12-02 08:28:06'),
(402, 'App\\Models\\User', 10062, 'myapptoken', '89c65ea0bfd4c7e29e5827f4dbfc60d7540fdfe5be902ffd45b8688f1e835c07', '[\"*\"]', '2021-12-02 08:28:45', '2021-12-02 08:28:27', '2021-12-02 08:28:45'),
(403, 'App\\Models\\User', 10158, 'myapptoken', '593a83f6e1282e2c2ecaffad53cb19bcbdfaa99a730093e30dffdbdb490351e3', '[\"*\"]', '2021-12-02 12:30:32', '2021-12-02 12:27:15', '2021-12-02 12:30:32'),
(404, 'App\\Models\\User', 10001, 'myapptoken', '9db3900610cab40738b4d98d3a2fb2e1dda45c25202177d4d33055924e7c5707', '[\"*\"]', '2021-12-02 12:33:42', '2021-12-02 12:31:57', '2021-12-02 12:33:42'),
(405, 'App\\Models\\User', 10001, 'myapptoken', '3530fe5e18c1f29b57046c5e868b605c73c93005b5e6a10b3ed94ce81f74c71b', '[\"*\"]', '2021-12-02 23:12:24', '2021-12-02 22:52:21', '2021-12-02 23:12:24'),
(406, 'App\\Models\\User', 10001, 'myapptoken', '43e54fc4281e8a8f095fbeb4bd7e03a32099ed7ef3e9d6ed72b7a48a99a920e6', '[\"*\"]', '2021-12-03 03:18:47', '2021-12-02 23:21:23', '2021-12-03 03:18:47'),
(407, 'App\\Models\\User', 10001, 'myapptoken', '480c68c5dcec6bf3ebef14174f6ae99a021df6d080397cdff719df27e717d80f', '[\"*\"]', '2021-12-03 13:04:20', '2021-12-03 02:27:05', '2021-12-03 13:04:20'),
(408, 'App\\Models\\User', 10062, 'myapptoken', 'b76c61840af03b9100d54d36269ae4c3ce74cdb761fce45c41a2b00dfa9bd643', '[\"*\"]', '2021-12-03 02:44:24', '2021-12-03 02:34:53', '2021-12-03 02:44:24'),
(409, 'App\\Models\\User', 10001, 'myapptoken', 'ff85e72d6f5f8c5223e6d61006db19c234c5b6a2213a336aee18258511f08b2f', '[\"*\"]', '2021-12-03 18:43:39', '2021-12-03 10:32:56', '2021-12-03 18:43:39'),
(410, 'App\\Models\\User', 10140, 'myapptoken', 'bf019e3ec87f5e5776af31589839513950279a6cc942ebec4df493cc2f17dad2', '[\"*\"]', '2021-12-03 15:52:38', '2021-12-03 15:47:30', '2021-12-03 15:52:38'),
(411, 'App\\Models\\User', 10001, 'myapptoken', '38a73e245b307906c3072a696971925c780bedd98a7e2b42252d3c03949696ce', '[\"*\"]', '2021-12-03 18:27:57', '2021-12-03 18:24:41', '2021-12-03 18:27:57'),
(412, 'App\\Models\\User', 10062, 'myapptoken', '296f0cbdcc98e215f9e3c8552288285823c9f49e5bed634dd40a844d238eaf7c', '[\"*\"]', '2021-12-03 18:33:04', '2021-12-03 18:28:32', '2021-12-03 18:33:04'),
(413, 'App\\Models\\User', 10001, 'myapptoken', '2de85669cd0b21602f2b9b9c6ea1953f2f06703fe85dab73507da67197bbfcef', '[\"*\"]', '2021-12-04 11:26:22', '2021-12-03 23:33:03', '2021-12-04 11:26:22'),
(414, 'App\\Models\\User', 10001, 'myapptoken', 'f05b7fdd96ec815f5fcba19e719c205470f93466102991653757097f744d8bce', '[\"*\"]', '2021-12-04 03:14:21', '2021-12-04 02:35:21', '2021-12-04 03:14:21'),
(415, 'App\\Models\\User', 10001, 'myapptoken', 'f3d5e71de3b603ed0d62581c122aae0a34f23fbaab6b8406e4ff5f8b65156261', '[\"*\"]', '2021-12-04 11:14:06', '2021-12-04 11:09:16', '2021-12-04 11:14:06'),
(416, 'App\\Models\\User', 10158, 'myapptoken', '45036fdcfe959ab3b02490488d1f0ad88a2e96e28241146e5c845f7a04055aea', '[\"*\"]', '2021-12-04 11:17:35', '2021-12-04 11:14:35', '2021-12-04 11:17:35'),
(417, 'App\\Models\\User', 10062, 'myapptoken', '78087e6aa68cf90a52072c4cc8cffcacb012a49bf6b9809590b3ee1c0c92e4d7', '[\"*\"]', '2021-12-04 11:20:46', '2021-12-04 11:17:53', '2021-12-04 11:20:46'),
(418, 'App\\Models\\User', 10001, 'myapptoken', '361a2041c29d2422199c5b5added322e87dfc8ff0312365987137f4211f08970', '[\"*\"]', '2021-12-04 14:38:16', '2021-12-04 11:21:04', '2021-12-04 14:38:16'),
(419, 'App\\Models\\User', 10001, 'myapptoken', '6194fb48cce3f628d7ec062eef5711fd85ef35bc2349e493721fd611dc79e7c3', '[\"*\"]', '2021-12-04 11:31:02', '2021-12-04 11:28:07', '2021-12-04 11:31:02'),
(420, 'App\\Models\\User', 10001, 'myapptoken', '5cfebb5fa3883f3fdcfc724764cac41b759a9233a03c95ce794a354f53d05731', '[\"*\"]', '2021-12-04 14:35:04', '2021-12-04 11:31:20', '2021-12-04 14:35:04'),
(421, 'App\\Models\\User', 10001, 'myapptoken', 'f5e1b864d35f806d7544f5044d4630065ae1b3bd76b08f2766564049a3329ebc', '[\"*\"]', '2021-12-04 12:29:54', '2021-12-04 12:28:29', '2021-12-04 12:29:54'),
(422, 'App\\Models\\User', 10062, 'myapptoken', '0ca2aa9a6039daaa005b140053a16d1802a8c34a891907b2a80dbbfc146c34dd', '[\"*\"]', '2021-12-04 14:41:22', '2021-12-04 14:38:58', '2021-12-04 14:41:22'),
(423, 'App\\Models\\User', 10001, 'myapptoken', 'c88c1ff1fd363b7845de9d62d9efd4d1b9b95881e8daa5b0850640fb771c682c', '[\"*\"]', '2021-12-04 14:45:24', '2021-12-04 14:41:48', '2021-12-04 14:45:24'),
(424, 'App\\Models\\User', 10001, 'myapptoken', '7f9948128dd6902f453246fcf7c80c0e29fbd3fdb9d3530d2569bae55a629135', '[\"*\"]', '2021-12-07 07:27:23', '2021-12-07 07:18:37', '2021-12-07 07:27:23'),
(425, 'App\\Models\\User', 10001, 'myapptoken', 'e468336844cc477ae8246f34194510c68fda3b77775cf0c27b50b50936ee4361', '[\"*\"]', '2021-12-07 07:44:17', '2021-12-07 07:37:54', '2021-12-07 07:44:17'),
(426, 'App\\Models\\User', 10062, 'myapptoken', 'c1461cf990656f9ca213b9512630e68dc41ac1f1409495b5e427459c7af1fad4', '[\"*\"]', '2021-12-07 07:47:20', '2021-12-07 07:44:32', '2021-12-07 07:47:20'),
(427, 'App\\Models\\User', 10144, 'myapptoken', 'af2b36f8e8f9022e617290a5dd199dd92d0fee00b086a8f599765d125248a36e', '[\"*\"]', '2021-12-07 07:50:34', '2021-12-07 07:48:00', '2021-12-07 07:50:34'),
(428, 'App\\Models\\User', 10182, 'myapptoken', '9e17923317986b5fc2c64961e72049bcebbadc3d213edb95fa42ad72b0f36da0', '[\"*\"]', '2021-12-07 20:32:27', '2021-12-07 10:53:01', '2021-12-07 20:32:27'),
(429, 'App\\Models\\User', 10001, 'myapptoken', 'db104a9c2d63be901433898167f22a19ea13107b329a942cec59420f77fc29d3', '[\"*\"]', '2021-12-08 02:39:00', '2021-12-07 20:33:02', '2021-12-08 02:39:00'),
(430, 'App\\Models\\User', 10182, 'myapptoken', '678062dedbff65b69456cf845e455ede91094b3dd6ceb9c86372e4f083bd99c5', '[\"*\"]', '2021-12-07 22:04:04', '2021-12-07 21:59:51', '2021-12-07 22:04:04'),
(431, 'App\\Models\\User', 10001, 'myapptoken', 'cc28c0fe91b2f3252a1a82959675270af9a12898d51cda1989928ec79ca5ad20', '[\"*\"]', '2021-12-07 22:06:58', '2021-12-07 22:04:46', '2021-12-07 22:06:58'),
(432, 'App\\Models\\User', 10001, 'myapptoken', 'f73f94d9ab36da96915a967dbbb8a69580e67c233d9f48afc0a4243a4e03d623', '[\"*\"]', '2021-12-08 03:23:13', '2021-12-08 02:52:41', '2021-12-08 03:23:13'),
(433, 'App\\Models\\User', 10182, 'myapptoken', 'a721fcb47a7c6d3d4bf28c1a20d84a17bc1bf164b532c622cd989d61278a159d', '[\"*\"]', '2021-12-08 03:27:48', '2021-12-08 03:23:51', '2021-12-08 03:27:48'),
(434, 'App\\Models\\User', 10062, 'myapptoken', '72a19610ba2196e2d1085248a1c4488b55f8419d85e67a0414b7a9b5fa15617e', '[\"*\"]', '2021-12-08 03:32:46', '2021-12-08 03:28:11', '2021-12-08 03:32:46'),
(435, 'App\\Models\\User', 10182, 'myapptoken', '99c16341d20420c272b0e7e282ed90ee7591804818bb51c319b7879b6e19c3d9', '[\"*\"]', '2021-12-08 03:33:58', '2021-12-08 03:33:19', '2021-12-08 03:33:58'),
(436, 'App\\Models\\User', 10183, 'myapptoken', 'e5d9ac35f29d942a6457cd59b85f14616e389d452da9d81e5f964089e177c1ff', '[\"*\"]', '2021-12-08 03:36:54', '2021-12-08 03:35:22', '2021-12-08 03:36:54'),
(437, 'App\\Models\\User', 10183, 'myapptoken', '3489b9198a9199546e2290f0bae9d74bda315874f3519ef2546b61bc7a4fcb84', '[\"*\"]', '2021-12-08 03:37:07', '2021-12-08 03:37:06', '2021-12-08 03:37:07'),
(438, 'App\\Models\\User', 10001, 'myapptoken', '48c1f43f04619d952aa1043f337cb654f41c1a110ffa3eb334662c5debe6a70f', '[\"*\"]', '2021-12-08 03:38:40', '2021-12-08 03:37:26', '2021-12-08 03:38:40'),
(439, 'App\\Models\\User', 10183, 'myapptoken', '3c538f12b218529a7f1a27f7c5fd06b86f83e331e0289d8e71f7c82a02a3a011', '[\"*\"]', '2021-12-08 03:39:07', '2021-12-08 03:39:01', '2021-12-08 03:39:07'),
(440, 'App\\Models\\User', 10184, 'myapptoken', 'fc9e19ff1c2ad1a01d9ca7baa8dd8e7465b60638c23855b874ae314e8e50e15a', '[\"*\"]', '2021-12-08 03:43:10', '2021-12-08 03:41:19', '2021-12-08 03:43:10'),
(441, 'App\\Models\\User', 10184, 'myapptoken', 'ee203fa0a3d0e079d5c70f9998e26fabc4f7c099f1a22a98ab062389d821e850', '[\"*\"]', '2021-12-08 03:51:13', '2021-12-08 03:43:23', '2021-12-08 03:51:13'),
(442, 'App\\Models\\User', 10001, 'myapptoken', '28cacb3ee62bd1ba43110f37130a7bc206d3b4759d1c314520c0851cb615b336', '[\"*\"]', '2021-12-08 04:23:32', '2021-12-08 03:58:26', '2021-12-08 04:23:32'),
(443, 'App\\Models\\User', 10186, 'myapptoken', '21a8911e7f7c5b50adae17e1b478e4c06feb49844f843a00d05b09d9c4c2a9ec', '[\"*\"]', '2021-12-08 07:58:12', '2021-12-08 07:54:54', '2021-12-08 07:58:12'),
(444, 'App\\Models\\User', 10184, 'myapptoken', 'bf86bd88930dbfe975ad894423ec802f4aa14a612910aab0980a32a5bf505a4c', '[\"*\"]', '2021-12-08 08:03:14', '2021-12-08 08:00:31', '2021-12-08 08:03:14'),
(445, 'App\\Models\\User', 10186, 'myapptoken', 'a4a769e3011bc956d1e294b2178254c50fd6da3b70c6c50ceed4772d1ecf8253', '[\"*\"]', '2021-12-08 08:04:44', '2021-12-08 08:03:39', '2021-12-08 08:04:44'),
(446, 'App\\Models\\User', 10001, 'myapptoken', 'c26653202d7f9e0fc56c3e25daa8a16afbf311d33eb4f09bf8577dc1a6e7d31a', '[\"*\"]', '2021-12-08 08:08:17', '2021-12-08 08:05:17', '2021-12-08 08:08:17'),
(447, 'App\\Models\\User', 10187, 'myapptoken', '7e6446f596bbb5fa08031743ef3a76f9d783910b25df6207d8bc802e5295ac9f', '[\"*\"]', '2021-12-08 20:33:56', '2021-12-08 20:30:56', '2021-12-08 20:33:56'),
(448, 'App\\Models\\User', 10184, 'myapptoken', '6c64ecaef5ff53bbbcc88030049fc71b08f5fb986278da5a5258583e01062d36', '[\"*\"]', '2021-12-08 20:35:46', '2021-12-08 20:34:09', '2021-12-08 20:35:46'),
(449, 'App\\Models\\User', 10001, 'myapptoken', 'efc079dcd584b99394676639076bedc0656fc7f70f39d27a130ad279ac973b04', '[\"*\"]', '2021-12-08 20:37:20', '2021-12-08 20:35:59', '2021-12-08 20:37:20'),
(450, 'App\\Models\\User', 10001, 'myapptoken', '193e41ad77cefeb4c663824e31f72ab753f3cdd9c027bebfaec9638e273dabf4', '[\"*\"]', '2021-12-13 23:41:00', '2021-12-13 23:25:58', '2021-12-13 23:41:00'),
(451, 'App\\Models\\User', 10184, 'myapptoken', 'c741a8b2fa0caba39108d160c2f204f5014548ea0f938966279b8a46bf98076b', '[\"*\"]', '2021-12-13 23:53:01', '2021-12-13 23:41:24', '2021-12-13 23:53:01'),
(452, 'App\\Models\\User', 10188, 'myapptoken', '52536624dd25852ce7c6f05c780ba0c5365192f9e87b0f68dfd163801649f97e', '[\"*\"]', '2021-12-13 23:54:36', '2021-12-13 23:54:15', '2021-12-13 23:54:36'),
(453, 'App\\Models\\User', 10184, 'myapptoken', '8240548ecd84ad605f59e8dc8107f6fd7efc87f40218ba11f0454eeabcd0d9cb', '[\"*\"]', '2021-12-14 00:06:58', '2021-12-14 00:00:26', '2021-12-14 00:06:58');

-- --------------------------------------------------------

--
-- Table structure for table `pusat_pdam`
--

CREATE TABLE `pusat_pdam` (
  `id_pusat` int(11) NOT NULL,
  `nama_pusat` varchar(255) NOT NULL,
  `kota_pusat` varchar(255) NOT NULL,
  `alamat_pusat` varchar(255) NOT NULL,
  `telepon_pusat` bigint(100) NOT NULL,
  `email_pusat` varchar(255) NOT NULL,
  `facebook_pusat` varchar(255) NOT NULL,
  `website_pusat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pusat_pdam`
--

INSERT INTO `pusat_pdam` (`id_pusat`, `nama_pusat`, `kota_pusat`, `alamat_pusat`, `telepon_pusat`, `email_pusat`, `facebook_pusat`, `website_pusat`) VALUES
(81010, 'AETRA AIR JAKARTA', 'Kota Jakarta', 'Jl. Raya Kalimalang No. 89 Jakarta Timur, 13450', 2186900333, 'kontak.aetra@aetra.co.id', 'https://www.facebook.com/AetraJKT', 'http://aetra.co.id'),
(81011, 'PDAM TIRTA BUMI WIBAWA SUKABUMI', 'Kota Sukabumi', 'Jl. Bhayangkara No. 207, Cikole, Kota Sukabumi 43114', 266221248, 'pamkosi@yahoo.com', 'https://www.facebook.com', 'http://pdamtbwkotasmi.co.id'),
(81012, 'PDAM TIRTA MOEDAL', 'Kota Semarang', 'Jl. Kelud Raya No.60, Petompon, Kec. Gajahmungkur, Kota Semarang, Jawa Tengah 50237', 248315514, 'aetrasemarang@gmail.com', 'tirtamoedal', 'www.pdamkotasmg.co.id'),
(81013, 'PDAM TIRTA BENTENG KOTA TANGERANG', 'Kota Jakarta', 'Jl. Cisadane Raya no.121', 8817299910, 'tirta.benteng@gmail.com', '@Tirta_Benteng', 'https://tirta.benteng.tangerang.co.id');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id_report` int(11) NOT NULL,
  `nomor_pelanggan` bigint(20) UNSIGNED NOT NULL,
  `keluhan` varchar(255) NOT NULL,
  `status_report` enum('accepted','working','fixed') NOT NULL DEFAULT 'accepted',
  `date_report` date DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id_report`, `nomor_pelanggan`, `keluhan`, `status_report`, `date_report`, `created_at`, `updated_at`) VALUES
(40025, 10001, 'Pipa Meledak', 'accepted', '2021-12-02', '2021-12-02 03:26:12', '2021-12-02 03:26:12'),
(40026, 10001, 'Pipa saya mengalami kebocoran sejak jam 2 siang', 'fixed', '2021-12-02', '2021-12-02 03:35:54', '2021-12-02 03:35:54'),
(40027, 10001, 'Air dirumah saya tidak mengalir..', 'accepted', '2021-12-02', '2021-12-02 03:40:33', '2021-12-02 03:40:33'),
(40028, 10062, 'Saya ingin mengganti posisi pipa rumah saya, kapan bisa kira-kira?', 'accepted', '2021-12-02', '2021-12-02 05:01:30', '2021-12-02 05:01:30'),
(40029, 10062, 'Sudah 3 hari air pdam keruh', 'accepted', '2021-12-02', '2021-12-02 06:04:08', '2021-12-02 06:04:08'),
(40030, 10062, 'Tolong segera perbaiki pipa', 'accepted', '2021-12-02', '2021-12-02 07:49:40', '2021-12-02 07:49:40'),
(40048, 10001, 'Sudah 3 hari air mati pada setiap rumah warga RW016', 'accepted', '2021-12-04', '2021-12-03 18:27:29', '2021-12-03 18:27:29'),
(40053, 10062, 'Pipa bocor', 'accepted', '2021-12-07', '2021-12-07 07:45:26', '2021-12-07 07:45:26'),
(40054, 10144, 'Air dirumah saya kecil', 'accepted', '2021-12-07', '2021-12-07 07:49:25', '2021-12-07 07:49:25'),
(40057, 10001, 'test666', 'accepted', '2021-12-08', '2021-12-08 04:15:25', '2021-12-08 04:15:25'),
(40058, 10001, 'test777', 'accepted', '2021-12-08', '2021-12-08 04:15:48', '2021-12-08 04:15:48'),
(40059, 10001, 'test888', 'accepted', '2021-12-08', '2021-12-08 04:16:10', '2021-12-08 04:16:10'),
(40060, 10186, 'Pipa belum dipasang dirumah saya', 'accepted', '2021-12-08', '2021-12-08 08:04:42', '2021-12-08 08:04:42'),
(40062, 10184, 'Hello this is Admin, testing....', 'accepted', '2021-12-14', '2021-12-13 23:48:29', '2021-12-13 23:48:29');

-- --------------------------------------------------------

--
-- Table structure for table `sambungan`
--

CREATE TABLE `sambungan` (
  `nomor_sambungan` int(11) NOT NULL,
  `nomor_pelanggan` bigint(20) UNSIGNED NOT NULL,
  `id_cabang` int(11) NOT NULL,
  `nama_alat` varchar(100) NOT NULL,
  `kondisi_alat` enum('good','broken') NOT NULL,
  `jenis_member` enum('newbie','epic','mythical') NOT NULL DEFAULT 'newbie',
  `date_connect` date NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sambungan`
--

INSERT INTO `sambungan` (`nomor_sambungan`, `nomor_pelanggan`, `id_cabang`, `nama_alat`, `kondisi_alat`, `jenis_member`, `date_connect`, `created_at`, `updated_at`) VALUES
(21001, 10001, 72014, 'IoT ESP8266', 'broken', 'newbie', '2021-11-03', '2021-10-30 16:47:55', '2021-10-30 16:48:10'),
(21002, 10002, 72011, 'IoT Raspberry Pi 4', 'good', 'newbie', '2021-11-04', '2021-12-01 16:48:24', '2021-12-01 16:48:29'),
(21016, 10184, 72011, 'LoRa', 'good', 'epic', '2021-12-08', '2021-12-08 03:50:53', '2021-12-08 03:50:53'),
(21017, 10186, 72014, 'IoT ESP8266', 'good', 'mythical', '2021-12-08', '2021-12-08 07:56:55', '2021-12-08 07:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan_user`
--

CREATE TABLE `tagihan_user` (
  `id_tagihan` int(11) NOT NULL,
  `nomor_sambungan` int(11) NOT NULL,
  `status_tagihan` enum('lunas','belum lunas') NOT NULL,
  `keterangan` enum('rekening_air','rekening_non_air','angsuran') NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `biaya` bigint(20) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tagihan_user`
--

INSERT INTO `tagihan_user` (`id_tagihan`, `nomor_sambungan`, `status_tagihan`, `keterangan`, `jumlah`, `biaya`, `foto`, `created_at`, `updated_at`) VALUES
(30001, 21001, 'belum lunas', 'rekening_air', 1, 150000, NULL, '2021-12-02 08:33:04', '2021-12-03 08:33:10'),
(30006, 21001, 'lunas', 'rekening_non_air', 1, 50000, NULL, '2021-12-02 08:33:17', '2021-12-03 08:33:20'),
(30007, 21001, 'belum lunas', 'angsuran', 12, 12500, NULL, '2021-12-01 08:33:27', '2021-12-01 08:33:27'),
(30011, 21002, 'lunas', 'rekening_air', 1, 150000, NULL, '2021-11-17 14:15:17', '2021-11-19 14:15:17'),
(30012, 21002, 'belum lunas', 'rekening_non_air', 1, 35000, NULL, '2021-10-30 14:15:17', '2021-10-30 14:15:17'),
(30013, 21002, 'belum lunas', 'angsuran', 12, 12500, NULL, '2021-12-01 14:16:15', '2021-12-01 14:16:15'),
(30014, 21017, 'belum lunas', 'rekening_air', 1, 150000, NULL, '2021-12-09 06:39:00', '2021-12-07 06:39:03'),
(30015, 21017, 'belum lunas', 'rekening_non_air', 8, 35000, NULL, '2021-12-07 06:39:07', '2021-12-07 06:39:10'),
(30016, 21017, 'belum lunas', 'angsuran', 12, 12500, NULL, '2021-12-21 06:39:13', '2021-12-22 06:39:16'),
(30017, 21016, 'lunas', 'rekening_air', 1, 150000, NULL, '2021-12-13 17:00:00', '2021-12-13 17:00:00'),
(30018, 21016, 'belum lunas', 'rekening_non_air', 2, 35000, NULL, '2021-12-13 17:00:00', '2021-12-13 17:00:00'),
(30019, 21016, 'belum lunas', 'angsuran', 12, 12500, NULL, '2021-12-13 17:00:00', '2021-12-13 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `nomor_pelanggan` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `role` enum('public','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`nomor_pelanggan`, `username`, `name`, `alamat`, `status`, `role`, `photo`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(10001, 'barjlazuardi', 'Mohammad Barj Lazuardi Dindashwara', 'Jl. Kalingga 10 No.17, Kec. Cibodas, Kota Tangerang, Banten, 15138', '1', 'admin', '1638252534.jpg', 'hashiramakun58@gmail.com', NULL, '$2y$10$403Ft2HY8djZ0Kv0V3oecOm5OyxiR5NTZaShJlaOgEVKufg319dZe', NULL, '2021-11-07 11:58:54', '2021-12-08 20:34:34'),
(10002, 'adamcanray', 'Muhammad Adam Canraynaldi', 'Jl. Cikoneng, Dumpit', '1', 'public', NULL, 'adamcanray@gmail.com', NULL, 'qwerty', NULL, NULL, '2021-12-03 18:44:02'),
(10004, 'lanceyose', 'Dr. Lance Yosemite', 'Washington DC, US', '1', 'public', NULL, 'fadel.emmet@gmail.com', NULL, '$2y$10$zkZmXOnEHlPU7v55Yotmd.vQIjlc92vDwENekiytnIvQ51afYghPm', NULL, NULL, '2021-12-08 04:19:54'),
(10005, 'aliyasprouse', 'Aliya Sprouse', 'Jl. Bethseba 2', '0', 'public', NULL, 'gwendolyn39@yahoo.com', NULL, '$2y$10$eHE9Oat.noOIwBm.6086re3R/6V3Kdw6zfRXEHfBJWd1q0xyxtX3S', NULL, NULL, '2021-12-13 23:32:55'),
(10006, 'jamiecole', 'Jamie Cole', 'Arctic North 48', '0', 'public', NULL, 'elfrieda41@hotmail.com', NULL, '$2y$10$g9rMMD4CA6FBsTjYoA.Ql.HL/ec0qqWY70qLObyKLrjEZ/egRpMWO', NULL, NULL, '2021-11-24 10:04:58'),
(10007, 'brandiweh', 'Brandi Wehner Jr.', 'Arctic North 47', '0', 'public', NULL, 'landen.mcclure@gmail.com', NULL, '$2y$10$k2cXRbCNdLccjYXpYjpMjeEcs5vNrISpqKgjSVBmL96c0OLL3dgv6', NULL, NULL, '2021-11-29 07:55:54'),
(10008, 'jonathanrc', 'Jonathan Rice', 'Yorkshire 433', '0', 'public', NULL, 'maurine48@gmail.com', NULL, '$2y$10$bRRTWqM3jk6g2CgsEhdbBetKyyVEnR3rjyqrMB/dHycsgkCGwPDsy', NULL, NULL, '2021-11-24 10:05:10'),
(10014, 'ordoyle', 'Mr. Oral Doyle', 'Yorkshire 432', '0', 'public', NULL, 'abbie78@rosenbaum.com', NULL, '$2y$10$RrAraLWZ/BeYRKMfgQyKHOHax53XtAQY4JGby9v/qNrjnbAS7OnWW', NULL, NULL, '2021-11-24 10:41:03'),
(10015, 'nelsonamore', 'Prof. Nelson D\'Amore MD', 'Yorkshire 431', '0', 'public', NULL, 'nienow.katlynn@hotmail.com', NULL, '$2y$10$TyV.eijCZ46ZlRW1TbFnpuYnrD/z1KQYWGLi9jOZrYomsXWDSYWf.', NULL, NULL, '2021-11-24 10:26:40'),
(10040, 'gandalf', 'Gandalf The Wizard', 'Shire', '0', 'public', NULL, 'sikelabu@gmail.com', NULL, '$2y$10$vRM0nGTRrDXLhRgiE839DeYZUVN/3EVwe7mPfiSRYe28XDBgG3vIm', NULL, '2021-11-05 07:33:35', '2021-11-24 10:40:57'),
(10041, 'bilbobaggins', 'Bilbo Baggins', 'Shire Bag-End', '0', 'public', NULL, 'bilbo.baggs@gmail.com', NULL, '$2y$10$RsKLXjTWlXzaz3pKXyKUaOgV8daamKaGtor/p4KFSo0WhM5dQSZoi', NULL, '2021-11-05 07:47:41', '2021-11-24 10:26:42'),
(10042, 'frodobaggins', 'Frodo Baggins', 'Shire Bag-End', '0', 'public', NULL, 'frodomoddo@gmail.com', NULL, '$2y$10$YAwWHSrtDs4FipVsezZ4M.uitYzhzVFbaYPcRpTsnjb0HFMX4tWoK', NULL, '2021-11-05 07:49:17', '2021-11-24 10:26:47'),
(10044, 'legolas', 'Legolas', 'Rivendell', '0', 'public', NULL, 'legolas.archer@gmail.com', NULL, '$2y$10$YPb3KKOmD.qM2V6SffaT2OoX.OxLmzqpznc0yIqqgokYtJFfEmWwe', NULL, '2021-11-05 08:07:32', '2021-11-24 10:26:48'),
(10046, 'aragorn', 'Aragorn Son of Arathorn', 'Minastirith', '0', 'public', NULL, 'aragorn.king@gmail.com', NULL, '$2y$10$kWLLF8OlEEceMfFzIjBioep/PGPq.u5m9qAzvPNK22fTIC43NTZQm', NULL, '2021-11-05 08:48:43', '2021-11-24 10:26:48'),
(10047, 'gimlidwarf', 'Gimli The Dwarf', 'Moria', '0', 'public', NULL, 'gimli@gmail.com', NULL, '$2y$10$b0Kv8WBosy73k/qrZMWs6eVc.WM5I8DsmxDmsVAceDz/f0u6nZ5/G', NULL, '2021-11-05 08:49:29', '2021-11-24 10:08:11'),
(10051, 'laravel', 'Laravel Corporation', 'Sillicon Valley', '0', 'public', '1636802212.png', 'laravel@gmail.com', NULL, '$2y$10$qnoa8EoFdkgYHfRxFYSjzeKRluTqdj/B2PS42Zpx04EWwRCU3uGE6', NULL, '2021-11-05 10:16:55', '2021-11-24 10:07:40'),
(10125, 'idhamfaidzi', 'Idham Noor Faidzi', 'Jl. Danau Sentarum', '1', 'public', NULL, 'idham.faidzi@gmail.com', NULL, '$2y$10$QcP5Qona7qx3AxRoqhvwtuK6x/HjIRLL4izXw0s9E0kB77P2wPBGy', NULL, '2021-11-08 04:44:38', '2021-11-29 23:10:04'),
(10126, 'angelinadanilova', 'Angelina Danilova', 'Daegu District 29, South Korea', '1', 'public', '1636744596.jpg', 'angelina-danilova@gmail.com', NULL, '$2y$10$0Ibek135VhO2qBE01eS87uG/yMxXHOBJm45BtLvFFgrZLmP8B98em', NULL, '2021-11-09 02:03:49', '2021-11-27 23:15:31'),
(10145, 'illusomina', 'Shin Min Na', 'Seoul, South Korea', '0', 'public', '1636745938.jpg', 'illusomina@gmail.com', NULL, '$2y$10$xKyDGd6oAIkzX8cIMjv3HOsWQ3/10Bh6NN/xED2B4VoBtADCJjqAG', NULL, '2021-11-12 12:37:35', '2021-11-24 10:06:39'),
(10146, 'skuukzky', 'Bae Suzy', 'Seoul, South Korea', '0', 'public', '1636746255.jpg', 'skuukzky@gmail.com', NULL, '$2y$10$kl.qdPirNGgkcFk/p6kMJOW3xdaYJLQAawtHrtP3jtcbbMXzeVbBq', NULL, '2021-11-12 12:43:22', '2021-11-24 10:06:36'),
(10147, 'realbarbarapalvin', 'Barbara Palvin', 'Los Angeles, United States', '0', 'public', '1636746553.jpg', 'barbara.palvin@gmail.com', NULL, '$2y$10$5R30Q3yZSynWCHevVv6mIewZwyBhb6y53AULPooQOXL1fZaZWqPRe', NULL, '2021-11-12 12:48:34', '2021-11-24 10:06:33'),
(10149, 'elchapo', 'Joaquin de Guzman', 'Mazatlan, Sinaloa Mexico', '0', 'public', '1636802881.jpg', 'joaquindeguzman@gmail.com', NULL, '$2y$10$Lz3bGrCUj.Y8BdsnMe5HT.zpgf1ABHdWziX0bsPyfeUe6MClRw83G', NULL, '2021-11-13 04:20:37', '2021-11-24 10:06:41'),
(10184, 'administrator', 'Administrator', 'District Blok M No.142, Jakarta Selatan', '0', 'admin', '1639464573.jpg', 'admin@elixir.web.apps.com', NULL, '$2y$10$JaI.YkOPgg5J8IAxtcDlUeJ0EGdHPGQECXfCPXOvPjVb1QY03MGEq', NULL, '2021-12-08 03:40:58', '2021-12-13 23:49:33'),
(10185, 'johnny', 'Johnny Depp', 'Jl. Kalingga 10 No.17, Kec. Cibodas, Kota Tangerang, Banten, 15138', '0', 'public', NULL, 'johnny@gmail.com', NULL, '$2y$10$zOR76jEhB5na20F.L0Z5Ue8tGpXAepgeViufDHpr3J48OQOgkw2Em', NULL, '2021-12-08 07:53:36', '2021-12-08 07:53:36'),
(10186, 'johnnydepp', 'Johnny Depp', 'Indonesia, Banten, Kota Tangerang, Perumnas 3', '0', 'public', '1639464716.jpg', 'johnnydepp@gmail.com', NULL, '$2y$10$4t/3fmbBvgGW6L29Tp/lqOPKTnjtSnEpez4q68vFcLjfZiZHVMQtC', NULL, '2021-12-08 07:54:42', '2021-12-13 23:51:56'),
(10188, 'tomholland', 'Tom Holland', 'Los Angeles', '0', 'public', NULL, 'tomholland@gmail.com', NULL, '$2y$10$0Mt6Bjlb45SlFT7cWWZK.eTi90fwPoWlWE/oyoz27oaRNJ0bHFYQW', NULL, '2021-12-13 23:54:06', '2021-12-13 23:54:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_news`,`id_pusat`) USING BTREE,
  ADD KEY `id_pusat` (`id_pusat`);

--
-- Indexes for table `cabang_pdam`
--
ALTER TABLE `cabang_pdam`
  ADD PRIMARY KEY (`id_cabang`,`id_pusat`) USING BTREE,
  ADD KEY `id_pusat` (`id_pusat`);

--
-- Indexes for table `data_sambungan`
--
ALTER TABLE `data_sambungan`
  ADD PRIMARY KEY (`id_data`,`nomor_sambungan`) USING BTREE,
  ADD KEY `nomor_sambungan` (`nomor_sambungan`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  ADD PRIMARY KEY (`id_partnership`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pusat_pdam`
--
ALTER TABLE `pusat_pdam`
  ADD PRIMARY KEY (`id_pusat`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id_report`) USING BTREE,
  ADD UNIQUE KEY `id_report` (`id_report`,`nomor_pelanggan`),
  ADD KEY `nomor_pelanggan` (`nomor_pelanggan`);

--
-- Indexes for table `sambungan`
--
ALTER TABLE `sambungan`
  ADD PRIMARY KEY (`nomor_sambungan`) USING BTREE,
  ADD UNIQUE KEY `nomor_sambungan` (`nomor_sambungan`,`nomor_pelanggan`,`id_cabang`),
  ADD KEY `id_cabang` (`id_cabang`),
  ADD KEY `nomor_pelanggan` (`nomor_pelanggan`);

--
-- Indexes for table `tagihan_user`
--
ALTER TABLE `tagihan_user`
  ADD PRIMARY KEY (`id_tagihan`,`nomor_sambungan`) USING BTREE,
  ADD KEY `nomor_sambungan` (`nomor_sambungan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`nomor_pelanggan`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_news` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90008;

--
-- AUTO_INCREMENT for table `cabang_pdam`
--
ALTER TABLE `cabang_pdam`
  MODIFY `id_cabang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72022;

--
-- AUTO_INCREMENT for table `data_sambungan`
--
ALTER TABLE `data_sambungan`
  MODIFY `id_data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=486;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  MODIFY `id_partnership` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=454;

--
-- AUTO_INCREMENT for table `pusat_pdam`
--
ALTER TABLE `pusat_pdam`
  MODIFY `id_pusat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81014;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id_report` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40063;

--
-- AUTO_INCREMENT for table `sambungan`
--
ALTER TABLE `sambungan`
  MODIFY `nomor_sambungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21019;

--
-- AUTO_INCREMENT for table `tagihan_user`
--
ALTER TABLE `tagihan_user`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30020;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `nomor_pelanggan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10189;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`id_pusat`) REFERENCES `pusat_pdam` (`id_pusat`);

--
-- Constraints for table `cabang_pdam`
--
ALTER TABLE `cabang_pdam`
  ADD CONSTRAINT `cabang_pdam_ibfk_1` FOREIGN KEY (`id_pusat`) REFERENCES `pusat_pdam` (`id_pusat`);

--
-- Constraints for table `data_sambungan`
--
ALTER TABLE `data_sambungan`
  ADD CONSTRAINT `data_sambungan_ibfk_1` FOREIGN KEY (`nomor_sambungan`) REFERENCES `sambungan` (`nomor_sambungan`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`nomor_pelanggan`) REFERENCES `users` (`nomor_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sambungan`
--
ALTER TABLE `sambungan`
  ADD CONSTRAINT `sambungan_ibfk_1` FOREIGN KEY (`id_cabang`) REFERENCES `cabang_pdam` (`id_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sambungan_ibfk_2` FOREIGN KEY (`id_cabang`) REFERENCES `cabang_pdam` (`id_cabang`),
  ADD CONSTRAINT `sambungan_ibfk_3` FOREIGN KEY (`nomor_pelanggan`) REFERENCES `users` (`nomor_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tagihan_user`
--
ALTER TABLE `tagihan_user`
  ADD CONSTRAINT `tagihan_user_ibfk_1` FOREIGN KEY (`nomor_sambungan`) REFERENCES `sambungan` (`nomor_sambungan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
