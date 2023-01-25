-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ddi_boutiqa
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `addresstype`
--

DROP TABLE IF EXISTS `addresstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresstype` (
  `AddressType_ID` int NOT NULL,
  `AddressType` varchar(60) NOT NULL,
  PRIMARY KEY (`AddressType_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresstype`
--

LOCK TABLES `addresstype` WRITE;
/*!40000 ALTER TABLE `addresstype` DISABLE KEYS */;
INSERT INTO `addresstype` VALUES (1,'BillingAddress'),(2,'ShippingAddress'),(3,'MainShopAddress'),(4,'BranchAddress');
/*!40000 ALTER TABLE `addresstype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkemail`
--

DROP TABLE IF EXISTS `bulkemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkemail` (
  `BulkEmail_ID` int NOT NULL,
  `Subject` varchar(60) NOT NULL,
  `EmailBody` varchar(60) NOT NULL,
  `RecepientAddress` varchar(60) NOT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`BulkEmail_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `bulkemail_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkemail`
--

LOCK TABLES `bulkemail` WRITE;
/*!40000 ALTER TABLE `bulkemail` DISABLE KEYS */;
INSERT INTO `bulkemail` VALUES (1,'JoinUs','new joiner','sclyne0@domainmarket.com',1),(2,'Sales','Geb with us','ndirkin1@over-blog.com',2),(3,'Spring sale','New to us','ccours2@infoseek.co.jp',4);
/*!40000 ALTER TABLE `bulkemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_info` (
  `Contact_Info_ID` int NOT NULL,
  `Unit` varchar(15) NOT NULL,
  `City` varchar(60) NOT NULL,
  `State` varchar(60) NOT NULL,
  `PostalCode` int NOT NULL,
  `Country` varchar(60) NOT NULL,
  `ContactMobile` varchar(10) DEFAULT NULL,
  `ContactOffice` varchar(10) DEFAULT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`Contact_Info_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `contact_info_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
INSERT INTO `contact_info` VALUES (1,'98838','Nanping','Matara',90111,'China','319-302-5','608-928-7','Jammie',1),(2,'689','Monguno','Gampaha',65477,'Nigeria','439-468-3','212-627-0','Skipper',2),(3,'7762','Xiema','Malabe',64574,'China','174-423-8','436-931-1','Adriano',3),(4,'915','Zajeaa','Chilaw',6918,'Czech Republic','249-464-1','581-242-3','Mira',4),(5,'65860','GAqvle','GAevleborg',80448,'Sweden','441-570-1','806-426-5','Prue',5),(6,'88292','Linshui','Galle',22111,'China','406-411-5','523-891-5','Roobbie',6),(7,'42','Changtang','Padukka',13355,'China','535-376-8','208-299-1','Dew',7),(8,'254','Aalabjah','Matara',13334,'Iraq','111-772-0','891-683-9','Gal',8),(9,'7','Quinta do Sobrado','Leiria',24476,'Portugal','879-867-0','558-780-3','Elysha',9),(10,'9','Nieszawa','Allerie',89930,'Poland','258-734-7','479-892-6','Adam',10),(12,'1','Matriz de Camaragibe','SPH',57910,'Brazil','441-570-1','806-426-5','Prue',4);
/*!40000 ALTER TABLE `contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads` (
  `Lead_ID` int NOT NULL,
  `FirstName` varchar(60) NOT NULL,
  `LastName` varchar(60) DEFAULT NULL,
  `ContactNo` varchar(60) NOT NULL,
  `EmailAddress` varchar(60) NOT NULL,
  `BulkEmail_ID` int NOT NULL,
  PRIMARY KEY (`Lead_ID`),
  KEY `BulkEmail_ID` (`BulkEmail_ID`),
  FULLTEXT KEY `idx_leads_EmailAddress` (`EmailAddress`),
  CONSTRAINT `leads_ibfk_1` FOREIGN KEY (`BulkEmail_ID`) REFERENCES `bulkemail` (`BulkEmail_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES (1,'Troy','Pere','098732123','sdyne0@domainmarket.com',2),(2,'Michel','Camal','234521334','ndirkin1@overblog.com',1),(3,'Joy','Pure','123422111','jmcmullen3@godaddy.com',2),(4,'Sadun','Ahamed','186666444','ndsmnnn@godes.com',1),(5,'Nyon','Akram','433312234','fsntyer.markety.com',1);
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `P_Name` varchar(60) NOT NULL,
  `P_Price` decimal(13,2) NOT NULL,
  `ProductDetail` varchar(60) NOT NULL,
  `ProductID` int NOT NULL,
  `P_Category` varchar(60) NOT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `User_ID` (`User_ID`),
  KEY `idx_product_P_Name` (`P_Name`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('Blender',340.00,'New machine',1,'Kitchen',2),('Grinder',255.75,'LG',2,'Home',4),('Mixer',344.00,'Samsung',3,'Kitchen',4),('RiceCooker',234.99,'LG',4,'Kitchen',2),('Oven',879.90,'LG',5,'Home',5),('Blender',678.30,'Tesca',6,'Home',2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productshoppingcart`
--

DROP TABLE IF EXISTS `productshoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productshoppingcart` (
  `Quantity` int NOT NULL,
  `ProductID` int NOT NULL,
  `ShoppingCart_ID` int NOT NULL,
  `ItemTotalPrice` decimal(25,2) DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`ShoppingCart_ID`),
  KEY `ShoppingCart_ID` (`ShoppingCart_ID`),
  CONSTRAINT `productshoppingcart_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `productshoppingcart_ibfk_2` FOREIGN KEY (`ShoppingCart_ID`) REFERENCES `shoppingcart` (`ShoppingCart_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productshoppingcart`
--

LOCK TABLES `productshoppingcart` WRITE;
/*!40000 ALTER TABLE `productshoppingcart` DISABLE KEYS */;
INSERT INTO `productshoppingcart` VALUES (1,1,3,340.00),(2,2,1,511.50),(3,3,2,1032.00);
/*!40000 ALTER TABLE `productshoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingcart` (
  `TotalPrice` decimal(13,2) NOT NULL,
  `ShoppingCart_ID` int NOT NULL,
  `CheckOutDate` date NOT NULL,
  `Status` varchar(60) NOT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`ShoppingCart_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` VALUES (234.00,1,'2021-01-01','Shipped',1),(222.90,2,'2021-02-03','Draft',3),(799.90,3,'2021-03-12','Dispatch',1),(566.90,4,'2022-12-01','Shipped',1),(555.90,5,'2022-12-12','Shipped',3);
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_ID` int NOT NULL,
  `Password` varchar(60) NOT NULL,
  `EmailAddress` varchar(60) NOT NULL,
  `User_Type` varchar(60) NOT NULL,
  `FirstName` varchar(60) NOT NULL,
  `LastName` varchar(60) NOT NULL,
  PRIMARY KEY (`User_ID`),
  FULLTEXT KEY `idx_user_FirstName` (`FirstName`),
  FULLTEXT KEY `idx_user_LastName` (`LastName`),
  FULLTEXT KEY `idx_user_EmailAddress` (`EmailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'s9BwYbWiSU','clyne0@domainmarket.com','Consumer','Jammie','Grimmett'),(2,'i1FkMdf','ndirkin1@over-blog.com','Seller','Skipper','Danson'),(3,'lESS5oYIZ85','ccours2@infoseek.co.jp','Consumer','Adriano','Lammin'),(4,'s1jNg8','jmcmullen3@godaddy.com','Seller','Mira','Del Castello'),(5,'JhTHqZNif04','knolot4@sourceforge.net','Seller','Prue','Marklow'),(6,'YpAYnK0NVBvR','vdosedale5@eventbrite.com','Consumer','Roobbie','Russam'),(7,'6rqtG8IYZ','mcromwell6@reuters.com','Consumer','Clark','Waudby'),(8,'iCvmiXyReC4v','ptippler7@walmart.com','Seller','Gal','Overell'),(9,'Gu9n65','dmcnutt8@phpbb.com','Consumer','Elysha','Jervoise'),(10,'hCUs9k','averbeke9@rakuten.co.jp','','Felix','Aubray');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraddresstype`
--

DROP TABLE IF EXISTS `useraddresstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useraddresstype` (
  `UserAddressType_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  `Contact_Info_ID` int NOT NULL,
  `AddressType_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`UserAddressType_ID`),
  KEY `Contact_Info_ID` (`Contact_Info_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `useraddresstype_ibfk_1` FOREIGN KEY (`Contact_Info_ID`) REFERENCES `contact_info` (`Contact_Info_ID`),
  CONSTRAINT `useraddresstype_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraddresstype`
--

LOCK TABLES `useraddresstype` WRITE;
/*!40000 ALTER TABLE `useraddresstype` DISABLE KEYS */;
INSERT INTO `useraddresstype` VALUES (1,1,1,'1'),(2,2,3,'1'),(3,3,4,'1'),(4,4,5,'1'),(5,5,6,'1'),(6,6,7,'1'),(7,7,8,'1'),(8,8,9,'1'),(9,9,10,'1'),(10,10,10,'1'),(11,1,2,'2'),(12,2,3,'2'),(13,3,12,'2'),(14,4,5,'2'),(15,5,6,'2'),(16,6,7,'2'),(17,7,8,'2'),(18,8,9,'2'),(19,9,10,'2'),(20,10,10,'2');
/*!40000 ALTER TABLE `useraddresstype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-17 19:25:21
