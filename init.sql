/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : mrbird

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-20 18:34:55
*/


DROP TABLE IF EXISTS QRTZ_FIRED_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_PAUSED_TRIGGER_GRPS;
DROP TABLE IF EXISTS QRTZ_SCHEDULER_STATE;
DROP TABLE IF EXISTS QRTZ_LOCKS;
DROP TABLE IF EXISTS QRTZ_SIMPLE_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_SIMPROP_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_CRON_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_BLOB_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_JOB_DETAILS;
DROP TABLE IF EXISTS QRTZ_CALENDARS;


CREATE TABLE QRTZ_JOB_DETAILS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    JOB_CLASS_NAME   VARCHAR(250) NOT NULL,
    IS_DURABLE VARCHAR(1) NOT NULL,
    IS_NONCONCURRENT VARCHAR(1) NOT NULL,
    IS_UPDATE_DATA VARCHAR(1) NOT NULL,
    REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE QRTZ_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    NEXT_FIRE_TIME BIGINT(13) NULL,
    PREV_FIRE_TIME BIGINT(13) NULL,
    PRIORITY INTEGER NULL,
    TRIGGER_STATE VARCHAR(16) NOT NULL,
    TRIGGER_TYPE VARCHAR(8) NOT NULL,
    START_TIME BIGINT(13) NOT NULL,
    END_TIME BIGINT(13) NULL,
    CALENDAR_NAME VARCHAR(200) NULL,
    MISFIRE_INSTR SMALLINT(2) NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
        REFERENCES QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE QRTZ_SIMPLE_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    REPEAT_COUNT BIGINT(7) NOT NULL,
    REPEAT_INTERVAL BIGINT(12) NOT NULL,
    TIMES_TRIGGERED BIGINT(10) NOT NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_CRON_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    CRON_EXPRESSION VARCHAR(200) NOT NULL,
    TIME_ZONE_ID VARCHAR(80),
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_SIMPROP_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512) NULL,
    STR_PROP_2 VARCHAR(512) NULL,
    STR_PROP_3 VARCHAR(512) NULL,
    INT_PROP_1 INT NULL,
    INT_PROP_2 INT NULL,
    LONG_PROP_1 BIGINT NULL,
    LONG_PROP_2 BIGINT NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR(1) NULL,
    BOOL_PROP_2 VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
    REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_BLOB_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    BLOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_CALENDARS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    CALENDAR_NAME  VARCHAR(200) NOT NULL,
    CALENDAR BLOB NOT NULL,
    PRIMARY KEY (SCHED_NAME,CALENDAR_NAME)
);

CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_GROUP  VARCHAR(200) NOT NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_FIRED_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    ENTRY_ID VARCHAR(95) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    FIRED_TIME BIGINT(13) NOT NULL,
    SCHED_TIME BIGINT(13) NOT NULL,
    PRIORITY INTEGER NOT NULL,
    STATE VARCHAR(16) NOT NULL,
    JOB_NAME VARCHAR(200) NULL,
    JOB_GROUP VARCHAR(200) NULL,
    IS_NONCONCURRENT VARCHAR(1) NULL,
    REQUESTS_RECOVERY VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);

CREATE TABLE QRTZ_SCHEDULER_STATE
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
    CHECKIN_INTERVAL BIGINT(13) NOT NULL,
    PRIMARY KEY (SCHED_NAME,INSTANCE_NAME)
);

CREATE TABLE QRTZ_LOCKS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    LOCK_NAME  VARCHAR(40) NOT NULL,
    PRIMARY KEY (SCHED_NAME,LOCK_NAME)
);


commit;

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `DEPT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` bigint(20) NOT NULL,
  `DEPT_NAME` varchar(100) NOT NULL,
  `ORDER_NUM` bigint(20) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`DEPT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('1', '0', '开发部', null, '2018-01-04 15:42:26');
INSERT INTO `t_dept` VALUES ('2', '1', '开发一部', null, '2018-01-04 15:42:34');
INSERT INTO `t_dept` VALUES ('3', '1', '开发二部', null, '2018-01-04 15:42:29');
INSERT INTO `t_dept` VALUES ('4', '0', '市场部', null, '2018-01-04 15:42:36');
INSERT INTO `t_dept` VALUES ('5', '0', '人事部', null, '2018-01-04 15:42:32');
INSERT INTO `t_dept` VALUES ('6', '0', '测试部', null, '2018-01-04 15:42:38');

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `DICT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `KEYY` bigint(20) NOT NULL,
  `VALUEE` varchar(100) NOT NULL,
  `FIELD_NAME` varchar(100) NOT NULL,
  `TABLE_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`DICT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('1', '0', '男', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES ('2', '1', '女', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES ('3', '2', '保密', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES ('4', '1', '有效', 'status', 't_user');
INSERT INTO `t_dict` VALUES ('5', '0', '锁定', 'status', 't_user');
INSERT INTO `t_dict` VALUES ('6', '0', '菜单', 'type', 't_menu');
INSERT INTO `t_dict` VALUES ('7', '1', '按钮', 'type', 't_menu');
INSERT INTO `t_dict` VALUES ('30', '0', '正常', 'status', 't_job');
INSERT INTO `t_dict` VALUES ('31', '1', '暂停', 'status', 't_job');
INSERT INTO `t_dict` VALUES ('32', '0', '成功', 'status', 't_job_log');
INSERT INTO `t_dict` VALUES ('33', '1', '失败', 'status', 't_job_log');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `JOB_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `BEAN_NAME` varchar(100) NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) DEFAULT NULL COMMENT '参数',
  `CRON_EXPRESSION` varchar(100) NOT NULL COMMENT 'cron表达式',
  `STATUS` char(2) NOT NULL COMMENT '任务状态  0：正常  1：暂停',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES ('1', 'testTask', 'test', 'mrbird', '0/1 * * * * ?', '1', '有参任务调度测试', '2018-02-24 16:26:14');
INSERT INTO `t_job` VALUES ('2', 'testTask', 'test1', null, '0/10 * * * * ?', '1', '无参任务调度测试', '2018-02-24 17:06:23');
INSERT INTO `t_job` VALUES ('3', 'testTask', 'test', 'hello world', '0/1 * * * * ?', '1', '有参任务调度测试,每隔一秒触发', '2018-02-26 09:28:26');
INSERT INTO `t_job` VALUES ('11', 'testTask', 'test2', null, '0/5 * * * * ?', '1', '测试异常', '2018-02-26 11:15:30');

-- ----------------------------
-- Table structure for t_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_job_log`;
CREATE TABLE `t_job_log` (
  `LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `JOB_ID` bigint(20) NOT NULL COMMENT '任务id',
  `BEAN_NAME` varchar(100) NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) DEFAULT NULL COMMENT '参数',
  `STATUS` char(2) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `ERROR` text COMMENT '失败信息',
  `TIMES` decimal(11,0) DEFAULT NULL COMMENT '耗时(单位：毫秒)',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2466 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job_log
-- ----------------------------
INSERT INTO `t_job_log` VALUES ('2447', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:31:49');
INSERT INTO `t_job_log` VALUES ('2448', '3', 'testTask', 'test', 'hello world', '0', null, '0', '2018-03-20 15:31:50');
INSERT INTO `t_job_log` VALUES ('2449', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:31:51');
INSERT INTO `t_job_log` VALUES ('2450', '3', 'testTask', 'test', 'hello world', '0', null, '2', '2018-03-20 15:31:52');
INSERT INTO `t_job_log` VALUES ('2451', '3', 'testTask', 'test', 'hello world', '0', null, '0', '2018-03-20 15:31:53');
INSERT INTO `t_job_log` VALUES ('2452', '3', 'testTask', 'test', 'hello world', '0', null, '2', '2018-03-20 15:31:54');
INSERT INTO `t_job_log` VALUES ('2453', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:31:55');
INSERT INTO `t_job_log` VALUES ('2454', '3', 'testTask', 'test', 'hello world', '0', null, '0', '2018-03-20 15:31:56');
INSERT INTO `t_job_log` VALUES ('2455', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:31:57');
INSERT INTO `t_job_log` VALUES ('2456', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:31:59');
INSERT INTO `t_job_log` VALUES ('2457', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:31:59');
INSERT INTO `t_job_log` VALUES ('2458', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:32:00');
INSERT INTO `t_job_log` VALUES ('2459', '3', 'testTask', 'test', 'hello world', '0', null, '0', '2018-03-20 15:32:01');
INSERT INTO `t_job_log` VALUES ('2460', '3', 'testTask', 'test', 'hello world', '0', null, '5', '2018-03-20 15:32:02');
INSERT INTO `t_job_log` VALUES ('2461', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:32:03');
INSERT INTO `t_job_log` VALUES ('2462', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:32:04');
INSERT INTO `t_job_log` VALUES ('2463', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:32:05');
INSERT INTO `t_job_log` VALUES ('2464', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:32:06');
INSERT INTO `t_job_log` VALUES ('2465', '11', 'testTask', 'test2', null, '1', 'java.lang.NoSuchMethodException: cc.mrbird.job.task.TestTask.test2()', '0', '2018-03-20 15:32:26');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) DEFAULT NULL,
  `OPERATION` text,
  `TIME` decimal(11,0) DEFAULT NULL,
  `METHOD` text,
  `PARAMS` text,
  `IP` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=841 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('730', 'MrBird', '恢复任务', '55', 'cc.mrbird.job.controller.JobController.resumeJob()', 'jobIds: 3', '127.0.0.1', '2018-03-19 10:07:32');
INSERT INTO `t_log` VALUES ('731', 'MrBird', '执行任务', '40', 'cc.mrbird.job.controller.JobController.runJob()', 'jobIds: 3', '127.0.0.1', '2018-03-19 10:07:36');
INSERT INTO `t_log` VALUES ('733', 'MrBird', '暂停任务', '10', 'cc.mrbird.job.controller.JobController.pauseJob()', 'jobIds: 3', '127.0.0.1', '2018-03-19 10:07:53');
INSERT INTO `t_log` VALUES ('734', 'MrBird', '恢复任务', '17', 'cc.mrbird.job.controller.JobController.resumeJob()', 'jobIds: 1', '127.0.0.1', '2018-03-19 10:08:02');
INSERT INTO `t_log` VALUES ('735', 'MrBird', '执行任务', '13', 'cc.mrbird.job.controller.JobController.runJob()', 'jobIds: 1', '127.0.0.1', '2018-03-19 10:08:05');
INSERT INTO `t_log` VALUES ('737', 'MrBird', '暂停任务', '11', 'cc.mrbird.job.controller.JobController.pauseJob()', 'jobIds: 1', '127.0.0.1', '2018-03-19 10:08:27');
INSERT INTO `t_log` VALUES ('738', 'MrBird', '执行任务', '14', 'cc.mrbird.job.controller.JobController.runJob()', 'jobIds: 11', '127.0.0.1', '2018-03-19 10:08:34');
INSERT INTO `t_log` VALUES ('840', 'MrBird', '删除用户', '255', 'cc.mrbird.system.controller.UserController.deleteUsers()', 'ids: 165,166', '127.0.0.1', '2018-03-20 18:34:26');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` bigint(20) NOT NULL,
  `MENU_NAME` varchar(50) NOT NULL,
  `URL` varchar(100) DEFAULT NULL,
  `PERMS` text,
  `ICON` varchar(50) DEFAULT NULL,
  `TYPE` char(2) NOT NULL,
  `ORDER_NUM` bigint(20) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '0', '系统管理', null, null, 'zmdi zmdi-settings', '0', '1', '2017-12-27 16:39:07', null);
INSERT INTO `t_menu` VALUES ('2', '0', '系统监控', null, null, 'zmdi zmdi-shield-security', '0', '2', '2017-12-27 16:45:51', '2018-01-17 17:08:28');
INSERT INTO `t_menu` VALUES ('3', '1', '用户管理', 'user', '', '', '0', '1', '2017-12-27 16:47:13', '2018-03-20 17:45:38');
INSERT INTO `t_menu` VALUES ('4', '1', '角色管理', 'role', null, null, '0', '2', '2017-12-27 16:48:09', null);
INSERT INTO `t_menu` VALUES ('5', '1', '菜单管理', 'menu', null, null, '0', '3', '2017-12-27 16:48:57', null);
INSERT INTO `t_menu` VALUES ('6', '1', '部门管理', 'dept', null, null, '0', '4', '2017-12-27 16:57:33', null);
INSERT INTO `t_menu` VALUES ('8', '2', '在线用户', 'session', null, null, '0', '1', '2017-12-27 16:59:33', null);
INSERT INTO `t_menu` VALUES ('10', '2', '系统日志', 'log', null, null, '0', '3', '2017-12-27 17:00:50', null);
INSERT INTO `t_menu` VALUES ('11', '3', '新增用户', null, 'user:add', null, '1', null, '2017-12-27 17:02:58', null);
INSERT INTO `t_menu` VALUES ('12', '3', '修改用户', null, 'user:update', null, '1', null, '2017-12-27 17:04:07', null);
INSERT INTO `t_menu` VALUES ('13', '3', '删除用户', null, 'user:delete', null, '1', null, '2017-12-27 17:04:58', null);
INSERT INTO `t_menu` VALUES ('14', '4', '新增角色', null, 'role:add', null, '1', null, '2017-12-27 17:06:38', null);
INSERT INTO `t_menu` VALUES ('15', '4', '修改角色', null, 'role:update', null, '1', null, '2017-12-27 17:06:38', null);
INSERT INTO `t_menu` VALUES ('16', '4', '删除角色', null, 'role:delete', null, '1', null, '2017-12-27 17:06:38', null);
INSERT INTO `t_menu` VALUES ('17', '5', '新增菜单', null, 'menu:add', null, '1', null, '2017-12-27 17:08:02', null);
INSERT INTO `t_menu` VALUES ('18', '5', '修改菜单', null, 'menu:update', null, '1', null, '2017-12-27 17:08:02', null);
INSERT INTO `t_menu` VALUES ('19', '5', '删除菜单', null, 'menu:delete', null, '1', null, '2017-12-27 17:08:02', null);
INSERT INTO `t_menu` VALUES ('20', '6', '新增部门', null, 'dept:add', null, '1', null, '2017-12-27 17:09:24', null);
INSERT INTO `t_menu` VALUES ('21', '6', '修改部门', null, 'dept:update', null, '1', null, '2017-12-27 17:09:24', null);
INSERT INTO `t_menu` VALUES ('22', '6', '删除部门', null, 'dept:delete', null, '1', null, '2017-12-27 17:09:24', null);
INSERT INTO `t_menu` VALUES ('23', '8', '踢出用户', null, 'user:kickout', null, '1', null, '2017-12-27 17:11:13', null);
INSERT INTO `t_menu` VALUES ('24', '10', '删除日志', null, 'log:delete', null, '1', null, '2017-12-27 17:11:45', null);
INSERT INTO `t_menu` VALUES ('58', '0', '网络资源', null, null, 'zmdi zmdi-globe-alt', '0', null, '2018-01-12 15:28:48', '2018-01-22 19:49:26');
INSERT INTO `t_menu` VALUES ('59', '58', '天气查询', 'weather', null, null, '0', null, '2018-01-12 15:40:02', null);
INSERT INTO `t_menu` VALUES ('61', '58', '每日一文', 'article', null, null, '0', null, '2018-01-15 17:17:14', null);
INSERT INTO `t_menu` VALUES ('64', '1', '字典管理', 'dict', null, null, '0', null, '2018-01-18 10:38:25', '2018-01-18 18:59:33');
INSERT INTO `t_menu` VALUES ('65', '64', '新增字典', null, 'dict:add', null, '1', null, '2018-01-18 19:10:08', null);
INSERT INTO `t_menu` VALUES ('66', '64', '修改字典', null, 'dict:update', null, '1', null, '2018-01-18 19:10:27', null);
INSERT INTO `t_menu` VALUES ('67', '64', '删除字典', null, 'dict:delete', null, '1', null, '2018-01-18 19:10:47', null);
INSERT INTO `t_menu` VALUES ('81', '58', '影视资讯', null, null, null, '0', null, '2018-01-22 14:12:59', null);
INSERT INTO `t_menu` VALUES ('82', '81', '正在热映', 'movie/hot', null, null, '0', null, '2018-01-22 14:13:47', null);
INSERT INTO `t_menu` VALUES ('83', '81', '即将上映', 'movie/coming', null, null, '0', null, '2018-01-22 14:14:36', null);
INSERT INTO `t_menu` VALUES ('86', '58', 'One 一个', null, null, null, '0', null, '2018-01-26 09:42:41', '2018-01-26 09:43:46');
INSERT INTO `t_menu` VALUES ('87', '86', '绘画', 'one/painting', null, null, '0', null, '2018-01-26 09:47:14', '2018-01-26 09:48:28');
INSERT INTO `t_menu` VALUES ('88', '86', '语文', 'one/yuwen', null, null, '0', null, '2018-01-26 09:47:40', '2018-01-26 09:48:15');
INSERT INTO `t_menu` VALUES ('89', '86', '散文', 'one/essay', null, null, '0', null, '2018-01-26 09:48:05', null);
INSERT INTO `t_menu` VALUES ('101', '0', '任务调度', null, null, 'zmdi zmdi-alarm', '0', null, '2018-02-24 15:52:57', null);
INSERT INTO `t_menu` VALUES ('102', '101', '定时任务', 'job', null, null, '0', null, '2018-02-24 15:53:53', null);
INSERT INTO `t_menu` VALUES ('103', '102', '新增任务', null, 'job:add', null, '1', null, '2018-02-24 15:55:10', null);
INSERT INTO `t_menu` VALUES ('104', '102', '修改任务', null, 'job:update', null, '1', null, '2018-02-24 15:55:53', null);
INSERT INTO `t_menu` VALUES ('105', '102', '删除任务', null, 'job:delete', null, '1', null, '2018-02-24 15:56:18', null);
INSERT INTO `t_menu` VALUES ('106', '102', '暂停任务', null, 'job:pause', null, '1', null, '2018-02-24 15:57:08', null);
INSERT INTO `t_menu` VALUES ('107', '102', '恢复任务', null, 'job:resume', null, '1', null, '2018-02-24 15:58:21', null);
INSERT INTO `t_menu` VALUES ('108', '102', '立即执行任务', null, 'job:run', null, '1', null, '2018-02-24 15:59:45', null);
INSERT INTO `t_menu` VALUES ('109', '101', '调度日志', 'jobLog', null, null, '0', null, '2018-02-24 16:00:45', null);
INSERT INTO `t_menu` VALUES ('110', '109', '删除日志', null, 'jobLog:delete', null, '1', null, '2018-02-24 16:01:21', null);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(100) NOT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '管理员', '管理员', '2017-12-27 16:23:11', '2018-02-24 16:01:45');
INSERT INTO `t_role` VALUES ('2', '测试账号', '测试账号', '2017-12-27 16:25:09', '2018-01-23 09:11:11');
INSERT INTO `t_role` VALUES ('3', '注册账户', '注册账户，只可查看，不可操作', '2017-12-29 16:00:15', '2018-02-24 17:33:45');
INSERT INTO `t_role` VALUES ('23', '用户管理员', '负责用户的增删改操作', '2018-01-09 15:32:41', null);
INSERT INTO `t_role` VALUES ('24', '系统监控员', '可查看系统监控信息，但不可操作', '2018-01-09 15:52:01', '2018-03-07 19:05:33');
INSERT INTO `t_role` VALUES ('25', '用户查看', '查看用户，无相应操作权限', '2018-01-09 15:56:30', null);
INSERT INTO `t_role` VALUES ('63', '影院工作者', '可查看影视信息', '2018-02-06 08:48:28', '2018-03-07 19:05:26');
INSERT INTO `t_role` VALUES ('64', '天气预报员', '可查看天气预报信息', '2018-02-27 08:47:04', null);
INSERT INTO `t_role` VALUES ('65', '文章审核', '文章类', '2018-02-27 08:48:01', '2018-03-13 11:20:34');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `ROLE_ID` bigint(20) NOT NULL,
  `MENU_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('3', '58');
INSERT INTO `t_role_menu` VALUES ('3', '59');
INSERT INTO `t_role_menu` VALUES ('3', '61');
INSERT INTO `t_role_menu` VALUES ('3', '81');
INSERT INTO `t_role_menu` VALUES ('3', '82');
INSERT INTO `t_role_menu` VALUES ('3', '83');
INSERT INTO `t_role_menu` VALUES ('3', '86');
INSERT INTO `t_role_menu` VALUES ('3', '87');
INSERT INTO `t_role_menu` VALUES ('3', '88');
INSERT INTO `t_role_menu` VALUES ('3', '89');
INSERT INTO `t_role_menu` VALUES ('3', '1');
INSERT INTO `t_role_menu` VALUES ('3', '3');
INSERT INTO `t_role_menu` VALUES ('3', '4');
INSERT INTO `t_role_menu` VALUES ('3', '5');
INSERT INTO `t_role_menu` VALUES ('3', '6');
INSERT INTO `t_role_menu` VALUES ('3', '64');
INSERT INTO `t_role_menu` VALUES ('3', '2');
INSERT INTO `t_role_menu` VALUES ('3', '8');
INSERT INTO `t_role_menu` VALUES ('3', '10');
INSERT INTO `t_role_menu` VALUES ('3', '101');
INSERT INTO `t_role_menu` VALUES ('3', '102');
INSERT INTO `t_role_menu` VALUES ('3', '109');
INSERT INTO `t_role_menu` VALUES ('63', '58');
INSERT INTO `t_role_menu` VALUES ('63', '81');
INSERT INTO `t_role_menu` VALUES ('63', '82');
INSERT INTO `t_role_menu` VALUES ('63', '83');
INSERT INTO `t_role_menu` VALUES ('24', '8');
INSERT INTO `t_role_menu` VALUES ('24', '2');
INSERT INTO `t_role_menu` VALUES ('24', '10');
INSERT INTO `t_role_menu` VALUES ('65', '86');
INSERT INTO `t_role_menu` VALUES ('65', '88');
INSERT INTO `t_role_menu` VALUES ('65', '89');
INSERT INTO `t_role_menu` VALUES ('65', '58');
INSERT INTO `t_role_menu` VALUES ('65', '61');
INSERT INTO `t_role_menu` VALUES ('2', '81');
INSERT INTO `t_role_menu` VALUES ('2', '61');
INSERT INTO `t_role_menu` VALUES ('2', '24');
INSERT INTO `t_role_menu` VALUES ('2', '82');
INSERT INTO `t_role_menu` VALUES ('2', '83');
INSERT INTO `t_role_menu` VALUES ('2', '58');
INSERT INTO `t_role_menu` VALUES ('2', '59');
INSERT INTO `t_role_menu` VALUES ('2', '2');
INSERT INTO `t_role_menu` VALUES ('2', '8');
INSERT INTO `t_role_menu` VALUES ('2', '10');
INSERT INTO `t_role_menu` VALUES ('23', '11');
INSERT INTO `t_role_menu` VALUES ('23', '12');
INSERT INTO `t_role_menu` VALUES ('23', '13');
INSERT INTO `t_role_menu` VALUES ('23', '3');
INSERT INTO `t_role_menu` VALUES ('23', '1');
INSERT INTO `t_role_menu` VALUES ('25', '1');
INSERT INTO `t_role_menu` VALUES ('25', '3');
INSERT INTO `t_role_menu` VALUES ('1', '59');
INSERT INTO `t_role_menu` VALUES ('1', '2');
INSERT INTO `t_role_menu` VALUES ('1', '3');
INSERT INTO `t_role_menu` VALUES ('1', '67');
INSERT INTO `t_role_menu` VALUES ('1', '1');
INSERT INTO `t_role_menu` VALUES ('1', '4');
INSERT INTO `t_role_menu` VALUES ('1', '5');
INSERT INTO `t_role_menu` VALUES ('1', '6');
INSERT INTO `t_role_menu` VALUES ('1', '20');
INSERT INTO `t_role_menu` VALUES ('1', '21');
INSERT INTO `t_role_menu` VALUES ('1', '22');
INSERT INTO `t_role_menu` VALUES ('1', '10');
INSERT INTO `t_role_menu` VALUES ('1', '8');
INSERT INTO `t_role_menu` VALUES ('1', '58');
INSERT INTO `t_role_menu` VALUES ('1', '66');
INSERT INTO `t_role_menu` VALUES ('1', '11');
INSERT INTO `t_role_menu` VALUES ('1', '12');
INSERT INTO `t_role_menu` VALUES ('1', '64');
INSERT INTO `t_role_menu` VALUES ('1', '13');
INSERT INTO `t_role_menu` VALUES ('1', '14');
INSERT INTO `t_role_menu` VALUES ('1', '65');
INSERT INTO `t_role_menu` VALUES ('1', '15');
INSERT INTO `t_role_menu` VALUES ('1', '16');
INSERT INTO `t_role_menu` VALUES ('1', '17');
INSERT INTO `t_role_menu` VALUES ('1', '18');
INSERT INTO `t_role_menu` VALUES ('1', '23');
INSERT INTO `t_role_menu` VALUES ('1', '81');
INSERT INTO `t_role_menu` VALUES ('1', '82');
INSERT INTO `t_role_menu` VALUES ('1', '83');
INSERT INTO `t_role_menu` VALUES ('1', '19');
INSERT INTO `t_role_menu` VALUES ('1', '24');
INSERT INTO `t_role_menu` VALUES ('1', '61');
INSERT INTO `t_role_menu` VALUES ('1', '86');
INSERT INTO `t_role_menu` VALUES ('1', '87');
INSERT INTO `t_role_menu` VALUES ('1', '88');
INSERT INTO `t_role_menu` VALUES ('1', '89');
INSERT INTO `t_role_menu` VALUES ('1', '101');
INSERT INTO `t_role_menu` VALUES ('1', '102');
INSERT INTO `t_role_menu` VALUES ('1', '103');
INSERT INTO `t_role_menu` VALUES ('1', '104');
INSERT INTO `t_role_menu` VALUES ('1', '105');
INSERT INTO `t_role_menu` VALUES ('1', '106');
INSERT INTO `t_role_menu` VALUES ('1', '107');
INSERT INTO `t_role_menu` VALUES ('1', '108');
INSERT INTO `t_role_menu` VALUES ('1', '109');
INSERT INTO `t_role_menu` VALUES ('1', '110');
INSERT INTO `t_role_menu` VALUES ('64', '59');
INSERT INTO `t_role_menu` VALUES ('64', '58');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(128) NOT NULL,
  `DEPT_ID` bigint(20) DEFAULT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  `MOBILE` varchar(20) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  `CRATE_TIME` datetime NOT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `LAST_LOGIN_TIME` datetime DEFAULT NULL,
  `SSEX` char(1) DEFAULT NULL,
  `THEME` varchar(10) DEFAULT NULL,
  `AVATAR` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('4', 'MrBird', '42ee25d1e43e9f57119a00d0a39e5250', '2', '852252812@qq.com', '17720888889', '1', '2017-12-27 15:47:19', '2018-03-01 16:07:39', '2018-03-20 18:25:02', '0', 'green', 'default.jpg', '我就是我 颜色不一样的烟火...');
INSERT INTO `t_user` VALUES ('6', 'tester', '243e29429b340192700677d48c09d992', '6', 'tester@qq.com', '13888888888', '1', '2017-12-27 17:35:14', '2018-03-01 16:52:30', '2018-01-23 09:17:27', '1', 'teal', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('23', 'scott', 'ac3af72d9f95161a502fd326865c2f15', '6', 'scott@qq.com', '15134627380', '1', '2017-12-29 16:16:39', '2018-03-01 16:11:33', '2018-03-20 17:59:04', '0', 'blue-grey', 'default.jpg', '我是scott，嗯嗯');
INSERT INTO `t_user` VALUES ('24', 'smith', '228208eafc74e48c44619cc543fc0efe', '3', 'smith@qq.com', '13364754932', '1', '2017-12-29 16:21:31', '2018-02-27 08:48:16', '2018-02-27 08:48:27', '1', 'teal', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('25', 'allen', '83baac97928a113986054efacaeec1d2', '3', 'allen@qq.com', '13427374857', '0', '2017-12-29 16:21:54', '2018-01-17 11:28:16', null, '1', 'indigo', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('26', 'martin', 'b26c9edca9a61016bca1f6fb042e679e', '4', 'martin@qq.com', '15562736678', '1', '2017-12-29 16:22:24', '2018-01-25 09:23:15', '2018-01-25 17:24:50', '1', 'teal', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('27', 'ford', '0448f0dcfd856b0e831842072b532141', '6', 'ford@qq.com', '15599998373', '0', '2017-12-29 16:22:52', '2018-03-13 11:19:56', '2018-03-08 16:31:59', '0', 'cyan', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('41', 'hippo', 'ed08932437f80522619de4b7f87fcdda', '4', 'hq@qq.com', '18067887364', '1', '2017-12-29 19:53:03', '2018-02-06 11:33:22', '2018-02-06 11:37:14', '1', 'teal', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('68', 'kangkang', '9983fe3651aaef335ec77159712009af', '2', 'kangkang@hotmail.com', '18874783892', '1', '2018-01-03 17:23:24', '2018-01-17 11:27:39', null, '0', 'green', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('91', '系统监控员', '7c28d1cd33414ac15832f7be92668b7a', '6', 'xtjk@qq.com', '18088736652', '1', '2018-01-09 15:52:56', null, '2018-01-09 15:53:12', '0', 'cyan', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('92', 'userLook', '815bffb1baa36e14e8b0b5887a853291', '3', 'userlook@163.com', '13455998888', '1', '2018-01-09 15:56:58', '2018-03-20 15:23:58', '2018-03-20 15:24:08', '1', 'indigo', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('125', '卑微的浮萍', 'c1cc7ea10ee9b41fd33f129394480612', '6', 'BWDFP@163.com', '17728872787', '0', '2018-01-17 15:05:15', '2018-01-19 09:20:35', '2018-01-17 15:05:27', '2', 'green', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('161', 'hero', '1ab36105101bab2e665eeeb954ee4aa2', '4', 'hero@qq.com', '13477589012', '0', '2018-02-05 14:54:25', '2018-02-27 14:57:20', null, '0', 'green', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('162', 'beibei', 'b5ce06e87e255d097fb6956f7fb0d8b3', '5', 'beibei@qq.com', '13488873263', '1', '2018-02-24 17:34:14', '2018-03-01 16:11:43', '2018-03-14 11:41:39', '2', 'green', '17e420c250804efe904a09a33796d5a10.jpg', '我是贝贝。');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('27', '3');
INSERT INTO `t_user_role` VALUES ('24', '65');
INSERT INTO `t_user_role` VALUES ('161', '64');
INSERT INTO `t_user_role` VALUES ('4', '1');
INSERT INTO `t_user_role` VALUES ('23', '3');
INSERT INTO `t_user_role` VALUES ('23', '24');
INSERT INTO `t_user_role` VALUES ('23', '25');
INSERT INTO `t_user_role` VALUES ('162', '1');
INSERT INTO `t_user_role` VALUES ('162', '3');
INSERT INTO `t_user_role` VALUES ('26', '3');
INSERT INTO `t_user_role` VALUES ('26', '23');
INSERT INTO `t_user_role` VALUES ('26', '24');
INSERT INTO `t_user_role` VALUES ('68', '1');
INSERT INTO `t_user_role` VALUES ('25', '3');
INSERT INTO `t_user_role` VALUES ('125', '3');
INSERT INTO `t_user_role` VALUES ('91', '24');
INSERT INTO `t_user_role` VALUES ('41', '1');
INSERT INTO `t_user_role` VALUES ('6', '2');
INSERT INTO `t_user_role` VALUES ('92', '25');

ALTER TABLE t_log ADD location VARCHAR (50);
