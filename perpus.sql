/*
 Navicat Premium Data Transfer

 Source Server         : SIAKAD
 Source Server Type    : MySQL
 Source Server Version : 100316
 Source Host           : localhost:3306
 Source Schema         : perpus

 Target Server Type    : MySQL
 Target Server Version : 100316
 File Encoding         : 65001

 Date: 10/01/2022 00:53:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE `mahasiswa`  (
  `id` char(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Fakultas` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Jurusan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO `mahasiswa` VALUES ('1a', 'Bili', 'Pertanian', 'Agroteknologi');
INSERT INTO `mahasiswa` VALUES ('1b', 'Rudi', 'Teknik', 'Sipil');
INSERT INTO `mahasiswa` VALUES ('2a', 'Budi', 'Ekonomi', 'Manajemen');

-- ----------------------------
-- Function structure for fc_json_user
-- ----------------------------
DROP FUNCTION IF EXISTS `fc_json_user`;
delimiter ;;
CREATE FUNCTION `fc_json_user`()
 RETURNS varchar(2048) CHARSET latin1
BEGIN

SET SESSION group_concat_max_len = 2048;
RETURN(
SELECT concat('[',GROUP_CONCAT(JSON_OBJECT(id, Nama)),']') as hasil FROM mahasiswa
);

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
