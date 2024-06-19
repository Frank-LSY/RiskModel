/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : ydr

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 19/06/2024 11:59:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ydr_cardfeatures
-- ----------------------------
DROP TABLE IF EXISTS `ydr_cardfeatures`;
CREATE TABLE `ydr_cardfeatures`  (
  `pollId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '问卷id',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `sex` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `olive_oil` float NULL DEFAULT NULL COMMENT '每周橄榄油消耗',
  `green_veges` float NULL DEFAULT NULL COMMENT '每周绿叶菜消耗',
  `other_veges` float NULL DEFAULT NULL COMMENT '每周其他菜消耗',
  `berries` float NULL DEFAULT NULL COMMENT '每周浆果消耗',
  `fruits` float NULL DEFAULT NULL COMMENT '每周水果消耗',
  `processed_meat` float NULL DEFAULT NULL COMMENT '每周加工肉消耗',
  `fish` float NULL DEFAULT NULL COMMENT '每周鱼虾贝消耗',
  `chicken` float NULL DEFAULT NULL COMMENT '每周鸡肉消耗',
  `cheese` float NULL DEFAULT NULL COMMENT '每周奶酪消耗',
  `butter` float NULL DEFAULT NULL COMMENT '每周黄油/奶油消耗',
  `beans` float NULL DEFAULT NULL COMMENT '每周豆类消耗',
  `grains` float NULL DEFAULT NULL COMMENT '每天谷物消耗',
  `dessert` float NULL DEFAULT NULL COMMENT '每周甜点消耗',
  `nuts` float NULL DEFAULT NULL COMMENT '每周坚果消耗',
  `precooked_food` int NULL DEFAULT NULL COMMENT '每周预制菜消耗',
  `drinking` int NULL DEFAULT NULL COMMENT '每天酒精消耗',
  `exercise` float NULL DEFAULT NULL COMMENT '每周中高强度运动时间',
  `smoking_status` enum('never','former','current') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '吸烟情况',
  `quit_year` int NULL DEFAULT NULL COMMENT '戒烟时间',
  `second_smoke` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二手烟暴露',
  `sleep` float NULL DEFAULT NULL COMMENT '睡眠时间',
  `bmi` float NULL DEFAULT NULL COMMENT 'BMI',
  `cholesterol` float NULL DEFAULT NULL COMMENT '血脂',
  `HDL` float NULL DEFAULT NULL COMMENT '高密度脂蛋白胆固醇',
  `lipid_drug` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否使用降脂药',
  `systolic_bp` int NULL DEFAULT NULL COMMENT '收缩压',
  `diastolic_bp` int NULL DEFAULT NULL COMMENT '舒张压',
  `bp_drug` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否使用降压药',
  `FBG` float NULL DEFAULT NULL COMMENT '空腹血糖',
  `HbA1C` float NULL DEFAULT NULL COMMENT '糖化血红素',
  `diabetes` enum('no','diet','tablet','insulin') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '糖尿病情况',
  PRIMARY KEY (`pollId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ydr_cardfeatures
-- ----------------------------
INSERT INTO `ydr_cardfeatures` VALUES ('33101dbd-1e02-2f39-e948-c4f49e99b0d0', 45, 'female', 8, 450, 400, 100, 700, 200, 200, 500, 20, 13, 460, 540, 300, 20, 2, 2, 50, 'never', -1, 'yes', 7.3, 24.7, 5.1, 1, 'no', 119, 77, 'no', 4.6, 5, 'no');
INSERT INTO `ydr_cardfeatures` VALUES ('45492933-a69a-f0b5-a2b0-ae98e061f8b5', 65, 'male', 31, 750, 200, 310, 1000, 100, 350, 300, 0, 1, 390, 540, 100, 130, 1, 1, 250, 'never', -1, 'no', 7.3, 23.7, 4.8, 1.2, 'yes', 119, 77, 'no', 4.6, 5, 'no');
INSERT INTO `ydr_cardfeatures` VALUES ('cf4001c9-17aa-1ab3-9f15-756cac956c3b', 39, 'male', 2, 250, 100, 10, 200, 300, 50, 700, 20, 13, 160, 240, 300, 0, 16, 0, 120, 'current', -1, 'yes', 8.1, 27.7, 5.4, 1, 'yes', 134, 90, 'yes', 5, 4.3, 'diet');

-- ----------------------------
-- Table structure for ydr_disease
-- ----------------------------
DROP TABLE IF EXISTS `ydr_disease`;
CREATE TABLE `ydr_disease`  (
  `diseaseId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '疾病id',
  `diseaseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '疾病名称',
  PRIMARY KEY (`diseaseId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ydr_disease
-- ----------------------------
INSERT INTO `ydr_disease` VALUES ('18dea5f1-0c72-4543-932b-055b7832d40a', '支气管炎/肺气肿');
INSERT INTO `ydr_disease` VALUES ('223eeeb0-8587-4fe0-a000-95d84b1a9449', '骨质疏松');
INSERT INTO `ydr_disease` VALUES ('23b2704b-d600-40b1-b5e7-b2abbfd52192', '卵巢癌');
INSERT INTO `ydr_disease` VALUES ('24a2e454-3539-4f83-a7e7-fd77533687cf', '子宫癌');
INSERT INTO `ydr_disease` VALUES ('335aeacd-6674-4201-8741-d9d6625b4249', '乳腺癌');
INSERT INTO `ydr_disease` VALUES ('356ca387-341c-485e-b827-4f3cf0427aa5', '宫颈癌');
INSERT INTO `ydr_disease` VALUES ('446423bc-0ae0-4e12-a2de-5b2ccd05c8d3', '心血管疾病');
INSERT INTO `ydr_disease` VALUES ('5717d096-f63d-440f-9f19-ee8289f3424c', '前列腺癌');
INSERT INTO `ydr_disease` VALUES ('62170376-908a-458d-8acd-7bb525385258', '黑色素瘤');
INSERT INTO `ydr_disease` VALUES ('651fa939-0e86-43e8-869c-a3394f41faa4', '糖尿病');
INSERT INTO `ydr_disease` VALUES ('767b8544-3110-43c8-b12a-88af9cb6bc97', '膀胱癌');
INSERT INTO `ydr_disease` VALUES ('950f71c0-05b5-4659-b646-9732055f9449', '大肠癌');
INSERT INTO `ydr_disease` VALUES ('c1190aa4-c4f5-4d24-bfa4-390e151a62c0', '胰腺癌');
INSERT INTO `ydr_disease` VALUES ('c23c042e-5743-4822-b5a9-8f0043cdfcb0', '肾癌');
INSERT INTO `ydr_disease` VALUES ('c8e242cb-d536-45a4-be7b-f5190f0cd281', '中风');
INSERT INTO `ydr_disease` VALUES ('d07149c4-7c2c-4a85-8ec6-4c017ce704a1', '肺癌');
INSERT INTO `ydr_disease` VALUES ('e538bdae-31e7-4cf1-8d17-8921cccd9eca', '胃癌');

-- ----------------------------
-- Table structure for ydr_liverscoreprob
-- ----------------------------
DROP TABLE IF EXISTS `ydr_liverscoreprob`;
CREATE TABLE `ydr_liverscoreprob`  (
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '哪一个模型',
  `score` int NULL DEFAULT NULL COMMENT '分数',
  `probability` float NULL DEFAULT NULL COMMENT '概率',
  `year` enum('five','ten') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '5年还是10年'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ydr_liverscoreprob
-- ----------------------------
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', -1, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', -1, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 0, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 0, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 1, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 1, 0.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 2, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 2, 0.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 3, 0.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 3, 0.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 4, 0.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 4, 0.5, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 5, 0.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 5, 0.7, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 6, 0.5, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 6, 1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 7, 0.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 7, 1.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 8, 0.9, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 8, 1.9, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 9, 1.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 9, 2.7, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 10, 1.8, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 10, 3.8, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 11, 2.5, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 11, 5.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 12, 3.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-1', 12, 7.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 0, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 0, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 2, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 2, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 4, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 4, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 6, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 6, 0.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 7, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 7, 0.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 8, 0.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 8, 1.5, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 11, 0.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 11, 0.9, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 13, 0.8, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 13, 1.6, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 15, 1.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 15, 2.9, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 19, 2.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 19, 5.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 21, 4.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 21, 9, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 23, 7.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-1', 23, 15.5, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', -1, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', -1, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 0, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 0, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 1, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 1, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 2, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 2, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 3, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 3, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 4, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 4, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 5, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 5, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 6, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 6, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 7, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 7, 0.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 8, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 8, 0.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 9, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 9, 0.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 10, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 10, 0.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 11, 0.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 11, 0.6, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 12, 0.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 12, 0.6, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 13, 0.5, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 13, 1.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 14, 0.5, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 14, 1.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 15, 0.9, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 15, 2.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 16, 0.9, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 16, 2.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 17, 1.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 17, 4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 18, 1.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 18, 4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 19, 3.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 19, 7.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 20, 3.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 20, 7.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 21, 5.6, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 21, 13, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 22, 5.6, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 22, 13, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 23, 10.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-1', 23, 22.8, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', -1, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', -1, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 0, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 0, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 1, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 1, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 2, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 2, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 3, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 3, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 4, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 4, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 5, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 5, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 6, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 6, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 7, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 7, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 8, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 8, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 9, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 9, 0.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 10, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 10, 0.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 11, 0.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 11, 0.5, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 12, 0.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 12, 0.7, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 13, 0.5, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 13, 0.9, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 14, 0.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 14, 1.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 15, 0.9, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 15, 1.8, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 16, 1.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 16, 2.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 17, 1.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 17, 3.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 18, 2.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 18, 5.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 19, 3.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 19, 6.5, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 20, 5.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 20, 10.8, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 21, 6.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 21, 12.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 22, 10.5, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 22, 18.7, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 23, 11.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 23, 22.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 24, 19.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 24, 35, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 25, 21.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 25, 38.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 26, 32.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 26, 56.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 27, 37, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 27, 60.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 28, 45, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 28, 75.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 29, 59, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('4-1', 29, 83.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', -1, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', -1, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 0, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 0, 0.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 1, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 1, 0.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 2, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 2, 0.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 3, 0.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 3, 0.5, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 4, 0.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 4, 0.7, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 5, 0.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 5, 1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 6, 0.5, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 6, 1.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 7, 0.8, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 7, 2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 8, 1.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 8, 3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 9, 1.6, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 9, 4.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 10, 2.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('1-2', 10, 6.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 0, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 0, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 1, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 1, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 2, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 2, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 3, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 3, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 4, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 4, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 5, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 5, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 6, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 6, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 7, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 7, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 8, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 8, 0.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 9, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 9, 0.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 10, 0.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 10, 0.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 11, 0.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 11, 0.5, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 12, 0.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 12, 0.7, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 13, 0.5, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 13, 1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 14, 0.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 14, 1.6, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 15, 1.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 15, 1.9, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 16, 1.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 16, 2.7, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 17, 3.8, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 17, 2.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 18, 2.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 18, 5.6, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 19, 7.5, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 19, 4.7, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 20, 5.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 20, 11.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 21, 7.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('2-2', 21, 14.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 0, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 0, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 1, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 1, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 2, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 2, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 3, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 3, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 4, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 4, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 5, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 5, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 6, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 6, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 7, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 7, 0.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 8, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 8, 0.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 9, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 9, 0.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 10, 0.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 10, 0.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 11, 0.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 11, 0.6, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 12, 0.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 12, 0.8, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 13, 0.6, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 13, 1.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 14, 0.8, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 14, 1.8, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 15, 1.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 15, 2.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 16, 1.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 16, 3.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 17, 2.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 17, 4.5, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 18, 3.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 18, 6.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 19, 4.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 19, 8.7, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 20, 6.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 20, 13.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 21, 9.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('3-2', 21, 16.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 0, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 0, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 1, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 1, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 2, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 2, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 3, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 3, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 4, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 4, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 5, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 5, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 6, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 6, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 7, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 7, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 8, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 8, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 9, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 9, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 10, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 10, 0, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 11, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 11, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 12, 0, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 12, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 13, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 13, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 14, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 14, 0.1, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 15, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 15, 0.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 16, 0.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 16, 0.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 17, 0.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 17, 0.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 18, 0.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 18, 0.6, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 19, 0.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 19, 0.8, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 20, 0.5, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 20, 1.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 21, 0.6, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 21, 1.5, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 22, 0.9, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 22, 2.2, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 23, 1.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 23, 2.7, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 24, 1.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 24, 3.8, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 25, 2.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 25, 4.9, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 26, 3.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 26, 7.6, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 27, 3.8, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 27, 8.9, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 28, 5, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 28, 13, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 29, 6.8, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 29, 15.6, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 30, 9.3, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 30, 22, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 31, 12.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 31, 26.8, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 32, 18.7, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 32, 32.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 33, 21.2, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 33, 43.5, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 34, 29.6, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 34, 57.3, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 35, 35.4, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 35, 64.9, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 36, 45.9, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 36, 75.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 37, 55.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 37, 85.4, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 38, 66.1, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 38, 92, 'ten');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 39, 77, 'five');
INSERT INTO `ydr_liverscoreprob` VALUES ('5-2', 39, 97.1, 'ten');

-- ----------------------------
-- Table structure for ydr_lungdetail
-- ----------------------------
DROP TABLE IF EXISTS `ydr_lungdetail`;
CREATE TABLE `ydr_lungdetail`  (
  `pollId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `intensity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `probability` float NULL DEFAULT NULL,
  `score` float NULL DEFAULT NULL,
  PRIMARY KEY (`pollId`) USING BTREE,
  CONSTRAINT `polllung` FOREIGN KEY (`pollId`) REFERENCES `ydr_poll` (`pollId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ydr_lungdetail
-- ----------------------------

-- ----------------------------
-- Table structure for ydr_lungscoreprob
-- ----------------------------
DROP TABLE IF EXISTS `ydr_lungscoreprob`;
CREATE TABLE `ydr_lungscoreprob`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `year` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `smoke` enum('NEVER','LIGHT','HEAVY') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `point` int NOT NULL,
  `probability` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 532 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ydr_lungscoreprob
-- ----------------------------
INSERT INTO `ydr_lungscoreprob` VALUES (414, 'ten', 'NEVER', -4, 0.03);
INSERT INTO `ydr_lungscoreprob` VALUES (415, 'ten', 'NEVER', -5, 0.02);
INSERT INTO `ydr_lungscoreprob` VALUES (416, 'ten', 'NEVER', -3, 0.05);
INSERT INTO `ydr_lungscoreprob` VALUES (417, 'ten', 'NEVER', -2, 0.07);
INSERT INTO `ydr_lungscoreprob` VALUES (418, 'ten', 'NEVER', -1, 0.09);
INSERT INTO `ydr_lungscoreprob` VALUES (419, 'ten', 'NEVER', 0, 0.13);
INSERT INTO `ydr_lungscoreprob` VALUES (420, 'ten', 'NEVER', 1, 0.18);
INSERT INTO `ydr_lungscoreprob` VALUES (421, 'ten', 'NEVER', 2, 0.26);
INSERT INTO `ydr_lungscoreprob` VALUES (422, 'ten', 'NEVER', 3, 0.36);
INSERT INTO `ydr_lungscoreprob` VALUES (423, 'ten', 'NEVER', 4, 0.51);
INSERT INTO `ydr_lungscoreprob` VALUES (424, 'ten', 'NEVER', 5, 0.71);
INSERT INTO `ydr_lungscoreprob` VALUES (425, 'ten', 'NEVER', 6, 0.99);
INSERT INTO `ydr_lungscoreprob` VALUES (426, 'ten', 'NEVER', 7, 1.38);
INSERT INTO `ydr_lungscoreprob` VALUES (427, 'ten', 'NEVER', 8, 1.92);
INSERT INTO `ydr_lungscoreprob` VALUES (428, 'ten', 'NEVER', 9, 2.68);
INSERT INTO `ydr_lungscoreprob` VALUES (429, 'ten', 'NEVER', 10, 3.73);
INSERT INTO `ydr_lungscoreprob` VALUES (430, 'ten', 'NEVER', 11, 5.19);
INSERT INTO `ydr_lungscoreprob` VALUES (431, 'ten', 'NEVER', 12, 7.18);
INSERT INTO `ydr_lungscoreprob` VALUES (432, 'ten', 'NEVER', 13, 9.91);
INSERT INTO `ydr_lungscoreprob` VALUES (433, 'ten', 'NEVER', 14, 13.58);
INSERT INTO `ydr_lungscoreprob` VALUES (434, 'ten', 'NEVER', 15, 18.48);
INSERT INTO `ydr_lungscoreprob` VALUES (435, 'ten', 'NEVER', 16, 24.86);
INSERT INTO `ydr_lungscoreprob` VALUES (436, 'ten', 'NEVER', 17, 32.97);
INSERT INTO `ydr_lungscoreprob` VALUES (437, 'ten', 'LIGHT', -5, 0.01);
INSERT INTO `ydr_lungscoreprob` VALUES (438, 'ten', 'LIGHT', -4, 0.01);
INSERT INTO `ydr_lungscoreprob` VALUES (439, 'ten', 'LIGHT', -3, 0.02);
INSERT INTO `ydr_lungscoreprob` VALUES (440, 'ten', 'LIGHT', -2, 0.03);
INSERT INTO `ydr_lungscoreprob` VALUES (441, 'ten', 'LIGHT', -1, 0.04);
INSERT INTO `ydr_lungscoreprob` VALUES (442, 'ten', 'LIGHT', 0, 0.07);
INSERT INTO `ydr_lungscoreprob` VALUES (443, 'ten', 'LIGHT', 1, 0.1);
INSERT INTO `ydr_lungscoreprob` VALUES (444, 'ten', 'LIGHT', 2, 0.15);
INSERT INTO `ydr_lungscoreprob` VALUES (445, 'ten', 'LIGHT', 3, 0.22);
INSERT INTO `ydr_lungscoreprob` VALUES (446, 'ten', 'LIGHT', 4, 0.33);
INSERT INTO `ydr_lungscoreprob` VALUES (447, 'ten', 'LIGHT', 5, 0.49);
INSERT INTO `ydr_lungscoreprob` VALUES (448, 'ten', 'LIGHT', 6, 0.7);
INSERT INTO `ydr_lungscoreprob` VALUES (449, 'ten', 'LIGHT', 7, 1.09);
INSERT INTO `ydr_lungscoreprob` VALUES (450, 'ten', 'LIGHT', 8, 1.61);
INSERT INTO `ydr_lungscoreprob` VALUES (451, 'ten', 'LIGHT', 9, 2.4);
INSERT INTO `ydr_lungscoreprob` VALUES (452, 'ten', 'LIGHT', 10, 3.55);
INSERT INTO `ydr_lungscoreprob` VALUES (453, 'ten', 'LIGHT', 11, 5.24);
INSERT INTO `ydr_lungscoreprob` VALUES (454, 'ten', 'LIGHT', 12, 7.71);
INSERT INTO `ydr_lungscoreprob` VALUES (455, 'ten', 'LIGHT', 13, 11.26);
INSERT INTO `ydr_lungscoreprob` VALUES (456, 'ten', 'LIGHT', 14, 16.31);
INSERT INTO `ydr_lungscoreprob` VALUES (457, 'ten', 'HEAVY', -3, 0.06);
INSERT INTO `ydr_lungscoreprob` VALUES (458, 'ten', 'HEAVY', -2, 0.09);
INSERT INTO `ydr_lungscoreprob` VALUES (459, 'ten', 'HEAVY', -1, 0.13);
INSERT INTO `ydr_lungscoreprob` VALUES (460, 'ten', 'HEAVY', 0, 0.19);
INSERT INTO `ydr_lungscoreprob` VALUES (461, 'ten', 'HEAVY', 1, 0.28);
INSERT INTO `ydr_lungscoreprob` VALUES (462, 'ten', 'HEAVY', 2, 0.42);
INSERT INTO `ydr_lungscoreprob` VALUES (463, 'ten', 'HEAVY', 3, 0.61);
INSERT INTO `ydr_lungscoreprob` VALUES (464, 'ten', 'HEAVY', 4, 0.9);
INSERT INTO `ydr_lungscoreprob` VALUES (465, 'ten', 'HEAVY', 5, 1.33);
INSERT INTO `ydr_lungscoreprob` VALUES (466, 'ten', 'HEAVY', 6, 1.95);
INSERT INTO `ydr_lungscoreprob` VALUES (467, 'ten', 'HEAVY', 7, 2.85);
INSERT INTO `ydr_lungscoreprob` VALUES (468, 'ten', 'HEAVY', 8, 4.17);
INSERT INTO `ydr_lungscoreprob` VALUES (469, 'ten', 'HEAVY', 9, 6.08);
INSERT INTO `ydr_lungscoreprob` VALUES (470, 'ten', 'HEAVY', 10, 8.82);
INSERT INTO `ydr_lungscoreprob` VALUES (471, 'ten', 'HEAVY', 11, 12.71);
INSERT INTO `ydr_lungscoreprob` VALUES (472, 'ten', 'HEAVY', 12, 18.13);
INSERT INTO `ydr_lungscoreprob` VALUES (473, 'five', 'NEVER', -4, 0.01);
INSERT INTO `ydr_lungscoreprob` VALUES (474, 'five', 'NEVER', -5, 0.02);
INSERT INTO `ydr_lungscoreprob` VALUES (475, 'five', 'NEVER', -3, 0.02);
INSERT INTO `ydr_lungscoreprob` VALUES (476, 'five', 'NEVER', -2, 0.03);
INSERT INTO `ydr_lungscoreprob` VALUES (477, 'five', 'NEVER', -1, 0.04);
INSERT INTO `ydr_lungscoreprob` VALUES (478, 'five', 'NEVER', 0, 0.06);
INSERT INTO `ydr_lungscoreprob` VALUES (479, 'five', 'NEVER', 1, 0.08);
INSERT INTO `ydr_lungscoreprob` VALUES (480, 'five', 'NEVER', 2, 0.11);
INSERT INTO `ydr_lungscoreprob` VALUES (481, 'five', 'NEVER', 3, 0.16);
INSERT INTO `ydr_lungscoreprob` VALUES (482, 'five', 'NEVER', 4, 0.22);
INSERT INTO `ydr_lungscoreprob` VALUES (483, 'five', 'NEVER', 5, 0.3);
INSERT INTO `ydr_lungscoreprob` VALUES (484, 'five', 'NEVER', 6, 0.43);
INSERT INTO `ydr_lungscoreprob` VALUES (485, 'five', 'NEVER', 7, 0.6);
INSERT INTO `ydr_lungscoreprob` VALUES (486, 'five', 'NEVER', 8, 0.83);
INSERT INTO `ydr_lungscoreprob` VALUES (487, 'five', 'NEVER', 9, 1.16);
INSERT INTO `ydr_lungscoreprob` VALUES (488, 'five', 'NEVER', 10, 1.63);
INSERT INTO `ydr_lungscoreprob` VALUES (489, 'five', 'NEVER', 11, 2.27);
INSERT INTO `ydr_lungscoreprob` VALUES (490, 'five', 'NEVER', 12, 3.16);
INSERT INTO `ydr_lungscoreprob` VALUES (491, 'five', 'NEVER', 13, 4.39);
INSERT INTO `ydr_lungscoreprob` VALUES (492, 'five', 'NEVER', 14, 6.09);
INSERT INTO `ydr_lungscoreprob` VALUES (493, 'five', 'NEVER', 15, 8.42);
INSERT INTO `ydr_lungscoreprob` VALUES (494, 'five', 'NEVER', 16, 11.58);
INSERT INTO `ydr_lungscoreprob` VALUES (495, 'five', 'NEVER', 17, 15.82);
INSERT INTO `ydr_lungscoreprob` VALUES (496, 'five', 'LIGHT', -5, 0);
INSERT INTO `ydr_lungscoreprob` VALUES (497, 'five', 'LIGHT', -4, 0.01);
INSERT INTO `ydr_lungscoreprob` VALUES (498, 'five', 'LIGHT', -3, 0.01);
INSERT INTO `ydr_lungscoreprob` VALUES (499, 'five', 'LIGHT', -2, 0.01);
INSERT INTO `ydr_lungscoreprob` VALUES (500, 'five', 'LIGHT', -1, 0.02);
INSERT INTO `ydr_lungscoreprob` VALUES (501, 'five', 'LIGHT', 0, 0.03);
INSERT INTO `ydr_lungscoreprob` VALUES (502, 'five', 'LIGHT', 1, 0.04);
INSERT INTO `ydr_lungscoreprob` VALUES (503, 'five', 'LIGHT', 2, 0.06);
INSERT INTO `ydr_lungscoreprob` VALUES (504, 'five', 'LIGHT', 3, 0.1);
INSERT INTO `ydr_lungscoreprob` VALUES (505, 'five', 'LIGHT', 4, 0.14);
INSERT INTO `ydr_lungscoreprob` VALUES (506, 'five', 'LIGHT', 5, 0.21);
INSERT INTO `ydr_lungscoreprob` VALUES (507, 'five', 'LIGHT', 6, 0.32);
INSERT INTO `ydr_lungscoreprob` VALUES (508, 'five', 'LIGHT', 7, 0.47);
INSERT INTO `ydr_lungscoreprob` VALUES (509, 'five', 'LIGHT', 8, 0.7);
INSERT INTO `ydr_lungscoreprob` VALUES (510, 'five', 'LIGHT', 9, 1.04);
INSERT INTO `ydr_lungscoreprob` VALUES (511, 'five', 'LIGHT', 10, 1.55);
INSERT INTO `ydr_lungscoreprob` VALUES (512, 'five', 'LIGHT', 11, 2.3);
INSERT INTO `ydr_lungscoreprob` VALUES (513, 'five', 'LIGHT', 12, 3.4);
INSERT INTO `ydr_lungscoreprob` VALUES (514, 'five', 'LIGHT', 13, 5.02);
INSERT INTO `ydr_lungscoreprob` VALUES (515, 'five', 'LIGHT', 14, 7.39);
INSERT INTO `ydr_lungscoreprob` VALUES (516, 'five', 'HEAVY', -3, 0.02);
INSERT INTO `ydr_lungscoreprob` VALUES (517, 'five', 'HEAVY', -2, 0.03);
INSERT INTO `ydr_lungscoreprob` VALUES (518, 'five', 'HEAVY', -1, 0.05);
INSERT INTO `ydr_lungscoreprob` VALUES (519, 'five', 'HEAVY', 0, 0.08);
INSERT INTO `ydr_lungscoreprob` VALUES (520, 'five', 'HEAVY', 1, 0.11);
INSERT INTO `ydr_lungscoreprob` VALUES (521, 'five', 'HEAVY', 2, 0.16);
INSERT INTO `ydr_lungscoreprob` VALUES (522, 'five', 'HEAVY', 3, 0.24);
INSERT INTO `ydr_lungscoreprob` VALUES (523, 'five', 'HEAVY', 4, 0.35);
INSERT INTO `ydr_lungscoreprob` VALUES (524, 'five', 'HEAVY', 5, 0.52);
INSERT INTO `ydr_lungscoreprob` VALUES (525, 'five', 'HEAVY', 6, 0.76);
INSERT INTO `ydr_lungscoreprob` VALUES (526, 'five', 'HEAVY', 7, 1.12);
INSERT INTO `ydr_lungscoreprob` VALUES (527, 'five', 'HEAVY', 8, 1.64);
INSERT INTO `ydr_lungscoreprob` VALUES (528, 'five', 'HEAVY', 9, 2.41);
INSERT INTO `ydr_lungscoreprob` VALUES (529, 'five', 'HEAVY', 10, 3.52);
INSERT INTO `ydr_lungscoreprob` VALUES (530, 'five', 'HEAVY', 11, 5.15);
INSERT INTO `ydr_lungscoreprob` VALUES (531, 'five', 'HEAVY', 12, 7.48);

-- ----------------------------
-- Table structure for ydr_poll
-- ----------------------------
DROP TABLE IF EXISTS `ydr_poll`;
CREATE TABLE `ydr_poll`  (
  `pollId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '问卷id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问卷描述',
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `time` datetime NOT NULL COMMENT '问卷时间',
  PRIMARY KEY (`pollId`) USING BTREE,
  INDEX `user2poll`(`userId` ASC) USING BTREE,
  CONSTRAINT `user2poll` FOREIGN KEY (`userId`) REFERENCES `ydr_user` (`userId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ydr_poll
-- ----------------------------
INSERT INTO `ydr_poll` VALUES ('33101dbd-1e02-2f39-e948-c4f49e99b0d0', '第一个结果', '2', '2024-01-16 18:40:09');
INSERT INTO `ydr_poll` VALUES ('45492933-a69a-f0b5-a2b0-ae98e061f8b5', '第二个结果', '1', '2024-01-23 20:27:51');
INSERT INTO `ydr_poll` VALUES ('cf4001c9-17aa-1ab3-9f15-756cac956c3b', '第三个结果', '3', '2024-01-24 04:23:27');

-- ----------------------------
-- Table structure for ydr_polldetail
-- ----------------------------
DROP TABLE IF EXISTS `ydr_polldetail`;
CREATE TABLE `ydr_polldetail`  (
  `diseaseId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '疾病id',
  `pollId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '问卷id',
  `riskScore` float NOT NULL COMMENT '风险等级',
  INDEX `disease2detail`(`diseaseId` ASC) USING BTREE,
  INDEX `poll2detail`(`pollId` ASC) USING BTREE,
  CONSTRAINT `disease2detail` FOREIGN KEY (`diseaseId`) REFERENCES `ydr_disease` (`diseaseId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `poll2detail` FOREIGN KEY (`pollId`) REFERENCES `ydr_poll` (`pollId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ydr_polldetail
-- ----------------------------

-- ----------------------------
-- Table structure for ydr_pollfeatures
-- ----------------------------
DROP TABLE IF EXISTS `ydr_pollfeatures`;
CREATE TABLE `ydr_pollfeatures`  (
  `pollId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '问卷id',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `sex` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `smoking_status` enum('never','former','current') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '吸烟状态',
  `smoking_yearly` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年吸烟',
  `smoking_daily` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日吸烟',
  `bmi` float NULL DEFAULT NULL COMMENT 'BMI',
  `lung_cancer_history` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家族肺癌史',
  `personal_cancer_history` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人癌症史',
  `AFP` float NULL DEFAULT NULL COMMENT 'AFP取值',
  `MMEF` int NULL DEFAULT NULL COMMENT 'MMEF取值',
  `CEA` float NULL DEFAULT NULL COMMENT 'CEA取值',
  `CRP` float NULL DEFAULT NULL COMMENT 'CRP取值',
  `drinking` enum('never','occasional','regular','heavy') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '饮酒情况',
  `exercise` int NULL DEFAULT NULL COMMENT '每周运动，分钟',
  `diabetes` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '糖尿病',
  `AST` float NULL DEFAULT NULL COMMENT 'AST取值',
  `ALT` float NULL DEFAULT NULL COMMENT 'ALT取值',
  `HBV` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'HBV结果',
  `HCV` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'HCV结果',
  PRIMARY KEY (`pollId`) USING BTREE,
  CONSTRAINT `feature_poll` FOREIGN KEY (`pollId`) REFERENCES `ydr_poll` (`pollId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ydr_pollfeatures
-- ----------------------------

-- ----------------------------
-- Table structure for ydr_risk
-- ----------------------------
DROP TABLE IF EXISTS `ydr_risk`;
CREATE TABLE `ydr_risk`  (
  `riskId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险描述',
  `relatedRisk` double NOT NULL COMMENT '相对风险值',
  `category` enum('life','work','family','diet','history','medicine') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属于哪一类',
  `bunch` int NOT NULL COMMENT '属于某一组,用于替换风险因素',
  `diseaseId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应哪个病',
  PRIMARY KEY (`riskId`) USING BTREE,
  INDEX `risk2disease`(`diseaseId` ASC) USING BTREE,
  CONSTRAINT `risk2disease` FOREIGN KEY (`diseaseId`) REFERENCES `ydr_disease` (`diseaseId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ydr_risk
-- ----------------------------
INSERT INTO `ydr_risk` VALUES ('00045fd5-40b6-4b55-bd0c-2ffc70814657', '适量维他命D摄入', -1, 'diet', 16, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('0078cc1e-d17b-4e2e-875a-db25c71f66e8', '仍在抽烟, >25支每天', 5, 'life', 1, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('01928c8a-34af-45a9-87fd-05ae3b751f36', '总体, 年龄 50-59岁', 0, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('03da5418-f961-4423-bc75-ba22b6f76df5', '戒烟<2年, 抽烟时15-25支每天', 5, 'life', 1, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('03fbe791-26d5-4ec6-9ce9-45efb120eab5', '粗粮摄入, ≥300g每天', 0.8, 'diet', 5, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('06a9e01a-c825-43f2-a9cb-fb3905453222', '生育1个或2个孩子', 1.3, 'history', 4, '356ca387-341c-485e-b827-4f3cf0427aa5');
INSERT INTO `ydr_risk` VALUES ('070ca5ef-1780-48d4-b516-a91278e623ef', '口服避孕药, ≥15年', 0.4, 'medicine', 10, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('0ae9321f-6a14-4151-84cd-440469151efe', 'A型血', 1.4, 'history', 7, 'c1190aa4-c4f5-4d24-bfa4-390e151a62c0');
INSERT INTO `ydr_risk` VALUES ('0b82d569-b2ce-4aad-acc9-e1c5f7d6f498', '母亲或姐妹有子宫癌', 1.5, 'family', 3, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('0b89d023-5037-4373-93e3-302c49432df2', '口服避孕药, 1-4年', 0.8, 'medicine', 10, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('0ba328e9-25e8-43b7-ae80-6817f1bfde98', '输卵管切除', 0.55, 'history', 7, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('0bed9230-db6c-400d-9f55-34fddbbe86dd', '他莫昔芬/拉罗昔芬 用药, 2-5年', 2, 'medicine', 18, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('0c710263-fcaa-456b-a030-da82360242e4', '糖尿病', 1, 'history', 10, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('0d1c1495-8497-4034-9641-56a7e69a18c7', '饮酒, 平均每天大于一瓶啤酒(500ml)/一两白酒 [每日酒精摄入≥14g]', 0.55, 'diet', 4, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('0efeb69b-f11a-4615-a7f2-48c3dec65f16', '在城市里生活, ≥10年', 1.2, 'life', 2, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('0f066436-d9ba-42c3-b496-ecbfaa1a292e', '糖尿病/高血糖症', 1.3, 'history', 13, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('0f309a7f-3e47-4a5d-8ee7-668f5133ede0', '女性, 使用雌激素', -1, 'history', 11, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('103cc74c-aff8-4506-80b5-d5e031614613', '咖啡, 每天 ≥ 2杯(500ml)', 1.5, 'diet', 4, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('10847b9d-58a3-4128-a429-61fdba7acaf4', '女性身高超过170cm, 男性身高超过178cm', 1.3, 'history', 8, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('13156406-0cc0-43bb-a241-1eca31789987', '绝经年龄≥55岁', 1.9, 'history', 7, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('14a66351-c08b-4da6-a603-467945e805ba', '总体, 年龄 <50岁', -4, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('14ade4af-e7df-4aac-bf03-ec61c42f95ed', '不吸烟, BMI 25-29.9', 1, 'history', 4, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('14ea3fa8-a8b4-4af7-8185-a53a361f8a13', '戒烟2-10年, 抽烟时<15支每天', 1.7, 'life', 1, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('171f8461-3f68-4d30-9309-62fa203bf821', 'BMI ≥30', 1.3, 'history', 6, '5717d096-f63d-440f-9f19-ee8289f3424c');
INSERT INTO `ydr_risk` VALUES ('191664d1-9d24-4726-913c-30c3fc9b46ef', '重度吸烟, 年龄 <50岁', -3, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('196b5b69-11f4-4665-b02b-96a6b300fd4f', '男性 <65 岁, BMI ≥30', 5, 'history', 13, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('199741ce-b22e-4413-a564-da06d1715a6e', '高密度脂蛋白胆固醇含量 <40(mg/dL)', 2.25, 'history', 20, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('1ab50a9e-d41a-4abd-92fa-ab3af6c83969', 'BMI>30', 1.5, 'history', 9, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('1acd6ca5-f776-466c-b316-ef48c93ef955', '雌激素使用, ≥10年', 1.4, 'medicine', 10, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('1e9a6c26-3dd0-4b71-9fe4-206f48ae1e77', '生育超过3个孩子', 2.3, 'history', 4, '356ca387-341c-485e-b827-4f3cf0427aa5');
INSERT INTO `ydr_risk` VALUES ('1f623b80-170a-452d-bf4e-04ef01151d23', '女性 <60 岁, BMI 25-26.9', 5, 'history', 10, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('1fd68d55-14d4-4910-97c1-ef8fc618644e', '直系亲属非髋部骨折史', 1, 'family', 4, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('207806ea-c296-471f-8092-5f98185b65c6', '轻度吸烟, 年龄 ≥70岁', 2, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('21c9e033-3283-4324-bb59-28b4fa0c3cff', '戒烟2-10年, 抽烟时>25支每天', 8, 'life', 1, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('22d24c37-45ad-4077-b6fb-6f7d74f0161e', '重度吸烟, 年龄 60-69岁', 2, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('2308dca9-e264-45ed-995f-b2c04d57be68', 'BMI ≥40', 2.75, 'history', 7, 'c23c042e-5743-4822-b5a9-8f0043cdfcb0');
INSERT INTO `ydr_risk` VALUES ('23a33d76-90a2-4b2b-bf6e-96b7876c48b5', '仍在抽烟, 15-25支每天', 2.25, 'life', 1, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('24950736-69fe-4f52-a395-02d190bfbcd2', '仍在抽烟', 2.3, 'life', 1, '356ca387-341c-485e-b827-4f3cf0427aa5');
INSERT INTO `ydr_risk` VALUES ('2514d74e-2912-465c-9ffe-c91c6f2064fe', '平均每天摄入至少8两(400g)蔬菜/水果', 0.8, 'diet', 4, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('2567e3b1-1d1d-4c16-adc4-537dd057d501', '不吸烟, 最大呼气中期流量(MMEF) < 48(ml/sec)', 2, 'history', 7, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('267ea6ec-0dc6-42cc-83b5-473f7d85671f', 'BMI 25-29.9', 1.1, 'history', 2, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('26f680bc-470a-48a2-80a2-8e28ebde848a', '重度吸烟, 最大呼气中期流量(MMEF) < 48(ml/sec)', 2, 'history', 7, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('2a74e14c-eb53-4108-ac10-3e61fc03d011', 'BMI ≥ 30', 1.3, 'history', 5, 'e538bdae-31e7-4cf1-8d17-8921cccd9eca');
INSERT INTO `ydr_risk` VALUES ('2aaf0ac8-03c2-4152-9f78-276c8f6da548', '男性性伴侣, ≥6个', 3, 'life', 3, '356ca387-341c-485e-b827-4f3cf0427aa5');
INSERT INTO `ydr_risk` VALUES ('2c897ebb-cf67-4b0f-b9e7-ed826a82c4ec', '绝经年龄≥55岁', 1.2, 'history', 12, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('2e37290d-462b-4fc1-9a94-a2fe0cec8334', '重度吸烟, 年龄 50-59岁', 0, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('30d33c35-e45a-4680-a0ea-348484fc97cd', '未生育', 1.2, 'history', 6, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('31e3a834-b935-4a3b-8a67-d4957d284c87', '糖尿病/高血糖症', 2, 'history', 4, 'c1190aa4-c4f5-4d24-bfa4-390e151a62c0');
INSERT INTO `ydr_risk` VALUES ('3306b4f6-de0d-49ab-92a5-f9caeb651b23', '仍在抽烟, 15-25支每天', 2.3, 'life', 1, '767b8544-3110-43c8-b12a-88af9cb6bc97');
INSERT INTO `ydr_risk` VALUES ('3453448c-54cf-4966-8b3a-a316979ee460', '仍在抽烟, <15支每天', 1.3, 'life', 1, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('34927815-9dfe-47e7-9c7d-8cb8ce9710c9', '幽门螺旋杆菌感染 -- 未治疗', 6, 'history', 7, 'e538bdae-31e7-4cf1-8d17-8921cccd9eca');
INSERT INTO `ydr_risk` VALUES ('354fdb85-3822-4dbc-a0ec-3aceae358fa0', '父亲或兄弟有前列腺癌', 1.8, 'family', 2, '5717d096-f63d-440f-9f19-ee8289f3424c');
INSERT INTO `ydr_risk` VALUES ('36e8e5f6-e326-4a37-bc15-0eaa7a67dac5', '轻度吸烟, 癌胚抗原(CEA) >7.0 (ng/ml)', 5, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('37b2f887-9dce-46af-a2ce-32a1c6944442', '口服避孕药, 5-9年', 0.6, 'medicine', 10, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('38142d8b-300a-4f36-887a-47258232b91b', '仍在抽烟, ≥15支每天', 2.25, 'life', 1, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('3862ef14-0432-43d2-9398-5c28732a9174', '饮酒, 平均每天大于一瓶啤酒(500ml)/一两白酒 [每日酒精摄入≥14g]', 0.7, 'diet', 3, 'c23c042e-5743-4822-b5a9-8f0043cdfcb0');
INSERT INTO `ydr_risk` VALUES ('399c6a53-02e0-4b8c-88c0-d7a206821b42', '总胆固醇含量 160-199(mg/dL)', 1.3, 'history', 19, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('39b17b07-4f91-4bb5-9135-bda708f3f469', '维生素补剂, 摄入超过12年', 0.8, 'medicine', 15, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('3a40ae84-3f5c-4f44-9128-18ba7853dc15', '不吸烟, 男性', 1, 'history', 5, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('3a9a8987-570c-4dca-9134-1ea74d8ca7c7', '无保护工作暴露，橡胶/铝/芳香族, ≥20年', 5, 'work', 2, '767b8544-3110-43c8-b12a-88af9cb6bc97');
INSERT INTO `ydr_risk` VALUES ('3b422fb3-7912-4289-afb1-2e2f2767db47', 'AB型血', 1.5, 'history', 7, 'c1190aa4-c4f5-4d24-bfa4-390e151a62c0');
INSERT INTO `ydr_risk` VALUES ('3d859d49-efb9-4dc6-bce2-e53f08ffb09b', '口服避孕药, ≥5年', 0.5, 'medicine', 9, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('3ef8cbb3-ebad-43f1-a05f-8711ade57df0', '总体, 最大呼气中期流量(MMEF) 49-103(ml/sec)', 1, 'history', 7, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('3f6d52b8-98f5-4c3c-a2d6-811992a87c49', '7岁时超重 (BMI>29)', 0.7, 'history', 7, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('3ff160b9-c16d-4f36-a327-7b5db0264f97', '饱和脂肪摄入, ≥10g每天', 1.3, 'diet', 8, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('4087726f-edac-44e9-8e16-ea9ac1ff526e', '双臂上有黑痣, ≥11颗', 4.8, 'history', 4, '62170376-908a-458d-8acd-7bb525385258');
INSERT INTO `ydr_risk` VALUES ('411828c9-e363-492f-b478-ad5da5167df5', 'BMI ≥30', 1.3, 'history', 2, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('427130ab-8200-4317-ab8e-38e0b56118b8', '轻度吸烟, 年龄 50-59岁', 0, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('430a91f3-0910-4794-add4-295a96ddc323', '精制谷物, ≥300g每天', 1.3, 'diet', 6, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('4350a2d4-e02c-496a-99b2-664d1a6e7a63', '不吸烟, 癌胚抗原(CEA) 1.5-2.5 (ng/ml)', 1, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('441a38c8-22b3-45f8-883e-496e0261c4b9', '不吸烟, BMI<25', 2, 'history', 4, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('44918cd6-c11e-4c34-a903-b7eec3c424bf', '女性, 腰围 > 35尺', 1.3, 'history', 7, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('46b676e4-afc6-48ec-9b33-fc904579e807', '重度吸烟, 癌胚抗原(CEA) 2.6-4.2 (ng/ml)', 1, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('47a0b869-0cb6-4254-bcf6-15b7ad242833', '幽门螺旋杆菌感染 -- 已治愈', 1.5, 'history', 7, 'e538bdae-31e7-4cf1-8d17-8921cccd9eca');
INSERT INTO `ydr_risk` VALUES ('47a813ec-3dc1-45a5-adb8-7d99fc08cbe1', '单/多不饱和脂肪, ≥25g每周', 0.8, 'diet', 10, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('48139b13-0598-40d4-930e-b163476c8baf', '深加工肉类 (香肠、烟熏肉等) 每周摄入≥250g', 1.2, 'diet', 4, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('49ace8ab-f6bb-402e-9c3d-0f299c5899a1', 'BMI 30-34.9', 1.5, 'history', 7, 'c23c042e-5743-4822-b5a9-8f0043cdfcb0');
INSERT INTO `ydr_risk` VALUES ('4b7b73c3-a8de-4602-b9c2-011ae1b13dd7', '仍在抽烟, >25支每天', 5, 'life', 1, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('4c476979-19e7-472c-8c0f-92dd1be4393f', '粗粮摄入, ≥300g每天', 0.55, 'diet', 5, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('4c910280-7896-4771-92f6-a31db3d0e977', '戒烟2-10年, 抽烟时15-25支每天', 4, 'life', 1, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('50399daf-ff06-4f15-843e-6e47aa46e304', '仍在抽烟', 1.6, 'life', 1, 'e538bdae-31e7-4cf1-8d17-8921cccd9eca');
INSERT INTO `ydr_risk` VALUES ('505cbba1-a9da-4493-85ab-d23399bc770f', '他莫昔芬 用药, ≥5年', 3.3, 'medicine', 11, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('5138c881-3270-419f-a33f-ce37801622f3', '总胆固醇含量 200-239(mg/dL)', 2.25, 'history', 19, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('52260315-b669-4964-a4da-222d0d74162f', '子宫内膜异位', 1.5, 'history', 8, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('5232a18b-913d-42b9-bda0-fb9f90a8d9f2', '总胆固醇含量 240-279(mg/dL)', 5, 'history', 19, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('52644cd0-e952-4283-b0be-472c9f430f06', '双臂上有黑痣, 1-5颗', 1.4, 'history', 4, '62170376-908a-458d-8acd-7bb525385258');
INSERT INTO `ydr_risk` VALUES ('536425d4-c4b7-4040-bf3a-726c1da952e4', 'BMI 35-39.9', 2, 'history', 7, 'c23c042e-5743-4822-b5a9-8f0043cdfcb0');
INSERT INTO `ydr_risk` VALUES ('54a959ff-5087-4a01-8969-0449323e4a8e', '维他命复合B 摄入', 0.8, 'medicine', 21, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('54beedc5-6b80-4dee-a1e6-a5df3aadb350', '戒烟超过一年, 吸烟时 <15包每年', 0, 'life', 1, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('54e4948f-718c-4850-a1ee-1c2f60c0a431', '出生时体重超过7斤半(3.8kg)', 1.5, 'history', 6, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('559d209a-93d7-4b5d-8089-b0c8abc0693d', '女性, 口服类固醇', 1, 'history', 12, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('56d76476-f964-4984-b78e-e120ce19d3e6', '戒烟, <20年', 1.2, 'life', 1, 'e538bdae-31e7-4cf1-8d17-8921cccd9eca');
INSERT INTO `ydr_risk` VALUES ('58efb7e5-d961-48ea-a593-9266624bdbfa', '无保护工作暴露，橡胶/铝/芳香族, 5-20年', 2.5, 'work', 2, '767b8544-3110-43c8-b12a-88af9cb6bc97');
INSERT INTO `ydr_risk` VALUES ('5ae49f28-9153-4d11-a09b-23531e64c648', '鱼类(生重), 1斤(500g)每周', 0.55, 'diet', 4, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('5af8df0e-ba0c-4570-94ee-31facba7ebf4', '男性 ≥65 岁, 腰围 > 40尺', 7, 'history', 14, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('5b15f45d-bfcd-41a9-9162-8ca7f0456270', '仍在抽烟, <1包每天', 1, 'life', 1, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('5bd45c74-6ab9-462a-9e23-a9a4735b07ac', '女性 ≥60 岁, 腰围 > 35尺', 2.25, 'history', 16, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('5d45163a-2cce-4ca1-ad05-c93e4dc7b53c', '不吸烟, 癌胚抗原(CEA) >7.0 (ng/ml)', 8, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('5d736e2e-3000-4b03-aa6e-5c3944b7a368', '过量盐/钠摄入', 1.6, 'diet', 4, 'e538bdae-31e7-4cf1-8d17-8921cccd9eca');
INSERT INTO `ydr_risk` VALUES ('5f2705ee-686f-4b3d-a611-1eb2da23a274', '轻度吸烟, 年龄 <50岁', -5, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('5f75a188-5f68-4427-bcea-18fc2e323331', '仍在抽烟, >25支每天', 2, 'life', 1, 'c23c042e-5743-4822-b5a9-8f0043cdfcb0');
INSERT INTO `ydr_risk` VALUES ('5fc9d20b-a548-413f-ba76-8e078f648b78', '骨折病史', 2, 'history', 5, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('5ff4dbbe-eb56-4d5f-a0cb-1db28e2ce64d', '雌激素使用, ≥5年', 0.8, 'medicine', 12, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('6000c3a0-d087-4bc3-b317-b85706a8d7aa', '总体, 最大呼气中期流量(MMEF) < 48(ml/sec)', 2, 'history', 7, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('6118976f-c7b5-4676-99c1-33624e3449e0', '男性身高超过178cm', 1.3, 'history', 5, '5717d096-f63d-440f-9f19-ee8289f3424c');
INSERT INTO `ydr_risk` VALUES ('62a876e0-1f71-40a8-a553-f918ed585f8b', '母亲或姐妹有卵巢癌', 1.8, 'family', 1, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('62d640e4-1a75-4197-ad31-9c8cc7b359c9', '总体, BMI<25', 2, 'history', 4, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('62dcc255-4e91-4085-a028-dcd7c4ac78f5', '维他命D摄入, 每日保证', 0.6, 'medicine', 16, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('63c16c28-d129-4424-b1db-ccaef500fb6d', '仍在抽烟, <25支每天', 1.3, 'life', 1, 'c1190aa4-c4f5-4d24-bfa4-390e151a62c0');
INSERT INTO `ydr_risk` VALUES ('6456be65-7e10-4f4f-a616-8f5b7b5692fd', 'B型血', 1.5, 'history', 7, 'c1190aa4-c4f5-4d24-bfa4-390e151a62c0');
INSERT INTO `ydr_risk` VALUES ('65e5fd23-f999-421a-8dc3-07caf71db07d', '重度吸烟, BMI 25-29.9', 2, 'history', 4, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('665be0fe-4877-41e3-a572-e4678475af07', '父母或兄弟姐妹有胰腺癌', 1.5, 'family', 2, 'c1190aa4-c4f5-4d24-bfa4-390e151a62c0');
INSERT INTO `ydr_risk` VALUES ('688647a7-8593-4c92-8569-54991345d23d', '饮酒, 平均每天大于两瓶啤酒(1000ml)/二两白酒 [每日酒精摄入≥28g]', 1.4, 'diet', 5, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('68de5674-d8a0-48a8-ae71-721dbbc17015', '亚裔', 0.4, 'history', 7, '5717d096-f63d-440f-9f19-ee8289f3424c');
INSERT INTO `ydr_risk` VALUES ('68f52bda-433f-4a40-8737-60d1237037dd', '体育锻炼, 至少每天30分钟 或 每周3小时', 0.8, 'life', 2, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('6a628d04-f02e-476f-b39d-0e0cd5196714', '重度吸烟, 最大呼气中期流量(MMEF) 49-103(ml/sec)', 1, 'history', 7, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('6a76a267-f058-45dd-90f1-f9d53d2d9d2a', '重度吸烟, 癌胚抗原(CEA) 1.5-2.5 (ng/ml)', 0, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('6b422794-fc63-4fe6-b1b8-6579bde4c8f1', '不吸烟, 年龄 ≥70岁', 3, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('6b646120-2051-4cfe-8be3-1c0becb4b4e8', 'BMI 35-39.9', 4, 'history', 5, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('6d196135-1881-4269-b023-2a01c72c9056', '饮酒, 平均每天大于四瓶啤酒(2000ml)/四两白酒 [每日酒精摄入≥56g]', 1.2, 'diet', 3, 'e538bdae-31e7-4cf1-8d17-8921cccd9eca');
INSERT INTO `ydr_risk` VALUES ('6e6443f8-94ae-4071-ad36-69ce51b199a1', '幼时有经常晒伤经历', 3, 'life', 1, '62170376-908a-458d-8acd-7bb525385258');
INSERT INTO `ydr_risk` VALUES ('6f0e37ab-303b-406d-9c08-6ed55978ad60', '平均每天摄入至少8两(400g)蔬菜/水果', 0.8, 'diet', 6, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('6f585de8-31c9-4af3-9ebb-f972d909aea8', '子宫切除', 1.3, 'history', 6, 'c23c042e-5743-4822-b5a9-8f0043cdfcb0');
INSERT INTO `ydr_risk` VALUES ('7318c113-cad5-4ab0-bb81-26528eafd553', '体育锻炼, 至少每天30分钟 或 每周3小时', 0.6, 'life', 2, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('73b77d72-9be5-4e3a-aaa6-cb95122c3b53', '轻度吸烟, 男性', 2, 'history', 5, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('73ddafcb-b4cb-4ad4-9179-9c3b93234a0d', '糖尿病/高血糖症', 1.5, 'history', 8, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('7405e503-40d2-4639-bf62-dda0da84d3ff', '总体, 癌胚抗原(CEA) >7.0 (ng/ml)', 5, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('74590c3f-11af-4896-bcf5-53f99aa332d8', '总体, 甲胎蛋白(AFP) ≥ 1.8ng/ml', 1, 'history', 6, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('75337cf7-cb7b-42d5-b998-c1cb9210cac3', 'BMI ≥30', 1.5, 'history', 5, 'c1190aa4-c4f5-4d24-bfa4-390e151a62c0');
INSERT INTO `ydr_risk` VALUES ('755afae4-752e-4ddb-9d10-626f894b5d63', '钙摄入量不足', 1, 'diet', 12, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('76065c1d-9a99-43ff-a627-7ff1c5bf4725', '男性, 口服类固醇', 2, 'history', 11, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('7721e6e3-0308-48c6-bceb-8d4c923edcfc', '戒烟>10年, 抽烟时<15支每天', 1.5, 'life', 1, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('7740e802-a2dd-4fc8-93db-becb6b55ae61', '年龄50-69岁, 每日服用阿司匹林', 0.8, 'medicine', 22, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('784d0953-785d-4c0f-8acb-f5ffaae0704c', '雌激素+孕酮 使用, ≥5年', 2.3, 'medicine', 16, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('78a9b5d8-8fb3-4dee-acc0-dec09dc00f20', '高血压', 2.3, 'history', 5, 'c23c042e-5743-4822-b5a9-8f0043cdfcb0');
INSERT INTO `ydr_risk` VALUES ('7d5ab20a-c777-4980-99d7-f9aca71b8a09', '粗粮摄入, ≥300g每天', 0.55, 'diet', 6, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('7df68bc2-48c0-4c11-b6f6-ae7aee17c261', '定期肠镜检查(50岁后)', 0.67, 'history', 14, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('7e39a631-7baf-418e-bc05-1352983369d1', '单/多不饱和脂肪, ≥25g每周', 0.8, 'diet', 7, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('7eb26367-0db0-4121-984a-ef475203bcf0', '不吸烟, 甲胎蛋白(AFP) ≥ 1.8ng/ml', 1, 'history', 6, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('7ebad92d-e479-4a15-8ea6-641382d9a4db', '仍在抽烟, <15包每年', 1, 'life', 1, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('7fd90735-fb28-4288-b8de-4395b28fbae4', '仍在抽烟, <15支每天', 2, 'life', 1, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('81896a08-f668-4aff-b170-cd8f35f44cda', '仍在抽烟, <15支每天', 1.3, 'life', 1, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('8250f4c5-4114-4b5c-95db-73991a210a14', '仍在抽烟, 15-30包每年', 2, 'life', 1, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('8387e731-b916-4b78-806f-14730bef906a', '男性 ≥60 岁, 腰围 > 40尺', 7, 'history', 11, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('83b51f6f-caf6-44ca-955f-96194d9a347b', '无保护工作暴露, 铬/金粉/煤粉/其他矿物粉尘/焊接烟尘, >20年', 1.2, 'work', 3, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('83b57c24-e773-42cc-95f6-438068ffdce9', '坚果摄入, ≥90g每周', 0.8, 'diet', 7, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('8515e7be-45cd-4bf8-9f3d-a254b71be0cb', '体育锻炼, 至少每天30分钟 或 每周3小时', 0.55, 'life', 2, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('86b51407-a2e1-44e4-add2-6540ed8c48f1', '总体, 癌胚抗原(CEA) 1.5-2.5 (ng/ml)', 1, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('86ff9781-4a8a-497c-8de4-265b3bfc53c9', '子宫切除', 0.8, 'history', 6, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('86ffd238-b429-4626-887f-3d041fd76788', '高血压', 2.25, 'history', 17, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('881abc3f-d8a3-4b7b-b900-9d9e6b4ed21b', '戒烟超过一年, 吸烟时 <1包每天', 0, 'life', 1, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('8a153acd-f724-4c2c-a500-2e212a85d529', '仍在抽烟, ≥1包每天', 2, 'life', 1, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('8a18825b-127f-4f03-9328-24696de1b32b', '仍在抽烟', 1.3, 'life', 1, '5717d096-f63d-440f-9f19-ee8289f3424c');
INSERT INTO `ydr_risk` VALUES ('8a31058e-2d57-4645-a0da-fb3a0ea6ea75', '仍在抽烟,15-25支每天', 1.3, 'life', 1, 'c23c042e-5743-4822-b5a9-8f0043cdfcb0');
INSERT INTO `ydr_risk` VALUES ('8bf316fa-809b-44d1-8051-1131ddea984b', '轻度吸烟, 甲胎蛋白(AFP) ≥ 1.8ng/ml', 2, 'history', 6, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('8c60e873-f66e-4824-b573-6d10e45216d4', '不吸烟, 直系亲属有肺癌史', 1, 'family', 2, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('8d77c26a-a6f9-4fd6-8fe3-a1620a459fda', '母亲或姐妹有乳腺癌', 1.8, 'family', 3, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('8e65db36-ce63-41d5-8d06-1879cc914685', '直系亲属髋部骨折史', 2, 'family', 4, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('8ea2d176-56c0-4cb9-94cd-4ab6252ebe89', '口服避孕药, ≥5年', 0.7, 'medicine', 11, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('8eb2cb6f-5c1e-49a4-b17f-1816ddfb2e66', '女性, 骨密度检测, 骨质疏松症', 2, 'history', 6, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('8ecfc9b9-1fbb-4533-8285-dd51c5a835f7', 'BMI ≥40', 6.5, 'history', 5, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('8f21eab2-97e6-41f7-b7b0-a4c2b924a959', '女性, <50岁, 骨密度检测, 骨量减少', 2, 'history', 6, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('8fab5187-249e-4778-b1c5-8d08133c50f7', 'HPV检查阳性', 16, 'history', 7, '356ca387-341c-485e-b827-4f3cf0427aa5');
INSERT INTO `ydr_risk` VALUES ('8faf6549-e0b2-468c-a713-48956e723c88', '男性 <60 岁, BMI 23-24.9', 2.25, 'history', 9, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('8fbc748e-4c1e-43c0-b724-ba7d97602a17', '他莫昔芬/拉罗昔芬 用药, ≥5年', 0.6, 'medicine', 18, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('9011e432-8574-401f-b9d6-84f8372b340b', '总胆固醇含量 ≥(mg/dL)', 1.3, 'history', 11, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('90f0d714-eab7-449e-920c-fe497a8553e2', '仍在抽烟, 15-25支每天', 2.25, 'life', 1, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('9388ff86-1047-4a5d-b6a0-84137a399f71', '戒烟>10年, 抽烟时>25支每天', 5, 'life', 1, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('94500d9a-8d3d-4dc2-acba-da35d1658fa3', '慢性肠道疾病 ≥10年', 1.5, 'history', 10, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('946cdd44-2916-4ebf-a4d8-a76e32a10c3b', 'A型血', 1.2, 'history', 6, 'e538bdae-31e7-4cf1-8d17-8921cccd9eca');
INSERT INTO `ydr_risk` VALUES ('94fd546f-902b-474c-be9f-7af164e2d6c9', '至少生育2次', 0.85, 'history', 9, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('9592ae96-d5a5-48e0-94ff-8e8ed82691ce', '生殖器滑石粉使用, 每月至少8天', 1.3, 'history', 9, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('96f1fca1-31ac-4d06-8e5e-8c8a87718b1b', '仍在抽烟, <15支每天', 1.3, 'life', 1, '767b8544-3110-43c8-b12a-88af9cb6bc97');
INSERT INTO `ydr_risk` VALUES ('97aec29b-b8fa-49e4-a679-db485db78162', '生育至少2个孩子', 0.52, 'history', 3, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('99198798-d76b-4497-b1f7-976d77c188ad', '仍在抽烟/曾经抽烟, ≥40包/年', 1.5, 'life', 1, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('9b0c49fc-00fc-4636-b625-199dd9b55c7a', '重度吸烟, 癌胚抗原(CEA) >7.0 (ng/ml)', 2, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('9b3ad994-5c81-42c2-a5e3-949b334b1bf1', '父母或兄弟姐妹有黑色素瘤', 2, 'family', 3, '62170376-908a-458d-8acd-7bb525385258');
INSERT INTO `ydr_risk` VALUES ('9e6bde13-f6f4-491d-abcb-b4171f4aa6e4', '仍在抽烟,男性', 2, 'life', 2, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('9e8f1ca6-9159-4c62-b993-c7809b93ee02', '直系亲属患有心血管疾病', 2.25, 'family', 3, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('9ea8262d-a358-47a0-b3f4-c09fc88c465a', '女性 <60 岁, BMI 23-24.9', 2.25, 'history', 10, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('9f297f25-78e8-47db-9767-b4c327a43110', '饮酒, 平均每天约半瓶啤酒(250ml)/少许白酒(<1两) [每日酒精摄入约7g]', 0.8, 'diet', 3, 'c23c042e-5743-4822-b5a9-8f0043cdfcb0');
INSERT INTO `ydr_risk` VALUES ('9f82b980-88a2-4b0d-ba7e-cc02bc97cd8c', 'BMI 25-29.9', 1.6, 'history', 5, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('9fba3473-dc33-4bf9-ad3a-41732d1cd910', '戒烟<10年', 1.3, 'life', 1, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('9fca78ce-b5c7-4a35-aa27-d0a49fd42be8', '绿叶菜摄入, 每周≥300g', -1, 'diet', 13, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('a0775eb5-5cbc-4b31-a0e5-70fa6187b355', '11岁及之前初潮', 1.3, 'history', 8, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('a1401eb3-c989-4121-9eb0-48428e31f771', '口服避孕药, 10-14年', 0.5, 'medicine', 10, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('a20ecb65-87d7-40df-8552-d074b3013c45', '女性 <60 岁, BMI 25-28.9', 2.25, 'history', 15, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('a221f13b-8b9b-45c4-be2f-1bd4c022aea9', '粗粮摄入, ≥300g每天', 0.8, 'diet', 7, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('a2813b44-c116-4872-a20b-89cad16fb2b1', '第一次使用晒黑床(日光浴床)<35岁', 1.9, 'life', 2, '62170376-908a-458d-8acd-7bb525385258');
INSERT INTO `ydr_risk` VALUES ('a30e0d83-4c0d-4e14-890a-b3d68f2a28af', '男性性伴侣, 2-5个', 2, 'life', 3, '356ca387-341c-485e-b827-4f3cf0427aa5');
INSERT INTO `ydr_risk` VALUES ('a39b52f0-952c-4a07-82cb-fac8e90f67f0', '女性身高超过170cm, 男性身高超过178cm', 1.7, 'history', 3, 'c1190aa4-c4f5-4d24-bfa4-390e151a62c0');
INSERT INTO `ydr_risk` VALUES ('a3c8bd72-1550-42bd-a42f-5006862bf42d', '女性 <60 岁, BMI ≥29', 5, 'history', 15, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('a46df9bb-bb60-42d3-9e41-1e2b22ce6ea4', '不吸烟, 年龄 50-59岁', 0, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('a479f1ae-dbba-49fe-91b6-6346a2a5c9e1', '饮酒, 平均每天约一瓶啤酒(500ml)/一两白酒 [每日酒精摄入约14g]', 1.2, 'diet', 5, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('a541ab0b-9329-4e18-ad74-d8caa7efba55', '糖尿病', 2.25, 'history', 10, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('a5434642-1042-45c1-9e97-35442d57d0be', '长期二手烟暴露(不抽烟者)', 1.3, 'life', 1, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('a5eda872-e73d-4f6e-b429-d44008459fe3', '总胆固醇含量 ≥280(mg/dL)', 7, 'history', 19, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('a7862a95-28ac-49a1-b706-4575b4404407', '男性 <65 岁, BMI 25-29.9', 2.25, 'history', 13, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('a7deea9d-ddb8-4a5d-9b84-0169bf4885a2', '总体, 直系亲属有肺癌史', 1, 'family', 2, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('a8a6c0ea-5f12-4c42-b3a6-9dca69841d90', 'BMI 25-29.9', 1.2, 'history', 5, 'c1190aa4-c4f5-4d24-bfa4-390e151a62c0');
INSERT INTO `ydr_risk` VALUES ('a8cc7513-633e-4db8-a4ba-15b902ed14c0', '总体, 年龄 ≥70岁', 3, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('a9b414e0-b01f-4b5c-8939-80ba15c2f1d2', '父母或兄弟姐妹有胃癌', 1.5, 'family', 2, 'e538bdae-31e7-4cf1-8d17-8921cccd9eca');
INSERT INTO `ydr_risk` VALUES ('a9d65a2b-4071-422a-b043-48a24bbc8f6b', '反式脂肪摄入, ≥25g每周', 1.3, 'diet', 9, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('a9fbd959-b4c7-42c3-b7b7-5839fe345ec0', '首次生育>35岁', 1.5, 'history', 10, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('ab7a014a-5190-4421-83d6-b5038d29425d', '饮酒, 平均每天大于一瓶啤酒(500ml)/一两白酒 [每日酒精摄入≥14g]', 0.55, 'diet', 11, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('ac979e91-3b29-4261-ab2a-7ec77ab77387', '轻度吸烟, 癌胚抗原(CEA) 1.5-2.5 (ng/ml)', 1, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('af12884c-09c3-4e56-a2ef-27da34a33030', '戒烟<2年, 抽烟时>25支每天', 10, 'life', 1, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('af6dfcac-28ef-44b6-b246-d3bbce385252', '男性, <50岁, 骨密度检测, 骨量减少', 2, 'history', 7, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('af7dddcf-e63c-49ea-b8d4-8ce461492ad1', '饮酒, 平均每天大于两瓶啤酒(1000ml)/二两白酒 [每日酒精摄入≥28g]', 1, 'diet', 14, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('b16222ea-da7a-400b-88f0-2d566c9a4a47', '平均每天摄入至少8两(400g)蔬菜/水果', 0.55, 'diet', 5, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('b279b18a-3066-4f51-89c5-2a04f5e0b116', '身高超过170cm', 1.3, 'history', 13, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('b32fb59d-8792-4d16-892b-4eb833d29f6d', '雌激素+孕酮 使用, <5年', 1.3, 'medicine', 16, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('b423f722-9ff3-4f76-84f0-7bfccf9b9193', '直系亲属有中风史', 2.25, 'family', 3, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('b49486c3-1138-406c-8651-488b9e3589f3', '过量钙摄入', 1.3, 'diet', 4, '5717d096-f63d-440f-9f19-ee8289f3424c');
INSERT INTO `ydr_risk` VALUES ('b4c8a2bd-21ab-4f35-9eac-3d2973a834ed', '平均每天摄入至少8两(400g)蔬菜/水果', 0.8, 'diet', 4, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('b607908d-9add-490d-ae47-f2d52224be35', '核磁共振，乳房高密度', 3, 'medicine', 17, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('b6cb7139-4730-449a-8dc9-f990711f796f', '男性 <60 岁, BMI ≥30', 7, 'history', 9, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('b789662f-196a-4338-8cb7-98c7edec556b', '仍在抽烟, ≥25支每天', 0.7, 'life', 1, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('b789df8c-825a-4306-9e95-f0c27ab8262e', '父母或兄弟姐妹患有膀胱癌', 1.5, 'family', 3, '767b8544-3110-43c8-b12a-88af9cb6bc97');
INSERT INTO `ydr_risk` VALUES ('b7e941b8-b60d-4c81-b81a-60e9bd180378', '长期服用阿司匹林, 2片/周(600mg), ≥6年', 0.8, 'medicine', 17, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('b836b584-fc55-4e14-8a23-4cf4ee706639', 'BMI 30-34.9', 2.5, 'history', 5, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('b87e8f9d-117c-4963-93b2-f3316fbc557d', '不吸烟, 年龄 60-69岁', 2, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('b8f1bf2a-1a94-4f2c-99e7-b9e1797c8f7a', '重度吸烟, 癌胚抗原(CEA) 4.3-7.0 (ng/ml)', 2, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('bbd8e2b2-a6bc-4ad4-891d-a25c522135b4', '亚裔', 2.25, 'history', 8, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('be44fe00-139a-4da5-b43a-397e2b1552c4', '戒烟<2年, 抽烟时<15支每天', 2, 'life', 1, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('bf0cfade-1c82-4579-9232-02bc6972b009', 'α-1 抗胰蛋白酶缺乏症', 10, 'diet', 5, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('bf6e853c-1ab8-4189-b78d-e5a9396c72c4', 'BMI < 18', 2, 'history', 8, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('bf926655-0fd2-4d07-ae8d-6520a432183b', '仍在抽烟, >25支每天', 3, 'life', 1, '767b8544-3110-43c8-b12a-88af9cb6bc97');
INSERT INTO `ydr_risk` VALUES ('c0a1840e-eb54-42df-9386-b9b284e978fa', '免疫抑制药物史', 2, 'medicine', 5, '62170376-908a-458d-8acd-7bb525385258');
INSERT INTO `ydr_risk` VALUES ('c0be87b2-8d7f-46d4-9f2e-8d98816e74ee', '总体, BMI 25-29.9', 2, 'history', 4, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('c0f28d9f-b7cb-462b-b8c9-f66810efcc4d', '男性, ≥50岁, 骨密度检测, 骨量减少', 1, 'history', 7, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('c170ab56-23c7-42c5-98f0-ef7613558884', 'HPV 疫苗注射', 0.25, 'medicine', 8, '356ca387-341c-485e-b827-4f3cf0427aa5');
INSERT INTO `ydr_risk` VALUES ('c1cf2b19-844c-412c-ba17-2986d8d16c8f', '轻度吸烟, 年龄 60-69岁', 2, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('c3361471-93d4-4409-9e38-abc6d371d1db', '轻度吸烟, 癌胚抗原(CEA) 4.3-7.0 (ng/ml)', 2, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('c84cbbce-22f4-4cc4-925a-7f76e521c01c', '仍在抽烟, >25支每天', 10, 'life', 1, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('c9e57934-e941-42be-8edd-abe0e8f1903b', '患有一种或多种性传播疾病(淋病、梅毒、疣等)', 2, 'history', 6, '356ca387-341c-485e-b827-4f3cf0427aa5');
INSERT INTO `ydr_risk` VALUES ('ca4a775d-81ca-4df8-be58-8f5a7ccdba6b', '男性, 骨密度检测, 骨质疏松症', 2, 'history', 7, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('cbb7d8e5-03e7-47f3-9e48-6ef875daf7df', '糖尿病', 2.25, 'history', 18, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('cdc382ca-5245-4342-ae44-fd9b321d1a52', '总体, 癌胚抗原(CEA) 2.6-4.2 (ng/ml)', 2, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('d30cb3e1-7a8b-4f07-a849-4f389af0dd98', '类风湿性关节炎', 2, 'history', 9, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('d366e43f-7d4d-40e1-9afb-f6e309116c1c', '饮酒, 平均每天大于两瓶啤酒(1000ml)/二两白酒 [每日酒精摄入≥28g]', 1.3, 'diet', 5, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('d3f34a12-14a4-4ed3-a670-6abf72ae4f2a', '仍在抽烟, <15支每天', 1.3, 'life', 1, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('d57deb79-dca8-4882-b78c-d643a0e24a67', '过去3-5年内做过巴氏涂片或HPV检查', 0.5, 'history', 5, '356ca387-341c-485e-b827-4f3cf0427aa5');
INSERT INTO `ydr_risk` VALUES ('d6646b44-726e-4329-a1ea-b794533f85f5', '仍在抽烟, 15-25支每天', 5, 'life', 1, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('d81664a7-e9e4-41d5-97e8-efab57de118d', '体育锻炼, 至少每天30分钟 或 每周3小时', 0.8, 'life', 2, '24a2e454-3539-4f83-a7e7-fd77533687cf');
INSERT INTO `ydr_risk` VALUES ('d907a02d-67c5-44e2-a70d-c0e3275480df', '结扎输卵管', 0.6, 'history', 5, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('da4715e5-3a08-42a6-ba89-d12f68b3b876', '戒烟>10年, 抽烟时15-25支每天', 2.5, 'life', 1, '18dea5f1-0c72-4543-932b-055b7832d40a');
INSERT INTO `ydr_risk` VALUES ('daa617fe-723e-4e26-8b07-e9046221b29a', '体育锻炼, 至少每天30分钟 或 每周3小时', 0.55, 'life', 2, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('dab61a1b-708b-4bbf-9f19-71680c5c0b39', '高血压', 2.25, 'history', 9, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('dafb0d41-5b18-4afa-9bac-9ce57f01b349', '重度吸烟, BMI<25', 2, 'history', 4, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('db152c31-25ab-4eec-ab16-88748baac8df', '戒烟超过一年, 吸烟时 ≥1包每天', 1, 'life', 1, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('db55a4db-1469-457e-aaaa-91f172bffd21', '戒烟超过一年, 吸烟时 15-30包每年', 1, 'life', 1, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('dc451a66-e725-415e-b474-39cb7548fec3', '自18岁之后, 体重增加, ≥20kg (不考虑雌激素作用)', 1.99, 'history', 14, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('de125cb3-a7a6-49e3-97c7-1e48623026b0', '饮酒, 平均每天约半瓶啤酒(250ml)/少许白酒(<1两) [每日酒精摄入约7g]', 1.1, 'diet', 5, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('decd439a-ed13-4864-adf7-c524798dac7b', '直系亲属患有糖尿病', 2.25, 'family', 3, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('df5cac0d-7973-4c3c-97db-0953fdca241a', '男性', 2.25, 'history', 12, '446423bc-0ae0-4e12-a2de-5b2ccd05c8d3');
INSERT INTO `ydr_risk` VALUES ('df644d17-43f8-47dd-a84b-d007702cf1f4', '不吸烟, 癌胚抗原(CEA) 4.3-7.0 (ng/ml)', 3, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('df98dca0-0f3b-4f33-ae71-e06c6d99f121', '过量维他命A摄入', 2, 'diet', 15, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('e1c7ea99-f735-4a4c-84f8-6682634bc3f0', '低钙摄入', 1.3, 'diet', 6, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('e1e55c9b-893f-4db6-9383-6880db710470', '总体, 癌胚抗原(CEA) 4.3-7.0 (ng/ml)', 3, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('e2186670-6490-4816-ba07-173f7eb789cd', '戒烟<10年', 1.3, 'life', 1, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('e306a5be-2d16-4483-adec-6da8f3d22faf', '体育锻炼, 至少每天30分钟 或 每周3小时', -2, 'life', 3, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('e443cf87-d9a8-4e27-a8a1-75a60c1aad90', '仍在抽烟/曾经抽烟, 1-39包/年', 1.1, 'life', 1, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('e4e98ac9-e6ae-4c21-8ad5-4dc97724f442', '轻度吸烟, 癌胚抗原(CEA) 2.6-4.2 (ng/ml)', 2, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('e567b964-7f3b-4d1c-b278-8e78b02ba4e9', '抽烟≥30包每年 (无论是否已戒烟)', 3, 'life', 1, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('e600066b-f2d7-4f68-ae76-b474af5b8268', '双臂上有黑痣, 6-10颗', 2.5, 'history', 4, '62170376-908a-458d-8acd-7bb525385258');
INSERT INTO `ydr_risk` VALUES ('e8ba727f-7ec0-431a-b2cc-1cfe7c929177', '母乳喂养≥1年', 0.8, 'history', 4, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('ea29830d-c076-4906-9cb4-ece6f02200f7', '女性 ≥60 岁, 腰围 > 35尺', 5, 'history', 11, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('eb17e488-0a4f-41bf-bc5d-889954a1fecc', '女性, 50-65岁, 骨密度检测, 骨量减少', 1, 'history', 6, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('eb9d5670-ff7e-4a3a-a4b6-63842438da9c', '男性, 腰围 > 40尺', 2.25, 'history', 8, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('ebccb412-7065-41db-ab50-de41b53c7868', '总体, 年龄 60-69岁', 2, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('ebeca7f4-8de2-498f-9168-af4cfcd43057', '不吸烟, 癌胚抗原(CEA) 2.6-4.2 (ng/ml)', 2, 'history', 8, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('ec3997f7-1afe-4984-876a-7c58910b1517', '正在口服避孕药', 1.4, 'medicine', 15, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('ed093163-0556-4617-a065-40f4c8b902bc', '总体, C-反应蛋白(CRP) >10.0 (ng/ml)', 1, 'history', 9, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('ee6ea3e0-9620-44bf-a6e5-955f3dbbec46', '饮酒, 平均每天大于三瓶啤酒(1500ml)/三两白酒 [每日酒精摄入≥42g]', 2.25, 'diet', 4, 'c8e242cb-d536-45a4-be7b-f5190f0cd281');
INSERT INTO `ydr_risk` VALUES ('eeaf84a5-c36c-4c92-b424-1682d699aca2', '仍在抽烟, ≥25支每天', 2.2, 'life', 1, 'c1190aa4-c4f5-4d24-bfa4-390e151a62c0');
INSERT INTO `ydr_risk` VALUES ('efa3f30d-3ce8-46ce-b697-0da12000200a', '仍在抽烟,女性', 1, 'life', 1, '223eeeb0-8587-4fe0-a000-95d84b1a9449');
INSERT INTO `ydr_risk` VALUES ('f055239c-2a90-4bc8-9340-e9528afbc731', '女性身高超过170cm, 男性身高超过178cm', 1.3, 'history', 4, 'c23c042e-5743-4822-b5a9-8f0043cdfcb0');
INSERT INTO `ydr_risk` VALUES ('f0ae391d-ee17-4874-bb27-edd8615713b2', '重度吸烟, 年龄 ≥50岁', 4, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('f11cefa3-f5ca-458f-9ba3-d2d7b3b4019e', '轻度吸烟, 直系亲属有肺癌史', 2, 'family', 2, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('f13c70c2-6cba-460d-83b5-89dfaa9f1697', '父母或兄弟姐妹有大肠癌', 1.8, 'family', 3, '950f71c0-05b5-4659-b646-9732055f9449');
INSERT INTO `ydr_risk` VALUES ('f2613745-abda-4557-b77c-2e5000f5e527', '不吸烟, 年龄 <50岁', -4, 'history', 3, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('f3bfa0fe-68cb-4682-a224-f28be004ccd9', '体育锻炼, 至少每天30分钟 或 每周3小时', 0.55, 'life', 2, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('f3e93819-bb5e-4773-b672-73ed5185371c', '首次性生活早于16岁', 1.5, 'life', 2, '356ca387-341c-485e-b827-4f3cf0427aa5');
INSERT INTO `ydr_risk` VALUES ('f44568cc-a670-48ce-b2dd-a5d4c10cce8c', '雌激素使用, ≥5年', 1.3, 'medicine', 16, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('f57053df-e1fb-4cb5-84be-e2bd18a8915b', '男性 <60 岁, BMI 25-29.9', 5, 'history', 9, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('f6f949d4-f3a1-4ae1-966f-3545a314727b', '女性 <60 岁, BMI ≥27', 7, 'history', 10, '651fa939-0e86-43e8-869c-a3394f41faa4');
INSERT INTO `ydr_risk` VALUES ('f71dd430-d1ad-49a6-b557-51b53931de3f', '曾经抽烟/仍在抽烟', 1.1, 'life', 1, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('f81eab97-5cf3-4d81-8b80-48bd070d44d9', '每周至少摄入250g番茄或番茄制品', 0.7, 'diet', 3, '5717d096-f63d-440f-9f19-ee8289f3424c');
INSERT INTO `ydr_risk` VALUES ('f87c5c91-4423-41f2-b899-7d9e4931bd8a', '口服雌激素 ≥10年', 1.3, 'medicine', 11, '23b2704b-d600-40b1-b5e7-b2abbfd52192');
INSERT INTO `ydr_risk` VALUES ('f8ab3e01-255a-4d17-9e2e-1ebb7fb8a3cf', '自18岁之后, 体重增加, 10kg-20kg (不考虑雌激素作用)', 1.61, 'history', 14, '335aeacd-6674-4201-8741-d9d6625b4249');
INSERT INTO `ydr_risk` VALUES ('f9e92167-4665-4f5e-89d2-c5cb0da86ef9', '慢性胰腺炎', 3, 'history', 6, 'c1190aa4-c4f5-4d24-bfa4-390e151a62c0');
INSERT INTO `ydr_risk` VALUES ('fb1a5204-773d-4546-84e9-06d973cd8c75', '第一次使用晒黑床(日光浴床)≥35岁', 1.25, 'life', 2, '62170376-908a-458d-8acd-7bb525385258');
INSERT INTO `ydr_risk` VALUES ('fb300397-970a-442e-b595-0d23eaf0adc8', '父母或兄弟姐妹有肾癌', 1.5, 'family', 2, 'c23c042e-5743-4822-b5a9-8f0043cdfcb0');
INSERT INTO `ydr_risk` VALUES ('fc7dfd49-883b-40fa-994f-0150d95ee086', '不吸烟, 最大呼气中期流量(MMEF) 49-77(ml/sec)', 1, 'history', 7, 'd07149c4-7c2c-4a85-8ec6-4c017ce704a1');
INSERT INTO `ydr_risk` VALUES ('fccf1c3c-a5a8-4226-9c44-d2ae3847fb1e', '母乳喂养≥1年', 0.8, 'history', 11, '335aeacd-6674-4201-8741-d9d6625b4249');

-- ----------------------------
-- Table structure for ydr_riskdetail
-- ----------------------------
DROP TABLE IF EXISTS `ydr_riskdetail`;
CREATE TABLE `ydr_riskdetail`  (
  `riskId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险因素id',
  `pollId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '问卷id',
  `diseaseId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '疾病id',
  INDEX `whichrisk`(`riskId` ASC) USING BTREE,
  INDEX `pollId`(`pollId` ASC) USING BTREE,
  INDEX `whichdisease`(`diseaseId` ASC) USING BTREE,
  CONSTRAINT `whichdisease` FOREIGN KEY (`diseaseId`) REFERENCES `ydr_disease` (`diseaseId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `whichrisk` FOREIGN KEY (`riskId`) REFERENCES `ydr_risk` (`riskId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ydr_riskdetail_ibfk_1` FOREIGN KEY (`pollId`) REFERENCES `ydr_poll` (`pollId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ydr_riskdetail
-- ----------------------------

-- ----------------------------
-- Table structure for ydr_user
-- ----------------------------
DROP TABLE IF EXISTS `ydr_user`;
CREATE TABLE `ydr_user`  (
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '身份证',
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ydr_user
-- ----------------------------
INSERT INTO `ydr_user` VALUES ('1', '测试男1');
INSERT INTO `ydr_user` VALUES ('2', '测试女1');
INSERT INTO `ydr_user` VALUES ('3', '测试男2');

SET FOREIGN_KEY_CHECKS = 1;
