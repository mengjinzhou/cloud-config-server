/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.33 : Database - jhxtback
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dubbo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dubbo`;

/*Table structure for table `QRTZ_BLOB_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;

CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_BLOB_TRIGGERS` */

/*Table structure for table `QRTZ_CALENDARS` */

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;

CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_CALENDARS` */

/*Table structure for table `QRTZ_CRON_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;

CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_CRON_TRIGGERS` */

/*Table structure for table `QRTZ_FIRED_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;

CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_FIRED_TRIGGERS` */

/*Table structure for table `QRTZ_JOB_DETAILS` */

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;

CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_JOB_DETAILS` */

/*Table structure for table `QRTZ_LOCKS` */

DROP TABLE IF EXISTS `QRTZ_LOCKS`;

CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_LOCKS` */

insert  into `QRTZ_LOCKS`(`SCHED_NAME`,`LOCK_NAME`) values ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS');

/*Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS` */

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;

CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_PAUSED_TRIGGER_GRPS` */

/*Table structure for table `QRTZ_SCHEDULER_STATE` */

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;

CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_SCHEDULER_STATE` */

insert  into `QRTZ_SCHEDULER_STATE`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values ('RenrenScheduler','EDZ-20180614ZRP1531377922867',1531399192709,15000);

/*Table structure for table `QRTZ_SIMPLE_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_SIMPLE_TRIGGERS` */

/*Table structure for table `QRTZ_SIMPROP_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_SIMPROP_TRIGGERS` */

/*Table structure for table `QRTZ_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;

CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_TRIGGERS` */

/*Table structure for table `b_operation_info` */

DROP TABLE IF EXISTS `b_operation_info`;

CREATE TABLE `b_operation_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `userName` varchar(200) DEFAULT NULL COMMENT '用户名',
  `fullName` varchar(200) DEFAULT NULL COMMENT '员工姓名',
  `departmentName` varchar(200) DEFAULT NULL COMMENT '部门名称',
  `departmentId` bigint(20) DEFAULT NULL COMMENT '部门id',
  `modularName` varchar(200) DEFAULT NULL COMMENT '模块名称',
  `ip` varchar(200) DEFAULT NULL COMMENT '登录ip',
  `logingDate` datetime DEFAULT NULL COMMENT '登录时间',
  `functionName` varchar(200) DEFAULT NULL COMMENT '功能',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间（操作时间）',
  `operationState` int(10) DEFAULT NULL COMMENT '操作状态（1操作中,2操作成功,3操作失败,4为操作）',
  `terminal` varchar(200) DEFAULT NULL COMMENT '终端',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

/*Data for the table `b_operation_info` */

/*Table structure for table `back_sys_config` */

DROP TABLE IF EXISTS `back_sys_config`;

CREATE TABLE `back_sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

/*Data for the table `back_sys_config` */

insert  into `back_sys_config`(`id`,`key`,`value`,`status`,`remark`) values (1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'云存储配置信息');

/*Table structure for table `back_sys_department` */

DROP TABLE IF EXISTS `back_sys_department`;

CREATE TABLE `back_sys_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `departmentName` varchar(200) DEFAULT NULL COMMENT '部门名称',
  `departmentLevel` int(10) DEFAULT NULL COMMENT '部门等级',
  `departmentNumber` varchar(100) DEFAULT NULL COMMENT '部门编号',
  `parentId` bigint(20) DEFAULT NULL COMMENT '父级部门id',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `state` tinyint(2) DEFAULT NULL COMMENT '启用状态（1启用,2禁用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='人员部门表';

/*Data for the table `back_sys_department` */

insert  into `back_sys_department`(`id`,`departmentName`,`departmentLevel`,`departmentNumber`,`parentId`,`createTime`,`state`) values (1,'测试部门1',1,'001',0,'2018-07-10 10:38:01',1),(2,'测试部门2',1,'002',0,'2018-07-10 10:38:31',1);

/*Table structure for table `back_sys_log` */

DROP TABLE IF EXISTS `back_sys_log`;

CREATE TABLE `back_sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志';

/*Data for the table `back_sys_log` */

/*Table structure for table `back_sys_menu` */

DROP TABLE IF EXISTS `back_sys_menu`;

CREATE TABLE `back_sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `parentId` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `orderNum` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `state` tinyint(2) DEFAULT NULL COMMENT '状态（1启用,2禁用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

/*Data for the table `back_sys_menu` */

insert  into `back_sys_menu`(`id`,`parentId`,`name`,`url`,`perms`,`type`,`icon`,`orderNum`,`remark`,`state`) values (1,0,'主页接口','1爱迪生','index',0,NULL,1,'1',NULL),(2,0,'工作台（按钮）','2213','workbench',0,NULL,1,'1',NULL),(3,0,'航运头条（按钮）',NULL,'shipHead',0,NULL,2,'0',NULL),(4,0,'信息中心（按钮）',NULL,'messageCenter',0,NULL,3,'0',NULL),(5,0,'船舶管理（按钮）',NULL,'shipManager',0,NULL,4,'0',NULL),(6,0,'船员管理（按钮）',NULL,'shipUserManager',0,NULL,5,'1',NULL),(7,0,'海务管理（按钮）',NULL,'seaManager',0,NULL,6,'1',NULL),(8,0,'企业管理（按钮）',NULL,'buinessManager',0,NULL,7,'1',NULL),(9,0,'设置（按钮）',NULL,'setUp',0,NULL,8,'0',NULL),(10,9,'角色权限（按钮）',NULL,'setUp:userRole',1,NULL,1,'0',NULL),(11,8,'企业信息（按钮）',NULL,'buinessManager:buinessMessage',1,NULL,1,'1',NULL),(12,8,'员工管理（按钮）',NULL,'buinessManager:userManager',1,NULL,2,'0',NULL),(13,8,'申请管理（按钮）',NULL,'buinessManager:applyManager',1,NULL,3,'0',NULL),(14,7,'报文管理（船端）（按钮）',NULL,'seaManager:messageManagerShip',1,NULL,1,'0',NULL),(15,7,'报文管理（岸端）（按钮）',NULL,'seaManager:messageManagerCoast',1,NULL,2,'0',NULL),(16,7,'航次计划（船端）（按钮）',NULL,'seaManager:voyagePlanShip',1,NULL,3,'0',NULL),(17,7,'航次计划（岸端）（按钮）',NULL,'seaManager:voyagePlanCoast',1,NULL,4,'0',NULL),(18,7,'航次命令（船端）（按钮）',NULL,'seaManager:voyageOrderShip',1,NULL,5,'0',NULL),(19,7,'航次命令（岸端）（按钮）',NULL,'seaManager:voyageOrderCoast',1,NULL,6,'0',NULL),(20,6,'船员库（按钮）',NULL,'shipUserManager:shipUserWarehouse',1,NULL,1,NULL,NULL),(21,6,'船员调配（按钮）',NULL,'shipUserMnaager:shipUserdeployment',1,NULL,2,NULL,NULL),(22,5,'船舶库（按钮）',NULL,'shipManager:shipWarehouse',1,NULL,1,NULL,NULL),(23,5,'船舶证书（按钮）',NULL,'shipManager:shipCertificate',1,NULL,2,NULL,NULL),(24,5,'设备管理（按钮）',NULL,'shipManager:deviceManager',1,NULL,3,NULL,NULL),(25,5,'船舶保险（按钮）',NULL,'shpiManager:shipInsurance',1,NULL,4,NULL,NULL),(26,4,'信息中心（按钮）',NULL,'messageCenter:messageCenter',1,NULL,1,NULL,NULL),(27,3,'航运头条（按钮）',NULL,'shipHead:shipHead',1,NULL,1,NULL,NULL),(28,2,'工作台（按钮）',NULL,'workbench:workbench',1,NULL,1,NULL,NULL),(29,10,'查看权限（按钮）',NULL,'setUp:userRole:queryObject',2,NULL,NULL,NULL,NULL),(30,10,'编辑角色（按钮）',NULL,'setUp:userRole:update',2,NULL,NULL,NULL,NULL),(31,10,'修改角色状态（按钮）',NULL,'setUp:userRole:disable',2,NULL,NULL,NULL,NULL),(32,10,'删除角色（按钮）',NULL,'setUp:userRole:delete',2,NULL,NULL,NULL,NULL),(33,10,'新增角色（按钮）',NULL,'setUp:userRole:save',2,NULL,NULL,NULL,NULL),(34,11,'企业信息编辑（按钮）',NULL,'buinessManager:buinessMessage:update',2,NULL,NULL,NULL,NULL),(35,12,'新增员工（按钮）',NULL,'buinessManager:userManager:saveUser',2,NULL,NULL,NULL,NULL),(36,12,'员工管理批量导入（按钮）',NULL,'buinessManager:userManager:batchIn',2,NULL,NULL,NULL,NULL),(37,12,'员工管理批量导出（按钮）',NULL,'buinessManager:userManager:batchOut',2,NULL,NULL,NULL,NULL),(38,12,'员工管理全部导出（按钮）',NULL,'buinessManager:userManager:batchAll',2,NULL,NULL,NULL,NULL),(39,12,'离职员工（按钮）',NULL,'buinessManager:userManager:deleteUser',2,NULL,NULL,NULL,NULL),(40,12,'员工详情',NULL,'buinessManager:userManager:queryUserObject',2,NULL,NULL,NULL,NULL),(41,12,'员工状态（离职，禁用，启用）',NULL,'buinessManager:userManager:disableUser',2,NULL,NULL,NULL,NULL),(42,12,'编辑员工',NULL,'buinessManager:userManager:updateUser',2,NULL,NULL,NULL,NULL),(43,13,'审核审批',NULL,'buinessManager:applyManager:Examine',2,NULL,NULL,NULL,NULL),(45,13,'审核删除',NULL,'buinessManager:applyManager:delete',2,NULL,NULL,NULL,NULL),(46,14,'新增报文（船端）',NULL,'seaManager:messageManagerShip:saveSea',2,NULL,NULL,NULL,NULL),(47,14,'报文管理批量导入（船端）',NULL,'seaManager:messageManagerShip:batchIn',2,NULL,NULL,NULL,NULL),(48,14,'报文管理修改（船端）',NULL,'seaManager:messageManagerShip:update',2,NULL,NULL,NULL,NULL),(49,14,'报文管理全部导出（船端）',NULL,'seaManager:messageManagerShip:batchAll',2,NULL,NULL,NULL,NULL),(50,14,'报文管理删除（船端）',NULL,'seaManager:messageManagerShip:delete',2,NULL,NULL,NULL,NULL),(51,14,'报文管理查看（船端）',NULL,'seaManager:messageManagerShip:queryObject',2,NULL,NULL,NULL,NULL),(52,14,'报文管理发送（船端）',NULL,'seaManager:messageManagerShip:send',2,NULL,NULL,NULL,NULL),(53,15,'报文管理删除（岸端）',NULL,'seaManager:messageManagerCoast:delete',2,NULL,NULL,NULL,NULL),(54,15,'报文管理全部导出（岸端）',NULL,'seaManager:messageManagerCoast:batchAll',2,NULL,NULL,NULL,NULL),(55,15,'报文管理查看（岸端）',NULL,'seaManager:messageManagerCoast:queryObject',2,NULL,NULL,NULL,NULL),(56,16,'航次计划新增（船端）',NULL,'seaManager:voyagePlanShip:save',2,NULL,NULL,NULL,NULL),(57,16,'航次计划批量导出（船端）',NULL,'seaManager:voyagePlanShip:batchOut',2,NULL,NULL,NULL,NULL),(58,15,'航次计划全部导出（船端）',NULL,'seaManager:voyagePlanShip:batchAll',2,NULL,NULL,NULL,NULL),(59,16,'航次计划删除（船端）',NULL,'seaManager:voyagePlanShip:delete',2,NULL,NULL,NULL,NULL),(60,16,'航次计划查看（船端）',NULL,'seaManager:voyagePlanShip:queryObject',2,NULL,NULL,NULL,NULL),(61,16,'航次计划完成（船端）',NULL,'seaManager:voyagePlanShip:complete ',2,NULL,NULL,NULL,NULL),(62,16,'航次计划重新提交（船端）',NULL,'seaManager:voyagePlanShip:againSubmit',2,NULL,NULL,NULL,NULL),(63,16,'航次计划提交（船端）',NULL,'seaManager:voyagePlanShip:submit',2,NULL,NULL,NULL,NULL),(64,16,'航次计划编辑（船端）',NULL,'seaManager:voyagePlanShip:update',2,NULL,NULL,NULL,NULL),(65,17,'航次计划批量导出（岸端）',NULL,'seaManager:voyagePlanCoast:batchOut',2,NULL,NULL,NULL,NULL),(66,17,'航次计划全部导出（岸端）',NULL,'seaManager:voyagePlanCoast:batchAll',2,NULL,NULL,NULL,NULL),(67,17,'航次计划删除（岸端）',NULL,'seaManager:voyagePlanCoast:delete',2,NULL,NULL,NULL,NULL),(68,17,'航次计划查看（岸端）',NULL,'seaManager:voyagePlanCoast:queryObject',2,NULL,NULL,NULL,NULL),(69,17,'航次计划审核（岸端）',NULL,'seaManager:voyagePlanCoast:examine',2,NULL,NULL,NULL,NULL),(70,17,'航次计划重新审核（岸端）',NULL,'seaManager:voyagePlanCoast:aginExamine',2,NULL,NULL,NULL,NULL),(71,18,'航次命令批量导出（船端）',NULL,'seaManager:voyageOrderShip:batchOut',2,NULL,NULL,NULL,NULL),(72,18,'航次命令全部导出（船端）',NULL,'seaManager:voyageOrderShip:batchAll',2,NULL,NULL,NULL,NULL),(73,18,'航次命令删除（船端）',NULL,'seaManager:voyageOrderShip:dell',2,NULL,NULL,NULL,NULL),(74,18,'航次命令查看（船端）',NULL,'seaManager:voyageOrderShip:queryObject',2,NULL,NULL,NULL,NULL),(75,19,'航次命令新增（岸端）',NULL,'seaManager:voyageOrderCoast:save',2,NULL,NULL,NULL,NULL),(76,19,'航次命令批量导出（岸端）',NULL,'seaManager:voyageOrderCoast:batchOut',2,NULL,NULL,NULL,NULL),(77,19,'航次命令全部导出（岸端）',NULL,'seaManager:voyageOrderCoast:batchAll',2,NULL,NULL,NULL,NULL),(78,19,'航次命令删除（岸端）',NULL,'seaManager:voyageOrderCoast:delete',2,NULL,NULL,NULL,NULL),(79,19,'航次命令查看（岸端）',NULL,'seaManager:voyageOrderCoast:queryObject',2,NULL,NULL,NULL,NULL),(80,19,'航次命令发送（岸端）',NULL,'seaManager:voyageOrderCoast:send',2,NULL,NULL,NULL,NULL),(81,19,'航次命令发编辑（岸端）',NULL,'seaManager:voyageOrderCoast:update',2,NULL,NULL,NULL,NULL),(82,20,'船员库新增船员',NULL,'shipUserManager:shipUserWarehouse:save',2,NULL,NULL,NULL,NULL),(83,20,'船员库批量导入',NULL,'shipUserManager:shipUserWarehouse:batchIn',2,NULL,NULL,NULL,NULL),(84,20,'船员库批量导出',NULL,'shipUserManager:shipUserWarehouse:batchOut',2,NULL,NULL,NULL,NULL),(85,20,'船员库全部导出',NULL,'shipUserManager:shipUserWarehouse:batchAll',2,NULL,NULL,NULL,NULL),(86,20,'船员库删除船员',NULL,'shipUserManager:shipUserWarehouse:delete',2,NULL,NULL,NULL,NULL),(87,20,'船员库查看船员',NULL,'shipUserManager:shipUserWarehouse:queryObject',2,NULL,NULL,NULL,NULL),(88,20,'船员库编辑船员',NULL,'shipUserManager:shipUserWarehouse:update',2,NULL,NULL,NULL,NULL),(89,20,'船员库新增船员证书',NULL,'shipUserManager:shipUserWarehouse:saveCertificate',2,NULL,NULL,NULL,NULL),(90,20,'船员库删除船员证书',NULL,'shipUserManager:shipUserWarehouse:deleteCertificate',2,NULL,NULL,NULL,NULL),(91,20,'船员库修改船员证书',NULL,'shipUserManager:shipUserWarehouse:updateCertificate',2,NULL,NULL,NULL,NULL),(92,21,'船员调配上船',NULL,'shipUserMnaager:shipUserdeployment:upShip',2,NULL,NULL,NULL,NULL),(93,21,'船员调配接替',NULL,'shipUserMnaager:shipUserdeployment:replace',2,NULL,NULL,NULL,NULL),(94,21,'船员调配下船',NULL,'shipUserMnaager:shipUserdeployment:onShip',2,NULL,NULL,NULL,NULL),(95,21,'船员调配统计',NULL,'shipUserMnaager:shipUserdeployment:statistics',2,NULL,NULL,NULL,NULL),(96,22,'船舶库新增船舶',NULL,'shipManager:shipWarehouse:save',2,NULL,NULL,NULL,NULL),(97,22,'船舶库批量导入',NULL,'shipManager:shipWarehouse:batchIn',2,NULL,NULL,NULL,NULL),(98,22,'船舶库建造信息查询',NULL,'shipManager:shipBuild:query',2,NULL,NULL,NULL,NULL),(99,22,'船舶库建造信息修改',NULL,'shipManager:shipBuild:update',2,NULL,NULL,NULL,NULL),(100,22,'船舶库删除船舶',NULL,'shipManager:shipWarehouse:delete',2,NULL,NULL,NULL,NULL),(101,22,'船舶库船舶详情',NULL,'shipManager:shipWarehouse:queryObject',2,NULL,NULL,NULL,NULL),(102,22,'船舶库船舶编辑',NULL,'shipManager:shipWarehouse:update',2,NULL,NULL,NULL,NULL),(103,23,'船舶证书新增',NULL,'shipManager:shipCertificate:save',2,NULL,NULL,NULL,NULL),(104,23,'船舶证书批量导入',NULL,'shipManager:shipCertificate:save:batchIn',2,NULL,NULL,NULL,NULL),(105,23,'船舶证书批量导出',NULL,'shipManager:shipCertificate:save:batchOut',2,NULL,NULL,NULL,NULL),(106,23,'船舶证书全部导出',NULL,'shipManager:shipCertificate:save:batchAll',2,NULL,NULL,NULL,NULL),(107,23,'船舶证书删除',NULL,'shipManager:shipCertificate:save:delete',2,NULL,NULL,NULL,NULL),(108,23,'船舶证书查看',NULL,'shipManager:shipCertificate:save:queryObject',2,NULL,NULL,NULL,NULL),(109,23,'船舶证书编辑',NULL,'shipManager:shipCertificate:save:update',2,NULL,NULL,NULL,NULL),(110,24,'船舶设备新增',NULL,'shipManager:deviceManager:save',2,NULL,NULL,NULL,NULL),(111,24,'船舶设备批量导入',NULL,'shipManager:deviceManager:batchIn',2,NULL,NULL,NULL,NULL),(112,24,'船舶设备批量导出',NULL,'shipManager:deviceManager:batchOut',2,NULL,NULL,NULL,NULL),(113,24,'船舶设备全部导出',NULL,'shipManager:deviceManager:batchAll',2,NULL,NULL,NULL,NULL),(114,24,'船舶设备删除',NULL,'shipManager:deviceManager:delete',2,NULL,NULL,NULL,NULL),(115,24,'船舶设备查看',NULL,'shipManager:deviceManager:queryObject',2,NULL,NULL,NULL,NULL),(116,24,'船舶设备编辑',NULL,'shipManager:deviceManager:update',2,NULL,NULL,NULL,NULL),(117,25,'船舶保险新增',NULL,'shipManager:shipInsurance:save',2,NULL,NULL,NULL,NULL),(118,25,'船舶保险批量导入',NULL,'shipManager:shipInsurance:batchIn',2,NULL,NULL,NULL,NULL),(119,25,'船舶保险批量导出',NULL,'shipManager:shipInsurance:batchOut',2,NULL,NULL,NULL,NULL),(120,25,'船舶保险全部导出',NULL,'shipManager:shipInsurance:batchAll',2,NULL,NULL,NULL,NULL),(121,25,'船舶保险删除',NULL,'shipManager:shipInsurance:delete',2,NULL,NULL,NULL,NULL),(122,25,'船舶保险查看',NULL,'shipManager:shipInsurance:queryObject',2,NULL,NULL,NULL,NULL),(123,25,'船舶保险编辑',NULL,'shipManager:shipInsurance:update',2,NULL,NULL,NULL,NULL),(124,0,'我的',NULL,'home',0,NULL,NULL,NULL,NULL),(125,124,'个人信息',NULL,'home:user:queryObject',1,NULL,NULL,NULL,NULL),(126,125,'修改个人信息',NULL,'home:user:updateUser',2,NULL,NULL,NULL,NULL),(127,124,'公司',NULL,'home:buiness',1,NULL,NULL,NULL,NULL),(128,127,'申请加入公司查看公司列表',NULL,'home:buiness:queryList',2,NULL,NULL,NULL,NULL),(129,127,'申请加入公司加入一个公司',NULL,'home:buiness:examine',2,NULL,NULL,NULL,NULL),(130,127,'创建公司',NULL,'home:buiness:save',2,NULL,NULL,NULL,NULL),(131,3,'航运头条详情',NULL,'shipHead:shipHead:queryObject',2,NULL,NULL,NULL,NULL),(132,22,'根据船舶id 查询建造信息接口',NULL,'ship:shipBuild:query',2,NULL,NULL,NULL,NULL),(133,21,'船员调配船员详情接口',NULL,'shipUserMnaager:shipUserdeployment:queryObject',2,NULL,NULL,NULL,NULL);

/*Table structure for table `back_sys_oss` */

DROP TABLE IF EXISTS `back_sys_oss`;

CREATE TABLE `back_sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

/*Data for the table `back_sys_oss` */

/*Table structure for table `back_sys_position` */

DROP TABLE IF EXISTS `back_sys_position`;

CREATE TABLE `back_sys_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `positionName` varchar(200) DEFAULT NULL COMMENT '职位名称',
  `positionLevel` int(10) DEFAULT '1' COMMENT '职位等级',
  `parentId` bigint(20) DEFAULT '0' COMMENT '父级职位id',
  `departmentId` bigint(20) DEFAULT NULL COMMENT '部门id',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `state` tinyint(2) DEFAULT NULL COMMENT '启用状态（1启用,2禁用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='职位表';

/*Data for the table `back_sys_position` */

insert  into `back_sys_position`(`id`,`positionName`,`positionLevel`,`parentId`,`departmentId`,`createTime`,`remark`,`state`) values (1,'测试部门',1,0,1,'2018-07-09 21:05:30','测试部门',1),(2,'测试部门2',2,0,1,'2018-07-09 21:06:18','测试部门2',1);

/*Table structure for table `back_sys_role` */

DROP TABLE IF EXISTS `back_sys_role`;

CREATE TABLE `back_sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `roleName` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `state` tinyint(2) DEFAULT NULL COMMENT '状态（1启用,2禁用）',
  `personSubordinatePerson` tinyint(2) DEFAULT NULL COMMENT '人员数据职位下属（1开启,2未开启）',
  `personMyDepartment` tinyint(2) DEFAULT NULL COMMENT '人员数据本部门（1开启,2未开启）',
  `personSubordinateDepartment` tinyint(2) DEFAULT NULL COMMENT '人员数据下级部门（1开启,2未开启）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COMMENT='角色';

/*Data for the table `back_sys_role` */

insert  into `back_sys_role`(`id`,`roleName`,`remark`,`createTime`,`state`,`personSubordinatePerson`,`personMyDepartment`,`personSubordinateDepartment`) values (1,'用户角色','0','9999-01-30 11:35:14',NULL,NULL,NULL,NULL),(2,'员工角色','0','9999-01-30 11:46:25',NULL,NULL,NULL,NULL),(3,'超级管理员角色','0','9999-03-31 14:06:26',NULL,NULL,NULL,NULL),(4,'船员角色','0','9999-02-04 13:56:12',NULL,NULL,NULL,NULL),(5,'岸管角色','0','9999-02-03 18:14:54',NULL,NULL,NULL,NULL),(8,'海贼王','0','2018-04-11 15:19:22',NULL,NULL,NULL,NULL),(9,'加勒比海盗','1','2018-04-11 15:43:41',NULL,NULL,NULL,NULL),(10,'加勒比海盗','0','2018-04-11 15:44:06',NULL,NULL,NULL,NULL),(14,'蓝箭','1','2018-04-11 15:48:56',NULL,NULL,NULL,NULL),(17,'孙仲谋','0','2018-04-11 18:31:55',NULL,NULL,NULL,NULL),(18,'超级管理员','0','2018-04-11 18:32:49',NULL,NULL,NULL,NULL),(21,'张三丰','0','2018-04-11 19:13:10',NULL,NULL,NULL,NULL),(22,'1213','0','2018-04-11 19:58:10',NULL,NULL,NULL,NULL),(23,'123','0','2018-04-11 20:08:01',NULL,NULL,NULL,NULL),(24,'升水','0','2018-04-11 20:49:31',NULL,NULL,NULL,NULL),(25,'啊啊','0','2018-04-11 20:55:38',NULL,NULL,NULL,NULL),(26,'向下这种','0','2018-04-11 20:56:46',NULL,NULL,NULL,NULL),(27,'吧v','0','2018-04-11 20:58:32',NULL,NULL,NULL,NULL),(28,'吧v1','0','2018-04-11 21:33:28',NULL,NULL,NULL,NULL),(29,'789786','0','2018-04-11 21:36:11',NULL,NULL,NULL,NULL),(30,'VB你','0','2018-04-12 11:12:28',NULL,NULL,NULL,NULL),(31,'玩儿','0','2018-04-12 11:27:07',NULL,NULL,NULL,NULL),(32,'玩儿q','0','2018-04-12 11:30:31',NULL,NULL,NULL,NULL),(33,'建行卡','0','2018-04-12 11:31:29',NULL,NULL,NULL,NULL),(34,'567','0','2018-04-12 11:32:11',NULL,NULL,NULL,NULL),(35,'789789','0','2018-04-12 15:43:34',NULL,NULL,NULL,NULL),(36,'请问','0','2018-04-12 16:20:06',NULL,NULL,NULL,NULL),(37,'许','0','2018-04-12 16:22:49',NULL,NULL,NULL,NULL),(38,'许v','0','2018-04-12 16:26:54',NULL,NULL,NULL,NULL),(39,'许v发的','0','2018-04-12 16:44:10',NULL,NULL,NULL,NULL),(40,'东方新城','0','2018-04-12 16:48:07',NULL,NULL,NULL,NULL),(41,'只需向','0','2018-04-12 16:56:34',NULL,NULL,NULL,NULL),(42,'自行车','0','2018-04-12 17:06:05',NULL,NULL,NULL,NULL),(43,'在线充值','0','2018-04-12 17:07:51',NULL,NULL,NULL,NULL),(44,'VB从','0','2018-04-12 17:09:52',NULL,NULL,NULL,NULL),(45,'就好','0','2018-04-12 17:11:02',NULL,NULL,NULL,NULL),(46,'就好吧v','0','2018-04-12 17:36:13',NULL,NULL,NULL,NULL),(47,'发过火','0','2018-04-12 17:49:10',NULL,NULL,NULL,NULL),(48,'43543','0','2018-04-12 17:50:22',NULL,NULL,NULL,NULL),(49,'小场v场v从V型','0','2018-04-12 18:09:22',NULL,NULL,NULL,NULL),(50,'很健康','0','2018-04-12 18:10:17',NULL,NULL,NULL,NULL),(51,'468','0','2018-04-12 18:11:50',NULL,NULL,NULL,NULL),(52,'想吃','0','2018-04-12 18:12:40',NULL,NULL,NULL,NULL),(53,'请问二十','0','2018-04-12 18:13:30',NULL,NULL,NULL,NULL),(54,'的风格','0','2018-04-12 18:14:19',NULL,NULL,NULL,NULL),(55,'的风格VBv','0','2018-04-12 18:14:42',NULL,NULL,NULL,NULL),(56,'发过的','0','2018-04-12 18:15:10',NULL,NULL,NULL,NULL),(57,'VB','0','2018-04-12 18:15:24',NULL,NULL,NULL,NULL),(58,'吧吧v ','0','2018-04-12 18:15:52',NULL,NULL,NULL,NULL),(59,'啛啛喳喳错','0','2018-04-12 18:17:21',NULL,NULL,NULL,NULL),(60,'，。，。、','0','2018-04-12 18:18:33',NULL,NULL,NULL,NULL),(61,'阿双丰收说的跟','0','2018-04-12 18:20:58',NULL,NULL,NULL,NULL),(62,'不VB吧','0','2018-04-12 18:21:30',NULL,NULL,NULL,NULL),(63,'不VB吧1','0','2018-04-12 18:23:21',NULL,NULL,NULL,NULL),(64,'不VB吧14','0','2018-04-12 18:24:00',NULL,NULL,NULL,NULL),(65,'来吧','0','2018-04-12 18:27:40',NULL,NULL,NULL,NULL),(66,'来吧想','0','2018-04-12 18:29:49',NULL,NULL,NULL,NULL),(67,'来吧想想','0','2018-04-12 18:35:02',NULL,NULL,NULL,NULL),(68,'来吧想想121123','0','2018-04-12 18:37:17',NULL,NULL,NULL,NULL),(69,'灌灌灌灌','0','2018-04-12 18:44:06',NULL,NULL,NULL,NULL),(70,'适当放松','0','2018-04-12 18:49:26',NULL,NULL,NULL,NULL),(71,'擦擦擦','0','2018-04-12 18:51:12',NULL,NULL,NULL,NULL),(72,'想吃在','0','2018-04-12 18:52:00',NULL,NULL,NULL,NULL),(73,'柳钢股份','0','2018-04-12 18:52:13',NULL,NULL,NULL,NULL),(74,'想转成','0','2018-04-12 18:53:43',NULL,NULL,NULL,NULL),(75,'场v吧v从吧v从吧v船舶','0','2018-04-12 18:54:03',NULL,NULL,NULL,NULL),(76,'程序','0','2018-04-12 18:54:17',NULL,NULL,NULL,NULL),(77,'房费放飞付','0','2018-04-12 18:54:48',NULL,NULL,NULL,NULL),(78,'爱谁当谁当','0','2018-04-12 19:17:44',NULL,NULL,NULL,NULL),(79,'小场v程序','0','2018-04-12 19:22:09',NULL,NULL,NULL,NULL),(80,'从VBVB从','0','2018-04-12 19:22:59',NULL,NULL,NULL,NULL),(81,'程序吧v','0','2018-04-12 19:38:32',NULL,NULL,NULL,NULL),(82,'小分队','0','2018-04-12 19:40:56',NULL,NULL,NULL,NULL),(83,'阿萨德','0','2018-04-12 19:57:41',NULL,NULL,NULL,NULL),(84,'水电费','0','2018-04-12 20:09:28',NULL,NULL,NULL,NULL),(85,'支持下','0','2018-04-12 20:10:16',NULL,NULL,NULL,NULL),(86,'船舶','0','2018-04-12 20:15:07',NULL,NULL,NULL,NULL),(87,'硕大的','0','2018-04-12 21:04:21',NULL,NULL,NULL,NULL),(88,'捱三顶五群','0','2018-04-12 21:16:16',NULL,NULL,NULL,NULL),(89,'刚发的','0','2018-04-12 21:16:46',NULL,NULL,NULL,NULL),(90,'是的归属感','0','2018-04-12 21:28:23',NULL,NULL,NULL,NULL),(91,'行行行','0','2018-04-12 21:29:26',NULL,NULL,NULL,NULL),(92,'走走走','0','2018-04-12 21:31:01',NULL,NULL,NULL,NULL),(93,'阿萨德2','0','2018-04-12 21:31:39',NULL,NULL,NULL,NULL),(94,'自行车心脏彩超','0','2018-04-12 21:31:56',NULL,NULL,NULL,NULL),(95,'发过拿个发过火','0','2018-04-12 21:32:13',NULL,NULL,NULL,NULL),(96,'闹不机密','0','2018-04-12 21:32:58',NULL,NULL,NULL,NULL),(97,'自行车新政策','0','2018-04-12 21:33:27',NULL,NULL,NULL,NULL),(98,'小场v徐是cvvv','0','2018-04-12 21:34:06',NULL,NULL,NULL,NULL),(99,'适当放松防守打法','0','2018-04-12 21:35:37',NULL,NULL,NULL,NULL),(100,'阿萨德第三方','0','2018-04-12 21:41:38',NULL,NULL,NULL,NULL),(101,'消除星星','0','2018-04-13 10:23:42',NULL,NULL,NULL,NULL),(102,'规范好好干','0','2018-04-13 10:46:14',NULL,NULL,NULL,NULL),(103,'色弱','0','2018-04-13 10:47:16',NULL,NULL,NULL,NULL),(104,'水电费2','0','2018-04-13 10:48:19',NULL,NULL,NULL,NULL),(105,'人太好','0','2018-04-13 10:49:04',NULL,NULL,NULL,NULL),(106,'挂号费','0','2018-04-13 10:50:03',NULL,NULL,NULL,NULL),(107,'固化剂','0','2018-04-13 10:52:17',NULL,NULL,NULL,NULL),(108,'的温柔','0','2018-04-13 10:56:12',NULL,NULL,NULL,NULL),(109,'ret','0','2018-04-13 11:01:00',NULL,NULL,NULL,NULL),(110,'该犯还犯更换','0','2018-04-13 11:03:45',NULL,NULL,NULL,NULL),(111,'哈哈哈','0','2018-04-13 11:05:43',NULL,NULL,NULL,NULL),(112,'一天','0','2018-04-13 11:05:59',NULL,NULL,NULL,NULL),(113,'秃头','0','2018-04-13 11:06:52',NULL,NULL,NULL,NULL),(114,'字库','0','2018-04-13 11:09:19',NULL,NULL,NULL,NULL),(115,'阿斯顿撒多','0','2018-04-13 11:09:56',NULL,NULL,NULL,NULL),(116,' 更换','0','2018-04-13 11:16:31',NULL,NULL,NULL,NULL),(117,'就辉煌国际','0','2018-04-13 11:17:26',NULL,NULL,NULL,NULL),(118,'额外若无','0','2018-04-13 11:18:04',NULL,NULL,NULL,NULL),(119,'任天野','0','2018-04-13 11:19:29',NULL,NULL,NULL,NULL),(120,'程序吧不止四点是多少 ','0','2018-04-13 11:23:14',NULL,NULL,NULL,NULL),(121,'赶紧换苟富贵','0','2018-04-13 11:23:50',NULL,NULL,NULL,NULL),(122,'自行车新政策想转成','0','2018-04-13 11:38:22',NULL,NULL,NULL,NULL),(123,'更丰富和','0','2018-04-13 11:40:03',NULL,NULL,NULL,NULL),(124,'的舒服舒服','0','2018-04-13 14:15:40',NULL,NULL,NULL,NULL),(125,'水电费水电费','0','2018-04-13 14:17:27',NULL,NULL,NULL,NULL),(126,'硕大的多','0','2018-04-13 14:20:36',NULL,NULL,NULL,NULL),(127,'胜多负少的东方','0','2018-04-13 14:23:34',NULL,NULL,NULL,NULL),(128,'的非官方的','0','2018-04-13 14:25:09',NULL,NULL,NULL,NULL),(129,'地方梵蒂冈','0','2018-04-13 14:29:11',NULL,NULL,NULL,NULL),(130,'戊二醛','0','2018-04-13 14:33:15',NULL,NULL,NULL,NULL),(131,'小程序程序','0','2018-04-13 14:47:25',NULL,NULL,NULL,NULL),(132,'安稳的无大','0','2018-04-13 14:48:28',NULL,NULL,NULL,NULL),(133,'行政村行政村','0','2018-04-13 14:58:21',NULL,NULL,NULL,NULL),(134,'回合肥','0','2018-04-13 15:00:49',NULL,NULL,NULL,NULL),(135,'小端茶倒水','0','2018-04-13 15:01:25',NULL,NULL,NULL,NULL),(136,'自行车新政策在','0','2018-04-13 15:03:57',NULL,NULL,NULL,NULL),(137,'奥术大师','0','2018-04-13 15:06:32',NULL,NULL,NULL,NULL),(138,'人工费的若干','0','2018-04-13 15:07:26',NULL,NULL,NULL,NULL),(139,'sad撒多多','0','2018-04-13 15:09:56',NULL,NULL,NULL,NULL),(140,'是的发生的','0','2018-04-13 15:44:23',NULL,NULL,NULL,NULL),(141,'萨达','0','2018-04-13 15:46:33',NULL,NULL,NULL,NULL),(142,'阿斯蒂芬','0','2018-04-13 16:09:00',NULL,NULL,NULL,NULL),(143,'最小尺寸想转成','0','2018-04-13 16:14:56',NULL,NULL,NULL,NULL),(144,'地方郭德纲','0','2018-04-13 16:18:06',NULL,NULL,NULL,NULL),(145,'地方郭德纲1','0','2018-04-13 16:18:59',NULL,NULL,NULL,NULL),(146,'二分法','0','2018-04-13 16:44:35',NULL,NULL,NULL,NULL),(147,'从场v场v','0','2018-04-13 16:44:53',NULL,NULL,NULL,NULL),(148,'奥术大师多','0','2018-04-13 16:52:02',NULL,NULL,NULL,NULL),(149,'的','0','2018-04-13 17:15:03',NULL,NULL,NULL,NULL),(150,'fee','0','2018-04-13 17:16:17',NULL,NULL,NULL,NULL),(151,'法人','0','2018-04-13 17:17:40',NULL,NULL,NULL,NULL),(152,'带带我','0','2018-04-13 17:21:18',NULL,NULL,NULL,NULL),(153,'纷纷','0','2018-04-13 17:34:36',NULL,NULL,NULL,NULL),(154,'是发是发吃饭饭 ','0','2018-04-13 17:36:45',NULL,NULL,NULL,NULL),(155,'大幅度发放','0','2018-04-13 17:37:57',NULL,NULL,NULL,NULL),(156,'XCVV','0','2018-04-13 17:39:40',NULL,NULL,NULL,NULL),(157,'VF ','0','2018-04-13 17:41:32',NULL,NULL,NULL,NULL),(158,'CDCDC ','0','2018-04-13 17:46:47',NULL,NULL,NULL,NULL),(159,'睡到三点所','0','2018-04-13 17:49:21',NULL,NULL,NULL,NULL),(160,'粉的','0','2018-04-13 17:56:13',NULL,NULL,NULL,NULL),(161,'是发是发吧v ','0','2018-04-13 19:21:34',NULL,NULL,NULL,NULL),(162,'固化剂但是','0','2018-04-13 19:27:02',NULL,NULL,NULL,NULL),(163,'吧VB吧 ','0','2018-04-13 19:28:18',NULL,NULL,NULL,NULL),(164,'少时诵诗书','0','2018-04-13 19:30:05',NULL,NULL,NULL,NULL),(165,'士大夫身份','0','2018-04-13 19:32:55',NULL,NULL,NULL,NULL),(166,'狗肉馆','0','2018-04-13 19:35:50',NULL,NULL,NULL,NULL),(167,'似懂非懂','0','2018-04-13 19:53:14',NULL,NULL,NULL,NULL),(168,'电饭锅电饭锅','0','2018-04-13 19:53:38',NULL,NULL,NULL,NULL),(169,'睡到三点所多','0','2018-04-13 19:54:31',NULL,NULL,NULL,NULL),(170,'睡到三点所多二恶','0','2018-04-13 19:55:25',NULL,NULL,NULL,NULL),(171,'沟沟壑壑共和国','0','2018-04-13 19:55:47',NULL,NULL,NULL,NULL),(172,'考虑考虑就离开','0','2018-04-13 19:59:41',NULL,NULL,NULL,NULL),(173,'发的说法是','0','2018-04-13 20:02:46',NULL,NULL,NULL,NULL),(174,'4534','0','2018-04-13 20:04:20',NULL,NULL,NULL,NULL),(175,'电风扇','0','2018-04-13 20:05:53',NULL,NULL,NULL,NULL),(176,'水电费的水电费','0','2018-04-13 20:08:35',NULL,NULL,NULL,NULL),(177,'是发是方法吃饭','0','2018-04-13 20:10:12',NULL,NULL,NULL,NULL),(178,'进快捷键','0','2018-04-13 20:10:48',NULL,NULL,NULL,NULL),(179,'234234','0','2018-04-13 20:13:37',NULL,NULL,NULL,NULL),(180,'水电费阿萨德','0','2018-04-13 20:15:50',NULL,NULL,NULL,NULL),(181,'买买买','0','2018-04-13 20:16:55',NULL,NULL,NULL,NULL),(182,'回合肥多大','0','2018-04-13 20:18:59',NULL,NULL,NULL,NULL),(183,'版本','0','2018-04-13 20:21:29',NULL,NULL,NULL,NULL),(184,'有一天他','0','2018-04-13 20:22:30',NULL,NULL,NULL,NULL),(185,'4353','0','2018-04-13 20:23:32',NULL,NULL,NULL,NULL),(186,'22','0','2018-04-13 20:23:57',NULL,NULL,NULL,NULL),(187,'99','0','2018-04-13 20:24:17',NULL,NULL,NULL,NULL),(188,'34544543','0','2018-04-13 20:24:38',NULL,NULL,NULL,NULL),(189,'8','0','2018-04-13 20:25:25',NULL,NULL,NULL,NULL),(190,'看看','0','2018-04-13 20:26:30',NULL,NULL,NULL,NULL),(191,'456456','0','2018-04-13 20:29:02',NULL,NULL,NULL,NULL),(192,'跳一跳','0','2018-04-13 20:29:48',NULL,NULL,NULL,NULL),(193,'飞得更高是','0','2018-04-13 20:35:52',NULL,NULL,NULL,NULL),(194,'a','0','2018-04-13 20:45:41',NULL,NULL,NULL,NULL),(195,'s','0','2018-04-13 20:46:29',NULL,NULL,NULL,NULL),(196,'d','0','2018-04-13 20:47:55',NULL,NULL,NULL,NULL),(197,'dfd','0','2018-04-13 20:49:17',NULL,NULL,NULL,NULL),(198,'sdf','0','2018-04-13 20:51:21',NULL,NULL,NULL,NULL),(199,'234324','0','2018-04-13 20:52:00',NULL,NULL,NULL,NULL),(200,'vcb','0','2018-04-13 20:52:46',NULL,NULL,NULL,NULL),(201,'2343244','0','2018-04-13 20:53:31',NULL,NULL,NULL,NULL),(202,'哈哈付付付','0','2018-04-13 20:56:13',NULL,NULL,NULL,NULL),(203,'程序场vV型','0','2018-04-13 20:56:50',NULL,NULL,NULL,NULL),(204,'好吧啊','0','2018-04-13 21:02:06',NULL,NULL,NULL,NULL),(205,'VBVB','0','2018-04-15 10:11:23',NULL,NULL,NULL,NULL),(206,'孤鸿寡鹄','0','2018-04-15 10:17:59',NULL,NULL,NULL,NULL),(207,'孤鸿寡鹄1','0','2018-04-15 10:18:16',NULL,NULL,NULL,NULL),(208,'非公共苟富贵','0','2018-04-15 10:20:44',NULL,NULL,NULL,NULL),(209,'非公共苟富贵2','0','2018-04-15 10:20:57',NULL,NULL,NULL,NULL),(210,'从场v','0','2018-04-15 10:21:54',NULL,NULL,NULL,NULL),(211,'从场v2','0','2018-04-15 10:22:05',NULL,NULL,NULL,NULL),(212,'VBVBVBVBVB','0','2018-04-15 10:24:14',NULL,NULL,NULL,NULL),(214,'走走走2','0','2018-04-15 10:49:03',NULL,NULL,NULL,NULL),(215,'凄凄切切群','0','2018-04-15 11:28:19',NULL,NULL,NULL,NULL),(216,'凄凄切切群3','1','2018-04-15 11:28:39',NULL,NULL,NULL,NULL),(217,'235354','0','2018-04-15 11:33:58',NULL,NULL,NULL,NULL),(218,'定死的','1','2018-04-15 12:35:44',NULL,NULL,NULL,NULL),(220,'场v是场v1111','1','2018-04-15 12:41:59',NULL,NULL,NULL,NULL),(223,'234','0','2018-06-21 16:08:18',NULL,NULL,NULL,NULL),(224,'234332424','0','2018-06-21 16:09:50',NULL,NULL,NULL,NULL);

/*Table structure for table `back_sys_role_menu` */

DROP TABLE IF EXISTS `back_sys_role_menu`;

CREATE TABLE `back_sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menuId` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=973 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

/*Data for the table `back_sys_role_menu` */

/*Table structure for table `back_sys_role_user_data` */

DROP TABLE IF EXISTS `back_sys_role_user_data`;

CREATE TABLE `back_sys_role_user_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `userId` bigint(20) DEFAULT NULL COMMENT '员工id',
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色id',
  `userMessage` varchar(200) DEFAULT NULL COMMENT '员工信息',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限员工角色关联表';

/*Data for the table `back_sys_role_user_data` */

/*Table structure for table `back_sys_user` */

DROP TABLE IF EXISTS `back_sys_user`;

CREATE TABLE `back_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `userAccountNumber` varchar(50) DEFAULT NULL COMMENT '用户账号',
  `name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `fullName` varchar(50) DEFAULT NULL COMMENT '姓名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `weixin` varchar(100) DEFAULT NULL COMMENT '微信账号',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ号码',
  `phone` varchar(100) DEFAULT NULL COMMENT '手机号',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `sex` tinyint(2) DEFAULT NULL COMMENT '性别（0男，1,女）',
  `headPortrait` varchar(200) DEFAULT NULL COMMENT '头像',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态  （1正常，2禁用）',
  `createTime` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`fullName`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='系统用户';

/*Data for the table `back_sys_user` */

insert  into `back_sys_user`(`id`,`userAccountNumber`,`name`,`fullName`,`password`,`salt`,`email`,`weixin`,`qq`,`phone`,`birthday`,`sex`,`headPortrait`,`status`,`createTime`) values (1,'cztAdmin','超级管理员','超级管理员','7f4b35efa264b9ba1e1b72b1afa5fd888ad76e556692be95d23c2b6a4d64e7ff','R4WKDjI82kHqTgijngCz',NULL,NULL,NULL,'123',NULL,NULL,NULL,1,'2018-07-02 20:28:04'),(2,'cztAdmin2','超级管理员2','超级管理员2',NULL,NULL,NULL,NULL,NULL,'456',NULL,NULL,NULL,1,NULL),(3,'cztAdmin3','超级管理员3','超级管理员3',NULL,NULL,NULL,NULL,NULL,'789',NULL,NULL,NULL,1,NULL);

/*Table structure for table `back_sys_user_login_info` */

DROP TABLE IF EXISTS `back_sys_user_login_info`;

CREATE TABLE `back_sys_user_login_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `loginTime` varchar(30) DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(32) DEFAULT NULL COMMENT '登录IP',
  `agent` varchar(512) DEFAULT NULL COMMENT '用户标识',
  `loginSysClient` tinyint(2) DEFAULT '1' COMMENT '登录端(1.app登录 2.pc登录)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=831 DEFAULT CHARSET=utf8mb4 COMMENT='用户登录信息表';

/*Data for the table `back_sys_user_login_info` */

insert  into `back_sys_user_login_info`(`id`,`userId`,`loginTime`,`ip`,`agent`,`loginSysClient`) values (818,1,'2018-07-11 13:47:00','127.0.0.1','PC',NULL),(819,1,'2018-07-11 13:47:48','127.0.0.1','PC',NULL),(829,1,'2018-07-11 15:19:42','127.0.0.1','PC',NULL),(830,1,'2018-07-11 15:29:03','127.0.0.1','PC',NULL);

/*Table structure for table `back_sys_user_position` */

DROP TABLE IF EXISTS `back_sys_user_position`;

CREATE TABLE `back_sys_user_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `userId` bigint(20) DEFAULT NULL COMMENT '员工id',
  `positionId` bigint(20) DEFAULT NULL COMMENT '职位id',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='人员职位表';

/*Data for the table `back_sys_user_position` */

insert  into `back_sys_user_position`(`id`,`userId`,`positionId`,`createTime`) values (1,1,1,'2018-07-10 10:36:43'),(2,2,2,'2018-07-10 10:37:35'),(3,3,1,NULL);

/*Table structure for table `back_sys_user_register_info` */

DROP TABLE IF EXISTS `back_sys_user_register_info`;

CREATE TABLE `back_sys_user_register_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `userName` varchar(50) DEFAULT NULL COMMENT '注册昵称',
  `userPhone` varchar(50) DEFAULT NULL COMMENT '注册手机号',
  `registerTime` datetime DEFAULT NULL COMMENT '注册时间',
  `ip` varchar(32) DEFAULT NULL COMMENT '注册IP',
  `agent` varchar(512) DEFAULT NULL COMMENT '用户标识',
  `registerSysClient` tinyint(2) DEFAULT '1' COMMENT '1注册端(1.app注册 2.pc注册)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='用户注册日志表';

/*Data for the table `back_sys_user_register_info` */

insert  into `back_sys_user_register_info`(`id`,`userId`,`userName`,`userPhone`,`registerTime`,`ip`,`agent`,`registerSysClient`) values (18,26,'孙仲谋','15242354698','2018-04-04 18:58:48','124.205.150.18','1',NULL),(19,27,'17600928620','17600928620','2018-04-04 19:03:25','124.205.150.18','1',NULL),(20,28,'孟金子','15201325696','2018-04-08 15:18:19','124.205.150.18','1',NULL),(21,33,'须弥子','17600928620','2018-04-12 16:16:04','124.205.150.18','1',NULL),(22,34,'少泽哥','18311473625','2018-04-12 16:25:37','124.205.150.18','1',NULL),(23,79,'海洋之灾','15242354698','2018-04-27 20:28:57','124.205.150.18','1',NULL),(24,105,'guanjun','15101543893','2018-05-08 10:29:06','124.205.150.18','1',NULL),(25,134,'真香警告','18211082501','2018-06-15 14:46:39','124.202.193.130','1',NULL),(26,135,'小胖胖','18911611696','2018-06-19 16:29:56','124.202.193.130','1',NULL),(27,136,'老司机','18911611696','2018-06-19 16:53:22','124.202.193.130','1',NULL),(28,137,'车神2','18911611696','2018-06-19 17:07:26','124.202.193.130','1',NULL),(29,139,'Boyce','15910550355','2018-06-25 09:55:32','124.202.193.130','1',NULL);

/*Table structure for table `back_sys_user_role` */

DROP TABLE IF EXISTS `back_sys_user_role`;

CREATE TABLE `back_sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1046 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系表';

/*Data for the table `back_sys_user_role` */

insert  into `back_sys_user_role`(`id`,`userId`,`roleId`) values (163,32,1),(164,32,2),(165,32,3),(166,33,1),(167,33,2),(168,33,3),(185,35,1),(186,35,2),(187,36,1),(188,36,2),(224,39,1),(225,49,1),(226,48,1),(227,47,1),(238,38,1),(239,38,2),(302,61,1),(303,60,1),(304,59,1),(305,58,1),(306,57,1),(310,46,1),(311,50,1),(342,74,1),(343,75,1),(344,76,1),(345,77,1),(346,78,1),(347,64,1),(348,65,1),(349,66,1),(350,67,1),(351,68,1),(352,69,1),(353,70,1),(354,71,1),(355,72,1),(356,73,1),(357,63,1),(358,62,1),(360,54,1),(361,51,1),(362,45,1),(363,44,1),(364,43,1),(365,42,1),(366,41,1),(367,40,1),(368,26,1),(385,86,1),(386,80,1),(387,81,1),(388,82,1),(389,83,1),(390,84,1),(391,85,1),(553,105,1),(566,53,1),(567,56,1),(568,52,1),(569,55,1),(570,104,1),(571,103,1),(572,102,1),(573,101,1),(574,100,1),(575,99,1),(576,93,1),(577,94,1),(578,95,1),(579,96,1),(580,97,1),(581,98,1),(582,89,1),(583,90,1),(584,91,1),(585,88,1),(586,87,1),(587,92,1),(588,43,2),(589,38,2),(590,39,2),(591,41,2),(592,44,2),(593,46,2),(599,108,1),(600,108,2),(601,108,217),(602,108,215),(696,109,1),(697,109,2),(698,109,217),(699,109,5),(700,109,4),(701,109,215),(702,109,212),(709,112,1),(710,112,2),(725,115,1),(726,115,2),(727,115,217),(739,117,1),(740,117,2),(741,117,215),(742,118,1),(743,118,2),(746,106,1),(747,106,2),(748,111,1),(749,111,2),(750,111,217),(751,111,212),(752,111,214),(753,111,4),(754,111,215),(759,119,1),(760,119,2),(794,113,1),(795,113,2),(796,113,214),(797,113,212),(798,110,1),(799,110,2),(800,110,214),(801,110,212),(802,28,1),(803,28,2),(804,28,8),(813,120,1),(814,120,2),(837,122,1),(838,122,2),(849,123,1),(850,123,2),(853,116,1),(854,116,2),(855,116,214),(856,116,215),(867,107,1),(868,107,2),(871,125,1),(872,125,2),(873,126,1),(874,126,2),(875,124,1),(876,124,2),(911,127,1),(912,127,2),(913,121,1),(914,121,2),(1005,128,1),(1006,128,2),(1011,129,1),(1012,129,2),(1013,129,215),(1014,129,214),(1015,130,1),(1016,130,2),(1017,131,1),(1018,131,2),(1019,132,1),(1020,132,2),(1025,114,1),(1026,114,2),(1027,133,1),(1028,133,2),(1029,133,3),(1033,135,1),(1034,136,1),(1035,137,1),(1036,138,1),(1037,138,2),(1038,137,2),(1039,137,2),(1040,79,1),(1041,79,2),(1042,79,3),(1043,134,1),(1044,134,2),(1045,139,1);

/*Table structure for table `back_sys_user_token` */

DROP TABLE IF EXISTS `back_sys_user_token`;

CREATE TABLE `back_sys_user_token` (
  `userId` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expireTime` datetime DEFAULT NULL COMMENT '过期时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token表';

/*Data for the table `back_sys_user_token` */

insert  into `back_sys_user_token`(`userId`,`token`,`expireTime`,`updateTime`) values (1,'927940948bf2e23ea14bb7c6585d08cf','2018-07-12 03:29:03','2018-07-11 15:29:03');

/*Table structure for table `schedule_job` */

DROP TABLE IF EXISTS `schedule_job`;

CREATE TABLE `schedule_job` (
  `jobId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `beanName` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `methodName` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cronExpression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`jobId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='定时任务';

/*Data for the table `schedule_job` */

/*Table structure for table `schedule_job_log` */

DROP TABLE IF EXISTS `schedule_job_log`;

CREATE TABLE `schedule_job_log` (
  `logId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `jobId` bigint(20) NOT NULL COMMENT '任务id',
  `beanName` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `methodName` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`logId`),
  KEY `job_id` (`jobId`)
) ENGINE=InnoDB AUTO_INCREMENT=1838 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

/*Data for the table `schedule_job_log` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
