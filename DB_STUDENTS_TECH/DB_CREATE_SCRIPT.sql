-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: students
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
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `GradeID` int NOT NULL AUTO_INCREMENT,
  `StudentID` int NOT NULL,
  `SubjectID` int NOT NULL,
  `Grade` int NOT NULL,
  PRIMARY KEY (`GradeID`),
  KEY `StudentIDTostudents_idx` (`StudentID`),
  KEY `SubjectIDToSubjects_idx` (`SubjectID`),
  CONSTRAINT `StudentIDTostudents` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  CONSTRAINT `SubjectIDToSubjects` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,1,1,4),(2,1,2,4),(3,1,3,3),(4,3,1,5),(5,2,1,5),(6,1,4,3),(7,4,1,4),(8,5,1,5),(9,6,2,3),(10,10,3,2),(11,6,1,1);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `GroupID` int NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(45) NOT NULL,
  `TeacherID` int NOT NULL,
  PRIMARY KEY (`GroupID`),
  KEY `gTIDtoTID_idx` (`TeacherID`),
  CONSTRAINT `gTIDtoTID` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`TeacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'ПКС-4.1',2),(2,'ПКС-4.2',1),(3,'ПКС-4к',3),(4,'Р-2',4),(5,'ИСП-1.1',5);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Patronymic` varchar(45) DEFAULT NULL,
  `studentRecordBookNum` int NOT NULL,
  `DateOfBirth` date NOT NULL,
  `GroupID` int NOT NULL,
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `studentRecordBookNum_UNIQUE` (`studentRecordBookNum`),
  KEY `GroupsToGroupID_idx` (`GroupID`),
  CONSTRAINT `GroupsToGroupID` FOREIGN KEY (`GroupID`) REFERENCES `groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Виктор','Денисов','Юрьевич',100000000,'2004-10-10',2),(2,'Даниил','Агеев','Александрович',100000001,'2004-09-01',2),(3,'Илья','Гришаев','Эдуардович',100000002,'2004-05-10',2),(4,'Артём','Иванов','Сергеевич',100000003,'2005-02-23',2),(5,'Андрей','Маслюков','Сергеевич',100000004,'2004-02-02',2),(6,'Дмитрий','Тулупов','Алексеевич',100000005,'2004-12-22',2),(7,'Никита','Умеренков','Алексеевич',100000006,'2004-12-12',2),(8,'Размик','Микаэлян','Карапетович',100000007,'2007-12-12',4),(9,'Айрик','Геворкян','Размикович',100000008,'2007-12-09',4),(10,'Рафаэл','Марукян','Гарикович',100000009,'2007-09-09',4),(11,'Аветис','Авдалян','Агасович',100000010,'2009-11-22',5),(12,'Вазген','Акопян','Макарович',100000011,'2008-12-12',5);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `SubjectID` int NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(45) NOT NULL,
  `TeacherID` int NOT NULL,
  PRIMARY KEY (`SubjectID`),
  KEY `subjectsToTeacherID_idx` (`TeacherID`),
  CONSTRAINT `subjectsToTeacherID` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`TeacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'МДК 02.03В',2),(2,'ИБ',1),(3,'Астрономия',3),(4,'МДК 02.03',2),(5,'МДК 03.01',4),(6,'ОП',5),(7,'ППП',3),(8,'Информатика',1);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `TeacherID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Patronymic` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TeacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Сергей','Сергеевич','Сергеевич'),(2,'Арам','Айрапетян','Самвелович'),(3,'Талут','Беджанян','Нарекович'),(4,'Карапет','Ованесян','Геворкович'),(5,'Вайк','Сарибекян','Агасович');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-01  3:45:55
