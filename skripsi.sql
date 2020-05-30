-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Bulan Mei 2020 pada 00.57
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
  `password` varchar(100) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `foto`, `username`, `password`, `role`) VALUES
(1, 'qwerty', 'default.jpg', 'qwerty', '$2y$10$HDje7hb7DOoLAozGS767tezlD5vM7VAcEFE7eie7X3q1KaPyYiOWe', 2),
(2, 'budi', 'pencil-116-156206.png', 'budi', '$2y$10$IIEgNgBPLvvxZ6ER0ZQxQOqTBujUOo/iMz5E.LwhQQ94r6mo/XaoW', 1),
(3, 'dedy irawan', '17799352_876a694a-a449-44d9-baf4-8fd811563df3_1050_10481.jpg', 'dedy', '$2y$10$2AlEejxa0eJKChWNYTok1OrMDXT5oIHEAbxSGdFTWtQWheMt4RM7.', 1),
(4, 'mmnmn', '17799352_876a694a-a449-44d9-baf4-8fd811563df3_1050_1048.jpg', 'mnmnmm', '$2y$10$/LU6TZYdsyZR.VFHfqWKKeHZ09J/1j2/ljgcehCB59qWXgdPMKpMa', 1),
(5, 'irawan', 'gear.png', 'irawan', '$2y$10$SdqCXEtgKXHCu6eWCUN5keY8b6xbvI1TVoFTkgcDxjjVixpG83naC', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

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
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  MODIFY `id_sekolah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
