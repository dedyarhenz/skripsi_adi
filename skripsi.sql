-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Jul 2020 pada 16.32
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.2.24

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
-- Struktur dari tabel `cluster`
--

CREATE TABLE `cluster` (
  `id_cluster` int(11) NOT NULL,
  `nama_cluster` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cluster`
--

INSERT INTO `cluster` (`id_cluster`, `nama_cluster`, `id_user`) VALUES
(422, 'cluster 1', 3),
(423, 'cluster 2', 3),
(424, 'cluster 3', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_cluster`
--

CREATE TABLE `detail_cluster` (
  `id_detail_cluster` int(11) NOT NULL,
  `jarak_sekolah` float NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `id_cluster` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_cluster`
--

INSERT INTO `detail_cluster` (`id_detail_cluster`, `jarak_sekolah`, `id_sekolah`, `id_cluster`) VALUES
(10833, 2.23, 9, 422),
(10834, 9.74, 5, 422),
(10835, 2.25, 8, 423),
(10836, 4.98, 7, 423),
(10837, 8.76, 6, 423),
(10838, 10.02, 1, 423),
(10839, 2.78, 10, 424),
(10840, 13.18, 3, 424),
(10841, 8.08, 4, 424),
(10842, 11.81, 2, 424);

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
(234, 2, 14),
(235, 2, 15),
(236, 2, 16),
(270, 1, 1),
(271, 1, 2),
(272, 1, 3),
(273, 1, 4),
(274, 1, 5),
(275, 1, 7),
(276, 1, 8),
(277, 1, 14),
(278, 1, 15),
(279, 1, 16),
(280, 1, 18);

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
(20, 9, 1),
(21, 9, 2),
(26, 7, 1),
(27, 7, 2),
(28, 10, 2),
(29, 5, 2),
(30, 4, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil_ahp`
--

CREATE TABLE `hasil_ahp` (
  `id_hasil` int(11) NOT NULL,
  `id_cluster` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `nilai_hasil` double NOT NULL,
  `ranking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `hasil_ahp`
--

INSERT INTO `hasil_ahp` (`id_hasil`, `id_cluster`, `id_sekolah`, `nilai_hasil`, `ranking`) VALUES
(1862, 422, 5, 0.56973896075965, 1),
(1863, 422, 9, 0.43026103924035, 2),
(1864, 423, 6, 0.3098054040205, 1),
(1865, 423, 8, 0.27620046075683, 2),
(1866, 423, 1, 0.22237655124699, 3),
(1867, 423, 7, 0.19161758397569, 4),
(1868, 424, 2, 0.27556418032778, 1),
(1869, 424, 4, 0.27460631855259, 2),
(1870, 424, 10, 0.23184801519717, 3),
(1871, 424, 3, 0.21798148592246, 4);

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
(2, 'perpus'),
(3, 'biaya'),
(4, 'akreditasi'),
(5, 'lab');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `menu`, `icon`, `link`) VALUES
(1, 'Dashboard', 'fas fa-fw fa-tachometer-alt', 'admin/dashboard'),
(2, 'Data User', 'fas fa-fw fa-users', 'admin/user'),
(3, 'Data Role', 'fas fa-fw fa-user-tag', 'admin/role'),
(4, 'Data Sekolah', 'fas fa-fw fa-graduation-cap', 'admin/sekolah'),
(5, 'Data Kriteria', 'fas fa-fw fa-sitemap', 'admin/kriteria'),
(6, 'Bobot Sekolah', 'fas fa-fw fa-chart-area', 'admin/bobotsekolah'),
(7, 'Menu', 'fa fa-align-justify', 'admin/menu'),
(8, 'Akses Menu', 'fa fa-tasks', 'admin/detail_menu'),
(14, 'Profile Saya', 'fas fa-fw fa-user', 'admin/profile'),
(15, 'Ganti Password', 'fas fa-fw fa-key', 'admin/profile/changepassword'),
(16, 'Rekomendasi Sekolah', 'fa fa-university', 'admin/rekomendasi_sekolah'),
(18, 'Data Nilai', 'fa fa-pencil-ruler', 'admin/nilai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_sekolah` int(11) DEFAULT NULL,
  `id_kriteria` int(11) DEFAULT NULL,
  `nilai` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_sekolah`, `id_kriteria`, `nilai`) VALUES
(53, 1, 4, 2),
(54, 6, 4, 2),
(55, 2, 4, 3),
(56, 7, 4, 2),
(57, 8, 4, 2),
(58, 5, 4, 3),
(59, 4, 4, 3),
(60, 3, 4, 2),
(61, 10, 4, 3),
(62, 9, 4, 3),
(63, 9, 2, 1),
(64, 9, 3, 350000),
(65, 9, 5, 1),
(66, 10, 2, 1),
(67, 10, 3, 250000),
(68, 10, 5, 1),
(69, 3, 5, 0),
(70, 3, 2, 1),
(71, 3, 3, 260000),
(72, 4, 5, 2),
(73, 4, 2, 1),
(74, 4, 3, 300000),
(75, 5, 2, 2),
(76, 5, 5, 1),
(77, 5, 3, 450000),
(78, 8, 2, 2),
(79, 8, 5, 1),
(80, 8, 3, 200000),
(81, 7, 2, 0),
(82, 7, 5, 0),
(83, 7, 3, 200000),
(84, 2, 2, 1),
(85, 2, 3, 320000),
(86, 2, 5, 1),
(87, 6, 5, 1),
(88, 6, 2, 2),
(89, 6, 3, 240000),
(90, 1, 5, 0),
(91, 1, 2, 1),
(92, 1, 3, 200000);

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
  `latitude` double NOT NULL DEFAULT 0,
  `longtitude` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sekolah`
--

INSERT INTO `sekolah` (`id_sekolah`, `nama_sekolah`, `nama_kepala_sekolah`, `alamat_sekolah`, `no_telepon`, `latitude`, `longtitude`) VALUES
(1, 'SDI AL MUAWANAH', 'Lestari Yustianti Sultan, S.Pd.I', 'Jl. Sememi Jaya VIII-B/20 , Sememi, Kec. Benowo', '031 7403231', -7.2495488, 112.6411211),
(2, 'SD ISLAM NURUL IMAN SURABAYA', 'EVI YUNIARTI, SE', 'Jl .SEMEMI JAYA IV/55 SURABAYA, Sememi, Kec. Benowo', '031-7416466', -7.2351522, 112.6268343),
(3, 'SD ALAZHAR BEHJI', 'UMMU WAROH, S.Pd.I', 'JL.PESAREHAN BEJI NO. 1 , Pakal, Kec. Pakal', '317411318', -7.2431982, 112.6129735),
(4, 'SD CIKAL', 'Anggiet Noviana Puteri S.Pd', 'Jl. Raya Lontar No. 103 , Lontar, Kec. Sambikerep', '031-7527900/7527766', -7.2830037, 112.6634521),
(5, 'SD CIPUTRA SURABAYA', 'Diana Sumadianti, S. Kom, M. M', 'Jl. PURI WIDYA KENCANA.CITRA RAYA SURABAYA, Lidah Kulon, Kec. Lakarsantri', '7415018 ext. 5203', -7.2926953, 112.6511931),
(6, 'SD LABSCHOOL UNESA', 'Hapsari Dewi, S.Pd.', 'JL. CITRA RAYA UNESA RD SURABAYA , Lidah Wetan, Kec. Lakarsantri', '031-99427804', -7.2989496, 112.6646692),
(7, 'SD INKLUSI AMARYLLIS', 'Supriyati S.Pd', 'Jl. Darmo Indah Timur Q 27, Tandes, Kec. Tandes', '031-7312423', -7.2631359, 112.6869769),
(8, 'SD HANURA BINA PUTRA SURABAYA', 'Dra.Hj.Fatmawati', 'Jl. GENTING IV No. 44 SURABAYA , Genting Kalianak, Kec. Asemrowo', '031-3532192', -7.2437162, 112.7158821),
(9, 'SD AL AHMADI', 'Rusmina,S.Ag', 'JL. SIMOREJO Gg VI NO 3 SURBAYA , Simomulyo, Kec. Sukomanunggal', '031-5313818', -7.2547077, 112.7115366),
(10, 'SD AL HIKMAH SURABAYA', 'NUZULIYAH S.Ag', 'Jl. SIMO KALANGAN I/146 SURABAYA, Simomulyo, Kec. Sukomanunggal', '315660218', -7.268299, 112.709436);

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
(3, 'dedy irawan', 'day2-gaming-console.png', 'dedy', '$2y$10$2AlEejxa0eJKChWNYTok1OrMDXT5oIHEAbxSGdFTWtQWheMt4RM7.'),
(4, 'mmnmn', 'day94-ui-ux.png', 'mnmnmm', '$2y$10$/LU6TZYdsyZR.VFHfqWKKeHZ09J/1j2/ljgcehCB59qWXgdPMKpMa'),
(5, 'irawan', 'day29-selfie-boy.png', 'irawan', '$2y$10$SdqCXEtgKXHCu6eWCUN5keY8b6xbvI1TVoFTkgcDxjjVixpG83naC'),
(6, 'tes', 'default.jpg', 'tes', '$2y$10$wuI4lWt8ZFuzA59rjtxPsu8l.QIl920ekVIH9LIWSXKhSvbUyX0dO'),
(7, 'tesa', 'default.jpg', 'tesdetail', '$2y$10$hO6OxsD6Wh6YNK5.lbMoSux7RsJ41WcIzyRt.xCSMRREoIewcyHsu'),
(9, 'qazwsx', 'default.jpg', 'qazwsx', '$2y$10$XEq4.uVxNRugr8ND/dRPTuI8Ne3tOHLHUmtsZvYsn9mFUhhtkHzo6'),
(10, 'akunregister', 'default.jpg', 'akunregister', '$2y$10$6ZhGWX7BbCeMLzQtTagMb.eohAsL4OflUjQVgb4nbQdTxkVWbSbny');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cluster`
--
ALTER TABLE `cluster`
  ADD PRIMARY KEY (`id_cluster`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `detail_cluster`
--
ALTER TABLE `detail_cluster`
  ADD PRIMARY KEY (`id_detail_cluster`),
  ADD KEY `id_cluster` (`id_cluster`),
  ADD KEY `id_sekolah` (`id_sekolah`);

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
-- Indeks untuk tabel `hasil_ahp`
--
ALTER TABLE `hasil_ahp`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `id_cluster` (`id_cluster`),
  ADD KEY `id_sekolah` (`id_sekolah`);

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
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_kriteria` (`id_kriteria`),
  ADD KEY `id_sekolah` (`id_sekolah`);

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
-- AUTO_INCREMENT untuk tabel `cluster`
--
ALTER TABLE `cluster`
  MODIFY `id_cluster` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT untuk tabel `detail_cluster`
--
ALTER TABLE `detail_cluster`
  MODIFY `id_detail_cluster` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10843;

--
-- AUTO_INCREMENT untuk tabel `detail_menu`
--
ALTER TABLE `detail_menu`
  MODIFY `id_detail_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT untuk tabel `detail_role`
--
ALTER TABLE `detail_role`
  MODIFY `id_detail_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `hasil_ahp`
--
ALTER TABLE `hasil_ahp`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1872;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  MODIFY `id_sekolah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cluster`
--
ALTER TABLE `cluster`
  ADD CONSTRAINT `cluster_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_cluster`
--
ALTER TABLE `detail_cluster`
  ADD CONSTRAINT `detail_cluster_ibfk_1` FOREIGN KEY (`id_cluster`) REFERENCES `cluster` (`id_cluster`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_cluster_ibfk_2` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Ketidakleluasaan untuk tabel `hasil_ahp`
--
ALTER TABLE `hasil_ahp`
  ADD CONSTRAINT `hasil_ahp_ibfk_1` FOREIGN KEY (`id_cluster`) REFERENCES `cluster` (`id_cluster`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_ahp_ibfk_2` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
