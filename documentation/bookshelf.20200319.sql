-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: localhost    Database: bookshelf
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` tinytext,
  `middlename` tinytext,
  `lastname` tinytext,
  `alias` tinytext,
  `born_date` date DEFAULT NULL,
  `died_date` date DEFAULT NULL,
  `nationality` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Halldór',NULL,'Gudjonsson','Halldór Kiljan Laxness','1902-04-23','1998-02-08','Icelandic'),(2,'Sven','Oskar','Lindquist',NULL,'1932-03-28','2019-05-14','Swedish'),(3,'Robert','K','Massie',NULL,'1929-01-05',NULL,'American'),(4,'Zygmunt',NULL,'Bauman',NULL,'1925-11-19','2017-01-09','Polish');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_authorid` int(11) DEFAULT NULL,
  `fk_bookshelfid` int(11) DEFAULT NULL,
  `isbn` varchar(45) DEFAULT NULL,
  `title` mediumtext NOT NULL,
  `language` varchar(45) DEFAULT NULL,
  `publisher` varchar(45) DEFAULT NULL,
  `published_year` varchar(4) DEFAULT NULL,
  `summary` mediumtext,
  `tags` json DEFAULT NULL,
  `read` enum('NOT READ','STARTED','READ') NOT NULL DEFAULT 'NOT READ',
  `onloan` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,1,1,'9129582423','Atomstationen','swedish','Rabén&Sjögren','1948','Med bokens titel vill Laxness karakterisera en tillvaro där människornas hela föreställningsvärld drabbats av en sorts atomsprängning',NULL,'NOT READ',1),(4,1,1,'91-29-57844-2','Världens ljus och himlens skönhet','swedish','Rabén & Sjögren','1986','\'om man vill komma sig upp, sade prästen, är det bäst att börja tidigt att samla på odugliga snören, ruttna träbitar, rostiga spkar ...\'',NULL,'NOT READ',0),(5,1,1,'978-91-7343-109-5','Fria män','swedish','Leopard','2011','I arton år har bonden Bjartur ...',NULL,'NOT READ',0),(6,1,1,NULL,'Íslandsklukkan','icelandic','Vaka-Helgafell','1987','----',NULL,'NOT READ',0),(7,1,1,NULL,'Sjálfsagdir hlutir','icelandic','Víkingaprent HF','1946','----',NULL,'NOT READ',0),(8,2,1,'91-7324-407-4','livstidsmänniskan','swedish','Ordfronts förlag','1992','\'Vad menar man med \'Att vara sig själv?\' i den här boken undersöker Sven Lindquist det talesättet och 37 andra ...',NULL,'NOT READ',0),(9,3,2,'91-34-50718-3','Peter den Store','swedish','Bonniers','1986','Om Peter den store, Tsar av Ryssland',NULL,'NOT READ',0),(10,4,3,'91-7173-006-0','Döden och odödligheten i det moderna samhället','swedish','Daidalos','1992','denna fasansfulla insikt får oss att oavbrutet att arbeta på vår odödlighet','[\"Judith Adler\", \"Jean Briggs\", \"Robert Paine\", \"Anthony Giddens\", \"Epikuros\", \"Schopenhauer\"]','NOT READ',0);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_book_update` BEFORE UPDATE ON `book` FOR EACH ROW BEGIN
    INSERT INTO book_audit
    SET action = 'update',
     book_id = OLD.id,
	 title = OLD.title,
        changedat = NOW(); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `book_audit`
--

DROP TABLE IF EXISTS `book_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `title` mediumtext,
  `changedat` date DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_audit`
--

LOCK TABLES `book_audit` WRITE;
/*!40000 ALTER TABLE `book_audit` DISABLE KEYS */;
INSERT INTO `book_audit` VALUES (1,1,'Atomstationen','2019-08-08','update'),(2,1,'Atomstationen','2019-08-08','update'),(3,1,'Atomstationen','2019-08-08','update'),(4,1,'Atomstationen','2019-08-08','update'),(5,1,'Atomstationen','2019-08-09','update'),(6,4,'Världens ljus och himlens skönhet','2019-08-09','update'),(7,8,'livstidsmänniskan','2019-08-09','update'),(8,1,'Atomstationen','2019-08-10','update'),(9,4,'Världens ljus och himlens skönhet','2019-08-10','update'),(10,5,'Fria män','2019-08-10','update'),(11,6,'Íslandsklukkan','2019-08-10','update'),(12,7,'Sjálfsagdir hlutir','2019-08-10','update'),(13,8,'livstidsmänniskan','2019-08-10','update');
/*!40000 ALTER TABLE `book_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookshelf`
--

DROP TABLE IF EXISTS `bookshelf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookshelf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_ownerid` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookshelf`
--

LOCK TABLES `bookshelf` WRITE;
/*!40000 ALTER TABLE `bookshelf` DISABLE KEYS */;
INSERT INTO `bookshelf` VALUES (1,'1','Skönlitteratur'),(2,'1','Självstudier ryska'),(3,'1','Sociologi');
/*!40000 ALTER TABLE `bookshelf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaner`
--

DROP TABLE IF EXISTS `loaner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `mail_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaner`
--

LOCK TABLES `loaner` WRITE;
/*!40000 ALTER TABLE `loaner` DISABLE KEYS */;
INSERT INTO `loaner` VALUES (1,'Mats','Holmlund',NULL,'0709998624',NULL);
/*!40000 ALTER TABLE `loaner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaner_x_book`
--

DROP TABLE IF EXISTS `loaner_x_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaner_x_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_loanerid` int(11) DEFAULT NULL,
  `fk_bookid` int(11) DEFAULT NULL,
  `loaned` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaner_x_book`
--

LOCK TABLES `loaner_x_book` WRITE;
/*!40000 ALTER TABLE `loaner_x_book` DISABLE KEYS */;
INSERT INTO `loaner_x_book` VALUES (3,1,1,'2019-08-08');
/*!40000 ALTER TABLE `loaner_x_book` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_loaned_insert` AFTER INSERT ON `loaner_x_book` FOR EACH ROW BEGIN
	UPDATE book 
       SET onloan = 1 
	where id=NEW.fk_bookid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `mail_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'Ingimar','Erlingsson','0706582414','inkimar@gmail.com');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-19 16:27:43
