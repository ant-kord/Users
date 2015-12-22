-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `isAdmin` bit(8) DEFAULT NULL,
  `createdDate` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (39,'Аркадий',18,'','2015-12-17 18:00:00.000000'),(40,'Бронислав',18,'\0','2015-12-17 18:00:00.000000'),(41,'Митрофан',23,'','2015-12-17 18:00:00.000000'),(42,'Архип',29,'\0','2015-12-17 18:00:00.000000'),(43,'Вячеслав',19,'','2015-12-17 18:00:00.000000'),(44,'Антон',27,'','2015-12-17 18:00:00.000000'),(45,'Виссарион',24,'\0','2015-12-17 18:00:00.000000'),(46,'Матвей',23,'\0','2015-12-17 18:00:00.000000'),(47,'Афанасий',20,'','2015-12-17 18:00:00.000000'),(48,'Платон',24,'\0','2015-12-17 18:00:00.000000'),(49,'Всеволод',26,'\0','2015-12-17 18:00:00.000000'),(50,'Потап',27,'\0','2015-12-17 18:00:00.000000'),(51,'Руслан',29,'','2015-12-17 18:00:00.000000'),(52,'Людмила',23,'\0','2015-12-17 18:00:00.000000'),(53,'Глеб',30,'\0','2015-12-17 18:00:00.000000'),(54,'Герман',26,'\0','2015-12-17 18:00:00.000000'),(55,'Захар',25,'','2015-12-17 18:00:00.000000'),(56,'Ефим',24,'','2015-12-17 18:00:00.000000'),(57,'Константин',26,'\0','2015-12-17 18:00:00.000000'),(58,'Емельян',30,'\0','2015-12-17 18:00:00.000000'),(59,'Тихон',25,'\0','2015-12-17 18:00:00.000000'),(60,'Игнат',28,'\0','2015-12-17 18:00:00.000000'),(61,'Иннокентий',23,'','2015-12-17 18:00:00.000000'),(62,'Святослав',23,'\0','2015-12-17 18:00:00.000000'),(63,'Кузьма',29,'\0','2015-12-17 18:00:00.000000'),(64,'Ипполит',32,'\0','2015-12-17 18:00:00.000000'),(65,'Булат',42,'\0','2015-12-20 18:00:00.000000'),(66,'Валентин',28,'\0','2015-12-20 18:00:00.000000'),(67,'Ибрагим',23,'\0','2015-12-20 18:00:00.000000'),(68,'Вениомин',25,'','2015-12-20 18:00:00.000000'),(70,'Генадий',45,'','2015-12-20 18:00:00.000000');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-22  9:36:50
