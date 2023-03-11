CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(30) NOT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_id_UNIQUE` (`city_id`),
  UNIQUE KEY `city_name_UNIQUE` (`city_name`),
  KEY `FkprtoCity_idx` (`province_id`),
  CONSTRAINT `FkprtoCity` FOREIGN KEY (`province_id`) REFERENCES `province` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_id_UNIQUE` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orderproduct` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `FK8producttopro_idx` (`product_id`),
  CONSTRAINT `FK8producttopro` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKOrderToOr` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(30) NOT NULL,
  `product_description` text NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `Prodcut_Name_UNIQUE` (`product_name`),
  UNIQUE KEY `ProductID_UNIQUE` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `productsupplier` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKPStoSu_idx` (`supplier_id`),
  CONSTRAINT `FKProsToP` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKPStoSu` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `province` (
  `province_id` int NOT NULL AUTO_INCREMENT,
  `province_name` varchar(30) NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`province_id`),
  UNIQUE KEY `province_id_UNIQUE` (`province_id`),
  UNIQUE KEY `province_name_UNIQUE` (`province_name`),
  KEY `FKProTCo_idx` (`country_id`),
  CONSTRAINT `FKProTCo` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `review` (
  `reviewid` int NOT NULL AUTO_INCREMENT,
  `reviewdate` date NOT NULL,
  `comment` tinytext NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`reviewid`),
  UNIQUE KEY `ReviewID_UNIQUE` (`reviewid`),
  KEY `FKReToPro_idx` (`product_id`),
  CONSTRAINT `FKReToPro` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
SELECT * FROM Database1.customer;