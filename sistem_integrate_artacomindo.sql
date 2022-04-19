-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2022 at 05:33 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

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
-- Table structure for table `inv_detail_request`
--

DROP TABLE IF EXISTS `inv_detail_request`;
CREATE TABLE `inv_detail_request` (
  `id_detail_request` bigint(20) NOT NULL,
  `id_request` bigint(20) NOT NULL,
  `id_barang` bigint(20) NOT NULL,
  `jml_barang` int(5) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_detail_request`
--

INSERT INTO `inv_detail_request` (`id_detail_request`, `id_request`, `id_barang`, `jml_barang`, `keterangan`, `create_at`, `update_at`) VALUES
(1, 9, 1, 2, '-', '2022-04-08 05:46:09', NULL),
(2, 10, 1, 2, '-', '2022-04-08 05:48:27', NULL),
(3, 11, 1, 2, '-', '2022-04-08 05:48:43', NULL),
(4, 12, 1, 2, '-', '2022-04-08 05:50:43', NULL),
(5, 13, 1, 2, '-', '2022-04-08 05:54:46', NULL),
(6, 14, 1, 2, '-', '2022-04-08 06:12:30', NULL),
(7, 15, 1, 2, '-', '2022-04-08 06:13:37', NULL),
(8, 16, 1, 2, '-', '2022-04-08 06:14:55', NULL),
(9, 17, 1, 2, '-', '2022-04-08 06:17:16', NULL),
(10, 18, 1, 2, '-', '2022-04-08 06:19:26', NULL),
(11, 19, 1, 2, '-', '2022-04-08 06:24:44', NULL),
(12, 20, 1, 2, '-', '2022-04-08 06:25:46', NULL),
(13, 21, 1, 2, '-', '2022-04-08 06:27:00', NULL),
(14, 22, 1, 2, '-', '2022-04-08 06:38:18', NULL),
(15, 23, 1, 2, '-', '2022-04-08 06:39:07', NULL),
(16, 24, 1, 2, '-', '2022-04-08 06:59:26', NULL),
(17, 25, 1, 2, '-', '2022-04-08 08:02:58', NULL),
(18, 26, 1, 2, '-', '2022-04-08 08:03:59', NULL),
(19, 28, 1, 2, '-', '2022-04-08 08:06:28', NULL),
(20, 29, 1, 2, '-', '2022-04-08 08:15:38', NULL),
(21, 30, 1, 2, '-', '2022-04-08 08:46:37', NULL),
(22, 31, 1, 2, '-', '2022-04-08 09:50:32', NULL),
(23, 32, 1, 2, '-', '2022-04-08 09:51:07', NULL),
(24, 34, 1, 2, '-', '2022-04-08 09:51:36', NULL),
(25, 35, 1, 2, '-', '2022-04-08 09:51:52', NULL),
(26, 36, 1, 2, '-', '2022-04-08 09:55:59', NULL),
(27, 37, 1, 2, '-', '2022-04-12 06:32:20', NULL),
(28, 38, 1, 2, '-', '2022-04-12 06:32:58', NULL),
(29, 39, 1, 2, '-', '2022-04-12 06:34:11', NULL),
(30, 40, 1, 2, '-', '2022-04-12 06:37:01', NULL),
(31, 41, 1, 2, '-', '2022-04-12 06:38:58', NULL),
(32, 42, 1, 2, '-', '2022-04-12 07:45:00', NULL),
(33, 43, 1, 2, '-', '2022-04-12 08:15:57', NULL),
(34, 44, 1, 2, '-', '2022-04-12 08:17:33', NULL),
(35, 45, 1, 2, '-', '2022-04-12 08:18:10', NULL),
(36, 46, 1, 2, '-', '2022-04-12 08:43:05', NULL),
(37, 47, 1, 2, '-', '2022-04-12 08:45:43', NULL),
(38, 49, 1, 2, '-', '2022-04-12 08:52:02', NULL),
(39, 50, 1, 2, '-', '2022-04-12 08:52:41', NULL),
(40, 51, 1, 2, '-', '2022-04-12 08:52:59', NULL),
(41, 52, 1, 2, '-', '2022-04-12 09:13:56', NULL),
(42, 53, 1, 2, '-', '2022-04-12 09:16:13', NULL),
(43, 54, 1, 2, '-', '2022-04-12 09:21:42', NULL),
(44, 55, 1, 2, '-', '2022-04-12 09:24:05', NULL),
(45, 56, 1, 2, '-', '2022-04-12 09:42:26', NULL),
(46, 57, 1, 2, '-', '2022-04-13 05:58:37', NULL),
(47, 58, 1, 2, '-', '2022-04-13 06:02:25', NULL),
(48, 59, 1, 2, '-', '2022-04-14 08:12:12', NULL),
(49, 60, 1, 2, '-', '2022-04-14 09:34:34', NULL),
(50, 61, 1, 2, '-', '2022-04-14 09:35:51', NULL),
(51, 63, 5, 1, '-', '2022-04-14 10:44:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_request`
--

DROP TABLE IF EXISTS `inv_request`;
CREATE TABLE `inv_request` (
  `id_request` bigint(20) NOT NULL,
  `kode_request` varchar(7) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `tgl` datetime NOT NULL,
  `penerima` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_request`
--

INSERT INTO `inv_request` (`id_request`, `kode_request`, `id_user`, `tgl`, `penerima`, `alamat`, `no_telp`, `create_at`, `update_at`) VALUES
(1, '', 11, '2022-04-01 10:55:44', 'Vina', 'Cikarang', '089763562', '2022-04-01 10:55:44', NULL),
(3, 'R002', 11, '2022-04-04 04:50:31', 'Vina', 'Cikarang', '089763569', '2022-04-04 04:50:31', NULL),
(52, 'R049', 11, '2022-04-12 09:13:56', 'Vina', 'Bekasi', '098765', '2022-04-12 09:13:56', NULL),
(53, 'R050', 11, '2022-04-12 09:16:13', 'Vina', 'Bekasi', '081932', '2022-04-12 09:16:13', NULL),
(54, 'R051', 11, '2022-04-12 09:21:42', 'Vina', 'Bekasi', '081932', '2022-04-12 09:21:42', NULL),
(55, 'R052', 11, '2022-04-12 09:24:05', 'Vina', 'Bekasi', '081932', '2022-04-12 09:24:05', NULL),
(56, 'R053', 11, '2022-04-12 09:42:26', 'Vina', 'Bekasi', '081932', '2022-04-12 09:42:26', NULL),
(57, 'R054', 11, '2022-04-13 05:58:37', 'Vina', 'Bekasi', '081932', '2022-04-13 05:58:37', NULL),
(58, 'R055', 11, '2022-04-13 06:02:25', 'Vina', 'Bekasi', '081932', '2022-04-13 06:02:25', NULL),
(59, 'R056', 11, '2022-04-14 08:12:12', 'Vina', 'Bekasi', '081932', '2022-04-14 08:12:12', NULL),
(60, 'R057', 11, '2022-04-14 09:34:34', 'Vina', 'Bekasi', '081932', '2022-04-14 09:34:34', NULL),
(61, 'R058', 11, '2022-04-14 09:35:51', 'Vina', 'Bekasi', '123551', '2022-04-14 09:35:51', NULL),
(63, 'R059', 11, '2022-04-14 10:44:09', 'Vina', 'Bekasi', '735634', '2022-04-14 10:44:09', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_detail_request`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_detail_request`;
CREATE TABLE `v_detail_request` (
`id_detail_request` bigint(20)
,`id_request` bigint(20)
,`kode_request` varchar(7)
,`id_barang` bigint(20)
,`nama_barang` varchar(50)
,`jml_barang` int(5)
,`keterangan` varchar(100)
,`create_at` datetime
,`update_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_request`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_request`;
CREATE TABLE `v_request` (
`id_request` bigint(20)
,`kode_request` varchar(7)
,`id_user` bigint(20)
,`name` varchar(255)
,`tgl` datetime
,`penerima` varchar(50)
,`alamat` varchar(100)
,`no_telp` varchar(14)
,`create_at` datetime
,`update_at` datetime
);

-- --------------------------------------------------------

--
-- Structure for view `v_detail_request`
--
DROP TABLE IF EXISTS `v_detail_request`;

DROP VIEW IF EXISTS `v_detail_request`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_detail_request`  AS SELECT `dr`.`id_detail_request` AS `id_detail_request`, `dr`.`id_request` AS `id_request`, `r`.`kode_request` AS `kode_request`, `dr`.`id_barang` AS `id_barang`, `b`.`nama_barang` AS `nama_barang`, `dr`.`jml_barang` AS `jml_barang`, `dr`.`keterangan` AS `keterangan`, `dr`.`create_at` AS `create_at`, `dr`.`update_at` AS `update_at` FROM ((`inv_detail_request` `dr` join `inv_barang` `b` on(`dr`.`id_barang` = `b`.`id_barang`)) join `inv_request` `r` on(`dr`.`id_request` = `r`.`id_request`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_request`
--
DROP TABLE IF EXISTS `v_request`;

DROP VIEW IF EXISTS `v_request`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_request`  AS SELECT `r`.`id_request` AS `id_request`, `r`.`kode_request` AS `kode_request`, `r`.`id_user` AS `id_user`, `u`.`name` AS `name`, `r`.`tgl` AS `tgl`, `r`.`penerima` AS `penerima`, `r`.`alamat` AS `alamat`, `r`.`no_telp` AS `no_telp`, `r`.`create_at` AS `create_at`, `r`.`update_at` AS `update_at` FROM (`inv_request` `r` join `users` `u` on(`r`.`id_user` = `u`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inv_detail_request`
--
ALTER TABLE `inv_detail_request`
  ADD PRIMARY KEY (`id_detail_request`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_request` (`id_request`);

--
-- Indexes for table `inv_request`
--
ALTER TABLE `inv_request`
  ADD PRIMARY KEY (`id_request`),
  ADD UNIQUE KEY `kode_request` (`kode_request`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inv_detail_request`
--
ALTER TABLE `inv_detail_request`
  MODIFY `id_detail_request` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `inv_request`
--
ALTER TABLE `inv_request`
  MODIFY `id_request` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
