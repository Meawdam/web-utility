-- XAMPP-Lite
-- version 8.4.4
-- https://xampplite.sf.net/
--
-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: 127.0.0.1	Database: web
-- ------------------------------------------------------
-- Server version 	11.4.5-MariaDB-log
-- Date: Mon, 24 Mar 2025 07:47:52 +0000

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
-- Table structure for table `product`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `price` mediumint(8) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `image` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `amount`, `image`) VALUES (1,'shirt',220,5,'shirt.png');
INSERT INTO `product` (`id`, `name`, `price`, `amount`, `image`) VALUES (2,'shoe',600,3,'shoe.png');
INSERT INTO `product` (`id`, `name`, `price`, `amount`, `image`) VALUES (3,'hat',199,1,'hat.png');
INSERT INTO `product` (`id`, `name`, `price`, `amount`, `image`) VALUES (4,'handbag',899,2,'handbag.png');
INSERT INTO `product` (`id`, `name`, `price`, `amount`, `image`) VALUES (5,'jeans',1009,4,'jeans.png');

-- Dumped table `product` with 5 row(s)
--

--
-- Table structure for table `user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (1,'admin','$2b$10$.XHmyJqfbSh8PW8.uqjdFusT6LFYDFnPfklb8BfkMxLALllTxH/Fu',1);
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (2,'Lisa','$2b$10$eWi8N1ZzF.2ZCcG2/HOe3emTOAGwmV9plz0obX3kYIptyj6hDEl8C',2);

-- Dumped table `user` with 2 row(s)
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Mon, 24 Mar 2025 07:47:53 +0000
