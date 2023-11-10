-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: zags
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
-- Table structure for table `birth certificates`
--

DROP TABLE IF EXISTS `birth certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `birth certificates` (
  `BirthCertificateID` int NOT NULL AUTO_INCREMENT,
  `PersonID` int NOT NULL,
  `FatherID` int NOT NULL,
  `MotherID` int NOT NULL,
  `DateOfBirth` date NOT NULL,
  `PlaceOfBirth` varchar(45) NOT NULL,
  `Child'sFirstName` varchar(45) NOT NULL,
  `Child'sSurname` varchar(45) NOT NULL,
  `Child'sPatronymic` varchar(45) DEFAULT NULL,
  `GenderID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  PRIMARY KEY (`BirthCertificateID`),
  KEY `FK3_idx` (`GenderID`),
  KEY `abc_idx` (`PersonID`),
  KEY `abc_idx1` (`FatherID`),
  KEY `PeopleIDtoMotherID_idx` (`MotherID`),
  KEY `employeeIdtoEmployee_idx` (`EmployeeID`),
  CONSTRAINT `employeeIdtoEmployee` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `FK3` FOREIGN KEY (`GenderID`) REFERENCES `genders` (`GendersID`),
  CONSTRAINT `PeopleIDtoFatherID` FOREIGN KEY (`FatherID`) REFERENCES `people` (`PeopleID`),
  CONSTRAINT `PeopleIDtoMotherID` FOREIGN KEY (`MotherID`) REFERENCES `people` (`PeopleID`),
  CONSTRAINT `PeopleIDtoPersonID` FOREIGN KEY (`PersonID`) REFERENCES `people` (`PeopleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birth certificates`
--

LOCK TABLES `birth certificates` WRITE;
/*!40000 ALTER TABLE `birth certificates` DISABLE KEYS */;
INSERT INTO `birth certificates` VALUES (1,8,1,8,'2012-12-12','Россия, г. Уфа, Октябрьский пер., д. 19 кв.98','Дмитрий','Тулупов','Адамович',1,1),(2,2,2,9,'2013-01-01','Россия, г. Уфа, Октябрьский пер., д. 20 кв.99','Мария','Иванова','Ивановна',2,2);
/*!40000 ALTER TABLE `birth certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `death certificates`
--

DROP TABLE IF EXISTS `death certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `death certificates` (
  `DeathCertificateID` int NOT NULL AUTO_INCREMENT,
  `PersonID` int NOT NULL,
  `DateOfDeath` date NOT NULL,
  `PlaceOfDeath` varchar(255) NOT NULL,
  `CauseOfDeath` varchar(45) NOT NULL,
  `EmployeeID` int NOT NULL,
  PRIMARY KEY (`DeathCertificateID`),
  KEY `PeopleIdtoPerosnID_idx` (`PersonID`),
  KEY `EmployessIdtoEmployee_idx` (`EmployeeID`),
  CONSTRAINT `EmployessIdtoEmployee` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `PeopleIdtoPerosnID` FOREIGN KEY (`PersonID`) REFERENCES `people` (`PeopleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `death certificates`
--

LOCK TABLES `death certificates` WRITE;
/*!40000 ALTER TABLE `death certificates` DISABLE KEYS */;
INSERT INTO `death certificates` VALUES (1,4,'2023-10-29','Россия, г. Камышин, Октябрьская ул., д. 24 кв.37','Не установлена',3),(2,5,'2020-09-21','Россия, г. Ульяновск, Севернаяул., д. 9 кв.201','Не  установлена',3);
/*!40000 ALTER TABLE `death certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  `Patronymic` varchar(45) DEFAULT NULL,
  `GenderID` int NOT NULL,
  `DateOfBirth` date NOT NULL,
  `PositionID` int NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `FK2_idx` (`GenderID`),
  KEY `PostiontopositionID_idx` (`PositionID`),
  CONSTRAINT `FK2` FOREIGN KEY (`GenderID`) REFERENCES `genders` (`GendersID`),
  CONSTRAINT `PostiontopositionID` FOREIGN KEY (`PositionID`) REFERENCES `positions` (`PositionID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Милана','Михеева','Артёмовна',2,'1987-12-09',1),(2,'Виктория','Никольская','Михайловна',2,'1999-01-01',1),(3,'Яна','Богомолова','Денисовна',2,'2000-11-22',3),(4,'Варвара','Жукова','Мирославовна',2,'1961-11-11',5),(5,'Давид','Сергеев','Олегович',1,'2000-11-21',2),(6,'Татьяна','Туманова','Никитична',2,'2000-01-02',4),(7,'Михаил','Лазарев','Степанович',1,'1995-01-07',4),(8,'Арина','Потапова','Марковна',2,'1999-09-27',5);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genders` (
  `GendersID` int NOT NULL AUTO_INCREMENT,
  `GenderName` varchar(10) NOT NULL,
  PRIMARY KEY (`GendersID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genders`
--

LOCK TABLES `genders` WRITE;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;
INSERT INTO `genders` VALUES (1,'муж'),(2,'жен');
/*!40000 ALTER TABLE `genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marriage certificates`
--

DROP TABLE IF EXISTS `marriage certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marriage certificates` (
  `MarriageCertificateID` int NOT NULL AUTO_INCREMENT,
  `Person1ID` int NOT NULL,
  `Person2ID` int NOT NULL,
  `DateOfMarriage` date NOT NULL,
  `PlaceOfMarriage` varchar(255) NOT NULL,
  `EmployeeID` int NOT NULL,
  PRIMARY KEY (`MarriageCertificateID`),
  KEY `Person1IdtoPersonID_idx` (`Person1ID`),
  KEY `Person2IDToPersonID_idx` (`Person2ID`),
  KEY `EmployesIdtoEmployee_idx` (`EmployeeID`),
  CONSTRAINT `EmployesIdtoEmployee` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `Person1IdtoPersonID` FOREIGN KEY (`Person1ID`) REFERENCES `people` (`PeopleID`),
  CONSTRAINT `Person2IDToPersonID` FOREIGN KEY (`Person2ID`) REFERENCES `people` (`PeopleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marriage certificates`
--

LOCK TABLES `marriage certificates` WRITE;
/*!40000 ALTER TABLE `marriage certificates` DISABLE KEYS */;
INSERT INTO `marriage certificates` VALUES (1,1,8,'2023-10-30','Россия, г. Черкесск, Партизанская ул.',5),(2,2,9,'2023-08-10','Россия, г. Черкесск, Партизанская ул.',7);
/*!40000 ALTER TABLE `marriage certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `PeopleID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  `Patronymic` varchar(45) DEFAULT NULL,
  `GenderID` int NOT NULL,
  `DateOfBirth` varchar(45) NOT NULL,
  `PhoneNumber` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PeopleID`),
  KEY `FK1_idx` (`GenderID`),
  CONSTRAINT `FK1` FOREIGN KEY (`GenderID`) REFERENCES `genders` (`GendersID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Адам','Александров','Никитич',1,'1987-01-01','89991231231','vof_ifajubu48@yahoo.com'),(2,'Иван','Титов','Маркович',1,'1987-01-01','89991231222','hof_owipopo86@yahoo.com'),(3,'Тимофей','Наумов','Андреевич',1,'1998-11-01','89991231212','nudopa_yane23@hotmail.com'),(4,'Роберт','Богомолов','Павлович',1,'1987-12-01','89991224144','cawe-tomomu54@yahoo.com'),(5,'Михаил','Алешин','Глебович',1,'2000-12-12','89991232331','muy-onapici76@hotmail.com'),(6,'Валерий','Иванов','Юрьевич',1,'1987-01-02','89991323213','soca-ditezu7@hotmail.com'),(7,'Михаил','Фомин','Кириллович',1,'1987-01-03','89991242145','yot_ejipaca53@aol.com'),(8,'Таисия','Крылова','Тихонова',2,'2000-02-02','89932123323','rucuko_geyo25@outlook.com'),(9,'Кира','Рудакова','Дмитриевна',2,'2001-01-01','89111113321','sivis_areyi44@yahoo.com'),(10,'Висилиса','Яшина','Семёнова',2,'2003-12-12','89993321233','far_ehatado27@mail.com');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `PositionID` int NOT NULL AUTO_INCREMENT,
  `PositionName` varchar(45) NOT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Регистратор'),(2,'Начальник ЗАГСа'),(3,'Специалист по регистрации'),(4,'Архивариус'),(5,'Консультант'),(6,'Секретарь');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-01  3:48:24
