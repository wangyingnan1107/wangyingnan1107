/*
Navicat MySQL Data Transfer

Source Server         : work
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : db_lims

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2020-05-13 21:14:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `aid` varchar(255) NOT NULL,
  `aname` varchar(255) DEFAULT NULL,
  `apwd` varchar(255) DEFAULT NULL,
  `atel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1111', '管理员', '1111', '18993337191');

-- ----------------------------
-- Table structure for tb_class
-- ----------------------------
DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class` (
  `cid` varchar(255) NOT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `cyear` int(11) DEFAULT '2016',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_class
-- ----------------------------
INSERT INTO `tb_class` VALUES ('c0001', '软件一班', '2016');
INSERT INTO `tb_class` VALUES ('c0002', '物联网', '2016');
INSERT INTO `tb_class` VALUES ('c0003', 'h啊哈哈', '2016');
INSERT INTO `tb_class` VALUES ('c0004', 'k看喀喀', '2016');

-- ----------------------------
-- Table structure for tb_device
-- ----------------------------
DROP TABLE IF EXISTS `tb_device`;
CREATE TABLE `tb_device` (
  `did` varchar(255) NOT NULL,
  `dname` varchar(255) DEFAULT NULL,
  `dnum` int(11) DEFAULT NULL,
  `dfnum` int(11) DEFAULT NULL,
  `ddesc` varchar(255) DEFAULT NULL,
  `dstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_device
-- ----------------------------
INSERT INTO `tb_device` VALUES ('d-2020413-1589339598171', 'qwqww', '12', '0', 'qweqweqweqweqweq', '1');
INSERT INTO `tb_device` VALUES ('d-202047-1588821929114', 'test name', '111', '0', 'test desc', '1');
INSERT INTO `tb_device` VALUES ('d-202047-1588822010852', 'test name2', '60', '0', 'test desc2', '1');
INSERT INTO `tb_device` VALUES ('d001', '电脑', '10', '10', '戴尔电脑', '1');
INSERT INTO `tb_device` VALUES ('d002', '电脑', '22', '20', '联想电脑', '1');

-- ----------------------------
-- Table structure for tb_devuse
-- ----------------------------
DROP TABLE IF EXISTS `tb_devuse`;
CREATE TABLE `tb_devuse` (
  `duid` varchar(255) NOT NULL,
  `did` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `dustime` datetime DEFAULT NULL,
  `duetime` datetime DEFAULT NULL,
  `dunum` int(11) DEFAULT NULL,
  `dustate` int(11) DEFAULT NULL,
  PRIMARY KEY (`duid`),
  KEY `du_d` (`did`),
  CONSTRAINT `du_d` FOREIGN KEY (`did`) REFERENCES `tb_device` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_devuse
-- ----------------------------
INSERT INTO `tb_devuse` VALUES ('du0001', 'd-202047-1588821929114', '王老师', '2020-05-08 12:10:12', '2020-05-10 12:10:18', '10', '1');
INSERT INTO `tb_devuse` VALUES ('du0002', 'd-202047-1588821929114', null, '2020-05-13 12:12:57', '2020-05-20 12:13:04', '3', '1');
INSERT INTO `tb_devuse` VALUES ('du2020411-1589179813889', 'd-202047-1588821929114', '李老师', '2020-05-11 00:00:00', '2020-05-15 00:00:00', '39', '1');
INSERT INTO `tb_devuse` VALUES ('du2020411-1589179840987', 'd-202047-1588821929114', '李老师', '2020-05-11 00:00:00', '2020-05-15 00:00:00', '29', '1');
INSERT INTO `tb_devuse` VALUES ('du2020411-1589179867785', 'd-202047-1588821929114', '李老师', '2020-05-11 00:00:00', '2020-05-15 00:00:00', '39', '1');
INSERT INTO `tb_devuse` VALUES ('du2020413-1589364632457', 'd001', '', '2020-05-01 00:00:00', '2020-05-01 00:00:00', '8', '1');
INSERT INTO `tb_devuse` VALUES ('du202048-1588934862659', 'd001', '李老师', '2020-05-01 00:00:00', '2020-06-29 00:00:00', '10', '1');
INSERT INTO `tb_devuse` VALUES ('du202048-1588934949512', 'd002', '李老师', '2020-05-01 00:00:00', '2020-06-29 00:00:00', '7', '1');

-- ----------------------------
-- Table structure for tb_experiment
-- ----------------------------
DROP TABLE IF EXISTS `tb_experiment`;
CREATE TABLE `tb_experiment` (
  `eid` varchar(255) NOT NULL,
  `tid` varchar(255) NOT NULL,
  `duid` varchar(255) DEFAULT NULL,
  `luid` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `edesc` varchar(255) DEFAULT NULL,
  `entime` datetime DEFAULT NULL,
  `estime` datetime DEFAULT NULL,
  `eetime` datetime DEFAULT NULL,
  `estate` int(11) DEFAULT NULL,
  `ehelp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eid`,`tid`),
  KEY `eid` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_experiment
-- ----------------------------
INSERT INTO `tb_experiment` VALUES ('e111111', '111', null, null, '软件上机实验', '上机啊', '2020-05-09 22:33:03', '2020-05-07 16:58:52', '2020-05-08 16:58:57', '5', '/help/2020-05-11/a547bb88-d001-4746-acea-f7357a0fc7e9.pdf');
INSERT INTO `tb_experiment` VALUES ('ex2020411-1589179813889', '111', 'du2020411-1589179813889', 'lu2020411-1589179813889', '实验1', '测试实验', '2020-05-11 14:50:13', '2020-05-11 00:00:00', '2020-05-15 00:00:00', '5', '/help/2020-05-11/a547bb88-d001-4746-acea-f7357a0fc7e9.pdf');
INSERT INTO `tb_experiment` VALUES ('ex2020411-1589179840987', '111', 'du2020411-1589179840987', 'lu2020411-1589179840987', '实验2', '测试实验2', '2020-05-11 14:50:40', '2020-05-11 00:00:00', '2020-05-15 00:00:00', '5', '/help/2020-05-11/a547bb88-d001-4746-acea-f7357a0fc7e9.pdf');
INSERT INTO `tb_experiment` VALUES ('ex2020411-1589179867785', '111', 'du2020411-1589179867785', 'lu2020411-1589179867785', '实验3', '测试实验3', '2020-05-11 14:51:07', '2020-05-11 00:00:00', '2020-05-15 00:00:00', '5', '/help/2020-05-11/a547bb88-d001-4746-acea-f7357a0fc7e9.pdf');
INSERT INTO `tb_experiment` VALUES ('ex2020413-1589364632457', '', 'du2020413-1589364632457', 'lu2020413-1589364632457', '零六零', '士大夫士大夫士大夫大师傅 手动阀手动阀撒旦飞洒地方是', '2020-05-13 18:10:32', '2020-05-01 00:00:00', '2020-05-01 00:00:00', '1', null);
INSERT INTO `tb_experiment` VALUES ('ex202048-1588934362199', '111', 'du202048-1588934362199', 'lu202048-1588934362199', '测试实验', '测试描述', '2020-05-08 18:39:22', '2020-05-01 00:00:00', '2020-06-30 00:00:00', '5', '/help/2020-05-11/a547bb88-d001-4746-acea-f7357a0fc7e9.pdf');
INSERT INTO `tb_experiment` VALUES ('ex202048-1588934862659', '111', 'du202048-1588934862659', 'lu202048-1588934862659', '测试啊啊', '测试啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '2020-05-08 18:47:42', '2020-05-01 00:00:00', '2020-06-29 00:00:00', '5', '/help/2020-05-11/a547bb88-d001-4746-acea-f7357a0fc7e9.pdf');
INSERT INTO `tb_experiment` VALUES ('ex202048-1588934949512', '222', 'du202048-1588934949512', 'lu202048-1588934949512', '测试啊啊', '测试啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '2020-05-08 18:49:09', '2020-05-01 00:00:00', '2020-06-29 00:00:00', '3', '/help/2020-05-11/a547bb88-d001-4746-acea-f7357a0fc7e9.pdf');

-- ----------------------------
-- Table structure for tb_lab
-- ----------------------------
DROP TABLE IF EXISTS `tb_lab`;
CREATE TABLE `tb_lab` (
  `lid` varchar(255) NOT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `ldesc` varchar(255) DEFAULT NULL,
  `lstate` int(11) DEFAULT NULL,
  `lphoto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_lab
-- ----------------------------
INSERT INTO `tb_lab` VALUES ('l001', '计算机教室1', '计算机教室哦', '1', '/images/2020-05-06/e9c0fe26-0fca-4d7b-9428-df24abba9712.jpg');
INSERT INTO `tb_lab` VALUES ('l002', '计算机教室2', '计算机教室', '1', '/images/2020-05-06/e9c0fe26-0fca-4d7b-9428-df24abba9712.jpg');
INSERT INTO `tb_lab` VALUES ('l003', '计算机教室3', '计算机教室', '0', '/images/2020-05-06/ee89a0b9-5291-4628-8d9b-6e844478dda6.jpg');
INSERT INTO `tb_lab` VALUES ('l004', '生物实验室1', 'test', '1', '/images/2020-05-06/e9c0fe26-0fca-4d7b-9428-df24abba9712.jpg');
INSERT INTO `tb_lab` VALUES ('l005', '生物实验室2', 'test', '0', '/images/2020-05-06/e9c0fe26-0fca-4d7b-9428-df24abba9712.jpg');
INSERT INTO `tb_lab` VALUES ('l006', 'test', 'test desc', '1', '/images/2020-05-06/e9c0fe26-0fca-4d7b-9428-df24abba9712.jpg');
INSERT INTO `tb_lab` VALUES ('l007', 'test', 'test desc', '1', '/images/2020-05-06/e9c0fe26-0fca-4d7b-9428-df24abba9712.jpg');
INSERT INTO `tb_lab` VALUES ('生物实验室1', '生物实验室1', 'test', '2', '/images/2020-05-06/e9c0fe26-0fca-4d7b-9428-df24abba9712.jpg');

-- ----------------------------
-- Table structure for tb_labuse
-- ----------------------------
DROP TABLE IF EXISTS `tb_labuse`;
CREATE TABLE `tb_labuse` (
  `luid` varchar(255) NOT NULL,
  `lid` varchar(255) NOT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `lustime` datetime DEFAULT NULL,
  `luetime` datetime DEFAULT NULL,
  `lustate` int(11) DEFAULT NULL,
  PRIMARY KEY (`luid`,`lid`),
  KEY `lu_l` (`lid`),
  CONSTRAINT `lu_l` FOREIGN KEY (`lid`) REFERENCES `tb_lab` (`lid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_labuse
-- ----------------------------
INSERT INTO `tb_labuse` VALUES ('lu00000', 'l001', '王老师', '2020-05-07 17:04:21', '2020-05-07 18:04:28', null);
INSERT INTO `tb_labuse` VALUES ('lu11111', 'l002', null, '2020-05-07 17:05:41', '2020-05-08 17:05:47', null);
INSERT INTO `tb_labuse` VALUES ('lu2020411-1589179813889', 'l001', '李老师', '2020-05-11 00:00:00', '2020-05-15 00:00:00', '1');
INSERT INTO `tb_labuse` VALUES ('lu2020411-1589179840987', 'l002', '李老师', '2020-05-11 00:00:00', '2020-05-15 00:00:00', '1');
INSERT INTO `tb_labuse` VALUES ('lu2020411-1589179867785', 'l007', '李老师', '2020-05-11 00:00:00', '2020-05-15 00:00:00', '1');
INSERT INTO `tb_labuse` VALUES ('lu2020413-1589364632457', 'l001', '', '2020-05-01 00:00:00', '2020-05-01 00:00:00', '1');
INSERT INTO `tb_labuse` VALUES ('lu202048-1588934362199', 'l004', '李老师', '2020-05-01 00:00:00', '2020-06-30 00:00:00', '1');
INSERT INTO `tb_labuse` VALUES ('lu202048-1588934862659', 'l006', '李老师', '2020-05-01 00:00:00', '2020-06-29 00:00:00', '1');
INSERT INTO `tb_labuse` VALUES ('lu202048-1588934949512', 'l006', '李老师', '2020-05-01 00:00:00', '2020-06-29 00:00:00', '1');

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message` (
  `mid` varchar(255) NOT NULL,
  `eid` varchar(255) DEFAULT NULL,
  `uphoto` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `mtime` datetime DEFAULT NULL,
  `mbody` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_message
-- ----------------------------
INSERT INTO `tb_message` VALUES ('m001', 'e111111', 'asdf', 'asdf', '2020-05-11 22:59:06', 'adsfas');
INSERT INTO `tb_message` VALUES ('m002', 'e111111', null, null, null, null);
INSERT INTO `tb_message` VALUES ('me2020412-1589220548576', 'ex2020411-1589179867785', '', '', '2020-05-12 02:09:08', '哈哈');
INSERT INTO `tb_message` VALUES ('me2020412-1589222273952', 'e111111', '/images/2020-04-29/4ad5530c-bf62-43db-9a64-2472e2b6e23b.jpg', '朱海熊', '2020-05-12 02:37:53', 'hahahahha');
INSERT INTO `tb_message` VALUES ('me2020412-1589222642780', 'e111111', '/images/2020-04-29/4ad5530c-bf62-43db-9a64-2472e2b6e23b.jpg', '朱海熊', '2020-05-12 02:44:02', 'dsfdffdsfsdf');
INSERT INTO `tb_message` VALUES ('me2020412-1589222753318', 'e111111', '/images/2020-04-29/4ad5530c-bf62-43db-9a64-2472e2b6e23b.jpg', '朱海熊', '2020-05-12 02:45:53', 'haokan&nbsp;');
INSERT INTO `tb_message` VALUES ('me2020412-1589222866839', 'e111111', '/images/2020-04-29/4ad5530c-bf62-43db-9a64-2472e2b6e23b.jpg', '朱海熊', '2020-05-12 02:47:46', 'bjhhjhjh');
INSERT INTO `tb_message` VALUES ('me2020412-1589223106476', 'e111111', '/images/2020-04-29/4ad5530c-bf62-43db-9a64-2472e2b6e23b.jpg', '朱海熊', '2020-05-12 02:51:46', '<img src=\"http://localhost:8080/LIMS_SSM/resources/lib/layui-v2.5.5/images/face/43.gif\" alt=\"[黑线]\">h好矮好好');
INSERT INTO `tb_message` VALUES ('me2020412-1589223229386', 'ex2020411-1589179813889', '/images/2020-04-29/4ad5530c-bf62-43db-9a64-2472e2b6e23b.jpg', '朱海熊', '2020-05-12 02:53:49', '<p>这个实验好啊</p><p><img src=\"http://localhost:8080/LIMS_SSM/resources/lib/layui-v2.5.5/images/face/39.gif\" alt=\"[鼓掌]\"></p>');
INSERT INTO `tb_message` VALUES ('me2020412-1589223246157', 'ex2020411-1589179813889', '/images/2020-04-29/4ad5530c-bf62-43db-9a64-2472e2b6e23b.jpg', '朱海熊', '2020-05-12 02:54:06', '<p style=\"text-align: center;\">你好</p><p style=\"text-align: left;\"><img src=\"http://localhost:8080/LIMS_SSM/resources/lib/layui-v2.5.5/images/face/62.gif\" alt=\"[浮云]\"><br></p>');
INSERT INTO `tb_message` VALUES ('me2020412-1589223296512', 'ex2020411-1589179813889', '/images/2020-04-29/4ad5530c-bf62-43db-9a64-2472e2b6e23b.jpg', '朱海熊', '2020-05-12 02:54:56', '哈哈哈哈哈哈');
INSERT INTO `tb_message` VALUES ('me2020412-1589223306655', 'ex2020411-1589179813889', '/images/2020-04-29/4ad5530c-bf62-43db-9a64-2472e2b6e23b.jpg', '朱海熊', '2020-05-12 02:55:06', '<img src=\"http://localhost:8080/LIMS_SSM/resources/lib/layui-v2.5.5/images/face/50.gif\" alt=\"[熊猫]\">美女美女');
INSERT INTO `tb_message` VALUES ('me2020412-1589268117949', 'e111111', '/images/2020-04-29/4ad5530c-bf62-43db-9a64-2472e2b6e23b.jpg', '朱海熊', '2020-05-12 15:21:57', '<p>实验太难了</p><p><img src=\"http://localhost:8080/LIMS_SSM/resources/lib/layui-v2.5.5/images/face/58.gif\" alt=\"[弱]\"><br></p>');
INSERT INTO `tb_message` VALUES ('me2020412-1589269196017', 'e111111', '/images/2020-04-29/4ad5530c-bf62-43db-9a64-2472e2b6e23b.jpg', '朱海熊', '2020-05-12 15:39:56', 'gfdgdfg');
INSERT INTO `tb_message` VALUES ('me2020412-1589271899236', 'e111111', '', '', '2020-05-12 16:24:59', 'cxvxc');
INSERT INTO `tb_message` VALUES ('me2020412-1589278341977', 'ex2020411-1589179813889', '', '', '2020-05-12 18:12:21', 'sdfdsf');
INSERT INTO `tb_message` VALUES ('me2020412-1589281530838', 'ex2020411-1589179813889', '', '', '2020-05-12 19:05:30', '啊实打实');

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice` (
  `nid` varchar(255) NOT NULL,
  `ntit` varchar(255) DEFAULT NULL,
  `nbody` varchar(255) DEFAULT NULL,
  `ntime` datetime DEFAULT NULL,
  `nstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES ('no-202045-1588650371656', '测试通知', '放假啦', '2020-05-06 15:37:14', '1');
INSERT INTO `tb_notice` VALUES ('no-202045-1588670377891', '啊啊啊啊啊啊', '啵啵啵宝宝', '2020-05-05 17:50:43', '1');

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
  `sno` varchar(255) NOT NULL COMMENT '学号',
  `spwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `cid` varchar(255) DEFAULT NULL COMMENT '班级编号',
  `sname` varchar(255) DEFAULT NULL COMMENT '姓名',
  `stel` varchar(255) DEFAULT NULL COMMENT '电话',
  `ssex` varchar(255) DEFAULT NULL COMMENT '性别',
  `sphoto` varchar(255) DEFAULT NULL COMMENT '学生照片地址',
  PRIMARY KEY (`sno`),
  KEY `s_c` (`cid`),
  CONSTRAINT `s_c` FOREIGN KEY (`cid`) REFERENCES `tb_class` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES ('11', '11', 'c0001', '李俊杰', '11111111111', '男', '/images/2020-05-12/da9d5280-48d1-4821-8fbb-0b27b9b7336d.jpeg');
INSERT INTO `tb_student` VALUES ('1616270112', '1616270112', 'c0001', '张帅帅', '17361563977', '男', '甘肃静宁');
INSERT INTO `tb_student` VALUES ('1616270113', '1616270113', 'c0001', '贾旺军', '17693169695', '男', '甘肃定西');
INSERT INTO `tb_student` VALUES ('1616270114', '1616270114', 'c0001', '李子哲', '18809494121', '男', '甘肃金昌');
INSERT INTO `tb_student` VALUES ('1616270115', '1616270115', 'c0001', '李增强', '18894001963', '男', '甘肃通渭');
INSERT INTO `tb_student` VALUES ('1616270116', '1616270116', 'c0001', '窦长兴', '18894001883', '男', '甘肃通渭');
INSERT INTO `tb_student` VALUES ('1616270117', '1616270117', 'c0001', '陈学凯', '17361564011', '男', '甘肃张掖');
INSERT INTO `tb_student` VALUES ('1616270119', '1616270119', 'c0001', '陈振鑫', '13369347988', '男', '甘肃庆阳');
INSERT INTO `tb_student` VALUES ('1616270120', '1616270120', 'c0001', '刘成发', '15769396375', '男', '甘肃武威');
INSERT INTO `tb_student` VALUES ('1616270121', '1616270121', 'c0001', '廖辘', '17361564028', '男', '甘肃陇南');
INSERT INTO `tb_student` VALUES ('1616270122', '1616270122', 'c0001', '陈玉杰', '17361564033', '男', '甘肃张掖');
INSERT INTO `tb_student` VALUES ('1616270123', '1616270123', 'c0001', '马良', '17361564038', '男', '甘肃张掖');
INSERT INTO `tb_student` VALUES ('1616270124', '1616270124', 'c0001', '詹富德', '17361564048', '男', '甘肃张掖');
INSERT INTO `tb_student` VALUES ('1616270125', '1616270125', 'c0001', '张世凯', '18419161771', '男', '甘肃张掖');
INSERT INTO `tb_student` VALUES ('1616270126', '1616270126', 'c0001', '张玉林', '15773954542', '男', '湖南邵阳');
INSERT INTO `tb_student` VALUES ('1616270127', '1616270127', 'c0001', '曾羿铭', '17361564066', '男', '湖南株洲');
INSERT INTO `tb_student` VALUES ('1616270128', '1616270128', 'c0001', '张宇翀', '17693462069', '男', '湖北黄冈');
INSERT INTO `tb_student` VALUES ('1616270130', '1616270130', 'c0001', '温在鑫', '17361564078', '男', '浙江温州');
INSERT INTO `tb_student` VALUES ('1616270131', '1616270131', 'c0001', '丁晶晶', '17361560405', '男', '浙江宁波');
INSERT INTO `tb_student` VALUES ('1616270132', '1616270132', 'c0001', '王珠峰', '17361564098', '男', '河南许昌');
INSERT INTO `tb_student` VALUES ('1616270134', '1616270134', 'c0001', '董帅帅', '18595420506', '男', '河南驻马店');
INSERT INTO `tb_student` VALUES ('1616270135', '1616270135', 'c0001', '吴秀来', '17693257089', '男', '河北承德');
INSERT INTO `tb_student` VALUES ('1616270137', '1616270137', 'c0001', '王云飞', '18215117867', '男', '河北沧州');
INSERT INTO `tb_student` VALUES ('1616270139', '1616270139', 'c0001', '周宇轩', '17693192489', '男', '江苏南京');
INSERT INTO `tb_student` VALUES ('1616270140', '1616270140', 'c0001', '林启明', '17361564133', '男', '广州');
INSERT INTO `tb_student` VALUES ('1616270141', '1616270141', 'c0001', '张沃民', '13717471498', '男', '广州东莞');
INSERT INTO `tb_student` VALUES ('1616270142', '1616270142', 'c0001', '贾兴虎', '18295722636', '男', '山西万荣');
INSERT INTO `tb_student` VALUES ('1616270143', '1616270143', 'c0001', '任恩亮', '17693437145', '男', '山西孝义');
INSERT INTO `tb_student` VALUES ('1616270144', '1616270144', 'c0001', '徐泽松', '18419160081', '男', '山东聊城');
INSERT INTO `tb_student` VALUES ('1616270146', '1616270146', 'c0001', '杨金权', '15760632076', '男', '四川邻水');
INSERT INTO `tb_student` VALUES ('1616270147', '1616270147', 'c0001', '吴剑峰', '18782837159', '男', '四川达州');
INSERT INTO `tb_student` VALUES ('1616270148', '1616270148', 'c0001', '彭宏', '17729855856', '男', '四川宜宾');
INSERT INTO `tb_student` VALUES ('1616270149', '1616270149', 'c0001', '李宇晨', '15294145208', '男', '吉林梅河口');
INSERT INTO `tb_student` VALUES ('1616270150', '1616270150', 'c0001', '王禹臻', '17693251015', '男', '吉林');
INSERT INTO `tb_student` VALUES ('1616270151', '1616270151', 'c0001', '王雪梅', '17361564199', '女', '甘肃武威');
INSERT INTO `tb_student` VALUES ('1616270152', '1616270152', 'c0001', '蔡文婷', '17739897233', '女', '甘肃榆中');
INSERT INTO `tb_student` VALUES ('1616270153', '1616270153', 'c0001', '刘依琳', '17361564208', '女', '甘肃陇南');
INSERT INTO `tb_student` VALUES ('1616270154', '1616270154', 'c0001', '李嘉新', '18894002949', '女', '甘肃渭源');
INSERT INTO `tb_student` VALUES ('1616270155', '1616270155', 'c0001', '薛媛', '17361564211', '女', '甘肃酒泉');
INSERT INTO `tb_student` VALUES ('1616270156', '1616270156', 'c0001', '杨婷玉', '17361564218', '女', '甘肃兰州');
INSERT INTO `tb_student` VALUES ('1616270157', '1616270157', 'c0001', '丁雪纯', '13659413857', '女', '河南周口');
INSERT INTO `tb_student` VALUES ('1616270158', '1616270158', 'c0001', '张佳敏', '18234724623', '女', '山西临汾');
INSERT INTO `tb_student` VALUES ('1616270159', '1616270159', 'c0001', '刘思盈', '17361564234', '女', '山东滨州');
INSERT INTO `tb_student` VALUES ('1616270160', '1616270160', 'c0001', '孙梦媛', '17693474044', '女', '吉林蛟河');
INSERT INTO `tb_student` VALUES ('22', '22', 'c0001', '朱海熊', '17361563968', '女', '/images/2020-04-29/4ad5530c-bf62-43db-9a64-2472e2b6e23b.jpg');
INSERT INTO `tb_student` VALUES ('qqqq', 'aaaa', 'c0001', 'aaa', 'aaa', 'aaa', 'aaa');

-- ----------------------------
-- Table structure for tb_s_e
-- ----------------------------
DROP TABLE IF EXISTS `tb_s_e`;
CREATE TABLE `tb_s_e` (
  `seid` varchar(255) NOT NULL,
  `sno` varchar(255) DEFAULT NULL,
  `eid` varchar(255) DEFAULT NULL,
  `sereport` varchar(255) DEFAULT NULL,
  `scores` int(11) DEFAULT '-1',
  PRIMARY KEY (`seid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_s_e
-- ----------------------------
INSERT INTO `tb_s_e` VALUES ('dsfsdfsfsf', '22', 'asdasdada', null, '-1');
INSERT INTO `tb_s_e` VALUES ('se2020412-1589279164236', '22', 'e111111', null, '1000111');
INSERT INTO `tb_s_e` VALUES ('se2020412-1589279253629', '22', 'ex2020411-1589179813889', '/report/2020-05-12/d2111b7c-a5b4-45fb-bd32-2e24eaad6b4a.doc', '999');
INSERT INTO `tb_s_e` VALUES ('se2020412-1589279266180', '22', 'ex2020411-1589179867785', null, '-1');
INSERT INTO `tb_s_e` VALUES ('se2020412-1589279269564', '22', 'ex2020411-1589179840987', '/report/2020-05-12/ea6ff6f5-ff20-444f-a269-7616acdbead7.doc', '1');
INSERT INTO `tb_s_e` VALUES ('se2020412-1589279273788', '11', 'e111111', '/report/2020-05-12/d897d4c7-e376-4018-8aa7-ba6007d07029.docx', '10011');
INSERT INTO `tb_s_e` VALUES ('se2020412-1589279280213', '22', 'ex202048-1588934949512', null, '-1');

-- ----------------------------
-- Table structure for tb_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher` (
  `tid` varchar(255) NOT NULL,
  `tpwd` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `ttel` varchar(255) DEFAULT NULL,
  `tdesc` varchar(255) DEFAULT NULL,
  `tphoto` varchar(255) DEFAULT NULL,
  `tstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_teacher
-- ----------------------------
INSERT INTO `tb_teacher` VALUES ('111', '111', '李老师', '11111111111', '教授', '/images/2020-05-07/3a58163f-7200-43b9-9a3b-980c3642791b.jpeg', '1');
INSERT INTO `tb_teacher` VALUES ('222', '222', '王老师', '1111', '1111', '/images/2020-05-06/cc123d76-200a-43fc-9bb5-7ae8a3650ed5.jpeg', '0');
INSERT INTO `tb_teacher` VALUES ('333', '333', '张老师', '111111111111', null, '/images/2020-05-06/cc123d76-200a-43fc-9bb5-7ae8a3650ed5.jpeg', '1');
INSERT INTO `tb_teacher` VALUES ('4444', '4444', '王老师2', '111', '1111', '/images/2020-05-06/cc123d76-200a-43fc-9bb5-7ae8a3650ed5.jpeg', '1');
INSERT INTO `tb_teacher` VALUES ('爱的色放十大', '爱的色放十大', '啊士大夫a', '12321312321', '爱的色放撒地方阿斯顿发射点', '/images/2020-05-07/0bd638b0-9bf1-4416-8ade-156ab654cd9f.jpg', '1');
