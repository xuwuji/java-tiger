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

 Date: 03/11/2019 00:38:40 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

-- ----------------------------
--  Records of `format`
-- ----------------------------
BEGIN;
INSERT INTO `format` VALUES ('1', '01 cilli', '138', '8', '1'), ('2', 'ruby woo', '145', '8', '1'), ('3', '#80', '348', '15', '1'), ('4', '#15 Wild Ginger', '358', '15', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
