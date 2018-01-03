/*
Navicat MySQL Data Transfer

Source Server         : First
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : studyactive

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2018-01-02 19:44:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `web_class`
-- ----------------------------
DROP TABLE IF EXISTS `web_class`;
CREATE TABLE `web_class` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `class_image` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `teacher_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `web_class_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `web_user` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_class
-- ----------------------------
INSERT INTO `web_class` VALUES ('1', '蒙元帝国史', 'k3', '1', '111');
INSERT INTO `web_class` VALUES ('2', '中国古代史', 'k2', '0', '111');
INSERT INTO `web_class` VALUES ('3', '中国近代史', 'k4', '0', '111');
INSERT INTO `web_class` VALUES ('4', '大学生职业规划', 'k1', '0', '111');

-- ----------------------------
-- Table structure for `web_classinfo`
-- ----------------------------
DROP TABLE IF EXISTS `web_classinfo`;
CREATE TABLE `web_classinfo` (
  `ciid` int(11) NOT NULL AUTO_INCREMENT,
  `classInfo_title` varchar(255) DEFAULT NULL,
  `classid` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`ciid`),
  KEY `classid` (`classid`),
  CONSTRAINT `web_classinfo_ibfk_1` FOREIGN KEY (`classid`) REFERENCES `web_class` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_classinfo
-- ----------------------------
INSERT INTO `web_classinfo` VALUES ('1', '概述', '1', '0');
INSERT INTO `web_classinfo` VALUES ('2', '前言', '1', '0');
INSERT INTO `web_classinfo` VALUES ('3', '小结', '1', '0');
INSERT INTO `web_classinfo` VALUES ('4', '总结', '1', '0');
INSERT INTO `web_classinfo` VALUES ('5', '前言', '2', '0');
INSERT INTO `web_classinfo` VALUES ('6', '前言', '3', '0');
INSERT INTO `web_classinfo` VALUES ('7', '前言', '4', '0');

-- ----------------------------
-- Table structure for `web_discuss`
-- ----------------------------
DROP TABLE IF EXISTS `web_discuss`;
CREATE TABLE `web_discuss` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `discuss_title` varchar(255) DEFAULT NULL,
  `publish_id` bigint(20) DEFAULT NULL,
  `publish_daate` datetime DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `web_discuss_ibfk_1` (`publish_id`),
  CONSTRAINT `web_discuss_ibfk_1` FOREIGN KEY (`publish_id`) REFERENCES `web_user` (`account`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_discuss
-- ----------------------------
INSERT INTO `web_discuss` VALUES ('1', '2018新年快乐，愿大家大吉大利', '111', '2017-12-31 15:31:49');
INSERT INTO `web_discuss` VALUES ('5', '2222222222222222', '123', '2017-12-31 18:15:57');
INSERT INTO `web_discuss` VALUES ('6', '我的未来不是梦', '123', '2017-12-31 19:11:00');
INSERT INTO `web_discuss` VALUES ('7', 'hello', '123', '2017-12-31 21:29:49');

-- ----------------------------
-- Table structure for `web_file`
-- ----------------------------
DROP TABLE IF EXISTS `web_file`;
CREATE TABLE `web_file` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_file
-- ----------------------------

-- ----------------------------
-- Table structure for `web_group`
-- ----------------------------
DROP TABLE IF EXISTS `web_group`;
CREATE TABLE `web_group` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `web_group_ibfk_1` (`student_id`),
  CONSTRAINT `web_group_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `web_user` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_group
-- ----------------------------
INSERT INTO `web_group` VALUES ('1', '扬帆起航', '123');
INSERT INTO `web_group` VALUES ('2', '扬帆起航', '234');
INSERT INTO `web_group` VALUES ('3', '扬帆起航', '345');

-- ----------------------------
-- Table structure for `web_notice`
-- ----------------------------
DROP TABLE IF EXISTS `web_notice`;
CREATE TABLE `web_notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `notice_desc` varchar(30) DEFAULT NULL,
  `notice_content` varchar(255) DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_notice
-- ----------------------------
INSERT INTO `web_notice` VALUES ('1', '通知测试1', '测试数据1', '2017-12-29 16:51:34', '1');
INSERT INTO `web_notice` VALUES ('2', '通知测试2', '测试数据2', '2017-12-29 20:12:06', '1');
INSERT INTO `web_notice` VALUES ('3', '通知测试3', '测试数据3', '2017-12-30 17:22:53', '1');
INSERT INTO `web_notice` VALUES ('4', '通知测试4', '测试数据4', '2017-12-29 17:23:12', '1');
INSERT INTO `web_notice` VALUES ('6', '测试数据6', '测试数据6', '2017-12-30 23:03:31', '1');

-- ----------------------------
-- Table structure for `web_reply`
-- ----------------------------
DROP TABLE IF EXISTS `web_reply`;
CREATE TABLE `web_reply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `reply_content` varchar(255) DEFAULT NULL,
  `reply_id` bigint(20) DEFAULT NULL,
  `reply_date` datetime DEFAULT NULL,
  `discuss_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `discuss_id` (`discuss_id`),
  KEY `reply_id` (`reply_id`),
  CONSTRAINT `web_reply_ibfk_1` FOREIGN KEY (`discuss_id`) REFERENCES `web_discuss` (`did`),
  CONSTRAINT `web_reply_ibfk_2` FOREIGN KEY (`reply_id`) REFERENCES `web_user` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_reply
-- ----------------------------
INSERT INTO `web_reply` VALUES ('1', '还有一天', '123', '2017-12-31 15:32:15', '1');
INSERT INTO `web_reply` VALUES ('2', '不到24小时了', '234', '2017-12-31 17:49:11', '1');
INSERT INTO `web_reply` VALUES ('3', '11', '123', '2017-12-31 18:40:50', '5');
INSERT INTO `web_reply` VALUES ('6', '加油！新的一年', '123', '2017-12-31 21:27:11', '1');

-- ----------------------------
-- Table structure for `web_sign`
-- ----------------------------
DROP TABLE IF EXISTS `web_sign`;
CREATE TABLE `web_sign` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `host_ip` varchar(255) DEFAULT NULL,
  `sign_date` date DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `student_id` (`student_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `web_sign_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `web_user` (`account`),
  CONSTRAINT `web_sign_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `web_class` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_sign
-- ----------------------------
INSERT INTO `web_sign` VALUES ('1', '1', '123', 'DESKTOP-AG54K9J/172.18.91.231', '2017-12-30');

-- ----------------------------
-- Table structure for `web_student_subject`
-- ----------------------------
DROP TABLE IF EXISTS `web_student_subject`;
CREATE TABLE `web_student_subject` (
  `scid` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` bigint(20) DEFAULT NULL,
  `classid` int(20) DEFAULT NULL,
  PRIMARY KEY (`scid`),
  KEY `studentid` (`studentid`),
  KEY `classid` (`classid`),
  CONSTRAINT `web_student_subject_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `web_user` (`account`),
  CONSTRAINT `web_student_subject_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `web_class` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_student_subject
-- ----------------------------
INSERT INTO `web_student_subject` VALUES ('1', '123', '1');
INSERT INTO `web_student_subject` VALUES ('2', '123', '2');
INSERT INTO `web_student_subject` VALUES ('3', '123', '3');
INSERT INTO `web_student_subject` VALUES ('4', '123', '4');

-- ----------------------------
-- Table structure for `web_user`
-- ----------------------------
DROP TABLE IF EXISTS `web_user`;
CREATE TABLE `web_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `account` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` int(2) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `regDate` date DEFAULT NULL,
  `role` int(2) DEFAULT NULL,
  PRIMARY KEY (`uid`,`account`),
  KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_user
-- ----------------------------
INSERT INTO `web_user` VALUES ('1', '123', '123', '等雨停停', '2', '等雨停停@ddk.com', '2017-12-28', '1');
INSERT INTO `web_user` VALUES ('2', '234', '234', 'Steve', '1', 'Steve@163.com', '2017-12-30', '1');
INSERT INTO `web_user` VALUES ('3', '345', '345', 'Paula', '2', 'paula@126.com', '2017-12-30', '1');
INSERT INTO `web_user` VALUES ('5', '111', '111', '段', '1', '段@ddk.com', '2017-12-30', '2');
