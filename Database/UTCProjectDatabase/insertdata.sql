CREATE DATABASE  IF NOT EXISTS `utcdemo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `utcdemo`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: utcdemo
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addId` int NOT NULL AUTO_INCREMENT,
  `addCountry` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `addCity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`addId`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1001,'Sapa','Lào Cai'),(1002,'Y tý ','Lào Cai'),(1003,'Phố cổ Đồng Văn','Hà Giang'),(1004,'Thị TRấn Mèo Vạc','Hà Giang'),(1005,'Thác Dải Yếm','Mộc Châu'),(1006,'Hạ Long','Quảng Ninh'),(1007,'Bán Đảo Sơn Trà','Đà Nẵng'),(1008,'Bãi biển Mỹ Khê','Đà Nẵng');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `bId` int NOT NULL AUTO_INCREMENT,
  `bDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bDurationOfStay` int DEFAULT NULL,
  `bCheckInDate` datetime NOT NULL,
  `bCheckOutDate` datetime NOT NULL,
  `bTypePayment` enum('BAKING','DIRECT') NOT NULL DEFAULT 'DIRECT',
  `bTotalRoom` tinyint NOT NULL DEFAULT '1',
  `b_hId` int NOT NULL,
  `b_gId` int NOT NULL,
  `bTotalAmount` decimal(10,2) DEFAULT NULL,
  `bStatus` enum('UNPAID','PAID') NOT NULL DEFAULT 'UNPAID',
  PRIMARY KEY (`bId`),
  KEY `b_hId` (`b_hId`),
  KEY `b_gId` (`b_gId`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`b_hId`) REFERENCES `hotel` (`hId`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`b_gId`) REFERENCES `guests` (`gId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2021-04-12 00:00:00',3,'2021-04-12 00:00:00','2021-04-15 00:00:00','BAKING',2,1,2,7200000.00,'PAID'),(2,'2022-04-24 00:00:00',2,'2022-04-24 00:00:00','2022-04-26 00:00:00','DIRECT',3,2,2,6340000.00,'UNPAID');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guests` (
  `gId` int NOT NULL AUTO_INCREMENT,
  `gFirstName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gLastName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gIdCard` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gCreditCard` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gEmail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `g_utId` int NOT NULL,
  `g_addId` int DEFAULT NULL,
  PRIMARY KEY (`gId`),
  UNIQUE KEY `gIdCard` (`gIdCard`),
  UNIQUE KEY `gCreditCard` (`gCreditCard`),
  UNIQUE KEY `gEmail` (`gEmail`),
  KEY `g_utId` (`g_utId`),
  KEY `g_addId` (`g_addId`),
  CONSTRAINT `guests_ibfk_1` FOREIGN KEY (`g_utId`) REFERENCES `usertype` (`utId`),
  CONSTRAINT `guests_ibfk_2` FOREIGN KEY (`g_addId`) REFERENCES `address` (`addId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (1,'Hoàng','Việt','000012','0321654','hoangviet@gmail.com',2,1001),(2,'Thanh','Ngân','02335','35353','thanhngan@gmail.com',1,1006);
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `hId` int NOT NULL AUTO_INCREMENT,
  `hName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hEmailAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hWebsite` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hDescription` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hRoomCount` int NOT NULL,
  `h_addId` int DEFAULT NULL,
  PRIMARY KEY (`hId`),
  UNIQUE KEY `hName` (`hName`),
  UNIQUE KEY `hEmailAddress` (`hEmailAddress`),
  UNIQUE KEY `hWebsite` (`hWebsite`),
  KEY `h_addId` (`h_addId`),
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`h_addId`) REFERENCES `address` (`addId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'LuxuryHotel','hotel@gmail.com','lxury.vn','Luxury là một trong những khách sạn ...',12,1001),(2,'Hoàng Kiều Homestay','hoangkieu@gmail.com','hoangkieu.com','Hoàng kiều là một trong những homestay ...',16,1003),(3,'Hải Đăng','haidang@gmail.com','haidang.vn','Có vị trí đắc địa nhìn ra biển Hạ Long ...',24,1006);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelimage`
--

DROP TABLE IF EXISTS `hotelimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelimage` (
  `hiImageName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hi_hId` int NOT NULL,
  PRIMARY KEY (`hiImageName`),
  KEY `hi_hId` (`hi_hId`),
  CONSTRAINT `hotelimage_ibfk_1` FOREIGN KEY (`hi_hId`) REFERENCES `hotel` (`hId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelimage`
--

LOCK TABLES `hotelimage` WRITE;
/*!40000 ALTER TABLE `hotelimage` DISABLE KEYS */;
INSERT INTO `hotelimage` VALUES ('1',1),('3',1),('2',2),('4',3);
/*!40000 ALTER TABLE `hotelimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelservices`
--

DROP TABLE IF EXISTS `hotelservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelservices` (
  `hsId` int NOT NULL AUTO_INCREMENT,
  `hsName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hsCost` decimal(10,2) NOT NULL,
  `hs_hId` int NOT NULL,
  PRIMARY KEY (`hsId`),
  KEY `hs_hId` (`hs_hId`),
  CONSTRAINT `hotelservices_ibfk_1` FOREIGN KEY (`hs_hId`) REFERENCES `hotel` (`hId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelservices`
--

LOCK TABLES `hotelservices` WRITE;
/*!40000 ALTER TABLE `hotelservices` DISABLE KEYS */;
INSERT INTO `hotelservices` VALUES (1,'hoàng phong',230000.00,1),(2,'Hải Đăng',342700.00,2),(3,'Hoàng Kiều',320000.00,3);
/*!40000 ALTER TABLE `hotelservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `rId` int NOT NULL AUTO_INCREMENT,
  `rNumber` int NOT NULL,
  `rStatus` enum('DRUM','BOOKING') NOT NULL DEFAULT 'DRUM',
  `r_rtId` int DEFAULT NULL,
  `r_hId` int DEFAULT NULL,
  PRIMARY KEY (`rId`),
  KEY `r_rtId` (`r_rtId`),
  KEY `r_hId` (`r_hId`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`r_rtId`) REFERENCES `roomtype` (`rtId`) ON DELETE SET NULL,
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`r_hId`) REFERENCES `hotel` (`hId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,2,'BOOKING',1,1),(2,3,'DRUM',2,2);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roombook`
--

DROP TABLE IF EXISTS `roombook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roombook` (
  `rbId` int NOT NULL AUTO_INCREMENT,
  `rb_rId` int NOT NULL,
  `rb_bId` int NOT NULL,
  PRIMARY KEY (`rbId`),
  KEY `rb_rId` (`rb_rId`),
  KEY `rb_bId` (`rb_bId`),
  CONSTRAINT `roombook_ibfk_1` FOREIGN KEY (`rb_rId`) REFERENCES `room` (`rId`) ON DELETE CASCADE,
  CONSTRAINT `roombook_ibfk_2` FOREIGN KEY (`rb_bId`) REFERENCES `booking` (`bId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roombook`
--

LOCK TABLES `roombook` WRITE;
/*!40000 ALTER TABLE `roombook` DISABLE KEYS */;
INSERT INTO `roombook` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `roombook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomratediscount`
--

DROP TABLE IF EXISTS `roomratediscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomratediscount` (
  `rrdId` int NOT NULL AUTO_INCREMENT,
  `rrdRate` decimal(10,2) NOT NULL,
  `rrdStartMonth` datetime NOT NULL,
  `rrdEndMonth` datetime NOT NULL,
  `rrd_rtId` int DEFAULT NULL,
  PRIMARY KEY (`rrdId`),
  KEY `rrd_rtId` (`rrd_rtId`),
  CONSTRAINT `roomratediscount_ibfk_1` FOREIGN KEY (`rrd_rtId`) REFERENCES `roomtype` (`rtId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomratediscount`
--

LOCK TABLES `roomratediscount` WRITE;
/*!40000 ALTER TABLE `roomratediscount` DISABLE KEYS */;
INSERT INTO `roomratediscount` VALUES (1,4.00,'2020-04-02 00:00:00','2025-04-02 00:00:00',1),(2,5.00,'2021-02-02 00:00:00','2026-02-02 00:00:00',2);
/*!40000 ALTER TABLE `roomratediscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtype`
--

DROP TABLE IF EXISTS `roomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomtype` (
  `rtId` int NOT NULL AUTO_INCREMENT,
  `rtName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rtCost` decimal(10,2) NOT NULL,
  `rtDescription` enum('TRAVEL','GO ON BUSSINESS','RESORT') NOT NULL DEFAULT 'TRAVEL',
  PRIMARY KEY (`rtId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtype`
--

LOCK TABLES `roomtype` WRITE;
/*!40000 ALTER TABLE `roomtype` DISABLE KEYS */;
INSERT INTO `roomtype` VALUES (1,'luxury',5300000.00,'TRAVEL'),(2,'phòng thường',260000.00,'RESORT');
/*!40000 ALTER TABLE `roomtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `starrate`
--

DROP TABLE IF EXISTS `starrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `starrate` (
  `srId` int NOT NULL AUTO_INCREMENT,
  `srImage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sr_hId` int NOT NULL,
  PRIMARY KEY (`srId`),
  KEY `sr_hId` (`sr_hId`),
  CONSTRAINT `starrate_ibfk_1` FOREIGN KEY (`sr_hId`) REFERENCES `hotel` (`hId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `starrate`
--

LOCK TABLES `starrate` WRITE;
/*!40000 ALTER TABLE `starrate` DISABLE KEYS */;
INSERT INTO `starrate` VALUES (1,'image',1),(2,'image',1),(3,'image',2),(4,'img',3);
/*!40000 ALTER TABLE `starrate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userservices`
--

DROP TABLE IF EXISTS `userservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userservices` (
  `us_hsId` int NOT NULL,
  `us_bId` int NOT NULL,
  PRIMARY KEY (`us_hsId`,`us_bId`),
  KEY `us_bId` (`us_bId`),
  CONSTRAINT `userservices_ibfk_1` FOREIGN KEY (`us_bId`) REFERENCES `booking` (`bId`) ON DELETE CASCADE,
  CONSTRAINT `userservices_ibfk_2` FOREIGN KEY (`us_hsId`) REFERENCES `hotelservices` (`hsId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userservices`
--

LOCK TABLES `userservices` WRITE;
/*!40000 ALTER TABLE `userservices` DISABLE KEYS */;
INSERT INTO `userservices` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `userservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertype` (
  `utId` int NOT NULL AUTO_INCREMENT,
  `utName` enum('GUESTS','ADMIN') NOT NULL DEFAULT 'GUESTS',
  PRIMARY KEY (`utId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (1,'ADMIN'),(2,'GUESTS');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26 22:12:52
