/*
 Navicat Premium Data Transfer

 Source Server         : cloud_desktop1
 Source Server Type    : MySQL
 Source Server Version : 50568
 Source Host           : 192.168.1.168:3306
 Source Schema         : envs_test

 Target Server Type    : MySQL
 Target Server Version : 50568
 File Encoding         : 65001

 Date: 13/08/2024 15:03:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (9, 'Can add content type', 3, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (10, 'Can change content type', 3, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can delete content type', 3, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can view content type', 3, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 4, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 4, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 4, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can view session', 4, 'view_session');
INSERT INTO `auth_permission` VALUES (17, 'Can add user', 5, 'add_user');
INSERT INTO `auth_permission` VALUES (18, 'Can change user', 5, 'change_user');
INSERT INTO `auth_permission` VALUES (19, 'Can delete user', 5, 'delete_user');
INSERT INTO `auth_permission` VALUES (20, 'Can view user', 5, 'view_user');
INSERT INTO `auth_permission` VALUES (21, 'Can add vm information', 6, 'add_vminformation');
INSERT INTO `auth_permission` VALUES (22, 'Can change vm information', 6, 'change_vminformation');
INSERT INTO `auth_permission` VALUES (23, 'Can delete vm information', 6, 'delete_vminformation');
INSERT INTO `auth_permission` VALUES (24, 'Can view vm information', 6, 'view_vminformation');
INSERT INTO `auth_permission` VALUES (25, 'Can add security group', 7, 'add_securitygroup');
INSERT INTO `auth_permission` VALUES (26, 'Can change security group', 7, 'change_securitygroup');
INSERT INTO `auth_permission` VALUES (27, 'Can delete security group', 7, 'delete_securitygroup');
INSERT INTO `auth_permission` VALUES (28, 'Can view security group', 7, 'view_securitygroup');
INSERT INTO `auth_permission` VALUES (29, 'Can add snap shoot', 8, 'add_snapshoot');
INSERT INTO `auth_permission` VALUES (30, 'Can change snap shoot', 8, 'change_snapshoot');
INSERT INTO `auth_permission` VALUES (31, 'Can delete snap shoot', 8, 'delete_snapshoot');
INSERT INTO `auth_permission` VALUES (32, 'Can view snap shoot', 8, 'view_snapshoot');
INSERT INTO `auth_permission` VALUES (33, 'Can add cloud volume', 9, 'add_cloudvolume');
INSERT INTO `auth_permission` VALUES (34, 'Can change cloud volume', 9, 'change_cloudvolume');
INSERT INTO `auth_permission` VALUES (35, 'Can delete cloud volume', 9, 'delete_cloudvolume');
INSERT INTO `auth_permission` VALUES (36, 'Can view cloud volume', 9, 'view_cloudvolume');
INSERT INTO `auth_permission` VALUES (37, 'Can add hosts', 10, 'add_hosts');
INSERT INTO `auth_permission` VALUES (38, 'Can change hosts', 10, 'change_hosts');
INSERT INTO `auth_permission` VALUES (39, 'Can delete hosts', 10, 'delete_hosts');
INSERT INTO `auth_permission` VALUES (40, 'Can view hosts', 10, 'view_hosts');
INSERT INTO `auth_permission` VALUES (41, 'Can add citem', 11, 'add_citem');
INSERT INTO `auth_permission` VALUES (42, 'Can change citem', 11, 'change_citem');
INSERT INTO `auth_permission` VALUES (43, 'Can delete citem', 11, 'delete_citem');
INSERT INTO `auth_permission` VALUES (44, 'Can view citem', 11, 'view_citem');
INSERT INTO `auth_permission` VALUES (45, 'Can add trigger', 12, 'add_trigger');
INSERT INTO `auth_permission` VALUES (46, 'Can change trigger', 12, 'change_trigger');
INSERT INTO `auth_permission` VALUES (47, 'Can delete trigger', 12, 'delete_trigger');
INSERT INTO `auth_permission` VALUES (48, 'Can view trigger', 12, 'view_trigger');
INSERT INTO `auth_permission` VALUES (49, 'Can add 服务器密码管理', 13, 'add_hostpassman');
INSERT INTO `auth_permission` VALUES (50, 'Can change 服务器密码管理', 13, 'change_hostpassman');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 服务器密码管理', 13, 'delete_hostpassman');
INSERT INTO `auth_permission` VALUES (52, 'Can view 服务器密码管理', 13, 'view_hostpassman');
INSERT INTO `auth_permission` VALUES (53, 'Can add scripts', 14, 'add_scripts');
INSERT INTO `auth_permission` VALUES (54, 'Can change scripts', 14, 'change_scripts');
INSERT INTO `auth_permission` VALUES (55, 'Can delete scripts', 14, 'delete_scripts');
INSERT INTO `auth_permission` VALUES (56, 'Can view scripts', 14, 'view_scripts');
INSERT INTO `auth_permission` VALUES (57, 'Can add playbooks', 15, 'add_playbooks');
INSERT INTO `auth_permission` VALUES (58, 'Can change playbooks', 15, 'change_playbooks');
INSERT INTO `auth_permission` VALUES (59, 'Can delete playbooks', 15, 'delete_playbooks');
INSERT INTO `auth_permission` VALUES (60, 'Can view playbooks', 15, 'view_playbooks');
INSERT INTO `auth_permission` VALUES (61, 'Can add 用户登录信息表', 16, 'add_connectioninfo');
INSERT INTO `auth_permission` VALUES (62, 'Can change 用户登录信息表', 16, 'change_connectioninfo');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 用户登录信息表', 16, 'delete_connectioninfo');
INSERT INTO `auth_permission` VALUES (64, 'Can view 用户登录信息表', 16, 'view_connectioninfo');

-- ----------------------------
-- Table structure for cloud_volume_cloudvolume
-- ----------------------------
DROP TABLE IF EXISTS `cloud_volume_cloudvolume`;
CREATE TABLE `cloud_volume_cloudvolume`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cloud_volume_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VM_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VM_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cloud_volume_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cloud_volume_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cloud_volume_size` int(11) NULL DEFAULT NULL,
  `cloud_volume_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of cloud_volume_cloudvolume
-- ----------------------------
INSERT INTO `cloud_volume_cloudvolume` VALUES (1, 'cc73283d-ce89-4d85-9781-d20b1c60b504', 'd24aea28-4525-4dea-abb8-69ef2d36068b', 'test10191', 'test1020', 'lvm', 1, 'in-use');

-- ----------------------------
-- Table structure for connectioninfo
-- ----------------------------
DROP TABLE IF EXISTS `connectioninfo`;
CREATE TABLE `connectioninfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ssh_username` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ssh_userpasswd` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ssh_hostip` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ssh_host_port` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ssh_rsa` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rsa_pass` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ssh_status` int(11) NOT NULL,
  `ssh_type` int(11) NOT NULL,
  `sn_key` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of connectioninfo
-- ----------------------------
INSERT INTO `connectioninfo` VALUES (1, 'root', '111111', '192.168.1.106', '22', '', '', 0, 0, 'b827eb97580d');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (9, 'cloud_volume', 'cloudvolume');
INSERT INTO `django_content_type` VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (13, 'hosts', 'hostpassman');
INSERT INTO `django_content_type` VALUES (10, 'hosts', 'hosts');
INSERT INTO `django_content_type` VALUES (16, 'scripts', 'connectioninfo');
INSERT INTO `django_content_type` VALUES (15, 'scripts', 'playbooks');
INSERT INTO `django_content_type` VALUES (14, 'scripts', 'scripts');
INSERT INTO `django_content_type` VALUES (7, 'security_group', 'securitygroup');
INSERT INTO `django_content_type` VALUES (4, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'snapshoot', 'snapshoot');
INSERT INTO `django_content_type` VALUES (11, 'trigger', 'citem');
INSERT INTO `django_content_type` VALUES (12, 'trigger', 'trigger');
INSERT INTO `django_content_type` VALUES (5, 'users', 'user');
INSERT INTO `django_content_type` VALUES (6, 'virtual_machine', 'vminformation');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-07-08 03:44:31.403843');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2022-07-08 03:44:31.629025');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2022-07-08 03:44:32.196495');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2022-07-08 03:44:32.336585');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2022-07-08 03:44:32.383561');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2022-07-08 03:44:32.435269');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2022-07-08 03:44:32.497129');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2022-07-08 03:44:32.513049');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2022-07-08 03:44:32.551188');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2022-07-08 03:44:32.600941');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2022-07-08 03:44:32.647806');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2022-07-08 03:44:32.754804');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2022-07-08 03:44:32.809897');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2022-07-08 03:44:32.846764');
INSERT INTO `django_migrations` VALUES (15, 'security_group', '0001_initial', '2022-07-08 03:44:32.955269');
INSERT INTO `django_migrations` VALUES (16, 'sessions', '0001_initial', '2022-07-08 03:44:33.056010');
INSERT INTO `django_migrations` VALUES (17, 'snapshoot', '0001_initial', '2022-07-08 03:44:33.122340');
INSERT INTO `django_migrations` VALUES (18, 'users', '0001_initial', '2022-07-08 03:44:33.731784');
INSERT INTO `django_migrations` VALUES (19, 'virtual_machine', '0001_initial', '2022-07-08 03:44:33.818366');
INSERT INTO `django_migrations` VALUES (20, 'users', '0002_alter_user_password', '2022-08-06 06:18:12.002698');
INSERT INTO `django_migrations` VALUES (21, 'cloud_volume', '0001_initial', '2022-08-21 13:41:40.407257');
INSERT INTO `django_migrations` VALUES (22, 'cloud_volume', '0002_auto_20220821_1631', '2022-08-21 16:31:58.170958');
INSERT INTO `django_migrations` VALUES (23, 'cloud_volume', '0003_cloudvolume_cloud_volume_status', '2022-08-26 11:37:25.287536');
INSERT INTO `django_migrations` VALUES (24, 'cloud_volume', '0004_alter_cloudvolume_cloud_volume_status', '2022-08-26 11:48:01.257491');
INSERT INTO `django_migrations` VALUES (25, 'hosts', '0001_initial', '2022-10-22 11:22:31.135068');
INSERT INTO `django_migrations` VALUES (26, 'hosts', '0002_auto_20221024_0714', '2022-10-24 07:14:47.375876');
INSERT INTO `django_migrations` VALUES (27, 'hosts', '0003_auto_20230221_0209', '2023-02-21 02:10:07.230002');
INSERT INTO `django_migrations` VALUES (28, 'trigger', '0001_initial', '2023-02-21 02:10:07.387898');
INSERT INTO `django_migrations` VALUES (29, 'hosts', '0004_hostpassman', '2023-03-06 12:00:19.117715');
INSERT INTO `django_migrations` VALUES (30, 'scripts', '0001_initial', '2023-03-10 05:06:51.337265');
INSERT INTO `django_migrations` VALUES (31, 'scripts', '0002_auto_20230314_0801', '2023-03-14 08:18:57.550515');
INSERT INTO `django_migrations` VALUES (32, 'hosts', '0005_hostpassman_isconfidentialityfree', '2023-03-20 13:05:10.853831');
INSERT INTO `django_migrations` VALUES (33, 'scripts', '0002_connectioninfo', '2023-03-30 14:14:26.022500');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for hosts_hostpassman
-- ----------------------------
DROP TABLE IF EXISTS `hosts_hostpassman`;
CREATE TABLE `hosts_hostpassman`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `server` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `port` smallint(6) NOT NULL,
  `server_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `passwd` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `master` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isConfidentialityFree` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of hosts_hostpassman
-- ----------------------------
INSERT INTO `hosts_hostpassman` VALUES (1, '2024-03-02 16:55:14.598965', '2024-03-02 16:55:14.598965', '192.168.1.105', 22, 'root', '111111', 'admin', '这是我的agent端', 1);
INSERT INTO `hosts_hostpassman` VALUES (2, '2024-03-09 11:12:53.165355', '2024-03-09 11:12:53.165355', '192.168.1.106', 22, 'root', '111111', 'admin', '这是我的agent端', 1);
INSERT INTO `hosts_hostpassman` VALUES (3, '2024-03-10 18:14:20.236005', '2024-03-10 18:14:20.236005', '192.168.1.107', 22, 'root', '123456', 'admin', '这是我的agent端', 1);
INSERT INTO `hosts_hostpassman` VALUES (4, '2024-03-11 16:29:19.125555', '2024-03-11 16:29:19.125555', '192.168.1.108', 22, 'root', '111111', 'yl', '这是我的agent端', 0);

-- ----------------------------
-- Table structure for hosts_hosts
-- ----------------------------
DROP TABLE IF EXISTS `hosts_hosts`;
CREATE TABLE `hosts_hosts`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `host_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `host` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `available` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `host_ip` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `group_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `template_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of hosts_hosts
-- ----------------------------
INSERT INTO `hosts_hosts` VALUES (1, '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hosts_hosts` VALUES (2, '10440', 'het', '0', '1', '192.168.1.37', '2', '10001');
INSERT INTO `hosts_hosts` VALUES (3, '10448', 'tet10191', '0', 'True', '192.168.3.113', 'Linux servers', 'Template OS Linux by Zabbix agent');
INSERT INTO `hosts_hosts` VALUES (4, '10457', 'test0306', '0', 'True', '192.168.1.106', 'Linux servers', 'Template OS Linux by Zabbix agent');
INSERT INTO `hosts_hosts` VALUES (5, '10458', 'test0307', '0', 'True', '192.168.1.106', 'Linux servers', 'Template OS Linux by Zabbix agent');
INSERT INTO `hosts_hosts` VALUES (6, '10459', 'rwew', '0', 'True', '192.168.1.106', 'Discovered hosts', 'Template OS Linux by Zabbix agent');
INSERT INTO `hosts_hosts` VALUES (7, '10461', 'test0307', '0', 'True', '192.168.1.106', 'Linux servers', 'checkkzzx');

-- ----------------------------
-- Table structure for scripts_playbooks
-- ----------------------------
DROP TABLE IF EXISTS `scripts_playbooks`;
CREATE TABLE `scripts_playbooks`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `funcName` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickName` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `playbook` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2891267 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of scripts_playbooks
-- ----------------------------
INSERT INTO `scripts_playbooks` VALUES (1, '功能1', '1', '1');
INSERT INTO `scripts_playbooks` VALUES (2, 'testls', 'ls', '---\n- hosts: all\n  remote_user: root\n  tasks:\n    - name: testls\n      command: \'ls /\'');
INSERT INTO `scripts_playbooks` VALUES (3, '2', '2', '- hosts: all\n  become: yes\n  become_method: sudo\n  gather_facts: yes\n\n  tasks:\n  - name: \"install {{ package_name }}\"\n    package:\n      name: \"{{ package_name }}\"\n      state: \"{{ state | default(\'present\') }}\"');
INSERT INTO `scripts_playbooks` VALUES (4, '3', '3', '- hosts: all\n  become: yes\n  become_method: sudo\n  gather_facts: n\n\n  tasks:\n  - name: \"install {{ package_name }}\"\n    package:\n      name: \"{{ package_name }}\"\n      state: \"{{ state | default(\'present\') }}\"');
INSERT INTO `scripts_playbooks` VALUES (6, 'testls1', 'ls', '---\n- hosts: all\n  remote_user: root\n  tasks:\n    - name: testls\n      command: \'ls /\'');
INSERT INTO `scripts_playbooks` VALUES (123321, '4', '4', '- hosts: all\n  become: yes\n  become_method: sudo\n  gather_facts: no4\n\n  tasks:\n  - name: \"install {{ package_name }}\"\n    package:\n      name: \"{{ package_name }}\"\n      state: \"{{ state | default(\'present\') }}\"');
INSERT INTO `scripts_playbooks` VALUES (2891266, '打开一个文件', 'openfile', '---\n- hosts: all\n  remote_user: root\n  tasks:\n    - name: test\n      command: \'vim 1.txt\'');

-- ----------------------------
-- Table structure for security_group_securitygroup
-- ----------------------------
DROP TABLE IF EXISTS `security_group_securitygroup`;
CREATE TABLE `security_group_securitygroup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `security_group_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VM_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VM_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `security_group_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `security_group_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of security_group_securitygroup
-- ----------------------------
INSERT INTO `security_group_securitygroup` VALUES (1, '087dccb2-0b99-41c4-a356-a5f597e5042d', 'd6edffab-5504-4798-85b9-6a004acccd3c', 'qazxsw', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (2, '087dccb2-0b99-41c4-a356-a5f597e5042d', '3e51b5f7-dfb6-4be2-a783-4506eb0bef58', 'qwe123', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (3, '087dccb2-0b99-41c4-a356-a5f597e5042d', '5f8b3c1e-3b52-4c6a-9bc9-38bc38ec7027', 'qwert', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (4, '087dccb2-0b99-41c4-a356-a5f597e5042d', 'fda5686f-c549-4964-b3e6-307e488f41e2', 'test0822', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (5, '087dccb2-0b99-41c4-a356-a5f597e5042d', '0b806d5d-cf01-4d41-9c4a-bd76196d20d2', 'test0827', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (6, 'c783cac5-4b35-4dc9-87dc-8fdd841a8d15', '1c631ab5-3d7e-4bb9-bf60-50d17ed6b267', 'test1019', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (7, 'c783cac5-4b35-4dc9-87dc-8fdd841a8d15', '782c635a-b5e1-4ea4-b5f2-60e9fe3d71a1', 'qwe1', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (8, 'c783cac5-4b35-4dc9-87dc-8fdd841a8d15', 'd24aea28-4525-4dea-abb8-69ef2d36068b', 'test10191', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (9, 'c783cac5-4b35-4dc9-87dc-8fdd841a8d15', '4007faba-f895-4aa7-974a-efd0c02e276a', 'test0310', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (10, 'c783cac5-4b35-4dc9-87dc-8fdd841a8d15', '3cfe6d67-68f5-46a6-a7ef-2a1616c928a8', 'test0426', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (11, 'c783cac5-4b35-4dc9-87dc-8fdd841a8d15', '18e97922-944a-4310-9195-413d69c1c8fe', 'test0404', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (12, 'c783cac5-4b35-4dc9-87dc-8fdd841a8d15', '33820ffc-bd0c-4093-83e7-e291e8f388c3', '1', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (14, 'c783cac5-4b35-4dc9-87dc-8fdd841a8d15', '817fea78-b449-479e-bc14-7c006bc39142', '2', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (15, 'c783cac5-4b35-4dc9-87dc-8fdd841a8d15', '817fea78-b449-479e-bc14-7c006bc39142', '2', 'default', 'null');
INSERT INTO `security_group_securitygroup` VALUES (16, 'd5163e00-29e6-48f2-a6e1-f0b211eaeef0', '33820ffc-bd0c-4093-83e7-e291e8f388c3', '1', '开放SSH服务和ICMP服务', 'null');
INSERT INTO `security_group_securitygroup` VALUES (17, 'ae36ec76-c8e4-442d-8aca-7d5ab37586a1', '200fdf4d-004a-4825-882b-5e452f6d8443', 'yayaya', 'YL_security', 'null');

-- ----------------------------
-- Table structure for snapshoot_snapshoot
-- ----------------------------
DROP TABLE IF EXISTS `snapshoot_snapshoot`;
CREATE TABLE `snapshoot_snapshoot`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snapshoot_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VM_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VM_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `snapshoot_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `snapshoot_describe` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `snapshoot_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of snapshoot_snapshoot
-- ----------------------------
INSERT INTO `snapshoot_snapshoot` VALUES (1, '79e0680d-817d-4f8a-add0-f5b039c0f502', '3e51b5f7-dfb6-4be2-a783-4506eb0bef58', 'qwe123', '20220712', '测试', 'admin');
INSERT INTO `snapshoot_snapshoot` VALUES (2, '98e9111d-eddf-4a9b-b58e-eeac36a50379', '5699fa80-9caa-42fd-8a66-ac091c3a6057', 'qwert1', 'test', 'test123', 'admin');
INSERT INTO `snapshoot_snapshoot` VALUES (3, '1', '1', 'fake1', '1', '1', 'admin');
INSERT INTO `snapshoot_snapshoot` VALUES (4, '1', '1', 'fake2', '1', '1', 'tom');
INSERT INTO `snapshoot_snapshoot` VALUES (5, '1', '1', 'fake3', '1', '1', 'tom');
INSERT INTO `snapshoot_snapshoot` VALUES (6, '1', '1', 'fake4', '1', '1', 'tom');
INSERT INTO `snapshoot_snapshoot` VALUES (7, '1', '1', 'fake5', '1', '1', 'admin');
INSERT INTO `snapshoot_snapshoot` VALUES (8, '1', '1', 'fake6', '1', '1', 'tom');
INSERT INTO `snapshoot_snapshoot` VALUES (9, '1', '1', 'fake6', '1', '12345', 'tom');
INSERT INTO `snapshoot_snapshoot` VALUES (10, '1', '1', 'fake6', '1', '1234567', 'tom');

-- ----------------------------
-- Table structure for trigger_citem
-- ----------------------------
DROP TABLE IF EXISTS `trigger_citem`;
CREATE TABLE `trigger_citem`  (
  `itemId` int(11) NOT NULL,
  `itemName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `itemKey` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `itemStatus` int(11) NOT NULL,
  `hostId` int(11) NOT NULL,
  `interfaceId` int(11) NOT NULL,
  `valuetype` int(11) NULL DEFAULT NULL,
  `datatype` int(11) NULL DEFAULT NULL,
  `units` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `applicationId` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of trigger_citem
-- ----------------------------

-- ----------------------------
-- Table structure for trigger_trigger
-- ----------------------------
DROP TABLE IF EXISTS `trigger_trigger`;
CREATE TABLE `trigger_trigger`  (
  `triggerId` int(11) NOT NULL,
  `triggerName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `triggerValue` int(11) NOT NULL,
  `triggerPriority` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `triggerDescription` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `condition` varchar(10000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`triggerId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of trigger_trigger
-- ----------------------------

-- ----------------------------
-- Table structure for users_user
-- ----------------------------
DROP TABLE IF EXISTS `users_user`;
CREATE TABLE `users_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `client_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_mac` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_number` int(11) NULL DEFAULT NULL,
  `student_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users_user
-- ----------------------------
INSERT INTO `users_user` VALUES (0, '', '', NULL, 0, '', '', '555@gmail.com', 0, 1, '2024-03-27 02:32:05.341657', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users_user` VALUES (1, 'admin', 'pbkdf2_sha256$260000$EiQTzKmIxZxQ1BsVptUL8e$NoayYpeqXTTMTrf15qwTrqEUVMhoX0g73vk9k3J03VY=', '2022-08-06 14:22:31.000000', 1, ' ', ' ', '1111@qq.com', 1, 1, '2022-08-06 14:23:15.000000', 0, ' ', ' ', '', NULL, ' ');
INSERT INTO `users_user` VALUES (18, 'teacher', 'pbkdf2_sha256$260000$EiQTzKmIxZxQ1BsVptUL8e$NoayYpeqXTTMTrf15qwTrqEUVMhoX0g73vk9k3J03VY=', NULL, 1, '', '', '111@qq.com', 1, 1, '2022-08-06 06:34:20.326903', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users_user` VALUES (19, 'yy12345', 'pbkdf2_sha256$260000$EiQTzKmIxZxQ1BsVptUL8e$NoayYpeqXTTMTrf15qwTrqEUVMhoX0g73vk9k3J03VY=', NULL, 0, '', '', '177742662@qq.com', 0, 1, '2022-08-06 06:37:24.013745', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users_user` VALUES (20, 'yy12345678', '', NULL, 0, '', '', '177742662@qq.com', 0, 1, '2022-08-06 07:59:20.506557', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users_user` VALUES (21, '123', '44449cc1418202c469b1478020034a1f', NULL, 0, '', '', '177742662@qq.com', 0, 1, '2022-08-07 08:58:03.599983', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users_user` VALUES (26, 'test0426', 'pbkdf2_sha256$260000$ffbhmMdX6PpckPdYZVkN5m$AcyHD1TqkyhCy4GMPG3ztVi29vhd5SVOEwJfdxz795w=', NULL, 0, '', '', '177742662@qq.com', 0, 1, '2023-04-26 09:33:33.877343', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users_user` VALUES (29, 'wyl123', 'pbkdf2_sha256$260000$bbixWe60zumQ9Jwx6uguYw$yblgpxS3FuhXmtzPjiCf4J7ca/70Pvklh7446D1LHtg=', NULL, 0, '', '', 'wyl2322767536@163.com', 0, 1, '2024-05-04 11:28:33.518307', 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_user_groups`;
CREATE TABLE `users_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_user_groups_user_id_group_id_b88eab82_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `users_user_groups_group_id_9afc8d0e_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_user_user_permissions`;
CREATE TABLE `users_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_user_user_permissions_user_id_permission_id_43338c45_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `users_user_user_perm_permission_id_0b93982e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for virtual_machine_vminformation
-- ----------------------------
DROP TABLE IF EXISTS `virtual_machine_vminformation`;
CREATE TABLE `virtual_machine_vminformation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `VM_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VM_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_mac` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `floating_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flavor` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rent_time` int(11) NOT NULL,
  `sign` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VM_security_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of virtual_machine_vminformation
-- ----------------------------
INSERT INTO `virtual_machine_vminformation` VALUES (11, '1', 'admin', 'fake2', '1', 'selfservice', '1', '1', '1', '1', '挂起', '1', 1, '1', '1');
INSERT INTO `virtual_machine_vminformation` VALUES (12, '1', 'tom', 'fake3', '2', 'selfservice', '1', '1', '1', '1', '挂起', '1', 1, '1', '1');
INSERT INTO `virtual_machine_vminformation` VALUES (13, '1', 'tom', 'fake4', '3', 'selfservice', '1', '1', '1', '1', '关闭', '1', 1, '1', '1');
INSERT INTO `virtual_machine_vminformation` VALUES (14, '1', 'tom', 'fake5', '4', 'selfservice', '1', '1', '1', '1', '挂起', '1', 1, '1', '1');
INSERT INTO `virtual_machine_vminformation` VALUES (15, '1', 'tom', 'fake6', '5', 'selfservice', '1', '1', '1', '1', '挂起', '1', 1, '1', '1');
INSERT INTO `virtual_machine_vminformation` VALUES (33, 'd67b68d7-36d5-46ae-a8c3-c5cb0b3b5f86', 'admin', '2', '1', 'cccNet', '192.168.1.238', 'mykey', 'centos7.5', 'linux', '关闭', 'm3.nano', 1, '1', 'default');

SET FOREIGN_KEY_CHECKS = 1;
