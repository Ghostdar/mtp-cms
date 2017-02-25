-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-02-24 10:09:55
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mtp-cms`
--

-- --------------------------------------------------------

--
-- 表的结构 `tp_article`
--

CREATE TABLE IF NOT EXISTS `tp_article` (
  `art_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章用户ID',
  `web_id` int(10) unsigned DEFAULT NULL COMMENT '网站ID',
  `art_title` varchar(100) NOT NULL COMMENT '文章标题',
  `cate_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '文章所属栏目ID',
  `art_content` text NOT NULL COMMENT '文章内容',
  `art_tags` varchar(50) NOT NULL COMMENT '文章标签',
  `art_url` varchar(100) NOT NULL COMMENT '自定义URL',
  `art_intro` varchar(200) NOT NULL COMMENT '文章摘要',
  `art_views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `art_order` int(10) unsigned DEFAULT '0' COMMENT '排序字段',
  `art_ispay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `art_istop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `art_isbest` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `art_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文章状态',
  `art_ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `art_utime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `art_src` varchar(200) DEFAULT NULL COMMENT '文章图片',
  `art_template` varchar(20) DEFAULT NULL COMMENT '文章模板名称 优先级高于栏目模板',
  PRIMARY KEY (`art_id`),
  KEY `web_id` (`web_id`,`cate_id`) USING BTREE,
  KEY `art_url` (`art_url`,`web_id`) USING BTREE,
  KEY `art_order` (`web_id`,`art_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文章资讯表' AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_category`
--

CREATE TABLE IF NOT EXISTS `tp_category` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `user_id` int(10) unsigned DEFAULT '0' COMMENT '用户UID',
  `cate_mod` enum('link','article','info') NOT NULL DEFAULT 'article' COMMENT '栏目类型',
  `cate_name` varchar(50) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `root_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目上级ID',
  `web_id` int(10) unsigned DEFAULT NULL COMMENT '网站ID',
  `cate_url` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目自定义url',
  `cate_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目排序',
  `cate_keywords` varchar(100) NOT NULL COMMENT '栏目关键词',
  `cate_description` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目描述',
  `cate_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `cate_ctime` int(10) unsigned DEFAULT NULL COMMENT '栏目添加时间',
  `cate_template` varchar(20) DEFAULT NULL COMMENT '栏目模板',
  PRIMARY KEY (`cate_id`),
  KEY `root_id` (`root_id`,`web_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文章分类栏目' AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_file`
--

CREATE TABLE IF NOT EXISTS `tp_file` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `f_type` varchar(10) DEFAULT NULL COMMENT '文件类型',
  `f_version` varchar(50) DEFAULT NULL COMMENT '文件版本',
  `f_savepath` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `f_name` varchar(100) DEFAULT NULL COMMENT '文件原始名称',
  `f_savename` varchar(50) DEFAULT NULL COMMENT '文件保存名称',
  `f_size` double DEFAULT '0' COMMENT '文件大小B单位',
  `f_mime` char(30) DEFAULT NULL COMMENT '上传文件的MIME类型 ',
  `f_extension` char(10) DEFAULT NULL COMMENT '上传文件的后缀类型',
  `f_hash` char(40) DEFAULT NULL COMMENT '文件哈希值',
  `f_down` int(11) DEFAULT '0' COMMENT '下载次数',
  `f_time` datetime DEFAULT NULL COMMENT '文件添加时间',
  `u_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `web_id` int(10) unsigned DEFAULT '0' COMMENT '站点ID',
  PRIMARY KEY (`f_id`),
  KEY `u_id` (`u_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文件上传记录' AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_link`
--

CREATE TABLE IF NOT EXISTS `tp_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_title` varchar(200) DEFAULT NULL,
  `cate_id` int(10) unsigned DEFAULT '0',
  `link_desc` varchar(500) DEFAULT NULL,
  `link_url` varchar(100) DEFAULT NULL,
  `link_src` varchar(200) DEFAULT NULL,
  `link_ctime` int(10) unsigned DEFAULT NULL,
  `link_status` tinyint(4) DEFAULT '0',
  `link_order` int(11) unsigned DEFAULT NULL,
  `web_id` int(10) unsigned DEFAULT '0',
  `user_id` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`link_id`),
  KEY `cate_id` (`cate_id`,`web_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='链接、下载' AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_member`
--

CREATE TABLE IF NOT EXISTS `tp_member` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_username` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `m_psw` varchar(300) DEFAULT NULL,
  `m_name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `m_gender` varchar(10) DEFAULT NULL COMMENT '性别 先生 小姐 女士',
  `m_comapny` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `m_department` varchar(20) DEFAULT NULL COMMENT '部门',
  `m_title` varchar(20) DEFAULT NULL COMMENT '职务',
  `m_address` varchar(100) DEFAULT NULL COMMENT '公司地址',
  `m_zipcode` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `m_phone` varchar(15) DEFAULT NULL COMMENT '电话',
  `m_fax` varchar(15) DEFAULT NULL COMMENT '传真',
  `m_mobile` varchar(15) DEFAULT NULL COMMENT '手机',
  `m_card` varchar(30) DEFAULT NULL COMMENT '身份证号码',
  `m_icon` varchar(150) DEFAULT NULL COMMENT '用户头像',
  `m_countrie` varchar(50) DEFAULT NULL COMMENT '国家',
  `m_area` varchar(10) DEFAULT NULL,
  `m_province` varchar(50) DEFAULT NULL COMMENT '省份',
  `m_city` varchar(30) DEFAULT NULL COMMENT '城市',
  `m_state` varchar(10) DEFAULT '正常' COMMENT '用户状态',
  `m_addtime` datetime DEFAULT NULL COMMENT '注册时间',
  `m_from` varchar(100) DEFAULT NULL COMMENT '用户来源',
  `m_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `m_lastlogin` datetime DEFAULT NULL COMMENT '最后登录时间',
  `m_sendmailtime` datetime DEFAULT NULL COMMENT '发送邮件时间',
  `m_level` varchar(10) DEFAULT NULL COMMENT '用户身份admin/visitors/exhibitors',
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `m_email` (`m_username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户信息表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `tp_member`
--

INSERT INTO `tp_member` (`m_id`, `m_username`, `m_psw`, `m_name`, `m_gender`, `m_comapny`, `m_department`, `m_title`, `m_address`, `m_zipcode`, `m_phone`, `m_fax`, `m_mobile`, `m_card`, `m_icon`, `m_countrie`, `m_area`, `m_province`, `m_city`, `m_state`, `m_addtime`, `m_from`, `m_remark`, `m_lastlogin`, `m_sendmailtime`, `m_level`) VALUES
(3, 'admin', '12345', '华', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tp_option`
--

CREATE TABLE IF NOT EXISTS `tp_option` (
  `o_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `o_title` varchar(50) DEFAULT NULL,
  `o_name` varchar(50) NOT NULL,
  `o_value` varchar(1000) NOT NULL,
  `o_order` int(11) DEFAULT NULL,
  `o_type` tinyint(3) unsigned DEFAULT '0',
  `o_tips` varchar(100) DEFAULT NULL,
  `field_type` varchar(50) DEFAULT NULL COMMENT '字段类型',
  `field_value` varchar(100) DEFAULT NULL COMMENT '类型值',
  `o_status` tinyint(3) unsigned DEFAULT '0',
  `user_id` int(10) unsigned DEFAULT '0',
  `web_id` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`o_id`),
  KEY `group` (`o_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='属性-值，配置项' AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_websites`
--

CREATE TABLE IF NOT EXISTS `tp_websites` (
  `web_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '站点ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `cate_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `web_name` varchar(100) NOT NULL DEFAULT '' COMMENT '网站名称',
  `web_url` varchar(255) NOT NULL DEFAULT '' COMMENT '网址',
  `web_tags` varchar(100) NOT NULL COMMENT '关键词',
  `web_intro` varchar(300) NOT NULL COMMENT '网站描述',
  `web_pic` varchar(100) NOT NULL COMMENT '网站缩略图',
  `web_ispay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `web_istop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `web_isbest` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `web_islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `web_status` tinyint(1) NOT NULL DEFAULT '0',
  `web_ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `web_appkey` varchar(21) DEFAULT NULL COMMENT 'appkey 根据uid和web_id补齐前缀生成',
  `web_appsecret` varchar(32) DEFAULT NULL COMMENT '随机生成的32位字符串',
  `web_encodingaeskey` varchar(32) DEFAULT NULL COMMENT '随机生成的32位字符串',
  `web_isdefault` tinyint(4) DEFAULT '0' COMMENT '是否是默认站点',
  `web_defaulttime` int(10) unsigned DEFAULT '0' COMMENT '设置为默认站点的时间',
  PRIMARY KEY (`web_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='站点信息' AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_ybqh`
--

CREATE TABLE IF NOT EXISTS `tp_ybqh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charCity` varchar(255) DEFAULT NULL,
  `charCityen` varchar(255) DEFAULT NULL,
  `charShortCity` varchar(255) DEFAULT NULL,
  `charProvince` varchar(255) DEFAULT NULL,
  `charProvinceen` varchar(255) DEFAULT NULL,
  `charShortProvince` varchar(255) DEFAULT NULL,
  `charPostCode` varchar(255) DEFAULT NULL,
  `charPhoneCode` varchar(255) DEFAULT NULL,
  `charArea` varchar(255) DEFAULT NULL,
  `charAreaen` varchar(255) DEFAULT NULL,
  `intExhibitionid` varchar(255) DEFAULT NULL,
  `intActorid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2518 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
