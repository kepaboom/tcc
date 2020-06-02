/*
Navicat MySQL Data Transfer

Source Server         : connection
Source Server Version : 50718
Source Host           : 127.0.0.1:3306
Source Database       : tcc

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-12-01 17:44:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `userPw` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('2', '123', '123');
INSERT INTO `admin` VALUES ('3', 'haha', '123');

-- ----------------------------
-- Table structure for cfei
-- ----------------------------
DROP TABLE IF EXISTS `cfei`;
CREATE TABLE `cfei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hao` varchar(255) DEFAULT NULL,
  `jdate` varchar(255) DEFAULT NULL,
  `ldate` varchar(255) DEFAULT NULL,
  `jine` varchar(255) DEFAULT NULL,
  `adate` varchar(255) DEFAULT NULL,
  `shijian` varchar(255) DEFAULT NULL,
  `biao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfei
-- ----------------------------
INSERT INTO `cfei` VALUES ('2', '京AE123H', '2016-03-10 11:56:20', '2016-03-10 20:13:24', '24', '2016-03-10 20:13:25', '8', '3');

-- ----------------------------
-- Table structure for che
-- ----------------------------
DROP TABLE IF EXISTS `che`;
CREATE TABLE `che` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hao` varchar(255) DEFAULT NULL,
  `leixing` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of che
-- ----------------------------
INSERT INTO `che` VALUES ('1', '京AE123H', '大众宝来', '/upload/1426251805448.jpg', '33', '1');
INSERT INTO `che` VALUES ('3', '888888', '奔驰', '/upload/1511436450546.jpg', '2017年奔驰新款', '2');

-- ----------------------------
-- Table structure for chewei
-- ----------------------------
DROP TABLE IF EXISTS `chewei`;
CREATE TABLE `chewei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hao` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `qu` varchar(255) DEFAULT NULL,
  `chepai` varchar(255) DEFAULT NULL,
  `adate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chewei
-- ----------------------------
INSERT INTO `chewei` VALUES ('2', 'A01', '出租车位', 'A区', '京AE123H', '2016-03-13 21:03:37');
INSERT INTO `chewei` VALUES ('3', 'A02', '出租车位', 'A区', '京AE123H', '2016-03-13 21:03:37');
INSERT INTO `chewei` VALUES ('4', 'A03', '出租车位', 'D区', '京AE123H', '2016-03-13 21:03:37');
INSERT INTO `chewei` VALUES ('5', 'B01', '出租车位', 'B区', '京AE123H', '2016-03-13 21:03:37');
INSERT INTO `chewei` VALUES ('6', 'B02', '出租车位', 'B区', '京AE123H', '2016-03-13 21:03:37');
INSERT INTO `chewei` VALUES ('7', 'C01', '业主车位', 'C区', '京AE123H', '2016-03-13 21:03:37');
INSERT INTO `chewei` VALUES ('8', 'C02', '业主车位', 'C区', '京AE123H', '2016-03-13 21:03:37');

-- ----------------------------
-- Table structure for fei
-- ----------------------------
DROP TABLE IF EXISTS `fei`;
CREATE TABLE `fei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fei
-- ----------------------------
INSERT INTO `fei` VALUES ('1', '3');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `jine` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('2', 'root', 'root', '18', '18390994312', '100');
INSERT INTO `userinfo` VALUES ('3', '凯耐', '666', '18', '18390994312', '800');
