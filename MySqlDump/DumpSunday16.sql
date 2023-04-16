CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(30) NOT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_id_UNIQUE` (`city_id`),
  UNIQUE KEY `city_name_UNIQUE` (`city_name`),
  KEY `FkprtoCity_idx` (`province_id`),
  CONSTRAINT `FkprtoCity` FOREIGN KEY (`province_id`) REFERENCES `province` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (8,'Montreal',11),(9,'Torronto',12),(10,'Gatineau',11),(11,'Quebec city',11),(12,'Vancouver',13),(13,'Winnipeg',15),(14,'Ottawa',12),(15,'Calgary',14),(16,'Regina',19),(17,'Moncton',16),(18,'Dartmouth',17),(19,'New York',21),(20,'Sherbrooke',11),(21,'Trois rivieres',11);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_id_UNIQUE` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Canada'),(3,'USA');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcard` (
  `creditcardid` int NOT NULL AUTO_INCREMENT,
  `creditcardnum` varchar(30) NOT NULL,
  `creditcardholder_firstname` varchar(30) DEFAULT NULL,
  `creditcardholder_lastname` varchar(30) DEFAULT NULL,
  `creditcardtype` varchar(30) DEFAULT NULL,
  `creditcardExpiryDate` date NOT NULL,
  `creditcardcvv` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`creditcardid`),
  UNIQUE KEY `creditcardid_UNIQUE` (`creditcardid`),
  KEY `customer_id_idx` (`customer_id`),
  CONSTRAINT `FKCusTCredit` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
INSERT INTO `creditcard` VALUES (34,'4567765445671111','Ali','Morabih','visa','2024-09-09',654,19),(35,'4567765445677654','shannon','Mcconnal','visa','2024-09-09',654,20),(36,'5567765445687888','Karim','Jo-Ann','mastercard','2027-09-09',654,21),(37,'5567765445999999','Alex','Quinterro','mastercard','2028-08-09',654,22),(38,'4567765888888888','George','Leblanc','visa','2026-08-08',654,23),(39,'4567769875677654','Fall','Etienne','visa','2026-04-09',654,24),(40,'4500000045677654','Sabrina','Martel','visa','2023-04-05',654,25),(41,'5567765445677654','Christina','koko','americainexpress','2023-09-09',654,26),(42,'4567765445671111','Nita','Sonia','visa','2025-04-09',123,27),(43,'4567765445677654','Melanie','sauve','visa','2026-04-09',664,28),(44,'5567765445687888','Jeremi','Depuis','mastercard','2024-04-09',674,29),(45,'5567765445999999','Tim','Frost','mastercard','2023-07-09',653,30),(46,'4567765888888888','bourque','jacques','visa','2024-07-08',124,31),(47,'4567769875677654','Sofia','hernandez','visa','2027-06-09',124,32);
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `customer_age` int NOT NULL,
  `customer_address` varchar(50) DEFAULT NULL,
  `cityid` int NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`),
  KEY `FKCuToC_idx` (`cityid`),
  CONSTRAINT `FKCuToC` FOREIGN KEY (`cityid`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (19,'Ali','morabih','5147542702','alimora2695@gmail.com',30,'301-84 churchill j4v3l8',11),(20,'Ali','morabih','5147542702','alimora2695@gmail.com',30,'301-84 churchill j4v3l8',8),(21,'shannon','Mcconnal','8888887666','shannon.2@gmail.com',25,'301-84 churchill j4v3l8',8),(22,'Karim','Jo-Ann','9980987878','JoAnn@hotmail.com',30,'2100 saint catherine j4v3l1',8),(23,'Alex','Quinterro','8766788888','Alex@hotmail.com',11,'123 saint jean j2v3l2',8),(24,'George','Leblanc','9899879999','George@hotmail.com',21,'129 brossard j9v5l1',8),(25,'Fall','Etienne','4566788877','fallj@hotmail.com',20,'98 \nrue peel H3S2R3',8),(26,'Sabrina','Martel','4356789653','Sabrinaj@hotmail.com',25,'2387 Boulvard saint laurent H6S2R1',11),(27,'Christina','koko','987456739','Christinaj@hotmail.com',22,'7643 Boulvard saint sauveur H8T2R3',8),(28,'Nita','Sonia','6577899898','Nita@hotmail.com',34,'1234 \nLinton aven H3S2R1',8),(29,'Melanie','sauve','767777777','Melanie@hotmail.com',29,'9898 saint remi boul M2t4BF',8),(30,'Jeremi','Depuis','9898989899','jeremi@hotmail.com',27,'43 saint brossard H8S2F4',17),(31,'Tim','Frost','4566788877','tim@hotmail.com',24,'9898 \nrue peel H4S2T7',17),(32,'bourque','jacques','4356789653','bourque@hotmail.com',23,'768 rue brodeur H2W2R1',17),(33,'Sofia','hernandez','987456739','Sofia@hotmail.com',21,'1233 Mcgill avenue H1G2R1',8);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderproduct`
--

DROP TABLE IF EXISTS `orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderproduct` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `FK8producttopro_idx` (`product_id`),
  CONSTRAINT `FK8producttopro` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKOrderToOr` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderproduct`
--

LOCK TABLES `orderproduct` WRITE;
/*!40000 ALTER TABLE `orderproduct` DISABLE KEYS */;
INSERT INTO `orderproduct` VALUES (1,6,1),(2,7,1),(3,5,2),(4,6,1),(5,7,2),(6,7,1),(7,6,1),(8,7,1),(9,7,3),(10,7,2),(11,7,2),(12,6,1),(13,6,2),(14,7,1);
/*!40000 ALTER TABLE `orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `Total_Order` bigint NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `orderid_UNIQUE` (`order_id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`),
  KEY `FK4Order_idx` (`customer_id`),
  CONSTRAINT `FK4Order` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-01-02','Progress',802,19),(2,'2020-01-12','Cancelled',600,20),(3,'2021-06-22','completed',550,21),(4,'2021-01-22','Completed',440,22),(5,'2021-06-12','Cancelled',520,23),(6,'2022-01-22','Completed',850,24),(7,'2022-03-12','Completed',520,25),(8,'2022-07-01','Waiting for payment',1200,26),(9,'2021-04-12','Completed',880,27),(10,'2020-09-12','Completed',1250,28),(11,'2021-01-23','Completed',1520,29),(12,'2021-02-11','Completed',528,30),(13,'2021-04-13','Completed',973,31),(14,'2022-01-12','Completed',789,32),(15,'2022-01-12','Completed',789,33);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(30) NOT NULL,
  `product_description` text NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `Prodcut_Name_UNIQUE` (`product_name`),
  UNIQUE KEY `ProductID_UNIQUE` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (5,'Play Station 5','The latest Sony PlayStation introduced in November 2020. Powered by \nan eight-core AMD Zen 2 CPU and custom AMD Radeon GPU',1000),(6,'xbox series x','The Xbox Series X has higher-end hardware and supports higher \ndisplay resolutions (up to 8K resolution), along with higher frame rates and real-time ray tracing; \nit also has a high-speed solid-state drive (SSD) to reduce loading times.',800),(7,'nintendo switch','The Nintendo Switch is a hybrid video game console, consisting of a \nconsole unit, a dock, and two Joy-Con controllers. Although it is a hybrid console, Nintendo \nclassifies it as \"a home console that you can take with you on the go\"',400);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsupplier`
--

DROP TABLE IF EXISTS `productsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsupplier` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKPStoSu_idx` (`supplier_id`),
  CONSTRAINT `FKProsToP` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKPStoSu` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsupplier`
--

LOCK TABLES `productsupplier` WRITE;
/*!40000 ALTER TABLE `productsupplier` DISABLE KEYS */;
INSERT INTO `productsupplier` VALUES (5,5),(6,6),(7,7);
/*!40000 ALTER TABLE `productsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `province_id` int NOT NULL AUTO_INCREMENT,
  `province_name` varchar(30) NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`province_id`),
  UNIQUE KEY `province_id_UNIQUE` (`province_id`),
  UNIQUE KEY `province_name_UNIQUE` (`province_name`),
  KEY `FKProTCo_idx` (`country_id`),
  CONSTRAINT `FKProTCo` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (11,'Quebec ',1),(12,'Ontario',1),(13,'British Colombia',1),(14,'Alberta',1),(15,'Manitoba',1),(16,'New Brunswick',1),(17,'Nova Scotia',1),(18,'PE',1),(19,'Saskatchewan',1),(20,'Yukon',1),(21,'New York',3);
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `reviewid` int NOT NULL AUTO_INCREMENT,
  `reviewdate` date NOT NULL,
  `comment` tinytext NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`reviewid`),
  UNIQUE KEY `ReviewID_UNIQUE` (`reviewid`),
  KEY `FKReToPro_idx` (`product_id`),
  CONSTRAINT `FKReToPro` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (18,'2021-01-02','The Sony PS5 is an amazing game console, Good product with \nreasonable price ',5),(19,'2021-02-01','A great improvement over my older Xbox One S. prodcut well \ndesign & faster, easy to use it ',6),(20,'2021-03-01','Nintendo did a good job to design the interface ',7);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `shipment_id` int NOT NULL AUTO_INCREMENT,
  `shipment_date` date NOT NULL,
  `shipment_Address` varchar(30) NOT NULL,
  `shipment_TrackingNumber` varchar(30) NOT NULL,
  `orderid` int NOT NULL,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`shipment_id`),
  KEY `FK5Shipping_idx` (`orderid`),
  KEY `FKShipTCit_idx` (`city_id`),
  CONSTRAINT `FK5Shipping` FOREIGN KEY (`orderid`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FKShiToCity` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES (85,'2022-01-21','301-84 churchill j4v3l8','92226766',1,8),(99,'2021-06-30','196 Rue Brodeur j4v3l1','9833333',3,10),(100,'2021-06-30','196 Rue Brodeur j4v3l1','9833333',3,10),(101,'2021-01-30','123 saint jean j2v3l2','11112222222222',4,10),(102,'2021-06-22','129 brossard j9v5l1','12568766666664',5,8),(103,'2022-01-31','98 rue peel H3S2R3','33328766666664',6,8),(104,'2021-04-21','344 Boul rene levesque H2R2S4','12345766666664',9,8),(105,'2020-09-22','9898 boul saint remi M2t4BF','12533336666664',10,8),(106,'2021-02-03','43 saint brossard H8S2F4','45321444444444',11,8),(107,'2021-02-21','9898 rue peel H4S2T7','33344444444444',12,19),(108,'2021-04-23','768 rue brodeur H2W2R1','9895541959',13,8),(109,'2022-01-01','1233 Mcgill ave H1G2R1','5145415454',14,9),(110,'2022-03-22','2387 Boulvard laurent H6S2R1','11111766666664',7,8),(111,'2022-07-11','7643 Boulvard sauveur H8T2R3','22276766666664',8,8);
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(30) NOT NULL,
  `supplier_address` varchar(50) NOT NULL,
  `supplier_phone` varchar(50) NOT NULL,
  `supplier_rating` int DEFAULT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `supplier_id_UNIQUE` (`supplier_id`),
  KEY `FKSuTCi_idx` (`city_id`),
  CONSTRAINT `FSupToCit` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (5,'Microsoft','2000 McGill College Ave H3A 3H3','5148465800',5,8),(6,'Sony','550 Madison Avenue 10010','2128336800',5,19),(7,'Nintendo','2925 Virtual Way Suite 150 V5M 4X5','18002553700',4,12);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-16 17:22:27
