CREATE DATABASE  IF NOT EXISTS `bdavioes` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdavioes`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdavioes
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
-- Table structure for table `aeroportos`
--

DROP TABLE IF EXISTS `aeroportos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeroportos` (
  `codaerop` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `localidade` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codaerop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeroportos`
--

LOCK TABLES `aeroportos` WRITE;
/*!40000 ALTER TABLE `aeroportos` DISABLE KEYS */;
INSERT INTO `aeroportos` VALUES (1,'Sa Carneiro','Porto','Portugal'),(2,'Madeira','Funchal','Portugal'),(3,'Portela','Lisboa','Portugal'),(4,'Ponta Delgada','S. Miguel','Portugal'),(5,'Faro','Faro','Portugal'),(8,'Charles de Gaule','Paris','Franca'),(9,'Orly','Paris','Franca'),(11,'Heathrow','Londres','Reino Unido'),(12,'Gatwick','Londres','Reino Unido');
/*!40000 ALTER TABLE `aeroportos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avioes`
--

DROP TABLE IF EXISTS `avioes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avioes` (
  `codaviao` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `codmodelo` int DEFAULT NULL,
  PRIMARY KEY (`codaviao`),
  KEY `codmodelo_idx` (`codmodelo`),
  CONSTRAINT `codmodelo` FOREIGN KEY (`codmodelo`) REFERENCES `modelos` (`codmodelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avioes`
--

LOCK TABLES `avioes` WRITE;
/*!40000 ALTER TABLE `avioes` DISABLE KEYS */;
INSERT INTO `avioes` VALUES (1,'Scott Adams',1),(2,'Milo Manara',1),(3,'Serpieri',5),(4,'Henki Bilal',3),(5,'Gary Larson',4),(6,'Bill Waterson',4),(7,'J R R Tolkien',3),(8,'Franquin',3),(9,'Douglas Adams',1);
/*!40000 ALTER TABLE `avioes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelos`
--

DROP TABLE IF EXISTS `modelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelos` (
  `codmodelo` int NOT NULL,
  `construtor` varchar(45) DEFAULT NULL,
  `versao` varchar(45) DEFAULT NULL,
  `nummotores` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codmodelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelos`
--

LOCK TABLES `modelos` WRITE;
/*!40000 ALTER TABLE `modelos` DISABLE KEYS */;
INSERT INTO `modelos` VALUES (1,'Douglas','DC-10','3'),(2,'Boing','737','2'),(3,'Boing','747','4'),(4,'Airbus','A300','2'),(5,'Airbus','A340','4');
/*!40000 ALTER TABLE `modelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voos`
--

DROP TABLE IF EXISTS `voos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voos` (
  `codvoo` int NOT NULL,
  `decodaerop` int DEFAULT NULL,
  `paracodaerop` int DEFAULT NULL,
  `transportadora` varchar(45) DEFAULT NULL,
  `duracao` int DEFAULT NULL,
  `codaviao` int DEFAULT NULL,
  PRIMARY KEY (`codvoo`),
  KEY `decodaerop_idx` (`decodaerop`),
  KEY `paracodaerop_idx` (`paracodaerop`),
  KEY `codaviao_idx` (`codaviao`),
  CONSTRAINT `codaviao` FOREIGN KEY (`codaviao`) REFERENCES `avioes` (`codaviao`),
  CONSTRAINT `decodaerop` FOREIGN KEY (`decodaerop`) REFERENCES `aeroportos` (`codaerop`),
  CONSTRAINT `paracodaerop` FOREIGN KEY (`paracodaerop`) REFERENCES `aeroportos` (`codaerop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voos`
--

LOCK TABLES `voos` WRITE;
/*!40000 ALTER TABLE `voos` DISABLE KEYS */;
INSERT INTO `voos` VALUES (1001,1,2,'TAP',2,1),(1002,2,3,'TAP',1,2),(1003,2,12,'BA',2,5),(1004,4,3,'SATA',3,6),(1005,9,2,'AirFrance',2,3),(1006,8,11,'BA',1,5),(1007,5,1,'TAP',1,5),(1008,3,12,'Portugalia',3,4),(1009,1,3,'Portugalia',1,2),(1010,12,4,'BA',3,3),(1111,1,3,'TAP',2,3);
/*!40000 ALTER TABLE `voos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bdavioes'
--

--
-- Dumping routines for database 'bdavioes'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-27 11:27:11
