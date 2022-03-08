-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Mar 2022 pada 05.11
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nama_member` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `alamat`, `gender`, `tlp`) VALUES
(5, 'Salsa', 'Jl. Danau Kerinci G6D6 Sawojajar Malang', 'P', '08123456789'),
(6, 'Salwa', 'Jl. Adi Brata II Perumahan Pelita Kav. 15 Kepanjen Malang', 'P', '0812345721'),
(7, 'Rian', 'Jl. Melati no. 19 Malang', 'L', '08192145621'),
(8, 'Alca', 'Jl. Ciliwung no. 23 Malang', 'P', '08126435998'),
(9, 'Alsha', 'jl. Bandung No. 153 Surabaya', 'P', '0895613254'),
(10, 'Leo', 'Jl. Selamat Sentosa no. 45 Gang 5 Blok 4 Blimbing Malang', 'L', '081216508199'),
(11, 'Amora', 'Jl. Pahlawan Merdeka Perumahan Greenland Malang', 'P', '081345621577'),
(12, 'Arshaka', 'Jl. Pandawa V G2B7 Malang', 'L', '083111089921'),
(13, 'Bumi', 'Jl. Semeru Perumahan Citraland no. 49 Malang', 'L', '082150809944'),
(14, 'Skyla Arnetta', 'Jl. Bali Perumahan Mentari no.32 Malang', 'P', '081221411099');

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(100) NOT NULL,
  `alamat_outlet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama_outlet`, `alamat_outlet`) VALUES
(3, 'D-Laundry 2', 'Jl. Tangkuban Perahu XVII no. 27 Surabaya'),
(5, 'D-Laundry 3', 'Jl. Pandawa No. 176 Blok C Bali\r\n\r\n'),
(6, 'D-Laundry 4', 'Jl. Kalibata VII no. 29 Cibubur\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `jenis` enum('cuci','setrika','cutrik','bed_cover','karpet') NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id_paket`, `jenis`, `harga`) VALUES
(6, 'cuci', 3000),
(7, 'setrika', 2000),
(8, 'cutrik', 5000),
(9, 'bed_cover', 10000),
(10, 'karpet', 25000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `batas_waktu` date NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `status` enum('baru','proses','selesai','diambil') NOT NULL,
  `dibayar` enum('dibayar','belum_dibayar') NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_member`, `id_paket`, `qty`, `tanggal`, `batas_waktu`, `tanggal_bayar`, `status`, `dibayar`, `id_user`) VALUES
(77, 8, 7, 3, '2022-02-08', '2022-02-12', '2022-02-08', 'selesai', 'dibayar', 9),
(78, 5, 7, 5, '2022-02-08', '2022-02-12', '2022-02-08', 'selesai', 'dibayar', 6),
(81, 8, 8, 5, '2022-02-08', '2022-02-12', '2022-02-08', 'selesai', 'dibayar', 5),
(82, 10, 10, 5, '2022-02-09', '2022-02-13', '2022-02-09', 'selesai', 'dibayar', 6),
(83, 14, 9, 2, '2022-02-09', '2022-02-13', '0000-00-00', 'baru', 'belum_dibayar', 7),
(84, 7, 8, 7, '2022-02-09', '2022-02-13', '0000-00-00', 'proses', 'belum_dibayar', 8),
(85, 11, 9, 3, '2022-02-09', '2022-02-13', '2022-02-09', 'selesai', 'dibayar', 5),
(86, 12, 8, 3, '2022-02-10', '2022-02-14', '2022-02-10', 'selesai', 'dibayar', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `role` enum('admin','kasir','owner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `role`) VALUES
(5, 'Caca cantik', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(6, 'Anya', 'kasir', 'c7911af3adbd12a035b289556d96470a', 'kasir'),
(7, 'Naya', 'admin2', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(8, 'Adara', 'kasir2', 'c7911af3adbd12a035b289556d96470a', 'kasir'),
(9, 'Acha', 'admin3', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(10, 'Caley', 'owner', '72122ce96bfec66e2396d2e25225d70a', 'owner'),
(11, 'Abimanyu', 'owner2', '72122ce96bfec66e2396d2e25225d70a', 'owner');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail_transaksi`),
  ADD KEY `id_transaksi` (`id_transaksi`,`id_paket`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_member` (`id_member`,`id_user`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
