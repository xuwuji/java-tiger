-- MySQL dump 10.13  Distrib 5.7.13, for osx10.10 (x86_64)
--
-- Host: localhost    Database: eshop
-- ------------------------------------------------------
-- Server version	5.7.13

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `text` text,
  `referProductId` varchar(255) DEFAULT NULL,
  `typeId` varchar(255) DEFAULT NULL COMMENT '0-公共，1-种草笔记',
  `announceStyle` varchar(255) DEFAULT NULL,
  `imgs` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `mainImgUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'第一篇文章修改','2019-03-20 15:56:36','<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />','8','1','','http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg','化妆;','1','http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg'),(2,'第二篇文章','2019-03-20 15:56:36','<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />','8','1','','http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg','口红;','1','http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg'),(3,'第三篇文章','2019-03-20 15:56:36','<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />','8','1',NULL,'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg','护肤;','1',NULL),(4,'第四篇文章','2019-03-20 15:56:36','<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />','8','1',NULL,'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg','套装;','1',NULL),(5,'第五章文章','2019-03-20 15:56:36','<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />','8','0','small','http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg','化妆;遮瑕;','1',NULL),(6,'第六篇文章','2019-03-20 15:56:36','<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />','8','0','big','http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg','化妆;遮瑕;','1',NULL),(7,'测试第一篇','2019-03-27 15:10:55','adasdasd',NULL,'1','防晒霜','http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg;',NULL,'0',NULL),(8,'测试第一篇','2019-03-27 15:15:11','adasdasd',NULL,'1','防晒霜','http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg;',NULL,'0','http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg'),(9,'测试第二','2019-03-27 15:19:03','dsf',NULL,'1','','dsf','fdsf','0','fdsf'),(10,'测试第二','2019-03-27 15:19:25','dsf','15','1','','dsf','fdsf','1','fdsf');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banneritem`
--

DROP TABLE IF EXISTS `banneritem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banneritem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(255) DEFAULT NULL,
  `redirectUrl` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `bannerId` varchar(255) DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifyTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banneritem`
--

LOCK TABLES `banneritem` WRITE;
/*!40000 ALTER TABLE `banneritem` DISABLE KEYS */;
INSERT INTO `banneritem` VALUES (1,'http://ppf0hsoua.bkt.clouddn.com/banner/spring_new.jpg','dasad','1','春季上新','0','2019-03-05 06:22:01','2019-04-04 10:12:22','春季上新'),(2,'','aaa','1','小红书推荐','1','2019-03-05 06:22:01','2019-03-24 06:01:39',NULL),(3,'','ddd','1','女王节','1','2019-03-05 06:22:01','2019-03-24 06:01:39',NULL),(4,'','ddd','1','化妆品套装','1','2019-03-05 06:22:01','2019-03-24 06:01:39','化妆品套装'),(5,'','ddd','1','清洁','1','2019-03-05 06:22:01','2019-03-24 06:01:39',NULL),(6,'','../productList/productList?id=2&type=category','1','口红','2','2019-03-07 08:39:08','2019-03-24 06:01:39',NULL),(7,'','../productList/productList?id=4&type=category','1','面膜','2','2019-03-14 00:58:49','2019-03-24 06:01:39',NULL),(8,'','../productList/productList?id=8&type=category','1','礼盒套装','2','2019-03-14 01:23:07','2019-03-24 06:01:39',NULL),(9,'','../productList/productList?id=9&type=category','1','女士香水','2','2019-03-14 01:27:56','2019-03-24 06:01:39',NULL),(10,'','../productList/productList?id=3&type=category','1','眼影','2','2019-03-14 01:40:58','2019-03-24 06:01:39',NULL),(11,'','../productList/productList?id=6&type=category','1','腮红','2','2019-03-14 01:42:29','2019-03-24 06:01:39',NULL),(12,'','../productList/productList?id=7&type=category','1','防晒护理','2','2019-03-14 01:44:53','2019-03-24 06:01:39',NULL),(13,'','../productList/productList?id=10&type=category','1','精华','2','2019-03-14 01:47:35','2019-03-24 06:01:39',NULL),(14,'','../productList/productList?id=12&type=category','1','眼霜','2','2019-03-14 01:47:47','2019-03-24 06:01:39',NULL),(15,'','../productList/productList?id=11&type=category','1','乳液','2','2019-03-14 01:48:05','2019-03-24 06:01:39',NULL),(16,'','../brand/brand','1','品牌闪购','4','2019-03-15 02:58:50','2019-03-24 06:01:39','满300减50'),(17,'','../points/points','1','积分赢好礼','4','2019-03-15 03:12:45','2019-04-11 06:13:51','下单抵现金'),(18,'','../rank/rank','1','排行榜','4','2019-03-15 03:13:02','2019-03-24 06:01:39','药丸面膜'),(19,'','..','0','ysl口红','0','2019-03-15 05:14:24','2019-04-15 09:48:51','ysl口红'),(20,'','..','0','女神香水','0','2019-03-15 05:57:37','2019-04-15 09:48:49','女神香水'),(21,'http://pnwhn87vf.bkt.clouddn.com/skii.jpg','../flashSale/flashSale','1','限时购','3','2019-03-15 03:13:02','2019-03-24 06:07:09','SKII神仙水800起'),(22,'http://ppf0hsoua.bkt.clouddn.com/red.jpg','../bonus/bonus','1','分享好礼','3','2019-03-28 09:13:39','2019-04-15 09:47:58','得15元现金红包');
/*!40000 ALTER TABLE `banneritem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brandCN` varchar(255) DEFAULT NULL,
  `brandEN` varchar(255) DEFAULT NULL,
  `brandLevel` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT '0',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifyTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `imgUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'圣罗兰','YSL','2','法国','1','2019-03-05 06:21:52',NULL,NULL),(2,'阿玛尼','Giorgio Armani','2','法国','1','2019-03-05 06:21:52',NULL,NULL),(3,'NYX','NYX','1','美国','1','2019-03-05 06:21:52',NULL,NULL),(4,'井田','canmake','0','日本','1','2019-03-05 06:21:52',NULL,NULL),(5,'魅可','mac','1','美国','1','2019-03-05 06:21:52',NULL,NULL),(6,'汤姆福特','TF','2','法国','1','2019-03-11 09:07:31','2019-03-11 09:07:44',NULL),(7,'雅诗兰黛','Estee Lauder','2','法国','1','2019-03-11 09:10:47','2019-03-11 09:10:49',NULL),(8,'蒂佳婷','Dr.Jart+','1','韩国','1','2019-03-12 04:44:15','2019-03-12 04:44:18',NULL),(9,'安耐晒','ANESSA','2','日本','1','2019-03-12 04:59:34','2019-03-12 04:59:42',NULL),(10,'肌司妍','JM solution','1','韩国','0','2019-03-18 08:33:58',NULL,NULL),(11,'迪奥','Dior','2','法国','1','2019-04-10 10:20:06','2019-04-10 10:20:12',NULL),(12,'香奈儿','Chanel','2','法国','1','2019-04-15 03:38:37','2019-04-15 03:38:44',NULL),(13,'SK-II','SK-II','2','日本','1','2019-04-15 05:49:27','2019-04-15 05:49:34',NULL),(14,'黛珂','Decorte','2','日本','1','2019-04-15 08:37:40','2019-04-15 08:37:44',NULL),(15,'纳斯','Nars','1','美国','1','2019-04-15 09:06:54','2019-04-15 09:06:59',NULL);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `parentCategoryId` varchar(255) NOT NULL COMMENT '属于父类的id',
  `imgUrl` varchar(255) DEFAULT '' COMMENT '显示的图片url',
  `state` varchar(255) DEFAULT '0' COMMENT '0下架 1上架',
  `recommend` varchar(255) DEFAULT '0' COMMENT '0不推荐 1推荐',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifyTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,NULL,'口红','5','http://i1.bvimg.com/677237/3ff60a7512c83d00.jpg','1','1','2019-03-05 06:21:42',NULL),(3,'眼影','眼影','5',NULL,'1','0','2019-03-05 06:21:42','2019-03-14 01:27:16'),(4,'面膜','面膜','6','http://i1.bvimg.com/677237/7f65e6d21ffaa0a3.jpg','1','1','2019-03-05 06:21:42','2019-03-14 00:44:30'),(6,'腮红','腮红','5','category/6.jpg','1','0','2019-03-07 08:32:41','2019-03-14 01:27:21'),(7,'防晒护理','防晒护理','7','category/7.jpg','1','0','2019-03-12 04:58:57','2019-03-12 05:10:39'),(8,'礼盒套装','礼盒套装','6','category/8.jpg','1','0','2019-03-14 01:22:34','2019-03-14 01:22:37'),(9,'女士香水','女士香水','5','category/9.jpg','1','0','2019-03-14 01:27:05','2019-03-14 01:27:09'),(10,'精华/肌底液','精华/肌底液','6','category/10.jpg','1','0','2019-03-14 01:46:26','2019-03-14 01:47:09'),(11,'面霜/乳液','面霜/乳液','6','category/11.jpg','1','0','2019-03-14 01:46:39','2019-03-14 01:47:11'),(12,'眼霜/精华','眼霜/精华','6','category/12.jpg','1','0','2019-03-14 01:46:52','2019-03-14 01:47:13'),(13,'洁面','洁面','6','category/13.jpg','0','0','2019-03-14 01:47:04','2019-03-14 01:47:04');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `total` double(255,0) DEFAULT NULL,
  `reduction` double(255,0) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `startDate` timestamp NULL DEFAULT NULL,
  `endDate` timestamp NULL DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '0-全场',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,'满1000减30',1000,30,'1','2019-03-31 08:00:00','2019-04-30 08:00:00','0'),(2,'满100减20',100,20,'1','2019-03-31 08:00:00','2019-04-30 08:00:00','0'),(3,'满200减15',200,15,'1','2019-03-31 08:00:00','2019-04-30 08:00:00','0'),(4,'满500减25',500,25,'1','2019-03-31 08:00:00','2019-04-06 08:00:00','0');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eshopconfig`
--

DROP TABLE IF EXISTS `eshopconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eshopconfig` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eshopconfig`
--

LOCK TABLES `eshopconfig` WRITE;
/*!40000 ALTER TABLE `eshopconfig` DISABLE KEYS */;
INSERT INTO `eshopconfig` VALUES (1,'xxcUrl','http://ppf0hsoua.bkt.clouddn.com/xxc.jpg',''),(2,'noticeMsg','欢迎在线咨询徐小柴~',NULL),(3,'productImgBase','http://ppf0hsoua.bkt.clouddn.com/product/',NULL),(4,'categoryImgBase','http://ppf0hsoua.bkt.clouddn.com/category/',NULL),(5,'bannerImgBase','http://ppf0hsoua.bkt.clouddn.com/banner/',NULL),(6,'preSearch','ahc/ysl',NULL),(7,'countryFlagImgBase','http://ppf0hsoua.bkt.clouddn.com/country/',NULL),(8,'articlePreSearch','阿玛尼403/药丸面膜/天气丹套装/第一',NULL),(9,'bonus','15',NULL),(10,'shareTitle','小柴精选 全球品质好物',''),(11,'goldDiscount','0.98',NULL),(12,'platinumDiscount','0.93',NULL),(13,'diamondDiscount','0.88',NULL),(14,'showNoticeMessage','0',NULL),(15,'brandImgBase','http://ppf0hsoua.bkt.clouddn.com/brand/','品牌的图片base地址'),(16,'productDetailImgBase','http://ppf0hsoua.bkt.clouddn.com/detail/','商品详情图片的base地址'),(17,'shareImgUrl','http://ppf0hsoua.bkt.clouddn.com/logo.jpg','分享链接的图片地址');
/*!40000 ALTER TABLE `eshopconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eshoporder`
--

DROP TABLE IF EXISTS `eshoporder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eshoporder` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `wechatId` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL COMMENT '订单状态',
  `orderId` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(255) DEFAULT NULL,
  `amount` double(255,0) DEFAULT NULL,
  `totalCount` int(255) DEFAULT NULL,
  `recieverName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `openId` varchar(255) DEFAULT NULL,
  `logisticsId` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `lastModifyTime` datetime DEFAULT NULL,
  `logisticsName` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `sourceOpenId` varchar(255) DEFAULT NULL,
  `sourceWechatId` varchar(255) DEFAULT NULL,
  `promotionIds` varchar(255) DEFAULT NULL,
  `couponId` varchar(255) DEFAULT NULL,
  `usedBonus` double DEFAULT NULL,
  `usedCouponCash` double DEFAULT NULL,
  `usedPoints` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eshoporder`
--

LOCK TABLES `eshoporder` WRITE;
/*!40000 ALTER TABLE `eshoporder` DISABLE KEYS */;
INSERT INTO `eshoporder` VALUES (47,'1','2019-04-15 14:47:13','1','20190415224712710006','18217683505',276,2,'1','1','oX-br4rfqn2ia4g6kGdbFKlkgBYw',NULL,'','2019-04-15 22:51:30',NULL,'share','oX-br4neGzmMBKR7ByjoXRUA1-NM','','','',0,0,0),(48,'号','2019-04-15 15:10:08','1','20190415231008296472','18217683505',346,1,'a','啊','oX-br4rfqn2ia4g6kGdbFKlkgBYw',NULL,'','2019-04-15 23:11:13',NULL,'share','oAEfX5U6TQ-VgmIiN9OYdm6Homj8','','','',0,0,200),(49,'2','2019-04-15 15:25:22','1','20190415232520400000','18218683505',348,1,'5','5','oX-br4neGzmMBKR7ByjoXRUA1-NM',NULL,'啊','2019-04-15 23:27:38',NULL,'share','oX-br4rfqn2ia4g6kGdbFKlkgBYw','','','',0,0,0),(50,'1','2019-04-15 15:29:31','1','20190415232930401342','18217683505',3147,3,'5','5','oX-br4neGzmMBKR7ByjoXRUA1-NM',NULL,'5','2019-04-15 23:29:56',NULL,'','','','','',0,0,300),(51,'是','2019-04-15 15:31:37','-1','20190415233136292689','18217683505',9241,9,'18217683505','5','oX-br4neGzmMBKR7ByjoXRUA1-NM',NULL,'','2019-04-15 23:32:02',NULL,'','','','','',0,0,2000),(52,'了','2019-04-15 15:32:45','1','20190415233245256045','18217683505',10270,10,'了','了','oX-br4neGzmMBKR7ByjoXRUA1-NM',NULL,'','2019-04-15 23:33:00',NULL,'','','','','',0,0,2000),(53,'e','2019-04-15 15:40:39','2','20190415234038637522','18217683505',9890,37,'e','a','oX-br4neGzmMBKR7ByjoXRUA1-NM','44','','2019-04-15 23:41:55','dd','share','oAEfX5U6TQ-VgmIiN9OYdm6Homj8','','','',0,0,2000),(54,'是','2019-04-15 16:05:48','1','20190416000548101598','18217683505',1230,2,'啊','啊','oX-br4neGzmMBKR7ByjoXRUA1-NM',NULL,'','2019-04-16 00:06:18',NULL,'share','oAEfX5U6TQ-VgmIiN9OYdm6Homj8','','','',0,0,0);
/*!40000 ALTER TABLE `eshoporder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `format`
--

DROP TABLE IF EXISTS `format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT '0',
  `flashPrice` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `productIdState` (`productId`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `format`
--

LOCK TABLES `format` WRITE;
/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` VALUES (1,'01 cilli',138,'8','1',NULL),(2,'ruby woo',145,'8','1',NULL),(3,'#80',348,'15','1',NULL),(4,'#15 Wild Ginger',358,'15','1',NULL),(5,'#999 哑光',288,'9','1',238.00),(6,'#400 The Red',225,'10','1',NULL),(7,'#405 Sultan',328,'10','1',NULL),(8,'五片 / 盒',68,'21','1',NULL),(9,'90ml',320,'22','1',290.00),(10,'230ml',1050,'23','1',0.00),(11,'十片/盒',80,'24','1',70.00),(12,'十片/盒',80,'1334','1',68.00),(13,'五片/盒',50,'1334','1',38.00),(14,'50ml',608,'1335','1',588.00),(15,'100ml',900,'1335','1',880.00),(16,'15ml',388,'1336','1',0.00),(17,'300ml',480,'1337','1',0.00),(18,'#03 Warm Neutrals',175,'11','1',0.00),(19,'#Omega 柔亮米褐色',158,'12','1',0.00),(20,'#02 自然咖啡色',75,'13','1',0.00),(21,'#05 粉红咖啡',75,'13','1',0.00),(22,'#10 淡粉红',75,'13','1',0.00),(23,'#15 暮光亮蓝',75,'13','1',0.00),(24,'#14 古典深红',75,'13','1',0.00),(25,'#07 桃红',75,'13','1',0.00),(26,'#Deep Throat 深喉',175,'1338','1',0.00),(27,'#Sex Appeal 性感',175,'1338','1',0.00),(28,'#Orgasm 高潮',175,'1338','1',0.00);
/*!40000 ALTER TABLE `format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(255) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `categoryId` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,'oAEfX5U6TQ-VgmIiN9OYdm6Homj8','15','2','2019-04-04 13:27:47'),(2,'oAEfX5U6TQ-VgmIiN9OYdm6Homj8','15','2','2019-04-04 13:27:50'),(3,'oAEfX5U6TQ-VgmIiN9OYdm6Homj8','9','2','2019-04-04 13:28:22'),(4,'oAEfX5U6TQ-VgmIiN9OYdm6Homj8','15','2','2019-04-04 13:28:47'),(5,'oAEfX5U6TQ-VgmIiN9OYdm6Homj8','15','2','2019-04-04 13:28:58'),(6,'oAEfX5U6TQ-VgmIiN9OYdm6Homj8','15','2','2019-04-04 13:30:36'),(7,'oAEfX5U6TQ-VgmIiN9OYdm6Homj8','10','2','2019-04-04 13:45:15');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `orderId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `mainImgUrl` varchar(255) DEFAULT NULL,
  `formatId` varchar(255) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `formatName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (11,1,'201903111105062979734','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(12,1,'201903111107147199074','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(13,1,'201903111109167016132','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(14,2,'201903111115107671399','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(15,1,'201903111115107671399','Tom Ford?±¤?§??????? lip color é??é?????è??',358.00,NULL,'4','15','#15 Wild Ginger'),(16,1,'201903111118019758198','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(17,1,'201903111124236765930','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(18,1,'201903111129304477200','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(19,1,'201903111130077986515','Tom Ford??±?¤??§??????? lip color ????????????¨??',348.00,NULL,'3','15','#80'),(20,1,'201903111304584002459','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,'','3','15','#80'),(21,1,'201903111304584002459','Tom Ford?±¤?§??????? lip color é??é?????è??',358.00,'','4','15','#15 Wild Ginger'),(22,1,'201903111735566646844','Dioré????????è??',288.00,'','5','9','#999 ??????'),(23,1,'201903111735566646844','MAC???è??',138.00,'','1','8','01 cilli'),(24,1,'201903111735566646844','MAC???è??',145.00,'','2','8','ruby woo'),(25,1,'201903111744388104120','Dioré????????è??',288.00,'','5','9','#999 ??????'),(26,1,'201903111745478540790','MAC???è??',138.00,'','1','8','01 cilli'),(27,1,'201903111751262277431','Dioré????????è??',288.00,'','5','9','#999 ??????'),(28,1,'20190312131940007756','Shiseido è???????? Anessa ???è????? è??é???°????è??UV?????? SPF50',288.00,'','9','22','90ml'),(29,1,'20190313100529064631','é??????°????????°???????é??',225.00,'','6','10','#400 The Red'),(30,1,'20190313103704901593','é??????°????????°???????é??',225.00,'','6','10','#400 The Red'),(31,1,'201903131632425925850','é??????°????????°???????é??',225.00,'','6','10','#400 The Red'),(32,1,'201903131643260583761','é??????°????????°???????é??',225.00,'','6','10','#400 The Red'),(33,1,'201903131644057331577','阿玛尼漆亮水漾唇釉',225.00,'','6','10','#400 The Red'),(34,1,'201903131644588800861','Dioré????????è??',288.00,'','5','9','#999 ??????'),(35,1,'201903131646091152163','Dioré????????è??',288.00,'','5','9','#999 ??????'),(36,1,'201903131647217012071','Dior魅惑唇膏',288.00,'','5','9','#999 哑光'),(37,1,'201903281323589770705','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(38,1,'201903281326079119032','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(39,1,'201903281328019856388','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(40,2,'20190329140926372161','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(41,2,'20190329140957118298','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(42,2,'20190329141309190118','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(43,2,'20190329141412442005','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(44,2,'20190329141459554122','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(45,2,'20190329141711379606','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(46,2,'20190329142147684147','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(47,1,'201904012316345224246','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(48,2,'201904031128376573520','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(49,1,'2019040316352616083','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(50,62,'2019040316372456885','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(51,1,'2019040316400607076','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(52,1,'2019040316412633266','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(53,2,'20190403184757073081','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(54,1,'20190403184757073081','MAC唇膏',138.00,'http://pnwhn87vf.bkt.clouddn.com/product/8-0.jpg','1','8','01 cilli'),(55,1,'20190403185243216168','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(56,2,'20190412003350438501','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(57,1,'20190412003350438501','Tom Ford汤姆福特 lip color 黑金唇膏',358.00,NULL,'4','15','#15 Wild Ginger'),(58,2,'20190412004649095070','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(59,1,'20190413115054713830','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(60,1,'20190413115054713830','MAC唇膏',138.00,NULL,'1','8','01 cilli'),(61,1,'20190413115234201025','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(62,1,'20190413115234201025','MAC唇膏',138.00,NULL,'1','8','01 cilli'),(63,1,'20190413120138851138','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(64,1,'20190413120138851138','MAC唇膏',138.00,NULL,'1','8','01 cilli'),(65,1,'2019041510422679509','阿玛尼漆亮水漾唇釉',225.00,NULL,'6','10','#400 The Red'),(66,1,'2019041510422679509','JM珍珠面膜',38.00,NULL,'13','1334','五片/盒'),(67,1,'2019041510422679509','JM珍珠面膜',68.00,NULL,'12','1334','十片/盒'),(68,2,'20190415224711062618','MAC 魅可 唇膏',138.00,NULL,'1','8','01 cilli'),(69,2,'20190415224712710006','MAC 魅可 唇膏',138.00,NULL,'1','8','01 cilli'),(70,1,'20190415231008296472','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(71,1,'20190415232520400000','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(72,3,'20190415232930401342','SK-II 护肤精华 神仙水',1050.00,NULL,'10','23','230ml'),(73,9,'20190415233136292689','SK-II 护肤精华 神仙水',1050.00,NULL,'10','23','230ml'),(74,10,'20190415233245256045','SK-II 护肤精华 神仙水',1050.00,NULL,'10','23','230ml'),(75,37,'20190415234038637522','Dior 迪奥 烈焰蓝金唇膏',288.00,NULL,'5','9','#999 哑光'),(76,1,'20190416000548101598','SK-II 护肤精华 神仙水',1050.00,NULL,'10','23','230ml'),(77,1,'20190416000548101598','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80');
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parentcategory`
--

DROP TABLE IF EXISTS `parentcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parentcategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL COMMENT '状态，下架0，上架1',
  `lastModifyTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parentcategory`
--

LOCK TABLES `parentcategory` WRITE;
/*!40000 ALTER TABLE `parentcategory` DISABLE KEYS */;
INSERT INTO `parentcategory` VALUES (5,'美妆','1',NULL,'2019-03-05 06:21:28'),(6,'护肤','1',NULL,'2019-03-05 06:21:28'),(7,'个人护理','1',NULL,'2019-03-05 06:21:28'),(8,'母婴幼儿','1',NULL,'2019-03-05 06:21:28');
/*!40000 ALTER TABLE `parentcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `hkPrice` double(10,2) DEFAULT NULL,
  `flashPrice` double(10,2) DEFAULT NULL COMMENT '抢购价',
  `inventory` int(255) DEFAULT NULL,
  `salesCount` int(255) DEFAULT NULL,
  `mainImgUrl` varchar(255) DEFAULT NULL,
  `categoryId` varchar(11) DEFAULT NULL,
  `parentCategoryId` varchar(11) DEFAULT NULL,
  `brandId` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT '0',
  `bannerItemId` varchar(255) DEFAULT '0',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifyTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `imgUrl1` varchar(255) DEFAULT NULL,
  `imgUrl2` varchar(255) DEFAULT NULL,
  `imgUrl3` varchar(255) DEFAULT NULL,
  `imgUrl4` varchar(255) DEFAULT NULL,
  `colorId` varchar(255) DEFAULT NULL,
  `flashState` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `categoryId` (`categoryId`),
  KEY `brandId` (`brandId`),
  KEY `name` (`name`,`state`),
  KEY `categoryIdState` (`categoryId`,`state`),
  KEY `brandIdState` (`brandId`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=1339 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'product/1-0.jpg',NULL,NULL,NULL,'0',NULL,'2019-03-05 06:17:56','2019-03-07 08:06:46','product/1-1.jpg','product/1-2.jpg','product/1-3.jpg','product/1-4.jpg',NULL,NULL),(2,'YSL口红','方管圆管',NULL,NULL,NULL,10,10,'http://i2.bvimg.com/677237/3495e004b28872ec.jpg',NULL,NULL,NULL,'0',NULL,'2019-03-05 06:17:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'YSL口红','方管圆管',NULL,NULL,NULL,10,10,'http://i2.bvimg.com/677237/3495e004b28872ec.jpg',NULL,NULL,NULL,'0',NULL,'2019-03-05 06:17:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'YSL口红','方管圆管',NULL,NULL,NULL,10,10,'http://i2.bvimg.com/677237/3495e004b28872ec.jpg',NULL,NULL,NULL,'0',NULL,'2019-03-05 06:17:56','2019-03-23 17:03:36',NULL,NULL,NULL,NULL,NULL,'1'),(8,'MAC 魅可 唇膏','MAC唇膏',138.00,130.00,0.00,100,32,NULL,'2','5',5,'1','2','2019-03-05 06:17:56','2019-04-15 09:23:29',NULL,NULL,NULL,NULL,NULL,''),(9,'Dior 迪奥 烈焰蓝金唇膏','Dior魅惑唇膏',320.00,266.00,288.00,10,13,NULL,'2','5',11,'1','2','2019-03-05 06:17:56','2019-04-15 09:22:05',NULL,NULL,NULL,NULL,NULL,'1'),(10,'阿玛尼漆亮水漾唇釉','阿玛尼漆亮水漾唇釉',258.00,NULL,NULL,100,13,'http://i1.bvimg.com/677237/28b8fff357968901.jpg','2','5',2,'1','2','2019-03-05 06:17:56','2019-03-11 09:18:48',NULL,NULL,NULL,NULL,NULL,NULL),(11,'NYX 16色眼影盘','NYX 16色眼影盘',175.00,136.00,0.00,100,19,NULL,'3','5',3,'1','0','2019-03-05 06:17:56','2019-04-15 08:55:06',NULL,NULL,NULL,NULL,NULL,''),(12,'MAC 魅可 时尚焦点小眼影','MAC 魅可 时尚焦点小眼影',158.00,129.00,0.00,100,19,NULL,'3','5',5,'1','0','2019-03-05 06:17:56','2019-04-15 08:55:22',NULL,NULL,NULL,NULL,NULL,''),(13,'Canmake 井田 完美高效眼影','Canmake 井田 完美高效眼影',75.00,49.00,0.00,100,19,NULL,'3','5',4,'1','0','2019-03-05 06:17:56','2019-04-15 08:57:58',NULL,NULL,NULL,NULL,NULL,''),(15,'Tom Ford汤姆福特 lip color 黑金唇膏','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,0.00,0.00,99,24,NULL,'2','5',6,'1','2','2019-03-07 08:06:46','2019-04-15 16:06:18',NULL,NULL,NULL,NULL,NULL,NULL),(21,'蒂佳婷 Dr.Jart+ 蓝色药丸面膜 专业瞬间锁水','适合易缺水干燥肌肤。面膜蕴含水润精华，面膜纸以超细纤维制成，更贴合面部，将精华完整传送到肌底。',68.00,43.00,0.00,58,42,NULL,'4','6',8,'1','0','2019-03-12 04:46:57','2019-04-15 03:09:54','http://localhost:8080/backend/resources/eshop/image/product/21-1.jpg','http://localhost:8080/backend/resources/eshop/image/product/21-2.jpg','http://localhost:8080/backend/resources/eshop/image/product/21-3.jpg','http://localhost:8080/backend/resources/eshop/image/product/21-4.jpg',NULL,''),(22,'Shiseido 资生堂 Anessa 安耐晒 超防水美肌UV乳液 SPF50','具有防水、防汗、防皮脂的特性，不论进行海边、游泳池或户外休闲活动等，等能安心阻挡强烈日晒',330.00,266.00,290.00,40,31,NULL,'7','7',9,'1','0','2019-03-12 05:02:40','2019-04-15 09:04:33','http://localhost:8080/backend/resources/eshop/image/product/22-1.jpg','http://localhost:8080/backend/resources/eshop/image/product/22-2.jpg','http://localhost:8080/backend/resources/eshop/image/product/22-3.jpg','http://localhost:8080/backend/resources/eshop/image/product/22-4.jpg',NULL,'1'),(23,'SK-II 护肤精华 神仙水','SK-II 护肤精华 神仙水',1050.00,963.00,0.00,24,32,NULL,'10','6',13,'1','0','2019-03-19 01:46:09','2019-04-15 16:06:18','http://pnwhn87vf.bkt.clouddn.com/product/23-1.jpg','http://pnwhn87vf.bkt.clouddn.com/product/23-2.jpg','http://pnwhn87vf.bkt.clouddn.com/product/23-3.jpg','http://pnwhn87vf.bkt.clouddn.com/product/23-4.jpg',NULL,'0'),(24,'JM Solution肌司妍 水光蜂蜜面膜','JM Solution肌司妍 水光蜂蜜面膜',80.00,37.00,70.00,10,82,NULL,'4','6',10,'1','0','2019-03-19 02:43:00','2019-04-15 03:09:28','http://pnwhn87vf.bkt.clouddn.com/product/24-1.jpg','http://pnwhn87vf.bkt.clouddn.com/product/24-2.jpg','http://pnwhn87vf.bkt.clouddn.com/product/24-3.jpg','http://pnwhn87vf.bkt.clouddn.com/product/24-4.jpg',NULL,'1'),(1334,'JM Solution肌司妍 海洋珍珠深层保湿面膜','JM Solution肌司妍 海洋珍珠深层保湿面膜',80.00,37.00,68.00,100,20,NULL,'4','6',10,'1','0','2019-04-14 04:51:40','2019-04-15 02:58:51','http://ppf0hsoua.bkt.clouddn.com/product/1334-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1334-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1334-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1334-4.jpg',NULL,'1'),(1335,'Chanel香奈儿 可可小姐淡香水喷雾','Chanel香奈儿 可可小姐淡香水喷雾',608.00,585.00,NULL,23,102,'http://ppf0hsoua.bkt.clouddn.com/product/1335-0.jpg','9','5',12,'1','0','2019-04-15 03:37:56','2019-04-15 03:39:03','http://ppf0hsoua.bkt.clouddn.com/product/1335-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1335-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1335-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1335-4.jpg',NULL,'0'),(1336,'Estee Lauder 雅诗兰黛 小棕瓶密集修护眼精华','Estee Lauder 雅诗兰黛 小棕瓶密集修护眼精华',388.00,338.00,0.00,73,85,NULL,'12','6',7,'1','0','2019-04-15 08:16:21','2019-04-15 08:27:43','http://ppf0hsoua.bkt.clouddn.com/product/1336-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1336-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1336-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1336-4.jpg',NULL,'0'),(1337,'Decorte 黛珂 牛油果乳液','Decorte 黛珂 牛油果乳液',480.00,431.00,NULL,13,46,'http://ppf0hsoua.bkt.clouddn.com/product/1337-0.jpg','11','6',14,'1','0','2019-04-15 08:38:57','2019-04-15 08:39:12','http://ppf0hsoua.bkt.clouddn.com/product/1337-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1337-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1337-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1337-4.jpg',NULL,'0'),(1338,'Nars 纳斯 炫色腮红','Nars 纳斯 炫色腮红',175.00,149.00,NULL,21,57,'http://ppf0hsoua.bkt.clouddn.com/product/1338-0.jpg','6','5',15,'1','0','2019-04-15 09:09:26','2019-04-15 09:09:46','http://ppf0hsoua.bkt.clouddn.com/product/1338-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1338-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1338-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1338-4.jpg',NULL,'0');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL COMMENT '场景',
  `type` varchar(255) DEFAULT NULL COMMENT '满减，赠礼',
  `rule` varchar(255) DEFAULT NULL COMMENT '满金额，满数量',
  `amount` double(255,0) DEFAULT NULL COMMENT '满减-满多少可以减；赠礼-满多少可以送',
  `total` double DEFAULT NULL COMMENT '赠礼-满几件送',
  `reduction` double(255,0) DEFAULT NULL COMMENT '满减-减多少',
  `gift` varchar(255) DEFAULT NULL,
  `brandId` varchar(255) DEFAULT NULL,
  `categoryId` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (12,'雅诗兰黛全场每满300减30','brand','money','amount',300,0,30,'','7','','0'),(13,'面膜全场任意品牌五盒送一盒','category','gift','total',0,5,0,'面膜','','4','0'),(14,'口红全场任意品牌满500减50','category','money','amount',500,0,50,'面膜','','2','0'),(15,'蒂佳婷五盒送一盒','brand','gift','total',0,5,0,'','8','','1');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchhistory`
--

DROP TABLE IF EXISTS `searchhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kw` varchar(255) DEFAULT NULL,
  `openId` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchhistory`
--

LOCK TABLES `searchhistory` WRITE;
/*!40000 ALTER TABLE `searchhistory` DISABLE KEYS */;
INSERT INTO `searchhistory` VALUES (1,'dior','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-15 15:54:51');
/*!40000 ALTER TABLE `searchhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(255) DEFAULT NULL,
  `wechatId` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL COMMENT '0-没付过款（属于新人），1-付过款（不属于新人）',
  `bonusAmount` double(255,0) DEFAULT NULL COMMENT '分享红包现金奖励',
  `level` varchar(255) DEFAULT NULL COMMENT '用户级别',
  `totalPay` double(255,0) DEFAULT NULL COMMENT '消费总额',
  `membershipFirstDay` timestamp NULL DEFAULT NULL COMMENT '会员日期生效日',
  `amountAfterMSFD` double(255,0) DEFAULT NULL COMMENT '会员生效日后面付款金额',
  `amountThisMonth` double(255,0) DEFAULT NULL COMMENT '本月消费金额',
  `points` double(255,0) DEFAULT NULL COMMENT '积分',
  `lastCheckInDate` timestamp NULL DEFAULT NULL COMMENT '最后一次签到日期',
  `continuousNum` int(255) DEFAULT NULL COMMENT '连续签到天数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `openId` (`openId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'oX-br4rfqn2ia4g6kGdbFKlkgBYw',NULL,'1',30,'0',622,NULL,0,622,427,'2019-04-15 06:54:25',1),(3,'oX-br4neGzmMBKR7ByjoXRUA1-NM',NULL,'1',0,'3',24885,'2019-04-15 07:29:57',0,24885,20595,'2019-04-15 08:10:40',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewhistory`
--

DROP TABLE IF EXISTS `viewhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(255) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `categoryId` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `openId` (`openId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewhistory`
--

LOCK TABLES `viewhistory` WRITE;
/*!40000 ALTER TABLE `viewhistory` DISABLE KEYS */;
INSERT INTO `viewhistory` VALUES (1,'oX-br4rfqn2ia4g6kGdbFKlkgBYw','15','2','2019-04-15 15:09:24'),(2,'oX-br4neGzmMBKR7ByjoXRUA1-NM','15','2','2019-04-15 15:14:31'),(3,'oX-br4neGzmMBKR7ByjoXRUA1-NM','23','10','2019-04-15 15:29:02'),(4,'oX-br4neGzmMBKR7ByjoXRUA1-NM','23','10','2019-04-15 15:30:44'),(5,'oX-br4neGzmMBKR7ByjoXRUA1-NM','23','10','2019-04-15 15:32:23'),(6,'oX-br4neGzmMBKR7ByjoXRUA1-NM','23','10','2019-04-15 15:33:20'),(7,'oX-br4neGzmMBKR7ByjoXRUA1-NM','21','4','2019-04-15 15:51:30'),(8,'oX-br4neGzmMBKR7ByjoXRUA1-NM','1338','6','2019-04-15 15:53:43'),(9,'oX-br4neGzmMBKR7ByjoXRUA1-NM','1338','6','2019-04-15 15:53:54'),(10,'oX-br4neGzmMBKR7ByjoXRUA1-NM','12','3','2019-04-15 15:54:27'),(11,'oX-br4neGzmMBKR7ByjoXRUA1-NM','12','3','2019-04-15 15:54:29'),(12,'oX-br4neGzmMBKR7ByjoXRUA1-NM','9','2','2019-04-15 15:54:54'),(13,'oX-br4neGzmMBKR7ByjoXRUA1-NM','9','2','2019-04-15 15:58:37'),(14,'oX-br4neGzmMBKR7ByjoXRUA1-NM','15','2','2019-04-15 16:05:22'),(15,'oX-br4neGzmMBKR7ByjoXRUA1-NM','15','2','2019-04-15 16:06:36');
/*!40000 ALTER TABLE `viewhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-16  0:35:29
