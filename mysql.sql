-- MySQL dump 10.13  Distrib 5.1.61, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: myschool
-- ------------------------------------------------------
-- Server version	5.1.61-0ubuntu0.11.10.1

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
-- Table structure for table `class_level`
--

DROP TABLE IF EXISTS `class_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `discription` varchar(45) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_level`
--

LOCK TABLES `class_level` WRITE;
/*!40000 ALTER TABLE `class_level` DISABLE KEYS */;
INSERT INTO `class_level` VALUES (1,'快乐思维','Please note that the whole 2.7.x series of ve',1),(2,'自然拼音','One of the most common questions we keep hear',2),(3,'一阶','After a year of work new versions of GEGL, ne',3),(4,'二阶','北京教育考试院 | 北京市民讲外语办公室 | 中国青少年宫协会 | 全国青少年全能王系列展',4),(5,'三阶','海淀区联 想 桥82121556/82121559都市网景82121556/8212155',5),(6,'四阶','3T二三综合班	16次	杨旭	广渠门	1680元	查看详细\n中考冲刺提高班	15次	王巍	',6),(7,'五阶','杰睿黄寺教学区开课有礼喽 杰睿白云桥教学点重磅优惠 杰睿两校区春季开班优惠啦公主坟勇闯冒险',7);
/*!40000 ALTER TABLE `class_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_group`
--

DROP TABLE IF EXISTS `code_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_group_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_group`
--

LOCK TABLES `code_group` WRITE;
/*!40000 ALTER TABLE `code_group` DISABLE KEYS */;
INSERT INTO `code_group` VALUES (1,'search_condition'),(2,'children'),(3,'information_type');
/*!40000 ALTER TABLE `code_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_table`
--

DROP TABLE IF EXISTS `code_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(255) DEFAULT NULL,
  `code_value` varchar(5000) DEFAULT NULL,
  `discription` varchar(5000) DEFAULT NULL,
  `parent_code` int(11) DEFAULT '0',
  `state` varchar(45) DEFAULT NULL,
  `code_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_code_table_code_group1` (`code_group_id`),
  CONSTRAINT `fk_code_table_code_group1` FOREIGN KEY (`code_group_id`) REFERENCES `code_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_table`
--

LOCK TABLES `code_table` WRITE;
/*!40000 ALTER TABLE `code_table` DISABLE KEYS */;
INSERT INTO `code_table` VALUES (10,'lesson_time_type','寒假班',NULL,0,'Active',1),(11,'lesson_time_type','春季班',NULL,0,'Active',1),(12,'lesson_time_type','暑期班',NULL,0,'Active',1),(13,'lesson_time_type','秋季班',NULL,0,'Active',1),(14,'lesson_type','英语',NULL,0,'Active',1),(15,'lesson_type','数学',NULL,0,'Active',1),(16,'collection','少儿系列',NULL,0,'Active',1),(17,'collection','小升初系列',NULL,0,'Active',1),(23,'sub_collection','自然拼音',NULL,16,'Active',2),(24,'sub_collection','快乐思维',NULL,16,'Active',2),(25,'sub_collection','小升初基础',NULL,17,'Active',2),(26,'sub_collection','小升初提高',NULL,17,'Active',2),(27,'sub_collection','小升初强化',NULL,17,'Active',2),(28,'sub_collection','小升初冲刺',NULL,17,'Active',2),(36,'information_type','sale','优惠信息',0,'Active',NULL),(37,'information_type','main','新闻',0,'Active',NULL),(38,'information_type','notice','通知',0,'Active',NULL);
/*!40000 ALTER TABLE `code_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `count_log`
--

DROP TABLE IF EXISTS `count_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `count_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `ipaddress` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `count_log`
--

LOCK TABLES `count_log` WRITE;
/*!40000 ALTER TABLE `count_log` DISABLE KEYS */;
INSERT INTO `count_log` VALUES (1,'GUEST','127.0.0.1','2012-03-13 09:01:12'),(2,'GUEST','109.105.4.146','2012-03-13 09:01:12'),(3,'GUEST','109.105.4.146','2012-03-13 08:52:11'),(4,NULL,NULL,'2012-03-14 09:55:07'),(5,NULL,NULL,'2012-03-17 07:52:22'),(6,NULL,NULL,'2012-03-20 01:28:38'),(7,'GUEST','127.0.0.1','2012-03-20 01:31:34'),(8,'GUEST','127.0.0.1','2012-03-21 07:11:46');
/*!40000 ALTER TABLE `count_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `removed_at` timestamp NULL DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `main_tag` varchar(45) DEFAULT NULL,
  `view_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information`
--

LOCK TABLES `information` WRITE;
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` VALUES (1,'sale1','sale1ccccccc','sale','2012-03-09 03:12:53',NULL,'Active',NULL,0),(2,'sale2','sale1ccccccc','sale','2012-03-09 03:12:53',NULL,'Active',NULL,0),(3,'sale3','sale1ccccccc','sale','2012-03-09 03:12:53',NULL,'Active',NULL,0),(4,'sale4','sale1ccccccc','sale','2012-03-09 03:12:53',NULL,'Active',NULL,0),(5,'sale5','sale1ccccccc','sale','2012-03-09 03:12:53',NULL,'Active',NULL,0),(6,'sale6','sale1ccccccc','sale','2012-03-09 03:12:53',NULL,'Active',NULL,0),(7,'sale7','sale1ccccccc','sale','2012-03-09 03:12:53',NULL,'Active',NULL,0),(8,'sale8','sale1ccccccc','sale','2012-03-09 03:12:53',NULL,'Active',NULL,0),(9,'the first news in the main page','sale1ccccccc','first','2012-03-09 03:12:53',NULL,'Active',NULL,0),(10,'main page news 1',NULL,'main','2012-03-21 07:20:08',NULL,'Active','资讯',0),(11,'main page news 2',NULL,'main','2012-03-21 07:20:08',NULL,'Active','资讯',0),(12,'main page news 3',NULL,'main','2012-03-21 07:20:08',NULL,'Active','资讯',0),(13,'main page news 4',NULL,'main','2012-03-21 07:20:08',NULL,'Active','myschool',0),(14,'main page news 5',NULL,'main','2012-03-21 07:20:08',NULL,'Active','myschool',0),(15,'main page news 6',NULL,'main','2012-03-09 06:18:25',NULL,'Active',NULL,0),(16,'main page news 7',NULL,'main','2012-03-21 07:20:16',NULL,'Active','myschool',0),(17,'main page news 8',NULL,'main','2012-03-09 06:18:25',NULL,'Active',NULL,0);
/*!40000 ALTER TABLE `information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information_log`
--

DROP TABLE IF EXISTS `information_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(45) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `information_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_information_log_information1` (`information_id`),
  CONSTRAINT `fk_information_log_information1` FOREIGN KEY (`information_id`) REFERENCES `information` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information_log`
--

LOCK TABLES `information_log` WRITE;
/*!40000 ALTER TABLE `information_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `information_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lesson_time_type` varchar(45) DEFAULT NULL,
  `lesson_type` varchar(45) DEFAULT NULL,
  `collection` varchar(255) DEFAULT NULL,
  `sub_collection` varchar(255) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `start_time` varchar(45) DEFAULT NULL,
  `end_time` varchar(45) DEFAULT NULL,
  `discription` varchar(5000) DEFAULT NULL,
  `student_num` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `school_id` bigint(20) NOT NULL,
  `teacher_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lesson_school1` (`school_id`),
  KEY `fk_lesson_teacher1` (`teacher_id`),
  CONSTRAINT `fk_lesson_school1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lesson_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(2,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(3,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(4,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(5,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(6,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(7,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(8,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(9,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(10,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(11,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(12,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(13,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1),(14,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_table`
--

DROP TABLE IF EXISTS `lesson_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lesson_date` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `lesson_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lesson_table_lesson1` (`lesson_id`),
  CONSTRAINT `fk_lesson_table_lesson1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_table`
--

LOCK TABLES `lesson_table` WRITE;
/*!40000 ALTER TABLE `lesson_table` DISABLE KEYS */;
INSERT INTO `lesson_table` VALUES (1,'第1课','2012-03-05','Finish',1),(2,'第2课','2012-03-05','Finish',1),(3,'第3课','2012-03-05','Finish',1),(4,'第3课','2012-03-05','Active',1),(5,'第3课','2012-03-05','Active',1),(6,'第3课','2012-03-05','Active',1),(7,'第3课','2012-03-05','Finish',1),(8,'第3课','2012-03-05','Active',1),(9,'第3课','2012-03-05','Active',1),(10,'第3课','2012-03-05','Active',1),(11,'第3课','2012-03-05','Active',1),(12,'第3课','2012-03-05','Active',1),(13,'第3课','2012-03-05','Active',1),(14,'第3课','2012-03-05','Active',1),(15,'第3课','2012-03-05','Active',1),(16,'第3课','2012-03-05','Active',1),(17,'第3课','2012-03-05','Active',1);
/*!40000 ALTER TABLE `lesson_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `discription` varchar(5000) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'沈阳校区','沈阳的一个店铺','123456789',NULL,'沈阳的一个店铺沈阳的一个店铺沈阳的一个店铺233333','Active');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lesson_id` bigint(20) NOT NULL,
  `teacher_id` bigint(20) NOT NULL,
  `information_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tags_lesson1` (`lesson_id`),
  KEY `fk_tags_teacher1` (`teacher_id`),
  KEY `fk_tags_information1` (`information_id`),
  CONSTRAINT `fk_tags_information1` FOREIGN KEY (`information_id`) REFERENCES `information` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_lesson1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `graduate_school` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `removed_at` timestamp NULL DEFAULT NULL,
  `img` varchar(512) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `big_img` varchar(512) DEFAULT NULL,
  `x150_img` varchar(512) DEFAULT NULL,
  `school_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teacher_school1` (`school_id`),
  CONSTRAINT `fk_teacher_school1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='base teacher table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'第一个人',11,'北大','2012-03-05 10:14:11','2012-03-01 07:52:43','an_yuhuan.jpg','main','t1.jpg','t1.png',1),(2,'b',12,'wdw','2012-03-05 10:14:11',NULL,'bai_yongjun.jpg','main','b0029488_892359.jpg','t2.jpg',1),(3,'c',34,'rtttt','2012-03-05 10:14:11',NULL,'chen_guixian.jpg','main',NULL,'t3.jpg',1),(4,'不叫就',22,'北京外国语大学','2012-03-05 10:14:11',NULL,'chen_jiannan.jpg','main',NULL,'t4.jpg',1),(5,'你妹妹啊',44,'北京外国语大学','2012-03-05 10:14:11',NULL,'chen_mei.jpg','main',NULL,NULL,1),(6,'woqugehsd',33,'北京师范大学','2012-03-05 10:14:11',NULL,'chen_rijian.jpg','main',NULL,NULL,1),(7,'nb的大头想',11,'北京师范大学','2012-03-05 10:14:11',NULL,'gao_yanli.jpg','big',NULL,NULL,1),(8,'wdddddd',55,'清华','2012-03-05 10:14:15',NULL,'chen_xuebing.jpg','main',NULL,NULL,1);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_detail`
--

DROP TABLE IF EXISTS `teacher_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_type` varchar(255) DEFAULT NULL,
  `en_name` varchar(255) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `education` varchar(45) DEFAULT NULL,
  `bloodtype` varchar(2) DEFAULT NULL,
  `birthday` varchar(45) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `interest` varchar(255) DEFAULT NULL,
  `favorite_color` varchar(45) DEFAULT NULL,
  `favorite_sport` varchar(45) DEFAULT NULL,
  `favorite_animal` varchar(45) DEFAULT NULL,
  `favorite_place` varchar(45) DEFAULT NULL,
  `teacher_word` varchar(45) DEFAULT NULL,
  `adore_man` varchar(45) DEFAULT NULL,
  `sammary` varchar(5000) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `qq` varchar(45) DEFAULT NULL,
  `weibo` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `household` varchar(45) DEFAULT NULL,
  `teacher_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teacher_detail_teacher1` (`teacher_id`),
  CONSTRAINT `fk_teacher_detail_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_detail`
--

LOCK TABLES `teacher_detail` WRITE;
/*!40000 ALTER TABLE `teacher_detail` DISABLE KEYS */;
INSERT INTO `teacher_detail` VALUES (4,'3T,快乐思维','anna','女','本科','o','1985-05-05',160,'吃饭','红色','睡觉','笨笨','荷兰',NULL,'张博瀚',' 杰睿英语教师，曾教授过《新概念英语》等课程。熟悉历年中考题型，擅于把握考点，授课讲究循序渐进，对重要知识点进行有层次有条理的着重讲解，同时也不忽略对基础知识的铺垫，从而使学生能牢固掌握重点难点。对学生要求严格，但也不失风趣幽默，时常在课堂上引用一些西方文化的片段来调节课堂气氛，同时也让学生了解更多与英语有关的知识。','',NULL,NULL,NULL,'朝阳区','辽宁',1);
/*!40000 ALTER TABLE `teacher_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `removed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'unknow suer','123','123@gmail.com',12,'new  york',NULL,'2012-02-29 03:41:32',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_times` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_log_user` (`user_id`),
  CONSTRAINT `fk_user_log_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` VALUES (7,2,1);
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-03-21 16:25:14
