-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Apr 2023 pada 03.15
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gereja`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_jemaat`
--

CREATE TABLE `ms_jemaat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jenis_kelamin` enum('L , P') NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `nama_ayah` varchar(255) NOT NULL,
  `nama_ibu` varchar(255) NOT NULL,
  `golongan_jemaat` enum('Lansia, Dewasa, Pemuda, Anak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_majelis`
--

CREATE TABLE `ms_majelis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jenis_kelamin` enum('L , P') NOT NULL,
  `nama_ayah` varchar(255) NOT NULL,
  `nama_ibu` varchar(255) NOT NULL,
  `no_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_pendeta`
--

CREATE TABLE `ms_pendeta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jenis_kelamin` enum('L , P') NOT NULL,
  `no_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_renungan`
--

CREATE TABLE `ms_renungan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pendeta` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `bacaan` varchar(50) NOT NULL,
  `isi_renungan` varchar(500) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_baptis`
--

CREATE TABLE `tb_baptis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pendeta` bigint(20) UNSIGNED NOT NULL,
  `id_jemaat` bigint(20) UNSIGNED NOT NULL,
  `tanggal_baptis` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jadwal_ibadah`
--

CREATE TABLE `tb_jadwal_ibadah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pendeta` bigint(20) UNSIGNED DEFAULT NULL,
  `id_majelis` bigint(20) UNSIGNED DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `tempat` varchar(50) NOT NULL,
  `tanggal_ibadah` datetime NOT NULL,
  `bacaan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kebaktian`
--

CREATE TABLE `tb_kebaktian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pendeta` bigint(20) UNSIGNED DEFAULT NULL,
  `id_majelis` bigint(20) UNSIGNED DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `tempat` varchar(50) NOT NULL,
  `tanggal` datetime NOT NULL,
  `bacaan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelayan`
--

CREATE TABLE `tb_pelayan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_jadwal` bigint(20) UNSIGNED NOT NULL,
  `id_majelis` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pernikahan`
--

CREATE TABLE `tb_pernikahan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pendeta` bigint(20) UNSIGNED NOT NULL,
  `id_jemaat_pria` bigint(20) UNSIGNED NOT NULL,
  `id_jemaat_wanita` bigint(20) UNSIGNED NOT NULL,
  `tanggal_pernikahan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ms_jemaat`
--
ALTER TABLE `ms_jemaat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `ms_majelis`
--
ALTER TABLE `ms_majelis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `ms_pendeta`
--
ALTER TABLE `ms_pendeta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `ms_renungan`
--
ALTER TABLE `ms_renungan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pendeta` (`id_pendeta`);

--
-- Indeks untuk tabel `tb_baptis`
--
ALTER TABLE `tb_baptis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pendeta` (`id_pendeta`),
  ADD KEY `id_jemaat` (`id_jemaat`);

--
-- Indeks untuk tabel `tb_jadwal_ibadah`
--
ALTER TABLE `tb_jadwal_ibadah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_majelis` (`id_majelis`),
  ADD KEY `id_pendeta` (`id_pendeta`);

--
-- Indeks untuk tabel `tb_kebaktian`
--
ALTER TABLE `tb_kebaktian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_majelis` (`id_majelis`),
  ADD KEY `id_pendeta` (`id_pendeta`);

--
-- Indeks untuk tabel `tb_pelayan`
--
ALTER TABLE `tb_pelayan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jadwal` (`id_jadwal`),
  ADD KEY `id_majelis` (`id_majelis`);

--
-- Indeks untuk tabel `tb_pernikahan`
--
ALTER TABLE `tb_pernikahan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pendeta` (`id_pendeta`),
  ADD KEY `id_jemaat_pria` (`id_jemaat_pria`),
  ADD KEY `id_jemaat_wanita` (`id_jemaat_wanita`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ms_jemaat`
--
ALTER TABLE `ms_jemaat`
  ADD CONSTRAINT `ms_jemaat_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `ms_majelis`
--
ALTER TABLE `ms_majelis`
  ADD CONSTRAINT `ms_majelis_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `ms_pendeta`
--
ALTER TABLE `ms_pendeta`
  ADD CONSTRAINT `ms_pendeta_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `ms_renungan`
--
ALTER TABLE `ms_renungan`
  ADD CONSTRAINT `ms_renungan_ibfk_1` FOREIGN KEY (`id_pendeta`) REFERENCES `ms_pendeta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_baptis`
--
ALTER TABLE `tb_baptis`
  ADD CONSTRAINT `tb_baptis_ibfk_1` FOREIGN KEY (`id_pendeta`) REFERENCES `ms_pendeta` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_baptis_ibfk_2` FOREIGN KEY (`id_jemaat`) REFERENCES `ms_jemaat` (`id`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_jadwal_ibadah`
--
ALTER TABLE `tb_jadwal_ibadah`
  ADD CONSTRAINT `tb_jadwal_ibadah_ibfk_1` FOREIGN KEY (`id_pendeta`) REFERENCES `ms_pendeta` (`id`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_kebaktian`
--
ALTER TABLE `tb_kebaktian`
  ADD CONSTRAINT `tb_kebaktian_ibfk_1` FOREIGN KEY (`id_pendeta`) REFERENCES `ms_pendeta` (`id`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_pelayan`
--
ALTER TABLE `tb_pelayan`
  ADD CONSTRAINT `tb_pelayan_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_jadwal_ibadah` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_pelayan_ibfk_2` FOREIGN KEY (`id_majelis`) REFERENCES `ms_majelis` (`id`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_pernikahan`
--
ALTER TABLE `tb_pernikahan`
  ADD CONSTRAINT `tb_pernikahan_ibfk_4` FOREIGN KEY (`id_pendeta`) REFERENCES `ms_pendeta` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_pernikahan_ibfk_5` FOREIGN KEY (`id_jemaat_pria`) REFERENCES `ms_jemaat` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_pernikahan_ibfk_6` FOREIGN KEY (`id_jemaat_wanita`) REFERENCES `ms_jemaat` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
