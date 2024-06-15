-- phpMyAdmin SQL Dump
-- version 5.2.1-2.fc39
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2024 at 11:53 PM
-- Server version: 8.0.37
-- PHP Version: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `taritme`
--
CREATE DATABASE IF NOT EXISTS `taritme` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `taritme`;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pelatih_tari`
--

DROP TABLE IF EXISTS `detail_pelatih_tari`;
CREATE TABLE `detail_pelatih_tari` (
  `id` int NOT NULL,
  `pelatih_tari_id` int NOT NULL,
  `tentang_pelatih` text NOT NULL,
  `image_1` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `image_2` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `image_3` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `detail_pelatih_tari`
--

DROP TABLE IF EXISTS `detail_pelatih_tari`;
CREATE TABLE `detail_pelatih_tari` (
  `id` int NOT NULL,
  `pelatih_tari_id` int NOT NULL,
  `tentang_pelatih` text NOT NULL,
  `image_1` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `image_2` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `image_3` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `detail_pelatih_tari`
--

INSERT INTO `detail_pelatih_tari` (`id`, `pelatih_tari_id`, `tentang_pelatih`, `image_1`, `image_2`, `image_3`) VALUES
(1, 1, 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', NULL, NULL, NULL),
(2, 2, 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', NULL, NULL, NULL),
(3, 3, 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', NULL, NULL, NULL),
(4, 4, 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', NULL, NULL, NULL),
(5, 5, 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', 'https://res.cloudinary.com/da0dcs88v/image/upload/v1718272415/taritme/pelatih_tari/detail_pelatih_tari/rina_ayu/pnntsbwfoj3bwbn2gbq6.png', 'https://res.cloudinary.com/da0dcs88v/image/upload/v1718272415/taritme/pelatih_tari/detail_pelatih_tari/rina_ayu/eczo3uwjbdq5dshcpd0g.png', 'https://res.cloudinary.com/da0dcs88v/image/upload/v1718272415/taritme/pelatih_tari/detail_pelatih_tari/rina_ayu/z6ejvqq660z5jreczj8m.png'),
(6, 6, 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', NULL, NULL, NULL),
(7, 7, 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `komunitas`
--

DROP TABLE IF EXISTS `komunitas`;
CREATE TABLE `komunitas` (
  `id` int NOT NULL,
  `image` varchar(150) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `whatsapp` varchar(100) DEFAULT NULL,
  `komunitas_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelatih_tari`
--

DROP TABLE IF EXISTS `pelatih_tari`;
CREATE TABLE `pelatih_tari` (
  `id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pelatih_tari`
--

INSERT INTO `pelatih_tari` (`id`, `email`, `name`, `no_hp`, `description`, `image`, `price`, `created_at`, `status`) VALUES
(1, 'tika@wulandari.com', 'Tika Wulandari', '081234567098', 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh', 150000, '2024-06-11 21:54:06', 'Aktif'),
(2, 'siti@rahayu.com', 'Siti Rahayu', '080987654321', 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/olfxidggiyah97mukttm', 100000, '2024-06-12 13:25:03', 'Aktif'),
(3, 'maya@indah.com', 'Maya Indah', '123456789010', 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/r9gckk3phjlxinswcocn', 100000, '2024-06-12 13:26:40', 'Aktif'),
(4, 'sari@nadia.com', 'Nadia Sari', '291038475647', 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/znb0pkxlahfztduvsqnk', 150000, '2024-06-12 13:27:23', 'Aktif'),
(5, 'ayu@ayu.app', 'Rina Ayu', '092315679675', 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88', 100000, '2024-06-12 13:28:25', 'Aktif'),
(6, 'putri@alya.dev', 'Alya Putri', '124234122535', 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/zojabharmftekwg6feev', 200000, '2024-06-12 13:29:10', 'Aktif'),
(7, 'lestari@lestari.com', 'Dewi Lestari', '243523592512', 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/deujljl1f4odhxriornp', 100000, '2024-06-12 13:29:56', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `penilaian_pelatih_tari`
--

DROP TABLE IF EXISTS `penilaian_pelatih_tari`;
CREATE TABLE `penilaian_pelatih_tari` (
  `id` int NOT NULL,
  `pelatih_tari_id` int NOT NULL,
  `pelatih_tari_name` varchar(100) NOT NULL,
  `rating` int NOT NULL,
  `comment` text NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `order_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `penilaian_pelatih_tari`
--

INSERT INTO `penilaian_pelatih_tari` (`id`, `pelatih_tari_id`, `pelatih_tari_name`, `rating`, `comment`, `users_email`, `users_name`, `order_id`) VALUES
(1, 5, 'Rina Ayu', 5, 'Bagus pengajarannya', 'yui@yui.app', 'Katou Megumi', 'TRM-ITEM-Yn6dI2C17G'),
(2, 2, 'Siti Rahayu', 5, 'Penjelasan kak Siti mudah dimengerti :)', 'yui@yui.app', 'Sawamura Eriri Spencer', 'TRM-ITEM-iF0Yzt03qZ');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_kursus`
--

DROP TABLE IF EXISTS `riwayat_kursus`;
CREATE TABLE `riwayat_kursus` (
  `id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `pelatih_tari_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pelatih_tari_image` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `pelatih_tari_price` int NOT NULL,
  `pelatih_tari_description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `users_id` int NOT NULL,
  `pelatih_tari_id` int NOT NULL,
  `order_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `riwayat_kursus`
--

INSERT INTO `riwayat_kursus` (`id`, `email`, `pelatih_tari_name`, `pelatih_tari_image`, `pelatih_tari_price`, `pelatih_tari_description`, `users_id`, `pelatih_tari_id`, `order_id`) VALUES
(1, 'yui@yui.app', 'Rina Ayu', 'https://res.cloudinary.com/da0dcs88v/image/upload/v1718224109/taritme/pelatih_tari/vyaclw5tehnxcmn6ysiv.png', 100000, 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', 1, 5, 'TRM-ITEM-Yn6dI2C17G'),
(4, 'yui@yui.app', 'Siti Rahayu', 'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/olfxidggiyah97mukttm', 100000, 'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.', 1, 2, 'TRM-ITEM-iF0Yzt03qZ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_already_paid` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `is_already_paid`) VALUES
(1, 'Sawamura Eriri Spencer', 'yui@yui.app', '$2b$10$5QfQMtJ22.eS5XJidCeCtOqF3uG8nY1WJu6kgs6ERMH.4.mTlQ9YO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
CREATE TABLE `users_profile` (
  `id` int NOT NULL,
  `users_id` int NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bio` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `no_hp` varchar(20) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `image` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'https://via.placeholder.com/150'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_profile`
--

INSERT INTO `users_profile` (`id`, `users_id`, `jenis_kelamin`, `bio`, `no_hp`, `age`, `image`) VALUES
(1, 1, 'Perempuan', 'Digital Artist', '081234567890', 20, 'https://res.cloudinary.com/da0dcs88v/image/upload/v1718273797/taritme/users_profile/kskzrlgrx6mxu1lywtmm.jpg');

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_komunitas_id` (`komunitas_id`);

--
-- Indexes for table `pelatih_tari`
--
ALTER TABLE `pelatih_tari`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penilaian_pelatih_tari`
--
ALTER TABLE `penilaian_pelatih_tari`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelatih_tari_id` (`pelatih_tari_id`);

--
-- Indexes for table `riwayat_kursus`
--
ALTER TABLE `riwayat_kursus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_id` (`users_id`),
  ADD KEY `pelatih_tari_id_riwayat_kursus_ibfk_1` (`pelatih_tari_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pelatih_tari`
--
ALTER TABLE `detail_pelatih_tari`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `komunitas`
--
ALTER TABLE `komunitas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `komunitas_link_socialmedia`
--
ALTER TABLE `komunitas_link_socialmedia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelatih_tari`
--
ALTER TABLE `pelatih_tari`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `penilaian_pelatih_tari`
--
ALTER TABLE `penilaian_pelatih_tari`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `riwayat_kursus`
--
ALTER TABLE `riwayat_kursus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_profile`
--
ALTER TABLE `users_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pelatih_tari`
--
ALTER TABLE `detail_pelatih_tari`
  ADD CONSTRAINT `fk_pelatih_tari_id` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `komunitas_link_socialmedia`
--
ALTER TABLE `komunitas_link_socialmedia`
  ADD CONSTRAINT `fk_komunitas_id` FOREIGN KEY (`komunitas_id`) REFERENCES `komunitas` (`id`);

--
-- Constraints for table `penilaian_pelatih_tari`
--
ALTER TABLE `penilaian_pelatih_tari`
  ADD CONSTRAINT `penilaian_pelatih_tari_ibfk_1` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat_kursus`
--
ALTER TABLE `riwayat_kursus`
  ADD CONSTRAINT `fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pelatih_tari_id_riwayat_kursus_ibfk_1` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD CONSTRAINT `users_profile_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
