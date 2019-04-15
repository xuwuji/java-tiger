/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : eshop

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 15/04/2019 17:49:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `time` timestamp(0) NULL DEFAULT NULL,
  `text` text CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL,
  `referProductId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `typeId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '0-公共，1-种草笔记',
  `announceStyle` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `imgs` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `mainImgUrl` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '第一篇文章修改', '2019-03-20 23:56:36', '<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />', '8', '1', '', 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg', '化妆;', '1', 'http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg');
INSERT INTO `article` VALUES (2, '第二篇文章', '2019-03-20 23:56:36', '<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />', '8', '1', '', 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg', '口红;', '1', 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg');
INSERT INTO `article` VALUES (3, '第三篇文章', '2019-03-20 23:56:36', '<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />', '8', '1', NULL, 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg', '护肤;', '1', NULL);
INSERT INTO `article` VALUES (4, '第四篇文章', '2019-03-20 23:56:36', '<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />', '8', '1', NULL, 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg', '套装;', '1', NULL);
INSERT INTO `article` VALUES (5, '第五章文章', '2019-03-20 23:56:36', '<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />', '8', '0', 'small', 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg', '化妆;遮瑕;', '1', NULL);
INSERT INTO `article` VALUES (6, '第六篇文章', '2019-03-20 23:56:36', '<h1>\n	介绍一下这系列的基本情况。\n</h1>\n<br />\n<span style=\"font-size:14px;\">直径14.5mm，基弧8.8mm，含水量38%，度数0-800度。</span><br />\n<span style=\"font-size:14px;\"></span><span style=\"font-size:14px;background-color:#FFE500;color:#E53333;\"><br />\n<div style=\"text-align:center;\">\n	<span style=\"background-color:#FFE500;color:#E53333;\">有分日抛和月抛。</span> \n</div>\n</span> \n<div style=\"text-align:center;\">\n	<br />\n</div>\n<img class=\"articleImage\" src=\"http://pnwhn87vf.bkt.clouddn.com/banner/10.jpg\" width=\"300\" height=\"300\" alt=\"\" title=\"\" align=\"\" /><br />\n<span style=\"font-size:14px;\"> 舒适度还是很好的，没有异物感，也不滑片，做到了这个价位的美瞳该有的舒适度。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/banner/4.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 虽然直径是14.5，上眼并不会有撑满眼眶的感觉。不过因为色彩的层次设计，扩瞳效果还是不错的。眼珠子看起来也会亮晶晶的。</span><br />\n<img src=\"http://pnwhn87vf.bkt.clouddn.com/country/%E6%B3%95%E5%9B%BD.jpg\" alt=\"\" /><br />\n<br />\n<span style=\"font-size:14px;\"> 这系列6个颜色中有5个颜色都是非常典型的日系混血款，玻璃珠效果，搭配妆容会更好看。所以平时不怎么化妆的妹子们可能不太适合。</span><br />\n<br />\n<br />\n<span style=\"font-size:14px;\"> 下面的文章我会配合官方图给出的三个组合来分别介绍这6个颜色，如果有翻译得不对的地方，希望大家指出哦！！感谢！！！</span><br />', '8', '0', 'big', 'http://pnwhn87vf.bkt.clouddn.com/product/21-4.jpg;http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg', '化妆;遮瑕;', '1', NULL);
INSERT INTO `article` VALUES (7, '测试第一篇', '2019-03-27 23:10:55', 'adasdasd', NULL, '1', '防晒霜', 'http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg;', NULL, '0', NULL);
INSERT INTO `article` VALUES (8, '测试第一篇', '2019-03-27 23:15:11', 'adasdasd', NULL, '1', '防晒霜', 'http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg;', NULL, '0', 'http://pnwhn87vf.bkt.clouddn.com/product/22-0.jpg');
INSERT INTO `article` VALUES (9, '测试第二', '2019-03-27 23:19:03', 'dsf', NULL, '1', '', 'dsf', 'fdsf', '0', 'fdsf');
INSERT INTO `article` VALUES (10, '测试第二', '2019-03-27 23:19:25', 'dsf', '15', '1', '', 'dsf', 'fdsf', '1', 'fdsf');

-- ----------------------------
-- Table structure for banneritem
-- ----------------------------
DROP TABLE IF EXISTS `banneritem`;
CREATE TABLE `banneritem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `redirectUrl` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `bannerId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifyTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `info` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banneritem
-- ----------------------------
INSERT INTO `banneritem` VALUES (1, 'http://ppf0hsoua.bkt.clouddn.com/banner/spring_new.jpg', 'dasad', '1', '春季上新', '0', '2019-03-05 14:22:01', '2019-04-04 18:12:22', '春季上新');
INSERT INTO `banneritem` VALUES (2, '', 'aaa', '1', '小红书推荐', '1', '2019-03-05 14:22:01', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (3, '', 'ddd', '1', '女王节', '1', '2019-03-05 14:22:01', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (4, '', 'ddd', '1', '化妆品套装', '1', '2019-03-05 14:22:01', '2019-03-24 14:01:39', '化妆品套装');
INSERT INTO `banneritem` VALUES (5, '', 'ddd', '1', '清洁', '1', '2019-03-05 14:22:01', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (6, '', '../productList/productList?id=2&type=category', '1', '口红', '2', '2019-03-07 16:39:08', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (7, '', '../productList/productList?id=4&type=category', '1', '面膜', '2', '2019-03-14 08:58:49', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (8, '', '../productList/productList?id=8&type=category', '1', '礼盒套装', '2', '2019-03-14 09:23:07', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (9, '', '../productList/productList?id=9&type=category', '1', '女士香水', '2', '2019-03-14 09:27:56', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (10, '', '../productList/productList?id=3&type=category', '1', '眼影', '2', '2019-03-14 09:40:58', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (11, '', '../productList/productList?id=6&type=category', '1', '腮红', '2', '2019-03-14 09:42:29', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (12, '', '../productList/productList?id=7&type=category', '1', '防晒护理', '2', '2019-03-14 09:44:53', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (13, '', '../productList/productList?id=10&type=category', '1', '精华', '2', '2019-03-14 09:47:35', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (14, '', '../productList/productList?id=12&type=category', '1', '眼霜', '2', '2019-03-14 09:47:47', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (15, '', '../productList/productList?id=11&type=category', '1', '乳液', '2', '2019-03-14 09:48:05', '2019-03-24 14:01:39', NULL);
INSERT INTO `banneritem` VALUES (16, '', '../brand/brand', '1', '品牌闪购', '4', '2019-03-15 10:58:50', '2019-03-24 14:01:39', '满300减50');
INSERT INTO `banneritem` VALUES (17, '', '../points/points', '1', '积分赢好礼', '4', '2019-03-15 11:12:45', '2019-04-11 14:13:51', '下单抵现金');
INSERT INTO `banneritem` VALUES (18, '', '../rank/rank', '1', '排行榜', '4', '2019-03-15 11:13:02', '2019-03-24 14:01:39', '药丸面膜');
INSERT INTO `banneritem` VALUES (19, '', '..', '0', 'ysl口红', '0', '2019-03-15 13:14:24', '2019-04-15 17:48:51', 'ysl口红');
INSERT INTO `banneritem` VALUES (20, '', '..', '0', '女神香水', '0', '2019-03-15 13:57:37', '2019-04-15 17:48:49', '女神香水');
INSERT INTO `banneritem` VALUES (21, 'http://pnwhn87vf.bkt.clouddn.com/skii.jpg', '../flashSale/flashSale', '1', '限时购', '3', '2019-03-15 11:13:02', '2019-03-24 14:07:09', 'SKII神仙水800起');
INSERT INTO `banneritem` VALUES (22, 'http://ppf0hsoua.bkt.clouddn.com/red.jpg', '../bonus/bonus', '1', '分享好礼', '3', '2019-03-28 17:13:39', '2019-04-15 17:47:58', '得15元现金红包');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brandCN` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `brandEN` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `brandLevel` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifyTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `imgUrl` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES (1, '圣罗兰', 'YSL', '2', '法国', '1', '2019-03-05 14:21:52', NULL, NULL);
INSERT INTO `brand` VALUES (2, '阿玛尼', 'Giorgio Armani', '2', '法国', '1', '2019-03-05 14:21:52', NULL, NULL);
INSERT INTO `brand` VALUES (3, 'NYX', 'NYX', '1', '美国', '1', '2019-03-05 14:21:52', NULL, NULL);
INSERT INTO `brand` VALUES (4, '井田', 'canmake', '0', '日本', '1', '2019-03-05 14:21:52', NULL, NULL);
INSERT INTO `brand` VALUES (5, '魅可', 'mac', '1', '美国', '1', '2019-03-05 14:21:52', NULL, NULL);
INSERT INTO `brand` VALUES (6, '汤姆福特', 'TF', '2', '法国', '1', '2019-03-11 17:07:31', '2019-03-11 17:07:44', NULL);
INSERT INTO `brand` VALUES (7, '雅诗兰黛', 'Estee Lauder', '2', '法国', '1', '2019-03-11 17:10:47', '2019-03-11 17:10:49', NULL);
INSERT INTO `brand` VALUES (8, '蒂佳婷', 'Dr.Jart+', '1', '韩国', '1', '2019-03-12 12:44:15', '2019-03-12 12:44:18', NULL);
INSERT INTO `brand` VALUES (9, '安耐晒', 'ANESSA', '2', '日本', '1', '2019-03-12 12:59:34', '2019-03-12 12:59:42', NULL);
INSERT INTO `brand` VALUES (10, '肌司妍', 'JM solution', '1', '韩国', '0', '2019-03-18 16:33:58', NULL, NULL);
INSERT INTO `brand` VALUES (11, '迪奥', 'Dior', '2', '法国', '1', '2019-04-10 18:20:06', '2019-04-10 18:20:12', NULL);
INSERT INTO `brand` VALUES (12, '香奈儿', 'Chanel', '2', '法国', '1', '2019-04-15 11:38:37', '2019-04-15 11:38:44', NULL);
INSERT INTO `brand` VALUES (13, 'SK-II', 'SK-II', '2', '日本', '1', '2019-04-15 13:49:27', '2019-04-15 13:49:34', NULL);
INSERT INTO `brand` VALUES (14, '黛珂', 'Decorte', '2', '日本', '1', '2019-04-15 16:37:40', '2019-04-15 16:37:44', NULL);
INSERT INTO `brand` VALUES (15, '纳斯', 'Nars', '1', '美国', '1', '2019-04-15 17:06:54', '2019-04-15 17:06:59', NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `parentCategoryId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL COMMENT '属于父类的id',
  `imgUrl` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '' COMMENT '显示的图片url',
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0' COMMENT '0下架 1上架',
  `recommend` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0' COMMENT '0不推荐 1推荐',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifyTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (2, NULL, '口红', '5', 'http://i1.bvimg.com/677237/3ff60a7512c83d00.jpg', '1', '1', '2019-03-05 14:21:42', NULL);
INSERT INTO `category` VALUES (3, '眼影', '眼影', '5', NULL, '1', '0', '2019-03-05 14:21:42', '2019-03-14 09:27:16');
INSERT INTO `category` VALUES (4, '面膜', '面膜', '6', 'http://i1.bvimg.com/677237/7f65e6d21ffaa0a3.jpg', '1', '1', '2019-03-05 14:21:42', '2019-03-14 08:44:30');
INSERT INTO `category` VALUES (6, '腮红', '腮红', '5', 'category/6.jpg', '1', '0', '2019-03-07 16:32:41', '2019-03-14 09:27:21');
INSERT INTO `category` VALUES (7, '防晒护理', '防晒护理', '7', 'category/7.jpg', '1', '0', '2019-03-12 12:58:57', '2019-03-12 13:10:39');
INSERT INTO `category` VALUES (8, '礼盒套装', '礼盒套装', '6', 'category/8.jpg', '1', '0', '2019-03-14 09:22:34', '2019-03-14 09:22:37');
INSERT INTO `category` VALUES (9, '女士香水', '女士香水', '5', 'category/9.jpg', '1', '0', '2019-03-14 09:27:05', '2019-03-14 09:27:09');
INSERT INTO `category` VALUES (10, '精华/肌底液', '精华/肌底液', '6', 'category/10.jpg', '1', '0', '2019-03-14 09:46:26', '2019-03-14 09:47:09');
INSERT INTO `category` VALUES (11, '面霜/乳液', '面霜/乳液', '6', 'category/11.jpg', '1', '0', '2019-03-14 09:46:39', '2019-03-14 09:47:11');
INSERT INTO `category` VALUES (12, '眼霜/精华', '眼霜/精华', '6', 'category/12.jpg', '1', '0', '2019-03-14 09:46:52', '2019-03-14 09:47:13');
INSERT INTO `category` VALUES (13, '洁面', '洁面', '6', 'category/13.jpg', '0', '0', '2019-03-14 09:47:04', '2019-03-14 09:47:04');

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `total` double(255, 0) NULL DEFAULT NULL,
  `reduction` double(255, 0) NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `startDate` timestamp(0) NULL DEFAULT NULL,
  `endDate` timestamp(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '0-全场',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES (1, '满1000减30', 1000, 30, '1', '2019-03-31 16:00:00', '2019-04-30 16:00:00', '0');
INSERT INTO `coupon` VALUES (2, '满100减20', 100, 20, '1', '2019-03-31 16:00:00', '2019-04-30 16:00:00', '0');
INSERT INTO `coupon` VALUES (3, '满200减15', 200, 15, '1', '2019-03-31 16:00:00', '2019-04-30 16:00:00', '0');
INSERT INTO `coupon` VALUES (4, '满500减25', 500, 25, '1', '2019-03-31 16:00:00', '2019-04-06 16:00:00', '0');

-- ----------------------------
-- Table structure for eshopconfig
-- ----------------------------
DROP TABLE IF EXISTS `eshopconfig`;
CREATE TABLE `eshopconfig`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eshopconfig
-- ----------------------------
INSERT INTO `eshopconfig` VALUES (1, 'xxcUrl', 'http://localhost:8080/backend/resources/eshop/image/xxc.jpg', NULL);
INSERT INTO `eshopconfig` VALUES (2, 'noticeMsg', '欢迎在线咨询徐小柴~', NULL);
INSERT INTO `eshopconfig` VALUES (3, 'productImgBase', 'http://ppf0hsoua.bkt.clouddn.com/product/', NULL);
INSERT INTO `eshopconfig` VALUES (4, 'categoryImgBase', 'http://ppf0hsoua.bkt.clouddn.com/category/', NULL);
INSERT INTO `eshopconfig` VALUES (5, 'bannerImgBase', 'http://ppf0hsoua.bkt.clouddn.com/banner/', NULL);
INSERT INTO `eshopconfig` VALUES (6, 'preSearch', 'ahc/ysl', NULL);
INSERT INTO `eshopconfig` VALUES (7, 'countryFlagImgBase', 'http://ppf0hsoua.bkt.clouddn.com/country/', NULL);
INSERT INTO `eshopconfig` VALUES (8, 'articlePreSearch', '阿玛尼403/药丸面膜/天气丹套装/第一', NULL);
INSERT INTO `eshopconfig` VALUES (9, 'bonus', '15', NULL);
INSERT INTO `eshopconfig` VALUES (10, 'shareTitle', '快来看一看', NULL);
INSERT INTO `eshopconfig` VALUES (11, 'goldDiscount', '0.98', NULL);
INSERT INTO `eshopconfig` VALUES (12, 'platinumDiscount', '0.93', NULL);
INSERT INTO `eshopconfig` VALUES (13, 'diamondDiscount', '0.88', NULL);
INSERT INTO `eshopconfig` VALUES (14, 'showNoticeMessage', '0', NULL);
INSERT INTO `eshopconfig` VALUES (15, 'brandImgBase', 'http://ppf0hsoua.bkt.clouddn.com/brand/', '品牌的图片base地址');
INSERT INTO `eshopconfig` VALUES (16, 'productDetailImgBase', 'http://ppf0hsoua.bkt.clouddn.com/detail/', '商品详情图片的base地址');

-- ----------------------------
-- Table structure for eshoporder
-- ----------------------------
DROP TABLE IF EXISTS `eshoporder`;
CREATE TABLE `eshoporder`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `wechatId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '订单状态',
  `orderId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `phoneNum` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `amount` double(255, 0) NULL DEFAULT NULL,
  `totalCount` int(255) NULL DEFAULT NULL,
  `recieverName` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `openId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `logisticsId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `memo` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `lastModifyTime` datetime(0) NULL DEFAULT NULL,
  `logisticsName` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sourceOpenId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sourceWechatId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `promotionIds` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `couponId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `usedBonus` double NULL DEFAULT NULL,
  `usedCouponCash` double NULL DEFAULT NULL,
  `usedPoints` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eshoporder
-- ----------------------------
INSERT INTO `eshoporder` VALUES (4, 'ew', '2019-03-11 00:00:00', '0', '201903111105062979734', 'we', 348, 1, 'qe', 'ee', '', NULL, NULL, '2019-03-11 15:35:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (5, 'ew', '2019-03-11 00:00:00', '0', '201903111107147199074', 'ew', 348, 1, 'e', 'e', '', NULL, NULL, '2019-03-11 15:35:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (6, 'gg', '2019-03-11 00:00:00', '-1', '201903111109167016132', 'gg', 348, 1, 'gg', 'gg', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, NULL, '2019-04-03 16:42:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (7, 'tre', '2019-03-11 00:00:00', '-1', '201903111115107671399', 're', 1054, 3, 'er', '34', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, NULL, '2019-04-03 16:42:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (8, '5', '2019-03-11 11:18:01', '-1', '201903111118019758198', '4', 348, 1, '34', '2', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '4', '2019-04-03 16:42:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (9, 'we', '2019-03-11 11:24:23', '-1', '201903111124236765930', 'we', 348, 1, 'we', 'we', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'we', '2019-04-03 16:42:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (10, 'ds', '2019-03-11 03:29:31', '3', '201903111129304477200', 'sad', 348, 1, 'sd', 'ds', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'sad', '2019-03-11 15:35:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (11, 'ds', '2019-03-11 03:30:08', '3', '201903111130077986515', 'sad', 348, 1, 'sd', 'ds', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '23412321312', 'test', '2019-03-11 16:26:54', '顺丰', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (12, 'ds', '2019-03-11 05:04:58', '1', '201903111304584002459', 'sd', 706, 2, 'asd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'ddddd', '2019-03-11 15:41:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (13, '34', '2019-03-11 09:35:57', '-1', '201903111735566646844', '23', 571, 3, '32', '213', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '213', '2019-04-12 01:02:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (14, 'wewe', '2019-03-11 09:44:39', '-1', '201903111744388104120', 'we', 288, 1, 'ew', 'ew', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'ew', '2019-04-03 16:42:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (15, 'sa', '2019-03-11 09:45:47', '-1', '201903111745478540790', 'sd', 138, 1, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'd', '2019-04-03 16:42:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (16, 'e2', '2019-03-11 09:51:27', '-1', '201903111751262277431', '32', 288, 1, '23', '32', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '23', '2019-04-03 16:42:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (17, 'dd', '2019-03-12 05:19:40', '-1', '20190312131940007756', '???j', 288, 1, '???', '??????', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '??????', '2019-04-03 16:42:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (18, 'd', '2019-03-13 02:37:04', '-1', '20190313103704901593', 'd', 225, 1, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'd', '2019-04-03 16:42:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (19, 'd', '2019-03-13 08:32:42', '-1', '201903131632425925850', 'è?????', 225, 1, '?¤§è?¨è??', '????¤??°?', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '????¤§??°??°', '2019-04-03 16:42:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (20, 'd', '2019-03-13 08:43:26', '-1', '201903131643260583761', 'è?????', 225, 1, '?¤§è?¨è??', '????¤??°?', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '????¤§??°??°', '2019-04-03 16:42:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (21, 'd', '2019-03-13 08:44:05', '-1', '201903131644057331577', '说的', 225, 1, '大萨达', '是多少', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '撒大声地', '2019-04-03 16:42:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (22, 'd', '2019-03-13 08:44:58', '-1', '201903131644588800861', 'sad', 288, 1, 'è?????', '?¤§è?¨è??', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '??????', '2019-04-03 16:42:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (23, '??????', '2019-03-13 08:46:10', '-1', '201903131646091152163', '?¤§', 288, 1, '?????????', '??????????¤?', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'sad', '2019-04-03 16:42:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (24, '手打', '2019-03-13 08:47:22', '-1', '201903131647217012071', 'sad', 288, 1, 'sad', 'sad', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'sad', '2019-04-03 16:42:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (25, 'ddsd', '2019-03-28 05:26:07', '-1', '201903281326079119032', 'd', 348, 1, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', '2019-04-12 01:04:42', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (26, 'd', '2019-03-28 05:28:02', '1', '201903281328019856388', 'd', 348, 1, 'd', 'd', 'aaa', NULL, '', '2019-03-28 17:11:19', NULL, 'share', 'test', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (27, 'd', '2019-03-29 06:09:27', '-1', '20190329140926372161', 'd', 696, 2, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', '2019-04-12 01:04:46', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (28, 'd', '2019-03-29 06:09:58', '0', '20190329140957118298', 'd', 696, 2, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (29, 'e', '2019-03-29 06:13:10', '0', '20190329141309190118', 'e', 696, 2, 'e', 'e', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (30, 'd', '2019-03-29 06:14:13', '0', '20190329141412442005', 'd', 696, 2, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (31, 'd', '2019-03-29 06:15:00', '0', '20190329141459554122', 'd', 696, 2, 'dq', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (32, 'd', '2019-03-29 06:17:11', '0', '20190329141711379606', 'd', 696, 2, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (33, 'd', '2019-03-29 06:21:47', '0', '20190329142147684147', 'd', 696, 2, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', '14;', NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (34, 'dasds', '2019-04-01 15:16:34', '1', '201904012316345224246', '18217683505', 328, 1, 'xuwuji', 'sad', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', '2019-04-02 15:58:26', NULL, '', '', '', '', '2', NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (35, 'd', '2019-04-03 03:28:38', '1', '201904031128376573520', '18217683505', 696, 2, 'ds', 'dsa', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', '2019-04-03 11:29:12', NULL, '', '', '', '14;', '', NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (36, '2o', '2019-04-03 08:35:26', '0', '2019040316352616083', '18217683505', 321, 1, 'e', '3', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', '', '2', NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (37, 'e', '2019-04-03 08:37:24', '1', '2019040316372456885', '18217683505', 21114, 62, 'e', 'e', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', '2019-04-03 16:38:02', NULL, '', '', '', '14;', '1', NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (38, 'e', '2019-04-03 08:40:06', '0', '2019040316400607076', '18217683505', 291, 1, 'e', '2', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', '', '3', NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (39, 'e', '2019-04-03 08:41:26', '-1', '2019040316412633266', '18217683505', 348, 1, 'e', 'e', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', '2019-04-12 01:02:35', NULL, '', '', '', '', '', NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (40, 'e', '2019-04-03 10:47:58', '-1', '20190403184757073081', '18217683505', 783, 3, 'e', 'e', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'e', '2019-04-12 01:02:30', NULL, '', '', '', '14;', '2', NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (41, 'd', '2019-04-03 10:52:44', '-1', '20190403185243216168', '18217683505', 311, 1, 'e', 'e', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', '2019-04-12 01:02:15', NULL, '', '', '', '', '3', NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (42, 'd', '2019-04-11 16:33:51', '-1', '20190412003350438501', '18217683505', 998, 3, 'q', 'a', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'a', '2019-04-12 01:01:47', NULL, '', '', '', '14;', '2', 10, 20, 500);
INSERT INTO `eshoporder` VALUES (43, 'e', '2019-04-11 16:46:49', '-1', '20190412004649095070', '18217683505', 652, 2, 'e', 'a', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'a', '2019-04-12 01:01:44', NULL, '', '', '', '14;', '3', 10, 15, 500);
INSERT INTO `eshoporder` VALUES (44, 'd', '2019-04-13 04:01:38', '0', '20190413120138851138', '18217683505', 486, 2, 'a', 'a', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', NULL, 'a', NULL, NULL, '', '', '', '', '', 0, 0, 0);
INSERT INTO `eshoporder` VALUES (45, 'a', '2019-04-15 02:42:26', '0', '2019041510422679509', '18217683505', 331, 3, 'a', 'a', 'oX-br4neGzmMBKR7ByjoXRUA1-NM', NULL, '', NULL, NULL, '', '', '', '', '', 0, 0, 0);

-- ----------------------------
-- Table structure for format
-- ----------------------------
DROP TABLE IF EXISTS `format`;
CREATE TABLE `format`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `productId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0',
  `flashPrice` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of format
-- ----------------------------
INSERT INTO `format` VALUES (1, '01 cilli', 138, '8', '1', NULL);
INSERT INTO `format` VALUES (2, 'ruby woo', 145, '8', '1', NULL);
INSERT INTO `format` VALUES (3, '#80', 348, '15', '1', NULL);
INSERT INTO `format` VALUES (4, '#15 Wild Ginger', 358, '15', '1', NULL);
INSERT INTO `format` VALUES (5, '#999 哑光', 288, '9', '1', 238.00);
INSERT INTO `format` VALUES (6, '#400 The Red', 225, '10', '1', NULL);
INSERT INTO `format` VALUES (7, '#405 Sultan', 328, '10', '1', NULL);
INSERT INTO `format` VALUES (8, '五片 / 盒', 68, '21', '1', NULL);
INSERT INTO `format` VALUES (9, '90ml', 320, '22', '1', 290.00);
INSERT INTO `format` VALUES (10, '230ml', 1050, '23', '1', 0.00);
INSERT INTO `format` VALUES (11, '十片/盒', 80, '24', '1', 70.00);
INSERT INTO `format` VALUES (12, '十片/盒', 80, '1334', '1', 68.00);
INSERT INTO `format` VALUES (13, '五片/盒', 50, '1334', '1', 38.00);
INSERT INTO `format` VALUES (14, '50ml', 608, '1335', '1', 588.00);
INSERT INTO `format` VALUES (15, '100ml', 900, '1335', '1', 880.00);
INSERT INTO `format` VALUES (16, '15ml', 388, '1336', '1', 0.00);
INSERT INTO `format` VALUES (17, '300ml', 480, '1337', '1', 0.00);
INSERT INTO `format` VALUES (18, '#03 Warm Neutrals', 175, '11', '1', 0.00);
INSERT INTO `format` VALUES (19, '#Omega 柔亮米褐色', 158, '12', '1', 0.00);
INSERT INTO `format` VALUES (20, '#02 自然咖啡色', 75, '13', '1', 0.00);
INSERT INTO `format` VALUES (21, '#05 粉红咖啡', 75, '13', '1', 0.00);
INSERT INTO `format` VALUES (22, '#10 淡粉红', 75, '13', '1', 0.00);
INSERT INTO `format` VALUES (23, '#15 暮光亮蓝', 75, '13', '1', 0.00);
INSERT INTO `format` VALUES (24, '#14 古典深红', 75, '13', '1', 0.00);
INSERT INTO `format` VALUES (25, '#07 桃红', 75, '13', '1', 0.00);
INSERT INTO `format` VALUES (26, '#Deep Throat 深喉', 175, '1338', '1', 0.00);
INSERT INTO `format` VALUES (27, '#Sex Appeal 性感', 175, '1338', '1', 0.00);
INSERT INTO `format` VALUES (28, '#Orgasm 高潮', 175, '1338', '1', 0.00);

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `productId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `categoryId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (1, 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '15', '2', '2019-04-04 21:27:47');
INSERT INTO `history` VALUES (2, 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '15', '2', '2019-04-04 21:27:50');
INSERT INTO `history` VALUES (3, 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '9', '2', '2019-04-04 21:28:22');
INSERT INTO `history` VALUES (4, 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '15', '2', '2019-04-04 21:28:47');
INSERT INTO `history` VALUES (5, 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '15', '2', '2019-04-04 21:28:58');
INSERT INTO `history` VALUES (6, 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '15', '2', '2019-04-04 21:30:36');
INSERT INTO `history` VALUES (7, 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '10', '2', '2019-04-04 21:45:15');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NULL DEFAULT NULL,
  `orderId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `mainImgUrl` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `formatId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `productId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `formatName` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (11, 1, '201903111105062979734', 'Tom Ford?±¤?§??????? lip color é??é?????è??', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (12, 1, '201903111107147199074', 'Tom Ford?±¤?§??????? lip color é??é?????è??', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (13, 1, '201903111109167016132', 'Tom Ford?±¤?§??????? lip color é??é?????è??', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (14, 2, '201903111115107671399', 'Tom Ford?±¤?§??????? lip color é??é?????è??', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (15, 1, '201903111115107671399', 'Tom Ford?±¤?§??????? lip color é??é?????è??', 358.00, NULL, '4', '15', '#15 Wild Ginger');
INSERT INTO `orderitem` VALUES (16, 1, '201903111118019758198', 'Tom Ford?±¤?§??????? lip color é??é?????è??', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (17, 1, '201903111124236765930', 'Tom Ford?±¤?§??????? lip color é??é?????è??', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (18, 1, '201903111129304477200', 'Tom Ford?±¤?§??????? lip color é??é?????è??', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (19, 1, '201903111130077986515', 'Tom Ford??±?¤??§??????? lip color ????????????¨??', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (20, 1, '201903111304584002459', 'Tom Ford?±¤?§??????? lip color é??é?????è??', 348.00, '', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (21, 1, '201903111304584002459', 'Tom Ford?±¤?§??????? lip color é??é?????è??', 358.00, '', '4', '15', '#15 Wild Ginger');
INSERT INTO `orderitem` VALUES (22, 1, '201903111735566646844', 'Dioré????????è??', 288.00, '', '5', '9', '#999 ??????');
INSERT INTO `orderitem` VALUES (23, 1, '201903111735566646844', 'MAC???è??', 138.00, '', '1', '8', '01 cilli');
INSERT INTO `orderitem` VALUES (24, 1, '201903111735566646844', 'MAC???è??', 145.00, '', '2', '8', 'ruby woo');
INSERT INTO `orderitem` VALUES (25, 1, '201903111744388104120', 'Dioré????????è??', 288.00, '', '5', '9', '#999 ??????');
INSERT INTO `orderitem` VALUES (26, 1, '201903111745478540790', 'MAC???è??', 138.00, '', '1', '8', '01 cilli');
INSERT INTO `orderitem` VALUES (27, 1, '201903111751262277431', 'Dioré????????è??', 288.00, '', '5', '9', '#999 ??????');
INSERT INTO `orderitem` VALUES (28, 1, '20190312131940007756', 'Shiseido è???????? Anessa ???è????? è??é???°????è??UV?????? SPF50', 288.00, '', '9', '22', '90ml');
INSERT INTO `orderitem` VALUES (29, 1, '20190313100529064631', 'é??????°????????°???????é??', 225.00, '', '6', '10', '#400 The Red');
INSERT INTO `orderitem` VALUES (30, 1, '20190313103704901593', 'é??????°????????°???????é??', 225.00, '', '6', '10', '#400 The Red');
INSERT INTO `orderitem` VALUES (31, 1, '201903131632425925850', 'é??????°????????°???????é??', 225.00, '', '6', '10', '#400 The Red');
INSERT INTO `orderitem` VALUES (32, 1, '201903131643260583761', 'é??????°????????°???????é??', 225.00, '', '6', '10', '#400 The Red');
INSERT INTO `orderitem` VALUES (33, 1, '201903131644057331577', '阿玛尼漆亮水漾唇釉', 225.00, '', '6', '10', '#400 The Red');
INSERT INTO `orderitem` VALUES (34, 1, '201903131644588800861', 'Dioré????????è??', 288.00, '', '5', '9', '#999 ??????');
INSERT INTO `orderitem` VALUES (35, 1, '201903131646091152163', 'Dioré????????è??', 288.00, '', '5', '9', '#999 ??????');
INSERT INTO `orderitem` VALUES (36, 1, '201903131647217012071', 'Dior魅惑唇膏', 288.00, '', '5', '9', '#999 哑光');
INSERT INTO `orderitem` VALUES (37, 1, '201903281323589770705', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (38, 1, '201903281326079119032', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (39, 1, '201903281328019856388', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (40, 2, '20190329140926372161', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (41, 2, '20190329140957118298', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (42, 2, '20190329141309190118', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (43, 2, '20190329141412442005', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (44, 2, '20190329141459554122', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (45, 2, '20190329141711379606', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (46, 2, '20190329142147684147', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (47, 1, '201904012316345224246', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (48, 2, '201904031128376573520', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (49, 1, '2019040316352616083', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (50, 62, '2019040316372456885', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (51, 1, '2019040316400607076', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (52, 1, '2019040316412633266', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (53, 2, '20190403184757073081', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (54, 1, '20190403184757073081', 'MAC唇膏', 138.00, 'http://pnwhn87vf.bkt.clouddn.com/product/8-0.jpg', '1', '8', '01 cilli');
INSERT INTO `orderitem` VALUES (55, 1, '20190403185243216168', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, 'http://pnwhn87vf.bkt.clouddn.com/product/15-0.jpg', '3', '15', '#80');
INSERT INTO `orderitem` VALUES (56, 2, '20190412003350438501', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (57, 1, '20190412003350438501', 'Tom Ford汤姆福特 lip color 黑金唇膏', 358.00, NULL, '4', '15', '#15 Wild Ginger');
INSERT INTO `orderitem` VALUES (58, 2, '20190412004649095070', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (59, 1, '20190413115054713830', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (60, 1, '20190413115054713830', 'MAC唇膏', 138.00, NULL, '1', '8', '01 cilli');
INSERT INTO `orderitem` VALUES (61, 1, '20190413115234201025', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (62, 1, '20190413115234201025', 'MAC唇膏', 138.00, NULL, '1', '8', '01 cilli');
INSERT INTO `orderitem` VALUES (63, 1, '20190413120138851138', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, NULL, '3', '15', '#80');
INSERT INTO `orderitem` VALUES (64, 1, '20190413120138851138', 'MAC唇膏', 138.00, NULL, '1', '8', '01 cilli');
INSERT INTO `orderitem` VALUES (65, 1, '2019041510422679509', '阿玛尼漆亮水漾唇釉', 225.00, NULL, '6', '10', '#400 The Red');
INSERT INTO `orderitem` VALUES (66, 1, '2019041510422679509', 'JM珍珠面膜', 38.00, NULL, '13', '1334', '五片/盒');
INSERT INTO `orderitem` VALUES (67, 1, '2019041510422679509', 'JM珍珠面膜', 68.00, NULL, '12', '1334', '十片/盒');

-- ----------------------------
-- Table structure for parentcategory
-- ----------------------------
DROP TABLE IF EXISTS `parentcategory`;
CREATE TABLE `parentcategory`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '状态，下架0，上架1',
  `lastModifyTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of parentcategory
-- ----------------------------
INSERT INTO `parentcategory` VALUES (5, '美妆', '1', NULL, '2019-03-05 14:21:28');
INSERT INTO `parentcategory` VALUES (6, '护肤', '1', NULL, '2019-03-05 14:21:28');
INSERT INTO `parentcategory` VALUES (7, '个人护理', '1', NULL, '2019-03-05 14:21:28');
INSERT INTO `parentcategory` VALUES (8, '母婴幼儿', '1', NULL, '2019-03-05 14:21:28');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `hkPrice` double(10, 2) NULL DEFAULT NULL,
  `flashPrice` double(10, 2) NULL DEFAULT NULL COMMENT '抢购价',
  `inventory` int(255) NULL DEFAULT NULL,
  `salesCount` int(255) NULL DEFAULT NULL,
  `mainImgUrl` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `categoryId` varchar(11) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `parentCategoryId` varchar(11) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `brandId` int(11) NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0',
  `bannerItemId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifyTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `imgUrl1` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `imgUrl2` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `imgUrl3` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `imgUrl4` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `colorId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `flashState` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1339 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'product/1-0.jpg', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', '2019-03-07 16:06:46', 'product/1-1.jpg', 'product/1-2.jpg', 'product/1-3.jpg', 'product/1-4.jpg', NULL, NULL);
INSERT INTO `product` VALUES (2, 'YSL口红', '方管圆管', NULL, NULL, NULL, 10, 10, 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (3, 'YSL口红', '方管圆管', NULL, NULL, NULL, 10, 10, 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (4, 'YSL口红', '方管圆管', NULL, NULL, NULL, 10, 10, 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', '2019-03-24 01:03:36', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `product` VALUES (8, 'MAC 魅可 唇膏', 'MAC唇膏', 138.00, 130.00, 0.00, 100, 32, NULL, '2', '5', 5, '1', '2', '2019-03-05 14:17:56', '2019-04-15 17:23:29', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `product` VALUES (9, 'Dior 迪奥 烈焰蓝金唇膏', 'Dior魅惑唇膏', 320.00, 266.00, 288.00, 10, 13, NULL, '2', '5', 11, '1', '2', '2019-03-05 14:17:56', '2019-04-15 17:22:05', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `product` VALUES (10, '阿玛尼漆亮水漾唇釉', '阿玛尼漆亮水漾唇釉', 258.00, NULL, NULL, 100, 13, 'http://i1.bvimg.com/677237/28b8fff357968901.jpg', '2', '5', 2, '1', '2', '2019-03-05 14:17:56', '2019-03-11 17:18:48', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (11, 'NYX 16色眼影盘', 'NYX 16色眼影盘', 175.00, 136.00, 0.00, 100, 19, NULL, '3', '5', 3, '1', '0', '2019-03-05 14:17:56', '2019-04-15 16:55:06', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `product` VALUES (12, 'MAC 魅可 时尚焦点小眼影', 'MAC 魅可 时尚焦点小眼影', 158.00, 129.00, 0.00, 100, 19, NULL, '3', '5', 5, '1', '0', '2019-03-05 14:17:56', '2019-04-15 16:55:22', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `product` VALUES (13, 'Canmake 井田 完美高效眼影', 'Canmake 井田 完美高效眼影', 75.00, 49.00, 0.00, 100, 19, NULL, '3', '5', 4, '1', '0', '2019-03-05 14:17:56', '2019-04-15 16:57:58', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `product` VALUES (15, 'Tom Ford汤姆福特 lip color 黑金唇膏', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, NULL, NULL, 100, 23, NULL, '2', '5', 6, '1', '2', '2019-03-07 16:06:46', '2019-03-11 17:19:04', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (21, '蒂佳婷 Dr.Jart+ 蓝色药丸面膜 专业瞬间锁水', '适合易缺水干燥肌肤。面膜蕴含水润精华，面膜纸以超细纤维制成，更贴合面部，将精华完整传送到肌底。', 68.00, 43.00, 0.00, 58, 42, NULL, '4', '6', 8, '1', '0', '2019-03-12 12:46:57', '2019-04-15 11:09:54', 'http://localhost:8080/backend/resources/eshop/image/product/21-1.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/21-2.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/21-3.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/21-4.jpg', NULL, '');
INSERT INTO `product` VALUES (22, 'Shiseido 资生堂 Anessa 安耐晒 超防水美肌UV乳液 SPF50', '具有防水、防汗、防皮脂的特性，不论进行海边、游泳池或户外休闲活动等，等能安心阻挡强烈日晒', 330.00, 266.00, 290.00, 40, 31, NULL, '7', '7', 9, '1', '0', '2019-03-12 13:02:40', '2019-04-15 17:04:33', 'http://localhost:8080/backend/resources/eshop/image/product/22-1.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/22-2.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/22-3.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/22-4.jpg', NULL, '1');
INSERT INTO `product` VALUES (23, 'SK-II 护肤精华 神仙水', 'SK-II 护肤精华 神仙水', 1050.00, 963.00, 0.00, 25, 31, NULL, '10', '6', 13, '1', '0', '2019-03-19 09:46:09', '2019-04-15 13:51:55', 'http://pnwhn87vf.bkt.clouddn.com/product/23-1.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/23-2.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/23-3.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/23-4.jpg', NULL, '0');
INSERT INTO `product` VALUES (24, 'JM Solution肌司妍 水光蜂蜜面膜', 'JM Solution肌司妍 水光蜂蜜面膜', 80.00, 37.00, 70.00, 10, 82, NULL, '4', '6', 10, '1', '0', '2019-03-19 10:43:00', '2019-04-15 11:09:28', 'http://pnwhn87vf.bkt.clouddn.com/product/24-1.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/24-2.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/24-3.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/24-4.jpg', NULL, '1');
INSERT INTO `product` VALUES (1334, 'JM Solution肌司妍 海洋珍珠深层保湿面膜', 'JM Solution肌司妍 海洋珍珠深层保湿面膜', 80.00, 37.00, 68.00, 100, 20, NULL, '4', '6', 10, '1', '0', '2019-04-14 12:51:40', '2019-04-15 10:58:51', 'http://ppf0hsoua.bkt.clouddn.com/product/1334-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1334-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1334-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1334-4.jpg', NULL, '1');
INSERT INTO `product` VALUES (1335, 'Chanel香奈儿 可可小姐淡香水喷雾', 'Chanel香奈儿 可可小姐淡香水喷雾', 608.00, 585.00, NULL, 23, 102, 'http://ppf0hsoua.bkt.clouddn.com/product/1335-0.jpg', '9', '5', 12, '1', '0', '2019-04-15 11:37:56', '2019-04-15 11:39:03', 'http://ppf0hsoua.bkt.clouddn.com/product/1335-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1335-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1335-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1335-4.jpg', NULL, '0');
INSERT INTO `product` VALUES (1336, 'Estee Lauder 雅诗兰黛 小棕瓶密集修护眼精华', 'Estee Lauder 雅诗兰黛 小棕瓶密集修护眼精华', 388.00, 338.00, 0.00, 73, 85, NULL, '12', '6', 7, '1', '0', '2019-04-15 16:16:21', '2019-04-15 16:27:43', 'http://ppf0hsoua.bkt.clouddn.com/product/1336-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1336-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1336-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1336-4.jpg', NULL, '0');
INSERT INTO `product` VALUES (1337, 'Decorte 黛珂 牛油果乳液', 'Decorte 黛珂 牛油果乳液', 480.00, 431.00, NULL, 13, 46, 'http://ppf0hsoua.bkt.clouddn.com/product/1337-0.jpg', '11', '6', 14, '1', '0', '2019-04-15 16:38:57', '2019-04-15 16:39:12', 'http://ppf0hsoua.bkt.clouddn.com/product/1337-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1337-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1337-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1337-4.jpg', NULL, '0');
INSERT INTO `product` VALUES (1338, 'Nars 纳斯 炫色腮红', 'Nars 纳斯 炫色腮红', 175.00, 149.00, NULL, 21, 57, 'http://ppf0hsoua.bkt.clouddn.com/product/1338-0.jpg', '6', '5', 15, '1', '0', '2019-04-15 17:09:26', '2019-04-15 17:09:46', 'http://ppf0hsoua.bkt.clouddn.com/product/1338-1.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1338-2.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1338-3.jpg', 'http://ppf0hsoua.bkt.clouddn.com/product/1338-4.jpg', NULL, '0');

-- ----------------------------
-- Table structure for promotion
-- ----------------------------
DROP TABLE IF EXISTS `promotion`;
CREATE TABLE `promotion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `target` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '场景',
  `type` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '满减，赠礼',
  `rule` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '满金额，满数量',
  `amount` double(255, 0) NULL DEFAULT NULL COMMENT '满减-满多少可以减；赠礼-满多少可以送',
  `total` double NULL DEFAULT NULL COMMENT '赠礼-满几件送',
  `reduction` double(255, 0) NULL DEFAULT NULL COMMENT '满减-减多少',
  `gift` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `brandId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `categoryId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion
-- ----------------------------
INSERT INTO `promotion` VALUES (12, '雅诗兰黛全场每满300减30', 'brand', 'money', 'amount', 300, 0, 30, '', '7', '', '0');
INSERT INTO `promotion` VALUES (13, '面膜全场任意品牌五盒送一盒', 'category', 'gift', 'total', 0, 5, 0, '面膜', '', '4', '0');
INSERT INTO `promotion` VALUES (14, '口红全场任意品牌满500减50', 'category', 'money', 'amount', 500, 0, 50, '面膜', '', '2', '0');
INSERT INTO `promotion` VALUES (15, '蒂佳婷五盒送一盒', 'brand', 'gift', 'total', 0, 5, 0, '', '8', '', '1');

-- ----------------------------
-- Table structure for searchhistory
-- ----------------------------
DROP TABLE IF EXISTS `searchhistory`;
CREATE TABLE `searchhistory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kw` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `openId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `wechatId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '0-没付过款（属于新人），1-付过款（不属于新人）',
  `bonusAmount` double(255, 0) NULL DEFAULT NULL COMMENT '分享红包现金奖励',
  `level` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '用户级别',
  `totalPay` double(255, 0) NULL DEFAULT NULL COMMENT '消费总额',
  `membershipFirstDay` timestamp(0) NULL DEFAULT NULL COMMENT '会员日期生效日',
  `amountAfterMSFD` double(255, 0) NULL DEFAULT NULL COMMENT '会员生效日后面付款金额',
  `amountThisMonth` double(255, 0) NULL DEFAULT NULL COMMENT '本月消费金额',
  `points` double(255, 0) NULL DEFAULT NULL COMMENT '积分',
  `lastCheckInDate` timestamp(0) NULL DEFAULT NULL COMMENT '最后一次签到日期',
  `continuousNum` int(255) NULL DEFAULT NULL COMMENT '连续签到天数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (9, 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '1', 60, '1', 0, NULL, 0, 0, 3000, '2019-04-11 15:26:08', 1);
INSERT INTO `user` VALUES (10, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', NULL, '1', 0, '0', 0, NULL, NULL, NULL, 5, '2019-04-15 02:51:32', 1);

-- ----------------------------
-- Table structure for viewhistory
-- ----------------------------
DROP TABLE IF EXISTS `viewhistory`;
CREATE TABLE `viewhistory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `productId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `categoryId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of viewhistory
-- ----------------------------
INSERT INTO `viewhistory` VALUES (1, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '24', '4', '2019-04-14 13:01:31');
INSERT INTO `viewhistory` VALUES (2, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1334', '4', '2019-04-15 10:29:26');
INSERT INTO `viewhistory` VALUES (3, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1334', '4', '2019-04-15 10:31:25');
INSERT INTO `viewhistory` VALUES (4, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1334', '4', '2019-04-15 10:33:14');
INSERT INTO `viewhistory` VALUES (5, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1334', '4', '2019-04-15 10:34:46');
INSERT INTO `viewhistory` VALUES (6, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1334', '4', '2019-04-15 10:35:31');
INSERT INTO `viewhistory` VALUES (7, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1334', '4', '2019-04-15 10:36:29');
INSERT INTO `viewhistory` VALUES (8, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1334', '4', '2019-04-15 10:37:57');
INSERT INTO `viewhistory` VALUES (9, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1334', '4', '2019-04-15 10:39:22');
INSERT INTO `viewhistory` VALUES (10, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1334', '4', '2019-04-15 10:39:40');
INSERT INTO `viewhistory` VALUES (11, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1334', '4', '2019-04-15 10:40:10');
INSERT INTO `viewhistory` VALUES (12, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '9', '2', '2019-04-15 10:43:46');
INSERT INTO `viewhistory` VALUES (13, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '15', '2', '2019-04-15 10:44:03');
INSERT INTO `viewhistory` VALUES (14, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1334', '4', '2019-04-15 10:59:08');
INSERT INTO `viewhistory` VALUES (15, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '21', '4', '2019-04-15 11:10:09');
INSERT INTO `viewhistory` VALUES (16, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '21', '4', '2019-04-15 11:10:24');
INSERT INTO `viewhistory` VALUES (17, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '15', '2', '2019-04-15 11:18:13');
INSERT INTO `viewhistory` VALUES (18, 'oX-br4rfqn2ia4g6kGdbFKlkgBYw', '1334', '4', '2019-04-15 11:25:37');
INSERT INTO `viewhistory` VALUES (19, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1335', '9', '2019-04-15 11:41:24');
INSERT INTO `viewhistory` VALUES (20, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '23', '10', '2019-04-15 13:58:14');
INSERT INTO `viewhistory` VALUES (21, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1336', '12', '2019-04-15 16:31:47');
INSERT INTO `viewhistory` VALUES (22, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1336', '12', '2019-04-15 16:32:00');
INSERT INTO `viewhistory` VALUES (23, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1336', '12', '2019-04-15 16:34:23');
INSERT INTO `viewhistory` VALUES (24, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1337', '11', '2019-04-15 16:43:53');
INSERT INTO `viewhistory` VALUES (25, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1335', '9', '2019-04-15 16:44:37');
INSERT INTO `viewhistory` VALUES (26, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '13', '3', '2019-04-15 16:48:18');
INSERT INTO `viewhistory` VALUES (27, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '11', '3', '2019-04-15 16:56:03');
INSERT INTO `viewhistory` VALUES (28, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '12', '3', '2019-04-15 16:56:14');
INSERT INTO `viewhistory` VALUES (29, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '12', '3', '2019-04-15 16:57:10');
INSERT INTO `viewhistory` VALUES (30, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '12', '3', '2019-04-15 16:57:24');
INSERT INTO `viewhistory` VALUES (31, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '13', '3', '2019-04-15 16:59:44');
INSERT INTO `viewhistory` VALUES (32, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '13', '3', '2019-04-15 17:00:46');
INSERT INTO `viewhistory` VALUES (33, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '22', '7', '2019-04-15 17:03:48');
INSERT INTO `viewhistory` VALUES (34, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '22', '7', '2019-04-15 17:05:16');
INSERT INTO `viewhistory` VALUES (35, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1338', '6', '2019-04-15 17:12:55');
INSERT INTO `viewhistory` VALUES (36, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1338', '6', '2019-04-15 17:16:14');
INSERT INTO `viewhistory` VALUES (37, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '13', '3', '2019-04-15 17:16:25');
INSERT INTO `viewhistory` VALUES (38, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1338', '6', '2019-04-15 17:17:58');
INSERT INTO `viewhistory` VALUES (39, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '22', '7', '2019-04-15 17:18:03');
INSERT INTO `viewhistory` VALUES (40, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '22', '7', '2019-04-15 17:18:52');
INSERT INTO `viewhistory` VALUES (41, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '13', '3', '2019-04-15 17:19:04');
INSERT INTO `viewhistory` VALUES (42, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '22', '7', '2019-04-15 17:19:11');
INSERT INTO `viewhistory` VALUES (43, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '11', '3', '2019-04-15 17:19:19');
INSERT INTO `viewhistory` VALUES (44, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '12', '3', '2019-04-15 17:19:26');
INSERT INTO `viewhistory` VALUES (45, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1337', '11', '2019-04-15 17:19:37');
INSERT INTO `viewhistory` VALUES (46, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1335', '9', '2019-04-15 17:19:49');
INSERT INTO `viewhistory` VALUES (47, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1336', '12', '2019-04-15 17:19:58');
INSERT INTO `viewhistory` VALUES (48, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '1336', '12', '2019-04-15 17:21:09');
INSERT INTO `viewhistory` VALUES (49, 'oX-br4neGzmMBKR7ByjoXRUA1-NM', '21', '4', '2019-04-15 17:46:32');

SET FOREIGN_KEY_CHECKS = 1;
