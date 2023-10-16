-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 14, 2023 at 07:14 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit`
-- Creative Commons. Anisya

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` char(10) NOT NULL,
  `nama_dokter` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`) VALUES
('D002', 'Nadya Surati'),
('D003', 'Heru Firdaus');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` char(10) NOT NULL,
  `nama_kamar` varchar(35) NOT NULL,
  `harga_kamar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nama_kamar`, `harga_kamar`) VALUES
('K001', 'E-13', 100000),
('K002', 'E-33', 300000),
('K003', 'A-12', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` char(10) NOT NULL,
  `nama_pasien` varchar(50) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `alamat` text NOT NULL,
  `kategori` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `alamat`, `kategori`) VALUES
('P001', 'Heru Firdaus', 'L', 'SarangGagak', '0'),
('P007', 'btro', 'P', 'dasd', '0'),
('t002', '2', 'L', 'dsad', '1');

-- --------------------------------------------------------

--
-- Table structure for table `spesialisdokter`
--

CREATE TABLE `spesialisdokter` (
  `kodespesialis` varchar(6) NOT NULL,
  `spesialis` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `spesialisdokter`
--

INSERT INTO `spesialisdokter` (`kodespesialis`, `spesialis`) VALUES
('Sp001','Spesialis Penyakit Dalam'),
('Sp002','Spesialis Obstetri dan Ginekologi'),
('Sp003', 'Spesialis Anak'),
('Sp004', 'Spesialis Perinatologi'),
('Sp005', 'Spesialis Neurologi')

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` char(5) NOT NULL,
  `id_pasien` char(10) NOT NULL,
  `id_kamar` char(10) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL,
  `lama_nginap` int(11) NOT NULL,
  `biaya` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pasien`, `id_kamar`, `tgl_masuk`, `tgl_keluar`, `lama_nginap`, `biaya`) VALUES
('T001', 'P001', 'K002', '2018-12-30', '2018-12-31', 1, 300000),
('T002', 'P007', 'K001', '2018-12-30', '2018-12-31', 1, 0),
('T003', 'P001', 'K001', '2018-12-30', '2018-12-31', 1, 100000),
('T008', '123', 'K001', '2018-12-24', '2018-12-30', 6, 600000),
('T009', 'P001', 'K001', '2018-12-27', '2018-12-31', 4, 400000),
('T010', 'P002', 'K002', '2018-12-27', '2018-12-29', 2, 600000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `nama`, `password`) VALUES
('bil', 'bul', '123'),
('bilhaqi28', 'bilhaqi', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `spesialisdokter`
--
ALTER TABLE `spesialisdokter`
  ADD PRIMARY KEY (`kodespesialis`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
