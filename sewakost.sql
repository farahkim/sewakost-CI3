-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2021 at 02:57 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sewakost`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(220) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(14, 'Nidaul', 'jalan kemerdekaan timur', '2021-05-25 11:53:38', '2021-05-26 11:53:38'),
(15, 'Kiywo', 'jalan kemerdekaan timur', '2021-05-25 14:00:29', '2021-05-26 14:00:29'),
(16, 'Nila Nadjma', 'Jalan Madukara', '2021-05-27 15:06:04', '2021-05-28 15:06:04'),
(17, 'Nila Nadjma Syahrus Shofar', 'Jalan Madukara Rt 02 Rw 03', '2021-05-27 15:35:39', '2021-05-28 15:35:39'),
(18, 'Nidachan', 'Jl. Mangga no 4, Kesugihan Kidul, Kesugihan', '2021-05-29 19:10:50', '2021-05-30 19:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_wo` int(11) NOT NULL,
  `nama_wo` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_wo`, `nama_wo`, `jumlah`, `harga`, `pilihan`) VALUES
(21, 14, 80, 'Kost Tipe I   ', 1, 1000000, ''),
(22, 15, 82, 'Kost Tipe I  ', 1, 1200000, ''),
(23, 16, 100, 'Kost VIP', 1, 5000000, ''),
(24, 17, 102, 'Kost VIP', 1, 4500000, ''),
(25, 18, 100, 'Kost VIP', 1, 5000000, ''),
(26, 18, 80, 'Kost Tipe I    ', 1, 1000000, '');

--
-- Triggers `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_wedding SET stok = stok-NEW.jumlah WHERE id_wo = NEW.id_wo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', 'admin1', 1),
(2, 'user', 'user', 'user1', 2),
(4, 'Nidaul', 'Cantik', 'nida23', 2),
(5, 'Dian', 'Diancan', 'cantik12', 2),
(7, 'Dianpuspita', 'dian', 'dian', 2),
(8, 'Nidaul', 'nidachan', 'akuitu1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_wedding`
--

CREATE TABLE `tb_wedding` (
  `id_wo` int(11) NOT NULL,
  `nama_wo` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` varchar(50) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_wedding`
--

INSERT INTO `tb_wedding` (`id_wo`, `nama_wo`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(76, 'Kost Tipe I     ', 'Tempat berada di Bandung     ', 'Kost1     ', 1000000, 'Tidak Tersedia  ', 'dekorasi-kamar-kosan-minimalis3.jpg'),
(80, 'Kost Tipe I      ', 'Tempat berada di Yogyakarta      ', 'Kost1    ', 1000000, 'Availabel', '837342338.jpg'),
(82, 'Kost Tipe I    ', 'Tempat berada di Bandung    ', 'Kost1      ', 1200000, 'Availabel', 'Desain-interior-kamar-Skandinavian1-382566054-1513567995573.jpg'),
(83, 'Kost Tipe I  ', 'Tempat berada di Jakarta  ', 'Kost1    ', 1020000, 'Availabel  ', 'Desain-kamar-tidur-kecil-minimalis.jpg'),
(84, ' Kost Tipe I ', ' Tempat berada di Bekasi ', 'Kost1  ', 1100000, ' Availabel ', 'kamar-tidur.jpg'),
(85, 'Kost Tipe II ', 'Tempat berada di Yogyakarta ', 'Kost2', 2000000, 'Availabel ', 'bedroom-img_9dc16ab00dee1ced_4-2558-1-3e0c072.jpg'),
(86, 'Kost Tipe II ', 'Tempat berada di Yogyakarta ', 'Kost2', 2000000, 'Availabel ', 'Desain-Kamar-Tidur-Ukuran-3×3-Kamar-Mandi-Dalam1.jpg'),
(87, 'Kost Tipe II ', 'Tempat berada di Jakarta ', 'Kost2 ', 2000000, 'Availabel ', 'Desain-Kamar-Tidur-Ukuran-3×3-Kamar-Mandi-Dalam2.jpg'),
(89, 'Kost Tipe II ', 'Tempat berada di Jakarta ', 'Kost2 ', 2000000, 'Availabel ', 'image.jpg'),
(90, 'Kost Tipe II ', 'Tempat berada di Bandung ', 'Kost2', 2000000, 'Availabel ', 'Inspirasi-Desain-Kamar-Tidur-3X3-Di-Model-Kamar-Tidur-Terbaru.jpg'),
(91, 'Kost Tipe III ', 'Tempat berada di Bandung ', 'Kost3 ', 4000000, 'Availabel ', 'desain-kamar-kost1.jpg'),
(93, 'Kost Tipe III ', 'Tempat berada di Jakarta ', 'Kost3 ', 4000000, 'Availabel ', 'furniture-kamar-kos.jpg'),
(94, 'Kost Tipe III  ', 'Tempat berada di Jakarta  ', 'Kost3 ', 4000000, 'Availabel  ', 'kamarkos.jpg'),
(95, 'Kost Tipe III ', 'Tempat berada di Bekasi ', 'Kost3 ', 4000000, 'Availabel ', 'KAMAR-KOST1.jpg'),
(100, 'Kost VIP', 'Tempat berada di Surabaya', 'Kostvip', 5000000, '-2', 'kost_delapan.jpg'),
(101, 'Kost VIP', 'Tempat berada di Semarang', 'Kostvip', 5000000, 'Availabel', 'kost_tiga.jpg'),
(102, 'Kost VIP', 'Tempat berada di Cilacap', 'Kostvip', 4500000, '-1', 'shutterstock_293230775.png'),
(103, 'Kost VIP', 'Tempat berada di Purwokerto', 'Kostvip', 4500000, 'Availabel', 'kost_tujuh.jpg'),
(104, 'Kost VIP', 'Tempat berada di Solo', 'Kostvip', 4700000, 'Availabel', 'kost_empat.jpg'),
(105, 'Kost VIP', 'Tempat berada di Purwakarta', 'Kostvip', 4600000, 'Availabel', 'kost_enam.jpeg'),
(106, 'Kost Tipe I', 'Tempat berada di Jakarta', 'Kost1', 2000000, 'Availabel ', 'dekorasi-kamar-kosan-minimalis32.jpg'),
(108, 'Kost VIP', 'Tempat berada di Solo', 'Kostvip', 4000000, 'Availabel', 'kost_empat1.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_wedding`
--
ALTER TABLE `tb_wedding`
  ADD PRIMARY KEY (`id_wo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_wedding`
--
ALTER TABLE `tb_wedding`
  MODIFY `id_wo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
