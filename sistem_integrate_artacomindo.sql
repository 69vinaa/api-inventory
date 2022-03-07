-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2022 at 07:36 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_integrate_artacomindo`
--

-- --------------------------------------------------------

--
-- Table structure for table `approved_by`
--

CREATE TABLE `approved_by` (
  `id` int(11) NOT NULL,
  `approved_by` int(11) NOT NULL,
  `check_name` varchar(50) NOT NULL,
  `ordered` tinyint(4) NOT NULL,
  `doc_approved` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `approved_by`
--

INSERT INTO `approved_by` (`id`, `approved_by`, `check_name`, `ordered`, `doc_approved`, `created_at`, `updated_at`) VALUES
(1, 5, 'PREPARED BY', 1, 1, '2022-02-22 14:40:39', NULL),
(2, 10, 'CHECKED BY', 2, 1, '2022-02-22 14:40:39', NULL),
(3, 6, 'APPROVED BY', 3, 1, '2022-02-22 14:47:28', NULL),
(4, 9, 'ACKNOWLEDGE BY', 4, 1, '2022-02-22 14:47:28', NULL),
(5, 5, 'PREPARED BY', 1, 13, '2022-02-22 14:40:39', NULL),
(6, 10, 'CHECKED BY', 2, 13, '2022-02-22 14:40:39', NULL),
(7, 6, 'APPROVED BY', 3, 13, '2022-02-22 14:47:28', NULL),
(8, 9, 'ACKNOWLEDGE BY', 4, 13, '2022-02-22 14:47:28', NULL),
(9, 5, 'PREPARED BY', 1, 12, '2022-02-22 14:40:39', NULL),
(10, 10, 'CHECKED BY', 2, 12, '2022-02-22 14:40:39', NULL),
(11, 6, 'APPROVED BY', 3, 12, '2022-02-22 14:47:28', NULL),
(12, 9, 'ACKNOWLEDGE BY', 4, 12, '2022-02-22 14:47:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `divisi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id`, `divisi`, `created_at`, `updated_at`) VALUES
(1, 'IT', '2021-11-25 07:06:07', NULL),
(2, 'Finance', NULL, NULL),
(3, 'Procurement', NULL, NULL),
(4, 'Sales', NULL, NULL),
(5, 'Operasional', NULL, NULL),
(7, 'Management', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_users`
--

CREATE TABLE `email_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_users`
--

INSERT INTO `email_users` (`id`, `email`, `created_at`, `updated_at`, `id_user`) VALUES
(1, 'farhanaldiansyah@ajnusa.com', NULL, NULL, 3),
(2, 'farhanaldiansyah@narwastuarthatama.com', NULL, '2021-12-09 22:21:53', 3),
(4, 'fachri@ajnusa.com', '2021-12-10 00:35:34', NULL, 4),
(6, ' farhanaldiansyah@artacomindo.com', '2021-12-10 01:21:18', NULL, 3),
(9, '  farhanaldiansyah@artacomindojejaringnusa.com', '2021-12-10 01:23:02', NULL, 3),
(18, 'fachri@narwasthuarthatama.com', '2021-12-10 01:34:18', '2021-12-10 01:34:41', 4),
(19, 'fachri@artacomindo.com', '2021-12-10 01:35:16', NULL, 4),
(20, 'farhanaldiansyah@artacomindo.com', '2021-12-10 01:40:29', NULL, 3),
(21, 'farhanaldiansyah@artacomindojejaringnusa.com', '2021-12-10 01:40:29', NULL, 3),
(22, '', '2021-12-10 01:40:29', NULL, 3),
(23, 'dpermantara@ajnusa.com', '2021-12-12 22:50:07', NULL, 5),
(24, 'mryulhan@ajnusa.com', '2021-12-13 21:37:35', NULL, 6),
(25, 'eva.junita@ajnusa.com', '2021-12-13 21:38:12', NULL, 7),
(27, 'nazirin.nawawi@ajnusa.com', '2021-12-13 21:44:27', NULL, 8),
(28, 'haris_sidik@ajnusa.com', '2021-12-13 21:45:29', NULL, 9),
(29, 'inten.k@ajnusa.com', '2022-02-22 07:47:00', NULL, 10);

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
-- Table structure for table `inv_approved_history`
--

CREATE TABLE `inv_approved_history` (
  `id_approved_history` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `id_barang_proses` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `status_approved` varchar(10) NOT NULL,
  `time_approved` datetime DEFAULT NULL,
  `keterangan` varchar(20) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv_barang`
--

CREATE TABLE `inv_barang` (
  `id_barang` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `kode_barang` char(20) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `id_jenis` bigint(20) NOT NULL,
  `id_satuan` bigint(20) NOT NULL,
  `overall_stok` int(5) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_barang`
--

INSERT INTO `inv_barang` (`id_barang`, `slug`, `kode_barang`, `nama_barang`, `id_jenis`, `id_satuan`, `overall_stok`, `create_at`, `update_at`) VALUES
(1, 'fjwcqxdhfalnmwieiwjd', 'B001', 'Modem', 1, 1, 3, '2022-03-04 15:27:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_barang_proses`
--

CREATE TABLE `inv_barang_proses` (
  `id_barang_proses` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `id_kategori_proses` bigint(20) NOT NULL,
  `no_proses` int(10) NOT NULL,
  `tgl_proses_barang` datetime DEFAULT NULL,
  `id_user` bigint(20) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv_detail_barang`
--

CREATE TABLE `inv_detail_barang` (
  `id_detail_barang` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `id_barang` bigint(20) NOT NULL,
  `serial_number` varchar(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `id_status` bigint(20) NOT NULL,
  `id_type` bigint(20) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv_detail_barang_proses`
--

CREATE TABLE `inv_detail_barang_proses` (
  `id_detail_barang_proses` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `id_barang_proses` bigint(20) NOT NULL,
  `id_detail_barang` bigint(20) NOT NULL,
  `jml_barang` int(5) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv_jenis_barang`
--

CREATE TABLE `inv_jenis_barang` (
  `id_jenis` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `jenis_barang` varchar(20) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv_kategori_proses`
--

CREATE TABLE `inv_kategori_proses` (
  `id_kategori_proses` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `kategori_proses` varchar(10) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv_penerima`
--

CREATE TABLE `inv_penerima` (
  `id_penerima` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `id_barang_proses` bigint(20) NOT NULL,
  `id_perusahaan` bigint(20) NOT NULL,
  `nama_penerima` varchar(30) NOT NULL,
  `alamat_penerima` varchar(100) NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv_satuan_barang`
--

CREATE TABLE `inv_satuan_barang` (
  `id_satuan` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `satuan_barang` varchar(10) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv_status_barang`
--

CREATE TABLE `inv_status_barang` (
  `id_status` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `status_barang` varchar(20) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv_type_barang`
--

CREATE TABLE `inv_type_barang` (
  `id_type` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `type_barang` varchar(10) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_slug` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `slug`, `parent_slug`, `label`, `controller`, `order`, `icon`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'superadmin-dashboard', NULL, 'Dashboard', 'SU/Dashboard', 1, 'bx bx-home-circle', 1, NULL, '2021-12-01 06:42:07'),
(2, 'superadmin-method', NULL, 'Method', 'SU/Method', 2, 'bx bx-cog', 1, NULL, '2021-12-01 06:42:13'),
(3, 'superadmin-menu-users', NULL, 'Menu Users', 'SU/Menu', 3, 'bx bxs-user-detail', 1, NULL, '2021-12-01 06:42:19'),
(4, 'superadmin-roles', 'users', 'Roles', 'SU/Roles', 2, 'bx bxs-user-check', 1, NULL, '2021-12-06 04:09:02'),
(7, 'users', NULL, 'Data Users', NULL, 5, 'bx bx-user', 1, NULL, '2021-12-10 07:57:33'),
(8, 'superadmin-users', 'users', 'Users', 'SU/Users', 1, NULL, 1, NULL, NULL),
(9, 'superadmin-divisi', 'users', 'Divisi', 'SU/Divisi', 3, NULL, 1, '2021-12-08 17:00:00', NULL),
(10, 'Procurement', NULL, 'Procurement', NULL, 6, 'bx bx-package', 1, '2021-12-09 17:00:00', '2021-12-10 07:57:15'),
(11, 'pro-type-docs', 'Procurement', 'Tipe Document', 'Procurement/TypeDocs', 2, NULL, 0, '2021-12-09 17:00:00', '2022-02-25 07:57:08'),
(13, 'superadmin-company', NULL, 'Perusahaan', 'SU/Company', 4, 'bx bxs-spa', 1, '2021-12-09 17:00:00', '2021-12-10 07:58:14'),
(14, 'pro-sifat-proses', 'Procurement', 'Sifat Proses', 'Procurement/ProcessNature', 3, NULL, 0, '2021-12-09 17:00:00', '2022-02-25 07:56:53'),
(15, 'pro-dashboard', NULL, 'Dashboard', 'Procurement/Dashboard', 1, 'bx bx-home-circle', 1, '2021-12-09 17:00:00', '2021-12-10 08:05:35'),
(16, 'approve-doc', 'Procurement', 'Approved Document', 'Procurement/ApprovedDocument', 4, NULL, 1, '2021-12-13 21:13:15', '2021-12-13 21:17:44'),
(17, 'management-dashboard', NULL, 'Dashboard', 'Management/Dashboard', 1, 'bx bx-home-circle', 1, '2021-12-13 21:22:12', NULL),
(18, 'proc-project', NULL, 'Project', 'Procurement/UploadDocument', 2, 'bx bxs-file-doc', 1, '2021-12-13 21:29:39', '2022-01-12 09:59:19'),
(19, 'form-purchase', NULL, 'Form Purchase', 'Procurement/FormPurchase', 3, 'bx bxs-copy-alt', 1, '2022-01-20 06:46:03', '2022-01-20 07:32:39'),
(20, 'req-form-cash', NULL, 'Req Form Cash', 'Procurement/ReqFormCash', 3, 'bx bxs-dollar-circle', 1, '2022-01-27 02:40:40', '2022-02-02 02:49:20'),
(22, 'supplier', NULL, 'Supplier', 'Procurement/Supplier', 4, 'bx bx-street-view', 1, '2022-02-21 08:06:38', '2022-02-21 08:10:26');

-- --------------------------------------------------------

--
-- Table structure for table `method`
--

CREATE TABLE `method` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `method`
--

INSERT INTO `method` (`id`, `method`, `created_at`, `updated_at`) VALUES
(1, 'Index', '2021-11-25 03:20:10', '2021-11-25 03:20:10'),
(2, 'Insert', NULL, NULL),
(3, 'Update', NULL, NULL),
(4, 'Delete', NULL, NULL),
(7, 'Print', NULL, NULL);

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
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2021_11_23_040239_create_divisi_table', 1),
(5, '2021_11_23_040243_create_users_table_1_roles', 1),
(6, '2021_11_23_040248_create_users_table_2_users', 1),
(7, '2021_11_23_041859_create_email_users_table', 1),
(8, '2021_11_23_043721_create_menu_table', 1),
(9, '2021_11_23_044001_create_method_table', 1),
(10, '2021_11_23_044053_create_privilege_table', 1),
(11, '2021_11_23_062909_create_procurement_sifat_proses_table_1', 1),
(12, '2021_11_23_062950_create_procurement_perusahaan_table_2', 1),
(13, '2021_11_23_063055_create_procurement_tipe_document_table_3', 1),
(14, '2021_11_23_063140_create_procurement_key_upload_table_4', 1),
(15, '2021_11_23_063217_create_procurement_upload_document_table_5', 1),
(16, '2021_11_23_063250_create_procurement_approved_document_table_6', 1),
(17, '2021_11_23_063918_create_procurement_history_approved_table_7', 1),
(18, '2021_11_23_080017_add_field_roles_table', 1),
(19, '2021_11_24_034010_create_procurement_notif_action_table', 1),
(20, '2021_11_24_034036_create_procurement_detail_notif_action_table', 1);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `perusahaan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`id`, `perusahaan`, `kode`, `alamat`, `no_telp`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'PT. Artacomindo Jejaring Nusa', 'AJN', 'Pekantoran Graha Prima Bintara No 8 Jl Terusan I Gusti Ngurah Rai, 17134', '081315474123', 'ajn.png', '2022-02-23 06:25:21', NULL),
(2, 'PT. Narwastu Artha Tama', 'NAT', 'Menara Palma Lantai 12, JL. HR Rasuna Said X6 No.16', '02189454821', 'nat.png', '2022-02-23 06:25:21', NULL),
(3, 'PT. Artacomindotama', 'ART', 'GD Menara Palma LT.12, JL. HR Rasuna Said Blok X2 Kav 6', '02189452514', 'art1.png', '2022-02-23 06:25:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `privilege_users`
--

CREATE TABLE `privilege_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_roles` bigint(20) UNSIGNED NOT NULL,
  `id_menu` bigint(20) UNSIGNED NOT NULL,
  `id_method` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privilege_users`
--

INSERT INTO `privilege_users` (`id`, `created_at`, `updated_at`, `id_roles`, `id_menu`, `id_method`) VALUES
(38, '2021-12-07 17:00:00', NULL, 8, 8, 1),
(40, '2021-12-07 17:00:00', NULL, 8, 8, 7),
(47, '2021-12-07 17:00:00', NULL, 1, 1, 1),
(49, '2021-12-07 17:00:00', NULL, 1, 8, 1),
(53, '2021-12-07 17:00:00', NULL, 1, 8, 7),
(54, '2021-12-07 17:00:00', NULL, 1, 2, 1),
(55, '2021-12-07 17:00:00', NULL, 1, 2, 2),
(56, '2021-12-07 17:00:00', NULL, 1, 2, 3),
(57, '2021-12-07 17:00:00', NULL, 1, 2, 4),
(59, '2021-12-07 17:00:00', NULL, 1, 4, 1),
(60, '2021-12-07 17:00:00', NULL, 1, 4, 2),
(61, '2021-12-07 17:00:00', NULL, 1, 4, 3),
(62, '2021-12-07 17:00:00', NULL, 1, 4, 4),
(64, '2021-12-07 17:00:00', NULL, 1, 3, 1),
(65, '2021-12-07 17:00:00', NULL, 1, 3, 2),
(66, '2021-12-07 17:00:00', NULL, 1, 3, 3),
(67, '2021-12-07 17:00:00', NULL, 1, 3, 4),
(68, '2021-12-07 17:00:00', NULL, 1, 3, 7),
(70, '2021-12-09 17:00:00', NULL, 1, 9, 1),
(71, '2021-12-09 17:00:00', NULL, 1, 9, 2),
(72, '2021-12-09 17:00:00', NULL, 1, 9, 3),
(73, '2021-12-09 17:00:00', NULL, 1, 9, 4),
(74, '2021-12-09 17:00:00', NULL, 9, 1, 1),
(75, '2021-12-09 17:00:00', NULL, 9, 8, 1),
(76, '2021-12-09 17:00:00', NULL, 9, 8, 2),
(77, '2021-12-09 17:00:00', NULL, 9, 8, 7),
(78, '2021-12-09 17:00:00', NULL, 9, 9, 1),
(79, '2021-12-09 17:00:00', NULL, 1, 11, 1),
(80, '2021-12-09 17:00:00', NULL, 1, 11, 2),
(81, '2021-12-09 17:00:00', NULL, 1, 11, 3),
(82, '2021-12-09 17:00:00', NULL, 1, 11, 4),
(83, '2021-12-09 17:00:00', NULL, 1, 14, 1),
(84, '2021-12-09 17:00:00', NULL, 1, 14, 2),
(85, '2021-12-09 17:00:00', NULL, 1, 14, 3),
(86, '2021-12-09 17:00:00', NULL, 1, 14, 4),
(87, '2021-12-09 17:00:00', NULL, 1, 13, 1),
(88, '2021-12-09 17:00:00', NULL, 1, 13, 2),
(89, '2021-12-09 17:00:00', NULL, 1, 13, 3),
(90, '2021-12-09 17:00:00', NULL, 1, 13, 4),
(91, '2021-12-09 17:00:00', NULL, 1, 13, 7),
(92, '2021-12-12 17:00:00', NULL, 8, 15, 1),
(93, '2021-12-12 17:00:00', NULL, 8, 11, 1),
(94, '2021-12-12 17:00:00', NULL, 8, 14, 1),
(97, '2021-12-12 17:00:00', NULL, 1, 8, 2),
(99, '2021-12-13 17:00:00', NULL, 1, 8, 3),
(100, '2021-12-13 17:00:00', NULL, 1, 8, 4),
(102, '2021-12-13 17:00:00', NULL, 10, 8, 1),
(103, '2021-12-13 17:00:00', NULL, 10, 8, 2),
(104, '2021-12-13 17:00:00', NULL, 10, 8, 3),
(105, '2021-12-13 17:00:00', NULL, 10, 8, 7),
(106, '2021-12-13 17:00:00', NULL, 10, 17, 1),
(107, '2021-12-13 17:00:00', NULL, 10, 17, 3),
(108, '2021-12-13 17:00:00', NULL, 10, 11, 1),
(109, '2021-12-13 17:00:00', NULL, 10, 9, 1),
(110, '2021-12-13 17:00:00', NULL, 10, 9, 2),
(111, '2021-12-13 17:00:00', NULL, 10, 9, 3),
(112, '2021-12-13 17:00:00', NULL, 10, 9, 7),
(113, '2021-12-13 17:00:00', NULL, 10, 13, 1),
(114, '2021-12-13 17:00:00', NULL, 10, 13, 2),
(115, '2021-12-13 17:00:00', NULL, 10, 13, 3),
(116, '2021-12-13 17:00:00', NULL, 8, 13, 1),
(117, '2021-12-13 17:00:00', NULL, 8, 18, 1),
(118, '2021-12-13 17:00:00', NULL, 8, 18, 2),
(119, '2021-12-13 17:00:00', NULL, 8, 18, 3),
(120, '2021-12-13 17:00:00', NULL, 8, 18, 7),
(121, '2021-12-13 17:00:00', NULL, 9, 18, 1),
(122, '2021-12-13 17:00:00', NULL, 9, 18, 3),
(123, '2021-12-13 17:00:00', NULL, 9, 18, 7),
(124, '2021-12-13 17:00:00', NULL, 10, 4, 1),
(125, '2021-12-13 17:00:00', NULL, 10, 18, 1),
(126, '2021-12-13 17:00:00', NULL, 10, 18, 2),
(127, '2021-12-13 17:00:00', NULL, 10, 18, 3),
(128, '2021-12-13 17:00:00', NULL, 10, 18, 7),
(130, '2022-01-19 17:00:00', NULL, 8, 19, 1),
(131, '2022-01-19 17:00:00', NULL, 8, 19, 2),
(132, '2022-01-19 17:00:00', NULL, 8, 19, 3),
(133, '2022-01-19 17:00:00', NULL, 8, 19, 4),
(134, '2022-01-19 17:00:00', NULL, 8, 19, 7),
(135, '2022-01-19 17:00:00', NULL, 1, 18, 1),
(136, '2022-01-19 17:00:00', NULL, 1, 18, 2),
(137, '2022-01-19 17:00:00', NULL, 1, 18, 3),
(138, '2022-01-19 17:00:00', NULL, 1, 18, 4),
(139, '2022-01-19 17:00:00', NULL, 1, 18, 7),
(140, '2022-01-19 17:00:00', NULL, 1, 19, 1),
(141, '2022-01-19 17:00:00', NULL, 1, 19, 2),
(142, '2022-01-19 17:00:00', NULL, 1, 19, 3),
(143, '2022-01-19 17:00:00', NULL, 1, 19, 4),
(144, '2022-01-19 17:00:00', NULL, 1, 19, 7),
(145, '2022-01-26 17:00:00', NULL, 8, 20, 1),
(146, '2022-01-26 17:00:00', NULL, 8, 20, 3),
(147, '2022-01-26 17:00:00', NULL, 8, 20, 4),
(148, '2022-01-26 17:00:00', NULL, 8, 20, 7),
(152, '2022-02-20 17:00:00', NULL, 8, 22, 1),
(153, '2022-02-20 17:00:00', NULL, 8, 22, 2),
(154, '2022-02-20 17:00:00', NULL, 8, 22, 3),
(155, '2022-02-20 17:00:00', NULL, 8, 22, 4),
(156, '2022-02-20 17:00:00', NULL, 8, 22, 7),
(157, '2022-02-21 17:00:00', NULL, 11, 8, 1),
(158, '2022-02-21 17:00:00', NULL, 11, 17, 1),
(159, '2022-02-21 17:00:00', NULL, 11, 11, 1),
(160, '2022-02-21 17:00:00', NULL, 11, 18, 1),
(161, '2022-02-21 17:00:00', NULL, 11, 18, 7),
(162, '2022-02-21 17:00:00', NULL, 11, 9, 1),
(163, '2022-02-21 17:00:00', NULL, 11, 19, 1),
(164, '2022-02-21 17:00:00', NULL, 11, 19, 7),
(165, '2022-02-21 17:00:00', NULL, 11, 20, 1),
(166, '2022-02-21 17:00:00', NULL, 11, 20, 7),
(167, '2022-02-21 17:00:00', NULL, 11, 13, 1),
(168, '2022-02-21 17:00:00', NULL, 11, 16, 1),
(169, '2022-02-21 17:00:00', NULL, 11, 16, 7),
(170, '2022-02-21 17:00:00', NULL, 11, 22, 1),
(171, '2022-02-22 17:00:00', NULL, 8, 18, 4),
(172, '2022-02-22 17:00:00', NULL, 8, 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `procurement_approved_document`
--

CREATE TABLE `procurement_approved_document` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status_approved` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `deskripsi_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordered` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_upload_document` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_approved_document`
--

INSERT INTO `procurement_approved_document` (`id`, `status_approved`, `deskripsi_text`, `ordered`, `created_at`, `updated_at`, `id_upload_document`, `id_user`) VALUES
(21, 0, NULL, 1, '2022-01-03 04:35:35', NULL, 12, 9),
(22, 0, NULL, 2, '2022-01-03 04:35:35', NULL, 12, 6),
(23, 0, NULL, 3, '2022-01-03 04:35:35', NULL, 12, 7);

-- --------------------------------------------------------

--
-- Table structure for table `procurement_detail_notif_action`
--

CREATE TABLE `procurement_detail_notif_action` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status_read` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_notif` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_detail_notif_action`
--

INSERT INTO `procurement_detail_notif_action` (`id`, `status_read`, `created_at`, `updated_at`, `id_notif`, `id_user`) VALUES
(5, 0, '2022-01-03 04:35:35', NULL, 9, 9),
(6, 0, '2022-01-03 04:35:35', NULL, 9, 6),
(7, 0, '2022-01-03 04:35:35', NULL, 9, 7);

-- --------------------------------------------------------

--
-- Table structure for table `procurement_history_approved`
--

CREATE TABLE `procurement_history_approved` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `history` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_history` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_history_approved`
--

INSERT INTO `procurement_history_approved` (`id`, `history`, `status_history`, `created_at`, `updated_at`, `id_user`) VALUES
(34, 'User Login Sistem pada 30 December 2021 - 14:20:14', 'LOGIN', '2021-12-30 07:20:14', NULL, 2),
(35, 'User Login Sistem pada 31 December 2021 - 09:41:35', 'LOGIN', '2021-12-31 02:41:35', NULL, 2),
(36, 'User Login Sistem pada 03 January 2022 - 10:58:16', 'LOGIN', '2022-01-03 03:58:16', NULL, 2),
(37, 'User Logout Sistem pada 03 January 2022 - 11:26:50', 'LOGOUT', '2022-01-03 04:26:50', NULL, 2),
(38, 'User Login Sistem pada 03 January 2022 - 11:26:57', 'LOGIN', '2022-01-03 04:26:57', NULL, 5),
(39, 'User Login Sistem pada 03 January 2022 - 11:34:01', 'LOGIN', '2022-01-03 04:34:01', NULL, 5),
(40, 'User Saved record Upload Document pada 03 January 2022 - 11:35:35', 'SAVED_RECORD_UPLOADED_DOCUMENT', '2022-01-03 04:35:35', NULL, 5),
(41, 'User Logout Sistem pada 03 January 2022 - 13:32:10', 'LOGOUT', '2022-01-03 06:32:10', NULL, 5),
(42, 'User Login Sistem pada 03 January 2022 - 13:32:50', 'LOGIN', '2022-01-03 06:32:50', NULL, 2),
(43, 'User Login Sistem pada 03 January 2022 - 16:22:14', 'LOGIN', '2022-01-03 09:22:14', NULL, 2),
(44, 'User Updated record Type Document pada 03 January 2022 - 16:26:09', 'UPDATED_RECORD_TYPE_DOCUMENT', '2022-01-03 09:26:09', NULL, 2),
(45, 'User Updated record Type Document pada 03 January 2022 - 16:26:20', 'UPDATED_RECORD_TYPE_DOCUMENT', '2022-01-03 09:26:20', NULL, 2),
(46, 'User Updated record Type Document pada 03 January 2022 - 16:26:44', 'UPDATED_RECORD_TYPE_DOCUMENT', '2022-01-03 09:26:44', NULL, 2),
(47, 'User Updated record Type Document pada 03 January 2022 - 16:26:56', 'UPDATED_RECORD_TYPE_DOCUMENT', '2022-01-03 09:26:56', NULL, 2),
(48, 'User Logout Sistem pada 03 January 2022 - 16:51:53', 'LOGOUT', '2022-01-03 09:51:53', NULL, 2),
(49, 'User Login Sistem pada 03 January 2022 - 16:52:00', 'LOGIN', '2022-01-03 09:52:00', NULL, 5),
(50, 'User Logout Sistem pada 03 January 2022 - 16:53:33', 'LOGOUT', '2022-01-03 09:53:33', NULL, 5),
(51, 'User Login Sistem pada 03 January 2022 - 16:53:46', 'LOGIN', '2022-01-03 09:53:46', NULL, 6),
(52, 'User Login Sistem pada 10 January 2022 - 14:52:06', 'LOGIN', '2022-01-10 07:52:06', NULL, 5),
(53, 'User Login Sistem pada 12 January 2022 - 11:14:56', 'LOGIN', '2022-01-12 04:14:56', NULL, 5),
(54, 'User Logout Sistem pada 12 January 2022 - 16:57:21', 'LOGOUT', '2022-01-12 09:57:21', NULL, 5),
(55, 'User Login Sistem pada 12 January 2022 - 16:57:33', 'LOGIN', '2022-01-12 09:57:33', NULL, 2),
(56, 'User Updated record Menu pada 12 January 2022 - 16:59:19', 'UPDATED_RECORD_MENU', '2022-01-12 09:59:19', NULL, 2),
(57, 'User Logout Sistem pada 12 January 2022 - 16:59:23', 'LOGOUT', '2022-01-12 09:59:23', NULL, 2),
(58, 'User Login Sistem pada 12 January 2022 - 16:59:28', 'LOGIN', '2022-01-12 09:59:28', NULL, 5),
(59, 'User Login Sistem pada 13 January 2022 - 09:24:49', 'LOGIN', '2022-01-13 02:24:49', NULL, 5),
(60, 'User Login Sistem pada 14 January 2022 - 09:26:29', 'LOGIN', '2022-01-14 02:26:29', NULL, 5),
(61, 'User Login Sistem pada 14 January 2022 - 09:44:46', 'LOGIN', '2022-01-14 02:44:46', NULL, 5),
(62, 'User Login Sistem pada 14 January 2022 - 15:14:34', 'LOGIN', '2022-01-14 08:14:34', NULL, 5),
(63, 'User Login Sistem pada 17 January 2022 - 09:26:25', 'LOGIN', '2022-01-17 02:26:25', NULL, 5),
(64, 'User Login Sistem pada 17 January 2022 - 13:15:41', 'LOGIN', '2022-01-17 06:15:41', NULL, 5),
(65, 'User Login Sistem pada 17 January 2022 - 13:16:13', 'LOGIN', '2022-01-17 06:16:13', NULL, 5),
(66, 'User Login Sistem pada 18 January 2022 - 09:58:12', 'LOGIN', '2022-01-18 02:58:12', NULL, 5),
(67, 'User Login Sistem pada 18 January 2022 - 13:28:19', 'LOGIN', '2022-01-18 06:28:19', NULL, 5),
(68, 'User Login Sistem pada 19 January 2022 - 09:29:33', 'LOGIN', '2022-01-19 02:29:33', NULL, 5),
(69, 'User Login Sistem pada 20 January 2022 - 13:39:00', 'LOGIN', '2022-01-20 06:39:00', NULL, 5),
(70, 'User Login Sistem pada 20 January 2022 - 13:40:13', 'LOGIN', '2022-01-20 06:40:13', NULL, 2),
(71, 'User Saved record Menu pada 20 January 2022 - 13:46:03', 'SAVED_RECORD_MENU', '2022-01-20 06:46:03', NULL, 2),
(72, 'User Updated record Roles pada 20 January 2022 - 13:46:58', 'UPDATED_RECORD_ROLES', '2022-01-20 06:46:58', NULL, 2),
(73, 'User Updated record Roles pada 20 January 2022 - 13:47:29', 'UPDATED_RECORD_ROLES', '2022-01-20 06:47:29', NULL, 2),
(74, 'User Login Sistem pada 20 January 2022 - 13:49:56', 'LOGIN', '2022-01-20 06:49:56', NULL, 2),
(75, 'User Login Sistem pada 20 January 2022 - 14:32:22', 'LOGIN', '2022-01-20 07:32:22', NULL, 2),
(76, 'User Updated record Menu pada 20 January 2022 - 14:32:39', 'UPDATED_RECORD_MENU', '2022-01-20 07:32:39', NULL, 2),
(77, 'User Login Sistem pada 21 January 2022 - 09:27:42', 'LOGIN', '2022-01-21 02:27:42', NULL, 5),
(78, 'User Login Sistem pada 21 January 2022 - 14:00:35', 'LOGIN', '2022-01-21 07:00:35', NULL, 5),
(79, 'User Login Sistem pada 24 January 2022 - 09:44:19', 'LOGIN', '2022-01-24 02:44:19', NULL, 5),
(80, 'User Login Sistem pada 24 January 2022 - 11:55:10', 'LOGIN', '2022-01-24 04:55:10', NULL, 5),
(81, 'User Login Sistem pada 24 January 2022 - 15:12:42', 'LOGIN', '2022-01-24 08:12:42', NULL, 5),
(82, 'User Login Sistem pada 24 January 2022 - 15:28:33', 'LOGIN', '2022-01-24 08:28:33', NULL, 2),
(83, 'User Login Sistem pada 25 January 2022 - 09:55:13', 'LOGIN', '2022-01-25 02:55:13', NULL, 5),
(84, 'User Login Sistem pada 26 January 2022 - 09:12:03', 'LOGIN', '2022-01-26 02:12:03', NULL, 5),
(85, 'User Login Sistem pada 27 January 2022 - 09:24:43', 'LOGIN', '2022-01-27 02:24:43', NULL, 2),
(86, 'User Saved record Menu pada 27 January 2022 - 09:40:40', 'SAVED_RECORD_MENU', '2022-01-27 02:40:40', NULL, 2),
(87, 'User Updated record Roles pada 27 January 2022 - 09:41:04', 'UPDATED_RECORD_ROLES', '2022-01-27 02:41:04', NULL, 2),
(88, 'User Logout Sistem pada 27 January 2022 - 09:41:07', 'LOGOUT', '2022-01-27 02:41:07', NULL, 2),
(89, 'User Login Sistem pada 27 January 2022 - 09:41:12', 'LOGIN', '2022-01-27 02:41:12', NULL, 5),
(90, 'User Login Sistem pada 27 January 2022 - 09:43:53', 'LOGIN', '2022-01-27 02:43:53', NULL, 2),
(91, 'User Updated record Menu pada 27 January 2022 - 09:44:12', 'UPDATED_RECORD_MENU', '2022-01-27 02:44:12', NULL, 2),
(92, 'User Logout Sistem pada 27 January 2022 - 13:22:49', 'LOGOUT', '2022-01-27 06:22:49', NULL, 5),
(93, 'User Login Sistem pada 27 January 2022 - 13:22:56', 'LOGIN', '2022-01-27 06:22:56', NULL, 5),
(94, 'User Login Sistem pada 02 February 2022 - 09:32:32', 'LOGIN', '2022-02-02 02:32:32', NULL, 5),
(95, 'User Login Sistem pada 02 February 2022 - 09:47:57', 'LOGIN', '2022-02-02 02:47:57', NULL, 2),
(96, 'User Updated record Menu pada 02 February 2022 - 09:49:20', 'UPDATED_RECORD_MENU', '2022-02-02 02:49:20', NULL, 2),
(97, 'User Login Sistem pada 02 February 2022 - 10:28:21', 'LOGIN', '2022-02-02 03:28:21', NULL, 2),
(98, 'User Saved record Type Document pada 02 February 2022 - 10:29:21', 'SAVED_RECORD_TYPE_DOCUMENT', '2022-02-02 03:29:21', NULL, 2),
(99, 'User Saved record Type Document pada 02 February 2022 - 10:30:30', 'SAVED_RECORD_TYPE_DOCUMENT', '2022-02-02 03:30:30', NULL, 2),
(100, 'User Login Sistem pada 02 February 2022 - 16:30:12', 'LOGIN', '2022-02-02 09:30:12', NULL, 2),
(101, 'User Updated record Roles pada 02 February 2022 - 16:32:00', 'UPDATED_RECORD_ROLES', '2022-02-02 09:32:00', NULL, 2),
(102, 'User Updated record Roles pada 02 February 2022 - 16:32:26', 'UPDATED_RECORD_ROLES', '2022-02-02 09:32:26', NULL, 2),
(103, 'User Saved record Menu pada 02 February 2022 - 16:37:48', 'SAVED_RECORD_MENU', '2022-02-02 09:37:48', NULL, 2),
(104, 'User Updated record Roles pada 02 February 2022 - 16:38:34', 'UPDATED_RECORD_ROLES', '2022-02-02 09:38:34', NULL, 2),
(105, 'User Login Sistem pada 02 February 2022 - 16:49:41', 'LOGIN', '2022-02-02 09:49:41', NULL, 2),
(106, 'User Deleted record Menu pada 02 February 2022 - 16:49:58', 'DELETED_RECORD_MENU', '2022-02-02 09:49:58', NULL, 2),
(107, 'User Updated record Roles pada 02 February 2022 - 16:54:02', 'UPDATED_RECORD_ROLES', '2022-02-02 09:54:02', NULL, 2),
(108, 'User Login Sistem pada 03 February 2022 - 11:50:08', 'LOGIN', '2022-02-03 04:50:08', NULL, 5),
(109, 'User Logout Sistem pada 03 February 2022 - 13:38:14', 'LOGOUT', '2022-02-03 06:38:14', NULL, 5),
(110, 'User Login Sistem pada 03 February 2022 - 13:38:20', 'LOGIN', '2022-02-03 06:38:20', NULL, 5),
(111, 'User Login Sistem pada 04 February 2022 - 15:24:08', 'LOGIN', '2022-02-04 08:24:08', NULL, 5),
(112, 'User Login Sistem pada 14 February 2022 - 10:45:46', 'LOGIN', '2022-02-14 03:45:46', NULL, 5),
(113, 'User Login Sistem pada 14 February 2022 - 14:09:18', 'LOGIN', '2022-02-14 07:09:18', NULL, 5),
(114, 'User Login Sistem pada 15 February 2022 - 09:11:12', 'LOGIN', '2022-02-15 02:11:12', NULL, 5),
(115, 'User Login Sistem pada 15 February 2022 - 13:35:35', 'LOGIN', '2022-02-15 06:35:35', NULL, 5),
(116, 'User Login Sistem pada 17 February 2022 - 09:14:11', 'LOGIN', '2022-02-17 02:14:11', NULL, 5),
(117, 'User Login Sistem pada 21 February 2022 - 11:55:13', 'LOGIN', '2022-02-21 04:55:13', NULL, 5),
(118, 'User Login Sistem pada 21 February 2022 - 15:00:00', 'LOGIN', '2022-02-21 08:00:00', NULL, 5),
(119, 'User Logout Sistem pada 21 February 2022 - 15:00:22', 'LOGOUT', '2022-02-21 08:00:22', NULL, 5),
(120, 'User Login Sistem pada 21 February 2022 - 15:01:12', 'LOGIN', '2022-02-21 08:01:12', NULL, 2),
(121, 'User Saved record Menu pada 21 February 2022 - 15:06:38', 'SAVED_RECORD_MENU', '2022-02-21 08:06:38', NULL, 2),
(122, 'User Updated record Roles pada 21 February 2022 - 15:07:15', 'UPDATED_RECORD_ROLES', '2022-02-21 08:07:15', NULL, 2),
(123, 'User Updated record Menu pada 21 February 2022 - 15:10:26', 'UPDATED_RECORD_MENU', '2022-02-21 08:10:26', NULL, 2),
(124, 'User Login Sistem pada 22 February 2022 - 09:35:19', 'LOGIN', '2022-02-22 02:35:19', NULL, 5),
(125, 'User Login Sistem pada 22 February 2022 - 14:17:06', 'LOGIN', '2022-02-22 07:17:06', NULL, 5),
(126, 'User Login Sistem pada 22 February 2022 - 14:43:16', 'LOGIN', '2022-02-22 07:43:16', NULL, 2),
(127, 'User Saved record Roles pada 22 February 2022 - 14:45:24', 'SAVED_RECORD_ROLES', '2022-02-22 07:45:24', NULL, 2),
(128, 'User Saved record Users pada 22 February 2022 - 14:47:00', 'SAVED_RECORD_USERS', '2022-02-22 07:47:00', NULL, 2),
(129, 'User Login Sistem pada 23 February 2022 - 10:29:46', 'LOGIN', '2022-02-23 03:29:46', NULL, 5),
(130, 'User Login Sistem pada 23 February 2022 - 14:26:47', 'LOGIN', '2022-02-23 07:26:47', NULL, 2),
(131, 'User Updated record Roles pada 23 February 2022 - 14:27:36', 'UPDATED_RECORD_ROLES', '2022-02-23 07:27:36', NULL, 2),
(132, 'User Login Sistem pada 23 February 2022 - 16:25:11', 'LOGIN', '2022-02-23 09:25:11', NULL, 10),
(133, 'User Logout Sistem pada 23 February 2022 - 16:27:43', 'LOGOUT', '2022-02-23 09:27:43', NULL, 10),
(134, 'User Login Sistem pada 23 February 2022 - 16:28:08', 'LOGIN', '2022-02-23 09:28:08', NULL, 2),
(135, 'User Updated record Users pada 23 February 2022 - 16:28:24', 'UPDATED_RECORD_USERS', '2022-02-23 09:28:24', NULL, 2),
(136, 'User Logout Sistem pada 23 February 2022 - 16:28:27', 'LOGOUT', '2022-02-23 09:28:27', NULL, 2),
(137, 'User Login Sistem pada 23 February 2022 - 16:28:34', 'LOGIN', '2022-02-23 09:28:34', NULL, 6),
(138, 'User Logout Sistem pada 23 February 2022 - 16:29:01', 'LOGOUT', '2022-02-23 09:29:01', NULL, 6),
(139, 'User Login Sistem pada 24 February 2022 - 09:29:41', 'LOGIN', '2022-02-24 02:29:41', NULL, 5),
(140, 'User Login Sistem pada 24 February 2022 - 10:49:01', 'LOGIN', '2022-02-24 03:49:01', NULL, 5),
(141, 'User Logout Sistem pada 24 February 2022 - 10:49:18', 'LOGOUT', '2022-02-24 03:49:18', NULL, 5),
(142, 'User Login Sistem pada 24 February 2022 - 10:49:27', 'LOGIN', '2022-02-24 03:49:27', NULL, 10),
(143, 'User Logout Sistem pada 24 February 2022 - 10:50:08', 'LOGOUT', '2022-02-24 03:50:08', NULL, 10),
(144, 'User Login Sistem pada 24 February 2022 - 13:49:34', 'LOGIN', '2022-02-24 06:49:34', NULL, 5),
(145, 'User Login Sistem pada 24 February 2022 - 13:50:06', 'LOGIN', '2022-02-24 06:50:06', NULL, 6),
(146, 'User Login Sistem pada 25 February 2022 - 09:32:34', 'LOGIN', '2022-02-25 02:32:34', NULL, 5),
(147, 'User Login Sistem pada 25 February 2022 - 13:55:24', 'LOGIN', '2022-02-25 06:55:24', NULL, 5),
(148, 'User Login Sistem pada 25 February 2022 - 14:55:56', 'LOGIN', '2022-02-25 07:55:56', NULL, 2),
(149, 'User Updated record Menu pada 25 February 2022 - 14:56:53', 'UPDATED_RECORD_MENU', '2022-02-25 07:56:53', NULL, 2),
(150, 'User Updated record Menu pada 25 February 2022 - 14:57:08', 'UPDATED_RECORD_MENU', '2022-02-25 07:57:08', NULL, 2),
(151, 'User Login Sistem pada 01 March 2022 - 11:08:25', 'LOGIN', '2022-03-01 04:08:25', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `procurement_key_upload`
--

CREATE TABLE `procurement_key_upload` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `status_approved` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user_upload` bigint(20) UNSIGNED NOT NULL,
  `id_sifat_proses` bigint(20) UNSIGNED NOT NULL,
  `id_perusahaan` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_key_upload`
--

INSERT INTO `procurement_key_upload` (`id`, `kode`, `title`, `tanggal`, `status_approved`, `deskripsi`, `created_at`, `updated_at`, `id_user_upload`, `id_sifat_proses`, `id_perusahaan`) VALUES
(17, '483579', 'GO', '2022-01-03', '0', 'AZZZZ', '2022-01-03 04:35:35', NULL, 5, 7, 2);

--
-- Triggers `procurement_key_upload`
--
DELIMITER $$
CREATE TRIGGER `deleteKeyUploaded` BEFORE DELETE ON `procurement_key_upload` FOR EACH ROW BEGIN
	DELETE FROM `procurement_upload_document` WHERE id_key_upload = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `procurement_notif_action`
--

CREATE TABLE `procurement_notif_action` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notif_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notif_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_notif` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_upload_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_notif_action`
--

INSERT INTO `procurement_notif_action` (`id`, `notif_title`, `notif_desc`, `icon_notif`, `key_upload_link`, `id_user`, `created_at`, `updated_at`) VALUES
(9, 'Upload Document', 'Pembuatan record Document yang harus di Approved. Create by Diwan Permantara', 'bx bxs-file-plus', '483579', 5, '2022-01-03 04:35:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `procurement_sifat_proses`
--

CREATE TABLE `procurement_sifat_proses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sifat_proses` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_sifat_proses`
--

INSERT INTO `procurement_sifat_proses` (`id`, `sifat_proses`, `label_color`, `created_at`, `updated_at`) VALUES
(6, 'Very High', 'danger', '2021-12-14 01:42:30', '2021-12-27 09:50:22'),
(7, 'High', 'warning', '2021-12-14 01:42:37', '2021-12-27 09:50:16'),
(8, 'Medium', 'primary', '2021-12-14 01:42:45', '2021-12-27 09:50:33'),
(9, 'Low', 'info', '2021-12-14 01:42:52', '2021-12-27 09:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `procurement_tipe_document`
--

CREATE TABLE `procurement_tipe_document` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipe_document` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_tipe` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_tipe_document`
--

INSERT INTO `procurement_tipe_document` (`id`, `tipe_document`, `nama_tipe`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'PO', 'Purchase Order', 'Purchase Order di peruntukan untuk pembelian barang dari GA', '2021-12-13 20:56:33', NULL),
(2, 'SPR', 'Surat Penawaran', 'Surat Penawaran di keluarkan oleh Sales/GA/Procurement untuk costumer/client', '2021-12-13 20:56:45', '2022-01-03 09:26:44'),
(4, 'SPK', NULL, 'Surat Perintah Kerja di keluarkan oleh Project Director terkait dengan pekerjaan project yang akan berjalan', '2021-12-13 20:58:34', NULL),
(5, 'SP', 'Surat Pemberitahuan', 'Surat Pemberitahuan di keluarkan oleh divisi yang akan mengumumkan informasi tertentu', '2021-12-13 20:58:46', '2022-01-03 09:26:56'),
(6, 'BAST', NULL, 'Berita Acara Serah Terima di keluarkan oleh Project Director terkait penyelesaian pekerjaan project', '2021-12-13 21:02:31', NULL),
(7, 'FRS', NULL, 'Form Request Sales di keluarkan oleh sales untuk permintaan pelanggan baru.', '2021-12-13 21:02:43', NULL),
(8, 'SJ', NULL, 'Surat Jalan di keluarkan oleh GA / Inventory terkait barang keluar', '2021-12-13 21:02:52', NULL),
(9, 'DO', NULL, 'Delivery Order di keluarkan oleh GA/Inventory terkait penerimaan barang dari pelanggan', '2021-12-13 21:03:09', NULL),
(10, 'SK', 'Surat Kuasa', 'Surat Kuasa dikeluarkan oleh divisi apabila ada pekerjaan yang tidak dapat di hadiri', '2021-12-13 21:03:20', '2022-01-03 09:26:20'),
(11, 'SU', 'Surat Undangan', 'Surat Undangan di keluarkan oleh divisi apabila ada undangan meeting,undangan pertemuan dll.', '2021-12-13 21:03:36', '2022-01-03 09:26:09'),
(12, 'RFP', 'Request Form Purchase', 'Request Form Purchase', '2022-02-02 03:29:21', NULL),
(13, 'RFC', 'Request Form Cash', 'Request Form Cash', '2022-02-02 03:30:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `procurement_upload_document`
--

CREATE TABLE `procurement_upload_document` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filedocument` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_key_upload` bigint(20) UNSIGNED NOT NULL,
  `id_tipe_document` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_upload_document`
--

INSERT INTO `procurement_upload_document` (`id`, `filedocument`, `created_at`, `updated_at`, `id_key_upload`, `id_tipe_document`) VALUES
(12, 'Invoice-jagoweb-hosting.pdf', '2022-01-03 04:35:35', NULL, 17, 7),
(13, 'Draf_RFP_Server_Hosting_Ajnusa1.pdf', '2022-01-03 04:35:35', NULL, 17, 11);

--
-- Triggers `procurement_upload_document`
--
DELIMITER $$
CREATE TRIGGER `deleteUploadedDocument` BEFORE DELETE ON `procurement_upload_document` FOR EACH ROW BEGIN
	DELETE FROM procurement_approved_document WHERE id_upload_document = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `proc_approved`
--

CREATE TABLE `proc_approved` (
  `id` int(11) NOT NULL,
  `purchase_id` int(10) UNSIGNED DEFAULT NULL,
  `rfc_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `checked_title` varchar(150) NOT NULL,
  `status_approved` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `description` varchar(150) DEFAULT NULL,
  `ordered` tinyint(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proc_approved`
--

INSERT INTO `proc_approved` (`id`, `purchase_id`, `rfc_id`, `user_id`, `checked_title`, `status_approved`, `description`, `ordered`, `created_at`, `updated_at`) VALUES
(5, 4, NULL, 5, 'PREPARED BY', 1, 'First Approved', 1, '2022-02-23 11:33:20', NULL),
(6, 4, NULL, 10, 'CHECKED BY', 1, 'Second Approved', 2, '2022-02-23 11:33:20', NULL),
(7, 4, NULL, 6, 'APPROVED BY', 1, 'Approve one', 3, '2022-02-23 11:33:20', NULL),
(8, 4, NULL, 9, 'ACKNOWLEDGE BY', 0, NULL, 4, '2022-02-23 11:33:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `proc_project`
--

CREATE TABLE `proc_project` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` varchar(150) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `project_name` varchar(150) NOT NULL,
  `slug_name` varchar(150) NOT NULL,
  `dated` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `agreement` varchar(255) DEFAULT NULL,
  `termin` int(10) UNSIGNED DEFAULT NULL,
  `doc_support` longtext DEFAULT NULL,
  `status_project` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proc_project`
--

INSERT INTO `proc_project` (`id`, `project_id`, `user_id`, `project_name`, `slug_name`, `dated`, `description`, `agreement`, `termin`, `doc_support`, `status_project`, `created_at`, `updated_at`) VALUES
(7, NULL, 5, 'Lorem Ipsume', 'lorem-ipsume', '2022-02-03', 'Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It h', 'Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It h', NULL, 'DigitalOcean_Invoice_2021_Dec_(4691827-432775601)5.pdf', 0, '2022-02-03 13:40:24', NULL),
(8, NULL, 5, 'Loream Ipsume 123', 'loream-ipsume-123', '2022-02-14', '<b>Lorem Ipsum</b>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen boo', '-', NULL, NULL, 0, '2022-02-14 10:48:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `proc_purchase`
--

CREATE TABLE `proc_purchase` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_no` varchar(35) NOT NULL,
  `title_name` varchar(100) NOT NULL,
  `slug_name` varchar(100) NOT NULL,
  `purchase_date` date NOT NULL,
  `reference` varchar(35) DEFAULT NULL,
  `terms_conditions` varchar(255) NOT NULL,
  `sub_total` bigint(20) NOT NULL,
  `ppn` tinyint(4) NOT NULL,
  `discount` tinyint(4) NOT NULL,
  `grand_total` bigint(20) NOT NULL,
  `sisa_gtotal` double DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `total_text` varchar(255) NOT NULL,
  `date_required` datetime NOT NULL,
  `delivery_to` varchar(255) DEFAULT NULL,
  `status_apporved` tinyint(4) NOT NULL DEFAULT 0,
  `doc_support` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proc_purchase`
--

INSERT INTO `proc_purchase` (`id`, `project_id`, `supplier_id`, `company_id`, `type_id`, `user_id`, `purchase_no`, `title_name`, `slug_name`, `purchase_date`, `reference`, `terms_conditions`, `sub_total`, `ppn`, `discount`, `grand_total`, `sisa_gtotal`, `description`, `total_text`, `date_required`, `delivery_to`, `status_apporved`, `doc_support`, `created_at`, `updated_at`) VALUES
(4, 8, 1, 2, 1, 5, '001/PROC-PO/02/2022', 'PURCHASE ORDER for MONOPOLE ANTENNA 1.2 m', '001-purchase-order-for-monopole-antenna-1.2-m', '2022-02-23', 'SPH PT. Citra Sahabat Nusantara ', 'Harga adalah Full Amount\r\n<br>Payment Terms <br>*) 30 % , Down Payment sebelum delivery.\r\n<br>&nbsp;*) 70 % setelah barang di terima di kantor cakung\r\n<br>Sudah termasuk pengiriman', 16000, 0, 0, 16000, 16000, NULL, 'Enam Belas Ribu Rupiah', '2022-02-26 00:00:00', 'Artacom', 0, 'uploaded/po/Diagram_Telkomsel_IOT.pdf', '2022-02-23 11:33:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `proc_purchase_unit`
--

CREATE TABLE `proc_purchase_unit` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `rfc_id` int(11) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `item_desc` varchar(100) NOT NULL,
  `qty` tinyint(4) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `unit_price` bigint(20) NOT NULL,
  `total_price` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proc_purchase_unit`
--

INSERT INTO `proc_purchase_unit` (`id`, `purchase_id`, `rfc_id`, `unit_id`, `item_desc`, `qty`, `keterangan`, `unit_price`, `total_price`, `created_at`) VALUES
(3, 4, NULL, 3, 'item 1', 2, 'abc', 3000, 6000, '2022-02-23 11:33:20'),
(4, 4, NULL, 3, 'item 2', 2, 'cde', 5000, 10000, '2022-02-23 11:33:20');

-- --------------------------------------------------------

--
-- Table structure for table `proc_rfc`
--

CREATE TABLE `proc_rfc` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `rfc_no` varchar(35) NOT NULL,
  `title_name` varchar(100) NOT NULL,
  `slug_name` varchar(100) NOT NULL,
  `rfc_date` date NOT NULL,
  `ref_invoice` varchar(35) NOT NULL,
  `terms_conditions` varchar(255) NOT NULL,
  `sub_total` bigint(20) NOT NULL,
  `ppn` tinyint(4) NOT NULL,
  `discount` tinyint(4) NOT NULL,
  `grand_total` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `total_text` varchar(255) NOT NULL,
  `date_required` datetime NOT NULL,
  `status_apporved` tinyint(4) NOT NULL DEFAULT 0,
  `doc_support` varchar(255) NOT NULL,
  `percentage_payment` tinyint(4) NOT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `support_payment` varchar(100) DEFAULT NULL,
  `status_type_rfc` varchar(35) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `proc_rfp_request`
--

CREATE TABLE `proc_rfp_request` (
  `id` int(11) NOT NULL,
  `purchase_id` int(10) UNSIGNED NOT NULL,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `item_desc` varchar(100) NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `proc_supplier`
--

CREATE TABLE `proc_supplier` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `jenis_supplier` varchar(25) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `atas_nama` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proc_supplier`
--

INSERT INTO `proc_supplier` (`id`, `kode`, `nama_supplier`, `jenis_supplier`, `alamat`, `no_telp`, `atas_nama`, `created_at`, `updated_at`) VALUES
(1, '5031276', 'PT. CITRA SAHABAT NUSANTARA', 'Perusahaan', 'Jalan Caman Raya No. 30 , Jati Bening , Bekasi 17412', '6281213016222', 'Pak Sutomo', '2022-02-22 09:44:02', '2022-02-22 09:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `proc_unit_type`
--

CREATE TABLE `proc_unit_type` (
  `id` int(11) NOT NULL,
  `unit_type` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proc_unit_type`
--

INSERT INTO `proc_unit_type` (`id`, `unit_type`, `created_at`, `updated_at`) VALUES
(1, 'SET', '2022-02-02 10:22:59', NULL),
(2, 'SITES', '2022-02-02 10:22:59', NULL),
(3, 'PCS', '2022-02-02 10:23:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `code`, `roles`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'Super Admin', NULL, NULL),
(8, 'administrator-procurement', 'Administrator Procurement', NULL, NULL),
(9, 'administrator-finance', 'Administrator Finance', '2021-12-09 17:00:00', NULL),
(10, 'management', 'Management', '2021-12-13 17:00:00', NULL),
(11, 'administrator-operasional', 'Administrator Operasional', '2022-02-21 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secretkey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_roles` bigint(20) UNSIGNED NOT NULL,
  `id_divisi` bigint(20) UNSIGNED NOT NULL,
  `signof` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `secretkey`, `avatar`, `is_active`, `remember_token`, `created_at`, `updated_at`, `id_roles`, `id_divisi`, `signof`) VALUES
(2, 'Super User Admin IT', 'superuseradmin', '$2y$10$2qGxoxbQugGcuuuiJ/ehUeaXK4iwoatwuODxb4B/6LyAXbKQaamp2', 'd0dcdc196dad7e1cda515b64dfe58fb27e7365ef', 'avatar-superuser.png', 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpcCI6Ijo6MSIsImtleSI6IjM4YWQxYjZiZjZhZjRmNTA0MmU3ODhjYjhjMGU0NTFkNGI4ZjBhZjgiLCJpc3MiOiI6OjEiLCJpYXQiOjE2NDI2N', NULL, NULL, 1, 1, 'signof/dummy.png'),
(3, 'Farhan Aldiansyah', 'farhanaldi', '$2y$10$zVNNANYHfYTUjuaDSnIpJebkL2oL5PM0yGg0uGp/9qpJw32QLDbgi', '4af308d2677a9c49cc5b9a10a640b232b0b3f700', 'avatar_farhan_aldiansyah.jpg', 1, NULL, '2021-12-09 21:20:18', '2021-12-10 01:40:36', 1, 1, 'signof/dummy.png'),
(4, 'R.M.Fachri.A', 'fachri', '$2y$10$qZxG.5d1D.mtvrHeb5.VD.3.m6Fx0GwctSgbqYzYdENTUOtVaPW5.', '47ca7d6acb7e200bf14373713bfd5b3d5dadaf21', 'avatar_fachri.jpg', 1, NULL, '2021-12-10 00:35:34', '2021-12-13 21:42:59', 9, 2, 'signof/dummy.png'),
(5, 'Diwan Permantara', 'diwan', '$2y$10$ld1zZafjZnA5wX6t5RtkgOhxyyzVXp3dUW05MqKhzrRgWyaiSdAKe', 'd31bca8a606fd48f1a849597c9546ef6758057ce', 'avatar_diwan.png', 1, NULL, '2021-12-12 22:50:07', '2021-12-26 20:22:16', 8, 3, 'signof/dummy.png'),
(6, 'Mr.Yulhan', 'yulhan', '$2y$10$QcyVoLFklrTo7liIoSFwI.o2Lvn590Ud/Vd6ziakMYqeLTPr6MoN6', 'e7035138d3f4bd4323cbfec6a021081f89e2d305', 'avatar_mryulhan.jpg', 1, NULL, '2021-12-13 21:37:35', '2022-02-23 09:28:24', 10, 7, 'signof/dummy.png'),
(7, 'Eva Junita', 'eva.junita', '$2y$10$zzZVJlOw/K.ka/aCUgxlxekcUVgXmW6lX2vHHq3LgVJ8dKQ4NruDe', '16df4e08ae2137a21790966f184d2b0ea866153e', 'avatar_eva_junita.png', 1, NULL, '2021-12-13 21:38:12', '2021-12-29 03:11:19', 10, 7, 'signof/dummy.png'),
(8, 'Nazirin Nawawi', 'nazirin.nawawi', '$2y$10$A/PUbr2CYm1YeZ/w40/Uc.l0NleARsxxQfZBEJL/HSH6yMasxQSoa', '78a81df51001dfdbb769c926eea59740baf86408', 'avatar_nazirin_nawawi.png', 1, NULL, '2021-12-13 21:44:27', NULL, 9, 2, 'signof/dummy.png'),
(9, 'E. Haris Ambiyana Sidiq', 'haris_sidik', '$2y$10$iP0K.OAYL0WEwDYoSp1b..C5nlzkLULk6.JnZ70PUVKIZQgza26uy', '6d4bdd96dbc6216acd269020393204ac56ae205a', 'avatar_e_haris_ambiyana_sidiq.png', 1, NULL, '2021-12-13 21:45:29', '2021-12-28 07:07:35', 9, 2, 'signof/dummy.png'),
(10, 'Inten Kuniawan', 'inten.k', '$2y$10$t7Ki1lzRVAF/r0qDsTvx5umIqVbgo5ON/xg5Ho60aOdMsGXFcVm/6', '5b56a75bf58b3f6d1ca3b2bcf5955c9d93f0da5d', 'avatar_inten_kuniawan.png', 1, NULL, '2022-02-22 07:47:00', NULL, 11, 5, 'signof/dummy.png');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_approve`
-- (See below for the actual view)
--
CREATE TABLE `v_approve` (
`id` int(11)
,`purchase_id` int(10) unsigned
,`rfc_id` int(10) unsigned
,`user_id` int(10) unsigned
,`name` varchar(255)
,`username` varchar(30)
,`divisi` varchar(50)
,`is_active` int(10) unsigned
,`signof` varchar(100)
,`checked_title` varchar(150)
,`status_approved` tinyint(3) unsigned
,`description` varchar(150)
,`ordered` tinyint(3) unsigned
,`created_at` datetime
,`updated_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_approved_document`
-- (See below for the actual view)
--
CREATE TABLE `v_approved_document` (
`id` bigint(20) unsigned
,`id_upload_document` bigint(20) unsigned
,`filedocument` varchar(255)
,`id_key_upload` bigint(20) unsigned
,`id_tipe_document` bigint(20) unsigned
,`tipe_document` varchar(30)
,`status_approved` tinyint(3) unsigned
,`deskripsi_text` varchar(255)
,`ordered` tinyint(3) unsigned
,`id_user` bigint(20) unsigned
,`name` varchar(255)
,`id_roles` bigint(20) unsigned
,`code` varchar(50)
,`roles` varchar(50)
,`id_divisi` bigint(20) unsigned
,`divisi` varchar(50)
,`is_active` int(10) unsigned
,`avatar` varchar(255)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_approved_history`
-- (See below for the actual view)
--
CREATE TABLE `v_approved_history` (
`id_approved_history` bigint(20)
,`slug` varchar(100)
,`id_barang_proses` bigint(20)
,`id_kategori_proses` bigint(20)
,`no_proses` int(10)
,`tgl_proses_barang` datetime
,`id_user` bigint(20)
,`name` varchar(255)
,`status_approved` varchar(10)
,`time_approved` datetime
,`keterangan` varchar(20)
,`create_at` datetime
,`update_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_barang`
-- (See below for the actual view)
--
CREATE TABLE `v_barang` (
`id_barang` bigint(20)
,`slug` varchar(100)
,`kode_barang` char(20)
,`nama_barang` varchar(50)
,`id_jenis` bigint(20)
,`jenis_barang` varchar(20)
,`keterangan` varchar(100)
,`id_satuan` bigint(20)
,`satuan_barang` varchar(10)
,`overall_stok` int(5)
,`create_at` datetime
,`update_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_barang_proses`
-- (See below for the actual view)
--
CREATE TABLE `v_barang_proses` (
`id_barang_proses` bigint(20)
,`slug` varchar(100)
,`id_kategori_proses` bigint(20)
,`kategori_proses` varchar(10)
,`no_proses` int(10)
,`tgl_proses_barang` datetime
,`id_user` bigint(20)
,`name` varchar(255)
,`keterangan` varchar(20)
,`create_at` datetime
,`update_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_detail_barang`
-- (See below for the actual view)
--
CREATE TABLE `v_detail_barang` (
`id_detail_barang` bigint(20)
,`slug` varchar(100)
,`id_barang` bigint(20)
,`kode_barang` char(20)
,`nama_barang` varchar(50)
,`id_jenis` bigint(20)
,`id_satuan` bigint(20)
,`overall_stok` int(5)
,`serial_number` varchar(20)
,`stok` int(5)
,`id_status` bigint(20)
,`status_barang` varchar(20)
,`id_type` bigint(20)
,`type_barang` varchar(10)
,`keterangan` varchar(100)
,`create_at` datetime
,`update_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_detail_barang_proses`
-- (See below for the actual view)
--
CREATE TABLE `v_detail_barang_proses` (
`id_detail_barang_proses` bigint(20)
,`slug` varchar(100)
,`id_barang_proses` bigint(20)
,`id_kategori_proses` bigint(20)
,`no_proses` int(10)
,`tgl_proses_barang` datetime
,`id_user` bigint(20)
,`id_detail_barang` bigint(20)
,`id_barang` bigint(20)
,`serial_number` varchar(20)
,`stok` int(5)
,`id_status` bigint(20)
,`id_type` bigint(20)
,`jml_barang` int(5)
,`keterangan` varchar(20)
,`create_at` datetime
,`update_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_key_uploaded`
-- (See below for the actual view)
--
CREATE TABLE `v_key_uploaded` (
`id` bigint(20) unsigned
,`kode` char(6)
,`title` varchar(255)
,`tanggal` date
,`status_approved` enum('0','1')
,`deskripsi` varchar(255)
,`id_user_upload` bigint(20) unsigned
,`name` varchar(255)
,`username` varchar(30)
,`id_roles` bigint(20) unsigned
,`kode_roles` varchar(50)
,`roles` varchar(50)
,`id_divisi` bigint(20) unsigned
,`divisi` varchar(50)
,`id_sifat_proses` bigint(20) unsigned
,`sifat_proses` varchar(30)
,`label_color` varchar(50)
,`id_perusahaan` bigint(20) unsigned
,`kode_perusahaan` varchar(5)
,`perusahaan` varchar(50)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_penerima`
-- (See below for the actual view)
--
CREATE TABLE `v_penerima` (
`id_penerima` bigint(20)
,`slug` varchar(100)
,`id_barang_proses` bigint(20)
,`id_kategori_proses` bigint(20)
,`no_proses` int(10)
,`tgl_proses_barang` datetime
,`id_user` bigint(20)
,`id_perusahaan` bigint(20)
,`perusahaan` varchar(50)
,`alamat` varchar(255)
,`logo` varchar(100)
,`nama_penerima` varchar(30)
,`alamat_penerima` varchar(100)
,`no_telp` varchar(14)
,`create_at` datetime
,`update_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_project`
-- (See below for the actual view)
--
CREATE TABLE `v_project` (
`id` int(10) unsigned
,`project_id` varchar(150)
,`user_id` int(11)
,`name` varchar(255)
,`username` varchar(30)
,`divisi` varchar(50)
,`project_name` varchar(150)
,`slug_name` varchar(150)
,`dated` date
,`description` varchar(255)
,`agreement` varchar(255)
,`termin` int(10) unsigned
,`doc_support` longtext
,`status_project` tinyint(3) unsigned
,`created_at` datetime
,`updated_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase` (
`id` int(11)
,`id_project` int(10) unsigned
,`project_name` varchar(150)
,`supplier_id` int(11)
,`kode_supplier` varchar(10)
,`nama_supplier` varchar(50)
,`atas_nama` varchar(50)
,`company_id` int(11)
,`perusahaan` varchar(50)
,`kode_perusahaan` varchar(5)
,`alamat_perusahaan` varchar(255)
,`notelp_perusahaan` varchar(15)
,`logo` varchar(100)
,`type_id` int(11)
,`tipe_document` varchar(30)
,`nama_tipe` varchar(60)
,`user_id` int(11)
,`name` varchar(255)
,`username` varchar(30)
,`purchase_no` varchar(35)
,`title_name` varchar(100)
,`slug_name` varchar(100)
,`purchase_date` date
,`reference` varchar(35)
,`terms_conditions` varchar(255)
,`sub_total` bigint(20)
,`ppn` tinyint(4)
,`discount` tinyint(4)
,`grand_total` bigint(20)
,`sisa_gtotal` double
,`description` varchar(255)
,`total_text` varchar(255)
,`date_required` datetime
,`delivery_to` varchar(255)
,`status_apporved` tinyint(4)
,`doc_support` varchar(255)
,`created_at` datetime
,`updated_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rfc`
-- (See below for the actual view)
--
CREATE TABLE `v_rfc` (
`id` int(11)
,`purchase_id` int(11)
,`purchase_name` varchar(100)
,`slug_purchase` varchar(100)
,`nama_supplier` varchar(50)
,`atas_nama` varchar(50)
,`perusahaan` varchar(50)
,`alamat_perusahaan` varchar(255)
,`notelp_perusahaan` varchar(15)
,`logo` varchar(100)
,`tipe_document` varchar(30)
,`nama_tipe` varchar(60)
,`user_id` int(11)
,`name` varchar(255)
,`roles` varchar(50)
,`divisi` varchar(50)
,`rfc_no` varchar(35)
,`title_name` varchar(100)
,`slug_name` varchar(100)
,`rfc_date` date
,`ref_invoice` varchar(35)
,`terms_conditions` varchar(255)
,`sub_total` bigint(20)
,`ppn` tinyint(4)
,`discount` tinyint(4)
,`grand_total` bigint(20)
,`description` varchar(255)
,`total_text` varchar(255)
,`date_required` datetime
,`status_apporved` tinyint(4)
,`doc_support` varchar(255)
,`percentage_payment` tinyint(4)
,`payment_status` tinyint(4)
,`support_payment` varchar(100)
,`status_type_rfc` varchar(35)
,`created_at` datetime
,`updated_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_unit_purchase`
-- (See below for the actual view)
--
CREATE TABLE `v_unit_purchase` (
`id` int(11)
,`purchase_id` int(11)
,`rfc_id` int(11)
,`unit_id` int(11)
,`unit_type` varchar(25)
,`item_desc` varchar(100)
,`qty` tinyint(4)
,`keterangan` varchar(255)
,`unit_price` bigint(20)
,`total_price` bigint(20)
,`created_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_uploaded_document`
-- (See below for the actual view)
--
CREATE TABLE `v_uploaded_document` (
`id` bigint(20) unsigned
,`filedocument` varchar(255)
,`id_key_upload` bigint(20) unsigned
,`id_tipe_document` bigint(20) unsigned
,`tipe_document` varchar(30)
,`deskripsi` varchar(255)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_users`
-- (See below for the actual view)
--
CREATE TABLE `v_users` (
`id` bigint(20) unsigned
,`name` varchar(255)
,`username` varchar(30)
,`password` varchar(255)
,`secretkey` varchar(255)
,`id_roles` bigint(20) unsigned
,`code` varchar(50)
,`roles` varchar(50)
,`id_divisi` bigint(20) unsigned
,`divisi` varchar(50)
,`avatar` varchar(255)
,`is_active` int(10) unsigned
,`remember_token` varchar(150)
,`signof` varchar(100)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Structure for view `v_approve`
--
DROP TABLE IF EXISTS `v_approve`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_approve`  AS SELECT `a`.`id` AS `id`, `a`.`purchase_id` AS `purchase_id`, `a`.`rfc_id` AS `rfc_id`, `a`.`user_id` AS `user_id`, `u`.`name` AS `name`, `u`.`username` AS `username`, `u`.`divisi` AS `divisi`, `u`.`is_active` AS `is_active`, `u`.`signof` AS `signof`, `a`.`checked_title` AS `checked_title`, `a`.`status_approved` AS `status_approved`, `a`.`description` AS `description`, `a`.`ordered` AS `ordered`, `a`.`created_at` AS `created_at`, `a`.`updated_at` AS `updated_at` FROM (`proc_approved` `a` join `v_users` `u` on(`a`.`user_id` = `u`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_approved_document`
--
DROP TABLE IF EXISTS `v_approved_document`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_approved_document`  AS SELECT `a`.`id` AS `id`, `a`.`id_upload_document` AS `id_upload_document`, `u`.`filedocument` AS `filedocument`, `u`.`id_key_upload` AS `id_key_upload`, `u`.`id_tipe_document` AS `id_tipe_document`, `u`.`tipe_document` AS `tipe_document`, `a`.`status_approved` AS `status_approved`, `a`.`deskripsi_text` AS `deskripsi_text`, `a`.`ordered` AS `ordered`, `a`.`id_user` AS `id_user`, `us`.`name` AS `name`, `us`.`id_roles` AS `id_roles`, `us`.`code` AS `code`, `us`.`roles` AS `roles`, `us`.`id_divisi` AS `id_divisi`, `us`.`divisi` AS `divisi`, `us`.`is_active` AS `is_active`, `us`.`avatar` AS `avatar`, `a`.`created_at` AS `created_at`, `a`.`updated_at` AS `updated_at` FROM ((`procurement_approved_document` `a` join `v_uploaded_document` `u` on(`a`.`id_upload_document` = `u`.`id`)) left join `v_users` `us` on(`a`.`id_user` = `us`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_approved_history`
--
DROP TABLE IF EXISTS `v_approved_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_approved_history`  AS SELECT `ah`.`id_approved_history` AS `id_approved_history`, `ah`.`slug` AS `slug`, `ah`.`id_barang_proses` AS `id_barang_proses`, `bp`.`id_kategori_proses` AS `id_kategori_proses`, `bp`.`no_proses` AS `no_proses`, `bp`.`tgl_proses_barang` AS `tgl_proses_barang`, `ah`.`id_user` AS `id_user`, `u`.`name` AS `name`, `ah`.`status_approved` AS `status_approved`, `ah`.`time_approved` AS `time_approved`, `ah`.`keterangan` AS `keterangan`, `ah`.`create_at` AS `create_at`, `ah`.`update_at` AS `update_at` FROM ((`inv_approved_history` `ah` join `inv_barang_proses` `bp` on(`ah`.`id_barang_proses` = `bp`.`id_barang_proses`)) join `users` `u` on(`ah`.`id_user` = `u`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_barang`
--
DROP TABLE IF EXISTS `v_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_barang`  AS SELECT `b`.`id_barang` AS `id_barang`, `b`.`slug` AS `slug`, `b`.`kode_barang` AS `kode_barang`, `b`.`nama_barang` AS `nama_barang`, `b`.`id_jenis` AS `id_jenis`, `j`.`jenis_barang` AS `jenis_barang`, `j`.`keterangan` AS `keterangan`, `b`.`id_satuan` AS `id_satuan`, `s`.`satuan_barang` AS `satuan_barang`, `b`.`overall_stok` AS `overall_stok`, `b`.`create_at` AS `create_at`, `b`.`update_at` AS `update_at` FROM ((`inv_barang` `b` join `inv_jenis_barang` `j` on(`b`.`id_jenis` = `j`.`id_jenis`)) join `inv_satuan_barang` `s` on(`b`.`id_satuan` = `s`.`id_satuan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_barang_proses`
--
DROP TABLE IF EXISTS `v_barang_proses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_barang_proses`  AS SELECT `bp`.`id_barang_proses` AS `id_barang_proses`, `bp`.`slug` AS `slug`, `bp`.`id_kategori_proses` AS `id_kategori_proses`, `kp`.`kategori_proses` AS `kategori_proses`, `bp`.`no_proses` AS `no_proses`, `bp`.`tgl_proses_barang` AS `tgl_proses_barang`, `bp`.`id_user` AS `id_user`, `u`.`name` AS `name`, `bp`.`keterangan` AS `keterangan`, `bp`.`create_at` AS `create_at`, `bp`.`update_at` AS `update_at` FROM ((`inv_barang_proses` `bp` join `inv_kategori_proses` `kp` on(`bp`.`id_kategori_proses` = `kp`.`id_kategori_proses`)) join `users` `u` on(`bp`.`id_user` = `u`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_detail_barang`
--
DROP TABLE IF EXISTS `v_detail_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detail_barang`  AS SELECT `db`.`id_detail_barang` AS `id_detail_barang`, `db`.`slug` AS `slug`, `db`.`id_barang` AS `id_barang`, `b`.`kode_barang` AS `kode_barang`, `b`.`nama_barang` AS `nama_barang`, `b`.`id_jenis` AS `id_jenis`, `b`.`id_satuan` AS `id_satuan`, `b`.`overall_stok` AS `overall_stok`, `db`.`serial_number` AS `serial_number`, `db`.`stok` AS `stok`, `db`.`id_status` AS `id_status`, `sb`.`status_barang` AS `status_barang`, `db`.`id_type` AS `id_type`, `tb`.`type_barang` AS `type_barang`, `db`.`keterangan` AS `keterangan`, `db`.`create_at` AS `create_at`, `db`.`update_at` AS `update_at` FROM (((`inv_detail_barang` `db` join `inv_barang` `b` on(`db`.`id_barang` = `b`.`id_barang`)) join `inv_status_barang` `sb` on(`db`.`id_status` = `sb`.`id_status`)) join `inv_type_barang` `tb` on(`db`.`id_type` = `tb`.`id_type`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_detail_barang_proses`
--
DROP TABLE IF EXISTS `v_detail_barang_proses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detail_barang_proses`  AS SELECT `dbp`.`id_detail_barang_proses` AS `id_detail_barang_proses`, `dbp`.`slug` AS `slug`, `dbp`.`id_barang_proses` AS `id_barang_proses`, `bp`.`id_kategori_proses` AS `id_kategori_proses`, `bp`.`no_proses` AS `no_proses`, `bp`.`tgl_proses_barang` AS `tgl_proses_barang`, `bp`.`id_user` AS `id_user`, `dbp`.`id_detail_barang` AS `id_detail_barang`, `db`.`id_barang` AS `id_barang`, `db`.`serial_number` AS `serial_number`, `db`.`stok` AS `stok`, `db`.`id_status` AS `id_status`, `db`.`id_type` AS `id_type`, `dbp`.`jml_barang` AS `jml_barang`, `dbp`.`keterangan` AS `keterangan`, `dbp`.`create_at` AS `create_at`, `dbp`.`update_at` AS `update_at` FROM ((`inv_detail_barang_proses` `dbp` join `inv_barang_proses` `bp` on(`dbp`.`id_barang_proses` = `bp`.`id_barang_proses`)) join `inv_detail_barang` `db` on(`dbp`.`id_detail_barang` = `db`.`id_detail_barang`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_key_uploaded`
--
DROP TABLE IF EXISTS `v_key_uploaded`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_key_uploaded`  AS SELECT `k`.`id` AS `id`, `k`.`kode` AS `kode`, `k`.`title` AS `title`, `k`.`tanggal` AS `tanggal`, `k`.`status_approved` AS `status_approved`, `k`.`deskripsi` AS `deskripsi`, `k`.`id_user_upload` AS `id_user_upload`, `u`.`name` AS `name`, `u`.`username` AS `username`, `u`.`id_roles` AS `id_roles`, `u`.`code` AS `kode_roles`, `u`.`roles` AS `roles`, `u`.`id_divisi` AS `id_divisi`, `u`.`divisi` AS `divisi`, `k`.`id_sifat_proses` AS `id_sifat_proses`, `s`.`sifat_proses` AS `sifat_proses`, `s`.`label_color` AS `label_color`, `k`.`id_perusahaan` AS `id_perusahaan`, `p`.`kode` AS `kode_perusahaan`, `p`.`perusahaan` AS `perusahaan`, `k`.`created_at` AS `created_at`, `k`.`updated_at` AS `updated_at` FROM (((`procurement_key_upload` `k` join `v_users` `u` on(`k`.`id_user_upload` = `u`.`id`)) left join `procurement_sifat_proses` `s` on(`k`.`id_sifat_proses` = `s`.`id`)) left join `perusahaan` `p` on(`k`.`id_perusahaan` = `p`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_penerima`
--
DROP TABLE IF EXISTS `v_penerima`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_penerima`  AS SELECT `p`.`id_penerima` AS `id_penerima`, `p`.`slug` AS `slug`, `p`.`id_barang_proses` AS `id_barang_proses`, `bp`.`id_kategori_proses` AS `id_kategori_proses`, `bp`.`no_proses` AS `no_proses`, `bp`.`tgl_proses_barang` AS `tgl_proses_barang`, `bp`.`id_user` AS `id_user`, `p`.`id_perusahaan` AS `id_perusahaan`, `ph`.`perusahaan` AS `perusahaan`, `ph`.`alamat` AS `alamat`, `ph`.`logo` AS `logo`, `p`.`nama_penerima` AS `nama_penerima`, `p`.`alamat_penerima` AS `alamat_penerima`, `p`.`no_telp` AS `no_telp`, `p`.`create_at` AS `create_at`, `p`.`update_at` AS `update_at` FROM ((`inv_penerima` `p` join `inv_barang_proses` `bp` on(`p`.`id_barang_proses` = `bp`.`id_barang_proses`)) join `perusahaan` `ph` on(`p`.`id_perusahaan` = `ph`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_project`
--
DROP TABLE IF EXISTS `v_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_project`  AS SELECT `p`.`id` AS `id`, `p`.`project_id` AS `project_id`, `p`.`user_id` AS `user_id`, `u`.`name` AS `name`, `u`.`username` AS `username`, `u`.`divisi` AS `divisi`, `p`.`project_name` AS `project_name`, `p`.`slug_name` AS `slug_name`, `p`.`dated` AS `dated`, `p`.`description` AS `description`, `p`.`agreement` AS `agreement`, `p`.`termin` AS `termin`, `p`.`doc_support` AS `doc_support`, `p`.`status_project` AS `status_project`, `p`.`created_at` AS `created_at`, `p`.`updated_at` AS `updated_at` FROM (`proc_project` `p` join `v_users` `u` on(`p`.`user_id` = `u`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase`
--
DROP TABLE IF EXISTS `v_purchase`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_purchase`  AS SELECT `p`.`id` AS `id`, `pp`.`id` AS `id_project`, `pp`.`project_name` AS `project_name`, `p`.`supplier_id` AS `supplier_id`, `s`.`kode` AS `kode_supplier`, `s`.`nama_supplier` AS `nama_supplier`, `s`.`atas_nama` AS `atas_nama`, `p`.`company_id` AS `company_id`, `c`.`perusahaan` AS `perusahaan`, `c`.`kode` AS `kode_perusahaan`, `c`.`alamat` AS `alamat_perusahaan`, `c`.`no_telp` AS `notelp_perusahaan`, `c`.`logo` AS `logo`, `p`.`type_id` AS `type_id`, `t`.`tipe_document` AS `tipe_document`, `t`.`nama_tipe` AS `nama_tipe`, `p`.`user_id` AS `user_id`, `u`.`name` AS `name`, `u`.`username` AS `username`, `p`.`purchase_no` AS `purchase_no`, `p`.`title_name` AS `title_name`, `p`.`slug_name` AS `slug_name`, `p`.`purchase_date` AS `purchase_date`, `p`.`reference` AS `reference`, `p`.`terms_conditions` AS `terms_conditions`, `p`.`sub_total` AS `sub_total`, `p`.`ppn` AS `ppn`, `p`.`discount` AS `discount`, `p`.`grand_total` AS `grand_total`, `p`.`sisa_gtotal` AS `sisa_gtotal`, `p`.`description` AS `description`, `p`.`total_text` AS `total_text`, `p`.`date_required` AS `date_required`, `p`.`delivery_to` AS `delivery_to`, `p`.`status_apporved` AS `status_apporved`, `p`.`doc_support` AS `doc_support`, `p`.`created_at` AS `created_at`, `p`.`updated_at` AS `updated_at` FROM (((((`proc_purchase` `p` left join `v_project` `pp` on(`p`.`project_id` = `pp`.`id`)) left join `proc_supplier` `s` on(`p`.`supplier_id` = `s`.`id`)) left join `perusahaan` `c` on(`p`.`company_id` = `c`.`id`)) join `procurement_tipe_document` `t` on(`p`.`type_id` = `t`.`id`)) join `v_users` `u` on(`p`.`user_id` = `u`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_rfc`
--
DROP TABLE IF EXISTS `v_rfc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rfc`  AS SELECT `r`.`id` AS `id`, `r`.`purchase_id` AS `purchase_id`, `p`.`title_name` AS `purchase_name`, `p`.`slug_name` AS `slug_purchase`, `p`.`nama_supplier` AS `nama_supplier`, `p`.`atas_nama` AS `atas_nama`, `p`.`perusahaan` AS `perusahaan`, `p`.`alamat_perusahaan` AS `alamat_perusahaan`, `p`.`notelp_perusahaan` AS `notelp_perusahaan`, `p`.`logo` AS `logo`, `p`.`tipe_document` AS `tipe_document`, `p`.`nama_tipe` AS `nama_tipe`, `r`.`user_id` AS `user_id`, `v`.`name` AS `name`, `v`.`roles` AS `roles`, `v`.`divisi` AS `divisi`, `r`.`rfc_no` AS `rfc_no`, `r`.`title_name` AS `title_name`, `r`.`slug_name` AS `slug_name`, `r`.`rfc_date` AS `rfc_date`, `r`.`ref_invoice` AS `ref_invoice`, `r`.`terms_conditions` AS `terms_conditions`, `r`.`sub_total` AS `sub_total`, `r`.`ppn` AS `ppn`, `r`.`discount` AS `discount`, `r`.`grand_total` AS `grand_total`, `r`.`description` AS `description`, `r`.`total_text` AS `total_text`, `r`.`date_required` AS `date_required`, `r`.`status_apporved` AS `status_apporved`, `r`.`doc_support` AS `doc_support`, `r`.`percentage_payment` AS `percentage_payment`, `r`.`payment_status` AS `payment_status`, `r`.`support_payment` AS `support_payment`, `r`.`status_type_rfc` AS `status_type_rfc`, `r`.`created_at` AS `created_at`, `r`.`updated_at` AS `updated_at` FROM ((`proc_rfc` `r` left join `v_purchase` `p` on(`r`.`purchase_id` = `p`.`id`)) join `v_users` `v` on(`r`.`user_id` = `v`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_unit_purchase`
--
DROP TABLE IF EXISTS `v_unit_purchase`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_unit_purchase`  AS SELECT `u`.`id` AS `id`, `u`.`purchase_id` AS `purchase_id`, `u`.`rfc_id` AS `rfc_id`, `u`.`unit_id` AS `unit_id`, `t`.`unit_type` AS `unit_type`, `u`.`item_desc` AS `item_desc`, `u`.`qty` AS `qty`, `u`.`keterangan` AS `keterangan`, `u`.`unit_price` AS `unit_price`, `u`.`total_price` AS `total_price`, `u`.`created_at` AS `created_at` FROM (`proc_purchase_unit` `u` join `proc_unit_type` `t` on(`u`.`unit_id` = `t`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_uploaded_document`
--
DROP TABLE IF EXISTS `v_uploaded_document`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_uploaded_document`  AS SELECT `ud`.`id` AS `id`, `ud`.`filedocument` AS `filedocument`, `ud`.`id_key_upload` AS `id_key_upload`, `ud`.`id_tipe_document` AS `id_tipe_document`, `td`.`tipe_document` AS `tipe_document`, `td`.`deskripsi` AS `deskripsi`, `ud`.`created_at` AS `created_at`, `ud`.`updated_at` AS `updated_at` FROM (`procurement_upload_document` `ud` left join `procurement_tipe_document` `td` on(`ud`.`id_tipe_document` = `td`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_users`
--
DROP TABLE IF EXISTS `v_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_users`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`username` AS `username`, `u`.`password` AS `password`, `u`.`secretkey` AS `secretkey`, `u`.`id_roles` AS `id_roles`, `r`.`code` AS `code`, `r`.`roles` AS `roles`, `u`.`id_divisi` AS `id_divisi`, `d`.`divisi` AS `divisi`, `u`.`avatar` AS `avatar`, `u`.`is_active` AS `is_active`, `u`.`remember_token` AS `remember_token`, `u`.`signof` AS `signof`, `u`.`created_at` AS `created_at`, `u`.`updated_at` AS `updated_at` FROM ((`users` `u` join `roles` `r` on(`u`.`id_roles` = `r`.`id`)) join `divisi` `d` on(`u`.`id_divisi` = `d`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approved_by`
--
ALTER TABLE `approved_by`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doc_approved` (`doc_approved`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_users`
--
ALTER TABLE `email_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_users_email_unique` (`email`),
  ADD KEY `email_users_id_user_foreign` (`id_user`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inv_approved_history`
--
ALTER TABLE `inv_approved_history`
  ADD PRIMARY KEY (`id_approved_history`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `id_barang_proses` (`id_barang_proses`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `inv_barang`
--
ALTER TABLE `inv_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD UNIQUE KEY `kode_barang` (`kode_barang`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `id_jenis` (`id_jenis`),
  ADD KEY `id_satuan` (`id_satuan`);

--
-- Indexes for table `inv_barang_proses`
--
ALTER TABLE `inv_barang_proses`
  ADD PRIMARY KEY (`id_barang_proses`),
  ADD UNIQUE KEY `no_proses` (`no_proses`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `id_kategori_proses` (`id_kategori_proses`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `inv_detail_barang`
--
ALTER TABLE `inv_detail_barang`
  ADD PRIMARY KEY (`id_detail_barang`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_status` (`id_status`),
  ADD KEY `id_type` (`id_type`);

--
-- Indexes for table `inv_detail_barang_proses`
--
ALTER TABLE `inv_detail_barang_proses`
  ADD PRIMARY KEY (`id_detail_barang_proses`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `id_barang_proses` (`id_barang_proses`),
  ADD KEY `id_detail_barang` (`id_detail_barang`);

--
-- Indexes for table `inv_jenis_barang`
--
ALTER TABLE `inv_jenis_barang`
  ADD PRIMARY KEY (`id_jenis`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `inv_kategori_proses`
--
ALTER TABLE `inv_kategori_proses`
  ADD PRIMARY KEY (`id_kategori_proses`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `inv_penerima`
--
ALTER TABLE `inv_penerima`
  ADD PRIMARY KEY (`id_penerima`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `no_telp` (`no_telp`),
  ADD KEY `id_barang_proses` (`id_barang_proses`),
  ADD KEY `id_perusahaan` (`id_perusahaan`);

--
-- Indexes for table `inv_satuan_barang`
--
ALTER TABLE `inv_satuan_barang`
  ADD PRIMARY KEY (`id_satuan`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `inv_status_barang`
--
ALTER TABLE `inv_status_barang`
  ADD PRIMARY KEY (`id_status`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `inv_type_barang`
--
ALTER TABLE `inv_type_barang`
  ADD PRIMARY KEY (`id_type`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_slug_unique` (`slug`),
  ADD KEY `menu_parent_slug_index` (`parent_slug`);

--
-- Indexes for table `method`
--
ALTER TABLE `method`
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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `privilege_users`
--
ALTER TABLE `privilege_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `privilege_users_id_roles_foreign` (`id_roles`),
  ADD KEY `privilege_users_id_menu_foreign` (`id_menu`),
  ADD KEY `privilege_users_id_method_foreign` (`id_method`);

--
-- Indexes for table `procurement_approved_document`
--
ALTER TABLE `procurement_approved_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `procurement_approved_document_id_upload_document_foreign` (`id_upload_document`),
  ADD KEY `procurement_approved_document_id_user_foreign` (`id_user`);

--
-- Indexes for table `procurement_detail_notif_action`
--
ALTER TABLE `procurement_detail_notif_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `procurement_detail_notif_action_id_notif_foreign` (`id_notif`),
  ADD KEY `procurement_detail_notif_action_id_user_foreign` (`id_user`);

--
-- Indexes for table `procurement_history_approved`
--
ALTER TABLE `procurement_history_approved`
  ADD PRIMARY KEY (`id`),
  ADD KEY `procurement_history_approved_id_user_foreign` (`id_user`);

--
-- Indexes for table `procurement_key_upload`
--
ALTER TABLE `procurement_key_upload`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `procurement_key_upload_kode_unique` (`kode`),
  ADD KEY `procurement_key_upload_id_user_upload_foreign` (`id_user_upload`),
  ADD KEY `procurement_key_upload_id_sifat_proses_foreign` (`id_sifat_proses`),
  ADD KEY `procurement_key_upload_id_perusahaan_foreign` (`id_perusahaan`);

--
-- Indexes for table `procurement_notif_action`
--
ALTER TABLE `procurement_notif_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `procurement_sifat_proses`
--
ALTER TABLE `procurement_sifat_proses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `procurement_tipe_document`
--
ALTER TABLE `procurement_tipe_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `procurement_upload_document`
--
ALTER TABLE `procurement_upload_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `procurement_upload_document_id_key_upload_foreign` (`id_key_upload`),
  ADD KEY `procurement_upload_document_id_tipe_document_foreign` (`id_tipe_document`);

--
-- Indexes for table `proc_approved`
--
ALTER TABLE `proc_approved`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `rfc_id` (`rfc_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `proc_project`
--
ALTER TABLE `proc_project`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `proc_purchase`
--
ALTER TABLE `proc_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `proc_purchase_unit`
--
ALTER TABLE `proc_purchase_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `rfc_id` (`rfc_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `proc_rfc`
--
ALTER TABLE `proc_rfc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`purchase_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `proc_rfp_request`
--
ALTER TABLE `proc_rfp_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `proc_supplier`
--
ALTER TABLE `proc_supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `proc_unit_type`
--
ALTER TABLE `proc_unit_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_id_roles_foreign` (`id_roles`),
  ADD KEY `users_id_divisi_foreign` (`id_divisi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approved_by`
--
ALTER TABLE `approved_by`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_users`
--
ALTER TABLE `email_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_approved_history`
--
ALTER TABLE `inv_approved_history`
  MODIFY `id_approved_history` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_barang`
--
ALTER TABLE `inv_barang`
  MODIFY `id_barang` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inv_barang_proses`
--
ALTER TABLE `inv_barang_proses`
  MODIFY `id_barang_proses` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_detail_barang`
--
ALTER TABLE `inv_detail_barang`
  MODIFY `id_detail_barang` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_detail_barang_proses`
--
ALTER TABLE `inv_detail_barang_proses`
  MODIFY `id_detail_barang_proses` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_jenis_barang`
--
ALTER TABLE `inv_jenis_barang`
  MODIFY `id_jenis` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_kategori_proses`
--
ALTER TABLE `inv_kategori_proses`
  MODIFY `id_kategori_proses` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_penerima`
--
ALTER TABLE `inv_penerima`
  MODIFY `id_penerima` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_satuan_barang`
--
ALTER TABLE `inv_satuan_barang`
  MODIFY `id_satuan` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_status_barang`
--
ALTER TABLE `inv_status_barang`
  MODIFY `id_status` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_type_barang`
--
ALTER TABLE `inv_type_barang`
  MODIFY `id_type` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `method`
--
ALTER TABLE `method`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `privilege_users`
--
ALTER TABLE `privilege_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `procurement_approved_document`
--
ALTER TABLE `procurement_approved_document`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `procurement_detail_notif_action`
--
ALTER TABLE `procurement_detail_notif_action`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `procurement_history_approved`
--
ALTER TABLE `procurement_history_approved`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `procurement_key_upload`
--
ALTER TABLE `procurement_key_upload`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `procurement_notif_action`
--
ALTER TABLE `procurement_notif_action`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `procurement_sifat_proses`
--
ALTER TABLE `procurement_sifat_proses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `procurement_tipe_document`
--
ALTER TABLE `procurement_tipe_document`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `procurement_upload_document`
--
ALTER TABLE `procurement_upload_document`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `proc_approved`
--
ALTER TABLE `proc_approved`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `proc_project`
--
ALTER TABLE `proc_project`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `proc_purchase`
--
ALTER TABLE `proc_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `proc_purchase_unit`
--
ALTER TABLE `proc_purchase_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `proc_rfc`
--
ALTER TABLE `proc_rfc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proc_rfp_request`
--
ALTER TABLE `proc_rfp_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proc_supplier`
--
ALTER TABLE `proc_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `proc_unit_type`
--
ALTER TABLE `proc_unit_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `email_users`
--
ALTER TABLE `email_users`
  ADD CONSTRAINT `email_users_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `privilege_users`
--
ALTER TABLE `privilege_users`
  ADD CONSTRAINT `privilege_users_id_menu_foreign` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `privilege_users_id_method_foreign` FOREIGN KEY (`id_method`) REFERENCES `method` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `privilege_users_id_roles_foreign` FOREIGN KEY (`id_roles`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `procurement_approved_document`
--
ALTER TABLE `procurement_approved_document`
  ADD CONSTRAINT `procurement_approved_document_id_upload_document_foreign` FOREIGN KEY (`id_upload_document`) REFERENCES `procurement_upload_document` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `procurement_approved_document_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `procurement_detail_notif_action`
--
ALTER TABLE `procurement_detail_notif_action`
  ADD CONSTRAINT `procurement_detail_notif_action_id_notif_foreign` FOREIGN KEY (`id_notif`) REFERENCES `procurement_notif_action` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `procurement_detail_notif_action_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `procurement_history_approved`
--
ALTER TABLE `procurement_history_approved`
  ADD CONSTRAINT `procurement_history_approved_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `procurement_key_upload`
--
ALTER TABLE `procurement_key_upload`
  ADD CONSTRAINT `procurement_key_upload_id_perusahaan_foreign` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `procurement_key_upload_id_sifat_proses_foreign` FOREIGN KEY (`id_sifat_proses`) REFERENCES `procurement_sifat_proses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `procurement_key_upload_id_user_upload_foreign` FOREIGN KEY (`id_user_upload`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `procurement_upload_document`
--
ALTER TABLE `procurement_upload_document`
  ADD CONSTRAINT `procurement_upload_document_id_key_upload_foreign` FOREIGN KEY (`id_key_upload`) REFERENCES `procurement_key_upload` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `procurement_upload_document_id_tipe_document_foreign` FOREIGN KEY (`id_tipe_document`) REFERENCES `procurement_tipe_document` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_divisi_foreign` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_id_roles_foreign` FOREIGN KEY (`id_roles`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
