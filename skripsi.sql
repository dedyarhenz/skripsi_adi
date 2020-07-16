-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jul 2020 pada 05.23
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
(102, 'cluster 1', 7),
(103, 'cluster 2', 7),
(104, 'cluster 3', 7),
(261, 'cluster 1', 3),
(262, 'cluster 2', 3),
(263, 'cluster 3', 3);

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
(3203, 15.16, 2, 102),
(3204, 17.75, 7, 102),
(3205, 14.87, 15, 102),
(3206, 17.41, 16, 102),
(3207, 18.29, 17, 102),
(3208, 15.22, 31, 102),
(3209, 17.98, 49, 102),
(3210, 16.36, 60, 102),
(3211, 16.95, 66, 102),
(3212, 14.78, 82, 102),
(3213, 21.44, 90, 102),
(3214, 17.55, 97, 102),
(3215, 19.55, 113, 102),
(3216, 15.52, 124, 102),
(3217, 16.51, 139, 102),
(3218, 18.24, 215, 102),
(3219, 15.6, 225, 102),
(3220, 14.76, 232, 102),
(3221, 16.92, 235, 102),
(3222, 16.63, 239, 102),
(3223, 16.79, 240, 102),
(3224, 20.66, 251, 102),
(3225, 14.73, 293, 102),
(3226, 20.01, 295, 102),
(3227, 21.81, 311, 102),
(3228, 17.24, 349, 102),
(3229, 17.82, 358, 102),
(3230, 16.89, 373, 102),
(3231, 17.16, 388, 102),
(3232, 17.01, 389, 102),
(3233, 15.07, 408, 102),
(3234, 15.37, 426, 102),
(3235, 17.88, 444, 102),
(3236, 19.06, 495, 102),
(3237, 9.19, 22, 103),
(3238, 9.69, 43, 103),
(3239, 8.65, 52, 103),
(3240, 11.29, 59, 103),
(3241, 12.16, 77, 103),
(3242, 11.2, 86, 103),
(3243, 11.54, 109, 103),
(3244, 9.58, 145, 103),
(3245, 12.89, 152, 103),
(3246, 12.74, 162, 103),
(3247, 9.37, 175, 103),
(3248, 10.05, 178, 103),
(3249, 9.28, 187, 103),
(3250, 11.26, 199, 103),
(3251, 9.15, 205, 103),
(3252, 9.03, 257, 103),
(3253, 10.13, 260, 103),
(3254, 12.68, 263, 103),
(3255, 8.85, 280, 103),
(3256, 12.99, 287, 103),
(3257, 12.89, 290, 103),
(3258, 9.94, 296, 103),
(3259, 9.2, 335, 103),
(3260, 12.62, 387, 103),
(3261, 10.54, 398, 103),
(3262, 10.71, 421, 103),
(3263, 10.33, 425, 103),
(3264, 10.92, 428, 103),
(3265, 12.33, 461, 103),
(3266, 10.34, 485, 103),
(3267, 13.12, 172, 103),
(3268, 13.15, 379, 103),
(3269, 13.54, 191, 103),
(3270, 13.57, 341, 103),
(3271, 13.56, 468, 103),
(3272, 13.73, 64, 103),
(3273, 13.99, 5, 103),
(3274, 13.86, 36, 103),
(3275, 13.87, 361, 103),
(3276, 4.77, 20, 104),
(3277, 5.49, 30, 104),
(3278, 6.11, 55, 104),
(3279, 3.43, 69, 104),
(3280, 3.18, 95, 104),
(3281, 5.87, 126, 104),
(3282, 4.26, 150, 104),
(3283, 1.91, 157, 104),
(3284, 5.95, 188, 104),
(3285, 6.33, 254, 104),
(3286, 5.06, 321, 104),
(3287, 4.5, 339, 104),
(3288, 2.51, 360, 104),
(3289, 0.67, 393, 104),
(3290, 5.72, 429, 104),
(3291, 4.32, 454, 104),
(3292, 4.79, 497, 104),
(3293, 6.82, 144, 104),
(3294, 6.42, 252, 104),
(3295, 6.95, 276, 104),
(3296, 6.89, 317, 104),
(3297, 7.29, 37, 104),
(3298, 7.38, 229, 104),
(3299, 7.76, 368, 104),
(3300, 7.89, 103, 104),
(3301, 7.83, 496, 104),
(3302, 8.13, 464, 104),
(8503, 13.99, 5, 261),
(8504, 13.86, 36, 261),
(8505, 11.29, 59, 261),
(8506, 13.73, 64, 261),
(8507, 12.16, 77, 261),
(8508, 11.2, 86, 261),
(8509, 11.54, 109, 261),
(8510, 12.89, 152, 261),
(8511, 12.74, 162, 261),
(8512, 13.12, 172, 261),
(8513, 10.05, 178, 261),
(8514, 13.54, 191, 261),
(8515, 11.26, 199, 261),
(8516, 10.13, 260, 261),
(8517, 12.68, 263, 261),
(8518, 12.99, 287, 261),
(8519, 12.89, 290, 261),
(8520, 9.94, 296, 261),
(8521, 13.57, 341, 261),
(8522, 13.87, 361, 261),
(8523, 13.15, 379, 261),
(8524, 12.62, 387, 261),
(8525, 10.54, 398, 261),
(8526, 10.71, 421, 261),
(8527, 10.33, 425, 261),
(8528, 10.92, 428, 261),
(8529, 12.33, 461, 261),
(8530, 13.56, 468, 261),
(8531, 10.34, 485, 261),
(8532, 9.69, 43, 261),
(8533, 9.58, 145, 261),
(8534, 9.37, 175, 261),
(8535, 9.28, 187, 261),
(8536, 9.19, 22, 261),
(8537, 9.15, 205, 261),
(8538, 9.2, 335, 261),
(8539, 9.03, 257, 261),
(8540, 8.85, 280, 261),
(8541, 8.65, 52, 261),
(8542, 4.77, 20, 262),
(8543, 5.49, 30, 262),
(8544, 7.29, 37, 262),
(8545, 6.11, 55, 262),
(8546, 3.43, 69, 262),
(8547, 3.18, 95, 262),
(8548, 7.89, 103, 262),
(8549, 5.87, 126, 262),
(8550, 6.82, 144, 262),
(8551, 4.26, 150, 262),
(8552, 1.91, 157, 262),
(8553, 5.95, 188, 262),
(8554, 7.38, 229, 262),
(8555, 6.42, 252, 262),
(8556, 6.33, 254, 262),
(8557, 6.95, 276, 262),
(8558, 6.89, 317, 262),
(8559, 5.06, 321, 262),
(8560, 4.5, 339, 262),
(8561, 2.51, 360, 262),
(8562, 7.76, 368, 262),
(8563, 0.67, 393, 262),
(8564, 5.72, 429, 262),
(8565, 4.32, 454, 262),
(8566, 8.13, 464, 262),
(8567, 7.83, 496, 262),
(8568, 4.79, 497, 262),
(8569, 17.75, 7, 263),
(8570, 17.41, 16, 263),
(8571, 18.29, 17, 263),
(8572, 17.98, 49, 263),
(8573, 16.36, 60, 263),
(8574, 16.95, 66, 263),
(8575, 21.44, 90, 263),
(8576, 17.55, 97, 263),
(8577, 19.55, 113, 263),
(8578, 16.51, 139, 263),
(8579, 18.24, 215, 263),
(8580, 16.92, 235, 263),
(8581, 16.63, 239, 263),
(8582, 16.79, 240, 263),
(8583, 20.66, 251, 263),
(8584, 20.01, 295, 263),
(8585, 21.81, 311, 263),
(8586, 17.24, 349, 263),
(8587, 17.82, 358, 263),
(8588, 16.89, 373, 263),
(8589, 17.16, 388, 263),
(8590, 17.01, 389, 263),
(8591, 17.88, 444, 263),
(8592, 19.06, 495, 263),
(8593, 15.52, 124, 263),
(8594, 15.6, 225, 263),
(8595, 15.37, 426, 263),
(8596, 15.22, 31, 263),
(8597, 15.16, 2, 263),
(8598, 15.07, 408, 263),
(8599, 14.87, 15, 263),
(8600, 14.78, 82, 263),
(8601, 14.76, 232, 263),
(8602, 14.73, 293, 263);

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
(223, 1, 1),
(224, 1, 2),
(225, 1, 3),
(226, 1, 4),
(227, 1, 5),
(228, 1, 7),
(229, 1, 8),
(230, 1, 14),
(231, 1, 15),
(232, 1, 16),
(233, 1, 18);

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
-- Struktur dari tabel `hasil_ahp`
--

CREATE TABLE `hasil_ahp` (
  `id_hasil` int(11) NOT NULL,
  `id_cluster` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `nilai_hasil` double NOT NULL,
  `ranking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(4, 'akreditasi'),
(5, 'tes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `link` varchar(100) NOT NULL,
  `id_parent` int(11) DEFAULT 0
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
(16, 'Rekomendasi Sekolah', 'fa fa-university', 'admin/rekomendasi_sekolah', 0),
(18, 'Data Nilai', 'fa fa-pencil-ruler', 'admin/nilai', 0);

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
(15, 408, 2, 3.68),
(16, 408, 3, 168),
(17, 408, 4, 80),
(18, 408, 5, 82),
(27, 235, 2, 3.31),
(28, 235, 3, 161),
(29, 235, 4, 84),
(30, 235, 5, 84),
(31, 55, 2, 3.68),
(32, 55, 3, 168),
(33, 55, 4, 81),
(34, 55, 5, 81),
(35, 497, 2, 3.52),
(36, 497, 3, 161),
(37, 497, 4, 79),
(38, 497, 5, 78),
(42, 426, 2, 4);

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
(2, 'Champlin, Crist and McLaughlin', 'Ms. Serena Morissette', '53188 Peter Ville', '1-950-055-6576', -7.3914, 112.752),
(5, 'Ferry PLC', 'Dr. Kaylah Schultz', '24959 Tressa Port Suite 690', '1-021-493-1222', -7.33185, 112.63),
(7, 'Murphy and Sons', 'Angus Dickinson', '597 Ortiz Islands Suite 957', '1-914-218-2943x14528', -7.35991, 112.609),
(15, 'Pagac-Bashirian', 'Kaycee Boyer', '46733 Madonna Meadows Suite 900', '01168918555', -7.28934, 112.601),
(16, 'Schimmel, Stoltenberg and Kuhic', 'Lesley Rowe', '812 Zemlak Parks', '194.801.2675', -7.10637, 112.687),
(17, 'Turcotte and Sons', 'Samson Herman V', '3862 Nolan Locks', '(585)375-2848x790', -7.39916, 112.649),
(20, 'Herzog and Sons', 'Prof. Eloise Collins', '900 Marks Overpass Suite 591', '839.610.9789x919', -7.21376, 112.735),
(22, 'Rath-Von', 'Joshuah O\'Connell', '3345 Schmidt Estates', '(945)049-2034x2762', -7.19302, 112.785),
(30, 'Rolfson-Becker', 'Jarvis Nikolaus', '790 Lind Crescent Apt. 346', '+49(9)8282370012', -7.29846, 112.758),
(31, 'Ernser, McKenzie and Cummerata', 'Juwan Tromp', '658 Graham Square', '067.125.7610', -7.39141, 112.708),
(36, 'Dooley, Balistreri and Block', 'Lamont Sipes', '9734 Arlie Viaduct Suite 528', '(042)987-4552', -7.3808, 112.721),
(37, 'Murray-Frami', 'Ms. Alison Weissnat I', '1531 Toy Fields', '428.051.3426x20936', -7.19152, 112.74),
(43, 'Pollich, Windler and Nader', 'Maia Muller', '89448 Reese Common', '845.615.2564x823', -7.22994, 112.648),
(49, 'Wolff PLC', 'Kirsten Lowe MD', '48164 Barrows Haven Suite 020', '(281)820-0533', -7.10223, 112.683),
(52, 'Langworth, Ullrich and Mayert', 'Elvis Weissnat', '19439 Daryl Springs Apt. 593', '499.075.4313', -7.33112, 112.754),
(55, 'Bashirian Ltd', 'Adan Purdy', '8460 Heather Wells', '1-161-334-2592', -7.20175, 112.736),
(59, 'Leuschke Ltd', 'Lyda Block', '553 Alford Fields', '(971)943-0150x81293', -7.29963, 112.639),
(60, 'Effertz, Shanahan and Heidenreich', 'Pete Carroll', '2489 Marquardt Fall Apt. 582', '1-317-268-7581x9681', -7.11377, 112.696),
(64, 'Johnston Inc', 'Kari Keebler MD', '571 Koss Route Apt. 614', '(267)208-7990', -7.15781, 112.657),
(66, 'Rice-Mueller', 'Norma Kris Sr.', '91523 Vicenta Lock Suite 355', '921.153.3706x196', -7.11301, 112.68),
(69, 'Hoppe and Sons', 'Kendra Larkin', '202 Jacobi Points', '231-686-7623x575', -7.22689, 112.74),
(77, 'Koss-Osinski', 'Alysa Bartell V', '2297 Kuvalis Plains Apt. 512', '+82(1)7739456951', -7.15118, 112.761),
(82, 'O\'Keefe, Harber and Fadel', 'Mrs. Natalia Morissette', '82399 Block Islands Apt. 702', '+58(0)0205297143', -7.14968, 112.652),
(86, 'Oberbrunner and Sons', 'Miss Dasia Lemke II', '6252 Feil Mountains Suite 920', '143.322.1313', -7.35046, 112.695),
(90, 'Price, Friesen and Grant', 'Mrs. Cydney Boyle V', '1291 Kacie Cape Apt. 661', '(194)445-7076', -7.10776, 112.608),
(95, 'Erdman, Gutkowski and Gerhold', 'Mackenzie Maggio DVM', '05604 Corwin River Apt. 444', '979-311-2515x07596', -7.25127, 112.76),
(97, 'Zulauf LLC', 'Bianka Feeney', '247 Mozelle Summit', '489.649.6458x5176', -7.1128, 112.666),
(103, 'Considine LLC', 'Aryanna Simonis', '79932 Ciara Station', '435-175-2963', -7.28751, 112.796),
(109, 'Kilback, Zieme and Leannon', 'Drake Ward', '632 Stoltenberg Village', '+37(9)9786743558', -7.35649, 112.76),
(113, 'Stiedemann, Harvey and Jacobson', 'Kiel Monahan', '8600 Hegmann Stravenue Suite 749', '(230)428-1968x505', -7.13164, 112.607),
(124, 'Kemmer-Bergnaum', 'Anita Adams', '5161 Frami Estate', '(248)048-8656', -7.39564, 112.72),
(126, 'Little, Franecki and O\'Reilly', 'Orrin Anderson PhD', '709 Smitham Pike Apt. 157', '+67(5)9590517494', -7.30041, 112.702),
(139, 'Tromp, Stanton and Brown', 'Amira Wilkinson', '9010 Hoeger Corner', '679-127-3781x13115', -7.34308, 112.61),
(144, 'Glover-Morar', 'Rosella Oberbrunner', '75082 Burnice Spring Apt. 219', '(441)312-0333x94945', -7.23633, 112.79),
(145, 'Runolfsdottir, Reichert and Maggio', 'Prof. Bradford Zieme', '82830 Israel Key', '814.197.7485x492', -7.18149, 112.689),
(150, 'Daugherty, Jenkins and Hermiston', 'Krystel Lehner', '6778 Thad View Suite 370', '1-306-320-7791', -7.24185, 112.696),
(152, 'Ratke-Fay', 'Alvina Fahey', '474 Hettinger Turnpike Suite 130', '(059)791-5337x70749', -7.20497, 112.627),
(157, 'Pagac, White and Turcotte', 'Dannie Beatty', '59811 Joe Rest', '381-828-3202x35756', -7.24736, 112.717),
(162, 'Mills and Sons', 'Melyna Gutkowski PhD', '237 Zula Square', '(747)442-1375x27541', -7.27058, 112.617),
(172, 'Gutkowski-D\'Amore', 'Amiya Gerlach', '83569 Daniella Falls', '1-303-571-1421x2193', -7.36921, 112.767),
(175, 'Stamm-Boehm', 'Ari Lueilwitz', '6720 Natalie Circle Apt. 083', '619.751.8577', -7.22247, 112.654),
(178, 'O\'Reilly and Sons', 'Verna Feest', '88504 Sophia Avenue Suite 694', '+53(9)8761992383', -7.16641, 112.738),
(187, 'Halvorson, Kutch and VonRueden', 'Reuben Graham', '33769 Heller Centers Suite 142', '130.327.5763', -7.27678, 112.65),
(188, 'Kirlin-Baumbach', 'Dr. Sadie Schamberger', '62385 Kertzmann Terrace', '511.100.0263', -7.24486, 112.679),
(191, 'Paucek-Weber', 'Dr. Nestor Shanahan', '5127 West Oval', '448.270.5573x77905', -7.3771, 112.714),
(199, 'Nader Inc', 'Karianne Kovacek', '35531 Vance Hill Apt. 359', '+18(6)1320709288', -7.29695, 112.638),
(205, 'Hauck-Cartwright', 'Cayla Wyman', '2186 Kenton Square', '959.466.1178', -7.2071, 112.798),
(215, 'Lehner Group', 'Mireya Collier', '33591 Guiseppe Lane', '1-699-140-7040', -7.11569, 112.647),
(225, 'Cruickshank-Cummerata', 'Stephon Pacocha I', '6819 Pacocha Hill Apt. 729', '(712)263-7768x76897', -7.39029, 112.689),
(229, 'Towne Inc', 'Myah O\'Kon', '2094 Brandy Ridge', '+63(3)7110414777', -7.29345, 112.676),
(232, 'Sipes and Sons', 'Ladarius Jenkins', '654 Flatley Path Apt. 309', '612.274.2079x178', -7.16914, 112.631),
(235, 'Bernhard Qaz', 'Prof. Sage Baumbach DVM', '7983 Pietro Crossing', '+17(0)4542997333', -7.39114, 112.66),
(239, 'Rolfson Ltd', 'Elian Pagac', '04207 Monte Corners Suite 956', '332.815.4107x890', -7.13279, 112.647),
(240, 'Casper, Nikolaus and O\'Connell', 'Kamren Gerhold', '402 Stanley Roads', '264.438.9670', -7.39633, 112.674),
(251, 'Gutmann Inc', 'Mertie Legros', '64255 Russel Port Suite 183', '06011463499', -7.11615, 112.609),
(252, 'Glover-Metz', 'Tristin Halvorson', '27991 Fahey Cliffs Apt. 939', '06223914618', -7.31389, 112.725),
(254, 'Pagac, Dach and Schmeler', 'Craig Rowe', '79299 Kaylie Points Apt. 068', '1-169-043-8731x958', -7.21274, 112.695),
(257, 'Heathcote, Schuster and Tromp', 'Wilton Fahey', '419 Gutkowski Drives Suite 170', '249-024-7082x961', -7.17568, 112.739),
(260, 'Schimmel, Beatty and Dach', 'Abe Hoeger', '12284 Gillian Port', '+13(8)2054252480', -7.26224, 112.64),
(263, 'Casper Group', 'Prof. Georgiana Abshire', '5083 Graham Viaduct', '341-986-4841', -7.14254, 112.734),
(276, 'Collier, Emard and Greenfelder', 'Eloy Beer', '417 Pfannerstill Port Apt. 150', '300.150.4689', -7.20418, 112.766),
(280, 'Robel, Emard and Corwin', 'Torrey Marquardt', '776 Shanny Mill Suite 612', '1-666-216-2482x68432', -7.29435, 112.661),
(287, 'Koepp, Dickinson and McKenzie', 'Mike Friesen', '2004 Ryleigh Fork', '(141)916-4675x9241', -7.18202, 112.641),
(290, 'Doyle, Padberg and Champlin', 'Hiram Dare', '229 Trantow Trafficway Suite 666', '276-078-8824x597', -7.36341, 112.777),
(293, 'Schaden, Heidenreich and Konopelski', 'Hiram Larkin III', '0580 Milton Street Apt. 610', '(100)824-2398x19430', -7.34791, 112.635),
(295, 'Murazik LLC', 'Miss Julie Orn Jr.', '3988 Stacey Mission', '779-368-9304x489', -7.3804, 112.6),
(296, 'Strosin, Collier and Jones', 'Selina Lakin', '229 Cleta Common Apt. 814', '729-210-8142', -7.24736, 112.642),
(311, 'Jones, Schimmel and Kutch', 'Quinton Kunze V', '47949 Oberbrunner Creek', '405.597.0921x84021', -7.10114, 112.611),
(317, 'Eichmann, Huels and Wunsch', 'Prof. Carmel Kling', '8994 Madalyn Street Apt. 536', '(018)334-2279', -7.27503, 112.672),
(321, 'Leffler Group', 'Olaf Reilly Jr.', '464 Kallie Forges', '+60(8)1762745555', -7.25261, 112.686),
(335, 'Swaniawski, Mayer and Lueilwitz', 'Prof. Ulices Veum IV', '88073 Sister Keys Apt. 003', '739.523.6060x7423', -7.17698, 112.709),
(339, 'Lindgren-Zemlak', 'Nathanial Schoen', '12733 Robel Trail Apt. 718', '(662)598-4866x2062', -7.22294, 112.709),
(341, 'Sporer-Hettinger', 'Betty Hammes', '59137 Maggio Underpass', '(115)346-4857x2296', -7.16618, 112.649),
(349, 'Jacobs LLC', 'Una Hyatt', '246 Rachelle Lane Suite 535', '(718)441-1965x707', -7.39771, 112.667),
(358, 'Hansen-Weimann', 'Etha Botsford', '0925 Stark Path', '475.992.9254', -7.14368, 112.617),
(360, 'Nader-Wilkinson', 'Prof. Grayce Goodwin', '3169 Ritchie Gateway', '(967)378-5262x8355', -7.27225, 112.748),
(361, 'Harber, Treutel and Erdman', 'Aiden Ondricka', '21804 Barney Squares', '052.809.0331x7008', -7.35765, 112.658),
(368, 'Ernser-McDermott', 'Bryon Hartmann', '0595 Braxton Fields Suite 604', '1-334-565-5722x77108', -7.19746, 112.769),
(373, 'Rath-Haley', 'Providenci McClure', '668 Ruecker Valleys', '(886)906-0692x46645', -7.39133, 112.661),
(379, 'Reilly, Parker and Balistreri', 'Mrs. Opal Lemke III', '85687 Connelly Fields', '393.285.1250x348', -7.35916, 112.791),
(387, 'Frami, Collins and Kassulke', 'Ara Spencer', '4999 Zieme Plaza Suite 529', '848.718.4416', -7.18602, 112.642),
(388, 'Torp Ltd', 'Savanah Hand', '290 Margarette Burgs', '(785)675-2231x6082', -7.11245, 112.676),
(389, 'Crooks-Windler', 'Kaylie Koepp', '8965 Eleanora Inlet Suite 093', '(208)680-0974', -7.11891, 112.799),
(393, 'Hegmann LLC', 'Darrell Walter', '92700 Murray Dam Apt. 197', '07853364312', -7.26081, 112.736),
(398, 'Smith PLC', 'Mr. Boyd Cummings II', '27334 Elnora Rest Apt. 870', '(570)925-3264x79207', -7.16257, 112.719),
(408, 'Balistreri, Zulauf and Rempel', 'Juston Kunde PhD', '7761 Dannie Lights', '06449663556', -7.19121, 112.612),
(421, 'Volkman-Hegmann', 'Sherwood Gutkowski', '096 Darius Valley', '1-192-293-2956', -7.33633, 112.786),
(425, 'Nolan-Feeney', 'Irma Harvey', '3206 Raleigh Ville Apt. 218', '600.604.6725x7265', -7.16951, 112.699),
(426, 'Cartwright Inc', 'Gilda Kassulke', '731 Kunze Stream', '1-045-173-8273', -7.13076, 112.674),
(428, 'Moen, Weimann and Reichel', 'Dr. Glenda Von', '99917 Maximus Parkways', '(330)487-8659x85815', -7.1846, 112.799),
(429, 'Mayert-Wiza', 'Thora Feil', '971 Fisher Throughway', '+69(8)7819598790', -7.20718, 112.717),
(444, 'Keeling PLC', 'Ines Boyer', '62159 Hirthe Forest Suite 269', '1-586-045-7666', -7.11282, 112.659),
(454, 'Gerlach, Kovacek and Conroy', 'Brain Smith', '81628 Simonis Trace Apt. 236', '447-592-0486', -7.29016, 112.712),
(461, 'Larkin-Hoppe', 'Elsie Wuckert IV', '958 Pagac Neck', '911-791-6604', -7.35837, 112.776),
(464, 'Trantow PLC', 'Prof. Noemi Brown', '6538 Kathryne Ports Suite 258', '907-136-7281', -7.30122, 112.79),
(468, 'Kihn LLC', 'Chanel Emard', '28077 Swift Pass', '253-878-3530', -7.13849, 112.701),
(485, 'Goodwin, Feest and Donnelly', 'Jammie Conroy III', '2986 Carroll Freeway Apt. 303', '1-023-613-5456x7844', -7.17313, 112.773),
(495, 'Rath-Huel', 'Rashad Erdman III', '341 Kristy Station Apt. 948', '(831)079-4408x52535', -7.38827, 112.621),
(496, 'Kozey and Sons', 'Dr. Barton Lubowitz MD', '65679 Davis Loaf Apt. 147', '920.713.6512', -7.27007, 112.662),
(497, 'Bechtelar LLC', 'Mr. Neil O\'Keefe', '68931 Hackett Mountains Apt. 887', '+42(5)0934314930', -7.25937, 112.775);

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
(4, 'mmnmn', '17799352_876a694a-a449-44d9-baf4-8fd811563df3_1050_1048.jpg', 'mnmnmm', '$2y$10$/LU6TZYdsyZR.VFHfqWKKeHZ09J/1j2/ljgcehCB59qWXgdPMKpMa'),
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
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_kriteria` (`id_kriteria`);

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
  MODIFY `id_cluster` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT untuk tabel `detail_cluster`
--
ALTER TABLE `detail_cluster`
  MODIFY `id_detail_cluster` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8603;

--
-- AUTO_INCREMENT untuk tabel `detail_menu`
--
ALTER TABLE `detail_menu`
  MODIFY `id_detail_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT untuk tabel `detail_role`
--
ALTER TABLE `detail_role`
  MODIFY `id_detail_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `hasil_ahp`
--
ALTER TABLE `hasil_ahp`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1621;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
