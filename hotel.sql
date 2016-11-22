CREATE DATABASE  IF NOT EXISTS `hotel1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hotel1`;
-- MySQL dump 10.13  Distrib 5.7.10, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel1
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `First_Name` varchar(40) DEFAULT NULL,
  `Last_Name` varchar(40) DEFAULT NULL,
  `cID` varchar(40) NOT NULL,
  `Birth_Date` date DEFAULT NULL,
  `Payment_Method` varchar(40) DEFAULT NULL,
  `Check_In` datetime DEFAULT NULL,
  `Check_out` datetime DEFAULT NULL,
  `Reserved_Room_No` varchar(40) DEFAULT NULL,
  `Social_Status` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cID`),
  UNIQUE KEY `cID_UNIQUE` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Adel','Ahmed','C0001','1981-10-10','Cash','2015-12-02 13:20:11','2015-12-05 18:04:11','S122','Others'),('Faisal','Abdullah','C0002','1985-03-05','Cash','2015-12-09 09:45:01','2015-12-16 18:50:03','D145','Others'),('Maher','Darweesh','C0003','1989-06-08','Credit Card','2015-03-06 07:55:06','2015-03-10 20:30:00','S125','Others'),('Qassem','Saleh','C0004','1989-01-02','Cash','2015-08-13 21:06:06','2015-08-18 13:01:00','K230','VIP'),('Hossam','Ameer','C0005','1991-04-22','Credit Card','2015-04-13 23:11:11','2015-04-15 11:19:14','D129','Others'),('Yasser','Sohaib','C0006','1990-05-03','Credit Card','2015-06-06 07:23:03','2015-06-09 20:14:44','Q55','VIP');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_phone_no`
--

DROP TABLE IF EXISTS `customer_phone_no`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_phone_no` (
  `CustID` varchar(40) NOT NULL,
  `Phone_Number` varchar(40) DEFAULT NULL,
  KEY `CustID` (`CustID`),
  CONSTRAINT `CustID` FOREIGN KEY (`CustID`) REFERENCES `customer` (`cID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_phone_no`
--

LOCK TABLES `customer_phone_no` WRITE;
/*!40000 ALTER TABLE `customer_phone_no` DISABLE KEYS */;
INSERT INTO `customer_phone_no` VALUES ('C0001','050-6485123'),('C0002','052-6248823'),('C0003','052-8745315'),('C0004','050-6584213'),('C0005','052-4531254'),('C0006','052-4566125'),('C0006','052-6544421'),('C0004','052-8452213'),('C0004','056-6632156');
/*!40000 ALTER TABLE `customer_phone_no` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependant`
--

DROP TABLE IF EXISTS `dependant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependant` (
  `Name` varchar(40) DEFAULT NULL,
  `dID` varchar(40) NOT NULL,
  `Birth_Date` date DEFAULT NULL,
  `Relationship` varchar(40) DEFAULT NULL,
  `Cust_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dID`),
  KEY `Cust_ID_idx` (`Cust_ID`),
  CONSTRAINT `Cust_ID` FOREIGN KEY (`Cust_ID`) REFERENCES `customer` (`cID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependant`
--

LOCK TABLES `dependant` WRITE;
/*!40000 ALTER TABLE `dependant` DISABLE KEYS */;
INSERT INTO `dependant` VALUES ('Amer','D0001','1994-10-12','Son','C0003'),('Amna','D0002','1998-02-20','Daughter','C0001'),('Homam','D0003','1993-04-23','Son','C0005'),('Farah','D0004','1983-04-02','Wife','C0001');
/*!40000 ALTER TABLE `dependant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_phone_no`
--

DROP TABLE IF EXISTS `emp_phone_no`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_phone_no` (
  `EMP_ID` varchar(40) NOT NULL,
  `Phone_Number` varchar(40) DEFAULT NULL,
  KEY `EMP_ID_idx` (`EMP_ID`),
  CONSTRAINT `EMP_ID` FOREIGN KEY (`EMP_ID`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_phone_no`
--

LOCK TABLES `emp_phone_no` WRITE;
/*!40000 ALTER TABLE `emp_phone_no` DISABLE KEYS */;
INSERT INTO `emp_phone_no` VALUES ('E0001','052-6543258'),('E0001','050-6548741'),('E0001','056-9744123'),('E0002','050-8741254'),('E0003','052-3625165'),('E0004','050-8546954'),('E0005','052-6452164'),('E0005','050-1025468'),('E0006','052-6584923'),('E0007','052-9846332'),('E0007','050-1246658');
/*!40000 ALTER TABLE `emp_phone_no` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Fnam` varchar(40) DEFAULT NULL,
  `Lname` varchar(40) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `Birth_Date` date DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `Position` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Ibrahim','Saleh','E0001','1981-10-02','M','Sharjah , Suwaihat',24000,'Manager'),('Ahmed','Zain','E0002','1984-02-03','M','Sharjah , Wasit',9800,'Standard'),('Ali ','Saeed','E0003','1988-06-04','M','Dubai , AlBarsha',8200,'Standard'),('Someya','Ziad','E0004','1989-04-22','F','Ajman , Mishrif',6550,'Stabdard'),('Jassim','Abbas','E0005','1981-03-21','M','Dubai , Alqusais',14000,'Supervisor'),('Ghanem','Abdulrahman','E0006','1990-03-22','M','Sharjah , Ramthaa',5250,'Standard'),('Shaikha','Hamad','E0007','1989-12-14','F','Ajman , Rashdiya',12500,'Supervisor'),('Hamed','Mohsen','E0008','1990-10-11','M','Sharjah , Rahmania',6500,'Standard'),('Jamal','Kamel','E0009','1991-11-12','M','Sharjah , Rahmania',7000,'Standard');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `Name` varchar(40) NOT NULL,
  `No_of_Rooms` int(11) DEFAULT NULL,
  `No_of_Floors` int(11) DEFAULT NULL,
  `No_of_Employees` int(11) DEFAULT NULL,
  `Hotel_Mgr_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `Hotel_Mgr_ID_idx` (`Hotel_Mgr_ID`),
  CONSTRAINT `Hotel_Mgr_ID` FOREIGN KEY (`Hotel_Mgr_ID`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES ('Holiday Inn',90,10,75,'E0001');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_location`
--

DROP TABLE IF EXISTS `hotel_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_location` (
  `Hotel_Name` varchar(40) NOT NULL,
  `Location` varchar(40) NOT NULL,
  PRIMARY KEY (`Hotel_Name`,`Location`),
  CONSTRAINT `Hotel_Name` FOREIGN KEY (`Hotel_Name`) REFERENCES `hotel` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_location`
--

LOCK TABLES `hotel_location` WRITE;
/*!40000 ALTER TABLE `hotel_location` DISABLE KEYS */;
INSERT INTO `hotel_location` VALUES ('Holiday Inn','Sharjah , Buhairah');
/*!40000 ALTER TABLE `hotel_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation` (
  `Operation_Name` varchar(40) DEFAULT NULL,
  `Operation_Number` varchar(40) NOT NULL,
  `No_of_Employees` int(11) DEFAULT NULL,
  `OP_Mgr_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Operation_Number`),
  UNIQUE KEY `Operation_Number_UNIQUE` (`Operation_Number`),
  KEY `OP_Mgr_ID_idx` (`OP_Mgr_ID`),
  CONSTRAINT `OP_Mgr_ID` FOREIGN KEY (`OP_Mgr_ID`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
INSERT INTO `operation` VALUES ('Hotel Managment','O0001',1,'E0001'),('Admission','O0002',2,'E0005'),('Security','O0003',1,'E0004'),('Cleaning','O0004',1,'E0004'),('Valet Parking','O0005',2,'E0005');
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `Room_No` varchar(40) NOT NULL,
  `Type` varchar(40) DEFAULT NULL,
  `Status` varchar(40) DEFAULT NULL,
  `HName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Room_No`),
  KEY `HName_idx` (`HName`),
  CONSTRAINT `HName` FOREIGN KEY (`HName`) REFERENCES `hotel` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('D129','Double','Reserved','Holiday Inn'),('D145','Double','Reserved','Holiday Inn'),('D147','Double','Empty','Holiday Inn'),('K133','King','Empty','Holiday Inn'),('K230','King','Reserved','Holiday Inn'),('Q52','Queen','Empty','Holiday Inn'),('Q55','Queen','Reserved','Holiday Inn'),('S122','Single','Reserved','Holiday Inn'),('S125','Single','Reserved','Holiday Inn'),('S152','Single','Empty','Holiday Inn');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_type` (
  `Room_Type` varchar(40) NOT NULL,
  `Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`Room_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES ('Double',550),('King',1850),('Queen',1250),('Single',350);
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works_on` (
  `Employee_ID` varchar(40) NOT NULL,
  `Operation_Num` varchar(40) NOT NULL,
  `W_Hours` double DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`,`Operation_Num`),
  KEY `Operation_Num_idx` (`Operation_Num`),
  CONSTRAINT `Employee_ID` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Operation_Num` FOREIGN KEY (`Operation_Num`) REFERENCES `operation` (`Operation_Number`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('E0002','O0002',12),('E0003','O0004',16),('E0004','O0002',12),('E0006','O0003',14),('E0008','O0005',8),('E0009','O0005',8);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-22  9:22:05
