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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `oldprice` int(11) DEFAULT '0',
  `image` varchar(45) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `lesson_system_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_book_lesson_system1` (`lesson_system_id`),
  KEY `FK2E3AE9B4A7B18F` (`lesson_system_id`),
  CONSTRAINT `FK2E3AE9B4A7B18F` FOREIGN KEY (`lesson_system_id`) REFERENCES `lesson_system` (`id`),
  CONSTRAINT `fk_book_lesson_system1` FOREIGN KEY (`lesson_system_id`) REFERENCES `lesson_system` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_user`
--

DROP TABLE IF EXISTS `book_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_user` (
  `book_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  KEY `FK78B0D36153AB523E` (`book_id`),
  KEY `FK78B0D36147140EFE` (`user_id`),
  CONSTRAINT `FK78B0D36147140EFE` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK78B0D36153AB523E` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_user`
--

LOCK TABLES `book_user` WRITE;
/*!40000 ALTER TABLE `book_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_level`
--

DROP TABLE IF EXISTS `class_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `discription` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_level`
--

LOCK TABLES `class_level` WRITE;
/*!40000 ALTER TABLE `class_level` DISABLE KEYS */;
INSERT INTO `class_level` VALUES (1,'Please note that the whole 2.7.x series of ve',1,'快乐思维'),(2,'One of the most common questions we keep hear',2,'自然拼音'),(3,'After a year of work new versions of GEGL, ne',3,'一阶'),(4,'北京教育考试院 | 北京市民讲外语办公室 | 中国青少年宫协会 | 全国青少年全能王系列展',4,'二阶'),(5,'海淀区联 想 桥82121556/82121559都市网景82121556/8212155',5,'三阶'),(6,'3T二三综合班16次杨旭广渠门1680元查看详细\n中考冲刺提高班15次王巍',6,'四阶'),(7,'杰睿黄寺教学区开课有礼喽 杰睿白云桥教学点重磅优惠 杰睿两校区春季 开班优惠啦公主坟勇闯冒险',7,'五阶');
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
  `created_at` datetime DEFAULT NULL,
  `ipaddress` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `count_log`
--

LOCK TABLES `count_log` WRITE;
/*!40000 ALTER TABLE `count_log` DISABLE KEYS */;
INSERT INTO `count_log` VALUES (1,'0000-00-00 00:00:00','127.0.0.1','2012-03-13 09:01:12'),(2,'0000-00-00 00:00:00','109.105.4.146','2012-03-13 09:01:12'),(3,'0000-00-00 00:00:00','109.105.4.146','2012-03-13 08:52:11'),(4,NULL,NULL,'2012-03-14 09:55:07'),(5,NULL,NULL,'2012-03-17 07:52:22'),(6,NULL,NULL,'2012-03-20 01:28:38'),(7,'0000-00-00 00:00:00','127.0.0.1','2012-03-20 01:31:34'),(8,'0000-00-00 00:00:00','127.0.0.1','2012-03-21 07:11:46'),(9,'0000-00-00 00:00:00','127.0.0.1','2012-03-22 00:36:57'),(10,'0000-00-00 00:00:00','127.0.0.1','2012-03-26 10:10:58'),(11,'0000-00-00 00:00:00','127.0.0.1','2012-03-27 01:57:27');
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
  `resource` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_information_user1` (`user_id`),
  KEY `FK7556752C47140EFE` (`user_id`),
  CONSTRAINT `FK7556752C47140EFE` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_information_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information`
--

LOCK TABLES `information` WRITE;
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` VALUES (1,'博苗教育三八节致信','<p>  你们的辛苦和努力的工作我看在眼里、感在心上。\n \n    在这个属于你们的日子里，我代表所有的杰睿人把最美丽的祝福送给你们，祝你们和你们的家人们快乐、健康、幸福每一天！\n \n    为了让所有的杰睿人在杰睿这个大家庭里感到温 馨、温暖、幸福，为了我们的家，我，还有杰睿 总监团校长团的成员们一直在努力！</p><input type=\"image\" height=\"360\" width=\"480\" src=\"http://imgcache.3tedu.com.cn/image/2012/03/201203081258003.jpg\">','main','2012-03-30 02:38:33',NULL,'Active',NULL,0,'http://www.miaoedu.net',NULL,1),(2,'博苗教育','  你们的辛苦和努力的工作我看在眼里、感在心上。\n \n    在这个属于你们的日子里，我代表所有的杰睿人把最美丽的祝福送给你们，祝你们和你们的家人们快乐、健康、幸福每一天！\n \n    为了让所有的杰睿人在杰睿这个大家庭里感到温 馨、温暖、幸福，为了我们的家，我，还有杰睿 总监团校长团的成员们一直在努力！<br/>致杰睿最可爱的人：\n    忙碌的春季开班后，迎来了属于我们的节日---妇女节!\n    在这样的日子里，我们中间的很多人仍然投入在繁忙的工作中,没时间为自己庆祝节日。\n \n其实你们一直都是这样：\n    为了工作，年轻的你们牺牲了浪漫的约会时光；\n    为了工作，新婚的你们舍弃了美丽的蜜月旅行；\n    为了工作，准妈妈的你们在宝贝出生的前一天还奋战在自己的工作岗位上；\n    为了工作，作为母亲的你们心痛却还是坚定地把未满半岁的小宝宝交给了上一辈照看。\n \n    无论是老师，前台，助教，市场，亦或是其他行政部门人员，你们为杰睿这个大家都付出了很多，你们把最美好的青春时光都倾注在了教书育人的杰睿事业当中。无数个寒假暑假，你们割舍了难能可贵的休息时间；无数个节庆假日，你们割舍了和亲人朋友团聚的机会。其实在孩子心里，你们既是老师，更像妈妈，因为你们永远都在做的一件事，那就是：用心地呵护着我们的每一个宝贝。\n \n \n    那些纷涌而来的感谢信啊，只是你们全情投入的见证！\n    杰睿一天天地发展壮大，就是你们和其他所有杰睿人心血浇灌的结晶。\n    杰睿最可爱的女人们：节日快乐！\n    杰睿同样可爱的男人们，请把我们最美好的祝福带给你们身边最可爱的女人！致杰睿最可爱的人：\n    忙碌的春季开班后，迎来了属于我们的节日---妇女节!<br/>   在这样的日子里，我们中间的很多人仍然投入在繁忙的工作中,没时间为自己庆祝节日。\\n其实你们一直都是这样：\n    为了工作，年轻的你们牺牲了浪漫的约会时光；\n    为了工作，新婚的你们舍弃了美丽的蜜月旅行；\n    为了工作，准妈妈的你们在宝贝出生的前一天还奋战在自己的工作岗位上；\n    为了工作，作为母亲的你们心痛却还是坚定地把未满半岁的小宝宝交给了上一辈照看。  你们的辛苦和努力的工作我看在眼里、感在心上。\n \n    在这个属于你们的日子里，我代表所有的杰睿人把最美丽的祝福送给你们，祝你们和你们的家人们快乐、健康、幸福每一天！\n \n    为了让所有的杰睿人在杰睿这个大家庭里感到温 馨、温暖、幸福，为了我们的家，我，还有杰睿 总监团校长团的成员们一直在努力！<br/>致杰睿最可爱的人：\n    忙碌的春季开班后，迎来了属于我们的节日---妇女节!\n    在这样的日子里，我们中间的很多人仍然投入在繁忙的工作中,没时间为自己庆祝节日。\n \n其实你们一直都是这样：\n    为了工作，年轻的你们牺牲了浪漫的约会时光；\n    为了工作，新婚的你们舍弃了美丽的蜜月旅行；\n    为了工作，准妈妈的你们在宝贝出生的前一天还奋战在自己的工作岗位上；\n    为了工作，作为母亲的你们心痛却还是坚定地把未满半岁的小宝宝交给了上一辈照看。\n \n    无论是老师，前台，助教，市场，亦或是其他行政部门人员，你们为杰睿这个大家都付出了很多，你们把最美好的青春时光都倾注在了教书育人的杰睿事业当中。无数个寒假暑假，你们割舍了难能可贵的休息时间；无数个节庆假日，你们割舍了和亲人朋友团聚的机会。其实在孩子心里，你们既是老师，更像妈妈，因为你们永远都在做的一件事，那就是：用心地呵护着我们的每一个宝贝。\n \n \n    那些纷涌而来的感谢信啊，只是你们全情投入的见证！\n    杰睿一天天地发展壮大，就是你们和其他所有杰睿人心血浇灌的结晶。\n    杰睿最可爱的女人们：节日快乐！\n    杰睿同样可爱的男人们，请把我们最美好的祝福带给你们身边最可爱的女人！致杰睿最可爱的人：\n    忙碌的春季开班后，迎来了属于我们的节日---妇女节!<br/>   在这样的日子里，我们中间的很多人仍然投入在繁忙的工作中,没时间为自己庆祝节日。\\n其实你们一直都是这样：\n    为了工作，年轻的你们牺牲了浪漫的约会时光；\n    为了工作，新婚的你们舍弃了美丽的蜜月旅行；\n    为了工作，准妈妈的你们在宝贝出生的前一天还奋战在自己的工作岗位上；\n    为了工作，作为母亲的你们心痛却还是坚定地把未满半岁的小宝宝交给了上一辈照看。  你们的辛苦和努力的工作我看在眼里、感在心上。\n \n    在这个属于你们的日子里，我代表所有的杰睿人把最美丽的祝福送给你们，祝你们和你们的家人们快乐、健康、幸福每一天！\n \n    为了让所有的杰睿人在杰睿这个大家庭里感到温 馨、温暖、幸福，为了我们的家，我，还有杰睿 总监团校长团的成员们一直在努力！<br/>致杰睿最可爱的人：\n    忙碌的春季开班后，迎来了属于我们的节日---妇女节!\n    在这样的日子里，我们中间的很多人仍然投入在繁忙的工作中,没时间为自己庆祝节日。\n \n其实你们一直都是这样：\n    为了工作，年轻的你们牺牲了浪漫的约会时光；\n    为了工作，新婚的你们舍弃了美丽的蜜月旅行；\n    为了工作，准妈妈的你们在宝贝出生的前一天还奋战在自己的工作岗位上；\n    为了工作，作为母亲的你们心痛却还是坚定地把未满半岁的小宝宝交给了上一辈照看。\n \n    无论是老师，前台，助教，市场，亦或是其他行政部门人员，你们为杰睿这个大家都付出了很多，你们把最美好的青春时光都倾注在了教书育人的杰睿事业当中。无数个寒假暑假，你们割舍了难能可贵的休息时间；无数个节庆假日，你们割舍了和亲人朋友团聚的机会。其实在孩子心里，你们既是老师，更像妈妈，因为你们永远都在做的一件事，那就是：用心地呵护着我们的每一个宝贝。\n \n \n    那些纷涌而来的感谢信啊，只是你们全情投入的见证！\n    杰睿一天天地发展壮大，就是你们和其他所有杰睿人心血浇灌的结晶。\n    杰睿最可爱的女人们：节日快乐！\n    杰睿同样可爱的男人们，请把我们最美好的祝福带给你们身边最可爱的女人！致杰睿最可爱的人：\n    忙碌的春季开班后，迎来了属于我们的节日---妇女节!<br/>   在这样的日子里，我们中间的很多人仍然投入在繁忙的工作中,没时间为自己庆祝节日。\\n其实你们一直都是这样：\n    为了工作，年轻的你们牺牲了浪漫的约会时光；\n    为了工作，新婚的你们舍弃了美丽的蜜月旅行；\n    为了工作，准妈妈的你们在宝贝出生的前一天还奋战在自己的工作岗位上；\n    为了工作，作为母亲的你们心痛却还是坚定地把未满半岁的小宝宝交给了上一辈照看。','main','2012-03-30 02:38:33',NULL,'Active',NULL,0,'http://www.miaoedu.net',NULL,1),(3,'博苗教育优惠汇总','即将到来','main','2012-03-30 02:38:33',NULL,'Active',NULL,0,'http://www.miaoedu.net',NULL,1),(4,'博苗教育官方微薄','博苗教育微波即将到来。','main','2012-03-30 02:38:33',NULL,'Active',NULL,0,'http://www.miaoedu.net',NULL,1),(5,'博苗教育校区介绍','校区建设中，稍后跟新相关信息。','main','2012-03-30 02:38:33',NULL,'Active',NULL,0,'http://www.miaoedu.net',NULL,1),(6,'博苗教育网站使用帮助','专门的帮助单元正在建设中，工程师会尽快为大家带来帮助中心。','main','2012-03-30 02:38:33',NULL,'Active',NULL,0,'http://www.miaoedu.net',NULL,1),(7,'sale7','sale1ccccccc','sale','2012-03-27 02:59:57',NULL,'Active',NULL,0,'http://www.miaoedu.net',NULL,1),(8,'sale8','sale1ccccccc','sale','2012-03-27 02:59:57',NULL,'Active',NULL,0,'http://www.miaoedu.net',NULL,1),(9,'博苗教育网站初步上线','博苗教育，由北京名师领衔，专注于沈阳青少年英语教育，博苗教育为您提供专业的沈阳英语教育服务。','first','2012-03-30 02:36:42',NULL,'Active',NULL,0,'http://www.miaoedu.net',NULL,1),(10,'博苗教育优惠汇总(沈阳)',NULL,'sale','2012-03-30 02:38:33',NULL,'Active','资讯',0,'http://www.miaoedu.net',NULL,1),(11,'博苗教育优惠汇总(沈阳)',NULL,'sale','2012-03-30 02:38:33',NULL,'Active','资讯',0,'http://www.miaoedu.net',NULL,1),(12,'博苗教育优惠汇总(沈阳)',NULL,'sale','2012-03-30 02:38:33',NULL,'Active','资讯',0,'http://www.miaoedu.net',NULL,1),(13,'博苗教育优惠汇总(沈阳)',NULL,'sale','2012-03-30 02:38:33',NULL,'Active','myschool',0,'http://www.miaoedu.net',NULL,1),(14,'博苗教育优惠汇总(沈阳)',NULL,'sale','2012-03-30 02:38:33',NULL,'Active','myschool',0,'http://www.miaoedu.net',NULL,1),(15,'博苗教育优惠汇总(沈阳)',NULL,'sale','2012-03-30 02:38:33',NULL,'Active',NULL,0,'http://www.miaoedu.net',NULL,1),(16,'博苗教育优惠汇总(沈阳)',NULL,'sale','2012-03-30 02:38:33',NULL,'Active','myschool',0,'http://www.miaoedu.net',NULL,1),(17,'博苗教育优惠汇总(沈阳)',NULL,'sale','2012-03-30 02:38:33',NULL,'Active',NULL,0,'http://www.miaoedu.net',NULL,1);
/*!40000 ALTER TABLE `information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information_log`
--

DROP TABLE IF EXISTS `information_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `information_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4DACD1B19D97CC96` (`information_id`),
  CONSTRAINT `FK4DACD1B19D97CC96` FOREIGN KEY (`information_id`) REFERENCES `information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information_log`
--

LOCK TABLES `information_log` WRITE;
/*!40000 ALTER TABLE `information_log` DISABLE KEYS */;
INSERT INTO `information_log` VALUES (1,20120327,'5',16),(2,20120327,'1',8),(3,20120327,'13',1),(7,20120327,'2',10),(8,20120327,'1',11);
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
  `lesson_system_id` bigint(20) DEFAULT NULL,
  `book_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lesson_school1` (`school_id`),
  KEY `fk_lesson_teacher1` (`teacher_id`),
  KEY `fk_lesson_lesson_system1` (`lesson_system_id`),
  KEY `fk_lesson_book1` (`book_id`),
  KEY `FKBE10AD38705656D6` (`teacher_id`),
  KEY `FKBE10AD38C1DDC95E` (`school_id`),
  CONSTRAINT `FKBE10AD38C1DDC95E` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`),
  CONSTRAINT `FKBE10AD38705656D6` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `fk_lesson_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lesson_lesson_system1` FOREIGN KEY (`lesson_system_id`) REFERENCES `lesson_system` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lesson_school1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lesson_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(2,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(3,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(4,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(5,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(6,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(7,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(8,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(9,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(10,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(11,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(12,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(13,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL),(14,'我打卡洛斯讲道理看我','寒假班','英语','少儿系列','快乐思维',NULL,'Active',15,'2012-03-01','2012-03-01',NULL,0,'少量',1,1,NULL,NULL);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_system`
--

DROP TABLE IF EXISTS `lesson_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_system` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_system`
--

LOCK TABLES `lesson_system` WRITE;
/*!40000 ALTER TABLE `lesson_system` DISABLE KEYS */;
INSERT INTO `lesson_system` VALUES (5,'少儿系列','eng','Active','《剑桥国际儿童英语》（Playway to English）是针对母语非英语国家的初学英语的儿童出版的一套综合教材。以3 ～ 7岁儿童英语启蒙学习为主，分为四个级别。其最基本的特点在于寓教于乐，让孩子在愉快的游戏和优美的歌谣中掌握英语。《剑桥国际儿童英语》独创的SMILE教学法让孩子在轻松的学习环境中掌握基本的听、说、读、写能力。内容采用孩子乐于接受的短剧、动画片、歌曲、歌谣、韵律诗和行动故事来呈现。有趣的画面、活泼的节奏以及手脑并用的动作调动了孩子的多个感官，让孩子以母语的方式习得英语！'),(6,'新概念系列','eng','Active','作为一套世界闻名的英语教程，《新概念英语》以其全新的教学理念，有趣的课文内容和全面的技能训练，深受广大英语学习者的欢迎和喜爱。进入中国以后，《新概念英语》历经了数次重印，而为了最大限度地满足不同层次、不同类型英语学习者的需求，与本教程相配套的系列辅导用书和音像产品也是林林总总，不一而足。'),(7,'剑桥系列','eng','Active','《剑桥国际儿童英语》（Playway to English）是针对母语非英语国家的初学英语的儿童出版的一套综合教材。以3 ～ 7岁儿童英语启蒙学习为主，分为四个级别。其最基本的特点在于寓教于乐，让孩子在愉快的游戏和优美的歌谣中掌握英语。《剑桥国际儿童英语》独创的SMILE教学法让孩子在轻松的学习环境中掌握基本的听、说、读、写能力。内容采用孩子乐于接受的短剧、动画片、歌曲、歌谣、韵律诗和行动故事来呈现。有趣的画面、活泼的节奏以及手脑并用的动作调动了孩子的多个感官，让孩子以母语的方式习得英语！'),(8,'口语系列','eng','Active','《剑桥国际儿童英语》（Playway to English）是针对母语非英语国家的初学英语的儿童出版的一套综合教材。以3 ～ 7岁儿童英语启蒙学习为主，分为四个级别。其最基本的特点在于寓教于乐，让孩子在愉快的游戏和优美的歌谣中掌握英语。《剑桥国际儿童英语》独创的SMILE教学法让孩子在轻松的学习环境中掌握基本的听、说、读、写能力。内容采用孩子乐于接受的短剧、动画片、歌曲、歌谣、韵律诗和行动故事来呈现。有趣的画面、活泼的节奏以及手脑并用的动作调动了孩子的多个感官，让孩子以母语的方式习得英语！');
/*!40000 ALTER TABLE `lesson_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_table`
--

DROP TABLE IF EXISTS `lesson_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lesson_date` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `lesson_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC3248207C4A942DE` (`lesson_id`),
  CONSTRAINT `FKC3248207C4A942DE` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`)
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
-- Table structure for table `lesson_user`
--

DROP TABLE IF EXISTS `lesson_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_user` (
  `lesson_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`lesson_id`,`user_id`),
  KEY `fk_lesson_has_user_user1` (`user_id`),
  KEY `fk_lesson_has_user_lesson1` (`lesson_id`),
  CONSTRAINT `fk_lesson_has_user_lesson1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lesson_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_user`
--

LOCK TABLES `lesson_user` WRITE;
/*!40000 ALTER TABLE `lesson_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_user` ENABLE KEYS */;
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
  `name` varchar(255) DEFAULT NULL,
  `information_id` bigint(20) DEFAULT NULL,
  `lesson_id` bigint(20) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK363419705656D6` (`teacher_id`),
  KEY `FK3634199D97CC96` (`information_id`),
  KEY `FK363419C4A942DE` (`lesson_id`),
  CONSTRAINT `FK363419C4A942DE` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`),
  CONSTRAINT `FK363419705656D6` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FK3634199D97CC96` FOREIGN KEY (`information_id`) REFERENCES `information` (`id`)
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
  KEY `FKAA31CBE2C1DDC95E` (`school_id`),
  CONSTRAINT `FKAA31CBE2C1DDC95E` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`),
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
  `login_times` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF022E0D047140EFE` (`user_id`),
  CONSTRAINT `FKF022E0D047140EFE` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
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

-- Dump completed on 2012-03-30 14:39:42
