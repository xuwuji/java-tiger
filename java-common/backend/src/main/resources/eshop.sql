/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : localhost
 Source Database       : eshop

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : utf-8

 Date: 04/16/2019 01:24:43 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
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

-- ----------------------------
--  Records of `article`
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES ('1', '第一篇文章修改', '2019-03-20 23:56:36', '<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />', '8', '1', '', 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg', '化妆;', '1', 'http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg'), ('2', '第二篇文章', '2019-03-20 23:56:36', '<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />', '8', '1', '', 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg', '口红;', '1', 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg'), ('3', '第三篇文章', '2019-03-20 23:56:36', '<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />', '8', '1', null, 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg', '护肤;', '1', null), ('4', '第四篇文章', '2019-03-20 23:56:36', '<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />', '8', '1', null, 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg', '套装;', '1', null), ('5', '第五章文章', '2019-03-20 23:56:36', '<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />', '8', '0', 'small', 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg', '化妆;遮瑕;', '1', null), ('6', '第六篇文章', '2019-03-20 23:56:36', '<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />', '8', '0', 'big', 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg', '化妆;遮瑕;', '1', null), ('7', '测试第一篇', '2019-03-27 23:10:55', 'adasdasd', null, '1', '防晒霜', 'http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg;', null, '0', null), ('8', '测试第一篇', '2019-03-27 23:15:11', 'adasdasd', null, '1', '防晒霜', 'http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg;', null, '0', 'http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg'), ('9', '测试第二', '2019-03-27 23:19:03', 'dsf', null, '1', '', 'dsf', 'fdsf', '0', 'fdsf'), ('10', '测试第二', '2019-03-27 23:19:25', 'dsf', '15', '1', '', 'dsf', 'fdsf', '1', 'fdsf');
COMMIT;

-- ----------------------------
--  Table structure for `banneritem`
-- ----------------------------
DROP TABLE IF EXISTS `banneritem`;
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

-- ----------------------------
--  Records of `banneritem`
-- ----------------------------
BEGIN;
INSERT INTO `banneritem` VALUES ('1', 'http://ppf0hsoua.bkt.clouddn.com/banner/spring_new.jpg', 'dasad', '1', '春季上新', '0', '2019-03-05 14:22:01', '2019-04-04 18:12:22', '春季上新'), ('2', '', 'aaa', '1', '小红书推荐', '1', '2019-03-05 14:22:01', '2019-03-24 14:01:39', null), ('3', '', 'ddd', '1', '女王节', '1', '2019-03-05 14:22:01', '2019-03-24 14:01:39', null), ('4', '', 'ddd', '1', '化妆品套装', '1', '2019-03-05 14:22:01', '2019-03-24 14:01:39', '化妆品套装'), ('5', '', 'ddd', '1', '清洁', '1', '2019-03-05 14:22:01', '2019-03-24 14:01:39', null), ('6', '', '../productList/productList?id=2&type=category', '1', '口红', '2', '2019-03-07 16:39:08', '2019-03-24 14:01:39', null), ('7', '', '../productList/productList?id=4&type=category', '1', '面膜', '2', '2019-03-14 08:58:49', '2019-03-24 14:01:39', null), ('8', '', '../productList/productList?id=8&type=category', '1', '礼盒套装', '2', '2019-03-14 09:23:07', '2019-03-24 14:01:39', null), ('9', '', '../productList/productList?id=9&type=category', '1', '女士香水', '2', '2019-03-14 09:27:56', '2019-03-24 14:01:39', null), ('10', '', '../productList/productList?id=3&type=category', '1', '眼影', '2', '2019-03-14 09:40:58', '2019-03-24 14:01:39', null), ('11', '', '../productList/productList?id=6&type=category', '1', '腮红', '2', '2019-03-14 09:42:29', '2019-03-24 14:01:39', null), ('12', '', '../productList/productList?id=7&type=category', '1', '防晒护理', '2', '2019-03-14 09:44:53', '2019-03-24 14:01:39', null), ('13', '', '../productList/productList?id=10&type=category', '1', '精华', '2', '2019-03-14 09:47:35', '2019-03-24 14:01:39', null), ('14', '', '../productList/productList?id=12&type=category', '1', '眼霜', '2', '2019-03-14 09:47:47', '2019-03-24 14:01:39', null), ('15', '', '../productList/productList?id=11&type=category', '1', '乳液', '2', '2019-03-14 09:48:05', '2019-03-24 14:01:39', null), ('16', '', '../brand/brand', '1', '品牌闪购', '4', '2019-03-15 10:58:50', '2019-03-24 14:01:39', '满300减50'), ('17', '', '../points/points', '1', '积分赢好礼', '4', '2019-03-15 11:12:45', '2019-04-11 14:13:51', '下单抵现金'), ('18', '', '../rank/rank', '1', '排行榜', '4', '2019-03-15 11:13:02', '2019-03-24 14:01:39', '药丸面膜'), ('19', '', '..', '0', 'ysl口红', '0', '2019-03-15 13:14:24', '2019-04-15 17:48:51', 'ysl口红'), ('20', '', '..', '0', '女神香水', '0', '2019-03-15 13:57:37', '2019-04-15 17:48:49', '女神香水'), ('21', 'http://pnwhn87vf.bkt.clouddn.com/skii.jpg', '../flashSale/flashSale', '1', '限时购', '3', '2019-03-15 11:13:02', '2019-03-24 14:07:09', 'SKII神仙水800起'), ('22', 'http://ppf0hsoua.bkt.clouddn.com/red.jpg', '../bonus/bonus', '1', '分享好礼', '3', '2019-03-28 17:13:39', '2019-04-15 17:47:58', '得15元现金红包');
COMMIT;

-- ----------------------------
--  Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `brand`
-- ----------------------------
BEGIN;
INSERT INTO `brand` VALUES ('1', '圣罗兰', 'YSL', '2', '法国', '1', '2019-03-05 14:21:52', null, null), ('2', '阿玛尼', 'Giorgio Armani', '2', '法国', '1', '2019-03-05 14:21:52', null, null), ('3', 'NYX', 'NYX', '1', '美国', '1', '2019-03-05 14:21:52', null, null), ('4', '井田', 'canmake', '0', '日本', '1', '2019-03-05 14:21:52', null, null), ('5', '魅可', 'mac', '1', '美国', '1', '2019-03-05 14:21:52', null, null), ('6', '汤姆福特', 'TF', '2', '法国', '1', '2019-03-11 17:07:31', '2019-03-11 17:07:44', null), ('7', '雅诗兰黛', 'Estee Lauder', '2', '法国', '1', '2019-03-11 17:10:47', '2019-03-11 17:10:49', null), ('8', '蒂佳婷', 'Dr.Jart+', '1', '韩国', '1', '2019-03-12 12:44:15', '2019-03-12 12:44:18', null), ('9', '安耐晒', 'ANESSA', '2', '日本', '1', '2019-03-12 12:59:34', '2019-03-12 12:59:42', null), ('10', '肌司妍', 'JM solution', '1', '韩国', '0', '2019-03-18 16:33:58', null, null), ('11', '迪奥', 'Dior', '2', '法国', '1', '2019-04-10 18:20:06', '2019-04-10 18:20:12', null), ('12', '香奈儿', 'Chanel', '2', '法国', '1', '2019-04-15 11:38:37', '2019-04-15 11:38:44', null), ('13', 'SK2', 'SK-II', '2', '日本', '1', '2019-04-15 13:49:27', '2019-04-16 01:24:04', null), ('14', '黛珂', 'Decorte', '2', '日本', '1', '2019-04-15 16:37:40', '2019-04-15 16:37:44', null), ('15', '纳斯', 'Nars', '1', '美国', '1', '2019-04-15 17:06:54', '2019-04-15 17:06:59', null), ('16', '娇韵诗', 'Clarins', '1', '法国', '1', '2019-04-16 00:44:30', '2019-04-16 00:44:33', null), ('17', '馥蕾诗', 'fresh', '2', '法国', '1', '2019-04-16 00:53:01', '2019-04-16 00:53:04', null), ('18', '凡尔赛', 'Creer Beaute', '2', '日本', '1', '2019-04-16 01:05:42', '2019-04-16 01:05:45', null), ('19', '肌肤之钥', 'CPB', '2', '日本', '1', '2019-04-16 01:16:28', '2019-04-16 01:16:32', null);
COMMIT;

-- ----------------------------
--  Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
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

-- ----------------------------
--  Records of `category`
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES ('2', null, '口红', '5', 'http://i1.bvimg.com/677237/3ff60a7512c83d00.jpg', '1', '1', '2019-03-05 14:21:42', null), ('3', '眼影', '眼影', '5', null, '1', '0', '2019-03-05 14:21:42', '2019-03-14 09:27:16'), ('4', '面膜', '面膜', '6', 'http://i1.bvimg.com/677237/7f65e6d21ffaa0a3.jpg', '1', '1', '2019-03-05 14:21:42', '2019-03-14 08:44:30'), ('6', '腮红', '腮红', '5', 'category/6.jpg', '1', '0', '2019-03-07 16:32:41', '2019-03-14 09:27:21'), ('7', '防晒护理', '防晒护理', '7', 'category/7.jpg', '1', '0', '2019-03-12 12:58:57', '2019-03-12 13:10:39'), ('8', '礼盒套装', '礼盒套装', '6', 'category/8.jpg', '1', '0', '2019-03-14 09:22:34', '2019-03-14 09:22:37'), ('9', '女士香水', '女士香水', '5', 'category/9.jpg', '1', '0', '2019-03-14 09:27:05', '2019-03-14 09:27:09'), ('10', '精华/肌底液', '精华/肌底液', '6', 'category/10.jpg', '1', '0', '2019-03-14 09:46:26', '2019-03-14 09:47:09'), ('11', '面霜/乳液', '面霜/乳液', '6', 'category/11.jpg', '1', '0', '2019-03-14 09:46:39', '2019-03-14 09:47:11'), ('12', '眼霜/精华', '眼霜/精华', '6', 'category/12.jpg', '1', '0', '2019-03-14 09:46:52', '2019-03-14 09:47:13'), ('13', '洁面', '洁面', '6', 'category/13.jpg', '1', '0', '2019-03-14 09:47:04', '2019-04-16 00:46:29');
COMMIT;

-- ----------------------------
--  Table structure for `coupon`
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
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

-- ----------------------------
--  Records of `coupon`
-- ----------------------------
BEGIN;
INSERT INTO `coupon` VALUES ('1', '满1000减30', '1000', '30', '1', '2019-03-31 16:00:00', '2019-04-30 16:00:00', '0'), ('2', '满100减20', '100', '20', '1', '2019-03-31 16:00:00', '2019-04-30 16:00:00', '0'), ('3', '满200减15', '200', '15', '1', '2019-03-31 16:00:00', '2019-04-30 16:00:00', '0'), ('4', '满500减25', '500', '25', '1', '2019-03-31 16:00:00', '2019-04-06 16:00:00', '0');
COMMIT;

-- ----------------------------
--  Table structure for `eshopconfig`
-- ----------------------------
DROP TABLE IF EXISTS `eshopconfig`;
CREATE TABLE `eshopconfig` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `eshopconfig`
-- ----------------------------
BEGIN;
INSERT INTO `eshopconfig` VALUES ('1', 'xxcUrl', 'http://ppf0hsoua.bkt.clouddn.com/xxc.jpg', ''), ('2', 'noticeMsg', '欢迎在线咨询徐小柴~', null), ('3', 'productImgBase', 'http://ppf0hsoua.bkt.clouddn.com/product/', null), ('4', 'categoryImgBase', 'http://ppf0hsoua.bkt.clouddn.com/category/', null), ('5', 'bannerImgBase', 'http://ppf0hsoua.bkt.clouddn.com/banner/', null), ('6', 'preSearch', 'ahc/ysl', null), ('7', 'countryFlagImgBase', 'http://ppf0hsoua.bkt.clouddn.com/country/', null), ('8', 'articlePreSearch', '阿玛尼403/药丸面膜/天气丹套装/第一', null), ('9', 'bonus', '15', null), ('10', 'shareTitle', '小柴精选 全球品质好物', ''), ('11', 'goldDiscount', '0.98', null), ('12', 'platinumDiscount', '0.93', null), ('13', 'diamondDiscount', '0.88', null), ('14', 'showNoticeMessage', '0', null), ('15', 'brandImgBase', 'http://ppf0hsoua.bkt.clouddn.com/brand/', '品牌的图片base地址'), ('16', 'productDetailImgBase', 'http://ppf0hsoua.bkt.clouddn.com/detail/', '商品详情图片的base地址'), ('17', 'shareImgUrl', 'http://ppf0hsoua.bkt.clouddn.com/logo.jpg', '分享链接的图片地址'), ('18', 'licenceImgUrl', 'http://ppf0hsoua.bkt.clouddn.com/licenceCopy.jpg', '营业执照图片地址');
COMMIT;

-- ----------------------------
--  Table structure for `eshoporder`
-- ----------------------------
DROP TABLE IF EXISTS `eshoporder`;
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

-- ----------------------------
--  Records of `eshoporder`
-- ----------------------------
BEGIN;
INSERT INTO `eshoporder` VALUES ('47', '1', '2019-04-15 14:47:13', '1', '20190415224712710006', '18217683505', '276', '2', '1', '1', 'oX-br4rfqn2ia4g6kGdbFKlkgBYw', null, '', '2019-04-15 22:51:30', null, 'share', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '', '', '', '0', '0', '0'), ('48', '号', '2019-04-15 15:10:08', '1', '20190415231008296472', '18217683505', '346', '1', 'a', '啊', 'oX-br4rfqn2ia4g6kGdbFKlkgBYw', null, '', '2019-04-15 23:11:13', null, 'share', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '', '', '', '0', '0', '200'), ('49', '2', '2019-04-15 15:25:22', '1', '20190415232520400000', '18218683505', '348', '1', '5', '5', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', null, '啊', '2019-04-15 23:27:38', null, 'share', 'oX-br4rfqn2ia4g6kGdbFKlkgBYw', '', '', '', '0', '0', '0'), ('50', '1', '2019-04-15 15:29:31', '1', '20190415232930401342', '18217683505', '3147', '3', '5', '5', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', null, '5', '2019-04-15 23:29:56', null, '', '', '', '', '', '0', '0', '300'), ('51', '是', '2019-04-15 15:31:37', '-1', '20190415233136292689', '18217683505', '9241', '9', '18217683505', '5', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', null, '', '2019-04-15 23:32:02', null, '', '', '', '', '', '0', '0', '2000'), ('52', '了', '2019-04-15 15:32:45', '1', '20190415233245256045', '18217683505', '10270', '10', '了', '了', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', null, '', '2019-04-15 23:33:00', null, '', '', '', '', '', '0', '0', '2000'), ('53', 'e', '2019-04-15 15:40:39', '2', '20190415234038637522', '18217683505', '9890', '37', 'e', 'a', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '44', '', '2019-04-15 23:41:55', 'dd', 'share', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '', '', '', '0', '0', '2000'), ('54', '是', '2019-04-15 16:05:48', '1', '20190416000548101598', '18217683505', '1230', '2', '啊', '啊', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', null, '', '2019-04-16 00:06:18', null, 'share', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '', '', '', '0', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `format`
-- ----------------------------
DROP TABLE IF EXISTS `format`;
CREATE TABLE `format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT '0',
  `flashPrice` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `productIdState` (`productId`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `format`
-- ----------------------------
BEGIN;
INSERT INTO `format` VALUES ('1', '01 cilli', '138', '8', '1', null), ('2', 'ruby woo', '145', '8', '1', null), ('3', '#80', '348', '15', '1', null), ('4', '#15 Wild Ginger', '358', '15', '1', null), ('5', '#999 哑光', '288', '9', '1', '238.00'), ('6', '#400 The Red', '225', '10', '1', null), ('7', '#405 Sultan', '328', '10', '1', null), ('8', '五片 / 盒', '68', '21', '1', null), ('9', '90ml', '320', '22', '1', '290.00'), ('10', '230ml', '1050', '23', '1', '0.00'), ('11', '十片/盒', '80', '24', '1', '70.00'), ('12', '十片/盒', '80', '1334', '1', '68.00'), ('13', '五片/盒', '50', '1334', '1', '38.00'), ('14', '50ml', '608', '1335', '1', '588.00'), ('15', '100ml', '900', '1335', '1', '880.00'), ('16', '15ml', '388', '1336', '1', '0.00'), ('17', '300ml', '480', '1337', '1', '0.00'), ('18', '#03 Warm Neutrals', '175', '11', '1', '0.00'), ('19', '#Omega 柔亮米褐色', '158', '12', '1', '0.00'), ('20', '#02 自然咖啡色', '75', '13', '1', '0.00'), ('21', '#05 粉红咖啡', '75', '13', '1', '0.00'), ('22', '#10 淡粉红', '75', '13', '1', '0.00'), ('23', '#15 暮光亮蓝', '75', '13', '1', '0.00'), ('24', '#14 古典深红', '75', '13', '1', '0.00'), ('25', '#07 桃红', '75', '13', '1', '0.00'), ('26', '#Deep Throat 深喉', '175', '1338', '1', '0.00'), ('27', '#Sex Appeal 性感', '175', '1338', '1', '0.00'), ('28', '#Orgasm 高潮', '175', '1338', '1', '0.00'), ('29', '150ml', '260', '1339', '1', '0.00'), ('30', '100ml', '385', '1340', '1', '0.00'), ('31', '100ml', '550', '1341', '1', '0.00'), ('32', '125g', '400', '1342', '1', '0.00'), ('33', '银色(美白保湿)  1片/27ml', '35', '1343', '1', '0.00'), ('34', ' 红色(白金保湿)  1片/27ml', '35', '1343', '1', '0.00'), ('35', '金色(弹力保湿) 1片/27ml', '35', '1343', '1', '0.00'), ('36', '120g', '420', '1344', '1', '0.00'), ('37', '滋润型/110ml', '400', '1345', '1', '0.00'), ('38', '清爽型/110ml', '400', '1345', '0', '0.00');
COMMIT;

-- ----------------------------
--  Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(255) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `categoryId` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `history`
-- ----------------------------
BEGIN;
INSERT INTO `history` VALUES ('1', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '15', '2', '2019-04-04 21:27:47'), ('2', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '15', '2', '2019-04-04 21:27:50'), ('3', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '9', '2', '2019-04-04 21:28:22'), ('4', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '15', '2', '2019-04-04 21:28:47'), ('5', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '15', '2', '2019-04-04 21:28:58'), ('6', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '15', '2', '2019-04-04 21:30:36'), ('7', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '10', '2', '2019-04-04 21:45:15');
COMMIT;

-- ----------------------------
--  Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
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

-- ----------------------------
--  Records of `orderitem`
-- ----------------------------
BEGIN;
INSERT INTO `orderitem` VALUES ('11', '1', '201903111105062979734', 'Tom Ford?±¤?§??????? lip color é??é?????è??', '348.00', null, '3', '15', '#80'), ('12', '1', '201903111107147199074', 'Tom Ford?±¤?§??????? lip color é??é?????è??', '348.00', null, '3', '15', '#80'), ('13', '1', '201903111109167016132', 'Tom Ford?±¤?§??????? lip color é??é?????è??', '348.00', null, '3', '15', '#80'), ('14', '2', '201903111115107671399', 'Tom Ford?±¤?§??????? lip color é??é?????è??', '348.00', null, '3', '15', '#80'), ('15', '1', '201903111115107671399', 'Tom Ford?±¤?§??????? lip color é??é?????è??', '358.00', null, '4', '15', '#15 Wild Ginger'), ('16', '1', '201903111118019758198', 'Tom Ford?±¤?§??????? lip color é??é?????è??', '348.00', null, '3', '15', '#80'), ('17', '1', '201903111124236765930', 'Tom Ford?±¤?§??????? lip color é??é?????è??', '348.00', null, '3', '15', '#80'), ('18', '1', '201903111129304477200', 'Tom Ford?±¤?§??????? lip color é??é?????è??', '348.00', null, '3', '15', '#80'), ('19', '1', '201903111130077986515', 'Tom Ford??±?¤??§??????? lip color ????????????¨??', '348.00', null, '3', '15', '#80'), ('20', '1', '201903111304584002459', 'Tom Ford?±¤?§??????? lip color é??é?????è??', '348.00', '', '3', '15', '#80'), ('21', '1', '201903111304584002459', 'Tom Ford?±¤?§??????? lip color é??é?????è??', '358.00', '', '4', '15', '#15 Wild Ginger'), ('22', '1', '201903111735566646844', 'Dioré????????è??', '288.00', '', '5', '9', '#999 ??????'), ('23', '1', '201903111735566646844', 'MAC???è??', '138.00', '', '1', '8', '01 cilli'), ('24', '1', '201903111735566646844', 'MAC???è??', '145.00', '', '2', '8', 'ruby woo'), ('25', '1', '201903111744388104120', 'Dioré????????è??', '288.00', '', '5', '9', '#999 ??????'), ('26', '1', '201903111745478540790', 'MAC???è??', '138.00', '', '1', '8', '01 cilli'), ('27', '1', '201903111751262277431', 'Dioré????????è??', '288.00', '', '5', '9', '#999 ??????'), ('28', '1', '20190312131940007756', 'Shiseido è???????? Anessa ???è????? è??é???°????è??UV?????? SPF50', '288.00', '', '9', '22', '90ml'), ('29', '1', '20190313100529064631', 'é??????°????????°???????é??', '225.00', '', '6', '10', '#400 The Red'), ('30', '1', '20190313103704901593', 'é??????°????????°???????é??', '225.00', '', '6', '10', '#400 The Red'), ('31', '1', '201903131632425925850', 'é??????°????????°???????é??', '225.00', '', '6', '10', '#400 The Red'), ('32', '1', '201903131643260583761', 'é??????°????????°???????é??', '225.00', '', '6', '10', '#400 The Red'), ('33', '1', '201903131644057331577', '阿玛尼漆亮水漾唇釉', '225.00', '', '6', '10', '#400 The Red'), ('34', '1', '201903131644588800861', 'Dioré????????è??', '288.00', '', '5', '9', '#999 ??????'), ('35', '1', '201903131646091152163', 'Dioré????????è??', '288.00', '', '5', '9', '#999 ??????'), ('36', '1', '201903131647217012071', 'Dior魅惑唇膏', '288.00', '', '5', '9', '#999 哑光'), ('37', '1', '201903281323589770705', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('38', '1', '201903281326079119032', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('39', '1', '201903281328019856388', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('40', '2', '20190329140926372161', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('41', '2', '20190329140957118298', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('42', '2', '20190329141309190118', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('43', '2', '20190329141412442005', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('44', '2', '20190329141459554122', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('45', '2', '20190329141711379606', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('46', '2', '20190329142147684147', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('47', '1', '201904012316345224246', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('48', '2', '201904031128376573520', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('49', '1', '2019040316352616083', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('50', '62', '2019040316372456885', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('51', '1', '2019040316400607076', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('52', '1', '2019040316412633266', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('53', '2', '20190403184757073081', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('54', '1', '20190403184757073081', 'MAC唇膏', '138.00', 'http://pnwhn87vf.bkt.clouddn.com/product/8-0.jpg', '1', '8', '01 cilli'), ('55', '1', '20190403185243216168', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80'), ('56', '2', '20190412003350438501', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', null, '3', '15', '#80'), ('57', '1', '20190412003350438501', 'Tom Ford汤姆福特 lip color 黑金唇膏', '358.00', null, '4', '15', '#15 Wild Ginger'), ('58', '2', '20190412004649095070', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', null, '3', '15', '#80'), ('59', '1', '20190413115054713830', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', null, '3', '15', '#80'), ('60', '1', '20190413115054713830', 'MAC唇膏', '138.00', null, '1', '8', '01 cilli'), ('61', '1', '20190413115234201025', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', null, '3', '15', '#80'), ('62', '1', '20190413115234201025', 'MAC唇膏', '138.00', null, '1', '8', '01 cilli'), ('63', '1', '20190413120138851138', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', null, '3', '15', '#80'), ('64', '1', '20190413120138851138', 'MAC唇膏', '138.00', null, '1', '8', '01 cilli'), ('65', '1', '2019041510422679509', '阿玛尼漆亮水漾唇釉', '225.00', null, '6', '10', '#400 The Red'), ('66', '1', '2019041510422679509', 'JM珍珠面膜', '38.00', null, '13', '1334', '五片/盒'), ('67', '1', '2019041510422679509', 'JM珍珠面膜', '68.00', null, '12', '1334', '十片/盒'), ('68', '2', '20190415224711062618', 'MAC 魅可 唇膏', '138.00', null, '1', '8', '01 cilli'), ('69', '2', '20190415224712710006', 'MAC 魅可 唇膏', '138.00', null, '1', '8', '01 cilli'), ('70', '1', '20190415231008296472', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', null, '3', '15', '#80'), ('71', '1', '20190415232520400000', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', null, '3', '15', '#80'), ('72', '3', '20190415232930401342', 'SK-II 护肤精华 神仙水', '1050.00', null, '10', '23', '230ml'), ('73', '9', '20190415233136292689', 'SK-II 护肤精华 神仙水', '1050.00', null, '10', '23', '230ml'), ('74', '10', '20190415233245256045', 'SK-II 护肤精华 神仙水', '1050.00', null, '10', '23', '230ml'), ('75', '37', '20190415234038637522', 'Dior 迪奥 烈焰蓝金唇膏', '288.00', null, '5', '9', '#999 哑光'), ('76', '1', '20190416000548101598', 'SK-II 护肤精华 神仙水', '1050.00', null, '10', '23', '230ml'), ('77', '1', '20190416000548101598', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', null, '3', '15', '#80');
COMMIT;

-- ----------------------------
--  Table structure for `parentcategory`
-- ----------------------------
DROP TABLE IF EXISTS `parentcategory`;
CREATE TABLE `parentcategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL COMMENT '状态，下架0，上架1',
  `lastModifyTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `parentcategory`
-- ----------------------------
BEGIN;
INSERT INTO `parentcategory` VALUES ('5', '美妆', '1', null, '2019-03-05 14:21:28'), ('6', '护肤', '1', null, '2019-03-05 14:21:28'), ('7', '个人护理', '1', null, '2019-03-05 14:21:28'), ('8', '母婴幼儿', '1', null, '2019-03-05 14:21:28');
COMMIT;

-- ----------------------------
--  Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1346 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `product`
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES ('1', null, null, null, null, null, null, null, 'product/1-0.jpg', null, null, null, '0', null, '2019-03-05 14:17:56', '2019-03-07 16:06:46', 'product/1-1.jpg', 'product/1-2.jpg', 'product/1-3.jpg', 'product/1-4.jpg', null, null), ('2', 'YSL口红', '方管圆管', null, null, null, '10', '10', 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', null, null, null, '0', null, '2019-03-05 14:17:56', null, null, null, null, null, null, null), ('3', 'YSL口红', '方管圆管', null, null, null, '10', '10', 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', null, null, null, '0', null, '2019-03-05 14:17:56', null, null, null, null, null, null, null), ('4', 'YSL口红', '方管圆管', null, null, null, '10', '10', 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', null, null, null, '0', null, '2019-03-05 14:17:56', '2019-03-24 01:03:36', null, null, null, null, null, '1'), ('8', 'MAC 魅可 唇膏', 'MAC唇膏', '138.00', '130.00', '0.00', '100', '32', null, '2', '5', '5', '1', '2', '2019-03-05 14:17:56', '2019-04-15 17:23:29', null, null, null, null, null, ''), ('9', 'Dior 迪奥 烈焰蓝金唇膏', 'Dior魅惑唇膏', '320.00', '266.00', '288.00', '10', '13', null, '2', '5', '11', '1', '2', '2019-03-05 14:17:56', '2019-04-15 17:22:05', null, null, null, null, null, '1'), ('10', '阿玛尼漆亮水漾唇釉', '阿玛尼漆亮水漾唇釉', '258.00', null, null, '100', '13', 'http://i1.bvimg.com/677237/28b8fff357968901.jpg', '2', '5', '2', '1', '2', '2019-03-05 14:17:56', '2019-03-11 17:18:48', null, null, null, null, null, null), ('11', 'NYX 16色眼影盘', 'NYX 16色眼影盘', '175.00', '136.00', '0.00', '100', '19', null, '3', '5', '3', '1', '0', '2019-03-05 14:17:56', '2019-04-15 16:55:06', null, null, null, null, null, ''), ('12', 'MAC 魅可 时尚焦点小眼影', 'MAC 魅可 时尚焦点小眼影', '158.00', '129.00', '0.00', '100', '19', null, '3', '5', '5', '1', '0', '2019-03-05 14:17:56', '2019-04-15 16:55:22', null, null, null, null, null, ''), ('13', 'Canmake 井田 完美高效眼影', 'Canmake 井田 完美高效眼影', '75.00', '49.00', '0.00', '100', '19', null, '3', '5', '4', '1', '0', '2019-03-05 14:17:56', '2019-04-15 16:57:58', null, null, null, null, null, ''), ('15', 'Tom Ford汤姆福特 lip color 黑金唇膏', 'Tom Ford汤姆福特 lip color 黑金唇膏', '348.00', '0.00', '0.00', '99', '24', null, '2', '5', '6', '1', '2', '2019-03-07 16:06:46', '2019-04-16 00:06:18', null, null, null, null, null, null), ('21', '蒂佳婷 Dr.Jart+ 蓝色药丸面膜 专业瞬间锁水', '适合易缺水干燥肌肤。面膜蕴含水润精华，面膜纸以超细纤维制成，更贴合面部，将精华完整传送到肌底。', '68.00', '43.00', '0.00', '58', '42', null, '4', '6', '8', '1', '0', '2019-03-12 12:46:57', '2019-04-15 11:09:54', 'http://localhost:8080/backend/resources/eshop/image/product/21-1.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/21-2.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/21-3.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/21-4.jpg', null, ''), ('22', 'Shiseido 资生堂 Anessa 安耐晒 超防水美肌UV乳液 SPF50', '具有防水、防汗、防皮脂的特性，不论进行海边、游泳池或户外休闲活动等，等能安心阻挡强烈日晒', '330.00', '266.00', '290.00', '40', '31', null, '7', '7', '9', '1', '0', '2019-03-12 13:02:40', '2019-04-15 17:04:33', 'http://localhost:8080/backend/resources/eshop/image/product/22-1.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/22-2.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/22-3.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/22-4.jpg', null, '1'), ('23', 'SK-II 护肤精华 神仙水', 'SK-II 护肤精华 神仙水', '1050.00', '963.00', '0.00', '24', '32', null, '10', '6', '13', '1', '0', '2019-03-19 09:46:09', '2019-04-16 00:06:18', 'http://pnwhn87vf.bkt.clouddn.com/product/23-1.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/23-2.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/23-3.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/23-4.jpg', null, '0'), ('24', 'JM Solution肌司妍 水光蜂蜜面膜', 'JM Solution肌司妍 水光蜂蜜面膜', '80.00', '37.00', '70.00', '10', '82', null, '4', '6', '10', '1', '0', '2019-03-19 10:43:00', '2019-04-15 11:09:28', 'http://pnwhn87vf.bkt.clouddn.com/product/24-1.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/24-2.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/24-3.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/24-4.jpg', null, '1'), ('1334', 'JM Solution肌司妍 海洋珍珠深层保湿面膜', 'JM Solution肌司妍 海洋珍珠深层保湿面膜', '80.00', '37.00', '68.00', '100', '20', null, '4', '6', '10', '1', '0', '2019-04-14 12:51:40', '2019-04-15 10:58:51', 'http://ppf0hsoua.bkt.clouddn.com/product/1334-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1334-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1334-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1334-4.jpg', null, '1'), ('1335', 'Chanel香奈儿 可可小姐淡香水喷雾', 'Chanel香奈儿 可可小姐淡香水喷雾', '608.00', '585.00', null, '23', '102', 'http://ppf0hsoua.bkt.clouddn.com/product/1335-0.jpg', '9', '5', '12', '1', '0', '2019-04-15 11:37:56', '2019-04-15 11:39:03', 'http://ppf0hsoua.bkt.clouddn.com/product/1335-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1335-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1335-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1335-4.jpg', null, '0'), ('1336', 'Estee Lauder 雅诗兰黛 小棕瓶密集修护眼精华', 'Estee Lauder 雅诗兰黛 小棕瓶密集修护眼精华', '388.00', '338.00', '0.00', '73', '85', null, '12', '6', '7', '1', '0', '2019-04-15 16:16:21', '2019-04-15 16:27:43', 'http://ppf0hsoua.bkt.clouddn.com/product/1336-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1336-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1336-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1336-4.jpg', null, '0'), ('1337', 'Decorte 黛珂 牛油果乳液', 'Decorte 黛珂 牛油果乳液', '480.00', '431.00', null, '13', '46', 'http://ppf0hsoua.bkt.clouddn.com/product/1337-0.jpg', '11', '6', '14', '1', '0', '2019-04-15 16:38:57', '2019-04-15 16:39:12', 'http://ppf0hsoua.bkt.clouddn.com/product/1337-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1337-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1337-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1337-4.jpg', null, '0'), ('1338', 'Nars 纳斯 炫色腮红', 'Nars 纳斯 炫色腮红', '175.00', '149.00', null, '21', '57', 'http://ppf0hsoua.bkt.clouddn.com/product/1338-0.jpg', '6', '5', '15', '1', '0', '2019-04-15 17:09:26', '2019-04-15 17:09:46', 'http://ppf0hsoua.bkt.clouddn.com/product/1338-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1338-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1338-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1338-4.jpg', null, '0'), ('1339', 'CLARINS 娇韵诗 透白光感洁面霜 洗面奶', '均匀肤色，给肌肤从内到外的透白均匀光泽。美白洁面泡沫质地轻盈，有效净化肌肤，使肌肤更为透亮、柔润，倍感清新舒适。', '260.00', '194.00', null, '23', '12', 'http://ppf0hsoua.bkt.clouddn.com/product/1339-0.jpg', '13', '6', '16', '1', '0', '2019-04-16 00:42:49', '2019-04-16 00:44:51', 'http://ppf0hsoua.bkt.clouddn.com/product/1339-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1339-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1339-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1339-4.jpg', null, '0'), ('1340', 'fresh馥蕾诗 玫瑰保湿面膜', '玫瑰润泽保湿舒缓面膜舒缓肌肤，有效补水，帮助改善肌肤暗哑。柔滑的?喱配方包含玫瑰的多种形态，玫瑰花瓣、纯正玫瑰花水、玫瑰精油，层层沁润，让肌肤如同沉醉于玫瑰花海中，尽享润泽透亮，长时间补水。适合各种肤质使用。  使用方法：取适量产品于清洁后的湿润面部肌肤，避开眼部区域。停留5-10分钟后用水清洗去除。可每天使用。', '385.00', '297.00', null, '11', '24', 'http://ppf0hsoua.bkt.clouddn.com/product/1340-0.jpg', '4', '6', '17', '1', '0', '2019-04-16 00:55:28', '2019-04-16 00:55:38', 'http://ppf0hsoua.bkt.clouddn.com/product/1340-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1340-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1340-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1340-4.jpg', null, '0'), ('1341', 'fresh馥蕾诗 红茶瞬间修复面膜', '红茶抗皱紧致修护面膜给予肌肤出色紧致体验，肌肤更柔软顺滑、幼嫩饱满，焕发亮泽神采。面膜天鹅绒般柔软的特别质地有效肌肤降温，有效润泽，再现水滢剔透。   使用建议：清洁面部后用毛巾擦干，之后使用本品于脸部，避开眼部区域。停留5-10分钟后冲洗干净。每周使用2-3次。', '550.00', '461.00', null, '11', '24', 'http://ppf0hsoua.bkt.clouddn.com/product/1341-0.jpg', '4', '6', '17', '1', '0', '2019-04-16 00:57:57', '2019-04-16 00:58:09', 'http://ppf0hsoua.bkt.clouddn.com/product/1341-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1341-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1341-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1341-4.jpg', null, '0'), ('1342', 'fresh馥蕾诗 黄糖滋润亮采面膜', 'Fresh畅销单品之一，以澄糖、野草莓果提取物与滋润精华油等调和制成的去角质面膜，呈现肌肤润泽质感，改善肤色暗沉。滋养肌肤，温和去除老化角质，使肌肤重现光泽，神采飞扬。   使用方法：取适量本产品轻柔按摩于清洁、湿润的肌肤，避开眼部。静待5至10分钟后用温水冲洗干净即可。建议每周使用3至4次。', '400.00', '291.00', '0.00', '61', '39', null, '4', '6', '17', '1', '0', '2019-04-16 01:00:17', '2019-04-16 01:00:57', 'http://ppf0hsoua.bkt.clouddn.com/product/1342-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1342-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1342-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1342-4.jpg', null, '0'), ('1343', 'Creer Beaute凡尔赛玫瑰面膜', '银色（深层珍珠美白保湿面膜）：蕴含珍珠粉、针叶樱桃萃取物、玫瑰水、四季柑果皮萃取物、葡萄柚皮萃取物及透明质酸，为肌肤注入充沛水份，同时有效发挥锁水功能，并散发迷人白玫瑰香气。 红色（安东尼特白金保湿面膜）：含有白金纳米、玻尿酸、蜂王浆萃取保湿精华成分配合，采用柔和的纤维材质，温和包覆肌肤，吸收性极佳，浸透肌肤。 金色（黄金润透亮弹力保湿面膜）：蕴含白金纳米成分、蜂王浆萃取物、玫瑰水、热情果果皮萃取物、葡萄柚籽萃取物及透明质酸，为肌肤注入充沛水分，同时有效滋润肌肤，并给肌肤倍增魅力，散发迷人玫瑰香氛。', '35.00', '27.00', null, '83', '103', 'http://ppf0hsoua.bkt.clouddn.com/product/1343-0.jpg', '4', '6', '18', '1', '0', '2019-04-16 01:08:06', '2019-04-16 01:10:14', 'http://ppf0hsoua.bkt.clouddn.com/product/1343-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1343-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1343-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1343-4.jpg', null, '0'), ('1344', 'SK-II SK2 护肤洁面霜 洗面奶', '氨基酸温和洁面，幼细的保湿泡沫，并加入“神仙水”成分PITERATM，有助调理肌肤，焕现晶莹剔透，柔软有弹性。', '420.00', '369.00', '0.00', '32', '86', null, '13', '6', '13', '1', '0', '2019-04-16 01:13:03', '2019-04-16 01:13:19', 'http://ppf0hsoua.bkt.clouddn.com/product/1344-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1344-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1344-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1344-4.jpg', null, '0'), ('1345', 'Cle de Peau Beaute 肌肤之钥 cpb 光采洁面膏 洗面奶 滋润型/清爽型', '轻柔绵密泡沫，温和地去除肌肤表层多余的老旧角质和油脂，同时保湿滋润，改善暗沉问题及提升肌肤细致度，加强护肤瓶的吸收，令肌肤透亮细致，尽享清新触感。', '400.00', '358.00', '0.00', '53', '68', null, '13', '6', '19', '1', '0', '2019-04-16 01:15:42', '2019-04-16 01:16:48', 'http://ppf0hsoua.bkt.clouddn.com/product/1345-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1345-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1345-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1345-4.jpg', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `promotion`
-- ----------------------------
DROP TABLE IF EXISTS `promotion`;
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

-- ----------------------------
--  Records of `promotion`
-- ----------------------------
BEGIN;
INSERT INTO `promotion` VALUES ('12', '雅诗兰黛全场每满300减30', 'brand', 'money', 'amount', '300', '0', '30', '', '7', '', '0'), ('13', '面膜全场任意品牌五盒送一盒', 'category', 'gift', 'total', '0', '5', '0', '面膜', '', '4', '0'), ('14', '口红全场任意品牌满500减50', 'category', 'money', 'amount', '500', '0', '50', '面膜', '', '2', '0'), ('15', '蒂佳婷五盒送一盒', 'brand', 'gift', 'total', '0', '5', '0', '', '8', '', '1');
COMMIT;

-- ----------------------------
--  Table structure for `searchhistory`
-- ----------------------------
DROP TABLE IF EXISTS `searchhistory`;
CREATE TABLE `searchhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kw` varchar(255) DEFAULT NULL,
  `openId` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `searchhistory`
-- ----------------------------
BEGIN;
INSERT INTO `searchhistory` VALUES ('1', 'dior', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '2019-04-15 23:54:51');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
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

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'oX-br4rfqn2ia4g6kGdbFKlkgBYw', null, '1', '30', '0', '622', null, '0', '622', '427', '2019-04-15 14:54:25', '1'), ('3', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', null, '1', '0', '3', '24885', '2019-04-15 15:29:57', '0', '24885', '20595', '2019-04-15 16:10:40', '2');
COMMIT;

-- ----------------------------
--  Table structure for `viewhistory`
-- ----------------------------
DROP TABLE IF EXISTS `viewhistory`;
CREATE TABLE `viewhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(255) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `categoryId` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `openId` (`openId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=gb2312 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `viewhistory`
-- ----------------------------
BEGIN;
INSERT INTO `viewhistory` VALUES ('1', 'oX-br4rfqn2ia4g6kGdbFKlkgBYw', '15', '2', '2019-04-15 23:09:24'), ('2', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '15', '2', '2019-04-15 23:14:31'), ('3', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '23', '10', '2019-04-15 23:29:02'), ('4', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '23', '10', '2019-04-15 23:30:44'), ('5', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '23', '10', '2019-04-15 23:32:23'), ('6', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '23', '10', '2019-04-15 23:33:20'), ('7', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '21', '4', '2019-04-15 23:51:30'), ('8', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1338', '6', '2019-04-15 23:53:43'), ('9', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1338', '6', '2019-04-15 23:53:54'), ('10', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '12', '3', '2019-04-15 23:54:27'), ('11', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '12', '3', '2019-04-15 23:54:29'), ('12', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '9', '2', '2019-04-15 23:54:54'), ('13', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '9', '2', '2019-04-15 23:58:37'), ('14', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '15', '2', '2019-04-16 00:05:22'), ('15', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '15', '2', '2019-04-16 00:06:36'), ('16', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1339', '13', '2019-04-16 00:47:20'), ('17', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1339', '13', '2019-04-16 00:49:01'), ('18', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1340', '4', '2019-04-16 00:57:02'), ('19', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1341', '4', '2019-04-16 00:58:39'), ('20', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1342', '4', '2019-04-16 01:02:22'), ('21', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1341', '4', '2019-04-16 01:02:32'), ('22', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1340', '4', '2019-04-16 01:02:39'), ('23', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1342', '4', '2019-04-16 01:02:48'), ('24', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1343', '4', '2019-04-16 01:11:26'), ('25', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1344', '13', '2019-04-16 01:14:21'), ('26', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1345', '13', '2019-04-16 01:19:37'), ('27', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1344', '13', '2019-04-16 01:19:44'), ('28', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1344', '13', '2019-04-16 01:20:11'), ('29', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1345', '13', '2019-04-16 01:20:17'), ('30', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1344', '13', '2019-04-16 01:20:21'), ('31', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '23', '10', '2019-04-16 01:24:12'), ('32', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1344', '13', '2019-04-16 01:24:21');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
