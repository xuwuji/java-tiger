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

 Date: 07/03/2019 16:42:37
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
  `state` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0',
  `bannerItemId` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifyTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `imgUrl1` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `imgUrl2` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `imgUrl3` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `imgUrl4` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, NULL, NULL, NULL, NULL, NULL, 'product/1-0.jpg', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', '2019-03-07 16:06:46', 'product/1-1.jpg', 'product/1-2.jpg', 'product/1-3.jpg', 'product/1-4.jpg');
INSERT INTO `product` VALUES (2, 'YSL口红', '方管圆管', NULL, 10, 10, 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (3, 'YSL口红', '方管圆管', NULL, 10, 10, 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (4, 'YSL口红', '方管圆管', NULL, 10, 10, 'http://i2.bvimg.com/677237/3495e004b28872ec.jpg', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (5, 'a', 'd', NULL, 31, 213, 'sdsad', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (6, 'xcz', 'wewq', NULL, 213, 21, 'sdaas', NULL, NULL, NULL, '0', NULL, '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (7, 'asd', 'sadsa', NULL, 321, 12, 'sad', '4', NULL, NULL, '0', NULL, '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (8, 'MAC唇膏', 'sad', 128.00, 213, 213, 'http://i1.bvimg.com/677237/76a40f678bf45833.jpg', '2', '5', 5, '1', '2', '2019-03-05 14:17:56', '2019-03-07 16:01:07', NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (9, 'Dior魅惑唇膏', 'Dior魅惑唇膏', 288.00, 11, 3213, 'http://i1.bvimg.com/677237/c4ad34576a83860f.jpg', '2', '5', 1, '1', '2', '2019-03-05 14:17:56', '2019-03-05 16:02:33', NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (10, '阿玛尼漆亮水漾唇釉', '阿玛尼漆亮水漾唇釉', 258.00, 100, 13, 'http://i1.bvimg.com/677237/28b8fff357968901.jpg', '2', '5', 2, '1', '2', '2019-03-05 14:17:56', '2019-03-07 16:01:16', NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (11, 'NYX 16色眼影盘', 'NYX 16色眼影盘', 175.00, 100, 19, 'http://i1.bvimg.com/677237/a7a31b8795c57402.jpg', '3', '5', 3, '1', '0', '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (12, 'MAC 魅可 时尚焦点小眼影', 'MAC 魅可 时尚焦点小眼影', 148.00, 100, 19, 'http://i1.bvimg.com/677237/1aa814981de97c7a.jpg', '3', '5', 5, '1', '0', '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (13, 'Canmake 井田 完美高效眼影', 'Canmake 井田 完美高效眼影', 68.00, 100, 19, 'http://i1.bvimg.com/677237/2f7ba8ebed6bceaf.jpg', '3', '5', 4, '1', '0', '2019-03-05 14:17:56', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (15, 'Tom Ford汤姆福特 lip color 黑金唇膏', 'Tom Ford汤姆福特 lip color 黑金唇膏', 123.00, 100, 23, NULL, '2', '5', NULL, '1', '2', '2019-03-07 16:06:46', '2019-03-07 16:06:59', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
