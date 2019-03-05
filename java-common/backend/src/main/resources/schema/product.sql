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

 Date: 05/03/2019 17:50:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `inventory` int(255) NULL DEFAULT NULL,
  `salesCount` int(255) NULL DEFAULT NULL,
  `mainImgUrl` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `categoryId` varchar(11) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `parentCategoryId` varchar(11) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `brandId` int(11) NULL DEFAULT NULL,
  `brandNameCN` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `brandNameEN` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0',
  `bannerItemId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifyTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', NULL);
INSERT INTO `product` VALUES (2, 'YSL口红', '方管圆管', NULL, 10, 10, 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', NULL, NULL, NULL, '圣罗兰', NULL, '0', NULL, '2019-03-05 14:17:56', NULL);
INSERT INTO `product` VALUES (3, 'YSL口红', '方管圆管', NULL, 10, 10, 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', NULL, NULL, NULL, '圣罗兰', NULL, '0', NULL, '2019-03-05 14:17:56', NULL);
INSERT INTO `product` VALUES (4, 'YSL口红', '方管圆管', NULL, 10, 10, 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', NULL, NULL, NULL, '圣罗兰', NULL, '0', NULL, '2019-03-05 14:17:56', NULL);
INSERT INTO `product` VALUES (5, 'a', 'd', NULL, 31, 213, 'sdsad', NULL, NULL, NULL, 'wqe', 'dasd', '0', NULL, '2019-03-05 14:17:56', NULL);
INSERT INTO `product` VALUES (6, 'xcz', 'wewq', NULL, 213, 21, 'sdaas', NULL, NULL, NULL, 'dsad', '32', '0', NULL, '2019-03-05 14:17:56', NULL);
INSERT INTO `product` VALUES (7, 'asd', 'sadsa', NULL, 321, 12, 'sad', '4', NULL, NULL, 'sad', 'sad', '0', NULL, '2019-03-05 14:17:56', NULL);
INSERT INTO `product` VALUES (8, 'MAC唇膏', 'sad', 128.00, 213, 213, 'http://i1.bvimg.com/677237/76a40f678bf45833.jpg', '2', '5', 5, '魅可', 'mac', '1', '2', '2019-03-05 14:17:56', '2019-03-05 16:02:28');
INSERT INTO `product` VALUES (9, 'Dior魅惑唇膏', 'Dior魅惑唇膏', 288.00, 11, 3213, 'http://i1.bvimg.com/677237/c4ad34576a83860f.jpg', '2', '5', 1, '迪奥', 'dior', '1', '2', '2019-03-05 14:17:56', '2019-03-05 16:02:33');
INSERT INTO `product` VALUES (10, '阿玛尼漆亮水漾唇釉', '阿玛尼漆亮水漾唇釉', 258.00, 100, 13, 'http://i1.bvimg.com/677237/28b8fff357968901.jpg', '2', '5', NULL, '阿玛尼', 'Armani', '1', '2', '2019-03-05 14:17:56', '2019-03-05 16:03:09');
INSERT INTO `product` VALUES (11, 'NYX 16色眼影盘', 'NYX 16色眼影盘', 175.00, 100, 19, 'http://i1.bvimg.com/677237/a7a31b8795c57402.jpg', '3', '5', 3, 'NYX', 'NYX', '1', '0', '2019-03-05 14:17:56', NULL);
INSERT INTO `product` VALUES (12, 'MAC 魅可 时尚焦点小眼影', 'MAC 魅可 时尚焦点小眼影', 148.00, 100, 19, 'http://i1.bvimg.com/677237/1aa814981de97c7a.jpg', '3', '5', 5, '魅可 ', 'MAC', '1', '0', '2019-03-05 14:17:56', NULL);
INSERT INTO `product` VALUES (13, 'Canmake 井田 完美高效眼影', 'Canmake 井田 完美高效眼影', 68.00, 100, 19, 'http://i1.bvimg.com/677237/2f7ba8ebed6bceaf.jpg', '3', '5', 4, '井田 ', 'Canmake', '1', '0', '2019-03-05 14:17:56', NULL);

SET FOREIGN_KEY_CHECKS = 1;
