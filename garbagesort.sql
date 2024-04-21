/*
 Navicat Premium Data Transfer

 Source Server         : 垃圾回收
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : 47.120.77.171:3306
 Source Schema         : garbagesort

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 21/04/2024 10:47:10
*/

create database garbagesort default character set utf8mb4 collate utf8mb4_unicode_ci;
use garbagesort;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for challenge_detail
-- ----------------------------
DROP TABLE IF EXISTS `challenge_detail`;
CREATE TABLE `challenge_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `whether` tinyint NULL DEFAULT 0 COMMENT '是否正确；1:正确；0:错误',
  `question_id` int NULL DEFAULT NULL COMMENT '问题id\n',
  `garbage_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `garbage_type` tinyint NULL DEFAULT NULL,
  `selected_type` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `challenge_detail_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2651 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '挑战明细记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of challenge_detail
-- ----------------------------

-- ----------------------------
-- Table structure for challenge_result
-- ----------------------------
DROP TABLE IF EXISTS `challenge_result`;
CREATE TABLE `challenge_result`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `score` int NULL DEFAULT NULL COMMENT '得分',
  `result` json NULL COMMENT '结果集',
  `times` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '时间',
  `user_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `challenge_result_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 267 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '挑战结果+详情记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of challenge_result
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'challenge_detail', '挑战明细记录', '', NULL, 'ChallengeDetail', 'crud', 'com.ruoyi.project.garbagesort', 'garbagesort', 'challengeDetail', '挑战明细记录', 'luoxiang', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"垃圾分类\",\"treeCode\":\"\"}', 'admin', '2021-06-08 10:11:04', '', '2021-06-08 10:34:41', '');
INSERT INTO `gen_table` VALUES (2, 'challenge_result', '挑战结果+详情记录表', '', NULL, 'ChallengeResult', 'crud', 'com.ruoyi.project.garbagesort', 'garbagesort', 'challengeResult', '挑战结果+详情记录', 'luoxiang', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"垃圾分类\",\"treeCode\":\"\"}', 'admin', '2021-06-08 10:11:04', '', '2021-06-08 10:34:55', '');
INSERT INTO `gen_table` VALUES (3, 'image_classify', '图像识别记录', '', NULL, 'ImageClassify', 'crud', 'com.ruoyi.project.garbagesort', 'garbagesort', 'imageClassify', '图像识别记录', 'luoxiang', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"垃圾分类\",\"treeCode\":\"\"}', 'admin', '2021-06-08 10:11:04', '', '2021-06-08 10:35:06', '');
INSERT INTO `gen_table` VALUES (4, 'keyword_result', '关键词+结果记录表', '', NULL, 'KeywordResult', 'crud', 'com.ruoyi.project.garbagesort', 'garbagesort', 'keywordResult', '关键词+结果记录', 'luoxiang', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"垃圾分类\",\"treeCode\":\"\"}', 'admin', '2021-06-08 10:11:05', '', '2021-06-08 12:27:18', '');
INSERT INTO `gen_table` VALUES (5, 'keyword_search_num', '搜索关键词+次数记录表', '', NULL, 'KeywordSearchNum', 'crud', 'com.ruoyi.project.garbagesort', 'garbagesort', 'keywordSearchNum', '搜索关键词+次数记录', 'luoxiang', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"垃圾分类\",\"treeCode\":\"\"}', 'admin', '2021-06-08 10:11:05', '', '2021-06-08 10:33:33', '');
INSERT INTO `gen_table` VALUES (6, 'question_bank', '题库表', '', NULL, 'QuestionBank', 'crud', 'com.ruoyi.project.garbagesort', 'garbagesort', 'questionBank', '题库', 'luoxiang', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"垃圾分类\",\"treeCode\":\"\"}', 'admin', '2021-06-08 10:11:05', '', '2021-06-08 12:26:47', '');
INSERT INTO `gen_table` VALUES (7, 'slide_show', '幻灯片播放表', '', NULL, 'SlideShow', 'crud', 'com.ruoyi.project.garbagesort', 'garbagesort', 'slideShow', '幻灯片播放', 'luoxiang', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"垃圾分类\",\"treeCode\":\"\"}', 'admin', '2021-06-08 10:11:05', '', '2021-06-08 10:34:06', '');
INSERT INTO `gen_table` VALUES (8, 'speech_classify', '语音识别记录', '', NULL, 'SpeechClassify', 'crud', 'com.ruoyi.project.garbagesort', 'garbagesort', 'speechClassify', '语音识别记录', 'luoxiang', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"垃圾分类\",\"treeCode\":\"\"}', 'admin', '2021-06-08 10:11:05', '', '2021-06-08 10:34:25', '');
INSERT INTO `gen_table` VALUES (18, 'goods_detail', '', NULL, NULL, 'GoodsDetail', 'crud', 'com.ruoyi.project.garbagesort', 'garbagesort', 'detail', NULL, 'luoxiang', '0', '/', NULL, 'admin', '2024-04-20 17:58:00', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (19, 'orders', '订单表', '', NULL, 'Orders', 'crud', 'com.ruoyi.project.garbagesort', 'garbagesort', 'orders', '订单查询', 'luoxiang', '0', '/', '{\"parentMenuId\":\"2086\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"订单管理\",\"treeCode\":\"\"}', 'admin', '2024-04-20 17:58:00', '', '2024-04-20 18:09:17', '');
INSERT INTO `gen_table` VALUES (21, 'user_addr', '用户地址表', '', NULL, 'UserAddr', 'crud', 'com.ruoyi.project.garbagesort', 'garbagesort', 'addr', '用户地址查询', 'luoxiang', '0', '/', '{\"parentMenuId\":\"2085\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"用户管理\",\"treeCode\":\"\"}', 'admin', '2024-04-20 17:58:02', '', '2024-04-20 18:22:33', '');
INSERT INTO `gen_table` VALUES (24, 'user_inf', '用户信息表', 'users', 'user_id', 'UserInf', 'sub', 'com.ruoyi.project.garbagesort', 'garbagesort', 'userInfo', '用户信息查询', 'luoxiang', '0', '/', '{\"parentMenuId\":\"2085\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"用户管理\",\"treeCode\":\"\"}', 'admin', '2024-04-20 18:24:17', '', '2024-04-20 20:30:59', '');
INSERT INTO `gen_table` VALUES (25, 'users', '用户表', 'user_inf', 'user_id', 'Users', 'sub', 'com.ruoyi.project.garbagesort', 'garbagesort', 'users', '用户查询', 'luoxiang', '0', '/', '{\"parentMenuId\":\"2085\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"用户管理\",\"treeCode\":\"\"}', 'admin', '2024-04-20 18:57:54', '', '2024-04-20 20:06:14', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:34:41');
INSERT INTO `gen_table_column` VALUES (2, '1', 'whether', '是否正确；1:正确；0:错误', 'tinyint', 'Long', 'whether', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:34:41');
INSERT INTO `gen_table_column` VALUES (3, '1', 'question_id', '问题id', 'int', 'Long', 'questionId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:34:41');
INSERT INTO `gen_table_column` VALUES (4, '1', 'garbage_name', '', 'varchar(100)', 'String', 'garbageName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:34:41');
INSERT INTO `gen_table_column` VALUES (5, '1', 'garbage_type', '', 'tinyint', 'Long', 'garbageType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:34:41');
INSERT INTO `gen_table_column` VALUES (6, '1', 'selected_type', '', 'tinyint', 'Long', 'selectedType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:34:41');
INSERT INTO `gen_table_column` VALUES (7, '2', 'id', '', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:34:55');
INSERT INTO `gen_table_column` VALUES (8, '2', 'score', '', 'int', 'Long', 'score', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:34:55');
INSERT INTO `gen_table_column` VALUES (9, '2', 'result', '', 'json', 'String', 'result', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:34:55');
INSERT INTO `gen_table_column` VALUES (10, '2', 'times', '', 'timestamp', 'Date', 'times', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:34:55');
INSERT INTO `gen_table_column` VALUES (11, '2', 'user_name', '', 'varchar(100)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:34:55');
INSERT INTO `gen_table_column` VALUES (12, '3', 'id', '', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:35:06');
INSERT INTO `gen_table_column` VALUES (13, '3', 'filepath', '', 'varchar(200)', 'String', 'filepath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:35:06');
INSERT INTO `gen_table_column` VALUES (14, '3', 'one_keyword', '', 'varchar(100)', 'String', 'oneKeyword', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-06-08 10:11:04', NULL, '2021-06-08 10:35:06');
INSERT INTO `gen_table_column` VALUES (15, '3', 'one_result', '', 'json', 'String', 'oneResult', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:35:06');
INSERT INTO `gen_table_column` VALUES (16, '3', 'all_keyword', '', 'varchar(500)', 'String', 'allKeyword', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:35:06');
INSERT INTO `gen_table_column` VALUES (17, '3', 'all_result', '', 'json', 'String', 'allResult', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:35:06');
INSERT INTO `gen_table_column` VALUES (18, '3', 'user_name', '', 'varchar(100)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:35:06');
INSERT INTO `gen_table_column` VALUES (19, '3', 'times', '', 'timestamp', 'Date', 'times', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:35:06');
INSERT INTO `gen_table_column` VALUES (20, '4', 'id', '', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 12:27:18');
INSERT INTO `gen_table_column` VALUES (21, '4', 'keyword', '', 'varchar(100)', 'String', 'keyword', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 12:27:18');
INSERT INTO `gen_table_column` VALUES (22, '4', 'result', '', 'json', 'String', 'result', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 12:27:18');
INSERT INTO `gen_table_column` VALUES (23, '4', 'times', '', 'timestamp', 'Date', 'times', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 12:27:18');
INSERT INTO `gen_table_column` VALUES (24, '5', 'id', '', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:33:33');
INSERT INTO `gen_table_column` VALUES (25, '5', 'keyword', '', 'varchar(100)', 'String', 'keyword', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:33:33');
INSERT INTO `gen_table_column` VALUES (26, '5', 'num', '', 'int', 'Long', 'num', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:33:33');
INSERT INTO `gen_table_column` VALUES (27, '5', 'times', '', 'timestamp', 'Date', 'times', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:33:34');
INSERT INTO `gen_table_column` VALUES (28, '6', 'question_id', 'id', 'int', 'Long', 'questionId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 12:26:47');
INSERT INTO `gen_table_column` VALUES (29, '6', 'garbage_type', '', 'tinyint', 'Long', 'garbageType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'garbage_type', 1, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 12:26:47');
INSERT INTO `gen_table_column` VALUES (30, '6', 'garbage_name', '垃圾名称', 'varchar(50)', 'String', 'garbageName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 12:26:47');
INSERT INTO `gen_table_column` VALUES (31, '6', 'analysis', '解析', 'varchar(255)', 'String', 'analysis', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 12:26:47');
INSERT INTO `gen_table_column` VALUES (32, '6', 'remark', '备注', 'varchar(200)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 12:26:47');
INSERT INTO `gen_table_column` VALUES (33, '7', 'slide', 'id', 'int', 'Long', 'slide', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:06');
INSERT INTO `gen_table_column` VALUES (34, '7', 'user_id', '是否启用', 'tinyint(1)', 'Integer', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:06');
INSERT INTO `gen_table_column` VALUES (35, '7', 'sort_id', '排序id', 'int', 'Long', 'sortId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:06');
INSERT INTO `gen_table_column` VALUES (36, '7', 'image_url', '图片地址', 'varchar(200)', 'String', 'imageUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:06');
INSERT INTO `gen_table_column` VALUES (37, '7', 'skip_url', '跳转的链接地址', 'varchar(200)', 'String', 'skipUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:06');
INSERT INTO `gen_table_column` VALUES (38, '8', 'id', '', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:25');
INSERT INTO `gen_table_column` VALUES (39, '8', 'filepath', '', 'varchar(200)', 'String', 'filepath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:25');
INSERT INTO `gen_table_column` VALUES (40, '8', 'one_keyword', '', 'varchar(100)', 'String', 'oneKeyword', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:25');
INSERT INTO `gen_table_column` VALUES (41, '8', 'one_result', '', 'json', 'String', 'oneResult', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:25');
INSERT INTO `gen_table_column` VALUES (42, '8', 'all_keyword', '', 'varchar(500)', 'String', 'allKeyword', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:25');
INSERT INTO `gen_table_column` VALUES (43, '8', 'all_result', '', 'json', 'String', 'allResult', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:25');
INSERT INTO `gen_table_column` VALUES (44, '8', 'user_name', '', 'varchar(100)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:25');
INSERT INTO `gen_table_column` VALUES (45, '8', 'times', '', 'timestamp', 'Date', 'times', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2021-06-08 10:11:05', NULL, '2021-06-08 10:34:25');
INSERT INTO `gen_table_column` VALUES (128, '18', 'id', '物品id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-20 17:58:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (129, '18', 'order_id', '订单号', 'int', 'Long', 'orderId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-20 17:58:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (130, '18', 'goods_name', '物品名称', 'varchar(255)', 'String', 'goodsName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-04-20 17:58:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (131, '18', 'weight', '物品重量', 'double', 'Long', 'weight', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-20 17:58:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (132, '18', 'amount', '物品单价', 'double', 'Long', 'amount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-20 17:58:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (133, '18', 'image', '图片路径', 'varchar(255)', 'String', 'image', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-20 17:58:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (134, '19', 'id', '订单号', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-20 17:58:00', NULL, '2024-04-20 18:09:17');
INSERT INTO `gen_table_column` VALUES (135, '19', 'user_id', '用户', 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-20 17:58:01', NULL, '2024-04-20 18:09:17');
INSERT INTO `gen_table_column` VALUES (136, '19', 'recycler_id', '回收员id', 'int', 'Long', 'recyclerId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-20 17:58:01', NULL, '2024-04-20 18:09:17');
INSERT INTO `gen_table_column` VALUES (137, '19', 'estimate_weight', '预估重量', 'varchar(255)', 'String', 'estimateWeight', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-20 17:58:01', NULL, '2024-04-20 18:09:17');
INSERT INTO `gen_table_column` VALUES (138, '19', 'address', '订单回收地址', 'varchar(255)', 'String', 'address', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-20 17:58:01', NULL, '2024-04-20 18:09:17');
INSERT INTO `gen_table_column` VALUES (139, '19', 'phone', '电话号码', 'varchar(255)', 'String', 'phone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-20 17:58:01', NULL, '2024-04-20 18:09:17');
INSERT INTO `gen_table_column` VALUES (140, '19', 'type', '垃圾类型', 'varchar(255)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'recycle_type', 7, 'admin', '2024-04-20 17:58:01', NULL, '2024-04-20 18:09:17');
INSERT INTO `gen_table_column` VALUES (141, '19', 'status', '订单状态 1:待接单，2:已完成，3:已取消，4:已接单', 'tinyint', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'order_status', 8, 'admin', '2024-04-20 17:58:01', NULL, '2024-04-20 18:09:17');
INSERT INTO `gen_table_column` VALUES (142, '19', 'appointment_time', '预约时间', 'varchar(255)', 'String', 'appointmentTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-04-20 17:58:01', NULL, '2024-04-20 18:09:17');
INSERT INTO `gen_table_column` VALUES (143, '19', 'amount', '总价', 'double(8,2)', 'BigDecimal', 'amount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-04-20 17:58:01', NULL, '2024-04-20 18:09:17');
INSERT INTO `gen_table_column` VALUES (144, '19', 'order_time', '下单时间', 'datetime', 'Date', 'orderTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2024-04-20 17:58:01', NULL, '2024-04-20 18:09:17');
INSERT INTO `gen_table_column` VALUES (151, '21', 'addr_id', '地址id', 'int', 'Long', 'addrId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-20 17:58:02', NULL, '2024-04-20 18:22:33');
INSERT INTO `gen_table_column` VALUES (152, '21', 'user_id', '用户id', 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-20 17:58:02', NULL, '2024-04-20 18:22:33');
INSERT INTO `gen_table_column` VALUES (153, '21', 'contact_name', '姓名', 'varchar(255)', 'String', 'contactName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-04-20 17:58:02', NULL, '2024-04-20 18:22:33');
INSERT INTO `gen_table_column` VALUES (154, '21', 'contact_phone', '电话号码', 'varchar(255)', 'String', 'contactPhone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-20 17:58:02', NULL, '2024-04-20 18:22:34');
INSERT INTO `gen_table_column` VALUES (155, '21', 'province', '省', 'varchar(255)', 'String', 'province', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-20 17:58:02', NULL, '2024-04-20 18:22:34');
INSERT INTO `gen_table_column` VALUES (156, '21', 'city', '市', 'varchar(255)', 'String', 'city', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-20 17:58:02', NULL, '2024-04-20 18:22:34');
INSERT INTO `gen_table_column` VALUES (157, '21', 'district', '区', 'varchar(255)', 'String', 'district', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-04-20 17:58:02', NULL, '2024-04-20 18:22:34');
INSERT INTO `gen_table_column` VALUES (158, '21', 'address', '详细地址', 'varchar(255)', 'String', 'address', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-04-20 17:58:02', NULL, '2024-04-20 18:22:34');
INSERT INTO `gen_table_column` VALUES (159, '21', 'is_default', '是否默认', 'tinyint', 'Long', 'isDefault', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'defalt_addr', 9, 'admin', '2024-04-20 17:58:02', NULL, '2024-04-20 18:22:34');
INSERT INTO `gen_table_column` VALUES (160, '21', 'modified_time', '最后修改时间', 'timestamp', 'Date', 'modifiedTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2024-04-20 17:58:02', NULL, '2024-04-20 18:22:34');
INSERT INTO `gen_table_column` VALUES (176, '24', 'inf_id', '用户信息ID', 'int', 'Long', 'infId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-20 18:24:17', NULL, '2024-04-20 20:31:00');
INSERT INTO `gen_table_column` VALUES (177, '24', 'user_id', '用户ID', 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-20 18:24:17', NULL, '2024-04-20 20:31:00');
INSERT INTO `gen_table_column` VALUES (178, '24', 'nickname', '用户昵称', 'varchar(255)', 'String', 'nickname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-04-20 18:24:17', NULL, '2024-04-20 20:31:00');
INSERT INTO `gen_table_column` VALUES (179, '24', 'avatar', '头像', 'varchar(255)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'upload', '', 4, 'admin', '2024-04-20 18:24:17', NULL, '2024-04-20 20:31:00');
INSERT INTO `gen_table_column` VALUES (180, '24', 'phone', '电话号码', 'varchar(255)', 'String', 'phone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-20 18:24:17', NULL, '2024-04-20 20:31:00');
INSERT INTO `gen_table_column` VALUES (181, '24', 'gender', '性别', 'enum(\'男\',\'女\',\'保密\')', 'String', 'gender', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'user_sex', 6, 'admin', '2024-04-20 18:24:17', NULL, '2024-04-20 20:31:00');
INSERT INTO `gen_table_column` VALUES (182, '24', 'user_money', '用户余额', 'decimal(8,2)', 'BigDecimal', 'userMoney', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-04-20 18:24:17', NULL, '2024-04-20 20:31:00');
INSERT INTO `gen_table_column` VALUES (183, '24', 'order_num', '订单数量', 'int', 'Long', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-04-20 18:24:18', NULL, '2024-04-20 20:31:00');
INSERT INTO `gen_table_column` VALUES (184, '24', 'register_time', '注册时间', 'timestamp', 'Date', 'registerTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2024-04-20 18:24:18', NULL, '2024-04-20 20:31:00');
INSERT INTO `gen_table_column` VALUES (185, '25', 'user_id', '用户ID', 'int', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2024-04-20 18:57:54', NULL, '2024-04-20 20:06:14');
INSERT INTO `gen_table_column` VALUES (186, '25', 'phone', '手机号', 'varchar(255)', 'String', 'phone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-20 18:57:54', NULL, '2024-04-20 20:06:14');
INSERT INTO `gen_table_column` VALUES (187, '25', 'password', 'md5加密的密码', 'char(32)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-20 18:57:54', NULL, '2024-04-20 20:06:14');
INSERT INTO `gen_table_column` VALUES (188, '25', 'user_state', '用户类型：0：用户，1：回收员', 'tinyint', 'Long', 'userState', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'user_type', 4, 'admin', '2024-04-20 18:57:54', NULL, '2024-04-20 20:06:15');
INSERT INTO `gen_table_column` VALUES (189, '25', 'create_time', '创建日期', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-04-20 18:57:54', NULL, '2024-04-20 20:06:15');
INSERT INTO `gen_table_column` VALUES (190, '25', 'modified_time', '修改日期', 'timestamp', 'Date', 'modifiedTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-04-20 18:57:54', NULL, '2024-04-20 20:06:15');

-- ----------------------------
-- Table structure for goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `goods_detail`;
CREATE TABLE `goods_detail`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '物品id',
  `order_id` int NOT NULL COMMENT '订单号',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物品名称',
  `weight` double(8, 2) NOT NULL COMMENT '物品重量',
  `amount` double(8, 2) NOT NULL COMMENT '物品单价',
  `unit_price` double(8, 2) NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_detail
-- ----------------------------
INSERT INTO `goods_detail` VALUES (1, 9, '方法', 124.00, 5728.80, 46.20, NULL);
INSERT INTO `goods_detail` VALUES (2, 11, 'dfs', 1.40, 5.60, 4.00, NULL);
INSERT INTO `goods_detail` VALUES (3, 14, 'sf', 1.40, 33.60, 24.00, NULL);
INSERT INTO `goods_detail` VALUES (4, 15, '废值', 12.00, 50.40, 4.20, NULL);
INSERT INTO `goods_detail` VALUES (5, 16, 'dsf', 55.00, 4326.30, 78.66, NULL);
INSERT INTO `goods_detail` VALUES (6, 17, 'fdgfd', 1414.00, 33936.00, 24.00, NULL);
INSERT INTO `goods_detail` VALUES (7, 18, 'sfdsf', 14.00, 336.00, 24.00, NULL);
INSERT INTO `goods_detail` VALUES (8, 19, '废纸', 1.40, 77.00, 55.00, NULL);
INSERT INTO `goods_detail` VALUES (9, 20, '的说法是', 45.00, 1125.00, 25.00, NULL);
INSERT INTO `goods_detail` VALUES (10, 21, '撒旦', 2.40, 187.20, 78.00, NULL);

-- ----------------------------
-- Table structure for image_classify
-- ----------------------------
DROP TABLE IF EXISTS `image_classify`;
CREATE TABLE `image_classify`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `filepath` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件存储路径',
  `one_keyword` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '一个关键字',
  `one_result` json NULL COMMENT '一个结果',
  `all_keyword` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '总关键字',
  `all_result` json NULL COMMENT '总结果',
  `user_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `times` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `image_classify_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 331 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '图像识别记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of image_classify
-- ----------------------------

-- ----------------------------
-- Table structure for keyword_result
-- ----------------------------
DROP TABLE IF EXISTS `keyword_result`;
CREATE TABLE `keyword_result`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `result` json NULL,
  `times` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `keyword_result_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2269 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '关键词+结果记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of keyword_result
-- ----------------------------
INSERT INTO `keyword_result` VALUES (912, '教室', 'null', '2019-07-24 15:42:00');
INSERT INTO `keyword_result` VALUES (913, '男孩', '[]', '2019-07-24 15:42:04');
INSERT INTO `keyword_result` VALUES (914, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-24 15:42:09');
INSERT INTO `keyword_result` VALUES (915, '教室', 'null', '2019-07-24 15:42:11');
INSERT INTO `keyword_result` VALUES (916, '教室', '[]', '2019-07-24 15:42:13');
INSERT INTO `keyword_result` VALUES (917, '糖果', 'null', '2019-07-24 15:42:15');
INSERT INTO `keyword_result` VALUES (918, '米线', 'null', '2019-07-24 15:42:27');
INSERT INTO `keyword_result` VALUES (919, '人物特写', 'null', '2019-07-24 15:42:31');
INSERT INTO `keyword_result` VALUES (920, '米线', '[]', '2019-07-24 15:42:32');
INSERT INTO `keyword_result` VALUES (921, '人物特写', '[]', '2019-07-24 15:42:33');
INSERT INTO `keyword_result` VALUES (922, '米线', '[]', '2019-07-24 15:42:35');
INSERT INTO `keyword_result` VALUES (923, '人物特写', 'null', '2019-07-24 15:42:38');
INSERT INTO `keyword_result` VALUES (924, '头发', '[{\"questionId\": 196, \"garbageName\": \"头发\", \"garbageType\": 1}]', '2019-07-24 15:42:40');
INSERT INTO `keyword_result` VALUES (925, '剩饭残渣', '[{\"questionId\": 2, \"garbageName\": \"剩饭残渣\", \"garbageType\": 2}]', '2019-07-24 15:42:56');
INSERT INTO `keyword_result` VALUES (926, '人物特写', 'null', '2019-07-24 15:42:59');
INSERT INTO `keyword_result` VALUES (927, '头', '[{\"questionId\": 17, \"garbageName\": \"大骨头\", \"garbageType\": 1}, {\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}, {\"questionId\": 81, \"garbageName\": \"虾头\", \"garbageType\": 2}, {\"questionId\": 196, \"garbageName\": \"头发\", \"garbageType\": 1}, {\"questionId\": 218, \"garbageName\": \"骨头\", \"garbageType\": 2}, {\"questionId\": 219, \"garbageName\": \"鸡鹅鸭骨头\", \"garbageType\": 2}, {\"questionId\": 310, \"garbageName\": \"枕头\", \"garbageType\": 3}, {\"questionId\": 324, \"garbageName\": \"插头\", \"garbageType\": 3}, {\"questionId\": 329, \"garbageName\": \"食品罐头\", \"garbageType\": 3}, {\"questionId\": 344, \"garbageName\": \"废锁头\", \"garbageType\": 3}]', '2019-07-24 15:43:04');
INSERT INTO `keyword_result` VALUES (928, '头', '[{\"questionId\": 17, \"garbageName\": \"大骨头\", \"garbageType\": 1}, {\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}, {\"questionId\": 81, \"garbageName\": \"虾头\", \"garbageType\": 2}, {\"questionId\": 196, \"garbageName\": \"头发\", \"garbageType\": 1}, {\"questionId\": 218, \"garbageName\": \"骨头\", \"garbageType\": 2}, {\"questionId\": 219, \"garbageName\": \"鸡鹅鸭骨头\", \"garbageType\": 2}, {\"questionId\": 310, \"garbageName\": \"枕头\", \"garbageType\": 3}, {\"questionId\": 324, \"garbageName\": \"插头\", \"garbageType\": 3}, {\"questionId\": 329, \"garbageName\": \"食品罐头\", \"garbageType\": 3}, {\"questionId\": 344, \"garbageName\": \"废锁头\", \"garbageType\": 3}]', '2019-07-24 15:43:06');
INSERT INTO `keyword_result` VALUES (929, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-07-24 15:43:55');
INSERT INTO `keyword_result` VALUES (930, '简笔画', 'null', '2019-07-24 15:46:21');
INSERT INTO `keyword_result` VALUES (931, '简笔画', '[]', '2019-07-24 15:46:27');
INSERT INTO `keyword_result` VALUES (932, '纸品湿巾', 'null', '2019-07-24 15:55:31');
INSERT INTO `keyword_result` VALUES (933, '维达', '[]', '2019-07-24 15:55:35');
INSERT INTO `keyword_result` VALUES (934, '键盘', 'null', '2019-07-24 15:55:53');
INSERT INTO `keyword_result` VALUES (935, '饮料瓶', '[{\"questionId\": 259, \"garbageName\": \"饮料瓶\", \"garbageType\": 3}]', '2019-07-24 16:03:40');
INSERT INTO `keyword_result` VALUES (936, '笔', '[{\"questionId\": 48, \"garbageName\": \"笔\", \"garbageType\": 1}, {\"questionId\": 49, \"garbageName\": \"铅笔\", \"garbageType\": 1}, {\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}, {\"questionId\": 129, \"garbageName\": \"笔盖\", \"garbageType\": 1}, {\"questionId\": 137, \"garbageName\": \"钢笔\", \"garbageType\": 1}, {\"questionId\": 145, \"garbageName\": \"圆珠笔\", \"garbageType\": 1}, {\"questionId\": 388, \"garbageName\": \"水彩笔\", \"garbageType\": 4}]', '2019-07-24 16:07:51');
INSERT INTO `keyword_result` VALUES (937, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-24 16:08:03');
INSERT INTO `keyword_result` VALUES (938, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-24 16:08:03');
INSERT INTO `keyword_result` VALUES (939, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-24 16:08:03');
INSERT INTO `keyword_result` VALUES (940, '玉米衣', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}]', '2019-07-24 16:08:09');
INSERT INTO `keyword_result` VALUES (941, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-24 16:08:12');
INSERT INTO `keyword_result` VALUES (942, '美女', 'null', '2019-07-24 16:15:05');
INSERT INTO `keyword_result` VALUES (943, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}]', '2019-07-24 16:15:19');
INSERT INTO `keyword_result` VALUES (944, '熊猫卡通', 'null', '2019-07-24 16:15:35');
INSERT INTO `keyword_result` VALUES (945, '书本', 'null', '2019-07-24 16:16:01');
INSERT INTO `keyword_result` VALUES (946, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:06');
INSERT INTO `keyword_result` VALUES (947, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:09');
INSERT INTO `keyword_result` VALUES (948, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:11');
INSERT INTO `keyword_result` VALUES (949, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:13');
INSERT INTO `keyword_result` VALUES (950, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:13');
INSERT INTO `keyword_result` VALUES (951, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:14');
INSERT INTO `keyword_result` VALUES (952, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:14');
INSERT INTO `keyword_result` VALUES (953, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:14');
INSERT INTO `keyword_result` VALUES (954, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:14');
INSERT INTO `keyword_result` VALUES (955, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:14');
INSERT INTO `keyword_result` VALUES (956, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:15');
INSERT INTO `keyword_result` VALUES (957, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:15');
INSERT INTO `keyword_result` VALUES (958, '书本', '[{\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}]', '2019-07-24 16:16:16');
INSERT INTO `keyword_result` VALUES (959, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-24 16:16:44');
INSERT INTO `keyword_result` VALUES (960, '女朋友', '[{\"remark\": \"ta 生气的时候朵小花哄哄试试，说不定能给你一个大大的拥抱\", \"questionId\": 422, \"garbageName\": \"女朋友\", \"garbageType\": 3}]', '2019-07-24 16:17:05');
INSERT INTO `keyword_result` VALUES (961, '男朋友', '[{\"remark\": \"有时偶尔不听话，大概是皮了，需要好好教育才能更懂你\", \"questionId\": 421, \"garbageName\": \"男朋友\", \"garbageType\": 3}]', '2019-07-24 16:17:21');
INSERT INTO `keyword_result` VALUES (962, '女仆', '[]', '2019-07-24 16:17:37');
INSERT INTO `keyword_result` VALUES (963, '女朋友', '[{\"remark\": \"ta 生气的时候朵小花哄哄试试，说不定能给你一个大大的拥抱\", \"questionId\": 422, \"garbageName\": \"女朋友\", \"garbageType\": 3}]', '2019-07-24 16:17:42');
INSERT INTO `keyword_result` VALUES (964, '雨伞', '[{\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-07-24 16:22:19');
INSERT INTO `keyword_result` VALUES (965, '剩饭残渣', '[{\"questionId\": 2, \"garbageName\": \"剩饭残渣\", \"garbageType\": 2}]', '2019-07-24 16:34:25');
INSERT INTO `keyword_result` VALUES (966, '尿不湿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}]', '2019-07-24 16:36:08');
INSERT INTO `keyword_result` VALUES (967, '尿不湿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}]', '2019-07-24 16:36:13');
INSERT INTO `keyword_result` VALUES (968, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-07-24 16:36:28');
INSERT INTO `keyword_result` VALUES (969, '炉渣', '[{\"questionId\": 30, \"garbageName\": \"炉渣\", \"garbageType\": 1}]', '2019-07-24 16:36:31');
INSERT INTO `keyword_result` VALUES (970, '胶水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}]', '2019-07-24 16:36:50');
INSERT INTO `keyword_result` VALUES (971, '胶水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}]', '2019-07-24 16:37:01');
INSERT INTO `keyword_result` VALUES (972, '胶水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}]', '2019-07-24 16:42:11');
INSERT INTO `keyword_result` VALUES (973, '面膜', 'null', '2019-07-24 16:51:16');
INSERT INTO `keyword_result` VALUES (974, '光疗甲', 'null', '2019-07-24 16:52:02');
INSERT INTO `keyword_result` VALUES (975, '彩色动漫', 'null', '2019-07-24 16:52:16');
INSERT INTO `keyword_result` VALUES (976, '雕像', 'null', '2019-07-24 16:52:58');
INSERT INTO `keyword_result` VALUES (977, '橡胶', '[]', '2019-07-24 16:56:54');
INSERT INTO `keyword_result` VALUES (978, '橡胶', '[]', '2019-07-24 16:56:58');
INSERT INTO `keyword_result` VALUES (979, '枕头', '[{\"questionId\": 310, \"garbageName\": \"枕头\", \"garbageType\": 3}]', '2019-07-24 16:57:16');
INSERT INTO `keyword_result` VALUES (980, '饮料/饮品', 'null', '2019-07-24 16:59:20');
INSERT INTO `keyword_result` VALUES (981, '啤酒瓶', '[]', '2019-07-24 17:04:04');
INSERT INTO `keyword_result` VALUES (982, '纸巾', '[{\"remark\": \"纸巾不要乱丢呀，会污染环境\", \"analysis\": \"\", \"questionId\": 1, \"garbageName\": \"纸巾\", \"garbageType\": 1}]', '2019-07-24 17:04:16');
INSERT INTO `keyword_result` VALUES (983, '榴莲核', '[{\"questionId\": 25, \"garbageName\": \"榴莲核\", \"garbageType\": 1}]', '2019-07-24 17:06:43');
INSERT INTO `keyword_result` VALUES (984, '编织袋', '[{\"questionId\": 15, \"garbageName\": \"编织袋\", \"garbageType\": 1}]', '2019-07-24 17:11:27');
INSERT INTO `keyword_result` VALUES (985, '雨伞', '[{\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-07-24 17:18:28');
INSERT INTO `keyword_result` VALUES (986, '雨伞', '[{\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-07-24 17:23:57');
INSERT INTO `keyword_result` VALUES (987, '椰子壳', '[{\"questionId\": 20, \"garbageName\": \"椰子壳\", \"garbageType\": 1}]', '2019-07-24 17:26:40');
INSERT INTO `keyword_result` VALUES (988, '编织袋', '[{\"questionId\": 15, \"garbageName\": \"编织袋\", \"garbageType\": 1}]', '2019-07-24 17:50:25');
INSERT INTO `keyword_result` VALUES (989, '鼠标', 'null', '2019-07-24 17:51:09');
INSERT INTO `keyword_result` VALUES (990, '竹篮', '[{\"questionId\": 41, \"garbageName\": \"竹篮\", \"garbageType\": 1}]', '2019-07-24 17:51:20');
INSERT INTO `keyword_result` VALUES (991, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-24 17:51:25');
INSERT INTO `keyword_result` VALUES (992, '天堂伞', '[{\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}]', '2019-07-24 17:51:35');
INSERT INTO `keyword_result` VALUES (993, '鼠标', 'null', '2019-07-24 17:57:09');
INSERT INTO `keyword_result` VALUES (994, '触控板', 'null', '2019-07-24 17:57:16');
INSERT INTO `keyword_result` VALUES (995, '平板手机', '[]', '2019-07-24 17:57:27');
INSERT INTO `keyword_result` VALUES (996, '伞', '[{\"questionId\": 45, \"garbageName\": \"伞\", \"garbageType\": 1}, {\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-07-24 17:59:16');
INSERT INTO `keyword_result` VALUES (997, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-24 18:01:37');
INSERT INTO `keyword_result` VALUES (998, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-24 18:02:35');
INSERT INTO `keyword_result` VALUES (999, '我觉得', '[]', '2019-07-24 18:02:55');
INSERT INTO `keyword_result` VALUES (1000, '', '[]', '2019-07-24 18:02:59');
INSERT INTO `keyword_result` VALUES (1001, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}]', '2019-07-24 18:03:08');
INSERT INTO `keyword_result` VALUES (1002, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}]', '2019-07-24 18:03:20');
INSERT INTO `keyword_result` VALUES (1003, '耳机', '[]', '2019-07-24 18:16:56');
INSERT INTO `keyword_result` VALUES (1004, '耳机', '[]', '2019-07-24 18:17:00');
INSERT INTO `keyword_result` VALUES (1005, '餐巾纸', '[{\"questionId\": 5, \"garbageName\": \"餐巾纸\", \"garbageType\": 1}]', '2019-07-24 18:17:37');
INSERT INTO `keyword_result` VALUES (1006, '手表', '[]', '2019-07-24 18:17:45');
INSERT INTO `keyword_result` VALUES (1007, '手表', '[]', '2019-07-24 18:17:47');
INSERT INTO `keyword_result` VALUES (1008, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-24 18:18:02');
INSERT INTO `keyword_result` VALUES (1009, '鼠标', '[{\"questionId\": 426, \"garbageName\": \"鼠标\", \"garbageType\": 3}]', '2019-07-24 18:18:14');
INSERT INTO `keyword_result` VALUES (1010, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-07-24 18:18:14');
INSERT INTO `keyword_result` VALUES (1011, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-07-24 18:19:52');
INSERT INTO `keyword_result` VALUES (1012, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-24 18:20:00');
INSERT INTO `keyword_result` VALUES (1013, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2019-07-24 18:20:23');
INSERT INTO `keyword_result` VALUES (1014, '榴莲壳', '[{\"questionId\": 21, \"garbageName\": \"榴莲壳\", \"garbageType\": 1}]', '2019-07-24 18:20:27');
INSERT INTO `keyword_result` VALUES (1015, '金鱼', '[]', '2019-07-24 18:21:23');
INSERT INTO `keyword_result` VALUES (1016, '死鱼', '[]', '2019-07-24 18:21:33');
INSERT INTO `keyword_result` VALUES (1017, '笔', '[{\"questionId\": 48, \"garbageName\": \"笔\", \"garbageType\": 1}, {\"questionId\": 49, \"garbageName\": \"铅笔\", \"garbageType\": 1}, {\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}, {\"questionId\": 129, \"garbageName\": \"笔盖\", \"garbageType\": 1}, {\"questionId\": 137, \"garbageName\": \"钢笔\", \"garbageType\": 1}, {\"questionId\": 145, \"garbageName\": \"圆珠笔\", \"garbageType\": 1}, {\"questionId\": 388, \"garbageName\": \"水彩笔\", \"garbageType\": 4}, {\"questionId\": 653, \"garbageName\": \"笔芯\", \"garbageType\": 1}]', '2019-07-24 18:21:47');
INSERT INTO `keyword_result` VALUES (1018, '木鱼', '[]', '2019-07-24 18:21:52');
INSERT INTO `keyword_result` VALUES (1019, '飞机', '[]', '2019-07-24 18:22:08');
INSERT INTO `keyword_result` VALUES (1020, '手机', '[{\"questionId\": 533, \"garbageName\": \"手机电池\", \"garbageType\": 4}]', '2019-07-24 18:22:12');
INSERT INTO `keyword_result` VALUES (1021, '手机', '[{\"questionId\": 533, \"garbageName\": \"手机电池\", \"garbageType\": 4}]', '2019-07-24 18:22:15');
INSERT INTO `keyword_result` VALUES (1022, '女朋友', '[{\"remark\": \"ta 生气的时候朵小花哄哄试试，说不定能给你一个大大的拥抱\", \"questionId\": 422, \"garbageName\": \"女朋友\", \"garbageType\": 3}]', '2019-07-24 18:22:16');
INSERT INTO `keyword_result` VALUES (1023, '手机电池', '[{\"questionId\": 533, \"garbageName\": \"手机电池\", \"garbageType\": 4}]', '2019-07-24 18:22:16');
INSERT INTO `keyword_result` VALUES (1024, '茶叶', '[{\"questionId\": 98, \"garbageName\": \"茶叶\", \"garbageType\": 2}, {\"questionId\": 600, \"garbageName\": \"茶叶渣\", \"garbageType\": 2}, {\"questionId\": 656, \"garbageName\": \"茶叶包\", \"garbageType\": 1}]', '2019-07-24 18:22:30');
INSERT INTO `keyword_result` VALUES (1025, '盆栽植物', 'null', '2019-07-24 18:22:48');
INSERT INTO `keyword_result` VALUES (1026, '灵芝', '[]', '2019-07-24 18:23:02');
INSERT INTO `keyword_result` VALUES (1027, '男朋友', '[{\"remark\": \"有时偶尔不听话，大概是皮了，需要好好教育才能更懂你\", \"questionId\": 421, \"garbageName\": \"男朋友\", \"garbageType\": 3}]', '2019-07-24 18:23:09');
INSERT INTO `keyword_result` VALUES (1028, '键盘', 'null', '2019-07-24 18:23:24');
INSERT INTO `keyword_result` VALUES (1029, '纸品湿巾', 'null', '2019-07-24 18:23:44');
INSERT INTO `keyword_result` VALUES (1030, '胶水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}]', '2019-07-24 18:23:46');
INSERT INTO `keyword_result` VALUES (1031, '狗屎', '[{\"remark\": \"属于宠物粪便，不建议归入到当前垃圾分类当中；实在不便时，可包裹后投入干垃圾桶内\", \"questionId\": 429, \"garbageName\": \"狗屎\", \"garbageType\": 1}]', '2019-07-24 18:23:47');
INSERT INTO `keyword_result` VALUES (1032, '耳机', '[{\"remark\": \"耳机是个好东西，戴上它，感觉全世界都是自己的\", \"questionId\": 662, \"garbageName\": \"耳机\", \"garbageType\": 3}]', '2019-07-24 18:23:51');
INSERT INTO `keyword_result` VALUES (1033, '狗屎', '[{\"remark\": \"属于宠物粪便，不建议归入到当前垃圾分类当中；实在不便时，可包裹后投入干垃圾桶内\", \"questionId\": 429, \"garbageName\": \"狗屎\", \"garbageType\": 1}]', '2019-07-24 18:23:52');
INSERT INTO `keyword_result` VALUES (1034, '纸巾', '[{\"remark\": \"纸巾不要乱丢呀，会污染环境\", \"analysis\": \"\", \"questionId\": 1, \"garbageName\": \"纸巾\", \"garbageType\": 1}, {\"questionId\": 620, \"garbageName\": \"湿纸巾\", \"garbageType\": 1}]', '2019-07-24 18:23:53');
INSERT INTO `keyword_result` VALUES (1035, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-24 18:24:13');
INSERT INTO `keyword_result` VALUES (1036, '编织袋', '[{\"questionId\": 15, \"garbageName\": \"编织袋\", \"garbageType\": 1}]', '2019-07-24 18:24:56');
INSERT INTO `keyword_result` VALUES (1037, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-07-24 18:25:10');
INSERT INTO `keyword_result` VALUES (1038, '死鱼', '[]', '2019-07-24 18:25:21');
INSERT INTO `keyword_result` VALUES (1039, '死鱼', '[]', '2019-07-24 18:25:31');
INSERT INTO `keyword_result` VALUES (1040, '图像素材', 'null', '2019-07-24 18:25:46');
INSERT INTO `keyword_result` VALUES (1041, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-24 18:26:03');
INSERT INTO `keyword_result` VALUES (1042, '甘蔗皮', '[{\"questionId\": 24, \"garbageName\": \"甘蔗皮\", \"garbageType\": 1}]', '2019-07-24 18:27:30');
INSERT INTO `keyword_result` VALUES (1043, '甘蔗', '[{\"questionId\": 24, \"garbageName\": \"甘蔗皮\", \"garbageType\": 1}, {\"questionId\": 216, \"garbageName\": \"甘蔗\", \"garbageType\": 2}]', '2019-07-24 18:27:49');
INSERT INTO `keyword_result` VALUES (1044, '动物尸体', '[]', '2019-07-24 18:28:15');
INSERT INTO `keyword_result` VALUES (1045, '碗', 'null', '2019-07-24 18:28:27');
INSERT INTO `keyword_result` VALUES (1046, '烟灰缸', 'null', '2019-07-24 18:29:44');
INSERT INTO `keyword_result` VALUES (1047, '水壶', 'null', '2019-07-24 18:30:13');
INSERT INTO `keyword_result` VALUES (1048, '椅子', 'null', '2019-07-24 18:30:29');
INSERT INTO `keyword_result` VALUES (1049, '人物特写', 'null', '2019-07-24 18:30:46');
INSERT INTO `keyword_result` VALUES (1050, '轿车', 'null', '2019-07-24 18:31:29');
INSERT INTO `keyword_result` VALUES (1051, '榴莲壳', '[{\"questionId\": 21, \"garbageName\": \"榴莲壳\", \"garbageType\": 1}]', '2019-07-24 18:32:21');
INSERT INTO `keyword_result` VALUES (1052, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-07-24 18:32:24');
INSERT INTO `keyword_result` VALUES (1053, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-07-24 18:32:49');
INSERT INTO `keyword_result` VALUES (1054, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-07-24 18:34:04');
INSERT INTO `keyword_result` VALUES (1055, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-07-24 18:35:17');
INSERT INTO `keyword_result` VALUES (1056, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-24 18:35:31');
INSERT INTO `keyword_result` VALUES (1057, '', '[]', '2019-07-24 18:36:18');
INSERT INTO `keyword_result` VALUES (1058, '可以可以可以可以', '[]', '2019-07-24 18:36:28');
INSERT INTO `keyword_result` VALUES (1059, '防碎气泡膜', '[{\"questionId\": 16, \"garbageName\": \"防碎气泡膜\", \"garbageType\": 1}]', '2019-07-24 18:36:42');
INSERT INTO `keyword_result` VALUES (1060, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-07-24 18:36:49');
INSERT INTO `keyword_result` VALUES (1061, '黄豆', '[{\"questionId\": 62, \"garbageName\": \"黄豆\", \"garbageType\": 2}]', '2019-07-24 18:39:06');
INSERT INTO `keyword_result` VALUES (1062, '剩菜', '[{\"questionId\": 234, \"garbageName\": \"剩饭剩菜\", \"garbageType\": 2}]', '2019-07-24 18:39:37');
INSERT INTO `keyword_result` VALUES (1063, '天堂伞', '[{\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}]', '2019-07-24 18:39:41');
INSERT INTO `keyword_result` VALUES (1064, '餐巾纸', '[{\"questionId\": 5, \"garbageName\": \"餐巾纸\", \"garbageType\": 1}]', '2019-07-24 18:40:13');
INSERT INTO `keyword_result` VALUES (1065, '生蚝壳', '[{\"questionId\": 53, \"garbageName\": \"生蚝壳\", \"garbageType\": 1}]', '2019-07-24 18:40:51');
INSERT INTO `keyword_result` VALUES (1066, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-07-24 18:41:08');
INSERT INTO `keyword_result` VALUES (1067, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-07-24 18:41:51');
INSERT INTO `keyword_result` VALUES (1068, '烟蒂', '[{\"questionId\": 11, \"garbageName\": \"烟蒂\", \"garbageType\": 1}]', '2019-07-24 18:42:03');
INSERT INTO `keyword_result` VALUES (1069, '毛发', '[{\"questionId\": 28, \"garbageName\": \"毛发\", \"garbageType\": 1}]', '2019-07-24 18:42:06');
INSERT INTO `keyword_result` VALUES (1070, '灰土', '[{\"questionId\": 29, \"garbageName\": \"灰土\", \"garbageType\": 1}]', '2019-07-24 18:42:17');
INSERT INTO `keyword_result` VALUES (1071, '胶带', '[{\"questionId\": 34, \"garbageName\": \"胶带\", \"garbageType\": 1}]', '2019-07-24 18:42:26');
INSERT INTO `keyword_result` VALUES (1072, '玉米衣', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}]', '2019-07-24 18:42:27');
INSERT INTO `keyword_result` VALUES (1073, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-07-24 18:42:29');
INSERT INTO `keyword_result` VALUES (1074, '编织袋', '[{\"questionId\": 15, \"garbageName\": \"编织袋\", \"garbageType\": 1}]', '2019-07-24 18:42:44');
INSERT INTO `keyword_result` VALUES (1075, '太空沙', '[{\"questionId\": 32, \"garbageName\": \"太空沙\", \"garbageType\": 1}]', '2019-07-24 18:42:57');
INSERT INTO `keyword_result` VALUES (1076, '榴莲核', '[{\"questionId\": 25, \"garbageName\": \"榴莲核\", \"garbageType\": 1}]', '2019-07-24 18:43:01');
INSERT INTO `keyword_result` VALUES (1077, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-07-24 18:44:07');
INSERT INTO `keyword_result` VALUES (1078, '胶水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}]', '2019-07-24 18:44:26');
INSERT INTO `keyword_result` VALUES (1079, '小龙虾', '[{\"questionId\": 557, \"garbageName\": \"小龙虾\", \"garbageType\": 2}, {\"questionId\": 564, \"garbageName\": \"小龙虾壳\", \"garbageType\": 2}, {\"questionId\": 594, \"garbageName\": \"小龙虾头\", \"garbageType\": 2}]', '2019-07-24 18:44:33');
INSERT INTO `keyword_result` VALUES (1080, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-07-24 18:44:55');
INSERT INTO `keyword_result` VALUES (1081, '水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}, {\"questionId\": 112, \"garbageName\": \"水果\", \"garbageType\": 2}, {\"questionId\": 114, \"garbageName\": \"水果皮\", \"garbageType\": 2}, {\"questionId\": 172, \"garbageName\": \"旧水槽\", \"garbageType\": 1}, {\"questionId\": 261, \"garbageName\": \"洗发水瓶\", \"garbageType\": 3}, {\"questionId\": 282, \"garbageName\": \"水果网套\", \"garbageType\": 3}, {\"questionId\": 366, \"garbageName\": \"洗甲水\", \"garbageType\": 4}, {\"questionId\": 369, \"garbageName\": \"水银血压计\", \"garbageType\": 4}, {\"questionId\": 370, \"garbageName\": \"水银体温计\", \"garbageType\": 4}, {\"questionId\": 371, \"garbageName\": \"水银温度计\", \"garbageType\": 4}, {\"questionId\": 388, \"garbageName\": \"水彩笔\", \"garbageType\": 4}, {\"questionId\": 392, \"garbageName\": \"香水瓶\", \"garbageType\": 4}, {\"questionId\": 411, \"garbageName\": \"过期指甲油水银温度计\", \"garbageType\": 4}, {\"questionId\": 445, \"garbageName\": \"矿泉水瓶\", \"garbageType\": 3}, {\"questionId\": 514, \"garbageName\": \"眼药水\", \"garbageType\": 4}, {\"questionId\": 528, \"garbageName\": \"眼药水瓶\", \"garbageType\": 4}, {\"questionId\": 545, \"garbageName\": \"水银\", \"garbageType\": 4}]', '2019-07-24 18:44:59');
INSERT INTO `keyword_result` VALUES (1082, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-07-24 18:48:37');
INSERT INTO `keyword_result` VALUES (1083, '葵花', 'null', '2019-07-24 18:49:02');
INSERT INTO `keyword_result` VALUES (1084, '剩饭残渣', '[{\"questionId\": 2, \"garbageName\": \"剩饭残渣\", \"garbageType\": 2}]', '2019-07-24 18:49:07');
INSERT INTO `keyword_result` VALUES (1085, '花盆', '[{\"questionId\": 35, \"garbageName\": \"花盆\", \"garbageType\": 1}, {\"questionId\": 187, \"garbageName\": \"坏的花盆\", \"garbageType\": 1}]', '2019-07-24 18:49:13');
INSERT INTO `keyword_result` VALUES (1086, '剩饭残渣', '[{\"questionId\": 2, \"garbageName\": \"剩饭残渣\", \"garbageType\": 2}]', '2019-07-24 18:49:15');
INSERT INTO `keyword_result` VALUES (1087, '瓶子', 'null', '2019-07-24 18:49:35');
INSERT INTO `keyword_result` VALUES (1088, '沐浴露', '[]', '2019-07-24 18:49:45');
INSERT INTO `keyword_result` VALUES (1089, '猫', 'null', '2019-07-24 18:50:03');
INSERT INTO `keyword_result` VALUES (1090, '猫', '[{\"questionId\": 8, \"garbageName\": \"猫砂\", \"garbageType\": 1}, {\"questionId\": 109, \"garbageName\": \"猫粮\", \"garbageType\": 2}]', '2019-07-24 18:50:05');
INSERT INTO `keyword_result` VALUES (1091, '猫', '[{\"questionId\": 8, \"garbageName\": \"猫砂\", \"garbageType\": 1}, {\"questionId\": 109, \"garbageName\": \"猫粮\", \"garbageType\": 2}]', '2019-07-24 18:50:09');
INSERT INTO `keyword_result` VALUES (1092, '猫', '[{\"questionId\": 8, \"garbageName\": \"猫砂\", \"garbageType\": 1}, {\"questionId\": 109, \"garbageName\": \"猫粮\", \"garbageType\": 2}]', '2019-07-24 18:50:13');
INSERT INTO `keyword_result` VALUES (1093, '烟灰缸', 'null', '2019-07-24 18:51:02');
INSERT INTO `keyword_result` VALUES (1094, '串串香', '[]', '2019-07-24 18:51:04');
INSERT INTO `keyword_result` VALUES (1095, '剩饭残渣', '[{\"questionId\": 2, \"garbageName\": \"剩饭残渣\", \"garbageType\": 2}]', '2019-07-24 18:51:07');
INSERT INTO `keyword_result` VALUES (1096, '剩饭残渣', '[{\"questionId\": 2, \"garbageName\": \"剩饭残渣\", \"garbageType\": 2}]', '2019-07-24 18:51:14');
INSERT INTO `keyword_result` VALUES (1097, '珍珠', '[]', '2019-07-24 18:53:57');
INSERT INTO `keyword_result` VALUES (1098, '奶茶', '[{\"remark\": \"喝完好喝的奶茶，记得把奶茶杯放进干垃圾桶哟\", \"questionId\": 427, \"garbageName\": \"奶茶杯\", \"garbageType\": 1}]', '2019-07-24 18:54:03');
INSERT INTO `keyword_result` VALUES (1099, '珍珠奶茶', '[]', '2019-07-24 18:54:11');
INSERT INTO `keyword_result` VALUES (1100, '避孕套', '[{\"questionId\": 607, \"garbageName\": \"避孕套\", \"garbageType\": 1}]', '2019-07-24 18:57:28');
INSERT INTO `keyword_result` VALUES (1101, '鲸鱼', '[]', '2019-07-24 18:57:39');
INSERT INTO `keyword_result` VALUES (1102, '鲸鱼', '[]', '2019-07-24 18:57:40');
INSERT INTO `keyword_result` VALUES (1103, '沙发', '[]', '2019-07-24 18:57:53');
INSERT INTO `keyword_result` VALUES (1104, '粘上猫尿的猫砂', '[]', '2019-07-24 18:58:59');
INSERT INTO `keyword_result` VALUES (1105, '鸡蛋壳', '[{\"questionId\": 424, \"garbageName\": \"鸡蛋壳\", \"garbageType\": 2}]', '2019-07-24 19:00:26');
INSERT INTO `keyword_result` VALUES (1106, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-07-24 19:01:27');
INSERT INTO `keyword_result` VALUES (1107, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-07-24 19:01:28');
INSERT INTO `keyword_result` VALUES (1108, '男孩', 'null', '2019-07-24 19:02:12');
INSERT INTO `keyword_result` VALUES (1109, '瓶子', '[]', '2019-07-24 19:02:25');
INSERT INTO `keyword_result` VALUES (1110, '男孩', '[]', '2019-07-24 19:02:29');
INSERT INTO `keyword_result` VALUES (1111, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-24 19:02:31');
INSERT INTO `keyword_result` VALUES (1112, '手提袋', '[]', '2019-07-24 19:02:35');
INSERT INTO `keyword_result` VALUES (1113, '美女', 'null', '2019-07-24 19:02:56');
INSERT INTO `keyword_result` VALUES (1114, '编织袋', '[{\"questionId\": 15, \"garbageName\": \"编织袋\", \"garbageType\": 1}]', '2019-07-24 19:03:08');
INSERT INTO `keyword_result` VALUES (1115, '男孩', 'null', '2019-07-24 19:05:59');
INSERT INTO `keyword_result` VALUES (1116, '尿不湿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}]', '2019-07-24 19:09:10');
INSERT INTO `keyword_result` VALUES (1117, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-07-24 19:11:16');
INSERT INTO `keyword_result` VALUES (1118, '甘蔗皮', '[{\"questionId\": 24, \"garbageName\": \"甘蔗皮\", \"garbageType\": 1}]', '2019-07-24 19:11:25');
INSERT INTO `keyword_result` VALUES (1119, '打火机', '[{\"remark\": \"干垃圾哟\", \"questionId\": 52, \"garbageName\": \"打火机\", \"garbageType\": 1}]', '2019-07-24 19:12:12');
INSERT INTO `keyword_result` VALUES (1120, '那啥意思？', '[]', '2019-07-24 19:16:20');
INSERT INTO `keyword_result` VALUES (1121, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-07-24 19:17:23');
INSERT INTO `keyword_result` VALUES (1122, '平板手机', 'null', '2019-07-24 19:17:37');
INSERT INTO `keyword_result` VALUES (1123, '平板手机', '[]', '2019-07-24 19:17:42');
INSERT INTO `keyword_result` VALUES (1124, '羊肉', '[{\"questionId\": 69, \"garbageName\": \"羊肉\", \"garbageType\": 2}, {\"questionId\": 104, \"garbageName\": \"羊肉干\", \"garbageType\": 2}]', '2019-07-24 19:23:52');
INSERT INTO `keyword_result` VALUES (1125, '编织袋', '[{\"questionId\": 15, \"garbageName\": \"编织袋\", \"garbageType\": 1}]', '2019-07-24 19:33:52');
INSERT INTO `keyword_result` VALUES (1126, '灰土', '[{\"questionId\": 29, \"garbageName\": \"灰土\", \"garbageType\": 1}]', '2019-07-24 19:35:15');
INSERT INTO `keyword_result` VALUES (1127, '镜子', '[{\"questionId\": 39, \"garbageName\": \"镜子\", \"garbageType\": 1}, {\"questionId\": 339, \"garbageName\": \"旧镜子\", \"garbageType\": 3}]', '2019-07-24 19:37:42');
INSERT INTO `keyword_result` VALUES (1128, '伞', '[{\"questionId\": 45, \"garbageName\": \"伞\", \"garbageType\": 1}, {\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-07-24 19:39:02');
INSERT INTO `keyword_result` VALUES (1129, '防碎气泡', '[{\"questionId\": 16, \"garbageName\": \"防碎气泡膜\", \"garbageType\": 1}]', '2019-07-24 19:58:01');
INSERT INTO `keyword_result` VALUES (1130, '香蕉皮', '[{\"questionId\": 116, \"garbageName\": \"香蕉皮\", \"garbageType\": 2}]', '2019-07-24 19:59:50');
INSERT INTO `keyword_result` VALUES (1131, '米饭', '[{\"questionId\": 57, \"garbageName\": \"米饭\", \"garbageType\": 2}]', '2019-07-24 20:14:51');
INSERT INTO `keyword_result` VALUES (1132, '珍珠', '[]', '2019-07-24 20:15:00');
INSERT INTO `keyword_result` VALUES (1133, '珍珠奶茶', '[]', '2019-07-24 20:15:04');
INSERT INTO `keyword_result` VALUES (1134, '珍珠奶茶', '[]', '2019-07-24 20:15:07');
INSERT INTO `keyword_result` VALUES (1135, '胶带', '[{\"questionId\": 34, \"garbageName\": \"胶带\", \"garbageType\": 1}]', '2019-07-24 20:15:33');
INSERT INTO `keyword_result` VALUES (1136, '树叶', '[{\"questionId\": 233, \"garbageName\": \"树叶\", \"garbageType\": 2}]', '2019-07-24 20:15:40');
INSERT INTO `keyword_result` VALUES (1137, '生蚝', '[{\"questionId\": 53, \"garbageName\": \"生蚝壳\", \"garbageType\": 1}]', '2019-07-24 20:15:45');
INSERT INTO `keyword_result` VALUES (1138, '花盆', '[{\"questionId\": 35, \"garbageName\": \"花盆\", \"garbageType\": 1}, {\"questionId\": 187, \"garbageName\": \"坏的花盆\", \"garbageType\": 1}]', '2019-07-24 20:16:22');
INSERT INTO `keyword_result` VALUES (1139, '毛发', '[{\"questionId\": 28, \"garbageName\": \"毛发\", \"garbageType\": 1}]', '2019-07-24 20:16:25');
INSERT INTO `keyword_result` VALUES (1140, '筷子', '[{\"questionId\": 44, \"garbageName\": \"筷子\", \"garbageType\": 1}, {\"questionId\": 185, \"garbageName\": \"一次性筷子\", \"garbageType\": 1}, {\"questionId\": 478, \"garbageName\": \"木筷子\", \"garbageType\": 3}]', '2019-07-24 20:16:29');
INSERT INTO `keyword_result` VALUES (1141, '咖啡渣', '[{\"questionId\": 99, \"garbageName\": \"咖啡渣\", \"garbageType\": 2}]', '2019-07-24 20:16:32');
INSERT INTO `keyword_result` VALUES (1142, '陶瓷锅', '[]', '2019-07-24 20:16:39');
INSERT INTO `keyword_result` VALUES (1143, '陶瓷', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}, {\"questionId\": 184, \"garbageName\": \"陶瓷杯\", \"garbageType\": 1}, {\"questionId\": 655, \"garbageName\": \"陶瓷碗\", \"garbageType\": 1}]', '2019-07-24 20:16:43');
INSERT INTO `keyword_result` VALUES (1144, '毛笔', '[{\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}]', '2019-07-24 20:17:03');
INSERT INTO `keyword_result` VALUES (1145, '牛奶', '[{\"questionId\": 334, \"garbageName\": \"牛奶盒\", \"garbageType\": 3}]', '2019-07-24 20:17:08');
INSERT INTO `keyword_result` VALUES (1146, '炉渣', '[{\"questionId\": 30, \"garbageName\": \"炉渣\", \"garbageType\": 1}]', '2019-07-24 20:24:49');
INSERT INTO `keyword_result` VALUES (1147, '灰土', '[{\"questionId\": 29, \"garbageName\": \"灰土\", \"garbageType\": 1}]', '2019-07-24 20:25:53');
INSERT INTO `keyword_result` VALUES (1148, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-24 20:25:59');
INSERT INTO `keyword_result` VALUES (1149, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-24 20:26:02');
INSERT INTO `keyword_result` VALUES (1150, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-07-24 20:26:04');
INSERT INTO `keyword_result` VALUES (1151, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-07-24 20:30:05');
INSERT INTO `keyword_result` VALUES (1152, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-07-24 20:30:09');
INSERT INTO `keyword_result` VALUES (1153, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-07-24 20:30:12');
INSERT INTO `keyword_result` VALUES (1154, '毛发', '[{\"questionId\": 28, \"garbageName\": \"毛发\", \"garbageType\": 1}]', '2019-07-24 20:30:16');
INSERT INTO `keyword_result` VALUES (1155, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-07-24 20:30:18');
INSERT INTO `keyword_result` VALUES (1156, '榴莲核', '[{\"questionId\": 25, \"garbageName\": \"榴莲核\", \"garbageType\": 1}]', '2019-07-24 20:30:20');
INSERT INTO `keyword_result` VALUES (1157, '大骨头', '[{\"questionId\": 17, \"garbageName\": \"大骨头\", \"garbageType\": 1}]', '2019-07-24 20:30:22');
INSERT INTO `keyword_result` VALUES (1158, '胶水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}]', '2019-07-24 20:30:24');
INSERT INTO `keyword_result` VALUES (1159, '榴莲壳', '[{\"questionId\": 21, \"garbageName\": \"榴莲壳\", \"garbageType\": 1}]', '2019-07-24 20:30:27');
INSERT INTO `keyword_result` VALUES (1160, '米饭', '[{\"questionId\": 57, \"garbageName\": \"米饭\", \"garbageType\": 2}]', '2019-07-24 20:30:28');
INSERT INTO `keyword_result` VALUES (1161, '牙签', '[{\"questionId\": 43, \"garbageName\": \"牙签\", \"garbageType\": 1}]', '2019-07-24 20:40:21');
INSERT INTO `keyword_result` VALUES (1162, '外卖饭盒', '[]', '2019-07-24 20:40:41');
INSERT INTO `keyword_result` VALUES (1163, '外卖', '[{\"questionId\": 644, \"garbageName\": \"外卖餐盒\", \"garbageType\": 1}]', '2019-07-24 20:40:49');
INSERT INTO `keyword_result` VALUES (1164, '剩饭', '[{\"questionId\": 2, \"garbageName\": \"剩饭残渣\", \"garbageType\": 2}, {\"questionId\": 234, \"garbageName\": \"剩饭剩菜\", \"garbageType\": 2}]', '2019-07-24 20:41:02');
INSERT INTO `keyword_result` VALUES (1165, '纸巾', '[{\"remark\": \"纸巾不要乱丢呀，会污染环境\", \"analysis\": \"\", \"questionId\": 1, \"garbageName\": \"纸巾\", \"garbageType\": 1}, {\"questionId\": 620, \"garbageName\": \"湿纸巾\", \"garbageType\": 1}]', '2019-07-24 20:41:19');
INSERT INTO `keyword_result` VALUES (1166, '纸巾', '[{\"remark\": \"纸巾不要乱丢呀，会污染环境\", \"analysis\": \"\", \"questionId\": 1, \"garbageName\": \"纸巾\", \"garbageType\": 1}, {\"questionId\": 620, \"garbageName\": \"湿纸巾\", \"garbageType\": 1}]', '2019-07-24 20:41:20');
INSERT INTO `keyword_result` VALUES (1167, '竹筷', '[{\"questionId\": 42, \"garbageName\": \"竹筷\", \"garbageType\": 1}]', '2019-07-24 20:46:58');
INSERT INTO `keyword_result` VALUES (1168, '笔记本电脑', 'null', '2019-07-24 20:48:03');
INSERT INTO `keyword_result` VALUES (1169, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-24 20:56:14');
INSERT INTO `keyword_result` VALUES (1170, '胶水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}]', '2019-07-24 20:56:42');
INSERT INTO `keyword_result` VALUES (1171, '污损塑料', '[{\"questionId\": 13, \"garbageName\": \"污损塑料\", \"garbageType\": 1}, {\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}]', '2019-07-24 21:02:38');
INSERT INTO `keyword_result` VALUES (1172, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-07-24 21:08:08');
INSERT INTO `keyword_result` VALUES (1173, '烟灰缸', 'null', '2019-07-24 21:38:08');
INSERT INTO `keyword_result` VALUES (1174, '花盆', '[{\"questionId\": 35, \"garbageName\": \"花盆\", \"garbageType\": 1}, {\"questionId\": 187, \"garbageName\": \"坏的花盆\", \"garbageType\": 1}]', '2019-07-24 21:41:15');
INSERT INTO `keyword_result` VALUES (1175, '狗尿垫', '[{\"questionId\": 9, \"garbageName\": \"狗尿垫\", \"garbageType\": 1}]', '2019-07-24 21:41:22');
INSERT INTO `keyword_result` VALUES (1176, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-24 21:41:32');
INSERT INTO `keyword_result` VALUES (1177, '尿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}, {\"questionId\": 9, \"garbageName\": \"狗尿垫\", \"garbageType\": 1}, {\"questionId\": 195, \"garbageName\": \"纸尿裤\", \"garbageType\": 1}, {\"questionId\": 637, \"garbageName\": \"尿布\", \"garbageType\": 1}]', '2019-07-24 21:41:53');
INSERT INTO `keyword_result` VALUES (1178, '鸡屎', '[]', '2019-07-24 21:42:13');
INSERT INTO `keyword_result` VALUES (1179, '天堂伞', '[{\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}]', '2019-07-24 21:45:51');
INSERT INTO `keyword_result` VALUES (1180, '桥梁', 'null', '2019-07-24 21:46:08');
INSERT INTO `keyword_result` VALUES (1181, '桥梁', '[]', '2019-07-24 21:46:10');
INSERT INTO `keyword_result` VALUES (1182, '条形码', 'null', '2019-07-24 21:46:27');
INSERT INTO `keyword_result` VALUES (1183, '午餐肉', '[{\"questionId\": 75, \"garbageName\": \"午餐肉\", \"garbageType\": 2}]', '2019-07-24 21:46:33');
INSERT INTO `keyword_result` VALUES (1184, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}]', '2019-07-24 22:10:04');
INSERT INTO `keyword_result` VALUES (1185, '那个', '[]', '2019-07-24 22:13:48');
INSERT INTO `keyword_result` VALUES (1186, '红豆', '[{\"questionId\": 63, \"garbageName\": \"红豆\", \"garbageType\": 2}]', '2019-07-24 22:17:18');
INSERT INTO `keyword_result` VALUES (1187, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2019-07-24 22:19:26');
INSERT INTO `keyword_result` VALUES (1188, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2019-07-24 22:19:29');
INSERT INTO `keyword_result` VALUES (1189, '猪头', '[]', '2019-07-24 22:31:06');
INSERT INTO `keyword_result` VALUES (1190, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-07-24 22:31:10');
INSERT INTO `keyword_result` VALUES (1191, '猪', '[{\"questionId\": 67, \"garbageName\": \"猪肉\", \"garbageType\": 2}, {\"questionId\": 73, \"garbageName\": \"猪肝\", \"garbageType\": 2}]', '2019-07-24 22:31:20');
INSERT INTO `keyword_result` VALUES (1192, '猪', '[{\"questionId\": 67, \"garbageName\": \"猪肉\", \"garbageType\": 2}, {\"questionId\": 73, \"garbageName\": \"猪肝\", \"garbageType\": 2}]', '2019-07-24 22:31:22');
INSERT INTO `keyword_result` VALUES (1193, '猪肉', '[{\"questionId\": 67, \"garbageName\": \"猪肉\", \"garbageType\": 2}]', '2019-07-24 22:31:23');
INSERT INTO `keyword_result` VALUES (1194, '服装', 'null', '2019-07-24 22:31:41');
INSERT INTO `keyword_result` VALUES (1195, '服装', '[]', '2019-07-24 22:31:56');
INSERT INTO `keyword_result` VALUES (1196, '脚', 'null', '2019-07-24 22:32:26');
INSERT INTO `keyword_result` VALUES (1197, '脚', '[]', '2019-07-24 22:32:29');
INSERT INTO `keyword_result` VALUES (1198, '甜品', 'null', '2019-07-24 22:35:40');
INSERT INTO `keyword_result` VALUES (1199, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-07-24 22:35:44');
INSERT INTO `keyword_result` VALUES (1200, '甜品', '[]', '2019-07-24 22:35:49');
INSERT INTO `keyword_result` VALUES (1201, '饮料/饮品', 'null', '2019-07-24 22:35:56');
INSERT INTO `keyword_result` VALUES (1202, '王八蛋', '[]', '2019-07-24 22:38:25');
INSERT INTO `keyword_result` VALUES (1203, '烟蒂', '[{\"questionId\": 11, \"garbageName\": \"烟蒂\", \"garbageType\": 1}]', '2019-07-24 22:41:11');
INSERT INTO `keyword_result` VALUES (1204, '胶带', '[{\"questionId\": 34, \"garbageName\": \"胶带\", \"garbageType\": 1}]', '2019-07-24 22:41:24');
INSERT INTO `keyword_result` VALUES (1205, '避孕套', '[{\"questionId\": 607, \"garbageName\": \"避孕套\", \"garbageType\": 1}]', '2019-07-24 22:46:34');
INSERT INTO `keyword_result` VALUES (1206, '开发的谁开发的？嗯嗯啊，谁开发的？我不认他们开发的语音还语音识别纸', '[]', '2019-07-24 22:50:06');
INSERT INTO `keyword_result` VALUES (1207, '竹篮', '[{\"questionId\": 41, \"garbageName\": \"竹篮\", \"garbageType\": 1}]', '2019-07-24 22:50:21');
INSERT INTO `keyword_result` VALUES (1208, '至', '[]', '2019-07-24 22:50:24');
INSERT INTO `keyword_result` VALUES (1209, '植物', '[{\"questionId\": 122, \"garbageName\": \"家养植物\", \"garbageType\": 2}]', '2019-07-24 22:50:35');
INSERT INTO `keyword_result` VALUES (1210, '卫生纸', '[{\"questionId\": 180, \"garbageName\": \"卫生纸\", \"garbageType\": 1}]', '2019-07-24 22:50:46');
INSERT INTO `keyword_result` VALUES (1211, '猫砂', '[{\"questionId\": 8, \"garbageName\": \"猫砂\", \"garbageType\": 1}]', '2019-07-24 22:58:05');
INSERT INTO `keyword_result` VALUES (1212, '榴莲壳', '[{\"questionId\": 21, \"garbageName\": \"榴莲壳\", \"garbageType\": 1}]', '2019-07-24 23:04:39');
INSERT INTO `keyword_result` VALUES (1213, '手提袋', '[]', '2019-07-24 23:05:02');
INSERT INTO `keyword_result` VALUES (1214, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-24 23:05:06');
INSERT INTO `keyword_result` VALUES (1215, '防碎气泡膜', '[{\"questionId\": 16, \"garbageName\": \"防碎气泡膜\", \"garbageType\": 1}]', '2019-07-24 23:11:27');
INSERT INTO `keyword_result` VALUES (1216, '镜子', '[{\"questionId\": 39, \"garbageName\": \"镜子\", \"garbageType\": 1}, {\"questionId\": 339, \"garbageName\": \"旧镜子\", \"garbageType\": 3}]', '2019-07-24 23:11:58');
INSERT INTO `keyword_result` VALUES (1217, '剩饭残渣', '[{\"questionId\": 2, \"garbageName\": \"剩饭残渣\", \"garbageType\": 2}]', '2019-07-24 23:20:01');
INSERT INTO `keyword_result` VALUES (1218, '剩饭残渣', '[{\"questionId\": 2, \"garbageName\": \"剩饭残渣\", \"garbageType\": 2}]', '2019-07-24 23:20:09');
INSERT INTO `keyword_result` VALUES (1219, '橡皮泥', '[{\"questionId\": 31, \"garbageName\": \"橡皮泥\", \"garbageType\": 1}]', '2019-07-24 23:36:12');
INSERT INTO `keyword_result` VALUES (1220, '毛笔', '[{\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}]', '2019-07-24 23:37:55');
INSERT INTO `keyword_result` VALUES (1221, '那个就是', '[]', '2019-07-24 23:38:20');
INSERT INTO `keyword_result` VALUES (1222, '我不会', '[]', '2019-07-24 23:38:30');
INSERT INTO `keyword_result` VALUES (1223, '我不会', '[]', '2019-07-24 23:38:33');
INSERT INTO `keyword_result` VALUES (1224, '编织袋', '[{\"questionId\": 15, \"garbageName\": \"编织袋\", \"garbageType\": 1}]', '2019-07-24 23:53:35');
INSERT INTO `keyword_result` VALUES (1225, '', '[]', '2019-07-24 23:54:00');
INSERT INTO `keyword_result` VALUES (1226, '猫砂', '[{\"questionId\": 8, \"garbageName\": \"猫砂\", \"garbageType\": 1}]', '2019-07-24 23:54:11');
INSERT INTO `keyword_result` VALUES (1227, '面', '[{\"questionId\": 58, \"garbageName\": \"面\", \"garbageType\": 2}, {\"questionId\": 59, \"garbageName\": \"面包\", \"garbageType\": 2}, {\"questionId\": 60, \"garbageName\": \"面条\", \"garbageType\": 2}, {\"questionId\": 107, \"garbageName\": \"面粉\", \"garbageType\": 2}, {\"questionId\": 146, \"garbageName\": \"方便面盒\", \"garbageType\": 1}, {\"questionId\": 610, \"garbageName\": \"面膜\", \"garbageType\": 1}]', '2019-07-24 23:54:59');
INSERT INTO `keyword_result` VALUES (1228, '毛巾', '[{\"questionId\": 36, \"garbageName\": \"毛巾\", \"garbageType\": 1}]', '2019-07-24 23:55:06');
INSERT INTO `keyword_result` VALUES (1229, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-25 00:18:48');
INSERT INTO `keyword_result` VALUES (1230, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-25 00:18:50');
INSERT INTO `keyword_result` VALUES (1231, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-25 00:18:50');
INSERT INTO `keyword_result` VALUES (1232, '灰土', '[{\"questionId\": 29, \"garbageName\": \"灰土\", \"garbageType\": 1}]', '2019-07-25 00:18:51');
INSERT INTO `keyword_result` VALUES (1233, '硬果壳', '[{\"questionId\": 19, \"garbageName\": \"硬果壳\", \"garbageType\": 1}]', '2019-07-25 00:19:07');
INSERT INTO `keyword_result` VALUES (1234, '镜子', '[{\"questionId\": 39, \"garbageName\": \"镜子\", \"garbageType\": 1}, {\"questionId\": 339, \"garbageName\": \"旧镜子\", \"garbageType\": 3}]', '2019-07-25 00:19:52');
INSERT INTO `keyword_result` VALUES (1235, '西瓜', 'null', '2019-07-25 00:20:34');
INSERT INTO `keyword_result` VALUES (1236, '纸箱', 'null', '2019-07-25 00:21:04');
INSERT INTO `keyword_result` VALUES (1237, 'Hello', '[]', '2019-07-25 00:27:58');
INSERT INTO `keyword_result` VALUES (1238, '塑料袋', '[{\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}, {\"questionId\": 603, \"garbageName\": \"塑料袋\", \"garbageType\": 1}, {\"questionId\": 647, \"garbageName\": \"肮脏塑料袋\", \"garbageType\": 1}]', '2019-07-25 00:28:08');
INSERT INTO `keyword_result` VALUES (1239, '虾头', '[{\"questionId\": 81, \"garbageName\": \"虾头\", \"garbageType\": 2}, {\"questionId\": 594, \"garbageName\": \"小龙虾头\", \"garbageType\": 2}]', '2019-07-25 00:28:26');
INSERT INTO `keyword_result` VALUES (1240, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-25 00:28:31');
INSERT INTO `keyword_result` VALUES (1241, '灰土', '[{\"questionId\": 29, \"garbageName\": \"灰土\", \"garbageType\": 1}]', '2019-07-25 00:32:20');
INSERT INTO `keyword_result` VALUES (1242, '键盘', 'null', '2019-07-25 00:42:30');
INSERT INTO `keyword_result` VALUES (1243, '尿不湿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}]', '2019-07-25 00:47:24');
INSERT INTO `keyword_result` VALUES (1244, '尿不湿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}]', '2019-07-25 00:47:43');
INSERT INTO `keyword_result` VALUES (1245, '尿不湿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}]', '2019-07-25 00:47:48');
INSERT INTO `keyword_result` VALUES (1246, '我', '[]', '2019-07-25 00:57:16');
INSERT INTO `keyword_result` VALUES (1247, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-25 00:57:19');
INSERT INTO `keyword_result` VALUES (1248, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-25 00:57:28');
INSERT INTO `keyword_result` VALUES (1249, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-25 00:57:30');
INSERT INTO `keyword_result` VALUES (1250, '橡皮泥', '[{\"questionId\": 31, \"garbageName\": \"橡皮泥\", \"garbageType\": 1}]', '2019-07-25 01:03:50');
INSERT INTO `keyword_result` VALUES (1251, '笔', '[{\"questionId\": 48, \"garbageName\": \"笔\", \"garbageType\": 1}, {\"questionId\": 49, \"garbageName\": \"铅笔\", \"garbageType\": 1}, {\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}, {\"questionId\": 129, \"garbageName\": \"笔盖\", \"garbageType\": 1}, {\"questionId\": 137, \"garbageName\": \"钢笔\", \"garbageType\": 1}, {\"questionId\": 145, \"garbageName\": \"圆珠笔\", \"garbageType\": 1}, {\"questionId\": 388, \"garbageName\": \"水彩笔\", \"garbageType\": 4}, {\"questionId\": 653, \"garbageName\": \"笔芯\", \"garbageType\": 1}]', '2019-07-25 01:05:53');
INSERT INTO `keyword_result` VALUES (1252, '天空', 'null', '2019-07-25 01:08:46');
INSERT INTO `keyword_result` VALUES (1253, '交通信号灯', '[]', '2019-07-25 01:09:10');
INSERT INTO `keyword_result` VALUES (1254, '笔', '[{\"questionId\": 48, \"garbageName\": \"笔\", \"garbageType\": 1}, {\"questionId\": 49, \"garbageName\": \"铅笔\", \"garbageType\": 1}, {\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}, {\"questionId\": 129, \"garbageName\": \"笔盖\", \"garbageType\": 1}, {\"questionId\": 137, \"garbageName\": \"钢笔\", \"garbageType\": 1}, {\"questionId\": 145, \"garbageName\": \"圆珠笔\", \"garbageType\": 1}, {\"questionId\": 388, \"garbageName\": \"水彩笔\", \"garbageType\": 4}, {\"questionId\": 653, \"garbageName\": \"笔芯\", \"garbageType\": 1}]', '2019-07-25 07:41:04');
INSERT INTO `keyword_result` VALUES (1255, '用过的面膜', '[]', '2019-07-25 07:41:16');
INSERT INTO `keyword_result` VALUES (1256, '面膜', '[{\"questionId\": 610, \"garbageName\": \"面膜\", \"garbageType\": 1}]', '2019-07-25 07:41:21');
INSERT INTO `keyword_result` VALUES (1257, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-07-25 08:05:37');
INSERT INTO `keyword_result` VALUES (1258, '塔扇', 'null', '2019-07-25 08:10:05');
INSERT INTO `keyword_result` VALUES (1259, '塔扇', '[]', '2019-07-25 08:10:11');
INSERT INTO `keyword_result` VALUES (1260, '奶茶', '[{\"remark\": \"喝完好喝的奶茶，记得把奶茶杯放进干垃圾桶哟\", \"questionId\": 427, \"garbageName\": \"奶茶杯\", \"garbageType\": 1}]', '2019-07-25 08:10:24');
INSERT INTO `keyword_result` VALUES (1261, '拖鞋', 'null', '2019-07-25 08:10:31');
INSERT INTO `keyword_result` VALUES (1262, '拖鞋', '[]', '2019-07-25 08:10:33');
INSERT INTO `keyword_result` VALUES (1263, '湿纸巾', '[{\"questionId\": 620, \"garbageName\": \"湿纸巾\", \"garbageType\": 1}]', '2019-07-25 08:10:43');
INSERT INTO `keyword_result` VALUES (1264, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-25 08:10:55');
INSERT INTO `keyword_result` VALUES (1265, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-25 08:11:03');
INSERT INTO `keyword_result` VALUES (1266, '红豆', '[{\"questionId\": 63, \"garbageName\": \"红豆\", \"garbageType\": 2}]', '2019-07-25 08:11:10');
INSERT INTO `keyword_result` VALUES (1267, '眼镜', '[{\"questionId\": 51, \"garbageName\": \"眼镜\", \"garbageType\": 1}, {\"questionId\": 126, \"garbageName\": \"3D眼镜\", \"garbageType\": 1}]', '2019-07-25 08:35:55');
INSERT INTO `keyword_result` VALUES (1268, '山竹皮', '[]', '2019-07-25 08:37:45');
INSERT INTO `keyword_result` VALUES (1269, '山竹皮', '[]', '2019-07-25 08:37:49');
INSERT INTO `keyword_result` VALUES (1270, '山竹皮', '[]', '2019-07-25 08:37:53');
INSERT INTO `keyword_result` VALUES (1271, '鸡蛋', '[{\"questionId\": 70, \"garbageName\": \"鸡蛋\", \"garbageType\": 2}, {\"questionId\": 242, \"garbageName\": \"鸡蛋及蛋壳\", \"garbageType\": 2}, {\"questionId\": 424, \"garbageName\": \"鸡蛋壳\", \"garbageType\": 2}]', '2019-07-25 08:45:12');
INSERT INTO `keyword_result` VALUES (1272, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-07-25 08:45:20');
INSERT INTO `keyword_result` VALUES (1273, '人脸', 'null', '2019-07-25 09:10:04');
INSERT INTO `keyword_result` VALUES (1274, '镜子', '[{\"questionId\": 39, \"garbageName\": \"镜子\", \"garbageType\": 1}, {\"questionId\": 339, \"garbageName\": \"旧镜子\", \"garbageType\": 3}]', '2019-07-25 09:10:43');
INSERT INTO `keyword_result` VALUES (1275, '胶带', '[{\"questionId\": 34, \"garbageName\": \"胶带\", \"garbageType\": 1}]', '2019-07-25 09:10:59');
INSERT INTO `keyword_result` VALUES (1276, '伞', '[{\"questionId\": 45, \"garbageName\": \"伞\", \"garbageType\": 1}, {\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-07-25 09:11:02');
INSERT INTO `keyword_result` VALUES (1277, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-07-25 09:11:04');
INSERT INTO `keyword_result` VALUES (1278, '尿不湿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}]', '2019-07-25 09:11:05');
INSERT INTO `keyword_result` VALUES (1279, '硬果壳', '[{\"questionId\": 19, \"garbageName\": \"硬果壳\", \"garbageType\": 1}]', '2019-07-25 09:11:24');
INSERT INTO `keyword_result` VALUES (1280, '雨伞', '[{\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-07-25 09:11:26');
INSERT INTO `keyword_result` VALUES (1281, '硬果壳', '[{\"questionId\": 19, \"garbageName\": \"硬果壳\", \"garbageType\": 1}]', '2019-07-25 09:11:28');
INSERT INTO `keyword_result` VALUES (1282, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2019-07-25 09:11:30');
INSERT INTO `keyword_result` VALUES (1283, '秋葵', 'null', '2019-07-25 09:13:31');
INSERT INTO `keyword_result` VALUES (1284, '秋葵', '[]', '2019-07-25 09:13:38');
INSERT INTO `keyword_result` VALUES (1285, '椰子壳', '[{\"questionId\": 20, \"garbageName\": \"椰子壳\", \"garbageType\": 1}]', '2019-07-25 09:13:50');
INSERT INTO `keyword_result` VALUES (1286, '花盆', '[{\"questionId\": 35, \"garbageName\": \"花盆\", \"garbageType\": 1}, {\"questionId\": 187, \"garbageName\": \"坏的花盆\", \"garbageType\": 1}]', '2019-07-25 09:13:52');
INSERT INTO `keyword_result` VALUES (1287, '卫生间用纸', '[{\"questionId\": 6, \"garbageName\": \"卫生间用纸\", \"garbageType\": 1}]', '2019-07-25 09:14:07');
INSERT INTO `keyword_result` VALUES (1288, '报警仪', '[]', '2019-07-25 09:14:22');
INSERT INTO `keyword_result` VALUES (1289, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-07-25 09:14:28');
INSERT INTO `keyword_result` VALUES (1290, '鞋子', 'null', '2019-07-25 09:14:53');
INSERT INTO `keyword_result` VALUES (1291, '你好', '[]', '2019-07-25 09:18:25');
INSERT INTO `keyword_result` VALUES (1292, '你好', '[]', '2019-07-25 09:18:29');
INSERT INTO `keyword_result` VALUES (1293, '毛巾', '[{\"questionId\": 36, \"garbageName\": \"毛巾\", \"garbageType\": 1}]', '2019-07-25 09:20:16');
INSERT INTO `keyword_result` VALUES (1294, '女朋友', '[{\"remark\": \"ta 生气的时候朵小花哄哄试试，说不定能给你一个大大的拥抱\", \"questionId\": 422, \"garbageName\": \"女朋友\", \"garbageType\": 3}]', '2019-07-25 09:44:10');
INSERT INTO `keyword_result` VALUES (1295, '烟蒂', '[{\"questionId\": 11, \"garbageName\": \"烟蒂\", \"garbageType\": 1}]', '2019-07-25 09:44:36');
INSERT INTO `keyword_result` VALUES (1296, '牙签', '[{\"questionId\": 43, \"garbageName\": \"牙签\", \"garbageType\": 1}]', '2019-07-25 09:44:44');
INSERT INTO `keyword_result` VALUES (1297, '抽纸', 'null', '2019-07-25 09:52:27');
INSERT INTO `keyword_result` VALUES (1298, '抽纸', '[]', '2019-07-25 09:52:41');
INSERT INTO `keyword_result` VALUES (1299, '猫砂', '[{\"questionId\": 8, \"garbageName\": \"猫砂\", \"garbageType\": 1}]', '2019-07-25 09:53:14');
INSERT INTO `keyword_result` VALUES (1300, '硬果壳', '[{\"questionId\": 19, \"garbageName\": \"硬果壳\", \"garbageType\": 1}]', '2019-07-25 10:04:36');
INSERT INTO `keyword_result` VALUES (1301, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}]', '2019-07-25 10:05:45');
INSERT INTO `keyword_result` VALUES (1302, '瓜皮', '[{\"questionId\": 115, \"garbageName\": \"西瓜皮\", \"garbageType\": 2}]', '2019-07-25 10:06:05');
INSERT INTO `keyword_result` VALUES (1303, '瓜皮', '[{\"questionId\": 115, \"garbageName\": \"西瓜皮\", \"garbageType\": 2}]', '2019-07-25 10:06:08');
INSERT INTO `keyword_result` VALUES (1304, '瓜皮', '[{\"questionId\": 115, \"garbageName\": \"西瓜皮\", \"garbageType\": 2}]', '2019-07-25 10:06:10');
INSERT INTO `keyword_result` VALUES (1305, '西瓜皮', '[{\"questionId\": 115, \"garbageName\": \"西瓜皮\", \"garbageType\": 2}]', '2019-07-25 10:06:12');
INSERT INTO `keyword_result` VALUES (1306, '炸弹', '[]', '2019-07-25 10:07:02');
INSERT INTO `keyword_result` VALUES (1307, '避孕套', '[{\"questionId\": 607, \"garbageName\": \"避孕套\", \"garbageType\": 1}]', '2019-07-25 10:07:16');
INSERT INTO `keyword_result` VALUES (1308, '车轱辘', '[]', '2019-07-25 10:07:47');
INSERT INTO `keyword_result` VALUES (1309, '车轮', '[]', '2019-07-25 10:07:55');
INSERT INTO `keyword_result` VALUES (1310, '硬纸板', '[]', '2019-07-25 10:08:06');
INSERT INTO `keyword_result` VALUES (1311, '屏幕截图', 'null', '2019-07-25 10:09:47');
INSERT INTO `keyword_result` VALUES (1312, '小米', '[]', '2019-07-25 10:10:18');
INSERT INTO `keyword_result` VALUES (1313, '屏幕截图', 'null', '2019-07-25 10:10:55');
INSERT INTO `keyword_result` VALUES (1314, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-07-25 10:13:36');
INSERT INTO `keyword_result` VALUES (1315, '包', 'null', '2019-07-25 10:14:13');
INSERT INTO `keyword_result` VALUES (1316, '健康监测', 'null', '2019-07-25 10:14:39');
INSERT INTO `keyword_result` VALUES (1317, '智能家居', '[]', '2019-07-25 10:14:47');
INSERT INTO `keyword_result` VALUES (1318, '胶带', '[{\"questionId\": 34, \"garbageName\": \"胶带\", \"garbageType\": 1}]', '2019-07-25 10:17:00');
INSERT INTO `keyword_result` VALUES (1319, '图画', 'null', '2019-07-25 10:26:22');
INSERT INTO `keyword_result` VALUES (1320, '键盘', 'null', '2019-07-25 10:28:55');
INSERT INTO `keyword_result` VALUES (1321, '女朋友', '[{\"remark\": \"ta 生气的时候朵小花哄哄试试，说不定能给你一个大大的拥抱\", \"questionId\": 422, \"garbageName\": \"女朋友\", \"garbageType\": 3}]', '2019-07-25 10:30:04');
INSERT INTO `keyword_result` VALUES (1322, '米饭', '[{\"questionId\": 57, \"garbageName\": \"米饭\", \"garbageType\": 2}]', '2019-07-25 10:57:30');
INSERT INTO `keyword_result` VALUES (1323, '烧录卡', 'null', '2019-07-25 10:58:07');
INSERT INTO `keyword_result` VALUES (1324, '烧录卡', '[]', '2019-07-25 10:58:18');
INSERT INTO `keyword_result` VALUES (1325, '抽纸', 'null', '2019-07-25 11:23:59');
INSERT INTO `keyword_result` VALUES (1326, '抽纸', '[]', '2019-07-25 11:24:05');
INSERT INTO `keyword_result` VALUES (1327, '炉渣', '[{\"questionId\": 30, \"garbageName\": \"炉渣\", \"garbageType\": 1}]', '2019-07-25 11:24:45');
INSERT INTO `keyword_result` VALUES (1328, '草莓', 'null', '2019-07-25 11:25:23');
INSERT INTO `keyword_result` VALUES (1329, '烟蒂', '[{\"questionId\": 11, \"garbageName\": \"烟蒂\", \"garbageType\": 1}]', '2019-07-25 11:36:06');
INSERT INTO `keyword_result` VALUES (1330, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2019-07-25 11:36:29');
INSERT INTO `keyword_result` VALUES (1331, '笔', '[{\"questionId\": 48, \"garbageName\": \"笔\", \"garbageType\": 1}, {\"questionId\": 49, \"garbageName\": \"铅笔\", \"garbageType\": 1}, {\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}, {\"questionId\": 129, \"garbageName\": \"笔盖\", \"garbageType\": 1}, {\"questionId\": 137, \"garbageName\": \"钢笔\", \"garbageType\": 1}, {\"questionId\": 145, \"garbageName\": \"圆珠笔\", \"garbageType\": 1}, {\"questionId\": 388, \"garbageName\": \"水彩笔\", \"garbageType\": 4}, {\"questionId\": 653, \"garbageName\": \"笔芯\", \"garbageType\": 1}]', '2019-07-25 12:27:48');
INSERT INTO `keyword_result` VALUES (1332, '太空沙', '[{\"questionId\": 32, \"garbageName\": \"太空沙\", \"garbageType\": 1}]', '2019-07-25 12:37:33');
INSERT INTO `keyword_result` VALUES (1333, '太空沙', '[{\"questionId\": 32, \"garbageName\": \"太空沙\", \"garbageType\": 1}]', '2019-07-25 12:37:41');
INSERT INTO `keyword_result` VALUES (1334, '苹果皮', '[{\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}]', '2019-07-25 12:42:24');
INSERT INTO `keyword_result` VALUES (1335, '纸巾', 'null', '2019-07-25 12:46:05');
INSERT INTO `keyword_result` VALUES (1336, '纸巾', '[{\"remark\": \"纸巾不要乱丢呀，会污染环境\", \"analysis\": \"\", \"questionId\": 1, \"garbageName\": \"纸巾\", \"garbageType\": 1}, {\"questionId\": 620, \"garbageName\": \"湿纸巾\", \"garbageType\": 1}]', '2019-07-25 12:46:10');
INSERT INTO `keyword_result` VALUES (1337, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-25 12:46:33');
INSERT INTO `keyword_result` VALUES (1338, '食物', 'null', '2019-07-25 12:48:43');
INSERT INTO `keyword_result` VALUES (1339, '王松烨', '[]', '2019-07-25 12:53:29');
INSERT INTO `keyword_result` VALUES (1340, '李亭立', '[]', '2019-07-25 12:53:38');
INSERT INTO `keyword_result` VALUES (1341, '方便面', '[{\"questionId\": 146, \"garbageName\": \"方便面盒\", \"garbageType\": 1}]', '2019-07-25 12:53:48');
INSERT INTO `keyword_result` VALUES (1342, '方便面', '[{\"questionId\": 146, \"garbageName\": \"方便面盒\", \"garbageType\": 1}]', '2019-07-25 12:53:52');
INSERT INTO `keyword_result` VALUES (1343, '酸菜鱼', '[]', '2019-07-25 12:53:56');
INSERT INTO `keyword_result` VALUES (1344, '酸菜鱼', '[]', '2019-07-25 12:53:59');
INSERT INTO `keyword_result` VALUES (1345, '生饭', '[]', '2019-07-25 12:54:07');
INSERT INTO `keyword_result` VALUES (1346, '生米饭', '[]', '2019-07-25 12:54:17');
INSERT INTO `keyword_result` VALUES (1347, '塑料袋', '[{\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}, {\"questionId\": 603, \"garbageName\": \"塑料袋\", \"garbageType\": 1}, {\"questionId\": 647, \"garbageName\": \"肮脏塑料袋\", \"garbageType\": 1}]', '2019-07-25 12:54:22');
INSERT INTO `keyword_result` VALUES (1348, '开心果', '[{\"questionId\": 55, \"garbageName\": \"开心果\", \"garbageType\": 1}, {\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-07-25 12:54:50');
INSERT INTO `keyword_result` VALUES (1349, '水果', 'null', '2019-07-25 13:22:29');
INSERT INTO `keyword_result` VALUES (1350, '绿葡萄', '[]', '2019-07-25 13:22:34');
INSERT INTO `keyword_result` VALUES (1351, '榴莲壳', '[{\"questionId\": 21, \"garbageName\": \"榴莲壳\", \"garbageType\": 1}]', '2019-07-25 13:53:39');
INSERT INTO `keyword_result` VALUES (1352, '竹筷', '[{\"questionId\": 42, \"garbageName\": \"竹筷\", \"garbageType\": 1}]', '2019-07-25 13:59:44');
INSERT INTO `keyword_result` VALUES (1353, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-07-25 14:11:01');
INSERT INTO `keyword_result` VALUES (1354, '数据线', '[{\"questionId\": 461, \"garbageName\": \"数据线\", \"garbageType\": 3}]', '2019-07-25 14:11:12');
INSERT INTO `keyword_result` VALUES (1355, '笔记本电脑', 'null', '2019-07-25 14:12:14');
INSERT INTO `keyword_result` VALUES (1356, '打火机', '[{\"remark\": \"干垃圾哟\", \"questionId\": 52, \"garbageName\": \"打火机\", \"garbageType\": 1}]', '2019-07-25 14:32:10');
INSERT INTO `keyword_result` VALUES (1357, '打火机', '[{\"remark\": \"干垃圾哟\", \"questionId\": 52, \"garbageName\": \"打火机\", \"garbageType\": 1}]', '2019-07-25 14:32:25');
INSERT INTO `keyword_result` VALUES (1358, '杯子', 'null', '2019-07-25 14:32:49');
INSERT INTO `keyword_result` VALUES (1359, '杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}, {\"questionId\": 183, \"garbageName\": \"杯子\", \"garbageType\": 1}]', '2019-07-25 14:33:01');
INSERT INTO `keyword_result` VALUES (1360, '包装袋/盒', 'null', '2019-07-25 14:33:20');
INSERT INTO `keyword_result` VALUES (1361, '抽纸', '[]', '2019-07-25 14:33:24');
INSERT INTO `keyword_result` VALUES (1362, '天堂伞', '[{\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}]', '2019-07-25 14:37:52');
INSERT INTO `keyword_result` VALUES (1363, '大毛笔', '[]', '2019-07-25 14:38:01');
INSERT INTO `keyword_result` VALUES (1364, '毛笔', '[{\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}]', '2019-07-25 14:38:08');
INSERT INTO `keyword_result` VALUES (1365, '眼镜', '[{\"questionId\": 51, \"garbageName\": \"眼镜\", \"garbageType\": 1}, {\"questionId\": 126, \"garbageName\": \"3D眼镜\", \"garbageType\": 1}, {\"questionId\": 665, \"garbageName\": \"黑框眼镜\", \"garbageType\": 1}, {\"questionId\": 666, \"garbageName\": \"隐形眼镜\", \"garbageType\": 1}]', '2019-07-25 14:38:23');
INSERT INTO `keyword_result` VALUES (1366, '硬茶叶', '[]', '2019-07-25 14:38:40');
INSERT INTO `keyword_result` VALUES (1367, '茶叶', '[{\"questionId\": 98, \"garbageName\": \"茶叶\", \"garbageType\": 2}, {\"questionId\": 600, \"garbageName\": \"茶叶渣\", \"garbageType\": 2}, {\"questionId\": 656, \"garbageName\": \"茶叶包\", \"garbageType\": 1}]', '2019-07-25 14:38:46');
INSERT INTO `keyword_result` VALUES (1368, '狗粮', '[{\"questionId\": 110, \"garbageName\": \"狗粮\", \"garbageType\": 2}]', '2019-07-25 14:38:59');
INSERT INTO `keyword_result` VALUES (1369, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-07-25 14:47:34');
INSERT INTO `keyword_result` VALUES (1370, '螺蛳粉', '[]', '2019-07-25 14:48:02');
INSERT INTO `keyword_result` VALUES (1371, '螺蛳粉外卖盒', '[]', '2019-07-25 14:48:25');
INSERT INTO `keyword_result` VALUES (1372, '打火机', 'null', '2019-07-25 14:52:35');
INSERT INTO `keyword_result` VALUES (1373, '打火机', '[{\"remark\": \"干垃圾哟\", \"questionId\": 52, \"garbageName\": \"打火机\", \"garbageType\": 1}]', '2019-07-25 14:52:46');
INSERT INTO `keyword_result` VALUES (1374, '杯子', 'null', '2019-07-25 14:53:27');
INSERT INTO `keyword_result` VALUES (1375, '玻璃杯', '[{\"questionId\": 287, \"garbageName\": \"玻璃杯\", \"garbageType\": 3}]', '2019-07-25 14:53:34');
INSERT INTO `keyword_result` VALUES (1376, '邓添元', '[]', '2019-07-25 14:57:10');
INSERT INTO `keyword_result` VALUES (1377, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}]', '2019-07-25 14:57:14');
INSERT INTO `keyword_result` VALUES (1378, '狗尿垫', '[{\"questionId\": 9, \"garbageName\": \"狗尿垫\", \"garbageType\": 1}]', '2019-07-25 14:58:42');
INSERT INTO `keyword_result` VALUES (1379, '榴莲核', '[{\"questionId\": 25, \"garbageName\": \"榴莲核\", \"garbageType\": 1}]', '2019-07-25 14:59:20');
INSERT INTO `keyword_result` VALUES (1380, '笔记本', '[]', '2019-07-25 14:59:42');
INSERT INTO `keyword_result` VALUES (1381, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}]', '2019-07-25 15:01:55');
INSERT INTO `keyword_result` VALUES (1382, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-07-25 15:02:00');
INSERT INTO `keyword_result` VALUES (1383, '榴莲核', '[{\"questionId\": 25, \"garbageName\": \"榴莲核\", \"garbageType\": 1}]', '2019-07-25 15:02:02');
INSERT INTO `keyword_result` VALUES (1384, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-07-25 15:02:04');
INSERT INTO `keyword_result` VALUES (1385, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-07-25 15:02:07');
INSERT INTO `keyword_result` VALUES (1386, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-25 15:02:11');
INSERT INTO `keyword_result` VALUES (1387, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-25 15:02:13');
INSERT INTO `keyword_result` VALUES (1388, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-25 15:02:15');
INSERT INTO `keyword_result` VALUES (1389, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-25 15:02:16');
INSERT INTO `keyword_result` VALUES (1390, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-25 15:02:17');
INSERT INTO `keyword_result` VALUES (1391, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-25 15:02:23');
INSERT INTO `keyword_result` VALUES (1392, '卫生间用纸', '[{\"questionId\": 6, \"garbageName\": \"卫生间用纸\", \"garbageType\": 1}]', '2019-07-25 15:03:06');
INSERT INTO `keyword_result` VALUES (1393, '陶瓷/马克杯', 'null', '2019-07-25 15:03:39');
INSERT INTO `keyword_result` VALUES (1394, '笔', '[{\"questionId\": 48, \"garbageName\": \"笔\", \"garbageType\": 1}, {\"questionId\": 49, \"garbageName\": \"铅笔\", \"garbageType\": 1}, {\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}, {\"questionId\": 129, \"garbageName\": \"笔盖\", \"garbageType\": 1}, {\"questionId\": 137, \"garbageName\": \"钢笔\", \"garbageType\": 1}, {\"questionId\": 145, \"garbageName\": \"圆珠笔\", \"garbageType\": 1}, {\"questionId\": 388, \"garbageName\": \"水彩笔\", \"garbageType\": 4}, {\"questionId\": 653, \"garbageName\": \"笔芯\", \"garbageType\": 1}]', '2019-07-25 15:04:05');
INSERT INTO `keyword_result` VALUES (1395, '太空沙', '[{\"questionId\": 32, \"garbageName\": \"太空沙\", \"garbageType\": 1}]', '2019-07-25 15:10:40');
INSERT INTO `keyword_result` VALUES (1396, '太空沙', '[{\"questionId\": 32, \"garbageName\": \"太空沙\", \"garbageType\": 1}]', '2019-07-25 15:11:20');
INSERT INTO `keyword_result` VALUES (1397, '眼镜', 'null', '2019-07-25 15:11:50');
INSERT INTO `keyword_result` VALUES (1398, '男孩', '[]', '2019-07-25 15:11:59');
INSERT INTO `keyword_result` VALUES (1399, '手表', 'null', '2019-07-25 15:12:19');
INSERT INTO `keyword_result` VALUES (1400, '指甲刀', '[]', '2019-07-25 15:12:25');
INSERT INTO `keyword_result` VALUES (1401, '米', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}, {\"questionId\": 56, \"garbageName\": \"米\", \"garbageType\": 2}, {\"questionId\": 57, \"garbageName\": \"米饭\", \"garbageType\": 2}, {\"questionId\": 217, \"garbageName\": \"玉米\", \"garbageType\": 2}, {\"questionId\": 243, \"garbageName\": \"大米及豆类\", \"garbageType\": 2}, {\"questionId\": 554, \"garbageName\": \"玉米棒\", \"garbageType\": 2}, {\"questionId\": 562, \"garbageName\": \"熟玉米棒\", \"garbageType\": 2}, {\"questionId\": 573, \"garbageName\": \"玉米芯\", \"garbageType\": 2}, {\"questionId\": 627, \"garbageName\": \"玉米皮\", \"garbageType\": 1}, {\"questionId\": 634, \"garbageName\": \"玉米壳\", \"garbageType\": 1}]', '2019-07-25 15:12:31');
INSERT INTO `keyword_result` VALUES (1402, '玉米壳', '[{\"questionId\": 634, \"garbageName\": \"玉米壳\", \"garbageType\": 1}]', '2019-07-25 15:12:41');
INSERT INTO `keyword_result` VALUES (1403, '运动鞋', 'null', '2019-07-25 15:22:12');
INSERT INTO `keyword_result` VALUES (1404, '运动鞋', '[]', '2019-07-25 15:22:17');
INSERT INTO `keyword_result` VALUES (1405, '家装建材', 'null', '2019-07-25 15:22:36');
INSERT INTO `keyword_result` VALUES (1406, '鼠标', '[{\"questionId\": 426, \"garbageName\": \"鼠标\", \"garbageType\": 3}]', '2019-07-25 15:42:48');
INSERT INTO `keyword_result` VALUES (1407, '怡宝矿泉水', 'null', '2019-07-25 15:52:20');
INSERT INTO `keyword_result` VALUES (1408, '矿泉水-怡宝矿泉水', '[]', '2019-07-25 15:52:27');
INSERT INTO `keyword_result` VALUES (1409, '怡宝矿泉水', '[]', '2019-07-25 15:52:36');
INSERT INTO `keyword_result` VALUES (1410, '矿泉水瓶', '[{\"questionId\": 445, \"garbageName\": \"矿泉水瓶\", \"garbageType\": 3}]', '2019-07-25 15:52:48');
INSERT INTO `keyword_result` VALUES (1411, '鱼骨头', '[{\"questionId\": 569, \"garbageName\": \"鱼骨头\", \"garbageType\": 2}]', '2019-07-25 15:55:53');
INSERT INTO `keyword_result` VALUES (1412, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-25 16:30:42');
INSERT INTO `keyword_result` VALUES (1413, '键盘', 'null', '2019-07-25 16:35:21');
INSERT INTO `keyword_result` VALUES (1414, '笔', '[{\"questionId\": 48, \"garbageName\": \"笔\", \"garbageType\": 1}, {\"questionId\": 49, \"garbageName\": \"铅笔\", \"garbageType\": 1}, {\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}, {\"questionId\": 129, \"garbageName\": \"笔盖\", \"garbageType\": 1}, {\"questionId\": 137, \"garbageName\": \"钢笔\", \"garbageType\": 1}, {\"questionId\": 145, \"garbageName\": \"圆珠笔\", \"garbageType\": 1}, {\"questionId\": 388, \"garbageName\": \"水彩笔\", \"garbageType\": 4}, {\"questionId\": 653, \"garbageName\": \"笔芯\", \"garbageType\": 1}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 702, \"garbageName\": \"笔记本\", \"garbageType\": 3}, {\"questionId\": 734, \"garbageName\": \"记号笔\", \"garbageType\": 1}, {\"questionId\": 735, \"garbageName\": \"金属铅笔盒\", \"garbageType\": 3}, {\"questionId\": 737, \"garbageName\": \"蜡笔\", \"garbageType\": 1}, {\"questionId\": 738, \"garbageName\": \"坏钢笔\", \"garbageType\": 1}, {\"questionId\": 739, \"garbageName\": \"中性笔\", \"garbageType\": 1}, {\"questionId\": 740, \"garbageName\": \"眉笔\", \"garbageType\": 1}, {\"questionId\": 741, \"garbageName\": \"粉笔\", \"garbageType\": 1}, {\"questionId\": 742, \"garbageName\": \"彩笔\", \"garbageType\": 1}, {\"questionId\": 743, \"garbageName\": \"马克笔\", \"garbageType\": 1}, {\"questionId\": 744, \"garbageName\": \"笔杆\", \"garbageType\": 1}, {\"questionId\": 745, \"garbageName\": \"笔套\", \"garbageType\": 1}, {\"questionId\": 746, \"garbageName\": \"红笔\", \"garbageType\": 1}, {\"questionId\": 747, \"garbageName\": \"勾线笔\", \"garbageType\": 1}, {\"questionId\": 748, \"garbageName\": \"可擦复写笔\", \"garbageType\": 1}]', '2019-07-25 17:48:11');
INSERT INTO `keyword_result` VALUES (1415, '桃核', '[{\"questionId\": 553, \"garbageName\": \"桃核\", \"garbageType\": 2}]', '2019-07-25 17:49:29');
INSERT INTO `keyword_result` VALUES (1416, '晴天娃娃', 'null', '2019-07-25 17:52:55');
INSERT INTO `keyword_result` VALUES (1417, '扭扭车', '[]', '2019-07-25 17:53:03');
INSERT INTO `keyword_result` VALUES (1418, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-25 17:53:12');
INSERT INTO `keyword_result` VALUES (1419, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-25 17:53:14');
INSERT INTO `keyword_result` VALUES (1420, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-25 17:53:16');
INSERT INTO `keyword_result` VALUES (1421, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-25 17:53:20');
INSERT INTO `keyword_result` VALUES (1422, '米', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}, {\"questionId\": 56, \"garbageName\": \"米\", \"garbageType\": 2}, {\"questionId\": 57, \"garbageName\": \"米饭\", \"garbageType\": 2}, {\"questionId\": 217, \"garbageName\": \"玉米\", \"garbageType\": 2}, {\"questionId\": 243, \"garbageName\": \"大米及豆类\", \"garbageType\": 2}, {\"questionId\": 554, \"garbageName\": \"玉米棒\", \"garbageType\": 2}, {\"questionId\": 562, \"garbageName\": \"熟玉米棒\", \"garbageType\": 2}, {\"questionId\": 573, \"garbageName\": \"玉米芯\", \"garbageType\": 2}, {\"questionId\": 627, \"garbageName\": \"玉米皮\", \"garbageType\": 1}, {\"questionId\": 634, \"garbageName\": \"玉米壳\", \"garbageType\": 1}, {\"questionId\": 677, \"garbageName\": \"米线\", \"garbageType\": 2}, {\"questionId\": 808, \"garbageName\": \"米虫\", \"garbageType\": 2}]', '2019-07-25 17:53:23');
INSERT INTO `keyword_result` VALUES (1423, '虾壳', '[{\"questionId\": 83, \"garbageName\": \"虾壳\", \"garbageType\": 2}, {\"questionId\": 558, \"garbageName\": \"龙虾壳\", \"garbageType\": 2}, {\"questionId\": 564, \"garbageName\": \"小龙虾壳\", \"garbageType\": 2}]', '2019-07-25 17:53:53');
INSERT INTO `keyword_result` VALUES (1424, '开心果', '[{\"questionId\": 55, \"garbageName\": \"开心果\", \"garbageType\": 1}, {\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-07-25 17:54:03');
INSERT INTO `keyword_result` VALUES (1425, '背包', 'null', '2019-07-25 18:02:54');
INSERT INTO `keyword_result` VALUES (1426, '背包', '[]', '2019-07-25 18:03:01');
INSERT INTO `keyword_result` VALUES (1427, '竹篮', '[{\"questionId\": 41, \"garbageName\": \"竹篮\", \"garbageType\": 1}]', '2019-07-25 18:07:43');
INSERT INTO `keyword_result` VALUES (1428, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-07-25 18:53:37');
INSERT INTO `keyword_result` VALUES (1429, '容器', 'null', '2019-07-25 19:33:34');
INSERT INTO `keyword_result` VALUES (1430, '容器', '[]', '2019-07-25 19:33:52');
INSERT INTO `keyword_result` VALUES (1431, '玉米衣', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}]', '2019-07-25 19:34:15');
INSERT INTO `keyword_result` VALUES (1432, '粥盒', '[]', '2019-07-25 19:35:53');
INSERT INTO `keyword_result` VALUES (1433, '充电宝', '[{\"questionId\": 322, \"garbageName\": \"充电宝\", \"garbageType\": 3}]', '2019-07-25 19:36:21');
INSERT INTO `keyword_result` VALUES (1434, '大棒骨', '[]', '2019-07-25 19:37:19');
INSERT INTO `keyword_result` VALUES (1435, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-07-25 19:37:36');
INSERT INTO `keyword_result` VALUES (1436, '甘蔗皮', '[{\"questionId\": 24, \"garbageName\": \"甘蔗皮\", \"garbageType\": 1}]', '2019-07-25 20:39:14');
INSERT INTO `keyword_result` VALUES (1437, '人肉', '[]', '2019-07-25 20:39:25');
INSERT INTO `keyword_result` VALUES (1438, '米饭', '[{\"questionId\": 57, \"garbageName\": \"米饭\", \"garbageType\": 2}]', '2019-07-25 20:39:34');
INSERT INTO `keyword_result` VALUES (1439, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-07-25 20:39:45');
INSERT INTO `keyword_result` VALUES (1440, '鞋', 'null', '2019-07-25 21:15:48');
INSERT INTO `keyword_result` VALUES (1441, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:01');
INSERT INTO `keyword_result` VALUES (1442, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:05');
INSERT INTO `keyword_result` VALUES (1443, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:09');
INSERT INTO `keyword_result` VALUES (1444, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:11');
INSERT INTO `keyword_result` VALUES (1445, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:18');
INSERT INTO `keyword_result` VALUES (1446, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-25 21:16:20');
INSERT INTO `keyword_result` VALUES (1447, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:48');
INSERT INTO `keyword_result` VALUES (1448, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:49');
INSERT INTO `keyword_result` VALUES (1449, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:50');
INSERT INTO `keyword_result` VALUES (1450, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:51');
INSERT INTO `keyword_result` VALUES (1451, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:52');
INSERT INTO `keyword_result` VALUES (1452, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:52');
INSERT INTO `keyword_result` VALUES (1453, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:53');
INSERT INTO `keyword_result` VALUES (1454, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-25 21:16:53');
INSERT INTO `keyword_result` VALUES (1455, '电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}, {\"questionId\": 158, \"garbageName\": \"蓄电池\", \"garbageType\": 4}, {\"questionId\": 350, \"garbageName\": \"充电电池\", \"garbageType\": 4}, {\"questionId\": 351, \"garbageName\": \"镉镍电池\", \"garbageType\": 4}, {\"questionId\": 352, \"garbageName\": \"铅酸电池\", \"garbageType\": 4}, {\"questionId\": 354, \"garbageName\": \"纽扣电池\", \"garbageType\": 4}, {\"questionId\": 375, \"garbageName\": \"电池\", \"garbageType\": 4}, {\"questionId\": 401, \"garbageName\": \"镍镉电池\", \"garbageType\": 4}, {\"questionId\": 524, \"garbageName\": \"锂电池\", \"garbageType\": 4}, {\"questionId\": 533, \"garbageName\": \"手机电池\", \"garbageType\": 4}]', '2019-07-25 21:17:11');
INSERT INTO `keyword_result` VALUES (1456, '键盘', 'null', '2019-07-25 21:44:38');
INSERT INTO `keyword_result` VALUES (1457, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-07-25 21:44:45');
INSERT INTO `keyword_result` VALUES (1458, '键盘', 'null', '2019-07-25 21:45:00');
INSERT INTO `keyword_result` VALUES (1459, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-07-25 21:45:01');
INSERT INTO `keyword_result` VALUES (1460, '炉渣', '[{\"questionId\": 30, \"garbageName\": \"炉渣\", \"garbageType\": 1}]', '2019-07-25 22:03:58');
INSERT INTO `keyword_result` VALUES (1461, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-07-25 22:04:15');
INSERT INTO `keyword_result` VALUES (1462, '药品', 'null', '2019-07-25 23:06:11');
INSERT INTO `keyword_result` VALUES (1463, '药品', '[{\"questionId\": 360, \"garbageName\": \"药品内包装\", \"garbageType\": 4}, {\"questionId\": 407, \"garbageName\": \"药品包装\", \"garbageType\": 4}, {\"questionId\": 498, \"garbageName\": \"药品\", \"garbageType\": 4}, {\"questionId\": 500, \"garbageName\": \"废药品\", \"garbageType\": 4}, {\"questionId\": 507, \"garbageName\": \"过期药品\", \"garbageType\": 4}, {\"questionId\": 519, \"garbageName\": \"各类过期药品\", \"garbageType\": 4}, {\"questionId\": 535, \"garbageName\": \"药品壳子\", \"garbageType\": 4}, {\"questionId\": 543, \"garbageName\": \"药品铝塑板\", \"garbageType\": 4}]', '2019-07-25 23:06:16');
INSERT INTO `keyword_result` VALUES (1464, '门', 'null', '2019-07-25 23:06:34');
INSERT INTO `keyword_result` VALUES (1465, '门', '[{\"questionId\": 683, \"garbageName\": \"门锁\", \"garbageType\": 3}]', '2019-07-25 23:06:43');
INSERT INTO `keyword_result` VALUES (1466, '门', '[{\"questionId\": 683, \"garbageName\": \"门锁\", \"garbageType\": 3}]', '2019-07-25 23:06:47');
INSERT INTO `keyword_result` VALUES (1467, '马克杯', '[{\"questionId\": 124, \"garbageName\": \"马克杯\", \"garbageType\": 1}]', '2019-07-25 23:06:51');
INSERT INTO `keyword_result` VALUES (1468, '榴莲核', '[{\"questionId\": 25, \"garbageName\": \"榴莲核\", \"garbageType\": 1}]', '2019-07-25 23:07:03');
INSERT INTO `keyword_result` VALUES (1469, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-07-25 23:07:08');
INSERT INTO `keyword_result` VALUES (1470, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-07-25 23:07:17');
INSERT INTO `keyword_result` VALUES (1471, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-07-25 23:07:20');
INSERT INTO `keyword_result` VALUES (1472, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-07-25 23:07:23');
INSERT INTO `keyword_result` VALUES (1473, '街道', 'null', '2019-07-25 23:08:21');
INSERT INTO `keyword_result` VALUES (1474, '白云', '[]', '2019-07-25 23:08:26');
INSERT INTO `keyword_result` VALUES (1475, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-26 04:22:32');
INSERT INTO `keyword_result` VALUES (1476, '米', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}, {\"questionId\": 56, \"garbageName\": \"米\", \"garbageType\": 2}, {\"questionId\": 57, \"garbageName\": \"米饭\", \"garbageType\": 2}, {\"questionId\": 217, \"garbageName\": \"玉米\", \"garbageType\": 2}, {\"questionId\": 243, \"garbageName\": \"大米及豆类\", \"garbageType\": 2}, {\"questionId\": 554, \"garbageName\": \"玉米棒\", \"garbageType\": 2}, {\"questionId\": 562, \"garbageName\": \"熟玉米棒\", \"garbageType\": 2}, {\"questionId\": 573, \"garbageName\": \"玉米芯\", \"garbageType\": 2}, {\"questionId\": 627, \"garbageName\": \"玉米皮\", \"garbageType\": 1}, {\"questionId\": 634, \"garbageName\": \"玉米壳\", \"garbageType\": 1}, {\"questionId\": 677, \"garbageName\": \"米线\", \"garbageType\": 2}, {\"questionId\": 808, \"garbageName\": \"米虫\", \"garbageType\": 2}]', '2019-07-26 08:34:44');
INSERT INTO `keyword_result` VALUES (1477, '鞋', 'null', '2019-07-26 08:35:12');
INSERT INTO `keyword_result` VALUES (1478, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-26 08:35:24');
INSERT INTO `keyword_result` VALUES (1479, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-26 08:35:29');
INSERT INTO `keyword_result` VALUES (1480, '鞋', '[{\"questionId\": 312, \"garbageName\": \"皮鞋\", \"garbageType\": 3}, {\"questionId\": 333, \"garbageName\": \"旧鞋子\", \"garbageType\": 3}, {\"questionId\": 448, \"garbageName\": \"鞋子\", \"garbageType\": 3}, {\"questionId\": 669, \"garbageName\": \"运动鞋\", \"garbageType\": 3}, {\"questionId\": 691, \"garbageName\": \"凉鞋\", \"garbageType\": 3}, {\"questionId\": 692, \"garbageName\": \"高跟鞋\", \"garbageType\": 3}, {\"questionId\": 693, \"garbageName\": \"布鞋\", \"garbageType\": 3}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}, {\"questionId\": 810, \"garbageName\": \"拖鞋\", \"garbageType\": 3}]', '2019-07-26 08:35:35');
INSERT INTO `keyword_result` VALUES (1481, '钱包/卡包', 'null', '2019-07-26 08:41:50');
INSERT INTO `keyword_result` VALUES (1482, '屏幕截图', 'null', '2019-07-26 08:48:53');
INSERT INTO `keyword_result` VALUES (1483, '胶带', '[{\"questionId\": 34, \"garbageName\": \"胶带\", \"garbageType\": 1}]', '2019-07-26 08:59:03');
INSERT INTO `keyword_result` VALUES (1484, '塑料袋', '[{\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}, {\"questionId\": 603, \"garbageName\": \"塑料袋\", \"garbageType\": 1}, {\"questionId\": 647, \"garbageName\": \"肮脏塑料袋\", \"garbageType\": 1}]', '2019-07-26 08:59:21');
INSERT INTO `keyword_result` VALUES (1485, '筷子', '[{\"questionId\": 44, \"garbageName\": \"筷子\", \"garbageType\": 1}, {\"questionId\": 185, \"garbageName\": \"一次性筷子\", \"garbageType\": 1}, {\"questionId\": 478, \"garbageName\": \"木筷子\", \"garbageType\": 3}]', '2019-07-26 08:59:24');
INSERT INTO `keyword_result` VALUES (1486, '肮脏塑料袋', '[{\"questionId\": 647, \"garbageName\": \"肮脏塑料袋\", \"garbageType\": 1}]', '2019-07-26 08:59:30');
INSERT INTO `keyword_result` VALUES (1487, '筷子', '[{\"questionId\": 44, \"garbageName\": \"筷子\", \"garbageType\": 1}, {\"questionId\": 185, \"garbageName\": \"一次性筷子\", \"garbageType\": 1}, {\"questionId\": 478, \"garbageName\": \"木筷子\", \"garbageType\": 3}]', '2019-07-26 08:59:32');
INSERT INTO `keyword_result` VALUES (1488, '肮脏塑料袋', '[{\"questionId\": 647, \"garbageName\": \"肮脏塑料袋\", \"garbageType\": 1}]', '2019-07-26 08:59:37');
INSERT INTO `keyword_result` VALUES (1489, '竹筷', '[{\"questionId\": 42, \"garbageName\": \"竹筷\", \"garbageType\": 1}]', '2019-07-26 08:59:40');
INSERT INTO `keyword_result` VALUES (1490, '竹筷', '[{\"questionId\": 42, \"garbageName\": \"竹筷\", \"garbageType\": 1}]', '2019-07-26 08:59:46');
INSERT INTO `keyword_result` VALUES (1491, '米', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}, {\"questionId\": 56, \"garbageName\": \"米\", \"garbageType\": 2}, {\"questionId\": 57, \"garbageName\": \"米饭\", \"garbageType\": 2}, {\"questionId\": 217, \"garbageName\": \"玉米\", \"garbageType\": 2}, {\"questionId\": 243, \"garbageName\": \"大米及豆类\", \"garbageType\": 2}, {\"questionId\": 554, \"garbageName\": \"玉米棒\", \"garbageType\": 2}, {\"questionId\": 562, \"garbageName\": \"熟玉米棒\", \"garbageType\": 2}, {\"questionId\": 573, \"garbageName\": \"玉米芯\", \"garbageType\": 2}, {\"questionId\": 627, \"garbageName\": \"玉米皮\", \"garbageType\": 1}, {\"questionId\": 634, \"garbageName\": \"玉米壳\", \"garbageType\": 1}, {\"questionId\": 677, \"garbageName\": \"米线\", \"garbageType\": 2}, {\"questionId\": 808, \"garbageName\": \"米虫\", \"garbageType\": 2}]', '2019-07-26 08:59:50');
INSERT INTO `keyword_result` VALUES (1492, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-26 08:59:56');
INSERT INTO `keyword_result` VALUES (1493, '筷子', '[{\"questionId\": 44, \"garbageName\": \"筷子\", \"garbageType\": 1}, {\"questionId\": 185, \"garbageName\": \"一次性筷子\", \"garbageType\": 1}, {\"questionId\": 478, \"garbageName\": \"木筷子\", \"garbageType\": 3}]', '2019-07-26 08:59:58');
INSERT INTO `keyword_result` VALUES (1494, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-26 08:59:59');
INSERT INTO `keyword_result` VALUES (1495, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-26 09:00:03');
INSERT INTO `keyword_result` VALUES (1496, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-26 09:00:07');
INSERT INTO `keyword_result` VALUES (1497, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-07-26 09:04:57');
INSERT INTO `keyword_result` VALUES (1498, '内裤', '[{\"questionId\": 658, \"garbageName\": \"内裤\", \"garbageType\": 1}]', '2019-07-26 09:05:02');
INSERT INTO `keyword_result` VALUES (1499, '盆栽植物', 'null', '2019-07-26 09:05:13');
INSERT INTO `keyword_result` VALUES (1500, '盆栽植物', '[]', '2019-07-26 09:05:19');
INSERT INTO `keyword_result` VALUES (1501, '大便', '[]', '2019-07-26 09:05:33');
INSERT INTO `keyword_result` VALUES (1502, '大便', '[]', '2019-07-26 09:05:42');
INSERT INTO `keyword_result` VALUES (1503, '纽扣', '[{\"questionId\": 354, \"garbageName\": \"纽扣电池\", \"garbageType\": 4}]', '2019-07-26 09:06:29');
INSERT INTO `keyword_result` VALUES (1504, '纽扣', '[{\"questionId\": 354, \"garbageName\": \"纽扣电池\", \"garbageType\": 4}]', '2019-07-26 09:06:32');
INSERT INTO `keyword_result` VALUES (1505, '鸭脖', '[]', '2019-07-26 09:07:11');
INSERT INTO `keyword_result` VALUES (1506, '大便', '[]', '2019-07-26 09:07:15');
INSERT INTO `keyword_result` VALUES (1507, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-26 09:07:17');
INSERT INTO `keyword_result` VALUES (1508, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-26 09:07:18');
INSERT INTO `keyword_result` VALUES (1509, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-26 09:07:20');
INSERT INTO `keyword_result` VALUES (1510, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-26 09:07:21');
INSERT INTO `keyword_result` VALUES (1511, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-26 09:07:22');
INSERT INTO `keyword_result` VALUES (1512, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-26 09:07:23');
INSERT INTO `keyword_result` VALUES (1513, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-07-26 09:07:26');
INSERT INTO `keyword_result` VALUES (1514, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-26 09:07:27');
INSERT INTO `keyword_result` VALUES (1515, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-26 09:07:28');
INSERT INTO `keyword_result` VALUES (1516, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-26 09:07:29');
INSERT INTO `keyword_result` VALUES (1517, '鸭脖', '[]', '2019-07-26 09:08:08');
INSERT INTO `keyword_result` VALUES (1518, '重辣五号', '[]', '2019-07-26 09:09:00');
INSERT INTO `keyword_result` VALUES (1519, '皮卡丘', '[]', '2019-07-26 09:09:51');
INSERT INTO `keyword_result` VALUES (1520, '猪大肠', '[]', '2019-07-26 09:10:13');
INSERT INTO `keyword_result` VALUES (1521, '纸品湿巾', 'null', '2019-07-26 09:10:33');
INSERT INTO `keyword_result` VALUES (1522, '钠', '[]', '2019-07-26 09:10:56');
INSERT INTO `keyword_result` VALUES (1523, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-07-26 09:11:30');
INSERT INTO `keyword_result` VALUES (1524, '塑料', '[{\"questionId\": 13, \"garbageName\": \"污损塑料\", \"garbageType\": 1}, {\"questionId\": 125, \"garbageName\": \"塑料瓶\", \"garbageType\": 3}, {\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}, {\"questionId\": 258, \"garbageName\": \"食品与日用品塑料瓶罐及瓶盖(总)\", \"garbageType\": 3}, {\"questionId\": 264, \"garbageName\": \"塑料碗\", \"garbageType\": 3}, {\"questionId\": 265, \"garbageName\": \"塑料盆\", \"garbageType\": 3}, {\"questionId\": 266, \"garbageName\": \"塑料盒子\", \"garbageType\": 3}, {\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 270, \"garbageName\": \"塑料积木\", \"garbageType\": 3}, {\"questionId\": 271, \"garbageName\": \"塑料模型\", \"garbageType\": 3}, {\"questionId\": 272, \"garbageName\": \"塑料衣架\", \"garbageType\": 3}, {\"questionId\": 274, \"garbageName\": \"PE- 塑料\", \"garbageType\": 3}, {\"questionId\": 277, \"garbageName\": \"塑料卡片\", \"garbageType\": 3}, {\"questionId\": 281, \"garbageName\": \"泡沫塑料\", \"garbageType\": 3}, {\"questionId\": 341, \"garbageName\": \"塑料梳子\", \"garbageType\": 3}, {\"questionId\": 433, \"garbageName\": \"塑料\", \"garbageType\": 3}, {\"questionId\": 439, \"garbageName\": \"塑料盒\", \"garbageType\": 3}, {\"questionId\": 444, \"garbageName\": \"塑料杯\", \"garbageType\": 3}, {\"questionId\": 462, \"garbageName\": \"废塑料\", \"garbageType\": 3}, {\"questionId\": 471, \"garbageName\": \"塑料盖\", \"garbageType\": 3}, {\"questionId\": 490, \"garbageName\": \"塑料包装纸\", \"garbageType\": 3}, {\"questionId\": 493, \"garbageName\": \"饮料塑料瓶\", \"garbageType\": 3}, {\"questionId\": 603, \"garbageName\": \"塑料袋\", \"garbageType\": 1}, {\"questionId\": 647, \"garbageName\": \"肮脏塑料袋\", \"garbageType\": 1}, {\"questionId\": 696, \"garbageName\": \"塑料拖鞋\", \"garbageType\": 3}]', '2019-07-26 09:11:35');
INSERT INTO `keyword_result` VALUES (1525, '水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}, {\"questionId\": 112, \"garbageName\": \"水果\", \"garbageType\": 2}, {\"questionId\": 114, \"garbageName\": \"水果皮\", \"garbageType\": 2}, {\"questionId\": 172, \"garbageName\": \"旧水槽\", \"garbageType\": 1}, {\"questionId\": 261, \"garbageName\": \"洗发水瓶\", \"garbageType\": 3}, {\"questionId\": 282, \"garbageName\": \"水果网套\", \"garbageType\": 3}, {\"questionId\": 366, \"garbageName\": \"洗甲水\", \"garbageType\": 4}, {\"questionId\": 369, \"garbageName\": \"水银血压计\", \"garbageType\": 4}, {\"questionId\": 370, \"garbageName\": \"水银体温计\", \"garbageType\": 4}, {\"questionId\": 371, \"garbageName\": \"水银温度计\", \"garbageType\": 4}, {\"questionId\": 388, \"garbageName\": \"水彩笔\", \"garbageType\": 4}, {\"questionId\": 392, \"garbageName\": \"香水瓶\", \"garbageType\": 4}, {\"questionId\": 411, \"garbageName\": \"过期指甲油水银温度计\", \"garbageType\": 4}, {\"questionId\": 445, \"garbageName\": \"矿泉水瓶\", \"garbageType\": 3}, {\"questionId\": 514, \"garbageName\": \"眼药水\", \"garbageType\": 4}, {\"questionId\": 528, \"garbageName\": \"眼药水瓶\", \"garbageType\": 4}, {\"questionId\": 545, \"garbageName\": \"水银\", \"garbageType\": 4}, {\"questionId\": 795, \"garbageName\": \"水果茶\", \"garbageType\": 2}, {\"questionId\": 796, \"garbageName\": \"水果干\", \"garbageType\": 2}, {\"questionId\": 797, \"garbageName\": \"水果脆\", \"garbageType\": 2}, {\"questionId\": 798, \"garbageName\": \"水果茎枝\", \"garbageType\": 2}, {\"questionId\": 805, \"garbageName\": \"水饺\", \"garbageType\": 2}, {\"questionId\": 807, \"garbageName\": \"花露水玻璃空瓶\", \"garbageType\": 3}]', '2019-07-26 09:11:39');
INSERT INTO `keyword_result` VALUES (1526, '矿泉水瓶', '[{\"questionId\": 445, \"garbageName\": \"矿泉水瓶\", \"garbageType\": 3}]', '2019-07-26 09:11:43');
INSERT INTO `keyword_result` VALUES (1527, '人', '[]', '2019-07-26 09:11:47');
INSERT INTO `keyword_result` VALUES (1528, '樟脑丸', '[]', '2019-07-26 09:12:24');
INSERT INTO `keyword_result` VALUES (1529, '编织袋', '[{\"questionId\": 15, \"garbageName\": \"编织袋\", \"garbageType\": 1}]', '2019-07-26 10:05:32');
INSERT INTO `keyword_result` VALUES (1530, '奶茶杯', '[{\"remark\": \"喝完好喝的奶茶，记得把奶茶杯放进干垃圾桶哟\", \"questionId\": 427, \"garbageName\": \"奶茶杯\", \"garbageType\": 1}]', '2019-07-26 10:06:02');
INSERT INTO `keyword_result` VALUES (1531, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2019-07-26 10:10:40');
INSERT INTO `keyword_result` VALUES (1532, '胶水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}]', '2019-07-26 10:12:41');
INSERT INTO `keyword_result` VALUES (1533, '豆子', '[{\"questionId\": 61, \"garbageName\": \"豆子\", \"garbageType\": 2}]', '2019-07-26 10:48:51');
INSERT INTO `keyword_result` VALUES (1534, '豆子', '[{\"questionId\": 61, \"garbageName\": \"豆子\", \"garbageType\": 2}]', '2019-07-26 10:49:03');
INSERT INTO `keyword_result` VALUES (1535, '牛奶盒', '[{\"questionId\": 334, \"garbageName\": \"牛奶盒\", \"garbageType\": 3}]', '2019-07-26 10:50:14');
INSERT INTO `keyword_result` VALUES (1536, '果汁盒', '[]', '2019-07-26 10:50:27');
INSERT INTO `keyword_result` VALUES (1537, '果汁盒', '[]', '2019-07-26 10:50:33');
INSERT INTO `keyword_result` VALUES (1538, '毛发', '[{\"questionId\": 28, \"garbageName\": \"毛发\", \"garbageType\": 1}]', '2019-07-26 10:50:38');
INSERT INTO `keyword_result` VALUES (1539, '开心果', '[{\"questionId\": 55, \"garbageName\": \"开心果\", \"garbageType\": 1}, {\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-07-26 10:51:56');
INSERT INTO `keyword_result` VALUES (1540, '灰土', '[{\"questionId\": 29, \"garbageName\": \"灰土\", \"garbageType\": 1}]', '2019-07-26 10:52:12');
INSERT INTO `keyword_result` VALUES (1541, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2019-07-26 10:52:25');
INSERT INTO `keyword_result` VALUES (1542, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2019-07-26 10:52:59');
INSERT INTO `keyword_result` VALUES (1543, '胶水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}]', '2019-07-26 10:59:53');
INSERT INTO `keyword_result` VALUES (1544, '毛发', '[{\"questionId\": 28, \"garbageName\": \"毛发\", \"garbageType\": 1}]', '2019-07-26 10:59:57');
INSERT INTO `keyword_result` VALUES (1545, '伞', '[{\"questionId\": 45, \"garbageName\": \"伞\", \"garbageType\": 1}, {\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-07-26 10:59:59');
INSERT INTO `keyword_result` VALUES (1546, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-07-26 11:00:01');
INSERT INTO `keyword_result` VALUES (1547, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2019-07-26 11:00:04');
INSERT INTO `keyword_result` VALUES (1548, '果核', '[{\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}, {\"questionId\": 589, \"garbageName\": \"芒果核\", \"garbageType\": 2}, {\"questionId\": 799, \"garbageName\": \"牛油果核\", \"garbageType\": 1}]', '2019-07-26 11:05:31');
INSERT INTO `keyword_result` VALUES (1549, '果核', '[{\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}, {\"questionId\": 589, \"garbageName\": \"芒果核\", \"garbageType\": 2}, {\"questionId\": 799, \"garbageName\": \"牛油果核\", \"garbageType\": 1}]', '2019-07-26 11:05:39');
INSERT INTO `keyword_result` VALUES (1550, '李子核', '[]', '2019-07-26 11:05:48');
INSERT INTO `keyword_result` VALUES (1551, '芒果核', '[{\"questionId\": 589, \"garbageName\": \"芒果核\", \"garbageType\": 2}]', '2019-07-26 11:06:18');
INSERT INTO `keyword_result` VALUES (1552, '烟头', '[]', '2019-07-26 11:07:12');
INSERT INTO `keyword_result` VALUES (1553, '筷子', '[{\"questionId\": 44, \"garbageName\": \"筷子\", \"garbageType\": 1}, {\"questionId\": 185, \"garbageName\": \"一次性筷子\", \"garbageType\": 1}, {\"questionId\": 478, \"garbageName\": \"木筷子\", \"garbageType\": 3}]', '2019-07-26 11:07:33');
INSERT INTO `keyword_result` VALUES (1554, '炉渣', '[{\"questionId\": 30, \"garbageName\": \"炉渣\", \"garbageType\": 1}]', '2019-07-26 11:07:36');
INSERT INTO `keyword_result` VALUES (1555, '花盆', '[{\"questionId\": 35, \"garbageName\": \"花盆\", \"garbageType\": 1}, {\"questionId\": 187, \"garbageName\": \"坏的花盆\", \"garbageType\": 1}]', '2019-07-26 11:07:39');
INSERT INTO `keyword_result` VALUES (1556, '榴莲壳', '[{\"questionId\": 21, \"garbageName\": \"榴莲壳\", \"garbageType\": 1}]', '2019-07-26 11:07:49');
INSERT INTO `keyword_result` VALUES (1557, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-07-26 11:08:09');
INSERT INTO `keyword_result` VALUES (1558, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-07-26 11:08:12');
INSERT INTO `keyword_result` VALUES (1559, '面', '[{\"questionId\": 58, \"garbageName\": \"面\", \"garbageType\": 2}, {\"questionId\": 59, \"garbageName\": \"面包\", \"garbageType\": 2}, {\"questionId\": 60, \"garbageName\": \"面条\", \"garbageType\": 2}, {\"questionId\": 107, \"garbageName\": \"面粉\", \"garbageType\": 2}, {\"questionId\": 146, \"garbageName\": \"方便面盒\", \"garbageType\": 1}, {\"questionId\": 610, \"garbageName\": \"面膜\", \"garbageType\": 1}]', '2019-07-26 11:08:16');
INSERT INTO `keyword_result` VALUES (1560, '烟头', '[]', '2019-07-26 11:08:23');
INSERT INTO `keyword_result` VALUES (1561, '烟', '[{\"questionId\": 11, \"garbageName\": \"烟蒂\", \"garbageType\": 1}, {\"questionId\": 54, \"garbageName\": \"烟盒\", \"garbageType\": 1}, {\"questionId\": 672, \"garbageName\": \"玻璃烟缸\", \"garbageType\": 3}, {\"questionId\": 673, \"garbageName\": \"烟灰缸\", \"garbageType\": 3}]', '2019-07-26 11:08:37');
INSERT INTO `keyword_result` VALUES (1562, '佩服', '[]', '2019-07-26 11:16:06');
INSERT INTO `keyword_result` VALUES (1563, '可降解垃圾袋', '[]', '2019-07-26 11:25:53');
INSERT INTO `keyword_result` VALUES (1564, '垃圾袋', '[{\"questionId\": 192, \"garbageName\": \"湿垃圾袋\", \"garbageType\": 1}, {\"questionId\": 633, \"garbageName\": \"垃圾袋\", \"garbageType\": 1}]', '2019-07-26 11:25:59');
INSERT INTO `keyword_result` VALUES (1565, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-07-26 12:53:00');
INSERT INTO `keyword_result` VALUES (1566, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-07-26 12:53:05');
INSERT INTO `keyword_result` VALUES (1567, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-07-26 13:48:11');
INSERT INTO `keyword_result` VALUES (1568, '竹制凉席', 'null', '2019-07-26 14:33:44');
INSERT INTO `keyword_result` VALUES (1569, '竹制凉席', '[]', '2019-07-26 14:33:56');
INSERT INTO `keyword_result` VALUES (1570, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-26 14:34:04');
INSERT INTO `keyword_result` VALUES (1571, '雨伞', '[{\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-07-26 14:34:36');
INSERT INTO `keyword_result` VALUES (1572, '面条', '[{\"questionId\": 60, \"garbageName\": \"面条\", \"garbageType\": 2}]', '2019-07-26 15:39:58');
INSERT INTO `keyword_result` VALUES (1573, '毛笔', '[{\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}]', '2019-07-26 16:10:07');
INSERT INTO `keyword_result` VALUES (1574, '毛笔', '[{\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}]', '2019-07-26 16:10:23');
INSERT INTO `keyword_result` VALUES (1575, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-26 16:46:08');
INSERT INTO `keyword_result` VALUES (1576, '防碎气泡膜', '[{\"questionId\": 16, \"garbageName\": \"防碎气泡膜\", \"garbageType\": 1}]', '2019-07-26 22:23:13');
INSERT INTO `keyword_result` VALUES (1577, '包装袋', '[{\"questionId\": 625, \"garbageName\": \"包装袋\", \"garbageType\": 1}, {\"questionId\": 641, \"garbageName\": \"食品包装袋\", \"garbageType\": 1}]', '2019-07-26 22:23:24');
INSERT INTO `keyword_result` VALUES (1578, '塑料包装袋', '[]', '2019-07-26 22:24:10');
INSERT INTO `keyword_result` VALUES (1579, '伞', '[{\"questionId\": 45, \"garbageName\": \"伞\", \"garbageType\": 1}, {\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-07-26 23:43:03');
INSERT INTO `keyword_result` VALUES (1580, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-07-27 00:34:30');
INSERT INTO `keyword_result` VALUES (1581, '@@::@@', '[]', '2019-07-27 00:34:32');
INSERT INTO `keyword_result` VALUES (1582, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-07-27 00:37:18');
INSERT INTO `keyword_result` VALUES (1583, '@@::@@', '[]', '2019-07-27 00:37:21');
INSERT INTO `keyword_result` VALUES (1584, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-27 00:38:16');
INSERT INTO `keyword_result` VALUES (1585, '@@::@@', '[]', '2019-07-27 00:38:40');
INSERT INTO `keyword_result` VALUES (1586, '@@::@@', '[]', '2019-07-27 00:39:58');
INSERT INTO `keyword_result` VALUES (1587, '花生', '[{\"questionId\": 177, \"garbageName\": \"花生壳\", \"garbageType\": 1}]', '2019-07-27 07:36:08');
INSERT INTO `keyword_result` VALUES (1588, '黄豆', '[{\"questionId\": 62, \"garbageName\": \"黄豆\", \"garbageType\": 2}]', '2019-07-27 07:36:29');
INSERT INTO `keyword_result` VALUES (1589, '绿豆', '[{\"questionId\": 64, \"garbageName\": \"绿豆\", \"garbageType\": 2}]', '2019-07-27 10:20:25');
INSERT INTO `keyword_result` VALUES (1590, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-27 12:12:59');
INSERT INTO `keyword_result` VALUES (1591, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:38:58');
INSERT INTO `keyword_result` VALUES (1592, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:38:58');
INSERT INTO `keyword_result` VALUES (1593, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:38:59');
INSERT INTO `keyword_result` VALUES (1594, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:38:59');
INSERT INTO `keyword_result` VALUES (1595, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:38:59');
INSERT INTO `keyword_result` VALUES (1596, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:38:59');
INSERT INTO `keyword_result` VALUES (1597, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:38:59');
INSERT INTO `keyword_result` VALUES (1598, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:00');
INSERT INTO `keyword_result` VALUES (1599, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:00');
INSERT INTO `keyword_result` VALUES (1600, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:00');
INSERT INTO `keyword_result` VALUES (1601, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:00');
INSERT INTO `keyword_result` VALUES (1602, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:00');
INSERT INTO `keyword_result` VALUES (1603, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:00');
INSERT INTO `keyword_result` VALUES (1604, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:00');
INSERT INTO `keyword_result` VALUES (1605, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:00');
INSERT INTO `keyword_result` VALUES (1606, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:01');
INSERT INTO `keyword_result` VALUES (1607, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:01');
INSERT INTO `keyword_result` VALUES (1608, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:01');
INSERT INTO `keyword_result` VALUES (1609, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:01');
INSERT INTO `keyword_result` VALUES (1610, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-27 15:39:01');
INSERT INTO `keyword_result` VALUES (1611, '纸巾', '[{\"remark\": \"纸巾不要乱丢呀，会污染环境\", \"analysis\": \"\", \"questionId\": 1, \"garbageName\": \"纸巾\", \"garbageType\": 1}, {\"questionId\": 620, \"garbageName\": \"湿纸巾\", \"garbageType\": 1}]', '2019-07-27 16:41:28');
INSERT INTO `keyword_result` VALUES (1612, '枣核', '[{\"questionId\": 593, \"garbageName\": \"枣核\", \"garbageType\": 2}]', '2019-07-27 16:41:51');
INSERT INTO `keyword_result` VALUES (1613, '核', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}, {\"questionId\": 25, \"garbageName\": \"榴莲核\", \"garbageType\": 1}, {\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}, {\"questionId\": 182, \"garbageName\": \"核桃\", \"garbageType\": 1}, {\"questionId\": 186, \"garbageName\": \"西梅核\", \"garbageType\": 1}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}, {\"questionId\": 553, \"garbageName\": \"桃核\", \"garbageType\": 2}, {\"questionId\": 580, \"garbageName\": \"荔枝核\", \"garbageType\": 2}, {\"questionId\": 588, \"garbageName\": \"话梅核\", \"garbageType\": 2}, {\"questionId\": 589, \"garbageName\": \"芒果核\", \"garbageType\": 2}, {\"questionId\": 593, \"garbageName\": \"枣核\", \"garbageType\": 2}, {\"questionId\": 799, \"garbageName\": \"牛油果核\", \"garbageType\": 1}]', '2019-07-27 16:42:32');
INSERT INTO `keyword_result` VALUES (1614, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-07-27 17:43:41');
INSERT INTO `keyword_result` VALUES (1615, '多肉植物', 'null', '2019-07-27 17:43:44');
INSERT INTO `keyword_result` VALUES (1616, '酸奶', 'null', '2019-07-27 17:43:53');
INSERT INTO `keyword_result` VALUES (1617, '酸奶', '[{\"questionId\": 488, \"garbageName\": \"酸奶利乐包装盒\", \"garbageType\": 3}]', '2019-07-27 17:44:03');
INSERT INTO `keyword_result` VALUES (1618, '酸奶', '[{\"questionId\": 488, \"garbageName\": \"酸奶利乐包装盒\", \"garbageType\": 3}]', '2019-07-27 17:44:07');
INSERT INTO `keyword_result` VALUES (1619, '酸奶', '[{\"questionId\": 488, \"garbageName\": \"酸奶利乐包装盒\", \"garbageType\": 3}]', '2019-07-27 17:44:10');
INSERT INTO `keyword_result` VALUES (1620, '酸奶', '[{\"questionId\": 488, \"garbageName\": \"酸奶利乐包装盒\", \"garbageType\": 3}]', '2019-07-27 17:44:12');
INSERT INTO `keyword_result` VALUES (1621, '酸奶', '[{\"questionId\": 488, \"garbageName\": \"酸奶利乐包装盒\", \"garbageType\": 3}]', '2019-07-27 17:44:13');
INSERT INTO `keyword_result` VALUES (1622, '玻璃瓶', '[{\"questionId\": 283, \"garbageName\": \"食品及日用品玻璃瓶罐\", \"garbageType\": 3}, {\"questionId\": 434, \"garbageName\": \"玻璃瓶\", \"garbageType\": 3}]', '2019-07-27 19:07:58');
INSERT INTO `keyword_result` VALUES (1623, '豆子', '[{\"questionId\": 61, \"garbageName\": \"豆子\", \"garbageType\": 2}]', '2019-07-27 19:08:30');
INSERT INTO `keyword_result` VALUES (1624, '尿不湿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}]', '2019-07-27 19:08:34');
INSERT INTO `keyword_result` VALUES (1625, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-07-27 19:08:39');
INSERT INTO `keyword_result` VALUES (1626, '奶茶', '[{\"remark\": \"喝完好喝的奶茶，记得把奶茶杯放进干垃圾桶哟\", \"questionId\": 427, \"garbageName\": \"奶茶杯\", \"garbageType\": 1}]', '2019-07-27 19:11:10');
INSERT INTO `keyword_result` VALUES (1627, '奶茶杯', '[{\"remark\": \"喝完好喝的奶茶，记得把奶茶杯放进干垃圾桶哟\", \"questionId\": 427, \"garbageName\": \"奶茶杯\", \"garbageType\": 1}]', '2019-07-27 19:11:12');
INSERT INTO `keyword_result` VALUES (1628, '小龙虾', '[{\"questionId\": 557, \"garbageName\": \"小龙虾\", \"garbageType\": 2}, {\"questionId\": 564, \"garbageName\": \"小龙虾壳\", \"garbageType\": 2}, {\"questionId\": 594, \"garbageName\": \"小龙虾头\", \"garbageType\": 2}]', '2019-07-27 19:11:28');
INSERT INTO `keyword_result` VALUES (1629, '龙虾壳', '[{\"questionId\": 558, \"garbageName\": \"龙虾壳\", \"garbageType\": 2}, {\"questionId\": 564, \"garbageName\": \"小龙虾壳\", \"garbageType\": 2}]', '2019-07-27 19:11:37');
INSERT INTO `keyword_result` VALUES (1630, '玻璃瓶', '[{\"questionId\": 283, \"garbageName\": \"食品及日用品玻璃瓶罐\", \"garbageType\": 3}, {\"questionId\": 434, \"garbageName\": \"玻璃瓶\", \"garbageType\": 3}]', '2019-07-27 19:14:20');
INSERT INTO `keyword_result` VALUES (1631, '酱油瓶', '[]', '2019-07-27 19:14:28');
INSERT INTO `keyword_result` VALUES (1632, '玻璃', '[{\"questionId\": 283, \"garbageName\": \"食品及日用品玻璃瓶罐\", \"garbageType\": 3}, {\"questionId\": 287, \"garbageName\": \"玻璃杯\", \"garbageType\": 3}, {\"questionId\": 288, \"garbageName\": \"窗玻璃\", \"garbageType\": 3}, {\"questionId\": 289, \"garbageName\": \"玻璃制品\", \"garbageType\": 3}, {\"questionId\": 291, \"garbageName\": \"玻璃摆件\", \"garbageType\": 3}, {\"questionId\": 292, \"garbageName\": \"碎玻璃\", \"garbageType\": 3}, {\"questionId\": 336, \"garbageName\": \"玻璃壶\", \"garbageType\": 3}, {\"questionId\": 434, \"garbageName\": \"玻璃瓶\", \"garbageType\": 3}, {\"questionId\": 435, \"garbageName\": \"玻璃\", \"garbageType\": 3}, {\"questionId\": 672, \"garbageName\": \"玻璃烟缸\", \"garbageType\": 3}, {\"questionId\": 807, \"garbageName\": \"花露水玻璃空瓶\", \"garbageType\": 3}]', '2019-07-27 19:15:10');
INSERT INTO `keyword_result` VALUES (1633, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-07-27 19:30:16');
INSERT INTO `keyword_result` VALUES (1634, '硬果壳', '[{\"questionId\": 19, \"garbageName\": \"硬果壳\", \"garbageType\": 1}]', '2019-07-28 00:09:07');
INSERT INTO `keyword_result` VALUES (1635, '硬果壳', '[{\"questionId\": 19, \"garbageName\": \"硬果壳\", \"garbageType\": 1}]', '2019-07-28 00:09:12');
INSERT INTO `keyword_result` VALUES (1636, '猫', 'null', '2019-07-28 00:09:26');
INSERT INTO `keyword_result` VALUES (1637, '猫', '[{\"questionId\": 8, \"garbageName\": \"猫砂\", \"garbageType\": 1}, {\"questionId\": 109, \"garbageName\": \"猫粮\", \"garbageType\": 2}]', '2019-07-28 00:09:31');
INSERT INTO `keyword_result` VALUES (1638, '猫', '[{\"questionId\": 8, \"garbageName\": \"猫砂\", \"garbageType\": 1}, {\"questionId\": 109, \"garbageName\": \"猫粮\", \"garbageType\": 2}]', '2019-07-28 00:09:33');
INSERT INTO `keyword_result` VALUES (1639, '猫', '[{\"questionId\": 8, \"garbageName\": \"猫砂\", \"garbageType\": 1}, {\"questionId\": 109, \"garbageName\": \"猫粮\", \"garbageType\": 2}]', '2019-07-28 00:09:34');
INSERT INTO `keyword_result` VALUES (1640, '笔', '[{\"questionId\": 48, \"garbageName\": \"笔\", \"garbageType\": 1}, {\"questionId\": 49, \"garbageName\": \"铅笔\", \"garbageType\": 1}, {\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}, {\"questionId\": 129, \"garbageName\": \"笔盖\", \"garbageType\": 1}, {\"questionId\": 137, \"garbageName\": \"钢笔\", \"garbageType\": 1}, {\"questionId\": 145, \"garbageName\": \"圆珠笔\", \"garbageType\": 1}, {\"questionId\": 388, \"garbageName\": \"水彩笔\", \"garbageType\": 4}, {\"questionId\": 653, \"garbageName\": \"笔芯\", \"garbageType\": 1}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 702, \"garbageName\": \"笔记本\", \"garbageType\": 3}, {\"questionId\": 734, \"garbageName\": \"记号笔\", \"garbageType\": 1}, {\"questionId\": 735, \"garbageName\": \"金属铅笔盒\", \"garbageType\": 3}, {\"questionId\": 737, \"garbageName\": \"蜡笔\", \"garbageType\": 1}, {\"questionId\": 738, \"garbageName\": \"坏钢笔\", \"garbageType\": 1}, {\"questionId\": 739, \"garbageName\": \"中性笔\", \"garbageType\": 1}, {\"questionId\": 740, \"garbageName\": \"眉笔\", \"garbageType\": 1}, {\"questionId\": 741, \"garbageName\": \"粉笔\", \"garbageType\": 1}, {\"questionId\": 742, \"garbageName\": \"彩笔\", \"garbageType\": 1}, {\"questionId\": 743, \"garbageName\": \"马克笔\", \"garbageType\": 1}, {\"questionId\": 744, \"garbageName\": \"笔杆\", \"garbageType\": 1}, {\"questionId\": 745, \"garbageName\": \"笔套\", \"garbageType\": 1}, {\"questionId\": 746, \"garbageName\": \"红笔\", \"garbageType\": 1}, {\"questionId\": 747, \"garbageName\": \"勾线笔\", \"garbageType\": 1}, {\"questionId\": 748, \"garbageName\": \"可擦复写笔\", \"garbageType\": 1}]', '2019-07-28 00:09:38');
INSERT INTO `keyword_result` VALUES (1641, '羊肉', '[{\"questionId\": 69, \"garbageName\": \"羊肉\", \"garbageType\": 2}, {\"questionId\": 104, \"garbageName\": \"羊肉干\", \"garbageType\": 2}]', '2019-07-28 10:50:33');
INSERT INTO `keyword_result` VALUES (1642, '11', '[]', '2019-07-28 10:51:02');
INSERT INTO `keyword_result` VALUES (1643, '橡皮泥', '[{\"questionId\": 31, \"garbageName\": \"橡皮泥\", \"garbageType\": 1}]', '2019-07-28 16:57:22');
INSERT INTO `keyword_result` VALUES (1644, '橡皮泥', '[{\"questionId\": 31, \"garbageName\": \"橡皮泥\", \"garbageType\": 1}]', '2019-07-28 16:57:26');
INSERT INTO `keyword_result` VALUES (1645, '粉底液', '[]', '2019-07-28 16:57:35');
INSERT INTO `keyword_result` VALUES (1646, '眼影', '[]', '2019-07-28 16:57:44');
INSERT INTO `keyword_result` VALUES (1647, '奶茶', '[{\"remark\": \"喝完好喝的奶茶，记得把奶茶杯放进干垃圾桶哟\", \"questionId\": 427, \"garbageName\": \"奶茶杯\", \"garbageType\": 1}]', '2019-07-28 16:57:50');
INSERT INTO `keyword_result` VALUES (1648, '键盘', 'null', '2019-07-28 18:14:26');
INSERT INTO `keyword_result` VALUES (1649, '人脸', 'null', '2019-07-28 22:19:47');
INSERT INTO `keyword_result` VALUES (1650, '人脸', '[]', '2019-07-28 22:19:56');
INSERT INTO `keyword_result` VALUES (1651, '人物特写', 'null', '2019-07-28 22:20:16');
INSERT INTO `keyword_result` VALUES (1652, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-28 22:20:29');
INSERT INTO `keyword_result` VALUES (1653, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-28 22:20:33');
INSERT INTO `keyword_result` VALUES (1654, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-28 22:20:35');
INSERT INTO `keyword_result` VALUES (1655, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-07-28 22:20:38');
INSERT INTO `keyword_result` VALUES (1656, '打火机', 'null', '2019-07-29 11:09:15');
INSERT INTO `keyword_result` VALUES (1657, '米', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}, {\"questionId\": 56, \"garbageName\": \"米\", \"garbageType\": 2}, {\"questionId\": 57, \"garbageName\": \"米饭\", \"garbageType\": 2}, {\"questionId\": 217, \"garbageName\": \"玉米\", \"garbageType\": 2}, {\"questionId\": 243, \"garbageName\": \"大米及豆类\", \"garbageType\": 2}, {\"questionId\": 554, \"garbageName\": \"玉米棒\", \"garbageType\": 2}, {\"questionId\": 562, \"garbageName\": \"熟玉米棒\", \"garbageType\": 2}, {\"questionId\": 573, \"garbageName\": \"玉米芯\", \"garbageType\": 2}, {\"questionId\": 627, \"garbageName\": \"玉米皮\", \"garbageType\": 1}, {\"questionId\": 634, \"garbageName\": \"玉米壳\", \"garbageType\": 1}, {\"questionId\": 677, \"garbageName\": \"米线\", \"garbageType\": 2}, {\"questionId\": 808, \"garbageName\": \"米虫\", \"garbageType\": 2}]', '2019-07-29 12:34:32');
INSERT INTO `keyword_result` VALUES (1658, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-07-29 12:40:02');
INSERT INTO `keyword_result` VALUES (1659, '大骨头', '[{\"questionId\": 17, \"garbageName\": \"大骨头\", \"garbageType\": 1}]', '2019-07-29 12:44:57');
INSERT INTO `keyword_result` VALUES (1660, '编织袋', '[{\"questionId\": 15, \"garbageName\": \"编织袋\", \"garbageType\": 1}]', '2019-07-29 14:05:10');
INSERT INTO `keyword_result` VALUES (1661, '呕吐物', '[]', '2019-07-29 14:05:23');
INSERT INTO `keyword_result` VALUES (1662, '羊肉', '[{\"questionId\": 69, \"garbageName\": \"羊肉\", \"garbageType\": 2}, {\"questionId\": 104, \"garbageName\": \"羊肉干\", \"garbageType\": 2}]', '2019-07-29 15:55:42');
INSERT INTO `keyword_result` VALUES (1663, '打火机', '[{\"remark\": \"干垃圾哟\", \"questionId\": 52, \"garbageName\": \"打火机\", \"garbageType\": 1}]', '2019-07-29 17:42:45');
INSERT INTO `keyword_result` VALUES (1664, '卫生间用纸', '[{\"questionId\": 6, \"garbageName\": \"卫生间用纸\", \"garbageType\": 1}]', '2019-07-29 20:12:02');
INSERT INTO `keyword_result` VALUES (1665, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-29 20:12:17');
INSERT INTO `keyword_result` VALUES (1666, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-29 20:12:19');
INSERT INTO `keyword_result` VALUES (1667, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-29 20:12:21');
INSERT INTO `keyword_result` VALUES (1668, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-29 20:12:22');
INSERT INTO `keyword_result` VALUES (1669, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-29 20:12:23');
INSERT INTO `keyword_result` VALUES (1670, '开心果', '[{\"questionId\": 55, \"garbageName\": \"开心果\", \"garbageType\": 1}, {\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-07-30 10:39:30');
INSERT INTO `keyword_result` VALUES (1671, '开心果壳', '[{\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-07-30 10:39:53');
INSERT INTO `keyword_result` VALUES (1672, '开心果壳', '[{\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-07-30 10:40:23');
INSERT INTO `keyword_result` VALUES (1673, '开心果', '[{\"questionId\": 55, \"garbageName\": \"开心果\", \"garbageType\": 1}, {\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-07-30 10:40:30');
INSERT INTO `keyword_result` VALUES (1674, '绿豆', '[{\"questionId\": 64, \"garbageName\": \"绿豆\", \"garbageType\": 2}]', '2019-07-30 11:47:52');
INSERT INTO `keyword_result` VALUES (1675, '鱿鱼', '[{\"questionId\": 84, \"garbageName\": \"鱿鱼\", \"garbageType\": 2}]', '2019-07-30 12:26:03');
INSERT INTO `keyword_result` VALUES (1676, '天', '[{\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}]', '2019-07-30 12:26:17');
INSERT INTO `keyword_result` VALUES (1677, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-07-30 12:27:15');
INSERT INTO `keyword_result` VALUES (1678, '羊肉', '[{\"questionId\": 69, \"garbageName\": \"羊肉\", \"garbageType\": 2}, {\"questionId\": 104, \"garbageName\": \"羊肉干\", \"garbageType\": 2}]', '2019-07-30 12:27:20');
INSERT INTO `keyword_result` VALUES (1679, '马克杯', 'null', '2019-07-30 12:27:43');
INSERT INTO `keyword_result` VALUES (1680, '旋钮', '[]', '2019-07-30 12:27:51');
INSERT INTO `keyword_result` VALUES (1681, '硬果壳', '[{\"questionId\": 19, \"garbageName\": \"硬果壳\", \"garbageType\": 1}]', '2019-07-30 12:28:59');
INSERT INTO `keyword_result` VALUES (1682, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-07-30 12:29:22');
INSERT INTO `keyword_result` VALUES (1683, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2019-07-30 15:34:57');
INSERT INTO `keyword_result` VALUES (1684, '猪肝', '[{\"questionId\": 73, \"garbageName\": \"猪肝\", \"garbageType\": 2}]', '2019-07-30 15:35:08');
INSERT INTO `keyword_result` VALUES (1685, '烟蒂', '[{\"questionId\": 11, \"garbageName\": \"烟蒂\", \"garbageType\": 1}]', '2019-07-30 15:35:19');
INSERT INTO `keyword_result` VALUES (1686, '玉米衣', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}]', '2019-07-30 15:35:23');
INSERT INTO `keyword_result` VALUES (1687, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2019-07-30 15:35:25');
INSERT INTO `keyword_result` VALUES (1688, '天堂伞', '[{\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}]', '2019-07-30 15:35:28');
INSERT INTO `keyword_result` VALUES (1689, '卫生间用纸', '[{\"questionId\": 6, \"garbageName\": \"卫生间用纸\", \"garbageType\": 1}]', '2019-07-30 15:35:31');
INSERT INTO `keyword_result` VALUES (1690, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-30 15:35:34');
INSERT INTO `keyword_result` VALUES (1691, '大骨头', '[{\"questionId\": 17, \"garbageName\": \"大骨头\", \"garbageType\": 1}]', '2019-07-30 15:35:36');
INSERT INTO `keyword_result` VALUES (1692, '甘蔗皮', '[{\"questionId\": 24, \"garbageName\": \"甘蔗皮\", \"garbageType\": 1}]', '2019-07-30 15:35:38');
INSERT INTO `keyword_result` VALUES (1693, '毛笔', '[{\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}]', '2019-07-30 16:39:05');
INSERT INTO `keyword_result` VALUES (1694, '开心果', '[{\"questionId\": 55, \"garbageName\": \"开心果\", \"garbageType\": 1}, {\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-07-30 16:39:12');
INSERT INTO `keyword_result` VALUES (1695, '狗尿垫', '[{\"questionId\": 9, \"garbageName\": \"狗尿垫\", \"garbageType\": 1}]', '2019-07-30 16:39:18');
INSERT INTO `keyword_result` VALUES (1696, '胶带', '[{\"questionId\": 34, \"garbageName\": \"胶带\", \"garbageType\": 1}]', '2019-07-30 16:41:09');
INSERT INTO `keyword_result` VALUES (1697, '牙签', '[{\"questionId\": 43, \"garbageName\": \"牙签\", \"garbageType\": 1}, {\"questionId\": 670, \"garbageName\": \"牙签盒\", \"garbageType\": 1}]', '2019-07-30 16:41:17');
INSERT INTO `keyword_result` VALUES (1698, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-07-30 16:41:17');
INSERT INTO `keyword_result` VALUES (1699, '灰土', '[{\"questionId\": 29, \"garbageName\": \"灰土\", \"garbageType\": 1}]', '2019-07-30 16:41:25');
INSERT INTO `keyword_result` VALUES (1700, '眼镜', '[{\"questionId\": 51, \"garbageName\": \"眼镜\", \"garbageType\": 1}, {\"questionId\": 126, \"garbageName\": \"3D眼镜\", \"garbageType\": 1}, {\"questionId\": 665, \"garbageName\": \"黑框眼镜\", \"garbageType\": 1}, {\"questionId\": 666, \"garbageName\": \"隐形眼镜\", \"garbageType\": 1}]', '2019-07-30 16:41:29');
INSERT INTO `keyword_result` VALUES (1701, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-07-30 16:41:37');
INSERT INTO `keyword_result` VALUES (1702, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-07-30 16:41:40');
INSERT INTO `keyword_result` VALUES (1703, '米', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}, {\"questionId\": 56, \"garbageName\": \"米\", \"garbageType\": 2}, {\"questionId\": 57, \"garbageName\": \"米饭\", \"garbageType\": 2}, {\"questionId\": 217, \"garbageName\": \"玉米\", \"garbageType\": 2}, {\"questionId\": 243, \"garbageName\": \"大米及豆类\", \"garbageType\": 2}, {\"questionId\": 554, \"garbageName\": \"玉米棒\", \"garbageType\": 2}, {\"questionId\": 562, \"garbageName\": \"熟玉米棒\", \"garbageType\": 2}, {\"questionId\": 573, \"garbageName\": \"玉米芯\", \"garbageType\": 2}, {\"questionId\": 627, \"garbageName\": \"玉米皮\", \"garbageType\": 1}, {\"questionId\": 634, \"garbageName\": \"玉米壳\", \"garbageType\": 1}, {\"questionId\": 677, \"garbageName\": \"米线\", \"garbageType\": 2}, {\"questionId\": 808, \"garbageName\": \"米虫\", \"garbageType\": 2}]', '2019-07-30 16:41:44');
INSERT INTO `keyword_result` VALUES (1704, '玉米衣', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}]', '2019-07-30 16:41:48');
INSERT INTO `keyword_result` VALUES (1705, '玉米衣', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}]', '2019-07-30 16:42:24');
INSERT INTO `keyword_result` VALUES (1706, '猪肝', '[{\"questionId\": 73, \"garbageName\": \"猪肝\", \"garbageType\": 2}]', '2019-07-30 16:42:30');
INSERT INTO `keyword_result` VALUES (1707, '炉渣', '[{\"questionId\": 30, \"garbageName\": \"炉渣\", \"garbageType\": 1}]', '2019-07-30 16:42:33');
INSERT INTO `keyword_result` VALUES (1708, '竹篮', '[{\"questionId\": 41, \"garbageName\": \"竹篮\", \"garbageType\": 1}]', '2019-07-30 16:42:39');
INSERT INTO `keyword_result` VALUES (1709, '花盆', '[{\"questionId\": 35, \"garbageName\": \"花盆\", \"garbageType\": 1}, {\"questionId\": 187, \"garbageName\": \"坏的花盆\", \"garbageType\": 1}]', '2019-07-30 16:42:43');
INSERT INTO `keyword_result` VALUES (1710, '筷子', '[{\"questionId\": 44, \"garbageName\": \"筷子\", \"garbageType\": 1}, {\"questionId\": 185, \"garbageName\": \"一次性筷子\", \"garbageType\": 1}, {\"questionId\": 478, \"garbageName\": \"木筷子\", \"garbageType\": 3}]', '2019-07-30 16:42:46');
INSERT INTO `keyword_result` VALUES (1711, '干燥剂', '[{\"questionId\": 12, \"garbageName\": \"干燥剂\", \"garbageType\": 1}]', '2019-07-30 16:42:49');
INSERT INTO `keyword_result` VALUES (1712, '大骨头', '[{\"questionId\": 17, \"garbageName\": \"大骨头\", \"garbageType\": 1}]', '2019-07-30 16:42:54');
INSERT INTO `keyword_result` VALUES (1713, '鱼骨', '[{\"questionId\": 97, \"garbageName\": \"鱼骨\", \"garbageType\": 2}, {\"questionId\": 569, \"garbageName\": \"鱼骨头\", \"garbageType\": 2}]', '2019-07-30 16:43:03');
INSERT INTO `keyword_result` VALUES (1714, '甘蔗皮', '[{\"questionId\": 24, \"garbageName\": \"甘蔗皮\", \"garbageType\": 1}]', '2019-07-30 16:43:31');
INSERT INTO `keyword_result` VALUES (1715, '尿不湿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}]', '2019-07-30 16:44:06');
INSERT INTO `keyword_result` VALUES (1716, '马克杯', 'null', '2019-07-30 17:30:51');
INSERT INTO `keyword_result` VALUES (1717, '陶瓷杯', '[{\"questionId\": 184, \"garbageName\": \"陶瓷杯\", \"garbageType\": 1}]', '2019-07-30 17:31:26');
INSERT INTO `keyword_result` VALUES (1718, '面', '[{\"questionId\": 58, \"garbageName\": \"面\", \"garbageType\": 2}, {\"questionId\": 59, \"garbageName\": \"面包\", \"garbageType\": 2}, {\"questionId\": 60, \"garbageName\": \"面条\", \"garbageType\": 2}, {\"questionId\": 107, \"garbageName\": \"面粉\", \"garbageType\": 2}, {\"questionId\": 146, \"garbageName\": \"方便面盒\", \"garbageType\": 1}, {\"questionId\": 610, \"garbageName\": \"面膜\", \"garbageType\": 1}]', '2019-07-30 17:31:39');
INSERT INTO `keyword_result` VALUES (1719, '打火机', '[{\"remark\": \"干垃圾哟\", \"questionId\": 52, \"garbageName\": \"打火机\", \"garbageType\": 1}]', '2019-07-30 17:31:50');
INSERT INTO `keyword_result` VALUES (1720, '眼镜', '[{\"questionId\": 51, \"garbageName\": \"眼镜\", \"garbageType\": 1}, {\"questionId\": 126, \"garbageName\": \"3D眼镜\", \"garbageType\": 1}, {\"questionId\": 665, \"garbageName\": \"黑框眼镜\", \"garbageType\": 1}, {\"questionId\": 666, \"garbageName\": \"隐形眼镜\", \"garbageType\": 1}]', '2019-07-30 17:37:05');
INSERT INTO `keyword_result` VALUES (1721, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-30 17:37:32');
INSERT INTO `keyword_result` VALUES (1722, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-07-30 17:39:04');
INSERT INTO `keyword_result` VALUES (1723, '轿车', 'null', '2019-07-30 17:39:06');
INSERT INTO `keyword_result` VALUES (1724, '', '[]', '2019-07-30 17:58:32');
INSERT INTO `keyword_result` VALUES (1725, '情趣内衣，什么垃圾？', '[]', '2019-07-30 17:58:39');
INSERT INTO `keyword_result` VALUES (1726, '衣服是什么垃圾？', '[]', '2019-07-30 17:58:47');
INSERT INTO `keyword_result` VALUES (1727, '我不知道', '[]', '2019-07-30 17:58:53');
INSERT INTO `keyword_result` VALUES (1728, '纸巾是什么东西？', '[]', '2019-07-30 17:58:59');
INSERT INTO `keyword_result` VALUES (1729, '电池是什么垃圾？', '[]', '2019-07-30 17:59:08');
INSERT INTO `keyword_result` VALUES (1730, '玉米衣', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}]', '2019-07-30 18:23:03');
INSERT INTO `keyword_result` VALUES (1731, '胶布', '[]', '2019-07-30 18:23:20');
INSERT INTO `keyword_result` VALUES (1732, '胶布', '[]', '2019-07-30 18:23:23');
INSERT INTO `keyword_result` VALUES (1733, '水杯', '[]', '2019-07-30 18:23:31');
INSERT INTO `keyword_result` VALUES (1734, '水杯', '[]', '2019-07-30 18:23:33');
INSERT INTO `keyword_result` VALUES (1735, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-07-30 18:23:39');
INSERT INTO `keyword_result` VALUES (1736, '不是', '[]', '2019-07-30 18:25:08');
INSERT INTO `keyword_result` VALUES (1737, '土豆', '[]', '2019-07-30 18:25:20');
INSERT INTO `keyword_result` VALUES (1738, '土豆', '[]', '2019-07-30 18:25:23');
INSERT INTO `keyword_result` VALUES (1739, '榴莲壳', '[{\"questionId\": 21, \"garbageName\": \"榴莲壳\", \"garbageType\": 1}]', '2019-07-30 19:48:04');
INSERT INTO `keyword_result` VALUES (1740, '橡皮泥', '[{\"questionId\": 31, \"garbageName\": \"橡皮泥\", \"garbageType\": 1}]', '2019-07-30 19:57:58');
INSERT INTO `keyword_result` VALUES (1741, '毛发', '[{\"questionId\": 28, \"garbageName\": \"毛发\", \"garbageType\": 1}]', '2019-07-30 19:58:16');
INSERT INTO `keyword_result` VALUES (1742, '龙虾', '[{\"questionId\": 557, \"garbageName\": \"小龙虾\", \"garbageType\": 2}, {\"questionId\": 558, \"garbageName\": \"龙虾壳\", \"garbageType\": 2}, {\"questionId\": 564, \"garbageName\": \"小龙虾壳\", \"garbageType\": 2}, {\"questionId\": 571, \"garbageName\": \"龙虾\", \"garbageType\": 2}, {\"questionId\": 594, \"garbageName\": \"小龙虾头\", \"garbageType\": 2}]', '2019-07-30 19:58:24');
INSERT INTO `keyword_result` VALUES (1743, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-07-30 21:45:21');
INSERT INTO `keyword_result` VALUES (1744, '竹筷', '[{\"questionId\": 42, \"garbageName\": \"竹筷\", \"garbageType\": 1}]', '2019-07-31 03:53:30');
INSERT INTO `keyword_result` VALUES (1745, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-07-31 03:53:36');
INSERT INTO `keyword_result` VALUES (1746, '花盆', '[{\"questionId\": 35, \"garbageName\": \"花盆\", \"garbageType\": 1}, {\"questionId\": 187, \"garbageName\": \"坏的花盆\", \"garbageType\": 1}]', '2019-07-31 03:53:41');
INSERT INTO `keyword_result` VALUES (1747, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-07-31 03:53:44');
INSERT INTO `keyword_result` VALUES (1748, '奶茶', '[{\"remark\": \"喝完好喝的奶茶，记得把奶茶杯放进干垃圾桶哟\", \"questionId\": 427, \"garbageName\": \"奶茶杯\", \"garbageType\": 1}]', '2019-07-31 09:36:46');
INSERT INTO `keyword_result` VALUES (1749, '烟蒂', '[{\"questionId\": 11, \"garbageName\": \"烟蒂\", \"garbageType\": 1}]', '2019-07-31 14:10:47');
INSERT INTO `keyword_result` VALUES (1750, '污损塑料', '[{\"questionId\": 13, \"garbageName\": \"污损塑料\", \"garbageType\": 1}, {\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}]', '2019-07-31 15:56:52');
INSERT INTO `keyword_result` VALUES (1751, '鼠标', '[{\"questionId\": 426, \"garbageName\": \"鼠标\", \"garbageType\": 3}]', '2019-07-31 15:59:05');
INSERT INTO `keyword_result` VALUES (1752, '石锅鱼', 'null', '2019-07-31 15:59:51');
INSERT INTO `keyword_result` VALUES (1753, '石锅鱼', '[]', '2019-07-31 16:00:03');
INSERT INTO `keyword_result` VALUES (1754, '石锅鱼', '[]', '2019-07-31 16:00:09');
INSERT INTO `keyword_result` VALUES (1755, '桥梁', 'null', '2019-07-31 16:00:44');
INSERT INTO `keyword_result` VALUES (1756, '塑料球', 'null', '2019-07-31 17:08:32');
INSERT INTO `keyword_result` VALUES (1757, '鼠标', 'null', '2019-07-31 17:08:53');
INSERT INTO `keyword_result` VALUES (1758, '口香糖', '[{\"questionId\": 612, \"garbageName\": \"口香糖\", \"garbageType\": 1}]', '2019-07-31 18:19:54');
INSERT INTO `keyword_result` VALUES (1759, '塑料盒', '[{\"questionId\": 266, \"garbageName\": \"塑料盒子\", \"garbageType\": 3}, {\"questionId\": 439, \"garbageName\": \"塑料盒\", \"garbageType\": 3}]', '2019-07-31 18:20:07');
INSERT INTO `keyword_result` VALUES (1760, '塑料袋', '[{\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}, {\"questionId\": 603, \"garbageName\": \"塑料袋\", \"garbageType\": 1}, {\"questionId\": 647, \"garbageName\": \"肮脏塑料袋\", \"garbageType\": 1}]', '2019-07-31 18:20:21');
INSERT INTO `keyword_result` VALUES (1761, '沙发', 'null', '2019-07-31 18:56:39');
INSERT INTO `keyword_result` VALUES (1762, '沙发', '[]', '2019-07-31 18:56:49');
INSERT INTO `keyword_result` VALUES (1763, '电视背景墙', 'null', '2019-07-31 18:57:06');
INSERT INTO `keyword_result` VALUES (1764, '电视背景墙', '[]', '2019-07-31 18:57:17');
INSERT INTO `keyword_result` VALUES (1765, '电视背景墙', '[]', '2019-07-31 18:57:26');
INSERT INTO `keyword_result` VALUES (1766, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-07-31 18:57:29');
INSERT INTO `keyword_result` VALUES (1767, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-07-31 18:57:32');
INSERT INTO `keyword_result` VALUES (1768, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-07-31 18:57:34');
INSERT INTO `keyword_result` VALUES (1769, '污损塑料', '[{\"questionId\": 13, \"garbageName\": \"污损塑料\", \"garbageType\": 1}, {\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}]', '2019-07-31 18:58:05');
INSERT INTO `keyword_result` VALUES (1770, '竹筷', '[{\"questionId\": 42, \"garbageName\": \"竹筷\", \"garbageType\": 1}]', '2019-07-31 21:48:08');
INSERT INTO `keyword_result` VALUES (1771, '平板电脑', 'null', '2019-07-31 21:56:06');
INSERT INTO `keyword_result` VALUES (1772, '灰土', '[{\"questionId\": 29, \"garbageName\": \"灰土\", \"garbageType\": 1}]', '2019-07-31 22:09:08');
INSERT INTO `keyword_result` VALUES (1773, '固体胶', 'null', '2019-08-01 10:38:07');
INSERT INTO `keyword_result` VALUES (1774, '固体胶', '[]', '2019-08-01 10:38:11');
INSERT INTO `keyword_result` VALUES (1775, '固体胶', '[]', '2019-08-01 10:38:14');
INSERT INTO `keyword_result` VALUES (1776, '纸箱', 'null', '2019-08-01 10:38:38');
INSERT INTO `keyword_result` VALUES (1777, '纸箱', '[]', '2019-08-01 10:38:40');
INSERT INTO `keyword_result` VALUES (1778, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-01 10:38:43');
INSERT INTO `keyword_result` VALUES (1779, '纸箱', '[]', '2019-08-01 10:38:48');
INSERT INTO `keyword_result` VALUES (1780, '纸箱', '[]', '2019-08-01 10:38:52');
INSERT INTO `keyword_result` VALUES (1781, '绿豆', '[{\"questionId\": 64, \"garbageName\": \"绿豆\", \"garbageType\": 2}]', '2019-08-01 10:38:58');
INSERT INTO `keyword_result` VALUES (1782, '豆子', '[{\"questionId\": 61, \"garbageName\": \"豆子\", \"garbageType\": 2}]', '2019-08-01 11:55:12');
INSERT INTO `keyword_result` VALUES (1783, '豆子', '[{\"questionId\": 61, \"garbageName\": \"豆子\", \"garbageType\": 2}]', '2019-08-01 11:55:20');
INSERT INTO `keyword_result` VALUES (1784, '毛发', '[{\"questionId\": 28, \"garbageName\": \"毛发\", \"garbageType\": 1}]', '2019-08-01 20:12:44');
INSERT INTO `keyword_result` VALUES (1785, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-01 20:13:02');
INSERT INTO `keyword_result` VALUES (1786, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-01 20:13:04');
INSERT INTO `keyword_result` VALUES (1787, '杯子', 'null', '2019-08-01 20:14:24');
INSERT INTO `keyword_result` VALUES (1788, '杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}, {\"questionId\": 183, \"garbageName\": \"杯子\", \"garbageType\": 1}]', '2019-08-01 20:14:39');
INSERT INTO `keyword_result` VALUES (1789, '葡萄', 'null', '2019-08-01 20:59:10');
INSERT INTO `keyword_result` VALUES (1790, '玉米棒', '[{\"questionId\": 554, \"garbageName\": \"玉米棒\", \"garbageType\": 2}, {\"questionId\": 562, \"garbageName\": \"熟玉米棒\", \"garbageType\": 2}]', '2019-08-02 08:25:45');
INSERT INTO `keyword_result` VALUES (1791, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-08-02 08:29:54');
INSERT INTO `keyword_result` VALUES (1792, '胭脂红', 'null', '2019-08-02 09:50:14');
INSERT INTO `keyword_result` VALUES (1793, '饮水器', '[]', '2019-08-02 09:50:26');
INSERT INTO `keyword_result` VALUES (1794, '马铃薯', 'null', '2019-08-02 09:50:45');
INSERT INTO `keyword_result` VALUES (1795, '芒果', '[{\"questionId\": 589, \"garbageName\": \"芒果核\", \"garbageType\": 2}]', '2019-08-02 09:50:48');
INSERT INTO `keyword_result` VALUES (1796, '芒果', '[{\"questionId\": 589, \"garbageName\": \"芒果核\", \"garbageType\": 2}]', '2019-08-02 09:50:51');
INSERT INTO `keyword_result` VALUES (1797, '芒果', '[{\"questionId\": 589, \"garbageName\": \"芒果核\", \"garbageType\": 2}]', '2019-08-02 09:50:53');
INSERT INTO `keyword_result` VALUES (1798, '鱼类', 'null', '2019-08-02 09:51:41');
INSERT INTO `keyword_result` VALUES (1799, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-08-02 09:55:14');
INSERT INTO `keyword_result` VALUES (1800, '污损塑料', '[{\"questionId\": 13, \"garbageName\": \"污损塑料\", \"garbageType\": 1}, {\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}]', '2019-08-02 15:59:23');
INSERT INTO `keyword_result` VALUES (1801, '避孕套', '[{\"questionId\": 607, \"garbageName\": \"避孕套\", \"garbageType\": 1}]', '2019-08-02 19:09:36');
INSERT INTO `keyword_result` VALUES (1802, '润滑油', '[]', '2019-08-02 19:09:58');
INSERT INTO `keyword_result` VALUES (1803, '润滑油', '[]', '2019-08-02 19:10:00');
INSERT INTO `keyword_result` VALUES (1804, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-02 19:10:05');
INSERT INTO `keyword_result` VALUES (1805, '毛发', '[{\"questionId\": 28, \"garbageName\": \"毛发\", \"garbageType\": 1}]', '2019-08-02 22:25:58');
INSERT INTO `keyword_result` VALUES (1806, '猫砂', '[{\"questionId\": 8, \"garbageName\": \"猫砂\", \"garbageType\": 1}]', '2019-08-03 15:38:52');
INSERT INTO `keyword_result` VALUES (1807, '西瓜', '[{\"questionId\": 115, \"garbageName\": \"西瓜皮\", \"garbageType\": 2}, {\"questionId\": 121, \"garbageName\": \"西瓜籽\", \"garbageType\": 2}, {\"questionId\": 811, \"garbageName\": \"西瓜\", \"garbageType\": 2}]', '2019-08-03 15:38:58');
INSERT INTO `keyword_result` VALUES (1808, '西瓜皮', '[{\"questionId\": 115, \"garbageName\": \"西瓜皮\", \"garbageType\": 2}]', '2019-08-03 15:39:03');
INSERT INTO `keyword_result` VALUES (1809, '西瓜籽', '[{\"questionId\": 121, \"garbageName\": \"西瓜籽\", \"garbageType\": 2}]', '2019-08-03 15:39:08');
INSERT INTO `keyword_result` VALUES (1810, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-03 17:13:16');
INSERT INTO `keyword_result` VALUES (1811, '编织袋', '[{\"questionId\": 15, \"garbageName\": \"编织袋\", \"garbageType\": 1}]', '2019-08-04 12:35:10');
INSERT INTO `keyword_result` VALUES (1812, '橡皮泥', '[{\"questionId\": 31, \"garbageName\": \"橡皮泥\", \"garbageType\": 1}]', '2019-08-04 14:55:41');
INSERT INTO `keyword_result` VALUES (1813, '筷子', '[{\"questionId\": 44, \"garbageName\": \"筷子\", \"garbageType\": 1}, {\"questionId\": 185, \"garbageName\": \"一次性筷子\", \"garbageType\": 1}, {\"questionId\": 478, \"garbageName\": \"木筷子\", \"garbageType\": 3}]', '2019-08-04 14:55:44');
INSERT INTO `keyword_result` VALUES (1814, '污损塑料', '[{\"questionId\": 13, \"garbageName\": \"污损塑料\", \"garbageType\": 1}, {\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}]', '2019-08-04 14:55:47');
INSERT INTO `keyword_result` VALUES (1815, '贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}, {\"questionId\": 149, \"garbageName\": \"贝壳\", \"garbageType\": 1}]', '2019-08-04 14:55:54');
INSERT INTO `keyword_result` VALUES (1816, '椰子壳', '[{\"questionId\": 20, \"garbageName\": \"椰子壳\", \"garbageType\": 1}]', '2019-08-04 14:56:02');
INSERT INTO `keyword_result` VALUES (1817, '过期零食', '[]', '2019-08-04 20:53:29');
INSERT INTO `keyword_result` VALUES (1818, '过期', '[{\"questionId\": 357, \"garbageName\": \"过期药物\", \"garbageType\": 4}, {\"questionId\": 365, \"garbageName\": \"过期的指甲油\", \"garbageType\": 4}, {\"questionId\": 381, \"garbageName\": \"过期的胶囊药物\", \"garbageType\": 4}, {\"questionId\": 383, \"garbageName\": \"过期药片\", \"garbageType\": 4}, {\"questionId\": 394, \"garbageName\": \"过期化妆品\", \"garbageType\": 4}, {\"questionId\": 411, \"garbageName\": \"过期指甲油水银温度计\", \"garbageType\": 4}, {\"questionId\": 507, \"garbageName\": \"过期药品\", \"garbageType\": 4}, {\"questionId\": 519, \"garbageName\": \"各类过期药品\", \"garbageType\": 4}]', '2019-08-04 20:53:36');
INSERT INTO `keyword_result` VALUES (1819, '零食', '[]', '2019-08-04 20:53:44');
INSERT INTO `keyword_result` VALUES (1820, '过期', '[{\"questionId\": 357, \"garbageName\": \"过期药物\", \"garbageType\": 4}, {\"questionId\": 365, \"garbageName\": \"过期的指甲油\", \"garbageType\": 4}, {\"questionId\": 381, \"garbageName\": \"过期的胶囊药物\", \"garbageType\": 4}, {\"questionId\": 383, \"garbageName\": \"过期药片\", \"garbageType\": 4}, {\"questionId\": 394, \"garbageName\": \"过期化妆品\", \"garbageType\": 4}, {\"questionId\": 411, \"garbageName\": \"过期指甲油水银温度计\", \"garbageType\": 4}, {\"questionId\": 507, \"garbageName\": \"过期药品\", \"garbageType\": 4}, {\"questionId\": 519, \"garbageName\": \"各类过期药品\", \"garbageType\": 4}]', '2019-08-04 20:53:52');
INSERT INTO `keyword_result` VALUES (1821, '吊顶', 'null', '2019-08-05 13:30:59');
INSERT INTO `keyword_result` VALUES (1822, '粉彩山水', 'null', '2019-08-05 13:31:29');
INSERT INTO `keyword_result` VALUES (1823, '粉彩山水', '[]', '2019-08-05 13:31:40');
INSERT INTO `keyword_result` VALUES (1824, '油画', 'null', '2019-08-05 13:32:03');
INSERT INTO `keyword_result` VALUES (1825, '油画', '[]', '2019-08-05 13:32:07');
INSERT INTO `keyword_result` VALUES (1826, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-05 13:32:13');
INSERT INTO `keyword_result` VALUES (1827, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-05 13:32:15');
INSERT INTO `keyword_result` VALUES (1828, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-05 13:32:17');
INSERT INTO `keyword_result` VALUES (1829, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-05 13:32:18');
INSERT INTO `keyword_result` VALUES (1830, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-05 13:32:19');
INSERT INTO `keyword_result` VALUES (1831, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-05 13:32:20');
INSERT INTO `keyword_result` VALUES (1832, '牙签', '[{\"questionId\": 43, \"garbageName\": \"牙签\", \"garbageType\": 1}, {\"questionId\": 670, \"garbageName\": \"牙签盒\", \"garbageType\": 1}]', '2019-08-05 13:32:28');
INSERT INTO `keyword_result` VALUES (1833, '油画', '[]', '2019-08-05 13:32:50');
INSERT INTO `keyword_result` VALUES (1834, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-05 16:04:07');
INSERT INTO `keyword_result` VALUES (1835, '尿不湿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}]', '2019-08-05 17:32:07');
INSERT INTO `keyword_result` VALUES (1836, '避孕套', '[{\"questionId\": 607, \"garbageName\": \"避孕套\", \"garbageType\": 1}]', '2019-08-05 17:32:20');
INSERT INTO `keyword_result` VALUES (1837, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-08-05 17:32:28');
INSERT INTO `keyword_result` VALUES (1838, '积极', '[]', '2019-08-05 17:58:02');
INSERT INTO `keyword_result` VALUES (1839, '饮料', '[{\"questionId\": 259, \"garbageName\": \"饮料瓶\", \"garbageType\": 3}, {\"questionId\": 430, \"garbageName\": \"瓶装饮料\", \"garbageType\": 1}, {\"questionId\": 493, \"garbageName\": \"饮料塑料瓶\", \"garbageType\": 3}]', '2019-08-05 23:45:26');
INSERT INTO `keyword_result` VALUES (1840, '瓶装饮料', '[{\"questionId\": 430, \"garbageName\": \"瓶装饮料\", \"garbageType\": 1}]', '2019-08-05 23:45:30');
INSERT INTO `keyword_result` VALUES (1841, '瓶装饮料', '[{\"questionId\": 430, \"garbageName\": \"瓶装饮料\", \"garbageType\": 1}]', '2019-08-05 23:45:55');
INSERT INTO `keyword_result` VALUES (1842, '猫', '[{\"questionId\": 8, \"garbageName\": \"猫砂\", \"garbageType\": 1}, {\"questionId\": 109, \"garbageName\": \"猫粮\", \"garbageType\": 2}]', '2019-08-05 23:46:12');
INSERT INTO `keyword_result` VALUES (1843, '辣条', '[]', '2019-08-05 23:46:24');
INSERT INTO `keyword_result` VALUES (1844, '奶茶', '[{\"remark\": \"喝完好喝的奶茶，记得把奶茶杯放进干垃圾桶哟\", \"questionId\": 427, \"garbageName\": \"奶茶杯\", \"garbageType\": 1}]', '2019-08-05 23:46:33');
INSERT INTO `keyword_result` VALUES (1845, '雪糕', '[]', '2019-08-05 23:46:48');
INSERT INTO `keyword_result` VALUES (1846, '鸡蛋壳', '[{\"questionId\": 424, \"garbageName\": \"鸡蛋壳\", \"garbageType\": 2}]', '2019-08-06 09:30:10');
INSERT INTO `keyword_result` VALUES (1847, '睫毛膏', 'null', '2019-08-06 10:50:32');
INSERT INTO `keyword_result` VALUES (1848, '饼干', 'null', '2019-08-06 10:50:51');
INSERT INTO `keyword_result` VALUES (1849, '包装袋', '[{\"questionId\": 625, \"garbageName\": \"包装袋\", \"garbageType\": 1}, {\"questionId\": 641, \"garbageName\": \"食品包装袋\", \"garbageType\": 1}]', '2019-08-06 10:51:03');
INSERT INTO `keyword_result` VALUES (1850, '塑料瓶', '[{\"questionId\": 125, \"garbageName\": \"塑料瓶\", \"garbageType\": 3}, {\"questionId\": 258, \"garbageName\": \"食品与日用品塑料瓶罐及瓶盖(总)\", \"garbageType\": 3}, {\"questionId\": 493, \"garbageName\": \"饮料塑料瓶\", \"garbageType\": 3}]', '2019-08-06 12:18:41');
INSERT INTO `keyword_result` VALUES (1851, '饮料塑料瓶', '[{\"questionId\": 493, \"garbageName\": \"饮料塑料瓶\", \"garbageType\": 3}]', '2019-08-06 12:18:50');
INSERT INTO `keyword_result` VALUES (1852, '纸巾', '[{\"remark\": \"纸巾不要乱丢呀，会污染环境\", \"analysis\": \"\", \"questionId\": 1, \"garbageName\": \"纸巾\", \"garbageType\": 1}, {\"questionId\": 620, \"garbageName\": \"湿纸巾\", \"garbageType\": 1}]', '2019-08-06 12:19:06');
INSERT INTO `keyword_result` VALUES (1853, '椰子壳', '[{\"questionId\": 20, \"garbageName\": \"椰子壳\", \"garbageType\": 1}]', '2019-08-06 17:24:27');
INSERT INTO `keyword_result` VALUES (1854, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-06 17:48:04');
INSERT INTO `keyword_result` VALUES (1855, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-08-06 17:48:19');
INSERT INTO `keyword_result` VALUES (1856, '马克杯', '[{\"questionId\": 124, \"garbageName\": \"马克杯\", \"garbageType\": 1}]', '2019-08-06 17:48:41');
INSERT INTO `keyword_result` VALUES (1857, '防碎气泡膜', '[{\"questionId\": 16, \"garbageName\": \"防碎气泡膜\", \"garbageType\": 1}]', '2019-08-06 17:48:51');
INSERT INTO `keyword_result` VALUES (1858, '桃子皮', '[]', '2019-08-07 15:45:52');
INSERT INTO `keyword_result` VALUES (1859, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-07 15:45:56');
INSERT INTO `keyword_result` VALUES (1860, '鱼', '[{\"questionId\": 78, \"garbageName\": \"鱼\", \"garbageType\": 2}, {\"questionId\": 80, \"garbageName\": \"鱼鳞\", \"garbageType\": 2}, {\"questionId\": 84, \"garbageName\": \"鱿鱼\", \"garbageType\": 2}, {\"questionId\": 85, \"garbageName\": \"章鱼\", \"garbageType\": 2}, {\"questionId\": 86, \"garbageName\": \"墨鱼\", \"garbageType\": 2}, {\"questionId\": 97, \"garbageName\": \"鱼骨\", \"garbageType\": 2}, {\"questionId\": 569, \"garbageName\": \"鱼骨头\", \"garbageType\": 2}, {\"questionId\": 599, \"garbageName\": \"鱼刺\", \"garbageType\": 2}, {\"questionId\": 671, \"garbageName\": \"死鱼\", \"garbageType\": 2}, {\"questionId\": 701, \"garbageName\": \"甲鱼壳\", \"garbageType\": 1}, {\"questionId\": 809, \"garbageName\": \"酸菜鱼\", \"garbageType\": 2}]', '2019-08-08 10:28:26');
INSERT INTO `keyword_result` VALUES (1861, '椰子壳', '[{\"questionId\": 20, \"garbageName\": \"椰子壳\", \"garbageType\": 1}]', '2019-08-08 10:28:41');
INSERT INTO `keyword_result` VALUES (1862, '椰子壳', '[{\"questionId\": 20, \"garbageName\": \"椰子壳\", \"garbageType\": 1}]', '2019-08-08 10:28:46');
INSERT INTO `keyword_result` VALUES (1863, '面包', 'null', '2019-08-08 11:36:47');
INSERT INTO `keyword_result` VALUES (1864, '面包', '[{\"questionId\": 59, \"garbageName\": \"面包\", \"garbageType\": 2}]', '2019-08-08 11:36:54');
INSERT INTO `keyword_result` VALUES (1865, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2019-08-08 13:25:29');
INSERT INTO `keyword_result` VALUES (1866, '玻璃', '[{\"questionId\": 283, \"garbageName\": \"食品及日用品玻璃瓶罐\", \"garbageType\": 3}, {\"questionId\": 287, \"garbageName\": \"玻璃杯\", \"garbageType\": 3}, {\"questionId\": 288, \"garbageName\": \"窗玻璃\", \"garbageType\": 3}, {\"questionId\": 289, \"garbageName\": \"玻璃制品\", \"garbageType\": 3}, {\"questionId\": 291, \"garbageName\": \"玻璃摆件\", \"garbageType\": 3}, {\"questionId\": 292, \"garbageName\": \"碎玻璃\", \"garbageType\": 3}, {\"questionId\": 336, \"garbageName\": \"玻璃壶\", \"garbageType\": 3}, {\"questionId\": 434, \"garbageName\": \"玻璃瓶\", \"garbageType\": 3}, {\"questionId\": 435, \"garbageName\": \"玻璃\", \"garbageType\": 3}, {\"questionId\": 672, \"garbageName\": \"玻璃烟缸\", \"garbageType\": 3}, {\"questionId\": 807, \"garbageName\": \"花露水玻璃空瓶\", \"garbageType\": 3}]', '2019-08-08 14:21:21');
INSERT INTO `keyword_result` VALUES (1867, '瓶子', 'null', '2019-08-08 15:45:55');
INSERT INTO `keyword_result` VALUES (1868, '瓶装饮料', '[{\"questionId\": 430, \"garbageName\": \"瓶装饮料\", \"garbageType\": 1}]', '2019-08-08 15:46:02');
INSERT INTO `keyword_result` VALUES (1869, '医生', 'null', '2019-08-08 15:46:18');
INSERT INTO `keyword_result` VALUES (1870, '男孩', '[]', '2019-08-08 15:46:34');
INSERT INTO `keyword_result` VALUES (1871, '医生', 'null', '2019-08-08 15:46:44');
INSERT INTO `keyword_result` VALUES (1872, '眼镜', '[{\"questionId\": 51, \"garbageName\": \"眼镜\", \"garbageType\": 1}, {\"questionId\": 126, \"garbageName\": \"3D眼镜\", \"garbageType\": 1}, {\"questionId\": 665, \"garbageName\": \"黑框眼镜\", \"garbageType\": 1}, {\"questionId\": 666, \"garbageName\": \"隐形眼镜\", \"garbageType\": 1}]', '2019-08-08 15:46:46');
INSERT INTO `keyword_result` VALUES (1873, '美容器', 'null', '2019-08-08 19:09:26');
INSERT INTO `keyword_result` VALUES (1874, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-08 19:09:47');
INSERT INTO `keyword_result` VALUES (1875, '灰土', '[{\"questionId\": 29, \"garbageName\": \"灰土\", \"garbageType\": 1}]', '2019-08-08 21:42:30');
INSERT INTO `keyword_result` VALUES (1876, '酸奶', '[{\"questionId\": 488, \"garbageName\": \"酸奶利乐包装盒\", \"garbageType\": 3}]', '2019-08-09 16:01:52');
INSERT INTO `keyword_result` VALUES (1877, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-10 18:50:29');
INSERT INTO `keyword_result` VALUES (1878, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-10 18:50:32');
INSERT INTO `keyword_result` VALUES (1879, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-08-10 18:50:33');
INSERT INTO `keyword_result` VALUES (1880, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-10 18:50:38');
INSERT INTO `keyword_result` VALUES (1881, '玉米衣', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}]', '2019-08-11 17:21:00');
INSERT INTO `keyword_result` VALUES (1882, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-11 17:21:09');
INSERT INTO `keyword_result` VALUES (1883, '笔芯', '[{\"questionId\": 653, \"garbageName\": \"笔芯\", \"garbageType\": 1}]', '2019-08-12 17:25:00');
INSERT INTO `keyword_result` VALUES (1884, '镜子', '[{\"questionId\": 39, \"garbageName\": \"镜子\", \"garbageType\": 1}, {\"questionId\": 339, \"garbageName\": \"旧镜子\", \"garbageType\": 3}]', '2019-08-13 16:19:51');
INSERT INTO `keyword_result` VALUES (1885, '剩饭残渣', '[{\"questionId\": 2, \"garbageName\": \"剩饭残渣\", \"garbageType\": 2}]', '2019-08-13 17:28:55');
INSERT INTO `keyword_result` VALUES (1886, '电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}, {\"questionId\": 158, \"garbageName\": \"蓄电池\", \"garbageType\": 4}, {\"questionId\": 350, \"garbageName\": \"充电电池\", \"garbageType\": 4}, {\"questionId\": 351, \"garbageName\": \"镉镍电池\", \"garbageType\": 4}, {\"questionId\": 352, \"garbageName\": \"铅酸电池\", \"garbageType\": 4}, {\"questionId\": 354, \"garbageName\": \"纽扣电池\", \"garbageType\": 4}, {\"questionId\": 375, \"garbageName\": \"电池\", \"garbageType\": 4}, {\"questionId\": 401, \"garbageName\": \"镍镉电池\", \"garbageType\": 4}, {\"questionId\": 524, \"garbageName\": \"锂电池\", \"garbageType\": 4}, {\"questionId\": 533, \"garbageName\": \"手机电池\", \"garbageType\": 4}]', '2019-08-13 17:29:08');
INSERT INTO `keyword_result` VALUES (1887, '书', '[{\"questionId\": 152, \"garbageName\": \"旧书包\", \"garbageType\": 3}, {\"questionId\": 251, \"garbageName\": \"废弃书本\", \"garbageType\": 3}, {\"questionId\": 451, \"garbageName\": \"书本\", \"garbageType\": 3}, {\"questionId\": 489, \"garbageName\": \"书包\", \"garbageType\": 3}, {\"questionId\": 736, \"garbageName\": \"教科书\", \"garbageType\": 4}]', '2019-08-13 23:30:08');
INSERT INTO `keyword_result` VALUES (1888, '毛发', '[{\"questionId\": 28, \"garbageName\": \"毛发\", \"garbageType\": 1}]', '2019-08-14 00:45:32');
INSERT INTO `keyword_result` VALUES (1889, '傻逼', '[]', '2019-08-14 09:46:49');
INSERT INTO `keyword_result` VALUES (1890, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-14 09:46:55');
INSERT INTO `keyword_result` VALUES (1891, '竹篮', '[{\"questionId\": 41, \"garbageName\": \"竹篮\", \"garbageType\": 1}]', '2019-08-14 09:51:07');
INSERT INTO `keyword_result` VALUES (1892, '胶带', '[{\"questionId\": 34, \"garbageName\": \"胶带\", \"garbageType\": 1}]', '2019-08-14 14:04:50');
INSERT INTO `keyword_result` VALUES (1893, '甘蔗皮', '[{\"questionId\": 24, \"garbageName\": \"甘蔗皮\", \"garbageType\": 1}]', '2019-08-14 15:33:58');
INSERT INTO `keyword_result` VALUES (1894, '黄豆', '[{\"questionId\": 62, \"garbageName\": \"黄豆\", \"garbageType\": 2}]', '2019-08-14 16:08:41');
INSERT INTO `keyword_result` VALUES (1895, '榴莲壳', '[{\"questionId\": 21, \"garbageName\": \"榴莲壳\", \"garbageType\": 1}]', '2019-08-14 21:08:21');
INSERT INTO `keyword_result` VALUES (1896, '牛奶盒', '[{\"questionId\": 334, \"garbageName\": \"牛奶盒\", \"garbageType\": 3}]', '2019-08-14 21:08:30');
INSERT INTO `keyword_result` VALUES (1897, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2019-08-14 21:08:43');
INSERT INTO `keyword_result` VALUES (1898, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-08-14 21:23:45');
INSERT INTO `keyword_result` VALUES (1899, '天堂伞', '[{\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}]', '2019-08-14 21:23:49');
INSERT INTO `keyword_result` VALUES (1900, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-08-14 21:23:53');
INSERT INTO `keyword_result` VALUES (1901, '甘蔗皮', '[{\"questionId\": 24, \"garbageName\": \"甘蔗皮\", \"garbageType\": 1}]', '2019-08-14 21:23:57');
INSERT INTO `keyword_result` VALUES (1902, '生蚝壳', '[{\"questionId\": 53, \"garbageName\": \"生蚝壳\", \"garbageType\": 1}]', '2019-08-14 21:24:00');
INSERT INTO `keyword_result` VALUES (1903, '竹筷', '[{\"questionId\": 42, \"garbageName\": \"竹筷\", \"garbageType\": 1}]', '2019-08-14 21:24:03');
INSERT INTO `keyword_result` VALUES (1904, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-08-14 21:24:07');
INSERT INTO `keyword_result` VALUES (1905, '面条', '[{\"questionId\": 60, \"garbageName\": \"面条\", \"garbageType\": 2}]', '2019-08-14 21:24:10');
INSERT INTO `keyword_result` VALUES (1906, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2019-08-14 21:24:14');
INSERT INTO `keyword_result` VALUES (1907, '蔬菜', '[{\"questionId\": 87, \"garbageName\": \"蔬菜\", \"garbageType\": 2}]', '2019-08-14 21:24:17');
INSERT INTO `keyword_result` VALUES (1908, '虾头', '[{\"questionId\": 81, \"garbageName\": \"虾头\", \"garbageType\": 2}, {\"questionId\": 594, \"garbageName\": \"小龙虾头\", \"garbageType\": 2}]', '2019-08-14 21:24:19');
INSERT INTO `keyword_result` VALUES (1909, '天堂伞', '[{\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}]', '2019-08-14 21:24:22');
INSERT INTO `keyword_result` VALUES (1910, '炉渣', '[{\"questionId\": 30, \"garbageName\": \"炉渣\", \"garbageType\": 1}]', '2019-08-14 22:48:46');
INSERT INTO `keyword_result` VALUES (1911, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-14 22:48:47');
INSERT INTO `keyword_result` VALUES (1912, '炉渣', '[{\"questionId\": 30, \"garbageName\": \"炉渣\", \"garbageType\": 1}]', '2019-08-14 22:48:57');
INSERT INTO `keyword_result` VALUES (1913, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-15 14:45:16');
INSERT INTO `keyword_result` VALUES (1914, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-15 14:45:16');
INSERT INTO `keyword_result` VALUES (1915, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-15 14:45:16');
INSERT INTO `keyword_result` VALUES (1916, '狗尿垫', '[{\"questionId\": 9, \"garbageName\": \"狗尿垫\", \"garbageType\": 1}]', '2019-08-15 14:45:20');
INSERT INTO `keyword_result` VALUES (1917, '灰土', '[{\"questionId\": 29, \"garbageName\": \"灰土\", \"garbageType\": 1}]', '2019-08-15 14:45:33');
INSERT INTO `keyword_result` VALUES (1918, '编织袋', '[{\"questionId\": 15, \"garbageName\": \"编织袋\", \"garbageType\": 1}]', '2019-08-15 17:31:11');
INSERT INTO `keyword_result` VALUES (1919, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-08-16 00:21:56');
INSERT INTO `keyword_result` VALUES (1920, '榴莲核', '[{\"questionId\": 25, \"garbageName\": \"榴莲核\", \"garbageType\": 1}]', '2019-08-16 11:37:59');
INSERT INTO `keyword_result` VALUES (1921, '榴莲核', '[{\"questionId\": 25, \"garbageName\": \"榴莲核\", \"garbageType\": 1}]', '2019-08-16 11:38:03');
INSERT INTO `keyword_result` VALUES (1922, '编织袋', '[{\"questionId\": 15, \"garbageName\": \"编织袋\", \"garbageType\": 1}]', '2019-08-16 14:04:33');
INSERT INTO `keyword_result` VALUES (1923, '捏手办的橡皮泥', '[]', '2019-08-16 14:57:53');
INSERT INTO `keyword_result` VALUES (1924, '椰子壳', '[{\"questionId\": 20, \"garbageName\": \"椰子壳\", \"garbageType\": 1}]', '2019-08-16 17:09:40');
INSERT INTO `keyword_result` VALUES (1925, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 00:25:54');
INSERT INTO `keyword_result` VALUES (1926, '@@::@@', '[]', '2019-08-17 00:25:56');
INSERT INTO `keyword_result` VALUES (1927, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-17 00:26:21');
INSERT INTO `keyword_result` VALUES (1928, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-17 00:26:22');
INSERT INTO `keyword_result` VALUES (1929, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-17 00:26:22');
INSERT INTO `keyword_result` VALUES (1930, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-17 00:26:24');
INSERT INTO `keyword_result` VALUES (1931, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-17 00:26:25');
INSERT INTO `keyword_result` VALUES (1932, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-17 00:26:25');
INSERT INTO `keyword_result` VALUES (1933, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-17 00:26:27');
INSERT INTO `keyword_result` VALUES (1934, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-17 00:26:28');
INSERT INTO `keyword_result` VALUES (1935, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-17 00:26:28');
INSERT INTO `keyword_result` VALUES (1936, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-08-17 00:26:30');
INSERT INTO `keyword_result` VALUES (1937, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-08-17 00:26:31');
INSERT INTO `keyword_result` VALUES (1938, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-08-17 00:26:31');
INSERT INTO `keyword_result` VALUES (1939, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-08-17 00:26:33');
INSERT INTO `keyword_result` VALUES (1940, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-08-17 00:26:34');
INSERT INTO `keyword_result` VALUES (1941, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-08-17 00:26:34');
INSERT INTO `keyword_result` VALUES (1942, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-08-17 00:26:36');
INSERT INTO `keyword_result` VALUES (1943, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-08-17 00:26:37');
INSERT INTO `keyword_result` VALUES (1944, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-08-17 00:26:37');
INSERT INTO `keyword_result` VALUES (1945, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 00:26:39');
INSERT INTO `keyword_result` VALUES (1946, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 00:26:40');
INSERT INTO `keyword_result` VALUES (1947, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 00:26:40');
INSERT INTO `keyword_result` VALUES (1948, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-08-17 00:26:42');
INSERT INTO `keyword_result` VALUES (1949, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-08-17 00:26:43');
INSERT INTO `keyword_result` VALUES (1950, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-08-17 00:26:43');
INSERT INTO `keyword_result` VALUES (1951, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-08-17 00:26:44');
INSERT INTO `keyword_result` VALUES (1952, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-08-17 00:26:45');
INSERT INTO `keyword_result` VALUES (1953, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-08-17 00:26:46');
INSERT INTO `keyword_result` VALUES (1954, '@@::@@', '[]', '2019-08-17 00:26:47');
INSERT INTO `keyword_result` VALUES (1955, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-17 00:28:29');
INSERT INTO `keyword_result` VALUES (1956, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-17 00:28:30');
INSERT INTO `keyword_result` VALUES (1957, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-17 00:28:31');
INSERT INTO `keyword_result` VALUES (1958, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-17 00:28:32');
INSERT INTO `keyword_result` VALUES (1959, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-17 00:28:33');
INSERT INTO `keyword_result` VALUES (1960, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-17 00:28:34');
INSERT INTO `keyword_result` VALUES (1961, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-17 00:28:35');
INSERT INTO `keyword_result` VALUES (1962, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-17 00:28:36');
INSERT INTO `keyword_result` VALUES (1963, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-17 00:28:37');
INSERT INTO `keyword_result` VALUES (1964, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-08-17 00:28:38');
INSERT INTO `keyword_result` VALUES (1965, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-08-17 00:28:39');
INSERT INTO `keyword_result` VALUES (1966, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-08-17 00:28:40');
INSERT INTO `keyword_result` VALUES (1967, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-08-17 00:28:41');
INSERT INTO `keyword_result` VALUES (1968, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-08-17 00:28:42');
INSERT INTO `keyword_result` VALUES (1969, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-08-17 00:28:43');
INSERT INTO `keyword_result` VALUES (1970, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-08-17 00:28:44');
INSERT INTO `keyword_result` VALUES (1971, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-08-17 00:28:46');
INSERT INTO `keyword_result` VALUES (1972, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-08-17 00:28:46');
INSERT INTO `keyword_result` VALUES (1973, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-08-17 00:28:47');
INSERT INTO `keyword_result` VALUES (1974, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-08-17 00:28:48');
INSERT INTO `keyword_result` VALUES (1975, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-08-17 00:28:49');
INSERT INTO `keyword_result` VALUES (1976, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 00:28:50');
INSERT INTO `keyword_result` VALUES (1977, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 00:28:51');
INSERT INTO `keyword_result` VALUES (1978, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 00:28:52');
INSERT INTO `keyword_result` VALUES (1979, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 00:28:52');
INSERT INTO `keyword_result` VALUES (1980, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 00:28:53');
INSERT INTO `keyword_result` VALUES (1981, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 00:28:54');
INSERT INTO `keyword_result` VALUES (1982, '@@::@@', '[]', '2019-08-17 00:28:56');
INSERT INTO `keyword_result` VALUES (1983, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 01:40:42');
INSERT INTO `keyword_result` VALUES (1984, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 01:40:43');
INSERT INTO `keyword_result` VALUES (1985, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 01:40:44');
INSERT INTO `keyword_result` VALUES (1986, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 01:40:48');
INSERT INTO `keyword_result` VALUES (1987, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 01:40:49');
INSERT INTO `keyword_result` VALUES (1988, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-17 01:40:50');
INSERT INTO `keyword_result` VALUES (1989, '@@::@@', '[]', '2019-08-17 01:40:51');
INSERT INTO `keyword_result` VALUES (1990, '大骨头', '[{\"questionId\": 17, \"garbageName\": \"大骨头\", \"garbageType\": 1}]', '2019-08-17 10:25:41');
INSERT INTO `keyword_result` VALUES (1991, '避孕套', '[{\"questionId\": 607, \"garbageName\": \"避孕套\", \"garbageType\": 1}]', '2019-08-17 10:25:51');
INSERT INTO `keyword_result` VALUES (1992, '精子', '[]', '2019-08-17 10:26:00');
INSERT INTO `keyword_result` VALUES (1993, '出于垃圾', '[]', '2019-08-17 10:45:08');
INSERT INTO `keyword_result` VALUES (1994, '牛肉', '[{\"questionId\": 68, \"garbageName\": \"牛肉\", \"garbageType\": 2}, {\"questionId\": 103, \"garbageName\": \"牛肉干\", \"garbageType\": 2}]', '2019-08-17 10:45:26');
INSERT INTO `keyword_result` VALUES (1995, '西瓜皮', '[{\"questionId\": 115, \"garbageName\": \"西瓜皮\", \"garbageType\": 2}]', '2019-08-19 06:56:22');
INSERT INTO `keyword_result` VALUES (1996, '烟盒', '[{\"questionId\": 54, \"garbageName\": \"烟盒\", \"garbageType\": 1}]', '2019-08-19 11:44:14');
INSERT INTO `keyword_result` VALUES (1997, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-08-19 11:44:32');
INSERT INTO `keyword_result` VALUES (1998, '开心果', '[{\"questionId\": 55, \"garbageName\": \"开心果\", \"garbageType\": 1}, {\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-08-19 13:29:09');
INSERT INTO `keyword_result` VALUES (1999, '开心果壳', '[{\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-08-19 13:29:19');
INSERT INTO `keyword_result` VALUES (2000, '开心果壳', '[{\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-08-19 13:29:27');
INSERT INTO `keyword_result` VALUES (2001, '开心果壳', '[{\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-08-19 13:30:17');
INSERT INTO `keyword_result` VALUES (2002, '开心果', '[{\"questionId\": 55, \"garbageName\": \"开心果\", \"garbageType\": 1}, {\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-08-19 13:30:25');
INSERT INTO `keyword_result` VALUES (2003, '开心果壳', '[{\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-08-19 13:30:32');
INSERT INTO `keyword_result` VALUES (2004, '开心果', '[{\"questionId\": 55, \"garbageName\": \"开心果\", \"garbageType\": 1}, {\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-08-19 13:31:22');
INSERT INTO `keyword_result` VALUES (2005, '开心果壳', '[{\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-08-19 13:31:25');
INSERT INTO `keyword_result` VALUES (2006, '开心果壳', '[{\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-08-19 13:31:39');
INSERT INTO `keyword_result` VALUES (2007, '污损塑料', '[{\"questionId\": 13, \"garbageName\": \"污损塑料\", \"garbageType\": 1}, {\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}]', '2019-08-19 21:32:47');
INSERT INTO `keyword_result` VALUES (2008, '椰子壳', '[{\"questionId\": 20, \"garbageName\": \"椰子壳\", \"garbageType\": 1}]', '2019-08-20 15:54:11');
INSERT INTO `keyword_result` VALUES (2009, '椰子壳', '[{\"questionId\": 20, \"garbageName\": \"椰子壳\", \"garbageType\": 1}]', '2019-08-20 15:54:17');
INSERT INTO `keyword_result` VALUES (2010, '汽水瓶', '[]', '2019-08-20 15:54:36');
INSERT INTO `keyword_result` VALUES (2011, '汽水瓶', '[]', '2019-08-20 15:54:39');
INSERT INTO `keyword_result` VALUES (2012, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-20 15:54:42');
INSERT INTO `keyword_result` VALUES (2013, '牙签', '[{\"questionId\": 43, \"garbageName\": \"牙签\", \"garbageType\": 1}, {\"questionId\": 670, \"garbageName\": \"牙签盒\", \"garbageType\": 1}]', '2019-08-21 11:19:50');
INSERT INTO `keyword_result` VALUES (2014, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-21 14:57:11');
INSERT INTO `keyword_result` VALUES (2015, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-21 14:57:11');
INSERT INTO `keyword_result` VALUES (2016, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-08-21 15:57:14');
INSERT INTO `keyword_result` VALUES (2017, '咸鸭蛋', '[{\"questionId\": 72, \"garbageName\": \"咸鸭蛋\", \"garbageType\": 2}]', '2019-08-21 16:33:44');
INSERT INTO `keyword_result` VALUES (2018, '布绒玩具', '[]', '2019-08-21 17:01:03');
INSERT INTO `keyword_result` VALUES (2019, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-21 17:01:07');
INSERT INTO `keyword_result` VALUES (2020, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-21 17:01:09');
INSERT INTO `keyword_result` VALUES (2021, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-21 17:01:11');
INSERT INTO `keyword_result` VALUES (2022, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-21 17:01:13');
INSERT INTO `keyword_result` VALUES (2023, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-21 17:01:14');
INSERT INTO `keyword_result` VALUES (2024, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-21 17:01:14');
INSERT INTO `keyword_result` VALUES (2025, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-21 17:01:15');
INSERT INTO `keyword_result` VALUES (2026, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-21 17:01:22');
INSERT INTO `keyword_result` VALUES (2027, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-08-21 17:01:28');
INSERT INTO `keyword_result` VALUES (2028, '竹筷', '[{\"questionId\": 42, \"garbageName\": \"竹筷\", \"garbageType\": 1}]', '2019-08-21 20:27:48');
INSERT INTO `keyword_result` VALUES (2029, '伞', '[{\"questionId\": 45, \"garbageName\": \"伞\", \"garbageType\": 1}, {\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-08-21 20:28:00');
INSERT INTO `keyword_result` VALUES (2030, '手提袋', 'null', '2019-08-22 11:22:18');
INSERT INTO `keyword_result` VALUES (2031, '手提袋', '[{\"questionId\": 663, \"garbageName\": \"手提袋\", \"garbageType\": 1}]', '2019-08-22 11:22:24');
INSERT INTO `keyword_result` VALUES (2032, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-22 11:22:49');
INSERT INTO `keyword_result` VALUES (2033, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-22 11:23:03');
INSERT INTO `keyword_result` VALUES (2034, '马克杯', 'null', '2019-08-22 11:39:10');
INSERT INTO `keyword_result` VALUES (2035, '马克杯', '[{\"questionId\": 124, \"garbageName\": \"马克杯\", \"garbageType\": 1}]', '2019-08-22 11:39:14');
INSERT INTO `keyword_result` VALUES (2036, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-23 02:47:21');
INSERT INTO `keyword_result` VALUES (2037, '鸡骨头', '[{\"questionId\": 560, \"garbageName\": \"鸡骨头\", \"garbageType\": 2}]', '2019-08-23 10:51:09');
INSERT INTO `keyword_result` VALUES (2038, '毛发', '[{\"questionId\": 28, \"garbageName\": \"毛发\", \"garbageType\": 1}]', '2019-08-24 16:33:12');
INSERT INTO `keyword_result` VALUES (2039, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-24 19:02:45');
INSERT INTO `keyword_result` VALUES (2040, '苹果核', '[{\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-24 19:03:01');
INSERT INTO `keyword_result` VALUES (2041, '铅笔', '[{\"questionId\": 49, \"garbageName\": \"铅笔\", \"garbageType\": 1}, {\"questionId\": 735, \"garbageName\": \"金属铅笔盒\", \"garbageType\": 3}]', '2019-08-24 19:03:12');
INSERT INTO `keyword_result` VALUES (2042, '鸭肉', '[{\"questionId\": 66, \"garbageName\": \"鸭肉\", \"garbageType\": 2}]', '2019-08-24 23:02:28');
INSERT INTO `keyword_result` VALUES (2043, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-08-25 10:55:57');
INSERT INTO `keyword_result` VALUES (2044, '伞', '[{\"questionId\": 45, \"garbageName\": \"伞\", \"garbageType\": 1}, {\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-08-25 10:56:07');
INSERT INTO `keyword_result` VALUES (2045, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-08-25 13:14:45');
INSERT INTO `keyword_result` VALUES (2046, '奶茶杯', '[{\"remark\": \"喝完好喝的奶茶，记得把奶茶杯放进干垃圾桶哟\", \"questionId\": 427, \"garbageName\": \"奶茶杯\", \"garbageType\": 1}]', '2019-08-25 13:14:52');
INSERT INTO `keyword_result` VALUES (2047, '电脑', 'null', '2019-08-26 11:06:58');
INSERT INTO `keyword_result` VALUES (2048, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-08-26 11:07:07');
INSERT INTO `keyword_result` VALUES (2049, '手掌', 'null', '2019-08-26 11:07:28');
INSERT INTO `keyword_result` VALUES (2050, '手掌', '[]', '2019-08-26 11:07:30');
INSERT INTO `keyword_result` VALUES (2051, '屎', '[{\"remark\": \"属于宠物粪便，不建议归入到当前垃圾分类当中；实在不便时，可包裹后投入干垃圾桶内\", \"questionId\": 429, \"garbageName\": \"狗屎\", \"garbageType\": 1}, {\"questionId\": 815, \"garbageName\": \"鼻屎\", \"garbageType\": 1}, {\"questionId\": 816, \"garbageName\": \"狗屎指\", \"garbageType\": 1}, {\"questionId\": 817, \"garbageName\": \"耳屎\", \"garbageType\": 1}]', '2019-08-26 11:07:42');
INSERT INTO `keyword_result` VALUES (2052, '粪便', '[]', '2019-08-26 11:07:52');
INSERT INTO `keyword_result` VALUES (2053, '尿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}, {\"questionId\": 9, \"garbageName\": \"狗尿垫\", \"garbageType\": 1}, {\"questionId\": 195, \"garbageName\": \"纸尿裤\", \"garbageType\": 1}, {\"questionId\": 637, \"garbageName\": \"尿布\", \"garbageType\": 1}]', '2019-08-26 11:08:39');
INSERT INTO `keyword_result` VALUES (2054, '口水', '[]', '2019-08-26 11:08:52');
INSERT INTO `keyword_result` VALUES (2055, '唾液', '[]', '2019-08-26 11:08:58');
INSERT INTO `keyword_result` VALUES (2056, '唾液', '[]', '2019-08-26 11:09:00');
INSERT INTO `keyword_result` VALUES (2057, '鼻涕', '[]', '2019-08-26 11:09:09');
INSERT INTO `keyword_result` VALUES (2058, '避孕套', '[{\"questionId\": 607, \"garbageName\": \"避孕套\", \"garbageType\": 1}]', '2019-08-26 11:09:40');
INSERT INTO `keyword_result` VALUES (2059, '榴莲核', '[{\"questionId\": 25, \"garbageName\": \"榴莲核\", \"garbageType\": 1}]', '2019-08-26 14:12:23');
INSERT INTO `keyword_result` VALUES (2060, '尿包', '[]', '2019-08-26 14:35:11');
INSERT INTO `keyword_result` VALUES (2061, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2019-08-26 16:06:02');
INSERT INTO `keyword_result` VALUES (2062, '空心菜', '[{\"questionId\": 89, \"garbageName\": \"空心菜\", \"garbageType\": 2}]', '2019-08-26 17:50:34');
INSERT INTO `keyword_result` VALUES (2063, '伞', '[{\"questionId\": 45, \"garbageName\": \"伞\", \"garbageType\": 1}, {\"questionId\": 46, \"garbageName\": \"雨伞\", \"garbageType\": 1}, {\"questionId\": 47, \"garbageName\": \"天堂伞\", \"garbageType\": 1}, {\"questionId\": 346, \"garbageName\": \"雨伞骨架\", \"garbageType\": 3}]', '2019-08-26 17:56:43');
INSERT INTO `keyword_result` VALUES (2064, '太空沙', '[{\"questionId\": 32, \"garbageName\": \"太空沙\", \"garbageType\": 1}]', '2019-08-26 17:57:35');
INSERT INTO `keyword_result` VALUES (2065, '瓶子', '[]', '2019-08-27 08:03:37');
INSERT INTO `keyword_result` VALUES (2066, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-27 08:03:45');
INSERT INTO `keyword_result` VALUES (2067, '干燥剂', '[{\"questionId\": 12, \"garbageName\": \"干燥剂\", \"garbageType\": 1}]', '2019-08-27 11:15:55');
INSERT INTO `keyword_result` VALUES (2068, '陶瓷制品', '[{\"questionId\": 40, \"garbageName\": \"陶瓷制品\", \"garbageType\": 1}]', '2019-08-27 17:52:45');
INSERT INTO `keyword_result` VALUES (2069, '电视机', 'null', '2019-08-28 09:14:14');
INSERT INTO `keyword_result` VALUES (2070, '超级星光大道', '[]', '2019-08-28 09:14:25');
INSERT INTO `keyword_result` VALUES (2071, '眼镜', '[{\"questionId\": 51, \"garbageName\": \"眼镜\", \"garbageType\": 1}, {\"questionId\": 126, \"garbageName\": \"3D眼镜\", \"garbageType\": 1}, {\"questionId\": 665, \"garbageName\": \"黑框眼镜\", \"garbageType\": 1}, {\"questionId\": 666, \"garbageName\": \"隐形眼镜\", \"garbageType\": 1}]', '2019-08-28 10:30:26');
INSERT INTO `keyword_result` VALUES (2072, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2019-08-28 17:30:28');
INSERT INTO `keyword_result` VALUES (2073, '午餐肉', '[{\"questionId\": 75, \"garbageName\": \"午餐肉\", \"garbageType\": 2}]', '2019-08-28 17:31:50');
INSERT INTO `keyword_result` VALUES (2074, '塑料袋', '[{\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}, {\"questionId\": 603, \"garbageName\": \"塑料袋\", \"garbageType\": 1}, {\"questionId\": 647, \"garbageName\": \"肮脏塑料袋\", \"garbageType\": 1}]', '2019-08-28 17:32:06');
INSERT INTO `keyword_result` VALUES (2075, '开心果', '[{\"questionId\": 55, \"garbageName\": \"开心果\", \"garbageType\": 1}, {\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-08-28 17:43:14');
INSERT INTO `keyword_result` VALUES (2076, '尼龙制品', '[{\"questionId\": 14, \"garbageName\": \"尼龙制品\", \"garbageType\": 1}]', '2019-08-28 18:51:30');
INSERT INTO `keyword_result` VALUES (2077, '塑料袋', '[{\"questionId\": 205, \"garbageName\": \"污损塑料袋\", \"garbageType\": 1}, {\"questionId\": 603, \"garbageName\": \"塑料袋\", \"garbageType\": 1}, {\"questionId\": 647, \"garbageName\": \"肮脏塑料袋\", \"garbageType\": 1}]', '2019-08-28 21:32:16');
INSERT INTO `keyword_result` VALUES (2078, '硬贝壳', '[{\"questionId\": 18, \"garbageName\": \"硬贝壳\", \"garbageType\": 1}]', '2019-08-28 22:24:30');
INSERT INTO `keyword_result` VALUES (2079, '鸡蛋壳', '[{\"questionId\": 424, \"garbageName\": \"鸡蛋壳\", \"garbageType\": 2}]', '2019-08-29 08:43:18');
INSERT INTO `keyword_result` VALUES (2080, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-08-29 11:35:29');
INSERT INTO `keyword_result` VALUES (2081, '牛骨头', '[{\"questionId\": 27, \"garbageName\": \"牛骨头\", \"garbageType\": 1}]', '2019-08-29 11:36:17');
INSERT INTO `keyword_result` VALUES (2082, '鞋套', '[]', '2019-08-29 11:36:31');
INSERT INTO `keyword_result` VALUES (2083, '章鱼', '[{\"questionId\": 85, \"garbageName\": \"章鱼\", \"garbageType\": 2}]', '2019-08-29 12:00:10');
INSERT INTO `keyword_result` VALUES (2084, '人', '[]', '2019-08-29 12:00:17');
INSERT INTO `keyword_result` VALUES (2085, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-29 12:00:36');
INSERT INTO `keyword_result` VALUES (2086, '车', '[{\"questionId\": 749, \"garbageName\": \"行车记录仪\", \"garbageType\": 3}, {\"questionId\": 758, \"garbageName\": \"车厘子\", \"garbageType\": 2}]', '2019-08-29 12:01:08');
INSERT INTO `keyword_result` VALUES (2087, '行车记录仪', '[{\"questionId\": 749, \"garbageName\": \"行车记录仪\", \"garbageType\": 3}]', '2019-08-29 12:01:12');
INSERT INTO `keyword_result` VALUES (2088, '居家室内', 'null', '2019-08-29 14:17:54');
INSERT INTO `keyword_result` VALUES (2089, '居家室内', '[]', '2019-08-29 14:18:06');
INSERT INTO `keyword_result` VALUES (2090, '女孩', 'null', '2019-08-29 14:18:18');
INSERT INTO `keyword_result` VALUES (2091, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-08-29 14:18:34');
INSERT INTO `keyword_result` VALUES (2092, '卷心菜', '[{\"questionId\": 90, \"garbageName\": \"卷心菜\", \"garbageType\": 2}]', '2019-08-29 14:46:42');
INSERT INTO `keyword_result` VALUES (2093, '碗', 'null', '2019-08-29 14:47:08');
INSERT INTO `keyword_result` VALUES (2094, '菜肴', '[]', '2019-08-29 14:47:20');
INSERT INTO `keyword_result` VALUES (2095, '菜肴', '[]', '2019-08-29 14:47:26');
INSERT INTO `keyword_result` VALUES (2096, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-08-29 14:47:38');
INSERT INTO `keyword_result` VALUES (2097, '毛巾', '[{\"questionId\": 36, \"garbageName\": \"毛巾\", \"garbageType\": 1}]', '2019-08-29 15:07:35');
INSERT INTO `keyword_result` VALUES (2098, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-08-29 15:07:42');
INSERT INTO `keyword_result` VALUES (2099, '榴莲核', '[{\"questionId\": 25, \"garbageName\": \"榴莲核\", \"garbageType\": 1}]', '2019-08-29 15:32:42');
INSERT INTO `keyword_result` VALUES (2100, '电脑', '[{\"remark\": \"可回收哟\", \"questionId\": 3, \"garbageName\": \"电脑\", \"garbageType\": 3}, {\"questionId\": 667, \"garbageName\": \"台式电脑\", \"garbageType\": 3}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 820, \"garbageName\": \"平板电脑\", \"garbageType\": 3}]', '2019-08-29 15:33:00');
INSERT INTO `keyword_result` VALUES (2101, '电视机', 'null', '2019-08-29 16:10:45');
INSERT INTO `keyword_result` VALUES (2102, '开心果', '[{\"questionId\": 55, \"garbageName\": \"开心果\", \"garbageType\": 1}, {\"questionId\": 584, \"garbageName\": \"开心果壳\", \"garbageType\": 2}]', '2019-08-29 16:40:59');
INSERT INTO `keyword_result` VALUES (2103, '毛巾', '[{\"questionId\": 36, \"garbageName\": \"毛巾\", \"garbageType\": 1}]', '2019-08-29 16:43:21');
INSERT INTO `keyword_result` VALUES (2104, '枣', '[{\"questionId\": 105, \"garbageName\": \"红枣\", \"garbageType\": 2}, {\"questionId\": 593, \"garbageName\": \"枣核\", \"garbageType\": 2}]', '2019-08-29 19:28:05');
INSERT INTO `keyword_result` VALUES (2105, '一次性塑料杯', '[]', '2019-08-29 22:28:04');
INSERT INTO `keyword_result` VALUES (2106, '早饭饭盒', '[]', '2019-08-29 22:28:15');
INSERT INTO `keyword_result` VALUES (2107, '塑料吸管', '[]', '2019-08-30 08:36:41');
INSERT INTO `keyword_result` VALUES (2108, '塑料吸管', '[]', '2019-08-30 08:36:48');
INSERT INTO `keyword_result` VALUES (2109, '吸管', '[{\"questionId\": 617, \"garbageName\": \"吸管\", \"garbageType\": 1}]', '2019-08-30 08:36:54');
INSERT INTO `keyword_result` VALUES (2110, '大骨头', '[{\"questionId\": 17, \"garbageName\": \"大骨头\", \"garbageType\": 1}]', '2019-08-30 10:29:31');
INSERT INTO `keyword_result` VALUES (2111, '电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}, {\"questionId\": 158, \"garbageName\": \"蓄电池\", \"garbageType\": 4}, {\"questionId\": 350, \"garbageName\": \"充电电池\", \"garbageType\": 4}, {\"questionId\": 351, \"garbageName\": \"镉镍电池\", \"garbageType\": 4}, {\"questionId\": 352, \"garbageName\": \"铅酸电池\", \"garbageType\": 4}, {\"questionId\": 354, \"garbageName\": \"纽扣电池\", \"garbageType\": 4}, {\"questionId\": 375, \"garbageName\": \"电池\", \"garbageType\": 4}, {\"questionId\": 401, \"garbageName\": \"镍镉电池\", \"garbageType\": 4}, {\"questionId\": 524, \"garbageName\": \"锂电池\", \"garbageType\": 4}, {\"questionId\": 533, \"garbageName\": \"手机电池\", \"garbageType\": 4}]', '2019-08-30 10:30:27');
INSERT INTO `keyword_result` VALUES (2112, '蟑螂屋', '[]', '2019-08-30 10:30:53');
INSERT INTO `keyword_result` VALUES (2113, '蟑螂', '[{\"questionId\": 544, \"garbageName\": \"蟑螂药\", \"garbageType\": 4}, {\"questionId\": 546, \"garbageName\": \"蟑螂丸\", \"garbageType\": 4}]', '2019-08-30 10:31:03');
INSERT INTO `keyword_result` VALUES (2114, '牙签', '[{\"questionId\": 43, \"garbageName\": \"牙签\", \"garbageType\": 1}, {\"questionId\": 670, \"garbageName\": \"牙签盒\", \"garbageType\": 1}]', '2019-08-30 14:55:52');
INSERT INTO `keyword_result` VALUES (2115, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2019-08-30 14:56:31');
INSERT INTO `keyword_result` VALUES (2116, '绿豆', '[{\"questionId\": 64, \"garbageName\": \"绿豆\", \"garbageType\": 2}]', '2019-08-30 18:31:44');
INSERT INTO `keyword_result` VALUES (2117, '电视机', 'null', '2019-08-31 20:32:06');
INSERT INTO `keyword_result` VALUES (2118, '方便面袋', '[]', '2019-08-31 20:34:42');
INSERT INTO `keyword_result` VALUES (2119, '方便面', '[{\"questionId\": 146, \"garbageName\": \"方便面盒\", \"garbageType\": 1}]', '2019-08-31 20:34:51');
INSERT INTO `keyword_result` VALUES (2120, '方便面盒', '[{\"questionId\": 146, \"garbageName\": \"方便面盒\", \"garbageType\": 1}]', '2019-08-31 20:34:53');
INSERT INTO `keyword_result` VALUES (2121, '化妆品', '[{\"questionId\": 286, \"garbageName\": \"化妆品瓶\", \"garbageType\": 3}, {\"questionId\": 394, \"garbageName\": \"过期化妆品\", \"garbageType\": 4}]', '2019-09-01 00:19:57');
INSERT INTO `keyword_result` VALUES (2122, '化妆品', '[{\"questionId\": 286, \"garbageName\": \"化妆品瓶\", \"garbageType\": 3}, {\"questionId\": 394, \"garbageName\": \"过期化妆品\", \"garbageType\": 4}]', '2019-09-01 00:19:59');
INSERT INTO `keyword_result` VALUES (2123, '过期化妆品', '[{\"questionId\": 394, \"garbageName\": \"过期化妆品\", \"garbageType\": 4}]', '2019-09-01 00:20:04');
INSERT INTO `keyword_result` VALUES (2124, '粉底液', 'null', '2019-09-01 00:20:06');
INSERT INTO `keyword_result` VALUES (2125, '粉底液', '[]', '2019-09-01 00:20:17');
INSERT INTO `keyword_result` VALUES (2126, '粉底液', '[]', '2019-09-01 00:20:21');
INSERT INTO `keyword_result` VALUES (2127, '包装袋/盒', 'null', '2019-09-01 11:17:47');
INSERT INTO `keyword_result` VALUES (2128, '酸奶利乐包装盒', '[{\"questionId\": 488, \"garbageName\": \"酸奶利乐包装盒\", \"garbageType\": 3}]', '2019-09-01 11:18:11');
INSERT INTO `keyword_result` VALUES (2129, '眼镜', '[{\"questionId\": 51, \"garbageName\": \"眼镜\", \"garbageType\": 1}, {\"questionId\": 126, \"garbageName\": \"3D眼镜\", \"garbageType\": 1}, {\"questionId\": 665, \"garbageName\": \"黑框眼镜\", \"garbageType\": 1}, {\"questionId\": 666, \"garbageName\": \"隐形眼镜\", \"garbageType\": 1}]', '2019-09-01 11:50:51');
INSERT INTO `keyword_result` VALUES (2130, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-01 11:52:51');
INSERT INTO `keyword_result` VALUES (2131, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-09-01 11:52:53');
INSERT INTO `keyword_result` VALUES (2132, '避孕套', '[{\"questionId\": 607, \"garbageName\": \"避孕套\", \"garbageType\": 1}]', '2019-09-01 13:23:44');
INSERT INTO `keyword_result` VALUES (2133, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-09-01 13:24:26');
INSERT INTO `keyword_result` VALUES (2134, '透明熟料包装袋', '[]', '2019-09-01 13:30:05');
INSERT INTO `keyword_result` VALUES (2135, '透明塑料包装', '[]', '2019-09-01 13:30:20');
INSERT INTO `keyword_result` VALUES (2136, '透明塑料包装', '[]', '2019-09-01 13:30:22');
INSERT INTO `keyword_result` VALUES (2137, '塑料包装', '[{\"questionId\": 490, \"garbageName\": \"塑料包装纸\", \"garbageType\": 3}]', '2019-09-01 13:30:26');
INSERT INTO `keyword_result` VALUES (2138, '塑料包装纸', '[{\"questionId\": 490, \"garbageName\": \"塑料包装纸\", \"garbageType\": 3}]', '2019-09-01 13:30:28');
INSERT INTO `keyword_result` VALUES (2139, '面', '[{\"questionId\": 58, \"garbageName\": \"面\", \"garbageType\": 2}, {\"questionId\": 59, \"garbageName\": \"面包\", \"garbageType\": 2}, {\"questionId\": 60, \"garbageName\": \"面条\", \"garbageType\": 2}, {\"questionId\": 107, \"garbageName\": \"面粉\", \"garbageType\": 2}, {\"questionId\": 146, \"garbageName\": \"方便面盒\", \"garbageType\": 1}, {\"questionId\": 610, \"garbageName\": \"面膜\", \"garbageType\": 1}]', '2019-09-01 15:49:54');
INSERT INTO `keyword_result` VALUES (2140, '香蕉', '[{\"questionId\": 116, \"garbageName\": \"香蕉皮\", \"garbageType\": 2}, {\"questionId\": 597, \"garbageName\": \"香蕉\", \"garbageType\": 2}]', '2019-09-01 15:50:03');
INSERT INTO `keyword_result` VALUES (2141, '香蕉皮', '[{\"questionId\": 116, \"garbageName\": \"香蕉皮\", \"garbageType\": 2}]', '2019-09-01 15:50:23');
INSERT INTO `keyword_result` VALUES (2142, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-09-01 22:17:00');
INSERT INTO `keyword_result` VALUES (2143, '核桃皮', '[]', '2019-09-02 00:25:49');
INSERT INTO `keyword_result` VALUES (2144, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-09-02 00:25:56');
INSERT INTO `keyword_result` VALUES (2145, '包装袋/盒', 'null', '2019-09-02 10:36:46');
INSERT INTO `keyword_result` VALUES (2146, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2019-09-02 14:49:21');
INSERT INTO `keyword_result` VALUES (2147, '马克杯', 'null', '2019-09-02 14:49:51');
INSERT INTO `keyword_result` VALUES (2148, '马克杯', '[{\"questionId\": 124, \"garbageName\": \"马克杯\", \"garbageType\": 1}]', '2019-09-02 14:49:59');
INSERT INTO `keyword_result` VALUES (2149, '毛发', '[{\"questionId\": 28, \"garbageName\": \"毛发\", \"garbageType\": 1}]', '2019-09-02 14:50:22');
INSERT INTO `keyword_result` VALUES (2150, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2019-09-02 14:59:23');
INSERT INTO `keyword_result` VALUES (2151, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-09-02 14:59:39');
INSERT INTO `keyword_result` VALUES (2152, '牛肉', '[{\"questionId\": 68, \"garbageName\": \"牛肉\", \"garbageType\": 2}, {\"questionId\": 103, \"garbageName\": \"牛肉干\", \"garbageType\": 2}]', '2019-09-02 15:00:18');
INSERT INTO `keyword_result` VALUES (2153, '咖喱', 'null', '2019-09-02 15:15:49');
INSERT INTO `keyword_result` VALUES (2154, '方便面（袋装）', '[]', '2019-09-02 15:15:55');
INSERT INTO `keyword_result` VALUES (2155, '米饭', '[{\"questionId\": 57, \"garbageName\": \"米饭\", \"garbageType\": 2}]', '2019-09-02 15:34:29');
INSERT INTO `keyword_result` VALUES (2156, '烟蒂', '[{\"questionId\": 11, \"garbageName\": \"烟蒂\", \"garbageType\": 1}]', '2019-09-02 17:20:38');
INSERT INTO `keyword_result` VALUES (2157, '竹篮', '[{\"questionId\": 41, \"garbageName\": \"竹篮\", \"garbageType\": 1}]', '2019-09-02 17:21:13');
INSERT INTO `keyword_result` VALUES (2158, '笔', '[{\"questionId\": 48, \"garbageName\": \"笔\", \"garbageType\": 1}, {\"questionId\": 49, \"garbageName\": \"铅笔\", \"garbageType\": 1}, {\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}, {\"questionId\": 129, \"garbageName\": \"笔盖\", \"garbageType\": 1}, {\"questionId\": 137, \"garbageName\": \"钢笔\", \"garbageType\": 1}, {\"questionId\": 145, \"garbageName\": \"圆珠笔\", \"garbageType\": 1}, {\"questionId\": 388, \"garbageName\": \"水彩笔\", \"garbageType\": 4}, {\"questionId\": 653, \"garbageName\": \"笔芯\", \"garbageType\": 1}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 702, \"garbageName\": \"笔记本\", \"garbageType\": 3}, {\"questionId\": 734, \"garbageName\": \"记号笔\", \"garbageType\": 1}, {\"questionId\": 735, \"garbageName\": \"金属铅笔盒\", \"garbageType\": 3}, {\"questionId\": 737, \"garbageName\": \"蜡笔\", \"garbageType\": 1}, {\"questionId\": 738, \"garbageName\": \"坏钢笔\", \"garbageType\": 1}, {\"questionId\": 739, \"garbageName\": \"中性笔\", \"garbageType\": 1}, {\"questionId\": 740, \"garbageName\": \"眉笔\", \"garbageType\": 1}, {\"questionId\": 741, \"garbageName\": \"粉笔\", \"garbageType\": 1}, {\"questionId\": 742, \"garbageName\": \"彩笔\", \"garbageType\": 1}, {\"questionId\": 743, \"garbageName\": \"马克笔\", \"garbageType\": 1}, {\"questionId\": 744, \"garbageName\": \"笔杆\", \"garbageType\": 1}, {\"questionId\": 745, \"garbageName\": \"笔套\", \"garbageType\": 1}, {\"questionId\": 746, \"garbageName\": \"红笔\", \"garbageType\": 1}, {\"questionId\": 747, \"garbageName\": \"勾线笔\", \"garbageType\": 1}, {\"questionId\": 748, \"garbageName\": \"可擦复写笔\", \"garbageType\": 1}]', '2019-09-02 17:21:20');
INSERT INTO `keyword_result` VALUES (2159, '榴莲壳', '[{\"questionId\": 21, \"garbageName\": \"榴莲壳\", \"garbageType\": 1}]', '2019-09-02 22:02:39');
INSERT INTO `keyword_result` VALUES (2160, '避孕套', '[{\"questionId\": 607, \"garbageName\": \"避孕套\", \"garbageType\": 1}]', '2019-09-02 23:06:55');
INSERT INTO `keyword_result` VALUES (2161, '卫生纸', '[{\"questionId\": 180, \"garbageName\": \"卫生纸\", \"garbageType\": 1}]', '2019-09-02 23:07:44');
INSERT INTO `keyword_result` VALUES (2162, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-09-03 09:20:46');
INSERT INTO `keyword_result` VALUES (2163, '椰子壳', '[{\"questionId\": 20, \"garbageName\": \"椰子壳\", \"garbageType\": 1}]', '2019-09-03 09:43:27');
INSERT INTO `keyword_result` VALUES (2164, '椰子壳', '[{\"questionId\": 20, \"garbageName\": \"椰子壳\", \"garbageType\": 1}]', '2019-09-03 09:43:31');
INSERT INTO `keyword_result` VALUES (2165, '鞠余林', '[]', '2019-09-03 09:43:39');
INSERT INTO `keyword_result` VALUES (2166, '烟', '[{\"questionId\": 11, \"garbageName\": \"烟蒂\", \"garbageType\": 1}, {\"questionId\": 54, \"garbageName\": \"烟盒\", \"garbageType\": 1}, {\"questionId\": 672, \"garbageName\": \"玻璃烟缸\", \"garbageType\": 3}, {\"questionId\": 673, \"garbageName\": \"烟灰缸\", \"garbageType\": 3}]', '2019-09-03 10:55:16');
INSERT INTO `keyword_result` VALUES (2167, '旺仔牛奶', '[]', '2019-09-03 10:55:29');
INSERT INTO `keyword_result` VALUES (2168, '牛奶罐', '[]', '2019-09-03 10:55:42');
INSERT INTO `keyword_result` VALUES (2169, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2019-09-03 13:48:30');
INSERT INTO `keyword_result` VALUES (2170, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-09-03 15:50:24');
INSERT INTO `keyword_result` VALUES (2171, '菠萝蜜核', '[{\"questionId\": 26, \"garbageName\": \"菠萝蜜核\", \"garbageType\": 1}]', '2019-09-03 15:50:30');
INSERT INTO `keyword_result` VALUES (2172, '手巾', '[]', '2019-09-03 15:50:44');
INSERT INTO `keyword_result` VALUES (2173, '毛发', '[{\"questionId\": 28, \"garbageName\": \"毛发\", \"garbageType\": 1}]', '2019-09-03 16:01:49');
INSERT INTO `keyword_result` VALUES (2174, '玉米衣', '[{\"questionId\": 23, \"garbageName\": \"玉米衣\", \"garbageType\": 1}]', '2019-09-03 16:01:57');
INSERT INTO `keyword_result` VALUES (2175, '泡面桶', '[]', '2019-09-03 20:13:58');
INSERT INTO `keyword_result` VALUES (2176, '泡面', '[]', '2019-09-03 20:14:06');
INSERT INTO `keyword_result` VALUES (2177, '方便吗', '[]', '2019-09-03 20:14:18');
INSERT INTO `keyword_result` VALUES (2178, '方便', '[{\"questionId\": 146, \"garbageName\": \"方便面盒\", \"garbageType\": 1}]', '2019-09-03 20:14:21');
INSERT INTO `keyword_result` VALUES (2179, '方便面盒', '[{\"questionId\": 146, \"garbageName\": \"方便面盒\", \"garbageType\": 1}]', '2019-09-03 20:14:22');
INSERT INTO `keyword_result` VALUES (2180, '笔', '[{\"questionId\": 48, \"garbageName\": \"笔\", \"garbageType\": 1}, {\"questionId\": 49, \"garbageName\": \"铅笔\", \"garbageType\": 1}, {\"questionId\": 50, \"garbageName\": \"毛笔\", \"garbageType\": 1}, {\"questionId\": 129, \"garbageName\": \"笔盖\", \"garbageType\": 1}, {\"questionId\": 137, \"garbageName\": \"钢笔\", \"garbageType\": 1}, {\"questionId\": 145, \"garbageName\": \"圆珠笔\", \"garbageType\": 1}, {\"questionId\": 388, \"garbageName\": \"水彩笔\", \"garbageType\": 4}, {\"questionId\": 653, \"garbageName\": \"笔芯\", \"garbageType\": 1}, {\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}, {\"questionId\": 702, \"garbageName\": \"笔记本\", \"garbageType\": 3}, {\"questionId\": 734, \"garbageName\": \"记号笔\", \"garbageType\": 1}, {\"questionId\": 735, \"garbageName\": \"金属铅笔盒\", \"garbageType\": 3}, {\"questionId\": 737, \"garbageName\": \"蜡笔\", \"garbageType\": 1}, {\"questionId\": 738, \"garbageName\": \"坏钢笔\", \"garbageType\": 1}, {\"questionId\": 739, \"garbageName\": \"中性笔\", \"garbageType\": 1}, {\"questionId\": 740, \"garbageName\": \"眉笔\", \"garbageType\": 1}, {\"questionId\": 741, \"garbageName\": \"粉笔\", \"garbageType\": 1}, {\"questionId\": 742, \"garbageName\": \"彩笔\", \"garbageType\": 1}, {\"questionId\": 743, \"garbageName\": \"马克笔\", \"garbageType\": 1}, {\"questionId\": 744, \"garbageName\": \"笔杆\", \"garbageType\": 1}, {\"questionId\": 745, \"garbageName\": \"笔套\", \"garbageType\": 1}, {\"questionId\": 746, \"garbageName\": \"红笔\", \"garbageType\": 1}, {\"questionId\": 747, \"garbageName\": \"勾线笔\", \"garbageType\": 1}, {\"questionId\": 748, \"garbageName\": \"可擦复写笔\", \"garbageType\": 1}]', '2019-09-03 20:14:35');
INSERT INTO `keyword_result` VALUES (2181, '笔记本电脑', '[{\"questionId\": 668, \"garbageName\": \"笔记本电脑\", \"garbageType\": 3}]', '2019-09-03 20:14:41');
INSERT INTO `keyword_result` VALUES (2182, '手办', '[]', '2019-09-04 10:46:03');
INSERT INTO `keyword_result` VALUES (2183, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:07');
INSERT INTO `keyword_result` VALUES (2184, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:11');
INSERT INTO `keyword_result` VALUES (2185, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:13');
INSERT INTO `keyword_result` VALUES (2186, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:13');
INSERT INTO `keyword_result` VALUES (2187, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:13');
INSERT INTO `keyword_result` VALUES (2188, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:13');
INSERT INTO `keyword_result` VALUES (2189, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:13');
INSERT INTO `keyword_result` VALUES (2190, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:14');
INSERT INTO `keyword_result` VALUES (2191, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:14');
INSERT INTO `keyword_result` VALUES (2192, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:14');
INSERT INTO `keyword_result` VALUES (2193, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:14');
INSERT INTO `keyword_result` VALUES (2194, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:14');
INSERT INTO `keyword_result` VALUES (2195, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:14');
INSERT INTO `keyword_result` VALUES (2196, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:15');
INSERT INTO `keyword_result` VALUES (2197, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:15');
INSERT INTO `keyword_result` VALUES (2198, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:15');
INSERT INTO `keyword_result` VALUES (2199, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:15');
INSERT INTO `keyword_result` VALUES (2200, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2019-09-04 10:46:16');
INSERT INTO `keyword_result` VALUES (2201, '猪肉', '[{\"questionId\": 67, \"garbageName\": \"猪肉\", \"garbageType\": 2}]', '2019-09-04 15:02:42');
INSERT INTO `keyword_result` VALUES (2202, '奶茶', '[{\"remark\": \"喝完好喝的奶茶，记得把奶茶杯放进干垃圾桶哟\", \"questionId\": 427, \"garbageName\": \"奶茶杯\", \"garbageType\": 1}]', '2019-09-04 15:02:56');
INSERT INTO `keyword_result` VALUES (2203, '奶茶', '[{\"remark\": \"喝完好喝的奶茶，记得把奶茶杯放进干垃圾桶哟\", \"questionId\": 427, \"garbageName\": \"奶茶杯\", \"garbageType\": 1}]', '2019-09-04 15:02:58');
INSERT INTO `keyword_result` VALUES (2204, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2019-09-04 15:03:02');
INSERT INTO `keyword_result` VALUES (2205, '抽纸', 'null', '2019-09-04 15:27:31');
INSERT INTO `keyword_result` VALUES (2206, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-09-04 17:20:05');
INSERT INTO `keyword_result` VALUES (2207, '嗯嗯', '[]', '2019-09-04 17:20:19');
INSERT INTO `keyword_result` VALUES (2208, '纸箱', '[]', '2019-09-04 17:20:30');
INSERT INTO `keyword_result` VALUES (2209, '本册/便签', 'null', '2019-09-04 17:20:48');
INSERT INTO `keyword_result` VALUES (2210, '饼干', 'null', '2019-09-04 17:21:22');
INSERT INTO `keyword_result` VALUES (2211, '饼干', '[{\"questionId\": 210, \"garbageName\": \"饼干\", \"garbageType\": 2}, {\"questionId\": 240, \"garbageName\": \"蛋糕饼干\", \"garbageType\": 2}]', '2019-09-04 17:21:34');
INSERT INTO `keyword_result` VALUES (2212, '居民楼', 'null', '2019-09-04 17:22:02');
INSERT INTO `keyword_result` VALUES (2213, '居民楼', '[]', '2019-09-04 17:22:07');
INSERT INTO `keyword_result` VALUES (2214, '鸡蛋', '[{\"questionId\": 70, \"garbageName\": \"鸡蛋\", \"garbageType\": 2}, {\"questionId\": 242, \"garbageName\": \"鸡蛋及蛋壳\", \"garbageType\": 2}, {\"questionId\": 424, \"garbageName\": \"鸡蛋壳\", \"garbageType\": 2}]', '2019-09-04 21:50:37');
INSERT INTO `keyword_result` VALUES (2215, '垃圾桶', 'null', '2019-09-04 22:33:36');
INSERT INTO `keyword_result` VALUES (2216, '湿豆浆杯', '[]', '2019-09-05 08:42:28');
INSERT INTO `keyword_result` VALUES (2217, '豆浆纸杯', '[]', '2019-09-05 08:42:38');
INSERT INTO `keyword_result` VALUES (2218, '纸杯', '[]', '2019-09-05 08:42:43');
INSERT INTO `keyword_result` VALUES (2219, '吸管', '[{\"questionId\": 617, \"garbageName\": \"吸管\", \"garbageType\": 1}]', '2019-09-05 08:42:58');
INSERT INTO `keyword_result` VALUES (2220, '猪肉', '[{\"questionId\": 67, \"garbageName\": \"猪肉\", \"garbageType\": 2}]', '2019-09-05 14:58:05');
INSERT INTO `keyword_result` VALUES (2221, '猪肉', '[{\"questionId\": 67, \"garbageName\": \"猪肉\", \"garbageType\": 2}]', '2019-09-05 14:58:09');
INSERT INTO `keyword_result` VALUES (2222, '小龙虾', '[{\"questionId\": 557, \"garbageName\": \"小龙虾\", \"garbageType\": 2}, {\"questionId\": 564, \"garbageName\": \"小龙虾壳\", \"garbageType\": 2}, {\"questionId\": 594, \"garbageName\": \"小龙虾头\", \"garbageType\": 2}]', '2019-09-05 14:59:50');
INSERT INTO `keyword_result` VALUES (2223, '菜肴', 'null', '2019-09-05 15:03:55');
INSERT INTO `keyword_result` VALUES (2224, '菜肴', 'null', '2019-09-05 15:04:17');
INSERT INTO `keyword_result` VALUES (2225, '桌菜', '[]', '2019-09-05 15:04:19');
INSERT INTO `keyword_result` VALUES (2226, '菜肴', 'null', '2019-09-05 15:04:33');
INSERT INTO `keyword_result` VALUES (2227, '妈妈', '[]', '2019-09-05 15:07:02');
INSERT INTO `keyword_result` VALUES (2228, '牙签', '[{\"questionId\": 43, \"garbageName\": \"牙签\", \"garbageType\": 1}, {\"questionId\": 670, \"garbageName\": \"牙签盒\", \"garbageType\": 1}]', '2019-09-05 15:19:18');
INSERT INTO `keyword_result` VALUES (2229, '人物特写', 'null', '2019-09-05 15:20:15');
INSERT INTO `keyword_result` VALUES (2230, '保温杯', 'null', '2019-09-05 15:20:39');
INSERT INTO `keyword_result` VALUES (2231, '杯子', 'null', '2019-09-06 08:54:30');
INSERT INTO `keyword_result` VALUES (2232, '杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}, {\"questionId\": 183, \"garbageName\": \"杯子\", \"garbageType\": 1}]', '2019-09-06 08:54:40');
INSERT INTO `keyword_result` VALUES (2233, '硬果壳', '[{\"questionId\": 19, \"garbageName\": \"硬果壳\", \"garbageType\": 1}]', '2019-09-06 08:58:41');
INSERT INTO `keyword_result` VALUES (2234, '硬果壳', '[{\"questionId\": 19, \"garbageName\": \"硬果壳\", \"garbageType\": 1}]', '2019-09-06 11:25:34');
INSERT INTO `keyword_result` VALUES (2235, '花生', '[{\"questionId\": 177, \"garbageName\": \"花生壳\", \"garbageType\": 1}]', '2019-09-06 11:25:45');
INSERT INTO `keyword_result` VALUES (2236, '胶水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}]', '2019-09-06 14:05:53');
INSERT INTO `keyword_result` VALUES (2237, '泰山香烟', 'null', '2019-09-06 15:31:44');
INSERT INTO `keyword_result` VALUES (2238, '充电宝', 'null', '2019-09-06 15:32:42');
INSERT INTO `keyword_result` VALUES (2239, '充电宝', '[{\"questionId\": 322, \"garbageName\": \"充电宝\", \"garbageType\": 3}]', '2019-09-06 15:32:54');
INSERT INTO `keyword_result` VALUES (2240, '烟头', 'null', '2019-09-06 19:06:09');
INSERT INTO `keyword_result` VALUES (2241, '手表', 'null', '2019-09-08 09:26:08');
INSERT INTO `keyword_result` VALUES (2242, '纸巾', '[{\"remark\": \"纸巾不要乱丢呀，会污染环境\", \"analysis\": \"\", \"questionId\": 1, \"garbageName\": \"纸巾\", \"garbageType\": 1}, {\"questionId\": 620, \"garbageName\": \"湿纸巾\", \"garbageType\": 1}]', '2019-09-08 15:13:57');
INSERT INTO `keyword_result` VALUES (2243, '橡皮泥', '[{\"questionId\": 31, \"garbageName\": \"橡皮泥\", \"garbageType\": 1}]', '2019-09-08 16:43:25');
INSERT INTO `keyword_result` VALUES (2244, '橡皮泥', '[{\"questionId\": 31, \"garbageName\": \"橡皮泥\", \"garbageType\": 1}]', '2019-09-08 16:43:39');
INSERT INTO `keyword_result` VALUES (2245, '黄金叶香烟', 'null', '2019-09-08 19:12:47');
INSERT INTO `keyword_result` VALUES (2246, '黄金叶香烟', '[]', '2019-09-08 19:12:55');
INSERT INTO `keyword_result` VALUES (2247, '猪肉', '[{\"questionId\": 67, \"garbageName\": \"猪肉\", \"garbageType\": 2}]', '2019-09-08 22:57:26');
INSERT INTO `keyword_result` VALUES (2248, '狗尿垫', '[{\"questionId\": 9, \"garbageName\": \"狗尿垫\", \"garbageType\": 1}]', '2019-09-09 10:53:35');
INSERT INTO `keyword_result` VALUES (2249, '筷子', '[{\"questionId\": 44, \"garbageName\": \"筷子\", \"garbageType\": 1}, {\"questionId\": 185, \"garbageName\": \"一次性筷子\", \"garbageType\": 1}, {\"questionId\": 478, \"garbageName\": \"木筷子\", \"garbageType\": 3}]', '2019-09-09 12:36:58');
INSERT INTO `keyword_result` VALUES (2250, '苹果', '[{\"remark\": \"苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟\", \"questionId\": 111, \"garbageName\": \"苹果\", \"garbageType\": 2}, {\"questionId\": 118, \"garbageName\": \"苹果皮\", \"garbageType\": 2}, {\"questionId\": 239, \"garbageName\": \"苹果核\", \"garbageType\": 2}]', '2019-09-09 12:37:17');
INSERT INTO `keyword_result` VALUES (2251, '键盘', '[{\"questionId\": 425, \"garbageName\": \"键盘\", \"garbageType\": 3}]', '2019-09-09 12:40:35');
INSERT INTO `keyword_result` VALUES (2252, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-09-09 16:48:22');
INSERT INTO `keyword_result` VALUES (2253, '核桃壳', '[{\"questionId\": 22, \"garbageName\": \"核桃壳\", \"garbageType\": 1}]', '2019-09-09 16:48:27');
INSERT INTO `keyword_result` VALUES (2254, '榴莲壳', '[{\"questionId\": 21, \"garbageName\": \"榴莲壳\", \"garbageType\": 1}]', '2019-09-09 16:48:35');
INSERT INTO `keyword_result` VALUES (2255, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2019-09-09 16:49:01');
INSERT INTO `keyword_result` VALUES (2256, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2024-04-02 14:37:41');
INSERT INTO `keyword_result` VALUES (2257, '铅笔', '[{\"questionId\": 49, \"garbageName\": \"铅笔\", \"garbageType\": 1}, {\"questionId\": 735, \"garbageName\": \"金属铅笔盒\", \"garbageType\": 3}]', '2024-04-02 14:43:12');
INSERT INTO `keyword_result` VALUES (2258, '胶水', '[{\"questionId\": 33, \"garbageName\": \"胶水\", \"garbageType\": 1}]', '2024-04-03 14:58:38');
INSERT INTO `keyword_result` VALUES (2259, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2024-04-03 15:26:48');
INSERT INTO `keyword_result` VALUES (2260, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2024-04-10 14:22:33');
INSERT INTO `keyword_result` VALUES (2261, '玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}, {\"questionId\": 313, \"garbageName\": \"毛绒玩具\", \"garbageType\": 3}, {\"questionId\": 349, \"garbageName\": \"旧玩具\", \"garbageType\": 3}]', '2024-04-10 15:24:30');
INSERT INTO `keyword_result` VALUES (2262, '塑料玩具', '[{\"questionId\": 269, \"garbageName\": \"塑料玩具\", \"garbageType\": 3}]', '2024-04-10 15:24:31');
INSERT INTO `keyword_result` VALUES (2263, '咸鸭蛋', '[{\"questionId\": 72, \"garbageName\": \"咸鸭蛋\", \"garbageType\": 2}]', '2024-04-19 22:26:47');
INSERT INTO `keyword_result` VALUES (2264, '竹筷', '[{\"questionId\": 42, \"garbageName\": \"竹筷\", \"garbageType\": 1}]', '2024-04-19 22:26:52');
INSERT INTO `keyword_result` VALUES (2265, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2024-04-19 23:37:00');
INSERT INTO `keyword_result` VALUES (2266, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2024-04-19 23:37:01');
INSERT INTO `keyword_result` VALUES (2267, '干电池', '[{\"remark\": \"有害垃圾哟\", \"questionId\": 4, \"garbageName\": \"干电池\", \"garbageType\": 4}]', '2024-04-19 23:37:11');
INSERT INTO `keyword_result` VALUES (2268, '污损纸张', '[{\"questionId\": 10, \"garbageName\": \"污损纸张\", \"garbageType\": 1}]', '2024-04-19 23:41:37');
INSERT INTO `keyword_result` VALUES (2269, '尿不湿', '[{\"questionId\": 7, \"garbageName\": \"尿不湿\", \"garbageType\": 1}]', '2024-04-21 01:48:30');
INSERT INTO `keyword_result` VALUES (2270, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2024-04-21 01:49:03');
INSERT INTO `keyword_result` VALUES (2271, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2024-04-21 01:50:06');
INSERT INTO `keyword_result` VALUES (2272, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2024-04-21 01:50:06');
INSERT INTO `keyword_result` VALUES (2273, '一次性餐具', '[{\"questionId\": 37, \"garbageName\": \"一次性餐具\", \"garbageType\": 1}]', '2024-04-21 01:50:08');
INSERT INTO `keyword_result` VALUES (2274, '灰土', '[{\"questionId\": 29, \"garbageName\": \"灰土\", \"garbageType\": 1}]', '2024-04-21 02:20:53');
INSERT INTO `keyword_result` VALUES (2275, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2024-04-21 09:05:33');
INSERT INTO `keyword_result` VALUES (2276, '一次性杯子', '[{\"questionId\": 38, \"garbageName\": \"一次性杯子\", \"garbageType\": 1}]', '2024-04-21 09:05:36');
INSERT INTO `keyword_result` VALUES (2277, '果蔬', '[]', '2024-04-21 10:34:56');
INSERT INTO `keyword_result` VALUES (2278, '羊肉', '[{\"questionId\": 69, \"garbageName\": \"羊肉\", \"garbageType\": 2}, {\"questionId\": 104, \"garbageName\": \"羊肉干\", \"garbageType\": 2}]', '2024-04-21 10:34:59');
INSERT INTO `keyword_result` VALUES (2279, '镜子', '[{\"questionId\": 39, \"garbageName\": \"镜子\", \"garbageType\": 1}, {\"questionId\": 339, \"garbageName\": \"旧镜子\", \"garbageType\": 3}]', '2024-04-21 10:39:51');

-- ----------------------------
-- Table structure for keyword_search_num
-- ----------------------------
DROP TABLE IF EXISTS `keyword_search_num`;
CREATE TABLE `keyword_search_num`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `num` int NULL DEFAULT NULL,
  `times` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `keyword_search_num_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 562 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '搜索关键词+次数记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of keyword_search_num
-- ----------------------------
INSERT INTO `keyword_search_num` VALUES (1, '榴莲壳', 17, '2019-07-15 23:34:53');
INSERT INTO `keyword_search_num` VALUES (2, '污损塑料', 13, '2019-07-16 16:34:31');
INSERT INTO `keyword_search_num` VALUES (3, '餐巾纸', 11, '2019-07-16 16:37:35');
INSERT INTO `keyword_search_num` VALUES (4, '尼龙制品', 47, '2019-07-16 16:38:05');
INSERT INTO `keyword_search_num` VALUES (5, '椰子壳', 21, '2019-07-16 16:56:42');
INSERT INTO `keyword_search_num` VALUES (6, '狗尿垫', 8, '2019-07-16 16:56:46');
INSERT INTO `keyword_search_num` VALUES (7, '污损纸张', 48, '2019-07-16 17:19:21');
INSERT INTO `keyword_search_num` VALUES (8, '卫生间用纸', 11, '2019-07-16 17:46:06');
INSERT INTO `keyword_search_num` VALUES (9, '苹果', 99, '2019-07-16 17:46:25');
INSERT INTO `keyword_search_num` VALUES (10, '防碎气泡膜', 12, '2019-07-16 18:02:17');
INSERT INTO `keyword_search_num` VALUES (11, '烟蒂', 14, '2019-07-16 18:03:28');
INSERT INTO `keyword_search_num` VALUES (12, '电脑', 41, '2019-07-16 18:04:40');
INSERT INTO `keyword_search_num` VALUES (13, '硬贝壳', 21, '2019-07-16 18:10:23');
INSERT INTO `keyword_search_num` VALUES (14, '默认关键字', 2, '2019-07-16 18:16:24');
INSERT INTO `keyword_search_num` VALUES (15, '干燥剂', 12, '2019-07-19 18:02:01');
INSERT INTO `keyword_search_num` VALUES (16, '核桃壳', 29, '2019-07-21 11:14:19');
INSERT INTO `keyword_search_num` VALUES (17, '核桃', 2, '2019-07-21 11:16:11');
INSERT INTO `keyword_search_num` VALUES (18, '榴莲核', 24, '2019-07-21 11:28:57');
INSERT INTO `keyword_search_num` VALUES (19, '干燥剂1', 1, '2019-07-21 12:07:43');
INSERT INTO `keyword_search_num` VALUES (20, '猫砂', 13, '2019-07-21 14:15:46');
INSERT INTO `keyword_search_num` VALUES (21, '干电池', 60, '2019-07-21 15:34:00');
INSERT INTO `keyword_search_num` VALUES (22, '编织袋', 18, '2019-07-21 16:53:04');
INSERT INTO `keyword_search_num` VALUES (23, '剩饭残渣', 13, '2019-07-21 16:53:24');
INSERT INTO `keyword_search_num` VALUES (24, '大骨头', 15, '2019-07-21 16:53:50');
INSERT INTO `keyword_search_num` VALUES (25, '玉米衣', 12, '2019-07-21 17:21:18');
INSERT INTO `keyword_search_num` VALUES (26, '牛骨头', 18, '2019-07-21 17:23:11');
INSERT INTO `keyword_search_num` VALUES (27, '外卖', 3, '2019-07-21 17:35:38');
INSERT INTO `keyword_search_num` VALUES (28, '马克杯', 31, '2019-07-21 17:38:10');
INSERT INTO `keyword_search_num` VALUES (29, '罗祥', 1, '2019-07-21 17:38:32');
INSERT INTO `keyword_search_num` VALUES (30, '猫', 18, '2019-07-21 17:39:00');
INSERT INTO `keyword_search_num` VALUES (31, '啊哈', 1, '2019-07-21 17:39:15');
INSERT INTO `keyword_search_num` VALUES (32, '硬果壳', 13, '2019-07-21 17:45:17');
INSERT INTO `keyword_search_num` VALUES (33, '电池', 5, '2019-07-21 17:57:35');
INSERT INTO `keyword_search_num` VALUES (34, '鼠标', 14, '2019-07-21 19:12:24');
INSERT INTO `keyword_search_num` VALUES (35, '菠萝蜜核', 21, '2019-07-21 21:06:22');
INSERT INTO `keyword_search_num` VALUES (36, '你好', 4, '2019-07-21 21:10:56');
INSERT INTO `keyword_search_num` VALUES (37, '一次性餐具', 19, '2019-07-21 21:13:16');
INSERT INTO `keyword_search_num` VALUES (38, '键盘', 40, '2019-07-21 21:13:38');
INSERT INTO `keyword_search_num` VALUES (39, '甘蔗', 4, '2019-07-21 22:12:56');
INSERT INTO `keyword_search_num` VALUES (40, '陶瓷制品', 16, '2019-07-21 22:13:09');
INSERT INTO `keyword_search_num` VALUES (41, '地板砖', 1, '2019-07-21 22:13:48');
INSERT INTO `keyword_search_num` VALUES (42, '花卉', 1, '2019-07-21 22:13:48');
INSERT INTO `keyword_search_num` VALUES (43, '男孩', 9, '2019-07-21 22:14:25');
INSERT INTO `keyword_search_num` VALUES (44, '杯子', 12, '2019-07-21 22:15:49');
INSERT INTO `keyword_search_num` VALUES (45, '灰土', 14, '2019-07-22 12:12:44');
INSERT INTO `keyword_search_num` VALUES (46, '工作餐', 4, '2019-07-22 12:13:12');
INSERT INTO `keyword_search_num` VALUES (47, '水杯', 6, '2019-07-22 12:14:08');
INSERT INTO `keyword_search_num` VALUES (48, '锅包肉', 1, '2019-07-22 12:29:13');
INSERT INTO `keyword_search_num` VALUES (49, '杨枝甘露', 1, '2019-07-22 22:04:51');
INSERT INTO `keyword_search_num` VALUES (50, '胶水', 16, '2019-07-22 22:05:04');
INSERT INTO `keyword_search_num` VALUES (51, '我不知道', 2, '2019-07-22 22:19:32');
INSERT INTO `keyword_search_num` VALUES (53, '一次性杯子', 17, '2019-07-22 22:24:33');
INSERT INTO `keyword_search_num` VALUES (54, '这是什么西瓜？', 1, '2019-07-22 22:24:54');
INSERT INTO `keyword_search_num` VALUES (55, '你是一个瓜皮', 1, '2019-07-22 22:25:02');
INSERT INTO `keyword_search_num` VALUES (56, '那个就是', 3, '2019-07-22 22:33:36');
INSERT INTO `keyword_search_num` VALUES (57, '那是什么？', 2, '2019-07-22 22:33:45');
INSERT INTO `keyword_search_num` VALUES (58, '这个就是', 1, '2019-07-22 22:33:59');
INSERT INTO `keyword_search_num` VALUES (59, '只有我的能够完美适配', 1, '2019-07-22 22:34:54');
INSERT INTO `keyword_search_num` VALUES (60, '123', 1, '2019-07-23 00:11:43');
INSERT INTO `keyword_search_num` VALUES (61, '刘敏是个大傻子', 1, '2019-07-23 00:19:21');
INSERT INTO `keyword_search_num` VALUES (62, '你是一个垃圾人', 1, '2019-07-23 00:39:26');
INSERT INTO `keyword_search_num` VALUES (63, '手提袋', 50, '2019-07-23 22:06:50');
INSERT INTO `keyword_search_num` VALUES (64, '魔方', 1, '2019-07-23 22:11:36');
INSERT INTO `keyword_search_num` VALUES (65, '玩具', 114, '2019-07-23 22:12:06');
INSERT INTO `keyword_search_num` VALUES (66, '图像素材', 2, '2019-07-23 22:12:47');
INSERT INTO `keyword_search_num` VALUES (67, '苹', 2, '2019-07-23 22:46:22');
INSERT INTO `keyword_search_num` VALUES (68, '厨房', 9, '2019-07-24 00:14:04');
INSERT INTO `keyword_search_num` VALUES (69, '85度c', 1, '2019-07-24 00:16:25');
INSERT INTO `keyword_search_num` VALUES (70, '公共标示', 1, '2019-07-24 00:22:55');
INSERT INTO `keyword_search_num` VALUES (71, '文字图片', 1, '2019-07-24 00:23:04');
INSERT INTO `keyword_search_num` VALUES (72, '盆栽植物', 5, '2019-07-24 00:23:42');
INSERT INTO `keyword_search_num` VALUES (73, '茶几桌', 1, '2019-07-24 00:25:47');
INSERT INTO `keyword_search_num` VALUES (74, '购物袋', 1, '2019-07-24 00:25:59');
INSERT INTO `keyword_search_num` VALUES (75, '毛发', 14, '2019-07-24 00:56:14');
INSERT INTO `keyword_search_num` VALUES (76, '台式电脑', 5, '2019-07-24 09:39:42');
INSERT INTO `keyword_search_num` VALUES (77, '奶盖', 1, '2019-07-24 10:27:37');
INSERT INTO `keyword_search_num` VALUES (78, '奶茶杯', 5, '2019-07-24 10:27:46');
INSERT INTO `keyword_search_num` VALUES (79, '奶茶', 11, '2019-07-24 10:27:57');
INSERT INTO `keyword_search_num` VALUES (80, '塑料杯', 1, '2019-07-24 10:28:05');
INSERT INTO `keyword_search_num` VALUES (81, '尿不湿', 14, '2019-07-24 10:28:57');
INSERT INTO `keyword_search_num` VALUES (82, '手写板', 2, '2019-07-24 10:29:55');
INSERT INTO `keyword_search_num` VALUES (83, '甘蔗皮', 15, '2019-07-24 10:30:39');
INSERT INTO `keyword_search_num` VALUES (84, '洗手液', 1, '2019-07-24 10:31:36');
INSERT INTO `keyword_search_num` VALUES (85, '包', 2, '2019-07-24 10:33:03');
INSERT INTO `keyword_search_num` VALUES (86, '高跟鞋', 1, '2019-07-24 10:33:13');
INSERT INTO `keyword_search_num` VALUES (87, '眼镜', 14, '2019-07-24 10:33:55');
INSERT INTO `keyword_search_num` VALUES (88, '橡皮泥', 12, '2019-07-24 10:34:44');
INSERT INTO `keyword_search_num` VALUES (89, '生蚝壳', 5, '2019-07-24 10:36:22');
INSERT INTO `keyword_search_num` VALUES (90, '生蚝', 4, '2019-07-24 10:36:31');
INSERT INTO `keyword_search_num` VALUES (91, '猫粮', 1, '2019-07-24 10:36:54');
INSERT INTO `keyword_search_num` VALUES (92, '矿泉水瓶', 3, '2019-07-24 10:37:31');
INSERT INTO `keyword_search_num` VALUES (93, '矿泉水', 1, '2019-07-24 10:37:36');
INSERT INTO `keyword_search_num` VALUES (94, '竹篮', 9, '2019-07-24 10:39:10');
INSERT INTO `keyword_search_num` VALUES (95, '毛巾', 9, '2019-07-24 10:41:40');
INSERT INTO `keyword_search_num` VALUES (96, '短袖衫', 2, '2019-07-24 10:42:15');
INSERT INTO `keyword_search_num` VALUES (97, '前男友', 2, '2019-07-24 10:42:22');
INSERT INTO `keyword_search_num` VALUES (98, '砖石材', 5, '2019-07-24 10:42:59');
INSERT INTO `keyword_search_num` VALUES (99, '运动鞋', 4, '2019-07-24 10:44:12');
INSERT INTO `keyword_search_num` VALUES (100, '袋子', 2, '2019-07-24 10:44:16');
INSERT INTO `keyword_search_num` VALUES (101, '西瓜', 3, '2019-07-24 10:44:52');
INSERT INTO `keyword_search_num` VALUES (102, '纸巾', 13, '2019-07-24 10:48:48');
INSERT INTO `keyword_search_num` VALUES (103, '教室', 4, '2019-07-24 10:50:50');
INSERT INTO `keyword_search_num` VALUES (104, '水火箭', 2, '2019-07-24 10:54:14');
INSERT INTO `keyword_search_num` VALUES (105, '剪刀', 2, '2019-07-24 10:58:50');
INSERT INTO `keyword_search_num` VALUES (106, '碗', 3, '2019-07-24 10:59:29');
INSERT INTO `keyword_search_num` VALUES (107, '保温杯', 4, '2019-07-24 11:00:54');
INSERT INTO `keyword_search_num` VALUES (108, '塑料袋', 8, '2019-07-24 11:01:17');
INSERT INTO `keyword_search_num` VALUES (109, '炉渣', 11, '2019-07-24 11:11:04');
INSERT INTO `keyword_search_num` VALUES (110, '玉米', 1, '2019-07-24 11:11:11');
INSERT INTO `keyword_search_num` VALUES (111, '我', 2, '2019-07-24 11:15:21');
INSERT INTO `keyword_search_num` VALUES (112, '渣男', 4, '2019-07-24 11:15:33');
INSERT INTO `keyword_search_num` VALUES (113, '天堂伞', 11, '2019-07-24 11:16:42');
INSERT INTO `keyword_search_num` VALUES (114, '毛笔', 9, '2019-07-24 11:16:47');
INSERT INTO `keyword_search_num` VALUES (115, '女人', 1, '2019-07-24 11:16:55');
INSERT INTO `keyword_search_num` VALUES (116, '避孕套', 12, '2019-07-24 11:17:02');
INSERT INTO `keyword_search_num` VALUES (117, '水壶', 4, '2019-07-24 11:17:36');
INSERT INTO `keyword_search_num` VALUES (118, '里脊肉', 1, '2019-07-24 11:19:39');
INSERT INTO `keyword_search_num` VALUES (119, '赵艺萌', 1, '2019-07-24 11:20:32');
INSERT INTO `keyword_search_num` VALUES (120, '陈智', 1, '2019-07-24 11:20:41');
INSERT INTO `keyword_search_num` VALUES (121, '显示器屏幕', 1, '2019-07-24 11:21:29');
INSERT INTO `keyword_search_num` VALUES (122, '大酱汤', 2, '2019-07-24 11:24:01');
INSERT INTO `keyword_search_num` VALUES (123, '米', 8, '2019-07-24 11:24:30');
INSERT INTO `keyword_search_num` VALUES (124, '婴儿', 1, '2019-07-24 11:26:49');
INSERT INTO `keyword_search_num` VALUES (125, '美女', 5, '2019-07-24 11:26:53');
INSERT INTO `keyword_search_num` VALUES (126, '门', 4, '2019-07-24 11:29:53');
INSERT INTO `keyword_search_num` VALUES (127, '窗户', 1, '2019-07-24 11:29:58');
INSERT INTO `keyword_search_num` VALUES (128, '公司', 1, '2019-07-24 11:30:11');
INSERT INTO `keyword_search_num` VALUES (129, '绿豆', 5, '2019-07-24 11:30:58');
INSERT INTO `keyword_search_num` VALUES (130, '王一博', 1, '2019-07-24 11:32:33');
INSERT INTO `keyword_search_num` VALUES (131, '玻璃砖', 1, '2019-07-24 11:32:54');
INSERT INTO `keyword_search_num` VALUES (132, '吉娃娃', 1, '2019-07-24 11:33:10');
INSERT INTO `keyword_search_num` VALUES (133, '包装袋/盒', 6, '2019-07-24 11:33:47');
INSERT INTO `keyword_search_num` VALUES (134, '菜肴', 7, '2019-07-24 11:33:58');
INSERT INTO `keyword_search_num` VALUES (135, '黄金', 1, '2019-07-24 11:35:12');
INSERT INTO `keyword_search_num` VALUES (136, '哈哈哈', 1, '2019-07-24 11:37:24');
INSERT INTO `keyword_search_num` VALUES (137, '人物特写', 13, '2019-07-24 11:45:29');
INSERT INTO `keyword_search_num` VALUES (138, '茶叶', 3, '2019-07-24 11:52:22');
INSERT INTO `keyword_search_num` VALUES (139, '头发', 4, '2019-07-24 11:52:46');
INSERT INTO `keyword_search_num` VALUES (140, '骨头', 2, '2019-07-24 11:52:49');
INSERT INTO `keyword_search_num` VALUES (141, '唐运东', 2, '2019-07-24 11:53:50');
INSERT INTO `keyword_search_num` VALUES (142, '鸡蛋壳', 5, '2019-07-24 11:54:26');
INSERT INTO `keyword_search_num` VALUES (143, '植物', 6, '2019-07-24 11:54:53');
INSERT INTO `keyword_search_num` VALUES (144, '蔬菜', 2, '2019-07-24 11:55:24');
INSERT INTO `keyword_search_num` VALUES (145, '文字图', 1, '2019-07-24 11:58:07');
INSERT INTO `keyword_search_num` VALUES (146, '参观券', 2, '2019-07-24 11:58:13');
INSERT INTO `keyword_search_num` VALUES (147, '狗', 2, '2019-07-24 11:58:40');
INSERT INTO `keyword_search_num` VALUES (148, '热水瓶', 2, '2019-07-24 11:59:13');
INSERT INTO `keyword_search_num` VALUES (149, '啤酒罐', 2, '2019-07-24 11:59:16');
INSERT INTO `keyword_search_num` VALUES (150, '哈士奇', 1, '2019-07-24 12:00:07');
INSERT INTO `keyword_search_num` VALUES (151, '狗毛', 1, '2019-07-24 12:00:20');
INSERT INTO `keyword_search_num` VALUES (152, '鸡蛋', 3, '2019-07-24 12:00:48');
INSERT INTO `keyword_search_num` VALUES (153, '面条', 4, '2019-07-24 12:01:30');
INSERT INTO `keyword_search_num` VALUES (154, '筷子', 9, '2019-07-24 12:02:43');
INSERT INTO `keyword_search_num` VALUES (155, '面包', 3, '2019-07-24 12:03:32');
INSERT INTO `keyword_search_num` VALUES (156, '耳机', 5, '2019-07-24 12:04:45');
INSERT INTO `keyword_search_num` VALUES (157, '电子产品', 1, '2019-07-24 12:05:03');
INSERT INTO `keyword_search_num` VALUES (158, '粉底', 1, '2019-07-24 12:09:28');
INSERT INTO `keyword_search_num` VALUES (159, '粉底霜', 1, '2019-07-24 12:09:36');
INSERT INTO `keyword_search_num` VALUES (160, '粉底液', 5, '2019-07-24 12:09:41');
INSERT INTO `keyword_search_num` VALUES (161, '姨妈巾', 1, '2019-07-24 12:10:14');
INSERT INTO `keyword_search_num` VALUES (162, '卫生巾', 1, '2019-07-24 12:10:23');
INSERT INTO `keyword_search_num` VALUES (163, '玻璃杯', 4, '2019-07-24 12:10:36');
INSERT INTO `keyword_search_num` VALUES (164, '发卡', 1, '2019-07-24 12:10:53');
INSERT INTO `keyword_search_num` VALUES (165, '辣椒', 1, '2019-07-24 12:11:21');
INSERT INTO `keyword_search_num` VALUES (166, '剩菜剩饭', 2, '2019-07-24 12:11:47');
INSERT INTO `keyword_search_num` VALUES (167, '剩菜', 2, '2019-07-24 12:11:56');
INSERT INTO `keyword_search_num` VALUES (168, '剩饭剩', 1, '2019-07-24 12:12:09');
INSERT INTO `keyword_search_num` VALUES (169, '硬币', 1, '2019-07-24 12:16:03');
INSERT INTO `keyword_search_num` VALUES (170, '办公桌', 1, '2019-07-24 12:17:49');
INSERT INTO `keyword_search_num` VALUES (171, '粥', 1, '2019-07-24 12:24:00');
INSERT INTO `keyword_search_num` VALUES (172, '帽子', 1, '2019-07-24 12:24:08');
INSERT INTO `keyword_search_num` VALUES (173, '花盆', 11, '2019-07-24 12:26:43');
INSERT INTO `keyword_search_num` VALUES (174, '古力娜扎', 3, '2019-07-24 12:28:54');
INSERT INTO `keyword_search_num` VALUES (175, '手机', 3, '2019-07-24 12:29:46');
INSERT INTO `keyword_search_num` VALUES (176, '百事可乐饮料', 1, '2019-07-24 12:30:19');
INSERT INTO `keyword_search_num` VALUES (177, '女朋友', 6, '2019-07-24 12:31:30');
INSERT INTO `keyword_search_num` VALUES (178, '大便', 4, '2019-07-24 12:31:44');
INSERT INTO `keyword_search_num` VALUES (179, '屎', 2, '2019-07-24 12:32:00');
INSERT INTO `keyword_search_num` VALUES (180, '猪肉', 7, '2019-07-24 12:32:38');
INSERT INTO `keyword_search_num` VALUES (181, '戒指', 2, '2019-07-24 12:32:43');
INSERT INTO `keyword_search_num` VALUES (182, '塑料', 2, '2019-07-24 12:32:59');
INSERT INTO `keyword_search_num` VALUES (183, '塑料玩具', 3, '2019-07-24 12:33:14');
INSERT INTO `keyword_search_num` VALUES (184, '建筑', 2, '2019-07-24 12:35:08');
INSERT INTO `keyword_search_num` VALUES (185, '打火机', 9, '2019-07-24 12:36:17');
INSERT INTO `keyword_search_num` VALUES (186, '猪骨头', 1, '2019-07-24 12:38:20');
INSERT INTO `keyword_search_num` VALUES (187, '虾壳', 2, '2019-07-24 12:40:40');
INSERT INTO `keyword_search_num` VALUES (188, '软件', 1, '2019-07-24 12:52:22');
INSERT INTO `keyword_search_num` VALUES (189, '雨伞', 6, '2019-07-24 13:04:27');
INSERT INTO `keyword_search_num` VALUES (190, '锁', 2, '2019-07-24 13:04:45');
INSERT INTO `keyword_search_num` VALUES (191, '废锁头', 1, '2019-07-24 13:04:55');
INSERT INTO `keyword_search_num` VALUES (192, '刘诗琪', 2, '2019-07-24 13:05:40');
INSERT INTO `keyword_search_num` VALUES (193, '麻理', 1, '2019-07-24 13:05:50');
INSERT INTO `keyword_search_num` VALUES (194, '御坂美琴', 1, '2019-07-24 13:06:03');
INSERT INTO `keyword_search_num` VALUES (195, '东西', 5, '2019-07-24 13:08:33');
INSERT INTO `keyword_search_num` VALUES (196, '工艺品', 1, '2019-07-24 13:09:10');
INSERT INTO `keyword_search_num` VALUES (197, '网线', 2, '2019-07-24 13:12:43');
INSERT INTO `keyword_search_num` VALUES (198, '化妆品', 3, '2019-07-24 13:13:01');
INSERT INTO `keyword_search_num` VALUES (199, '瓶子', 7, '2019-07-24 13:13:10');
INSERT INTO `keyword_search_num` VALUES (200, '牙签', 8, '2019-07-24 13:19:20');
INSERT INTO `keyword_search_num` VALUES (201, '鱼骨头', 2, '2019-07-24 13:21:04');
INSERT INTO `keyword_search_num` VALUES (202, '外卖盒', 2, '2019-07-24 13:22:57');
INSERT INTO `keyword_search_num` VALUES (203, '美妆', 1, '2019-07-24 13:23:01');
INSERT INTO `keyword_search_num` VALUES (204, '餐盒', 1, '2019-07-24 13:23:06');
INSERT INTO `keyword_search_num` VALUES (205, '高沛', 1, '2019-07-24 13:30:13');
INSERT INTO `keyword_search_num` VALUES (206, '伞', 9, '2019-07-24 13:31:58');
INSERT INTO `keyword_search_num` VALUES (207, '男', 1, '2019-07-24 13:45:51');
INSERT INTO `keyword_search_num` VALUES (208, '女', 1, '2019-07-24 13:46:04');
INSERT INTO `keyword_search_num` VALUES (209, '鸭', 1, '2019-07-24 13:48:44');
INSERT INTO `keyword_search_num` VALUES (210, '安全套', 3, '2019-07-24 14:12:06');
INSERT INTO `keyword_search_num` VALUES (211, '虾', 1, '2019-07-24 14:12:20');
INSERT INTO `keyword_search_num` VALUES (212, '触控板', 4, '2019-07-24 14:13:38');
INSERT INTO `keyword_search_num` VALUES (213, '牙膏', 10, '2019-07-24 14:14:37');
INSERT INTO `keyword_search_num` VALUES (214, '凉鞋', 2, '2019-07-24 14:16:14');
INSERT INTO `keyword_search_num` VALUES (215, '瓶装饮料', 6, '2019-07-24 14:16:18');
INSERT INTO `keyword_search_num` VALUES (216, '可口可乐', 1, '2019-07-24 14:16:29');
INSERT INTO `keyword_search_num` VALUES (217, '手掌', 6, '2019-07-24 14:19:03');
INSERT INTO `keyword_search_num` VALUES (218, '脱毛器', 1, '2019-07-24 14:21:42');
INSERT INTO `keyword_search_num` VALUES (219, '充电器', 3, '2019-07-24 14:22:04');
INSERT INTO `keyword_search_num` VALUES (220, '胶带', 9, '2019-07-24 14:22:34');
INSERT INTO `keyword_search_num` VALUES (221, '饮料', 3, '2019-07-24 14:29:00');
INSERT INTO `keyword_search_num` VALUES (222, '珍珠奶茶', 4, '2019-07-24 14:29:14');
INSERT INTO `keyword_search_num` VALUES (223, '口红', 1, '2019-07-24 14:30:13');
INSERT INTO `keyword_search_num` VALUES (224, '狗屎', 3, '2019-07-24 14:33:31');
INSERT INTO `keyword_search_num` VALUES (225, '拖鞋', 3, '2019-07-24 14:35:07');
INSERT INTO `keyword_search_num` VALUES (226, '瓶饮', 1, '2019-07-24 14:35:14');
INSERT INTO `keyword_search_num` VALUES (227, '瓶装', 2, '2019-07-24 14:35:41');
INSERT INTO `keyword_search_num` VALUES (228, '瓶', 1, '2019-07-24 14:35:48');
INSERT INTO `keyword_search_num` VALUES (229, '塑料瓶', 2, '2019-07-24 14:35:49');
INSERT INTO `keyword_search_num` VALUES (230, '医用手套', 1, '2019-07-24 14:39:17');
INSERT INTO `keyword_search_num` VALUES (231, '篮球', 1, '2019-07-24 14:39:46');
INSERT INTO `keyword_search_num` VALUES (232, '树叶', 2, '2019-07-24 14:40:19');
INSERT INTO `keyword_search_num` VALUES (233, '枣', 2, '2019-07-24 14:41:53');
INSERT INTO `keyword_search_num` VALUES (234, '卡通动漫人物', 1, '2019-07-24 14:42:05');
INSERT INTO `keyword_search_num` VALUES (235, '水饺', 1, '2019-07-24 14:42:29');
INSERT INTO `keyword_search_num` VALUES (236, '鸟类', 2, '2019-07-24 14:43:11');
INSERT INTO `keyword_search_num` VALUES (237, '鸡饭', 1, '2019-07-24 14:43:25');
INSERT INTO `keyword_search_num` VALUES (238, '果珍', 3, '2019-07-24 14:43:53');
INSERT INTO `keyword_search_num` VALUES (239, '落地扇', 3, '2019-07-24 14:43:55');
INSERT INTO `keyword_search_num` VALUES (240, '污垢', 1, '2019-07-24 14:44:28');
INSERT INTO `keyword_search_num` VALUES (241, '纸', 2, '2019-07-24 14:44:57');
INSERT INTO `keyword_search_num` VALUES (242, '卫生纸', 3, '2019-07-24 14:45:01');
INSERT INTO `keyword_search_num` VALUES (243, '平板手机', 4, '2019-07-24 14:45:47');
INSERT INTO `keyword_search_num` VALUES (244, '按键手机', 1, '2019-07-24 14:45:51');
INSERT INTO `keyword_search_num` VALUES (245, '纸盒子', 2, '2019-07-24 14:45:56');
INSERT INTO `keyword_search_num` VALUES (246, '纸盒', 1, '2019-07-24 14:46:01');
INSERT INTO `keyword_search_num` VALUES (247, '人民币', 1, '2019-07-24 14:46:44');
INSERT INTO `keyword_search_num` VALUES (248, '米饭', 7, '2019-07-24 14:46:57');
INSERT INTO `keyword_search_num` VALUES (249, '食物', 2, '2019-07-24 14:49:28');
INSERT INTO `keyword_search_num` VALUES (250, '护肤品', 1, '2019-07-24 14:51:07');
INSERT INTO `keyword_search_num` VALUES (251, '牙签盒', 3, '2019-07-24 14:51:13');
INSERT INTO `keyword_search_num` VALUES (252, '一次性用品', 3, '2019-07-24 14:51:33');
INSERT INTO `keyword_search_num` VALUES (253, '草稿纸', 1, '2019-07-24 14:52:30');
INSERT INTO `keyword_search_num` VALUES (254, '纸巾，纸巾', 1, '2019-07-24 14:52:54');
INSERT INTO `keyword_search_num` VALUES (255, '咸鸭蛋', 3, '2019-07-24 14:52:58');
INSERT INTO `keyword_search_num` VALUES (256, '镜子', 9, '2019-07-24 14:53:07');
INSERT INTO `keyword_search_num` VALUES (257, '书', 2, '2019-07-24 14:53:11');
INSERT INTO `keyword_search_num` VALUES (258, '被子', 1, '2019-07-24 14:53:19');
INSERT INTO `keyword_search_num` VALUES (259, '笔记本电脑', 5, '2019-07-24 14:53:28');
INSERT INTO `keyword_search_num` VALUES (260, '果皮', 2, '2019-07-24 14:53:30');
INSERT INTO `keyword_search_num` VALUES (261, '人屎', 1, '2019-07-24 14:59:03');
INSERT INTO `keyword_search_num` VALUES (262, '农夫山泉矿泉水', 2, '2019-07-24 15:03:00');
INSERT INTO `keyword_search_num` VALUES (263, '铅笔', 3, '2019-07-24 15:05:03');
INSERT INTO `keyword_search_num` VALUES (264, '湿纸', 2, '2019-07-24 15:06:24');
INSERT INTO `keyword_search_num` VALUES (265, '桌子', 1, '2019-07-24 15:18:17');
INSERT INTO `keyword_search_num` VALUES (266, '太空沙', 7, '2019-07-24 15:23:07');
INSERT INTO `keyword_search_num` VALUES (267, '男朋友', 4, '2019-07-24 15:23:44');
INSERT INTO `keyword_search_num` VALUES (268, '男士包', 1, '2019-07-24 15:25:11');
INSERT INTO `keyword_search_num` VALUES (269, '汽车内饰', 2, '2019-07-24 15:25:17');
INSERT INTO `keyword_search_num` VALUES (270, '腿', 1, '2019-07-24 15:25:50');
INSERT INTO `keyword_search_num` VALUES (271, '咖啡', 1, '2019-07-24 15:29:45');
INSERT INTO `keyword_search_num` VALUES (272, '地沟油', 2, '2019-07-24 15:29:47');
INSERT INTO `keyword_search_num` VALUES (273, '油', 1, '2019-07-24 15:29:59');
INSERT INTO `keyword_search_num` VALUES (274, '纸张', 3, '2019-07-24 15:33:55');
INSERT INTO `keyword_search_num` VALUES (275, '蔡道峰', 1, '2019-07-24 15:34:06');
INSERT INTO `keyword_search_num` VALUES (276, '糖果', 1, '2019-07-24 15:42:15');
INSERT INTO `keyword_search_num` VALUES (277, '米线', 3, '2019-07-24 15:42:27');
INSERT INTO `keyword_search_num` VALUES (278, '头', 2, '2019-07-24 15:43:04');
INSERT INTO `keyword_search_num` VALUES (279, '简笔画', 2, '2019-07-24 15:46:21');
INSERT INTO `keyword_search_num` VALUES (280, '纸品湿巾', 3, '2019-07-24 15:55:31');
INSERT INTO `keyword_search_num` VALUES (281, '维达', 1, '2019-07-24 15:55:35');
INSERT INTO `keyword_search_num` VALUES (282, '饮料瓶', 1, '2019-07-24 16:03:40');
INSERT INTO `keyword_search_num` VALUES (283, '笔', 10, '2019-07-24 16:07:51');
INSERT INTO `keyword_search_num` VALUES (284, '熊猫卡通', 1, '2019-07-24 16:15:35');
INSERT INTO `keyword_search_num` VALUES (285, '书本', 14, '2019-07-24 16:16:01');
INSERT INTO `keyword_search_num` VALUES (286, '女仆', 1, '2019-07-24 16:17:37');
INSERT INTO `keyword_search_num` VALUES (287, '面膜', 2, '2019-07-24 16:51:16');
INSERT INTO `keyword_search_num` VALUES (288, '光疗甲', 1, '2019-07-24 16:52:02');
INSERT INTO `keyword_search_num` VALUES (289, '彩色动漫', 1, '2019-07-24 16:52:16');
INSERT INTO `keyword_search_num` VALUES (290, '雕像', 1, '2019-07-24 16:52:58');
INSERT INTO `keyword_search_num` VALUES (291, '橡胶', 2, '2019-07-24 16:56:54');
INSERT INTO `keyword_search_num` VALUES (292, '枕头', 1, '2019-07-24 16:57:16');
INSERT INTO `keyword_search_num` VALUES (293, '饮料/饮品', 2, '2019-07-24 16:59:20');
INSERT INTO `keyword_search_num` VALUES (294, '啤酒瓶', 1, '2019-07-24 17:04:04');
INSERT INTO `keyword_search_num` VALUES (295, '我觉得', 1, '2019-07-24 18:02:55');
INSERT INTO `keyword_search_num` VALUES (296, '手表', 4, '2019-07-24 18:17:45');
INSERT INTO `keyword_search_num` VALUES (297, '金鱼', 1, '2019-07-24 18:21:23');
INSERT INTO `keyword_search_num` VALUES (298, '死鱼', 3, '2019-07-24 18:21:33');
INSERT INTO `keyword_search_num` VALUES (299, '木鱼', 1, '2019-07-24 18:21:52');
INSERT INTO `keyword_search_num` VALUES (300, '飞机', 1, '2019-07-24 18:22:08');
INSERT INTO `keyword_search_num` VALUES (301, '手机电池', 1, '2019-07-24 18:22:16');
INSERT INTO `keyword_search_num` VALUES (302, '灵芝', 1, '2019-07-24 18:23:02');
INSERT INTO `keyword_search_num` VALUES (303, '动物尸体', 1, '2019-07-24 18:28:15');
INSERT INTO `keyword_search_num` VALUES (304, '烟灰缸', 3, '2019-07-24 18:29:44');
INSERT INTO `keyword_search_num` VALUES (305, '椅子', 1, '2019-07-24 18:30:29');
INSERT INTO `keyword_search_num` VALUES (306, '轿车', 2, '2019-07-24 18:31:29');
INSERT INTO `keyword_search_num` VALUES (307, '可以可以可以可以', 1, '2019-07-24 18:36:28');
INSERT INTO `keyword_search_num` VALUES (308, '黄豆', 3, '2019-07-24 18:39:06');
INSERT INTO `keyword_search_num` VALUES (309, '小龙虾', 3, '2019-07-24 18:44:33');
INSERT INTO `keyword_search_num` VALUES (310, '水', 2, '2019-07-24 18:44:59');
INSERT INTO `keyword_search_num` VALUES (311, '葵花', 1, '2019-07-24 18:49:02');
INSERT INTO `keyword_search_num` VALUES (312, '沐浴露', 1, '2019-07-24 18:49:45');
INSERT INTO `keyword_search_num` VALUES (313, '串串香', 1, '2019-07-24 18:51:04');
INSERT INTO `keyword_search_num` VALUES (314, '珍珠', 2, '2019-07-24 18:53:57');
INSERT INTO `keyword_search_num` VALUES (315, '鲸鱼', 2, '2019-07-24 18:57:39');
INSERT INTO `keyword_search_num` VALUES (316, '沙发', 3, '2019-07-24 18:57:53');
INSERT INTO `keyword_search_num` VALUES (317, '粘上猫尿的猫砂', 1, '2019-07-24 18:58:59');
INSERT INTO `keyword_search_num` VALUES (318, '那啥意思？', 1, '2019-07-24 19:16:20');
INSERT INTO `keyword_search_num` VALUES (319, '羊肉', 5, '2019-07-24 19:23:52');
INSERT INTO `keyword_search_num` VALUES (320, '防碎气泡', 1, '2019-07-24 19:58:01');
INSERT INTO `keyword_search_num` VALUES (321, '香蕉皮', 2, '2019-07-24 19:59:50');
INSERT INTO `keyword_search_num` VALUES (322, '咖啡渣', 1, '2019-07-24 20:16:32');
INSERT INTO `keyword_search_num` VALUES (323, '陶瓷锅', 1, '2019-07-24 20:16:39');
INSERT INTO `keyword_search_num` VALUES (324, '陶瓷', 1, '2019-07-24 20:16:43');
INSERT INTO `keyword_search_num` VALUES (325, '牛奶', 1, '2019-07-24 20:17:08');
INSERT INTO `keyword_search_num` VALUES (326, '外卖饭盒', 1, '2019-07-24 20:40:41');
INSERT INTO `keyword_search_num` VALUES (327, '剩饭', 1, '2019-07-24 20:41:02');
INSERT INTO `keyword_search_num` VALUES (328, '竹筷', 9, '2019-07-24 20:46:58');
INSERT INTO `keyword_search_num` VALUES (329, '尿', 2, '2019-07-24 21:41:53');
INSERT INTO `keyword_search_num` VALUES (330, '鸡屎', 1, '2019-07-24 21:42:13');
INSERT INTO `keyword_search_num` VALUES (331, '桥梁', 3, '2019-07-24 21:46:08');
INSERT INTO `keyword_search_num` VALUES (332, '条形码', 1, '2019-07-24 21:46:27');
INSERT INTO `keyword_search_num` VALUES (333, '午餐肉', 2, '2019-07-24 21:46:33');
INSERT INTO `keyword_search_num` VALUES (334, '那个', 1, '2019-07-24 22:13:48');
INSERT INTO `keyword_search_num` VALUES (335, '红豆', 2, '2019-07-24 22:17:18');
INSERT INTO `keyword_search_num` VALUES (336, '猪头', 1, '2019-07-24 22:31:06');
INSERT INTO `keyword_search_num` VALUES (337, '猪', 2, '2019-07-24 22:31:20');
INSERT INTO `keyword_search_num` VALUES (338, '服装', 2, '2019-07-24 22:31:41');
INSERT INTO `keyword_search_num` VALUES (339, '脚', 2, '2019-07-24 22:32:26');
INSERT INTO `keyword_search_num` VALUES (340, '甜品', 2, '2019-07-24 22:35:40');
INSERT INTO `keyword_search_num` VALUES (341, '王八蛋', 1, '2019-07-24 22:38:25');
INSERT INTO `keyword_search_num` VALUES (342, '开发的谁开发的？嗯嗯啊，谁开发的？我不认他们开发的语音还语音识别纸', 1, '2019-07-24 22:50:06');
INSERT INTO `keyword_search_num` VALUES (343, '至', 1, '2019-07-24 22:50:24');
INSERT INTO `keyword_search_num` VALUES (344, '我不会', 2, '2019-07-24 23:38:30');
INSERT INTO `keyword_search_num` VALUES (345, '', 2, '2019-07-24 23:54:00');
INSERT INTO `keyword_search_num` VALUES (346, '面', 4, '2019-07-24 23:54:59');
INSERT INTO `keyword_search_num` VALUES (347, '纸箱', 6, '2019-07-25 00:21:04');
INSERT INTO `keyword_search_num` VALUES (348, 'Hello', 1, '2019-07-25 00:27:58');
INSERT INTO `keyword_search_num` VALUES (349, '虾头', 2, '2019-07-25 00:28:26');
INSERT INTO `keyword_search_num` VALUES (350, '天空', 1, '2019-07-25 01:08:46');
INSERT INTO `keyword_search_num` VALUES (351, '交通信号灯', 1, '2019-07-25 01:09:10');
INSERT INTO `keyword_search_num` VALUES (352, '用过的面膜', 1, '2019-07-25 07:41:16');
INSERT INTO `keyword_search_num` VALUES (353, '塔扇', 2, '2019-07-25 08:10:05');
INSERT INTO `keyword_search_num` VALUES (354, '湿纸巾', 1, '2019-07-25 08:10:43');
INSERT INTO `keyword_search_num` VALUES (355, '山竹皮', 3, '2019-07-25 08:37:45');
INSERT INTO `keyword_search_num` VALUES (356, '人脸', 3, '2019-07-25 09:10:04');
INSERT INTO `keyword_search_num` VALUES (357, '秋葵', 2, '2019-07-25 09:13:31');
INSERT INTO `keyword_search_num` VALUES (358, '报警仪', 1, '2019-07-25 09:14:22');
INSERT INTO `keyword_search_num` VALUES (359, '鞋子', 1, '2019-07-25 09:14:53');
INSERT INTO `keyword_search_num` VALUES (360, '抽纸', 6, '2019-07-25 09:52:27');
INSERT INTO `keyword_search_num` VALUES (361, '瓜皮', 3, '2019-07-25 10:06:05');
INSERT INTO `keyword_search_num` VALUES (362, '西瓜皮', 3, '2019-07-25 10:06:12');
INSERT INTO `keyword_search_num` VALUES (363, '炸弹', 1, '2019-07-25 10:07:02');
INSERT INTO `keyword_search_num` VALUES (364, '车轱辘', 1, '2019-07-25 10:07:47');
INSERT INTO `keyword_search_num` VALUES (365, '车轮', 1, '2019-07-25 10:07:55');
INSERT INTO `keyword_search_num` VALUES (366, '硬纸板', 1, '2019-07-25 10:08:06');
INSERT INTO `keyword_search_num` VALUES (367, '屏幕截图', 3, '2019-07-25 10:09:47');
INSERT INTO `keyword_search_num` VALUES (368, '小米', 1, '2019-07-25 10:10:18');
INSERT INTO `keyword_search_num` VALUES (369, '健康监测', 1, '2019-07-25 10:14:39');
INSERT INTO `keyword_search_num` VALUES (370, '智能家居', 1, '2019-07-25 10:14:47');
INSERT INTO `keyword_search_num` VALUES (371, '图画', 1, '2019-07-25 10:26:22');
INSERT INTO `keyword_search_num` VALUES (372, '烧录卡', 2, '2019-07-25 10:58:07');
INSERT INTO `keyword_search_num` VALUES (373, '草莓', 1, '2019-07-25 11:25:23');
INSERT INTO `keyword_search_num` VALUES (374, '苹果皮', 1, '2019-07-25 12:42:24');
INSERT INTO `keyword_search_num` VALUES (375, '王松烨', 1, '2019-07-25 12:53:29');
INSERT INTO `keyword_search_num` VALUES (376, '李亭立', 1, '2019-07-25 12:53:38');
INSERT INTO `keyword_search_num` VALUES (377, '方便面', 3, '2019-07-25 12:53:48');
INSERT INTO `keyword_search_num` VALUES (378, '酸菜鱼', 2, '2019-07-25 12:53:56');
INSERT INTO `keyword_search_num` VALUES (379, '生饭', 1, '2019-07-25 12:54:07');
INSERT INTO `keyword_search_num` VALUES (380, '生米饭', 1, '2019-07-25 12:54:17');
INSERT INTO `keyword_search_num` VALUES (381, '开心果', 11, '2019-07-25 12:54:50');
INSERT INTO `keyword_search_num` VALUES (382, '水果', 1, '2019-07-25 13:22:29');
INSERT INTO `keyword_search_num` VALUES (383, '绿葡萄', 1, '2019-07-25 13:22:34');
INSERT INTO `keyword_search_num` VALUES (384, '数据线', 1, '2019-07-25 14:11:12');
INSERT INTO `keyword_search_num` VALUES (385, '大毛笔', 1, '2019-07-25 14:38:01');
INSERT INTO `keyword_search_num` VALUES (386, '硬茶叶', 1, '2019-07-25 14:38:40');
INSERT INTO `keyword_search_num` VALUES (387, '狗粮', 1, '2019-07-25 14:38:59');
INSERT INTO `keyword_search_num` VALUES (388, '螺蛳粉', 1, '2019-07-25 14:48:02');
INSERT INTO `keyword_search_num` VALUES (389, '螺蛳粉外卖盒', 1, '2019-07-25 14:48:25');
INSERT INTO `keyword_search_num` VALUES (390, '邓添元', 1, '2019-07-25 14:57:10');
INSERT INTO `keyword_search_num` VALUES (391, '笔记本', 1, '2019-07-25 14:59:42');
INSERT INTO `keyword_search_num` VALUES (392, '陶瓷/马克杯', 1, '2019-07-25 15:03:39');
INSERT INTO `keyword_search_num` VALUES (393, '指甲刀', 1, '2019-07-25 15:12:25');
INSERT INTO `keyword_search_num` VALUES (394, '玉米壳', 1, '2019-07-25 15:12:41');
INSERT INTO `keyword_search_num` VALUES (395, '家装建材', 1, '2019-07-25 15:22:36');
INSERT INTO `keyword_search_num` VALUES (396, '怡宝矿泉水', 2, '2019-07-25 15:52:20');
INSERT INTO `keyword_search_num` VALUES (397, '矿泉水-怡宝矿泉水', 1, '2019-07-25 15:52:27');
INSERT INTO `keyword_search_num` VALUES (398, '桃核', 1, '2019-07-25 17:49:29');
INSERT INTO `keyword_search_num` VALUES (399, '晴天娃娃', 1, '2019-07-25 17:52:55');
INSERT INTO `keyword_search_num` VALUES (400, '扭扭车', 1, '2019-07-25 17:53:03');
INSERT INTO `keyword_search_num` VALUES (401, '背包', 2, '2019-07-25 18:02:54');
INSERT INTO `keyword_search_num` VALUES (402, '容器', 2, '2019-07-25 19:33:34');
INSERT INTO `keyword_search_num` VALUES (403, '粥盒', 1, '2019-07-25 19:35:53');
INSERT INTO `keyword_search_num` VALUES (404, '充电宝', 3, '2019-07-25 19:36:21');
INSERT INTO `keyword_search_num` VALUES (405, '大棒骨', 1, '2019-07-25 19:37:19');
INSERT INTO `keyword_search_num` VALUES (406, '人肉', 1, '2019-07-25 20:39:25');
INSERT INTO `keyword_search_num` VALUES (407, '鞋', 18, '2019-07-25 21:15:48');
INSERT INTO `keyword_search_num` VALUES (408, '药品', 2, '2019-07-25 23:06:11');
INSERT INTO `keyword_search_num` VALUES (409, '街道', 1, '2019-07-25 23:08:21');
INSERT INTO `keyword_search_num` VALUES (410, '白云', 1, '2019-07-25 23:08:26');
INSERT INTO `keyword_search_num` VALUES (411, '钱包/卡包', 1, '2019-07-26 08:41:50');
INSERT INTO `keyword_search_num` VALUES (412, '肮脏塑料袋', 2, '2019-07-26 08:59:30');
INSERT INTO `keyword_search_num` VALUES (413, '内裤', 1, '2019-07-26 09:05:02');
INSERT INTO `keyword_search_num` VALUES (414, '纽扣', 2, '2019-07-26 09:06:29');
INSERT INTO `keyword_search_num` VALUES (415, '鸭脖', 2, '2019-07-26 09:07:11');
INSERT INTO `keyword_search_num` VALUES (416, '重辣五号', 1, '2019-07-26 09:09:00');
INSERT INTO `keyword_search_num` VALUES (417, '皮卡丘', 1, '2019-07-26 09:09:51');
INSERT INTO `keyword_search_num` VALUES (418, '猪大肠', 1, '2019-07-26 09:10:13');
INSERT INTO `keyword_search_num` VALUES (419, '钠', 1, '2019-07-26 09:10:56');
INSERT INTO `keyword_search_num` VALUES (420, '人', 2, '2019-07-26 09:11:47');
INSERT INTO `keyword_search_num` VALUES (421, '樟脑丸', 1, '2019-07-26 09:12:24');
INSERT INTO `keyword_search_num` VALUES (422, '豆子', 5, '2019-07-26 10:48:51');
INSERT INTO `keyword_search_num` VALUES (423, '牛奶盒', 2, '2019-07-26 10:50:14');
INSERT INTO `keyword_search_num` VALUES (424, '果汁盒', 2, '2019-07-26 10:50:27');
INSERT INTO `keyword_search_num` VALUES (425, '果核', 2, '2019-07-26 11:05:31');
INSERT INTO `keyword_search_num` VALUES (426, '李子核', 1, '2019-07-26 11:05:48');
INSERT INTO `keyword_search_num` VALUES (427, '芒果核', 1, '2019-07-26 11:06:18');
INSERT INTO `keyword_search_num` VALUES (428, '烟头', 3, '2019-07-26 11:07:12');
INSERT INTO `keyword_search_num` VALUES (429, '烟', 2, '2019-07-26 11:08:37');
INSERT INTO `keyword_search_num` VALUES (430, '佩服', 1, '2019-07-26 11:16:06');
INSERT INTO `keyword_search_num` VALUES (431, '可降解垃圾袋', 1, '2019-07-26 11:25:53');
INSERT INTO `keyword_search_num` VALUES (432, '垃圾袋', 1, '2019-07-26 11:25:59');
INSERT INTO `keyword_search_num` VALUES (433, '竹制凉席', 2, '2019-07-26 14:33:44');
INSERT INTO `keyword_search_num` VALUES (434, '包装袋', 2, '2019-07-26 22:23:24');
INSERT INTO `keyword_search_num` VALUES (435, '塑料包装袋', 1, '2019-07-26 22:24:10');
INSERT INTO `keyword_search_num` VALUES (436, '@@::@@', 8, '2019-07-27 00:34:32');
INSERT INTO `keyword_search_num` VALUES (437, '花生', 2, '2019-07-27 07:36:08');
INSERT INTO `keyword_search_num` VALUES (438, '枣核', 1, '2019-07-27 16:41:51');
INSERT INTO `keyword_search_num` VALUES (439, '核', 1, '2019-07-27 16:42:32');
INSERT INTO `keyword_search_num` VALUES (440, '多肉植物', 1, '2019-07-27 17:43:44');
INSERT INTO `keyword_search_num` VALUES (441, '酸奶', 7, '2019-07-27 17:43:53');
INSERT INTO `keyword_search_num` VALUES (442, '玻璃瓶', 2, '2019-07-27 19:07:58');
INSERT INTO `keyword_search_num` VALUES (443, '龙虾壳', 1, '2019-07-27 19:11:37');
INSERT INTO `keyword_search_num` VALUES (444, '酱油瓶', 1, '2019-07-27 19:14:28');
INSERT INTO `keyword_search_num` VALUES (445, '玻璃', 2, '2019-07-27 19:15:10');
INSERT INTO `keyword_search_num` VALUES (446, '11', 1, '2019-07-28 10:51:02');
INSERT INTO `keyword_search_num` VALUES (447, '眼影', 1, '2019-07-28 16:57:44');
INSERT INTO `keyword_search_num` VALUES (448, '呕吐物', 1, '2019-07-29 14:05:23');
INSERT INTO `keyword_search_num` VALUES (449, '开心果壳', 8, '2019-07-30 10:39:53');
INSERT INTO `keyword_search_num` VALUES (450, '鱿鱼', 1, '2019-07-30 12:26:03');
INSERT INTO `keyword_search_num` VALUES (451, '天', 1, '2019-07-30 12:26:18');
INSERT INTO `keyword_search_num` VALUES (452, '旋钮', 1, '2019-07-30 12:27:51');
INSERT INTO `keyword_search_num` VALUES (453, '猪肝', 2, '2019-07-30 15:35:08');
INSERT INTO `keyword_search_num` VALUES (454, '鱼骨', 1, '2019-07-30 16:43:03');
INSERT INTO `keyword_search_num` VALUES (455, '陶瓷杯', 1, '2019-07-30 17:31:26');
INSERT INTO `keyword_search_num` VALUES (456, '情趣内衣，什么垃圾？', 1, '2019-07-30 17:58:39');
INSERT INTO `keyword_search_num` VALUES (457, '衣服是什么垃圾？', 1, '2019-07-30 17:58:48');
INSERT INTO `keyword_search_num` VALUES (458, '纸巾是什么东西？', 1, '2019-07-30 17:58:59');
INSERT INTO `keyword_search_num` VALUES (459, '电池是什么垃圾？', 1, '2019-07-30 17:59:08');
INSERT INTO `keyword_search_num` VALUES (460, '胶布', 2, '2019-07-30 18:23:20');
INSERT INTO `keyword_search_num` VALUES (461, '不是', 1, '2019-07-30 18:25:08');
INSERT INTO `keyword_search_num` VALUES (462, '土豆', 2, '2019-07-30 18:25:20');
INSERT INTO `keyword_search_num` VALUES (463, '龙虾', 1, '2019-07-30 19:58:24');
INSERT INTO `keyword_search_num` VALUES (464, '石锅鱼', 3, '2019-07-31 15:59:51');
INSERT INTO `keyword_search_num` VALUES (465, '塑料球', 1, '2019-07-31 17:08:32');
INSERT INTO `keyword_search_num` VALUES (466, '口香糖', 1, '2019-07-31 18:19:54');
INSERT INTO `keyword_search_num` VALUES (467, '塑料盒', 1, '2019-07-31 18:20:07');
INSERT INTO `keyword_search_num` VALUES (468, '电视背景墙', 3, '2019-07-31 18:57:06');
INSERT INTO `keyword_search_num` VALUES (469, '平板电脑', 1, '2019-07-31 21:56:06');
INSERT INTO `keyword_search_num` VALUES (470, '固体胶', 3, '2019-08-01 10:38:07');
INSERT INTO `keyword_search_num` VALUES (471, '葡萄', 1, '2019-08-01 20:59:10');
INSERT INTO `keyword_search_num` VALUES (472, '玉米棒', 1, '2019-08-02 08:25:45');
INSERT INTO `keyword_search_num` VALUES (473, '胭脂红', 1, '2019-08-02 09:50:14');
INSERT INTO `keyword_search_num` VALUES (474, '饮水器', 1, '2019-08-02 09:50:26');
INSERT INTO `keyword_search_num` VALUES (475, '马铃薯', 1, '2019-08-02 09:50:45');
INSERT INTO `keyword_search_num` VALUES (476, '芒果', 3, '2019-08-02 09:50:48');
INSERT INTO `keyword_search_num` VALUES (477, '鱼类', 1, '2019-08-02 09:51:41');
INSERT INTO `keyword_search_num` VALUES (478, '润滑油', 2, '2019-08-02 19:09:58');
INSERT INTO `keyword_search_num` VALUES (479, '西瓜籽', 1, '2019-08-03 15:39:08');
INSERT INTO `keyword_search_num` VALUES (480, '贝壳', 1, '2019-08-04 14:55:54');
INSERT INTO `keyword_search_num` VALUES (481, '过期零食', 1, '2019-08-04 20:53:29');
INSERT INTO `keyword_search_num` VALUES (482, '过期', 2, '2019-08-04 20:53:36');
INSERT INTO `keyword_search_num` VALUES (483, '零食', 1, '2019-08-04 20:53:44');
INSERT INTO `keyword_search_num` VALUES (484, '吊顶', 1, '2019-08-05 13:30:59');
INSERT INTO `keyword_search_num` VALUES (485, '粉彩山水', 2, '2019-08-05 13:31:29');
INSERT INTO `keyword_search_num` VALUES (486, '油画', 3, '2019-08-05 13:32:03');
INSERT INTO `keyword_search_num` VALUES (487, '积极', 1, '2019-08-05 17:58:02');
INSERT INTO `keyword_search_num` VALUES (488, '辣条', 1, '2019-08-05 23:46:24');
INSERT INTO `keyword_search_num` VALUES (489, '雪糕', 1, '2019-08-05 23:46:48');
INSERT INTO `keyword_search_num` VALUES (490, '睫毛膏', 1, '2019-08-06 10:50:32');
INSERT INTO `keyword_search_num` VALUES (491, '饼干', 3, '2019-08-06 10:50:51');
INSERT INTO `keyword_search_num` VALUES (492, '饮料塑料瓶', 1, '2019-08-06 12:18:50');
INSERT INTO `keyword_search_num` VALUES (493, '桃子皮', 1, '2019-08-07 15:45:52');
INSERT INTO `keyword_search_num` VALUES (494, '鱼', 1, '2019-08-08 10:28:26');
INSERT INTO `keyword_search_num` VALUES (495, '医生', 2, '2019-08-08 15:46:18');
INSERT INTO `keyword_search_num` VALUES (496, '美容器', 1, '2019-08-08 19:09:26');
INSERT INTO `keyword_search_num` VALUES (497, '笔芯', 1, '2019-08-12 17:25:00');
INSERT INTO `keyword_search_num` VALUES (498, '傻逼', 1, '2019-08-14 09:46:49');
INSERT INTO `keyword_search_num` VALUES (499, '捏手办的橡皮泥', 1, '2019-08-16 14:57:53');
INSERT INTO `keyword_search_num` VALUES (500, '精子', 1, '2019-08-17 10:26:00');
INSERT INTO `keyword_search_num` VALUES (501, '出于垃圾', 1, '2019-08-17 10:45:08');
INSERT INTO `keyword_search_num` VALUES (502, '牛肉', 2, '2019-08-17 10:45:26');
INSERT INTO `keyword_search_num` VALUES (503, '烟盒', 1, '2019-08-19 11:44:14');
INSERT INTO `keyword_search_num` VALUES (504, '汽水瓶', 2, '2019-08-20 15:54:36');
INSERT INTO `keyword_search_num` VALUES (505, '布绒玩具', 1, '2019-08-21 17:01:03');
INSERT INTO `keyword_search_num` VALUES (506, '鸡骨头', 1, '2019-08-23 10:51:09');
INSERT INTO `keyword_search_num` VALUES (507, '苹果核', 1, '2019-08-24 19:03:01');
INSERT INTO `keyword_search_num` VALUES (508, '鸭肉', 1, '2019-08-24 23:02:28');
INSERT INTO `keyword_search_num` VALUES (509, '粪便', 1, '2019-08-26 11:07:52');
INSERT INTO `keyword_search_num` VALUES (510, '口水', 1, '2019-08-26 11:08:52');
INSERT INTO `keyword_search_num` VALUES (511, '唾液', 2, '2019-08-26 11:08:58');
INSERT INTO `keyword_search_num` VALUES (512, '鼻涕', 1, '2019-08-26 11:09:09');
INSERT INTO `keyword_search_num` VALUES (513, '尿包', 1, '2019-08-26 14:35:11');
INSERT INTO `keyword_search_num` VALUES (514, '空心菜', 1, '2019-08-26 17:50:34');
INSERT INTO `keyword_search_num` VALUES (515, '电视机', 3, '2019-08-28 09:14:14');
INSERT INTO `keyword_search_num` VALUES (516, '超级星光大道', 1, '2019-08-28 09:14:25');
INSERT INTO `keyword_search_num` VALUES (517, '鞋套', 1, '2019-08-29 11:36:31');
INSERT INTO `keyword_search_num` VALUES (518, '章鱼', 1, '2019-08-29 12:00:10');
INSERT INTO `keyword_search_num` VALUES (519, '车', 1, '2019-08-29 12:01:08');
INSERT INTO `keyword_search_num` VALUES (520, '行车记录仪', 1, '2019-08-29 12:01:12');
INSERT INTO `keyword_search_num` VALUES (521, '居家室内', 2, '2019-08-29 14:17:54');
INSERT INTO `keyword_search_num` VALUES (522, '女孩', 1, '2019-08-29 14:18:18');
INSERT INTO `keyword_search_num` VALUES (523, '卷心菜', 1, '2019-08-29 14:46:42');
INSERT INTO `keyword_search_num` VALUES (524, '一次性塑料杯', 1, '2019-08-29 22:28:04');
INSERT INTO `keyword_search_num` VALUES (525, '早饭饭盒', 1, '2019-08-29 22:28:15');
INSERT INTO `keyword_search_num` VALUES (526, '塑料吸管', 2, '2019-08-30 08:36:41');
INSERT INTO `keyword_search_num` VALUES (527, '吸管', 2, '2019-08-30 08:36:54');
INSERT INTO `keyword_search_num` VALUES (528, '蟑螂屋', 1, '2019-08-30 10:30:53');
INSERT INTO `keyword_search_num` VALUES (529, '蟑螂', 1, '2019-08-30 10:31:03');
INSERT INTO `keyword_search_num` VALUES (530, '方便面袋', 1, '2019-08-31 20:34:42');
INSERT INTO `keyword_search_num` VALUES (531, '方便面盒', 2, '2019-08-31 20:34:53');
INSERT INTO `keyword_search_num` VALUES (532, '过期化妆品', 1, '2019-09-01 00:20:04');
INSERT INTO `keyword_search_num` VALUES (533, '酸奶利乐包装盒', 1, '2019-09-01 11:18:11');
INSERT INTO `keyword_search_num` VALUES (534, '透明熟料包装袋', 1, '2019-09-01 13:30:05');
INSERT INTO `keyword_search_num` VALUES (535, '透明塑料包装', 2, '2019-09-01 13:30:20');
INSERT INTO `keyword_search_num` VALUES (536, '塑料包装', 1, '2019-09-01 13:30:26');
INSERT INTO `keyword_search_num` VALUES (537, '塑料包装纸', 1, '2019-09-01 13:30:28');
INSERT INTO `keyword_search_num` VALUES (538, '香蕉', 1, '2019-09-01 15:50:03');
INSERT INTO `keyword_search_num` VALUES (539, '核桃皮', 1, '2019-09-02 00:25:49');
INSERT INTO `keyword_search_num` VALUES (540, '咖喱', 1, '2019-09-02 15:15:49');
INSERT INTO `keyword_search_num` VALUES (541, '方便面（袋装）', 1, '2019-09-02 15:15:55');
INSERT INTO `keyword_search_num` VALUES (542, '鞠余林', 1, '2019-09-03 09:43:39');
INSERT INTO `keyword_search_num` VALUES (543, '旺仔牛奶', 1, '2019-09-03 10:55:29');
INSERT INTO `keyword_search_num` VALUES (544, '牛奶罐', 1, '2019-09-03 10:55:42');
INSERT INTO `keyword_search_num` VALUES (545, '手巾', 1, '2019-09-03 15:50:44');
INSERT INTO `keyword_search_num` VALUES (546, '泡面桶', 1, '2019-09-03 20:13:58');
INSERT INTO `keyword_search_num` VALUES (547, '泡面', 1, '2019-09-03 20:14:06');
INSERT INTO `keyword_search_num` VALUES (548, '方便吗', 1, '2019-09-03 20:14:18');
INSERT INTO `keyword_search_num` VALUES (549, '方便', 1, '2019-09-03 20:14:21');
INSERT INTO `keyword_search_num` VALUES (550, '手办', 1, '2019-09-04 10:46:03');
INSERT INTO `keyword_search_num` VALUES (551, '嗯嗯', 1, '2019-09-04 17:20:19');
INSERT INTO `keyword_search_num` VALUES (552, '本册/便签', 1, '2019-09-04 17:20:48');
INSERT INTO `keyword_search_num` VALUES (553, '居民楼', 2, '2019-09-04 17:22:02');
INSERT INTO `keyword_search_num` VALUES (554, '垃圾桶', 1, '2019-09-04 22:33:36');
INSERT INTO `keyword_search_num` VALUES (555, '湿豆浆杯', 1, '2019-09-05 08:42:28');
INSERT INTO `keyword_search_num` VALUES (556, '豆浆纸杯', 1, '2019-09-05 08:42:38');
INSERT INTO `keyword_search_num` VALUES (557, '纸杯', 1, '2019-09-05 08:42:43');
INSERT INTO `keyword_search_num` VALUES (558, '桌菜', 1, '2019-09-05 15:04:19');
INSERT INTO `keyword_search_num` VALUES (559, '妈妈', 1, '2019-09-05 15:07:02');
INSERT INTO `keyword_search_num` VALUES (560, '泰山香烟', 1, '2019-09-06 15:31:44');
INSERT INTO `keyword_search_num` VALUES (561, '黄金叶香烟', 2, '2019-09-08 19:12:47');
INSERT INTO `keyword_search_num` VALUES (562, '果蔬', 1, '2024-04-21 10:34:56');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `user_id` int NOT NULL COMMENT '用户',
  `recycler_id` int NULL DEFAULT NULL COMMENT '回收员id',
  `estimate_weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预估重量',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单回收地址',
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '电话号码',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '垃圾类型',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '订单状态 1:待接单，2:已完成，3:已取消，4:已接单，5:回收员确认，6:用户确认',
  `appointment_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约时间',
  `amount` double(8, 2) NOT NULL DEFAULT 0.00 COMMENT '总价',
  `order_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '下单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (9, 11, 11, '10-50公斤', '前门东大街9号', '12345678901', '金属类', 2, '2024-04-21 5:10', 0.00, '2024-04-20 00:00:00');
INSERT INTO `orders` VALUES (10, 11, 11, '10-50公斤', '前门东大街9号', '12345678901', '塑料类', 2, '2024-04-21 5:10', 0.00, '2024-04-20 16:38:45');
INSERT INTO `orders` VALUES (11, 11, 11, '10-50公斤', '雁山区雁山镇一号', '0178783861992', '纸皮类', 2, '2024-04-20 5:10', 0.00, '2024-04-20 20:38:04');
INSERT INTO `orders` VALUES (12, 11, NULL, '10-50公斤', '雁山区雁山镇一号', '0178783861992', '纸皮类', 2, '2024-04-20 5:10', 0.00, '2024-04-20 21:59:56');
INSERT INTO `orders` VALUES (13, 11, NULL, '10-50公斤', '雁山区雁山镇一号', '0178783861992', '纸皮类', 3, '2024-04-21 5:10', 0.00, '2024-04-20 22:01:56');
INSERT INTO `orders` VALUES (14, 11, 11, '10-50公斤', '雁山区雁山镇一号', '0178783861992', '衣物&其它', 2, '2024-04-20 5:10', 0.00, '2024-04-20 22:06:04');
INSERT INTO `orders` VALUES (15, 11, 11, '10-50公斤', '雁山区雁山镇一号', '0178783861992', '纸皮类', 2, '2024-04-20 5:10', 0.00, '2024-04-20 22:35:09');
INSERT INTO `orders` VALUES (16, 11, 11, '10-50公斤', '雁山区雁山镇一号', '0178783861992', '纸皮类', 2, '2024-04-21 5:10', 0.00, '2024-04-21 00:29:10');
INSERT INTO `orders` VALUES (17, 11, 11, '10-50公斤', '雁山区雁山镇一号', '17878386199', '金属类', 2, '2024-04-23 5:10', 0.00, '2024-04-21 01:47:13');
INSERT INTO `orders` VALUES (18, 20, 11, '10-50公斤', '前门东大街辅路与正义路交叉口西北方向60米', '14875745745', '纸皮类', 2, '2024-04-22 5:10', 0.00, '2024-04-21 09:39:09');
INSERT INTO `orders` VALUES (19, 20, 11, '10-50公斤', '电视广告', '15555555555', '纸皮类', 2, '2024-04-22 6:10', 0.00, '2024-04-21 10:14:12');
INSERT INTO `orders` VALUES (20, 11, 11, '10-50公斤', '广西', '17878386199', '金属类', 2, '2024-04-21 7:10', 0.00, '2024-04-21 10:20:58');
INSERT INTO `orders` VALUES (21, 11, 11, '10-50公斤', '雁山区雁山镇一号', '17878386199', '纸皮类', 2, '2024-04-21 8:10', 0.00, '2024-04-21 10:29:56');
INSERT INTO `orders` VALUES (22, 11, NULL, '10-50公斤', '前门东大街辅路与正义路交叉口西北方向60米', '19839456720', '衣物&其它', 3, '2024-04-23 5:10', 0.00, '2024-04-21 10:36:46');
INSERT INTO `orders` VALUES (23, 11, NULL, '10-50公斤', '前门东大街辅路与正义路交叉口西北方向60米', '19839456720', '衣物&其它', 3, '2024-04-21 6:10', 0.00, '2024-04-21 10:38:35');

-- ----------------------------
-- Table structure for question_bank
-- ----------------------------
DROP TABLE IF EXISTS `question_bank`;
CREATE TABLE `question_bank`  (
  `question_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `garbage_type` tinyint NULL DEFAULT 2 COMMENT '垃圾类型',
  `garbage_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '垃圾名称',
  `analysis` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '解析',
  `remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`question_id`) USING BTREE,
  UNIQUE INDEX `question_bank_question_id_uindex`(`question_id`) USING BTREE,
  UNIQUE INDEX `question_bank_garbage_name_uindex`(`garbage_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 824 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '题库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question_bank
-- ----------------------------
INSERT INTO `question_bank` VALUES (1, 1, '纸巾', '', '纸巾不要乱丢呀，会污染环境');
INSERT INTO `question_bank` VALUES (2, 2, '剩饭残渣', NULL, NULL);
INSERT INTO `question_bank` VALUES (3, 3, '电脑', NULL, '可回收哟');
INSERT INTO `question_bank` VALUES (4, 4, '干电池', NULL, '有害垃圾哟');
INSERT INTO `question_bank` VALUES (5, 1, '餐巾纸', NULL, NULL);
INSERT INTO `question_bank` VALUES (6, 1, '卫生间用纸', NULL, NULL);
INSERT INTO `question_bank` VALUES (7, 1, '尿不湿', NULL, NULL);
INSERT INTO `question_bank` VALUES (8, 1, '猫砂', NULL, NULL);
INSERT INTO `question_bank` VALUES (9, 1, '狗尿垫', NULL, NULL);
INSERT INTO `question_bank` VALUES (10, 1, '污损纸张', NULL, NULL);
INSERT INTO `question_bank` VALUES (11, 1, '烟蒂', NULL, NULL);
INSERT INTO `question_bank` VALUES (12, 1, '干燥剂', NULL, NULL);
INSERT INTO `question_bank` VALUES (13, 1, '污损塑料', NULL, NULL);
INSERT INTO `question_bank` VALUES (14, 1, '尼龙制品', NULL, NULL);
INSERT INTO `question_bank` VALUES (15, 1, '编织袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (16, 1, '防碎气泡膜', NULL, NULL);
INSERT INTO `question_bank` VALUES (17, 1, '大骨头', NULL, NULL);
INSERT INTO `question_bank` VALUES (18, 1, '硬贝壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (19, 1, '硬果壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (20, 1, '椰子壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (21, 1, '榴莲壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (22, 1, '核桃壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (23, 1, '玉米衣', NULL, NULL);
INSERT INTO `question_bank` VALUES (24, 1, '甘蔗皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (25, 1, '榴莲核', NULL, NULL);
INSERT INTO `question_bank` VALUES (26, 1, '菠萝蜜核', NULL, NULL);
INSERT INTO `question_bank` VALUES (27, 1, '牛骨头', NULL, NULL);
INSERT INTO `question_bank` VALUES (28, 1, '毛发', NULL, NULL);
INSERT INTO `question_bank` VALUES (29, 1, '灰土', NULL, NULL);
INSERT INTO `question_bank` VALUES (30, 1, '炉渣', NULL, NULL);
INSERT INTO `question_bank` VALUES (31, 1, '橡皮泥', NULL, NULL);
INSERT INTO `question_bank` VALUES (32, 1, '太空沙', NULL, NULL);
INSERT INTO `question_bank` VALUES (33, 1, '胶水', NULL, NULL);
INSERT INTO `question_bank` VALUES (34, 1, '胶带', NULL, NULL);
INSERT INTO `question_bank` VALUES (35, 1, '花盆', NULL, NULL);
INSERT INTO `question_bank` VALUES (36, 1, '毛巾', NULL, NULL);
INSERT INTO `question_bank` VALUES (37, 1, '一次性餐具', NULL, NULL);
INSERT INTO `question_bank` VALUES (38, 1, '一次性杯子', NULL, NULL);
INSERT INTO `question_bank` VALUES (39, 1, '镜子', NULL, NULL);
INSERT INTO `question_bank` VALUES (40, 1, '陶瓷制品', NULL, NULL);
INSERT INTO `question_bank` VALUES (41, 1, '竹篮', NULL, NULL);
INSERT INTO `question_bank` VALUES (42, 1, '竹筷', NULL, NULL);
INSERT INTO `question_bank` VALUES (43, 1, '牙签', NULL, NULL);
INSERT INTO `question_bank` VALUES (44, 1, '筷子', NULL, NULL);
INSERT INTO `question_bank` VALUES (45, 1, '伞', NULL, NULL);
INSERT INTO `question_bank` VALUES (46, 1, '雨伞', NULL, NULL);
INSERT INTO `question_bank` VALUES (47, 1, '天堂伞', NULL, NULL);
INSERT INTO `question_bank` VALUES (48, 1, '笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (49, 1, '铅笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (50, 1, '毛笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (51, 1, '眼镜', NULL, NULL);
INSERT INTO `question_bank` VALUES (52, 1, '打火机', NULL, '干垃圾哟');
INSERT INTO `question_bank` VALUES (53, 1, '生蚝壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (54, 1, '烟盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (55, 1, '开心果', NULL, NULL);
INSERT INTO `question_bank` VALUES (56, 2, '米', NULL, NULL);
INSERT INTO `question_bank` VALUES (57, 2, '米饭', NULL, NULL);
INSERT INTO `question_bank` VALUES (58, 2, '面', NULL, NULL);
INSERT INTO `question_bank` VALUES (59, 2, '面包', NULL, NULL);
INSERT INTO `question_bank` VALUES (60, 2, '面条', NULL, NULL);
INSERT INTO `question_bank` VALUES (61, 2, '豆子', NULL, NULL);
INSERT INTO `question_bank` VALUES (62, 2, '黄豆', NULL, NULL);
INSERT INTO `question_bank` VALUES (63, 2, '红豆', NULL, NULL);
INSERT INTO `question_bank` VALUES (64, 2, '绿豆', NULL, NULL);
INSERT INTO `question_bank` VALUES (65, 2, '鸡肉', NULL, NULL);
INSERT INTO `question_bank` VALUES (66, 2, '鸭肉', NULL, NULL);
INSERT INTO `question_bank` VALUES (67, 2, '猪肉', NULL, NULL);
INSERT INTO `question_bank` VALUES (68, 2, '牛肉', NULL, NULL);
INSERT INTO `question_bank` VALUES (69, 2, '羊肉', NULL, NULL);
INSERT INTO `question_bank` VALUES (70, 2, '鸡蛋', NULL, NULL);
INSERT INTO `question_bank` VALUES (71, 2, '鸭蛋', NULL, NULL);
INSERT INTO `question_bank` VALUES (72, 2, '咸鸭蛋', NULL, NULL);
INSERT INTO `question_bank` VALUES (73, 2, '猪肝', NULL, NULL);
INSERT INTO `question_bank` VALUES (74, 2, '腊肉', NULL, NULL);
INSERT INTO `question_bank` VALUES (75, 2, '午餐肉', NULL, NULL);
INSERT INTO `question_bank` VALUES (76, 2, '里脊肉', NULL, NULL);
INSERT INTO `question_bank` VALUES (77, 2, '蛋壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (78, 2, '鱼', NULL, NULL);
INSERT INTO `question_bank` VALUES (79, 2, '虾', NULL, NULL);
INSERT INTO `question_bank` VALUES (80, 2, '鱼鳞', NULL, NULL);
INSERT INTO `question_bank` VALUES (81, 2, '虾头', NULL, NULL);
INSERT INTO `question_bank` VALUES (82, 2, '虾仁', NULL, NULL);
INSERT INTO `question_bank` VALUES (83, 2, '虾壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (84, 2, '鱿鱼', NULL, NULL);
INSERT INTO `question_bank` VALUES (85, 2, '章鱼', NULL, NULL);
INSERT INTO `question_bank` VALUES (86, 2, '墨鱼', NULL, NULL);
INSERT INTO `question_bank` VALUES (87, 2, '蔬菜', NULL, NULL);
INSERT INTO `question_bank` VALUES (88, 2, '绿叶菜', NULL, NULL);
INSERT INTO `question_bank` VALUES (89, 2, '空心菜', NULL, NULL);
INSERT INTO `question_bank` VALUES (90, 2, '卷心菜', NULL, NULL);
INSERT INTO `question_bank` VALUES (91, 2, '蘑菇', NULL, NULL);
INSERT INTO `question_bank` VALUES (92, 2, '香菇', NULL, NULL);
INSERT INTO `question_bank` VALUES (93, 2, '调料', NULL, NULL);
INSERT INTO `question_bank` VALUES (94, 2, '酱料', NULL, NULL);
INSERT INTO `question_bank` VALUES (95, 2, '老干妈调料酱', NULL, NULL);
INSERT INTO `question_bank` VALUES (96, 2, '火锅锅底', NULL, NULL);
INSERT INTO `question_bank` VALUES (97, 2, '鱼骨', NULL, NULL);
INSERT INTO `question_bank` VALUES (98, 2, '茶叶', NULL, NULL);
INSERT INTO `question_bank` VALUES (99, 2, '咖啡渣', NULL, NULL);
INSERT INTO `question_bank` VALUES (100, 2, '糕点', NULL, NULL);
INSERT INTO `question_bank` VALUES (101, 2, '糖果', NULL, NULL);
INSERT INTO `question_bank` VALUES (102, 2, '肉干', NULL, NULL);
INSERT INTO `question_bank` VALUES (103, 2, '牛肉干', NULL, NULL);
INSERT INTO `question_bank` VALUES (104, 2, '羊肉干', NULL, NULL);
INSERT INTO `question_bank` VALUES (105, 2, '红枣', NULL, NULL);
INSERT INTO `question_bank` VALUES (106, 2, '中药材', NULL, NULL);
INSERT INTO `question_bank` VALUES (107, 2, '面粉', NULL, NULL);
INSERT INTO `question_bank` VALUES (108, 2, '生粉', NULL, NULL);
INSERT INTO `question_bank` VALUES (109, 2, '猫粮', NULL, NULL);
INSERT INTO `question_bank` VALUES (110, 2, '狗粮', NULL, NULL);
INSERT INTO `question_bank` VALUES (111, 2, '苹果', NULL, '苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟苹果好吃，可不能乱丢哟');
INSERT INTO `question_bank` VALUES (112, 2, '水果', NULL, NULL);
INSERT INTO `question_bank` VALUES (113, 2, '椰子肉', NULL, NULL);
INSERT INTO `question_bank` VALUES (114, 2, '水果皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (115, 2, '西瓜皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (116, 2, '香蕉皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (117, 2, '橘子皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (118, 2, '苹果皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (119, 2, '葡萄', NULL, NULL);
INSERT INTO `question_bank` VALUES (120, 2, '葡萄枝', NULL, NULL);
INSERT INTO `question_bank` VALUES (121, 2, '西瓜籽', NULL, NULL);
INSERT INTO `question_bank` VALUES (122, 2, '家养植物', NULL, NULL);
INSERT INTO `question_bank` VALUES (123, 2, '玫瑰花', NULL, NULL);
INSERT INTO `question_bank` VALUES (124, 1, '马克杯', NULL, NULL);
INSERT INTO `question_bank` VALUES (125, 3, '塑料瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (126, 1, '3D眼镜', NULL, NULL);
INSERT INTO `question_bank` VALUES (128, 1, '冰棒皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (129, 1, '笔盖', NULL, NULL);
INSERT INTO `question_bank` VALUES (137, 1, '钢笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (145, 1, '圆珠笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (146, 1, '方便面盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (147, 1, '粽叶', NULL, NULL);
INSERT INTO `question_bank` VALUES (148, 1, '牙刷', NULL, NULL);
INSERT INTO `question_bank` VALUES (149, 1, '贝壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (150, 3, '可乐瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (151, 3, '易拉罐', NULL, NULL);
INSERT INTO `question_bank` VALUES (152, 3, '旧书包', NULL, NULL);
INSERT INTO `question_bank` VALUES (153, 3, '电线', NULL, NULL);
INSERT INTO `question_bank` VALUES (158, 4, '蓄电池', NULL, NULL);
INSERT INTO `question_bank` VALUES (169, 1, '旧浴缸', NULL, NULL);
INSERT INTO `question_bank` VALUES (170, 1, '盆子', NULL, NULL);
INSERT INTO `question_bank` VALUES (171, 1, '坏马桶', NULL, NULL);
INSERT INTO `question_bank` VALUES (172, 1, '旧水槽', NULL, NULL);
INSERT INTO `question_bank` VALUES (174, 1, '化妆刷', NULL, NULL);
INSERT INTO `question_bank` VALUES (175, 1, '坛子', NULL, NULL);
INSERT INTO `question_bank` VALUES (176, 1, '海绵', NULL, NULL);
INSERT INTO `question_bank` VALUES (177, 1, '花生壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (178, 1, '菜板', NULL, NULL);
INSERT INTO `question_bank` VALUES (179, 1, '砖块', NULL, NULL);
INSERT INTO `question_bank` VALUES (180, 1, '卫生纸', NULL, NULL);
INSERT INTO `question_bank` VALUES (181, 1, '篮球', NULL, NULL);
INSERT INTO `question_bank` VALUES (182, 1, '核桃', NULL, NULL);
INSERT INTO `question_bank` VALUES (183, 1, '杯子', NULL, NULL);
INSERT INTO `question_bank` VALUES (184, 1, '陶瓷杯', NULL, NULL);
INSERT INTO `question_bank` VALUES (185, 1, '一次性筷子', NULL, NULL);
INSERT INTO `question_bank` VALUES (186, 1, '西梅核', NULL, NULL);
INSERT INTO `question_bank` VALUES (187, 1, '坏的花盆', NULL, NULL);
INSERT INTO `question_bank` VALUES (188, 1, '木质梳子', NULL, NULL);
INSERT INTO `question_bank` VALUES (189, 1, '脏污衣服', NULL, NULL);
INSERT INTO `question_bank` VALUES (191, 1, '渣土', NULL, NULL);
INSERT INTO `question_bank` VALUES (192, 1, '湿垃圾袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (193, 1, '瓦片', NULL, NULL);
INSERT INTO `question_bank` VALUES (194, 1, '扫把', NULL, NULL);
INSERT INTO `question_bank` VALUES (195, 1, '纸尿裤', NULL, NULL);
INSERT INTO `question_bank` VALUES (196, 1, '头发', NULL, NULL);
INSERT INTO `question_bank` VALUES (198, 1, '创可贴', NULL, NULL);
INSERT INTO `question_bank` VALUES (204, 1, '内衣裤', NULL, NULL);
INSERT INTO `question_bank` VALUES (205, 1, '污损塑料袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (207, 2, '菜叶', NULL, NULL);
INSERT INTO `question_bank` VALUES (208, 2, '橙皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (209, 2, '葱', NULL, NULL);
INSERT INTO `question_bank` VALUES (210, 2, '饼干', NULL, NULL);
INSERT INTO `question_bank` VALUES (211, 2, '番茄酱', NULL, NULL);
INSERT INTO `question_bank` VALUES (214, 2, '马铃薯', NULL, NULL);
INSERT INTO `question_bank` VALUES (216, 2, '甘蔗', NULL, NULL);
INSERT INTO `question_bank` VALUES (217, 2, '玉米', NULL, NULL);
INSERT INTO `question_bank` VALUES (218, 2, '骨头', NULL, NULL);
INSERT INTO `question_bank` VALUES (219, 2, '鸡鹅鸭骨头', NULL, NULL);
INSERT INTO `question_bank` VALUES (221, 2, '蛋糕', NULL, NULL);
INSERT INTO `question_bank` VALUES (223, 2, '草莓', NULL, NULL);
INSERT INTO `question_bank` VALUES (224, 2, '西红柿', NULL, NULL);
INSERT INTO `question_bank` VALUES (225, 2, '梨', NULL, NULL);
INSERT INTO `question_bank` VALUES (226, 2, '蟹壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (228, 2, '辣椒', NULL, NULL);
INSERT INTO `question_bank` VALUES (229, 2, '巧克力', NULL, NULL);
INSERT INTO `question_bank` VALUES (230, 2, '茄子', NULL, NULL);
INSERT INTO `question_bank` VALUES (231, 2, '豌豆皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (233, 2, '树叶', NULL, NULL);
INSERT INTO `question_bank` VALUES (234, 2, '剩饭剩菜', NULL, NULL);
INSERT INTO `question_bank` VALUES (238, 2, '干果仁', NULL, NULL);
INSERT INTO `question_bank` VALUES (239, 2, '苹果核', NULL, NULL);
INSERT INTO `question_bank` VALUES (240, 2, '蛋糕饼干', NULL, NULL);
INSERT INTO `question_bank` VALUES (241, 2, '动物内脏', NULL, NULL);
INSERT INTO `question_bank` VALUES (242, 2, '鸡蛋及蛋壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (243, 2, '大米及豆类', NULL, NULL);
INSERT INTO `question_bank` VALUES (244, 2, '中药药渣', NULL, NULL);
INSERT INTO `question_bank` VALUES (245, 2, '动物饲料', NULL, NULL);
INSERT INTO `question_bank` VALUES (246, 2, '花卉', NULL, NULL);
INSERT INTO `question_bank` VALUES (248, 2, '花瓣', NULL, NULL);
INSERT INTO `question_bank` VALUES (249, 3, '纸板箱', NULL, NULL);
INSERT INTO `question_bank` VALUES (250, 3, '报纸', NULL, NULL);
INSERT INTO `question_bank` VALUES (251, 3, '废弃书本', NULL, NULL);
INSERT INTO `question_bank` VALUES (252, 3, '快递纸袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (253, 3, '打印纸', NULL, NULL);
INSERT INTO `question_bank` VALUES (254, 3, '信封', NULL, NULL);
INSERT INTO `question_bank` VALUES (255, 3, '广告单', NULL, NULL);
INSERT INTO `question_bank` VALUES (256, 3, '纸塑铝复合包装', NULL, NULL);
INSERT INTO `question_bank` VALUES (257, 3, '利乐包', NULL, NULL);
INSERT INTO `question_bank` VALUES (258, 3, '食品与日用品塑料瓶罐及瓶盖(总)', NULL, NULL);
INSERT INTO `question_bank` VALUES (259, 3, '饮料瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (260, 3, '奶瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (261, 3, '洗发水瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (262, 3, '乳液罐', NULL, NULL);
INSERT INTO `question_bank` VALUES (263, 3, '食用油桶', NULL, NULL);
INSERT INTO `question_bank` VALUES (264, 3, '塑料碗', NULL, NULL);
INSERT INTO `question_bank` VALUES (265, 3, '塑料盆', NULL, NULL);
INSERT INTO `question_bank` VALUES (266, 3, '塑料盒子', NULL, NULL);
INSERT INTO `question_bank` VALUES (267, 3, '食品保鲜盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (268, 3, '收纳盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (269, 3, '塑料玩具', NULL, NULL);
INSERT INTO `question_bank` VALUES (270, 3, '塑料积木', NULL, NULL);
INSERT INTO `question_bank` VALUES (271, 3, '塑料模型', NULL, NULL);
INSERT INTO `question_bank` VALUES (272, 3, '塑料衣架', NULL, NULL);
INSERT INTO `question_bank` VALUES (273, 3, '施工安全帽', NULL, NULL);
INSERT INTO `question_bank` VALUES (274, 3, 'PE- 塑料', NULL, NULL);
INSERT INTO `question_bank` VALUES (275, 3, 'pvc', NULL, NULL);
INSERT INTO `question_bank` VALUES (276, 3, '亚克力板', NULL, NULL);
INSERT INTO `question_bank` VALUES (277, 3, '塑料卡片', NULL, NULL);
INSERT INTO `question_bank` VALUES (278, 3, '密胺餐具', NULL, NULL);
INSERT INTO `question_bank` VALUES (279, 3, 'kt板', NULL, NULL);
INSERT INTO `question_bank` VALUES (280, 3, '泡沫', NULL, NULL);
INSERT INTO `question_bank` VALUES (281, 3, '泡沫塑料', NULL, NULL);
INSERT INTO `question_bank` VALUES (282, 3, '水果网套', NULL, NULL);
INSERT INTO `question_bank` VALUES (283, 3, '食品及日用品玻璃瓶罐', NULL, NULL);
INSERT INTO `question_bank` VALUES (284, 3, '调料瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (285, 3, '酒瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (286, 3, '化妆品瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (287, 3, '玻璃杯', NULL, NULL);
INSERT INTO `question_bank` VALUES (288, 3, '窗玻璃', NULL, NULL);
INSERT INTO `question_bank` VALUES (289, 3, '玻璃制品', NULL, NULL);
INSERT INTO `question_bank` VALUES (290, 3, '放大镜', NULL, NULL);
INSERT INTO `question_bank` VALUES (291, 3, '玻璃摆件', NULL, NULL);
INSERT INTO `question_bank` VALUES (292, 3, '碎玻璃', NULL, NULL);
INSERT INTO `question_bank` VALUES (293, 3, '金属瓶罐', NULL, NULL);
INSERT INTO `question_bank` VALUES (295, 3, '食品罐', NULL, NULL);
INSERT INTO `question_bank` VALUES (296, 3, '食品桶', NULL, NULL);
INSERT INTO `question_bank` VALUES (297, 3, '金属厨具', NULL, NULL);
INSERT INTO `question_bank` VALUES (298, 3, '菜刀', NULL, NULL);
INSERT INTO `question_bank` VALUES (299, 3, '锅', NULL, NULL);
INSERT INTO `question_bank` VALUES (300, 3, '金属工具', NULL, NULL);
INSERT INTO `question_bank` VALUES (301, 3, '刀片', NULL, NULL);
INSERT INTO `question_bank` VALUES (302, 3, '指甲剪', NULL, NULL);
INSERT INTO `question_bank` VALUES (303, 3, '螺丝刀', NULL, NULL);
INSERT INTO `question_bank` VALUES (304, 3, '金属制品', NULL, NULL);
INSERT INTO `question_bank` VALUES (305, 3, '铁钉', NULL, NULL);
INSERT INTO `question_bank` VALUES (306, 3, '铁皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (307, 3, '铝箔', NULL, NULL);
INSERT INTO `question_bank` VALUES (308, 3, '旧衣服', NULL, NULL);
INSERT INTO `question_bank` VALUES (309, 3, '床单', NULL, NULL);
INSERT INTO `question_bank` VALUES (310, 3, '枕头', NULL, NULL);
INSERT INTO `question_bank` VALUES (311, 3, '棉被', NULL, NULL);
INSERT INTO `question_bank` VALUES (312, 3, '皮鞋', NULL, NULL);
INSERT INTO `question_bank` VALUES (313, 3, '毛绒玩具', NULL, NULL);
INSERT INTO `question_bank` VALUES (314, 3, '布偶', NULL, NULL);
INSERT INTO `question_bank` VALUES (315, 3, '棉袄', NULL, NULL);
INSERT INTO `question_bank` VALUES (316, 3, '包', NULL, NULL);
INSERT INTO `question_bank` VALUES (317, 3, '皮带', NULL, NULL);
INSERT INTO `question_bank` VALUES (318, 3, '丝绸制品', NULL, NULL);
INSERT INTO `question_bank` VALUES (319, 3, '电路板', NULL, NULL);
INSERT INTO `question_bank` VALUES (320, 3, '主板', NULL, NULL);
INSERT INTO `question_bank` VALUES (321, 3, '内存条', NULL, NULL);
INSERT INTO `question_bank` VALUES (322, 3, '充电宝', NULL, NULL);
INSERT INTO `question_bank` VALUES (324, 3, '插头', NULL, NULL);
INSERT INTO `question_bank` VALUES (325, 3, '木制品', NULL, NULL);
INSERT INTO `question_bank` VALUES (326, 3, '积木', NULL, NULL);
INSERT INTO `question_bank` VALUES (327, 3, '砧板', NULL, NULL);
INSERT INTO `question_bank` VALUES (329, 3, '食品罐头', NULL, NULL);
INSERT INTO `question_bank` VALUES (333, 3, '旧鞋子', NULL, NULL);
INSERT INTO `question_bank` VALUES (334, 3, '牛奶盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (335, 3, '旧玩偶', NULL, NULL);
INSERT INTO `question_bank` VALUES (336, 3, '玻璃壶', NULL, NULL);
INSERT INTO `question_bank` VALUES (337, 3, '旧铁锅', NULL, NULL);
INSERT INTO `question_bank` VALUES (338, 3, '垃圾桶', NULL, NULL);
INSERT INTO `question_bank` VALUES (339, 3, '旧镜子', NULL, NULL);
INSERT INTO `question_bank` VALUES (341, 3, '塑料梳子', NULL, NULL);
INSERT INTO `question_bank` VALUES (342, 3, '旧帽子', NULL, NULL);
INSERT INTO `question_bank` VALUES (343, 3, '旧夹子', NULL, NULL);
INSERT INTO `question_bank` VALUES (344, 3, '废锁头', NULL, NULL);
INSERT INTO `question_bank` VALUES (345, 3, '牙膏皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (346, 3, '雨伞骨架', NULL, NULL);
INSERT INTO `question_bank` VALUES (347, 3, '旧纸袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (348, 3, '纸盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (349, 3, '旧玩具', NULL, NULL);
INSERT INTO `question_bank` VALUES (350, 4, '充电电池', NULL, NULL);
INSERT INTO `question_bank` VALUES (351, 4, '镉镍电池', NULL, NULL);
INSERT INTO `question_bank` VALUES (352, 4, '铅酸电池', NULL, NULL);
INSERT INTO `question_bank` VALUES (354, 4, '纽扣电池', NULL, NULL);
INSERT INTO `question_bank` VALUES (355, 4, '荧光（日光）灯管', NULL, NULL);
INSERT INTO `question_bank` VALUES (356, 4, '卤素灯', NULL, NULL);
INSERT INTO `question_bank` VALUES (357, 4, '过期药物', NULL, NULL);
INSERT INTO `question_bank` VALUES (358, 4, '药物胶囊', NULL, NULL);
INSERT INTO `question_bank` VALUES (359, 4, '药片', NULL, NULL);
INSERT INTO `question_bank` VALUES (360, 4, '药品内包装', NULL, NULL);
INSERT INTO `question_bank` VALUES (361, 4, '老鼠药（毒鼠强)', NULL, NULL);
INSERT INTO `question_bank` VALUES (362, 4, '杀虫喷雾罐', NULL, NULL);
INSERT INTO `question_bank` VALUES (363, 4, '废油漆桶', NULL, NULL);
INSERT INTO `question_bank` VALUES (364, 4, '染发剂壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (365, 4, '过期的指甲油', NULL, NULL);
INSERT INTO `question_bank` VALUES (366, 4, '洗甲水', NULL, NULL);
INSERT INTO `question_bank` VALUES (367, 4, '废含汞温度计', NULL, NULL);
INSERT INTO `question_bank` VALUES (368, 4, '废含汞血压计', NULL, NULL);
INSERT INTO `question_bank` VALUES (369, 4, '水银血压计', NULL, NULL);
INSERT INTO `question_bank` VALUES (370, 4, '水银体温计', NULL, NULL);
INSERT INTO `question_bank` VALUES (371, 4, '水银温度计', NULL, NULL);
INSERT INTO `question_bank` VALUES (372, 4, 'x光片等感光胶片', NULL, NULL);
INSERT INTO `question_bank` VALUES (373, 4, '相片底片', NULL, NULL);
INSERT INTO `question_bank` VALUES (374, 4, '漆桶', NULL, NULL);
INSERT INTO `question_bank` VALUES (375, 4, '电池', NULL, NULL);
INSERT INTO `question_bank` VALUES (377, 4, '创口贴', NULL, NULL);
INSERT INTO `question_bank` VALUES (378, 4, '酒精', NULL, NULL);
INSERT INTO `question_bank` VALUES (379, 4, '调色板', NULL, NULL);
INSERT INTO `question_bank` VALUES (380, 4, '油漆', NULL, NULL);
INSERT INTO `question_bank` VALUES (381, 4, '过期的胶囊药物', NULL, NULL);
INSERT INTO `question_bank` VALUES (382, 4, '温度计', NULL, NULL);
INSERT INTO `question_bank` VALUES (383, 4, '过期药片', NULL, NULL);
INSERT INTO `question_bank` VALUES (384, 4, '荧光灯', NULL, NULL);
INSERT INTO `question_bank` VALUES (386, 4, '医用棉签', NULL, NULL);
INSERT INTO `question_bank` VALUES (387, 4, '杀虫剂', NULL, NULL);
INSERT INTO `question_bank` VALUES (388, 4, '水彩笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (389, 4, '农药瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (390, 4, '医用纱布', NULL, NULL);
INSERT INTO `question_bank` VALUES (391, 4, '口服液瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (392, 4, '香水瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (393, 4, '荧光棒', NULL, NULL);
INSERT INTO `question_bank` VALUES (394, 4, '过期化妆品', NULL, NULL);
INSERT INTO `question_bank` VALUES (395, 4, '发胶', NULL, NULL);
INSERT INTO `question_bank` VALUES (396, 4, '注射器', NULL, NULL);
INSERT INTO `question_bank` VALUES (397, 4, '废气灯泡', NULL, NULL);
INSERT INTO `question_bank` VALUES (398, 4, '煤气罐', NULL, NULL);
INSERT INTO `question_bank` VALUES (399, 4, '医用手套', NULL, NULL);
INSERT INTO `question_bank` VALUES (401, 4, '镍镉电池', NULL, NULL);
INSERT INTO `question_bank` VALUES (405, 4, '节能灯', NULL, NULL);
INSERT INTO `question_bank` VALUES (407, 4, '药品包装', NULL, NULL);
INSERT INTO `question_bank` VALUES (411, 4, '过期指甲油水银温度计', NULL, NULL);
INSERT INTO `question_bank` VALUES (415, 4, '渣男', NULL, '坏坏的人，哼(￢︿̫̿￢☆)');
INSERT INTO `question_bank` VALUES (416, 3, '靓女', NULL, '请尽快给客服留言，我们提供免费上面回收服务');
INSERT INTO `question_bank` VALUES (417, 3, '靓仔', NULL, '请尽快给客服留言，我们提供免费上面回收服务');
INSERT INTO `question_bank` VALUES (418, 4, '渣女', NULL, '坏坏的人，哼(￢︿̫̿￢☆)');
INSERT INTO `question_bank` VALUES (419, 4, '前男友', NULL, '该放下的还是得放下，珍惜眼前人');
INSERT INTO `question_bank` VALUES (420, 4, '前女友', NULL, '该放下的还是得放下，珍惜眼前人');
INSERT INTO `question_bank` VALUES (421, 3, '男朋友', NULL, '有时偶尔不听话，大概是皮了，需要好好教育才能更懂你');
INSERT INTO `question_bank` VALUES (422, 3, '女朋友', NULL, 'ta 生气的时候朵小花哄哄试试，说不定能给你一个大大的拥抱');
INSERT INTO `question_bank` VALUES (423, 3, '黄金', NULL, '请留下联系方式，我们将尽快上门服务');
INSERT INTO `question_bank` VALUES (424, 2, '鸡蛋壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (425, 3, '键盘', NULL, NULL);
INSERT INTO `question_bank` VALUES (426, 3, '鼠标', NULL, NULL);
INSERT INTO `question_bank` VALUES (427, 1, '奶茶杯', NULL, '喝完好喝的奶茶，记得把奶茶杯放进干垃圾桶哟');
INSERT INTO `question_bank` VALUES (428, 1, '口红', NULL, '美美的你和美美的口红，你是无价之宝，而口红属于干垃圾');
INSERT INTO `question_bank` VALUES (429, 1, '狗屎', NULL, '属于宠物粪便，不建议归入到当前垃圾分类当中；实在不便时，可包裹后投入干垃圾桶内');
INSERT INTO `question_bank` VALUES (430, 1, '瓶装饮料', NULL, NULL);
INSERT INTO `question_bank` VALUES (433, 3, '塑料', NULL, NULL);
INSERT INTO `question_bank` VALUES (434, 3, '玻璃瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (435, 3, '玻璃', NULL, NULL);
INSERT INTO `question_bank` VALUES (436, 3, '纸', NULL, NULL);
INSERT INTO `question_bank` VALUES (437, 3, '衣服', NULL, NULL);
INSERT INTO `question_bank` VALUES (439, 3, '塑料盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (444, 3, '塑料杯', NULL, NULL);
INSERT INTO `question_bank` VALUES (445, 3, '矿泉水瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (447, 3, '泡沫板', NULL, NULL);
INSERT INTO `question_bank` VALUES (448, 3, '鞋子', NULL, NULL);
INSERT INTO `question_bank` VALUES (450, 3, '纸袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (451, 3, '书本', NULL, NULL);
INSERT INTO `question_bank` VALUES (454, 3, '泡沫箱', NULL, NULL);
INSERT INTO `question_bank` VALUES (457, 3, '螺丝', NULL, NULL);
INSERT INTO `question_bank` VALUES (458, 3, '被单', NULL, NULL);
INSERT INTO `question_bank` VALUES (460, 3, '啤酒瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (461, 3, '数据线', NULL, NULL);
INSERT INTO `question_bank` VALUES (462, 3, '废塑料', NULL, NULL);
INSERT INTO `question_bank` VALUES (464, 3, '白纸', NULL, NULL);
INSERT INTO `question_bank` VALUES (467, 3, '布', NULL, NULL);
INSERT INTO `question_bank` VALUES (468, 3, '剪刀', NULL, NULL);
INSERT INTO `question_bank` VALUES (469, 3, '充电线', NULL, NULL);
INSERT INTO `question_bank` VALUES (470, 3, '包装纸盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (471, 3, '塑料盖', NULL, NULL);
INSERT INTO `question_bank` VALUES (472, 3, '充电器', NULL, NULL);
INSERT INTO `question_bank` VALUES (474, 3, '利乐包装', NULL, NULL);
INSERT INTO `question_bank` VALUES (475, 3, '吸铁石', NULL, NULL);
INSERT INTO `question_bank` VALUES (476, 3, '除湿盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (477, 3, '金属', NULL, NULL);
INSERT INTO `question_bank` VALUES (478, 3, '木筷子', NULL, NULL);
INSERT INTO `question_bank` VALUES (479, 3, '被子', NULL, NULL);
INSERT INTO `question_bank` VALUES (481, 3, '铁', NULL, NULL);
INSERT INTO `question_bank` VALUES (483, 3, '足球', NULL, NULL);
INSERT INTO `question_bank` VALUES (484, 3, '排球', NULL, NULL);
INSERT INTO `question_bank` VALUES (486, 3, '钥匙', NULL, NULL);
INSERT INTO `question_bank` VALUES (488, 3, '酸奶利乐包装盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (489, 3, '书包', NULL, NULL);
INSERT INTO `question_bank` VALUES (490, 3, '塑料包装纸', NULL, NULL);
INSERT INTO `question_bank` VALUES (491, 3, '草稿纸', NULL, NULL);
INSERT INTO `question_bank` VALUES (492, 3, '插座', NULL, NULL);
INSERT INTO `question_bank` VALUES (493, 3, '饮料塑料瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (496, 4, '油漆桶', NULL, NULL);
INSERT INTO `question_bank` VALUES (497, 4, '药瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (498, 4, '药品', NULL, NULL);
INSERT INTO `question_bank` VALUES (499, 4, '灯泡', NULL, NULL);
INSERT INTO `question_bank` VALUES (500, 4, '废药品', NULL, NULL);
INSERT INTO `question_bank` VALUES (501, 4, '荧光灯管', NULL, NULL);
INSERT INTO `question_bank` VALUES (503, 4, '指甲油', NULL, NULL);
INSERT INTO `question_bank` VALUES (505, 4, '有害垃圾', NULL, NULL);
INSERT INTO `question_bank` VALUES (507, 4, '过期药品', NULL, NULL);
INSERT INTO `question_bank` VALUES (509, 4, '空药瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (511, 4, '灯管', NULL, NULL);
INSERT INTO `question_bank` VALUES (514, 4, '眼药水', NULL, NULL);
INSERT INTO `question_bank` VALUES (516, 4, '避孕药', NULL, NULL);
INSERT INTO `question_bank` VALUES (517, 4, '废药瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (518, 4, '胶囊', NULL, NULL);
INSERT INTO `question_bank` VALUES (519, 4, '各类过期药品', NULL, NULL);
INSERT INTO `question_bank` VALUES (521, 4, '老鼠药', NULL, NULL);
INSERT INTO `question_bank` VALUES (522, 4, '照片', NULL, NULL);
INSERT INTO `question_bank` VALUES (524, 4, '锂电池', NULL, NULL);
INSERT INTO `question_bank` VALUES (525, 4, '胶囊药片底板', NULL, NULL);
INSERT INTO `question_bank` VALUES (526, 4, '胶片', NULL, NULL);
INSERT INTO `question_bank` VALUES (527, 4, '药片盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (528, 4, '眼药水瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (529, 4, '感冒药', NULL, NULL);
INSERT INTO `question_bank` VALUES (530, 4, '染发剂罐', NULL, NULL);
INSERT INTO `question_bank` VALUES (532, 4, '消毒药片', NULL, NULL);
INSERT INTO `question_bank` VALUES (533, 4, '手机电池', NULL, NULL);
INSERT INTO `question_bank` VALUES (535, 4, '药品壳子', NULL, NULL);
INSERT INTO `question_bank` VALUES (537, 4, '胶卷', NULL, NULL);
INSERT INTO `question_bank` VALUES (539, 4, '白炽灯泡', NULL, NULL);
INSERT INTO `question_bank` VALUES (542, 4, '指甲油瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (543, 4, '药品铝塑板', NULL, NULL);
INSERT INTO `question_bank` VALUES (544, 4, '蟑螂药', NULL, NULL);
INSERT INTO `question_bank` VALUES (545, 4, '水银', NULL, NULL);
INSERT INTO `question_bank` VALUES (546, 4, '蟑螂丸', NULL, NULL);
INSERT INTO `question_bank` VALUES (547, 4, '废油漆', NULL, NULL);
INSERT INTO `question_bank` VALUES (549, 4, '胶囊药片', NULL, NULL);
INSERT INTO `question_bank` VALUES (550, 4, '杀虫喷雾', NULL, NULL);
INSERT INTO `question_bank` VALUES (551, 4, '中成药', NULL, NULL);
INSERT INTO `question_bank` VALUES (553, 2, '桃核', NULL, NULL);
INSERT INTO `question_bank` VALUES (554, 2, '玉米棒', NULL, NULL);
INSERT INTO `question_bank` VALUES (555, 2, '瓜子壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (557, 2, '小龙虾', NULL, NULL);
INSERT INTO `question_bank` VALUES (558, 2, '龙虾壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (560, 2, '鸡骨头', NULL, NULL);
INSERT INTO `question_bank` VALUES (561, 2, '鸭骨头', NULL, NULL);
INSERT INTO `question_bank` VALUES (562, 2, '熟玉米棒', NULL, NULL);
INSERT INTO `question_bank` VALUES (564, 2, '小龙虾壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (568, 2, '瓜子', NULL, NULL);
INSERT INTO `question_bank` VALUES (569, 2, '鱼骨头', NULL, NULL);
INSERT INTO `question_bank` VALUES (570, 2, '毛豆壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (571, 2, '龙虾', NULL, NULL);
INSERT INTO `question_bank` VALUES (572, 2, '螃蟹壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (573, 2, '玉米芯', NULL, NULL);
INSERT INTO `question_bank` VALUES (575, 2, '桃子', NULL, NULL);
INSERT INTO `question_bank` VALUES (576, 2, '荔枝壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (577, 2, '杨梅', NULL, NULL);
INSERT INTO `question_bank` VALUES (578, 2, '瓜子皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (579, 2, '粽子', NULL, NULL);
INSERT INTO `question_bank` VALUES (580, 2, '荔枝核', NULL, NULL);
INSERT INTO `question_bank` VALUES (583, 2, '排骨', NULL, NULL);
INSERT INTO `question_bank` VALUES (584, 2, '开心果壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (585, 2, '果皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (586, 2, '花', NULL, NULL);
INSERT INTO `question_bank` VALUES (587, 2, '螺蛳壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (588, 2, '话梅核', NULL, NULL);
INSERT INTO `question_bank` VALUES (589, 2, '芒果核', NULL, NULL);
INSERT INTO `question_bank` VALUES (590, 2, '中药渣', NULL, NULL);
INSERT INTO `question_bank` VALUES (591, 2, '螃蟹', NULL, NULL);
INSERT INTO `question_bank` VALUES (593, 2, '枣核', NULL, NULL);
INSERT INTO `question_bank` VALUES (594, 2, '小龙虾头', NULL, NULL);
INSERT INTO `question_bank` VALUES (597, 2, '香蕉', NULL, NULL);
INSERT INTO `question_bank` VALUES (598, 2, '花卉绿植', NULL, NULL);
INSERT INTO `question_bank` VALUES (599, 2, '鱼刺', NULL, NULL);
INSERT INTO `question_bank` VALUES (600, 2, '茶叶渣', NULL, NULL);
INSERT INTO `question_bank` VALUES (601, 2, '话梅', NULL, NULL);
INSERT INTO `question_bank` VALUES (603, 1, '塑料袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (606, 1, '卫生巾', NULL, NULL);
INSERT INTO `question_bank` VALUES (607, 1, '避孕套', NULL, NULL);
INSERT INTO `question_bank` VALUES (608, 1, '安全套', NULL, NULL);
INSERT INTO `question_bank` VALUES (610, 1, '面膜', NULL, NULL);
INSERT INTO `question_bank` VALUES (612, 1, '口香糖', NULL, NULL);
INSERT INTO `question_bank` VALUES (617, 1, '吸管', NULL, NULL);
INSERT INTO `question_bank` VALUES (620, 1, '湿纸巾', NULL, NULL);
INSERT INTO `question_bank` VALUES (621, 1, '茶包', NULL, NULL);
INSERT INTO `question_bank` VALUES (625, 1, '包装袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (626, 1, '指甲', NULL, NULL);
INSERT INTO `question_bank` VALUES (627, 1, '玉米皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (629, 1, '一次性饭盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (633, 1, '垃圾袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (634, 1, '玉米壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (635, 1, '蛤蜊壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (637, 1, '尿布', NULL, NULL);
INSERT INTO `question_bank` VALUES (641, 1, '食品包装袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (642, 1, '回形针', NULL, NULL);
INSERT INTO `question_bank` VALUES (643, 1, '棉签', NULL, NULL);
INSERT INTO `question_bank` VALUES (644, 1, '外卖餐盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (647, 1, '肮脏塑料袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (650, 1, '袜子', NULL, NULL);
INSERT INTO `question_bank` VALUES (651, 1, '榴莲', NULL, NULL);
INSERT INTO `question_bank` VALUES (652, 1, '一次性餐盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (653, 1, '笔芯', NULL, NULL);
INSERT INTO `question_bank` VALUES (654, 1, '冰袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (655, 1, '陶瓷碗', NULL, NULL);
INSERT INTO `question_bank` VALUES (656, 1, '茶叶包', NULL, NULL);
INSERT INTO `question_bank` VALUES (657, 1, '保鲜膜', NULL, NULL);
INSERT INTO `question_bank` VALUES (658, 1, '内裤', NULL, NULL);
INSERT INTO `question_bank` VALUES (659, 1, '化妆棉', NULL, NULL);
INSERT INTO `question_bank` VALUES (660, 1, '厕纸', NULL, NULL);
INSERT INTO `question_bank` VALUES (661, 1, '厕所纸', NULL, NULL);
INSERT INTO `question_bank` VALUES (662, 3, '耳机', NULL, '耳机是个好东西，戴上它，感觉全世界都是自己的');
INSERT INTO `question_bank` VALUES (663, 1, '手提袋', NULL, NULL);
INSERT INTO `question_bank` VALUES (665, 1, '黑框眼镜', NULL, NULL);
INSERT INTO `question_bank` VALUES (666, 1, '隐形眼镜', NULL, NULL);
INSERT INTO `question_bank` VALUES (667, 3, '台式电脑', NULL, NULL);
INSERT INTO `question_bank` VALUES (668, 3, '笔记本电脑', NULL, NULL);
INSERT INTO `question_bank` VALUES (669, 3, '运动鞋', NULL, NULL);
INSERT INTO `question_bank` VALUES (670, 1, '牙签盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (671, 2, '死鱼', NULL, NULL);
INSERT INTO `question_bank` VALUES (672, 3, '玻璃烟缸', NULL, NULL);
INSERT INTO `question_bank` VALUES (673, 3, '烟灰缸', NULL, NULL);
INSERT INTO `question_bank` VALUES (674, 2, '山竹皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (675, 1, '抽纸', NULL, NULL);
INSERT INTO `question_bank` VALUES (676, 4, '地沟油', NULL, '坚决抵制地沟油，关爱身心健康');
INSERT INTO `question_bank` VALUES (677, 2, '米线', NULL, NULL);
INSERT INTO `question_bank` VALUES (678, 1, '橡胶垫', NULL, NULL);
INSERT INTO `question_bank` VALUES (679, 1, '橡胶手套', NULL, NULL);
INSERT INTO `question_bank` VALUES (682, 3, '显示器', NULL, NULL);
INSERT INTO `question_bank` VALUES (683, 3, '门锁', NULL, NULL);
INSERT INTO `question_bank` VALUES (685, 1, '发卡', NULL, NULL);
INSERT INTO `question_bank` VALUES (686, 1, '姨妈巾', NULL, NULL);
INSERT INTO `question_bank` VALUES (688, 3, '保温杯', NULL, NULL);
INSERT INTO `question_bank` VALUES (689, 3, '电动牙刷', NULL, NULL);
INSERT INTO `question_bank` VALUES (690, 1, '废旧牙刷', NULL, NULL);
INSERT INTO `question_bank` VALUES (691, 3, '凉鞋', NULL, NULL);
INSERT INTO `question_bank` VALUES (692, 3, '高跟鞋', NULL, NULL);
INSERT INTO `question_bank` VALUES (693, 3, '布鞋', NULL, NULL);
INSERT INTO `question_bank` VALUES (695, 3, '风扇', NULL, NULL);
INSERT INTO `question_bank` VALUES (696, 3, '塑料拖鞋', NULL, NULL);
INSERT INTO `question_bank` VALUES (697, 3, '落地风扇', NULL, NULL);
INSERT INTO `question_bank` VALUES (698, 3, '空调', NULL, NULL);
INSERT INTO `question_bank` VALUES (701, 1, '甲鱼壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (702, 3, '笔记本', NULL, NULL);
INSERT INTO `question_bank` VALUES (703, 3, '电动剃须刀', NULL, NULL);
INSERT INTO `question_bank` VALUES (704, 3, '美工刀', NULL, NULL);
INSERT INTO `question_bank` VALUES (705, 3, '不锈钢刀', NULL, NULL);
INSERT INTO `question_bank` VALUES (706, 1, '陶瓷刀', NULL, NULL);
INSERT INTO `question_bank` VALUES (707, 2, '花甲肉', NULL, NULL);
INSERT INTO `question_bank` VALUES (708, 4, '甲油胶', NULL, NULL);
INSERT INTO `question_bank` VALUES (734, 1, '记号笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (735, 3, '金属铅笔盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (736, 4, '教科书', NULL, NULL);
INSERT INTO `question_bank` VALUES (737, 1, '蜡笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (738, 1, '坏钢笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (739, 1, '中性笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (740, 1, '眉笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (741, 1, '粉笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (742, 1, '彩笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (743, 1, '马克笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (744, 1, '笔杆', NULL, NULL);
INSERT INTO `question_bank` VALUES (745, 1, '笔套', NULL, NULL);
INSERT INTO `question_bank` VALUES (746, 1, '红笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (747, 1, '勾线笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (748, 1, '可擦复写笔', NULL, NULL);
INSERT INTO `question_bank` VALUES (749, 3, '行车记录仪', NULL, NULL);
INSERT INTO `question_bank` VALUES (750, 3, '练习本', NULL, NULL);
INSERT INTO `question_bank` VALUES (751, 1, '飞机杯', NULL, NULL);
INSERT INTO `question_bank` VALUES (756, 2, '虫子', NULL, NULL);
INSERT INTO `question_bank` VALUES (757, 2, '蚊子', NULL, NULL);
INSERT INTO `question_bank` VALUES (758, 2, '车厘子', NULL, NULL);
INSERT INTO `question_bank` VALUES (759, 2, '橘子', NULL, NULL);
INSERT INTO `question_bank` VALUES (760, 2, '栗子', NULL, NULL);
INSERT INTO `question_bank` VALUES (761, 1, '胡子', NULL, NULL);
INSERT INTO `question_bank` VALUES (762, 2, '茶叶蛋', NULL, NULL);
INSERT INTO `question_bank` VALUES (795, 2, '水果茶', NULL, NULL);
INSERT INTO `question_bank` VALUES (796, 2, '水果干', NULL, NULL);
INSERT INTO `question_bank` VALUES (797, 2, '水果脆', NULL, NULL);
INSERT INTO `question_bank` VALUES (798, 2, '水果茎枝', NULL, NULL);
INSERT INTO `question_bank` VALUES (799, 1, '牛油果核', NULL, NULL);
INSERT INTO `question_bank` VALUES (800, 2, '果冻', NULL, NULL);
INSERT INTO `question_bank` VALUES (801, 1, '果冻盒', NULL, NULL);
INSERT INTO `question_bank` VALUES (802, 2, '火龙果皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (803, 2, '牛油果皮', NULL, NULL);
INSERT INTO `question_bank` VALUES (804, 2, '腰果', NULL, NULL);
INSERT INTO `question_bank` VALUES (805, 2, '水饺', NULL, NULL);
INSERT INTO `question_bank` VALUES (806, 2, '馄饨', NULL, NULL);
INSERT INTO `question_bank` VALUES (807, 3, '花露水玻璃空瓶', NULL, NULL);
INSERT INTO `question_bank` VALUES (808, 2, '米虫', NULL, NULL);
INSERT INTO `question_bank` VALUES (809, 2, '酸菜鱼', NULL, NULL);
INSERT INTO `question_bank` VALUES (810, 3, '拖鞋', NULL, NULL);
INSERT INTO `question_bank` VALUES (811, 2, '西瓜', NULL, NULL);
INSERT INTO `question_bank` VALUES (812, 2, '八宝粥', NULL, NULL);
INSERT INTO `question_bank` VALUES (813, 2, '八角', NULL, NULL);
INSERT INTO `question_bank` VALUES (814, 2, '八宝饭', NULL, NULL);
INSERT INTO `question_bank` VALUES (815, 1, '鼻屎', NULL, NULL);
INSERT INTO `question_bank` VALUES (816, 1, '狗屎指', NULL, NULL);
INSERT INTO `question_bank` VALUES (817, 1, '耳屎', NULL, NULL);
INSERT INTO `question_bank` VALUES (818, 1, '陶瓷锅', NULL, NULL);
INSERT INTO `question_bank` VALUES (819, 3, '手机', NULL, NULL);
INSERT INTO `question_bank` VALUES (820, 3, '平板电脑', NULL, NULL);
INSERT INTO `question_bank` VALUES (821, 1, '手机壳', NULL, NULL);
INSERT INTO `question_bank` VALUES (822, 1, '手机膜', NULL, NULL);
INSERT INTO `question_bank` VALUES (823, 1, '酱油瓶', NULL, NULL);

-- ----------------------------
-- Table structure for recyle_info
-- ----------------------------
DROP TABLE IF EXISTS `recyle_info`;
CREATE TABLE `recyle_info`  (
  `recyle_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `order_time` datetime(0) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`recyle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recyle_info
-- ----------------------------

-- ----------------------------
-- Table structure for slide_show
-- ----------------------------
DROP TABLE IF EXISTS `slide_show`;
CREATE TABLE `slide_show`  (
  `slide` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用',
  `sort_id` int NULL DEFAULT NULL COMMENT '排序id',
  `image_url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `skip_url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '跳转的链接地址',
  PRIMARY KEY (`slide`) USING BTREE,
  UNIQUE INDEX `slide_show_slide_uindex`(`slide`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '幻灯片播放表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of slide_show
-- ----------------------------
INSERT INTO `slide_show` VALUES (1, 1, 1, 'https://pic.yupoo.com/felixluo/de4e546c/70493523.png', '');
INSERT INTO `slide_show` VALUES (2, 0, 2, 'https://desk-fd.zol-img.com.cn/t_s960x600c5/g2/M00/0C/0D/ChMlWV0lX06Ia6odAAUqDVGbNfkAALssQOQNxYABSol367.jpg', 'https://github.com/dcloudio/hello-uniapp/search?q=popup&unscoped_q=popup');
INSERT INTO `slide_show` VALUES (3, 0, 3, 'https://desk-fd.zol-img.com.cn/t_s960x600c5/g2/M00/0C/0D/ChMlWV0lX1eIXYj9AAbvNL1qwhwAALssgDzSSAABu9M113.jpg', 'https://uniapp.dcloud.io/api/request/network-file');

-- ----------------------------
-- Table structure for speech_classify
-- ----------------------------
DROP TABLE IF EXISTS `speech_classify`;
CREATE TABLE `speech_classify`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `filepath` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件存储路径',
  `one_keyword` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '一个关键字',
  `one_result` json NULL COMMENT '一个结果',
  `all_keyword` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '总关键字',
  `all_result` json NULL COMMENT '总结果',
  `user_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `times` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `image_classify_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '语音识别记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of speech_classify
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-06-08 09:13:56', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-06-08 09:13:56', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-06-08 09:13:56', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-06-08 09:13:56', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-06-08 09:13:56', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-06-08 09:13:56', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-06-08 09:13:56', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-06-08 09:13:56', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2021-06-08 09:13:56', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-08 09:13:55', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-08 09:13:55', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-08 09:13:55', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-08 09:13:55', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-08 09:13:55', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-08 09:13:55', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-08 09:13:55', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-08 09:13:55', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-08 09:13:55', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-08 09:13:55', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '干垃圾', '1', 'garbage_type', '1', '', 'Y', '0', 'admin', '2021-06-08 12:15:12', 'admin', '2021-06-08 12:16:00', '');
INSERT INTO `sys_dict_data` VALUES (101, 2, '湿垃圾', '2', 'garbage_type', NULL, NULL, 'Y', '0', 'admin', '2021-06-08 12:15:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '可回收垃圾', '3', 'garbage_type', NULL, NULL, 'Y', '0', 'admin', '2021-06-08 12:16:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 4, '有害垃圾', '4', 'garbage_type', NULL, NULL, 'Y', '0', 'admin', '2021-06-08 12:16:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '正确', '1', 'challenge_result', NULL, NULL, 'Y', '0', 'admin', '2021-06-08 12:19:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '错误', '0', 'challenge_result', NULL, NULL, 'Y', '0', 'admin', '2021-06-08 12:20:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 1, '待接单', '1', 'order_status', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 17:52:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 2, '已完成', '2', 'order_status', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 17:53:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 3, '已取消', '3', 'order_status', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 17:53:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 4, '已接单', '4', 'order_status', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 17:54:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 1, '纸皮类', '纸皮类', 'recycle_type', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 18:07:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 2, '衣物＆其他', '衣物＆其他', 'recycle_type', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 18:08:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 3, '金属类', '金属类', 'recycle_type', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 18:08:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 4, '塑料类', '塑料类', 'recycle_type', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 18:08:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 1, '默认', '1', 'defalt_addr', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 18:20:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 2, '不默认', '0', 'defalt_addr', '', '', 'Y', '0', 'admin', '2024-04-20 18:20:54', 'admin', '2024-04-20 18:20:59', '');
INSERT INTO `sys_dict_data` VALUES (116, 1, '男', '男', 'user_sex', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 18:38:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 2, '女', '女', 'user_sex', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 18:38:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 3, '保密', '保密', 'user_sex', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 18:38:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 1, '用户', '0', 'user_type', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 18:59:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 2, '回收员', '1', 'user_type', NULL, NULL, 'Y', '0', 'admin', '2024-04-20 18:59:36', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '垃圾类型', 'garbage_type', '0', 'admin', '2021-06-08 12:14:11', '', NULL, '垃圾类型；1：干垃圾；2：湿垃圾；3、可回收垃圾；4、有害垃圾。');
INSERT INTO `sys_dict_type` VALUES (101, '挑战结果', 'challenge_result', '0', 'admin', '2021-06-08 12:19:40', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '订单状态', 'order_status', '0', 'admin', '2024-04-20 17:51:34', '', NULL, '订单状态选项');
INSERT INTO `sys_dict_type` VALUES (103, '回收物品类型', 'recycle_type', '0', 'admin', '2024-04-20 18:06:20', '', NULL, '回收物品类型');
INSERT INTO `sys_dict_type` VALUES (104, '默认地址', 'defalt_addr', '0', 'admin', '2024-04-20 18:19:46', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '性别', 'user_sex', '0', 'admin', '2024-04-20 18:38:01', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '用户类型', 'user_type', '0', 'admin', '2024-04-20 18:58:49', 'admin', '2024-04-20 18:59:05', '');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-06-08 09:13:56', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-08 09:54:01');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-08 10:13:58');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-08 10:16:57');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-08 10:17:07');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-08 10:32:35');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-08 10:40:04');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-08 12:29:53');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-08 12:34:20');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-08 12:34:24');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-08 15:35:31');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-08 15:35:36');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-08 15:44:50');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-08 15:48:30');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-08 15:51:47');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-08 16:17:48');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 15:21:35');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 17:12:59');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 17:22:27');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 17:45:23');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 18:02:46');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 18:13:08');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 18:34:25');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 18:40:31');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 18:57:08');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 19:02:05');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 19:46:32');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 20:16:23');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 20:29:04');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-20 20:32:13');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2085 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 51, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-06-08 09:13:56', 'admin', '2024-04-20 17:31:12', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', 'menuItem', 'M', '1', '1', '', 'fa fa-video-camera', 'admin', '2021-06-08 09:13:56', 'admin', '2024-04-20 15:21:57', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 52, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2021-06-08 09:13:56', 'admin', '2024-04-20 17:31:31', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '1', '1', '', 'fa fa-location-arrow', 'admin', '2021-06-08 09:13:56', 'admin', '2021-06-08 10:05:56', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', 'menuItem', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-06-08 09:13:56', 'admin', '2024-04-20 19:47:45', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', 'menuItem', 'C', '1', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-06-08 09:13:56', 'admin', '2024-04-20 15:25:34', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-06-08 09:13:56', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', 'menuItem', 'C', '1', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-06-08 09:13:56', 'admin', '2024-04-20 15:22:10', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', 'menuItem', 'C', '1', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-06-08 09:13:56', 'admin', '2024-04-20 15:23:42', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', 'menuItem', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-06-08 09:13:56', 'admin', '2024-04-20 17:47:54', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', 'menuItem', 'C', '1', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-06-08 09:13:56', 'admin', '2024-04-20 15:24:36', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', 'menuItem', 'C', '1', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-06-08 09:13:56', 'admin', '2024-04-20 15:24:44', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', 'menuItem', 'M', '1', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-06-08 09:13:56', 'admin', '2024-04-20 15:24:57', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-06-08 09:13:56', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', 'menuItem', 'C', '1', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-06-08 09:13:56', 'admin', '2021-06-08 10:04:32', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-06-08 09:13:56', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-06-08 09:13:56', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-06-08 09:13:56', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-06-08 09:13:56', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-06-08 09:13:56', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-06-08 09:13:56', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-06-08 09:13:56', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-06-08 09:13:56', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-06-08 09:13:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '垃圾分类', 0, 1, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-archive', 'admin', '2021-06-08 10:19:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '挑战明细记录', 2000, 2, '/garbagesort/challengeDetail', 'menuItem', 'C', '1', '1', 'garbagesort:challengeDetail:view', '#', 'admin', '2021-06-08 10:37:18', 'admin', '2021-06-08 15:40:06', '挑战明细记录菜单');
INSERT INTO `sys_menu` VALUES (2038, '挑战明细记录查询', 2037, 1, '#', '', 'F', '0', '1', 'garbagesort:challengeDetail:list', '#', 'admin', '2021-06-08 10:37:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '挑战明细记录新增', 2037, 2, '#', '', 'F', '0', '1', 'garbagesort:challengeDetail:add', '#', 'admin', '2021-06-08 10:37:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '挑战明细记录修改', 2037, 3, '#', '', 'F', '0', '1', 'garbagesort:challengeDetail:edit', '#', 'admin', '2021-06-08 10:37:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '挑战明细记录删除', 2037, 4, '#', '', 'F', '0', '1', 'garbagesort:challengeDetail:remove', '#', 'admin', '2021-06-08 10:37:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '挑战明细记录导出', 2037, 5, '#', '', 'F', '0', '1', 'garbagesort:challengeDetail:export', '#', 'admin', '2021-06-08 10:37:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '挑战赛结果', 2000, 2, '/garbagesort/challengeResult', 'menuItem', 'C', '1', '1', 'garbagesort:challengeResult:view', '#', 'admin', '2021-06-08 10:37:27', 'admin', '2021-06-08 15:40:15', '挑战结果+详情记录菜单');
INSERT INTO `sys_menu` VALUES (2044, '挑战结果+详情记录查询', 2043, 1, '#', '', 'F', '0', '1', 'garbagesort:challengeResult:list', '#', 'admin', '2021-06-08 10:37:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '挑战结果+详情记录新增', 2043, 2, '#', '', 'F', '0', '1', 'garbagesort:challengeResult:add', '#', 'admin', '2021-06-08 10:37:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '挑战结果+详情记录修改', 2043, 3, '#', '', 'F', '0', '1', 'garbagesort:challengeResult:edit', '#', 'admin', '2021-06-08 10:37:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '挑战结果+详情记录删除', 2043, 4, '#', '', 'F', '0', '1', 'garbagesort:challengeResult:remove', '#', 'admin', '2021-06-08 10:37:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '挑战结果+详情记录导出', 2043, 5, '#', '', 'F', '0', '1', 'garbagesort:challengeResult:export', '#', 'admin', '2021-06-08 10:37:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '图像识别记录', 2000, 2, '/garbagesort/imageClassify', 'menuItem', 'C', '1', '1', 'garbagesort:imageClassify:view', '#', 'admin', '2021-06-08 10:37:37', 'admin', '2021-06-08 15:40:25', '图像识别记录菜单');
INSERT INTO `sys_menu` VALUES (2050, '图像识别记录查询', 2049, 1, '#', '', 'F', '0', '1', 'garbagesort:imageClassify:list', '#', 'admin', '2021-06-08 10:37:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '图像识别记录新增', 2049, 2, '#', '', 'F', '0', '1', 'garbagesort:imageClassify:add', '#', 'admin', '2021-06-08 10:37:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '图像识别记录修改', 2049, 3, '#', '', 'F', '0', '1', 'garbagesort:imageClassify:edit', '#', 'admin', '2021-06-08 10:37:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '图像识别记录删除', 2049, 4, '#', '', 'F', '0', '1', 'garbagesort:imageClassify:remove', '#', 'admin', '2021-06-08 10:37:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '图像识别记录导出', 2049, 5, '#', '', 'F', '0', '1', 'garbagesort:imageClassify:export', '#', 'admin', '2021-06-08 10:37:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '关键词搜索结果', 2000, 2, '/garbagesort/keywordResult', 'menuItem', 'C', '1', '1', 'garbagesort:keywordResult:view', '#', 'admin', '2021-06-08 10:37:46', 'admin', '2021-06-08 15:40:36', '关键词+结果记录菜单');
INSERT INTO `sys_menu` VALUES (2056, '关键词+结果记录查询', 2055, 1, '#', '', 'F', '0', '1', 'garbagesort:keywordResult:list', '#', 'admin', '2021-06-08 10:37:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '关键词+结果记录新增', 2055, 2, '#', '', 'F', '0', '1', 'garbagesort:keywordResult:add', '#', 'admin', '2021-06-08 10:37:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '关键词+结果记录修改', 2055, 3, '#', '', 'F', '0', '1', 'garbagesort:keywordResult:edit', '#', 'admin', '2021-06-08 10:37:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '关键词+结果记录删除', 2055, 4, '#', '', 'F', '0', '1', 'garbagesort:keywordResult:remove', '#', 'admin', '2021-06-08 10:37:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '关键词+结果记录导出', 2055, 5, '#', '', 'F', '0', '1', 'garbagesort:keywordResult:export', '#', 'admin', '2021-06-08 10:37:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '关键词搜索次数', 2000, 2, '/garbagesort/keywordSearchNum', 'menuItem', 'C', '0', '1', 'garbagesort:keywordSearchNum:view', '#', 'admin', '2021-06-08 10:37:57', 'admin', '2021-06-08 12:31:30', '搜索关键词+次数记录菜单');
INSERT INTO `sys_menu` VALUES (2062, '搜索关键词+次数记录查询', 2061, 1, '#', '', 'F', '0', '1', 'garbagesort:keywordSearchNum:list', '#', 'admin', '2021-06-08 10:37:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '搜索关键词+次数记录新增', 2061, 2, '#', '', 'F', '0', '1', 'garbagesort:keywordSearchNum:add', '#', 'admin', '2021-06-08 10:37:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '搜索关键词+次数记录修改', 2061, 3, '#', '', 'F', '0', '1', 'garbagesort:keywordSearchNum:edit', '#', 'admin', '2021-06-08 10:37:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '搜索关键词+次数记录删除', 2061, 4, '#', '', 'F', '0', '1', 'garbagesort:keywordSearchNum:remove', '#', 'admin', '2021-06-08 10:37:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '搜索关键词+次数记录导出', 2061, 5, '#', '', 'F', '0', '1', 'garbagesort:keywordSearchNum:export', '#', 'admin', '2021-06-08 10:37:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '垃圾分类题库', 2000, 1, '/garbagesort/questionBank', 'menuItem', 'C', '0', '1', 'garbagesort:questionBank:view', '#', 'admin', '2021-06-08 10:38:10', 'admin', '2021-06-08 12:30:47', '题库菜单');
INSERT INTO `sys_menu` VALUES (2068, '题库查询', 2067, 1, '#', '', 'F', '0', '1', 'garbagesort:questionBank:list', '#', 'admin', '2021-06-08 10:38:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '题库新增', 2067, 2, '#', '', 'F', '0', '1', 'garbagesort:questionBank:add', '#', 'admin', '2021-06-08 10:38:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '题库修改', 2067, 3, '#', '', 'F', '0', '1', 'garbagesort:questionBank:edit', '#', 'admin', '2021-06-08 10:38:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '题库删除', 2067, 4, '#', '', 'F', '0', '1', 'garbagesort:questionBank:remove', '#', 'admin', '2021-06-08 10:38:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '题库导出', 2067, 5, '#', '', 'F', '0', '1', 'garbagesort:questionBank:export', '#', 'admin', '2021-06-08 10:38:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '幻灯片播放', 2000, 2, '/garbagesort/slideShow', 'menuItem', 'C', '1', '1', 'garbagesort:slideShow:view', '#', 'admin', '2021-06-08 10:38:18', 'admin', '2021-06-08 15:41:22', '幻灯片播放菜单');
INSERT INTO `sys_menu` VALUES (2074, '幻灯片播放查询', 2073, 1, '#', '', 'F', '0', '1', 'garbagesort:slideShow:list', '#', 'admin', '2021-06-08 10:38:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '幻灯片播放新增', 2073, 2, '#', '', 'F', '0', '1', 'garbagesort:slideShow:add', '#', 'admin', '2021-06-08 10:38:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '幻灯片播放修改', 2073, 3, '#', '', 'F', '0', '1', 'garbagesort:slideShow:edit', '#', 'admin', '2021-06-08 10:38:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '幻灯片播放删除', 2073, 4, '#', '', 'F', '0', '1', 'garbagesort:slideShow:remove', '#', 'admin', '2021-06-08 10:38:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '幻灯片播放导出', 2073, 5, '#', '', 'F', '0', '1', 'garbagesort:slideShow:export', '#', 'admin', '2021-06-08 10:38:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '语音识别记录', 2000, 1, '/garbagesort/speechClassify', 'menuItem', 'C', '1', '1', 'garbagesort:speechClassify:view', '#', 'admin', '2021-06-08 10:38:28', 'admin', '2021-06-08 15:39:58', '语音识别记录菜单');
INSERT INTO `sys_menu` VALUES (2080, '语音识别记录查询', 2079, 1, '#', '', 'F', '0', '1', 'garbagesort:speechClassify:list', '#', 'admin', '2021-06-08 10:38:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '语音识别记录新增', 2079, 2, '#', '', 'F', '0', '1', 'garbagesort:speechClassify:add', '#', 'admin', '2021-06-08 10:38:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2082, '语音识别记录修改', 2079, 3, '#', '', 'F', '0', '1', 'garbagesort:speechClassify:edit', '#', 'admin', '2021-06-08 10:38:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '语音识别记录删除', 2079, 4, '#', '', 'F', '0', '1', 'garbagesort:speechClassify:remove', '#', 'admin', '2021-06-08 10:38:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '语音识别记录导出', 2079, 5, '#', '', 'F', '0', '1', 'garbagesort:speechClassify:export', '#', 'admin', '2021-06-08 10:38:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '用户管理', 0, 2, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-address-book', 'admin', '2024-04-20 15:32:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2086, '订单管理', 0, 3, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-building', 'admin', '2024-04-20 17:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '物品详情查询', 2086, 1, '/garbagesort/goodsDetail', '', 'C', '0', '1', 'garbagesort:goodsDetail:view', '#', 'admin', '2024-04-20 17:36:31', '', NULL, '物品详情查询菜单');
INSERT INTO `sys_menu` VALUES (2088, '物品详情查询查询', 2087, 1, '#', '', 'F', '0', '1', 'garbagesort:goodsDetail:list', '#', 'admin', '2024-04-20 17:36:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '物品详情查询新增', 2087, 2, '#', '', 'F', '0', '1', 'garbagesort:goodsDetail:add', '#', 'admin', '2024-04-20 17:36:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2090, '物品详情查询修改', 2087, 3, '#', '', 'F', '0', '1', 'garbagesort:goodsDetail:edit', '#', 'admin', '2024-04-20 17:36:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2091, '物品详情查询删除', 2087, 4, '#', '', 'F', '0', '1', 'garbagesort:goodsDetail:remove', '#', 'admin', '2024-04-20 17:36:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2092, '物品详情查询导出', 2087, 5, '#', '', 'F', '0', '1', 'garbagesort:goodsDetail:export', '#', 'admin', '2024-04-20 17:36:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2093, '订单查询', 2086, 1, '/garbagesort/orders', '', 'C', '0', '1', 'garbagesort:orders:view', '#', 'admin', '2024-04-20 17:36:42', '', NULL, '订单查询菜单');
INSERT INTO `sys_menu` VALUES (2094, '订单查询查询', 2093, 1, '#', '', 'F', '0', '1', 'garbagesort:orders:list', '#', 'admin', '2024-04-20 17:36:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2095, '订单查询新增', 2093, 2, '#', '', 'F', '0', '1', 'garbagesort:orders:add', '#', 'admin', '2024-04-20 17:36:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2096, '订单查询修改', 2093, 3, '#', '', 'F', '0', '1', 'garbagesort:orders:edit', '#', 'admin', '2024-04-20 17:36:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2097, '订单查询删除', 2093, 4, '#', '', 'F', '0', '1', 'garbagesort:orders:remove', '#', 'admin', '2024-04-20 17:36:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2098, '订单查询导出', 2093, 5, '#', '', 'F', '0', '1', 'garbagesort:orders:export', '#', 'admin', '2024-04-20 17:36:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2123, '用户地址查询', 2085, 1, '/garbagesort/addr', '', 'C', '0', '1', 'garbagesort:addr:view', '#', 'admin', '2024-04-20 18:48:41', '', NULL, '用户地址查询菜单');
INSERT INTO `sys_menu` VALUES (2124, '用户地址查询查询', 2123, 1, '#', '', 'F', '0', '1', 'garbagesort:addr:list', '#', 'admin', '2024-04-20 18:48:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2125, '用户地址查询新增', 2123, 2, '#', '', 'F', '0', '1', 'garbagesort:addr:add', '#', 'admin', '2024-04-20 18:48:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2126, '用户地址查询修改', 2123, 3, '#', '', 'F', '0', '1', 'garbagesort:addr:edit', '#', 'admin', '2024-04-20 18:48:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2127, '用户地址查询删除', 2123, 4, '#', '', 'F', '0', '1', 'garbagesort:addr:remove', '#', 'admin', '2024-04-20 18:48:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2128, '用户地址查询导出', 2123, 5, '#', '', 'F', '0', '1', 'garbagesort:addr:export', '#', 'admin', '2024-04-20 18:48:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2147, '用户查询', 2085, 1, '/garbagesort/userInfo', '', 'C', '0', '1', 'garbagesort:userInfo:view', '#', 'admin', '2024-04-20 20:27:26', '', NULL, '用户查询菜单');
INSERT INTO `sys_menu` VALUES (2148, '用户查询查询', 2147, 1, '#', '', 'F', '0', '1', 'garbagesort:userInfo:list', '#', 'admin', '2024-04-20 20:27:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2149, '用户查询新增', 2147, 2, '#', '', 'F', '0', '1', 'garbagesort:userInfo:add', '#', 'admin', '2024-04-20 20:27:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2150, '用户查询修改', 2147, 3, '#', '', 'F', '0', '1', 'garbagesort:userInfo:edit', '#', 'admin', '2024-04-20 20:27:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2151, '用户查询删除', 2147, 4, '#', '', 'F', '0', '1', 'garbagesort:userInfo:remove', '#', 'admin', '2024-04-20 20:27:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2152, '用户查询导出', 2147, 5, '#', '', 'F', '0', '1', 'garbagesort:userInfo:export', '#', 'admin', '2024-04-20 20:27:26', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2021-06-08 09:13:56', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"110\"],\"parentId\":[\"2\"],\"menuType\":[\"C\"],\"menuName\":[\"定时任务\"],\"url\":[\"/monitor/job\"],\"target\":[\"menuItem\"],\"perms\":[\"monitor:job:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-tasks\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:04:32');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2021-06-08 10:05:49');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:05:56');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"question_bank,slide_show,speech_classify,image_classify,keyword_result,challenge_result,challenge_detail,keyword_search_num\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:11:05');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"question_bank\"]}', NULL, 0, NULL, '2021-06-08 10:14:34');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"垃圾分类\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-archive\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:19:50');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"keyword_result\"],\"tableComment\":[\"关键词+结果记录表\"],\"className\":[\"KeywordResult\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"20\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"21\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"keyword\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"22\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"result\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"23\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"times\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.garbagesort\"],\"moduleName\":[\"garbagesort\"],\"businessName\":[\"result\"],\"functionName\":[\"关键词+结果记录\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuName]\":[\"垃圾分类\"],\"genType\":[\"1\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:21:01');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"keyword_search_num\"],\"tableComment\":[\"搜索关键词+次数记录表\"],\"className\":[\"KeywordSearchNum\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"24\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"25\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"keyword\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"26\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"num\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"27\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"times\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.garbagesort\"],\"moduleName\":[\"garbagesort\"],\"businessName\":[\"num\"],\"functionName\":[\"搜索关键词+次数记录\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuName]\":[\"垃圾分类\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:21:26');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"question_bank\"],\"tableComment\":[\"题库表\"],\"className\":[\"QuestionBank\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"28\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"questionId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"29\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"garbageType\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"30\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"垃圾名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"garbageName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"31\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"解析\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"analysis\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"32\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"备注\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"remark\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.garbagesort\"],\"moduleName\":[\"garbagesort\"],\"businessName\":[\"bank\"],\"functionName\":[\"题库\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuNa', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:21:49');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"slide_show\"],\"tableComment\":[\"幻灯片播放表\"],\"className\":[\"SlideShow\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"33\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"slide\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"34\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"是否启用\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"35\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"排序id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"sortId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"36\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"图片地址\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"imageUrl\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"37\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"跳转的链接地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"skipUrl\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.garbagesort\"],\"moduleName\":[\"garbagesort\"],\"businessName\":[\"show\"],\"functionName\":[\"幻灯片播放\"],\"params[parentMenuId]\":[\"2000\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:22:10');
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"speech_classify\"],\"tableComment\":[\"语音识别记录\"],\"className\":[\"SpeechClassify\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"38\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"39\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"filepath\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"40\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"oneKeyword\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"41\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"oneResult\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"42\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"allKeyword\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"textarea\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"43\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"allResult\"],\"columns[5].isInsert\":[\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:22:29');
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"challenge_detail\"],\"tableComment\":[\"挑战明细记录\"],\"className\":[\"ChallengeDetail\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"是否正确；1:正确；0:错误\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"whether\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"问题id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"questionId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"garbageName\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"garbageType\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"selectedType\"],\"columns[5].i', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:22:47');
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"challenge_result\"],\"tableComment\":[\"挑战结果+详情记录表\"],\"className\":[\"ChallengeResult\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"score\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"result\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"times\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"userName\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.garbagesort\"],\"moduleName\":[\"garbagesort\"],\"businessName\":[\"result\"],\"functionName\":[\"挑战结果+详情记录\"],\"param', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:23:05');
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"image_classify\"],\"tableComment\":[\"图像识别记录\"],\"className\":[\"ImageClassify\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"12\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"13\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"filepath\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"14\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"oneKeyword\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"15\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"oneResult\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"16\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"allKeyword\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"textarea\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"17\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"allResult\"],\"columns[5].isInsert\":[\"1\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:23:23');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"keyword_result,keyword_search_num,question_bank,slide_show,speech_classify,challenge_detail,challenge_result,image_classify\"]}', NULL, 0, NULL, '2021-06-08 10:23:32');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"keyword_result\"],\"tableComment\":[\"关键词+结果记录表\"],\"className\":[\"KeywordResult\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"20\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"21\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"keyword\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"22\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"result\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"23\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"times\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.garbagesort\"],\"moduleName\":[\"garbagesort\"],\"businessName\":[\"keywordResult\"],\"functionName\":[\"关键词+结果记录\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuName]\":[\"垃圾分类\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:33:14');
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"keyword_search_num\"],\"tableComment\":[\"搜索关键词+次数记录表\"],\"className\":[\"KeywordSearchNum\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"24\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"25\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"keyword\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"26\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"num\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"27\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"times\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.garbagesort\"],\"moduleName\":[\"garbagesort\"],\"businessName\":[\"keywordSearchNum\"],\"functionName\":[\"搜索关键词+次数记录\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuName]\":[\"垃圾分类\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:33:34');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"question_bank\"],\"tableComment\":[\"题库表\"],\"className\":[\"QuestionBank\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"28\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"questionId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"29\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"garbageType\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"30\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"垃圾名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"garbageName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"31\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"解析\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"analysis\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"32\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"备注\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"remark\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.garbagesort\"],\"moduleName\":[\"garbagesort\"],\"businessName\":[\"questionBank\"],\"functionName\":[\"题库\"],\"params[parentMenuId]\":[\"2000\"],\"params[pare', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:33:47');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"slide_show\"],\"tableComment\":[\"幻灯片播放表\"],\"className\":[\"SlideShow\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"33\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"slide\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"34\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"是否启用\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"35\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"排序id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"sortId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"36\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"图片地址\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"imageUrl\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"37\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"跳转的链接地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"skipUrl\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.garbagesort\"],\"moduleName\":[\"garbagesort\"],\"businessName\":[\"slideShow\"],\"functionName\":[\"幻灯片播放\"],\"params[parentMenuId]\":[\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:34:06');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"speech_classify\"],\"tableComment\":[\"语音识别记录\"],\"className\":[\"SpeechClassify\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"38\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"39\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"filepath\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"40\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"oneKeyword\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"41\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"oneResult\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"42\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"allKeyword\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"textarea\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"43\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"allResult\"],\"columns[5].isInsert\":[\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:34:25');
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"challenge_detail\"],\"tableComment\":[\"挑战明细记录\"],\"className\":[\"ChallengeDetail\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"是否正确；1:正确；0:错误\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"whether\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"问题id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"questionId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"garbageName\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"garbageType\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"selectedType\"],\"columns[5].i', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:34:41');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"challenge_result\"],\"tableComment\":[\"挑战结果+详情记录表\"],\"className\":[\"ChallengeResult\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"score\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"result\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"times\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"userName\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.garbagesort\"],\"moduleName\":[\"garbagesort\"],\"businessName\":[\"challengeResult\"],\"functionName\":[\"挑战结果+详情记录', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:34:55');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"image_classify\"],\"tableComment\":[\"图像识别记录\"],\"className\":[\"ImageClassify\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"12\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"13\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"filepath\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"14\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"oneKeyword\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"15\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"oneResult\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"16\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"allKeyword\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"textarea\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"17\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"allResult\"],\"columns[5].isInsert\":[\"1\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:35:06');
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"keyword_result,keyword_search_num,question_bank,slide_show,speech_classify,challenge_detail,challenge_result,image_classify\"]}', NULL, 0, NULL, '2021-06-08 10:35:15');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2067\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"题库\"],\"url\":[\"/garbagesort/questionBank\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:questionBank:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:42:16');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2073\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"幻灯片播放\"],\"url\":[\"/garbagesort/slideShow\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:slideShow:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:42:37');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2037\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"挑战明细记录\"],\"url\":[\"/garbagesort/challengeDetail\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:challengeDetail:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:42:46');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2043\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"挑战结果+详情记录\"],\"url\":[\"/garbagesort/challengeResult\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:challengeResult:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:42:55');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2049\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"图像识别记录\"],\"url\":[\"/garbagesort/imageClassify\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:imageClassify:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:43:01');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2055\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"关键词+结果记录\"],\"url\":[\"/garbagesort/keywordResult\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:keywordResult:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:43:08');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2061\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"搜索关键词+次数记录\"],\"url\":[\"/garbagesort/keywordSearchNum\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:keywordSearchNum:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 10:43:15');
INSERT INTO `sys_oper_log` VALUES (131, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"垃圾类型\"],\"dictType\":[\"garbage_type\"],\"status\":[\"0\"],\"remark\":[\"垃圾类型；1：干垃圾；2：湿垃圾；3、可回收垃圾；4、有害垃圾。\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:14:11');
INSERT INTO `sys_oper_log` VALUES (132, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"1\"],\"dictValue\":[\"干垃圾\"],\"dictType\":[\"garbage_type\"],\"cssClass\":[\"1\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:15:12');
INSERT INTO `sys_oper_log` VALUES (133, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"湿垃圾\"],\"dictValue\":[\"2\"],\"dictType\":[\"garbage_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:15:41');
INSERT INTO `sys_oper_log` VALUES (134, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"干垃圾\"],\"dictValue\":[\"1\"],\"dictType\":[\"garbage_type\"],\"cssClass\":[\"1\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:16:00');
INSERT INTO `sys_oper_log` VALUES (135, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"可回收垃圾\"],\"dictValue\":[\"3\"],\"dictType\":[\"garbage_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:16:18');
INSERT INTO `sys_oper_log` VALUES (136, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"有害垃圾\"],\"dictValue\":[\"4\"],\"dictType\":[\"garbage_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:16:29');
INSERT INTO `sys_oper_log` VALUES (137, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"挑战结果\"],\"dictType\":[\"challenge_result\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:19:40');
INSERT INTO `sys_oper_log` VALUES (138, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"正确\"],\"dictValue\":[\"1\"],\"dictType\":[\"challenge_result\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:19:56');
INSERT INTO `sys_oper_log` VALUES (139, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"错误\"],\"dictValue\":[\"0\"],\"dictType\":[\"challenge_result\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:20:06');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/question_bank', '127.0.0.1', '内网IP', '\"question_bank\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:25:33');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"question_bank\"],\"tableComment\":[\"题库表\"],\"className\":[\"QuestionBank\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"28\"],\"columns[0].sort\":[\"2\"],\"columns[0].columnComment\":[\"id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"questionId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"29\"],\"columns[1].sort\":[\"1\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"garbageType\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"garbage_type\"],\"columns[2].columnId\":[\"30\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"垃圾名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"garbageName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"31\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"解析\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"analysis\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"32\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"备注\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"remark\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.garbagesort\"],\"moduleName\":[\"garbagesort\"],\"businessName\":[\"questionBank\"],\"functionName\":[\"题库\"],\"params[parentMenuId]\":[\"2000\"],', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:26:47');
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/keyword_result', '127.0.0.1', '内网IP', '\"keyword_result\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:27:09');
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"keyword_result\"],\"tableComment\":[\"关键词+结果记录表\"],\"className\":[\"KeywordResult\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"20\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"21\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"keyword\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"22\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"result\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"23\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"times\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.garbagesort\"],\"moduleName\":[\"garbagesort\"],\"businessName\":[\"keywordResult\"],\"functionName\":[\"关键词+结果记录\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuName]\":[\"垃圾分类\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:27:18');
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"keyword_result,keyword_search_num,question_bank,slide_show,speech_classify,challenge_detail,challenge_result,image_classify\"]}', NULL, 0, NULL, '2021-06-08 12:27:30');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2067\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"垃圾分类题库\"],\"url\":[\"/garbagesort/questionBank\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:questionBank:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:30:47');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2043\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"挑战赛结果\"],\"url\":[\"/garbagesort/challengeResult\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:challengeResult:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:31:02');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2061\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"关键词搜索次数\"],\"url\":[\"/garbagesort/keywordSearchNum\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:keywordSearchNum:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:31:30');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2055\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"关键词搜索结果\"],\"url\":[\"/garbagesort/keywordResult\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:keywordResult:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 12:31:42');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2079\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"语音识别记录\"],\"url\":[\"/garbagesort/speechClassify\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:speechClassify:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 15:39:58');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2037\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"挑战明细记录\"],\"url\":[\"/garbagesort/challengeDetail\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:challengeDetail:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 15:40:06');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2043\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"挑战赛结果\"],\"url\":[\"/garbagesort/challengeResult\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:challengeResult:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 15:40:15');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2049\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"图像识别记录\"],\"url\":[\"/garbagesort/imageClassify\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:imageClassify:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 15:40:25');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2055\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"关键词搜索结果\"],\"url\":[\"/garbagesort/keywordResult\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:keywordResult:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 15:40:36');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2073\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"幻灯片播放\"],\"url\":[\"/garbagesort/slideShow\"],\"target\":[\"menuItem\"],\"perms\":[\"garbagesort:slideShow:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 15:41:22');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 15:45:19');
INSERT INTO `sys_oper_log` VALUES (156, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"admin\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-06-08 16:21:33');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 15:21:57');
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-outdent\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 15:22:10');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"105\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"/system/dict\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dict:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bookmark-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 15:23:31');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 15:23:42');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"106\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"参数设置\"],\"url\":[\"/system/config\"],\"target\":[\"menuItem\"],\"perms\":[\"system:config:view\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-sun-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 15:24:36');
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"107\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"通知公告\"],\"url\":[\"/system/notice\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-bullhorn\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 15:24:44');
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"108\"],\"parentId\":[\"1\"],\"menuType\":[\"M\"],\"menuName\":[\"日志管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-pencil-square-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 15:24:57');
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"100\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"用户管理\"],\"url\":[\"/system/user\"],\"target\":[\"menuItem\"],\"perms\":[\"system:user:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-user-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 15:25:24');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"101\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"角色管理\"],\"url\":[\"/system/role\"],\"target\":[\"menuItem\"],\"perms\":[\"system:role:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-user-secret\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 15:25:35');
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"orders,user_inf,user_addr,user,goods_detail\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 15:30:26');
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"用户管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-address-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 15:32:14');
INSERT INTO `sys_oper_log` VALUES (168, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"11\"],\"tableName\":[\"user\"],\"tableComment\":[\"用户表\"],\"className\":[\"User\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"63\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"64\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"手机号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"phone\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"65\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"md5加密的密码\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"password\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"66\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0：用户，1：管理员\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"userState\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"67\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"68\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 15:33:45');
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_role_dept,sys_user\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:13:44');
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"12\"],\"tableName\":[\"user_addr\"],\"tableComment\":[\"用户地址\"],\"className\":[\"UserAddr\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"69\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"addrId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"70\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"71\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"contactName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"72\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"contactPhone\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"73\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"省\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"province\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"74\"],\"columns[5].sort\":[\"6\"],\"columns[5].colum', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:16:59');
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"13\"],\"tableName\":[\"user_inf\"],\"tableComment\":[\"用户信息表\"],\"className\":[\"UserInf\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"79\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"自增主键ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"infId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"80\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"81\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"nickname\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"82\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"头像\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"avatar\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"83\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"phone\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"84\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"0：女，1：男\"],\"columns[5].javaType\":[\"String\"],\"columns', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:17:32');
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/goods_detail', '127.0.0.1', '内网IP', '\"goods_detail\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:29:11');
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/orders', '127.0.0.1', '内网IP', '\"orders\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:29:14');
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:29:38');
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"goods_detail\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:29:42');
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"订单管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-building\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:30:52');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"50\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:31:04');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"51\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:31:12');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"52\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:31:31');
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"16\"],\"tableName\":[\"goods_detail\"],\"tableComment\":[\"物品详情表\"],\"className\":[\"GoodsDetail\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"111\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"物品id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"112\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"订单号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"orderId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"113\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"物品名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"goodsName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"114\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"物品重量\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"weight\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"115\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"物品单价\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"amount\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"116\"],\"columns[5].sort\":[\"6\"],\"co', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:31:56');
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:32:24');
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"orders\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:32:29');
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"17\"],\"tableName\":[\"orders\"],\"tableComment\":[\"订单表\"],\"className\":[\"Orders\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"117\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"118\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"119\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"回收员id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"recyclerId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"120\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预估重量\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"estimateWeight\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"121\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单回收地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"122\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"电话号码\"],', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:32:53');
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"14,15\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:33:01');
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"orders,goods_detail,user_inf,user_addr,user\"]}', NULL, 0, NULL, '2024-04-20 17:33:46');
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"105\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"/system/dict\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dict:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bookmark-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:47:54');
INSERT INTO `sys_oper_log` VALUES (187, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"订单状态\"],\"dictType\":[\"order_status\"],\"status\":[\"0\"],\"remark\":[\"订单状态选项\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:51:34');
INSERT INTO `sys_oper_log` VALUES (188, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待接单\"],\"dictValue\":[\"1\"],\"dictType\":[\"order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:52:35');
INSERT INTO `sys_oper_log` VALUES (189, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已完成\"],\"dictValue\":[\"2\"],\"dictType\":[\"order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:53:41');
INSERT INTO `sys_oper_log` VALUES (190, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已取消\"],\"dictValue\":[\"3\"],\"dictType\":[\"order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:53:56');
INSERT INTO `sys_oper_log` VALUES (191, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已接单\"],\"dictValue\":[\"4\"],\"dictType\":[\"order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:54:08');
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"17,16,13,12,11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:57:16');
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"user,orders,user_addr,user_inf,goods_detail\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 17:58:03');
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"19\"],\"tableName\":[\"orders\"],\"tableComment\":[\"订单表\"],\"className\":[\"Orders\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"134\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"135\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"136\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"回收员id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"recyclerId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"137\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预估重量\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"estimateWeight\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"138\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单回收地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"139\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"电话号码\"],', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:00:09');
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"orders\"]}', NULL, 0, NULL, '2024-04-20 18:00:24');
INSERT INTO `sys_oper_log` VALUES (196, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"回收物品类型\"],\"dictType\":[\"recycle_type\"],\"status\":[\"0\"],\"remark\":[\"回收物品类型 \"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:06:20');
INSERT INTO `sys_oper_log` VALUES (197, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"纸皮类\"],\"dictValue\":[\"纸皮类\"],\"dictType\":[\"recycle_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:07:33');
INSERT INTO `sys_oper_log` VALUES (198, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"衣物＆其他\"],\"dictValue\":[\"衣物＆其他\"],\"dictType\":[\"recycle_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:08:03');
INSERT INTO `sys_oper_log` VALUES (199, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"金属类\"],\"dictValue\":[\"金属类\"],\"dictType\":[\"recycle_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:08:21');
INSERT INTO `sys_oper_log` VALUES (200, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"塑料类\"],\"dictValue\":[\"塑料类\"],\"dictType\":[\"recycle_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:08:37');
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"19\"],\"tableName\":[\"orders\"],\"tableComment\":[\"订单表\"],\"className\":[\"Orders\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"134\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"135\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"136\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"回收员id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"recyclerId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"137\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预估重量\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"estimateWeight\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"138\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单回收地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"139\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"电话号码\"],', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:09:17');
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"orders\"]}', NULL, 0, NULL, '2024-04-20 18:09:23');
INSERT INTO `sys_oper_log` VALUES (203, '订单查询', 2, 'com.ruoyi.project.garbagesort.orders.controller.OrdersController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/orders/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"userId\":[\"11\"],\"recyclerId\":[\"\"],\"estimateWeight\":[\"10-50公斤\"],\"address\":[\"前门东大街9号\"],\"phone\":[\"12345678901\"],\"type\":[\"金属类\"],\"status\":[\"3\"],\"appointmentTime\":[\"2024-04-21 5:10\"],\"amount\":[\"0.0\"],\"orderTime\":[\"2024-04-20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:13:21');
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:15:09');
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"user\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:15:44');
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"23\"],\"tableName\":[\"user\"],\"tableComment\":[\"用户表\"],\"className\":[\"User\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"170\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"171\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"手机号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"phone\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"172\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"md5加密的密码\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"password\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"173\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"用户类型：0：用户，1：回收员\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"userState\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"174\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建日期\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"175\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"修改日期\"],\"columns[5].javaType\":[\"Date\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:17:56');
INSERT INTO `sys_oper_log` VALUES (207, '用户地址', 2, 'com.ruoyi.project.garbagesort.useraddr.controller.UserAddrController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/useraddr/edit', '127.0.0.1', '内网IP', '{\"addrId\":[\"4\"],\"userId\":[\"11\"],\"contactName\":[\"老卢\"],\"contactPhone\":[\"12345678901\"],\"province\":[\"北京市东城区\"],\"city\":[\"\"],\"district\":[\"\"],\"address\":[\"前门东大街9号\"],\"isDefault\":[\"2\"],\"modifiedTime\":[\"2024-04-19\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:18:50');
INSERT INTO `sys_oper_log` VALUES (208, '用户地址', 2, 'com.ruoyi.project.garbagesort.useraddr.controller.UserAddrController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/useraddr/edit', '127.0.0.1', '内网IP', '{\"addrId\":[\"4\"],\"userId\":[\"11\"],\"contactName\":[\"老卢\"],\"contactPhone\":[\"12345678901\"],\"province\":[\"北京市东城区\"],\"city\":[\"\"],\"district\":[\"\"],\"address\":[\"前门东大街9号\"],\"isDefault\":[\"1\"],\"modifiedTime\":[\"2024-04-19\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:18:55');
INSERT INTO `sys_oper_log` VALUES (209, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"默认地址\"],\"dictType\":[\"defalt_addr\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:19:46');
INSERT INTO `sys_oper_log` VALUES (210, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"默认\"],\"dictValue\":[\"1\"],\"dictType\":[\"defalt_addr\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:20:39');
INSERT INTO `sys_oper_log` VALUES (211, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"不默认\"],\"dictValue\":[\"2\"],\"dictType\":[\"defalt_addr\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:20:54');
INSERT INTO `sys_oper_log` VALUES (212, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"115\"],\"dictLabel\":[\"不默认\"],\"dictValue\":[\"0\"],\"dictType\":[\"defalt_addr\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:20:59');
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"21\"],\"tableName\":[\"user_addr\"],\"tableComment\":[\"用户地址表\"],\"className\":[\"UserAddr\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"151\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"地址id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"addrId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"152\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"153\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"姓名\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"contactName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"154\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"电话号码\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"contactPhone\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"155\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"省\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"province\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"156\"],\"columns[5].sort\":[\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:22:34');
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"22\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:24:11');
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"user_inf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:24:18');
INSERT INTO `sys_oper_log` VALUES (216, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"24\"],\"tableName\":[\"user_inf\"],\"tableComment\":[\"用户信息表\"],\"className\":[\"UserInf\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"176\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户信息ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"infId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"177\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"178\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户昵称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"nickname\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"179\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"头像\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"avatar\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"180\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电话号码\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"phone\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"181\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"性别\"],\"columns[5].javaType\":[\"String\"]', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:25:20');
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"user_inf,user,user_addr\"]}', NULL, 0, NULL, '2024-04-20 18:26:59');
INSERT INTO `sys_oper_log` VALUES (218, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"1\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"0\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:35:36');
INSERT INTO `sys_oper_log` VALUES (219, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"1\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"0\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:35:56');
INSERT INTO `sys_oper_log` VALUES (220, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"1\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"0\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:36:54');
INSERT INTO `sys_oper_log` VALUES (221, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"性别\"],\"dictType\":[\"user_sex\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:38:01');
INSERT INTO `sys_oper_log` VALUES (222, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"男\"],\"dictValue\":[\"男\"],\"dictType\":[\"user_sex\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:38:20');
INSERT INTO `sys_oper_log` VALUES (223, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"女\"],\"dictValue\":[\"女\"],\"dictType\":[\"user_sex\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:38:33');
INSERT INTO `sys_oper_log` VALUES (224, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"保密\"],\"dictValue\":[\"保密\"],\"dictType\":[\"user_sex\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:38:43');
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"24\"],\"tableName\":[\"user_inf\"],\"tableComment\":[\"用户信息表\"],\"className\":[\"UserInf\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"176\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户信息ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"infId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"177\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"178\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户昵称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"nickname\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"179\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"头像\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"avatar\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"180\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电话号码\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"phone\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"181\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"性别\"],\"columns[5].javaType\":[\"String\"]', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:39:09');
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"user_inf\"]}', NULL, 0, NULL, '2024-04-20 18:39:18');
INSERT INTO `sys_oper_log` VALUES (227, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"1\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"男\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:40:43');
INSERT INTO `sys_oper_log` VALUES (228, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"1\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"女\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:40:47');
INSERT INTO `sys_oper_log` VALUES (229, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"1\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"保密\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:40:51');
INSERT INTO `sys_oper_log` VALUES (230, '用户地址查询', 2, 'com.ruoyi.project.garbagesort.addr.controller.UserAddrController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/addr/edit', '127.0.0.1', '内网IP', '{\"addrId\":[\"4\"],\"userId\":[\"11\"],\"contactName\":[\"卢本伟\"],\"contactPhone\":[\"0178783861992\"],\"province\":[\"-- 选择省 --\"],\"city\":[\"桂林市\"],\"district\":[\"\"],\"address\":[\"雁山区雁山镇一号\"],\"isDefault\":[\"1\"],\"modifiedTime\":[\"2024-04-19\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:49:09');
INSERT INTO `sys_oper_log` VALUES (231, '用户地址查询', 2, 'com.ruoyi.project.garbagesort.addr.controller.UserAddrController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/addr/edit', '127.0.0.1', '内网IP', '{\"addrId\":[\"4\"],\"userId\":[\"11\"],\"contactName\":[\"卢本伟\"],\"contactPhone\":[\"0178783861992\"],\"province\":[\"广西\"],\"city\":[\"桂林市\"],\"district\":[\"13区\"],\"address\":[\"雁山区雁山镇一号\"],\"isDefault\":[\"1\"],\"modifiedTime\":[\"2024-04-19\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:49:32');
INSERT INTO `sys_oper_log` VALUES (232, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"23\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:57:48');
INSERT INTO `sys_oper_log` VALUES (233, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"users\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:57:54');
INSERT INTO `sys_oper_log` VALUES (234, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"用户类型\"],\"dictType\":[\"user_style\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:58:49');
INSERT INTO `sys_oper_log` VALUES (235, '字典类型', 2, 'com.ruoyi.project.system.dict.controller.DictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"106\"],\"dictName\":[\"用户类型\"],\"dictType\":[\"user_type\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:59:05');
INSERT INTO `sys_oper_log` VALUES (236, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"用户\"],\"dictValue\":[\"0\"],\"dictType\":[\"user_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:59:23');
INSERT INTO `sys_oper_log` VALUES (237, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"回收员\"],\"dictValue\":[\"1\"],\"dictType\":[\"user_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 18:59:36');
INSERT INTO `sys_oper_log` VALUES (238, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"25\"],\"tableName\":[\"users\"],\"tableComment\":[\"用户表\"],\"className\":[\"Users\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"185\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"186\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"手机号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"phone\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"187\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"md5加密的密码\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"password\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"188\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"用户类型：0：用户，1：回收员\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"userState\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"user_type\"],\"columns[4].columnId\":[\"189\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建日期\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"190\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"修改日期\"],\"columns[5].javaType\":[\"Da', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 19:00:11');
INSERT INTO `sys_oper_log` VALUES (239, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"users\"]}', NULL, 0, NULL, '2024-04-20 19:00:19');
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"100\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"用户管理\"],\"url\":[\"/system/user\"],\"target\":[\"menuItem\"],\"perms\":[\"system:user:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-user-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 19:47:45');
INSERT INTO `sys_oper_log` VALUES (241, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"25\"],\"tableName\":[\"users\"],\"tableComment\":[\"用户表\"],\"className\":[\"Users\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"185\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"186\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"手机号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"phone\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"187\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"md5加密的密码\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"password\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"188\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"用户类型：0：用户，1：回收员\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"userState\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"user_type\"],\"columns[4].columnId\":[\"189\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建日期\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"190\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"修改日期\"],\"columns[5].javaType\":[\"Da', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 20:03:33');
INSERT INTO `sys_oper_log` VALUES (242, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"25\"],\"tableName\":[\"users\"],\"tableComment\":[\"用户表\"],\"className\":[\"Users\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"185\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"186\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"手机号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"phone\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"187\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"md5加密的密码\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"password\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"188\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"用户类型：0：用户，1：回收员\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"userState\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"user_type\"],\"columns[4].columnId\":[\"189\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建日期\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"190\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"修改日期\"]', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 20:06:15');
INSERT INTO `sys_oper_log` VALUES (243, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"users\"]}', NULL, 0, NULL, '2024-04-20 20:06:19');
INSERT INTO `sys_oper_log` VALUES (244, '用户查询', 2, 'com.ruoyi.project.garbagesort.users.controller.UsersController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/users/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"11\"],\"phone\":[\"123\"],\"userState\":[\"1\"],\"modifiedTime\":[\"2024-04-20\"],\"index\":[\"1\"],\"userInfList[0].nickname\":[\"茶壶\"],\"userInfList[0].avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"userInfList[0].phone\":[\"19839715890\"],\"userInfList[0].gender\":[\"女\"],\"userInfList[0].userMoney\":[\"0\"],\"userInfList[0].orderNum\":[\"0\"],\"userInfList[0].registerTime\":[\"2024-04-09\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 20:16:40');
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"24\"],\"tableName\":[\"user_inf\"],\"tableComment\":[\"用户信息表\"],\"className\":[\"UserInf\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"176\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户信息ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"infId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"177\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"178\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户昵称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"nickname\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"179\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"头像\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"avatar\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"180\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电话号码\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"phone\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"181\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"性别\"],\"columns[5].javaType\":[\"String\"]', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 20:24:58');
INSERT INTO `sys_oper_log` VALUES (246, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/user_inf', '127.0.0.1', '内网IP', '\"user_inf\"', NULL, 0, NULL, '2024-04-20 20:25:04');
INSERT INTO `sys_oper_log` VALUES (247, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"24\"],\"tableName\":[\"user_inf\"],\"tableComment\":[\"用户信息表\"],\"className\":[\"UserInf\"],\"functionAuthor\":[\"luoxiang\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"176\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户信息ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"infId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"177\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"178\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户昵称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"nickname\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"179\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"头像\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"avatar\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"upload\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"180\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电话号码\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"phone\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"181\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"性别\"],\"columns[5].javaType\":[\"String\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 20:31:00');
INSERT INTO `sys_oper_log` VALUES (248, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/user_inf', '127.0.0.1', '内网IP', '\"user_inf\"', NULL, 0, NULL, '2024-04-20 20:31:06');
INSERT INTO `sys_oper_log` VALUES (249, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"2\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"女\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-09\"],\"btSelectAll\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 20:35:20');
INSERT INTO `sys_oper_log` VALUES (250, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"2\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"女\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-09\"],\"index\":[\"1\"],\"usersList[0].phone\":[\"11\"],\"usersList[0].password\":[\"11\"],\"usersList[0].userState\":[\"1\"],\"usersList[0].createTime\":[\"11\"],\"usersList[0].modifiedTime\":[\"11\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'create_time\' cannot be null\r\n### The error may exist in file [C:\\Users\\lloogg\\Desktop\\新建文件夹\\GarbageSort-master\\web\\target\\classes\\mybatis\\garbagesort\\UserInfMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into users( user_id, phone, password, user_state, create_time, modified_time) values                  ( ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'create_time\' cannot be null\n; Column \'create_time\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'create_time\' cannot be null', '2024-04-20 20:36:29');
INSERT INTO `sys_oper_log` VALUES (251, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"2\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"女\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-09\"],\"index\":[\"1\"],\"usersList[0].phone\":[\"11\"],\"usersList[0].password\":[\"11\"],\"usersList[0].userState\":[\"1\"],\"usersList[0].createTime\":[\"2024-04-29\"],\"usersList[0].modifiedTime\":[\"2024-04-29\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 20:36:54');
INSERT INTO `sys_oper_log` VALUES (252, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"2\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"女\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-09\"],\"index\":[\"1\"],\"usersList[0].phone\":[\"19839715890\"],\"usersList[0].password\":[\"11\"],\"usersList[0].userState\":[\"1\"],\"usersList[0].createTime\":[\"2024-04-28 16:00:00\"],\"usersList[0].modifiedTime\":[\"2024-04-28\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 20:37:45');
INSERT INTO `sys_oper_log` VALUES (253, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"2\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"女\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-09\"],\"index\":[\"1\"],\"usersList[0].phone\":[\"19839715890\"],\"usersList[0].password\":[\"11\"],\"usersList[0].userState\":[\"0\"],\"usersList[0].createTime\":[\"2024-04-28 08:00:00\"],\"usersList[0].modifiedTime\":[\"2024-04-27\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 20:38:52');
INSERT INTO `sys_oper_log` VALUES (254, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"2\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"女\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-09\"],\"index\":[\"1\",\"2\"],\"usersList[0].phone\":[\"19839715890\"],\"usersList[0].password\":[\"11\"],\"usersList[0].userState\":[\"0\"],\"usersList[0].createTime\":[\"2024-04-28 00:00:00\"],\"usersList[0].modifiedTime\":[\"2024-04-26\"],\"usersList[1].phone\":[\"12345678901\"],\"usersList[1].password\":[\"123\"],\"usersList[1].userState\":[\"0\"],\"usersList[1].createTime\":[\"2024-04-28 00:00:00\"],\"usersList[1].modifiedTime\":[\"2024-04-28 00:00:00\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'users.PRIMARY\'\r\n### The error may exist in file [C:\\Users\\lloogg\\Desktop\\新建文件夹\\GarbageSort-master\\web\\target\\classes\\mybatis\\garbagesort\\UserInfMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into users( user_id, phone, password, user_state, create_time, modified_time) values                  ( ?, ?, ?, ?, ?, ?)          ,              ( ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'users.PRIMARY\'\n; Duplicate entry \'2\' for key \'users.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'users.PRIMARY\'', '2024-04-20 20:40:20');
INSERT INTO `sys_oper_log` VALUES (255, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"2\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"女\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-09\"],\"index\":[\"1\",\"2\"],\"usersList[0].phone\":[\"19839715890\"],\"usersList[0].password\":[\"11\"],\"usersList[0].userState\":[\"0\"],\"usersList[0].createTime\":[\"2024-04-28 00:00:00\"],\"usersList[0].modifiedTime\":[\"2024-04-26\"],\"usersList[1].phone\":[\"12345678901\"],\"usersList[1].password\":[\"123\"],\"usersList[1].userState\":[\"0\"],\"usersList[1].createTime\":[\"2024-04-28 00:00:00\"],\"usersList[1].modifiedTime\":[\"2024-04-28 00:00:00\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'users.PRIMARY\'\r\n### The error may exist in file [C:\\Users\\lloogg\\Desktop\\新建文件夹\\GarbageSort-master\\web\\target\\classes\\mybatis\\garbagesort\\UserInfMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into users( user_id, phone, password, user_state, create_time, modified_time) values                  ( ?, ?, ?, ?, ?, ?)          ,              ( ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'users.PRIMARY\'\n; Duplicate entry \'2\' for key \'users.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'users.PRIMARY\'', '2024-04-20 20:44:04');
INSERT INTO `sys_oper_log` VALUES (256, '用户信息查询', 2, 'com.ruoyi.project.garbagesort.userInfo.controller.UserInfController.editSave()', 'POST', 1, 'admin', '研发部门', '/garbagesort/userInfo/edit', '127.0.0.1', '内网IP', '{\"infId\":[\"2\"],\"userId\":[\"11\"],\"nickname\":[\"茶壶\"],\"avatar\":[\"https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/16/6c2f5e8989c04297886e524299a9f96a.jpg\"],\"phone\":[\"19839715890\"],\"gender\":[\"女\"],\"userMoney\":[\"0.00\"],\"orderNum\":[\"0\"],\"registerTime\":[\"2024-04-09\"],\"index\":[\"1\"],\"usersList[0].phone\":[\"12345678901\"],\"usersList[0].password\":[\"123123\"],\"usersList[0].userState\":[\"0\"],\"usersList[0].createTime\":[\"2024-04-29\"],\"usersList[0].modifiedTime\":[\"2024-04-29\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-20 20:46:49');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-06-08 09:13:55', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-06-08 09:13:55', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-06-08 09:13:55', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-06-08 09:13:55', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2021-06-08 09:13:55', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2021-06-08 09:13:55', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'admin', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2024-04-20 20:30:23', '2021-06-08 09:13:55', 'admin', '2021-06-08 09:13:55', '', '2024-04-20 20:32:13', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2021-06-08 09:13:55', '2021-06-08 09:13:55', 'admin', '2021-06-08 09:13:55', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '在线用户记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('e4b59303-465a-4f0f-a20d-92589c287b69', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', 'on_line', '2024-04-20 20:30:19', '2024-04-20 20:45:40', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for user_addr
-- ----------------------------
DROP TABLE IF EXISTS `user_addr`;
CREATE TABLE `user_addr`  (
  `addr_id` int NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `user_id` int NOT NULL COMMENT '用户id',
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `contact_phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '电话号码',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  `is_default` tinyint NULL DEFAULT 0 COMMENT '是否默认',
  `modified_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`addr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_addr
-- ----------------------------
INSERT INTO `user_addr` VALUES (4, 11, '卢本伟', '17878386199', '广西', '桂林市', '13区', '雁山区雁山镇一号', 0, '2024-04-21 10:36:22');
INSERT INTO `user_addr` VALUES (10, 11, '老李', '19839456720', '北京市东城区', NULL, NULL, '前门东大街辅路与正义路交叉口西北方向60米', 1, '2024-04-21 10:36:22');
INSERT INTO `user_addr` VALUES (20, 20, '士大夫', '15555555555', '士大夫', NULL, NULL, '电视广告', 0, '2024-04-21 10:21:05');

-- ----------------------------
-- Table structure for user_inf
-- ----------------------------
DROP TABLE IF EXISTS `user_inf`;
CREATE TABLE `user_inf`  (
  `inf_id` int NOT NULL AUTO_INCREMENT COMMENT '用户信息ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '微信用户' COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '头像',
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '电话号码',
  `gender` enum('男','女','保密') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `user_money` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '用户余额',
  `order_num` int NULL DEFAULT 0 COMMENT '订单数量',
  `register_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  PRIMARY KEY (`inf_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES (2, 11, '茶壶', 'https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/21/32968c91e9e2409689194cb550de4761.jpeg', '19839715890', '男', 0.00, 0, '2024-04-09 00:00:00');
INSERT INTO `user_inf` VALUES (3, 18, '微信用户5', 'https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/20/d7f1cd240fb54d00938278c9778bcf6a.jpg', '19839715890', '保密', 0.00, 0, '2024-04-20 23:02:07');
INSERT INTO `user_inf` VALUES (4, 19, '微信用户', NULL, '19839715890', '男', 0.00, 0, '2024-04-21 09:31:52');
INSERT INTO `user_inf` VALUES (5, 20, '微信用户', 'https://avatar-2024-04-16.oss-cn-shenzhen.aliyuncs.com/user/2024/04/21/b9dfab864e14444f9dbd2ed160581a58.jpg', '19839715890', '男', 0.00, 0, '2024-04-21 09:34:40');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '手机号',
  `password` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'md5加密的密码',
  `user_state` tinyint NOT NULL DEFAULT 0 COMMENT '用户类型：0：用户，1：回收员',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `modified_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (11, '123', 'c38dc3dcb8f0b43ac8ea6a70b5ec7648', 1, '2024-04-10 16:43:50', '2024-04-21 09:28:02');
INSERT INTO `users` VALUES (18, '1983971589', 'c38dc3dcb8f0b43ac8ea6a70b5ec7648', 0, '2024-04-19 09:28:47', '2024-04-21 09:30:55');
INSERT INTO `users` VALUES (20, '19839715890', 'd3b1294a61a07da9b49b6e22b2cbd7f9', 0, '2024-04-21 09:34:40', '2024-04-21 09:34:40');

SET FOREIGN_KEY_CHECKS = 1;
