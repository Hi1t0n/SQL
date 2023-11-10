-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: city_telephone_network_db
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calls` (
  `callId` int NOT NULL AUTO_INCREMENT,
  `dateTime` datetime NOT NULL,
  `duration_in_seconds` int NOT NULL,
  `senderId` int NOT NULL,
  `recipientId` int NOT NULL,
  PRIMARY KEY (`callId`),
  KEY `callstoUser_idx` (`senderId`,`recipientId`),
  KEY `FK2_idx` (`recipientId`),
  CONSTRAINT `FK1` FOREIGN KEY (`senderId`) REFERENCES `users` (`userID`),
  CONSTRAINT `FK2` FOREIGN KEY (`recipientId`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
INSERT INTO `calls` VALUES (1,'2022-01-01 12:30:45',1000,1,2),(2,'2022-02-02 11:31:05',300,2,5),(3,'2023-12-02 00:00:00',299,3,7),(4,'2023-11-02 00:00:00',500,1,7),(5,'2021-11-02 00:00:32',300,7,5);
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_numbers`
--

DROP TABLE IF EXISTS `phone_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_numbers` (
  `phoneNumberId` int NOT NULL AUTO_INCREMENT,
  `phoneNumber` varchar(45) NOT NULL,
  `userId` int NOT NULL,
  `tariffId` int NOT NULL,
  PRIMARY KEY (`phoneNumberId`),
  UNIQUE KEY `phoneNumber_UNIQUE` (`phoneNumber`),
  KEY `FK1_idx` (`userId`),
  KEY `FK3_idx` (`userId`),
  KEY `FK4_idx` (`tariffId`),
  CONSTRAINT `FK3` FOREIGN KEY (`userId`) REFERENCES `users` (`userID`),
  CONSTRAINT `FK4` FOREIGN KEY (`tariffId`) REFERENCES `tariffs` (`tariffId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_numbers`
--

LOCK TABLES `phone_numbers` WRITE;
/*!40000 ALTER TABLE `phone_numbers` DISABLE KEYS */;
INSERT INTO `phone_numbers` VALUES (1,'88005553535',1,1),(2,'88005553536',2,2),(3,'88005553537',3,3),(4,'88005553538',4,4),(5,'88005553539',5,4),(6,'88005553540',6,2),(7,'88005553541',7,1);
/*!40000 ALTER TABLE `phone_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber_line`
--

DROP TABLE IF EXISTS `subscriber_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriber_line` (
  `lineId` int NOT NULL AUTO_INCREMENT,
  `lineNumber` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`lineId`),
  KEY `FK5_idx` (`userId`),
  CONSTRAINT `FK5` FOREIGN KEY (`userId`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber_line`
--

LOCK TABLES `subscriber_line` WRITE;
/*!40000 ALTER TABLE `subscriber_line` DISABLE KEYS */;
INSERT INTO `subscriber_line` VALUES (1,10,1),(2,11,2),(3,12,3),(4,13,4),(5,14,5),(6,15,6),(7,16,7);
/*!40000 ALTER TABLE `subscriber_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tariffs`
--

DROP TABLE IF EXISTS `tariffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tariffs` (
  `tariffId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`tariffId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariffs`
--

LOCK TABLES `tariffs` WRITE;
/*!40000 ALTER TABLE `tariffs` DISABLE KEYS */;
INSERT INTO `tariffs` VALUES (1,'Проще',430,'Базовый тариф с самым необходимым'),(2,'Больше',600,'Оптимальный тариф с настройкой минут и SMS'),(3,'Супер',770,'Общайтесь свободно, не считая минуты и ГБ'),(4,'ULTRA',1800,'Свободв общения без ограничений');
/*!40000 ALTER TABLE `tariffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `registration_data` varchar(45) NOT NULL,
  `phoneNumberId` int NOT NULL,
  `subscriberLineId` int NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `FK6_idx` (`phoneNumberId`),
  KEY `FK7_idx` (`subscriberLineId`),
  CONSTRAINT `FK6` FOREIGN KEY (`phoneNumberId`) REFERENCES `phone_numbers` (`phoneNumberId`),
  CONSTRAINT `FK7` FOREIGN KEY (`subscriberLineId`) REFERENCES `subscriber_line` (`lineId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Иван','Иванов','Новый Арбат ул., 3, Москва, 198761','craucrallillave-3521@yopmail.com','2023-10-29',1,1),(2,'Андрей','Маслюков','Овчинниковская наб., 68 стр1, Москва, 141069','zommeuttuwoucrau-3596@yopmail.com','2022-10-21',2,2),(3,'Илья','Гришаев','Чистый пер., 86, Москва, 142617','bubraugrimmaugru-8250@yopmail.com','2023-12-21',3,3),(4,'Армен','Гарибян','Новый Арбат ул., 40, Москва, 158590','refeizotorau-5070@yopmail.com','2020-11-11',4,4),(5,'Аргам','Погосян','Овчинниковская наб., 25 стр1, Москва, 165747','bottadoijotre-7599@yopmail.com','2011-11-11',5,5),(6,'Мурад','Исаян','Монетчиковский пер., 9, Москва, 141735','fazedoifrauna-9919@yopmail.com','2022-12-31',6,6),(7,'Агас','Маргарян','Малая Бронная ул., 20, Москва, 17092','leujepruyeju-6148@yopmail.com','2009-01-01',7,7);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-29 19:11:59
