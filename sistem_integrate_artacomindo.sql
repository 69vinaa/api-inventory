-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2022 at 11:20 AM
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
-- Table structure for table `inv_approved_history`
--

DROP TABLE IF EXISTS `inv_approved_history`;
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

DROP TABLE IF EXISTS `inv_barang`;
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
(5, 'router', 'B004', 'Router', 2, 1, 0, '2022-03-15 10:25:38', NULL),
(6, 'modem-sat-5000', 'B005', 'Modem SAT 5000', 1, 2, 0, '2022-03-17 03:51:16', NULL),
(7, 'router-001', 'B006', 'Router 001', 2, 2, 0, '2022-03-17 05:44:14', NULL),
(8, 'buc', 'B007', 'BUC', 1, 2, 0, '2022-03-21 07:57:54', NULL),
(10, 'modem-sat-1000', 'B008', 'Modem SAT 1000', 1, 2, 0, '2022-03-22 04:50:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_barang_proses`
--

DROP TABLE IF EXISTS `inv_barang_proses`;
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

--
-- Dumping data for table `inv_barang_proses`
--

INSERT INTO `inv_barang_proses` (`id_barang_proses`, `slug`, `id_kategori_proses`, `no_proses`, `tgl_proses_barang`, `id_user`, `keterangan`, `create_at`, `update_at`) VALUES
(1, '001', 1, 1, '2022-03-29 00:00:00', 11, '-', '2022-03-29 08:48:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_detail_barang`
--

DROP TABLE IF EXISTS `inv_detail_barang`;
CREATE TABLE `inv_detail_barang` (
  `id_detail_barang` bigint(20) NOT NULL,
  `id_barang` bigint(20) NOT NULL,
  `serial_number` varchar(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `id_status` bigint(20) NOT NULL,
  `id_type` bigint(20) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_detail_barang`
--

INSERT INTO `inv_detail_barang` (`id_detail_barang`, `id_barang`, `serial_number`, `stok`, `id_status`, `id_type`, `keterangan`, `create_at`, `update_at`) VALUES
(15, 6, 'HD379WDK0', 1, 1, 1, 'New', '2022-03-17 08:23:19', NULL),
(88, 5, 'GEIHQ8HF3', 3, 1, 1, '-', '2022-03-29 03:56:59', NULL),
(89, 5, 'JEIHQ8HF3', 3, 1, 1, '-', '2022-03-29 04:09:11', NULL),
(90, 5, 'KEIHQ8HF3', 3, 1, 1, '-', '2022-03-29 04:09:42', NULL),
(91, 5, 'LEIHQ8HF3', 3, 1, 1, '-', '2022-03-29 04:30:55', NULL),
(92, 10, 'MEIHQ8HF3', 3, 1, 1, '-', '2022-03-29 05:56:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_detail_barang_proses`
--

DROP TABLE IF EXISTS `inv_detail_barang_proses`;
CREATE TABLE `inv_detail_barang_proses` (
  `id_detail_barang_proses` bigint(20) NOT NULL,
  `id_barang_proses` bigint(20) NOT NULL,
  `id_detail_barang` bigint(20) NOT NULL,
  `jml_barang` int(5) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_detail_barang_proses`
--

INSERT INTO `inv_detail_barang_proses` (`id_detail_barang_proses`, `id_barang_proses`, `id_detail_barang`, `jml_barang`, `keterangan`, `create_at`, `update_at`) VALUES
(1, 1, 92, 3, '-', '2022-03-29 08:59:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_jenis_barang`
--

DROP TABLE IF EXISTS `inv_jenis_barang`;
CREATE TABLE `inv_jenis_barang` (
  `id_jenis` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `jenis_barang` varchar(20) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_jenis_barang`
--

INSERT INTO `inv_jenis_barang` (`id_jenis`, `slug`, `jenis_barang`, `keterangan`, `create_at`, `update_at`) VALUES
(1, 'buc', 'BUC', 'Baru', '2022-03-15 13:40:45', '2022-03-17 04:05:02'),
(2, 'router', 'Router', 'Second', '2022-03-15 13:41:31', '0000-00-00 00:00:00'),
(3, 'access-point', 'Access Point', 'Baru', '2022-03-15 08:08:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_kategori_proses`
--

DROP TABLE IF EXISTS `inv_kategori_proses`;
CREATE TABLE `inv_kategori_proses` (
  `id_kategori_proses` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `kategori_proses` varchar(10) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_kategori_proses`
--

INSERT INTO `inv_kategori_proses` (`id_kategori_proses`, `slug`, `kategori_proses`, `create_at`, `update_at`) VALUES
(1, 'masuk', 'Masuk', '2022-03-29 08:29:53', NULL),
(2, 'keluar', 'Keluar', '2022-03-29 08:30:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_penerima`
--

DROP TABLE IF EXISTS `inv_penerima`;
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

DROP TABLE IF EXISTS `inv_satuan_barang`;
CREATE TABLE `inv_satuan_barang` (
  `id_satuan` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `satuan_barang` varchar(10) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_satuan_barang`
--

INSERT INTO `inv_satuan_barang` (`id_satuan`, `slug`, `satuan_barang`, `create_at`, `update_at`) VALUES
(1, 'meter', 'Meter', '2022-03-15 13:43:19', '2022-03-17 03:49:14'),
(2, 'pcs', 'Pcs', '2022-03-17 03:42:54', '2022-03-17 03:52:38');

-- --------------------------------------------------------

--
-- Table structure for table `inv_status_barang`
--

DROP TABLE IF EXISTS `inv_status_barang`;
CREATE TABLE `inv_status_barang` (
  `id_status` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `status_barang` varchar(20) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_status_barang`
--

INSERT INTO `inv_status_barang` (`id_status`, `slug`, `status_barang`, `create_at`, `update_at`) VALUES
(1, 'installed', 'Installed', '2022-03-15 14:18:02', '0000-00-00 00:00:00'),
(2, 'ex-maintenance', 'Ex Maintenance', '2022-03-15 14:18:32', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `inv_type_barang`
--

DROP TABLE IF EXISTS `inv_type_barang`;
CREATE TABLE `inv_type_barang` (
  `id_type` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `type_barang` varchar(10) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_type_barang`
--

INSERT INTO `inv_type_barang` (`id_type`, `slug`, `type_barang`, `create_at`, `update_at`) VALUES
(1, 'new', 'New', '2022-03-15 14:19:06', '0000-00-00 00:00:00'),
(2, 'second', 'Second', '2022-03-15 14:19:24', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_approved_history`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_approved_history`;
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
DROP VIEW IF EXISTS `v_barang`;
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
DROP VIEW IF EXISTS `v_barang_proses`;
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
DROP VIEW IF EXISTS `v_detail_barang`;
CREATE TABLE `v_detail_barang` (
`id_detail_barang` bigint(20)
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
DROP VIEW IF EXISTS `v_detail_barang_proses`;
CREATE TABLE `v_detail_barang_proses` (
`id_detail_barang_proses` bigint(20)
,`id_barang_proses` bigint(20)
,`id_kategori_proses` bigint(20)
,`no_proses` int(10)
,`tgl_proses_barang` datetime
,`id_user` bigint(20)
,`id_detail_barang` bigint(20)
,`id_barang` bigint(20)
,`serial_number` varchar(20)
,`stok` int(5)
,`jml_barang` int(5)
,`keterangan` varchar(20)
,`create_at` datetime
,`update_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_penerima`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_penerima`;
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
-- Structure for view `v_approved_history`
--
DROP TABLE IF EXISTS `v_approved_history`;

DROP VIEW IF EXISTS `v_approved_history`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_approved_history`  AS SELECT `ah`.`id_approved_history` AS `id_approved_history`, `ah`.`slug` AS `slug`, `ah`.`id_barang_proses` AS `id_barang_proses`, `bp`.`id_kategori_proses` AS `id_kategori_proses`, `bp`.`no_proses` AS `no_proses`, `bp`.`tgl_proses_barang` AS `tgl_proses_barang`, `ah`.`id_user` AS `id_user`, `u`.`name` AS `name`, `ah`.`status_approved` AS `status_approved`, `ah`.`time_approved` AS `time_approved`, `ah`.`keterangan` AS `keterangan`, `ah`.`create_at` AS `create_at`, `ah`.`update_at` AS `update_at` FROM ((`inv_approved_history` `ah` join `inv_barang_proses` `bp` on(`ah`.`id_barang_proses` = `bp`.`id_barang_proses`)) join `users` `u` on(`ah`.`id_user` = `u`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_barang`
--
DROP TABLE IF EXISTS `v_barang`;

DROP VIEW IF EXISTS `v_barang`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_barang`  AS SELECT `b`.`id_barang` AS `id_barang`, `b`.`slug` AS `slug`, `b`.`kode_barang` AS `kode_barang`, `b`.`nama_barang` AS `nama_barang`, `b`.`id_jenis` AS `id_jenis`, `j`.`jenis_barang` AS `jenis_barang`, `j`.`keterangan` AS `keterangan`, `b`.`id_satuan` AS `id_satuan`, `s`.`satuan_barang` AS `satuan_barang`, `b`.`overall_stok` AS `overall_stok`, `b`.`create_at` AS `create_at`, `b`.`update_at` AS `update_at` FROM ((`inv_barang` `b` join `inv_jenis_barang` `j` on(`b`.`id_jenis` = `j`.`id_jenis`)) join `inv_satuan_barang` `s` on(`b`.`id_satuan` = `s`.`id_satuan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_barang_proses`
--
DROP TABLE IF EXISTS `v_barang_proses`;

DROP VIEW IF EXISTS `v_barang_proses`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_barang_proses`  AS SELECT `bp`.`id_barang_proses` AS `id_barang_proses`, `bp`.`slug` AS `slug`, `bp`.`id_kategori_proses` AS `id_kategori_proses`, `kp`.`kategori_proses` AS `kategori_proses`, `bp`.`no_proses` AS `no_proses`, `bp`.`tgl_proses_barang` AS `tgl_proses_barang`, `bp`.`id_user` AS `id_user`, `u`.`name` AS `name`, `bp`.`keterangan` AS `keterangan`, `bp`.`create_at` AS `create_at`, `bp`.`update_at` AS `update_at` FROM ((`inv_barang_proses` `bp` join `inv_kategori_proses` `kp` on(`bp`.`id_kategori_proses` = `kp`.`id_kategori_proses`)) join `users` `u` on(`bp`.`id_user` = `u`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_detail_barang`
--
DROP TABLE IF EXISTS `v_detail_barang`;

DROP VIEW IF EXISTS `v_detail_barang`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detail_barang`  AS SELECT `db`.`id_detail_barang` AS `id_detail_barang`, `db`.`id_barang` AS `id_barang`, `b`.`kode_barang` AS `kode_barang`, `b`.`nama_barang` AS `nama_barang`, `b`.`id_jenis` AS `id_jenis`, `b`.`id_satuan` AS `id_satuan`, `b`.`overall_stok` AS `overall_stok`, `db`.`serial_number` AS `serial_number`, `db`.`stok` AS `stok`, `db`.`id_status` AS `id_status`, `sb`.`status_barang` AS `status_barang`, `db`.`id_type` AS `id_type`, `tb`.`type_barang` AS `type_barang`, `db`.`keterangan` AS `keterangan`, `db`.`create_at` AS `create_at`, `db`.`update_at` AS `update_at` FROM (((`inv_detail_barang` `db` join `inv_barang` `b` on(`db`.`id_barang` = `b`.`id_barang`)) join `inv_status_barang` `sb` on(`db`.`id_status` = `sb`.`id_status`)) join `inv_type_barang` `tb` on(`db`.`id_type` = `tb`.`id_type`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_detail_barang_proses`
--
DROP TABLE IF EXISTS `v_detail_barang_proses`;

DROP VIEW IF EXISTS `v_detail_barang_proses`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detail_barang_proses`  AS SELECT `dbp`.`id_detail_barang_proses` AS `id_detail_barang_proses`, `dbp`.`id_barang_proses` AS `id_barang_proses`, `bp`.`id_kategori_proses` AS `id_kategori_proses`, `bp`.`no_proses` AS `no_proses`, `bp`.`tgl_proses_barang` AS `tgl_proses_barang`, `bp`.`id_user` AS `id_user`, `dbp`.`id_detail_barang` AS `id_detail_barang`, `db`.`id_barang` AS `id_barang`, `db`.`serial_number` AS `serial_number`, `db`.`stok` AS `stok`, `dbp`.`jml_barang` AS `jml_barang`, `dbp`.`keterangan` AS `keterangan`, `dbp`.`create_at` AS `create_at`, `dbp`.`update_at` AS `update_at` FROM ((`inv_detail_barang_proses` `dbp` join `inv_barang_proses` `bp` on(`dbp`.`id_barang_proses` = `bp`.`id_barang_proses`)) join `inv_detail_barang` `db` on(`dbp`.`id_detail_barang` = `db`.`id_detail_barang`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_penerima`
--
DROP TABLE IF EXISTS `v_penerima`;

DROP VIEW IF EXISTS `v_penerima`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_penerima`  AS SELECT `p`.`id_penerima` AS `id_penerima`, `p`.`slug` AS `slug`, `p`.`id_barang_proses` AS `id_barang_proses`, `bp`.`id_kategori_proses` AS `id_kategori_proses`, `bp`.`no_proses` AS `no_proses`, `bp`.`tgl_proses_barang` AS `tgl_proses_barang`, `bp`.`id_user` AS `id_user`, `p`.`id_perusahaan` AS `id_perusahaan`, `ph`.`perusahaan` AS `perusahaan`, `ph`.`alamat` AS `alamat`, `ph`.`logo` AS `logo`, `p`.`nama_penerima` AS `nama_penerima`, `p`.`alamat_penerima` AS `alamat_penerima`, `p`.`no_telp` AS `no_telp`, `p`.`create_at` AS `create_at`, `p`.`update_at` AS `update_at` FROM ((`inv_penerima` `p` join `inv_barang_proses` `bp` on(`p`.`id_barang_proses` = `bp`.`id_barang_proses`)) join `perusahaan` `ph` on(`p`.`id_perusahaan` = `ph`.`id`)) ;

--
-- Indexes for dumped tables
--

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
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_status` (`id_status`),
  ADD KEY `id_type` (`id_type`);

--
-- Indexes for table `inv_detail_barang_proses`
--
ALTER TABLE `inv_detail_barang_proses`
  ADD PRIMARY KEY (`id_detail_barang_proses`),
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inv_approved_history`
--
ALTER TABLE `inv_approved_history`
  MODIFY `id_approved_history` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_barang`
--
ALTER TABLE `inv_barang`
  MODIFY `id_barang` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `inv_barang_proses`
--
ALTER TABLE `inv_barang_proses`
  MODIFY `id_barang_proses` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inv_detail_barang`
--
ALTER TABLE `inv_detail_barang`
  MODIFY `id_detail_barang` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `inv_detail_barang_proses`
--
ALTER TABLE `inv_detail_barang_proses`
  MODIFY `id_detail_barang_proses` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inv_jenis_barang`
--
ALTER TABLE `inv_jenis_barang`
  MODIFY `id_jenis` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inv_kategori_proses`
--
ALTER TABLE `inv_kategori_proses`
  MODIFY `id_kategori_proses` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inv_penerima`
--
ALTER TABLE `inv_penerima`
  MODIFY `id_penerima` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_satuan_barang`
--
ALTER TABLE `inv_satuan_barang`
  MODIFY `id_satuan` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inv_status_barang`
--
ALTER TABLE `inv_status_barang`
  MODIFY `id_status` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inv_type_barang`
--
ALTER TABLE `inv_type_barang`
  MODIFY `id_type` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
