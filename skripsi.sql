-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Jun 2020 pada 16.07
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_menu`
--

CREATE TABLE `detail_menu` (
  `id_detail_menu` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_menu`
--

INSERT INTO `detail_menu` (`id_detail_menu`, `id_role`, `id_menu`) VALUES
(133, 2, 1),
(134, 2, 14),
(135, 2, 15),
(136, 2, 16),
(190, 1, 1),
(191, 1, 2),
(192, 1, 3),
(193, 1, 4),
(194, 1, 5),
(195, 1, 6),
(196, 1, 7),
(197, 1, 8),
(198, 1, 14),
(199, 1, 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_role`
--

CREATE TABLE `detail_role` (
  `id_detail_role` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_role`
--

INSERT INTO `detail_role` (`id_detail_role`, `id_user`, `id_role`) VALUES
(1, 2, 1),
(2, 3, 1),
(5, 4, 2),
(20, 9, 1),
(21, 9, 2),
(26, 7, 1),
(27, 7, 2),
(28, 10, 2),
(29, 5, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `nama_kriteria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama_kriteria`) VALUES
(2, 'fasilitas'),
(3, 'biaya'),
(4, 'akreditasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `link` varchar(100) NOT NULL,
  `id_parent` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `menu`, `icon`, `link`, `id_parent`) VALUES
(1, 'Dashboard', 'fas fa-fw fa-tachometer-alt', 'admin/dashboard', 0),
(2, 'Data User', 'fas fa-fw fa-users', 'admin/user', 0),
(3, 'Data Role', 'fas fa-fw fa-user-tag', 'admin/role', 0),
(4, 'Data Sekolah', 'fas fa-fw fa-graduation-cap', 'admin/sekolah', 0),
(5, 'Data Kriteria', 'fas fa-fw fa-sitemap', 'admin/kriteria', 0),
(6, 'Bobot Sekolah', 'fas fa-fw fa-chart-area', 'admin/bobotsekolah', 0),
(7, 'Menu', 'fa fa-align-justify', 'admin/menu', 0),
(8, 'Akses Menu', 'fa fa-tasks', 'admin/detail_menu', 0),
(14, 'Profile Saya', 'fas fa-fw fa-user', 'admin/profile', 0),
(15, 'Ganti Password', 'fas fa-fw fa-key', 'admin/profile/changepassword', 0),
(16, 'Rekomendasi Sekolah', 'fa fa-university', 'admin/rekomendasi', 0),
(18, 'tes', 'tes', 'tes', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id_role`, `role`) VALUES
(1, 'admin'),
(2, 'wali murid');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sekolah`
--

CREATE TABLE `sekolah` (
  `id_sekolah` int(11) NOT NULL,
  `nama_sekolah` varchar(100) NOT NULL,
  `nama_kepala_sekolah` varchar(100) NOT NULL,
  `alamat_sekolah` text NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `latitude` float NOT NULL,
  `longtitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sekolah`
--

INSERT INTO `sekolah` (`id_sekolah`, `nama_sekolah`, `nama_kepala_sekolah`, `alamat_sekolah`, `no_telepon`, `latitude`, `longtitude`) VALUES
(2, 'sd 1 surabaya', 'susi', 'Jl. panglima sudirman', '089676556466', 6009.22, 7111.98);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `foto`, `username`, `password`) VALUES
(2, 'budi', 'pencil-116-156206.png', 'budi', '$2y$10$IIEgNgBPLvvxZ6ER0ZQxQOqTBujUOo/iMz5E.LwhQQ94r6mo/XaoW'),
(3, 'dedy irawan', '00852c00d4b02529b12f8323d3309435.jpg', 'dedy', '$2y$10$2AlEejxa0eJKChWNYTok1OrMDXT5oIHEAbxSGdFTWtQWheMt4RM7.'),
(4, 'mmnmn', '17799352_876a694a-a449-44d9-baf4-8fd811563df3_1050_1048.jpg', 'mnmnmm', '$2y$10$/LU6TZYdsyZR.VFHfqWKKeHZ09J/1j2/ljgcehCB59qWXgdPMKpMa'),
(5, 'irawan', 'gear.png', 'irawan', '$2y$10$SdqCXEtgKXHCu6eWCUN5keY8b6xbvI1TVoFTkgcDxjjVixpG83naC'),
(6, 'tes', 'default.jpg', 'tes', '$2y$10$wuI4lWt8ZFuzA59rjtxPsu8l.QIl920ekVIH9LIWSXKhSvbUyX0dO'),
(7, 'tesa', 'default.jpg', 'tesdetail', '$2y$10$hO6OxsD6Wh6YNK5.lbMoSux7RsJ41WcIzyRt.xCSMRREoIewcyHsu'),
(9, 'qazwsx', 'default.jpg', 'qazwsx', '$2y$10$XEq4.uVxNRugr8ND/dRPTuI8Ne3tOHLHUmtsZvYsn9mFUhhtkHzo6'),
(10, 'akunregister', 'default.jpg', 'akunregister', '$2y$10$6ZhGWX7BbCeMLzQtTagMb.eohAsL4OflUjQVgb4nbQdTxkVWbSbny');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_menu`
--
ALTER TABLE `detail_menu`
  ADD PRIMARY KEY (`id_detail_menu`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indeks untuk tabel `detail_role`
--
ALTER TABLE `detail_role`
  ADD PRIMARY KEY (`id_detail_role`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_role` (`id_role`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_menu`
--
ALTER TABLE `detail_menu`
  MODIFY `id_detail_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT untuk tabel `detail_role`
--
ALTER TABLE `detail_role`
  MODIFY `id_detail_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  MODIFY `id_sekolah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_menu`
--
ALTER TABLE `detail_menu`
  ADD CONSTRAINT `detail_menu_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`),
  ADD CONSTRAINT `detail_menu_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Ketidakleluasaan untuk tabel `detail_role`
--
ALTER TABLE `detail_role`
  ADD CONSTRAINT `detail_role_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_role_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
