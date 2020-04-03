/*
 Navicat Premium Data Transfer

 Source Server         : LocalMysql8
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3308
 Source Schema         : ezlinker

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 03/04/2020 12:01:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ez_aliyun_config
-- ----------------------------
DROP TABLE IF EXISTS `ez_aliyun_config`;
CREATE TABLE `ez_aliyun_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `access_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阿里云访问Key',
  `secret` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阿里云密钥',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '阿里云密钥配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_aliyun_sms_config
-- ----------------------------
DROP TABLE IF EXISTS `ez_aliyun_sms_config`;
CREATE TABLE `ez_aliyun_sms_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `region_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域',
  `account_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账户名',
  `from` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发信人(自己)',
  `address_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址类型(默认为1)',
  `tag_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签,平台申请以后会发',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '阿里云短信参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_device
-- ----------------------------
DROP TABLE IF EXISTS `ez_device`;
CREATE TABLE `ez_device`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT '项目',
  `product_id` int(11) NOT NULL COMMENT '产品',
  `protocol` int(11) NULL DEFAULT NULL COMMENT '协议类型',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `logo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Logo',
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地理位置',
  `model` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '型号',
  `industry` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '厂家',
  `sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '序列号',
  `type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `last_active` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL COMMENT '1:在线;2:离线;3未激活',
  `statuses` json NULL COMMENT '运行的状态',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MQTT用户名',
  `client_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MQTT ClientID',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MQTT密码',
  `is_superuser` int(11) NULL DEFAULT NULL COMMENT '是否超级权限',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '认证token',
  `parameters` json NULL COMMENT '参数',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(1) UNSIGNED ZEROFILL NOT NULL COMMENT '是否删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '实际设备，是产品的一个实例。在EMQX中扮演 的是USER,支持两种认证形式:clientId和Username\\password.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_device_protocol_config
-- ----------------------------
DROP TABLE IF EXISTS `ez_device_protocol_config`;
CREATE TABLE `ez_device_protocol_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `label` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` int(11) NULL DEFAULT 0 COMMENT '配置值',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备协议配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_dictionary_key
-- ----------------------------
DROP TABLE IF EXISTS `ez_dictionary_key`;
CREATE TABLE `ez_dictionary_key`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `label` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示的文本',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典的项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_dictionary_value
-- ----------------------------
DROP TABLE IF EXISTS `ez_dictionary_value`;
CREATE TABLE `ez_dictionary_value`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `key_id` int(11) NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示的文本',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典的值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_emqx_config
-- ----------------------------
DROP TABLE IF EXISTS `ez_emqx_config`;
CREATE TABLE `ez_emqx_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'EMQX IP地址',
  `app_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'HTTP接口的ID',
  `secret` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'APP接口密钥',
  `port` int(11) NULL DEFAULT NULL COMMENT 'HTTP接口端口',
  `node_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `state` int(11) NULL DEFAULT NULL COMMENT '0:离线;1:在线',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'EMQX配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_feature
-- ----------------------------
DROP TABLE IF EXISTS `ez_feature`;
CREATE TABLE `ez_feature`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL COMMENT '所属产品',
  `label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL COMMENT '类型',
  `cmd_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cmd_values` json NOT NULL,
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品的功能（特性），和设备是多对多的关系，通过中间表关联起来' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_icon_config
-- ----------------------------
DROP TABLE IF EXISTS `ez_icon_config`;
CREATE TABLE `ez_icon_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后端维持的图表库配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_module
-- ----------------------------
DROP TABLE IF EXISTS `ez_module`;
CREATE TABLE `ez_module`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `device_id` int(11) NULL DEFAULT NULL COMMENT '绑定的设备',
  `type` int(11) NULL DEFAULT NULL COMMENT '模块类型',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Token',
  `model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '型号',
  `data_areas` json NULL COMMENT '数据域',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备上面的模块，和设备是多对一关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_module_template
-- ----------------------------
DROP TABLE IF EXISTS `ez_module_template`;
CREATE TABLE `ez_module_template`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块类型',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `data_areas` json NULL COMMENT '数据域',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品上面的模块模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_module_type_config
-- ----------------------------
DROP TABLE IF EXISTS `ez_module_type_config`;
CREATE TABLE `ez_module_type_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `type` int(4) NULL DEFAULT 0 COMMENT '类型，1：控件，2：视图',
  `label` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模块类型配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_mqtt_topic
-- ----------------------------
DROP TABLE IF EXISTS `ez_mqtt_topic`;
CREATE TABLE `ez_mqtt_topic`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NULL DEFAULT NULL COMMENT '设备',
  `client_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MQTT客户端ID',
  `allow` int(11) NULL DEFAULT 1 COMMENT '是否允许连接: 0=拒绝1=允许',
  `type` tinyint(4) NULL DEFAULT 0 COMMENT '类型 1：S2C；2：C2S；3：STATUS；4：GROUP',
  `access` int(11) NULL DEFAULT 1 COMMENT '行为类型: 1=订阅2=发布3=订阅+发布',
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MQTT用户名',
  `topic` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'MQTT的TOPIC记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_permission
-- ----------------------------
DROP TABLE IF EXISTS `ez_permission`;
CREATE TABLE `ez_permission`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `sort` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '排序值',
  `type` int(11) NOT NULL COMMENT '类型：1目录，2动作',
  `visible` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '是否显示在UI上',
  `label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UI显示的标签',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称（英文）',
  `resource` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求路径',
  `parent` int(11) NOT NULL COMMENT '父资源，如果是0则为顶级',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_product
-- ----------------------------
DROP TABLE IF EXISTS `ez_product`;
CREATE TABLE `ez_product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `project_id` int(11) NOT NULL COMMENT '项目ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `logo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品logo',
  `type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `state` int(11) NULL DEFAULT NULL COMMENT '当0设备的时候,状态为:设计中;当已经有设备以后,状态为:生产中,此时不可更改关键数据.',
  `parameters` json NULL COMMENT '参数',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述文字',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(1) UNSIGNED ZEROFILL NOT NULL COMMENT '是否删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品（设备的抽象模板）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_project
-- ----------------------------
DROP TABLE IF EXISTS `ez_project`;
CREATE TABLE `ez_project`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '类型',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_relation_device_module
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_device_module`;
CREATE TABLE `ez_relation_device_module`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `device_id` int(11) NOT NULL COMMENT '设备',
  `module_id` int(11) NOT NULL COMMENT ' 模块',
  `record_version` int(11) NOT NULL DEFAULT 0,
  `x` tinyint(1) UNSIGNED ZEROFILL NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_relation_feature_module
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_feature_module`;
CREATE TABLE `ez_relation_feature_module`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `feature_id` int(11) NOT NULL COMMENT '功能',
  `module_id` int(11) NOT NULL COMMENT ' 模块',
  `record_version` int(11) NOT NULL DEFAULT 0,
  `x` tinyint(1) UNSIGNED ZEROFILL NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_relation_module_visual_style
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_module_visual_style`;
CREATE TABLE `ez_relation_module_visual_style`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `module_id` int(11) NOT NULL COMMENT '模块ID',
  `visual_style_id` int(11) NOT NULL COMMENT '视觉效果ID',
  `fields` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '需要展示的数据字段',
  `record_version` int(11) NOT NULL DEFAULT 0,
  `x` tinyint(1) UNSIGNED ZEROFILL NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模块和可视化视觉展示效果关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_relation_product_module
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_product_module`;
CREATE TABLE `ez_relation_product_module`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `product_id` int(11) NOT NULL COMMENT '设备',
  `module_id` int(11) NOT NULL COMMENT ' 模块',
  `record_version` int(11) NULL DEFAULT NULL,
  `x` tinyint(1) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_relation_product_tag
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_product_tag`;
CREATE TABLE `ez_relation_product_tag`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `tag_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(1) UNSIGNED ZEROFILL NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Tag 产品关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_relation_protocol_type_module_type
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_protocol_type_module_type`;
CREATE TABLE `ez_relation_protocol_type_module_type`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `protocol_type_id` int(11) NOT NULL COMMENT '协议类型',
  `module_type_id` int(11) NOT NULL COMMENT '模块类型',
  `record_version` int(11) NOT NULL DEFAULT 0,
  `x` tinyint(1) UNSIGNED ZEROFILL NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'XXX协议支持的XXX模块类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_relation_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_role_permission`;
CREATE TABLE `ez_relation_role_permission`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `permission_value` int(11) NULL DEFAULT NULL COMMENT '权限值',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和权限关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_relation_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_user_permission`;
CREATE TABLE `ez_relation_user_permission`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `permission_id` int(11) NOT NULL COMMENT '资源路径ID',
  `record_version` int(11) NOT NULL DEFAULT 0,
  `x` tinyint(1) UNSIGNED ZEROFILL NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和资源路径关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_relation_user_project
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_user_project`;
CREATE TABLE `ez_relation_user_project`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `project_id` int(11) NOT NULL COMMENT '项目ID',
  `record_version` int(11) NOT NULL DEFAULT 0,
  `x` tinyint(1) UNSIGNED ZEROFILL NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和项目关联表，用来给用户授权具体项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_relation_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_user_role`;
CREATE TABLE `ez_relation_user_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(1) UNSIGNED ZEROFILL NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户-角色关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_resource_authorize
-- ----------------------------
DROP TABLE IF EXISTS `ez_resource_authorize`;
CREATE TABLE `ez_resource_authorize`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `master_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作用者',
  `master_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作用者表名',
  `slaver_id` int(11) NOT NULL COMMENT '被作用的对象',
  `slaver_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被作用者的表名',
  `authorize_value` int(11) NOT NULL COMMENT '授权值',
  `x` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除',
  `record_version` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源授权表,记录所有存在权限关系的双方' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_role
-- ----------------------------
DROP TABLE IF EXISTS `ez_role`;
CREATE TABLE `ez_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent` int(11) NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_schedule_info
-- ----------------------------
DROP TABLE IF EXISTS `ez_schedule_info`;
CREATE TABLE `ez_schedule_info`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_id` int(11) NULL DEFAULT NULL COMMENT '作用方ID',
  `task_description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `task_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `task_group` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名称',
  `trigger_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '触发器名称',
  `trigger_group` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '触发器组',
  `trigger_cron_expression` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表达式',
  `execute_class_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标执行类类名',
  `execute_method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行类的具体执行方法',
  `target_table` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据目标所在表集合\",\"分割用于统计',
  `is_start` tinyint(1) NULL DEFAULT NULL COMMENT '是否启动',
  `status` int(11) NULL DEFAULT 1 COMMENT '0:停止,1:暂停:2:启动',
  `updated_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `schedule_data` json NULL COMMENT '指令内容',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `record_version` int(11) NULL DEFAULT NULL,
  `x` tinyint(4) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '实际的定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_schedule_template
-- ----------------------------
DROP TABLE IF EXISTS `ez_schedule_template`;
CREATE TABLE `ez_schedule_template`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL COMMENT '定时任务作用的产品',
  `task_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `task_description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `trigger_cron_expression` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CronTab表达式',
  `schedule_data` json NULL COMMENT '指令内容',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `record_version` int(11) NULL DEFAULT NULL,
  `x` tinyint(4) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_shared_device
-- ----------------------------
DROP TABLE IF EXISTS `ez_shared_device`;
CREATE TABLE `ez_shared_device`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `device_id` int(11) NOT NULL COMMENT '设备ID',
  `record_version` int(11) NOT NULL DEFAULT 0,
  `x` tinyint(1) UNSIGNED ZEROFILL NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '共享设备记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_stream_integration
-- ----------------------------
DROP TABLE IF EXISTS `ez_stream_integration`;
CREATE TABLE `ez_stream_integration`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `module_id` int(10) UNSIGNED NOT NULL COMMENT '设备ID',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '令牌',
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密钥',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流媒体推送密钥' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_tag
-- ----------------------------
DROP TABLE IF EXISTS `ez_tag`;
CREATE TABLE `ez_tag`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tagname',
  `link_id` int(11) NOT NULL COMMENT '作用的对象的ID',
  `x` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除',
  `record_version` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备Tag表，用来给设备绑定多个tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_user
-- ----------------------------
DROP TABLE IF EXISTS `ez_user`;
CREATE TABLE `ez_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址,是一个数字，标记一个PNG图片',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `real_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实名',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `user_type` int(11) NULL DEFAULT NULL COMMENT '用户类型：普通用户【1】，企业用户【2】，VIP用户【3】',
  `status` int(11) NULL DEFAULT NULL COMMENT '账户状态：正常【1】，冻结【2】，过期【3】',
  `user_profile_id` int(11) NOT NULL COMMENT '扩展信息',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登陆时间',
  `last_login_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上次登录IP',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `record_version` int(10) UNSIGNED NOT NULL COMMENT '记录版本',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `ez_user_profile`;
CREATE TABLE `ez_user_profile`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `region` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `area` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `domain` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `personal_remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `certification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qq` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wechat` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户的详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_visual_style_config
-- ----------------------------
DROP TABLE IF EXISTS `ez_visual_style_config`;
CREATE TABLE `ez_visual_style_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '可视化视觉名称',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'UI文本',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '可视化视觉的描述',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '可视化视觉展示效果' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ez_wx_app_config
-- ----------------------------
DROP TABLE IF EXISTS `ez_wx_app_config`;
CREATE TABLE `ez_wx_app_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'EZLINKER授权密钥名称',
  `token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'EZLINKER授权密钥',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `record_version` int(11) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `x` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信小程序密钥配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `SCHED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(6) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
