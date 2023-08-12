/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 5.5.27 : Database - ifr170205
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `frm_online` */

CREATE TABLE `frm_online` (
  `id` char(36) NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `loginName` varchar(100) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `frm_online` */

insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('43f48cab-b2d1-414e-94d9-ac32857299dd','本地','admin','0','2017-02-24 14:42:42');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('483e808a-d0d4-467e-90d8-356a39a5212a','本地','admin','1','2017-02-23 20:44:29');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('5f431ac7-d540-492d-91da-fab7aca2ea08','本地','admin','1','2017-02-23 16:51:09');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('5f5ceafa-a561-4afb-8a6a-d55ad45575ad','本地','admin','1','2017-02-24 06:44:15');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('658e06a8-b693-4c7c-9cae-f3947396a271','本地','admin','1','2017-02-23 20:28:41');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('66acbe2d-ce2d-4c71-8e51-42c4ec7dfa5c','本地','admin','1','2017-02-23 21:37:22');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('859ea912-870a-409b-b7f6-5723eafdffca','本地','admin','0','2017-02-24 05:26:11');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('87c42849-8a26-415b-9528-b171d9f9125d','本地','admin','1','2017-02-24 14:41:13');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('8aa77c5f-dbf0-4d40-8f5b-992a02f21ebc','本地','admin','1','2017-02-23 23:13:38');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('8e1dd0c3-b916-4430-bf46-1a6d761d8b7c','本地','admin','1','2017-02-24 06:55:26');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('a2f2bb0f-1a83-45f8-961c-cd78303c7134','本地','admin','1','2017-02-23 21:37:58');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('aca27681-d489-4062-8ef9-ac38815442bf','本地','admin','0','2017-02-23 21:37:47');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('b55d0d41-9a25-42b5-8da8-93fd94535637','本地','admin','0','2017-02-24 08:31:44');
insert  into `frm_online`(`id`,`ip`,`loginName`,`type`,`createDatetime `) values ('b88276db-cb6d-4ca6-b92a-fc244cac8092','本地','admin','1','2017-02-23 21:08:59');

/*Table structure for table `frm_organization` */

CREATE TABLE `frm_organization` (
  `id` char(36) NOT NULL,
  `code` char(6) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `seq` int(10) DEFAULT NULL,
  `iconcls` varchar(100) DEFAULT NULL,
  `organization_id` char(36) DEFAULT NULL,
  `deleteFlag` int(11) DEFAULT NULL,
  `orgCode` char(6) DEFAULT NULL,
  `operater` varchar(20) NOT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ACF7QLB04QUTHKTALWX8C7Q69` (`organization_id`),
  CONSTRAINT `FK_ACF7QLB04QUTHKTALWX8C7Q69` FOREIGN KEY (`organization_id`) REFERENCES `frm_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `frm_organization` */

insert  into `frm_organization`(`id`,`code`,`name`,`address`,`seq`,`iconcls`,`organization_id`,`deleteFlag`,`orgCode`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888org1','B00001','测绘研究院','北京市连石桥西路5号',1,NULL,NULL,0,'B00001','','2017-02-23 23:45:48','2017-02-23 23:45:48');

/*Table structure for table `frm_organizationresource` */

CREATE TABLE `frm_organizationresource` (
  `organization_id` char(36) NOT NULL,
  `resource_id` char(36) NOT NULL,
  PRIMARY KEY (`organization_id`,`resource_id`),
  KEY `FK_M4MFGLK7ODI78D8PK9PIF44VC` (`resource_id`),
  CONSTRAINT `FK_ACPJP8A7FJO0CNN02EB0IA6UF` FOREIGN KEY (`organization_id`) REFERENCES `frm_organization` (`id`),
  CONSTRAINT `FK_M4MFGLK7ODI78D8PK9PIF44VC` FOREIGN KEY (`resource_id`) REFERENCES `frm_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `frm_organizationresource` */

/*Table structure for table `frm_resource` */

CREATE TABLE `frm_resource` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `iconcls` varchar(100) DEFAULT NULL,
  `seq` int(10) DEFAULT NULL,
  `target` varchar(100) DEFAULT NULL,
  `resource_id` char(36) DEFAULT NULL,
  `resourcetype_id` char(36) DEFAULT NULL,
  `deleteFlag` int(11) DEFAULT NULL,
  `operater` varchar(20) NOT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_93QFPIIUK3RWB32GC5MCMMLGH` (`resourcetype_id`),
  KEY `FK_N8KK2INHW4Y4GAX3NRA2ETFUP` (`resource_id`),
  CONSTRAINT `FK_93QFPIIUK3RWB32GC5MCMMLGH` FOREIGN KEY (`resourcetype_id`) REFERENCES `frm_resourcetype` (`id`),
  CONSTRAINT `FK_N8KK2INHW4Y4GAX3NRA2ETFUP` FOREIGN KEY (`resource_id`) REFERENCES `frm_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `frm_resource` */

insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('0c9c6724-a92b-4479-b7fe-b6fb0134afc9','存款业务','存款业务模块',NULL,'ext-icon-coins',100,NULL,NULL,'60366688-0001-0001-0011-8888rstype00',0,'','2017-02-05 18:42:26','2017-02-05 18:42:26');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('202c4ea3-454f-4df4-b50b-4394eed6978e','查询（ID）','根据ID查询','/hpn/cr/customer!getById','ext-icon-group_key',101,NULL,'8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e','60366688-0001-0001-0011-8888rstype01',0,'','2017-02-05 18:36:33','2017-02-05 18:36:33');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('4e85e519-3b03-4fdc-ab2c-17d0dbc72209','删除（逻辑）','删除客户','/hpn/cr/customer!delete','ext-icon-group_delete',104,NULL,'8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e','60366688-0001-0001-0011-8888rstype01',0,'','2017-02-06 21:12:35','2017-02-05 18:39:47');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('5d0bdb0a-aa02-4734-9bfc-1b263aea7430','修改','修改存款单','/hpn/fc/deposit!update','ext-icon-weather_sun',103,NULL,'fa68f5df-3444-4599-92cd-365373f937b5','60366688-0001-0001-0011-8888rstype01',0,'','2017-02-06 21:16:58','2017-02-06 21:16:44');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('5d9d85c4-32f0-4c58-b892-619e03ac4b6a','客户关系','客户关系信息：客户管理、客户级别、会员关系',NULL,'ext-icon-group',106,NULL,NULL,'60366688-0001-0001-0011-8888rstype00',0,'','2017-02-05 18:50:14','2017-02-05 18:29:38');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jgbj','编辑机构','编辑机构','/base/frmOrganization!update','ext-icon-bullet_wrench',2,NULL,'60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jgck','查看机构','查看机构','/base/frmOrganization!getById','ext-icon-bullet_wrench',4,NULL,'60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jggl','机构管理','管理系统中用户的机构','/jsp/base/FrmOrganization.jsp','ext-icon-group_link',3,NULL,'60366688-0001-0001-0011-88888888xtgl','60366688-0001-0001-0011-8888rstype00',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jglb','机构列表','查询机构列表','/base/frmOrganization!treeGrid','ext-icon-bullet_wrench',0,NULL,'60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jgsc','删除机构','删除机构','/base/frmOrganization!delete','ext-icon-bullet_wrench',3,NULL,'60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jgsq','机构授权','机构授权','/base/frmOrganization!grant','ext-icon-bullet_wrench',5,NULL,'60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jgtj','添加机构','添加机构','/base/frmOrganization!save','ext-icon-bullet_wrench',1,NULL,'60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jsbj','编辑角色','编辑角色','/base/frmRole!update','ext-icon-bullet_wrench',2,NULL,'60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jsck','查看角色','查看角色','/base/frmRole!getById','ext-icon-bullet_wrench',4,NULL,'60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jsgl','角色管理','管理系统中用户的角色','/jsp/base/FrmRole.jsp','ext-icon-tux',2,NULL,'60366688-0001-0001-0011-88888888xtgl','60366688-0001-0001-0011-8888rstype00',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jslb','角色列表','查询角色列表','/base/frmRole!grid','ext-icon-bullet_wrench',0,NULL,'60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jssc','删除角色','删除角色','/base/frmRole!delete','ext-icon-bullet_wrench',3,NULL,'60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jssq','角色授权','角色授权','/base/frmRole!grant','ext-icon-bullet_wrench',5,NULL,'60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888jstj','添加角色','添加角色','/base/frmRole!save','ext-icon-bullet_wrench',1,NULL,'60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888xtgl','系统管理','管理系统的资源、角色、机构、用户等信息',NULL,'ext-icon-application_view_tile',0,NULL,NULL,'60366688-0001-0001-0011-8888rstype00',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888xtjk','系统监控','监控系统运行情况等信息','/welcome.jsp','ext-icon-monitor',1,NULL,NULL,'60366688-0001-0001-0011-8888rstype00',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888yhbj','编辑用户','编辑用户','/base/frmUser!update','ext-icon-bullet_wrench',2,NULL,'60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888yhck','查看用户','查看用户','/base/frmUser!getById','ext-icon-bullet_wrench',4,NULL,'60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888yhgl','用户管理','管理系统中用户的用户','/jsp/base/FrmUser.jsp','ext-icon-user_suit',4,NULL,'60366688-0001-0001-0011-88888888xtgl','60366688-0001-0001-0011-8888rstype00',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888yhjg','用户机构','编辑用户机构','/base/frmUser!grantOrganization','ext-icon-bullet_wrench',6,NULL,'60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888yhjs','用户角色','编辑用户角色','/base/frmUser!grantRole','ext-icon-bullet_wrench',5,NULL,'60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888yhlb','用户列表','查询用户列表','/base/frmUser!grid','ext-icon-bullet_wrench',0,NULL,'60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888yhsc','删除用户','删除用户','/base/frmUser!delete','ext-icon-bullet_wrench',3,NULL,'60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888yhtj','添加用户','添加用户','/base/frmUser!save','ext-icon-bullet_wrench',1,NULL,'60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888zybj','编辑资源','编辑资源','/base/frmResource!update','ext-icon-bullet_wrench',2,NULL,'60366688-0001-0001-0011-88888888zygl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888zyck','查看资源','查看资源','/base/frmResource!getById','ext-icon-bullet_wrench',4,NULL,'60366688-0001-0001-0011-88888888zygl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888zygl','资源管理','管理系统的资源','/jsp/base/FrmResource.jsp','ext-icon-newspaper_link',1,NULL,'60366688-0001-0001-0011-88888888xtgl','60366688-0001-0001-0011-8888rstype00',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888zylb','资源列表','查询资源','/base/frmResource!treeGrid','ext-icon-bullet_wrench',0,NULL,'60366688-0001-0001-0011-88888888zygl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888zysc','删除资源','删除资源','/base/frmResource!delete','ext-icon-bullet_wrench',3,NULL,'60366688-0001-0001-0011-88888888zygl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88888888zytj','添加资源','添加资源','/base/frmResource!save','ext-icon-bullet_wrench',1,NULL,'60366688-0001-0001-0011-88888888zygl','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-888888online','用户登录历史监控','监控用户登录、注销','/jsp/base/FrmOnline.jsp','ext-icon-chart_line',4,NULL,'60366688-0001-0001-0011-88888888xtjk','60366688-0001-0001-0011-8888rstype00',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-88onlineGrid','用户登录历史列表','用户登录、注销历史记录列表','/base/frmOnline!grid','ext-icon-bullet_wrench',0,NULL,'60366688-0001-0001-0011-888888online','60366688-0001-0001-0011-8888rstype01',0,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('750db3a0-f034-48e4-9c72-68d9562176fe','查询','全部或按条件查询','/hpn/cr/customer!grid','ext-icon-group',100,NULL,'8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e','60366688-0001-0001-0011-8888rstype01',0,'','2017-02-05 18:35:23','2017-02-05 18:35:23');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('75119f99-af52-45c2-aa56-bcbdb694b152','新增','增加客户信息','/hpn/cr/customer!save','ext-icon-group_add',102,NULL,'8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e','60366688-0001-0001-0011-8888rstype01',0,'','2017-02-05 18:38:54','2017-02-05 18:38:54');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e','客户管理','客户的CRUD','/jsp/hpn/cr/Customer.jsp','ext-icon-group',100,NULL,'5d9d85c4-32f0-4c58-b892-619e03ac4b6a','60366688-0001-0001-0011-8888rstype00',0,'','2017-02-05 18:31:35','2017-02-05 18:31:35');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('9d12ffcc-d6ed-49a9-91d7-d08e4cb60985','删除（逻辑）','逻辑删除存款单','/hpn/fc/deposit!delete','ext-icon-coins_delete',104,NULL,'fa68f5df-3444-4599-92cd-365373f937b5','60366688-0001-0001-0011-8888rstype01',0,'','2017-02-06 21:18:25','2017-02-06 21:18:25');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('a5f202ef-d69e-4e59-ae9d-3008d6e28ad3','新增','新增存款单','/hpn/fc/deposit!save','ext-icon-coins_add',102,NULL,'fa68f5df-3444-4599-92cd-365373f937b5','60366688-0001-0001-0011-8888rstype01',0,'','2017-02-06 21:13:56','2017-02-06 21:13:56');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('da69bb50-09e7-400d-b46d-c204df6afbf7','打印','打印存单','/hpn/fc/deposit!print','ext-icon-printer',105,NULL,'fa68f5df-3444-4599-92cd-365373f937b5','60366688-0001-0001-0011-8888rstype01',0,'','2017-02-18 07:02:35','2017-02-18 07:02:35');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('dd4ff8ec-7b45-4be3-b28d-c639f5a120c5','查询','按条件查询业务类型为存款的数据','/hpn/fc/deposit!grid','ext-icon-coins',100,NULL,'fa68f5df-3444-4599-92cd-365373f937b5','60366688-0001-0001-0011-8888rstype01',0,'','2017-02-06 21:09:07','2017-02-06 21:09:07');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('df9a5d92-fcbb-4522-b053-f2dc73166f16','修改','修改客户信息','/hpn/cr/customer!update','ext-icon-group_edit',103,NULL,'8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e','60366688-0001-0001-0011-8888rstype01',0,'','2017-02-05 18:37:42','2017-02-05 18:37:42');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('f4bd3e23-7313-4996-bc61-35070266053d','查询（ID）','按ID查询业务类型为存款的数据','/hpn/fc/deposit!getById','ext-icon-sport_tennis',101,NULL,'fa68f5df-3444-4599-92cd-365373f937b5','60366688-0001-0001-0011-8888rstype01',0,'','2017-02-06 21:12:07','2017-02-06 21:12:07');
insert  into `frm_resource`(`id`,`name`,`description`,`url`,`iconcls`,`seq`,`target`,`resource_id`,`resourcetype_id`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('fa68f5df-3444-4599-92cd-365373f937b5','存款管理','存款的增加、需改、作废','/jsp/hpn/fc/Deposit.jsp','ext-icon-coins',100,NULL,'0c9c6724-a92b-4479-b7fe-b6fb0134afc9','60366688-0001-0001-0011-8888rstype00',0,'','2017-02-05 18:49:25','2017-02-05 18:49:25');

/*Table structure for table `frm_resourcetype` */

CREATE TABLE `frm_resourcetype` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `deleteFlag` int(11) DEFAULT NULL,
  `operater` varchar(20) NOT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `frm_resourcetype` */

insert  into `frm_resourcetype`(`id`,`name`,`description`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-8888rstype00','菜单','菜单类型会显示在系统首页左侧菜单中',1,'','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_resourcetype`(`id`,`name`,`description`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-8888rstype01','功能','功能类型不会显示在系统首页左侧菜单中',1,'','2017-01-01 00:00:00','2017-01-01 00:00:00');

/*Table structure for table `frm_role` */

CREATE TABLE `frm_role` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `iconcls` varchar(100) DEFAULT NULL,
  `seq` int(10) DEFAULT NULL,
  `operater` varchar(20) NOT NULL,
  `deleteFlag` int(11) DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `frm_role` */

insert  into `frm_role`(`id`,`name`,`description`,`iconcls`,`seq`,`operater`,`deleteFlag`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-888888role01','超管','拥有系统所有权限',NULL,0,'',0,'2017-01-01 00:00:00','2017-01-01 00:00:00');

/*Table structure for table `frm_roleresource` */

CREATE TABLE `frm_roleresource` (
  `role_id` char(36) NOT NULL,
  `resource_id` char(36) NOT NULL,
  PRIMARY KEY (`resource_id`,`role_id`),
  KEY `FK_R139H669PG4TS6MBVN3IP5472` (`role_id`),
  CONSTRAINT `FK_KKRARTSOVL2FRHFVRIQDI7JWL` FOREIGN KEY (`resource_id`) REFERENCES `frm_resource` (`id`),
  CONSTRAINT `FK_R139H669PG4TS6MBVN3IP5472` FOREIGN KEY (`role_id`) REFERENCES `frm_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `frm_roleresource` */

insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','0c9c6724-a92b-4479-b7fe-b6fb0134afc9');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','202c4ea3-454f-4df4-b50b-4394eed6978e');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','4e85e519-3b03-4fdc-ab2c-17d0dbc72209');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','5d0bdb0a-aa02-4734-9bfc-1b263aea7430');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','5d9d85c4-32f0-4c58-b892-619e03ac4b6a');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jgbj');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jgck');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jggl');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jglb');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jgsc');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jgsq');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jgtj');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jsbj');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jsck');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jsgl');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jslb');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jssc');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jssq');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jstj');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888xtgl');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888xtjk');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhbj');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhck');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhgl');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhjg');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhjs');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhlb');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhsc');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhtj');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888zybj');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888zyck');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888zygl');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888zylb');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888zysc');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888zytj');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-888888online');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88onlineGrid');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','750db3a0-f034-48e4-9c72-68d9562176fe');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','75119f99-af52-45c2-aa56-bcbdb694b152');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','9d12ffcc-d6ed-49a9-91d7-d08e4cb60985');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','a5f202ef-d69e-4e59-ae9d-3008d6e28ad3');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','da69bb50-09e7-400d-b46d-c204df6afbf7');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','dd4ff8ec-7b45-4be3-b28d-c639f5a120c5');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','df9a5d92-fcbb-4522-b053-f2dc73166f16');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','f4bd3e23-7313-4996-bc61-35070266053d');
insert  into `frm_roleresource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','fa68f5df-3444-4599-92cd-365373f937b5');

/*Table structure for table `frm_serialnumber` */

CREATE TABLE `frm_serialnumber` (
  `id` char(36) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `metaTable` varchar(30) DEFAULT NULL,
  `metaColumn` varchar(30) DEFAULT NULL,
  `relatTeature` varchar(2) DEFAULT NULL,
  `relatAddTeature` varchar(2) DEFAULT NULL,
  `serialNumber` int(11) DEFAULT NULL,
  `deleteFlag` tinyint(1) DEFAULT NULL,
  `operater` varchar(20) NOT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `frm_serialnumber` */

insert  into `frm_serialnumber`(`id`,`name`,`metaTable`,`metaColumn`,`relatTeature`,`relatAddTeature`,`serialNumber`,`deleteFlag`,`operater`,`updateDatetime`,`createDatetime `) values ('a10d89ac-8ed4-48e0-b370-9dafa0dc00e3',NULL,'IFR_LOANTICKET','number','2',NULL,19,0,'','2017-02-09 09:55:59','2017-02-09 09:55:59');

/*Table structure for table `frm_user` */

CREATE TABLE `frm_user` (
  `id` char(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `loginName` varchar(20) NOT NULL,
  `age` int(10) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `organization_id` char(36) DEFAULT NULL,
  `deleteFlag` int(11) DEFAULT NULL,
  `orgCode` char(6) DEFAULT NULL,
  `operater` varchar(20) NOT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8m19nl4mx5g0wkvrsect5w856` (`organization_id`),
  CONSTRAINT `FK_8m19nl4mx5g0wkvrsect5w856` FOREIGN KEY (`organization_id`) REFERENCES `frm_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `frm_user` */

insert  into `frm_user`(`id`,`name`,`loginName`,`age`,`pwd`,`sex`,`photo`,`organization_id`,`deleteFlag`,`orgCode`,`operater`,`updateDatetime`,`createDatetime `) values ('60366688-0001-0001-0011-888888user01','超级管理员','admin',30,'e10adc3949ba59abbe56e057f20f883e','1',NULL,'60366688-0001-0001-0011-88888888org1',0,'B00001','','2017-01-01 00:00:00','2017-01-01 00:00:00');
insert  into `frm_user`(`id`,`name`,`loginName`,`age`,`pwd`,`sex`,`photo`,`organization_id`,`deleteFlag`,`orgCode`,`operater`,`updateDatetime`,`createDatetime `) values ('ecb6f18a-b528-4ad6-a242-b1769e6958b1','张三','1',NULL,'c4ca4238a0b923820dcc509a6f75849b','1',NULL,'60366688-0001-0001-0011-88888888org1',0,'B00001','','2017-02-23 23:45:48','2017-02-23 23:45:48');

/*Table structure for table `frm_userorganization` */

CREATE TABLE `frm_userorganization` (
  `user_id` char(36) NOT NULL,
  `organization_id` char(36) NOT NULL,
  PRIMARY KEY (`organization_id`,`user_id`),
  KEY `FK_63BDMTXWLK259ID13RP4IRYY` (`user_id`),
  CONSTRAINT `FK_14EWQC5WTSCAC0DD5RSWRM5J2` FOREIGN KEY (`organization_id`) REFERENCES `frm_organization` (`id`),
  CONSTRAINT `FK_63BDMTXWLK259ID13RP4IRYY` FOREIGN KEY (`user_id`) REFERENCES `frm_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `frm_userorganization` */

/*Table structure for table `frm_userrole` */

CREATE TABLE `frm_userrole` (
  `user_id` char(36) NOT NULL,
  `role_id` char(36) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK_1PI4P5H4Y5GHBS5F4GDLGN620` (`user_id`),
  CONSTRAINT `FK_1PI4P5H4Y5GHBS5F4GDLGN620` FOREIGN KEY (`user_id`) REFERENCES `frm_user` (`id`),
  CONSTRAINT `FK_J7IWTGSLC2ESRJX0PTIELEOKO` FOREIGN KEY (`role_id`) REFERENCES `frm_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `frm_userrole` */

insert  into `frm_userrole`(`user_id`,`role_id`) values ('60366688-0001-0001-0011-888888user01','60366688-0001-0001-0011-888888role01');

/*Table structure for table `ifr_customer` */

CREATE TABLE `ifr_customer` (
  `id` char(36) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `occupation` varchar(16) DEFAULT NULL,
  `address` varchar(16) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `idAddress` varchar(16) DEFAULT NULL,
  `idNumber` varchar(20) DEFAULT NULL,
  `phoneNumber` varchar(16) DEFAULT NULL,
  `secondPhoneNumber` varchar(16) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `deleteFlag` int(1) DEFAULT NULL,
  `operater` varchar(20) NOT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ifr_customer` */

/*Table structure for table `ifr_loanticket` */

CREATE TABLE `ifr_loanticket` (
  `id` char(36) NOT NULL,
  `bizType` tinyint(2) DEFAULT NULL,
  `deleteFlag` tinyint(1) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `feeRate` decimal(4,2) DEFAULT NULL,
  `monthNum` int(3) DEFAULT NULL,
  `monthRate` decimal(4,2) DEFAULT NULL,
  `number` int(6) DEFAULT NULL,
  `orgCode` varchar(6) DEFAULT NULL,
  `penaltyRate` decimal(6,4) DEFAULT NULL,
  `principalAmt` int(7) DEFAULT NULL,
  `yearRate` decimal(4,2) DEFAULT NULL,
  `startBizDate` date DEFAULT NULL,
  `customer_idNumber` varchar(20) DEFAULT NULL,
  `customer_name` varchar(64) DEFAULT NULL,
  `customer_id` char(36) DEFAULT NULL,
  `endBizDate` date DEFAULT NULL,
  `epAllFee` decimal(10,2) DEFAULT NULL,
  `epAllInterest` decimal(10,2) DEFAULT NULL,
  `printTime` datetime DEFAULT NULL,
  `printTimes` int(3) DEFAULT NULL,
  `operater` varchar(20) NOT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pcutknvkkjmx9q9ohtaxqub4g` (`customer_id`),
  CONSTRAINT `FK_pcutknvkkjmx9q9ohtaxqub4g` FOREIGN KEY (`customer_id`) REFERENCES `ifr_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ifr_loanticket` */

/*Table structure for table `ifr_paymentinfo` */

CREATE TABLE `ifr_paymentinfo` (
  `id` char(36) NOT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `actualMonthNum` int(11) NOT NULL,
  `apFeeAmt` int(11) NOT NULL,
  `apInterestAmt` int(11) NOT NULL,
  `apPenaltyAmt` int(11) NOT NULL,
  `apPrincipalAmt` int(11) NOT NULL,
  `apSubtotalAmt` int(11) NOT NULL,
  `bizDate` datetime DEFAULT NULL,
  `bizType` tinyint(2) NOT NULL,
  `deleteFlag` tinyint(1) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `orgCode` char(6) DEFAULT NULL,
  `payType` tinyint(2) NOT NULL,
  `rdFeeAmt` decimal(19,2) DEFAULT NULL,
  `rdInterestAmt` decimal(19,2) DEFAULT NULL,
  `rdPenaltyAmt` decimal(19,2) DEFAULT NULL,
  `rpFeeAmt` decimal(19,2) DEFAULT NULL,
  `rpInterestAmt` decimal(19,2) DEFAULT NULL,
  `rpPenaltyAmt` decimal(19,2) DEFAULT NULL,
  `rpSubtotalAmt` decimal(19,2) DEFAULT NULL,
  `loanTicket_id` char(36) DEFAULT NULL,
  `operater` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_k8im40bwf5mxyg54iahg0q7i2` (`loanTicket_id`),
  CONSTRAINT `FK_k8im40bwf5mxyg54iahg0q7i2` FOREIGN KEY (`loanTicket_id`) REFERENCES `ifr_loanticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ifr_paymentinfo` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
