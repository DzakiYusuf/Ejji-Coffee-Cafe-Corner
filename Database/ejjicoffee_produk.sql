-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: remenkopi3
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produk` (
  `id_produk` int NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int NOT NULL,
  PRIMARY KEY (`id_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` VALUES (23,'Vannila coffe Latte',22000,'Ejji-Coffe-217x300.png.svg','Perpanduan antara kopi dengan susu vanilla',98),(24,'Cappucino (Hot)',18000,'Cappucino-217x300.png.svg','                        Ristretto coffee dengan tambahan susu dan latte art untuk menambah keindahan                        ',49),(25,'Ice Tea',10000,'Kuro-Charcoal-217x300.png.svg','                Es teh atau Teh es adalah teh yang didinginkan dengan es batu. Es teh sering kali ditambahkan rasa seperti melati, dan buah-buahan seperti limun, ceri, dan arbei, atau susu. Es teh adalah minuman yang sering diminum saat siang hari karena suhu udara yang panas.                ',10),(26,'Rum Regal',12000,'d4.svg','Susu rum dengan tambahan topping regal',19),(27,'Irish coffe Latte',18000,'d5.svg','Perpanduan antara kopi dengan susu irish',19),(28,'Rainbow Squash',11000,'d6.svg','                Minuman bersoda dipadukan dengan sirup buah dengan kesegaran tiada tara                ',17),(29,'Avocado Juice',18000,'d7.svg','        Jus alpukat segar dengan tinggi vitamin dan gizi        ',19),(30,'Cappucino',20000,'d8.svg','        Cappuccino merupakan kopi yang populer dari Italia karena lebih sering dan lebih banyak dikonsumsi. Rasanya yang tidak terlalu pahit seperti espresso, membuat cappuccino lebih mudah diterima oleh lidah semua orang khususnya kalangan muda. Komposisinya terdiri atas espresso dan tambahan susu cair serta busa di atasnya.        ',18),(31,'Hot Chocolate',15000,'d9.svg','        Cokelat panas adalah minuman panas yang dibuat dari cokelat atau kakao bubuk dan gula, dengan air atau susu hangat. Beberapa studi telah menunjukkan bahwa cokelat panas menyehatkan karena antioksidan yang terkandung dalam kakao.        ',18),(32,'Teh Tarik',10000,'d10.svg','        Teh tarik adalah minuman manis berupa campuran teh dan susu yang lazim ditemukan di daerah Asia Tenggara, khususnya Indonesia, Malaysia, dan Singapura. Minuman ini biasanya dijual oleh para mamak (orang India Muslim) di Malaysia dan Singapura, yang menjadikannya sebagai minuman nasional negara tersebut.        ',20),(42,'Ice Cream',10000,'d20.svg','        Es krim adalah sebuah makanan beku yang dibuat dari produk susu seperti krim, lalu dicampur dengan perasa dan pemanis buatan ataupun alami. Campuran ini didinginkan dengan diaduk sambil mengurangi suhunya untuk mencegah pembentukan es batu.        ',19);
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-08  6:46:51
