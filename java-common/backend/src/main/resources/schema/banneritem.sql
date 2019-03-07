/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : eshop

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 07/03/2019 16:42:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banneritem
-- ----------------------------
INSERT INTO `banneritem` VALUES (1, 'http://i1.bvimg.com/677237/c6d69abb25ff023f.jpg', 'dasad', '1', '三八妇女节', '0', '2019-03-05 14:22:01', NULL);
INSERT INTO `banneritem` VALUES (2, 'http://i2.bvimg.com/677237/70961c7589fd8413.png', 'aaa', '1', '小红书推荐', '1', '2019-03-05 14:22:01', NULL);
INSERT INTO `banneritem` VALUES (3, 'http://i2.bvimg.com/677237/96c1e06e5a9648ad.png', 'ddd', '1', '女王节', '1', '2019-03-05 14:22:01', NULL);
INSERT INTO `banneritem` VALUES (4, 'http://i2.bvimg.com/677237/bf408bce5768689b.png', 'ddd', '1', '护发', '1', '2019-03-05 14:22:01', NULL);
INSERT INTO `banneritem` VALUES (5, 'http://i2.bvimg.com/677237/e014088815434b3e.png', 'ddd', '1', '清洁', '1', '2019-03-05 14:22:01', NULL);
INSERT INTO `banneritem` VALUES (6, 'bannerItem/6.jpg', 'sdds', '0', '口红推荐', '1', '2019-03-07 16:39:08', '2019-03-07 16:39:08');

SET FOREIGN_KEY_CHECKS = 1;
