-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: 192.168.137.164    Database: supermarket
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryNO` char(20) NOT NULL,
  `CategoryName` char(20) DEFAULT NULL,
  `Descriptions` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CategoryNO`),
  UNIQUE KEY `index_category_unique` (`CategoryNO`,`CategoryName` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `GoodsNO` char(10) NOT NULL,
  `SupplierNO` char(10) DEFAULT NULL,
  `CtegoryNO` char(10) DEFAULT NULL,
  `GoodsNmae` varchar(20) DEFAULT NULL,
  `InPrice` decimal(10,1) DEFAULT NULL,
  `SalePrice` double DEFAULT NULL,
  `Number` int DEFAULT NULL,
  `ProductTime` date DEFAULT NULL,
  `QGperiod` int DEFAULT NULL,
  PRIMARY KEY (`GoodsNO`),
  KEY `fk1` (`SupplierNO`),
  KEY `fk_goods_2` (`CtegoryNO`),
  CONSTRAINT `fk_goods_1` FOREIGN KEY (`SupplierNO`) REFERENCES `supplier` (`SupplierNO`),
  CONSTRAINT `fk_goods_2` FOREIGN KEY (`CtegoryNO`) REFERENCES `category` (`CategoryNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salebill`
--

DROP TABLE IF EXISTS `salebill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salebill` (
  `GoodsNO` char(20) NOT NULL,
  `SNO` char(10) NOT NULL,
  `HappenTime` date DEFAULT NULL,
  `Number` int DEFAULT NULL,
  PRIMARY KEY (`GoodsNO`,`SNO`),
  KEY `fk3` (`SNO`),
  CONSTRAINT `fk2` FOREIGN KEY (`GoodsNO`) REFERENCES `goods` (`GoodsNO`),
  CONSTRAINT `fk3` FOREIGN KEY (`SNO`) REFERENCES `student` (`SNO`),
  CONSTRAINT `chk_quantity_range` CHECK (((`Number` > 0) and (`Number` < 100)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salebill`
--

LOCK TABLES `salebill` WRITE;
/*!40000 ALTER TABLE `salebill` DISABLE KEYS */;
/*!40000 ALTER TABLE `salebill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `SNO` varchar(20) NOT NULL,
  `WeiXin` varchar(20) DEFAULT NULL,
  `SName` varchar(10) DEFAULT NULL,
  `Gender` char(10) DEFAULT NULL,
  `College` char(10) DEFAULT NULL,
  `Major` char(10) DEFAULT NULL,
  PRIMARY KEY (`SNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SupplierNO` char(10) NOT NULL,
  `SupplierName` varchar(20) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Number` char(20) DEFAULT NULL,
  PRIMARY KEY (`SupplierNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-10 13:31:39
