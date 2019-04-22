-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: eshop
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
  `referCategoryId` varchar(255) DEFAULT NULL,
  `typeId` varchar(255) DEFAULT NULL COMMENT '0-公共，1-种草笔记',
  `announceStyle` varchar(255) DEFAULT NULL,
  `imgs` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `mainImgUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `state` (`state`),
  KEY `state_referProductId_referCategoryId` (`state`,`referProductId`,`referCategoryId`),
  KEY `state_tags` (`state`,`tags`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (11,'三款热门洗面奶选哪款? 洗面奶测评','2019-04-16 10:09:54','洗面奶我也用过十几款了，大牌的、平价的也踩过很多坑，今天就先给大家测评下这三款很火的、价格差不多的洗面奶<br />\n<br />\nCPB洗面奶（滋润版）<br />\n推荐指数：5<br />\n价格：专柜价格￥500/125g<br />\n适合肤质：干皮（清爽版适合油皮）<br />\n使用感受：这款泡?最多，挤一点就能搓出很多泡?来，膏体很滋润很丝滑，并且很容易清洗，虽然它是皂基洗面奶，但是洗完脸后，一点也不干，不假滑?<br />\n<br />\nSK2洗面奶<br />\n推荐指数：4<br />\n价格：专柜价格 ￥460/120g<br />\n适合肤质：敏感肌、痘痘肌<br />\n使用感受：这款是氨基酸洗面奶，质地温和，洗完不紧绷，里面含有神仙水的主要成分，有深层清洁，改善油脂的功效，就是不是太容易清洗，洗完稍微有一点假滑?<br />\n<br />\n香奈儿山茶花洗面奶（粉色)&nbsp;<br />\n推荐指数：5<br />\n价格：专柜价格 ￥420/150g<br />\n适合肤质：干皮，敏感肌&nbsp;<br />\n使用感受：这款味道最好闻的，有淡淡的山茶花香味，膏体也比较细腻丝滑，洗完不紧绷，不假滑， 这款性价比最高，150g的容量能用很长时间?<br />\n<br />\n推荐排名：香奈儿 &gt; CPB &gt; SK2 !! 最后科普一下，氨基酸洗面奶和皂基洗面奶的区别：<br />\n<br />\n氨基酸洗面奶比较温和，对皮肤刺激小，保湿效果好，适合敏感皮肤，不过清洁力度比皂基洗面奶弱一些。另外不要觉得皂基洗面奶用了不好，会烂脸，皂基洗面奶清洁能力很强，比较适合油皮、混油皮，所以洗面奶还是要根据自己的肤质和需求来选哦?<br />','1345',NULL,'1','',NULL,'洁面;SKII;CPB;Chanel;','1',NULL),(12,'干货分享｜黄皮巨显白的16支热门口红清单','2019-04-16 14:26:23','Dior烈焰蓝金哑光999<br />\n人气最高的正红色，显色度超高，复古感十足，巨显白，让你惊艳到无法自拔。<br />\n<br />\n<br />\nDior漆光740<br />\n结合了唇釉与唇膏的优点，超级显白的枫叶红，带着砖红色与橘色的魅力。<br />\n<br />\n<br />\nYSL方管1号色Le Rouge正红色<br />\n气场瞬间一米八的一个颜色哦，偏正红色，显气质超吸睛，显白不止一个度。<br />\n<br />\n<br />\nYSL圆管46号色迷魅亮彩圆管唇膏口红Orange Perfecto<br />\n特别适合黄皮的一款颜色，超级显气质，偏珊瑚橘色，适合春夏的一款颜色哦。<br />\n<br />\n<br />\nYSL黑管唇釉416<br />\n显白不挑皮的颜色，棕调的番茄色，对黄黑皮友好到没的说，滋润度也很nice。<br />\n<br />\n<br />\nYSL小金条21号色<br />\n小金条里面的断货王，被李佳琦吹爆的一支口红，小姐姐抢货抢到人生崩塌。<br />\n<br />\n<br />\nCHANNEL丝绒58号色<br />\n薄涂是温柔的豆沙色，厚涂是棕红色，很实用的一支，超级有质感的颜色。<br />\n<br />\n<br />\nCHANNEL唇釉154号色<br />\n香奈儿里面的老网红了，显白还很提气质，到现在还是有好多仙女钟爱的一支。<br />\n<br />\n<br />\nTF黑管16号色Scarlet Rouge<br />\n涂上之后显得皮肤瞬间白了好几个度，巨显白，滋润度也超好，无法拒绝。<br />\n<br />\n<br />\nTF白管07号色Paradiso 3g<br />\n春天的颜色哦，万年的断货王，显白又少女的颜色，粉嫩嫩的首pick。<br />\n<br />\n<br />\nARMANI红管唇釉405<br />\n炒到一度断货的颜色，哑光丝绒却水润到感人的番茄红，真的超级无敌巨显白。<br />\n<br />\n<br />\n兰蔻菁纯丝绒口红 196<br />\n<br />\n橘的很妙的一款颜色，真的很胡萝卜，黄皮白皮随便上，显白显气质，质地超好。<br />\n<br />\n<br />\nMAC子弹头唇膏/口红 Chili&nbsp;<br />\nMac的必入款哦，火辣辣的小辣椒色，超级不挑皮，无敌巨显白。<br />\n<br />\n<br />\n纪梵希小羊皮315<br />\n姨妈色的鼻祖，之前还是baby的明星效应带火的，显白指数我给五星。<br />\n<br />\n<br />\n娇兰臻彩宝石口红/唇膏 25号色&nbsp;<br />\n传说中的冰冰色，hin有女人味的一款颜色哦，无敌显白的色系之一啦~~<br />\n<br />\n<br />\nCPB蔷薇口红/唇膏 311 Vivid red<br />\n超级经典的正红色，带有一丝丝绒哑光，上嘴很润，唇周肤色瞬间亮一度。<br />','15',NULL,'1','',NULL,'口红;YSL;Dior;TF;','1',NULL),(13,'nars腮红三部曲｜三大热门腮红推荐','2019-04-16 14:45:18','Nars腮红三部曲！Deep Throat深喉 /Orgasm高潮 /Sex Appeal 性感魅力<br />\n1、Deep Throat 深喉<br />\n带偏珠光的细闪，但不是特别高调那种，粉色系，颜色属于粉色带点蜜桃,上脸非常粉嫩，比较显气色，想尝试带闪腮红又怕太夸张的可以试试这个哦。虽然也带闪但是是那种很细的小珠光，存在感比orgasm低很多，所以也更日常！这块属于白皮黄皮都能hold住的，上脸一秒提气色效果超明显！少女心爆棚！而且显色度超好，所以需要少量多次叠加。持久度也没问题，带妆一整天不是事儿。<br />\n2、Orgasm 高潮<br />\n潮是偏橘粉的珊瑚红，有细微珠光，比深喉更闪一些，粉质细腻不掉妆，带高调的金闪，比较显色，且比较显毛孔，桃粉色偏橘色，更适合白皮一些。粉嫩的元气少女色，很显脸色好、软萌的感觉，可以眼影可以腮红～<br />\n高潮、深喉区别：高潮带金闪适合白皮，深喉带银闪适合黄陂～<br />\n3、Sex Appeal 性感魅力<br />\n非常浅的亚光蜜桃粉，偏暖调，粉质细腻不显毛孔，颜色浅所以不怕猴屁股，显色持久而且超元气，它和高潮刷出来的颜色比较像，区别在于有无偏光，高潮因为偏光重很挑皮肤状态，但是Sex appeal对瑕疵比较友好，完全不挑肤质～<br />','1338',NULL,'1','',NULL,'腮红;Nars;','1',NULL),(14,'口红全场500减50','2019-04-17 05:15:07','aaaaa','13',NULL,'0','small',NULL,'口红','0',NULL),(15,'两款爆火气垫测评对比|爱敬气垫vsDPC豹纹气垫','2019-04-19 13:13:55','真的超级喜欢韩妆，感觉都太符合亚洲女孩子的审美了！！这两款韩系气垫都入了，是我近期超级喜欢的两款气垫，今天想给大家测评一下！！！<br />\n<br />\n水润：豹纹会稍微轻薄一点，会比较轻薄，妆感较轻。但是爱敬也很润，我光是在膏体上抹也可以抹出水来，而且使用感上有比较清凉的感觉。<br />\n<br />\n遮瑕：爱敬气垫妥妥的胜出！！！遮瑕太优秀了，基本的瑕疵遮得干净，毕竟是粉膏类的，遮瑕能力一绝。<br />\n<br />\n包装：这两位包装可谓是不相上下。DPC的粉红豹纹真的非常的好看，而且很特别，里面的海绵垫也是豹纹的，非常可爱。<br />\n但是我更喜欢爱敬的花纹气垫，里面是花纹交叉的像咖啡的勾花一样，更加有高级感～质感也比较沉一些，豹纹气垫要轻一些！<br />\n<br />\n持久度：爱敬气垫胜出！！<br />\n在我脸上爱敬气垫那边脸，出油后妆几乎没有掉，但是dpc会掉一点点，毕竟比较轻薄。<br />\n<br />\n色号：两款我都是买的最白色号<br />\n相比之下，爱敬的颜色更白皙一点<br />\n总之，我感觉DPC更适合皮肤状态比较好，喜欢清透自然妆效的妹子，而爱敬更适合长时间续航待机的情况下，追求完美的底妆的mm～<br />','1353',NULL,'1','',NULL,'DPC;爱敬;气垫;','1',NULL),(16,'新手攻略','2019-04-19 15:27:09','<img src=\"http://ppf0hsoua.bkt.clouddn.com/freshMan.jpg\" alt=\"\" />','8',NULL,'0','small',NULL,'新手攻略','1',NULL);
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
INSERT INTO `banneritem` VALUES (1,'http://ppf0hsoua.bkt.clouddn.com/banner/spring_new.jpg','../points/points','1','春季上新','0','2019-03-05 06:22:01','2019-04-18 09:25:35','春季上新'),(2,'','aaa','1','小红书推荐','1','2019-03-05 06:22:01','2019-03-24 06:01:39',NULL),(3,'','ddd','1','女王节','1','2019-03-05 06:22:01','2019-03-24 06:01:39',NULL),(4,'','ddd','1','化妆品套装','1','2019-03-05 06:22:01','2019-03-24 06:01:39','化妆品套装'),(5,'','ddd','1','清洁','1','2019-03-05 06:22:01','2019-03-24 06:01:39',NULL),(6,'','../productList/productList?id=2&type=category','1','口红','2','2019-03-07 08:39:08','2019-03-24 06:01:39',NULL),(7,'','../productList/productList?id=4&type=category','1','面膜','2','2019-03-14 00:58:49','2019-03-24 06:01:39',NULL),(8,'','../productList/productList?id=8&type=category','1','礼盒套装','2','2019-03-14 01:23:07','2019-03-24 06:01:39',NULL),(9,'','../productList/productList?id=9&type=category','1','女士香水','2','2019-03-14 01:27:56','2019-03-24 06:01:39',NULL),(10,'','../productList/productList?id=3&type=category','1','眼影','2','2019-03-14 01:40:58','2019-03-24 06:01:39',NULL),(11,'','../productList/productList?id=6&type=category','1','腮红','2','2019-03-14 01:42:29','2019-03-24 06:01:39',NULL),(12,'','../productList/productList?id=7&type=category','1','防晒护理','2','2019-03-14 01:44:53','2019-03-24 06:01:39',NULL),(13,'','../productList/productList?id=10&type=category','1','精华','2','2019-03-14 01:47:35','2019-03-24 06:01:39',NULL),(14,'','../productList/productList?id=12&type=category','1','眼霜','2','2019-03-14 01:47:47','2019-03-24 06:01:39',NULL),(15,'','../productList/productList?id=11&type=category','1','乳液','2','2019-03-14 01:48:05','2019-03-24 06:01:39',NULL),(16,'','../brand/brand','1','品牌闪购','4','2019-03-15 02:58:50','2019-03-24 06:01:39','满300减50'),(17,'','../points/points','1','积分赢好礼','4','2019-03-15 03:12:45','2019-04-11 06:13:51','下单抵现金'),(18,'','../rank/rank','1','排行榜','4','2019-03-15 03:13:02','2019-03-24 06:01:39','药丸面膜'),(19,'http://ppf0hsoua.bkt.clouddn.com/couponBanner.jpg','../coupon/coupon','1','领取优惠券','0','2019-03-15 05:14:24','2019-04-19 08:43:10','领取优惠券'),(20,'http://ppf0hsoua.bkt.clouddn.com/freshManBanner.jpg','../article/article?articleId=16','1','新手攻略','0','2019-03-15 05:57:37','2019-04-19 16:38:49','新手攻略'),(21,'http://pnwhn87vf.bkt.clouddn.com/skii.jpg','../flashSale/flashSale','1','限时购','3','2019-03-15 03:13:02','2019-04-18 09:13:32','药丸面膜60起'),(22,'http://ppf0hsoua.bkt.clouddn.com/red.jpg','../bonus/bonus','1','分享好礼','3','2019-03-28 09:13:39','2019-04-18 09:12:53','得15元现金红包');
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `state` (`state`),
  KEY `state_country` (`state`,`country`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'圣罗兰','YSL','2','法国','1','2019-03-05 06:21:52',NULL,NULL),(2,'阿玛尼','Giorgio Armani','2','法国','1','2019-03-05 06:21:52',NULL,NULL),(3,'NYX','NYX','1','美国','1','2019-03-05 06:21:52',NULL,NULL),(4,'井田','canmake','0','日本','1','2019-03-05 06:21:52',NULL,NULL),(5,'魅可','mac','1','美国','1','2019-03-05 06:21:52',NULL,NULL),(6,'汤姆福特','TF','2','法国','1','2019-03-11 09:07:31','2019-03-11 09:07:44',NULL),(7,'雅诗兰黛','Estee Lauder','2','法国','1','2019-03-11 09:10:47','2019-03-11 09:10:49',NULL),(8,'蒂佳婷','Dr.Jart+','1','韩国','1','2019-03-12 04:44:15','2019-03-12 04:44:18',NULL),(9,'安耐晒','ANESSA','2','日本','1','2019-03-12 04:59:34','2019-03-12 04:59:42',NULL),(10,'肌司妍','JM solution','1','韩国','0','2019-03-18 08:33:58',NULL,NULL),(11,'迪奥','Dior','2','法国','1','2019-04-10 10:20:06','2019-04-10 10:20:12',NULL),(12,'香奈儿','Chanel','2','法国','1','2019-04-15 03:38:37','2019-04-15 03:38:44',NULL),(13,'SK2','SK-II','2','日本','1','2019-04-15 05:49:27','2019-04-15 17:24:04',NULL),(14,'黛珂','Decorte','2','日本','1','2019-04-15 08:37:40','2019-04-15 08:37:44',NULL),(15,'纳斯','Nars','1','美国','1','2019-04-15 09:06:54','2019-04-15 09:06:59',NULL),(16,'娇韵诗','Clarins','1','法国','1','2019-04-15 16:44:30','2019-04-15 16:44:33',NULL),(17,'馥蕾诗','fresh','2','法国','1','2019-04-15 16:53:01','2019-04-15 16:53:04',NULL),(18,'凡尔赛','Creer Beaute','2','日本','1','2019-04-15 17:05:42','2019-04-15 17:05:45',NULL),(19,'肌肤之钥','CPB','2','日本','1','2019-04-15 17:16:28','2019-04-15 17:16:32',NULL),(20,'后','Whoo','2','韩国','1','2019-04-18 12:40:19','2019-04-18 12:40:26',NULL),(21,'科颜氏','Kiehl\'s','2','美国','1','2019-04-18 13:03:48','2019-04-18 13:03:53',NULL),(22,'兰蔻','Lancome','2','法国','1','2019-04-19 06:08:12','2019-04-19 06:08:16',NULL),(23,'雪花秀','Sulwhasoo','2','韩国','1','2019-04-19 11:35:13','2019-04-19 11:35:39',NULL),(24,'DPC','DPC','1','韩国','1','2019-04-19 12:58:15','2019-04-19 12:58:21',NULL),(25,'爱敬','AGE','1','韩国','1','2019-04-19 13:20:38','2019-04-19 13:20:41',NULL),(26,'资生堂','Shiseido','1','日本','1','2019-04-19 13:54:09','2019-04-19 13:54:19',NULL);
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `recommend` (`recommend`),
  KEY `parentCategoryId_state` (`parentCategoryId`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,NULL,'口红','5','http://i1.bvimg.com/677237/3ff60a7512c83d00.jpg','1','1','2019-03-05 06:21:42',NULL),(3,'眼影','眼影','5',NULL,'1','1','2019-03-05 06:21:42','2019-04-19 02:43:53'),(4,'面膜','面膜','6','http://i1.bvimg.com/677237/7f65e6d21ffaa0a3.jpg','1','1','2019-03-05 06:21:42','2019-03-14 00:44:30'),(6,'腮红','腮红','5','category/6.jpg','1','1','2019-03-07 08:32:41','2019-04-19 02:43:54'),(7,'防晒护理','防晒护理','7','category/7.jpg','1','1','2019-03-12 04:58:57','2019-04-18 13:49:55'),(8,'礼盒套装','礼盒套装','6','category/8.jpg','1','1','2019-03-14 01:22:34','2019-04-19 02:43:59'),(9,'女士香水','女士香水','5','category/9.jpg','1','1','2019-03-14 01:27:05','2019-04-19 02:43:51'),(10,'精华/肌底液','精华/肌底液','6','category/10.jpg','1','1','2019-03-14 01:46:26','2019-04-19 02:44:01'),(11,'面霜/乳液','面霜/乳液','6','category/11.jpg','1','1','2019-03-14 01:46:39','2019-04-19 02:44:03'),(12,'眼霜/精华','眼霜/精华','6','category/12.jpg','1','1','2019-03-14 01:46:52','2019-04-19 02:44:05'),(13,'洁面','洁面','6','category/13.jpg','1','1','2019-03-14 01:47:04','2019-04-19 14:10:32'),(14,'化妆水','化妆水','6','category/14.jpg','1','1','2019-04-18 13:11:03','2019-04-19 14:10:28'),(15,'粉底/液','粉底/液','5','category/15.jpg','1','1','2019-04-19 12:56:27','2019-04-19 14:10:16');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `productId` varchar(0) DEFAULT NULL,
  `inventory` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
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
INSERT INTO `coupon` VALUES (1,'满1000减50',1000,50,'1','2019-03-31 08:00:00','2019-04-30 08:00:00','0'),(2,'满500减30',500,30,'1','2019-03-31 08:00:00','2019-04-30 08:00:00','0'),(3,'满200减10',200,10,'1','2019-03-31 08:00:00','2019-04-30 08:00:00','0'),(4,'满500减25',500,25,'0','2019-03-31 08:00:00','2019-04-06 08:00:00','0');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eshopconfig`
--

LOCK TABLES `eshopconfig` WRITE;
/*!40000 ALTER TABLE `eshopconfig` DISABLE KEYS */;
INSERT INTO `eshopconfig` VALUES (1,'xxcUrl','http://ppf0hsoua.bkt.clouddn.com/contact.jpg',''),(2,'noticeMsg','欢迎在线咨询徐小柴~',NULL),(3,'productImgBase','http://ppf0hsoua.bkt.clouddn.com/product/',NULL),(4,'categoryImgBase','http://ppf0hsoua.bkt.clouddn.com/category/',NULL),(5,'bannerImgBase','http://ppf0hsoua.bkt.clouddn.com/banner/',NULL),(6,'preSearch','TF/CPB/SK2/面膜/神仙水',''),(7,'countryFlagImgBase','http://ppf0hsoua.bkt.clouddn.com/country/',NULL),(8,'articlePreSearch','CPB/口红/洗面奶/Nars',''),(9,'bonus','15',NULL),(10,'shareTitle','小柴精选 全球品质好物',''),(11,'goldDiscount','0.98',NULL),(12,'platinumDiscount','0.93',NULL),(13,'diamondDiscount','0.88',NULL),(14,'showNoticeMessage','0',NULL),(15,'brandImgBase','http://ppf0hsoua.bkt.clouddn.com/brand/','品牌的图片base地址'),(16,'productDetailImgBase','http://ppf0hsoua.bkt.clouddn.com/detail/','商品详情图片的base地址'),(17,'shareImgUrl','http://ppf0hsoua.bkt.clouddn.com/logo.jpg','分享链接的图片地址'),(18,'licenceImgUrl','http://ppf0hsoua.bkt.clouddn.com/licenceCopy.jpg','营业执照图片地址'),(19,'articleImgBase','http://ppf0hsoua.bkt.clouddn.com/article/','文章的图片base地址'),(20,'bonusImgUrl','http://ppf0hsoua.bkt.clouddn.com/bonusShare.jpg','分享红包页面的图片');
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eshoporder`
--

LOCK TABLES `eshoporder` WRITE;
/*!40000 ALTER TABLE `eshoporder` DISABLE KEYS */;
INSERT INTO `eshoporder` VALUES (47,'1','2019-04-15 14:47:13','1','20190415224712710006','18217683505',276,2,'1','1','oX-br4rfqn2ia4g6kGdbFKlkgBYw',NULL,'','2019-04-15 22:51:30',NULL,'share','oX-br4neGzmMBKR7ByjoXRUA1-NM','','','',0,0,0),(48,'号','2019-04-15 15:10:08','1','20190415231008296472','18217683505',346,1,'a','啊','oX-br4rfqn2ia4g6kGdbFKlkgBYw',NULL,'','2019-04-15 23:11:13',NULL,'share','oAEfX5U6TQ-VgmIiN9OYdm6Homj8','','','',0,0,200),(49,'2','2019-04-15 15:25:22','2','20190415232520400000','18218683505',348,1,'5','5','oX-br4neGzmMBKR7ByjoXRUA1-NM','787219837213','啊','2019-04-17 17:29:01','圆通','share','oX-br4rfqn2ia4g6kGdbFKlkgBYw','','','',0,0,0),(50,'1','2019-04-15 15:29:31','1','20190415232930401342','18217683505',3147,3,'5','5','oX-br4neGzmMBKR7ByjoXRUA1-NM',NULL,'5','2019-04-15 23:29:56',NULL,'','','','','',0,0,300),(51,'是','2019-04-15 15:31:37','-1','20190415233136292689','18217683505',9241,9,'18217683505','5','oX-br4neGzmMBKR7ByjoXRUA1-NM',NULL,'','2019-04-15 23:32:02',NULL,'','','','','',0,0,2000),(52,'了','2019-04-15 15:32:45','1','20190415233245256045','18217683505',10270,10,'了','了','oX-br4neGzmMBKR7ByjoXRUA1-NM',NULL,'','2019-04-15 23:33:00',NULL,'','','','','',0,0,2000),(53,'e','2019-04-15 15:40:39','3','20190415234038637522','18217683505',9890,37,'e','a','oX-br4neGzmMBKR7ByjoXRUA1-NM','44','','2019-04-17 17:26:27','dd','share','oAEfX5U6TQ-VgmIiN9OYdm6Homj8','','','',0,0,2000),(54,'是','2019-04-15 16:05:48','1','20190416000548101598','18217683505',1230,2,'啊','啊','oX-br4neGzmMBKR7ByjoXRUA1-NM',NULL,'','2019-04-16 00:06:18',NULL,'share','oAEfX5U6TQ-VgmIiN9OYdm6Homj8','','','',0,0,0),(55,'的','2019-04-18 06:56:10','0','2019041814561080353021','18217683505',286,1,'h','了','oX-br4neGzmMBKR7ByjoXRUA1-NM',NULL,'',NULL,NULL,'','','','','',0,0,2000),(56,'13130893127','2019-04-19 03:26:07','0','2019041911260751372853','13130893127',220,1,'凌凤华','辽宁省铁岭市调兵山市红房祥和15楼','oX-br4lQCGCtT5woCNdABpiwHMnE',NULL,'',NULL,NULL,'share','oX-br4rfqn2ia4g6kGdbFKlkgBYw','','','',0,0,0),(57,'lingfx68','2019-04-19 03:47:00','0','2019041911465962414854','13130893127',220,1,'凌凤华','辽宁省调兵山市红房第五小学','oX-br4uxKDAVk3UL66iSMTbChcjY',NULL,'',NULL,NULL,'share','oX-br4rfqn2ia4g6kGdbFKlkgBYw','','','',0,0,0),(58,'13130893127','2019-04-19 04:51:35','1','2019041912513549928014','13130893127',220,1,'凌凤华','辽宁省铁岭市调兵山市红房祥和15楼','oX-br4lQCGCtT5woCNdABpiwHMnE',NULL,'','2019-04-19 14:03:16',NULL,'share','oX-br4rfqn2ia4g6kGdbFKlkgBYw','','','',0,0,0),(59,'buwangchuxing_lay','2019-04-19 07:17:31','1','2019041915173052424725','15862858500',420,1,'李小姐','上海市浦东新区银城中路501号上海中心大厦4201','oX-br4vPsMGtKCRNpIv_-MMbkcWg',NULL,'','2019-04-19 15:22:28',NULL,'','','','','',0,0,0),(60,'ziyu425007','2019-04-19 08:47:58','1','2019041916475868461206','13826205338',503,3,'简燕婷','广州市荔湾路小梅大街33号皇上皇大厦A栋902房','oX-br4tVRSPwDu05voAEdBjoUCg4',NULL,'','2019-04-19 16:52:40',NULL,'','','','','2',0,30,0);
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
  KEY `productIdState` (`productId`,`state`) USING BTREE,
  KEY `productId_state` (`productId`,`state`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `format`
--

LOCK TABLES `format` WRITE;
/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` VALUES (1,'Chili 小辣椒',158,'8','1',0.00),(2,'Ruby Woo 复古正红色',158,'8','1',0.00),(3,'#80 Impassined',368,'15','1',0.00),(4,'#15 Wild Ginger',358,'15','1',NULL),(5,'#999 哑光',288,'9','1',238.00),(6,'#400 The Red',225,'10','1',NULL),(7,'#405 Sultan',328,'10','1',NULL),(8,'五片 / 盒',80,'21','1',60.00),(9,'60ml',240,'22','1',220.00),(10,'230ml',1100,'23','1',0.00),(11,'十片/盒',80,'24','1',70.00),(12,'十片/盒',80,'1334','1',68.00),(13,'五片/盒',50,'1334','1',38.00),(14,'50ml',650,'1335','1',618.00),(15,'100ml',950,'1335','1',900.00),(16,'15ml',388,'1336','1',0.00),(17,'300ml',500,'1337','1',480.00),(18,'Warm Neutrals',178,'11','1',0.00),(19,'Omega 柔亮米褐色',158,'12','1',0.00),(20,'#02 自然咖啡色',75,'13','1',0.00),(21,'#05 粉红咖啡',75,'13','1',0.00),(22,'#10 淡粉红',75,'13','1',0.00),(23,'#15 暮光亮蓝',75,'13','1',0.00),(24,'#14 古典深红',75,'13','1',0.00),(25,'#07 桃红',75,'13','1',0.00),(26,'#Deep Throat 深喉',220,'1338','1',0.00),(27,'#Sex Appeal 性感',220,'1338','1',0.00),(28,'#Orgasm 高潮',220,'1338','1',0.00),(29,'150ml',260,'1339','1',0.00),(30,'100ml',435,'1340','1',0.00),(31,'100ml',650,'1341','1',0.00),(32,'125g',400,'1342','1',0.00),(33,'银色(美白保湿)  1片/27ml',35,'1343','1',0.00),(34,' 红色(白金保湿)  1片/27ml',35,'1343','1',0.00),(35,'金色(弹力保湿) 1片/27ml',35,'1343','1',0.00),(36,'120g',420,'1344','1',0.00),(37,'滋润型/110ml',400,'1345','1',0.00),(38,'清爽型/110ml',400,'1345','1',0.00),(39,'Dangerous 橘红色',145,'8','1',0.00),(40,'Marrakesh 砖红',160,'8','1',0.00),(41,'Cockney 斩男水红色',145,'8','1',0.00),(42,'Lady Bug 元气西红柿红',145,'8','1',0.00),(43,'See Sheer 西柚色',148,'8','1',0.00),(44,'#21 Naked Coral',335,'15','1',0.00),(45,'#10 Cherry Lush',340,'15','1',0.00),(46,'#08  Flamingo',355,'15','1',0.00),(47,'#16 Scarlet Rouge',385,'15','1',0.00),(48,'#999',290,'9','1',0.00),(49,'#762',255,'9','1',0.00),(50,'#060',258,'9','1',0.00),(51,'#080',265,'9','1',0.00),(52,'#520',285,'9','1',0.00),(53,'#567',285,'9','1',0.00),(54,'Whoo 后 天气丹津率享水乳七件套装',880,'1346','1',0.00),(55,'拱辰享水妍平衡水乳霜6件套装',700,'1347','1',0.00),(56,'60ml',300,'1348','1',0.00),(57,'150ml',280,'1349','1',0.00),(58,'300ml',450,'1349','1',0.00),(59,'紫苏水300ml+牛油果乳液300ml',900,'1350','1',0.00),(60,'200ml',225,'1351','1',0.00),(61,'400ml',350,'1351','1',0.00),(62,'30ml',135,'22','1',125.00),(63,'Sulwhasoo 雪花秀 滋阴平衡迷你五件套装',195,'1352','1',0.00),(64,'#21 Pink Beige',208,'1353','1',0.00),(65,'#23 Pink Vanilla',208,'1353','1',0.00),(66,'#21 Light Beige',178,'1354','1',0.00),(67,'#13 Ivory White',178,'1354','1',0.00),(68,'#23 Nature Beige',178,'1354','1',0.00),(69,'#30 活力珊瑚橘/3.9ml',328,'1355','1',0.00),(70,'#51 心跳粉/3.9ml',328,'1355','1',0.00),(71,'#PK107 6.5g',285,'1356','1',0.00),(72,'清爽型/200ml',320,'1357','1',0.00),(73,'滋润型/200ml',320,'1357','1',0.00),(74,'日霜50ml+晚霜50ml',800,'1358','1',0.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (11,1,'201903111105062979734','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(12,1,'201903111107147199074','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(13,1,'201903111109167016132','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(14,2,'201903111115107671399','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(15,1,'201903111115107671399','Tom Ford?±¤?§??????? lip color é??é?????è??',358.00,NULL,'4','15','#15 Wild Ginger'),(16,1,'201903111118019758198','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(17,1,'201903111124236765930','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(18,1,'201903111129304477200','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,NULL,'3','15','#80'),(19,1,'201903111130077986515','Tom Ford??±?¤??§??????? lip color ????????????¨??',348.00,NULL,'3','15','#80'),(20,1,'201903111304584002459','Tom Ford?±¤?§??????? lip color é??é?????è??',348.00,'','3','15','#80'),(21,1,'201903111304584002459','Tom Ford?±¤?§??????? lip color é??é?????è??',358.00,'','4','15','#15 Wild Ginger'),(22,1,'201903111735566646844','Dioré????????è??',288.00,'','5','9','#999 ??????'),(23,1,'201903111735566646844','MAC???è??',138.00,'','1','8','01 cilli'),(24,1,'201903111735566646844','MAC???è??',145.00,'','2','8','ruby woo'),(25,1,'201903111744388104120','Dioré????????è??',288.00,'','5','9','#999 ??????'),(26,1,'201903111745478540790','MAC???è??',138.00,'','1','8','01 cilli'),(27,1,'201903111751262277431','Dioré????????è??',288.00,'','5','9','#999 ??????'),(28,1,'20190312131940007756','Shiseido è???????? Anessa ???è????? è??é???°????è??UV?????? SPF50',288.00,'','9','22','90ml'),(29,1,'20190313100529064631','é??????°????????°???????é??',225.00,'','6','10','#400 The Red'),(30,1,'20190313103704901593','é??????°????????°???????é??',225.00,'','6','10','#400 The Red'),(31,1,'201903131632425925850','é??????°????????°???????é??',225.00,'','6','10','#400 The Red'),(32,1,'201903131643260583761','é??????°????????°???????é??',225.00,'','6','10','#400 The Red'),(33,1,'201903131644057331577','阿玛尼漆亮水漾唇釉',225.00,'','6','10','#400 The Red'),(34,1,'201903131644588800861','Dioré????????è??',288.00,'','5','9','#999 ??????'),(35,1,'201903131646091152163','Dioré????????è??',288.00,'','5','9','#999 ??????'),(36,1,'201903131647217012071','Dior魅惑唇膏',288.00,'','5','9','#999 哑光'),(37,1,'201903281323589770705','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(38,1,'201903281326079119032','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(39,1,'201903281328019856388','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(40,2,'20190329140926372161','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(41,2,'20190329140957118298','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(42,2,'20190329141309190118','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(43,2,'20190329141412442005','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(44,2,'20190329141459554122','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(45,2,'20190329141711379606','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(46,2,'20190329142147684147','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(47,1,'201904012316345224246','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(48,2,'201904031128376573520','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(49,1,'2019040316352616083','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(50,62,'2019040316372456885','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(51,1,'2019040316400607076','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(52,1,'2019040316412633266','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(53,2,'20190403184757073081','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(54,1,'20190403184757073081','MAC唇膏',138.00,'http://pnwhn87vf.bkt.clouddn.com/product/8-0.jpg','1','8','01 cilli'),(55,1,'20190403185243216168','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg','3','15','#80'),(56,2,'20190412003350438501','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(57,1,'20190412003350438501','Tom Ford汤姆福特 lip color 黑金唇膏',358.00,NULL,'4','15','#15 Wild Ginger'),(58,2,'20190412004649095070','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(59,1,'20190413115054713830','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(60,1,'20190413115054713830','MAC唇膏',138.00,NULL,'1','8','01 cilli'),(61,1,'20190413115234201025','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(62,1,'20190413115234201025','MAC唇膏',138.00,NULL,'1','8','01 cilli'),(63,1,'20190413120138851138','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(64,1,'20190413120138851138','MAC唇膏',138.00,NULL,'1','8','01 cilli'),(65,1,'2019041510422679509','阿玛尼漆亮水漾唇釉',225.00,NULL,'6','10','#400 The Red'),(66,1,'2019041510422679509','JM珍珠面膜',38.00,NULL,'13','1334','五片/盒'),(67,1,'2019041510422679509','JM珍珠面膜',68.00,NULL,'12','1334','十片/盒'),(68,2,'20190415224711062618','MAC 魅可 唇膏',138.00,NULL,'1','8','01 cilli'),(69,2,'20190415224712710006','MAC 魅可 唇膏',138.00,NULL,'1','8','01 cilli'),(70,1,'20190415231008296472','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(71,1,'20190415232520400000','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(72,3,'20190415232930401342','SK-II 护肤精华 神仙水',1050.00,NULL,'10','23','230ml'),(73,9,'20190415233136292689','SK-II 护肤精华 神仙水',1050.00,NULL,'10','23','230ml'),(74,10,'20190415233245256045','SK-II 护肤精华 神仙水',1050.00,NULL,'10','23','230ml'),(75,37,'20190415234038637522','Dior 迪奥 烈焰蓝金唇膏',288.00,NULL,'5','9','#999 哑光'),(76,1,'20190416000548101598','SK-II 护肤精华 神仙水',1050.00,NULL,'10','23','230ml'),(77,1,'20190416000548101598','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(78,1,'2019041814561080353021','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,NULL,'3','15','#80'),(79,1,'2019041911260751372853','Shiseido 资生堂 Anessa 安耐晒 超防水美肌UV乳液 SPF50',220.00,NULL,'9','22','60ml'),(80,1,'2019041911465962414854','Shiseido 资生堂 Anessa 安耐晒 超防水美肌UV乳液 SPF50',220.00,NULL,'9','22','60ml'),(81,1,'2019041912513549928014','Shiseido 资生堂 Anessa 安耐晒 超防水美肌UV乳液 SPF50',220.00,NULL,'9','22','60ml'),(82,1,'2019041915173052424725','SK-II SK2 护肤洁面霜 洗面奶',420.00,NULL,'36','1344','120g'),(83,1,'2019041916475868461206','MAC 魅可 全色号子弹头口红唇膏 ',148.00,NULL,'43','8','See Sheer 西柚色'),(84,1,'2019041916475868461206','Lancome 兰蔻 粉水 保湿化妆水',350.00,NULL,'61','1351','400ml'),(85,1,'2019041916475868461206','Creer Beaute凡尔赛玫瑰面膜',35.00,NULL,'33','1343','银色(美白保湿)  1片/27ml');
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
  KEY `categoryId` (`categoryId`) USING BTREE,
  KEY `brandId` (`brandId`) USING BTREE,
  KEY `name` (`name`,`state`) USING BTREE,
  KEY `categoryIdState` (`categoryId`,`state`) USING BTREE,
  KEY `brandIdState` (`brandId`,`state`) USING BTREE,
  KEY `categoryId_state` (`categoryId`,`state`),
  KEY `state_flashSate` (`state`,`flashState`),
  KEY `state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=1359 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'product/1-0.jpg',NULL,NULL,NULL,'0',NULL,'2019-03-05 06:17:56','2019-03-07 08:06:46','product/1-1.jpg','product/1-2.jpg','product/1-3.jpg','product/1-4.jpg',NULL,NULL),(2,'YSL口红','方管圆管',NULL,NULL,NULL,10,10,'http://i2.bvimg.com/677237/3495e004b28872ec.jpg',NULL,NULL,NULL,'0',NULL,'2019-03-05 06:17:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'YSL口红','方管圆管',NULL,NULL,NULL,10,10,'http://i2.bvimg.com/677237/3495e004b28872ec.jpg',NULL,NULL,NULL,'0',NULL,'2019-03-05 06:17:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'YSL口红','方管圆管',NULL,NULL,NULL,10,10,'http://i2.bvimg.com/677237/3495e004b28872ec.jpg',NULL,NULL,NULL,'0',NULL,'2019-03-05 06:17:56','2019-03-23 17:03:36',NULL,NULL,NULL,NULL,NULL,'1'),(8,'MAC 魅可 全色号子弹头口红唇膏 ','MAC唇膏',138.00,132.00,0.00,41,33,NULL,'2','5',5,'1','2','2019-03-05 06:17:56','2019-04-19 08:52:40',NULL,NULL,NULL,NULL,NULL,'0'),(9,'Dior 迪奥 口红 烈焰蓝金唇膏','Dior魅惑唇膏',260.00,266.00,240.00,10,13,NULL,'2','5',11,'1','2','2019-03-05 06:17:56','2019-04-18 08:49:35',NULL,NULL,NULL,NULL,NULL,'0'),(10,'阿玛尼漆亮水漾唇釉','阿玛尼漆亮水漾唇釉',258.00,NULL,NULL,100,13,'http://i1.bvimg.com/677237/28b8fff357968901.jpg','2','5',2,'0','2','2019-03-05 06:17:56','2019-04-18 08:50:41',NULL,NULL,NULL,NULL,NULL,NULL),(11,'NYX 16色眼影盘','NYX 16色眼影盘',178.00,136.00,0.00,21,19,NULL,'3','5',3,'1','0','2019-03-05 06:17:56','2019-04-18 08:58:28',NULL,NULL,NULL,NULL,NULL,''),(12,'MAC 魅可 时尚焦点小眼影','MAC 魅可 时尚焦点小眼影',158.00,129.00,0.00,100,19,NULL,'3','5',5,'1','0','2019-03-05 06:17:56','2019-04-18 08:56:38',NULL,NULL,NULL,NULL,NULL,''),(13,'Canmake 井田 完美高效眼影','Canmake 井田 完美高效眼影',75.00,49.00,0.00,32,19,NULL,'3','5',4,'1','0','2019-03-05 06:17:56','2019-04-18 08:59:13',NULL,NULL,NULL,NULL,NULL,''),(15,'Tom Ford  汤姆福特 口红 TF lip color 黑金唇膏','Tom Ford汤姆福特 lip color 黑金唇膏',348.00,300.00,0.00,99,24,NULL,'2','5',6,'1','2','2019-03-07 08:06:46','2019-04-18 08:46:39',NULL,NULL,NULL,NULL,NULL,''),(21,'蒂佳婷 Dr.Jart+ 蓝色药丸面膜 专业瞬间锁水','适合易缺水干燥肌肤。面膜蕴含水润精华，面膜纸以超细纤维制成，更贴合面部，将精华完整传送到肌底。',80.00,43.00,60.00,58,92,NULL,'4','6',8,'1','0','2019-03-12 04:46:57','2019-04-18 09:19:35','http://localhost:8080/backend/resources/eshop/image/product/21-1.jpg','http://localhost:8080/backend/resources/eshop/image/product/21-2.jpg','http://localhost:8080/backend/resources/eshop/image/product/21-3.jpg','http://localhost:8080/backend/resources/eshop/image/product/21-4.jpg',NULL,'0'),(22,'Shiseido 资生堂 Anessa 安耐晒 超防水美肌UV乳液 SPF50','具有防水、防汗、防皮脂的特性，不论进行海边、游泳池或户外休闲活动等，等能安心阻挡强烈日晒',240.00,173.00,220.00,39,32,NULL,'7','7',9,'1','0','2019-03-12 05:02:40','2019-04-19 06:03:16','http://localhost:8080/backend/resources/eshop/image/product/22-1.jpg','http://localhost:8080/backend/resources/eshop/image/product/22-2.jpg','http://localhost:8080/backend/resources/eshop/image/product/22-3.jpg','http://localhost:8080/backend/resources/eshop/image/product/22-4.jpg',NULL,'1'),(23,'SK-II 护肤精华 神仙水','SK-II 护肤精华 神仙水',1100.00,963.00,0.00,24,32,NULL,'10','6',13,'1','0','2019-03-19 01:46:09','2019-04-18 09:07:53','http://pnwhn87vf.bkt.clouddn.com/product/23-1.jpg','http://pnwhn87vf.bkt.clouddn.com/product/23-2.jpg','http://pnwhn87vf.bkt.clouddn.com/product/23-3.jpg','http://pnwhn87vf.bkt.clouddn.com/product/23-4.jpg',NULL,'0'),(24,'JM Solution肌司妍 水光蜂蜜面膜','JM Solution肌司妍 水光蜂蜜面膜',80.00,37.00,70.00,10,82,NULL,'4','6',10,'1','0','2019-03-19 02:43:00','2019-04-18 09:01:17','http://pnwhn87vf.bkt.clouddn.com/product/24-1.jpg','http://pnwhn87vf.bkt.clouddn.com/product/24-2.jpg','http://pnwhn87vf.bkt.clouddn.com/product/24-3.jpg','http://pnwhn87vf.bkt.clouddn.com/product/24-4.jpg',NULL,'1'),(1334,'JM Solution肌司妍 海洋珍珠深层保湿面膜','JM Solution肌司妍 海洋珍珠深层保湿面膜',80.00,37.00,68.00,30,20,NULL,'4','6',10,'1','0','2019-04-14 04:51:40','2019-04-18 09:23:42','http://ppf0hsoua.bkt.clouddn.com/product/1334-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1334-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1334-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1334-4.jpg',NULL,'1'),(1335,'Chanel香奈儿 可可小姐淡香水喷雾','Chanel香奈儿 可可小姐淡香水喷雾',650.00,585.00,618.00,23,57,NULL,'9','5',12,'1','0','2019-04-15 03:37:56','2019-04-18 09:01:10','http://ppf0hsoua.bkt.clouddn.com/product/1335-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1335-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1335-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1335-4.jpg',NULL,'1'),(1336,'Estee Lauder 雅诗兰黛 小棕瓶密集修护眼精华','Estee Lauder 雅诗兰黛 小棕瓶密集修护眼精华',388.00,338.00,0.00,73,85,NULL,'12','6',7,'1','0','2019-04-15 08:16:21','2019-04-18 09:10:38','http://ppf0hsoua.bkt.clouddn.com/product/1336-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1336-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1336-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1336-4.jpg',NULL,'0'),(1337,'Decorte 黛珂 牛油果乳液','Decorte 黛珂 牛油果乳液',500.00,431.00,480.00,13,46,NULL,'11','6',14,'1','0','2019-04-15 08:38:57','2019-04-18 09:10:51','http://ppf0hsoua.bkt.clouddn.com/product/1337-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1337-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1337-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1337-4.jpg',NULL,'1'),(1338,'Nars 纳斯 炫色腮红','Nars 纳斯 炫色腮红',220.00,149.00,0.00,21,13,NULL,'6','5',15,'1','0','2019-04-15 09:09:26','2019-04-18 08:57:35','http://ppf0hsoua.bkt.clouddn.com/product/1338-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1338-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1338-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1338-4.jpg',NULL,'0'),(1339,'CLARINS 娇韵诗 透白光感洁面霜 洗面奶','均匀肤色，给肌肤从内到外的透白均匀光泽。美白洁面泡沫质地轻盈，有效净化肌肤，使肌肤更为透亮、柔润，倍感清新舒适。',260.00,194.00,NULL,23,12,'http://ppf0hsoua.bkt.clouddn.com/product/1339-0.jpg','13','6',16,'1','0','2019-04-15 16:42:49','2019-04-15 16:44:51','http://ppf0hsoua.bkt.clouddn.com/product/1339-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1339-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1339-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1339-4.jpg',NULL,'0'),(1340,'fresh馥蕾诗 玫瑰润泽保湿舒缓面膜 100ml补水 正品女涂抹式','玫瑰润泽保湿舒缓面膜舒缓肌肤，有效补水，帮助改善肌肤暗哑。柔滑?喱配方包含玫瑰的多种形态，玫瑰花瓣、纯正玫瑰花水、玫瑰精油，层层沁润，让肌肤如同沉醉于玫瑰花海中，尽享润泽透亮，长时间补水。适合各种肤质使用。  使用方法：取适量产品于清洁后的湿润面部肌肤，避开眼部区域。停留5-10分钟后用水清洗去除。可每天使用。',435.00,297.00,0.00,11,24,NULL,'4','6',17,'1','0','2019-04-15 16:55:28','2019-04-18 09:06:03','http://ppf0hsoua.bkt.clouddn.com/product/1340-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1340-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1340-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1340-4.jpg',NULL,'0'),(1341,'fresh馥蕾诗 红茶凝时修护面膜 100ml 补水保湿女紧致 涂抹式','红茶抗皱紧致修护面膜给予肌肤出色紧致体验，肌肤更柔软顺滑、幼嫩饱满，焕发亮泽神采。面膜天鹅绒般柔软的特别质地有效肌肤降温，有效润泽，再现水滢剔透。   使用建议：清洁面部后用毛巾擦干，之后使用本品于脸部，避开眼部区域。停留5-10分钟后冲洗干净。每周使用2-3次。',650.00,461.00,0.00,11,24,NULL,'4','6',17,'1','0','2019-04-15 16:57:57','2019-04-18 09:03:18','http://ppf0hsoua.bkt.clouddn.com/product/1341-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1341-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1341-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1341-4.jpg',NULL,'0'),(1342,'fresh馥蕾诗 黄糖滋润亮采面膜','Fresh畅销单品之一，以澄糖、野草莓果提取物与滋润精华油等调和制成的去角质面膜，呈现肌肤润泽质感，改善肤色暗沉。滋养肌肤，温和去除老化角质，使肌肤重现光泽，神采飞扬。   使用方法：取适量本产品轻柔按摩于清洁、湿润的肌肤，避开眼部。静待5至10分钟后用温水冲洗干净即可。建议每周使用3至4次。',400.00,291.00,0.00,61,39,NULL,'4','6',17,'1','0','2019-04-15 17:00:17','2019-04-18 09:01:23','http://ppf0hsoua.bkt.clouddn.com/product/1342-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1342-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1342-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1342-4.jpg',NULL,'0'),(1343,'Creer Beaute凡尔赛玫瑰面膜','银色（深层珍珠美白保湿面膜）：蕴含珍珠粉、针叶樱桃萃取物、玫瑰水、四季柑果皮萃取物、葡萄柚皮萃取物及透明质酸，为肌肤注入充沛水份，同时有效发挥锁水功能，并散发迷人白玫瑰香气。 红色（安东尼特白金保湿面膜）：含有白金纳米、玻尿酸、蜂王浆萃取保湿精华成分配合，采用柔和的纤维材质，温和包覆肌肤，吸收性极佳，浸透肌肤。 金色（黄金润透亮弹力保湿面膜）：蕴含白金纳米成分、蜂王浆萃取物、玫瑰水、热情果果皮萃取物、葡萄柚籽萃取物及透明质酸，为肌肤注入充沛水分，同时有效滋润肌肤，并给肌肤倍增魅力，散发迷人玫瑰香氛。',35.00,27.00,0.00,82,34,NULL,'4','6',18,'1','0','2019-04-15 17:08:06','2019-04-19 08:52:40','http://ppf0hsoua.bkt.clouddn.com/product/1343-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1343-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1343-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1343-4.jpg',NULL,'0'),(1344,'SK-II SK2 护肤洁面霜 洗面奶','氨基酸温和洁面，幼细的保湿泡沫，并加入“神仙水”成分PITERATM，有助调理肌肤，焕现晶莹剔透，柔软有弹性。',420.00,369.00,0.00,31,87,NULL,'13','6',13,'1','0','2019-04-15 17:13:03','2019-04-19 07:22:28','http://ppf0hsoua.bkt.clouddn.com/product/1344-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1344-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1344-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1344-4.jpg',NULL,'0'),(1345,'Cle de Peau Beaute 肌肤之钥 cpb 光采洁面膏 洗面奶 滋润型/清爽型','轻柔绵密泡沫，温和地去除肌肤表层多余的老旧角质和油脂，同时保湿滋润，改善暗沉问题及提升肌肤细致度，加强护肤瓶的吸收，令肌肤透亮细致，尽享清新触感。',400.00,358.00,0.00,53,68,NULL,'13','6',19,'1','0','2019-04-15 17:15:42','2019-04-18 09:11:03','http://ppf0hsoua.bkt.clouddn.com/product/1345-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1345-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1345-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1345-4.jpg',NULL,'0'),(1346,'Whoo 后 天气丹津率享水乳七件套装','津率享平衡水150ml + 津率享乳液110ml + 津率享面霜30ml + 津率享洁面乳13ml + 津率享平衡水20ml + 津率享乳液20ml + 唇膏一支',880.00,726.00,0.00,10,8,NULL,'8','6',20,'1','0','2019-04-18 12:38:32','2019-04-18 12:45:13','http://ppf0hsoua.bkt.clouddn.com/product/1346-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1346-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1346-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1346-4.jpg',NULL,'0'),(1347,'Whoo 后 拱辰享水妍平衡水乳霜6件套装','水妍平衡水 150ml + 水妍平衡乳 110ml + 水妍面霜 30ml + 水妍平衡水20ml + 水妍平衡乳20ml + 洗面乳13ml',700.00,579.00,NULL,14,18,'http://ppf0hsoua.bkt.clouddn.com/product/1347-0.jpg','8','6',20,'1','0','2019-04-18 12:51:53','2019-04-18 12:52:07','http://ppf0hsoua.bkt.clouddn.com/product/1347-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1347-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1347-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1347-4.jpg',NULL,'0'),(1348,'科颜氏 Kiehl\'s 防晒霜 隔离乳','科颜氏 Kiehl\'s 防晒霜 隔离乳 ',300.00,245.00,0.00,32,23,NULL,'7','7',21,'1','0','2019-04-18 13:05:51','2019-04-18 13:08:52','http://ppf0hsoua.bkt.clouddn.com/product/1348-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1348-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1348-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1348-4.jpg',NULL,'0'),(1349,'Cosme Decorte 黛珂 紫苏水','Cosme Decorte 黛珂 紫苏水',280.00,255.00,NULL,12,32,'http://ppf0hsoua.bkt.clouddn.com/product/1349-0.jpg','14','6',14,'1','0','2019-04-18 13:15:30','2019-04-18 13:17:39','http://ppf0hsoua.bkt.clouddn.com/product/1349-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1349-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1349-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1349-4.jpg',NULL,'0'),(1350,'Decotre 黛珂 牛油果水乳套装','Decotre 黛珂 牛油果水乳套装 紫苏水300ml+牛油果乳液300ml',900.00,761.00,0.00,29,19,NULL,'8','6',14,'1','0','2019-04-18 13:38:59','2019-04-18 13:41:36','http://ppf0hsoua.bkt.clouddn.com/product/1350-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1350-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1350-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1350-4.jpg',NULL,'0'),(1351,'Lancome 兰蔻 粉水 保湿化妆水','Lancome 兰蔻 粉水 保湿化妆水',225.00,173.00,0.00,19,33,NULL,'14','6',22,'1','0','2019-04-19 06:17:44','2019-04-19 08:52:40','http://ppf0hsoua.bkt.clouddn.com/product/1351-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1351-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1351-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1351-4.jpg',NULL,'0'),(1352,'Sulwhasoo 雪花秀 滋阴平衡迷你五件套装','Sulwhasoo 雪花秀 滋阴平衡五件套装 滋阴水 15ml ＋ 乳液 15ml ＋ 润燥精华 8ml ＋ 闪理眼霜 5ml ＋ 人参面霜 3.5ml ',195.00,61.00,0.00,32,11,NULL,'8','6',23,'1','0','2019-04-19 11:37:32','2019-04-19 12:49:11','http://ppf0hsoua.bkt.clouddn.com/product/1352-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1352-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1352-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1352-4.jpg',NULL,'0'),(1353,'DPC 粉红豹纹气垫粉底 SPF50','DPC 粉红豹纹气垫粉底 SPF50',208.00,160.00,NULL,32,59,'http://ppf0hsoua.bkt.clouddn.com/product/1353-0.jpg','15','5',24,'1','0','2019-04-19 13:02:54','2019-04-19 13:03:15','http://ppf0hsoua.bkt.clouddn.com/product/1353-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1353-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1353-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1353-4.jpg',NULL,'0'),(1354,'Age 20\'s 爱敬 精华遮瑕粉底 气垫bb爽','Age 20\'s 爱敬 精华遮瑕粉底 气垫bb爽',178.00,127.00,NULL,21,11,'http://ppf0hsoua.bkt.clouddn.com/product/1354-0.jpg','15','5',25,'1','0','2019-04-19 13:23:42','2019-04-19 13:23:52','http://ppf0hsoua.bkt.clouddn.com/product/1354-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1354-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1354-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1354-4.jpg',NULL,'0'),(1355,'Giorgio Armani阿玛尼 粉胖丁 腮红液','添加提亮肌肤的橘色因子，为双颊添上健康清透的自然红晕。水漾色泽，赋予肌肤粉嫩红晕。',328.00,255.00,NULL,21,11,'http://ppf0hsoua.bkt.clouddn.com/product/1355-0.jpg','6','5',2,'1','0','2019-04-19 13:44:19','2019-04-19 13:44:29','http://ppf0hsoua.bkt.clouddn.com/product/1355-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1355-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1355-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1355-4.jpg',NULL,'0'),(1356,'Shiseido资生堂 高光腮红','缔造亮彩健康肤色，细腻粉质容易上妆推开，打造个性化妆容。撞色持久，清新柔润。',285.00,185.00,0.00,12,34,NULL,'6','5',26,'1','0','2019-04-19 13:52:38','2019-04-19 13:56:58','http://ppf0hsoua.bkt.clouddn.com/product/1356-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1356-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1356-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1356-4.jpg',NULL,'0'),(1357,'Estee Lauder 雅诗兰黛 红石榴水 抗氧活肤水 清爽型/滋润型',' 针对失去光彩，干燥皮肤，可高效保湿并改善暗沉肤色。适用于各种肤质。',320.00,242.00,0.00,12,27,NULL,'14','6',7,'1','0','2019-04-19 14:02:42','2019-04-19 14:04:19','http://ppf0hsoua.bkt.clouddn.com/product/1357-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1357-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1357-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1357-4.jpg',NULL,'0'),(1358,'Estee Lauder 雅诗兰黛 红石榴面霜 日霜晚霜组合','Estee Lauder 雅诗兰黛 红石榴面霜 日霜晚霜组合',800.00,740.00,NULL,21,45,'http://ppf0hsoua.bkt.clouddn.com/product/1358-0.jpg','11','6',7,'1','0','2019-04-19 14:23:44','2019-04-19 14:23:52','http://ppf0hsoua.bkt.clouddn.com/product/1358-1.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1358-2.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1358-3.jpg','http://ppf0hsoua.bkt.clouddn.com/product/1358-4.jpg',NULL,'0');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchhistory`
--

LOCK TABLES `searchhistory` WRITE;
/*!40000 ALTER TABLE `searchhistory` DISABLE KEYS */;
INSERT INTO `searchhistory` VALUES (1,'dior','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-15 15:54:51'),(2,'TF','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-17 09:01:12'),(3,'CPB','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-17 09:01:41'),(4,'SK2','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-17 09:01:44'),(5,'神仙水','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-17 09:01:47'),(6,'面膜','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-17 09:01:50'),(7,'mac','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-17 09:06:25'),(8,'面膜','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-17 09:07:46'),(9,'神仙水','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-17 09:07:48'),(10,'TF','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-17 09:09:26'),(11,'护肤','oX-br4tEuhioR2BCdBAEV-1BUCsg','2019-04-17 13:40:52'),(12,'孕妇','oX-br4tEuhioR2BCdBAEV-1BUCsg','2019-04-17 13:41:03'),(13,'dior','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-18 15:32:33'),(14,'SK2','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-18 15:32:35'),(15,'SK2','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-18 15:32:38'),(16,'面膜','oX-br4neGzmMBKR7ByjoXRUA1-NM','2019-04-18 15:32:52'),(17,'神仙水','oX-br4uxKDAVk3UL66iSMTbChcjY','2019-04-19 02:49:44'),(18,'洗面奶','oX-br4vPsMGtKCRNpIv_-MMbkcWg','2019-04-19 07:15:58'),(19,'洗面奶','oX-br4vPsMGtKCRNpIv_-MMbkcWg','2019-04-19 07:16:17'),(20,'洗面奶','oX-br4uxKDAVk3UL66iSMTbChcjY','2019-04-19 10:13:32'),(21,'SK2','oX-br4m3Feg7FdV0GkZ86r95QZC4','2019-04-19 13:23:10'),(22,'SK2','oX-br4m3Feg7FdV0GkZ86r95QZC4','2019-04-19 13:23:17'),(23,'神仙水','oX-br4m3Feg7FdV0GkZ86r95QZC4','2019-04-19 13:23:23'),(24,'CPB','oX-br4m3Feg7FdV0GkZ86r95QZC4','2019-04-19 13:23:33'),(25,'黛柯','oX-br4nlEMrLBe7Sxo87r7p_8hyQ','2019-04-19 14:29:19'),(26,'Fancl','oX-br4vRsUgoCgKNotru-7a0dG3k','2019-04-19 15:01:38'),(27,'F洁面','oX-br4vRsUgoCgKNotru-7a0dG3k','2019-04-19 15:01:44');
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
  UNIQUE KEY `openId` (`openId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'oX-br4rfqn2ia4g6kGdbFKlkgBYw',NULL,'1',45,'0',622,NULL,0,622,427,'2019-04-15 06:54:25',1),(3,'oX-br4neGzmMBKR7ByjoXRUA1-NM',NULL,'1',0,'0',24885,'2019-04-15 07:29:57',0,24885,0,'2019-04-15 08:10:40',2),(4,'oX-br4vPsMGtKCRNpIv_-MMbkcWg',NULL,'1',0,'0',420,NULL,0,420,425,'2019-04-17 18:40:04',1),(5,'oX-br4mxgwJBKktUcFgVVfX-Y6go',NULL,'0',0,'0',0,NULL,NULL,NULL,5,'2019-04-18 06:50:09',1),(6,'oX-br4lQCGCtT5woCNdABpiwHMnE',NULL,'1',0,'0',220,NULL,0,220,220,NULL,0),(7,'oX-br4tVRSPwDu05voAEdBjoUCg4',NULL,'1',0,'0',503,NULL,0,503,508,'2019-04-19 06:40:44',1),(8,'oX-br4m3Feg7FdV0GkZ86r95QZC4',NULL,'0',0,'0',0,NULL,NULL,NULL,5,'2019-04-19 06:30:31',1),(9,'oX-br4ozG4oi1jaJHI43_v3U9fug',NULL,'0',0,'0',0,NULL,NULL,NULL,5,'2019-04-19 07:14:28',1),(10,'oX-br4pbIkVYqO_o21Uca3exQoLg',NULL,'0',0,'0',0,NULL,NULL,NULL,5,'2019-04-19 07:36:05',1),(11,'oX-br4h9ytcW8jaWjHYSmgTdu2Kk',NULL,'0',0,'0',0,NULL,NULL,NULL,5,'2019-04-19 07:46:37',1);
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
  KEY `openId` (`openId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewhistory`
--

LOCK TABLES `viewhistory` WRITE;
/*!40000 ALTER TABLE `viewhistory` DISABLE KEYS */;
INSERT INTO `viewhistory` VALUES (1,'oX-br4rfqn2ia4g6kGdbFKlkgBYw','15','2','2019-04-15 15:09:24'),(38,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1343','4','2019-04-17 10:30:09'),(39,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1343','4','2019-04-17 10:30:25'),(42,'oX-br4tEuhioR2BCdBAEV-1BUCsg','22','7','2019-04-17 13:38:02'),(43,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1343','4','2019-04-17 13:51:25'),(44,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1342','4','2019-04-17 13:51:55'),(48,'oX-br4qaKM4DyIjZRp3iaMFye_9I','1','null','2019-04-18 02:45:49'),(49,'oX-br4skFoptPpZg1Fjya9_JDalA','22','7','2019-04-18 06:22:21'),(63,'oX-br4m3Feg7FdV0GkZ86r95QZC4','13','3','2019-04-18 08:23:22'),(85,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1349','14','2019-04-18 13:31:46'),(88,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1337','11','2019-04-18 13:31:59'),(91,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1348','7','2019-04-18 13:32:21'),(93,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1347','8','2019-04-18 13:32:35'),(96,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1347','8','2019-04-18 13:32:48'),(97,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1349','14','2019-04-18 13:32:53'),(98,'oX-br4lPaU2vq8GKVX6XCrvofU4o','1349','14','2019-04-18 13:33:03'),(99,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1349','14','2019-04-18 13:33:05'),(105,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1349','14','2019-04-18 13:34:43'),(106,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1337','11','2019-04-18 13:34:51'),(107,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1346','8','2019-04-18 13:35:03'),(108,'undefined','1348','7','2019-04-18 13:38:57'),(109,'oX-br4uL7Pe7UtTFwtyHrq5Oj0zI','1346','8','2019-04-18 13:39:25'),(110,'oX-br4upq3VsOsLibFfolKURU0Gw','1348','7','2019-04-18 13:39:27'),(111,'oX-br4upq3VsOsLibFfolKURU0Gw','1349','14','2019-04-18 13:39:28'),(112,'undefined','1348','7','2019-04-18 13:40:08'),(119,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1350','8','2019-04-18 13:45:27'),(120,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1350','8','2019-04-18 13:46:16'),(121,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1350','8','2019-04-18 13:46:29'),(122,'undefined','8','2','2019-04-18 13:47:13'),(123,'oX-br4rfqn2ia4g6kGdbFKlkgBYw','1349','14','2019-04-18 13:48:50'),(124,'oX-br4s4YNC4yFCo5frCRYgfPy8s','1346','8','2019-04-18 13:54:03'),(125,'undefined','1350','8','2019-04-18 14:01:12'),(137,'oX-br4tVRSPwDu05voAEdBjoUCg4','1335','9','2019-04-18 14:30:34'),(138,'oX-br4tVRSPwDu05voAEdBjoUCg4','23','10','2019-04-18 14:30:51'),(139,'oX-br4tVRSPwDu05voAEdBjoUCg4','1347','8','2019-04-18 14:31:16'),(141,'oX-br4tVRSPwDu05voAEdBjoUCg4','1343','4','2019-04-18 14:31:23'),(143,'oX-br4tVRSPwDu05voAEdBjoUCg4','8','2','2019-04-18 14:31:40'),(144,'oX-br4tVRSPwDu05voAEdBjoUCg4','8','2','2019-04-18 14:31:41'),(145,'oX-br4tVRSPwDu05voAEdBjoUCg4','13','3','2019-04-18 14:32:01'),(146,'oX-br4tVRSPwDu05voAEdBjoUCg4','11','3','2019-04-18 14:32:04'),(147,'oX-br4oRnhp58ItoD4_aKYr0aBaU','8','2','2019-04-18 14:38:18'),(148,'oX-br4j6V1xnCb7BnNOnwaF-HHTA','11','3','2019-04-18 14:49:47'),(149,'oX-br4obGOeetg1PNAvvnggOaQz8','1341','4','2019-04-18 14:52:44'),(150,'oX-br4obGOeetg1PNAvvnggOaQz8','1341','4','2019-04-18 14:52:52'),(151,'oX-br4obGOeetg1PNAvvnggOaQz8','1343','4','2019-04-18 14:53:00'),(155,'undefined','1344','13','2019-04-18 15:23:33'),(156,'oX-br4kitoZ0ghYBRSRm_ZGQcXbw','22','7','2019-04-18 15:24:01'),(157,'undefined','1349','14','2019-04-18 15:28:17'),(158,'oX-br4nlEMrLBe7Sxo87r7p_8hyQ','1346','8','2019-04-18 15:28:26'),(159,'oX-br4nlEMrLBe7Sxo87r7p_8hyQ','1337','11','2019-04-18 15:28:52'),(164,'oX-br4lbzUlWPPJyp3mxyHLocEKA','22','7','2019-04-18 21:56:34'),(165,'oX-br4lbzUlWPPJyp3mxyHLocEKA','22','7','2019-04-18 21:56:46'),(166,'oX-br4lbzUlWPPJyp3mxyHLocEKA','8','2','2019-04-18 21:57:39'),(167,'oX-br4lbzUlWPPJyp3mxyHLocEKA','15','2','2019-04-18 21:58:00'),(168,'oX-br4lbzUlWPPJyp3mxyHLocEKA','1344','13','2019-04-18 21:58:14'),(169,'oX-br4lbzUlWPPJyp3mxyHLocEKA','1347','8','2019-04-18 21:58:24'),(170,'oX-br4lbzUlWPPJyp3mxyHLocEKA','9','2','2019-04-18 21:59:22'),(171,'oX-br4lbzUlWPPJyp3mxyHLocEKA','1336','12','2019-04-18 21:59:45'),(172,'oX-br4jpttEzLmyNBuFpmTsh68Uk','8','2','2019-04-18 22:02:39'),(173,'oX-br4tAbEGJZBfr9_kYlpzrrY6Y','1348','7','2019-04-18 22:30:55'),(174,'oX-br4k1VlFi2Ff5QVwm_LE9RW30','24','4','2019-04-18 23:14:52'),(175,'undefined','1350','8','2019-04-19 00:43:41'),(176,'oX-br4h6jlNSIhMzesdfaMNN-fLk','1350','8','2019-04-19 00:43:57'),(177,'oX-br4h6jlNSIhMzesdfaMNN-fLk','1348','7','2019-04-19 00:44:00'),(178,'oX-br4h6jlNSIhMzesdfaMNN-fLk','1348','7','2019-04-19 00:44:08'),(179,'oX-br4h6jlNSIhMzesdfaMNN-fLk','1349','14','2019-04-19 00:44:12'),(180,'oX-br4h6jlNSIhMzesdfaMNN-fLk','1349','14','2019-04-19 00:44:16'),(181,'oX-br4lPaU2vq8GKVX6XCrvofU4o','1350','8','2019-04-19 01:08:06'),(182,'oX-br4uxKDAVk3UL66iSMTbChcjY','24','4','2019-04-19 02:32:03'),(183,'oX-br4uxKDAVk3UL66iSMTbChcjY','1334','4','2019-04-19 02:33:52'),(184,'oX-br4uxKDAVk3UL66iSMTbChcjY','24','4','2019-04-19 02:34:41'),(185,'oX-br4uxKDAVk3UL66iSMTbChcjY','24','4','2019-04-19 02:40:12'),(186,'oX-br4rfqn2ia4g6kGdbFKlkgBYw','22','7','2019-04-19 02:44:42'),(187,'oX-br4lQCGCtT5woCNdABpiwHMnE','1335','9','2019-04-19 02:48:11'),(188,'oX-br4lQCGCtT5woCNdABpiwHMnE','1348','7','2019-04-19 02:48:29'),(189,'oX-br4lQCGCtT5woCNdABpiwHMnE','1343','4','2019-04-19 02:48:55'),(190,'oX-br4lQCGCtT5woCNdABpiwHMnE','1347','8','2019-04-19 02:49:06'),(191,'oX-br4lQCGCtT5woCNdABpiwHMnE','22','7','2019-04-19 03:05:54'),(199,'oX-br4uwBKXMWqWs4TN_hy2j_9VA','1343','4','2019-04-19 03:16:20'),(200,'oX-br4nQROd-XUAWWgxYqAMmqMBU','1336','12','2019-04-19 03:22:41'),(201,'oX-br4lQCGCtT5woCNdABpiwHMnE','22','7','2019-04-19 03:23:51'),(202,'oX-br4lQCGCtT5woCNdABpiwHMnE','22','7','2019-04-19 03:24:42'),(203,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1336','12','2019-04-19 03:29:21'),(204,'oX-br4upq3VsOsLibFfolKURU0Gw','1350','8','2019-04-19 03:36:25'),(205,'oX-br4uxKDAVk3UL66iSMTbChcjY','22','7','2019-04-19 03:37:14'),(206,'oX-br4uxKDAVk3UL66iSMTbChcjY','22','7','2019-04-19 03:44:09'),(207,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','12','3','2019-04-19 03:44:36'),(210,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1347','8','2019-04-19 03:45:57'),(212,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1346','8','2019-04-19 03:46:03'),(213,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1348','7','2019-04-19 03:46:11'),(215,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1337','11','2019-04-19 03:46:21'),(217,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1350','8','2019-04-19 03:46:34'),(218,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1337','11','2019-04-19 03:46:41'),(219,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1350','8','2019-04-19 03:46:45'),(220,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1350','8','2019-04-19 03:47:36'),(221,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1350','8','2019-04-19 03:48:07'),(222,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1337','11','2019-04-19 03:48:30'),(223,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1337','11','2019-04-19 03:48:38'),(226,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1350','8','2019-04-19 03:50:20'),(227,'oX-br4nQROd-XUAWWgxYqAMmqMBU','1342','4','2019-04-19 03:51:38'),(228,'oX-br4lQCGCtT5woCNdABpiwHMnE','22','7','2019-04-19 04:49:53'),(229,'oX-br4lQCGCtT5woCNdABpiwHMnE','22','7','2019-04-19 04:50:08'),(230,'oX-br4uxKDAVk3UL66iSMTbChcjY','9','2','2019-04-19 05:36:30'),(235,'oX-br4upq3VsOsLibFfolKURU0Gw','1351','14','2019-04-19 06:29:14'),(237,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1351','14','2019-04-19 06:31:35'),(238,'oX-br4lQCGCtT5woCNdABpiwHMnE','1336','12','2019-04-19 06:32:47'),(239,'oX-br4lQCGCtT5woCNdABpiwHMnE','22','7','2019-04-19 06:36:59'),(240,'oX-br4lQCGCtT5woCNdABpiwHMnE','1335','9','2019-04-19 06:37:26'),(241,'oX-br4n5LkZBXnp9UqMiHt9jFHT4','1351','14','2019-04-19 06:37:41'),(242,'oX-br4lQCGCtT5woCNdABpiwHMnE','12','3','2019-04-19 06:39:08'),(243,'oX-br4lQCGCtT5woCNdABpiwHMnE','1343','4','2019-04-19 06:39:31'),(244,'oX-br4lQCGCtT5woCNdABpiwHMnE','12','3','2019-04-19 06:39:38'),(245,'undefined','1351','14','2019-04-19 06:40:00'),(246,'oX-br4tivPfbDLIxAcxCLipjFwWA','12','3','2019-04-19 06:40:05'),(247,'oX-br4lQCGCtT5woCNdABpiwHMnE','1336','12','2019-04-19 06:40:07'),(248,'oX-br4l4UmV7ZxvBPgjpxabk6Y44','1351','14','2019-04-19 06:40:22'),(249,'oX-br4tivPfbDLIxAcxCLipjFwWA','1335','9','2019-04-19 06:40:31'),(250,'undefined','1351','14','2019-04-19 06:46:08'),(251,'oX-br4lQCGCtT5woCNdABpiwHMnE','1337','11','2019-04-19 07:00:21'),(252,'oX-br4lQCGCtT5woCNdABpiwHMnE','1347','8','2019-04-19 07:00:47'),(253,'undefined','1351','14','2019-04-19 07:02:32'),(254,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1344','13','2019-04-19 07:16:04'),(255,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1344','13','2019-04-19 07:16:20'),(256,'oX-br4nBT0s-Ximm-LGt83sahAIM','8','2','2019-04-19 07:30:20'),(257,'oX-br4nBT0s-Ximm-LGt83sahAIM','1345','13','2019-04-19 07:32:07'),(258,'oX-br4vPsMGtKCRNpIv_-MMbkcWg','1344','13','2019-04-19 07:42:42'),(259,'oX-br4tVRSPwDu05voAEdBjoUCg4','1351','14','2019-04-19 07:49:12'),(260,'oX-br4tVRSPwDu05voAEdBjoUCg4','8','2','2019-04-19 07:50:40'),(261,'undefined','1351','14','2019-04-19 07:52:51'),(262,'oX-br4tVRSPwDu05voAEdBjoUCg4','1351','14','2019-04-19 07:53:30'),(263,'oX-br4pfkTDuVmi7iKo6sKehUMd0','23','10','2019-04-19 07:53:45'),(264,'oX-br4tVRSPwDu05voAEdBjoUCg4','1351','14','2019-04-19 07:53:54'),(265,'oX-br4tVRSPwDu05voAEdBjoUCg4','1351','14','2019-04-19 07:58:32'),(266,'oX-br4tVRSPwDu05voAEdBjoUCg4','1351','14','2019-04-19 07:58:47'),(267,'oX-br4r_IGDCCGXYKt8HAVhkzmDM','1351','14','2019-04-19 08:00:29'),(268,'oX-br4r_IGDCCGXYKt8HAVhkzmDM','1337','11','2019-04-19 08:01:20'),(269,'oX-br4r_IGDCCGXYKt8HAVhkzmDM','1350','8','2019-04-19 08:01:39'),(270,'oX-br4lQCGCtT5woCNdABpiwHMnE','22','7','2019-04-19 08:07:25'),(271,'oX-br4tVRSPwDu05voAEdBjoUCg4','8','2','2019-04-19 08:07:30'),(272,'oX-br4tVRSPwDu05voAEdBjoUCg4','8','2','2019-04-19 08:08:04'),(273,'oX-br4tVRSPwDu05voAEdBjoUCg4','8','2','2019-04-19 08:39:35'),(274,'oX-br4tVRSPwDu05voAEdBjoUCg4','8','2','2019-04-19 08:40:24'),(275,'oX-br4tVRSPwDu05voAEdBjoUCg4','1336','12','2019-04-19 08:41:59'),(276,'oX-br4tVRSPwDu05voAEdBjoUCg4','12','3','2019-04-19 08:42:41'),(277,'oX-br4tVRSPwDu05voAEdBjoUCg4','11','3','2019-04-19 08:42:51'),(278,'oX-br4tVRSPwDu05voAEdBjoUCg4','13','3','2019-04-19 08:42:58'),(279,'oX-br4tVRSPwDu05voAEdBjoUCg4','1351','14','2019-04-19 08:44:05'),(280,'oX-br4tVRSPwDu05voAEdBjoUCg4','1351','14','2019-04-19 08:44:20'),(281,'oX-br4tVRSPwDu05voAEdBjoUCg4','1343','4','2019-04-19 08:45:20'),(282,'oX-br4tVRSPwDu05voAEdBjoUCg4','8','2','2019-04-19 08:49:22'),(283,'oX-br4uxKDAVk3UL66iSMTbChcjY','22','7','2019-04-19 09:37:01'),(284,'undefined','1348','7','2019-04-19 10:01:44'),(285,'oX-br4n9wyuiolOGZLfqBt083NGQ','8','2','2019-04-19 10:03:31'),(286,'oX-br4n9wyuiolOGZLfqBt083NGQ','22','7','2019-04-19 10:03:55'),(287,'oX-br4uxKDAVk3UL66iSMTbChcjY','22','7','2019-04-19 10:04:07'),(288,'oX-br4n9wyuiolOGZLfqBt083NGQ','1348','7','2019-04-19 10:07:41'),(289,'oX-br4uxKDAVk3UL66iSMTbChcjY','1345','13','2019-04-19 10:13:42'),(290,'oX-br4uxKDAVk3UL66iSMTbChcjY','1345','13','2019-04-19 10:13:46'),(291,'oX-br4uxKDAVk3UL66iSMTbChcjY','1344','13','2019-04-19 10:13:54'),(292,'oX-br4uxKDAVk3UL66iSMTbChcjY','1344','13','2019-04-19 10:14:12'),(293,'oX-br4vCv2Y6ra-uGNUVNwwPDyuo','1350','8','2019-04-19 10:50:07'),(294,'oX-br4lQCGCtT5woCNdABpiwHMnE','8','2','2019-04-19 11:38:30'),(295,'oX-br4lQCGCtT5woCNdABpiwHMnE','21','4','2019-04-19 11:38:44'),(296,'oX-br4jskjB7I_cuakwLNF-hHQBc','21','4','2019-04-19 11:52:08'),(297,'oX-br4jskjB7I_cuakwLNF-hHQBc','15','2','2019-04-19 11:52:16'),(298,'oX-br4lQCGCtT5woCNdABpiwHMnE','1348','7','2019-04-19 12:08:04'),(299,'oX-br4lQCGCtT5woCNdABpiwHMnE','1347','8','2019-04-19 12:08:15'),(300,'oX-br4lQCGCtT5woCNdABpiwHMnE','1347','8','2019-04-19 12:08:33'),(301,'oX-br4lQCGCtT5woCNdABpiwHMnE','1347','8','2019-04-19 12:08:45'),(302,'oX-br4uxKDAVk3UL66iSMTbChcjY','8','2','2019-04-19 12:11:22'),(303,'oX-br4uxKDAVk3UL66iSMTbChcjY','1343','4','2019-04-19 12:12:09'),(304,'oX-br4uxKDAVk3UL66iSMTbChcjY','22','7','2019-04-19 12:12:43'),(305,'oX-br4uxKDAVk3UL66iSMTbChcjY','1344','13','2019-04-19 12:13:11'),(306,'oX-br4uxKDAVk3UL66iSMTbChcjY','24','4','2019-04-19 12:13:36'),(307,'oX-br4uxKDAVk3UL66iSMTbChcjY','1342','4','2019-04-19 12:13:51'),(308,'oX-br4uxKDAVk3UL66iSMTbChcjY','1341','4','2019-04-19 12:14:04'),(309,'oX-br4upq3VsOsLibFfolKURU0Gw','1352','8','2019-04-19 12:50:41'),(310,'oX-br4jpttEzLmyNBuFpmTsh68Uk','1352','8','2019-04-19 12:54:20'),(311,'oX-br4vCv2Y6ra-uGNUVNwwPDyuo','1352','8','2019-04-19 12:56:54'),(312,'oX-br4vCv2Y6ra-uGNUVNwwPDyuo','1352','8','2019-04-19 12:57:10'),(313,'oX-br4vCv2Y6ra-uGNUVNwwPDyuo','1352','8','2019-04-19 12:57:22'),(314,'oX-br4lQCGCtT5woCNdABpiwHMnE','1352','8','2019-04-19 13:11:26'),(315,'oX-br4lQCGCtT5woCNdABpiwHMnE','1352','8','2019-04-19 13:15:03'),(316,'oX-br4tAbEGJZBfr9_kYlpzrrY6Y','1352','8','2019-04-19 13:30:09'),(317,'undefined','1352','8','2019-04-19 13:35:23'),(318,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1353','15','2019-04-19 13:40:21'),(319,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1354','15','2019-04-19 13:40:37'),(320,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1335','9','2019-04-19 13:41:06'),(321,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1335','9','2019-04-19 13:41:14'),(322,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1355','6','2019-04-19 13:46:08'),(323,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1355','6','2019-04-19 13:50:45'),(324,'undefined','1352','8','2019-04-19 13:51:55'),(325,'oX-br4m3Feg7FdV0GkZ86r95QZC4','1355','6','2019-04-19 13:53:18'),(326,'oX-br4vCv2Y6ra-uGNUVNwwPDyuo','1357','14','2019-04-19 14:09:36'),(327,'oX-br4vCv2Y6ra-uGNUVNwwPDyuo','1357','14','2019-04-19 14:09:39'),(328,'undefined','1357','14','2019-04-19 14:11:54'),(329,'oX-br4upq3VsOsLibFfolKURU0Gw','1357','14','2019-04-19 14:12:51'),(330,'oX-br4vCv2Y6ra-uGNUVNwwPDyuo','1355','6','2019-04-19 14:20:58'),(331,'oX-br4vCv2Y6ra-uGNUVNwwPDyuo','1355','6','2019-04-19 14:21:05'),(332,'oX-br4lQCGCtT5woCNdABpiwHMnE','1355','6','2019-04-19 14:21:31'),(333,'oX-br4upq3VsOsLibFfolKURU0Gw','1355','6','2019-04-19 14:22:25'),(334,'oX-br4nlEMrLBe7Sxo87r7p_8hyQ','1355','6','2019-04-19 14:29:07'),(335,'oX-br4nlEMrLBe7Sxo87r7p_8hyQ','1350','8','2019-04-19 14:29:29'),(336,'oX-br4nlEMrLBe7Sxo87r7p_8hyQ','1337','11','2019-04-19 14:29:45'),(337,'oX-br4m3Feg7FdV0GkZ86r95QZC4','8','2','2019-04-19 15:13:56'),(338,'oX-br4qr_DnJ147IqXIyOam638m0','1355','6','2019-04-19 15:24:46');
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

-- Dump completed on 2019-04-20  0:44:28
