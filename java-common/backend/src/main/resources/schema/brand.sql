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

 Date: 05/03/2019 17:49:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES (1, '圣罗兰', 'YSL', '2', '法国', '1', '2019-03-05 14:21:52', NULL);
INSERT INTO `brand` VALUES (2, '阿玛尼', 'Giorgio Armani', '2', '法国', '1', '2019-03-05 14:21:52', NULL);
INSERT INTO `brand` VALUES (3, 'NYX', 'NYX', '1', '美国', '1', '2019-03-05 14:21:52', NULL);
INSERT INTO `brand` VALUES (4, '井田', 'canmake', '0', '日本', '1', '2019-03-05 14:21:52', NULL);
INSERT INTO `brand` VALUES (5, '魅可', 'mac', '1', '美国', '1', '2019-03-05 14:21:52', NULL);

SET FOREIGN_KEY_CHECKS = 1;
