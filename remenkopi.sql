-- phpMyAdmin SQL Dump
ALTER TABLE pembelian_produk MODIFY COLUMN subharga INT DEFAULT 0;
-- https://www.phpmyadmin.net/
SELECT * FROM pembelian_produk;
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2022 at 03:57 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `remenkopi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(3, 'admin', 'admin', 'adminEjji');

-- --------------------------------------------------------

--
-- Table structure for table `metode_pembayaran`
--

CREATE TABLE `metode_pembayaran` (
  `id_metode` int(11) NOT NULL,
  `metode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `metode_pembayaran`
--

INSERT INTO `metode_pembayaran` (`id_metode`, `metode`) VALUES
(1, 'Gopay'),
(2, 'Ovo'),
(3, 'Shopee Pay'),
(4, 'Dana'),
(5, 'Bayar di Tempat');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `meja_pelanggan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `meja_pelanggan`) VALUES
(40, 'roy', 1),
(41, 'Afan', 2),
(42, 'hakim', 3),
(43, 'jokowi', 4),
(44, 'boy', 2),
(45, 'roy', 4),
(46, 'rendi', 6);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `metode` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `metode`, `jumlah`, `tanggal`, `bukti`) VALUES
(22, 35, 'roy', 'Gopay', 23000, '2022-06-29', '20220629063531WhatsApp Image 2022-05-30 at 07.23.12.jpeg'),
(23, 36, 'Afan', 'Ovo', 50000, '2022-06-29', '20220629063607WhatsApp Image 2022-05-30 at 07.23.12.jpeg'),
(24, 37, 'hakim', 'Ovo', 15000, '2022-06-29', '20220629063632WhatsApp Image 2022-05-30 at 07.23.12.jpeg'),
(25, 38, 'jokowi', 'Shopee Pay', 28000, '2022-06-29', '20220629063951WhatsApp Image 2022-05-30 at 07.23.12.jpeg'),
(26, 39, 'boy', 'Dana', 10000, '2022-06-29', '20220629064023WhatsApp Image 2022-05-30 at 07.23.12.jpeg'),
(27, 40, 'roy', 'Shopee Pay', 10000, '2022-06-29', '20220629144659qrcode.png'),
(28, 41, 'rendi', 'Dana', 13000, '2022-06-29', '20220629153506d1.png');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_metode` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `metode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_metode`, `tanggal_pembelian`, `total_pembelian`, `metode`) VALUES
(35, 40, 1, '2022-06-29', 23000, 'Gopay'),
(36, 41, 2, '2022-06-29', 50000, 'Ovo'),
(37, 42, 2, '2022-06-29', 15000, 'Ovo'),
(38, 43, 3, '2022-06-29', 28000, 'Shopee Pay'),
(39, 44, 4, '2022-06-29', 10000, 'Dana'),
(40, 45, 3, '2022-06-29', 10000, 'Shopee Pay'),
(41, 46, 4, '2022-06-29', 13000, 'Dana');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `subharga` int(11) NOT NULL,
  `metode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `subharga`, `metode`) VALUES
(43, 35, 25, 1, 'Ice Tea', 10000, 10000, ''),
(44, 35, 23, 1, 'Ice Lemonade', 13000, 13000, ''),
(45, 36, 30, 2, 'Cappucino', 20000, 40000, ''),
(46, 36, 35, 1, 'Honey Toast', 10000, 10000, ''),
(47, 37, 31, 1, 'Hot Chocolate', 15000, 15000, ''),
(48, 38, 42, 1, 'Ice Cream', 10000, 10000, ''),
(49, 38, 29, 1, 'Avocado Juice', 18000, 18000, ''),
(50, 39, 39, 1, 'Pangsit', 10000, 10000, ''),
(51, 40, 24, 1, 'Coca Cola', 10000, 10000, ''),
(52, 41, 23, 1, 'Ice Lemonade', 13000, 13000, '');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(23, 'Ice Lemonade', 13000, 'd1.png', 'Air lemon kaya akan manfaat, diantaranya dapat mengurangi bau mulut tak sedap kaya akan antioksidan dan senyawa antibiotik, mengandung Vitamin C, membantu sistem kekebalan tubuh. Selain itu, Air lemon juga memiliki indeks glikemik rendah yang dapat membuat gula darah tetap stabil.', 18),
(24, 'Coca Cola', 10000, 'd2.png', 'Coca-Cola adalah minuman ringan berkarbonasi yang dijual di toko, restoran dan mesin penjual di lebih dari 200 negara. Minuman ini diproduksi oleh The Coca-Cola Company asal Atlanta, Georgia, dan sering disebut Coke saja (merek dagang terdaftar The Coca-Cola Company di Indonesia sejak 27 Maret 1944). ', 18),
(25, 'Ice Tea', 10000, 'd3.png', 'Es teh atau Teh es adalah teh yang didinginkan dengan es batu. Es teh sering kali ditambahkan rasa seperti melati, dan buah-buahan seperti limun, ceri, dan arbei, atau susu. Es teh adalah minuman yang sering diminum saat siang hari karena suhu udara yang panas.', 17),
(26, 'Orange Juice', 12000, 'd4.png', 'Jus jeruk merupakan minuman klasik dari benua Amerika. Selama bertahun-tahun masyarakat Amerika mengonsumsi jus jeruk karena kelezatan rasanya dan manfaat nutrisinya.', 20),
(27, 'Blackcurrant Juice', 18000, 'd5.png', 'Jus Blackcurrant segar dengan ekstrak buah bergizi tinggi untuk menyegarkan tubuh', 19),
(28, 'Rainbow Squash', 11000, 'd6.png', 'Minuman bersoda dipadukan dengan sirup buah dengan kesegaran tiada tara', 19),
(29, 'Avocado Juice', 18000, 'd7.png', 'Jus alpukat segar dengan tinggi vitamin dan gizi', 19),
(30, 'Cappucino', 20000, 'd8.png', 'Cappuccino merupakan kopi yang populer dari Italia karena lebih sering dan lebih banyak dikonsumsi. Rasanya yang tidak terlalu pahit seperti espresso, membuat cappuccino lebih mudah diterima oleh lidah semua orang khususnya kalangan muda. Komposisinya terdiri atas espresso dan tambahan susu cair serta busa di atasnya.', 18),
(31, 'Hot Chocolate', 15000, 'd9.png', 'Cokelat panas adalah minuman panas yang dibuat dari cokelat atau kakao bubuk dan gula, dengan air atau susu hangat. Beberapa studi telah menunjukkan bahwa cokelat panas menyehatkan karena antioksidan yang terkandung dalam kakao.', 19),
(32, 'Teh Tarik', 10000, 'd10.png', 'Teh tarik adalah minuman manis berupa campuran teh dan susu yang lazim ditemukan di daerah Asia Tenggara, khususnya Indonesia, Malaysia, dan Singapura. Minuman ini biasanya dijual oleh para mamak (orang India Muslim) di Malaysia dan Singapura, yang menjadikannya sebagai minuman nasional negara tersebut.', 20),
(33, 'Salad', 15000, 'f1.png', 'Selada (bahasa Belanda: salade; bahasa Inggris: salad) adalah jenis makanan yang terdiri dari campuran sayur-sayuran dan bahan-bahan makanan siap santap.', 20),
(34, 'Cheese Cake', 10000, 'f2.png', 'Cheesecake (bahasa Indonesia: \"kue keju\") adalah kue yang biasanya dimakan sebagai hidangan penutup, dibuat dengan mencampurkan keju yang bertekstur lembut, telur, susu, dan gula.', 20),
(35, 'Honey Toast', 10000, 'f3.png', 'Roti bakar madu, juga dikenal sebagai roti bakar Shibuya, roti bakar batu bata, dan hanito adalah hidangan penutup Jepang yang berasal dari distrik Shibuya selama gelembung harga aset Jepang, sering disajikan di bar-bar karaoke. Ini juga populer di bagian lain dunia, paling menonjol di Taiwan dan Singapura. ', 18),
(36, 'Hamburger', 12000, 'f10.png', 'Hamburger adalah sejenis roti berbentuk bundar yang diiris dua, dan di tengahnya diisi dengan patty yang biasanya diambil dari daging, kemudian sayur-sayuran berupa selada, tomat dan bawang bombai.', 20),
(37, 'Taco', 12000, 'f9.png', 'Taco adalah makanan khas Meksiko yang terdiri atas gulungan atau lipatan tortilla yang diisi dengan berbagai macam masakan di dalamnya. Salah satu versi Taco terdapat di makanan khas Tex-Mex, yakni Breakfast Taco yang terdiri atas telur dadar dan kombinasi kentang, dan daging.', 20),
(38, 'Salmon', 35000, 'f8.png', 'Hidangan ikan salmon bumbu khas remen kopi yang bergizi tinggi dan segar', 20),
(39, 'Pangsit', 10000, 'f7.png', 'Dumpling merupakan salah satu jenis dimsum yang banyak penggemarnya. Makanan ini biasanya umum disajikan ketika bersantap di resto yang menyajikan dimsum food. Dimsum sendiri adalah istilah dalam bahasa Kanton yang artinya makanan kecil. Variannya selain dumpling antara lain bakpau dan kaki ayam dimsum.', 19),
(40, 'Toast', 10000, 'f6.png', 'Roti panggang (bahasa Inggris: toast) merujuk kepada kepingan roti yang dibakar atau dipanggang dengan proses radiasi termal sehingga roti menjadi lebih kecoklatan dan garing.', 20),
(41, 'Donuts', 8000, 'f5.png', 'Donat adalah penganan yang digoreng, dibuat dari adonan tepung terigu, gula pasir, kuning telur, ragi roti, dan mentega. Donat yang paling umum adalah donat dengan bentuk seperti cincin dan ada lubang di tengahnya, biasanya ditaburi dengan mesis atau gula halus.', 20),
(42, 'Ice Cream', 10000, 'f4.png', 'Es krim adalah sebuah makanan beku yang dibuat dari produk susu seperti krim, lalu dicampur dengan perasa dan pemanis buatan ataupun alami. Campuran ini didinginkan dengan diaduk sambil mengurangi suhunya untuk mencegah pembentukan es batu.', 19);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  ADD PRIMARY KEY (`id_metode`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);
SELECT * FROM pembelian_produk;
--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);
ALTER TABLE pembelian_produk
DROP COLUMN metode;
--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  MODIFY `id_metode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;