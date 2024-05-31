-- phpMyAdmin SQL Dump
-- version 5.2.1-2.fc39
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 31, 2024 at 10:30 PM
-- Server version: 8.0.37
-- PHP Version: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taritme`
--
CREATE DATABASE IF NOT EXISTS `taritme` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `taritme`;

-- --------------------------------------------------------

--
-- Table structure for table `arsip_kesenian`
--

DROP TABLE IF EXISTS `arsip_kesenian`;
CREATE TABLE `arsip_kesenian` (
  `id` int NOT NULL,
  `author` varchar(30) NOT NULL,
  `title` varchar(50) NOT NULL,
  `date` date DEFAULT NULL,
  `preview_writing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `preview_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `total_like` int NOT NULL,
  `total_comments` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `arsip_kesenian`
--

INSERT INTO `arsip_kesenian` (`id`, `author`, `title`, `date`, `preview_writing`, `preview_image`, `total_like`, `total_comments`) VALUES
(1, 'Leonardo Da Vince', 'Tari Piring', '2024-05-31', 'Tari Piriang atau Tari Piring merupakan salah satu tarian tradisional di Indonesia yang berasal dari Suku Minangkabau. Secara tradisional, Tari Piring berasal dari Kota Solok, Provinsi Sumatera barat. Saat ini', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/arsip_kesenian/yujkyi5kcrw4slv9uws3', 999, 12),
(2, 'Leonardo da Vince', 'Tari Indang Badindin', '2024-05-31', 'Tari Dindin Badindin ini merupakan salah satu tari tradisional yang berasal dari Pariaman, Provinsi Sumatera Barat. Indang sendiri berarti gendang kecil, tarian ini mirip dengan Tari Saman yang', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/arsip_kesenian/lnpm7lad27lkjthpzxxb', 999, 12);

-- --------------------------------------------------------

--
-- Table structure for table `data_pelatih_tari`
--

DROP TABLE IF EXISTS `data_pelatih_tari`;
CREATE TABLE `data_pelatih_tari` (
  `id` int NOT NULL,
  `pelatih_tari_id` int NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `data_pelatih_tari`
--

INSERT INTO `data_pelatih_tari` (`id`, `pelatih_tari_id`, `no_hp`, `email`, `status`) VALUES
(1, 1, '081234567890', 'luna@lunamay.com', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `detail_arsip_kesenian`
--

DROP TABLE IF EXISTS `detail_arsip_kesenian`;
CREATE TABLE `detail_arsip_kesenian` (
  `id` int NOT NULL,
  `arsip_kesenian_id` int NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pelatih_tari`
--

DROP TABLE IF EXISTS `detail_pelatih_tari`;
CREATE TABLE `detail_pelatih_tari` (
  `id` int NOT NULL,
  `pelatih_tari_id` int NOT NULL,
  `tentang_pelatih` text NOT NULL,
  `image_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `image_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `image_3` text,
  `price_per_paket` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_pelatih_tari`
--

INSERT INTO `detail_pelatih_tari` (`id`, `pelatih_tari_id`, `tentang_pelatih`, `image_1`, `image_2`, `image_3`, `price_per_paket`) VALUES
(1, 1, 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/luna_maya/hg00wv5higbam7pa6eqp', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/luna_maya/yrdnorwl29gwfj6khycb', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/luna_maya/us9ug8msldhqxcd8o9b7', 450000);

-- --------------------------------------------------------

--
-- Table structure for table `komunitas`
--

DROP TABLE IF EXISTS `komunitas`;
CREATE TABLE `komunitas` (
  `id` int NOT NULL,
  `image` varchar(150) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `komunitas`
--

INSERT INTO `komunitas` (`id`, `image`, `name`, `description`, `is_active`, `date`) VALUES
(1, 'https://res.cloudinary.com/da0dcs88v/image/upload/v1716633770/taritme/komunitas/q8qqd5105vvncmsxanb7.png', 'Komunitas Sanggar Budaya 1', 'Sebuah komunitas yang memadukan keindahan gerakan tradisional dengan nuansa modern, menciptakan karya-karya yang memikat hati penonton dari berbagai kalangan.', 1, '2024-05-25'),
(2, 'https://res.cloudinary.com/da0dcs88v/image/upload/v1716633769/taritme/komunitas/vv9y7omaoilgin4dz7gy.png', 'Komunitas Sanggar Budaya 2', 'Menyajikan pertunjukan yang menggabungkan elemen-elemen tari dari berbagai daerah di Indonesia, merayakan keberagaman budaya dalam setiap gerakan.', 1, '2020-05-25'),
(3, 'https://res.cloudinary.com/da0dcs88v/image/upload/v1716633769/taritme/komunitas/skekoulikwl4ekrpblxe.png', 'Komunitas Sanggar Budaya 3', 'Menciptakan ruang bagi generasi muda untuk mempelajari dan melestarikan warisan budaya melalui tarian-tarian klasik dan kontemporer, serta mengadakan workshop dan seminar untuk mendalami nilai-nilai budaya yang terkandung dalam setiap gerakan.', 1, '2020-05-25'),
(4, 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/komunitas/mytdgr8dqjexrt4sd3q4', 'Komunitas Sanggar Budaya 4', 'Merangkul ragam etnis dan kepercayaan dalam tarian-tarian mereka, menggambarkan kekayaan budaya Indonesia melalui gerakan-gerakan yang penuh semangat.', 1, '2020-05-25'),
(5, 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/komunitas/ghqkhnmxk6bqd9c3mj0x', 'Komunitas Sanggar Budaya 5', 'Menghidupkan kembali cerita-cerita klasik melalui tarian-tarian yang elegan dan penuh makna, menyuarakan warisan budaya sebagai bagian tak terpisahkan dari identitas bangsa.', 1, '2020-05-25'),
(6, 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/komunitas/tbvl7o1wrpvmdhy0v7dz', 'Komunitas Sanggar Budaya 6', 'Menjelajahi kreativitas melalui tarian, menggabungkan elemen-elemen modern dengan tradisional untuk menciptakan karya-karya yang menyentuh dan menginspirasi.', 1, '2020-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `komunitas_link_socialmedia`
--

DROP TABLE IF EXISTS `komunitas_link_socialmedia`;
CREATE TABLE `komunitas_link_socialmedia` (
  `id` int NOT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelatih_tari`
--

DROP TABLE IF EXISTS `pelatih_tari`;
CREATE TABLE `pelatih_tari` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `rating` decimal(10,0) DEFAULT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `total_review` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pelatih_tari`
--

INSERT INTO `pelatih_tari` (`id`, `name`, `description`, `image`, `rating`, `price`, `created_at`, `total_review`) VALUES
(1, 'Luna Maya', 'Instruktur tari Sumatra Barat yang memberikan ilmu nya melalui kursus tari.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/rovcgovxpefsz2vduytv', 5, 100000, '2024-05-27 15:40:14', 10),
(2, 'Retno Maruti', 'Instruktur tari Sumatra Barat yang memberikan ilmu nya melalui kursus tari.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/dn4ccifygbvi6q9udjae', 5, 100000, '2024-05-27 20:55:07', 10),
(3, 'Ayu Bulantrisna', 'Instruktur tari Sumatra Barat yang memberikan ilmu nya melalui kursus tari.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/hndjpv2fl9wwbpch284m', 5, 100000, '2024-05-27 20:55:35', 10),
(4, 'Sandrina', 'Instruktur tari Sumatra Barat yang memberikan ilmu nya melalui kursus tari.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/g3qtmk6fs4wkovuffxya', 5, 100000, '2024-05-27 20:55:46', 10),
(5, 'Soimah', 'Instruktur tari Sumatra Barat yang memberikan ilmu nya melalui kursus tari.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/rfqjasbi0x6m0q0fw295', 5, 100000, '2024-05-27 20:56:00', 10),
(6, 'Lena Guslina', 'Instruktur tari Sumatra Barat yang memberikan ilmu nya melalui kursus tari.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/xjuriqyfarzcmulp1hcj', 5, 100000, '2024-05-27 20:56:11', 10),
(7, 'Agnez Mo', 'Instruktur tari Sumatra Barat yang memberikan ilmu nya melalui kursus tari.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/itbj2vsi65nhxmwhzqfg', 5, 100000, '2024-05-27 20:56:21', 10);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_kursus`
--

DROP TABLE IF EXISTS `riwayat_kursus`;
CREATE TABLE `riwayat_kursus` (
  `id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `price` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `rating` decimal(10,0) NOT NULL,
  `total_review` int NOT NULL,
  `users_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(3, 'Yui Hirasawa', 'yui@yui.app', '$2b$10$iK7j67vy8etIxty.ieQ4me0c9Brvu1V17yyMh2fyam0DlMRwHQIpa'),
(5, 'Haikel Ilham Hakim', 'halo@ekel.dev', '$2b$10$pPqLODqGPa6ZwOXWuHA8tOmiBachOmjatCfRllY9aEjEccRR.uin.');

-- --------------------------------------------------------

--
-- Table structure for table `users_payment_pelatih_tari`
--

DROP TABLE IF EXISTS `users_payment_pelatih_tari`;
CREATE TABLE `users_payment_pelatih_tari` (
  `id` int NOT NULL,
  `user_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `users_id` int NOT NULL,
  `is_users_already_paid` tinyint(1) NOT NULL,
  `pelatih_tari_id` int NOT NULL,
  `pelatih_tari_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users_payment_pelatih_tari`
--

INSERT INTO `users_payment_pelatih_tari` (`id`, `user_email`, `users_id`, `is_users_already_paid`, `pelatih_tari_id`, `pelatih_tari_name`) VALUES
(2, 'yui@yui.app', 3, 0, 1, 'Luna Maya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arsip_kesenian`
--
ALTER TABLE `arsip_kesenian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_pelatih_tari`
--
ALTER TABLE `data_pelatih_tari`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelatih_tari_id` (`pelatih_tari_id`);

--
-- Indexes for table `detail_arsip_kesenian`
--
ALTER TABLE `detail_arsip_kesenian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `arsip_kesenian_id` (`arsip_kesenian_id`);

--
-- Indexes for table `detail_pelatih_tari`
--
ALTER TABLE `detail_pelatih_tari`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pelatih_tari_id` (`pelatih_tari_id`);

--
-- Indexes for table `komunitas`
--
ALTER TABLE `komunitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komunitas_link_socialmedia`
--
ALTER TABLE `komunitas_link_socialmedia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelatih_tari`
--
ALTER TABLE `pelatih_tari`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riwayat_kursus`
--
ALTER TABLE `riwayat_kursus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_id` (`users_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_payment_pelatih_tari`
--
ALTER TABLE `users_payment_pelatih_tari`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_payment_pelatih_tari_ibfk_2` (`pelatih_tari_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arsip_kesenian`
--
ALTER TABLE `arsip_kesenian`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_pelatih_tari`
--
ALTER TABLE `detail_pelatih_tari`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `komunitas`
--
ALTER TABLE `komunitas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pelatih_tari`
--
ALTER TABLE `pelatih_tari`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_payment_pelatih_tari`
--
ALTER TABLE `users_payment_pelatih_tari`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_pelatih_tari`
--
ALTER TABLE `data_pelatih_tari`
  ADD CONSTRAINT `data_pelatih_tari_ibfk_1` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_arsip_kesenian`
--
ALTER TABLE `detail_arsip_kesenian`
  ADD CONSTRAINT `detail_arsip_kesenian_ibfk_1` FOREIGN KEY (`arsip_kesenian_id`) REFERENCES `arsip_kesenian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_pelatih_tari`
--
ALTER TABLE `detail_pelatih_tari`
  ADD CONSTRAINT `fk_pelatih_tari_id` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat_kursus`
--
ALTER TABLE `riwayat_kursus`
  ADD CONSTRAINT `fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_payment_pelatih_tari`
--
ALTER TABLE `users_payment_pelatih_tari`
  ADD CONSTRAINT `users_payment_pelatih_tari_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_payment_pelatih_tari_ibfk_2` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
