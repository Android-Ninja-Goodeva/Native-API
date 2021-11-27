-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 27 Nov 2021 pada 15.26
-- Versi server: 5.7.33
-- Versi PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_invoice`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `kode_customer` varchar(60) NOT NULL,
  `customer` text,
  `phone` text,
  `fax` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_customer`
--

INSERT INTO `tbl_customer` (`kode_customer`, `customer`, `phone`, `fax`) VALUES
('Cost001', 'PT. SURYA CIPTA NEGARA', '+6282 2342 2333', '+8347 3983 2343'),
('Cost002', 'PT. DUTA KALINGGA PRATAMA', '+6282 0000 1111', '+8347 5555 3333');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_perusahaan`
--

CREATE TABLE `tbl_data_perusahaan` (
  `kode_perusahaan` varchar(60) NOT NULL,
  `nama_perusahaan` text,
  `alamat` text,
  `jalan` text,
  `phone` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_data_perusahaan`
--

INSERT INTO `tbl_data_perusahaan` (`kode_perusahaan`, `nama_perusahaan`, `alamat`, `jalan`, `phone`) VALUES
('KP0001', 'PT. DUTA KOMPUTER SEJAHTERA', 'Jl. Pekayon No. 23, Bekasi', 'Ruko Pekayon No. 23', '+62813 3382 2281');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_detail_invoice`
--

CREATE TABLE `tbl_detail_invoice` (
  `id` int(11) NOT NULL,
  `kode_detail_invoice` varchar(60) NOT NULL,
  `no_invoice` varchar(60) NOT NULL,
  `kode_product` varchar(60) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `kode_perusahaan` varchar(60) NOT NULL,
  `kode_trf_bnk` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_detail_invoice`
--

INSERT INTO `tbl_detail_invoice` (`id`, `kode_detail_invoice`, `no_invoice`, `kode_product`, `qty`, `kode_perusahaan`, `kode_trf_bnk`) VALUES
(1, 'KDI-0001', 'No. 829348922342', 'PRD-001', 6, 'KP0001', 'BCA-IDR'),
(2, 'KDI-0001', 'No. 829348922342', 'PRD-001', 4, 'KP0001', 'BCA-IDR'),
(3, 'KDI-0001', 'No. 829348922342', 'PRD-002', 12, 'KP0001', 'BCA-IDR'),
(4, 'KDI-0001', 'No. 829348922342', 'PRD-003', 10, 'KP0001', 'BCA-IDR'),
(5, 'KDI-0001', 'No. 829348922342', 'PRD-004', 100, 'KP0001', 'BCA-IDR'),
(6, 'KDI-0001', 'No. 829348922342', 'PRD-005', 5, 'KP0001', 'BCA-IDR'),
(7, 'KDI-0001', 'No. 829348922342', 'PRD-006', 12, 'KP0001', 'BCA-IDR'),
(8, 'KDI-0002', 'No. 020394029343', 'PRD-001', 6, 'KP0001', 'BCA-IDR'),
(9, 'KDI-0002', 'No. 020394029343', 'PRD-006', 12, 'KP0001', 'BCA-IDR');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `no_invoice` varchar(60) NOT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `payment_term` text,
  `due_date` datetime DEFAULT NULL,
  `salesmen` text,
  `currency` text,
  `kode_customer` varchar(60) DEFAULT NULL,
  `kode_manager` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_invoice`
--

INSERT INTO `tbl_invoice` (`no_invoice`, `invoice_date`, `payment_term`, `due_date`, `salesmen`, `currency`, `kode_customer`, `kode_manager`) VALUES
('No. 020394029343', '2021-01-20 18:00:00', 'DP 25%', '2021-01-30 18:00:00', 'Firman Sanusi', 'IDR', 'Cost002', 'KM00002'),
('No. 829348922342', '2021-01-12 21:00:00', 'Cash', '2021-01-15 21:00:00', 'Rudi Hidayat', 'IDR', 'Cost001', 'KM00001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_management`
--

CREATE TABLE `tbl_management` (
  `kode_manager` varchar(60) NOT NULL,
  `nama_manager` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_management`
--

INSERT INTO `tbl_management` (`kode_manager`, `nama_manager`) VALUES
('KM00001', 'Indah Prastyo'),
('KM00002', 'Linda Agustina');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_no_bank_transfer`
--

CREATE TABLE `tbl_no_bank_transfer` (
  `kode_trf_bnk` varchar(60) NOT NULL,
  `trf_bank` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_no_bank_transfer`
--

INSERT INTO `tbl_no_bank_transfer` (`kode_trf_bnk`, `trf_bank`) VALUES
('BCA-IDR', 'BCA-IDR : 273-283-002, A/N PT. DUTA KOMPUTER SEJAHTERA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_product`
--

CREATE TABLE `tbl_product` (
  `kode_product` varchar(60) NOT NULL,
  `product_description` text,
  `unit` text,
  `unit_price` int(11) DEFAULT NULL,
  `type` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_product`
--

INSERT INTO `tbl_product` (`kode_product`, `product_description`, `unit`, `unit_price`, `type`) VALUES
('PRD-001', 'Monitor LCD 22` LG', 'Unit', 5850000, 'Elektronik'),
('PRD-002', 'Mouse Gaming Zrex 2343', 'Unit', 585000, 'Elektronik'),
('PRD-003', 'RAM 8GB DDR 3 Toshiba', 'Keping', 899000, 'Elektronik'),
('PRD-004', 'Kabel USB', 'Buah', 15000, 'Accessories'),
('PRD-005', 'Printer HP L8234', 'Unit', 3875000, 'Elektronik'),
('PRD-006', 'Connector HDMI Type 5', 'Buah', 95000, 'Accessories');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`kode_customer`);

--
-- Indeks untuk tabel `tbl_data_perusahaan`
--
ALTER TABLE `tbl_data_perusahaan`
  ADD PRIMARY KEY (`kode_perusahaan`);

--
-- Indeks untuk tabel `tbl_detail_invoice`
--
ALTER TABLE `tbl_detail_invoice`
  ADD PRIMARY KEY (`id`,`kode_detail_invoice`,`no_invoice`,`kode_product`,`kode_perusahaan`,`kode_trf_bnk`),
  ADD KEY `fk_dtpers2dtlinv` (`kode_perusahaan`),
  ADD KEY `fk_dtlinv2inv` (`no_invoice`),
  ADD KEY `fk_dtlinv2prd` (`kode_product`),
  ADD KEY `fk_inv2trfbnk` (`kode_trf_bnk`);

--
-- Indeks untuk tabel `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`no_invoice`),
  ADD KEY `fk_inv2mgr` (`kode_manager`),
  ADD KEY `fk_inv2cstmr` (`kode_customer`);

--
-- Indeks untuk tabel `tbl_management`
--
ALTER TABLE `tbl_management`
  ADD PRIMARY KEY (`kode_manager`);

--
-- Indeks untuk tabel `tbl_no_bank_transfer`
--
ALTER TABLE `tbl_no_bank_transfer`
  ADD PRIMARY KEY (`kode_trf_bnk`);

--
-- Indeks untuk tabel `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`kode_product`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_detail_invoice`
--
ALTER TABLE `tbl_detail_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_detail_invoice`
--
ALTER TABLE `tbl_detail_invoice`
  ADD CONSTRAINT `fk_dtlinv2inv` FOREIGN KEY (`no_invoice`) REFERENCES `tbl_invoice` (`no_invoice`),
  ADD CONSTRAINT `fk_dtlinv2prd` FOREIGN KEY (`kode_product`) REFERENCES `tbl_product` (`kode_product`),
  ADD CONSTRAINT `fk_dtpers2dtlinv` FOREIGN KEY (`kode_perusahaan`) REFERENCES `tbl_data_perusahaan` (`kode_perusahaan`),
  ADD CONSTRAINT `fk_inv2trfbnk` FOREIGN KEY (`kode_trf_bnk`) REFERENCES `tbl_no_bank_transfer` (`kode_trf_bnk`);

--
-- Ketidakleluasaan untuk tabel `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD CONSTRAINT `fk_inv2cstmr` FOREIGN KEY (`kode_customer`) REFERENCES `tbl_customer` (`kode_customer`),
  ADD CONSTRAINT `fk_inv2mgr` FOREIGN KEY (`kode_manager`) REFERENCES `tbl_management` (`kode_manager`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
