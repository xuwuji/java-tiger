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

 Date: 02/04/2019 18:26:41
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
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `lastModifyTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `info` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banneritem
-- ----------------------------
INSERT INTO `banneritem` VALUES (1, '', 'dasad', '1', '春季上新', '0', '2019-03-05 14:22:01', '2019-03-24 14:01:39', '春季上新');
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
INSERT INTO `banneritem` VALUES (17, '', '../', '1', '每日上新', '4', '2019-03-15 11:12:45', '2019-03-24 14:01:39', '科颜氏淡斑精华');
INSERT INTO `banneritem` VALUES (18, '', '../rank/rank', '1', '排行榜', '4', '2019-03-15 11:13:02', '2019-03-24 14:01:39', '药丸面膜');
INSERT INTO `banneritem` VALUES (19, '', '..', '1', 'ysl口红', '0', '2019-03-15 13:14:24', '2019-03-24 14:01:39', 'ysl口红');
INSERT INTO `banneritem` VALUES (20, '', '..', '1', '女神香水', '0', '2019-03-15 13:57:37', '2019-03-24 14:01:39', '女神香水');
INSERT INTO `banneritem` VALUES (21, 'http://pnwhn87vf.bkt.clouddn.com/skii.jpg', '../flashSale/flashSale', '1', '限时购', '3', '2019-03-15 11:13:02', '2019-03-24 14:07:09', 'SKII神仙水800起');
INSERT INTO `banneritem` VALUES (22, 'http://pnwhn87vf.bkt.clouddn.com/red.jpg', '../bonus/bonus', '1', '分享好礼', '3', '2019-03-28 17:13:39', '2019-03-29 10:15:51', '得15元现金红包');

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
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `lastModifyTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES (1, '圣罗兰', 'YSL', '2', '法国', '1', '2019-03-05 14:21:52', NULL);
INSERT INTO `brand` VALUES (2, '阿玛尼', 'Giorgio Armani', '2', '法国', '1', '2019-03-05 14:21:52', NULL);
INSERT INTO `brand` VALUES (3, 'NYX', 'NYX', '1', '美国', '1', '2019-03-05 14:21:52', NULL);
INSERT INTO `brand` VALUES (4, '井田', 'canmake', '0', '日本', '1', '2019-03-05 14:21:52', NULL);
INSERT INTO `brand` VALUES (5, '魅可', 'mac', '1', '美国', '1', '2019-03-05 14:21:52', NULL);
INSERT INTO `brand` VALUES (6, '汤姆福特', 'TF', '2', '法国', '1', '2019-03-11 17:07:31', '2019-03-11 17:07:44');
INSERT INTO `brand` VALUES (7, '雅诗兰黛', 'Estee Lauder', '2', '法国', '1', '2019-03-11 17:10:47', '2019-03-11 17:10:49');
INSERT INTO `brand` VALUES (8, '蒂佳婷', 'Dr.Jart+', '1', '韩国', '1', '2019-03-12 12:44:15', '2019-03-12 12:44:18');
INSERT INTO `brand` VALUES (9, '安耐晒', 'ANESSA', '2', '日本', '1', '2019-03-12 12:59:34', '2019-03-12 12:59:42');
INSERT INTO `brand` VALUES (10, '肌司妍', 'JM solution', '1', '韩国', '0', '2019-03-18 16:33:58', NULL);

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
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES (1, '满1000减30', 1000, 30, '1', '2019-03-31 16:00:00', '2019-04-30 16:00:00', '0');
INSERT INTO `coupon` VALUES (2, '满100减20', 100, 20, '1', '2019-03-31 16:00:00', '2019-04-30 16:00:00', '0');
INSERT INTO `coupon` VALUES (3, '满200减15', 200, 15, '1', '2019-03-31 16:00:00', '2019-04-30 16:00:00', '0');

-- ----------------------------
-- Table structure for eshopconfig
-- ----------------------------
DROP TABLE IF EXISTS `eshopconfig`;
CREATE TABLE `eshopconfig`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eshopconfig
-- ----------------------------
INSERT INTO `eshopconfig` VALUES (1, 'xxcUrl', 'http://localhost:8080/backend/resources/eshop/image/xxc.jpg');
INSERT INTO `eshopconfig` VALUES (2, 'noticeMsg', '欢迎在线咨询徐小柴~');
INSERT INTO `eshopconfig` VALUES (3, 'productImgBase', 'http://pnwhn87vf.bkt.clouddn.com/product/');
INSERT INTO `eshopconfig` VALUES (4, 'categoryImgBase', 'http://pnwhn87vf.bkt.clouddn.com/category/');
INSERT INTO `eshopconfig` VALUES (5, 'bannerImgBase', 'http://pnwhn87vf.bkt.clouddn.com/banner/');
INSERT INTO `eshopconfig` VALUES (6, 'preSearch', 'ahc/ysl');
INSERT INTO `eshopconfig` VALUES (7, 'countryFlagImgBase', 'http://pnwhn87vf.bkt.clouddn.com/country/');
INSERT INTO `eshopconfig` VALUES (8, 'articlePreSearch', '阿玛尼403/药丸面膜/天气丹套装/第一');
INSERT INTO `eshopconfig` VALUES (9, 'bonus', '15');
INSERT INTO `eshopconfig` VALUES (10, 'shareTitle', '快来看一看');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eshoporder
-- ----------------------------
INSERT INTO `eshoporder` VALUES (4, 'ew', '2019-03-11 00:00:00', '0', '201903111105062979734', 'we', 348, 1, 'qe', 'ee', '', NULL, NULL, '2019-03-11 15:35:48', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (5, 'ew', '2019-03-11 00:00:00', '0', '201903111107147199074', 'ew', 348, 1, 'e', 'e', '', NULL, NULL, '2019-03-11 15:35:48', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (6, 'gg', '2019-03-11 00:00:00', '0', '201903111109167016132', 'gg', 348, 1, 'gg', 'gg', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, NULL, '2019-03-11 15:35:48', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (7, 'tre', '2019-03-11 00:00:00', '0', '201903111115107671399', 're', 1054, 3, 'er', '34', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, NULL, '2019-03-11 15:35:48', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (8, '5', '2019-03-11 11:18:01', '0', '201903111118019758198', '4', 348, 1, '34', '2', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '4', '2019-03-11 15:35:48', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (9, 'we', '2019-03-11 11:24:23', '0', '201903111124236765930', 'we', 348, 1, 'we', 'we', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'we', '2019-03-11 15:35:48', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (10, 'ds', '2019-03-11 03:29:31', '3', '201903111129304477200', 'sad', 348, 1, 'sd', 'ds', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'sad', '2019-03-11 15:35:48', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (11, 'ds', '2019-03-11 03:30:08', '3', '201903111130077986515', 'sad', 348, 1, 'sd', 'ds', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', '23412321312', 'test', '2019-03-11 16:26:54', '顺丰', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (12, 'ds', '2019-03-11 05:04:58', '1', '201903111304584002459', 'sd', 706, 2, 'asd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'ddddd', '2019-03-11 15:41:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (13, '34', '2019-03-11 09:35:57', '0', '201903111735566646844', '23', 571, 3, '32', '213', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '213', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (14, 'wewe', '2019-03-11 09:44:39', '0', '201903111744388104120', 'we', 288, 1, 'ew', 'ew', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'ew', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (15, 'sa', '2019-03-11 09:45:47', '0', '201903111745478540790', 'sd', 138, 1, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'd', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (16, 'e2', '2019-03-11 09:51:27', '0', '201903111751262277431', '32', 288, 1, '23', '32', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (17, 'dd', '2019-03-12 05:19:40', '0', '20190312131940007756', '???j', 288, 1, '???', '??????', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '??????', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (18, 'd', '2019-03-13 02:37:04', '0', '20190313103704901593', 'd', 225, 1, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'd', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (19, 'd', '2019-03-13 08:32:42', '0', '201903131632425925850', 'è?????', 225, 1, '?¤§è?¨è??', '????¤??°?', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '????¤§??°??°', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (20, 'd', '2019-03-13 08:43:26', '0', '201903131643260583761', 'è?????', 225, 1, '?¤§è?¨è??', '????¤??°?', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '????¤§??°??°', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (21, 'd', '2019-03-13 08:44:05', '0', '201903131644057331577', '说的', 225, 1, '大萨达', '是多少', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '撒大声地', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (22, 'd', '2019-03-13 08:44:58', '0', '201903131644588800861', 'sad', 288, 1, 'è?????', '?¤§è?¨è??', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '??????', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (23, '??????', '2019-03-13 08:46:10', '0', '201903131646091152163', '?¤§', 288, 1, '?????????', '??????????¤?', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'sad', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (24, '手打', '2019-03-13 08:47:22', '0', '201903131647217012071', 'sad', 288, 1, 'sad', 'sad', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, 'sad', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eshoporder` VALUES (25, 'ddsd', '2019-03-28 05:26:07', '0', '201903281326079119032', 'd', 348, 1, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `eshoporder` VALUES (26, 'd', '2019-03-28 05:28:02', '1', '201903281328019856388', 'd', 348, 1, 'd', 'd', 'aaa', NULL, '', '2019-03-28 17:11:19', NULL, 'share', 'test', '', NULL, NULL);
INSERT INTO `eshoporder` VALUES (27, 'd', '2019-03-29 06:09:27', '0', '20190329140926372161', 'd', 696, 2, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `eshoporder` VALUES (28, 'd', '2019-03-29 06:09:58', '0', '20190329140957118298', 'd', 696, 2, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `eshoporder` VALUES (29, 'e', '2019-03-29 06:13:10', '0', '20190329141309190118', 'e', 696, 2, 'e', 'e', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `eshoporder` VALUES (30, 'd', '2019-03-29 06:14:13', '0', '20190329141412442005', 'd', 696, 2, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `eshoporder` VALUES (31, 'd', '2019-03-29 06:15:00', '0', '20190329141459554122', 'd', 696, 2, 'dq', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `eshoporder` VALUES (32, 'd', '2019-03-29 06:17:11', '0', '20190329141711379606', 'd', 696, 2, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', NULL, NULL);
INSERT INTO `eshoporder` VALUES (33, 'd', '2019-03-29 06:21:47', '0', '20190329142147684147', 'd', 696, 2, 'd', 'd', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', NULL, NULL, '', '', '', '14;', NULL);
INSERT INTO `eshoporder` VALUES (34, 'dasds', '2019-04-01 15:16:34', '1', '201904012316345224246', '18217683505', 328, 1, 'xuwuji', 'sad', 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '', '2019-04-02 15:58:26', NULL, '', '', '', '', '2');

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `format` VALUES (9, '90ml', 288, '22', '1', NULL);
INSERT INTO `format` VALUES (10, '250ml', 1050, '23', '1', NULL);
INSERT INTO `format` VALUES (11, '十片/盒', 68, '24', '1', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for parentcategory
-- ----------------------------
DROP TABLE IF EXISTS `parentcategory`;
CREATE TABLE `parentcategory`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '状态，下架0，上架1',
  `lastModifyTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of parentcategory
-- ----------------------------
INSERT INTO `parentcategory` VALUES (1, 'd', '0', NULL, '2019-03-05 14:21:28');
INSERT INTO `parentcategory` VALUES (2, 'd', '0', NULL, '2019-03-05 14:21:28');
INSERT INTO `parentcategory` VALUES (3, 'd', '0', NULL, '2019-03-05 14:21:28');
INSERT INTO `parentcategory` VALUES (4, 'dsad', '0', NULL, '2019-03-05 14:21:28');
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
  `flashPrice` double(10, 2) NULL DEFAULT NULL COMMENT '抢购价',
  `inventory` int(255) NULL DEFAULT NULL,
  `salesCount` int(255) NULL DEFAULT NULL,
  `mainImgUrl` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `categoryId` varchar(11) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `parentCategoryId` varchar(11) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `brandId` int(11) NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0',
  `bannerItemId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `lastModifyTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `imgUrl1` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `imgUrl2` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `imgUrl3` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `imgUrl4` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `colorId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `flashState` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, 'product/1-0.jpg', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', '2019-03-07 16:06:46', 'product/1-1.jpg', 'product/1-2.jpg', 'product/1-3.jpg', 'product/1-4.jpg', NULL, NULL);
INSERT INTO `product` VALUES (2, 'YSL口红', '方管圆管', NULL, NULL, 10, 10, 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (3, 'YSL口红', '方管圆管', NULL, NULL, 10, 10, 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (4, 'YSL口红', '方管圆管', NULL, NULL, 10, 10, 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', '2019-03-24 01:03:36', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `product` VALUES (5, 'a', 'd', NULL, NULL, 31, 213, 'sdsad', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', '2019-03-24 01:03:39', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `product` VALUES (6, 'xcz', 'wewq', NULL, NULL, 213, 21, 'sdaas', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (7, 'asd', 'sadsa', NULL, NULL, 321, 12, 'sad', '4', NULL, NULL, '0', NULL, '2019-03-05 14:17:56', '2019-03-24 01:03:40', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `product` VALUES (8, 'MAC唇膏', 'MAC唇膏', 138.00, NULL, 100, 32, NULL, '2', '5', 5, '1', '2', '2019-03-05 14:17:56', '2019-03-11 17:18:48', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (9, 'Dior魅惑唇膏', 'Dior魅惑唇膏', 288.00, NULL, 11, 13, NULL, '2', '5', 1, '1', '2', '2019-03-05 14:17:56', '2019-03-24 13:23:06', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `product` VALUES (10, '阿玛尼漆亮水漾唇釉', '阿玛尼漆亮水漾唇釉', 258.00, NULL, 100, 13, 'http://i1.bvimg.com/677237/28b8fff357968901.jpg', '2', '5', 2, '1', '2', '2019-03-05 14:17:56', '2019-03-11 17:18:48', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (11, 'NYX 16色眼影盘', 'NYX 16色眼影盘', 175.00, NULL, 100, 19, 'http://i1.bvimg.com/677237/a7a31b8795c57402.jpg', '3', '5', 3, '1', '0', '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (12, 'MAC 魅可 时尚焦点小眼影', 'MAC 魅可 时尚焦点小眼影', 148.00, NULL, 100, 19, 'http://i1.bvimg.com/677237/1aa814981de97c7a.jpg', '3', '5', 5, '1', '0', '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (13, 'Canmake 井田 完美高效眼影', 'Canmake 井田 完美高效眼影', 68.00, NULL, 100, 19, 'http://i1.bvimg.com/677237/2f7ba8ebed6bceaf.jpg', '3', '5', 4, '1', '0', '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (15, 'Tom Ford汤姆福特 lip color 黑金唇膏', 'Tom Ford汤姆福特 lip color 黑金唇膏', 348.00, NULL, 100, 23, NULL, '2', '5', 6, '1', '2', '2019-03-07 16:06:46', '2019-03-11 17:19:04', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (21, '蒂佳婷 Dr.Jart+ 蓝色药丸面膜 专业瞬间锁水', '适合易缺水干燥肌肤。面膜蕴含水润精华，面膜纸以超细纤维制成，更贴合面部，将精华完整传送到肌底。', 68.00, NULL, 58, 42, 'http://localhost:8080/backend/resources/eshop/image/product/21-0.jpg', '4', '6', 8, '1', '0', '2019-03-12 12:46:57', '2019-03-19 10:44:12', 'http://localhost:8080/backend/resources/eshop/image/product/21-1.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/21-2.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/21-3.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/21-4.jpg', NULL, NULL);
INSERT INTO `product` VALUES (22, 'Shiseido 资生堂 Anessa 安耐晒 超防水美肌UV乳液 SPF50', '具有防水、防汗、防皮脂的特性，不论进行海边、游泳池或户外休闲活动等，等能安心阻挡强烈日晒', 288.00, 188.00, 40, 31, 'http://localhost:8080/backend/resources/eshop/image/product/22-0.jpg', '7', '7', 9, '1', '0', '2019-03-12 13:02:40', '2019-03-24 01:12:38', 'http://localhost:8080/backend/resources/eshop/image/product/22-1.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/22-2.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/22-3.jpg', 'http://localhost:8080/backend/resources/eshop/image/product/22-4.jpg', NULL, '1');
INSERT INTO `product` VALUES (23, 'SKII 神仙水', 'SKII 神仙水', 1050.00, NULL, 100, 10, 'http://pnwhn87vf.bkt.clouddn.com/product/23-0.jpg', '10', '6', 7, '1', '0', '2019-03-19 09:46:09', '2019-03-24 01:03:17', 'http://pnwhn87vf.bkt.clouddn.com/product/23-1.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/23-2.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/23-3.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/23-4.jpg', NULL, '1');
INSERT INTO `product` VALUES (24, 'JM蜂蜜面膜', 'JM蜂蜜面膜', 68.00, NULL, 10, 10, 'http://pnwhn87vf.bkt.clouddn.com/product/24-0.jpg', '4', '6', 10, '1', '0', '2019-03-19 10:43:00', '2019-03-24 01:03:19', 'http://pnwhn87vf.bkt.clouddn.com/product/24-1.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/24-2.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/24-3.jpg', 'http://pnwhn87vf.bkt.clouddn.com/product/24-4.jpg', NULL, '1');

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
  `amount` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '满减-满多少可以减；赠礼-满多少可以送',
  `total` double NULL DEFAULT NULL COMMENT '赠礼-满几件送',
  `reduction` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '满减-减多少',
  `gift` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `brandId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `categoryId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion
-- ----------------------------
INSERT INTO `promotion` VALUES (12, '雅诗兰黛全场每满300减30', 'brand', 'money', 'amount', '300.0', 0, '30.0', '', '7', '', '1');
INSERT INTO `promotion` VALUES (13, '面膜全场任意品牌五盒送一盒', 'category', 'gift', 'total', '0.0', 5, '0.0', '面膜', '', '4', '1');
INSERT INTO `promotion` VALUES (14, '口红全场任意品牌满500减50', 'category', 'money', 'amount', '500.0', 0, '50.0', '面膜', '', '2', '1');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'oAEfX5U6TQ-VgmIiN9OYdm6Homj8', NULL, '1', 15, NULL, 328, NULL, NULL);
INSERT INTO `user` VALUES (2, 'test', NULL, '1', 8, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (3, 'aaa', NULL, '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (4, 'test', 'test', '1', 0, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
