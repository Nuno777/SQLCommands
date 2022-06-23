CREATE DATABASE  IF NOT EXISTS `parque` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `parque`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: parque
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro` (
  `matricula` varchar(45) NOT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `nif` int DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `nif` (`nif`),
  CONSTRAINT `nif` FOREIGN KEY (`nif`) REFERENCES `cliente` (`nif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES ('11-45-MA','Ford',1233),('12-TC-16','Lancia',1234),('13-73-BS','Toyota',1236),('27-FM-62','Volkswagen',1239),('34-JS-65','Mercedes',1231),('43-MT-12','Fiat',1232),('54-MT-97','Fiat',1232),('58-TC-85','Peugeot',1234),('84-RM-65','Citroen',1238),('BS-87-16','Nissan',1236),('CP-53-73','Ferrari',1237),('JS-12-34','Honda',1231),('MA-83-28','Ford',1233),('MP-11-11','Lancia',1235),('MT-43-32','Volvo',1232),('TC-59-99','Peugeot',1234);
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `nif` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1231,'João Silva'),(1232,'Miguel Tavares'),(1233,'Maria Abrantes'),(1234,'Teresa Carvalho'),(1235,'Manuel Pereira'),(1236,'Bernardo Sousa'),(1237,'Carlos Pinto'),(1238,'Raquel Martins'),(1239,'Filipe Monteiro');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacionamento`
--

DROP TABLE IF EXISTS `estacionamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacionamento` (
  `ref` int NOT NULL,
  `data` date DEFAULT NULL,
  `horae` time DEFAULT NULL,
  `horas` time DEFAULT NULL,
  `numero` int NOT NULL,
  `matricula` varchar(45) NOT NULL,
  PRIMARY KEY (`ref`),
  KEY `numero` (`numero`),
  KEY `matricula` (`matricula`),
  CONSTRAINT `estacionamento_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `lugar` (`numero`),
  CONSTRAINT `estacionamento_ibfk_2` FOREIGN KEY (`matricula`) REFERENCES `carro` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacionamento`
--

LOCK TABLES `estacionamento` WRITE;
/*!40000 ALTER TABLE `estacionamento` DISABLE KEYS */;
INSERT INTO `estacionamento` VALUES (1,'2010-01-01','10:00:00','12:41:00',1,'27-FM-62'),(2,'2010-01-01','15:34:00','18:45:00',2,'27-FM-62'),(3,'2010-01-01','10:19:00','22:42:00',3,'JS-12-34'),(4,'2010-01-01','11:37:00','18:15:00',4,'CP-53-73'),(5,'2010-01-01','07:32:00','09:41:00',5,'TC-59-99'),(6,'2010-01-02','10:45:00','15:43:00',1,'84-RM-65'),(7,'2010-01-02','10:14:00','12:36:00',2,'BS-87-16'),(8,'2010-01-02','09:49:00','12:58:00',3,'12-TC-16'),(9,'2010-01-02','11:51:00','14:34:00',4,'58-TC-85'),(10,'2010-01-02','10:33:00','12:35:00',5,'MA-83-28'),(11,'2010-01-02','11:14:00','16:34:00',8,'MT-43-32'),(12,'2010-01-02','17:44:00','18:54:00',12,'43-MT-12'),(13,'2010-01-02','10:22:00','14:43:00',13,'54-MT-97'),(14,'2010-01-03','09:01:00','14:37:00',1,'27-FM-62'),(15,'2010-01-03','13:45:00','21:11:00',2,'84-RM-65'),(16,'2010-01-03','08:23:00','15:55:00',6,'CP-53-73'),(17,'2010-01-03','11:53:00','14:11:00',7,'MP-11-11'),(18,'2010-01-03','06:46:00','08:26:00',8,'12-TC-16'),(19,'2010-01-03','09:39:00','17:15:00',10,'MA-83-28'),(20,'2010-01-03','07:25:00','08:12:00',11,'43-MT-12'),(21,'2010-01-03','09:16:00','11:21:00',12,'43-MT-12'),(22,'2010-01-03','11:21:00','13:42:00',13,'34-JS-65'),(23,'2010-01-03','14:47:00','18:12:00',14,'34-JS-65');
/*!40000 ALTER TABLE `estacionamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugar`
--

DROP TABLE IF EXISTS `lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugar` (
  `numero` int NOT NULL,
  `andar` int DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugar`
--

LOCK TABLES `lugar` WRITE;
/*!40000 ALTER TABLE `lugar` DISABLE KEYS */;
INSERT INTO `lugar` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,2),(8,2),(9,2),(10,2),(11,2),(12,3),(13,3),(14,3),(15,4),(16,4);
/*!40000 ALTER TABLE `lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'parque'
--

--
-- Dumping routines for database 'parque'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-29 22:45:07
