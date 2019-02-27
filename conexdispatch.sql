-- MySQL dump 10.13  Distrib 8.0.3-rc, for Linux (x86_64)
--
-- Host: localhost    Database: conexdispatch
-- ------------------------------------------------------
-- Server version	8.0.3-rc-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assigned` tinyint(4) DEFAULT '0',
  `ready` int(11) DEFAULT '0',
  `invoice_no` varchar(45) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `event_creator` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `payment_status` varchar(45) DEFAULT NULL,
  `payment_gateway` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `line_item` varchar(45) DEFAULT NULL,
  `expected_delivery_time` varchar(45) DEFAULT NULL,
  `expected_ext_time` varchar(45) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `delivery_progress` int(11) DEFAULT '0',
  `on_site_contact` varchar(255) DEFAULT NULL,
  `total_order` varchar(255) DEFAULT NULL,
  `customer_info` varchar(255) DEFAULT NULL,
  `sales_rep` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `quote_url` varchar(1000) DEFAULT NULL,
  `latest_invoice_url` varchar(1000) DEFAULT NULL,
  `po_number` varchar(255) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,0,0,'#INV-014254',1,1,1,'2019-02-22','paid','COD','JEFF OAK','','40HD','00:00','03:00','2800 Camino Diablo, Byron CA','#F1F11F',60,'Fernando 408-483-7165 / Stephanie 408-529-7268','OAK 40\' Used Standard Certified Cargo Worthy ISO Container(2), MOD Paint Custom Color 40\' Exterior(2), OAK Freight(2)','Robert A Bothman Construction\nSergio Maciel\nPhone: (408) 316-5785, Mobile:',2,'null','https://crm.zoho.com/crm/tab/Quotes/2397724000013221008','https://client.conexwest.com/app#/invoices/1175392000004297183','17',1,0),(2,0,0,'123456',-1,-1,0,'2019-02-26','paid','COD','aaa','','40HD','0','0','Camino','#00B430',0,'https://','aaas','https://',1,'awefwef','https://','https://','111',1,0),(4,0,0,'',-1,-1,0,'2019-02-26','','','','','','','','','#00B430',0,'','','',-1,'','','','',1,0);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (6,'AMZ'),(10,'BIM'),(7,'BMO'),(2,'CHI'),(12,'COC'),(3,'DER'),(5,'IBM'),(11,'LIT'),(8,'LLC'),(1,'OAK'),(4,'PAC'),(9,'YYI');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,3),(6,2,4),(7,2,5),(8,3,6),(9,4,2),(10,5,6);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator'),(2,'Sales Rep'),(3,'Dispatcher'),(4,'Driver');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `role` varchar(45) NOT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jeff Carter','4','+1 609 223 2323'),(2,'Habib Nurmagomedov','4','+1 609 223 2323'),(3,'Vitali Barkouski','4','+1 609 223 2323'),(4,'Alex Rozkin','4','+1 609 223 2323'),(5,'Brock Fegan','4','+1 609 223 2323'),(6,'Scott Russel','4','+1 609 223 2323'),(7,'Andrew Sokol','4','+1 609 223 2323'),(8,'Alex Viking','4','+1 609 223 2323'),(9,'Saif Olauri','4','+1 609 223 2323'),(10,'Edwin Cock','4','+1 609 223 2323'),(11,'Sergey Vasiliev','4','+1 609 223 2323'),(12,'Len Rock','4','+1 609 223 2323'),(13,'Dmitry Kolin','4','+1 609 223 2323'),(14,'Alan Paul','4','+1 609 223 2323');
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

-- Dump completed on 2019-02-27 21:46:04
