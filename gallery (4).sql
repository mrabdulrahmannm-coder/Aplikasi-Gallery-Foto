-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Okt 2024 pada 01.06
-- Versi server: 10.1.32-MariaDB
-- Versi PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gallery`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `album_id` int(11) NOT NULL,
  `namaalbum` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggaldibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`album_id`, `namaalbum`, `deskripsi`, `tanggaldibuat`, `user_id`) VALUES
(3, 'anime', 'ini daftar untuk wibu', '2024-10-11 06:31:29', 1),
(4, 'alam', 'ini daftarfoto alam\r\n', '2024-10-14 03:35:06', 2),
(5, 'hewan', 'hewan-hewan', '2024-10-14 14:43:07', 1),
(6, 'Pohon', 'pohon-pohon', '2024-10-14 14:45:23', 1),
(9, 'baru', 'baru-baru', '2024-10-15 07:11:24', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `foto`
--

CREATE TABLE `foto` (
  `foto_id` int(11) NOT NULL,
  `judulfoto` varchar(255) NOT NULL,
  `deskripsifoto` text NOT NULL,
  `tanggalunggah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lokasifile` varchar(255) NOT NULL,
  `album_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `foto`
--

INSERT INTO `foto` (`foto_id`, `judulfoto`, `deskripsifoto`, `tanggalunggah`, `lokasifile`, `album_id`, `user_id`) VALUES
(11, 'masjid', 'ini foto masjid dari pixabay', '2024-10-13 17:00:00', '73-kata-bijak-islami-dari-al-quran-dan-hadis-bisa-jadi-pedoman-hidup-terbaik-2103021.jpg', 4, 2),
(12, 'japan', 'sore hari', '2024-10-13 17:00:00', 'wallhaven-p9dp7p.jpg', 3, 1),
(16, 'utta', 'anime romance', '2024-10-14 17:00:00', 'otonari.no_.tenshi-sama.3.jpg', 3, 1),
(17, 'Ejen ali', 'ali-ejen', '2024-10-14 17:00:00', 'jen ali.jpg', 3, 1),
(18, 'Serigala', 'Serigala albino', '2024-10-14 17:00:00', 'wolves-2864647_1280.jpg', 5, 1),
(19, 'Pohon Di Tanah Hijau', 'pohon-pohon', '2024-10-14 17:00:00', 'tree-7186835_1280.jpg', 6, 1),
(21, 'a', 'a', '2024-10-14 17:00:00', '91pTFwdoSpL.jpg', 9, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentarfoto`
--

CREATE TABLE `komentarfoto` (
  `komentar_id` int(11) NOT NULL,
  `foto_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `isikomentar` text NOT NULL,
  `tanggalkomentar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `komentarfoto`
--

INSERT INTO `komentarfoto` (`komentar_id`, `foto_id`, `user_id`, `isikomentar`, `tanggalkomentar`) VALUES
(1, 11, 1, 'hallo', '2024-10-14 22:01:17'),
(2, 18, 1, 'wih serigala ya....', '2024-10-14 22:03:38'),
(3, 18, 1, 'seram...', '2024-10-14 22:03:44'),
(4, 19, 1, 'pohon apa ini?', '2024-10-14 23:05:27'),
(5, 21, 6, 'q', '2024-10-15 02:12:38'),
(6, 21, 6, 'q', '2024-10-15 02:12:42'),
(7, 12, 6, 'f', '2024-10-15 02:13:14'),
(8, 12, 3, 'gg', '2024-10-15 02:19:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `likefoto`
--

CREATE TABLE `likefoto` (
  `like_id` int(11) NOT NULL,
  `foto_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tanggallike` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `likefoto`
--

INSERT INTO `likefoto` (`like_id`, `foto_id`, `user_id`, `tanggallike`) VALUES
(9, 11, 2, '2024-10-14 03:36:32'),
(14, 21, 6, '2024-10-15 07:12:56'),
(15, 12, 6, '2024-10-15 07:13:09'),
(16, 12, 3, '2024-10-15 07:19:01'),
(17, 16, 3, '2024-10-15 07:19:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `namalengkap` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `level` enum('User','Admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `email`, `namalengkap`, `alamat`, `level`) VALUES
(1, 'abdul', '202cb962ac59075b964b07152d234b70', 'abdul@smk7.com', 'abdul rahman', 'kav. nongsa', 'Admin'),
(2, 'ilham', '202cb962ac59075b964b07152d234b70', 'ilham@smk7.com', 'abus', 'jakarta', 'User'),
(3, 'habi', '202cb962ac59075b964b07152d234b70', 'habi@smk7.com', 'habi', 'bengkong', 'User'),
(4, 'fadhis', '$2y$10$5i8uyP0LyrNz5OqfSBl8XO2mg5KVeeqJkLw7SaUby6ToBu8ZS.AAO', 'fadhis@gmai.com', 'fadhis', 'Cluster Merak', 'User'),
(5, 'a', '0cc175b9c0f1b6a831c399e269772661', 'a@a.a', 'a', 'a', 'User'),
(6, 'rahman', 'c4ca4238a0b923820dcc509a6f75849b', 's@a.a', 'rahman', 's', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `album_id_2` (`album_id`),
  ADD KEY `album_id_3` (`album_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `album_id_4` (`album_id`);

--
-- Indeks untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`foto_id`),
  ADD KEY `foto_id` (`foto_id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `album_id_2` (`album_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `foto_id_2` (`foto_id`);

--
-- Indeks untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD PRIMARY KEY (`komentar_id`),
  ADD KEY `komentar_id` (`komentar_id`),
  ADD KEY `foto_id` (`foto_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `foto_id_2` (`foto_id`);

--
-- Indeks untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `like_id` (`like_id`),
  ADD KEY `foto_id` (`foto_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `foto_id_2` (`foto_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `foto`
--
ALTER TABLE `foto`
  MODIFY `foto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  MODIFY `komentar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `foto_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`);

--
-- Ketidakleluasaan untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD CONSTRAINT `fk_foto_id` FOREIGN KEY (`foto_id`) REFERENCES `foto` (`foto_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `komentarfoto_ibfk_1` FOREIGN KEY (`foto_id`) REFERENCES `foto` (`foto_id`),
  ADD CONSTRAINT `komentarfoto_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD CONSTRAINT `likefoto_ibfk_1` FOREIGN KEY (`foto_id`) REFERENCES `foto` (`foto_id`),
  ADD CONSTRAINT `likefoto_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
