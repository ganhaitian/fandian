CREATE DATABASE  IF NOT EXISTS `fd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fd`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 210.242.74.213    Database: fd
-- ------------------------------------------------------
-- Server version	5.5.15-log

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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  PRIMARY KEY (`username`,`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('admin','ROLE_USER'),('ganhaitian','ROLE_MANAGER'),('liuzhijie','ROLE_MANAGER'),('liuzhijie','ROLE_WAITOR'),('odBuXjgh8F9pw21GmtniEovxxlqg','ROLE_USER'),('odBuXjiaF3-fU3NT1otI_vGRqTdk','ROLE_USER'),('odBuXjkKSQc5xjKUtVU6eFmVSnw8','ROLE_USER'),('odBuXjpbqvL6UFHtYvHOooIaDeGA','ROLE_USER'),('odBuXjqS1G_K9mRWKDuHvNwpRuK0','ROLE_USER'),('odBuXjrZFXJaiio_caMj9mwEPrXU','ROLE_USER'),('odBuXjuMPggIr5wLATznLLol7ch4','ROLE_USER'),('stuff1','ROLE_MANAGER'),('stuff2','ROLE_USER'),('stuff3','ROLE_USER'),('wangdaopeng','ROLE_MANAGER');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_no` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `fee` float(10,2) DEFAULT NULL COMMENT '应付',
  `discount` float(10,2) DEFAULT '1.00' COMMENT '折扣',
  `actual_fee` float(10,2) DEFAULT '0.00' COMMENT '实付',
  `payment_type` int(1) DEFAULT '0' COMMENT '付款方式',
  `user_name` varchar(50) DEFAULT NULL,
  `losses_customer_id` varchar(45) DEFAULT '0' COMMENT '挂账客户ID',
  `losses_customer_name` varchar(45) DEFAULT NULL COMMENT '挂账客户名称',
  `operator` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,1,0,0.00,1.00,0.00,0,'liuzhijie','0',NULL,NULL,'2014-08-05 12:30:49','2014-08-05 12:31:32'),(3,3,0,0.00,1.00,0.00,0,'liuzhijie','0',NULL,NULL,'2014-08-05 12:30:49','2014-08-05 12:31:31'),(4,4,1,0.00,1.00,0.00,0,'odBuXjqS1G_K9mRWKDuHvNwpRuK0','0',NULL,NULL,'2014-08-05 12:30:49','2014-08-06 08:06:41'),(44,2,0,324.00,1.00,0.00,0,'ganhaitian','0',NULL,NULL,'2014-08-05 12:30:49','2014-08-05 12:30:49'),(45,1,0,324.00,1.00,0.00,0,'odBuXjuMPggIr5wLATznLLol7ch4','0',NULL,NULL,'2014-08-15 16:00:00','2014-08-08 05:08:32');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) DEFAULT NULL,
  `dish_id` int(11) DEFAULT NULL,
  `dish_name` varchar(30) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `weight` int(1) DEFAULT '0' COMMENT '菜的份量，默认0是小份，1为中份，2为大份',
  `taste` int(1) DEFAULT '0' COMMENT '口味，详见taste表，默认零为无特别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_detail`
--

LOCK TABLES `bill_detail` WRITE;
/*!40000 ALTER TABLE `bill_detail` DISABLE KEYS */;
INSERT INTO `bill_detail` VALUES (1,1,14,'筒骨汤',0.00,88.00,0,0),(2,1,15,'石山一品汤',0.00,158.00,0,0),(3,2,14,'筒骨汤',0.00,88.00,0,0),(4,2,15,'石山一品汤',0.00,158.00,0,0),(5,3,12,'鱼肚炖羊胎汤',1.00,148.00,0,0),(6,3,13,'香浓老火羊骨汤',1.00,88.00,0,0),(7,4,22,'红炖农家鹅',1.00,288.00,0,0),(8,4,26,'海白地瓜叶煲',1.00,28.00,0,0),(9,4,27,'红烧鱼肚',1.00,98.00,0,0),(10,5,44,'大包',1.00,10.00,0,0),(11,5,45,'椰子饭',1.00,36.00,0,0),(12,5,46,'五谷杂粮',1.00,25.00,0,0),(13,6,7,'生上鲜乳羊肉',1.00,58.00,0,0),(14,6,8,'生上鲜羊筒骨',1.00,68.00,0,0),(15,6,10,'生上鲜羊肉片',1.00,68.00,0,0),(16,7,34,'洋葱拌木耳',1.00,16.00,0,0),(17,7,35,'凉拌羊耳丝',1.00,20.00,0,0),(18,7,39,'韭菜',1.00,18.00,0,0),(19,7,42,'烫小芥菜',1.00,18.00,0,0),(20,8,24,'双瓜海螺煲',1.00,28.00,0,0),(21,8,26,'海白地瓜叶煲',1.00,28.00,0,0),(22,8,32,'盐焗凤瓜',1.00,9.00,0,0),(23,8,35,'凉拌羊耳丝',1.00,20.00,0,0),(24,9,34,'洋葱拌木耳',1.00,16.00,0,0),(25,9,49,'羊肉腌面',1.00,28.00,0,0),(26,9,50,'金银馒头',1.00,18.00,0,0),(27,10,1,'红闷羊蹄',1.00,68.00,0,0),(28,10,2,'姜葱爆羊肚',1.00,58.00,0,0),(29,10,6,'Xo酱爆羊杂',1.00,48.00,0,0),(30,10,24,'双瓜海螺煲',1.00,28.00,0,0),(31,11,7,'生上鲜乳羊肉',1.00,58.00,0,0),(32,11,8,'生上鲜羊筒骨',1.00,68.00,0,0),(33,12,7,'生上鲜乳羊肉',1.00,58.00,0,0),(34,12,8,'生上鲜羊筒骨',1.00,68.00,0,0),(35,13,39,'韭菜',1.00,18.00,0,0),(36,13,40,'大白菜',1.00,18.00,0,0),(37,13,41,'小白菜',1.00,18.00,0,0),(38,14,39,'韭菜',1.00,18.00,0,0),(39,14,40,'大白菜',1.00,18.00,0,0),(40,14,41,'小白菜',1.00,18.00,0,0),(41,14,32,'盐焗凤瓜',1.00,9.00,0,0),(42,14,35,'凉拌羊耳丝',1.00,20.00,0,0),(43,15,44,'大包',2.00,20.00,0,0),(44,16,44,'大包',2.00,20.00,0,0),(45,17,44,'大包',2.00,20.00,0,0),(46,18,44,'大包',3.00,30.00,0,0),(47,18,1,'红闷羊蹄',2.00,136.00,0,0),(48,19,44,'大包',3.00,30.00,0,0),(49,19,1,'红闷羊蹄',2.00,136.00,0,0),(50,20,44,'大包',3.00,30.00,0,0),(51,20,1,'红闷羊蹄',2.00,136.00,0,0),(52,21,44,'大包',3.00,30.00,0,0),(53,21,1,'红闷羊蹄',2.00,136.00,0,0),(54,22,44,'大包',3.00,30.00,0,0),(55,22,1,'红闷羊蹄',2.00,136.00,0,0),(56,23,44,'大包',3.00,30.00,0,0),(57,23,1,'红闷羊蹄',2.00,136.00,0,0),(58,24,44,'大包',3.00,30.00,0,0),(59,24,1,'红闷羊蹄',2.00,136.00,0,0),(60,25,44,'大包',3.00,30.00,0,0),(61,25,1,'红闷羊蹄',2.00,136.00,0,0),(62,26,44,'大包',3.00,30.00,0,0),(63,26,1,'红闷羊蹄',2.00,136.00,0,0),(64,27,12,'紫菜汤',1.00,148.00,0,0),(65,27,13,'香浓老火羊骨汤',1.00,88.00,0,0),(66,28,12,'紫菜汤',1.00,148.00,0,0),(67,28,13,'香浓老火羊骨汤',1.00,88.00,0,0),(68,29,39,'韭菜',1.00,18.00,0,0),(69,29,40,'大白菜',1.00,18.00,0,0),(70,30,50,'金银馒头',1.00,18.00,0,0),(71,30,48,'黄金大饼',1.00,28.00,0,0),(72,31,7,'生上鲜乳羊肉',1.00,58.00,0,0),(73,31,8,'生上鲜羊筒骨',1.00,68.00,0,0),(74,31,11,'生上鲜羊排',1.00,58.00,0,0),(75,32,16,'天麻羊头汤',1.00,88.00,0,0),(76,32,19,'巴戟杜仲炖羊鞭',1.00,26.00,0,0),(77,32,1,'红闷羊蹄',1.00,68.00,0,0),(78,32,4,'红烧羊皮',1.00,58.00,0,0),(79,33,32,'盐焗凤瓜',1.00,9.00,0,0),(80,33,38,'老醋酱萝卜',1.00,12.00,0,0),(81,33,36,'香炸花生米',1.00,9.00,0,0),(82,33,56,'羊筋萝卜煲',1.00,48.00,0,0),(83,34,43,'生菜',1.00,18.00,0,0),(84,34,39,'韭菜',1.00,18.00,0,0),(85,34,48,'黄金大饼',1.00,28.00,0,0),(86,34,49,'羊肉腌面',1.00,28.00,0,0),(87,35,1,'红闷羊蹄',1.00,68.00,0,0),(88,35,4,'红烧羊皮',1.00,58.00,0,0),(89,35,43,'生菜',1.00,18.00,0,0),(90,35,39,'韭菜',1.00,18.00,0,0),(91,36,32,'盐焗凤瓜',1.00,9.00,0,0),(92,36,33,'响刀拍黄瓜',1.00,16.00,0,0),(93,37,4,'红烧羊皮',1.00,58.00,0,0),(94,37,5,'红烧羊肉',1.00,68.00,0,0),(95,37,3,'姜葱炒羊腰',1.00,58.00,0,0),(96,38,40,'大白菜',1.00,18.00,0,0),(97,38,42,'烫小芥菜',1.00,18.00,0,0),(98,38,43,'生菜',1.00,18.00,0,0),(99,39,1,'红闷羊蹄',1.00,68.00,0,0),(100,39,4,'红烧羊皮',1.00,58.00,0,0),(101,39,5,'红烧羊肉',1.00,68.00,0,0),(102,39,3,'姜葱炒羊腰',1.00,58.00,0,0),(103,40,1,'红闷羊蹄',1.00,68.00,0,0),(104,40,4,'红烧羊皮',1.00,58.00,0,0),(105,40,5,'红烧羊肉',1.00,68.00,0,0),(106,40,3,'姜葱炒羊腰',1.00,58.00,0,0),(107,40,39,'韭菜',1.00,18.00,0,0),(108,40,40,'大白菜',1.00,18.00,0,0),(109,40,42,'烫小芥菜',1.00,18.00,0,0),(110,40,41,'小白菜',1.00,18.00,0,0),(111,40,44,'大包',1.00,10.00,0,0),(112,40,47,'广式玉米烙',1.00,28.00,0,0),(113,41,1,'红闷羊蹄',1.00,68.00,0,0),(114,41,4,'红烧羊皮',1.00,58.00,0,0),(115,41,5,'红烧羊肉',1.00,68.00,0,0),(116,41,3,'姜葱炒羊腰',1.00,58.00,0,0),(117,41,39,'韭菜',1.00,18.00,0,0),(118,41,40,'大白菜',1.00,18.00,0,0),(119,41,42,'烫小芥菜',1.00,18.00,0,0),(120,41,41,'小白菜',1.00,18.00,0,0),(121,41,44,'大包',1.00,10.00,0,0),(122,41,47,'广式玉米烙',1.00,28.00,0,0),(123,41,15,'石山一品汤',1.00,158.00,0,0),(124,41,16,'天麻羊头汤',1.00,88.00,0,0),(125,41,14,'筒骨汤',1.00,88.00,0,0),(126,42,1,'红闷羊蹄',1.00,68.00,0,0),(127,42,2,'姜葱爆羊肚',1.00,58.00,0,0),(128,42,3,'姜葱炒羊腰',1.00,58.00,0,0),(129,43,32,'盐焗凤瓜',1.00,9.00,0,0),(130,43,33,'响刀拍黄瓜',1.00,16.00,0,0),(131,44,12,'紫菜汤',1.00,148.00,0,0),(132,44,13,'香浓老火羊骨汤',1.00,88.00,0,0),(133,44,16,'天麻羊头汤',1.00,88.00,0,0),(134,45,12,'紫菜汤',1.00,148.00,0,0),(135,45,13,'香浓老火羊骨汤',1.00,88.00,0,0),(136,45,14,'筒骨汤',1.00,88.00,0,0);
/*!40000 ALTER TABLE `bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_taste`
--

DROP TABLE IF EXISTS `category_taste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_taste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `taste_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_taste`
--

LOCK TABLES `category_taste` WRITE;
/*!40000 ALTER TABLE `category_taste` DISABLE KEYS */;
INSERT INTO `category_taste` VALUES (1,22,5),(2,22,6),(3,22,7),(4,22,8);
/*!40000 ALTER TABLE `category_taste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `unsettle_fee` float(10,2) DEFAULT '0.00',
  `last_settle_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (2,'海口地税',0.00,'2014-07-30 12:52:45'),(3,'海口國電',696.00,'2014-08-08 20:22:27'),(4,'海口建業',54.00,'2014-07-31 03:47:53'),(5,'海口街道办',362.00,'2014-07-31 06:21:21');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `sales` int(11) DEFAULT '0',
  `stars` int(1) DEFAULT '0',
  `detail` text,
  `pic_path` varchar(50) DEFAULT NULL COMMENT '菜品图片上传标志',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'红闷羊蹄',68,9,800,5,'','1.jpg','2014-08-06 22:03:33'),(2,'姜葱爆羊肚',58,9,123,0,'','2.jpg','2014-08-06 22:03:33'),(3,'姜葱炒羊腰',58,9,75,0,'','3.jpg','2014-08-06 22:03:33'),(4,'红烧羊皮',58,9,85,0,'','4.jpg','2014-08-06 22:03:33'),(5,'红烧羊肉',68,9,10,0,'','5.jpg','2014-08-06 22:03:33'),(6,'Xo酱爆羊杂',48,9,75,0,'','6.jpg','2014-08-06 22:03:33'),(7,'生上鲜乳羊肉',58,6,6,0,'','7.jpg','2014-08-06 22:03:33'),(8,'生上鲜羊筒骨',68,6,47,0,'','8.jpg','2014-08-06 22:03:33'),(9,'生上鲜羊头',68,6,5,0,'','9.jpg','2014-08-06 22:03:33'),(10,'生上鲜羊肉片',68,6,42,0,'','10.jpg','2014-08-06 22:03:33'),(12,'紫菜汤',148,15,1,4,'经典哦','12.jpg','2014-08-06 22:03:33'),(13,'香浓老火羊骨汤',88,15,4,0,'最爱羊了','13.jpg','2014-08-06 22:03:33'),(14,'筒骨汤',88,15,2,0,'什么东东','14.jpg','2014-08-06 22:03:33'),(15,'石山一品汤',158,15,5,3,'','15.jpg','2014-08-06 21:28:18'),(16,'天麻羊头汤',88,15,4,0,'','16.jpg','2014-08-06 22:03:33'),(17,'海刺猬敏肚鱼翅汤',396,15,5,0,'','17.jpg','2014-08-06 22:03:33'),(18,'当归羊腰盅',26,16,12,0,'大补啊','18.jpg','2014-08-06 22:03:33'),(19,'巴戟杜仲炖羊鞭',26,16,26,0,'呃','19.jpg','2014-08-06 22:03:33'),(20,'天麻羊脑蛊',26,16,71,0,'','20.jpg','2014-08-06 22:03:33'),(21,'羊胎蛊',26,16,50,0,'','21.jpg','2014-08-06 22:03:33'),(22,'红炖农家鹅',288,18,11,0,'','22.jpg','2014-08-06 22:03:33'),(23,'咸菜炒粉丝',26,18,32,0,'','23.jpg','2014-08-06 22:03:33'),(24,'双瓜海螺煲',28,18,76,0,'','24.jpg','2014-08-06 22:03:33'),(25,'花生猪尾煲',48,18,59,0,'','25.jpg','2014-08-06 22:03:33'),(26,'海白地瓜叶煲',28,18,4,0,'','26.jpg','2014-08-06 22:03:33'),(27,'红烧鱼肚',98,18,30,0,'','27.jpg','2014-08-06 22:03:33'),(28,'小炒鱼河虾',38,18,12,0,'','28.jpg','2014-08-06 22:03:33'),(29,'凉瓜炒肉片',26,18,7,0,'','29.jpg','2014-08-06 22:03:33'),(30,'尖椒炒牛肉',32,18,35,0,'','30.jpg','2014-08-06 22:03:33'),(31,'尖椒炒竹笋',22,18,2,0,'','31.jpg','2014-08-06 22:03:33'),(32,'盐焗凤瓜',9,3,6,0,'','32.jpg','2014-08-06 22:03:33'),(33,'响刀拍黄瓜',16,3,7,0,'','33.jpg','2014-08-06 22:03:33'),(34,'洋葱拌木耳',16,3,10,0,'','34.jpg','2014-08-06 22:03:33'),(35,'凉拌羊耳丝',20,3,23,0,'','35.jpg','2014-08-06 22:03:33'),(36,'香炸花生米',9,3,45,0,'','36.jpg','2014-08-06 22:03:33'),(37,'香炸银仔鱼',9,3,7,0,'','37.jpg','2014-08-06 22:03:33'),(38,'老醋酱萝卜',12,3,3,0,'','38.jpg','2014-08-06 22:03:33'),(39,'韭菜',18,4,1,0,'','39.jpg','2014-08-06 22:03:33'),(40,'大白菜',18,4,10,0,'','40.jpg','2014-08-06 22:03:33'),(41,'小白菜',18,4,10,0,'','41.jpg','2014-08-06 22:03:33'),(42,'烫小芥菜',18,4,23,0,'','42.jpg','2014-08-06 22:03:33'),(43,'生菜',18,4,24,0,'','43.jpg','2014-08-06 22:03:33'),(44,'大包',10,5,56,0,'','44.jpg','2014-08-06 22:03:33'),(45,'椰子饭',36,5,68,0,'','45.jpg','2014-08-06 22:03:33'),(46,'五谷杂粮',25,5,12,0,'','46.jpg','2014-08-06 22:03:33'),(47,'广式玉米烙',28,5,24,0,'','47.jpg','2014-08-06 22:03:33'),(48,'黄金大饼',28,5,35,0,'','48.jpg','2014-08-06 22:03:33'),(49,'羊肉腌面',28,5,24,0,'','49.jpg','2014-08-06 22:03:33'),(50,'金银馒头',18,5,10,0,'','50.jpg','2014-08-06 22:03:33'),(51,'炒迷你瓜',38,18,0,2,'迷你的瓜瓜瓜',NULL,'2014-08-06 21:09:43'),(52,'茄子炒豆角',22,18,0,3,'家常菜家常菜',NULL,'2014-08-06 21:09:43'),(56,'羊筋萝卜煲',48,9,0,3,'啦啦啦',NULL,'2014-08-06 21:09:43'),(57,'芝麻羊肉',58,9,0,3,'呃',NULL,'2014-08-06 21:09:43'),(60,'炒羊血',26,9,0,2,'',NULL,'2014-08-06 21:09:43'),(61,'干煸羊杂',48,9,0,3,'无',NULL,'2014-08-06 21:09:43'),(63,'白切羊',68,9,0,0,'',NULL,'2014-08-06 21:09:43'),(64,'羊肉香芋煲',58,9,0,2,'',NULL,'2014-08-06 21:09:43'),(65,'炒羊肚',58,9,0,3,'',NULL,'2014-08-06 21:09:43'),(66,'五香扣羊',68,9,0,1,'',NULL,'2014-08-06 21:09:43'),(67,'煎羊肝',58,9,0,1,'',NULL,'2014-08-06 21:09:43'),(68,'香炸羊肉串',29,9,0,0,'',NULL,'2014-08-06 21:09:43'),(69,'椒盐羊排',58,9,0,0,'',NULL,'2014-08-06 21:09:43'),(70,'竹签羊肉',58,9,0,0,'',NULL,'2014-08-06 21:09:43'),(71,'炒羊腰',58,9,0,0,'',NULL,'2014-08-06 21:09:43'),(72,'凉拌羊耳',20,9,0,0,'',NULL,'2014-08-06 21:09:43'),(73,'羊血',48,6,0,0,'',NULL,'2014-08-06 21:09:43'),(74,'羊肚',48,6,0,0,'',NULL,'2014-08-06 21:09:43'),(75,'羊杂',48,6,0,0,'',NULL,'2014-08-06 21:09:43'),(76,'羊舌',58,6,0,0,'',NULL,'2014-08-06 21:09:43'),(77,'羊心',48,6,0,0,'',NULL,'2014-08-06 21:09:43'),(78,'羊鞭',18,6,0,0,'',NULL,'2014-08-06 21:09:43'),(79,'羊眼睛',4,6,0,0,'',NULL,'2014-08-06 21:09:43'),(80,'羊皮',58,6,0,0,'',NULL,'2014-08-06 21:09:43'),(81,'羊尾',58,6,0,0,'',NULL,'2014-08-06 21:09:43'),(82,'羊粉肠',48,6,0,0,'',NULL,'2014-08-06 21:09:43'),(83,'羊肝',58,6,0,0,'',NULL,'2014-08-06 21:09:43'),(84,'羊脑',58,6,0,0,'',NULL,'2014-08-06 21:09:43'),(85,'羊胎盘',98,6,0,0,'',NULL,'2014-08-06 21:09:43'),(86,'羊腩',68,6,0,0,'',NULL,'2014-08-06 21:09:43'),(87,'羊蹄',58,6,0,0,'',NULL,'2014-08-06 21:09:43'),(88,'羊排',58,6,0,0,'',NULL,'2014-08-06 21:09:43'),(89,'排骨汤',30,15,0,0,'',NULL,'2014-08-06 21:09:43'),(90,'苦瓜汤',18,15,0,5,'',NULL,'2014-08-06 21:09:43'),(91,'西红柿鸡蛋汤',18,15,0,0,'',NULL,'2014-08-06 21:09:43'),(92,'青菜瘦肉汤',0,15,0,0,'',NULL,'2014-08-06 21:09:43'),(93,'凉瓜筒海白汤',30,15,0,0,'',NULL,'2014-08-06 21:09:43'),(94,'白切文昌鸡',53,13,0,2,'',NULL,'2014-08-06 21:09:43'),(95,'白切咸水鸭',68,13,0,1,'',NULL,'2014-08-06 21:09:43'),(96,'化皮BB猪',68,13,0,1,'',NULL,'2014-08-06 21:09:43'),(97,'烧味拼盘',58,13,0,0,'',NULL,'2014-08-06 21:09:43'),(98,'深井烧鹅',68,13,0,0,'',NULL,'2014-08-06 21:09:43'),(99,'卤水拼盘',48,13,0,0,'',NULL,'2014-08-06 21:09:43'),(100,'卤水金钱肚',32,13,0,0,'',NULL,'2014-08-06 21:09:43'),(101,'卤水鸡翅',12,13,0,0,'',NULL,'2014-08-06 21:09:43'),(102,'脆皮乳鸽',38,13,0,0,'',NULL,'2014-08-06 21:09:43'),(103,'卤水鹅头掌拼盘',32,13,0,0,'',NULL,'2014-08-06 21:09:43'),(104,'卤水鹅掌',12,13,0,0,'',NULL,'2014-08-06 21:09:43'),(105,'蜜汁叉烧',48,13,0,0,'',NULL,'2014-08-06 21:09:43'),(106,'卤水鹅头',12,13,0,0,'',NULL,'2014-08-06 21:09:43'),(110,'小米炖秃参',38,14,0,0,'',NULL,'2014-08-06 21:09:43'),(111,'水咸鱼',55,14,0,0,'',NULL,'2014-08-06 21:09:43'),(113,'金钩蒸大白菜',38,14,0,0,'',NULL,'2014-08-06 21:09:43'),(115,'木瓜炖雪蛤 ',38,14,0,0,'',NULL,'2014-08-06 21:09:43'),(116,'燕麦煮鲜鲍',26,14,0,0,'',NULL,'2014-08-06 21:09:43'),(117,'雀根鲜鲍炖干贝',36,14,0,0,'',NULL,'2014-08-06 21:09:43'),(118,'木瓜炖兰香子',28,14,0,0,'',NULL,'2014-08-06 21:09:43'),(119,'鲍汁扒秃参',36,14,0,0,'',NULL,'2014-08-06 21:09:43'),(120,'夏日龟凌膏',18,14,0,0,'',NULL,'2014-08-06 21:09:43'),(121,'鲍汁鹅掌',26,14,0,0,'',NULL,'2014-08-06 21:09:43'),(122,'紫薯兰香子',18,14,0,0,'',NULL,'2014-08-06 21:09:43'),(123,'醋溜土豆丝',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(124,'西芹炒百合',28,18,0,0,'',NULL,'2014-08-06 21:09:43'),(125,'炒土豆丝',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(126,'韭菜炒芒果螺肉',28,18,0,0,'',NULL,'2014-08-06 21:09:43'),(127,'原味西洋菜',26,18,0,0,'',NULL,'2014-08-06 21:09:43'),(128,'尖椒炒土豆丝',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(129,'炒萝卜干',15,18,0,0,'',NULL,'2014-08-06 21:09:43'),(130,'清炒金针菇',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(131,'凉瓜炒肉片',20,18,0,0,'',NULL,'2014-08-06 21:09:43'),(132,'西红柿炒蛋',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(133,'葱花煎蛋',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(134,'西芹炒鱿鱼',28,18,0,0,'',NULL,'2014-08-06 21:09:43'),(135,'榨菜腌花生米',12,18,0,0,'',NULL,'2014-08-06 21:09:43'),(136,'酸笋炒芋梗',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(137,'姜葱炒虾',38,18,0,0,'',NULL,'2014-08-06 21:09:43'),(138,'海味炒五仁',48,18,0,0,'',NULL,'2014-08-06 21:09:43'),(139,'香芹豆腐干',26,18,0,0,'',NULL,'2014-08-06 21:09:43'),(140,'虎皮尖椒',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(141,'天府回锅肉',28,18,0,0,'',NULL,'2014-08-06 21:09:43'),(142,'松仁炒玉米',28,18,0,0,'',NULL,'2014-08-06 21:09:43'),(143,'榄菜炒肉松',20,18,0,0,'',NULL,'2014-08-06 21:09:43'),(144,'酸菜豆腐干',20,18,0,0,'',NULL,'2014-08-06 21:09:43'),(145,'五花肉炒石山豆腐',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(146,'豆芽炒粉丝',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(147,'大蒜炒咸肉',24,18,0,0,'',NULL,'2014-08-06 21:09:43'),(148,'苦瓜炒蛋',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(149,'炒五花肉',25,18,0,0,'',NULL,'2014-08-06 21:09:43'),(150,'腐竹炒粉丝',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(151,'凉瓜炒肉片',26,18,0,0,'',NULL,'2014-08-06 21:09:43'),(152,'全家福',38,18,0,0,'',NULL,'2014-08-06 21:09:43'),(153,'尖椒炒太阳螺',48,18,0,0,'',NULL,'2014-08-06 21:09:43'),(154,'炒榨菜',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(155,'红烧海参',58,18,0,0,'',NULL,'2014-08-06 21:09:43'),(156,'酸菜炒荞头',26,18,0,0,'',NULL,'2014-08-06 21:09:43'),(157,'尖椒炒肉片',28,18,0,0,'',NULL,'2014-08-06 21:09:43'),(158,'家乡焖凉瓜',26,18,0,0,'',NULL,'2014-08-06 21:09:43'),(159,'豆豉鳞鱼蒸石山豆腐',25,18,0,0,'',NULL,'2014-08-06 21:09:43'),(160,'西瓜仔炒芒果螺肉',28,18,0,0,'',NULL,'2014-08-06 21:09:43'),(161,'淮山木耳炒百合',28,18,0,0,'',NULL,'2014-08-06 21:09:43'),(162,'西芹百合炒腰果',28,18,0,0,'',NULL,'2014-08-06 21:09:43'),(163,'韭菜虾米炒粉丝',20,18,0,0,'',NULL,'2014-08-06 21:09:43'),(164,'农家炒四蔬',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(165,'芥兰炒牛肉',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(166,'洋葱炒粉丝',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(167,'青椒洋葱炒鱿鱼干',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(168,'鱿鱼丝虾米炒粉丝',38,18,0,0,'',NULL,'2014-08-06 21:09:43'),(169,'荞头炒豆腐干',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(170,'韭菜炒鸡蛋',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(171,'酸菜炒粉丝',26,18,0,0,'',NULL,'2014-08-06 21:09:43'),(172,'淮山炒木耳',28,18,0,0,'',NULL,'2014-08-06 21:09:43'),(173,'萝卜干煎蛋',20,18,0,0,'',NULL,'2014-08-06 21:09:43'),(174,'尖椒炒竹笋',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(175,'百合炒腰果',48,18,0,0,'',NULL,'2014-08-06 21:09:43'),(176,'肉丝炒榨菜',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(177,'干煸豆角',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(178,'韭菜炒虾米',20,18,0,0,'',NULL,'2014-08-06 21:09:43'),(179,'鱿鱼炒苦瓜',20,18,0,0,'',NULL,'2014-08-06 21:09:43'),(180,'麻婆豆腐',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(181,'葱花煎蛋',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(182,'豆腐焖葫芦瓜',25,18,0,0,'',NULL,'2014-08-06 21:09:43'),(183,'碧绿掌中宝',52,18,0,0,'',NULL,'2014-08-06 21:09:43'),(184,'尖椒炒扇贝',28,18,0,0,'',NULL,'2014-08-06 21:09:43'),(185,'青瓜炒苦瓜',22,18,0,0,'',NULL,'2014-08-06 21:09:43'),(186,'铁板鱿鱼筒',58,20,0,0,'','186.jpg','2014-08-06 21:30:09'),(187,'铁板黑椒牛肉',42,20,0,0,'',NULL,'2014-08-06 21:09:43'),(188,'铁板黄鳝片',48,20,0,0,'',NULL,'2014-08-06 21:09:43'),(189,'铁板海参',58,20,0,0,'',NULL,'2014-08-06 21:09:43'),(190,'铁板鲜鱿鱼',48,20,0,0,'',NULL,'2014-08-06 21:09:43'),(191,'铁板烧汁茄子',25,20,0,0,'',NULL,'2014-08-06 21:09:43'),(192,'铁板生蚝',38,20,0,0,'',NULL,'2014-08-06 21:09:43'),(193,'铁板豆腐',25,20,0,0,'',NULL,'2014-08-06 21:09:43'),(194,'酸菜豆腐煲',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(195,'花生猪尾煲',48,21,0,0,'',NULL,'2014-08-06 21:09:43'),(196,'虾米粉丝煲',22,21,0,0,'',NULL,'2014-08-06 21:09:43'),(197,'豆角煲',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(198,'空心菜海白煲',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(199,'剑肠酸笋煲',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(200,'五花肉咸鱼豆腐煲',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(201,'酸菜海白煲',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(202,'地瓜梗五花肉煲',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(203,'海南斋菜煲',26,21,0,0,'',NULL,'2014-08-06 21:09:43'),(204,'咸鱼茄子煲',26,21,0,0,'',NULL,'2014-08-06 21:09:43'),(205,'海白西瓜皮煲',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(206,'丝瓜青瓜海白褒',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(207,'鲜笋芋梗海白煲',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(208,'水芹海白煲',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(209,'咸鱼五花肉煲',32,21,0,0,'',NULL,'2014-08-06 21:09:43'),(210,'地瓜叶肉丝海白煲',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(211,'鲍汁红腰豆',28,21,0,0,'',NULL,'2014-08-06 21:09:43'),(212,'花虾',188,23,0,0,'',NULL,'2014-08-06 21:09:43'),(213,'大龙虾',368,23,0,0,'',NULL,'2014-08-06 21:09:43'),(214,'蓝尾虾',188,23,0,0,'',NULL,'2014-08-06 21:09:43'),(215,'基围虾',68,23,0,0,'',NULL,'2014-08-06 21:09:43'),(216,'富贵虾',118,23,0,0,'',NULL,'2014-08-06 21:09:43'),(217,'冰大白虾',158,23,0,0,'',NULL,'2014-08-06 21:09:43'),(218,'中龙虾',268,23,0,0,'',NULL,'2014-08-06 21:09:43'),(219,'罗土虾',78,23,0,0,'',NULL,'2014-08-06 21:09:43'),(220,'白虾',88,23,0,0,'',NULL,'2014-08-06 21:09:43'),(221,'大角虾',198,23,0,0,'',NULL,'2014-08-06 21:09:43'),(222,'琵琶虾',108,23,0,0,'',NULL,'2014-08-06 21:09:43'),(223,'中角虾',168,23,0,0,'',NULL,'2014-08-06 21:09:43'),(224,'麻虾',168,23,0,0,'',NULL,'2014-08-06 21:09:43'),(225,'大花虾',198,23,0,0,'',NULL,'2014-08-06 21:09:43'),(226,'中角虾',168,23,0,0,'',NULL,'2014-08-06 21:09:43'),(227,'冰红角虾',138,23,0,0,'',NULL,'2014-08-06 21:09:43'),(228,'剪刀螺',28,24,0,0,'',NULL,'2014-08-06 21:09:43'),(229,'小芒果螺',18,24,0,0,'',NULL,'2014-08-06 21:09:43'),(230,'毛螺',18,24,0,0,'',NULL,'2014-08-06 21:09:43'),(231,'鸡蛋螺',38,24,0,0,'',NULL,'2014-08-06 21:09:43'),(232,'芒果螺',58,24,0,0,'',NULL,'2014-08-06 21:09:43'),(233,'血螺',28,24,0,0,'',NULL,'2014-08-06 21:09:43'),(234,'圣指螺',38,24,0,0,'',NULL,'2014-08-06 21:09:43'),(235,'盘螺',38,24,0,0,'',NULL,'2014-08-06 21:09:43'),(236,'顶心螺',48,24,0,0,'',NULL,'2014-08-06 21:09:43'),(237,'花螺',88,24,0,0,'',NULL,'2014-08-06 21:09:43'),(238,'红口螺',38,24,0,0,'',NULL,'2014-08-06 21:09:43'),(239,'鸡腿螺',38,24,0,0,'',NULL,'2014-08-06 21:09:43'),(240,'带子',10,24,0,0,'',NULL,'2014-08-06 21:09:43'),(241,'生蚝',13,24,0,0,'',NULL,'2014-08-06 21:09:43'),(242,'生蚝肉`',38,24,0,0,'',NULL,'2014-08-06 21:09:43'),(243,'象拔蚌',15,24,0,0,'',NULL,'2014-08-06 21:09:43'),(244,'大海白',28,24,0,0,'',NULL,'2014-08-06 21:09:43'),(245,'小海白',28,24,0,0,'',NULL,'2014-08-06 21:09:43'),(246,'排海',28,24,0,0,'',NULL,'2014-08-06 21:09:43'),(247,'响螺',28,24,0,0,'',NULL,'2014-08-06 21:09:43'),(248,'富贵螺',28,24,0,0,'',NULL,'2014-08-06 21:09:43'),(249,'油螺',68,24,0,0,'',NULL,'2014-08-06 21:09:43'),(250,'蒜茸蒸带子（特价3个）',10,24,0,0,'',NULL,'2014-08-06 21:09:43'),(251,'扇贝',18,24,0,0,'',NULL,'2014-08-06 21:09:43'),(252,'小鲍鱼',88,24,0,0,'',NULL,'2014-08-06 21:09:43'),(253,'大象拔蚌',480,24,0,0,'',NULL,'2014-08-06 21:09:43'),(254,'珍珠螺',48,24,0,0,'',NULL,'2014-08-06 21:09:43'),(255,'肉蚧',88,24,0,0,'',NULL,'2014-08-06 21:09:43'),(256,'油螺',68,24,0,0,'',NULL,'2014-08-06 21:09:43'),(257,'太阳螺',48,24,0,0,'',NULL,'2014-08-06 21:09:43'),(258,'三班鱼',38,25,0,1,'','258.jpg','2014-08-07 03:41:30'),(259,'冰红立鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(260,'油洛鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(261,'金铃鱼',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(262,'扒皮仓',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(263,'大红立鱼',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(264,'海立鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(265,'白仓鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(266,'冰白仓',198,25,0,0,'',NULL,'2014-08-06 21:09:43'),(267,'茂公鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(268,'海甘仓鱼',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(269,'小水鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(270,'大水鱼',148,25,0,0,'',NULL,'2014-08-06 21:09:43'),(271,'黄骨鱼',38,25,0,0,'',NULL,'2014-08-06 21:09:43'),(272,'左口鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(273,'沙尖鱼',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(274,'大士龙',168,25,0,0,'',NULL,'2014-08-06 21:09:43'),(275,'中士龙',188,25,0,0,'',NULL,'2014-08-06 21:09:43'),(276,'大石斑鱼',88,25,0,0,'',NULL,'2014-08-06 21:09:43'),(277,'小石斑鱼',88,25,0,0,'',NULL,'2014-08-06 21:09:43'),(278,'野白鳝鱼',128,25,0,0,'',NULL,'2014-08-06 21:09:43'),(279,'小立鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(280,'立鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(281,'白骨鱼',38,25,0,0,'',NULL,'2014-08-06 21:09:43'),(282,'红立鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(283,'多宝鱼',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(284,'红友鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(285,'剑槽鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(286,'白鳝鱼',128,25,0,0,'',NULL,'2014-08-06 21:09:43'),(287,'马鲛鱼',78,25,0,0,'',NULL,'2014-08-06 21:09:43'),(288,'红炖大水鱼',148,25,0,0,'',NULL,'2014-08-06 21:09:43'),(289,'黄花鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(290,'小冰白仓鱼',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(291,'油追鱼',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(292,'大红立鱼',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(293,'刺鲍鲍',118,25,0,0,'',NULL,'2014-08-06 21:09:43'),(294,'粉鳝',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(295,'大鱿鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(296,'小鱿鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(297,'龙胆鱼',98,25,0,0,'',NULL,'2014-08-06 21:09:43'),(298,'中白仓',128,25,0,0,'',NULL,'2014-08-06 21:09:43'),(299,'百花鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(300,'英仓鱼',38,25,0,0,'',NULL,'2014-08-06 21:09:43'),(301,'海甘仓鱼头',38,25,0,0,'',NULL,'2014-08-06 21:09:43'),(302,'金仓鱼',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(303,'白沙虫肉',158,25,0,0,'',NULL,'2014-08-06 21:09:43'),(304,'金骨鱼',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(305,'花仓鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(306,'血鳝',138,25,0,0,'',NULL,'2014-08-06 21:09:43'),(307,'大藕鱼',158,25,0,0,'',NULL,'2014-08-06 21:09:43'),(308,'中藕鱼',98,25,0,0,'',NULL,'2014-08-06 21:09:43'),(309,'拔皮鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(310,'冰清衣鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(311,'脆皖鱼',280,25,0,0,'',NULL,'2014-08-06 21:09:43'),(312,'三班鱼',38,25,0,0,'',NULL,'2014-08-06 21:09:43'),(313,'鲤鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(314,'大青衣鱼',78,25,0,0,'',NULL,'2014-08-06 21:09:43'),(315,'海蛇',198,25,0,0,'',NULL,'2014-08-06 21:09:43'),(316,'红心鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(317,'丹青班',158,25,0,0,'',NULL,'2014-08-06 21:09:43'),(318,'老虎斑',118,25,0,0,'',NULL,'2014-08-06 21:09:43'),(319,'石头班',138,25,0,0,'',NULL,'2014-08-06 21:09:43'),(320,'海狗沙',88,25,0,0,'',NULL,'2014-08-06 21:09:43'),(321,'麻鱼',38,25,0,0,'',NULL,'2014-08-06 21:09:43'),(322,'敏鱼',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(323,'帖石鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(324,'杂鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(325,'尤鱼简',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(326,'开刀大青斑',78,25,0,0,'',NULL,'2014-08-06 21:09:43'),(327,'带鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(328,'黄蛙',38,25,0,0,'',NULL,'2014-08-06 21:09:43'),(329,'山瑞',198,25,0,0,'',NULL,'2014-08-06 21:09:43'),(330,'中冰白仓鱼',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(331,'桂花鱼',58,25,0,0,'',NULL,'2014-08-06 21:09:43'),(332,'大冰石斑',68,25,0,0,'',NULL,'2014-08-06 21:09:43'),(333,'水尖鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(334,'海里鱼',48,25,0,0,'',NULL,'2014-08-06 21:09:43'),(335,'淮枣炖羊肉松盅',26,16,0,0,'',NULL,'2014-08-06 21:09:43'),(336,'馒头',9,5,0,0,'',NULL,'2014-08-06 21:09:43'),(337,'腌海南粉',20,5,0,0,'',NULL,'2014-08-06 21:09:43'),(338,'青菜肉丝炒珠江面',18,5,0,0,'',NULL,'2014-08-06 21:09:43'),(339,'蛋炒饭',18,5,0,0,'',NULL,'2014-08-06 21:09:43'),(340,'长寿面',28,5,0,0,'',NULL,'2014-08-06 21:09:43'),(341,'白米粥',12,5,0,0,'',NULL,'2014-08-06 21:09:43'),(342,'石山糯米糕',25,5,0,0,'',NULL,'2014-08-06 21:09:43'),(343,'白菜猪肉饺',25,5,0,0,'',NULL,'2014-08-06 21:09:43'),(344,'菠菜包',10,5,0,0,'',NULL,'2014-08-06 21:09:43'),(345,'珠江面',5,5,0,0,'',NULL,'2014-08-06 21:09:43'),(346,'青菜炒珠江面',18,5,0,0,'',NULL,'2014-08-06 21:09:43'),(347,'瘦肉粥',12,5,0,0,'',NULL,'2014-08-06 21:09:43'),(348,'扬州炒饭',18,5,0,0,'',NULL,'2014-08-06 21:09:43'),(349,'青菜瘦肉粥',12,5,0,0,'',NULL,'2014-08-06 21:09:43'),(350,'手擀面',28,5,0,0,'',NULL,'2014-08-06 21:09:43'),(351,'韭菜猪肉饺',25,5,0,0,'',NULL,'2014-08-06 21:09:43'),(352,'长寿面(送)',1,5,0,0,'',NULL,'2014-08-06 21:09:43'),(353,'冬瓜海白汤',28,15,0,2,'',NULL,'2014-08-06 21:09:43');
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_category`
--

DROP TABLE IF EXISTS `dish_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dish_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `display_order` int(11) DEFAULT '0',
  `dish_count` int(11) NOT NULL DEFAULT '0' COMMENT '下属菜品数量',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父类型ID',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_category`
--

LOCK TABLES `dish_category` WRITE;
/*!40000 ALTER TABLE `dish_category` DISABLE KEYS */;
INSERT INTO `dish_category` VALUES (1,'汤类、炖盅',2,17,0,'2014-08-08 07:14:03'),(5,'果汁、主食',7,24,0,'2014-08-07 03:12:01'),(6,'生上羊',2,20,8,'2014-08-07 03:12:08'),(8,'羊肉',1,40,0,'2014-08-08 07:14:01'),(9,'熟羊',9,20,8,'2014-08-07 03:12:15'),(13,'烧腊档',10,13,17,'2014-08-07 03:12:19'),(14,'粤菜',11,11,17,'2014-08-07 03:12:24'),(15,'靓汤',0,12,1,'2014-08-07 03:12:25'),(16,'炖盅',0,5,1,'2014-08-07 03:12:31'),(17,'烧腊、粤菜',3,14,0,'2014-08-08 07:14:04'),(18,'小炒',4,75,0,'2014-08-08 07:14:04'),(19,'铁板、煲仔',5,26,0,'2014-08-08 07:14:06'),(20,'铁板',0,8,19,'2014-08-07 03:12:44'),(21,'煲仔',0,18,19,'2014-08-07 03:12:51'),(22,'海鲜',6,123,0,'2014-08-08 07:14:06'),(23,'虾',0,16,22,'2014-08-07 03:12:57'),(24,'螺',0,30,22,'2014-08-07 03:13:03'),(25,'鱼',0,77,22,'2014-08-07 03:13:15');
/*!40000 ALTER TABLE `dish_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_keyword`
--

DROP TABLE IF EXISTS `search_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(50) DEFAULT NULL,
  `hot` int(1) DEFAULT '0' COMMENT '热门搜索词标识，0为非热门，1为热门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_keyword`
--

LOCK TABLES `search_keyword` WRITE;
/*!40000 ALTER TABLE `search_keyword` DISABLE KEYS */;
INSERT INTO `search_keyword` VALUES (1,'羊肉',1),(2,'鱼肉',0),(3,'牛肉',0),(4,'猪肉',0),(5,'蛋',0);
/*!40000 ALTER TABLE `search_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taste`
--

DROP TABLE IF EXISTS `taste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taste`
--

LOCK TABLES `taste` WRITE;
/*!40000 ALTER TABLE `taste` DISABLE KEYS */;
INSERT INTO `taste` VALUES (1,'蒜蓉炒'),(2,'清炒'),(3,'醋溜'),(4,'虾酱'),(5,'清蒸'),(6,'蒜蓉蒸'),(7,'蒜蓉粉丝蒸'),(8,'锡纸蒸'),(9,'椒盐'),(10,'香煎'),(11,'炸');
/*!40000 ALTER TABLE `taste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT '4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e',
  `usernamecn` varchar(50) DEFAULT NULL,
  `open_id` varchar(50) DEFAULT NULL,
  `enabled` int(1) NOT NULL,
  `internal` int(1) DEFAULT '0',
  `up_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e','管理员','',1,1,NULL),('ganhaitian','4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e','甘工',' ',1,1,NULL),('liuzhijie','4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e','刘志杰','',1,1,NULL),('odBuXjgh8F9pw21GmtniEovxxlqg','4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e',NULL,NULL,1,0,NULL),('odBuXjiaF3-fU3NT1otI_vGRqTdk','4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e',NULL,NULL,1,0,NULL),('odBuXjkKSQc5xjKUtVU6eFmVSnw8','4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e',NULL,NULL,1,0,NULL),('odBuXjpbqvL6UFHtYvHOooIaDeGA','4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e',NULL,NULL,1,0,NULL),('odBuXjqS1G_K9mRWKDuHvNwpRuK0','4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e',NULL,NULL,1,0,NULL),('odBuXjrZFXJaiio_caMj9mwEPrXU','4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e',NULL,NULL,1,0,NULL),('odBuXjuMPggIr5wLATznLLol7ch4','4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e',NULL,NULL,1,0,NULL),('stuff3',NULL,'员工丙','',1,1,NULL),('wangdaopeng','4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e','王道鹏','',1,1,NULL);
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

-- Dump completed on 2014-08-08 19:07:41
