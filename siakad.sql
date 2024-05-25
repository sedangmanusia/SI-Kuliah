-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 23, 2024 at 01:21 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id-guru` int NOT NULL,
  `nuptk` varchar(15) NOT NULL,
  `nama-guru` varchar(30) NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `id-mapel` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id-guru`, `nuptk`, `nama-guru`, `telepon`, `id-mapel`) VALUES
(1, '3301029812745', 'Sulistya Ningsih', '089287921901', 1),
(2, '3390871009832', 'Ahmad Muzaki', '089489302772', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id-jadwal` int NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam` varchar(10) NOT NULL,
  `id-mapel` int NOT NULL,
  `id-guru` int NOT NULL,
  `id-kelas` int NOT NULL,
  `id-ruang` varchar(5) NOT NULL,
  `semester` int NOT NULL,
  `tahun-ajaran` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id-jadwal`, `hari`, `jam`, `id-mapel`, `id-guru`, `id-kelas`, `id-ruang`, `semester`, `tahun-ajaran`) VALUES
(1, 'Senin', '1-3', 1, 1, 1, 'L1R1', 2, 2024),
(2, 'Selasa', '1-3', 2, 2, 1, 'L1R1', 2, 2024);

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id-jurusan` varchar(10) NOT NULL,
  `nama-jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id-jurusan`, `nama-jurusan`) VALUES
('IIA', 'Ilmu-ilmu Alam'),
('IIK', 'Ilmu-ilmu Keagamaan'),
('IIS', 'Ilmu-ilmu Sosial');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id-kelas` int NOT NULL,
  `nama-kelas` varchar(10) NOT NULL,
  `id-jurusan` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id-kelas`, `nama-kelas`, `id-jurusan`) VALUES
(1, 'X-IIA-1', 'IIA'),
(2, 'X-IIA-2', 'IIA'),
(3, 'X-IIK-1', 'IIK'),
(4, 'X-IIK-2', 'IIK');

-- --------------------------------------------------------

--
-- Table structure for table `level-user`
--

CREATE TABLE `level-user` (
  `id-level` int NOT NULL,
  `nama-level` enum('Admin','Guru','Keuangan','Kepala Sekolah') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `level-user`
--

INSERT INTO `level-user` (`id-level`, `nama-level`) VALUES
(1, 'Admin'),
(2, 'Guru'),
(3, 'Keuangan'),
(4, 'Kepala Sekolah');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id-mapel` int NOT NULL,
  `nama-mapel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id-mapel`, `nama-mapel`) VALUES
(1, 'Bahasa Indonesia'),
(2, 'Matematika'),
(3, 'Fisika'),
(4, 'Ilmu Hadits');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id-nilai` int NOT NULL,
  `id-mapel` int NOT NULL,
  `id-guru` int NOT NULL,
  `id-siswa` int NOT NULL,
  `nilai` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id-nilai`, `id-mapel`, `id-guru`, `id-siswa`, `nilai`) VALUES
(1, 1, 1, 1, 75),
(2, 1, 1, 2, 80);

-- --------------------------------------------------------

--
-- Table structure for table `orangtua`
--

CREATE TABLE `orangtua` (
  `id-ortu` int NOT NULL,
  `nama-ortu` varchar(30) NOT NULL,
  `penghasilan` int NOT NULL,
  `jumlah-tanggungan` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orangtua`
--

INSERT INTO `orangtua` (`id-ortu`, `nama-ortu`, `penghasilan`, `jumlah-tanggungan`) VALUES
(1, 'Sudjatmiko', 700000, 3),
(2, 'Ahmad Mujiman', 1500000, 2),
(3, 'Hariyadi', 1000000, 3),
(4, 'Sutoyo', 500000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `id-ruang` varchar(10) NOT NULL,
  `nama-ruang` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`id-ruang`, `nama-ruang`) VALUES
('L1R1', 'IIK-XA'),
('L1R2', 'IIK-XB'),
('L1R3', 'IIK-XIA');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id-siswa` int NOT NULL,
  `nama-siswa` varchar(30) NOT NULL,
  `jenis-kelamin` enum('Laki-laki','Perempuan') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tempat-lahir` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tanggal-lahir` date NOT NULL,
  `agama` enum('Islam','Kristen/Katolik','Hindu','Budha','Konghucu') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id-kelas` int NOT NULL,
  `id-ortu` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id-siswa`, `nama-siswa`, `jenis-kelamin`, `tempat-lahir`, `tanggal-lahir`, `agama`, `id-kelas`, `id-ortu`) VALUES
(1, 'Meliana Alfina', 'Perempuan', 'Surabaya', '2009-01-28', 'Islam', 1, 1),
(2, 'Ahmad Rizal', 'Laki-laki', 'Surabaya', '2008-02-03', 'Islam', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id-user` int NOT NULL,
  `nama-lengkap` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `id-level` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id-user`, `nama-lengkap`, `username`, `password`, `id-level`) VALUES
(1, 'Sulistya Ningsih', 'Guru-Sulistya Ningsih', 'Sulistya123', 2),
(2, 'Maryanto', 'Kepala-Maryanto', 'Maryanto123', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id-guru`),
  ADD KEY `id-mapel` (`id-mapel`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id-jadwal`),
  ADD KEY `id-mapel` (`id-mapel`),
  ADD KEY `id-guru` (`id-guru`),
  ADD KEY `id-kelas` (`id-kelas`),
  ADD KEY `id-ruang` (`id-ruang`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id-jurusan`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id-kelas`),
  ADD KEY `id-jurusan` (`id-jurusan`);

--
-- Indexes for table `level-user`
--
ALTER TABLE `level-user`
  ADD PRIMARY KEY (`id-level`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id-mapel`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id-nilai`),
  ADD KEY `id-mapel` (`id-mapel`),
  ADD KEY `id-guru` (`id-guru`),
  ADD KEY `id-siswa` (`id-siswa`);

--
-- Indexes for table `orangtua`
--
ALTER TABLE `orangtua`
  ADD PRIMARY KEY (`id-ortu`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id-ruang`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id-siswa`),
  ADD KEY `id-kelas` (`id-kelas`),
  ADD KEY `id-ortu` (`id-ortu`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id-user`),
  ADD KEY `id-level` (`id-level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id-guru` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id-jadwal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id-kelas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `level-user`
--
ALTER TABLE `level-user`
  MODIFY `id-level` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id-mapel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id-nilai` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orangtua`
--
ALTER TABLE `orangtua`
  MODIFY `id-ortu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id-siswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id-user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`id-mapel`) REFERENCES `mapel` (`id-mapel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id-kelas`) REFERENCES `kelas` (`id-kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`id-mapel`) REFERENCES `mapel` (`id-mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`id-guru`) REFERENCES `guru` (`id-guru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`id-mapel`) REFERENCES `mapel` (`id-mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id-guru`) REFERENCES `guru` (`id-guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`id-siswa`) REFERENCES `siswa` (`id-siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id-kelas`) REFERENCES `kelas` (`id-kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`id-ortu`) REFERENCES `orangtua` (`id-ortu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id-level`) REFERENCES `level-user` (`id-level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
