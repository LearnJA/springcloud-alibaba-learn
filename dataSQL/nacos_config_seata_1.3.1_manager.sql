/*
 Navicat Premium Data Transfer

 Source Server         : MyDB
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : nacos_config_seata_1.3.1_manager

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 11/09/2020 11:48:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (61, 'service.vgroupMapping.tx_mall_group', 'SEATA_GROUP', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2020-09-10 06:44:00', '2020-09-10 06:44:00', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (62, 'service.disableGlobalTransaction', 'SEATA_GROUP', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-10 06:44:00', '2020-09-10 06:44:00', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (63, 'store.mode', 'SEATA_GROUP', 'db', 'd77d5e503ad1439f585ac494268b351b', '2020-09-10 06:44:01', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (64, 'store.db.datasource', 'SEATA_GROUP', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2020-09-10 06:44:01', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (65, 'store.db.dbType', 'SEATA_GROUP', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2020-09-10 06:44:01', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (66, 'store.db.driverClassName', 'SEATA_GROUP', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2020-09-10 06:44:01', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (67, 'store.db.url', 'SEATA_GROUP', 'jdbc:mysql://192.168.10.152:3306/nacos_config_seata_1.3.1_manager', '52f019661aff97a2cfec555d33b902f6', '2020-09-10 06:44:01', '2020-09-10 06:45:18', NULL, '192.168.10.152', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `config_info` VALUES (68, 'store.db.user', 'SEATA_GROUP', 'root', '63a9f0ea7bb98050796b649e85481845', '2020-09-10 06:44:01', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (69, 'store.db.password', 'SEATA_GROUP', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2020-09-10 06:44:01', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (70, 'store.db.minConn', 'SEATA_GROUP', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2020-09-10 06:44:02', '2020-09-10 06:44:02', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (71, 'store.db.maxConn', 'SEATA_GROUP', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-10 06:44:02', '2020-09-10 06:44:02', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (72, 'store.db.globalTable', 'SEATA_GROUP', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2020-09-10 06:44:02', '2020-09-10 06:44:02', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (73, 'store.db.branchTable', 'SEATA_GROUP', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2020-09-10 06:44:02', '2020-09-10 06:44:02', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (74, 'store.db.queryLimit', 'SEATA_GROUP', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-10 06:44:02', '2020-09-10 06:44:02', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (75, 'store.db.lockTable', 'SEATA_GROUP', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2020-09-10 06:44:02', '2020-09-10 06:44:02', NULL, '0:0:0:0:0:0:0:1', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (77, 'consumer-dev.yaml', 'MODULE_GROUP', 'server:\r\n    port: 8803\r\n    servlet:\r\n        context-path: /consumer\r\n\r\nspring:\r\n    cloud:\r\n        discovery:\r\n            server-addr: 192.168.10.152:8848\r\n\r\n# 配置dubbo 服务实现类的扫描基准包\r\ndubbo:\r\n    scan:\r\n        base-package: com.module.controller\r\n    protocol:\r\n        name: dubbo\r\n        prot: -1\r\n    # 配置dubbo服务注册地址\r\n    registry:\r\n        address: nacos://192.168.10.152:8848', '63d8215fb7a9c4ca204cf5f10191f3d7', '2020-09-10 08:30:55', '2020-09-10 08:30:55', NULL, '192.168.10.152', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (78, 'gateway-dev.yaml', 'MODULE_GROUP', 'server:\r\n    port: 8801\r\n    servlet: \r\n        context-path: /\r\n\r\nspring:\r\n    cloud:\r\n        gateway:\r\n            routes:\r\n                - id: consumer_route\r\n                  uri: lb://consumer\r\n                  filters: \r\n                    - MyLog=true\r\n                  predicates:\r\n                    - Path=/consumer/**\r\n                - id: oauth_route\r\n                  uri: lb://oauth\r\n                  filters:\r\n                    - MyLog=true\r\n                  predicates:\r\n                    - Path=/**\r\n    # 允许跨域\r\n    main:\r\n        allow-bean-definition-overriding: true\r\n# 设置白名单\r\nwhite:\r\n    name: /login, /doc.html, /webjars, /swagger-resources, /v2, /register, /logout, /refreshToken, /registerByPhone, /consumer/index, /mobile/category, /mobile/index', 'c399f9095d786fb31de1bc523abed987', '2020-09-11 01:22:38', '2020-09-11 01:22:38', NULL, '192.168.10.152', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (79, 'oauth-dev.yaml', 'MODULE_GROUP', 'server:\r\n    port: 8802\r\n    servlet:\r\n        context-path: /\r\n    \r\n#配置nacos注册中心\r\nspring:\r\n    cloud:\r\n        nacos:\r\n            discovery:\r\n                server-addr: 192.168.10.152:8848\r\n    \r\n    #允许跨域\r\n    main:\r\n        allow-bean-definition-overriding: true\r\n\r\n#配置dubbo相关\r\ndubbo:\r\n    scan:\r\n        base-packages: com.module.controller\r\n    protocol:\r\n        name: dubbo\r\n        port: -1\r\n    registry:\r\n        address: nacos://192.168.10.152:8848', '5b8d3a425567b3e9b73ba2cc68afab71', '2020-09-11 01:33:06', '2020-09-11 01:33:06', NULL, '192.168.10.152', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (80, 'serviceImpl-dev.yaml', 'MODULE_GROUP', 'server:\r\n    port: 8804\r\n\r\n#配置数据源\r\nspring:\r\n    datasource:\r\n        url: jdbc:mysql://192.168.10.152:3306/bakery?allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8&useSSL=true&serverTimezone=GMT%2B8\r\n        username: root\r\n        password: 123456\r\n        driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\n# 配置seata分布式事务解决方案\r\nseata:\r\n    enabled: true\r\n    application-id: ${spring.application.name}\r\n    tx-service-group: tx_mall_group\r\n    # seata服务配置\r\n    config:\r\n        type: nacos\r\n        nacos:\r\n            server-addr: 192.168.10.152:8848\r\n            group: SEATA_GROUP\r\n            namespace: 99efc49b-9697-492b-8a8d-fb4a57629fa4\r\n            username: \"nacos\"\r\n            password: \"nacos\"\r\n\r\n    #seata服务注册到nacos注册中心配置\r\n    registory:\r\n        type: nacos\r\n        application: serverAddr\r\n        server-addr: 192.168.10.152:8848\r\n        namespace: 99efc49b-9697-492b-8a8d-fb4a57629fa4\r\n        username: \"nacos\"\r\n        password: \"nacos\"\r\n\r\n#配置 Dubbo服务相关\r\ndubbo: \r\n    scan:\r\n        base-packages: com.module.service\r\n    protocol:\r\n        name: dubbo\r\n        port: -1\r\n    registry:\r\n        address: nacos://192.168.10.152:8848\r\n\r\n# 配置mybatis相关\r\nmybatis: \r\n    type-aliases-package: com.module.common.entity\r\n    mapper-locations: classoath:mapper/**/*.xml', 'ee1eca84b755ee4b30056e0da9282f48', '2020-09-11 01:58:25', '2020-09-11 01:58:49', NULL, '192.168.10.152', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (82, 'transcational-serviceImpl-dev.yaml', 'MODULE_GROUP', 'server:\r\n    port: 8805\r\n\r\n#配置数据源\r\nspring:\r\n    datasource:\r\n        url: jdbc:mysql://192.168.10.152:3306/bakery?allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8&useSSL=true&serverTimezone=GMT%2B8\r\n        username: root\r\n        password: 123456\r\n        driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\n# 配置seata分布式事务解决方案\r\nseata:\r\n    enabled: true\r\n    application-id: ${spring.application.name}\r\n    tx-service-group: tx_mall_group\r\n    # seata服务配置\r\n    config:\r\n        type: nacos\r\n        nacos:\r\n            server-addr: 192.168.10.152:8848\r\n            group: SEATA_GROUP\r\n            namespace: 99efc49b-9697-492b-8a8d-fb4a57629fa4\r\n            username: \"nacos\"\r\n            password: \"nacos\"\r\n\r\n    #seata服务注册到nacos注册中心配置\r\n    registory:\r\n        type: nacos\r\n        application: serverAddr\r\n        server-addr: 192.168.10.152:8848\r\n        namespace: 99efc49b-9697-492b-8a8d-fb4a57629fa4\r\n        username: \"nacos\"\r\n        password: \"nacos\"\r\n\r\n#配置 Dubbo服务相关\r\ndubbo: \r\n    scan:\r\n        base-packages: com.module.transcational.serverImpl\r\n    protocol:\r\n        name: dubbo\r\n        port: -1\r\n    registry:\r\n        address: nacos://192.168.10.152:8848\r\n\r\n# 配置mybatis相关\r\nmybatis: \r\n    type-aliases-package: com.module.entity\r\n    mapper-locations: classoath:mapper/**/*.xml', 'f049cc4413513014195f03694db36f50', '2020-09-11 02:00:46', '2020-09-11 02:01:06', NULL, '192.168.10.152', '', '99efc49b-9697-492b-8a8d-fb4a57629fa4', 'null', 'null', 'null', 'yaml', 'null');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'service.vgroupMapping.tx_mall_group', 'SEATA_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2020-09-10 14:34:44', '2020-09-10 06:34:45', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 2, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-10 14:34:45', '2020-09-10 06:34:45', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'store.mode', 'SEATA_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2020-09-10 14:34:45', '2020-09-10 06:34:45', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 4, 'store.db.datasource', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2020-09-10 14:34:45', '2020-09-10 06:34:46', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 5, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2020-09-10 14:34:45', '2020-09-10 06:34:46', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 6, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2020-09-10 14:34:45', '2020-09-10 06:34:46', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 7, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://127.0.0.1:3306/nacos_config_seata_manager', '626a6a2d7da498b5c2bc88b2a33415f6', '2020-09-10 14:34:46', '2020-09-10 06:34:46', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 8, 'store.db.user', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2020-09-10 14:34:46', '2020-09-10 06:34:46', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 9, 'store.db.password', 'SEATA_GROUP', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2020-09-10 14:34:46', '2020-09-10 06:34:46', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 10, 'store.db.minConn', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2020-09-10 14:34:46', '2020-09-10 06:34:47', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 11, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-10 14:34:46', '2020-09-10 06:34:47', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 12, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2020-09-10 14:34:46', '2020-09-10 06:34:47', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 13, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2020-09-10 14:34:47', '2020-09-10 06:34:47', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 14, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-10 14:34:47', '2020-09-10 06:34:47', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 15, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2020-09-10 14:34:47', '2020-09-10 06:34:47', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (1, 16, 'service.vgroupMapping.tx_mall_group', 'SEATA_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2020-09-10 14:35:46', '2020-09-10 06:35:47', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (2, 17, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-10 14:35:46', '2020-09-10 06:35:47', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (3, 18, 'store.mode', 'SEATA_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2020-09-10 14:35:46', '2020-09-10 06:35:47', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (4, 19, 'store.db.datasource', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2020-09-10 14:35:46', '2020-09-10 06:35:47', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (5, 20, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2020-09-10 14:35:46', '2020-09-10 06:35:47', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (6, 21, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2020-09-10 14:35:46', '2020-09-10 06:35:47', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (7, 22, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://127.0.0.1:3306/nacos_config_seata_manager', '626a6a2d7da498b5c2bc88b2a33415f6', '2020-09-10 14:35:46', '2020-09-10 06:35:47', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (8, 23, 'store.db.user', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2020-09-10 14:35:46', '2020-09-10 06:35:47', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (9, 24, 'store.db.password', 'SEATA_GROUP', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2020-09-10 14:35:46', '2020-09-10 06:35:47', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (10, 25, 'store.db.minConn', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2020-09-10 14:35:46', '2020-09-10 06:35:47', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (11, 26, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-10 14:35:51', '2020-09-10 06:35:52', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (12, 27, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2020-09-10 14:35:51', '2020-09-10 06:35:52', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (13, 28, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2020-09-10 14:35:51', '2020-09-10 06:35:52', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (14, 29, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-10 14:35:51', '2020-09-10 06:35:52', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (15, 30, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2020-09-10 14:35:51', '2020-09-10 06:35:52', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 31, 'service.vgroupMapping.tx_mall_group', 'SEATA_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2020-09-10 14:36:49', '2020-09-10 06:36:50', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 32, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-10 14:36:50', '2020-09-10 06:36:50', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 33, 'store.mode', 'SEATA_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2020-09-10 14:36:50', '2020-09-10 06:36:50', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 34, 'store.db.datasource', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2020-09-10 14:36:50', '2020-09-10 06:36:51', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 35, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2020-09-10 14:36:50', '2020-09-10 06:36:51', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 36, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2020-09-10 14:36:50', '2020-09-10 06:36:51', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 37, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://127.0.0.1:3306/nacos_config_seata_manager', '626a6a2d7da498b5c2bc88b2a33415f6', '2020-09-10 14:36:50', '2020-09-10 06:36:51', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 38, 'store.db.user', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2020-09-10 14:36:51', '2020-09-10 06:36:51', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 39, 'store.db.password', 'SEATA_GROUP', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2020-09-10 14:36:51', '2020-09-10 06:36:51', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 40, 'store.db.minConn', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2020-09-10 14:36:51', '2020-09-10 06:36:51', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 41, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-10 14:36:51', '2020-09-10 06:36:52', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 42, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2020-09-10 14:36:51', '2020-09-10 06:36:52', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 43, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2020-09-10 14:36:51', '2020-09-10 06:36:52', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 44, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-10 14:36:52', '2020-09-10 06:36:52', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 45, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2020-09-10 14:36:52', '2020-09-10 06:36:52', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (16, 46, 'service.vgroupMapping.tx_mall_group', 'SEATA_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2020-09-10 14:38:13', '2020-09-10 06:38:13', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (17, 47, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-10 14:38:13', '2020-09-10 06:38:13', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (18, 48, 'store.mode', 'SEATA_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2020-09-10 14:38:13', '2020-09-10 06:38:13', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (19, 49, 'store.db.datasource', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2020-09-10 14:38:13', '2020-09-10 06:38:13', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (20, 50, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2020-09-10 14:38:13', '2020-09-10 06:38:13', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (21, 51, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2020-09-10 14:38:13', '2020-09-10 06:38:13', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (22, 52, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://127.0.0.1:3306/nacos_config_seata_manager', '626a6a2d7da498b5c2bc88b2a33415f6', '2020-09-10 14:38:13', '2020-09-10 06:38:13', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (23, 53, 'store.db.user', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2020-09-10 14:38:13', '2020-09-10 06:38:13', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (24, 54, 'store.db.password', 'SEATA_GROUP', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2020-09-10 14:38:13', '2020-09-10 06:38:13', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (25, 55, 'store.db.minConn', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2020-09-10 14:38:13', '2020-09-10 06:38:13', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (26, 56, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-10 14:38:18', '2020-09-10 06:38:18', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (27, 57, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2020-09-10 14:38:18', '2020-09-10 06:38:18', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (28, 58, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2020-09-10 14:38:18', '2020-09-10 06:38:18', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (29, 59, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-10 14:38:18', '2020-09-10 06:38:18', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (30, 60, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2020-09-10 14:38:18', '2020-09-10 06:38:18', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 61, 'service.vgroupMapping.tx_mall_group', 'SEATA_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2020-09-10 14:39:48', '2020-09-10 06:39:48', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 62, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-10 14:39:48', '2020-09-10 06:39:49', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 63, 'store.mode', 'SEATA_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2020-09-10 14:39:48', '2020-09-10 06:39:49', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 64, 'store.db.datasource', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2020-09-10 14:39:49', '2020-09-10 06:39:49', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 65, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2020-09-10 14:39:49', '2020-09-10 06:39:49', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 66, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2020-09-10 14:39:49', '2020-09-10 06:39:49', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 67, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://127.0.0.1:3306/nacos_config_seata_manager', '626a6a2d7da498b5c2bc88b2a33415f6', '2020-09-10 14:39:49', '2020-09-10 06:39:50', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 68, 'store.db.user', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2020-09-10 14:39:49', '2020-09-10 06:39:50', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 69, 'store.db.password', 'SEATA_GROUP', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2020-09-10 14:39:49', '2020-09-10 06:39:50', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 70, 'store.db.minConn', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2020-09-10 14:39:50', '2020-09-10 06:39:50', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 71, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-10 14:39:50', '2020-09-10 06:39:50', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 72, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2020-09-10 14:39:50', '2020-09-10 06:39:50', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 73, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2020-09-10 14:39:50', '2020-09-10 06:39:51', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 74, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-10 14:39:50', '2020-09-10 06:39:51', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 75, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2020-09-10 14:39:50', '2020-09-10 06:39:51', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (31, 76, 'service.vgroupMapping.tx_mall_group', 'SEATA_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2020-09-10 14:41:17', '2020-09-10 06:41:17', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (32, 77, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-10 14:41:17', '2020-09-10 06:41:17', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (33, 78, 'store.mode', 'SEATA_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2020-09-10 14:41:17', '2020-09-10 06:41:17', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (34, 79, 'store.db.datasource', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2020-09-10 14:41:17', '2020-09-10 06:41:17', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (35, 80, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2020-09-10 14:41:17', '2020-09-10 06:41:17', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (36, 81, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2020-09-10 14:41:17', '2020-09-10 06:41:17', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (37, 82, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://127.0.0.1:3306/nacos_config_seata_manager', '626a6a2d7da498b5c2bc88b2a33415f6', '2020-09-10 14:41:17', '2020-09-10 06:41:17', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (38, 83, 'store.db.user', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2020-09-10 14:41:17', '2020-09-10 06:41:17', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (39, 84, 'store.db.password', 'SEATA_GROUP', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2020-09-10 14:41:17', '2020-09-10 06:41:17', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (40, 85, 'store.db.minConn', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2020-09-10 14:41:17', '2020-09-10 06:41:17', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (41, 86, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-10 14:41:21', '2020-09-10 06:41:21', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (42, 87, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2020-09-10 14:41:21', '2020-09-10 06:41:21', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (43, 88, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2020-09-10 14:41:21', '2020-09-10 06:41:21', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (44, 89, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-10 14:41:21', '2020-09-10 06:41:21', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (45, 90, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2020-09-10 14:41:21', '2020-09-10 06:41:21', NULL, '192.168.10.152', 'D', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 91, 'service.vgroupMapping.tx_mall_group', 'SEATA_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2020-09-10 14:41:32', '2020-09-10 06:41:33', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 92, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-10 14:41:33', '2020-09-10 06:41:33', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 93, 'store.mode', 'SEATA_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2020-09-10 14:41:33', '2020-09-10 06:41:33', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 94, 'store.db.datasource', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2020-09-10 14:41:33', '2020-09-10 06:41:34', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 95, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2020-09-10 14:41:33', '2020-09-10 06:41:34', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 96, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2020-09-10 14:41:33', '2020-09-10 06:41:34', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 97, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://192.168.10.152:3306/nacos_config_seata1.3.1_manager', '4932a26654ccfcd3d5fc490aa168f997', '2020-09-10 14:41:34', '2020-09-10 06:41:34', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 98, 'store.db.user', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2020-09-10 14:41:34', '2020-09-10 06:41:34', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 99, 'store.db.password', 'SEATA_GROUP', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2020-09-10 14:41:34', '2020-09-10 06:41:34', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 100, 'store.db.minConn', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2020-09-10 14:41:34', '2020-09-10 06:41:34', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 101, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-10 14:41:34', '2020-09-10 06:41:35', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 102, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2020-09-10 14:41:34', '2020-09-10 06:41:35', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 103, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2020-09-10 14:41:34', '2020-09-10 06:41:35', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 104, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-10 14:41:35', '2020-09-10 06:41:35', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 105, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2020-09-10 14:41:35', '2020-09-10 06:41:35', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (46, 106, 'service.vgroupMapping.tx_mall_group', 'SEATA_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2020-09-10 14:42:15', '2020-09-10 06:42:16', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (47, 107, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-10 14:42:15', '2020-09-10 06:42:16', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (48, 108, 'store.mode', 'SEATA_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2020-09-10 14:42:15', '2020-09-10 06:42:16', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (49, 109, 'store.db.datasource', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2020-09-10 14:42:15', '2020-09-10 06:42:16', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (50, 110, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2020-09-10 14:42:15', '2020-09-10 06:42:16', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (51, 111, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2020-09-10 14:42:15', '2020-09-10 06:42:16', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (52, 112, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://192.168.10.152:3306/nacos_config_seata1.3.1_manager', '4932a26654ccfcd3d5fc490aa168f997', '2020-09-10 14:42:15', '2020-09-10 06:42:16', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (53, 113, 'store.db.user', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2020-09-10 14:42:15', '2020-09-10 06:42:16', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (54, 114, 'store.db.password', 'SEATA_GROUP', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2020-09-10 14:42:15', '2020-09-10 06:42:16', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (55, 115, 'store.db.minConn', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2020-09-10 14:42:15', '2020-09-10 06:42:16', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (56, 116, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-10 14:42:19', '2020-09-10 06:42:20', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (57, 117, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2020-09-10 14:42:19', '2020-09-10 06:42:20', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (58, 118, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2020-09-10 14:42:19', '2020-09-10 06:42:20', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (59, 119, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-10 14:42:19', '2020-09-10 06:42:20', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (60, 120, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2020-09-10 14:42:19', '2020-09-10 06:42:20', NULL, '192.168.10.152', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 121, 'service.vgroupMapping.tx_mall_group', 'SEATA_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2020-09-10 14:44:00', '2020-09-10 06:44:00', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 122, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-10 14:44:00', '2020-09-10 06:44:00', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 123, 'store.mode', 'SEATA_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2020-09-10 14:44:00', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 124, 'store.db.datasource', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2020-09-10 14:44:00', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 125, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2020-09-10 14:44:00', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 126, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2020-09-10 14:44:00', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 127, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://192.168.10.152:3306/nacos_config_seata1.3.1_manager', '4932a26654ccfcd3d5fc490aa168f997', '2020-09-10 14:44:01', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 128, 'store.db.user', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2020-09-10 14:44:01', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 129, 'store.db.password', 'SEATA_GROUP', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2020-09-10 14:44:01', '2020-09-10 06:44:01', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 130, 'store.db.minConn', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2020-09-10 14:44:01', '2020-09-10 06:44:02', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 131, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-10 14:44:01', '2020-09-10 06:44:02', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 132, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2020-09-10 14:44:01', '2020-09-10 06:44:02', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 133, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2020-09-10 14:44:01', '2020-09-10 06:44:02', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 134, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-10 14:44:02', '2020-09-10 06:44:02', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 135, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2020-09-10 14:44:02', '2020-09-10 06:44:02', NULL, '0:0:0:0:0:0:0:1', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (67, 136, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://192.168.10.152:3306/nacos_config_seata1.3.1_manager', '4932a26654ccfcd3d5fc490aa168f997', '2020-09-10 14:45:18', '2020-09-10 06:45:18', NULL, '192.168.10.152', 'U', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 137, 'consumer-dev.yaml', 'MODULE_GROUP', '', 'server:\r\n    port: 8803\r\n    servlet:\r\n        context-path: /consumer\r\n\r\nspring:\r\n    cloud:\r\n        discovery:\r\n            server-addr: 192.168.10.152:8848\r\n\r\n# 配置dubbo 服务实现类的扫描基准包\r\ndubbo:\r\n    scan:\r\n        base-package: com.module.controller\r\n    protocol:\r\n        name: dubbo\r\n        prot: -1\r\n    # 配置dubbo服务注册地址\r\n    registry:\r\n        address: nacos://192.168.10.152:8848', '63d8215fb7a9c4ca204cf5f10191f3d7', '2020-09-10 16:30:54', '2020-09-10 08:30:55', NULL, '192.168.10.152', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 138, 'gateway-dev.yaml', 'MODULE_GROUP', '', 'server:\r\n    port: 8801\r\n    servlet: \r\n        context-path: /\r\n\r\nspring:\r\n    cloud:\r\n        gateway:\r\n            routes:\r\n                - id: consumer_route\r\n                  uri: lb://consumer\r\n                  filters: \r\n                    - MyLog=true\r\n                  predicates:\r\n                    - Path=/consumer/**\r\n                - id: oauth_route\r\n                  uri: lb://oauth\r\n                  filters:\r\n                    - MyLog=true\r\n                  predicates:\r\n                    - Path=/**\r\n    # 允许跨域\r\n    main:\r\n        allow-bean-definition-overriding: true\r\n# 设置白名单\r\nwhite:\r\n    name: /login, /doc.html, /webjars, /swagger-resources, /v2, /register, /logout, /refreshToken, /registerByPhone, /consumer/index, /mobile/category, /mobile/index', 'c399f9095d786fb31de1bc523abed987', '2020-09-11 09:22:38', '2020-09-11 01:22:38', NULL, '192.168.10.152', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 139, 'oauth-dev.yaml', 'MODULE_GROUP', '', 'server:\r\n    port: 8802\r\n    servlet:\r\n        context-path: /\r\n    \r\n#配置nacos注册中心\r\nspring:\r\n    cloud:\r\n        nacos:\r\n            discovery:\r\n                server-addr: 192.168.10.152:8848\r\n    \r\n    #允许跨域\r\n    main:\r\n        allow-bean-definition-overriding: true\r\n\r\n#配置dubbo相关\r\ndubbo:\r\n    scan:\r\n        base-packages: com.module.controller\r\n    protocol:\r\n        name: dubbo\r\n        port: -1\r\n    registry:\r\n        address: nacos://192.168.10.152:8848', '5b8d3a425567b3e9b73ba2cc68afab71', '2020-09-11 09:33:06', '2020-09-11 01:33:06', NULL, '192.168.10.152', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 140, 'serviceImpl-dev.yaml', 'MODULE_GROUP', '', 'server:\r\n    port: 8804\r\n\r\n#配置数据源\r\nspring:\r\n    datasource:\r\n        url: jdbc:mysql://192.168.10.152:3306/bakery?allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8&useSSL=true&serverTimezone=GMT%2B8\r\n        username: root\r\n        password: 123456\r\n        driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\n# 配置seata分布式事务解决方案\r\nseata:\r\n    enabled: true\r\n    application-id: ${spring.application.name}\r\n    tx-service-group: tx_mall_group\r\n    # seata服务配置\r\n    config:\r\n        type: nacos\r\n        nacos:\r\n            server-addr: 192.168.10.152:8848\r\n            group: SEATA_GROUP\r\n            namespace: myself\r\n            username: \"nacos\"\r\n            password: \"nacos\"\r\n\r\n    #seata服务注册到nacos注册中心配置\r\n    registory:\r\n        type: nacos\r\n        application: serverAddr\r\n        server-addr: 192.168.10.152:8848\r\n        namespace: myself\r\n        username: \"nacos\"\r\n        password: \"nacos\"\r\n\r\n#配置 Dubbo服务相关\r\ndubbo: \r\n    scan:\r\n        base-packages: com.module.service\r\n    protocol:\r\n        name: dubbo\r\n        port: -1\r\n    registry:\r\n        address: nacos://192.168.10.152:8848\r\n\r\n# 配置mybatis相关\r\nmybatis: \r\n    type-aliases-package: com.module.common.entity\r\n    mapper-locations: classoath:mapper/**/*.xml', 'a40564b7778c8e3166f8765481064c52', '2020-09-11 09:58:24', '2020-09-11 01:58:25', NULL, '192.168.10.152', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (80, 141, 'serviceImpl-dev.yaml', 'MODULE_GROUP', '', 'server:\r\n    port: 8804\r\n\r\n#配置数据源\r\nspring:\r\n    datasource:\r\n        url: jdbc:mysql://192.168.10.152:3306/bakery?allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8&useSSL=true&serverTimezone=GMT%2B8\r\n        username: root\r\n        password: 123456\r\n        driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\n# 配置seata分布式事务解决方案\r\nseata:\r\n    enabled: true\r\n    application-id: ${spring.application.name}\r\n    tx-service-group: tx_mall_group\r\n    # seata服务配置\r\n    config:\r\n        type: nacos\r\n        nacos:\r\n            server-addr: 192.168.10.152:8848\r\n            group: SEATA_GROUP\r\n            namespace: myself\r\n            username: \"nacos\"\r\n            password: \"nacos\"\r\n\r\n    #seata服务注册到nacos注册中心配置\r\n    registory:\r\n        type: nacos\r\n        application: serverAddr\r\n        server-addr: 192.168.10.152:8848\r\n        namespace: myself\r\n        username: \"nacos\"\r\n        password: \"nacos\"\r\n\r\n#配置 Dubbo服务相关\r\ndubbo: \r\n    scan:\r\n        base-packages: com.module.service\r\n    protocol:\r\n        name: dubbo\r\n        port: -1\r\n    registry:\r\n        address: nacos://192.168.10.152:8848\r\n\r\n# 配置mybatis相关\r\nmybatis: \r\n    type-aliases-package: com.module.common.entity\r\n    mapper-locations: classoath:mapper/**/*.xml', 'a40564b7778c8e3166f8765481064c52', '2020-09-11 09:58:49', '2020-09-11 01:58:49', NULL, '192.168.10.152', 'U', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (0, 142, 'transcational-serviceImpl-dev.yaml', 'MODULE_GROUP', '', 'server:\r\n    port: 8805\r\n\r\n#配置数据源\r\nspring:\r\n    datasource:\r\n        url: jdbc:mysql://192.168.10.152:3306/bakery?allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8&useSSL=true&serverTimezone=GMT%2B8\r\n        username: root\r\n        password: 123456\r\n        driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\n# 配置seata分布式事务解决方案\r\nseata:\r\n    enabled: true\r\n    application-id: ${spring.application.name}\r\n    tx-service-group: tx_mall_group\r\n    # seata服务配置\r\n    config:\r\n        type: nacos\r\n        nacos:\r\n            server-addr: 192.168.10.152:8848\r\n            group: SEATA_GROUP\r\n            namespace: myself\r\n            username: \"nacos\"\r\n            password: \"nacos\"\r\n\r\n    #seata服务注册到nacos注册中心配置\r\n    registory:\r\n        type: nacos\r\n        application: serverAddr\r\n        server-addr: 192.168.10.152:8848\r\n        namespace: myself\r\n        username: \"nacos\"\r\n        password: \"nacos\"\r\n\r\n#配置 Dubbo服务相关\r\ndubbo: \r\n    scan:\r\n        base-packages: com.module.transcational.serverImpl\r\n    protocol:\r\n        name: dubbo\r\n        port: -1\r\n    registry:\r\n        address: nacos://192.168.10.152:8848\r\n\r\n# 配置mybatis相关\r\nmybatis: \r\n    type-aliases-package: com.module.entity\r\n    mapper-locations: classoath:mapper/**/*.xml', 'c454f4b881a76c5b4099aba6b3bf3b9f', '2020-09-11 10:00:46', '2020-09-11 02:00:46', NULL, '192.168.10.152', 'I', '99efc49b-9697-492b-8a8d-fb4a57629fa4');
INSERT INTO `his_config_info` VALUES (82, 143, 'transcational-serviceImpl-dev.yaml', 'MODULE_GROUP', '', 'server:\r\n    port: 8805\r\n\r\n#配置数据源\r\nspring:\r\n    datasource:\r\n        url: jdbc:mysql://192.168.10.152:3306/bakery?allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8&useSSL=true&serverTimezone=GMT%2B8\r\n        username: root\r\n        password: 123456\r\n        driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\n# 配置seata分布式事务解决方案\r\nseata:\r\n    enabled: true\r\n    application-id: ${spring.application.name}\r\n    tx-service-group: tx_mall_group\r\n    # seata服务配置\r\n    config:\r\n        type: nacos\r\n        nacos:\r\n            server-addr: 192.168.10.152:8848\r\n            group: SEATA_GROUP\r\n            namespace: myself\r\n            username: \"nacos\"\r\n            password: \"nacos\"\r\n\r\n    #seata服务注册到nacos注册中心配置\r\n    registory:\r\n        type: nacos\r\n        application: serverAddr\r\n        server-addr: 192.168.10.152:8848\r\n        namespace: myself\r\n        username: \"nacos\"\r\n        password: \"nacos\"\r\n\r\n#配置 Dubbo服务相关\r\ndubbo: \r\n    scan:\r\n        base-packages: com.module.transcational.serverImpl\r\n    protocol:\r\n        name: dubbo\r\n        port: -1\r\n    registry:\r\n        address: nacos://192.168.10.152:8848\r\n\r\n# 配置mybatis相关\r\nmybatis: \r\n    type-aliases-package: com.module.entity\r\n    mapper-locations: classoath:mapper/**/*.xml', 'c454f4b881a76c5b4099aba6b3bf3b9f', '2020-09-11 10:01:05', '2020-09-11 02:01:06', NULL, '192.168.10.152', 'U', '99efc49b-9697-492b-8a8d-fb4a57629fa4');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '99efc49b-9697-492b-8a8d-fb4a57629fa4', 'myself', '自己', 'nacos', 1599706204147, 1599706204147);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
