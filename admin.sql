-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: quguoyun
-- ------------------------------------------------------
-- Server version	5.6.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_article`
--

DROP TABLE IF EXISTS `admin_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(100) NOT NULL COMMENT '文章标题',
  `article_subtitle` varchar(50) DEFAULT NULL COMMENT '文章副标题',
  `article_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示状态 0显示 1隐藏',
  `article_createtime` varchar(12) NOT NULL,
  `article_updatetime` varchar(12) DEFAULT NULL,
  `article_sort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '所属栏目id',
  `uid` int(11) NOT NULL COMMENT '发布者id',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶 0否 1是',
  `article_icon` varchar(200) DEFAULT NULL COMMENT '文章图标/封面图',
  `article_backimg` varchar(200) DEFAULT NULL COMMENT '文章副图标、隐藏层、内容图',
  `article_describe` varchar(300) DEFAULT NULL COMMENT '文章描述',
  `browser_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_article`
--

LOCK TABLES `admin_article` WRITE;
/*!40000 ALTER TABLE `admin_article` DISABLE KEYS */;
INSERT INTO `admin_article` VALUES (1,'第一篇文章','',0,'1534904081','1539677689',0,1,0,0,'','','',0),(4,'超级文章','boom',0,'1539652818',NULL,0,1,1,0,'//qgadmin.com:85/upload/images/20181016/ad719b3fbbd4062ba8cac2fbe2d859f7.jpg','//qgadmin.com:85/upload/images/20181016/74eff24391f21dd6a2246ae0d8c0d076.png','发噶的规划是否合格',0),(5,'第二个文章','哈哈哈',0,'1539652970','1539658675',0,3,1,0,'//qgadmin.com:85/upload/images/20181016/f9fcebefef49c1b07d22491c89e0e5fb.jpg','','',0);
/*!40000 ALTER TABLE `admin_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_article_column`
--

DROP TABLE IF EXISTS `admin_article_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_article_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `column_title` varchar(45) NOT NULL COMMENT '栏目标题',
  `column_icon` varchar(200) DEFAULT NULL COMMENT '栏目图标/封面图',
  `column_backimg` varchar(200) DEFAULT NULL COMMENT '栏目副图标、隐藏层、内容图',
  `column_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '栏目显示状态 0显示 1隐藏',
  `column_createtime` varchar(12) NOT NULL COMMENT '创建时间',
  `column_updatetime` varchar(12) DEFAULT NULL,
  `column_sort` int(11) NOT NULL DEFAULT '0' COMMENT '栏目顺序',
  `pid` int(11) NOT NULL DEFAULT '0',
  `column_subtitle` varchar(50) DEFAULT NULL COMMENT '栏目副标题',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0页面栏目 1新闻栏目 2跳转栏目',
  `column_describe` varchar(300) DEFAULT NULL COMMENT '描述',
  `column_jump` varchar(100) DEFAULT NULL COMMENT '跳转路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_article_column`
--

LOCK TABLES `admin_article_column` WRITE;
/*!40000 ALTER TABLE `admin_article_column` DISABLE KEYS */;
INSERT INTO `admin_article_column` VALUES (1,'第一','//qgadmin.com:85/upload/images/20181015/9d287d87effa7e14d5075cf8f3d9df06.png','',0,'1534904081','1539567492',0,0,'boom',1,'shfsdgsfgdsfrf',NULL),(2,'第二','','',0,'1534904081','1539677700',0,0,'',0,'',NULL),(3,'第一一','',NULL,0,'1534904081',NULL,0,1,NULL,0,NULL,NULL),(4,'第二一','',NULL,0,'1534904081',NULL,0,2,NULL,0,NULL,NULL),(5,'第一一一','',NULL,0,'1534904081',NULL,0,3,NULL,0,NULL,NULL),(6,'第一一一一','',NULL,0,'1534904081',NULL,0,5,NULL,0,NULL,NULL),(7,'第一一一二','',NULL,0,'1534904081',NULL,0,5,NULL,0,NULL,NULL),(8,'第一一二','',NULL,0,'1534904081',NULL,0,3,NULL,0,NULL,NULL),(9,'超级无敌栏目','','',0,'1539423842',NULL,0,1,'boom',0,'哈哈哈哈',NULL),(11,'页面栏目','','',0,'1539673370','1539673452',0,0,'敖德萨',2,'','大萨达撒');
/*!40000 ALTER TABLE `admin_article_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_article_data`
--

DROP TABLE IF EXISTS `admin_article_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_article_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '文章id',
  `article_content` text COMMENT '文章内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_article_data`
--

LOCK TABLES `admin_article_data` WRITE;
/*!40000 ALTER TABLE `admin_article_data` DISABLE KEYS */;
INSERT INTO `admin_article_data` VALUES (1,5,'一五五唯一1');
/*!40000 ALTER TABLE `admin_article_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_auth_group`
--

DROP TABLE IF EXISTS `admin_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  `rules` varchar(250) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则ID 以,分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='后台账号用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_auth_group`
--

LOCK TABLES `admin_auth_group` WRITE;
/*!40000 ALTER TABLE `admin_auth_group` DISABLE KEYS */;
INSERT INTO `admin_auth_group` VALUES (1,'管理员',0,'1'),(2,'测试',0,'2'),(3,'大用户组',0,'4,2');
/*!40000 ALTER TABLE `admin_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_auth_group_access`
--

DROP TABLE IF EXISTS `admin_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_auth_group_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `group_id` varchar(250) NOT NULL COMMENT '用户组id 以,隔开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_auth_group_access`
--

LOCK TABLES `admin_auth_group_access` WRITE;
/*!40000 ALTER TABLE `admin_auth_group_access` DISABLE KEYS */;
INSERT INTO `admin_auth_group_access` VALUES (1,2,'3,2,1'),(2,14,'3,2'),(5,1,'1'),(6,17,'2');
/*!40000 ALTER TABLE `admin_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_auth_rule`
--

DROP TABLE IF EXISTS `admin_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '所属顶级栏目id',
  `rule_name` varchar(50) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `rule` varchar(50) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `rule_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`rule`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='后台账号规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_auth_rule`
--

LOCK TABLES `admin_auth_rule` WRITE;
/*!40000 ALTER TABLE `admin_auth_rule` DISABLE KEYS */;
INSERT INTO `admin_auth_rule` VALUES (1,5,'测试','index/index/s',1,''),(2,1,'权限列表','index/rule/index',0,''),(4,1,'菜单列表','index/menu/index',0,'');
/*!40000 ALTER TABLE `admin_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_column_info`
--

DROP TABLE IF EXISTS `admin_column_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_column_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `column_content` text COMMENT '页面栏目内容',
  `cid` int(11) NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_column_info`
--

LOCK TABLES `admin_column_info` WRITE;
/*!40000 ALTER TABLE `admin_column_info` DISABLE KEYS */;
INSERT INTO `admin_column_info` VALUES (1,'<p>\r\n	阿斯顿发生\r\n</p>\r\n<p>\r\n	大晚上大所\r\n</p>\r\n<p>\r\n	.奥术大师大\r\n</p>',11),(4,'',2),(5,'',10);
/*!40000 ALTER TABLE `admin_column_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '菜单类型; 0:只作为菜单 1可访问菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0显示 1不显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `url` varchar(40) NOT NULL DEFAULT '' COMMENT '栏目指向地址',
  `param` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (1,0,0,0,1,'','','系统设置','fa-gears',''),(2,1,1,0,1,'index/menu/index','','菜单列表','',''),(3,1,1,0,0,'index/rule/index','','权限列表','',''),(10,0,0,0,10,'','','用户管理','fa-user',''),(11,10,1,0,10,'index/user/index','','管理员','fa-circle-o',''),(12,0,1,0,0,'index/index/index','','boom','fa-circle-o',''),(13,10,1,0,9,'index/user/group','','用户组','fa-circle-o',''),(14,0,0,0,0,'','','文章管理','fa-th-list',''),(15,14,1,0,0,'article/column/index','','栏目列表','fa-circle-o',''),(19,14,1,0,0,'article/article/index','','文章列表','fa-circle-o',''),(20,14,1,0,0,'article/position/index','','推荐位','fa-circle-o','');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_position`
--

DROP TABLE IF EXISTS `admin_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(45) NOT NULL COMMENT '推荐位名称',
  `position_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐位状态0 正常 1禁用',
  `position_sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_position`
--

LOCK TABLES `admin_position` WRITE;
/*!40000 ALTER TABLE `admin_position` DISABLE KEYS */;
INSERT INTO `admin_position` VALUES (1,'第一个推荐',0,0),(2,'第二个推荐',0,1);
/*!40000 ALTER TABLE `admin_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_position_access`
--

DROP TABLE IF EXISTS `admin_position_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_position_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '推荐位id',
  `cid` int(11) NOT NULL COMMENT '栏目id/内容id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 1文章推荐 2栏目推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_position_access`
--

LOCK TABLES `admin_position_access` WRITE;
/*!40000 ALTER TABLE `admin_position_access` DISABLE KEYS */;
INSERT INTO `admin_position_access` VALUES (1,2,2,1),(2,2,3,1),(3,2,4,1),(5,2,5,1),(7,2,1,1),(9,2,2,2);
/*!40000 ALTER TABLE `admin_position_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_account` varchar(20) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `createtime` varchar(12) NOT NULL COMMENT '创建时间',
  `admin_name` varchar(45) NOT NULL,
  `admin_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '启用状态 0正常 1禁用',
  `admin_head` varchar(200) DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_account_UNIQUE` (`admin_account`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='后台账号密码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','1534904081','管理员',0,''),(2,'user1','e10adc3949ba59abbe56e057f20f883e','1534904081','用户一号',0,''),(14,'user0','e10adc3949ba59abbe56e057f20f883e','1534904081','大管理员',0,NULL),(17,'booms','e10adc3949ba59abbe56e057f20f883e','1539310883','boom',0,NULL);
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-16 16:18:11
