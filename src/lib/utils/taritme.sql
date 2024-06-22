-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: taritme
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detail_pelatih_tari`
--

DROP TABLE IF EXISTS `detail_pelatih_tari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_pelatih_tari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelatih_tari_id` int(11) NOT NULL,
  `tentang_pelatih` text NOT NULL,
  `image_1` text DEFAULT NULL,
  `image_2` text DEFAULT NULL,
  `image_3` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pelatih_tari_id` (`pelatih_tari_id`),
  CONSTRAINT `fk_pelatih_tari_id` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_pelatih_tari`
--

LOCK TABLES `detail_pelatih_tari` WRITE;
/*!40000 ALTER TABLE `detail_pelatih_tari` DISABLE KEYS */;
INSERT INTO `detail_pelatih_tari` VALUES (1,1,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/tika_wulandari/in1wj8rglyamonycljrd','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/tika_wulandari/xkperozsulg7r0ko3olm','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/tika_wulandari/fqwtskza2uz1agsj8pkr'),(2,2,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/siti_rahayu/sruhipsqczwrxk9ruiyb','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/siti_rahayu/peookhvxlefqsaielkil','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/siti_rahayu/zyqzrrmuk2ql5hdjj1kv'),(3,3,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994590/taritme/pelatih_tari/detail_pelatih_tari/maya_indah/ksfrdcxw2pjdgzousz8g.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994590/taritme/pelatih_tari/detail_pelatih_tari/maya_indah/qor70kxcsessw2evvhg3.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994589/taritme/pelatih_tari/detail_pelatih_tari/maya_indah/cxbcilgq7hyvxa69hto1.png'),(4,4,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994483/taritme/pelatih_tari/detail_pelatih_tari/nadia_sari/gvmoov8tczzkklgpo9uu.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994482/taritme/pelatih_tari/detail_pelatih_tari/nadia_sari/fxddzqdfopb8ogelhtdu.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994482/taritme/pelatih_tari/detail_pelatih_tari/nadia_sari/n7umtdxx9dvzc8nucwvw.png'),(5,5,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1718272415/taritme/pelatih_tari/detail_pelatih_tari/rina_ayu/pnntsbwfoj3bwbn2gbq6.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718272415/taritme/pelatih_tari/detail_pelatih_tari/rina_ayu/eczo3uwjbdq5dshcpd0g.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718272415/taritme/pelatih_tari/detail_pelatih_tari/rina_ayu/z6ejvqq660z5jreczj8m.png'),(6,6,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994568/taritme/pelatih_tari/detail_pelatih_tari/alya_putri/idfqmztupt76swqtosjw.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994568/taritme/pelatih_tari/detail_pelatih_tari/alya_putri/idfqmztupt76swqtosjw.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994568/taritme/pelatih_tari/detail_pelatih_tari/alya_putri/vw0mvlnfug5j56w46nrz.png'),(7,7,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1719001469/taritme/pelatih_tari/detail_pelatih_tari/dewi_lestari/hos3lay25ibcjdv55no9.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1719001469/taritme/pelatih_tari/detail_pelatih_tari/dewi_lestari/bnsitt3nl5psemuqykds.png','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/dewi_lestari/gqklcz5sdmmu0d0hd7d2');
/*!40000 ALTER TABLE `detail_pelatih_tari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komunitas`
--

DROP TABLE IF EXISTS `komunitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komunitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(150) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komunitas`
--

LOCK TABLES `komunitas` WRITE;
/*!40000 ALTER TABLE `komunitas` DISABLE KEYS */;
INSERT INTO `komunitas` VALUES (1,'https://res.cloudinary.com/da0dcs88v/image/upload/v1716633770/taritme/komunitas/q8qqd5105vvncmsxanb7.png','Komunitas Sanggar Budaya 1','Sebuah komunitas yang memadukan keindahan gerakan tradisional dengan nuansa modern, menciptakan karya-karya yang memikat hati penonton dari berbagai kalangan.',1,'2024-05-25'),(2,'https://res.cloudinary.com/da0dcs88v/image/upload/v1716633769/taritme/komunitas/vv9y7omaoilgin4dz7gy.png','Komunitas Sanggar Budaya 2','Menyajikan pertunjukan yang menggabungkan elemen-elemen tari dari berbagai daerah di Indonesia, merayakan keberagaman budaya dalam setiap gerakan.',1,'2020-05-25'),(3,'https://res.cloudinary.com/da0dcs88v/image/upload/v1716633769/taritme/komunitas/skekoulikwl4ekrpblxe.png','Komunitas Sanggar Budaya 3','Menciptakan ruang bagi generasi muda untuk mempelajari dan melestarikan warisan budaya melalui tarian-tarian klasik dan kontemporer, serta mengadakan workshop dan seminar untuk mendalami nilai-nilai budaya yang terkandung dalam setiap gerakan.',1,'2020-05-25'),(4,'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/komunitas/mytdgr8dqjexrt4sd3q4','Komunitas Sanggar Budaya 4','Merangkul ragam etnis dan kepercayaan dalam tarian-tarian mereka, menggambarkan kekayaan budaya Indonesia melalui gerakan-gerakan yang penuh semangat.',1,'2020-05-25'),(5,'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/komunitas/ghqkhnmxk6bqd9c3mj0x','Komunitas Sanggar Budaya 5','Menghidupkan kembali cerita-cerita klasik melalui tarian-tarian yang elegan dan penuh makna, menyuarakan warisan budaya sebagai bagian tak terpisahkan dari identitas bangsa.',1,'2020-05-25'),(6,'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/komunitas/tbvl7o1wrpvmdhy0v7dz','Komunitas Sanggar Budaya 6','Menjelajahi kreativitas melalui tarian, menggabungkan elemen-elemen modern dengan tradisional untuk menciptakan karya-karya yang menyentuh dan menginspirasi.',1,'2020-05-25');
/*!40000 ALTER TABLE `komunitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komunitas_link_socialmedia`
--

DROP TABLE IF EXISTS `komunitas_link_socialmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komunitas_link_socialmedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebook` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(100) DEFAULT NULL,
  `komunitas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_komunitas_id` (`komunitas_id`),
  CONSTRAINT `fk_komunitas_id` FOREIGN KEY (`komunitas_id`) REFERENCES `komunitas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komunitas_link_socialmedia`
--

LOCK TABLES `komunitas_link_socialmedia` WRITE;
/*!40000 ALTER TABLE `komunitas_link_socialmedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `komunitas_link_socialmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelatih_tari`
--

DROP TABLE IF EXISTS `pelatih_tari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelatih_tari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `image` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelatih_tari`
--

LOCK TABLES `pelatih_tari` WRITE;
/*!40000 ALTER TABLE `pelatih_tari` DISABLE KEYS */;
INSERT INTO `pelatih_tari` VALUES (1,'tika@wulandari.com','Tika Wulandari','081234567098','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'2024-06-11 21:54:06','Aktif'),(2,'siti@rahayu.com','Siti Rahayu','080987654321','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/olfxidggiyah97mukttm',100000,'2024-06-12 13:25:03','Aktif'),(3,'maya@indah.com','Maya Indah','123456789010','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/r9gckk3phjlxinswcocn',100000,'2024-06-12 13:26:40','Aktif'),(4,'sari@nadia.com','Nadia Sari','291038475647','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/znb0pkxlahfztduvsqnk',150000,'2024-06-12 13:27:23','Aktif'),(5,'ayu@ayu.app','Rina Ayu','092315679675','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'2024-06-12 13:28:25','Aktif'),(6,'putri@alya.dev','Alya Putri','124234122535','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/zojabharmftekwg6feev',200000,'2024-06-12 13:29:10','Aktif'),(7,'lestari@lestari.com','Dewi Lestari','243523592512','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/deujljl1f4odhxriornp',100000,'2024-06-12 13:29:56','Aktif');
/*!40000 ALTER TABLE `pelatih_tari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penilaian_pelatih_tari`
--

DROP TABLE IF EXISTS `penilaian_pelatih_tari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penilaian_pelatih_tari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelatih_tari_id` int(11) NOT NULL,
  `pelatih_tari_name` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pelatih_tari_id` (`pelatih_tari_id`),
  CONSTRAINT `penilaian_pelatih_tari_ibfk_1` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penilaian_pelatih_tari`
--

LOCK TABLES `penilaian_pelatih_tari` WRITE;
/*!40000 ALTER TABLE `penilaian_pelatih_tari` DISABLE KEYS */;
INSERT INTO `penilaian_pelatih_tari` VALUES (1,5,'Rina Ayu',5,'Pengajarannya bagus, juga kakaknya ramah!','yui@yui.app','Sawamura Eriri Spencer','TRM-ITEM-ko2NLsMnjF','2024-06-22 08:25:05'),(2,5,'Rina Ayu',5,'Kak Rina pengajarannya bagus sekali, saya jadi cepat mengerti!','yui@hirasawa.dev','Yui Hirasawa','TRM-ITEM-ikhqVd50xO','2024-06-22 17:24:44'),(3,5,'Rina Ayu',5,'Pengajarannya bagus, dan sudah tepat dengan ekspektasi saya. Terima kasih kak Rina!','megumi@megumi.dev','Megumi','TRM-ITEM-nha7Y1TJk6','2024-06-22 18:14:10');
/*!40000 ALTER TABLE `penilaian_pelatih_tari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayat_kursus`
--

DROP TABLE IF EXISTS `riwayat_kursus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayat_kursus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `pelatih_tari_name` varchar(30) NOT NULL,
  `pelatih_tari_image` text DEFAULT NULL,
  `pelatih_tari_price` int(11) NOT NULL,
  `pelatih_tari_description` text DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `pelatih_tari_id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_users_id` (`users_id`),
  KEY `pelatih_tari_id_riwayat_kursus_ibfk_1` (`pelatih_tari_id`),
  CONSTRAINT `fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `pelatih_tari_id_riwayat_kursus_ibfk_1` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_kursus`
--

LOCK TABLES `riwayat_kursus` WRITE;
/*!40000 ALTER TABLE `riwayat_kursus` DISABLE KEYS */;
INSERT INTO `riwayat_kursus` VALUES (8,'yui@yui.app','Rina Ayu','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,5,'TRM-ITEM-6OvHuDyya2','2024-06-22 08:09:03'),(9,'yui@yui.app','Rina Ayu','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,5,'TRM-ITEM-ko2NLsMnjF','2024-06-22 08:24:40'),(10,'yui@yui.app','Dewi Lestari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/deujljl1f4odhxriornp',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,7,'TRM-ITEM-_05WvRKCKU','2024-06-22 10:15:15'),(11,'yui@yui.app','Maya Indah','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/r9gckk3phjlxinswcocn',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,3,'TRM-ITEM-yMCg2mAYVR','2024-06-22 10:24:14'),(12,'yui@yui.app','Maya Indah','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/r9gckk3phjlxinswcocn',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,3,'TRM-ITEM-yfZN_BV-P0','2024-06-22 10:36:40'),(13,'yui@yui.app','Tika Wulandari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,1,'TRM-ITEM-U6qgQ4vcnx','2024-06-22 10:49:14'),(14,'yui@yui.app','Tika Wulandari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,1,'TRM-ITEM-5yZrvT1dyY','2024-06-22 11:01:32'),(15,'yui@yui.app','Tika Wulandari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,1,'TRM-ITEM-PZth6tjEAO','2024-06-22 11:46:15'),(16,'yui@yui.app','Tika Wulandari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,1,'TRM-ITEM-2AXZDdLP85','2024-06-22 11:56:53'),(17,'yui@hirasawa.dev','Rina Ayu','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',7,5,'TRM-ITEM-ikhqVd50xO','2024-06-22 17:24:13'),(18,'megumi@megumi.dev','Rina Ayu','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',8,5,'TRM-ITEM-nha7Y1TJk6','2024-06-22 18:13:38');
/*!40000 ALTER TABLE `riwayat_kursus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `is_already_paid` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sawamura Eriri Spencer','yui@yui.app','$2b$10$5QfQMtJ22.eS5XJidCeCtOqF3uG8nY1WJu6kgs6ERMH.4.mTlQ9YO',1),(2,'Haikel Ilham Hakim','haikelilhamhakim@gmail.com','$2b$10$lErkM8ezp46EVC.ImAfSXuY9qv82ZTVFjzvU/F1o0I8YS6IUoKYbi',0),(4,'nanda','nandaistobi@gmail.com','$2b$10$fmZE3AbWfJS3n2Qu19Zw5Oz9NDnkkwhF4X9lpOJQDtSMLk8Zst/jK',0),(5,'Muhammad Azka Tanzila','sierra.codex@gmail.com','$2b$10$okb.TbjRNgSDNNzINRHpd.drsV1FgBxy1jKCfTUMFN./SdOhM2cKS',0),(7,'Yui Hirasawa','yui@hirasawa.dev','$2b$10$ERdLOjEtwisEMWWd3JxKQOtx035ZH5/x5ylW55FOYzE5REfiAFLji',1),(8,'Katou Megumi','megumi@megumi.dev','$2b$10$air2GFMwy1BV.9FQ1n/FOeeAZN98eTlqsXiuBmu3gWS.jtyV2fwES',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `image` varchar(250) DEFAULT 'https://via.placeholder.com/150',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `users_profile_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` VALUES (1,1,'Perempuan','Digital Artist','081234567890',20,'https://res.cloudinary.com/da0dcs88v/image/upload/v1719043662/taritme/users_profile/hurg70rt5hw6y2ikdiza.jpg'),(4,2,NULL,NULL,NULL,NULL,'https://via.placeholder.com/150'),(6,4,NULL,NULL,NULL,NULL,'https://via.placeholder.com/150'),(7,5,NULL,NULL,NULL,NULL,'https://via.placeholder.com/150'),(9,7,'Perempuan','Karakter anime','081234567890',20,'https://res.cloudinary.com/da0dcs88v/image/upload/v1719077122/taritme/users_profile/zumhz8ai5ua7whpw7h4e.jpg'),(10,8,'Perempuan','Hengker baik','081234567890',20,'https://res.cloudinary.com/da0dcs88v/image/upload/v1719080088/taritme/users_profile/kpnm29faukjei7pirjyx.jpg');
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-22 19:33:30
root@taritme ~/t/s/l/utils (master)# rm -rf taritme.sql
root@taritme ~/t/s/l/utils (master)# mysqldump -u root -p --databases taritme > taritme.sql
Enter password:
root@taritme ~/t/s/l/utils (master)# cat taritme.sql
-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: taritme
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `taritme`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `taritme` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `taritme`;

--
-- Table structure for table `detail_pelatih_tari`
--

DROP TABLE IF EXISTS `detail_pelatih_tari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_pelatih_tari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelatih_tari_id` int(11) NOT NULL,
  `tentang_pelatih` text NOT NULL,
  `image_1` text DEFAULT NULL,
  `image_2` text DEFAULT NULL,
  `image_3` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pelatih_tari_id` (`pelatih_tari_id`),
  CONSTRAINT `fk_pelatih_tari_id` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_pelatih_tari`
--

LOCK TABLES `detail_pelatih_tari` WRITE;
/*!40000 ALTER TABLE `detail_pelatih_tari` DISABLE KEYS */;
INSERT INTO `detail_pelatih_tari` VALUES (1,1,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/tika_wulandari/in1wj8rglyamonycljrd','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/tika_wulandari/xkperozsulg7r0ko3olm','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/tika_wulandari/fqwtskza2uz1agsj8pkr'),(2,2,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/siti_rahayu/sruhipsqczwrxk9ruiyb','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/siti_rahayu/peookhvxlefqsaielkil','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/siti_rahayu/zyqzrrmuk2ql5hdjj1kv'),(3,3,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994590/taritme/pelatih_tari/detail_pelatih_tari/maya_indah/ksfrdcxw2pjdgzousz8g.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994590/taritme/pelatih_tari/detail_pelatih_tari/maya_indah/qor70kxcsessw2evvhg3.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994589/taritme/pelatih_tari/detail_pelatih_tari/maya_indah/cxbcilgq7hyvxa69hto1.png'),(4,4,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994483/taritme/pelatih_tari/detail_pelatih_tari/nadia_sari/gvmoov8tczzkklgpo9uu.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994482/taritme/pelatih_tari/detail_pelatih_tari/nadia_sari/fxddzqdfopb8ogelhtdu.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994482/taritme/pelatih_tari/detail_pelatih_tari/nadia_sari/n7umtdxx9dvzc8nucwvw.png'),(5,5,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1718272415/taritme/pelatih_tari/detail_pelatih_tari/rina_ayu/pnntsbwfoj3bwbn2gbq6.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718272415/taritme/pelatih_tari/detail_pelatih_tari/rina_ayu/eczo3uwjbdq5dshcpd0g.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718272415/taritme/pelatih_tari/detail_pelatih_tari/rina_ayu/z6ejvqq660z5jreczj8m.png'),(6,6,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994568/taritme/pelatih_tari/detail_pelatih_tari/alya_putri/idfqmztupt76swqtosjw.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994568/taritme/pelatih_tari/detail_pelatih_tari/alya_putri/idfqmztupt76swqtosjw.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994568/taritme/pelatih_tari/detail_pelatih_tari/alya_putri/vw0mvlnfug5j56w46nrz.png'),(7,7,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1719001469/taritme/pelatih_tari/detail_pelatih_tari/dewi_lestari/hos3lay25ibcjdv55no9.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1719001469/taritme/pelatih_tari/detail_pelatih_tari/dewi_lestari/bnsitt3nl5psemuqykds.png','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/dewi_lestari/gqklcz5sdmmu0d0hd7d2');
/*!40000 ALTER TABLE `detail_pelatih_tari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komunitas`
--

DROP TABLE IF EXISTS `komunitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komunitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(150) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komunitas`
--

LOCK TABLES `komunitas` WRITE;
/*!40000 ALTER TABLE `komunitas` DISABLE KEYS */;
INSERT INTO `komunitas` VALUES (1,'https://res.cloudinary.com/da0dcs88v/image/upload/v1716633770/taritme/komunitas/q8qqd5105vvncmsxanb7.png','Komunitas Sanggar Budaya 1','Sebuah komunitas yang memadukan keindahan gerakan tradisional dengan nuansa modern, menciptakan karya-karya yang memikat hati penonton dari berbagai kalangan.',1,'2024-05-25'),(2,'https://res.cloudinary.com/da0dcs88v/image/upload/v1716633769/taritme/komunitas/vv9y7omaoilgin4dz7gy.png','Komunitas Sanggar Budaya 2','Menyajikan pertunjukan yang menggabungkan elemen-elemen tari dari berbagai daerah di Indonesia, merayakan keberagaman budaya dalam setiap gerakan.',1,'2020-05-25'),(3,'https://res.cloudinary.com/da0dcs88v/image/upload/v1716633769/taritme/komunitas/skekoulikwl4ekrpblxe.png','Komunitas Sanggar Budaya 3','Menciptakan ruang bagi generasi muda untuk mempelajari dan melestarikan warisan budaya melalui tarian-tarian klasik dan kontemporer, serta mengadakan workshop dan seminar untuk mendalami nilai-nilai budaya yang terkandung dalam setiap gerakan.',1,'2020-05-25'),(4,'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/komunitas/mytdgr8dqjexrt4sd3q4','Komunitas Sanggar Budaya 4','Merangkul ragam etnis dan kepercayaan dalam tarian-tarian mereka, menggambarkan kekayaan budaya Indonesia melalui gerakan-gerakan yang penuh semangat.',1,'2020-05-25'),(5,'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/komunitas/ghqkhnmxk6bqd9c3mj0x','Komunitas Sanggar Budaya 5','Menghidupkan kembali cerita-cerita klasik melalui tarian-tarian yang elegan dan penuh makna, menyuarakan warisan budaya sebagai bagian tak terpisahkan dari identitas bangsa.',1,'2020-05-25'),(6,'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/komunitas/tbvl7o1wrpvmdhy0v7dz','Komunitas Sanggar Budaya 6','Menjelajahi kreativitas melalui tarian, menggabungkan elemen-elemen modern dengan tradisional untuk menciptakan karya-karya yang menyentuh dan menginspirasi.',1,'2020-05-25');
/*!40000 ALTER TABLE `komunitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komunitas_link_socialmedia`
--

DROP TABLE IF EXISTS `komunitas_link_socialmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komunitas_link_socialmedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebook` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(100) DEFAULT NULL,
  `komunitas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_komunitas_id` (`komunitas_id`),
  CONSTRAINT `fk_komunitas_id` FOREIGN KEY (`komunitas_id`) REFERENCES `komunitas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komunitas_link_socialmedia`
--

LOCK TABLES `komunitas_link_socialmedia` WRITE;
/*!40000 ALTER TABLE `komunitas_link_socialmedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `komunitas_link_socialmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelatih_tari`
--

DROP TABLE IF EXISTS `pelatih_tari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelatih_tari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `image` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelatih_tari`
--

LOCK TABLES `pelatih_tari` WRITE;
/*!40000 ALTER TABLE `pelatih_tari` DISABLE KEYS */;
INSERT INTO `pelatih_tari` VALUES (1,'tika@wulandari.com','Tika Wulandari','081234567098','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'2024-06-11 21:54:06','Aktif'),(2,'siti@rahayu.com','Siti Rahayu','080987654321','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/olfxidggiyah97mukttm',100000,'2024-06-12 13:25:03','Aktif'),(3,'maya@indah.com','Maya Indah','123456789010','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/r9gckk3phjlxinswcocn',100000,'2024-06-12 13:26:40','Aktif'),(4,'sari@nadia.com','Nadia Sari','291038475647','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/znb0pkxlahfztduvsqnk',150000,'2024-06-12 13:27:23','Aktif'),(5,'ayu@ayu.app','Rina Ayu','092315679675','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'2024-06-12 13:28:25','Aktif'),(6,'putri@alya.dev','Alya Putri','124234122535','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/zojabharmftekwg6feev',200000,'2024-06-12 13:29:10','Aktif'),(7,'lestari@lestari.com','Dewi Lestari','243523592512','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/deujljl1f4odhxriornp',100000,'2024-06-12 13:29:56','Aktif');
/*!40000 ALTER TABLE `pelatih_tari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penilaian_pelatih_tari`
--

DROP TABLE IF EXISTS `penilaian_pelatih_tari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penilaian_pelatih_tari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelatih_tari_id` int(11) NOT NULL,
  `pelatih_tari_name` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pelatih_tari_id` (`pelatih_tari_id`),
  CONSTRAINT `penilaian_pelatih_tari_ibfk_1` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penilaian_pelatih_tari`
--

LOCK TABLES `penilaian_pelatih_tari` WRITE;
/*!40000 ALTER TABLE `penilaian_pelatih_tari` DISABLE KEYS */;
INSERT INTO `penilaian_pelatih_tari` VALUES (1,5,'Rina Ayu',5,'Pengajarannya bagus, juga kakaknya ramah!','yui@yui.app','Sawamura Eriri Spencer','TRM-ITEM-ko2NLsMnjF','2024-06-22 08:25:05'),(2,5,'Rina Ayu',5,'Kak Rina pengajarannya bagus sekali, saya jadi cepat mengerti!','yui@hirasawa.dev','Yui Hirasawa','TRM-ITEM-ikhqVd50xO','2024-06-22 17:24:44'),(3,5,'Rina Ayu',5,'Pengajarannya bagus, dan sudah tepat dengan ekspektasi saya. Terima kasih kak Rina!','megumi@megumi.dev','Megumi','TRM-ITEM-nha7Y1TJk6','2024-06-22 18:14:10');
/*!40000 ALTER TABLE `penilaian_pelatih_tari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayat_kursus`
--

DROP TABLE IF EXISTS `riwayat_kursus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayat_kursus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `pelatih_tari_name` varchar(30) NOT NULL,
  `pelatih_tari_image` text DEFAULT NULL,
  `pelatih_tari_price` int(11) NOT NULL,
  `pelatih_tari_description` text DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `pelatih_tari_id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_users_id` (`users_id`),
  KEY `pelatih_tari_id_riwayat_kursus_ibfk_1` (`pelatih_tari_id`),
  CONSTRAINT `fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `pelatih_tari_id_riwayat_kursus_ibfk_1` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_kursus`
--

LOCK TABLES `riwayat_kursus` WRITE;
/*!40000 ALTER TABLE `riwayat_kursus` DISABLE KEYS */;
INSERT INTO `riwayat_kursus` VALUES (8,'yui@yui.app','Rina Ayu','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,5,'TRM-ITEM-6OvHuDyya2','2024-06-22 08:09:03'),(9,'yui@yui.app','Rina Ayu','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,5,'TRM-ITEM-ko2NLsMnjF','2024-06-22 08:24:40'),(10,'yui@yui.app','Dewi Lestari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/deujljl1f4odhxriornp',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,7,'TRM-ITEM-_05WvRKCKU','2024-06-22 10:15:15'),(11,'yui@yui.app','Maya Indah','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/r9gckk3phjlxinswcocn',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,3,'TRM-ITEM-yMCg2mAYVR','2024-06-22 10:24:14'),(12,'yui@yui.app','Maya Indah','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/r9gckk3phjlxinswcocn',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,3,'TRM-ITEM-yfZN_BV-P0','2024-06-22 10:36:40'),(13,'yui@yui.app','Tika Wulandari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,1,'TRM-ITEM-U6qgQ4vcnx','2024-06-22 10:49:14'),(14,'yui@yui.app','Tika Wulandari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,1,'TRM-ITEM-5yZrvT1dyY','2024-06-22 11:01:32'),(15,'yui@yui.app','Tika Wulandari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,1,'TRM-ITEM-PZth6tjEAO','2024-06-22 11:46:15'),(16,'yui@yui.app','Tika Wulandari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,1,'TRM-ITEM-2AXZDdLP85','2024-06-22 11:56:53'),(17,'yui@hirasawa.dev','Rina Ayu','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',7,5,'TRM-ITEM-ikhqVd50xO','2024-06-22 17:24:13'),(18,'megumi@megumi.dev','Rina Ayu','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',8,5,'TRM-ITEM-nha7Y1TJk6','2024-06-22 18:13:38');
/*!40000 ALTER TABLE `riwayat_kursus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `is_already_paid` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sawamura Eriri Spencer','yui@yui.app','$2b$10$5QfQMtJ22.eS5XJidCeCtOqF3uG8nY1WJu6kgs6ERMH.4.mTlQ9YO',1),(2,'Haikel Ilham Hakim','haikelilhamhakim@gmail.com','$2b$10$lErkM8ezp46EVC.ImAfSXuY9qv82ZTVFjzvU/F1o0I8YS6IUoKYbi',0),(4,'nanda','nandaistobi@gmail.com','$2b$10$fmZE3AbWfJS3n2Qu19Zw5Oz9NDnkkwhF4X9lpOJQDtSMLk8Zst/jK',0),(5,'Muhammad Azka Tanzila','sierra.codex@gmail.com','$2b$10$okb.TbjRNgSDNNzINRHpd.drsV1FgBxy1jKCfTUMFN./SdOhM2cKS',0),(7,'Yui Hirasawa','yui@hirasawa.dev','$2b$10$ERdLOjEtwisEMWWd3JxKQOtx035ZH5/x5ylW55FOYzE5REfiAFLji',1),(8,'Katou Megumi','megumi@megumi.dev','$2b$10$air2GFMwy1BV.9FQ1n/FOeeAZN98eTlqsXiuBmu3gWS.jtyV2fwES',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `image` varchar(250) DEFAULT 'https://via.placeholder.com/150',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `users_profile_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` VALUES (1,1,'Perempuan','Digital Artist','081234567890',20,'https://res.cloudinary.com/da0dcs88v/image/upload/v1719043662/taritme/users_profile/hurg70rt5hw6y2ikdiza.jpg'),(4,2,NULL,NULL,NULL,NULL,'https://via.placeholder.com/150'),(6,4,NULL,NULL,NULL,NULL,'https://via.placeholder.com/150'),(7,5,NULL,NULL,NULL,NULL,'https://via.placeholder.com/150'),(9,7,'Perempuan','Karakter anime','081234567890',20,'https://res.cloudinary.com/da0dcs88v/image/upload/v1719077122/taritme/users_profile/zumhz8ai5ua7whpw7h4e.jpg'),(10,8,'Perempuan','Hengker baik','081234567890',20,'https://res.cloudinary.com/da0dcs88v/image/upload/v1719080088/taritme/users_profile/kpnm29faukjei7pirjyx.jpg');
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-22 19:37:50
root@taritme ~/t/s/l/utils (master)# rm -rf taritme.sql
root@taritme ~/t/s/l/utils (master)# mysqldump -u root -p --databases taritme > taritme.sql
Enter password:
root@taritme ~/t/s/l/utils (master)# cat taritme.sql
-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: taritme
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `taritme`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `taritme` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `taritme`;

--
-- Table structure for table `detail_pelatih_tari`
--

DROP TABLE IF EXISTS `detail_pelatih_tari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_pelatih_tari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelatih_tari_id` int(11) NOT NULL,
  `tentang_pelatih` text NOT NULL,
  `image_1` text DEFAULT NULL,
  `image_2` text DEFAULT NULL,
  `image_3` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pelatih_tari_id` (`pelatih_tari_id`),
  CONSTRAINT `fk_pelatih_tari_id` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_pelatih_tari`
--

LOCK TABLES `detail_pelatih_tari` WRITE;
/*!40000 ALTER TABLE `detail_pelatih_tari` DISABLE KEYS */;
INSERT INTO `detail_pelatih_tari` VALUES (1,1,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/tika_wulandari/in1wj8rglyamonycljrd','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/tika_wulandari/xkperozsulg7r0ko3olm','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/tika_wulandari/fqwtskza2uz1agsj8pkr'),(2,2,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/siti_rahayu/sruhipsqczwrxk9ruiyb','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/siti_rahayu/peookhvxlefqsaielkil','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/siti_rahayu/zyqzrrmuk2ql5hdjj1kv'),(3,3,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994590/taritme/pelatih_tari/detail_pelatih_tari/maya_indah/ksfrdcxw2pjdgzousz8g.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994590/taritme/pelatih_tari/detail_pelatih_tari/maya_indah/qor70kxcsessw2evvhg3.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994589/taritme/pelatih_tari/detail_pelatih_tari/maya_indah/cxbcilgq7hyvxa69hto1.png'),(4,4,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994483/taritme/pelatih_tari/detail_pelatih_tari/nadia_sari/gvmoov8tczzkklgpo9uu.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994482/taritme/pelatih_tari/detail_pelatih_tari/nadia_sari/fxddzqdfopb8ogelhtdu.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994482/taritme/pelatih_tari/detail_pelatih_tari/nadia_sari/n7umtdxx9dvzc8nucwvw.png'),(5,5,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1718272415/taritme/pelatih_tari/detail_pelatih_tari/rina_ayu/pnntsbwfoj3bwbn2gbq6.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718272415/taritme/pelatih_tari/detail_pelatih_tari/rina_ayu/eczo3uwjbdq5dshcpd0g.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718272415/taritme/pelatih_tari/detail_pelatih_tari/rina_ayu/z6ejvqq660z5jreczj8m.png'),(6,6,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994568/taritme/pelatih_tari/detail_pelatih_tari/alya_putri/idfqmztupt76swqtosjw.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994568/taritme/pelatih_tari/detail_pelatih_tari/alya_putri/idfqmztupt76swqtosjw.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1718994568/taritme/pelatih_tari/detail_pelatih_tari/alya_putri/vw0mvlnfug5j56w46nrz.png'),(7,7,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/v1719001469/taritme/pelatih_tari/detail_pelatih_tari/dewi_lestari/hos3lay25ibcjdv55no9.png','https://res.cloudinary.com/da0dcs88v/image/upload/v1719001469/taritme/pelatih_tari/detail_pelatih_tari/dewi_lestari/bnsitt3nl5psemuqykds.png','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/detail_pelatih_tari/dewi_lestari/gqklcz5sdmmu0d0hd7d2');
/*!40000 ALTER TABLE `detail_pelatih_tari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komunitas`
--

DROP TABLE IF EXISTS `komunitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komunitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(150) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komunitas`
--

LOCK TABLES `komunitas` WRITE;
/*!40000 ALTER TABLE `komunitas` DISABLE KEYS */;
INSERT INTO `komunitas` VALUES (1,'https://res.cloudinary.com/da0dcs88v/image/upload/v1716633770/taritme/komunitas/q8qqd5105vvncmsxanb7.png','Komunitas Sanggar Budaya 1','Sebuah komunitas yang memadukan keindahan gerakan tradisional dengan nuansa modern, menciptakan karya-karya yang memikat hati penonton dari berbagai kalangan.',1,'2024-05-25'),(2,'https://res.cloudinary.com/da0dcs88v/image/upload/v1716633769/taritme/komunitas/vv9y7omaoilgin4dz7gy.png','Komunitas Sanggar Budaya 2','Menyajikan pertunjukan yang menggabungkan elemen-elemen tari dari berbagai daerah di Indonesia, merayakan keberagaman budaya dalam setiap gerakan.',1,'2020-05-25'),(3,'https://res.cloudinary.com/da0dcs88v/image/upload/v1716633769/taritme/komunitas/skekoulikwl4ekrpblxe.png','Komunitas Sanggar Budaya 3','Menciptakan ruang bagi generasi muda untuk mempelajari dan melestarikan warisan budaya melalui tarian-tarian klasik dan kontemporer, serta mengadakan workshop dan seminar untuk mendalami nilai-nilai budaya yang terkandung dalam setiap gerakan.',1,'2020-05-25'),(4,'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/komunitas/mytdgr8dqjexrt4sd3q4','Komunitas Sanggar Budaya 4','Merangkul ragam etnis dan kepercayaan dalam tarian-tarian mereka, menggambarkan kekayaan budaya Indonesia melalui gerakan-gerakan yang penuh semangat.',1,'2020-05-25'),(5,'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/komunitas/ghqkhnmxk6bqd9c3mj0x','Komunitas Sanggar Budaya 5','Menghidupkan kembali cerita-cerita klasik melalui tarian-tarian yang elegan dan penuh makna, menyuarakan warisan budaya sebagai bagian tak terpisahkan dari identitas bangsa.',1,'2020-05-25'),(6,'https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/komunitas/tbvl7o1wrpvmdhy0v7dz','Komunitas Sanggar Budaya 6','Menjelajahi kreativitas melalui tarian, menggabungkan elemen-elemen modern dengan tradisional untuk menciptakan karya-karya yang menyentuh dan menginspirasi.',1,'2020-05-25');
/*!40000 ALTER TABLE `komunitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komunitas_link_socialmedia`
--

DROP TABLE IF EXISTS `komunitas_link_socialmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komunitas_link_socialmedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebook` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(100) DEFAULT NULL,
  `komunitas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_komunitas_id` (`komunitas_id`),
  CONSTRAINT `fk_komunitas_id` FOREIGN KEY (`komunitas_id`) REFERENCES `komunitas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komunitas_link_socialmedia`
--

LOCK TABLES `komunitas_link_socialmedia` WRITE;
/*!40000 ALTER TABLE `komunitas_link_socialmedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `komunitas_link_socialmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelatih_tari`
--

DROP TABLE IF EXISTS `pelatih_tari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelatih_tari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `image` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelatih_tari`
--

LOCK TABLES `pelatih_tari` WRITE;
/*!40000 ALTER TABLE `pelatih_tari` DISABLE KEYS */;
INSERT INTO `pelatih_tari` VALUES (1,'tika@wulandari.com','Tika Wulandari','081234567098','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'2024-06-11 21:54:06','Aktif'),(2,'siti@rahayu.com','Siti Rahayu','080987654321','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/olfxidggiyah97mukttm',100000,'2024-06-12 13:25:03','Aktif'),(3,'maya@indah.com','Maya Indah','123456789010','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/r9gckk3phjlxinswcocn',100000,'2024-06-12 13:26:40','Aktif'),(4,'sari@nadia.com','Nadia Sari','291038475647','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/znb0pkxlahfztduvsqnk',150000,'2024-06-12 13:27:23','Aktif'),(5,'ayu@ayu.app','Rina Ayu','092315679675','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'2024-06-12 13:28:25','Aktif'),(6,'putri@alya.dev','Alya Putri','124234122535','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/zojabharmftekwg6feev',200000,'2024-06-12 13:29:10','Aktif'),(7,'lestari@lestari.com','Dewi Lestari','243523592512','Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/deujljl1f4odhxriornp',100000,'2024-06-12 13:29:56','Aktif');
/*!40000 ALTER TABLE `pelatih_tari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penilaian_pelatih_tari`
--

DROP TABLE IF EXISTS `penilaian_pelatih_tari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penilaian_pelatih_tari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelatih_tari_id` int(11) NOT NULL,
  `pelatih_tari_name` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pelatih_tari_id` (`pelatih_tari_id`),
  CONSTRAINT `penilaian_pelatih_tari_ibfk_1` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penilaian_pelatih_tari`
--

LOCK TABLES `penilaian_pelatih_tari` WRITE;
/*!40000 ALTER TABLE `penilaian_pelatih_tari` DISABLE KEYS */;
INSERT INTO `penilaian_pelatih_tari` VALUES (1,5,'Rina Ayu',5,'Pengajarannya bagus, juga kakaknya ramah!','yui@yui.app','Sawamura Eriri Spencer','TRM-ITEM-ko2NLsMnjF','2024-06-22 08:25:05'),(2,5,'Rina Ayu',5,'Kak Rina pengajarannya bagus sekali, saya jadi cepat mengerti!','yui@hirasawa.dev','Yui Hirasawa','TRM-ITEM-ikhqVd50xO','2024-06-22 17:24:44'),(3,5,'Rina Ayu',5,'Pengajarannya bagus, dan sudah tepat dengan ekspektasi saya. Terima kasih kak Rina!','megumi@megumi.dev','Megumi','TRM-ITEM-nha7Y1TJk6','2024-06-22 18:14:10');
/*!40000 ALTER TABLE `penilaian_pelatih_tari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayat_kursus`
--

DROP TABLE IF EXISTS `riwayat_kursus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayat_kursus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `pelatih_tari_name` varchar(30) NOT NULL,
  `pelatih_tari_image` text DEFAULT NULL,
  `pelatih_tari_price` int(11) NOT NULL,
  `pelatih_tari_description` text DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `pelatih_tari_id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_users_id` (`users_id`),
  KEY `pelatih_tari_id_riwayat_kursus_ibfk_1` (`pelatih_tari_id`),
  CONSTRAINT `fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `pelatih_tari_id_riwayat_kursus_ibfk_1` FOREIGN KEY (`pelatih_tari_id`) REFERENCES `pelatih_tari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_kursus`
--

LOCK TABLES `riwayat_kursus` WRITE;
/*!40000 ALTER TABLE `riwayat_kursus` DISABLE KEYS */;
INSERT INTO `riwayat_kursus` VALUES (8,'yui@yui.app','Rina Ayu','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,5,'TRM-ITEM-6OvHuDyya2','2024-06-22 08:09:03'),(9,'yui@yui.app','Rina Ayu','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,5,'TRM-ITEM-ko2NLsMnjF','2024-06-22 08:24:40'),(10,'yui@yui.app','Dewi Lestari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/deujljl1f4odhxriornp',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,7,'TRM-ITEM-_05WvRKCKU','2024-06-22 10:15:15'),(11,'yui@yui.app','Maya Indah','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/r9gckk3phjlxinswcocn',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,3,'TRM-ITEM-yMCg2mAYVR','2024-06-22 10:24:14'),(12,'yui@yui.app','Maya Indah','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/r9gckk3phjlxinswcocn',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,3,'TRM-ITEM-yfZN_BV-P0','2024-06-22 10:36:40'),(13,'yui@yui.app','Tika Wulandari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,1,'TRM-ITEM-U6qgQ4vcnx','2024-06-22 10:49:14'),(14,'yui@yui.app','Tika Wulandari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,1,'TRM-ITEM-5yZrvT1dyY','2024-06-22 11:01:32'),(15,'yui@yui.app','Tika Wulandari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,1,'TRM-ITEM-PZth6tjEAO','2024-06-22 11:46:15'),(16,'yui@yui.app','Tika Wulandari','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/uellvmumwswlixir1vbh',150000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',1,1,'TRM-ITEM-2AXZDdLP85','2024-06-22 11:56:53'),(17,'yui@hirasawa.dev','Rina Ayu','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',7,5,'TRM-ITEM-ikhqVd50xO','2024-06-22 17:24:13'),(18,'megumi@megumi.dev','Rina Ayu','https://res.cloudinary.com/da0dcs88v/image/upload/f_auto,q_auto/v1/taritme/pelatih_tari/jin7hkfwglolp9sunl88',100000,'Seorang pelatih tari berpengalaman yang telah mengajar seni tari selama lebih dari lima tahun, memiliki keahlian dalam menari berbagai jenis tarian, termasuk tarian daerah Sumatera Barat.',8,5,'TRM-ITEM-nha7Y1TJk6','2024-06-22 18:13:38');
/*!40000 ALTER TABLE `riwayat_kursus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `is_already_paid` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sawamura Eriri Spencer','yui@yui.app','$2b$10$5QfQMtJ22.eS5XJidCeCtOqF3uG8nY1WJu6kgs6ERMH.4.mTlQ9YO',1),(2,'Haikel Ilham Hakim','haikelilhamhakim@gmail.com','$2b$10$lErkM8ezp46EVC.ImAfSXuY9qv82ZTVFjzvU/F1o0I8YS6IUoKYbi',0),(4,'nanda','nandaistobi@gmail.com','$2b$10$fmZE3AbWfJS3n2Qu19Zw5Oz9NDnkkwhF4X9lpOJQDtSMLk8Zst/jK',0),(5,'Muhammad Azka Tanzila','sierra.codex@gmail.com','$2b$10$okb.TbjRNgSDNNzINRHpd.drsV1FgBxy1jKCfTUMFN./SdOhM2cKS',0),(7,'Yui Hirasawa','yui@hirasawa.dev','$2b$10$ERdLOjEtwisEMWWd3JxKQOtx035ZH5/x5ylW55FOYzE5REfiAFLji',1),(8,'Katou Megumi','megumi@megumi.dev','$2b$10$air2GFMwy1BV.9FQ1n/FOeeAZN98eTlqsXiuBmu3gWS.jtyV2fwES',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `image` varchar(250) DEFAULT 'https://via.placeholder.com/150',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `users_profile_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` VALUES (1,1,'Perempuan','Digital Artist','081234567890',20,'https://res.cloudinary.com/da0dcs88v/image/upload/v1719043662/taritme/users_profile/hurg70rt5hw6y2ikdiza.jpg'),(4,2,NULL,NULL,NULL,NULL,'https://via.placeholder.com/150'),(6,4,NULL,NULL,NULL,NULL,'https://via.placeholder.com/150'),(7,5,NULL,NULL,NULL,NULL,'https://via.placeholder.com/150'),(9,7,'Perempuan','Karakter anime','081234567890',20,'https://res.cloudinary.com/da0dcs88v/image/upload/v1719077122/taritme/users_profile/zumhz8ai5ua7whpw7h4e.jpg'),(10,8,'Perempuan','Hengker baik','081234567890',20,'https://res.cloudinary.com/da0dcs88v/image/upload/v1719080088/taritme/users_profile/kpnm29faukjei7pirjyx.jpg');
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-22 19:41:06
