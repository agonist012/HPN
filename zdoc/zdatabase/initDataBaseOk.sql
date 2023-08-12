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
  `id` varchar(36) NOT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `loginName` varchar(100) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `frm_organization` */

CREATE TABLE `frm_organization` (
  `id` varchar(36) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `CODE` varchar(200) DEFAULT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  `iconcls` varchar(100) DEFAULT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `seq` int(10) DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `organization_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ACF7QLB04QUTHKTALWX8C7Q69` (`organization_id`),
  CONSTRAINT `FK_ACF7QLB04QUTHKTALWX8C7Q69` FOREIGN KEY (`organization_id`) REFERENCES `frm_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `frm_resourceType` */

CREATE TABLE `frm_resourceType` (
  `id` varchar(36) NOT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `frm_resource` */

CREATE TABLE `frm_resource` (
  `id` varchar(36) NOT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `iconcls` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `seq` int(10) DEFAULT NULL,
  `target` varchar(100) DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `resource_id` varchar(36) DEFAULT NULL,
  `resourcetype_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_93QFPIIUK3RWB32GC5MCMMLGH` (`resourcetype_id`),
  KEY `FK_N8KK2INHW4Y4GAX3NRA2ETFUP` (`resource_id`),
  CONSTRAINT `FK_N8KK2INHW4Y4GAX3NRA2ETFUP` FOREIGN KEY (`resource_id`) REFERENCES `frm_resource` (`id`),
  CONSTRAINT `FK_93QFPIIUK3RWB32GC5MCMMLGH` FOREIGN KEY (`resourcetype_id`) REFERENCES `frm_resourceType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `frm_role` */

CREATE TABLE `frm_role` (
  `id` varchar(36) NOT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `iconcls` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `seq` int(10) DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `frm_user` */

CREATE TABLE `frm_user` (
  `id` varchar(36) NOT NULL,
  `age` int(10) DEFAULT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  `loginName` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `frm_userOrganization` */

CREATE TABLE `frm_userOrganization` (
  `user_id` varchar(36) NOT NULL,
  `organization_id` varchar(36) NOT NULL,
  PRIMARY KEY (`organization_id`,`user_id`),
  KEY `FK_63BDMTXWLK259ID13RP4IRYY` (`user_id`),
  CONSTRAINT `FK_14EWQC5WTSCAC0DD5RSWRM5J2` FOREIGN KEY (`organization_id`) REFERENCES `frm_organization` (`id`),
  CONSTRAINT `FK_63BDMTXWLK259ID13RP4IRYY` FOREIGN KEY (`user_id`) REFERENCES `frm_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `frm_organizationResource` */

CREATE TABLE `frm_organizationResource` (
  `resource_id` varchar(36) NOT NULL,
  `organization_id` varchar(36) NOT NULL,
  PRIMARY KEY (`organization_id`,`resource_id`),
  KEY `FK_M4MFGLK7ODI78D8PK9PIF44VC` (`resource_id`),
  CONSTRAINT `FK_M4MFGLK7ODI78D8PK9PIF44VC` FOREIGN KEY (`resource_id`) REFERENCES `frm_resource` (`id`),
  CONSTRAINT `FK_ACPJP8A7FJO0CNN02EB0IA6UF` FOREIGN KEY (`organization_id`) REFERENCES `frm_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `frm_userRole` */

CREATE TABLE `frm_userRole` (
  `user_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK_1PI4P5H4Y5GHBS5F4GDLGN620` (`user_id`),
  CONSTRAINT `FK_1PI4P5H4Y5GHBS5F4GDLGN620` FOREIGN KEY (`user_id`) REFERENCES `frm_user` (`id`),
  CONSTRAINT `FK_J7IWTGSLC2ESRJX0PTIELEOKO` FOREIGN KEY (`role_id`) REFERENCES `frm_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `frm_roleResource` */

CREATE TABLE `frm_roleResource` (
  `role_id` varchar(36) NOT NULL,
  `resource_id` varchar(36) NOT NULL,
  PRIMARY KEY (`resource_id`,`role_id`),
  KEY `FK_R139H669PG4TS6MBVN3IP5472` (`role_id`),
  CONSTRAINT `FK_KKRARTSOVL2FRHFVRIQDI7JWL` FOREIGN KEY (`resource_id`) REFERENCES `frm_resource` (`id`),
  CONSTRAINT `FK_R139H669PG4TS6MBVN3IP5472` FOREIGN KEY (`role_id`) REFERENCES `frm_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `frm_serialnumber` */

CREATE TABLE `frm_serialnumber` (
  `id` varchar(36) NOT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `metaColumn` varchar(30) DEFAULT NULL,
  `metaTable` varchar(30) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `relatAddTeature` varchar(2) DEFAULT NULL,
  `relatTeature` varchar(2) DEFAULT NULL,
  `serialNumber` int(11) DEFAULT NULL,
  `deleteFlag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `frm_organization` */

insert  into `frm_organization`(`id`,`address`,`CODE`,`createDatetime `,`iconcls`,`NAME`,`seq`,`updateDatetime`,`organization_id`) values ('60366688-0001-0001-0011-88888888org1','机构地址',NULL,'2017-01-01 00:00:00','ext-icon-brick','一级机构',0,'2017-01-01 00:00:00',NULL);

/*Data for the table `frm_resourceType` */

insert  into `frm_resourceType`(`id`,`createDatetime `,`description`,`NAME`,`updateDatetime`) values ('60366688-0001-0001-0011-8888rstype00','2017-01-01 00:00:00','菜单类型会显示在系统首页左侧菜单中','菜单','2017-01-01 00:00:00');
insert  into `frm_resourceType`(`id`,`createDatetime `,`description`,`NAME`,`updateDatetime`) values ('60366688-0001-0001-0011-8888rstype01','2017-01-01 00:00:00','功能类型不会显示在系统首页左侧菜单中','功能','2017-01-01 00:00:00');

/*Data for the table `frm_resource` */

insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('0c9c6724-a92b-4479-b7fe-b6fb0134afc9','2017-02-05 18:42:26','存款业务模块','ext-icon-coins','存款业务',100,NULL,'2017-02-05 18:42:26',NULL,NULL,'60366688-0001-0001-0011-8888rstype00');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('5d9d85c4-32f0-4c58-b892-619e03ac4b6a','2017-02-05 18:29:38','客户关系信息：客户管理、客户级别、会员关系','ext-icon-group','客户关系',106,NULL,'2017-02-05 18:50:14',NULL,NULL,'60366688-0001-0001-0011-8888rstype00');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888xtgl','2017-01-01 00:00:00','管理系统的资源、角色、机构、用户等信息','ext-icon-application_view_tile','系统管理',0,NULL,'2017-01-01 00:00:00',NULL,NULL,'60366688-0001-0001-0011-8888rstype00');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888xtjk','2017-01-01 00:00:00','监控系统运行情况等信息','ext-icon-monitor','系统监控',1,NULL,'2017-01-01 00:00:00','/welcome.jsp',NULL,'60366688-0001-0001-0011-8888rstype00');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e','2017-02-05 18:31:35','客户的CRUD','ext-icon-group','客户管理',100,NULL,'2017-02-05 18:31:35','/jsp/hpn/cr/Customer.jsp','5d9d85c4-32f0-4c58-b892-619e03ac4b6a','60366688-0001-0001-0011-8888rstype00');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('202c4ea3-454f-4df4-b50b-4394eed6978e','2017-02-05 18:36:33','根据ID查询','ext-icon-group_key','查询（ID）',101,NULL,'2017-02-05 18:36:33','/hpn/cr/customer!getById','8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('4e85e519-3b03-4fdc-ab2c-17d0dbc72209','2017-02-05 18:39:47','删除客户','ext-icon-group_delete','删除（逻辑）',104,NULL,'2017-02-06 21:12:35','/hpn/cr/customer!delete','8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('750db3a0-f034-48e4-9c72-68d9562176fe','2017-02-05 18:35:23','全部或按条件查询','ext-icon-group','查询',100,NULL,'2017-02-05 18:35:23','/hpn/cr/customer!grid','8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('75119f99-af52-45c2-aa56-bcbdb694b152','2017-02-05 18:38:54','增加客户信息','ext-icon-group_add','新增',102,NULL,'2017-02-05 18:38:54','/hpn/cr/customer!save','8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('df9a5d92-fcbb-4522-b053-f2dc73166f16','2017-02-05 18:37:42','修改客户信息','ext-icon-group_edit','修改',103,NULL,'2017-02-05 18:37:42','/hpn/cr/customer!update','8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('fa68f5df-3444-4599-92cd-365373f937b5','2017-02-05 18:49:25','存款的增加、需改、作废','ext-icon-coins','存款管理',100,NULL,'2017-02-05 18:49:25','/jsp/hpn/fc/Deposit.jsp','0c9c6724-a92b-4479-b7fe-b6fb0134afc9','60366688-0001-0001-0011-8888rstype00');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('5d0bdb0a-aa02-4734-9bfc-1b263aea7430','2017-02-06 21:16:44','修改存款单','ext-icon-weather_sun','修改',103,NULL,'2017-02-06 21:16:58','/hpn/fc/deposit!update','fa68f5df-3444-4599-92cd-365373f937b5','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('9d12ffcc-d6ed-49a9-91d7-d08e4cb60985','2017-02-06 21:18:25','逻辑删除存款单','ext-icon-coins_delete','删除（逻辑）',104,NULL,'2017-02-06 21:18:25','/hpn/fc/deposit!delete','fa68f5df-3444-4599-92cd-365373f937b5','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('a5f202ef-d69e-4e59-ae9d-3008d6e28ad3','2017-02-06 21:13:56','新增存款单','ext-icon-coins_add','新增',102,NULL,'2017-02-06 21:13:56','/hpn/fc/deposit!save','fa68f5df-3444-4599-92cd-365373f937b5','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('da69bb50-09e7-400d-b46d-c204df6afbf7','2017-02-18 07:02:35','打印存单','ext-icon-printer','打印',105,NULL,'2017-02-18 07:02:35','/hpn/fc/deposit!print','fa68f5df-3444-4599-92cd-365373f937b5','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('dd4ff8ec-7b45-4be3-b28d-c639f5a120c5','2017-02-06 21:09:07','按条件查询业务类型为存款的数据','ext-icon-coins','查询',100,NULL,'2017-02-06 21:09:07','/hpn/fc/deposit!grid','fa68f5df-3444-4599-92cd-365373f937b5','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('f4bd3e23-7313-4996-bc61-35070266053d','2017-02-06 21:12:07','按ID查询业务类型为存款的数据','ext-icon-sport_tennis','查询（ID）',101,NULL,'2017-02-06 21:12:07','/hpn/fc/deposit!getById','fa68f5df-3444-4599-92cd-365373f937b5','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jsgl','2017-01-01 00:00:00','管理系统中用户的角色','ext-icon-tux','角色管理',2,NULL,'2017-01-01 00:00:00','/jsp/base/FrmRole.jsp','60366688-0001-0001-0011-88888888xtgl','60366688-0001-0001-0011-8888rstype00');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888yhgl','2017-01-01 00:00:00','管理系统中用户的用户','ext-icon-user_suit','用户管理',4,NULL,'2017-01-01 00:00:00','/jsp/base/FrmUser.jsp','60366688-0001-0001-0011-88888888xtgl','60366688-0001-0001-0011-8888rstype00');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jggl','2017-01-01 00:00:00','管理系统中用户的机构','ext-icon-group_link','机构管理',3,NULL,'2017-01-01 00:00:00','/jsp/base/FrmOrganization.jsp','60366688-0001-0001-0011-88888888xtgl','60366688-0001-0001-0011-8888rstype00');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jgbj','2017-01-01 00:00:00','编辑机构','ext-icon-bullet_wrench','编辑机构',2,NULL,'2017-01-01 00:00:00','/base/frmOrganization!update','60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jgck','2017-01-01 00:00:00','查看机构','ext-icon-bullet_wrench','查看机构',4,NULL,'2017-01-01 00:00:00','/base/frmOrganization!getById','60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jglb','2017-01-01 00:00:00','查询机构列表','ext-icon-bullet_wrench','机构列表',0,NULL,'2017-01-01 00:00:00','/base/frmOrganization!treeGrid','60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jgsc','2017-01-01 00:00:00','删除机构','ext-icon-bullet_wrench','删除机构',3,NULL,'2017-01-01 00:00:00','/base/frmOrganization!delete','60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jgsq','2017-01-01 00:00:00','机构授权','ext-icon-bullet_wrench','机构授权',5,NULL,'2017-01-01 00:00:00','/base/frmOrganization!grant','60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jgtj','2017-01-01 00:00:00','添加机构','ext-icon-bullet_wrench','添加机构',1,NULL,'2017-01-01 00:00:00','/base/frmOrganization!save','60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jsbj','2017-01-01 00:00:00','编辑角色','ext-icon-bullet_wrench','编辑角色',2,NULL,'2017-01-01 00:00:00','/base/frmRole!update','60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jsck','2017-01-01 00:00:00','查看角色','ext-icon-bullet_wrench','查看角色',4,NULL,'2017-01-01 00:00:00','/base/frmRole!getById','60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jslb','2017-01-01 00:00:00','查询角色列表','ext-icon-bullet_wrench','角色列表',0,NULL,'2017-01-01 00:00:00','/base/frmRole!grid','60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jssc','2017-01-01 00:00:00','删除角色','ext-icon-bullet_wrench','删除角色',3,NULL,'2017-01-01 00:00:00','/base/frmRole!delete','60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jssq','2017-01-01 00:00:00','角色授权','ext-icon-bullet_wrench','角色授权',5,NULL,'2017-01-01 00:00:00','/base/frmRole!grant','60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888jstj','2017-01-01 00:00:00','添加角色','ext-icon-bullet_wrench','添加角色',1,NULL,'2017-01-01 00:00:00','/base/frmRole!save','60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-888888online','2017-01-01 00:00:00','监控用户登录、注销','ext-icon-chart_line','用户登录历史监控',4,NULL,'2017-01-01 00:00:00','/jsp/base/FrmOnline.jsp','60366688-0001-0001-0011-88888888xtjk','60366688-0001-0001-0011-8888rstype00');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88onlineGrid','2017-01-01 00:00:00','用户登录、注销历史记录列表','ext-icon-bullet_wrench','用户登录历史列表',0,NULL,'2017-01-01 00:00:00','/base/frmOnline!grid','60366688-0001-0001-0011-888888online','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888yhbj','2017-01-01 00:00:00','编辑用户','ext-icon-bullet_wrench','编辑用户',2,NULL,'2017-01-01 00:00:00','/base/frmUser!update','60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888yhck','2017-01-01 00:00:00','查看用户','ext-icon-bullet_wrench','查看用户',4,NULL,'2017-01-01 00:00:00','/base/frmUser!getById','60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888yhjg','2017-01-01 00:00:00','编辑用户机构','ext-icon-bullet_wrench','用户机构',6,NULL,'2017-01-01 00:00:00','/base/frmUser!grantOrganization','60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888yhjs','2017-01-01 00:00:00','编辑用户角色','ext-icon-bullet_wrench','用户角色',5,NULL,'2017-01-01 00:00:00','/base/frmUser!grantRole','60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888yhlb','2017-01-01 00:00:00','查询用户列表','ext-icon-bullet_wrench','用户列表',0,NULL,'2017-01-01 00:00:00','/base/frmUser!grid','60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888yhsc','2017-01-01 00:00:00','删除用户','ext-icon-bullet_wrench','删除用户',3,NULL,'2017-01-01 00:00:00','/base/frmUser!delete','60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888yhtj','2017-01-01 00:00:00','添加用户','ext-icon-bullet_wrench','添加用户',1,NULL,'2017-01-01 00:00:00','/base/frmUser!save','60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888zygl','2017-01-01 00:00:00','管理系统的资源','ext-icon-newspaper_link','资源管理',1,NULL,'2017-01-01 00:00:00','/jsp/base/FrmResource.jsp','60366688-0001-0001-0011-88888888xtgl','60366688-0001-0001-0011-8888rstype00');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888zybj','2017-01-01 00:00:00','编辑资源','ext-icon-bullet_wrench','编辑资源',2,NULL,'2017-01-01 00:00:00','/base/frmResource!update','60366688-0001-0001-0011-88888888zygl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888zyck','2017-01-01 00:00:00','查看资源','ext-icon-bullet_wrench','查看资源',4,NULL,'2017-01-01 00:00:00','/base/frmResource!getById','60366688-0001-0001-0011-88888888zygl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888zylb','2017-01-01 00:00:00','查询资源','ext-icon-bullet_wrench','资源列表',0,NULL,'2017-01-01 00:00:00','/base/frmResource!treeGrid','60366688-0001-0001-0011-88888888zygl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888zysc','2017-01-01 00:00:00','删除资源','ext-icon-bullet_wrench','删除资源',3,NULL,'2017-01-01 00:00:00','/base/frmResource!delete','60366688-0001-0001-0011-88888888zygl','60366688-0001-0001-0011-8888rstype01');
insert  into `frm_resource`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`target`,`updateDatetime`,`url`,`resource_id`,`resourcetype_id`) values ('60366688-0001-0001-0011-88888888zytj','2017-01-01 00:00:00','添加资源','ext-icon-bullet_wrench','添加资源',1,NULL,'2017-01-01 00:00:00','/base/frmResource!save','60366688-0001-0001-0011-88888888zygl','60366688-0001-0001-0011-8888rstype01');

/*Data for the table `frm_serialnumber` */

insert  into `frm_serialnumber`(`id`,`createDatetime `,`updateDatetime`,`metaColumn`,`metaTable`,`name`,`relatAddTeature`,`relatTeature`,`serialNumber`,`deleteFlag`) values ('a10d89ac-8ed4-48e0-b370-9dafa0dc00e3','2017-02-09 09:55:59','2017-02-09 09:55:59','number','IFR_LOANTICKET',NULL,NULL,'2',19,0);

/*Data for the table `frm_user` */

insert  into `frm_user`(`id`,`age`,`createDatetime `,`loginName`,`NAME`,`photo`,`pwd`,`sex`,`updateDatetime`) values ('60366688-0001-0001-0011-888888user01',30,'2017-01-01 00:00:00','admin','超级管理员',NULL,'c4ca4238a0b923820dcc509a6f75849b','1','2017-01-01 00:00:00');

/*Data for the table `frm_role` */

insert  into `frm_role`(`id`,`createDatetime `,`description`,`iconcls`,`NAME`,`seq`,`updateDatetime`) values ('60366688-0001-0001-0011-888888role01','2017-01-01 00:00:00','拥有系统所有权限',NULL,'超管',0,'2017-01-01 00:00:00');

/*Data for the table `frm_organizationResource` */

insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888jgck','60366688-0001-0001-0011-88888888org1');
insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888jggl','60366688-0001-0001-0011-88888888org1');
insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888jglb','60366688-0001-0001-0011-88888888org1');
insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888jsck','60366688-0001-0001-0011-88888888org1');
insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888jsgl','60366688-0001-0001-0011-88888888org1');
insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888jslb','60366688-0001-0001-0011-88888888org1');
insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888xtgl','60366688-0001-0001-0011-88888888org1');
insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888yhck','60366688-0001-0001-0011-88888888org1');
insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888yhgl','60366688-0001-0001-0011-88888888org1');
insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888yhlb','60366688-0001-0001-0011-88888888org1');
insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888zyck','60366688-0001-0001-0011-88888888org1');
insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888zygl','60366688-0001-0001-0011-88888888org1');
insert  into `frm_organizationResource`(`resource_id`,`organization_id`) values ('60366688-0001-0001-0011-88888888zylb','60366688-0001-0001-0011-88888888org1');

/*Data for the table `frm_roleResource` */

insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','0c9c6724-a92b-4479-b7fe-b6fb0134afc9');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','202c4ea3-454f-4df4-b50b-4394eed6978e');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','4e85e519-3b03-4fdc-ab2c-17d0dbc72209');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','5d0bdb0a-aa02-4734-9bfc-1b263aea7430');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','5d9d85c4-32f0-4c58-b892-619e03ac4b6a');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','750db3a0-f034-48e4-9c72-68d9562176fe');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','75119f99-af52-45c2-aa56-bcbdb694b152');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','8a3ffd73-4ca9-4b4a-8535-ef0dd169d26e');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','9d12ffcc-d6ed-49a9-91d7-d08e4cb60985');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','a5f202ef-d69e-4e59-ae9d-3008d6e28ad3');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','da69bb50-09e7-400d-b46d-c204df6afbf7');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','dd4ff8ec-7b45-4be3-b28d-c639f5a120c5');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','df9a5d92-fcbb-4522-b053-f2dc73166f16');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','f4bd3e23-7313-4996-bc61-35070266053d');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','fa68f5df-3444-4599-92cd-365373f937b5');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jgbj');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jgck');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jggl');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jglb');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jgsc');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jgsq');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jgtj');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jsbj');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jsck');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jsgl');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jslb');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jssc');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jssq');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888jstj');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-888888online');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88onlineGrid');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888xtgl');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888xtjk');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhbj');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhck');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhgl');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhjg');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhjs');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhlb');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhsc');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888yhtj');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888zybj');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888zyck');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888zygl');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888zylb');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888zysc');
insert  into `frm_roleResource`(`role_id`,`resource_id`) values ('60366688-0001-0001-0011-888888role01','60366688-0001-0001-0011-88888888zytj');

/*Data for the table `frm_userOrganization` */

insert  into `frm_userOrganization`(`user_id`,`organization_id`) values ('60366688-0001-0001-0011-888888user01','60366688-0001-0001-0011-88888888org1');

/*Data for the table `frm_userRole` */

insert  into `frm_userRole`(`user_id`,`role_id`) values ('60366688-0001-0001-0011-888888user01','60366688-0001-0001-0011-888888role01');

/*Table structure for table `ifr_customer` */

CREATE TABLE `ifr_customer` (
  `id` varchar(36) NOT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `address` varchar(16) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `idAddress` varchar(16) DEFAULT NULL,
  `idNumber` varchar(20) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `occupation` varchar(16) DEFAULT NULL,
  `phoneNumber` varchar(16) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `secondPhoneNumber` varchar(16) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `deleteFlag` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ifr_customer` */

/*Table structure for table `ifr_loanticket` */

CREATE TABLE `ifr_loanticket` (
  `id` varchar(36) NOT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `bizType` tinyint(4) DEFAULT NULL,
  `deleteFlag` tinyint(4) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `feeRate` decimal(19,2) DEFAULT NULL,
  `monthNum` int(11) DEFAULT NULL,
  `monthRate` decimal(19,2) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `orgCode` varchar(6) DEFAULT NULL,
  `penaltyRate` decimal(19,2) DEFAULT NULL,
  `principalAmt` int(11) DEFAULT NULL,
  `yearRate` decimal(19,2) DEFAULT NULL,
  `startBizDate` date DEFAULT NULL,
  `customer_idNumber` varchar(20) DEFAULT NULL,
  `customer_name` varchar(64) DEFAULT NULL,
  `customer_id` varchar(36) DEFAULT NULL,
  `endBizDate` date DEFAULT NULL,
  `epAllFee` decimal(19,2) DEFAULT NULL,
  `epAllInterest` decimal(19,2) DEFAULT NULL,
  `printTime` datetime DEFAULT NULL,
  `printTimes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pcutknvkkjmx9q9ohtaxqub4g` (`customer_id`),
  CONSTRAINT `FK_pcutknvkkjmx9q9ohtaxqub4g` FOREIGN KEY (`customer_id`) REFERENCES `ifr_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ifr_loanticket` */

/*Table structure for table `ifr_paymentinfo` */

CREATE TABLE `ifr_paymentinfo` (
  `id` varchar(36) NOT NULL,
  `createDatetime ` datetime DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `actualMonthNum` int(11) NOT NULL,
  `apFeeAmt` int(11) NOT NULL,
  `apInterestAmt` int(11) NOT NULL,
  `apPenaltyAmt` int(11) NOT NULL,
  `apPrincipalAmt` int(11) NOT NULL,
  `apSubtotalAmt` int(11) NOT NULL,
  `bizDate` datetime DEFAULT NULL,
  `bizType` tinyint(4) NOT NULL,
  `deleteFlag` tinyint(4) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `orgCode` varchar(255) DEFAULT NULL,
  `payType` tinyint(4) NOT NULL,
  `rdFeeAmt` decimal(19,2) DEFAULT NULL,
  `rdInterestAmt` decimal(19,2) DEFAULT NULL,
  `rdPenaltyAmt` decimal(19,2) DEFAULT NULL,
  `rpFeeAmt` decimal(19,2) DEFAULT NULL,
  `rpInterestAmt` decimal(19,2) DEFAULT NULL,
  `rpPenaltyAmt` decimal(19,2) DEFAULT NULL,
  `rpSubtotalAmt` decimal(19,2) DEFAULT NULL,
  `loanTicket_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_k8im40bwf5mxyg54iahg0q7i2` (`loanTicket_id`),
  CONSTRAINT `FK_k8im40bwf5mxyg54iahg0q7i2` FOREIGN KEY (`loanTicket_id`) REFERENCES `ifr_loanticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ifr_paymentinfo` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
