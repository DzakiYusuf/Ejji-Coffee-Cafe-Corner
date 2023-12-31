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
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL AUTO_INCREMENT,
  `id_pembelian` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `metode` varchar(255) NOT NULL,
  `jumlah` int NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pembayaran`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
INSERT INTO `pembayaran` VALUES (22,35,'roy','Gopay',23000,'2022-06-29','20220629063531WhatsApp Image 2022-05-30 at 07.23.12.jpeg'),(23,36,'Afan','Ovo',50000,'2022-06-29','20220629063607WhatsApp Image 2022-05-30 at 07.23.12.jpeg'),(24,37,'hakim','Ovo',15000,'2022-06-29','20220629063632WhatsApp Image 2022-05-30 at 07.23.12.jpeg'),(25,38,'jokowi','Shopee Pay',28000,'2022-06-29','20220629063951WhatsApp Image 2022-05-30 at 07.23.12.jpeg'),(26,39,'boy','Dana',10000,'2022-06-29','20220629064023WhatsApp Image 2022-05-30 at 07.23.12.jpeg'),(27,40,'roy','Shopee Pay',10000,'2022-06-29','20220629144659qrcode.png'),(28,41,'rendi','Dana',13000,'2022-06-29','20220629153506d1.png'),(29,42,'DZAKI YUSUF IZZUDIN','Gopay',85000,'2023-06-03','20230603133038HogRiderCard.webp'),(30,42,'DZAKI YUSUF IZZUDIN','Gopay',85000,'2023-06-03','20230603133038HogRiderCard.webp'),(31,63,'tes2','Ovo',42000,'2023-06-03','20230603142216HogRiderCard.webp'),(32,63,'tes2','Ovo',42000,'2023-06-03','20230603142216HogRiderCard.webp'),(33,74,'DZAKI YUSUF IZZUDIN4','Ovo',10000,'2023-06-03','20230603144053HogRiderCard.webp'),(34,74,'DZAKI YUSUF IZZUDIN4','Ovo',10000,'2023-06-03','20230603144053HogRiderCard.webp'),(35,75,'tes beli banyak','Ovo',66000,'2023-06-03','20230603144202HogRiderCard.webp'),(36,75,'tes beli banyak','Ovo',66000,'2023-06-03','20230603144202HogRiderCard.webp'),(37,76,'DZAKI YUSUF IZZUDIN','Shopee Pay',20000,'2023-06-04','20230604084730cat-jump.gif'),(38,76,'DZAKI YUSUF IZZUDIN','Shopee Pay',20000,'2023-06-04','20230604084730cat-jump.gif'),(39,77,'jj','Gopay',26000,'2023-06-07','20230607113518e512e57146c3c0a2b45c731f89de7277.jpg'),(40,77,'jj','Gopay',26000,'2023-06-07','20230607113518e512e57146c3c0a2b45c731f89de7277.jpg'),(41,78,'tes','Gopay',22000,'2023-06-08','20230608000754Fx8s2hKaQAYBZAO.jpg'),(42,78,'tes','Gopay',22000,'2023-06-08','20230608000754Fx8s2hKaQAYBZAO.jpg'),(43,78,'tes','Gopay',22000,'2023-06-08','20230608000754Fx8s2hKaQAYBZAO.jpg'),(44,78,'tes','Gopay',22000,'2023-06-08','20230608000754Fx8s2hKaQAYBZAO.jpg');
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
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
