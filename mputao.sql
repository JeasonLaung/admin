/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mputao

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-04-01 19:13:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_article`
-- ----------------------------
DROP TABLE IF EXISTS `admin_article`;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_article
-- ----------------------------
INSERT INTO `admin_article` VALUES ('1', '第一篇文章', '', '0', '1534904081', '1539677689', '0', '1', '0', '0', '', '', '', '0');
INSERT INTO `admin_article` VALUES ('4', '超级文章', 'boom', '0', '1539652818', null, '0', '1', '1', '0', '//qgadmin.com:85/upload/images/20181016/ad719b3fbbd4062ba8cac2fbe2d859f7.jpg', '//qgadmin.com:85/upload/images/20181016/74eff24391f21dd6a2246ae0d8c0d076.png', '发噶的规划是否合格', '0');
INSERT INTO `admin_article` VALUES ('5', '第二个文章', '哈哈哈', '0', '1539652970', '1539658675', '0', '3', '1', '0', '//qgadmin.com:85/upload/images/20181016/f9fcebefef49c1b07d22491c89e0e5fb.jpg', '', '', '0');

-- ----------------------------
-- Table structure for `admin_article_column`
-- ----------------------------
DROP TABLE IF EXISTS `admin_article_column`;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_article_column
-- ----------------------------
INSERT INTO `admin_article_column` VALUES ('1', '第一', '//qgadmin.com:85/upload/images/20181015/9d287d87effa7e14d5075cf8f3d9df06.png', '', '0', '1534904081', '1539567492', '0', '0', 'boom', '1', 'shfsdgsfgdsfrf', null);
INSERT INTO `admin_article_column` VALUES ('2', '第二', '', '', '0', '1534904081', '1539677700', '0', '0', '', '0', '', null);
INSERT INTO `admin_article_column` VALUES ('3', '第一一', '', null, '0', '1534904081', null, '0', '1', null, '0', null, null);
INSERT INTO `admin_article_column` VALUES ('4', '第二一', '', null, '0', '1534904081', null, '0', '2', null, '0', null, null);
INSERT INTO `admin_article_column` VALUES ('5', '第一一一', '', null, '0', '1534904081', null, '0', '3', null, '0', null, null);
INSERT INTO `admin_article_column` VALUES ('6', '第一一一一', '', null, '0', '1534904081', null, '0', '5', null, '0', null, null);
INSERT INTO `admin_article_column` VALUES ('7', '第一一一二', '', null, '0', '1534904081', null, '0', '5', null, '0', null, null);
INSERT INTO `admin_article_column` VALUES ('8', '第一一二', '', null, '0', '1534904081', null, '0', '3', null, '0', null, null);
INSERT INTO `admin_article_column` VALUES ('9', '超级无敌栏目', '', '', '0', '1539423842', null, '0', '1', 'boom', '0', '哈哈哈哈', null);
INSERT INTO `admin_article_column` VALUES ('11', '页面栏目', '', '', '0', '1539673370', '1539673452', '0', '0', '敖德萨', '2', '', '大萨达撒');

-- ----------------------------
-- Table structure for `admin_article_data`
-- ----------------------------
DROP TABLE IF EXISTS `admin_article_data`;
CREATE TABLE `admin_article_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '文章id',
  `article_content` text COMMENT '文章内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_article_data
-- ----------------------------
INSERT INTO `admin_article_data` VALUES ('1', '5', '一五五唯一1');

-- ----------------------------
-- Table structure for `admin_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `admin_auth_group`;
CREATE TABLE `admin_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  `rules` varchar(250) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则ID 以,分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='后台账号用户组表';

-- ----------------------------
-- Records of admin_auth_group
-- ----------------------------
INSERT INTO `admin_auth_group` VALUES ('1', '管理员', '0', '5,47');
INSERT INTO `admin_auth_group` VALUES ('2', '测试', '0', '2');
INSERT INTO `admin_auth_group` VALUES ('6', '运营', '0', '44,43,42,41,40,33,32,31,30,29,28,27,26,25,24,23,22,21,15,47');
INSERT INTO `admin_auth_group` VALUES ('10', '普通用户', '0', '78,77,76,70,69,68,56,55,54,53,52');
INSERT INTO `admin_auth_group` VALUES ('11', '分销商', '0', '78,77,76,73,70,69,68,57,56,55,54,53,52');
INSERT INTO `admin_auth_group` VALUES ('12', '供应商', '0', '82,81,80,79,78,77,76,75,74,72,70,69,68,67,65,63,59,58,57,53,52,51,50,49');
INSERT INTO `admin_auth_group` VALUES ('13', '葡萄客服', '0', '83,82,81,80,79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,59,58,57,56,55,54,53,52,51,50,49');

-- ----------------------------
-- Table structure for `admin_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `admin_auth_group_access`;
CREATE TABLE `admin_auth_group_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `group_id` varchar(250) NOT NULL COMMENT '用户组id 以,隔开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_auth_group_access
-- ----------------------------
INSERT INTO `admin_auth_group_access` VALUES ('1', '2', '6');
INSERT INTO `admin_auth_group_access` VALUES ('5', '1', '1,5');
INSERT INTO `admin_auth_group_access` VALUES ('7', '18', '6,5');

-- ----------------------------
-- Table structure for `admin_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `admin_auth_rule`;
CREATE TABLE `admin_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '所属顶级栏目id',
  `rule_name` varchar(50) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `rule` varchar(50) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `rule_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`rule`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COMMENT='后台账号规则表';

-- ----------------------------
-- Records of admin_auth_rule
-- ----------------------------
INSERT INTO `admin_auth_rule` VALUES ('2', '1', '权限列表', 'admin/rule/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('4', '1', '菜单列表', 'admin/menu/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('5', '14', '删除报价', 'purchase_admin/quote/delete', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('6', '14', '新增报价页', 'purchase_admin/quote/create', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('7', '14', '新增报价', 'purchase_admin/quote/save', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('8', '14', '修改报价', 'purchase_admin/quote/update', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('9', '14', '修改报价页', 'purchase_admin/quote/edit', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('10', '14', '新增需求页', 'purchase_admin/ask/create', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('11', '14', '新增需求', 'purchase_admin/ask/save', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('12', '14', '删除需求', 'purchase_admin/ask/delete', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('13', '14', '编辑需求页', 'purchase_admin/ask/edit', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('14', '14', '编辑需求', 'purchase_admin/ask/update', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('15', '14', '查看需求页', 'purchase_admin/ask/read', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('16', '14', '新增车源页', 'purchase_admin/market/create', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('17', '14', '新增车源', 'purchase_admin/market/save', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('18', '14', '修改车源页', 'purchase_admin/market/edit', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('19', '14', '修改车源', 'purchase_admin/market/update', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('20', '14', '删除车源', 'purchase_admin/market/delete', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('21', '14', '查看车源页', 'purchase_admin/market/read', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('22', '14', '新增供应商页', 'purchase_admin/supplier/create', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('23', '14', '新增供应商', 'purchase_admin/supplier/save', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('24', '14', '编辑供应商页', 'purchase_admin/supplier/eidt', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('25', '14', '编辑供应商', 'purchase_admin/supplier/update', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('26', '14', '查看供应商页', 'purchase_admin/supplier/read', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('27', '14', '删除供应商', 'purchase_admin/supplier/delete', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('28', '14', '新增分销商页', 'purchase_admin/trader/create', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('29', '14', '新增分销商', 'purchase_admin/trader/save', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('30', '14', '编辑分销商页', 'purchase_admin/trader/edit', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('31', '14', '编辑分销商', 'purchase_admin/trader/update', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('32', '14', '删除分销商', 'purchase_admin/trader/delete', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('33', '14', '查看分销商', 'purchase_admin/trader/read', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('34', '14', '新增平行进口文章页', 'purchase_admin/article/create', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('35', '14', '新增平行进口文章', 'purchase_admin/article/save', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('36', '14', '编辑平行进口文章页', 'purchase_admin/article/edit', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('37', '14', '编辑平行进口文章', 'purchase_admin/article/update', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('38', '14', '删除平行进口文章', 'purchase_admin/article/delete', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('39', '14', '查看平行进口文章', 'purchase_admin/article/read', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('40', '14', '所有报价', 'purchase_admin/quote/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('41', '14', '所有需求', 'purchase_admin/ask/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('42', '14', '所有车源', 'purchase_admin/market/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('43', '14', '所有供应商', 'purchase_admin/supplier/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('44', '14', '所有分销商', 'purchase_admin/trader/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('45', '14', '所有平行进口文章', 'purchase_admin/article/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('47', '1', '主页', 'admin/index/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('48', '14', '采购平台用户管理', 'purchase_admin/user/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('49', '30', '编辑车源', 'purchase/market/update', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('50', '30', '新增车源', 'purchase/market/save', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('51', '30', '删除车源', 'purchase/market/delete', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('52', '30', '查看车源（单个）', 'purchase/market/read', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('53', '30', '查看车源', 'purchase/market/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('54', '30', '新增需求', 'purchase/ask/save', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('55', '30', '编辑需求', 'purchase/ask/update', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('56', '30', '删除需求', 'purchase/ask/delete', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('57', '30', '查看需求(单个)', 'purchase/ask/read', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('58', '30', '查看需求', 'purchase/ask/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('59', '30', '需求下的报价', 'purchase/ask/quote', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('63', '30', '删除报价', 'purchase/quote/delete', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('64', '30', '查看报价(单个)', 'purchase/quote/read', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('65', '30', '查看报价（需求下）', 'purchase/quote/index', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('66', '30', '报价消息', 'purchase/message/quote', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('67', '30', '需求消息', 'purchase/message/ask', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('68', '30', '关注品牌', 'purchase/brand/follow', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('69', '30', '取消关注品牌', 'purchase/brand/unfollow', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('70', '30', '获取关注品牌', 'purchase/brand/get_follow', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('71', '30', '品牌', 'purchase/brand', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('72', '30', '品牌下车型', 'purchase/brand/type', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('73', '30', '我的需求', 'purchase/ask/my', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('74', '30', '我的报价', 'purchase/quote/my', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('75', '30', '我的车源', 'purchase/market/my', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('76', '30', '收藏车源', 'purchase/market/like', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('77', '30', '取消收藏车源', 'purchase/market/unlike', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('78', '30', '我的收藏车源', 'purchase/market/my_like', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('79', '30', '新增报价', 'purchase/quote/save', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('80', '30', '新增平行进口', 'purchase/imported/save', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('81', '30', '删除平行进口', 'purchase/imported/delete', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('82', '30', '编辑平行进口', 'purchase/imported/update', '0', '');
INSERT INTO `admin_auth_rule` VALUES ('83', '30', '查看平行进口', 'purchase/imported/index', '0', '');

-- ----------------------------
-- Table structure for `admin_column_info`
-- ----------------------------
DROP TABLE IF EXISTS `admin_column_info`;
CREATE TABLE `admin_column_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `column_content` text COMMENT '页面栏目内容',
  `cid` int(11) NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_column_info
-- ----------------------------
INSERT INTO `admin_column_info` VALUES ('1', '<p>\r\n	阿斯顿发生\r\n</p>\r\n<p>\r\n	大晚上大所\r\n</p>\r\n<p>\r\n	.奥术大师大\r\n</p>', '11');
INSERT INTO `admin_column_info` VALUES ('4', '', '2');
INSERT INTO `admin_column_info` VALUES ('5', '', '10');

-- ----------------------------
-- Table structure for `admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '0', '0', '1', '', '', '系统设置', 'fa-gears', '');
INSERT INTO `admin_menu` VALUES ('2', '1', '1', '0', '1', 'admin/menu/index', '', '菜单列表', '', '');
INSERT INTO `admin_menu` VALUES ('3', '1', '1', '0', '0', 'admin/rule/index', '', '权限列表', '', '');
INSERT INTO `admin_menu` VALUES ('10', '0', '0', '0', '10', '', '', '用户管理', 'fa-user', '');
INSERT INTO `admin_menu` VALUES ('11', '10', '1', '0', '10', 'admin/user/index', '', '管理员', 'fa-circle-o', '');
INSERT INTO `admin_menu` VALUES ('12', '0', '1', '0', '0', 'admin/index/index', '', 'boom', 'fa-circle-o', '');
INSERT INTO `admin_menu` VALUES ('13', '10', '1', '0', '9', 'admin/user/group', '', '用户组', 'fa-circle-o', '');
INSERT INTO `admin_menu` VALUES ('14', '0', '0', '0', '20', '', '', '采购信息平台管理', 'fa-th-list', '');
INSERT INTO `admin_menu` VALUES ('15', '14', '1', '0', '0', 'purchase_admin/quote/index', '', '报价管理', 'fa-circle-o', '');
INSERT INTO `admin_menu` VALUES ('19', '14', '1', '0', '0', 'purchase_admin/ask/index', '', '需求管理', 'fa-circle-o', '');
INSERT INTO `admin_menu` VALUES ('20', '14', '1', '0', '0', 'purchase_admin/market/index', '', '车源管理', 'fa-circle-o', '');
INSERT INTO `admin_menu` VALUES ('24', '0', '1', '0', '0', 'purchase_admin/verify/index', '', '审核', 'fa-circle-o', '');
INSERT INTO `admin_menu` VALUES ('27', '14', '1', '0', '0', 'purchase_admin/import/index', '', '平行进口文章管理', 'fa-circle-o', '');
INSERT INTO `admin_menu` VALUES ('28', '1', '1', '0', '0', 'admin/brand/index', '', '品牌管理', 'fa-circle-o', '');
INSERT INTO `admin_menu` VALUES ('29', '14', '1', '0', '0', 'purchase_admin/user/index', '', '采购平台用户管理', 'fa fa-user', '');
INSERT INTO `admin_menu` VALUES ('30', '0', '0', '0', '50', '', '', '采购信息平台API', 'fa-circle-o', '');

-- ----------------------------
-- Table structure for `admin_position`
-- ----------------------------
DROP TABLE IF EXISTS `admin_position`;
CREATE TABLE `admin_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(45) NOT NULL COMMENT '推荐位名称',
  `position_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐位状态0 正常 1禁用',
  `position_sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_position
-- ----------------------------
INSERT INTO `admin_position` VALUES ('1', '第一个推荐', '0', '0');
INSERT INTO `admin_position` VALUES ('2', '第二个推荐', '0', '1');

-- ----------------------------
-- Table structure for `admin_position_access`
-- ----------------------------
DROP TABLE IF EXISTS `admin_position_access`;
CREATE TABLE `admin_position_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '推荐位id',
  `cid` int(11) NOT NULL COMMENT '栏目id/内容id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 1文章推荐 2栏目推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_position_access
-- ----------------------------
INSERT INTO `admin_position_access` VALUES ('1', '2', '2', '1');
INSERT INTO `admin_position_access` VALUES ('2', '2', '3', '1');
INSERT INTO `admin_position_access` VALUES ('3', '2', '4', '1');
INSERT INTO `admin_position_access` VALUES ('5', '2', '5', '1');
INSERT INTO `admin_position_access` VALUES ('7', '2', '1', '1');
INSERT INTO `admin_position_access` VALUES ('9', '2', '2', '2');

-- ----------------------------
-- Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_account` varchar(20) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `createtime` varchar(12) NOT NULL COMMENT '创建时间',
  `admin_name` varchar(45) NOT NULL,
  `admin_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '启用状态 0正常 1禁用',
  `admin_head` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_account_UNIQUE` (`admin_account`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='后台账号密码表';

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1534904081', '管理员', '0', '', null, null);
INSERT INTO `admin_user` VALUES ('2', 'user1', 'e10adc3949ba59abbe56e057f20f883e', '1534904081', '用户一号', '0', '', '14', null);
INSERT INTO `admin_user` VALUES ('18', 'jeason', 'e10adc3949ba59abbe56e057f20f883e', '1539310883', 'jeason', '0', null, '15', null);

-- ----------------------------
-- Table structure for `purchase_ask`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_ask`;
CREATE TABLE `purchase_ask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '发布者/销售顾问id',
  `brand_id` int(11) DEFAULT NULL,
  `car_name` varchar(200) NOT NULL,
  `car_price` varchar(20) NOT NULL COMMENT '意向价格',
  `car_product_time` date DEFAULT NULL,
  `province` varchar(20) NOT NULL COMMENT '省',
  `city` varchar(20) NOT NULL COMMENT '市',
  `region` varchar(20) NOT NULL COMMENT '县区',
  `car_color` varchar(10) DEFAULT NULL,
  `car_level` varchar(50) DEFAULT NULL,
  `note` varchar(200) NOT NULL DEFAULT '' COMMENT '备注信息',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否有效（管理员可以设置删除）',
  `is_complete` bit(1) DEFAULT b'0' COMMENT '是否完成交易',
  `is_display` bit(1) DEFAULT b'1' COMMENT '是否显示',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_ask
-- ----------------------------
INSERT INTO `purchase_ask` VALUES ('1', '3', '22', '宝马X1', '11', '2019-01-01', '广东', '佛山', '顺德', '颜色', null, '备注', '1552033150', '1552215222', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('2', '4', '22', '奥马2019', '222', null, '广东', '佛山', '顺德', '红色', null, '备注', '1552033150', '1552033150', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('3', '3', '22', '宝马X1', '322', '2019-01-01', '广东', '佛山', '顺德', '颜色', null, '备注', '1552101030', '1552102086', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('4', '3', '22', '宝马X1', '1', '2019-01-01', '广东', '佛山', '顺德', '颜色', null, '备注', '1552101147', '1552101754', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('5', '4', '22', '奥马2019', '2', '0000-00-00', '广东', '佛山', '顺德', '红色', null, '备注', '1552033150', '1552033150', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('6', '3', '22', '宝马X1', '05', '2019-01-01', '广东', '佛山', '顺德', '颜色', null, '备注', '1552266645', null, '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('7', '3', '22', 'A4L', '11', '2019-03-14', '北京市', '北京市', '东城区', '2', '1', '1211111111', '1552532467', '1552540630', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('8', '4', '22', 'A1', '5', '2019-03-01', '北京市', '北京市', '东城区', '2', '1', 'asd', '1552533019', '1552540736', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('9', '5', '93', '威朗', '7', '2019-03-14', '北京市', '北京市', '东城区', 'color', 'peizhi', 'sss', '1552468000', '1552546334', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('10', '6', '22', 'A1', '10', '2019-03-14', '北京市', '北京市', '东城区', '2', '1', '按时', '1552468000', '1552544652', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('12', '8', '3', 'CLA', '24', '2019-03-14', '北京市', '北京市', '丰台区', 'color', 'peizhi', 'qweqwewqewqeqweqwe', '1552468000', '1552546330', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('13', '2', '22', 'A4L', '10', '2019-02-14', '广东省', '广州市', '荔湾区', '红色', '高配', '请问', '1552468000', null, '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('14', '9', '5', 'A1', '5', '2019-03-14', '北京市', '北京市', '东城区', '红色', '1', '含保险', '1552468000', '1552547131', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('15', '10', '4', 'A1', '201', '2019-03-14', '北京市', '北京市', '东城区', '红色', '1', '含保险', '1552468000', '1552547131', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('16', '3', '22', 'A1', '2', '2019-03-18', '广东省', '佛山市', '顺德区', '2', '1', '22', '1552896341', '1552896662', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('17', '3', '22', 'A1', '5', '2019-03-18', '广东省', '佛山市', '顺德区', '1', '2', '333', '1552900173', '1552957795', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('18', '3', '22', 'A1', '66', '2019-03-18', '广东省', '佛山市', '顺德区', '1', '2', '333', '1552900173', '1552963434', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('19', '3', '22', 'A1', '1', '2019-03-18', '广东省', '佛山市', '顺德区', '1', '2', '333', '1552900173', '1552963438', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('20', '3', '22', 'A1', '2', '2019-03-18', '广东省', '佛山市', '顺德区', '1', '2', '333', '1552900173', null, '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('21', '3', '22', 'A1', '1', '2019-03-19', '广东省', '佛山市', '顺德区', '2', '3', '2', '1552963311', '1552963431', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('22', '3', '22', 'A1', '22', '2019-03-19', '广东省', '佛山市', '顺德区', '1', '22', '1', '1552963416', '1552963428', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('23', '3', '184', 'Cayman', '444', '2019-03-19', '广东省', '佛山市', '顺德区', '333', '222', '', '1552963488', null, '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('24', '17074', '1', 'C180', '4000', '2019-03-22', '广东省', '佛山市', '顺德区', '黑/黑', '配置', '备注信息', '1554007408', '1554007821', '', '', '', '');
INSERT INTO `purchase_ask` VALUES ('25', '17074', '22', 'A1', '222', '2019-04-01', '北京市', '北京市', '东城区', '123', '333', '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '1554099400', '1554101189', '', '', '', '');

-- ----------------------------
-- Table structure for `purchase_chat`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_chat`;
CREATE TABLE `purchase_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_chat
-- ----------------------------
INSERT INTO `purchase_chat` VALUES ('30', '6', '5', '1553788058', '???❤?');
INSERT INTO `purchase_chat` VALUES ('31', '6', '6', '1553788063', '???❤?');
INSERT INTO `purchase_chat` VALUES ('27', '6', '5', '1553788009', '???❤?');
INSERT INTO `purchase_chat` VALUES ('28', '6', '5', '1553788010', '???❤?');
INSERT INTO `purchase_chat` VALUES ('29', '6', '5', '1553788010', '???❤?');
INSERT INTO `purchase_chat` VALUES ('32', '6', '6', '1553788063', '???❤?');
INSERT INTO `purchase_chat` VALUES ('33', '6', '6', '1553788064', '???❤?');
INSERT INTO `purchase_chat` VALUES ('34', '6', '6', '1553788064', '???❤?');
INSERT INTO `purchase_chat` VALUES ('35', '6', '6', '1553788064', '???❤?');
INSERT INTO `purchase_chat` VALUES ('36', '7', '6', '1553788077', 'asdasdasdasdasdsadas');
INSERT INTO `purchase_chat` VALUES ('37', '7', '6', '1553788077', 'asdasdasdasdasdsadas');
INSERT INTO `purchase_chat` VALUES ('38', '7', '8', '1553788077', 'asdasdasdasdasdsadas');
INSERT INTO `purchase_chat` VALUES ('39', '7', '6', '1553788078', 'asdasdasdasdasdsadas');
INSERT INTO `purchase_chat` VALUES ('40', '7', '6', '1553788078', 'asdasdasdasdasdsadas');
INSERT INTO `purchase_chat` VALUES ('46', '5', '6', '1553788401', 'asdasdasdasdasdsadas');
INSERT INTO `purchase_chat` VALUES ('47', '5', '6', '1553788401', 'asdasdasdasdasdsadas');
INSERT INTO `purchase_chat` VALUES ('48', '5', '6', '1553788412', 'asdasdasdasdasdsadas');
INSERT INTO `purchase_chat` VALUES ('49', '5', '6', '1553788413', 'asdasdasdasdasdsadas');
INSERT INTO `purchase_chat` VALUES ('50', '5', '6', '1553788413', 'asdasdasdasdasdsadas');
INSERT INTO `purchase_chat` VALUES ('51', '5', '6', '1553788413', 'asdasdasdasdasdsadas');
INSERT INTO `purchase_chat` VALUES ('52', '5', null, '1553788445', null);

-- ----------------------------
-- Table structure for `purchase_company`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_company`;
CREATE TABLE `purchase_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `company_info` varchar(255) DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_company
-- ----------------------------
INSERT INTO `purchase_company` VALUES ('1', '喜羊羊科技有限公司', '喜羊羊科技有限公司', null, null, '17074');

-- ----------------------------
-- Table structure for `purchase_company_apply`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_company_apply`;
CREATE TABLE `purchase_company_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '公司名',
  `note` varchar(1000) DEFAULT NULL,
  `licence_pic` varchar(1000) DEFAULT NULL COMMENT '营业执照',
  `create_time` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '申请用户',
  `is_pass` tinyint(4) DEFAULT '0' COMMENT '是否已经处理',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='申请成为供应商';

-- ----------------------------
-- Records of purchase_company_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `purchase_demand_message`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_demand_message`;
CREATE TABLE `purchase_demand_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '供应商',
  `ask_id` int(11) DEFAULT NULL,
  `quote_id` int(11) DEFAULT NULL,
  `is_read` bit(1) DEFAULT b'0' COMMENT '已读',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_demand_message
-- ----------------------------
INSERT INTO `purchase_demand_message` VALUES ('1', '17067', '5', '16', '', '1552290597', null);
INSERT INTO `purchase_demand_message` VALUES ('2', '200', '5', '16', '', '1552290597', null);
INSERT INTO `purchase_demand_message` VALUES ('3', '17067', '5', '16', '', '1552290597', null);
INSERT INTO `purchase_demand_message` VALUES ('4', '100', '5', '16', '', '1552290597', null);
INSERT INTO `purchase_demand_message` VALUES ('5', '9', '14', '18', '', '1552647661', null);
INSERT INTO `purchase_demand_message` VALUES ('6', '10', '15', '19', '', '1552894968', null);
INSERT INTO `purchase_demand_message` VALUES ('7', '3', '3', '18', '', '1552894977', null);
INSERT INTO `purchase_demand_message` VALUES ('8', '10', '15', '21', '', '1552895148', null);
INSERT INTO `purchase_demand_message` VALUES ('9', '3', '17', '22', '', '1552904111', null);
INSERT INTO `purchase_demand_message` VALUES ('10', '3', '6', '23', '', '1552904131', null);
INSERT INTO `purchase_demand_message` VALUES ('11', '3', '4', '24', '', '1552957918', null);
INSERT INTO `purchase_demand_message` VALUES ('12', '9', '14', '25', '', '1552960924', null);
INSERT INTO `purchase_demand_message` VALUES ('13', '9', '14', '26', '', '1552961208', null);
INSERT INTO `purchase_demand_message` VALUES ('14', '9', '14', '27', '', '1552961271', null);
INSERT INTO `purchase_demand_message` VALUES ('15', '9', '14', '29', '', '1554023071', null);
INSERT INTO `purchase_demand_message` VALUES ('16', '9', '14', '30', '', '1554023273', null);
INSERT INTO `purchase_demand_message` VALUES ('17', '9', '14', '31', '', '1554023341', null);
INSERT INTO `purchase_demand_message` VALUES ('18', '3', '23', '32', '', '1554047758', null);
INSERT INTO `purchase_demand_message` VALUES ('19', '9', '14', '33', '', '1554087671', null);
INSERT INTO `purchase_demand_message` VALUES ('20', '9', '14', '34', '', '1554087737', null);
INSERT INTO `purchase_demand_message` VALUES ('21', '9', '14', '35', '', '1554087771', null);
INSERT INTO `purchase_demand_message` VALUES ('22', '9', '14', '36', '', '1554087814', null);
INSERT INTO `purchase_demand_message` VALUES ('23', '9', '14', '37', '', '1554087836', null);
INSERT INTO `purchase_demand_message` VALUES ('24', '9', '14', '38', '', '1554087963', null);

-- ----------------------------
-- Table structure for `purchase_follow_brand`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_follow_brand`;
CREATE TABLE `purchase_follow_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL COMMENT '多个brand',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_follow_brand
-- ----------------------------
INSERT INTO `purchase_follow_brand` VALUES ('8', '17067', '11', '1552372868');
INSERT INTO `purchase_follow_brand` VALUES ('9', '17067', '1', '1552375582');
INSERT INTO `purchase_follow_brand` VALUES ('10', '17067', '93', '1552375590');
INSERT INTO `purchase_follow_brand` VALUES ('13', '17067', '2128', '1552467584');
INSERT INTO `purchase_follow_brand` VALUES ('14', '17067', '2049', '1552467584');
INSERT INTO `purchase_follow_brand` VALUES ('16', '17067', '2136', '1552467955');
INSERT INTO `purchase_follow_brand` VALUES ('17', '17067', '22', '123456');
INSERT INTO `purchase_follow_brand` VALUES ('42', '17073', '22', '0');
INSERT INTO `purchase_follow_brand` VALUES ('44', '3', '107', '1552956915');
INSERT INTO `purchase_follow_brand` VALUES ('45', '3', '192', '1552956916');
INSERT INTO `purchase_follow_brand` VALUES ('48', '17074', '1', '1553999896');

-- ----------------------------
-- Table structure for `purchase_imported`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_imported`;
CREATE TABLE `purchase_imported` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '发布用户id',
  `car_name` varchar(30) DEFAULT NULL,
  `car_level` varchar(30) DEFAULT NULL COMMENT '配置',
  `car_color` varchar(30) DEFAULT NULL,
  `car_procedure` varchar(30) DEFAULT NULL COMMENT '手续',
  `photos` varchar(1000) DEFAULT NULL COMMENT '图片',
  `note` varchar(30) DEFAULT NULL COMMENT '备注',
  `car_price` varchar(10) DEFAULT NULL COMMENT '车价',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1',
  `is_delete` tinyint(4) NOT NULL COMMENT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_imported
-- ----------------------------
INSERT INTO `purchase_imported` VALUES ('1', '17074', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '163', '1', '0');
INSERT INTO `purchase_imported` VALUES ('2', '17074', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '163', '1', '0');
INSERT INTO `purchase_imported` VALUES ('3', '3', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '163', '1', '0');
INSERT INTO `purchase_imported` VALUES ('4', '17074', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '163', '1', '0');
INSERT INTO `purchase_imported` VALUES ('5', '4', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '163', '1', '0');
INSERT INTO `purchase_imported` VALUES ('6', '17074', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '163', '1', '0');
INSERT INTO `purchase_imported` VALUES ('7', '5', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '163', '1', '0');
INSERT INTO `purchase_imported` VALUES ('8', '17074', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '163', '1', '0');
INSERT INTO `purchase_imported` VALUES ('9', '17074', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '163', '1', '0');
INSERT INTO `purchase_imported` VALUES ('10', '17074', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '163', '1', '0');
INSERT INTO `purchase_imported` VALUES ('11', '17074', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '163', '1', '0');
INSERT INTO `purchase_imported` VALUES ('12', '17074', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '163', '1', '0');
INSERT INTO `purchase_imported` VALUES ('13', '17074', '总裁 18款 3.0T 350Hp 豪华 杰尼亚', '中规现车', '黑/黑', '手续齐一周内', '/201903/c83c862170a41138f8d8bfaba53167db.jpg,/201903/840110e6a8ec5fb7550a7e889a28cedb.jpg,/201903/9defabba2f9dfd1bfb4e8b4f820c6810.jpg,/201903/fce0d9ca4eecbc3f5d978d80b9548d72.jpg,/201903/00026451efbcdce3432beb21fee4aa0b.jpg', 'B4-1098 黑色 绿色人 红色 棕色 灰色', '71.37', '1553964304', null, '11', '1', '0');

-- ----------------------------
-- Table structure for `purchase_join_company_apply`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_join_company_apply`;
CREATE TABLE `purchase_join_company_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_join_company_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `purchase_market`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_market`;
CREATE TABLE `purchase_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `market` varchar(1000) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  `is_delete` bit(1) DEFAULT b'0',
  `photos` varchar(1000) DEFAULT NULL COMMENT '图片集',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_market
-- ----------------------------
INSERT INTO `purchase_market` VALUES ('14', '3', '22', 'C180L 3238 大标 白黑 下4.5万保\\nC260L 3508 大标 白米  下4.8万店保\\nC260L 3508 大标 宝蓝黑 下4.1万店保\\nC260L 3508 大标 白黑 下3.7万裸 选双屏\\nC260L 3508 小标 白黑 下4万裸\\nC260 3688 白黑 下6万保\\nC260 3688 白黑 白红 下4.5万裸\\nC300L 4868 大标 白黑 下4万店保\\n \\nE200L4358 大标 白黑 下3.5万保 选全景\\nE300L4758 大标 白棕 下3万裸\\nGLA200 2888 白黑 宝蓝黑 下5.3万店保\\nGLA220 3248 白黑 红黑 下6.3万店保\\n \\nGLC260L 4298 红棕 红黑下2.5万裸\\nGLC260L 4298 白黑 下2万裸 选智乐\\nGLC260L 445  红黑 下3万裸 \\nGLC300L 4898 红棕 灰黑 下3.2万裸\\nGLC300L 4898 白黑 红黑 下3.8万保\\nGLC300L 576  白黑 下7.3万保\\n \\nGLS400 10758 黑棕 黑黑 下9.8万裸19款\\nGLS400 12498 黑棕 黑黑 下9.8万裸19款\\nS320L 8638 黑棕 下6.8万保\\nS320L 8638 黑黑 红宝石黑棕 下7.5万保\\nS350L 94.88 黑米 碳灰蓝棕 下2.5万裸\\nS350L 10288黑棕 平价保\\nS350L 10288 红宝石黑黑 下5千保\\nS450L 12288 黑粽 下2万保 \\nS500L 17328 黑棕 下10万保 国6\\n卖全国另有迈巴赫', '1552900137', null, '', '', '/201903/752e658c591fef3be14e53f1d818ea4b.jpg,/201903/94af28562bda03ba14af107885acef4f.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/c07bc4da105ec19be9b6ecf40f9730a3.jpg,/201903/29b07eaf1709264e833df666ce119439.jpg');
INSERT INTO `purchase_market` VALUES ('15', '12', '22', 'C180L 3238 大标 白黑 下4.5万保\\nC260L 3508 大标 白米  下4.8万店保\\nC260L 3508 大标 宝蓝黑 下4.1万店保\\nC260L 3508 大标 白黑 下3.7万裸 选双屏\\nC260L 3508 小标 白黑 下4万裸\\nC260 3688 白黑 下6万保\\nC260 3688 白黑 白红 下4.5万裸\\nC300L 4868 大标 白黑 下4万店保\\n \\nE200L4358 大标 白黑 下3.5万保 选全景\\nE300L4758 大标 白棕 下3万裸\\nGLA200 2888 白黑 宝蓝黑 下5.3万店保\\nGLA220 3248 白黑 红黑 下6.3万店保\\n \\nGLC260L 4298 红棕 红黑下2.5万裸\\nGLC260L 4298 白黑 下2万裸 选智乐\\nGLC260L 445  红黑 下3万裸 \\nGLC300L 4898 红棕 灰黑 下3.2万裸\\nGLC300L 4898 白黑 红黑 下3.8万保\\nGLC300L 576  白黑 下7.3万保\\n \\nGLS400 10758 黑棕 黑黑 下9.8万裸19款\\nGLS400 12498 黑棕 黑黑 下9.8万裸19款\\nS320L 8638 黑棕 下6.8万保\\nS320L 8638 黑黑 红宝石黑棕 下7.5万保\\nS350L 94.88 黑米 碳灰蓝棕 下2.5万裸\\nS350L 10288黑棕 平价保\\nS350L 10288 红宝石黑黑 下5千保\\nS450L 12288 黑粽 下2万保 \\nS500L 17328 黑棕 下10万保 国6\\n卖全国另有迈巴赫', '1552989086', '1553497115', '', '', '/201903/752e658c591fef3be14e53f1d818ea4b.jpg,/201903/94af28562bda03ba14af107885acef4f.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/c07bc4da105ec19be9b6ecf40f9730a3.jpg,/201903/29b07eaf1709264e833df666ce119439.jpg');
INSERT INTO `purchase_market` VALUES ('9', '5', '22', 'C180L 3238 大标 白黑 下4.5万保\\nC260L 3508 大标 白米  下4.8万店保\\nC260L 3508 大标 宝蓝黑 下4.1万店保\\nC260L 3508 大标 白黑 下3.7万裸 选双屏\\nC260L 3508 小标 白黑 下4万裸\\nC260 3688 白黑 下6万保\\nC260 3688 白黑 白红 下4.5万裸\\nC300L 4868 大标 白黑 下4万店保\\n \\nE200L4358 大标 白黑 下3.5万保 选全景\\nE300L4758 大标 白棕 下3万裸\\nGLA200 2888 白黑 宝蓝黑 下5.3万店保\\nGLA220 3248 白黑 红黑 下6.3万店保\\n \\nGLC260L 4298 红棕 红黑下2.5万裸\\nGLC260L 4298 白黑 下2万裸 选智乐\\nGLC260L 445  红黑 下3万裸 \\nGLC300L 4898 红棕 灰黑 下3.2万裸\\nGLC300L 4898 白黑 红黑 下3.8万保\\nGLC300L 576  白黑 下7.3万保\\n \\nGLS400 10758 黑棕 黑黑 下9.8万裸19款\\nGLS400 12498 黑棕 黑黑 下9.8万裸19款\\nS320L 8638 黑棕 下6.8万保\\nS320L 8638 黑黑 红宝石黑棕 下7.5万保\\nS350L 94.88 黑米 碳灰蓝棕 下2.5万裸\\nS350L 10288黑棕 平价保\\nS350L 10288 红宝石黑黑 下5千保\\nS450L 12288 黑粽 下2万保 \\nS500L 17328 黑棕 下10万保 国6\\n卖全国另有迈巴赫', '1552551079', '1552557014', '', '', '/201903/752e658c591fef3be14e53f1d818ea4b.jpg,/201903/94af28562bda03ba14af107885acef4f.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/c07bc4da105ec19be9b6ecf40f9730a3.jpg,/201903/29b07eaf1709264e833df666ce119439.jpg');
INSERT INTO `purchase_market` VALUES ('10', '44', '2113', 'C180L 3238 大标 白黑 下4.5万保\\nC260L 3508 大标 白米  下4.8万店保\\nC260L 3508 大标 宝蓝黑 下4.1万店保\\nC260L 3508 大标 白黑 下3.7万裸 选双屏\\nC260L 3508 小标 白黑 下4万裸\\nC260 3688 白黑 下6万保\\nC260 3688 白黑 白红 下4.5万裸\\nC300L 4868 大标 白黑 下4万店保\\n \\nE200L4358 大标 白黑 下3.5万保 选全景\\nE300L4758 大标 白棕 下3万裸\\nGLA200 2888 白黑 宝蓝黑 下5.3万店保\\nGLA220 3248 白黑 红黑 下6.3万店保\\n \\nGLC260L 4298 红棕 红黑下2.5万裸\\nGLC260L 4298 白黑 下2万裸 选智乐\\nGLC260L 445  红黑 下3万裸 \\nGLC300L 4898 红棕 灰黑 下3.2万裸\\nGLC300L 4898 白黑 红黑 下3.8万保\\nGLC300L 576  白黑 下7.3万保\\n \\nGLS400 10758 黑棕 黑黑 下9.8万裸19款\\nGLS400 12498 黑棕 黑黑 下9.8万裸19款\\nS320L 8638 黑棕 下6.8万保\\nS320L 8638 黑黑 红宝石黑棕 下7.5万保\\nS350L 94.88 黑米 碳灰蓝棕 下2.5万裸\\nS350L 10288黑棕 平价保\\nS350L 10288 红宝石黑黑 下5千保\\nS450L 12288 黑粽 下2万保 \\nS500L 17328 黑棕 下10万保 国6\\n卖全国另有迈巴赫', '1552555626', '1552556962', '', '', '/201903/752e658c591fef3be14e53f1d818ea4b.jpg,/201903/94af28562bda03ba14af107885acef4f.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/c07bc4da105ec19be9b6ecf40f9730a3.jpg,/201903/29b07eaf1709264e833df666ce119439.jpg');
INSERT INTO `purchase_market` VALUES ('11', '88', '184', 'C180L 3238 大标 白黑 下4.5万保\\nC260L 3508 大标 白米  下4.8万店保\\nC260L 3508 大标 宝蓝黑 下4.1万店保\\nC260L 3508 大标 白黑 下3.7万裸 选双屏\\nC260L 3508 小标 白黑 下4万裸\\nC260 3688 白黑 下6万保\\nC260 3688 白黑 白红 下4.5万裸\\nC300L 4868 大标 白黑 下4万店保\\n \\nE200L4358 大标 白黑 下3.5万保 选全景\\nE300L4758 大标 白棕 下3万裸\\nGLA200 2888 白黑 宝蓝黑 下5.3万店保\\nGLA220 3248 白黑 红黑 下6.3万店保\\n \\nGLC260L 4298 红棕 红黑下2.5万裸\\nGLC260L 4298 白黑 下2万裸 选智乐\\nGLC260L 445  红黑 下3万裸 \\nGLC300L 4898 红棕 灰黑 下3.2万裸\\nGLC300L 4898 白黑 红黑 下3.8万保\\nGLC300L 576  白黑 下7.3万保\\n \\nGLS400 10758 黑棕 黑黑 下9.8万裸19款\\nGLS400 12498 黑棕 黑黑 下9.8万裸19款\\nS320L 8638 黑棕 下6.8万保\\nS320L 8638 黑黑 红宝石黑棕 下7.5万保\\nS350L 94.88 黑米 碳灰蓝棕 下2.5万裸\\nS350L 10288黑棕 平价保\\nS350L 10288 红宝石黑黑 下5千保\\nS450L 12288 黑粽 下2万保 \\nS500L 17328 黑棕 下10万保 国6\\n卖全国另有迈巴赫', '1552555924', '1552556854', '', '', '/201903/752e658c591fef3be14e53f1d818ea4b.jpg,/201903/94af28562bda03ba14af107885acef4f.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/c07bc4da105ec19be9b6ecf40f9730a3.jpg,/201903/29b07eaf1709264e833df666ce119439.jpg');
INSERT INTO `purchase_market` VALUES ('12', '55', '2025', 'C180L 3238 大标 白黑 下4.5万保\\nC260L 3508 大标 白米  下4.8万店保\\nC260L 3508 大标 宝蓝黑 下4.1万店保\\nC260L 3508 大标 白黑 下3.7万裸 选双屏\\nC260L 3508 小标 白黑 下4万裸\\nC260 3688 白黑 下6万保\\nC260 3688 白黑 白红 下4.5万裸\\nC300L 4868 大标 白黑 下4万店保\\n \\nE200L4358 大标 白黑 下3.5万保 选全景\\nE300L4758 大标 白棕 下3万裸\\nGLA200 2888 白黑 宝蓝黑 下5.3万店保\\nGLA220 3248 白黑 红黑 下6.3万店保\\n \\nGLC260L 4298 红棕 红黑下2.5万裸\\nGLC260L 4298 白黑 下2万裸 选智乐\\nGLC260L 445  红黑 下3万裸 \\nGLC300L 4898 红棕 灰黑 下3.2万裸\\nGLC300L 4898 白黑 红黑 下3.8万保\\nGLC300L 576  白黑 下7.3万保\\n \\nGLS400 10758 黑棕 黑黑 下9.8万裸19款\\nGLS400 12498 黑棕 黑黑 下9.8万裸19款\\nS320L 8638 黑棕 下6.8万保\\nS320L 8638 黑黑 红宝石黑棕 下7.5万保\\nS350L 94.88 黑米 碳灰蓝棕 下2.5万裸\\nS350L 10288黑棕 平价保\\nS350L 10288 红宝石黑黑 下5千保\\nS450L 12288 黑粽 下2万保 \\nS500L 17328 黑棕 下10万保 国6\\n卖全国另有迈巴赫', '1552558483', '1552556854', '', '', '/201903/752e658c591fef3be14e53f1d818ea4b.jpg,/201903/94af28562bda03ba14af107885acef4f.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/c07bc4da105ec19be9b6ecf40f9730a3.jpg,/201903/29b07eaf1709264e833df666ce119439.jpg');
INSERT INTO `purchase_market` VALUES ('16', '1', '22', 'C180L 3238 大标 白黑 下4.5万保\\nC260L 3508 大标 白米  下4.8万店保\\nC260L 3508 大标 宝蓝黑 下4.1万店保\\nC260L 3508 大标 白黑 下3.7万裸 选双屏\\nC260L 3508 小标 白黑 下4万裸\\nC260 3688 白黑 下6万保\\nC260 3688 白黑 白红 下4.5万裸\\nC300L 4868 大标 白黑 下4万店保\\n \\nE200L4358 大标 白黑 下3.5万保 选全景\\nE300L4758 大标 白棕 下3万裸\\nGLA200 2888 白黑 宝蓝黑 下5.3万店保\\nGLA220 3248 白黑 红黑 下6.3万店保\\n \\nGLC260L 4298 红棕 红黑下2.5万裸\\nGLC260L 4298 白黑 下2万裸 选智乐\\nGLC260L 445  红黑 下3万裸 \\nGLC300L 4898 红棕 灰黑 下3.2万裸\\nGLC300L 4898 白黑 红黑 下3.8万保\\nGLC300L 576  白黑 下7.3万保\\n \\nGLS400 10758 黑棕 黑黑 下9.8万裸19款\\nGLS400 12498 黑棕 黑黑 下9.8万裸19款\\nS320L 8638 黑棕 下6.8万保\\nS320L 8638 黑黑 红宝石黑棕 下7.5万保\\nS350L 94.88 黑米 碳灰蓝棕 下2.5万裸\\nS350L 10288黑棕 平价保\\nS350L 10288 红宝石黑黑 下5千保\\nS450L 12288 黑粽 下2万保 \\nS500L 17328 黑棕 下10万保 国6\\n卖全国另有迈巴赫', '1553497865', null, '', '', '/201903/752e658c591fef3be14e53f1d818ea4b.jpg,/201903/94af28562bda03ba14af107885acef4f.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/c07bc4da105ec19be9b6ecf40f9730a3.jpg,/201903/29b07eaf1709264e833df666ce119439.jpg');
INSERT INTO `purchase_market` VALUES ('17', '17074', '1', 'C180L 3238 大标 白黑 下4.5万保\nC260L 3508 大标 白米  下4.8万店保\nC260L 3508 大标 宝蓝黑 下4.1万店保\nC260L 3508 大标 白黑 下3.7万裸 选双屏\nC260L 3508 小标 白黑 下4万裸\nC260 3688 白黑 下6万保\nC260 3688 白黑 白红 下4.5万裸\nC300L 4868 大标 白黑 下4万店保\n \nE200L4358 大标 白黑 下3.5万保 选全景\nE300L4758 大标 白棕 下3万裸\nGLA200 2888 白黑 宝蓝黑 下5.3万店保\nGLA220 3248 白黑 红黑 下6.3万店保\n \nGLC260L 4298 红棕 红黑下2.5万裸\nGLC260L 4298 白黑 下2万裸 选智乐\nGLC260L 445  红黑 下3万裸 \nGLC300L 4898 红棕 灰黑 下3.2万裸\nGLC300L 4898 白黑 红黑 下3.8万保\nGLC300L 576  白黑 下7.3万保\n \nGLS400 10758 黑棕 黑黑 下9.8万裸19款\nGLS400 12498 黑棕 黑黑 下9.8万裸19款\nS320L 8638 黑棕 下6.8万保\nS320L 8638 黑黑 红宝石黑棕 下7.5万保\nS350L 94.88 黑米 碳灰蓝棕 下2.5万裸\nS350L 10288黑棕 平价保\nS350L 10288 红宝石黑黑 下5千保\nS450L 12288 黑粽 下2万保 \nS500L 17328 黑棕 下10万保 国6\n卖全国另有迈巴赫', '1554003574', '1554004295', '', '', '/201903/752e658c591fef3be14e53f1d818ea4b.jpg,/201903/94af28562bda03ba14af107885acef4f.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/c07bc4da105ec19be9b6ecf40f9730a3.jpg,/201903/29b07eaf1709264e833df666ce119439.jpg');
INSERT INTO `purchase_market` VALUES ('18', '17074', '2136', 'C180L 3238 大标 白黑 下4.5万保\nC260L 3508 大标 白米  下4.8万店保\nC260L 3508 大标 宝蓝黑 下4.1万店保\nC260L 3508 大标 白黑 下3.7万裸 选双屏\nC260L 3508 小标 白黑 下4万裸\nC260 3688 白黑 下6万保\nC260 3688 白黑 白红 下4.5万裸\nC300L 4868 大标 白黑 下4万店保\n \nE200L4358 大标 白黑 下3.5万保 选全景\nE300L4758 大标 白棕 下3万裸\nGLA200 2888 白黑 宝蓝黑 下5.3万店保\nGLA220 3248 白黑 红黑 下6.3万店保\n \nGLC260L 4298 红棕 红黑下2.5万裸\nGLC260L 4298 白黑 下2万裸 选智乐\nGLC260L 445  红黑 下3万裸 \nGLC300L 4898 红棕 灰黑 下3.2万裸\nGLC300L 4898 白黑 红黑 下3.8万保\nGLC300L 576  白黑 下7.3万保\n \nGLS400 10758 黑棕 黑黑 下9.8万裸19款\nGLS400 12498 黑棕 黑黑 下9.8万裸19款\nS320L 8638 黑棕 下6.8万保\nS320L 8638 黑黑 红宝石黑棕 下7.5万保\nS350L 94.88 黑米 碳灰蓝棕 下2.5万裸\nS350L 10288黑棕 平价保\nS350L 10288 红宝石黑黑 下5千保\nS450L 12288 黑粽 下2万保 \nS500L 17328 黑棕 下10万保 国6\n卖全国另有迈巴赫', '1554004364', '1554102239', '', '', '/201903/752e658c591fef3be14e53f1d818ea4b.jpg,/201903/94af28562bda03ba14af107885acef4f.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/e6457e03ce931e4be0367dfde3f804f1.jpg,/201903/c07bc4da105ec19be9b6ecf40f9730a3.jpg,/201903/29b07eaf1709264e833df666ce119439.jpg');
INSERT INTO `purchase_market` VALUES ('19', '17074', '11', '国6\n卖全国另有迈巴赫', '1554102372', null, '', '', null);
INSERT INTO `purchase_market` VALUES ('20', '17074', '22', 's-list-big', '1554102549', null, '', '', null);

-- ----------------------------
-- Table structure for `purchase_market_like`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_market_like`;
CREATE TABLE `purchase_market_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `market_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_market_like
-- ----------------------------
INSERT INTO `purchase_market_like` VALUES ('2', '3', '1', '1552274758');
INSERT INTO `purchase_market_like` VALUES ('3', '3', '2', '1552275009');
INSERT INTO `purchase_market_like` VALUES ('4', '3', '3', '1552275011');
INSERT INTO `purchase_market_like` VALUES ('5', '3', '4', '1552275014');
INSERT INTO `purchase_market_like` VALUES ('18', '17067', '8', '1552461263');
INSERT INTO `purchase_market_like` VALUES ('21', '17067', '4', '1552462009');
INSERT INTO `purchase_market_like` VALUES ('20', '17067', '3', '1552462005');
INSERT INTO `purchase_market_like` VALUES ('19', '17067', '5', '1552461264');
INSERT INTO `purchase_market_like` VALUES ('17', '17067', '6', '1552460947');
INSERT INTO `purchase_market_like` VALUES ('22', '17067', '9', '1552629553');
INSERT INTO `purchase_market_like` VALUES ('24', '3', '12', '1552895519');
INSERT INTO `purchase_market_like` VALUES ('31', '17073', '13', '1552990818');
INSERT INTO `purchase_market_like` VALUES ('26', '3', '9', '1552895528');
INSERT INTO `purchase_market_like` VALUES ('30', '3', '14', '1552905632');
INSERT INTO `purchase_market_like` VALUES ('32', '17073', '9', '1552994518');
INSERT INTO `purchase_market_like` VALUES ('33', '17073', '11', '1552994524');
INSERT INTO `purchase_market_like` VALUES ('34', '17073', '15', '1553051652');
INSERT INTO `purchase_market_like` VALUES ('35', '17074', '17', '1554004708');
INSERT INTO `purchase_market_like` VALUES ('40', '17074', '18', '1554040144');

-- ----------------------------
-- Table structure for `purchase_quote`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_quote`;
CREATE TABLE `purchase_quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ask_id` int(11) NOT NULL COMMENT '需求id',
  `user_id` int(11) NOT NULL COMMENT '供应商id',
  `car_price` varchar(10) NOT NULL COMMENT '万元',
  `note` varchar(200) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` bit(1) DEFAULT b'1' COMMENT '管理员操作',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_quote
-- ----------------------------
INSERT INTO `purchase_quote` VALUES ('2', '2', '1', '3', '保险。购置税', '1552104377', null, '', '');
INSERT INTO `purchase_quote` VALUES ('5', '2', '1', '55', '保险。购置税', '1552105563', null, '', '');
INSERT INTO `purchase_quote` VALUES ('7', '14', '17074', '88', '保险。购置税', '1552105563', null, '', '');
INSERT INTO `purchase_quote` VALUES ('27', '14', '17074', '2', '', '1552961271', null, '', '');
INSERT INTO `purchase_quote` VALUES ('9', '4', '1', '25', '保险。购置税', '1552105563', null, '', '');
INSERT INTO `purchase_quote` VALUES ('24', '4', '1', '11', '22', '1552957918', null, '', '');
INSERT INTO `purchase_quote` VALUES ('21', '15', '3', '22', '送老板\n送几码', '1552895148', null, '', '');
INSERT INTO `purchase_quote` VALUES ('23', '6', '3', '1222', '333', '1552904131', null, '', '');
INSERT INTO `purchase_quote` VALUES ('18', '14', '17074', '2', '包', '1552647661', null, '', '');
INSERT INTO `purchase_quote` VALUES ('28', '14', '17074', '55', '有保险', '1554022873', null, '', '');
INSERT INTO `purchase_quote` VALUES ('29', '14', '17074', '55', '有保险', '1554023071', null, '', '');
INSERT INTO `purchase_quote` VALUES ('30', '14', '17074', '55', '有保险', '1554023273', null, '', '');
INSERT INTO `purchase_quote` VALUES ('31', '14', '17074', '55', '有保险', '1554023341', '1554024163', '', '');
INSERT INTO `purchase_quote` VALUES ('32', '23', '17074', '123', '456', '1554047758', null, '', '');
INSERT INTO `purchase_quote` VALUES ('33', '14', '17074', '1', '2', '1554087671', null, '', '');
INSERT INTO `purchase_quote` VALUES ('34', '14', '17074', '22', '3', '1554087736', null, '', '');
INSERT INTO `purchase_quote` VALUES ('35', '14', '17074', '111', '2', '1554087771', null, '', '');
INSERT INTO `purchase_quote` VALUES ('36', '14', '17074', '8888', '222', '1554087814', null, '', '');
INSERT INTO `purchase_quote` VALUES ('37', '14', '17074', '8888', '222', '1554087836', null, '', '');
INSERT INTO `purchase_quote` VALUES ('38', '14', '17074', '12', '', '1554087963', null, '', '');

-- ----------------------------
-- Table structure for `purchase_supplier_read`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_supplier_read`;
CREATE TABLE `purchase_supplier_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '供应商',
  `ask_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_supplier_read
-- ----------------------------
INSERT INTO `purchase_supplier_read` VALUES ('1', '17067', '13', null);
INSERT INTO `purchase_supplier_read` VALUES ('15', '3', '17', '1552903157');
INSERT INTO `purchase_supplier_read` VALUES ('16', '3', '18', '1552903169');
INSERT INTO `purchase_supplier_read` VALUES ('17', '3', '20', '1552903175');
INSERT INTO `purchase_supplier_read` VALUES ('18', '3', '17', '1552904116');
INSERT INTO `purchase_supplier_read` VALUES ('19', '3', '6', '1552904124');
INSERT INTO `purchase_supplier_read` VALUES ('20', '3', '18', '1552957800');
INSERT INTO `purchase_supplier_read` VALUES ('21', '3', '18', '1552957808');
INSERT INTO `purchase_supplier_read` VALUES ('22', '3', '4', '1552957921');
INSERT INTO `purchase_supplier_read` VALUES ('23', '3', '14', '1552957976');
INSERT INTO `purchase_supplier_read` VALUES ('24', '3', '14', '1552958374');
INSERT INTO `purchase_supplier_read` VALUES ('25', '3', '14', '1552958398');
INSERT INTO `purchase_supplier_read` VALUES ('26', '3', '14', '1552958409');
INSERT INTO `purchase_supplier_read` VALUES ('27', '3', '14', '1552958420');
INSERT INTO `purchase_supplier_read` VALUES ('28', '3', '14', '1552958429');
INSERT INTO `purchase_supplier_read` VALUES ('29', '3', '14', '1552958449');
INSERT INTO `purchase_supplier_read` VALUES ('30', '3', '14', '1552958814');
INSERT INTO `purchase_supplier_read` VALUES ('31', '3', '14', '1552958846');
INSERT INTO `purchase_supplier_read` VALUES ('32', '3', '14', '1552959112');
INSERT INTO `purchase_supplier_read` VALUES ('33', '3', '14', '1552959166');
INSERT INTO `purchase_supplier_read` VALUES ('34', '3', '14', '1552959188');
INSERT INTO `purchase_supplier_read` VALUES ('35', '3', '14', '1552959225');
INSERT INTO `purchase_supplier_read` VALUES ('36', '3', '14', '1552959242');
INSERT INTO `purchase_supplier_read` VALUES ('37', '3', '14', '1552959277');
INSERT INTO `purchase_supplier_read` VALUES ('38', '3', '14', '1552959320');
INSERT INTO `purchase_supplier_read` VALUES ('39', '3', '14', '1552959332');
INSERT INTO `purchase_supplier_read` VALUES ('40', '3', '14', '1552959341');
INSERT INTO `purchase_supplier_read` VALUES ('41', '3', '14', '1552959363');
INSERT INTO `purchase_supplier_read` VALUES ('42', '3', '14', '1552959578');
INSERT INTO `purchase_supplier_read` VALUES ('43', '3', '14', '1552959627');
INSERT INTO `purchase_supplier_read` VALUES ('44', '3', '14', '1552959637');
INSERT INTO `purchase_supplier_read` VALUES ('45', '3', '14', '1552959645');
INSERT INTO `purchase_supplier_read` VALUES ('46', '3', '14', '1552959669');
INSERT INTO `purchase_supplier_read` VALUES ('47', '3', '14', '1552959675');
INSERT INTO `purchase_supplier_read` VALUES ('48', '3', '14', '1552959715');
INSERT INTO `purchase_supplier_read` VALUES ('49', '3', '14', '1552959736');
INSERT INTO `purchase_supplier_read` VALUES ('50', '3', '14', '1552959816');
INSERT INTO `purchase_supplier_read` VALUES ('51', '3', '14', '1552959832');
INSERT INTO `purchase_supplier_read` VALUES ('52', '3', '14', '1552959909');
INSERT INTO `purchase_supplier_read` VALUES ('53', '3', '14', '1552960082');
INSERT INTO `purchase_supplier_read` VALUES ('54', '3', '14', '1552960085');
INSERT INTO `purchase_supplier_read` VALUES ('55', '3', '14', '1552960278');
INSERT INTO `purchase_supplier_read` VALUES ('56', '3', '14', '1552960308');
INSERT INTO `purchase_supplier_read` VALUES ('57', '3', '14', '1552960419');
INSERT INTO `purchase_supplier_read` VALUES ('58', '3', '14', '1552960491');
INSERT INTO `purchase_supplier_read` VALUES ('59', '3', '14', '1552960574');
INSERT INTO `purchase_supplier_read` VALUES ('60', '3', '14', '1552960755');
INSERT INTO `purchase_supplier_read` VALUES ('61', '3', '14', '1552960899');
INSERT INTO `purchase_supplier_read` VALUES ('62', '3', '14', '1552961023');
INSERT INTO `purchase_supplier_read` VALUES ('63', '3', '14', '1552961262');
INSERT INTO `purchase_supplier_read` VALUES ('64', '3', '18', '1552963085');
INSERT INTO `purchase_supplier_read` VALUES ('65', '17073', '13', '1553048118');
INSERT INTO `purchase_supplier_read` VALUES ('66', '17073', '5', '1553051666');
INSERT INTO `purchase_supplier_read` VALUES ('67', '17074', '23', '1554006278');
INSERT INTO `purchase_supplier_read` VALUES ('68', '17074', '23', '1554006331');
INSERT INTO `purchase_supplier_read` VALUES ('69', '17074', '14', '1554048294');
INSERT INTO `purchase_supplier_read` VALUES ('70', '17074', '14', '1554048456');
INSERT INTO `purchase_supplier_read` VALUES ('71', '17074', '14', '1554048486');
INSERT INTO `purchase_supplier_read` VALUES ('72', '17074', '14', '1554048509');
INSERT INTO `purchase_supplier_read` VALUES ('73', '17074', '14', '1554084966');
INSERT INTO `purchase_supplier_read` VALUES ('74', '17074', '14', '1554087217');
INSERT INTO `purchase_supplier_read` VALUES ('75', '17074', '14', '1554087328');
INSERT INTO `purchase_supplier_read` VALUES ('76', '17074', '14', '1554087408');
INSERT INTO `purchase_supplier_read` VALUES ('77', '17074', '14', '1554087567');
INSERT INTO `purchase_supplier_read` VALUES ('78', '17074', '14', '1554087666');
INSERT INTO `purchase_supplier_read` VALUES ('79', '17074', '14', '1554087723');
INSERT INTO `purchase_supplier_read` VALUES ('80', '17074', '14', '1554087764');
INSERT INTO `purchase_supplier_read` VALUES ('81', '17074', '14', '1554087807');
INSERT INTO `purchase_supplier_read` VALUES ('82', '17074', '14', '1554087924');
INSERT INTO `purchase_supplier_read` VALUES ('83', '17074', '14', '1554088103');
INSERT INTO `purchase_supplier_read` VALUES ('84', '17074', '14', '1554088178');
INSERT INTO `purchase_supplier_read` VALUES ('85', '17074', '14', '1554088286');
INSERT INTO `purchase_supplier_read` VALUES ('86', '17074', '14', '1554088330');
INSERT INTO `purchase_supplier_read` VALUES ('87', '17074', '14', '1554088355');
INSERT INTO `purchase_supplier_read` VALUES ('88', '17074', '25', '1554099945');
INSERT INTO `purchase_supplier_read` VALUES ('89', '17074', '25', '1554100127');
INSERT INTO `purchase_supplier_read` VALUES ('90', '17074', '25', '1554100181');
INSERT INTO `purchase_supplier_read` VALUES ('91', '17074', '25', '1554100465');
INSERT INTO `purchase_supplier_read` VALUES ('92', '17074', '25', '1554100497');
INSERT INTO `purchase_supplier_read` VALUES ('93', '17074', '25', '1554100789');
INSERT INTO `purchase_supplier_read` VALUES ('94', '17074', '25', '1554100910');
INSERT INTO `purchase_supplier_read` VALUES ('95', '17074', '25', '1554100936');
INSERT INTO `purchase_supplier_read` VALUES ('96', '17074', '25', '1554100992');
INSERT INTO `purchase_supplier_read` VALUES ('97', '17074', '25', '1554101054');
INSERT INTO `purchase_supplier_read` VALUES ('98', '17074', '25', '1554101095');
INSERT INTO `purchase_supplier_read` VALUES ('99', '17074', '25', '1554101155');
INSERT INTO `purchase_supplier_read` VALUES ('100', '17074', '14', '1554115660');
INSERT INTO `purchase_supplier_read` VALUES ('101', '17074', '14', '1554115665');

-- ----------------------------
-- Table structure for `purchase_trade`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_trade`;
CREATE TABLE `purchase_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trader_id` int(11) DEFAULT NULL COMMENT '二网的user_id',
  `supplier_id` int(11) DEFAULT NULL COMMENT '批发商',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '1:建立，2，完成',
  `car_name` varchar(100) DEFAULT NULL COMMENT '车名',
  `car_price` varchar(20) DEFAULT NULL COMMENT '车价',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_trade
-- ----------------------------

-- ----------------------------
-- Table structure for `purchase_user_relation`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_user_relation`;
CREATE TABLE `purchase_user_relation` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL COMMENT '10:普通用户，11：经销商，12：供应商,13,供应商管理员',
  `admin_id` tinyint(4) DEFAULT NULL COMMENT '指向后台管理员',
  `create_time` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17075 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_user_relation
-- ----------------------------
INSERT INTO `purchase_user_relation` VALUES ('17074', '1', '12', null, null, null);

-- ----------------------------
-- Table structure for `think_admin`
-- ----------------------------
DROP TABLE IF EXISTS `think_admin`;
CREATE TABLE `think_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录名',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '昵称',
  `pwd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT '2' COMMENT '1超级管理员 2 普通管理员',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '账号状态 1启用 0 禁用',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '后台角色类型',
  `email` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '邮箱',
  `phone` varchar(15) CHARACTER SET utf8 DEFAULT NULL COMMENT '电话',
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌',
  `del` int(5) NOT NULL DEFAULT '0' COMMENT '1为删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of think_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `think_business_users_union`
-- ----------------------------
DROP TABLE IF EXISTS `think_business_users_union`;
CREATE TABLE `think_business_users_union` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '用户名称',
  `phone` varchar(15) NOT NULL COMMENT '手机号码',
  `nickname` varchar(100) DEFAULT NULL COMMENT '微信昵称',
  `shotcut` varchar(300) DEFAULT NULL COMMENT '微信头像',
  `wxopenid` varchar(70) DEFAULT NULL COMMENT '微信openid',
  `wxpopenid` varchar(70) DEFAULT NULL COMMENT '小程序openid',
  `tag` varchar(200) NOT NULL COMMENT '业务标签',
  `channel` varchar(100) DEFAULT NULL COMMENT '来源渠道',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `is_focus` int(1) DEFAULT NULL COMMENT '是否关注公众号（1-关注，0-未关注）',
  `createtime` int(11) NOT NULL COMMENT '注册时间',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `wxunionid` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17075 DEFAULT CHARSET=utf8 COMMENT='业务用户集合表 by SamHong 2018-05-19 09:37';

-- ----------------------------
-- Records of think_business_users_union
-- ----------------------------
INSERT INTO `think_business_users_union` VALUES ('3', '冯小姐', '13798674252', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('4', '梁', '13925490468', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('5', '罗邵生', '13927702570', null, null, 'oRER2xPEie-PWqiFwH5e-TjfmENk', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('6', '郑', '13549978897', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('7', '周黎明', '18924809269', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('8', '梁小姐', '13798682166', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('9', '张函', '13189650051', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('10', '廖嘉峰', '15217406969', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('11', '张忠耀', '17727308761', null, null, 'oRER2xHuTOAQuyV7-_31U8kjCTkw', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('12', '李亚梅', '15850006660', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('13', '陈', '13825586292', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('14', '邓先生', '18823495323', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('15', '罗丽娴', '15818088582', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('16', '唐中立', '13929116867', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('17', '彭翼', '13674063576', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('18', '姚光云', '13928292716', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('19', '李寿军', '13794013459', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('20', '郑石锦', '13929199382', null, null, '', '', 'aftersale', null, '0', null, '1498792180', '1', '0', null);
INSERT INTO `think_business_users_union` VALUES ('17074', '盛盛', '18680026210', null, null, null, null, '', null, '0', null, '0', '1', '0', 'okwrs0BeeIkgLKnKGretvx-9EyPs');

-- ----------------------------
-- Table structure for `think_company`
-- ----------------------------
DROP TABLE IF EXISTS `think_company`;
CREATE TABLE `think_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `company_info` varchar(255) DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `licence_pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_company
-- ----------------------------
INSERT INTO `think_company` VALUES ('1', 'AAA的公司', '我是葡萄找车有限公司', null, null, null, null);
INSERT INTO `think_company` VALUES ('2', 'BBB的公司', '我是有限公司', '', null, null, null);
INSERT INTO `think_company` VALUES ('3', 'CCC的公司', '我是有222限公司', null, null, null, null);

-- ----------------------------
-- Table structure for `think_sign_brands`
-- ----------------------------
DROP TABLE IF EXISTS `think_sign_brands`;
CREATE TABLE `think_sign_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `img` varchar(500) NOT NULL,
  `renshu` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '100',
  `letter` char(1) DEFAULT 'N' COMMENT '品牌首字母',
  `show` int(11) NOT NULL DEFAULT '0',
  `del` int(5) NOT NULL DEFAULT '0' COMMENT '1为删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2146 DEFAULT CHARSET=utf8 COMMENT='车型表';

-- ----------------------------
-- Records of think_sign_brands
-- ----------------------------
INSERT INTO `think_sign_brands` VALUES ('1', '奔驰', '0', '/putao/Public/Uploads/thumb_58bfd9d4b4303.png', '0', '3', 'B', '1', '0');
INSERT INTO `think_sign_brands` VALUES ('2', 'A级', '1', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('3', 'GLA', '1', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('7', 'R级', '1', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('8', 'GLE', '1', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('9', 'GLC', '1', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('10', 'smart', '1', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('11', '宝马', '0', '/putao/Public/Uploads/thumb_58bfd9c3672b0.png', '0', '2', 'B', '1', '0');
INSERT INTO `think_sign_brands` VALUES ('12', '3系标准轴', '11', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('13', '3系长轴', '11', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('14', '5系长轴', '11', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('15', 'X1', '11', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('16', '1系', '11', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('17', '5系标准轴', '11', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('18', '全新7系', '11', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('19', 'X3', '11', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('20', 'X4', '11', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('21', 'X5', '11', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('22', '奥迪', '0', '/putao/Public/Uploads/thumb_58bfd9bae2820.png', '0', '2', 'A', '1', '0');
INSERT INTO `think_sign_brands` VALUES ('23', 'A6L', '22', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('24', 'A4L', '22', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('25', 'Q3', '22', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('27', 'A3', '22', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('28', 'Q5', '22', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('29', '一汽丰田', '0', '/putao/Public/Uploads/thumb_590d6ca5aa829.jpg', '0', '21', 'Y', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('30', '卡罗拉', '29', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('31', '威驰', '29', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('32', '花冠', '29', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('33', '锐志', '29', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('34', 'RAV4', '29', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('35', '普拉多', '29', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('36', '现代', '0', '/putao/Public/Uploads/thumb_58bfd99405c03.png', '0', '19', 'X', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('37', 'ix25', '36', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('38', 'ix35', '36', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('39', '朗动', '36', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('40', '名图', '36', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('41', '胜达', '36', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('42', '途胜', '36', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('43', '瑞纳', '36', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('44', '瑞奕', '36', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('45', '索九', '36', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('46', '比亚迪', '0', '/putao/Public/Uploads/thumb_58bfd9821c712.png', '0', '40', 'B', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('47', 'S7', '46', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('48', 'F3', '46', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('49', '宋', '46', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('50', '长安福特', '0', '/putao/Public/Uploads/thumb_58c27b7829322.png', '0', '9', 'C', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('51', '嘉年华', '50', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('52', '福克斯', '50', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('53', '福睿斯', '50', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('54', '蒙迪欧', '50', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('55', '翼搏', '50', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('56', '翼虎', '50', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('57', '锐界', '50', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('69', '一汽大众', '0', '/putao/Public/Uploads/thumb_58c670fd59aa3.png', '0', '1', 'D', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('70', '捷达', '69', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('71', '宝来', '69', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('72', '高尔夫', '69', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('73', '速腾', '69', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('74', '迈腾', '69', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('75', 'CC', '69', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('76', '长安', '0', '/putao/Public/Uploads/thumb_58bfd93849115.png', '0', '27', 'C', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('77', '奔奔', '76', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('78', '悦翔V3', '76', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('79', '逸动', '76', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('80', '悦翔V7', '76', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('81', 'CS35', '76', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('82', 'CS75', '76', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('83', '东风日产', '0', '/putao/Public/Uploads/thumb_58bfd9282ff25.png', '0', '4', 'D', '1', '0');
INSERT INTO `think_sign_brands` VALUES ('85', '骐达', '83', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('86', '轩逸', '83', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('87', '阳光', '83', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('88', '蓝鸟', '83', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('89', '天籁', '83', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('90', '逍客', '83', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('91', '奇骏', '83', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('92', '楼兰', '83', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('93', '别克', '0', '/putao/Public/Uploads/thumb_58bfd917df740.png', '0', '7', 'B', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('95', '威朗', '93', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('96', '英朗', '93', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('97', '君威', '93', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('98', '君越', '93', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('99', '昂科拉', '93', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('100', '昂科威', '93', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('102', '广汽传祺', '0', '/putao/Public/Uploads/thumb_58bfd8df1af97.png', '0', '8', 'G', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('103', 'GA5', '102', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('104', 'GA6', '102', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('105', 'GS4', '102', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('106', 'GS5 Super', '102', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('107', '东风本田', '0', '/putao/Public/Uploads/thumb_58c292a74516e.png', '0', '5', 'D', '1', '0');
INSERT INTO `think_sign_brands` VALUES ('108', '杰德', '107', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('109', '思域', '107', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('110', '哥瑞', '107', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('111', '思铂睿', '107', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('112', 'XR-V', '107', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('113', 'CR-V', '107', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('114', '艾力绅', '107', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('121', '广汽本田', '0', '/putao/Public/Uploads/thumb_58c2930ea7601.png', '0', '6', 'G', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('122', '飞度', '121', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('123', '锋范', '121', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('124', '凌派', '121', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('125', '歌诗图', '121', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('126', '雅阁', '121', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('127', '缤智', '121', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('128', '奥德赛', '121', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('129', '雪佛兰', '0', '/putao/Public/Uploads/thumb_58bfd894a6ea9.png', '0', '17', 'X', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('131', '乐风RV', '129', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('132', '科鲁兹', '129', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('133', '迈锐宝', '129', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('134', '迈锐宝XL', '129', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('135', '创酷', '129', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('136', '科帕奇', '129', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('137', '哈弗', '0', '/putao/Public/Uploads/thumb_58bfd875d6ff0.png', '0', '18', 'H', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('138', 'H1', '137', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('139', 'H2', '137', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('140', 'H5', '137', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('141', 'H6', '137', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('142', 'H6 Coupe', '137', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('143', 'H8', '137', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('144', 'H9', '137', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('145', '长安马自达', '0', '/putao/Public/Uploads/thumb_58c27b4f41477.png', '0', '20', 'C', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('146', '17款马自达3 Axela昂克赛拉（两厢）', '145', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('147', '17款马自达3 Axela昂克赛拉（三厢）', '145', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('148', 'CX-5', '145', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('149', '金牛座', '50', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('150', '雷克萨斯', '0', '/putao/Public/Uploads/thumb_58c26bc8db705.png', '0', '13', 'L', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('151', 'CT', '150', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('152', 'IS', '150', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('153', 'ES', '150', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('154', 'LS', '150', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('155', 'NX', '150', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('156', 'GX', '150', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('157', 'LX', '150', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('158', 'RX', '150', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('159', 'RC', '150', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('160', '奇瑞', '0', '/putao/Public/Uploads/thumb_58bfd827662f4.png', '0', '41', 'Q', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('161', '发现神行', '160', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('162', '揽胜极光', '160', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('163', '路虎进口', '0', '/putao/Public/Uploads/thumb_58bfd7729b454.png', '0', '25', 'L', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('164', '全新一代发现', '163', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('165', '揽胜运动版', '163', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('166', '揽胜', '163', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('167', '神行者2', '163', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('168', '发现神行进口', '163', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('169', '捷豹', '0', '/putao/Public/Uploads/thumb_58bfd75d98268.png', '0', '34', 'J', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('170', 'XE', '169', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('171', 'XF', '169', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('172', 'XJ', '169', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('173', 'F-PACE', '169', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('174', 'F-TYPE', '169', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('177', 'Jeep', '0', '/putao/Public/Uploads/thumb_58bfd7390688a.png', '0', '16', 'J', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('179', '指南者', '177', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('180', '自由客', '177', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('181', '牧马人', '177', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('182', '自由光进口', '177', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('183', '大切诺基进口', '177', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('184', '保时捷', '0', '/putao/Public/Uploads/thumb_58bfd72a6193f.png', '0', '28', 'B', '1', '0');
INSERT INTO `think_sign_brands` VALUES ('186', 'Panamera', '184', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('187', 'Macan', '184', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('188', '卡宴', '184', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('189', 'Boxster', '184', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('190', 'Cayman', '184', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('191', '', '184', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('192', '东风悦达起亚', '0', '/putao/Public/Uploads/thumb_58c273258c09c.png', '0', '29', 'D', '1', '1');
INSERT INTO `think_sign_brands` VALUES ('193', '起亚K2', '192', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('194', '福瑞迪', '192', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('195', 'K3', '192', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('196', 'K4', '192', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('198', 'K5', '192', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('199', 'KX3', '192', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('200', 'KX5', '192', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('201', '智跑', '192', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('204', '东风标致', '0', '/putao/Public/Uploads/thumb_58c2692b4b140.png', '0', '36', 'D', '1', '0');
INSERT INTO `think_sign_brands` VALUES ('205', '301', '204', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('206', '标致308S', '204', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('207', '408', '204', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('208', '508', '204', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('209', '2008', '204', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('210', '沃尔沃', '0', '/putao/Public/Uploads/thumb_58bfd6cc0055e.png', '0', '1', 'W', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('211', 'S80L', '210', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('212', 'S60L', '210', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('213', 'XC60', '210', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('214', 'V40', '210', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('215', 'S60', '210', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('216', 'V60', '210', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('217', 'XC90', '210', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('218', 'XC60（进口）', '210', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('219', '东风雪铁龙', '0', '/putao/Public/Uploads/thumb_58c26a67748b6.png', '0', '32', 'D', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('220', 'C4L', '219', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('222', '世嘉', '219', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('223', '爱丽舍', '219', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('224', 'C4世嘉', '219', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('225', 'C5', '219', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('226', 'C3-XR', '219', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('233', '知豆', '0', '/putao/Public/Uploads/thumb_58bfd654cd05e.png', '0', '43', 'Z', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('237', 'D2S', '233', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('238', '启辰', '0', '/putao/Public/Uploads/thumb_58bfd63aab66f.png', '0', '30', 'Q', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('239', 'R30', '238', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('240', 'R50', '238', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('241', 'R50X', '238', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('242', 'D50', '238', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('243', 'T70', '238', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('244', 'T70X', '238', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('250', '幻速', '0', '/putao/Public/Uploads/thumb_58bfd61baf976.png', '0', '35', 'H', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('252', '幻速S3', '250', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('253', '幻速S3L', '250', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('254', '幻速S6', '250', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('255', '幻速H2', '250', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('256', '幻速H2E', '250', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('257', '幻速H3', '250', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('258', '幻速H3F', '250', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('266', '吉利', '0', '/putao/Public/Uploads/thumb_58c2726c74df0.png', '0', '12', 'J', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('267', '五菱', '0', '/putao/Public/Uploads/thumb_58c27bd6dd80c.png', '0', '39', 'W', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('269', '宝骏730', '267', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('270', 'D2壹年租', '233', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('272', '手动 1.5L 超值版 7座', '269', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('273', '手动 1.5L 标准版 7座', '269', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('274', '宝骏', '0', '/putao/Public/Uploads/thumb_58c292e42ca6d.png', '0', '38', 'B', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('275', '1.6LMT 舒适型', '52', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('276', '1.6LAT 舒适型', '52', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('277', '1.6LMT 风尚型', '52', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('278', '1.6LAT 风尚型', '52', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('279', '1.0T手动超能风尚', '52', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('280', '1.0T自动超能风尚', '52', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('281', '1.5T自动精英BF2.BE7/BF', '52', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('282', '1.5T运动/旗舰BF6.BG1/B', '52', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('283', '2017款 200T 手动两驱舒适版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('284', '2017款 200T 手动两驱精英版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('285', '2017款 200T 手动两驱豪华版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('286', '2017款 200T G-DCT两驱舒适版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('287', '2017款 200T G-DCT两驱精英版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('288', '2017款 200T G-DCT两驱豪华版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('289', '2017款 235T 手动两驱舒适版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('290', '2017款 235T 手动两驱豪华版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('291', '2017款 235T G-DCT两驱精英版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('292', '2017款 235T G-DCT两驱豪华版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('293', '2017款 235T 自动两驱精英版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('294', '2017款 235T 自动两驱尊贵版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('295', '2017款 235T 自动四驱豪华智联版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('296', '2017款 235T 自动四驱尊贵版', '105', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('297', '1.5MT舒适版', '53', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('298', '1.5AT舒适版', '53', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('299', '1.5MT时尚版', '53', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('300', '1.5AT时尚版', '53', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('301', '1.5T 舒适性', '54', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('302', '1.5T 时尚型', '54', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('303', '1.5T 豪华型', '54', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('304', '1.5T 至尊型', '54', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('305', '2.0T 时尚型', '54', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('306', '2.0T 豪华型', '54', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('307', '2.0T 豪华运动型', '54', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('308', '2.0T 至尊型', '54', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('309', '2.0T 旗舰型', '54', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('310', '2.0 HEV 智豪型 ', '54', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('311', '2.0 HEV 智尊旗舰型 ', '54', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('312', '1.5LMT 舒适型', '55', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('313', '1.5LMT 风尚型', '55', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('314', '1.5LAT 风尚型', '55', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('315', '1.5LAT 尊贵型', '55', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('316', 'EcoBoost 180 精翼型', '56', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('317', 'EcoBoost 180 铂翼型', '56', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('319', 'EcoBoost 245 铂翼型', '56', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('320', 'EcoBoost 245 豪翼型', '56', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('321', 'EcoBoost 245 运动型', '56', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('322', 'EcoBoost 245 尊翼型', '56', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('323', 'GS8', '102', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('324', 'GS5', '102', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('325', 'GA8', '102', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('330', '2014款 1.8T 自动两驱超享版', '324', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('331', '2014款 2.0L 自动两驱超享版', '324', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('332', '2014款 2.0L 手动两驱周年增值版', '324', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('333', '2014款 2.0L 自动两驱周年增值版', '324', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('334', '2017款 320T 两驱精英版', '323', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('335', '2017款 320T 两驱豪华版', '323', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('336', '2017款 320T 两驱豪华智联版', '323', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('337', '2017款 320T 两驱尊贵版', '323', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('338', '2017款 320T 四驱豪华智联版', '323', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('339', '2017款 320T 四驱至尊版', '323', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('340', '2.0T两驱精锐版', '57', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('341', '2.0T两驱铂锐版5座', '57', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('342', '2.0T两驱铂锐版7座', '57', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('343', '2.0T两驱昊锐版', '57', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('344', '2.0T四驱昊锐版', '57', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('345', '2.0T四驱尊锐版', '57', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('346', '2.0T四驱旗舰型 ', '57', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('347', '2.7T四驱运动版', '57', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('348', '2.7T四驱尊锐版', '57', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('349', '2016款 2.0L 手动两驱舒适版', '106', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('350', '2016款 2.0L 自动两驱超享版', '106', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('351', '2016款 2.0L 自动两驱周年纪念版', '106', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('352', '2016款 1.8T 自动两驱超享版', '106', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('353', '2016款 1.8T 自动两驱周年纪念版', '106', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('354', '2016款 1.8T 自动两驱豪华智慧版', '106', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('356', '2016款 1.8T 自动四驱周年纪念版', '106', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('357', '2016款 1.8T 自动四驱豪华导航版', '106', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('358', '2016款 1.8T 自动四驱至尊版', '106', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('360', 'EcoBoost 180 豪翼型2WD', '56', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('361', 'EcoBoost 180 豪翼型4WD', '56', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('362', '2016款 235T 手动舒适版', '104', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('363', '2016款 235T 手动精英版', '104', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('364', '2016款 235T 自动舒适版', '104', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('365', '2016款 235T 自动精英版', '104', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('366', '2016款 235T 自动豪华版', '104', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('367', '2016款 235T 自动尊贵版', '104', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('368', '1.5L GTDi豪华型', '149', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('369', '2.0L GTDi时尚型', '149', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('370', '2.0L GTDi豪华型', '149', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('371', '2.0LGTDi旗舰型', '149', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('372', '2.7L GTDi旗舰型', '149', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('373', '2.7L GTDi限量型', '149', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('374', '2016款 PHEV 精英版', '103', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('375', '2016款 PHEV 尊享版', '103', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('376', '2.0自动两驱舒适', '148', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('377', '2.0自动两驱都市', '148', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('378', '2.0自动四驱豪华', '148', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('379', '2.5自动四驱尊贵', '148', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('380', '2.5自动四驱旗舰', '148', '', '0', '0', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('381', '1.5手动舒适', '147', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('382', '1.5自动舒适', '147', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('383', '1.5手动豪华', '147', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('384', '1.5自动豪华', '147', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('385', '1.5自动尊贵', '147', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('386', '2.0自动尊贵', '147', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('387', '2.0自动旗舰', '147', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('388', '1.5手动舒适', '146', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('389', '1.5自动舒适', '146', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('390', '1.5自动豪华', '146', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('391', '2.0自动豪华', '146', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('392', '2.0自动运动', '146', '', '0', '0', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('393', 'S', '1', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('394', 'GLS', '1', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('395', 'T90', '238', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('396', '2017款2.0L手动辰尚版', '395', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('397', '2017款2.0L手动风尚版', '395', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('398', '2017款2.0L手动智尚版', '395', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('399', '2017款2.0LCVT风尚版', '395', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('400', '2017款2.0LCVT智尚版', '395', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('401', '2017款2.0LCVT领尚版', '395', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('402', '2016款2.0L手动睿享运动版', '244', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('403', '2016款2.0LCVT睿趣运动版', '244', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('405', '2016款2.0LCVT睿享运动版', '244', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('406', '2016款1.6L手动睿行版', '243', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('407', '2016款2.0L手动睿趣版', '243', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('408', '2016款2.0L手动睿享版', '243', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('409', '2016款2.0LCVT睿行版', '243', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('410', '2016款2.0LCVT睿趣版', '243', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('411', '2016款2.0LCVT睿享版', '243', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('412', '2015款1.6L手动时尚版', '242', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('413', '2015款1.6L自动时尚版', '242', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('414', '2016款1.6L手动精英版', '242', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('415', '2016款1.6L自动精英版', '242', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('416', '2015款1.6L手动豪华版', '242', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('417', '2015款1.6L自动豪华版', '242', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('418', '2系', '11', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('419', '3系', '11', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('420', '4系', '11', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('421', '高尔夫-嘉旅', '69', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('422', '蔚领', '69', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('423', '高尔夫 2016款 1.6L 手动时尚型', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('424', '高尔夫 2016款 1.6L 自动时尚型', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('425', '高尔夫2017款1.6L自动舒适百万辆纪念版', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('426', '高尔夫2017款180TSI自动舒适型', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('428', '高尔夫2017款230TSI手动舒适百万辆纪念版', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('429', '高尔夫2017款230TSI自动舒适百万辆纪念版', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('430', '高尔夫2017款230TSI自动豪华百万辆纪念版', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('431', '高尔夫2017款280TSI手动R-Line百万辆纪念版', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('432', '高尔夫 2016款 280TSI 自动旗舰型', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('433', '高尔夫 2016款 2.0TSI GTI', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('434', '高尔夫 2016款 1.6L 自动舒适型', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('435', '高尔夫 2016款 230TSI 自动舒适型', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('436', '高尔夫 2016款 230TSI 自动豪华型', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('437', '高尔夫2017款280TSI自动R-Line百万辆纪念版', '72', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('438', '6系', '11', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('450', '途安', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('451', '途观', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('452', 'C级', '1', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('453', '帕萨特', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('454', 'E级', '1', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('455', '桑塔纳·浩纳', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('456', '凌渡', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('457', '朗境', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('458', '朗逸', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('459', '朗行', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('460', '桑塔纳·尚纳', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('461', 'POLO', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('462', 'GLC（进口）', '1', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('463', 'GLA(进口)', '1', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('464', 'CLA', '1', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('465', '博越', '266', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('466', 'A级（进口）', '1', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('467', '蔚领2017款1.6L手动舒适型', '422', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('468', '蔚领2017款1.6L自动舒适型', '422', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('469', '蔚领2017款1.6L手动豪华型', '422', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('470', '蔚领2017款1.6L自动豪华型', '422', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('471', '蔚领2017款230TSI手动舒适型', '422', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('472', '蔚领2017款230TSI自动舒适型', '422', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('473', '蔚领2017款230TSI自动豪华型', '422', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('474', '嘉旅2016款1.6L手动舒适型', '421', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('475', '嘉旅2016款1.6L自动舒适型', '421', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('476', '嘉旅2016款180TSI自动进取型', '421', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('477', '嘉旅2016款230TSI手动进取型', '421', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('478', '嘉旅2016款230TSI自动进取型', '421', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('479', '嘉旅2016款230TSI自动豪华型', '421', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('480', '嘉旅2016款280TSI自动豪华型', '421', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('481', '嘉旅2016款280TSI自动旗舰型', '421', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('482', '大众CC2016款1.8TSI尊贵型', '75', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('483', '大众CC2016款1.8TSI豪华型', '75', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('484', '大众CC2016款300TSI 25周年纪念版', '75', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('485', '大众CC2016款2.0TSI 尊贵型', '75', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('486', '大众CC2016款2.0TSI 豪华型', '75', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('487', '大众CC2016款2.0TSI 至尊型', '75', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('488', '大众CC2016款3.0FSI V6', '75', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('489', '迈腾2017款280TSI DSG舒适型', '74', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('490', '迈腾2017款280TSI DSG领先型', '74', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('491', '迈腾2017款330TSI DSG舒适型', '74', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('492', '迈腾2017款330TSI DSG领先型', '74', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('493', '迈腾2017款330TSI DSG豪华型', '74', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('494', '迈腾2017款330TSI DSG尊贵型', '74', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('495', '迈腾2017款380TSI DSG豪华型', '74', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('496', '迈腾2017款380TSI DSG尊贵型', '74', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('497', '迈腾2017款380TSI DSG旗舰型', '74', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('498', '速腾2017款1.6L手动时尚型', '73', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('499', '速腾2017款1.6L自动时尚型', '73', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('500', '速腾2017款1.6L手动舒适型', '73', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('501', '速腾2017款1.6L自动舒适型', '73', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('502', '速腾2017款180TSI自动领先型', '73', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('503', '速腾2017款230TSI手动舒适型', '73', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('504', '速腾2017款230TSI自动舒适型', '73', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('505', '速腾2017款230TSI手动豪华型', '73', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('506', '速腾2017款230TSI自动豪华型', '73', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('507', '速腾2017款280TSI自动R-Line', '73', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('508', '速腾2017款280TSI自动旗舰型', '73', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('509', '宝来2016款1.6L手动时尚型', '71', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('510', '宝来2016款1.6L自动时尚型', '71', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('511', '宝来2016款1.6L手动舒适型', '71', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('512', '宝来2016款1.6L自动舒适型', '71', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('513', '宝来2016款1.6L自动豪华型', '71', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('514', '宝来2016款230TSI手动舒适版', '71', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('515', '宝来2016款230TSI DSG舒适版', '71', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('516', '宝来2016款230TSI DSG25周年纪念版', '71', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('517', '宝来2016款230TSI DSG豪华型', '71', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('518', '捷达2017款1.4L手动时尚型', '70', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('519', '捷达2017款1.4L手动舒适型', '70', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('520', '捷达2017款1.5L手动时尚型', '70', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('521', '捷达2017款1.5L自动时尚型', '70', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('522', '捷达2017款1.5L手动舒适型', '70', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('523', '捷达2017款1.5L自动舒适型', '70', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('524', '捷达2017款1.5L手动豪华型', '70', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('525', '捷达2017款1.5L自动豪华型', '70', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('526', '捷达2017款1.4TSI自动运动版', '70', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('527', 'X6', '11', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('528', '3系GT', '11', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('529', '5系GT', '11', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('532', '远景', '266', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('533', '博瑞', '266', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('534', 'S90长轴版', '210', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('535', '威朗两厢', '93', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('537', 'A200时尚型', '2', '', '0', '100', null, '0', '0');
INSERT INTO `think_sign_brands` VALUES ('538', 'GLA200动感型', '3', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('539', 'GLA200时尚型', '3', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('540', 'GLA 220 4M 时尚', '3', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('541', 'GLA 220 4M 豪华', '3', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('542', 'GLA 260 4M 运动', '3', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('543', 'E260L运动型', '5', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('544', 'E260L', '454', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('545', 'R400商务型', '7', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('546', 'GLE320 Sport SUV', '8', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('547', 'GLE400 Sport SUV', '8', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('548', 'GLE320 SUV', '8', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('549', 'GLE400 SUV', '8', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('550', 'GLC 200 动感', '9', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('551', 'GLC 260 动感', '9', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('552', 'GLC 260 豪华', '9', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('553', 'GLC 300 动感', '9', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('554', 'GLC 300 豪华', '9', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('555', 'smart灵动版', '10', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('556', 'smart激情版', '10', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('557', 'C180L', '452', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('558', 'C200L', '452', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('559', 'C200L运动型', '452', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('560', '320i时尚', '12', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('561', '320iM运动型', '12', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('562', '328iM运动型', '12', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('563', '320Li进取型', '13', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('564', '320Li时尚型', '13', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('565', '320Li豪华型', '13', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('566', '525Li领先型', '14', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('567', '525Li豪华型', '14', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('568', '528Li领先型', '14', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('569', '528Li豪华型', '14', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('570', '535Li领先型', '14', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('571', '535Li行政豪华型', '14', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('572', 'X1/18i时尚型', '15', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('573', 'X1/18i领先型', '15', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('574', 'X1/20i时尚型', '15', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('575', '118i领先型', '16', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('576', '118i都市型', '16', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('577', '520i典雅型', '17', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('578', '740Li领先型', '18', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('579', '740Li豪华型', '18', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('580', '740Li尊享型', '18', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('581', '740Li领先型', '18', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('582', '740Li豪华型', '18', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('583', '740Li尊享型', '18', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('584', 'X4 20i设计', '20', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('585', 'X4 28i领先', '20', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('586', 'X4 28iM运动', '20', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('587', 'X5/28i', '21', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('588', 'X5/30i 柴油', '21', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('589', 'X5/35i 典雅', '21', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('590', 'X5/35i 领先', '21', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('591', 'X5/35i 豪华', '21', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('592', 'X5/35i 尊享', '21', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('593', '2.0T标准型', '23', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('594', '2.0T南方车型', '23', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('595', '2.0T舒适性', '23', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('596', '2.5L技术型', '23', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('597', '2.5L舒适型', '23', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('598', '2.5L豪华型', '23', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('599', '2.8L技术型', '23', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('600', '2.8L豪华四驱', '23', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('601', '3.0T豪华', '23', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('602', '2.0T标准型', '24', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('603', '2.0T舒适型', '24', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('604', '2.0T个性运动型', '24', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('605', '2.0T技术型', '24', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('606', '2.0T豪华型', '24', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('607', ' 1.4T进取型', '25', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('608', ' 1.4T舒适型', '25', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('609', '2.0T进取型', '25', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('610', '2.0T进取型（精英版）', '25', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('611', '2.0T舒适型', '25', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('612', '2.0T技术四驱', '25', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('618', '1.4T进取型', '27', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('619', '1.4T时尚型', '27', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('620', '1.8T舒适型', '27', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('621', '2.0T进取型（南方型）', '28', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('622', '2.0T技术型', '28', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('623', '2.0T舒适型', '28', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('624', '16款 2.0T进取型', '28', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('625', '16款 2.0T技术型', '28', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('626', '16款 2.0T舒适型', '28', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('627', '2.0T豪华型', '28', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('628', '1.6GL自动波', '30', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('629', '1.6GL-i版（天窗版）自动', '30', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('630', '1.6GL-i版（炫酷版）自动', '30', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('631', '1.8双擎先锋版（油电混合）', '30', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('632', '1.8双擎精英版（油电混合）', '30', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('633', '1.8双擎旗舰版（油电混合）', '30', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('634', '1.6L GL自动挡（14款）', '30', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('635', '1.5威驰智臻版自动波', '31', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('636', '1.6花冠卓越版', '32', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('637', '2.5尚锐版', '33', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('638', '2.5S菁锐版', '33', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('639', '2.0风尚版', '34', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('640', '2.5精英版', '34', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('641', '2700标准版', '35', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('642', '2700豪华版', '35', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('643', '3500TX-L', '35', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('644', '1.6L自动智能型', '37', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('645', '2.0L自动智能型两驱', '38', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('646', '1.6L自动时尚型', '39', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('647', '1.6L自动领先型', '39', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('648', '1.6L自动尊贵型', '39', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('649', '1.8L自动智能型', '40', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('650', '1.8L自动尊贵型', '40', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('651', '2.4L自动智能型5座两驱', '41', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('652', '1.6T自动智能型', '42', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('653', '1.6T自动智能型选装全景天窗', '42', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('654', '1.6T自动智能型选装全景天窗+电动尾门', '42', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('655', '1.4 GLS AT', '43', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('656', '1.4 GLX AT', '43', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('657', '1.4 GLX MT', '44', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('658', '1.6T自动时尚型', '45', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('659', '1.6T自动智能型', '45', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('660', '1.6T自动智能型选装全景天窗', '45', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('661', 'S7/1.5T手动尊贵型', '47', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('662', 'S7/2.0T自动尊贵型', '47', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('663', 'S7/2.0T自动旗舰型', '47', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('664', '新F3/1.5手动豪华型', '48', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('665', '新F3/1.5自动豪华型', '48', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('666', '宋1.5T手动豪华型', '49', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('667', '宋1.5T手动尊贵型', '49', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('668', '宋2.0T自动豪华型', '49', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('669', '宋2.0T自动尊贵型', '49', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('670', '两厢1.5L手动风尚型', '51', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('671', '两厢1.5L手动时尚型', '51', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('672', '两厢1.5L自动时尚型', '51', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('673', '两厢1.5L自动品尚型', '51', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('674', '两厢1.5L自动运动型', '51', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('675', '两厢1.5L自动劲动型', '51', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('676', '三厢1.5L手动风尚型', '51', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('677', '三厢1.5L手动时尚型', '51', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('678', '三厢1.5L自动时尚型', '51', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('679', '三厢1.5L自动品尚型', '51', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('680', '三厢1.5L自动旗舰型', '51', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('681', '两厢1.0 GTDi自动劲动型', '51', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('682', '两厢1.0L GTDi手动超能风尚型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('683', '两厢1.0L GTDi自动超能风尚型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('684', '三厢1.0L GTDi手动超能风尚型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('685', '三厢1.0L GTDi自动超能风尚型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('686', '两厢1.6L手动舒适型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('687', '两厢1.6L自动舒适型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('688', '两厢1.6L手动风尚型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('689', '两厢1.6L自动风尚型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('690', '三厢1.6L手动舒适型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('691', '三厢1.6L自动舒适型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('692', '三厢1.6L手动风尚型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('693', '三厢1.6L自动风尚型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('694', '两厢1.5L GTDi自动精英型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('695', '两厢1.5L GTDi自动运动型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('696', '三厢1.5L GTDi自动精英型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('697', '三厢1.5L GTDi自动旗舰型', '52', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('698', '1.5L手动舒适型', '53', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('699', '1.5L手动时尚型', '53', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('700', '1.5L自动舒适型', '53', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('701', '1.5L自动时尚型', '53', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('702', '1.5L GTDi180舒适型', '54', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('703', '1.5L GTDi180时尚型', '54', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('704', '2.0L GTDi200时尚型', '54', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('705', '2.0L GTDi240豪华运动型', '54', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('706', '2.0L GTDi240至尊型', '54', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('707', '2.0L GTDi200旗舰型', '54', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('708', '1.5L手动舒适型', '55', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('709', '1.5L手动风尚型', '55', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('710', '1.5L手动舒适型', '55', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('711', '1.5L自动风尚型', '55', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('712', '1.5L手动尊贵型', '55', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('713', '1.5L自动尊贵型', '55', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('714', '2.0T GTDi两驱精锐型', '57', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('715', '2.0T GTDi两驱铂锐型', '57', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('716', '2.0T GTDi两驱豪锐型', '57', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('717', '2.0T GTDi四驱豪锐型', '57', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('718', '2.7T GTDi四驱运动型', '57', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('719', '2.7T GTDi四驱尊锐型', '57', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('720', '2.0L GTDi时尚型', '149', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('721', ' 2.0L GTDi豪华型 ', '149', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('722', '2.0LGTDi至尊型', '149', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('723', '2.7L GTDi时尚型', '149', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('724', '2.7L GTDi旗舰型', '149', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('725', '1.6L自动舒适型', '457', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('726', '1.6L自动豪华型', '457', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('727', '230TSI DSG舒适版', '457', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('728', '230TSI DSG豪华版', '457', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('729', '230TSI 手动风尚版', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('730', '230TSI DSG风尚版', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('731', '280TSI 手动舒适版', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('732', '280TSI DSG舒适版', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('733', '280TSI DSG豪华版', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('734', '330TSI DSG舒适版', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('735', '330TSI DSG豪华版', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('736', '1.6L手动风尚型', '455', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('737', '1.6L自动风尚型', '455', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('738', '1.6L手动舒适型', '455', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('739', '1.6L自动舒适型', '455', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('740', '1.6L自动豪华型', '455', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('741', '230TSI DSG舒适型', '455', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('742', '230TSI DSG豪华型', '455', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('743', '280TSI手动尊雅版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('744', '280TSI DSG尊荣版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('745', '330TSI DSG尊荣版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('746', '330TSI DSG御尊版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('747', '380TSI DSG御尊版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('748', '380TSI DSG至尊版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('749', '3.0L V6 DSG旗舰版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('750', '3.0L V6 DSG旗舰尊享版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('751', '1.4TSI手动尊雅版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('752', '1.4TSI手动尊荣版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('753', '1.4TSI DSG尊荣版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('754', '1.4TSI DSG蓝驱技术版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('755', '1.8TSI 自动尊荣版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('756', '1.8TSI DSG尊雅版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('757', '1.8TSI DSG尊荣版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('758', '1.8TSI DSG御尊版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('759', '1.8TSI DSG至尊版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('760', '2.0TSI DSG御尊版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('761', '2.0TSI DSG至尊版', '453', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('762', '300TSI 手动两驱风尚版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('763', '300TSI 自动两驱风尚版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('764', '300TSI 自动四驱风尚视野版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('765', '300TSI 自动两驱舒适版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('766', '300TSI 自动四驱舒适版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('767', '300TSI 自动两驱豪华版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('768', '300TSI 自动四驱豪华版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('769', '1.8TSI手动两驱风尚版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('770', '1.8TSI自动两驱风尚版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('771', '1.8TSI自动四驱风尚视野版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('772', '1.8TSI手动两驱限量版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('773', '1.8TSI自动两驱舒适版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('774', '1.8TSI自动四驱舒适版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('775', '1.8TSI自动两驱豪华版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('776', '1.8TSI自动四驱豪华版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('777', '330TSI 自动四驱舒适视野版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('778', '330TSI 自动四驱豪华版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('779', '330TSI 自动四驱旗舰版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('780', '2.0TSI自动四驱舒适视野版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('781', '2.0TSI 自动四驱豪华版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('782', '2.0TSI 自动四驱旗舰版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('783', '1.4TSI 手动两驱蓝驱版', '451', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('784', '1.4T 手动风尚版5座', '450', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('785', '1.4T 手动舒适版5座', '450', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('786', '1.4T DSG舒适版5座', '450', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('787', '1.4T 手动豪华版5座', '450', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('788', '1.4T DSG豪华版5座', '450', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('789', '1.4T DSG旗舰版5座', '450', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('790', '1.4L手动风尚型', '461', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('791', '1.4L自动风尚型', '461', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('792', '1.4L Cross POLO 手动', '461', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('793', '1.4L Cross POLO 自动', '461', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('794', '1.4L手动舒适版', '461', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('795', '1.4L自动舒适版', '461', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('796', '1.4L自动豪华版', '461', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('797', '1.6L手动舒适型', '461', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('798', '1.6L自动舒适型', '461', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('799', '1.6L自动豪华型', '461', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('800', '1.6L Cross POLO 自动', '461', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('801', '1.4TSI GTI', '461', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('802', '1.4L手动风尚版', '460', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('803', '1.4L手动舒适版', '460', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('804', '1.6L手动风尚版', '460', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('805', '1.6L自动风尚版', '460', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('806', '1.6L手动舒适版', '460', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('807', '1.6L自动舒适版', '460', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('808', '1.6L手动豪华版', '460', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('809', '1.4TDSG尊享版', '460', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('810', '1.6L手动风尚型', '459', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('811', '1.6L自动风尚型', '459', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('812', '1.6L手动舒适型', '459', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('813', '1.6L自动舒适型', '459', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('814', '1.6L自动豪华型', '459', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('815', '230TSI手动舒适版', '459', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('816', '230TSI DSG舒适版', '459', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('817', '230TSI 手动豪华版', '459', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('818', '230TSI DSG豪华版', '459', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('819', '1.2TSI DSG蓝驱技术版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('820', '1.6L手动风尚版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('821', '1.6L自动风尚版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('822', '1.6L手动舒适版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('823', '1.6L自动舒适版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('824', '1.6L自动豪华版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('825', '改款1.6L手动风尚版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('826', '改款1.6L自动风尚版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('827', '改款1.6L手动舒适版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('828', '改款1.6L自动舒适版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('829', '改款1.6L自动豪华版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('830', '1.6L自动运动版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('831', '230TSI手动舒适版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('832', '230TSI DSG舒适版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('833', '230TSI手动豪华版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('834', '230TSI DSG豪华版', '458', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('835', '1.4L手动舒适型', '77', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('836', '1.4L手动豪华型', '77', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('837', '1.4L手动尊贵型', '77', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('838', '1.4L手动天窗型', '77', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('839', '1.4LIMT豪华型', '77', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('840', '1.4LIMT尊贵型', '77', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('841', '1.4LIMT天窗版', '77', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('842', '1.4L手动美满型', '78', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('843', '1.4L手动温馨型', '78', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('844', '1.4L手动幸福型', '78', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('845', '1.6L手动精英型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('846', '1.6L自动精英型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('847', '1.6L手动豪华型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('848', '1.6L自动豪华型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('849', '1.6L手动尊贵型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('850', '1.6L自动尊贵型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('851', '1.6L手动旗舰型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('852', '1.6L自动旗舰型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('853', 'XT1.6L手动尚酷型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('854', 'XT1.6L手动俊酷型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('855', 'XT1.6L手动致酷型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('856', 'XT1.6L手动锐酷型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('857', 'XT1.6L自动俊酷型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('858', 'XT1.6L自动致酷型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('859', 'XT1.6L自动锐酷型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('860', '1.5T自动运动豪华型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('861', '1.5T自动运动尊贵型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('862', 'XT 1.5T自动炫酷型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('863', 'XT 1.5T自动劲酷型', '79', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('864', '1.6L手动乐活型', '80', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('865', '1.6L手动乐尚型', '80', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('866', '1.6L手动乐动型', '80', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('867', '1.6L自动乐动型', '80', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('868', '1.6L手动乐享型', '80', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('869', '1.6L自动乐享型', '80', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('870', '1.6L手动乐趣型', '80', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('871', '1.6L自动乐趣型', '80', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('872', '1.6L手动舒适型', '81', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('873', '1.6L手动豪华型', '81', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('874', '1.6L手动尊贵型', '81', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('875', '1.6L自动豪华型', '81', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('876', '1.6L自动尊贵型', '81', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('877', '1.8T自动四驱时尚型', '82', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('878', '1.8T自动四驱精英型', '82', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('879', '1.8T自动四驱尊贵型', '82', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('886', '1.6L手动舒适型', '85', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('887', '1.6L CVT舒适型', '85', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('888', '1.6L手动智能型', '85', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('889', '1.6LCVT智能型', '85', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('890', '1.6LCVT酷咖型', '85', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('891', '1.6LCVT豪华型', '85', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('892', '1.6T手动GTS限量版', '85', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('893', '1.6TM-CVT GTS限量版', '85', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('894', '1.6XE手动舒适版', '86', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('895', '1.6XL手动豪华版', '86', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('896', '1.6XECVT舒适版', '86', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('897', '1.6XLCVT豪华版', '86', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('898', '1.6XLCVT尊享版', '86', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('899', '1.6XVCVT智享版', '86', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('900', '1.6XVCVT智尊版', '86', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('901', '1.8XL CVT豪华版', '86', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('902', '1.8XV CVT智尊版', '86', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('903', '1.6L XL CVT 舒适版（16款）', '86', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('904', '1.5XE 手动大师版', '87', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('905', '1.5XE CVT大师版', '87', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('906', '1.6L手动时尚版', '88', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('907', '1.6L手动炫酷版', '88', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('908', '1.6LCVT炫酷版', '88', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('909', '1.6LCVT智酷版', '88', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('910', '1.6LCVT高能版', '88', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('911', '2.0L XE-Sporty欧冠运动版', '89', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('912', '2.0L XL-Sporty欧冠运动版', '89', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('913', '2.0L XL Upper欧冠科技版', '89', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('914', '2.5L XL Upper欧冠科技版', '89', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('915', '2.5L XL-NAVI Tech欧冠智享版', '89', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('916', '2.5L XL-UpperNAVI Tech欧冠尊贵版', '89', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('917', '2.5L XV欧冠荣耀版', '89', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('918', '公爵2.5L XV欧冠尊雅版', '89', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('919', '公爵2.5L XV-NAVI-FES欧冠尊尚版', '89', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('920', '公爵2.5L XV-VIP欧冠尊领版', '89', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('921', '2.0L XL舒适版', '89', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('922', '1.2T手动时尚版', '90', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('923', '1.2TCVT时尚版', '90', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('924', '2.0L CVT精英版', '90', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('925', '2.0L CVT领先版', '90', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('926', '2.0L CVT豪华版', '90', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('927', '2.0L CVT尊享版', '90', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('928', '2.0L CVT旗舰版', '90', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('929', '2.0XL酷火MT 2WD', '90', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('930', '2.0XL酷火CVT 2WD', '90', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('931', '2.0XV 酷雷 CVT 2WD', '90', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('932', '2.0XV 酷炫 CVT 2WD', '90', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('933', '2.0L CVT舒适MAX版 2WD', '91', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('934', '2.5L CVT领先MAX版 4WD', '91', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('935', '2.5L XE两驱精英版', '92', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('936', '2.5L XL两驱智尚版', '92', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('937', '2.5L XL NAVI两驱智享版', '92', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('938', '2.5L XL NAVI Plus 两驱智领版', '92', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('939', '2.5L XV RES两驱豪华版', '92', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('940', '2.5L XV RES Plus两驱豪雅版', '92', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('941', '2.5S/C HEV XE两驱混动尊享版', '92', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('942', '2.5S/C HEV XL两驱混动尊雅版', '92', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('943', '2.5S/C HEV XV四驱混动旗舰版', '92', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('944', '凯越', '93', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('945', 'GL8', '93', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('946', '三厢15S自动进取型', '95', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('947', '三厢15S自动领先型', '95', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('948', '两厢15S自动进取型', '95', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('949', '两厢15S自动领先型', '95', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('950', '三厢20T双离合领先型', '95', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('951', '三厢20T双离合精英型', '95', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('952', '三厢20T双离合豪华型', '95', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('953', '三厢20T双离合旗舰型', '95', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('954', '两厢GS 20T双离合豪情运动型', '95', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('955', '两厢GS 20T双离合燃情运动型', '95', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('956', '两厢GS 20T双离合纵情运动型', '95', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('957', '2.0L领先时尚版', '97', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('958', '2.0L精英时尚版', '97', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('959', '1.6T领先技术版', '97', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('960', '1.6T时尚技术版', '97', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('961', '1.6T精英技术版', '97', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('962', '16款18T自动两驱都市领先型', '99', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('963', '16款18T自动两驱都市时尚型', '99', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('964', '16款18T自动两驱都市精英型', '99', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('965', '1.5L手动经典型', '944', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('966', '1.5L自动经典型', '944', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('967', '2.4L豪华商务尊享版', '945', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('968', '2.4L经典版', '945', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('969', '2.4L舒适版', '945', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('970', '2.4L行政版', '945', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('971', '2.4L CT豪华商务舒适版', '945', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('972', '2.4L豪华商务尊享版', '945', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('973', '2.4L LT豪华商务行政版', '945', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('974', '3.0L GT豪华商务豪雅版', '945', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('975', '3.0L XT豪华商务旗舰版', '945', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('976', '1.8L自动舒适版5座', '108', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('977', '1.8L自动舒适精英版5座', '108', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('978', '1.8LCVT豪华版5座', '108', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('979', '1.8LCVT豪华尊享版5座', '108', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('980', '1.5T豪华版VTI-MT 手动', '109', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('981', '1.5T豪华版VTI-AT CVT', '109', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('982', '1.5T尊贵版VTI-S CVT', '109', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('983', '1.5T尊耀版VTISADS CVT', '109', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('984', '1.5L手动经典版', '110', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('985', '1.5LCVT经典版', '110', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('986', '1.5LCVT舒适版', '110', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('987', '1.5LCVT风尚版', '110', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('988', '1.5LCVT豪华版', '110', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('989', '2.0L豪华版', '111', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('990', '2.0L尊贵版', '111', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('991', '2.0L典藏版', '111', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('992', '2.4L尊贵版', '111', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('993', '2.4L尊耀版', '111', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('994', '2.4L Si', '111', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('995', '1.5L LXi手动经典版', '112', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('996', '1.5L LXi CVT经典版', '112', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('997', '1.8L EXi手动舒适版', '112', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('998', '1.8L Exi CVT舒适版', '112', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('999', '1.8L Vti CVT豪华版', '112', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1000', '2.0L两驱经典版', '113', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1001', '2.0L两驱都市版', '113', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1002', '2.0L两驱风尚版', '113', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1003', '2.0L四驱风尚版', '113', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1004', '2.4L两驱豪华版', '113', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1005', '2.4L四驱豪华版', '113', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1006', '2.4L四驱尊贵版', '113', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1007', '2.4L经典版', '114', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1008', '2.4L舒适版', '114', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1009', '2.4L豪华版', '114', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1010', '2.4L至尊版', '114', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1011', '2.4L风尚版', '114', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1013', '1.5L LX手动舒适型', '122', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1014', '1.5L LX CVT舒适型', '122', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1015', '1.5L SE CVT时尚型', '122', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1016', '1.5L EX CVT精英型', '122', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1017', '1.5L EXLI CVT领先型', '122', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1018', '1.5 CVT舒适天窗版', '122', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1019', '1.5 CVT时尚天窗版', '122', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1020', '1.5L手动进取版', '123', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1021', '1.5L手动舒适版', '123', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1022', '1.5L CVT舒适版', '123', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1023', '1.5L手动豪华版', '123', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1024', '1.5L CVT豪华版', '123', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1025', '1.5L 手动旗舰版', '123', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1026', '1.5L CVT旗舰版', '123', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1027', '1.8L手动风尚版', '124', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1028', '1.8L手动舒适版', '124', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1029', '1.8L CVT舒适版', '124', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1030', '1.8L手动豪华版', '124', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1031', '1.8L CVT豪华版', '124', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1032', '1.8L CVT领先版', '124', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1033', '1.8L CVT旗舰版', '124', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1034', '1.8L 自动超配限量版', '124', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1035', '2.4L豪华版', '125', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1036', '2.0 CVT 舒享版', '126', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1037', '2.0 CVT 舒适版', '126', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1038', '2.0 CVT 精英版', '126', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1039', '2.0 CVT 豪华版', '126', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1040', '2.4 CVT 舒适版', '126', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1041', '2.4 CVT 智睿版', '126', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1042', '2.4 CVT 豪华版', '126', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1043', '2.4 CVT 智尊版', '126', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1044', '1.5 MT舒适版', '127', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1045', '1.5 CVT舒适版', '127', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1046', '1.8 MT精英版', '127', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1047', '1.8 CVT精英版', '127', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1048', '1.8 CVT先锋版', '127', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1049', '1.8 CVT豪华版', '127', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1050', '1.8 CVT旗舰版', '127', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1051', '2.4L舒适版', '128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1052', '2.4L豪华版', '128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1053', '2.4L智享版', '128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1054', '2.4L智酷版', '128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1055', '2.4L至尊版', '128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1064', '1.5L手动畅行版', '131', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1065', '1.5L自动畅行版', '131', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1066', '1.5L自动智行版', '131', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1067', '1.5L自动趣行版', '131', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1068', '1.5L手动时尚版', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1069', '1.5L自动时尚天窗版', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1070', '1.5L手动精英版', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1071', '1.5L自动豪华版', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1072', '1.5L自动时尚导航版', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1073', '掀背1.6L手动舒适版', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1074', '掀背1.6L自动舒适版', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1075', '1.4T DCG豪华版', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1076', '1.4T DCG旗舰版', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1077', '1.4T 手动精英版', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1078', '1.5L经典SL MT', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1079', '1.5L经典SE MT', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1080', '1.5L经典SE AT', '132', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1081', '2.0L自动舒适版', '133', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1082', '2.0L自动豪华版', '133', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1083', '1.6T自动舒适版', '133', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1084', '1.6T自动豪华版', '133', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1085', '2.4L自动豪华版', '133', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1086', '2.4L自动旗舰版', '133', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1087', '1.5T双离合锐享版', '134', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1088', '1.5T双离合锐驰版', '134', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1089', '1.5T双离合锐尚版', '134', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1090', '1.5T双离合锐耀版', '134', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1091', '2.5L自动锐尚版', '134', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1092', '2.5L自动锐尊版', '134', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1093', '1.4T手动两驱舒适天窗版', '135', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1094', '1.4T自动两驱舒适天窗版', '135', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1095', '1.4T自动两驱豪华型', '135', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1096', '1.4T自动四驱旗舰型', '135', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1097', ' 1.4T手自舒适版（16款）', '135', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1098', '2.4L两驱城市版5座', '136', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1099', '2.4L两驱城市版7座', '136', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1100', '2.4L四驱豪华版5座', '136', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1101', '2.4L四驱旗舰版7座', '136', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1196', '200h巧克力版', '151', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1197', '200h暗夜骑士版', '151', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1198', '200t F SPORT', '152', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1199', '200t领先版', '152', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1200', '200t锋尚版', '152', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1201', '200t豪华版', '152', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1202', '逐风之翼特别限量版', '152', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1203', '300h舒适版', '153', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1204', '300h豪华版', '153', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1205', '300h尊贵版', '153', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1206', '200精英版', '153', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1207', '250豪华版', '153', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1208', '200 Midnight特别限量版', '153', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1209', '200舒适版', '153', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1210', '250典雅版', '153', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1211', '250 Midnight特别限量版', '153', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1212', '460L四驱尊贵版', '154', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1213', '460L', '154', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1214', '460L豪华版', '154', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1215', '600hL', '154', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1216', '200前驱锋行版', '155', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1217', '200全驱锋尚版', '155', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1218', '300h 前驱锋尚版', '155', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1219', '300h 全驱锋致版', '155', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1220', '300h 全驱锋芒版', '155', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1221', '200t 全驱锋尚版', '155', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1222', '200t 全驱 F SPORT', '155', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1223', '200t 全驱 F SPORT', '156', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1224', '570动感豪华版', '157', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1225', '570尊贵豪华版', '157', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1226', '200t两驱精英版', '158', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1227', '200t两驱舒适版', '158', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1228', '200t四驱典雅版', '158', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1229', '200t四驱F SPORT', '158', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1230', '200t四驱豪华版', '158', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1231', '450h四驱典雅版', '158', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1232', '450h四驱豪华版', '158', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1233', '450h四驱尊贵版', '158', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1234', '200t锋尚版', '159', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1235', '200t F SPORT版', '159', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1236', '200t F SPORT极致版', '159', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1237', '2.0T S', '161', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1238', '2.0T SE', '161', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1239', '2.0T 限量版', '161', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1240', '2.0T HSE', '161', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1241', '2.0T HSE LUXURY', '161', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1242', '2.0T五门风尚版', '162', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1243', '2.0T五门智耀版', '162', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1244', '2.0T五门锐动版', '162', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1245', '2.0T五门致享版', '162', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1246', '3.0 SDV6 HSE柴油版', '164', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1247', '3.0 V6 SC SE', '164', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1248', '3.0 V6 SC HSE', '164', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1249', '3.0 V6 SC HSE Luxury', '164', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1250', '2.0 GTDi HSE', '165', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1251', '3.0 SDV6 HSE', '165', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1252', '3.0 SDV6 HSE Dynamic', '165', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1253', '3.0 SD V6 Hybrid HSE Dynamic', '165', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1254', '3.0 V6 SC SE', '165', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1255', '3.0 V6 SC HSE', '165', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1256', '3.0 V6 SC HSE Dynamic', '165', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1257', '3.0 V6 HST', '165', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1258', '5.0 V8 SVR', '165', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1259', '3.0 TDV6 Vogue', '166', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1260', '3.0 TDV6 Vogue SE创世加长版', '166', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1261', '3.0 TDV6 Hybrid Vogue SE创世加长版', '166', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1262', '3.0 V6 SC Vogue', '166', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1263', '3.0 V6 SC Vouge SE创世加长版', '166', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1264', '3.0 V6 SC Vouge加长版', '166', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1265', '3.0 V6 SC Vouge SE尊崇创世加长版', '166', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1266', '5.0 V8 SC AB尊崇创世加长版', '166', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1267', '5.0 V8 SC AB巅峰创世加长版', '166', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1268', '2.2T SD4 XS典藏版', '167', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1269', '2.0T Si4典藏版', '167', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1270', '2.0T Si4 HSE Luxury典藏版', '167', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1271', '2.0T SE', '168', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1272', '2.0T HSE LUXURY', '168', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1273', '2.0T 200PS R-SPORT', '170', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1274', '2.0T 240PS R-SPORT', '170', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1275', ' 3.0T 340PS S', '170', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1276', '2.0T两驱风华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1277', '2.0T两驱R-Sport运动版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1278', '2.0T两驱奢华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1279', '2.0T风华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1280', '2.0T 80周年典藏风华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1281', '2.0T豪华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1282', '2.0T 80周年典藏豪华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1283', '2.0T奢华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1284', '2.0T Sportbrake风华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1285', '2.0T Sportbrake豪华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1286', '3.0T两驱风华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1287', '3.0T两驱R-Sport运动版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1288', '3.0 SC R-Sport风华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1289', '3.0 SC R-Sport豪华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1290', '3.0 80周年典藏R-Sport版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1291', '3.0 SC R-Sport奢华版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1292', '3.0T四驱S高性能版', '171', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1293', 'XJL 2.0T两驱典雅商务版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1294', 'XJL 2.0T两驱全景商务版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1295', 'XJL 2.0T两驱尊享商务版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1296', 'XJL 2.0T典雅商务80周年典藏版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1297', 'XJL 3.0 SC两驱典雅商务版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1298', 'XJL 3.0 SC四驱全景商务版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1299', 'XJL 3.0 SC两驱尊享商务版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1300', 'XJL 3.0 SC四驱旗舰商务版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1301', 'XJL 3.0 SC两驱全景商务版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1302', 'XJL 3.0 SC两驱剑桥限量版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1303', 'XJL 3.0 SC两驱旗舰商务版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1304', 'XJL 3.0 SC典雅商务80周年典藏版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1305', 'XJL 3.0 SC四驱全景商务80周年典藏版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1306', 'XJL 3.0 SC四驱尊享商务80周年典藏版', '172', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1307', '2.0T都市尊享版', '173', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1308', '2.0T R-SPORT运动版', '173', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1309', '3.0T R-SPORT运动版', '173', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1310', '3.0T S高性能版', '173', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1311', '3.0T S高性能首发限量版', '173', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1312', '3.0T硬顶版', '174', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1313', '3.0T敞篷版', '174', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1314', '3.0T S硬顶版', '174', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1315', '3.0T S四驱硬顶版', '174', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1316', '3.0T S敞篷版', '174', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1317', '3.0T S四驱敞篷版', '174', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1318', '3.0T S硬顶版', '174', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1319', '5.0T R四驱硬顶版', '174', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1320', '5.0T R四驱敞篷版', '174', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1321', '5.0T R硬顶版', '174', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1322', '2.0L领先版', '182', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1323', '2.0L智能版', '182', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1324', '2.0L优越版', '182', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1325', '2.4L领先版', '182', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1326', '2.4L专业版', '182', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1327', '2.4L专业版智能包', '182', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1328', '2.4L优越版', '182', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1329', '2.4L全能版', '182', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1330', '2.0L运动版', '179', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1331', '2.0L两驱豪华版', '179', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1332', '2.0L运动版', '180', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1333', '2.4L运动版', '180', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1334', '2.4L豪华导航版', '180', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1335', '2.8TD四门舒享版Sahara', '181', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1336', '2.8TD四门版Sahara', '181', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1337', '3.0L四门舒享版Sahara', '181', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1338', '3.0L 四门版Sahara', '181', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1339', '3.6L 两门舒享版Rubicon', '181', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1340', '3.6L 四门舒享版Rubicon', '181', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1341', '3.6L 两门版Rubicon', '181', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1342', '3.6L 四门版Rubicon', '181', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1343', '2.4L精英版', '182', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1344', '3.0L舒享导航版', '183', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1345', '3.0L精英导航版', '183', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1346', '3.0L旗舰尊耀版', '183', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1347', '3.0L旗舰尊悦版', '183', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1348', '3.0TD 柴油舒享导航版', '183', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1349', '3.0TD 柴油精英导航版', '183', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1350', '3.6L 精英导航版', '183', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1351', '3.6L 豪华导航版', '183', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1352', '3.6L 旗舰尊耀版', '183', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1353', '3.6L 旗舰尊悦版', '183', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1354', '5.7L 旗舰尊悦版', '183', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1355', 'Edition 3.0T', '186', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1356', 'Executive Edition 3.0T', '186', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1357', 'Panamera 4 Edition 3.0T', '186', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1358', 'Panamera 4 Executive Edition 3.0T', '186', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1359', 'Panamera Exclusive Series 4.8T ', '186', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1360', 'Macan 2.0T ', '187', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1361', 'Macan S 3.0T ', '187', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1362', 'Macan GTS 3.0T ', '187', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1363', 'Macan Turbo 3.6T ', '187', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1364', 'Cayenne 3.0T', '188', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1365', 'Cayenne S E-Hybrid 3.0T', '188', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1366', 'Cayenne S 3.6T', '188', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1367', 'Cayenne GTS 3.6T', '188', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1368', 'Cayenne Turbo 4.8T', '188', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1369', 'Cayenne Turbo S 4.8T', '188', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1370', 'Style Edition 2.7L ', '189', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1371', 'Style Edition 2.7L ', '190', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1372', '两厢1.4L MT GL', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1373', '两厢1.4L MT GLS', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1374', '两厢1.4L AT GLS', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1375', '两厢1.4L MT GLS炫酷版', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1376', '两厢1.4L AT GLS炫酷版', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1377', '三厢1.4L MT GL', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1378', '三厢1.4L MT GLS', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1379', '三厢1.4L AT GLS', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1380', '三厢1.4L MT TOP', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1381', '三厢1.4L AT TOP', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1382', '三厢1.4L AT Premium', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1383', '两厢1.6L AT Premium', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1384', '三厢1.6L AT Premium', '193', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1385', '1.6L MT GL', '194', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1386', '1.6L AT GL', '194', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1387', '1.6L MT GLS', '194', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1388', '1.6L AT GLS', '194', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1389', '1.6L 手动GL', '195', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1390', '1.6L 自动GL', '195', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1391', '1.6L 手动GLS', '195', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1392', '1.6L 自动GLS', '195', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1393', '1.6L 自动DLX', '195', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1394', '1.6L 自动Premium', '195', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1395', '1.8L 自动Premium', '195', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1396', '1.8L自动GLS Special', '196', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1397', '1.8L自动DLX Special', '196', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1398', '1.6T 自动Special', '196', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1399', '2.0L 自动GL', '197', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1400', '2.0L 自动GLS', '197', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1401', '2.0L 自动LUXURY', '197', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1402', '2.0L 自动PREMIUM', '197', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1403', '1.6T自动GLS', '197', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1404', '1.6T自动LUXURY', '197', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1405', '1.6T自动PREMIUM', '197', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1406', '2.0T自动LUXURY', '197', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1407', '2.0T自动PREMIUM', '197', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1408', '2.0L 自动GL', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1409', '2.0L 自动GLS', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1410', '2.0L 自动LUXURY', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1411', '2.0L 自动PREMIUM', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1412', '1.6T自动GLS', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1413', '1.6T自动LUXURY', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1414', '1.6T自动PREMIUM', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1415', '2.0T自动LUXURY', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1416', '2.0T自动PREMIUM', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1417', '2.0T自动Turbo', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1418', '2.0T自动T-PRM', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1419', '2.0T自动T-Special', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1420', '2.0L手动GL', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1421', '2.0L自动LUX', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1422', '2.0L自动Special', '198', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1423', '1.6L手动两驱GL', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1424', '1.6L手动两驱GLS', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1425', '1.6L自动Special', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1426', '1.6L自动两驱DLX', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1427', '1.6L自动两驱PRM', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1428', '1.6L自动两驱GLS', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1429', '1.6T自动Special', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1430', '1.6T自动两驱DLX', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1431', '1.6T自动两驱PRM', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1432', '1.6T自动两驱DLX', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1433', '1.6T自动两驱PRM', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1434', '2.0L自动两驱DLX', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1435', '2.0L自动四驱PRM', '199', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1436', '2.0L手动两驱GL', '200', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1437', '2.0L自动两驱GL', '200', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1438', '2.0L自动两驱GLS', '200', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1439', '2.0L自动两驱Premium', '200', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1440', '1.6T 自动两驱GL', '200', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1441', '1.6T 自动两驱DLX', '200', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1442', '1.6T 自动两驱Premium', '200', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1443', '1.6T 自动四驱Premium', '200', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1444', '2.0L手动两驱版GL', '201', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1445', '2.0L自动两驱版GL', '201', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1446', '2.0L手动两驱版GLS', '201', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1447', '2.0L自动两驱版GLS', '201', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1448', '2.0L自动四驱版GLS', '201', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1449', '2.0L自动两驱版DLX', '201', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1450', '2.0L自动两驱版Premium ', '201', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1451', '2.4L自动四驱版Premium ', '201', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1452', '1.6L手动舒适版', '205', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1453', '1.6L自动舒适版', '205', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1454', '1.6L手动豪华版', '205', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1455', '1.6L自动豪华版', '205', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1456', '1.6L自动尊贵版', '205', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1457', '1.6L手动尚驰版', '206', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1458', '1.6L手动劲驰版', '206', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1459', '1.2T手动尚驰版', '206', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1460', '1.2T自动尚驰版', '206', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1461', '1.2T自动劲驰版', '206', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1462', '1.6T自动劲驰版', '206', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1463', '1.6T自动睿驰版', '206', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1464', '1.2T手动豪华版', '207', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1465', '1.2T自动豪华版', '207', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1466', '1.2T自动荣耀版', '207', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1467', '2.0L手动致逸版', '208', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1468', '2.0L自动致逸版', '208', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1469', '2.0L自动致臻版', '208', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1470', '1.6THP自动致逸版', '208', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1471', '1.6THP自动致臻版', '208', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1472', '1.8THP自动致臻版', '208', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1473', '1.8THP自动致尊版', '208', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1474', '1.8THP自动旗舰版', '208', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1475', '玩酷版1.6L自动翡翠型', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1476', '玩酷版1.6L自动金钻型', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1477', '1.6THP自动时尚版', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1478', '1.6THP罗兰.加洛斯版', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1479', '1.6THP自动领航版', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1480', '2.0L手动经典版', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1481', '2.0L自动经典版', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1482', '2.0L手动潮流版', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1483', '2.0L自动潮流版', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1484', '1.6THP 自动经典版', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1485', '1.6THP 自动潮流版', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1486', '1.6THP 自动至尚版', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1487', '1.6THP 罗兰.加洛斯版', '209', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1488', '2.0T T5智逸版', '211', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1489', '2.0T T5智雅版', '211', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1490', '2.0T T5智尊行政版', '211', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1491', '1.5T T3智行版', '212', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1492', '2.0T T4智远版', '212', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1493', 'E驱混动2.0T智驭版', '212', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1494', 'E驱混动2.0T智越版', '212', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1495', '2.0T T5智驭版', '212', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1496', '2.0T T5智越版', '212', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1497', '2.0T智行版', '212', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1498', '2.0T智进版', '212', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1499', '2.0T智远版', '212', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1500', '2.0T T5 AWD智远版', '213', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1501', '2.0T T5 AWD智驭版', '213', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1502', '2.0T T5 AWD智版', '213', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1503', '2.5T T6 AWD智越版', '213', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1504', '1.5T T3智尚版', '214', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1505', '1.5T T3智逸版', '214', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1506', 'Cross Country 2.0T智逸版', '214', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1507', '2.0T T4智雅版', '214', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1508', '2.0T T4 个性运动版', '214', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1509', 'Cross Country 2.0T T5 AWD智雅版', '214', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1510', 'Cross Country 2.0T T5 AWD智尊版', '214', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1511', '2.0T智尊个性运动版', '214', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1512', '1.6T智尚版', '214', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1513', '1.6T智逸版', '214', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1514', '1.6T智雅版', '214', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1515', '1.6T智雅个性运动版', '214', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1516', '2.0T T5 个性运动版', '215', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1517', '3.0T T6 AWD个性运动版', '215', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1518', '2.0T T4智尚版', '216', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1519', '2.0T T5智逸版', '216', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1520', '2.0T T5智雅版', '216', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1521', '2.0T T5智雅个性运动版', '216', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1522', '2.0T T5智尊版', '216', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1523', '2.0T T5智逸个性运动版', '216', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1524', 'Cross Country 2.5T T6 AWD', '216', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1525', '3.0T T6 AWD个性运动版', '216', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1526', '2.0T T5 智逸版5座', '217', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1527', '2.0T T5 智逸版7座', '217', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1528', '2.0T T6 智逸版5座', '217', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1529', '2.0T T6 智逸版7座', '217', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1530', '2.0T T6智雅版5座', '217', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1531', '2.0T T6智雅版7座', '217', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1532', '2.0T T6智尊版5座', '217', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1533', '2.0T T6智尊版7座', '217', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1534', 'E驱混动2.0T T8个性运动版7座', '217', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1535', 'E驱混动2.0T T8智尊版7座', '217', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1536', 'E驱混动2.0T T8荣誉版4座', '217', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1537', '2.0T T5智逸版', '218', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1538', '2.0T T5智雅版', '218', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1539', '2.0T T5个性运动版', '218', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1540', '3.0T T6智逸版', '218', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1541', '3.0T T6智雅版', '218', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1542', '3.0T T6个性运动版', '218', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1543', '1.2T手动豪华版', '220', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1544', '1.2T自动豪华版', '220', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1545', '1.2T自动尊贵版', '220', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1546', '1.8L手动领先版', '220', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1547', '1.8L自动领先版', '220', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1548', '1.8L自动豪华版', '220', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1549', '1.8L自动尊贵版', '220', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1550', '1.6T自动尊贵版', '220', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1551', '1.6T自动旗舰版', '220', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1552', '经典三厢1.6L手动CNG', '222', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1553', '经典三厢1.6L手动品尚型', '222', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1554', '经典三厢1.6L自动品尚型', '222', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1555', '1.6L手动时尚型', '223', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1556', '1.6L自动时尚型', '223', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1557', '1.6L手动舒适型', '223', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1558', '1.6L自动舒适型', '223', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1559', '1.6L自动豪华型', '223', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1560', '质尚版1.6L手动时尚型', '223', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1561', '质尚版1.6L自动时尚型', '223', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1562', '质尚版1.6L手动舒适型', '223', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1563', '质尚版1.6L自动舒适型', '223', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1564', '质尚版1.6L自动豪华型', '223', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1565', '1.6L手动舒适型', '224', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1566', '1.6L手动豪华型', '224', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1567', '1.6L自动舒适型', '224', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1568', '1.6L自动豪华型', '224', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1569', '1.2THP手动舒适型', '224', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1570', '1.2THP自动豪华型', '224', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1571', '1.2THP自动旗舰型', '224', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1572', '1.6THP自动旗舰型', '224', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1573', '1.6T自动尊悦型', '225', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1574', '1.8T自动尊享型', '225', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1575', '1.8T自动尊贵型', '225', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1576', '1.8T自动豪华型', '225', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1577', '1.6L手动时尚型', '226', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1578', '1.6L自动时尚型', '226', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1579', '1.6L手动先锋型', '226', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1580', '1.6L自动先锋型', '226', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1581', '1.6L自动智能型', '226', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1582', '1.6THP自动先锋型', '226', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1583', '1.6THP自动智能型', '226', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1584', '1.6THP自动旗舰型', '226', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1585', '舒适版', '252', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1586', '豪华版', '252', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1587', '尊享版', '253', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1588', '尊贵版', '253', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1589', '领先版', '254', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1590', '智能版', '254', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1591', '劲享版', '254', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1592', '畅享版', '254', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1593', '乐享版', '254', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1594', '尊享版', '254', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1595', '自动豪华版', '255', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1596', '时尚版', '256', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1597', '精英版', '256', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1598', '舒适型', '257', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1599', '舒适天窗版', '257', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1600', '豪华型', '258', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1601', '尊贵型', '258', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1602', '智悦型', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1603', '智尚型', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1604', '智联型', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1605', '智享型', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1606', '智慧型', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1607', '智尊型', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1608', '四驱智慧型', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1609', '四驱智尊型', '456', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1618', '2016款 1.5L 手动超值型 7座', '269', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1619', '科沃兹', '129', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1620', '2017款1.5TCVT风尚版', '108', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1621', '2017款1.5TCVT豪华版', '108', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1622', '2017款1.5TCVT豪华版（6座）', '108', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1627', '宝骏560', '267', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1628', '宝骏310', '267', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1629', '宝骏510', '267', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1630', 'A系列（进口）', '11', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1631', '西玛', '83', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1632', '骊威', '83', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1633', '晨风', '238', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1638', '幻速H3F', '250', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1639', '比速T3', '250', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1640', '比速T5', '250', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1641', '比速M3', '250', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1642', 'GA3S', '102', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1643', '桑塔纳', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1644', '途昂', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1645', '宝骏310', '274', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1646', '宝骏560', '274', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1647', '宝骏730', '274', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1648', '酷路泽', '29', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1649', 'Q7', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1650', 'A8L', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1651', 'A1', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1652', 'S3', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1653', 'A5', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1654', 'S5', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1655', 'A6', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1656', 'S6', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1657', 'A7', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1658', 'A8', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1659', 'S8', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1660', 'TT', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1661', 'TTS', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1662', 'R8', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1663', 'RS5', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1664', 'RS6', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1665', 'RS7', '22', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1666', '2系旅行车', '11', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1681', 'B级', '1', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1682', 'CLS', '1', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1683', 'S级', '1', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1684', 'G级', '1', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1685', '竞瑞', '107', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1686', 'UR-V', '107', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1687', '冠道', '121', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1688', '广汽丰田', '0', '/putao/Public/Uploads/thumb_590d6cb24e6ad.png', '0', '10', 'G', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1689', 'YARiS L致享', '1688', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1690', 'YARiS L致炫', '1688', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1691', '雷凌', '1688', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1692', '凯美瑞', '1688', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1693', '汉兰达', '1688', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1694', '逸致', '1688', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1695', '威驰FS', '29', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1696', '普锐斯', '29', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1697', '皇冠', '29', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1698', 'RAV4荣放', '29', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1699', '柯斯达', '29', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1700', '兰德酷路泽', '29', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1701', '马自达3', '145', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1702', '昂克塞拉', '145', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1703', '马自达3 星骋', '145', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1704', '一汽马自达', '0', '/putao/Public/Uploads/thumb_590d6c72c12e8.jpg', '0', '42', 'Y', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1705', '阿特兹', '1704', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1706', 'CX-4', '1704', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1707', '马自达6', '1704', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1708', '睿翼', '1704', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1709', 'CX-7', '1704', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1710', '玛驰', '83', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1711', '悦纳', '36', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1712', '悦纳RV', '36', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1713', '悦动', '36', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1714', '领动', '36', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1715', '伊兰特', '36', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1716', '索纳塔九', '36', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1717', '赛欧', '129', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1718', '探界者', '129', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1719', '爱唯欧', '129', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1720', 'D2半年租', '233', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1725', 'D2月租', '233', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1726', 'H7', '137', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1727', '平行进口', '0', '', '0', '37', 'P', '1', '0');
INSERT INTO `think_sign_brands` VALUES ('1728', '普拉多', '1727', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1730', '5008', '204', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1731', '308', '204', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1732', '4008', '204', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1733', '3008', '204', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1734', '标致RCZ', '204', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1735', '索兰托', '192', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1736', '起亚KX7', '192', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('1737', '2017款 红标 1.5L 手动标准型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1738', '2017款 红标 1.5L 手动舒适型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1739', '2017款 红标 1.5L 手动豪华型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1740', '2017款 红标 1.5L AMT舒适型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1741', '2017款 红标 1.5L AMT豪华型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1742', '2017款 蓝标 1.5L 手动标准型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1743', '2017款 蓝标 1.5L 手动豪华型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1744', '2017款 蓝标 1.5L 手动尊贵型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1745', '2017款 蓝标 1.5L AMT标准型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1746', '2017款 蓝标 1.5L AMT豪华型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1747', '2017款 蓝标 1.5L AMT尊贵型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1748', '2016款 改款 蓝标 1.5L 手动标准型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1749', '2016款 改款 蓝标 1.5L 手动舒适型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1750', '2016款 改款 蓝标 1.5L 手动豪华型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1751', '2016款 改款 蓝标 1.5L 手动尊贵型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1752', '2016款 改款 蓝标 1.5L AMT标准型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1753', '2016款 改款 蓝标 1.5L AMT舒适型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1754', '2016款 改款 蓝标 1.5L AMT豪华型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1755', '2016款 改款 蓝标 1.5L AMT尊贵型', '138', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1756', '2017款 红标 1.5T 手动两驱舒适型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1757', '2017款 红标 1.5T 手动四驱舒适型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1758', '2017款 红标 1.5T 手动两驱精英型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1759', '2017款 红标 1.5T 手动四驱精英型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1760', '2017款 红标 1.5T 自动两驱精英型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1761', '2017款 红标 1.5T 手动两驱豪华型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1762', '2017款 红标 1.5T 手动四驱豪华型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1763', '2017款 红标 1.5T 自动两驱豪华型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1764', '2017款 蓝标 1.5T 手动两驱精英型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1765', '2017款 蓝标 1.5T 自动两驱精英型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1766', '2017款 蓝标 1.5T 手动两驱豪华型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1767', '2017款 蓝标 1.5T 手动四驱豪华型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1768', '2017款 蓝标 1.5T 自动两驱豪华型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1769', '2017款 蓝标 1.5T 手动两驱尊贵型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1770', '2017款 蓝标 1.5T 手动四驱尊贵型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1771', '2017款 蓝标 1.5T 自动两驱尊贵型', '139', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1772', 'H2s', '137', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1773', '2017款 蓝标 1.5T 手动舒适型', '1772', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1774', '2017款 蓝标 1.5T 自动舒适型', '1772', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1775', '2017款 蓝标 1.5T 手动精英型', '1772', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1776', '2017款 蓝标 1.5T 自动精英型', '1772', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1777', '2017款 蓝标 1.5T 自动豪华型', '1772', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1778', '2017款 红标 1.5T 手动舒适型', '1772', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1779', '2017款 红标 1.5T 自动舒适型', '1772', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1780', '2017款 红标 1.5T 手动精英型', '1772', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1781', '2017款 红标 1.5T 自动精英型', '1772', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1782', '2017款 红标 1.5T 自动豪华型', '1772', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1783', '2016款 1.3T 手动精英版', '1642', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1784', '2016款 1.3T 手动豪华ESP版', '1642', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1785', '2015款 2.0L 手动两驱进取型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1786', '2015款 2.0L 手动四驱进取型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1787', '2015款 2.0T 柴油 手动两驱进取型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1788', '2015款 2.0T 柴油 手动四驱进取型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1789', '2016款 经典版 2.0T 柴油 手动两驱精英型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1790', '2016款 经典版 2.0T 柴油 手动四驱精英型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1791', '2016款 经典版 2.0T 柴油 手动两驱尊贵型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1792', '2016款 经典版 2.0T 柴油 手动四驱尊贵型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1793', '2015款 2.0T 柴油 自动两驱进取型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1794', '2015款 2.0T 柴油 自动两驱精英型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1795', '2015款 2.0T 柴油 自动两驱尊贵型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1796', '2015款 2.0T 柴油 自动四驱进取型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1797', '2015款 2.0T 柴油 自动四驱精英型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1798', '2015款 2.0T 柴油 自动四驱尊贵型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1799', '2015款 2.0T 手动两驱进取型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1800', '2015款 2.0T 手动两驱精英型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1801', '2015款 2.0T 手动两驱尊贵型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1802', '2015款 2.0T 手动四驱进取型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1803', '2015款 2.0T 手动四驱精英型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1804', '2015款 2.0T 手动四驱尊贵型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1805', '2016款 经典版 2.0T 手动两驱精英型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1806', '2016款 经典版 2.0T 手动四驱精英型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1807', '2016款 经典版 2.0T 手动两驱尊贵型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1808', '2016款 经典版 2.0T 手动四驱尊贵型', '140', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1809', '2017款 全新 红标 1.3T 自动两驱时尚型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1810', '2017款 全新 红标 1.3T 自动两驱风尚型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1811', '2017款 全新 红标 1.3T 自动两驱智尚型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1812', '2017款 全新 蓝标 1.3T 自动两驱时尚型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1813', '2017款 全新 蓝标 1.3T 自动两驱风尚型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1814', '2017款 全新 蓝标 1.3T 自动两驱智尚型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1815', '2017款 经典版 1.5T 手动两驱超值型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1816', '2017款 经典版 1.5T 手动四驱超值型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1817', '2017款 经典版 1.5T 手动两驱都市型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1818', '2017款 经典版 1.5T 手动四驱都市型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1819', '2017款 经典版 1.5T 手动两驱精英型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1820', '2017款 经典版 1.5T 手动四驱精英型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1821', '2017款 经典版 1.5T 自动两驱都市型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1822', '2017款 经典版 1.5T 自动两驱精英型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1823', '2017款 红标 运动版 1.5T 手动两驱精英型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1824', '2017款 红标 运动版 1.5T 手动四驱精英型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1825', '2017款 红标 运动版 1.5T 手动两驱尊贵型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1826', '2017款 红标 运动版 1.5T 手动四驱尊贵型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1827', '2017款 红标 运动版 1.5T 自动两驱豪华型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1828', '2017款 红标 运动版 1.5T 自动两驱尊享型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1829', '2017款 蓝标 运动版 1.5T 手动两驱精英型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1830', '2017款 蓝标 运动版 1.5T 手动四驱精英型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1831', '2017款 蓝标 运动版 1.5T 手动两驱尊贵型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1832', '2017款 蓝标 运动版 1.5T 手动四驱尊贵型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1833', '2017款 蓝标 运动版 1.5T 自动两驱豪华型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1834', '2017款 蓝标 运动版 1.5T 自动两驱尊享型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1835', '2016款 升级版 1.5T 手动两驱超值型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1836', '2016款 升级版 1.5T 手动四驱超值型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1837', '2016款 升级版 1.5T 手动两驱都市型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1838', '2016款 升级版 1.5T 手动四驱都市型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1839', '2016款 升级版 1.5T 手动两驱精英型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1840', '2016款 升级版 1.5T 手动四驱精英型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1841', '2016款 升级版 1.5T 手动两驱尊贵型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1842', '2016款 升级版 1.5T 手动四驱尊贵型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1843', '2016款 升级版 1.5T 自动两驱精英型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1844', '2016款 升级版 1.5T 自动两驱尊贵型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1845', '2016款 升级版 2.0T 柴油 手动两驱都市型 国V', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1846', '2016款 升级版 2.0T 柴油 手动两驱精英型 国V', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1847', '2016款 升级版 2.0T 柴油 手动两驱尊贵型 国V', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1848', '2016款 升级版 2.0T 柴油 手动四驱都市型 国V', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1849', '2016款 升级版 2.0T 柴油 手动四驱精英型 国V', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1850', '2016款 升级版 2.0T 柴油 手动四驱尊贵型 国V', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1851', '2017款 红标 运动版 2.0T 柴油 手动两驱精英型 国IV', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1852', '2017款 红标 运动版 2.0T 柴油 手动四驱精英型 国IV', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1853', '2017款 红标 运动版 2.0T 柴油 手动两驱尊贵型 国IV', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1854', '2017款 红标 运动版 2.0T 柴油 手动四驱尊贵型 国IV', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1855', '2017款 红标 运动版 2.0T 柴油 手动两驱精英型 国V', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1856', '2017款 红标 运动版 2.0T 柴油 手动四驱精英型 国V', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1857', '2017款 红标 运动版 2.0T 柴油 手动两驱尊贵型 国V', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1858', '2017款 红标 运动版 2.0T 柴油 手动四驱尊贵型 国V', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1859', '2017款 蓝标 运动版 2.0T 柴油 手动两驱精英型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1860', '2017款 蓝标 运动版 2.0T 柴油 手动四驱精英型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1861', '2017款 蓝标 运动版 2.0T 柴油 手动两驱尊贵型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1862', '2017款 蓝标 运动版 2.0T 柴油 手动四驱尊贵型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1863', '2016款 升级版 2.0T 柴油 手动两驱都市型 国IV', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1864', '2016款 升级版 2.0T 柴油 手动两驱精英型 国IV', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1865', '2016款 升级版 2.0T 柴油 手动两驱尊贵型 国IV', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1866', '2016款 升级版 2.0T 柴油 手动四驱都市型 国IV', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1867', '2016款 升级版 2.0T 柴油 手动四驱精英型 国IV', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1868', '2016款 升级版 2.0T 柴油 手动四驱尊贵型 国IV', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1869', '2017款 全新 红标 2.0T 自动两驱风尚型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1870', '2017款 全新 红标 2.0T 自动两驱智尚型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1871', '2017款 全新 红标 2.0T 自动两驱领尚型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1872', '2017款 全新 蓝标 2.0T 自动两驱风尚型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1873', '2017款 全新 蓝标 2.0T 自动两驱智尚型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1874', '2017款 全新 蓝标 2.0T 自动两驱领尚型', '141', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1875', '2016款 蓝标 1.5T 手动两驱都市型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1876', '2016款 蓝标 1.5T 自动两驱都市型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1877', '2016款 蓝标 1.5T 手动两驱精英型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1878', '2016款 蓝标 1.5T 自动两驱精英型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1879', '2017款 红标柴油 2.0T 手动两驱都市型 国V', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1880', '2017款 红标柴油 2.0T 手动四驱都市型 国V', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1881', '2017款 红标柴油 2.0T 手动两驱精英型 国V', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1882', '2017款 红标柴油 2.0T 手动四驱精英型 国V', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1883', '2016款 蓝标柴油 2.0T 手动两驱舒适型 国IV', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1884', '2016款 蓝标柴油 2.0T 手动两驱都市型 国IV', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1885', '2016款 蓝标柴油 2.0T 手动两驱精英型 国IV', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1886', '2016款 蓝标柴油 2.0T 手动两驱尊贵型 国IV', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1887', '2016款 蓝标柴油 2.0T 手动四驱精英型 国IV', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1888', '2016款 蓝标柴油 2.0T 手动四驱尊贵型 国IV', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1889', '2016款 蓝标柴油 2.0T 手动两驱舒适型 国V', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1890', '2016款 蓝标柴油 2.0T 手动两驱都市型 国V', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1891', '2016款 蓝标柴油 2.0T 手动两驱精英型 国V', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1892', '2016款 蓝标柴油 2.0T 手动两驱尊贵型 国V', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1893', '2016款 蓝标柴油 2.0T 手动四驱精英型 国V', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1894', '2016款 蓝标柴油 2.0T 手动四驱尊贵型 国V', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1895', '2017款 红标 2.0T 手动两驱都市型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1896', '2017款 红标 2.0T 手动四驱都市型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1897', '2017款 红标 2.0T 自动两驱都市型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1898', '2017款 红标 2.0T 手动两驱精英型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1899', '2017款 红标 2.0T 手动四驱精英型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1900', '2017款 红标 2.0T 自动两驱精英型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1901', '2017款 红标 2.0T 自动两驱尊贵型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1902', '2017款 蓝标 2.0T 手动两驱都市型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1903', '2017款 蓝标 2.0T 手动四驱都市型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1904', '2017款 蓝标 2.0T 自动两驱都市型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1905', '2017款 蓝标 2.0T 手动两驱精英型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1906', '2017款 蓝标 2.0T 手动四驱精英型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1907', '2017款 蓝标 2.0T 自动两驱精英型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1908', '2017款 蓝标 2.0T 自动两驱尊贵型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1909', '2015款 蓝标改款 2.0T 手动两驱都市型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1910', '2015款 蓝标 2.0T 手动两驱精英型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1911', '2015款 蓝标 2.0T 手动两驱尊贵型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1912', '2015款 蓝标 2.0T 手动四驱精英型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1913', '2015款 蓝标 2.0T 手动四驱尊贵型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1914', '2015款 蓝标 2.0T 自动两驱精英型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1915', '2015款 蓝标 2.0T 自动两驱尊贵型', '142', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1916', '2016款 蓝标H7 2.0T 自动舒适型', '1726', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1917', '2016款 蓝标H7 2.0T 自动精英型', '1726', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1918', '2016款 蓝标H7 2.0T 自动豪华型', '1726', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1919', '2017款 蓝标H7L 2.0T 自动精英型', '1726', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1920', '2017款 蓝标H7L 2.0T 自动豪华型', '1726', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1921', '2017款 蓝标H7L 2.0T 自动尊贵型', '1726', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1922', '2017款 红标H7 2.0T 自动精英型', '1726', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1923', '2017款 红标H7 2.0T 自动豪华型', '1726', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1924', '2017款 红标H7 2.0T 自动尊享型', '1726', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1925', '2017款 红标H7 2.0T 自动尊贵型', '1726', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1926', '2017款 2.0T 柴油两驱悦享型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1927', '2017款 2.0T 柴油两驱智享型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1928', '2017款 2.0T 柴油四驱悦享型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1929', '2017款 2.0T 柴油四驱智享型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1930', '2017款 2.0T 汽油两驱悦享型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1931', '2017款 2.0T 汽油两驱智享型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1932', '2017款 2.0T 汽油四驱悦享型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1933', '2017款 2.0T 汽油四驱智享型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1934', '2017款 2.0T 汽油四驱尊享型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1935', '2015款 2.0T 两驱舒适型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1936', '2015款 2.0T 两驱标准型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1937', '2015款 2.0T 两驱精英型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1938', '2015款 2.0T 两驱豪华型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1939', '2015款 2.0T 两驱尊贵型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1940', '2015款 2.0T 四驱舒适型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1941', '2015款 2.0T 四驱标准型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1942', '2015款 2.0T 四驱精英型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1943', '2015款 2.0T 四驱豪华型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1944', '2015款 2.0T 四驱尊享型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1945', '2015款 2.0T 四驱尊贵型', '143', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1946', '2017款 2.0T 柴油四驱舒适型 5座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1947', '2017款 2.0T 柴油四驱舒适型 7座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1948', '2017款 2.0T 柴油四驱豪华型 7座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1949', '2017款 2.0T 柴油四驱尊享型 5座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1950', '2017款 2.0T 汽油四驱舒适型 5座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1951', '2017款 2.0T 汽油四驱舒适型 7座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1952', '2017款 2.0T 汽油四驱豪华型 7座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1953', '2017款 2.0T 汽油四驱尊享型 5座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1954', '2017款 2.0T 汽油四驱尊贵型 7座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1955', '2016款 2.0T 四驱标准型 5座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1956', '2016款 2.0T 四驱标准型 7座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1957', '2016款 2.0T 四驱精英型 5座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1958', '2016款 2.0T 四驱精英型 7座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1959', '2016款 2.0T 四驱豪华型 5座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1960', '2016款 2.0T 四驱豪华型 7座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1961', '2016款 2.0T 四驱尊贵型 5座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1962', '2016款 2.0T 四驱尊贵型 7座', '144', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1963', '2017款1.8T智享版', '325', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1964', '2017款1.8T尊享版', '325', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1965', '2017款1.8T行政版', '325', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1966', '2017款2.0T智享版', '325', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1967', '2017款2.0T尊享版', '325', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1968', '2017款2.0T行政版', '325', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1969', '2017款2.0T至尊版', '325', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1970', '2016款 1.8T自动两驱尊享版', '106', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1971', '2017款 235T 自动两驱豪华智联版', '105', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1972', '2016款 2.4L 舒适型', '533', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1973', '2016款 2.4L 尊雅型', '533', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1974', '2016款 1.8T 舒适型', '533', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1975', '2016款 1.8T 尊雅型', '533', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1976', '2016款 1.8T G20行政版', '533', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1977', '2017款 1.5L 手动进取型', '532', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1978', '2017款 1.5L 手动幸福型', '532', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1979', '2017款 1.5L 自动幸福版', '532', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1980', '2017款 1.3T 手动幸福版', '532', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1981', '2017款 1.3T 手动尊贵版', '532', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1982', '帝豪', '266', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1983', '帝豪GL', '266', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1985', '2016款 1.8T 手动智享版', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1986', '2016款 1.8T 手动智尚型', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1987', '2016款 1.8T 手动智联型', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1988', '2016款 1.8T 手动智慧型', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1989', '2016款 1.8T 自动智尚型', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1990', '2016款 1.8T 自动智联型', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1991', '2016款 1.8T 自动智慧型', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1992', '2016款 1.8T 自动至尊型', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1993', '2016款 1.8T 自动四驱智慧型', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1994', '2016款 1.8T 自动四驱智尊型', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1995', '2016款 2.0L 手动智悦型', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1996', '2016款 2.0L 手动智尚型', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1997', '2016款 2.0L 手动智联型', '465', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1998', '2017款三厢百万款1.3T 手动向上版', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('1999', '2017款三厢百万款1.3T CVT向上版', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2000', '2017款三厢百万款1.3T CVT尊贵型', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2001', '2017款两厢RS百万款1.3T 手动向上版', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2002', '2017款两厢RS百万款1.3 CVT向上版', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2003', '2017款三厢百万款1.5L 手动时尚型', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2004', '2017款三厢百万款1.5L 手动豪华型', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2005', '2017款三厢百万款1.5L 手动向上版', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2006', '2017款三厢百万款1.5L CVT豪华型', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2007', '2017款三厢百万款1.5L CVT向上版', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2008', '2017款三厢百万款1.5L CVT向上互联版', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2009', '2017款两厢RS百万款1.5L 手动向上版', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2010', '2017款两厢RS百万款1.5L CVT向上版 ', '1982', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2011', '2017款 1.3T 手动精英型', '1983', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2012', '2017款 1.3T 自动精英型', '1983', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2013', '2017款 1.3T 自动尊贵型', '1983', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2014', '2017款 1.3T 自动旗舰型', '1983', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2015', '2017款 1.8L 手动进取型', '1983', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2016', '2017款 1.8L 手动精英型', '1983', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2017', '2017款 1.8L 自动精英型', '1983', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2018', 'DS', '0', '/putao/Public/Uploads/5980154ec2ba8.png', '0', '23', 'D', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2019', '凯迪拉克', '0', '/putao/Public/Uploads/59801543cb9b0.png', '0', '14', 'K', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2020', '讴歌', '0', '/putao/Public/Uploads/59801536cc032.png', '0', '15', 'O', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2021', '广汽三菱', '0', '/putao/Public/Uploads/59801513a6756.png', '0', '26', 'G', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2023', '雷诺', '0', '/putao/Public/Uploads/59801522adc99.png', '0', '33', 'L', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2024', '菲亚特', '0', '/putao/Public/Uploads/598014f567880.png', '0', '22', 'F', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2025', '北汽新能源', '0', '/putao/Public/Uploads/59964f7ba2738.png', '0', '24', 'B', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2026', 'EC180', '2025', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('2027', 'A3', '22', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2028', 'Q3', '22', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2029', 'Q5', '22', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2030', '1系', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2031', '3系', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2032', '5系', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2033', 'X1', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2034', 'X2', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2035', '宝马X1新能源', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2036', '宝马i3', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2037', '宝马3系GT', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2038', '4系', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2039', '5系GT', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2040', '6系', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2041', '7系', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2042', 'X3', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2043', 'X4', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2044', 'X5', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2045', 'X6', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2046', '2系', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2047', 'i8', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2048', '一汽大众', '0', '/putao/Public/Uploads/59cca94e2c910.jpg', '0', '11', 'Y', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('2049', '上海大众', '0', '/putao/Public/Uploads/59ccaa3b338ae.jpg', '0', '19', 'S', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2050', '帝豪GS', '266', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2051', 'GS', '150', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2052', 'XT5', '2019', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2053', 'ATS-L', '2019', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2054', 'CT6', '2019', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2055', 'XTS', '2019', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2056', 'CDX', '2020', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2057', 'MDX', '2020', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2058', ' NSX', '2020', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2059', 'RDX', '2020', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2060', 'TLX', '2020', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2061', '自由侠', '177', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2062', '马自达2', '145', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2063', '菲翔', '2024', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2064', '致悦', '2024', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2065', '菲亚特500', '2024', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('2066', '菲跃', '2024', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('2067', '博悦', '2024', '', '0', '100', 'N', '0', '1');
INSERT INTO `think_sign_brands` VALUES ('2068', '欧蓝德', '2021', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2069', '劲炫ASX', '2021', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2070', '帕杰罗·劲畅', '2021', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2071', '帕杰罗', '2021', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2072', '科雷傲', '2023', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2073', '科雷嘉', '2023', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2074', '卡缤', '2023', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2075', '风朗', '2023', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2076', '纬度', '2023', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2077', '梅甘娜', '2023', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2078', '幻速S5', '250', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2079', '宝骏510', '274', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2080', '宝骏E100', '274', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2081', '宝骏630', '274', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2082', 'EU系列', '2025', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2083', 'EC系列', '2025', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2084', 'EV系列', '2025', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2085', 'EX系列', '2025', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2086', 'EH系列', '2025', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2087', 'GA4', '102', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2088', 'GM8', '102', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2089', 'GS7', '102', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2090', 'Q7', '22', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2091', '浩纳', '2049', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2092', '新一代ix35', '36', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2093', '大指挥家', '177', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2094', '国产自由光', '177', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2095', '6GT', '11', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2096', '进口', '1704', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2097', 'CX-3', '1704', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2098', '金刚', '266', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2099', '帝豪新能源', '266', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2100', '奕泽', '29', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2101', '蓝鸟', '83', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2102', '劲客', '83', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2103', '阳光', '83', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2104', '308S', '204', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2105', '荣威', '0', '/putao/Public/Uploads/5b03e12fd0cea.png', '0', '44', 'R', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2106', 'RX5', '2105', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2107', '斯柯达', '0', '/putao/Public/Uploads/5b03e4109309e.png', '0', '45', 'S', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2108', '柯迪亚克', '2107', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2109', '铃木', '0', '/putao/Public/Uploads/5be91bc5c08b2.jpg', '0', '46', 'L', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2110', '雨燕', '2109', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2111', '众泰', '0', '/putao/Public/Uploads/5be91bbc02f1a.png', '0', '47', 'Z', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2112', '大迈系列', '2111', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2113', '宝沃', '0', '/putao/Public/Uploads/5be91ba87194c.png', '0', '48', 'B', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2114', 'BX5', '2113', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2115', 'BX6', '2113', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2116', 'BX7', '2113', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2117', 'BXi7', '2113', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2118', '斯巴鲁', '0', '/putao/Public/Uploads/5be91bcfd53f2.jpg', '0', '49', 'S', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2119', '力狮', '2118', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2120', '森林人', '2118', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2121', '傲虎', '2118', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2122', 'XV', '2118', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2123', 'Z系列', '2111', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2124', 'T系列', '2111', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2125', 'E系列', '2111', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2126', 'S系列', '2111', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2127', 'M系列', '2111', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2128', '上汽大众', '0', '/putao/Public/Uploads/5b679eaee5bbb.png', '0', '5', 'S', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2129', '途观L', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2130', '宝骏530', '267', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2131', '路虎', '0', '/putao/Public/Uploads/5b6d43b7b7213.png', '0', '5', 'L', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2132', '发现神行', '2131', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2133', '揽胜极光', '2131', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2134', '朗逸', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2135', '帕萨特', '2128', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2136', '阿尔法・罗密欧', '0', '/putao/Public/Uploads/5bce7f27e0f1b.png', '0', '1', 'A', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2137', 'Giulia 2.0 200HP 精英版', '2136', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2138', 'Giulia 2.0 200HP 豪华版', '2136', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2139', 'Stelvio 2.0 200HP 精英版', '2136', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2140', 'Stelvio 2.0 200HP 豪华版', '2136', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2141', '艾瑞泽', '160', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2142', '瑞虎', '160', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2143', '探歌', '69', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2144', '探岳', '69', '', '0', '100', 'N', '0', '0');
INSERT INTO `think_sign_brands` VALUES ('2145', '英菲尼迪', '0', '/putao/Public/Uploads/5c42ee860f909.png', '0', '1', 'Y', '0', '0');

-- ----------------------------
-- Table structure for `think_sign_smslog`
-- ----------------------------
DROP TABLE IF EXISTS `think_sign_smslog`;
CREATE TABLE `think_sign_smslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '验证码类型,1-注册,2-登陆,3-找回密码,4-车展,5-团购,6-特价车,7-采购平台',
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5187 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of think_sign_smslog
-- ----------------------------
INSERT INTO `think_sign_smslog` VALUES ('2', '13118882336', '1086', '2', '1506758689');
INSERT INTO `think_sign_smslog` VALUES ('3', '18688270486', '9664', '2', '1501836019');
INSERT INTO `think_sign_smslog` VALUES ('4', '15815842834', '3616', '2', '1494406957');
INSERT INTO `think_sign_smslog` VALUES ('5', '13924880630', '9615', '2', '1539315126');
INSERT INTO `think_sign_smslog` VALUES ('6', '2222', '5110', '2', '1543919869');
INSERT INTO `think_sign_smslog` VALUES ('7', '13727439585', '8540', '2', '1524812756');
INSERT INTO `think_sign_smslog` VALUES ('8', '13928208955', '9819', '2', '1501142200');
INSERT INTO `think_sign_smslog` VALUES ('9', '18520931099', '6330', '2', '1489832964');
INSERT INTO `think_sign_smslog` VALUES ('10', '13621446837', '1519', '2', '1544946672');
INSERT INTO `think_sign_smslog` VALUES ('11', '18027699026', '8938', '1', '1489213277');
INSERT INTO `think_sign_smslog` VALUES ('12', '13751777710', '6634', '2', '1489998285');
INSERT INTO `think_sign_smslog` VALUES ('13', '13148955283', '8383', '2', '1489293282');
INSERT INTO `think_sign_smslog` VALUES ('14', '18666502263', '5275', '2', '1492052350');
INSERT INTO `think_sign_smslog` VALUES ('15', '15989062620', '2045', '2', '1503831788');
INSERT INTO `think_sign_smslog` VALUES ('16', '18819452149', '4389', '2', '1490177345');
INSERT INTO `think_sign_smslog` VALUES ('17', '18566003709', '3001', '1', '1489386069');
INSERT INTO `think_sign_smslog` VALUES ('18', '13823433755', '1626', '1', '1489386215');
INSERT INTO `think_sign_smslog` VALUES ('19', '18988681515', '7887', '2', '1544186379');
INSERT INTO `think_sign_smslog` VALUES ('20', '13047059758', '3618', '2', '1502091859');
INSERT INTO `think_sign_smslog` VALUES ('5177', '', '4059', '7', '1552295013');
INSERT INTO `think_sign_smslog` VALUES ('5185', '18680026210', '9748', '7', '1553609707');
INSERT INTO `think_sign_smslog` VALUES ('5186', '18680026210', '8749', '7', '1553998755');
