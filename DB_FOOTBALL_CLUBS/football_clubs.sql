-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: football_clubs
-- ------------------------------------------------------
-- Server version	8.0.34
USE football_clubs;
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
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `ClubID` int NOT NULL AUTO_INCREMENT,
  `Club_name` varchar(50) NOT NULL,
  `Town` varchar(50) NOT NULL,
  `Year_of_foundation` int NOT NULL,
  `LeagueID` int NOT NULL,
  `StadiumID` int NOT NULL,
  `CoachID` int NOT NULL,
  PRIMARY KEY (`ClubID`),
  KEY `CoachID` (`CoachID`),
  KEY `clubs_ibfk_4_idx` (`LeagueID`),
  KEY `clubs_ibfk_5_idx` (`StadiumID`),
  CONSTRAINT `clubs_ibfk_3` FOREIGN KEY (`CoachID`) REFERENCES `coaches` (`CoachID`),
  CONSTRAINT `clubs_ibfk_4` FOREIGN KEY (`LeagueID`) REFERENCES `leagues` (`LeagueID`),
  CONSTRAINT `clubs_ibfk_5` FOREIGN KEY (`StadiumID`) REFERENCES `stadiums` (`StadiumID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'Зенит','Санкт-Петербург',1925,3,1,2),(2,'Барселона','Барселона',1899,2,2,1);
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `CoachID` int NOT NULL AUTO_INCREMENT,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Patronymic` varchar(50) DEFAULT NULL,
  `Birthdate` date NOT NULL,
  `ClubID` int DEFAULT NULL,
  PRIMARY KEY (`CoachID`),
  KEY `coaches_ibfk_1` (`ClubID`),
  CONSTRAINT `coaches_ibfk_1` FOREIGN KEY (`ClubID`) REFERENCES `clubs` (`ClubID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'Хави','Эрнандес','Креус','1980-01-25',1),(2,'Сергей','Семак','Богданович','1976-02-27',2);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leagues` (
  `LeagueID` int NOT NULL AUTO_INCREMENT,
  `League_name` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`LeagueID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES (1,'English Premier League','England'),(2,'La Liga','Spain'),(3,'Russian Premier League','Russia'),(4,'Bundesliga','Germany'),(5,'Serie A','Italy'),(6,'Ligue 1','France'),(7,'Eredivisie','Netherlands'),(8,'Primeira Liga','Portugal'),(9,'MLS','USA'),(10,'French Ligue 1','France'),(11,'J1 League','Japan');
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `PlayerID` int NOT NULL AUTO_INCREMENT,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) DEFAULT NULL,
  `Birthdaydate` date NOT NULL,
  `PositionID` int NOT NULL,
  `ClubID` int NOT NULL,
  `Number` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PlayerID`),
  KEY `PositionID` (`PositionID`),
  KEY `players_ibfk_2_idx` (`ClubID`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`PositionID`) REFERENCES `positions` (`PositionID`),
  CONSTRAINT `players_ibfk_2` FOREIGN KEY (`ClubID`) REFERENCES `clubs` (`ClubID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Михаил','Кержаков','1987-01-28',1,1,41),(2,'Александр','Васютин','1995-03-04',1,1,1),(3,'Денис','Адамов','1998-02-20',1,1,16),(4,'Роберт','Ренан','2003-10-11',2,1,77),(5,'Данил','Круговой','1998-05-28',3,1,4),(6,'Марио','Фернандес','1990-09-19',3,1,6),(7,'Дмитрий','Чистяков','1994-01-13',4,1,2),(8,'Вячеслав','Караваев','1995-05-20',4,1,15),(9,'Алип','Нуралы','1999-12-22',5,1,28),(10,'Дуглас','Сантос','1994-03-22',2,1,3),(11,'Родригао',NULL,'1995-09-11',5,1,55),(12,'Страхиня','Эракович','2001-01-22',4,1,25),(13,'Вильмар','Барриос','1993-10-16',17,1,5),(14,'Ду','Кейрос','2000-01-07',17,1,37),(15,'Дмитрий','Васильев','2004-06-16',17,1,79),(16,'Вендел','','1997-08-28',8,1,8),(17,'Клаудиньо',NULL,'1997-01-28',12,1,11),(18,'Александр','Коваленко','2003-08-08',9,1,18),(19,'Густаво','Мантуан','2001-06-20',18,1,31),(20,'Андрей','Мостовой','1997-11-05',18,1,17),(21,'Вильсон','Изидор','2000-08-27',20,1,10),(22,'Матео','Кассьерра','1997-04-13',20,1,30),(23,'Иван','Сергеев','1995-05-11',20,1,33),(24,'Алексей','Сутормин','1994-02-10',19,1,19),(25,'Марк-Андре','тер Штеген','1992-04-30',1,2,1),(26,'Инаки','Пена','1999-03-02',1,2,13),(27,'Жоан','Кансело','1994-05-27',3,2,2),(28,'Алехандро','Балде','2003-10-18',2,2,3),(29,'Роналд','Арауджо','1999-03-07',4,2,4),(30,'Иниго','Мартинез','1991-05-17',5,2,5),(31,'Андрес','Кристенсен','1996-04-10',4,2,15),(32,'Марко','Алонсо','1990-12-28',2,2,17),(33,'Юлес','Коунде','1998-11-12',5,2,23),(34,'Гави','','2004-08-05',15,2,6),(35,'Педри','','2002-11-25',16,2,8),(36,'Ориол','Ромеу','1991-09-24',17,2,18),(37,'Сержи','Роберто','1992-02-07',3,2,20),(38,'Френки','де Ёнг','1997-05-12',15,2,21),(39,'Илкау','Гундоган','1990-10-24',16,2,22),(40,'Ферран','Торес','2000-02-29',19,2,7),(41,'Роберт','Левандовски','1988-08-21',20,2,9),(42,'Рафина',NULL,'1996-12-14',19,2,11),(43,'Джо Феликс',NULL,'1999-11-10',18,2,14),(44,'Ламине','Ямал','2007-07-13',19,2,27);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `PositionID` int NOT NULL AUTO_INCREMENT,
  `Position_name` varchar(50) NOT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'GK'),(2,'LB'),(3,'RB'),(4,'RCB'),(5,'LCB'),(6,'LWB'),(7,'RWB'),(8,'LCM'),(9,'RCM'),(10,'RCAM'),(11,'LCAM'),(12,'CAM'),(13,'LM'),(14,'RM'),(15,'RCM'),(16,'LCM'),(17,'CDM'),(18,'LW'),(19,'RW'),(20,'ST'),(21,'LF'),(22,'RF'),(23,'CF');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadiums`
--

DROP TABLE IF EXISTS `stadiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadiums` (
  `StadiumID` int NOT NULL AUTO_INCREMENT,
  `Stadium_name` varchar(50) NOT NULL,
  `Capacity` varchar(50) NOT NULL,
  `Year_of_construction` int NOT NULL,
  `ClubID` int NOT NULL,
  PRIMARY KEY (`StadiumID`),
  KEY `ClubID` (`ClubID`),
  CONSTRAINT `stadiums_ibfk_1` FOREIGN KEY (`ClubID`) REFERENCES `clubs` (`ClubID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadiums`
--

LOCK TABLES `stadiums` WRITE;
/*!40000 ALTER TABLE `stadiums` DISABLE KEYS */;
INSERT INTO `stadiums` VALUES (1,'Газпром Арена','68000',2016,1),(2,'Олимпийский стадион имени Льюиса Компаниса','55926',1927,2);
/*!40000 ALTER TABLE `stadiums` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-22 19:02:40
