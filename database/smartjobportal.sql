-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: smartjobportal
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

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
-- Table structure for table `adminregister`
--

DROP TABLE IF EXISTS `adminregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminregister` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `password` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminregister`
--

LOCK TABLES `adminregister` WRITE;
/*!40000 ALTER TABLE `adminregister` DISABLE KEYS */;
INSERT INTO `adminregister` VALUES (1,'Hujaifa Majeed','9554028071','hujaifamajeed786@gmail.com','Male','Huzaif@03','2026-07-09 09:20:43'),(2,'Ali Zama','9554028072','hujaifa@student.iul.ac.in','Male','Huzaif@03','2026-07-23 13:30:59');
/*!40000 ALTER TABLE `adminregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eaddress`
--

DROP TABLE IF EXISTS `eaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eaddress` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `country` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eaddress`
--

LOCK TABLES `eaddress` WRITE;
/*!40000 ALTER TABLE `eaddress` DISABLE KEYS */;
INSERT INTO `eaddress` VALUES (1,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-25 09:15:34'),(2,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-25 09:17:49'),(3,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-25 09:24:04'),(4,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-25 09:24:49'),(5,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-25 09:25:16'),(6,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-25 09:26:24'),(7,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-25 09:27:40'),(8,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-25 09:29:11'),(9,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-25 09:30:13'),(10,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-25 09:31:49'),(11,'238/6, privillege estste colony , chengicherla , medipally','Hyd','Telangana','500094','IN','2026-07-03 13:21:43');
/*!40000 ALTER TABLE `eaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eregister`
--

DROP TABLE IF EXISTS `eregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eregister` (
  `e_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `date_of_birth` date NOT NULL,
  `password` varchar(30) NOT NULL,
  `address_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idcard_front_path` varchar(500) DEFAULT NULL,
  `idcard_back_path` varchar(500) DEFAULT NULL,
  `status` enum('Not Banned','Banned') DEFAULT 'Not Banned',
  PRIMARY KEY (`e_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_eaddress` (`address_id`),
  CONSTRAINT `fk_eaddress` FOREIGN KEY (`address_id`) REFERENCES `eaddress` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eregister`
--

LOCK TABLES `eregister` WRITE;
/*!40000 ALTER TABLE `eregister` DISABLE KEYS */;
INSERT INTO `eregister` VALUES (1,'Hujaifa Majeed','9554028071','hujaifa@student.iul.ac.in','Male','2026-06-03','1234567',10,'2026-06-25 09:31:49',NULL,NULL,'Banned'),(2,'SRK','9554028072','srk@gmail.com','Male','1983-05-05','1234567',11,'2026-07-03 13:21:43','/home/huzaif/uploads/idcards/idfront_srk@gmail.com_1783084903787.jpeg','/home/huzaif/uploads/idcards/idback_srk@gmail.com_1783084903792.jpeg','Banned');
/*!40000 ALTER TABLE `eregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hirerequests`
--

DROP TABLE IF EXISTS `hirerequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hirerequests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `e_id` int NOT NULL,
  `w_id` int NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  `hirestatus` enum('Pending','Accepted','Rejected','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cancelreason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `fk_hire_employer` (`e_id`),
  KEY `fk_hire_worker` (`w_id`),
  CONSTRAINT `fk_hire_employer` FOREIGN KEY (`e_id`) REFERENCES `eregister` (`e_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hire_worker` FOREIGN KEY (`w_id`) REFERENCES `wregister` (`w_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hirerequests`
--

LOCK TABLES `hirerequests` WRITE;
/*!40000 ALTER TABLE `hirerequests` DISABLE KEYS */;
INSERT INTO `hirerequests` VALUES (3,1,2,'Plumber',NULL,'Rejected','2026-07-01 13:05:08',NULL),(4,1,2,'Plumber',NULL,'Pending','2026-07-02 10:51:35',NULL),(5,1,1,'Plumber',NULL,'Rejected','2026-07-02 10:57:28',NULL),(6,1,1,'Plumber',NULL,'Rejected','2026-07-02 11:01:36',NULL),(7,1,1,'Plumber',NULL,'Completed','2026-07-02 11:07:34',NULL),(8,1,2,'Plumber',NULL,'Pending','2026-07-02 11:07:38',NULL),(9,1,2,'Plumber',NULL,'Pending','2026-07-02 11:46:10',NULL),(10,1,2,'Plumber',NULL,'Pending','2026-07-02 11:46:14',NULL),(11,1,1,'Plumber',NULL,'Rejected','2026-07-02 13:10:19',NULL),(12,1,1,'Plumber',NULL,'Completed','2026-07-02 13:13:18',NULL),(13,1,1,'Plumber',NULL,'Pending','2026-07-02 13:13:51',NULL),(14,1,1,'Plumber',NULL,'Pending','2026-07-02 13:17:07',NULL),(15,1,1,'Plumber',NULL,'Pending','2026-07-02 13:17:57',NULL),(16,1,1,'Plumber',NULL,'Pending','2026-07-02 13:19:07',NULL),(17,1,1,'Plumber',NULL,'Pending','2026-07-02 13:20:51',NULL),(18,1,1,'Plumber',NULL,'Accepted','2026-07-02 13:23:50',NULL),(19,1,1,'Plumber',NULL,'Accepted','2026-07-02 13:25:46',NULL),(20,1,1,'Plumber',NULL,'Accepted','2026-07-03 09:10:24',NULL),(21,1,1,'Plumber',NULL,'Rejected','2026-07-03 09:18:33',NULL),(22,1,1,'Plumber',NULL,'Accepted','2026-07-03 09:20:30',NULL),(23,1,1,'Plumber',NULL,'Rejected','2026-07-03 09:22:42',NULL),(24,1,1,'Plumber',NULL,'Cancelled','2026-07-03 09:25:11','Hired someone else'),(25,1,1,'Plumber',NULL,'Rejected','2026-07-03 09:45:55',NULL),(26,1,1,'Plumber',NULL,'Rejected','2026-07-03 09:46:32',NULL),(27,1,1,'Plumber',NULL,'Rejected','2026-07-03 09:53:53',NULL),(28,1,1,'Plumber',NULL,'Rejected','2026-07-03 09:55:15',NULL),(29,1,1,'Plumber',NULL,'Rejected','2026-07-03 09:56:25',NULL),(30,1,1,'Plumber',NULL,'Completed','2026-07-03 09:58:19',NULL),(31,1,1,'Plumber',NULL,'Completed','2026-07-03 10:11:45',NULL),(32,1,1,'Plumber',NULL,'Rejected','2026-07-03 10:11:49',NULL),(33,1,1,'Plumber',NULL,'Rejected','2026-07-03 10:12:04',NULL),(34,1,4,'Plumber',NULL,'Pending','2026-07-03 10:36:02',NULL),(35,1,2,'Plumber',NULL,'Pending','2026-07-03 10:36:57',NULL),(36,1,4,'Plumber',NULL,'Pending','2026-07-03 10:38:22',NULL),(37,1,4,'Plumber',NULL,'Pending','2026-07-03 10:42:11',NULL),(38,1,4,'Plumber',NULL,'Pending','2026-07-03 10:42:16',NULL),(39,1,4,'Plumber',NULL,'Pending','2026-07-03 10:47:28',NULL),(40,1,4,'Plumber',NULL,'Pending','2026-07-03 10:47:57',NULL),(41,1,4,'Plumber',NULL,'Pending','2026-07-03 10:48:04',NULL),(42,1,1,'Plumber',NULL,'Rejected','2026-07-03 10:48:08',NULL),(43,1,2,'Plumber',NULL,'Pending','2026-07-03 10:48:10',NULL),(44,1,4,'Plumber',NULL,'Pending','2026-07-03 10:48:13',NULL),(45,1,2,'Plumber',NULL,'Pending','2026-07-03 10:48:47',NULL),(46,1,1,'Plumber',NULL,'Completed','2026-07-03 10:49:31',NULL),(47,1,1,'Plumber',NULL,'Completed','2026-07-03 10:49:48',NULL),(48,1,2,'Plumber',NULL,'Pending','2026-07-03 10:49:50',NULL),(49,1,2,'Plumber',NULL,'Pending','2026-07-03 10:50:06',NULL),(50,1,1,'Plumber',NULL,'Completed','2026-07-03 10:50:09',NULL),(51,1,1,'Plumber',NULL,'Rejected','2026-07-03 10:51:38',NULL),(52,2,6,'Painter',NULL,'Pending','2026-07-03 13:22:04',NULL),(53,1,9,'Plumber',NULL,'Cancelled','2026-07-16 11:46:26','Cancelled while pending'),(54,2,6,'Painter',NULL,'Pending','2026-07-16 11:48:40',NULL),(55,2,6,'Painter',NULL,'Pending','2026-07-16 11:48:45',NULL),(56,2,6,'Painter',NULL,'Pending','2026-07-16 11:53:25',NULL),(57,2,6,'Painter',NULL,'Pending','2026-07-16 11:54:06',NULL),(58,2,6,'Painter',NULL,'Pending','2026-07-16 12:00:22',NULL),(59,2,6,'Painter',NULL,'Pending','2026-07-16 12:02:14',NULL),(60,1,1,'Plumber',NULL,'Completed','2026-07-18 11:44:35',NULL),(61,1,9,'Plumber',NULL,'Cancelled','2026-07-20 12:04:16','Cancelled while pending'),(62,1,9,'Plumber',NULL,'Cancelled','2026-07-21 06:15:44','Cancelled while pending');
/*!40000 ALTER TABLE `hirerequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waddress`
--

DROP TABLE IF EXISTS `waddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waddress` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `country` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waddress`
--

LOCK TABLES `waddress` WRITE;
/*!40000 ALTER TABLE `waddress` DISABLE KEYS */;
INSERT INTO `waddress` VALUES (1,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-27 10:29:29'),(2,'iuwdijaiehj','Boduppal','Telangana','500092','IN','2026-06-27 10:31:09'),(3,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-27 10:32:34'),(4,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500094','IN','2026-06-27 10:34:51'),(5,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-06-27 10:36:05'),(6,'238/6, privillege estste colony , chengicherla , medipally','Hyd','Telangana','500094','IN','2026-07-03 13:10:31'),(7,'238/6, privillege estste colony , chengicherla , medipally','Boduppal','Telangana','500092','IN','2026-07-03 13:13:33'),(8,'238/6, privillege estste colony , chengicherla , medipally','Hyd','Telangana','500092','IN','2026-07-14 12:43:23'),(9,'238/6, privillege estste colony , chengicherla , medipally','Hyd','Telangana','500092','IN','2026-07-14 13:00:04'),(10,'hn-03','Hyderabad','Telangana','500092','IN','2026-07-21 11:37:17');
/*!40000 ALTER TABLE `waddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wprofile`
--

DROP TABLE IF EXISTS `wprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wprofile` (
  `profile_id` int NOT NULL AUTO_INCREMENT,
  `w_id` int NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `experience_years` varchar(2) NOT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `is_available` enum('Available','Not Available') DEFAULT 'Available',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`profile_id`),
  KEY `fk_wprofile_worker` (`w_id`),
  CONSTRAINT `fk_wprofile_worker` FOREIGN KEY (`w_id`) REFERENCES `wregister` (`w_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wprofile`
--

LOCK TABLES `wprofile` WRITE;
/*!40000 ALTER TABLE `wprofile` DISABLE KEYS */;
INSERT INTO `wprofile` VALUES (1,1,'Plumber','2','hiii','Available','2026-06-27 10:29:54'),(2,2,'Plumber','5','hello','Available','2026-06-27 10:31:36'),(3,3,'Electrician','3','tguhh','Available','2026-06-27 10:32:58'),(4,4,'Plumber','2','hfguh','Available','2026-06-27 10:35:19'),(5,5,'Plumber','2','efjdj','Not Available','2026-06-27 10:36:33'),(6,6,'Painter','3','','Available','2026-07-03 13:11:14'),(9,9,'Plumber','3','hlw\r\n','Available','2026-07-14 13:01:17'),(10,1,'Electrician','3','hleefhjbgtyhj  \r\n','Available','2026-07-21 06:14:43'),(11,10,'Mason','5','','Available','2026-07-21 11:37:58'),(12,10,'Electrician','3','','Available','2026-07-21 11:39:09'),(13,10,'Electrician','3','','Available','2026-07-21 11:44:00');
/*!40000 ALTER TABLE `wprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wregister`
--

DROP TABLE IF EXISTS `wregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wregister` (
  `w_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `date_of_birth` date NOT NULL,
  `password` varchar(30) NOT NULL,
  `address_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idcard_front_path` varchar(500) DEFAULT NULL,
  `idcard_back_path` varchar(500) DEFAULT NULL,
  `profile_pic_path` varchar(500) DEFAULT NULL,
  `status` enum('Not Banned','Banned') DEFAULT 'Not Banned',
  PRIMARY KEY (`w_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_waddress` (`address_id`),
  CONSTRAINT `fk_waddress` FOREIGN KEY (`address_id`) REFERENCES `waddress` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wregister`
--

LOCK TABLES `wregister` WRITE;
/*!40000 ALTER TABLE `wregister` DISABLE KEYS */;
INSERT INTO `wregister` VALUES (1,'Hujaifa Majeed','9554028071','hujaifa@student.iul.ac.in','Male','2026-06-01','1234',1,'2026-06-27 10:29:29',NULL,NULL,NULL,'Not Banned'),(2,'Ali Zama','9554028072','ali123@gmail.com','Male','2026-06-08','1234',2,'2026-06-27 10:31:09',NULL,NULL,NULL,'Banned'),(3,'Parvej','9554028073','parvej@gmail.com','Male','2026-06-08','1234',3,'2026-06-27 10:32:34',NULL,NULL,NULL,'Banned'),(4,'Ansar','9554028074','ansar@gmail.com','Male','2026-06-08','1234',4,'2026-06-27 10:34:51',NULL,NULL,NULL,'Not Banned'),(5,'Vinayak','9554028075','vinayak@gmail.com','Male','2026-06-04','1234',5,'2026-06-27 10:36:05',NULL,NULL,NULL,'Not Banned'),(6,'Rashmika','9554028076','rashmi@gmail.com','Male','2000-02-29','1234',6,'2026-07-03 13:10:31','/home/huzaif/uploads/idcards/idfront_rashmi@gmail.com_1783084230895.jpeg','/home/huzaif/uploads/idcards/idback_rashmi@gmail.com_1783084230896.jpeg','/home/huzaif/uploads/profilepics/profile_rashmi@gmail.com_1783084230889.jpeg','Not Banned'),(7,'Sahid','9554028077','sahid@gmail.com','Male','1995-03-08','1234',7,'2026-07-03 13:13:33','/home/huzaif/uploads/idcards/idfront_sahid@gmail.com_1783084413351.jpeg','/home/huzaif/uploads/idcards/idback_sahid@gmail.com_1783084413351.jpeg','/home/huzaif/uploads/profilepics/profile_sahid@gmail.com_1783084413351.jpeg','Not Banned'),(9,'Hujaifa Majeed','9554028080','huzaif@gmail.com','Male','2000-01-01','1234',9,'2026-07-14 13:00:04','/home/huzaif/uploads/idcards/idfront_huzaif@gmail.com_1784034004359.png','/home/huzaif/uploads/idcards/idback_huzaif@gmail.com_1784034004360.png','/home/huzaif/uploads/profilepics/profile_huzaif@gmail.com_1784034004358.jpg','Not Banned'),(10,'Amit','9327027221','amit@student.iul.ac.in','Male','2004-07-01','12345678',10,'2026-07-21 11:37:17','/home/huzaif/uploads/idcards/idfront_amit@student.iul.ac.in_1784633837917.png','/home/huzaif/uploads/idcards/idback_amit@student.iul.ac.in_1784633837918.png','/home/huzaif/uploads/profilepics/profile_amit@student.iul.ac.in_1784633837913.png','Not Banned');
/*!40000 ALTER TABLE `wregister` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-28 20:26:44
