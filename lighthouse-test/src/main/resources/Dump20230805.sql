CREATE DATABASE  IF NOT EXISTS `cluster_ea6e2cca_ldp_mysqldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cluster_ea6e2cca_ldp_mysqldb`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 10.206.6.40    Database: cluster_ea6e2cca_ldp_mysqldb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ldp_components`
--

DROP TABLE IF EXISTS `ldp_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_components` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `level` int NOT NULL,
  `components_type` int NOT NULL,
  `private_flag` int DEFAULT NULL,
  `data` mediumtext NOT NULL,
  `user_id` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_components`
--

LOCK TABLES `ldp_components` WRITE;
/*!40000 ALTER TABLE `ldp_components` DISABLE KEYS */;
INSERT INTO `ldp_components` VALUES (1012,'通用地区省市级联组件',2,4,0,'[{\"name\":\"北京市\",\"id\":\"110000\",\"children\":[{\"name\":\"朝阳区\",\"id\":\"110100\"},{\"name\":\"海淀区\",\"id\":\"110200\"},{\"name\":\"东城区\",\"id\":\"110300\"},{\"name\":\"西城区\",\"id\":\"110400\"},{\"name\":\"昌平区\",\"id\":\"110500\"},{\"name\":\"通州区\",\"id\":\"110600\"}]},{\"name\":\"天津市\",\"id\":\"120000\",\"children\":[{\"name\":\"和平区\",\"id\":\"120100\"},{\"name\":\"河东区\",\"id\":\"120200\"},{\"name\":\"南开区\",\"id\":\"120300\"},{\"name\":\"滨海新区\",\"id\":\"120400\"},{\"name\":\"武清区\",\"id\":\"120500\"}]},{\"name\":\"河北省\",\"id\":\"130000\",\"children\":[{\"name\":\"石家庄市\",\"id\":\"130100\"},{\"name\":\"唐山市\",\"id\":\"130200\"},{\"name\":\"秦皇岛市\",\"id\":\"130300\"},{\"name\":\"邯郸市\",\"id\":\"130400\"},{\"name\":\"邢台市\",\"id\":\"130500\"},{\"name\":\"保定市\",\"id\":\"130600\"},{\"name\":\"张家口市\",\"id\":\"130700\"},{\"name\":\"承德市\",\"id\":\"130800\"},{\"name\":\"沧州市\",\"id\":\"130900\"},{\"name\":\"廊坊市\",\"id\":\"131000\"},{\"name\":\"衡水市\",\"id\":\"131100\"},{\"name\":\"省直辖县级行政区划\",\"id\":\"139000\"}]},{\"name\":\"山西省\",\"id\":\"140000\",\"children\":[{\"name\":\"太原市\",\"id\":\"140100\"},{\"name\":\"大同市\",\"id\":\"140200\"},{\"name\":\"阳泉市\",\"id\":\"140300\"},{\"name\":\"长治市\",\"id\":\"140400\"},{\"name\":\"晋城市\",\"id\":\"140500\"},{\"name\":\"朔州市\",\"id\":\"140600\"},{\"name\":\"晋中市\",\"id\":\"140700\"},{\"name\":\"运城市\",\"id\":\"140800\"},{\"name\":\"忻州市\",\"id\":\"140900\"},{\"name\":\"临汾市\",\"id\":\"141000\"},{\"name\":\"吕梁市\",\"id\":\"141100\"}]},{\"name\":\"内蒙古自治区\",\"id\":\"150000\",\"children\":[{\"name\":\"呼和浩特市\",\"id\":\"150100\"},{\"name\":\"包头市\",\"id\":\"150200\"},{\"name\":\"乌海市\",\"id\":\"150300\"},{\"name\":\"赤峰市\",\"id\":\"150400\"},{\"name\":\"通辽市\",\"id\":\"150500\"},{\"name\":\"鄂尔多斯市\",\"id\":\"150600\"},{\"name\":\"呼伦贝尔市\",\"id\":\"150700\"},{\"name\":\"巴彦淖尔市\",\"id\":\"150800\"},{\"name\":\"乌兰察布市\",\"id\":\"150900\"},{\"name\":\"兴安盟\",\"id\":\"152200\"},{\"name\":\"锡林郭勒盟\",\"id\":\"152500\"},{\"name\":\"阿拉善盟\",\"id\":\"152900\"}]},{\"name\":\"辽宁省\",\"id\":\"210000\",\"children\":[{\"name\":\"沈阳市\",\"id\":\"210100\"},{\"name\":\"大连市\",\"id\":\"210200\"},{\"name\":\"鞍山市\",\"id\":\"210300\"},{\"name\":\"抚顺市\",\"id\":\"210400\"},{\"name\":\"本溪市\",\"id\":\"210500\"},{\"name\":\"丹东市\",\"id\":\"210600\"},{\"name\":\"锦州市\",\"id\":\"210700\"},{\"name\":\"营口市\",\"id\":\"210800\"},{\"name\":\"阜新市\",\"id\":\"210900\"},{\"name\":\"辽阳市\",\"id\":\"211000\"},{\"name\":\"盘锦市\",\"id\":\"211100\"},{\"name\":\"铁岭市\",\"id\":\"211200\"},{\"name\":\"朝阳市\",\"id\":\"211300\"},{\"name\":\"葫芦岛市\",\"id\":\"211400\"}]},{\"name\":\"吉林省\",\"id\":\"220000\",\"children\":[{\"name\":\"长春市\",\"id\":\"220100\"},{\"name\":\"吉林市\",\"id\":\"220200\"},{\"name\":\"四平市\",\"id\":\"220300\"},{\"name\":\"辽源市\",\"id\":\"220400\"},{\"name\":\"通化市\",\"id\":\"220500\"},{\"name\":\"白山市\",\"id\":\"220600\"},{\"name\":\"松原市\",\"id\":\"220700\"},{\"name\":\"白城市\",\"id\":\"220800\"},{\"name\":\"延边朝鲜族自治州\",\"id\":\"222400\"}]},{\"name\":\"黑龙江省\",\"id\":\"230000\",\"children\":[{\"name\":\"哈尔滨市\",\"id\":\"230100\"},{\"name\":\"齐齐哈尔市\",\"id\":\"230200\"},{\"name\":\"鸡西市\",\"id\":\"230300\"},{\"name\":\"鹤岗市\",\"id\":\"230400\"},{\"name\":\"双鸭山市\",\"id\":\"230500\"},{\"name\":\"大庆市\",\"id\":\"230600\"},{\"name\":\"伊春市\",\"id\":\"230700\"},{\"name\":\"佳木斯市\",\"id\":\"230800\"},{\"name\":\"七台河市\",\"id\":\"230900\"},{\"name\":\"牡丹江市\",\"id\":\"231000\"},{\"name\":\"黑河市\",\"id\":\"231100\"},{\"name\":\"绥化市\",\"id\":\"231200\"},{\"name\":\"大兴安岭地区\",\"id\":\"232700\"}]},{\"name\":\"上海市\",\"id\":\"310000\",\"children\":[{\"name\":\"黄浦区\",\"id\":\"310100\"},{\"name\":\"徐汇区\",\"id\":\"310200\"},{\"name\":\"静安区\",\"id\":\"310300\"},{\"name\":\"虹口区\",\"id\":\"31400\"},{\"name\":\"浦东区\",\"id\":\"310500\"},{\"name\":\"崇明区\",\"id\":\"310600\"}]},{\"name\":\"江苏省\",\"id\":\"320000\",\"children\":[{\"name\":\"南京市\",\"id\":\"320100\"},{\"name\":\"无锡市\",\"id\":\"320200\"},{\"name\":\"徐州市\",\"id\":\"320300\"},{\"name\":\"常州市\",\"id\":\"320400\"},{\"name\":\"苏州市\",\"id\":\"320500\"},{\"name\":\"南通市\",\"id\":\"320600\"},{\"name\":\"连云港市\",\"id\":\"320700\"},{\"name\":\"淮安市\",\"id\":\"320800\"},{\"name\":\"盐城市\",\"id\":\"320900\"},{\"name\":\"扬州市\",\"id\":\"321000\"},{\"name\":\"镇江市\",\"id\":\"321100\"},{\"name\":\"泰州市\",\"id\":\"321200\"},{\"name\":\"宿迁市\",\"id\":\"321300\"}]},{\"name\":\"浙江省\",\"id\":\"330000\",\"children\":[{\"name\":\"杭州市\",\"id\":\"330100\"},{\"name\":\"宁波市\",\"id\":\"330200\"},{\"name\":\"温州市\",\"id\":\"330300\"},{\"name\":\"嘉兴市\",\"id\":\"330400\"},{\"name\":\"湖州市\",\"id\":\"330500\"},{\"name\":\"绍兴市\",\"id\":\"330600\"},{\"name\":\"金华市\",\"id\":\"330700\"},{\"name\":\"衢州市\",\"id\":\"330800\"},{\"name\":\"舟山市\",\"id\":\"330900\"},{\"name\":\"台州市\",\"id\":\"331000\"},{\"name\":\"丽水市\",\"id\":\"331100\"}]},{\"name\":\"安徽省\",\"id\":\"340000\",\"children\":[{\"name\":\"合肥市\",\"id\":\"340100\"},{\"name\":\"芜湖市\",\"id\":\"340200\"},{\"name\":\"蚌埠市\",\"id\":\"340300\"},{\"name\":\"淮南市\",\"id\":\"340400\"},{\"name\":\"马鞍山市\",\"id\":\"340500\"},{\"name\":\"淮北市\",\"id\":\"340600\"},{\"name\":\"铜陵市\",\"id\":\"340700\"},{\"name\":\"安庆市\",\"id\":\"340800\"},{\"name\":\"黄山市\",\"id\":\"341000\"},{\"name\":\"滁州市\",\"id\":\"341100\"},{\"name\":\"阜阳市\",\"id\":\"341200\"},{\"name\":\"宿州市\",\"id\":\"341300\"},{\"name\":\"六安市\",\"id\":\"341500\"},{\"name\":\"亳州市\",\"id\":\"341600\"},{\"name\":\"池州市\",\"id\":\"341700\"},{\"name\":\"宣城市\",\"id\":\"341800\"}]},{\"name\":\"福建省\",\"id\":\"350000\",\"children\":[{\"name\":\"福州市\",\"id\":\"350100\"},{\"name\":\"厦门市\",\"id\":\"350200\"},{\"name\":\"莆田市\",\"id\":\"350300\"},{\"name\":\"三明市\",\"id\":\"350400\"},{\"name\":\"泉州市\",\"id\":\"350500\"},{\"name\":\"漳州市\",\"id\":\"350600\"},{\"name\":\"南平市\",\"id\":\"350700\"},{\"name\":\"龙岩市\",\"id\":\"350800\"},{\"name\":\"宁德市\",\"id\":\"350900\"}]},{\"name\":\"江西省\",\"id\":\"360000\",\"children\":[{\"name\":\"南昌市\",\"id\":\"360100\"},{\"name\":\"景德镇市\",\"id\":\"360200\"},{\"name\":\"萍乡市\",\"id\":\"360300\"},{\"name\":\"九江市\",\"id\":\"360400\"},{\"name\":\"新余市\",\"id\":\"360500\"},{\"name\":\"鹰潭市\",\"id\":\"360600\"},{\"name\":\"赣州市\",\"id\":\"360700\"},{\"name\":\"吉安市\",\"id\":\"360800\"},{\"name\":\"宜春市\",\"id\":\"360900\"},{\"name\":\"抚州市\",\"id\":\"361000\"},{\"name\":\"上饶市\",\"id\":\"361100\"}]},{\"name\":\"山东省\",\"id\":\"370000\",\"children\":[{\"name\":\"济南市\",\"id\":\"370100\"},{\"name\":\"青岛市\",\"id\":\"370200\"},{\"name\":\"淄博市\",\"id\":\"370300\"},{\"name\":\"枣庄市\",\"id\":\"370400\"},{\"name\":\"东营市\",\"id\":\"370500\"},{\"name\":\"烟台市\",\"id\":\"370600\"},{\"name\":\"潍坊市\",\"id\":\"370700\"},{\"name\":\"济宁市\",\"id\":\"370800\"},{\"name\":\"泰安市\",\"id\":\"370900\"},{\"name\":\"威海市\",\"id\":\"371000\"},{\"name\":\"日照市\",\"id\":\"371100\"},{\"name\":\"莱芜市\",\"id\":\"371200\"},{\"name\":\"临沂市\",\"id\":\"371300\"},{\"name\":\"德州市\",\"id\":\"371400\"},{\"name\":\"聊城市\",\"id\":\"371500\"},{\"name\":\"滨州市\",\"id\":\"371600\"},{\"name\":\"菏泽市\",\"id\":\"371700\"}]},{\"name\":\"河南省\",\"id\":\"410000\",\"children\":[{\"name\":\"郑州市\",\"id\":\"410100\"},{\"name\":\"开封市\",\"id\":\"410200\"},{\"name\":\"洛阳市\",\"id\":\"410300\"},{\"name\":\"平顶山市\",\"id\":\"410400\"},{\"name\":\"安阳市\",\"id\":\"410500\"},{\"name\":\"鹤壁市\",\"id\":\"410600\"},{\"name\":\"新乡市\",\"id\":\"410700\"},{\"name\":\"焦作市\",\"id\":\"410800\"},{\"name\":\"濮阳市\",\"id\":\"410900\"},{\"name\":\"许昌市\",\"id\":\"411000\"},{\"name\":\"漯河市\",\"id\":\"411100\"},{\"name\":\"三门峡市\",\"id\":\"411200\"},{\"name\":\"南阳市\",\"id\":\"411300\"},{\"name\":\"商丘市\",\"id\":\"411400\"},{\"name\":\"信阳市\",\"id\":\"411500\"},{\"name\":\"周口市\",\"id\":\"411600\"},{\"name\":\"驻马店市\",\"id\":\"411700\"},{\"name\":\"省直辖县级行政区划\",\"id\":\"419000\"}]},{\"name\":\"湖北省\",\"id\":\"420000\",\"children\":[{\"name\":\"武汉市\",\"id\":\"420100\"},{\"name\":\"黄石市\",\"id\":\"420200\"},{\"name\":\"十堰市\",\"id\":\"420300\"},{\"name\":\"宜昌市\",\"id\":\"420500\"},{\"name\":\"襄阳市\",\"id\":\"420600\"},{\"name\":\"鄂州市\",\"id\":\"420700\"},{\"name\":\"荆门市\",\"id\":\"420800\"},{\"name\":\"孝感市\",\"id\":\"420900\"},{\"name\":\"荆州市\",\"id\":\"421000\"},{\"name\":\"黄冈市\",\"id\":\"421100\"},{\"name\":\"咸宁市\",\"id\":\"421200\"},{\"name\":\"随州市\",\"id\":\"421300\"},{\"name\":\"恩施土家族苗族自治州\",\"id\":\"422800\"},{\"name\":\"省直辖县级行政区划\",\"id\":\"429000\"},{\"name\":\"仙桃市\",\"id\":\"429004\"},{\"name\":\"潜江市\",\"id\":\"429005\"},{\"name\":\"天门市\",\"id\":\"429006\"},{\"name\":\"神农架林区\",\"id\":\"429021\"}]},{\"name\":\"湖南省\",\"id\":\"430000\",\"children\":[{\"name\":\"长沙市\",\"id\":\"430100\"},{\"name\":\"株洲市\",\"id\":\"430200\"},{\"name\":\"湘潭市\",\"id\":\"430300\"},{\"name\":\"衡阳市\",\"id\":\"430400\"},{\"name\":\"邵阳市\",\"id\":\"430500\"},{\"name\":\"岳阳市\",\"id\":\"430600\"},{\"name\":\"常德市\",\"id\":\"430700\"},{\"name\":\"张家界市\",\"id\":\"430800\"},{\"name\":\"益阳市\",\"id\":\"430900\"},{\"name\":\"郴州市\",\"id\":\"431000\"},{\"name\":\"永州市\",\"id\":\"431100\"},{\"name\":\"怀化市\",\"id\":\"431200\"},{\"name\":\"娄底市\",\"id\":\"431300\"},{\"name\":\"湘西土家族苗族自治州\",\"id\":\"433100\"},{\"name\":\"五指山市\",\"id\":\"469001\"},{\"name\":\"琼海市\",\"id\":\"469002\"},{\"name\":\"文昌市\",\"id\":\"469005\"},{\"name\":\"万宁市\",\"id\":\"469006\"},{\"name\":\"东方市\",\"id\":\"469007\"},{\"name\":\"定安县\",\"id\":\"469021\"},{\"name\":\"屯昌县\",\"id\":\"469022\"},{\"name\":\"澄迈县\",\"id\":\"469023\"},{\"name\":\"临高县\",\"id\":\"469024\"},{\"name\":\"白沙黎族自治县\",\"id\":\"469025\"},{\"name\":\"昌江黎族自治县\",\"id\":\"469026\"},{\"name\":\"乐东黎族自治县\",\"id\":\"469027\"},{\"name\":\"陵水黎族自治县\",\"id\":\"469028\"},{\"name\":\"保亭黎族苗族自治县\",\"id\":\"469029\"},{\"name\":\"琼中黎族苗族自治县\",\"id\":\"469030\"}]},{\"name\":\"广东省\",\"id\":\"440000\",\"children\":[{\"name\":\"广州市\",\"id\":\"440100\"},{\"name\":\"韶关市\",\"id\":\"440200\"},{\"name\":\"深圳市\",\"id\":\"440300\"},{\"name\":\"珠海市\",\"id\":\"440400\"},{\"name\":\"汕头市\",\"id\":\"440500\"},{\"name\":\"佛山市\",\"id\":\"440600\"},{\"name\":\"江门市\",\"id\":\"440700\"},{\"name\":\"湛江市\",\"id\":\"440800\"},{\"name\":\"茂名市\",\"id\":\"440900\"},{\"name\":\"肇庆市\",\"id\":\"441200\"},{\"name\":\"惠州市\",\"id\":\"441300\"},{\"name\":\"梅州市\",\"id\":\"441400\"},{\"name\":\"汕尾市\",\"id\":\"441500\"},{\"name\":\"河源市\",\"id\":\"441600\"},{\"name\":\"阳江市\",\"id\":\"441700\"},{\"name\":\"清远市\",\"id\":\"441800\"},{\"name\":\"东莞市\",\"id\":\"441900\"},{\"name\":\"中山市\",\"id\":\"442000\"},{\"name\":\"潮州市\",\"id\":\"445100\"},{\"name\":\"揭阳市\",\"id\":\"445200\"},{\"name\":\"云浮市\",\"id\":\"445300\"}]},{\"name\":\"广西壮族自治区\",\"id\":\"450000\",\"children\":[{\"name\":\"南宁市\",\"id\":\"450100\"},{\"name\":\"柳州市\",\"id\":\"450200\"},{\"name\":\"桂林市\",\"id\":\"450300\"},{\"name\":\"梧州市\",\"id\":\"450400\"},{\"name\":\"北海市\",\"id\":\"450500\"},{\"name\":\"防城港市\",\"id\":\"450600\"},{\"name\":\"钦州市\",\"id\":\"450700\"},{\"name\":\"贵港市\",\"id\":\"450800\"},{\"name\":\"玉林市\",\"id\":\"450900\"},{\"name\":\"百色市\",\"id\":\"451000\"},{\"name\":\"贺州市\",\"id\":\"451100\"},{\"name\":\"河池市\",\"id\":\"451200\"},{\"name\":\"来宾市\",\"id\":\"451300\"},{\"name\":\"崇左市\",\"id\":\"451400\"}]},{\"name\":\"海南省\",\"id\":\"460000\",\"children\":[{\"name\":\"海口市\",\"id\":\"460100\"},{\"name\":\"三亚市\",\"id\":\"460200\"},{\"name\":\"三沙市\",\"id\":\"460300\"},{\"name\":\"儋州市\",\"id\":\"460400\"},{\"name\":\"省直辖县级行政区划\",\"id\":\"469000\"}]},{\"name\":\"重庆市\",\"id\":\"500000\",\"children\":[{\"name\":\"渝中区\",\"id\":\"500100\"},{\"name\":\"江北区\",\"id\":\"500200\"},{\"name\":\"南岸区\",\"id\":\"500300\"},{\"name\":\"巴南区\",\"id\":\"500400\"},{\"name\":\"铜梁区\",\"id\":\"500500\"},{\"name\":\"南岸区\",\"id\":\"500600\"}]},{\"name\":\"四川省\",\"id\":\"510000\",\"children\":[{\"name\":\"成都市\",\"id\":\"510100\"},{\"name\":\"自贡市\",\"id\":\"510300\"},{\"name\":\"攀枝花市\",\"id\":\"510400\"},{\"name\":\"泸州市\",\"id\":\"510500\"},{\"name\":\"德阳市\",\"id\":\"510600\"},{\"name\":\"绵阳市\",\"id\":\"510700\"},{\"name\":\"广元市\",\"id\":\"510800\"},{\"name\":\"遂宁市\",\"id\":\"510900\"},{\"name\":\"内江市\",\"id\":\"511000\"},{\"name\":\"乐山市\",\"id\":\"511100\"},{\"name\":\"南充市\",\"id\":\"511300\"},{\"name\":\"眉山市\",\"id\":\"511400\"},{\"name\":\"宜宾市\",\"id\":\"511500\"},{\"name\":\"广安市\",\"id\":\"511600\"},{\"name\":\"达州市\",\"id\":\"511700\"},{\"name\":\"雅安市\",\"id\":\"511800\"},{\"name\":\"巴中市\",\"id\":\"511900\"},{\"name\":\"资阳市\",\"id\":\"512000\"},{\"name\":\"阿坝藏族羌族自治州\",\"id\":\"513200\"},{\"name\":\"甘孜藏族自治州\",\"id\":\"513300\"},{\"name\":\"凉山彝族自治州\",\"id\":\"513400\"}]},{\"name\":\"贵州省\",\"id\":\"520000\",\"children\":[{\"name\":\"贵阳市\",\"id\":\"520100\"},{\"name\":\"六盘水市\",\"id\":\"520200\"},{\"name\":\"遵义市\",\"id\":\"520300\"},{\"name\":\"安顺市\",\"id\":\"520400\"},{\"name\":\"毕节市\",\"id\":\"520500\"},{\"name\":\"铜仁市\",\"id\":\"520600\"},{\"name\":\"黔西南布依族苗族自治州\",\"id\":\"522300\"},{\"name\":\"黔东南苗族侗族自治州\",\"id\":\"522600\"},{\"name\":\"黔南布依族苗族自治州\",\"id\":\"522700\"}]},{\"name\":\"云南省\",\"id\":\"530000\",\"children\":[{\"name\":\"昆明市\",\"id\":\"530100\"},{\"name\":\"曲靖市\",\"id\":\"530300\"},{\"name\":\"玉溪市\",\"id\":\"530400\"},{\"name\":\"保山市\",\"id\":\"530500\"},{\"name\":\"昭通市\",\"id\":\"530600\"},{\"name\":\"丽江市\",\"id\":\"530700\"},{\"name\":\"普洱市\",\"id\":\"530800\"},{\"name\":\"临沧市\",\"id\":\"530900\"},{\"name\":\"楚雄彝族自治州\",\"id\":\"532300\"},{\"name\":\"红河哈尼族彝族自治州\",\"id\":\"532500\"},{\"name\":\"文山壮族苗族自治州\",\"id\":\"532600\"},{\"name\":\"西双版纳傣族自治州\",\"id\":\"532800\"},{\"name\":\"大理白族自治州\",\"id\":\"532900\"},{\"name\":\"德宏傣族景颇族自治州\",\"id\":\"533100\"},{\"name\":\"怒江傈僳族自治州\",\"id\":\"533300\"},{\"name\":\"迪庆藏族自治州\",\"id\":\"533400\"}]},{\"name\":\"西藏自治区\",\"id\":\"540000\",\"children\":[{\"name\":\"拉萨市\",\"id\":\"540100\"},{\"name\":\"日喀则市\",\"id\":\"540200\"},{\"name\":\"昌都市\",\"id\":\"540300\"},{\"name\":\"林芝市\",\"id\":\"540400\"},{\"name\":\"山南市\",\"id\":\"540500\"},{\"name\":\"那曲地区\",\"id\":\"542400\"},{\"name\":\"阿里地区\",\"id\":\"542500\"}]},{\"name\":\"陕西省\",\"id\":\"610000\",\"children\":[{\"name\":\"西安市\",\"id\":\"610100\"},{\"name\":\"铜川市\",\"id\":\"610200\"},{\"name\":\"宝鸡市\",\"id\":\"610300\"},{\"name\":\"咸阳市\",\"id\":\"610400\"},{\"name\":\"渭南市\",\"id\":\"610500\"},{\"name\":\"延安市\",\"id\":\"610600\"},{\"name\":\"汉中市\",\"id\":\"610700\"},{\"name\":\"榆林市\",\"id\":\"610800\"},{\"name\":\"安康市\",\"id\":\"610900\"},{\"name\":\"商洛市\",\"id\":\"611000\"}]},{\"name\":\"甘肃省\",\"id\":\"620000\",\"children\":[{\"name\":\"兰州市\",\"id\":\"620100\"},{\"name\":\"嘉峪关市\",\"id\":\"620200\"},{\"name\":\"金昌市\",\"id\":\"620300\"},{\"name\":\"白银市\",\"id\":\"620400\"},{\"name\":\"天水市\",\"id\":\"620500\"},{\"name\":\"武威市\",\"id\":\"620600\"},{\"name\":\"张掖市\",\"id\":\"620700\"},{\"name\":\"平凉市\",\"id\":\"620800\"},{\"name\":\"酒泉市\",\"id\":\"620900\"},{\"name\":\"庆阳市\",\"id\":\"621000\"},{\"name\":\"定西市\",\"id\":\"621100\"},{\"name\":\"陇南市\",\"id\":\"621200\"},{\"name\":\"临夏回族自治州\",\"id\":\"622900\"},{\"name\":\"甘南藏族自治州\",\"id\":\"623000\"}]},{\"name\":\"青海省\",\"id\":\"630000\",\"children\":[{\"name\":\"西宁市\",\"id\":\"630100\"},{\"name\":\"海东市\",\"id\":\"630200\"},{\"name\":\"海北藏族自治州\",\"id\":\"632200\"},{\"name\":\"黄南藏族自治州\",\"id\":\"632300\"},{\"name\":\"海南藏族自治州\",\"id\":\"632500\"},{\"name\":\"果洛藏族自治州\",\"id\":\"632600\"},{\"name\":\"玉树藏族自治州\",\"id\":\"632700\"},{\"name\":\"海西蒙古族藏族自治州\",\"id\":\"632800\"}]},{\"name\":\"宁夏回族自治区\",\"id\":\"640000\",\"children\":[{\"name\":\"银川市\",\"id\":\"640100\"},{\"name\":\"石嘴山市\",\"id\":\"640200\"},{\"name\":\"吴忠市\",\"id\":\"640300\"},{\"name\":\"固原市\",\"id\":\"640400\"},{\"name\":\"中卫市\",\"id\":\"640500\"}]},{\"name\":\"新疆维吾尔自治区\",\"id\":\"650000\",\"children\":[{\"name\":\"乌鲁木齐市\",\"id\":\"650100\"},{\"name\":\"克拉玛依市\",\"id\":\"650200\"},{\"name\":\"吐鲁番市\",\"id\":\"650400\"},{\"name\":\"哈密市\",\"id\":\"650500\"},{\"name\":\"昌吉回族自治州\",\"id\":\"652300\"},{\"name\":\"博尔塔拉蒙古自治州\",\"id\":\"652700\"},{\"name\":\"巴音郭楞蒙古自治州\",\"id\":\"652800\"},{\"name\":\"阿克苏地区\",\"id\":\"652900\"},{\"name\":\"克孜勒苏柯尔克孜自治州\",\"id\":\"653000\"},{\"name\":\"喀什地区\",\"id\":\"653100\"},{\"name\":\"和田地区\",\"id\":\"653200\"},{\"name\":\"伊犁哈萨克自治州\",\"id\":\"654000\"},{\"name\":\"塔城地区\",\"id\":\"654200\"},{\"name\":\"阿勒泰地区\",\"id\":\"654300\"},{\"name\":\"自治区直辖县级行政区划\",\"id\":\"659000\"},{\"name\":\"石河子市\",\"id\":\"659001\"},{\"name\":\"阿拉尔市\",\"id\":\"659002\"},{\"name\":\"图木舒克市\",\"id\":\"659003\"},{\"name\":\"五家渠市\",\"id\":\"659004\"},{\"name\":\"铁门关市\",\"id\":\"659006\"}]},{\"name\":\"台湾省\",\"id\":\"710000\"},{\"name\":\"香港特别行政区\",\"id\":\"810000\"},{\"name\":\"澳门特别行政区\",\"id\":\"820000\"}]',110031,'2023-08-05 10:49:28'),(1013,'通用地区省份多选下拉框',1,2,0,'[{\"name\":\"北京市\",\"id\":\"110000\"},{\"name\":\"天津市\",\"id\":\"120000\"},{\"name\":\"河北省\",\"id\":\"130000\"},{\"name\":\"山西省\",\"id\":\"140000\"},{\"name\":\"内蒙古自治区\",\"id\":\"150000\"},{\"name\":\"辽宁省\",\"id\":\"210000\"},{\"name\":\"吉林省\",\"id\":\"220000\"},{\"name\":\"黑龙江省\",\"id\":\"230000\"},{\"name\":\"上海市\",\"id\":\"310000\"},{\"name\":\"江苏省\",\"id\":\"320000\"},{\"name\":\"浙江省\",\"id\":\"330000\"},{\"name\":\"安徽省\",\"id\":\"340000\"},{\"name\":\"福建省\",\"id\":\"350000\"},{\"name\":\"江西省\",\"id\":\"360000\"},{\"name\":\"山东省\",\"id\":\"370000\"},{\"name\":\"河南省\",\"id\":\"410000\"},{\"name\":\"湖北省\",\"id\":\"420000\"},{\"name\":\"湖南省\",\"id\":\"430000\"},{\"name\":\"广东省\",\"id\":\"440000\"},{\"name\":\"广西壮族自治区\",\"id\":\"450000\"},{\"name\":\"海南省\",\"id\":\"460000\"},{\"name\":\"重庆市\",\"id\":\"500000\"},{\"name\":\"四川省\",\"id\":\"510000\"},{\"name\":\"贵州省\",\"id\":\"520000\"},{\"name\":\"云南省\",\"id\":\"530000\"},{\"name\":\"西藏自治区\",\"id\":\"540000\"},{\"name\":\"陕西省\",\"id\":\"610000\"},{\"name\":\"甘肃省\",\"id\":\"620000\"},{\"name\":\"青海省\",\"id\":\"630000\"},{\"name\":\"宁夏回族自治区\",\"id\":\"640000\"},{\"name\":\"新疆维吾尔自治区\",\"id\":\"650000\"},{\"name\":\"台湾省\",\"id\":\"710000\"},{\"name\":\"香港特别行政区\",\"id\":\"810000\"},{\"name\":\"澳门特别行政区\",\"id\":\"820000\"}]',110031,'2023-08-05 10:52:41');
/*!40000 ALTER TABLE `ldp_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_department`
--

DROP TABLE IF EXISTS `ldp_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `level` int NOT NULL,
  `pid` int NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `fullpath` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pid` (`pid`),
  KEY `index_create_time` (`create_time`),
  KEY `index_level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=10054 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_department`
--

LOCK TABLES `ldp_department` WRITE;
/*!40000 ALTER TABLE `ldp_department` DISABLE KEYS */;
INSERT INTO `ldp_department` VALUES (10041,'电商事业部',1,0,'2023-08-03 17:01:54','2023-08-03 17:08:18','10041'),(10042,'短视频事业部',1,0,'2023-08-03 17:08:31','2023-08-03 17:08:31','10042'),(10043,'产品体验部',1,0,'2023-08-03 17:08:42','2023-08-03 17:09:14','10043'),(10044,'基础架构部',1,0,'2023-08-03 17:08:56','2023-08-03 17:08:56','10044'),(10045,'前端研发部',1,0,'2023-08-03 17:09:36','2023-08-03 17:11:43','10045'),(10046,'后端研发部',1,0,'2023-08-03 17:09:46','2023-08-03 17:09:46','10046'),(10047,'算法研发部',1,0,'2023-08-03 17:10:03','2023-08-03 17:10:03','10047'),(10048,'视觉设计部',1,0,'2023-08-03 17:10:34','2023-08-03 17:10:34','10048'),(10049,'用户运营部',1,0,'2023-08-03 17:10:51','2023-08-03 17:10:51','10049'),(10050,'战略决策部',1,0,'2023-08-03 17:11:07','2023-08-03 17:11:07','10050'),(10051,'社交事业部',1,0,'2023-08-03 17:12:11','2023-08-03 17:12:32','10051'),(10052,'游戏事业部',1,0,'2023-08-03 17:14:40','2023-08-03 17:15:12','10052'),(10053,'运维技术部',1,0,'2023-08-04 07:15:58','2023-08-04 07:15:58','10053');
/*!40000 ALTER TABLE `ldp_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_limited_records`
--

DROP TABLE IF EXISTS `ldp_limited_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_limited_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `relation_id` int DEFAULT NULL,
  `relation_type` int DEFAULT NULL,
  `strategy` varchar(50) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100118 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_limited_records`
--

LOCK TABLES `ldp_limited_records` WRITE;
/*!40000 ALTER TABLE `ldp_limited_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `ldp_limited_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_meta_table`
--

DROP TABLE IF EXISTS `ldp_meta_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_meta_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meta_name` varchar(100) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  `template` varchar(3000) DEFAULT NULL,
  `record_size` int DEFAULT NULL,
  `content_size` bigint NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_meta_name` (`meta_name`),
  KEY `index_state` (`state`),
  KEY `index_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10014 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_meta_table`
--

LOCK TABLES `ldp_meta_table` WRITE;
/*!40000 ALTER TABLE `ldp_meta_table` DISABLE KEYS */;
INSERT INTO `ldp_meta_table` VALUES (10012,'ldp_stat_1691055136106',3,1,NULL,0,1227,NULL,'2023-08-03 17:32:16','2023-08-05 01:01:10'),(10013,'ldp_seq_1691069036650',2,1,NULL,0,1217,NULL,'2023-08-03 21:23:57','2023-08-05 01:01:10');
/*!40000 ALTER TABLE `ldp_meta_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_order`
--

DROP TABLE IF EXISTS `ldp_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_type` int NOT NULL,
  `privilege_kid` int NOT NULL,
  `privilege_type` int NOT NULL,
  `approve_user` int DEFAULT NULL,
  `state` int NOT NULL,
  `hash` varchar(100) NOT NULL,
  `params` varchar(300) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `process_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_hash` (`hash`),
  KEY `index_privilege_type` (`privilege_type`),
  KEY `index_state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=100150 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_order`
--

LOCK TABLES `ldp_order` WRITE;
/*!40000 ALTER TABLE `ldp_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ldp_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_privilege`
--

DROP TABLE IF EXISTS `ldp_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_privilege` (
  `id` int NOT NULL AUTO_INCREMENT,
  `relation_a` int NOT NULL,
  `relation_b` int NOT NULL,
  `privilege_type` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_privilege` (`relation_a`,`relation_b`,`privilege_type`),
  KEY `index_privilege_type` (`privilege_type`),
  KEY `index_relationa` (`relation_a`,`privilege_type`),
  KEY `index_relationb` (`relation_b`,`privilege_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100317 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_privilege`
--

LOCK TABLES `ldp_privilege` WRITE;
/*!40000 ALTER TABLE `ldp_privilege` DISABLE KEYS */;
INSERT INTO `ldp_privilege` VALUES (100260,110031,0,1,'2023-08-03 17:02:56'),(100287,110033,11036,5,'2023-08-04 21:09:35'),(100288,110032,11036,5,'2023-08-04 21:09:35'),(100289,110035,11036,5,'2023-08-04 21:09:35'),(100290,110033,11035,5,'2023-08-04 21:09:59'),(100291,110035,11035,5,'2023-08-04 21:09:59'),(100292,110034,11035,5,'2023-08-04 21:09:59'),(100293,110032,11033,5,'2023-08-04 21:10:11'),(100294,110035,11033,5,'2023-08-04 21:10:11'),(100295,110036,11033,5,'2023-08-04 21:10:11'),(100296,110033,11028,5,'2023-08-04 21:10:23'),(100297,110035,11028,5,'2023-08-04 21:10:23'),(100298,110034,11028,5,'2023-08-04 21:10:23'),(100299,110032,11032,5,'2023-08-04 21:11:32'),(100300,110034,11032,5,'2023-08-04 21:11:32'),(100301,110036,11032,5,'2023-08-04 21:11:32'),(100302,110033,11029,5,'2023-08-04 21:11:46'),(100303,110032,11029,5,'2023-08-04 21:11:46'),(100304,110036,11029,5,'2023-08-04 21:11:46'),(100305,110033,11027,5,'2023-08-04 21:12:18'),(100306,110034,11027,5,'2023-08-04 21:12:18'),(100307,110036,11027,5,'2023-08-04 21:12:18'),(100308,110032,11025,5,'2023-08-04 21:13:12'),(100309,110035,11025,5,'2023-08-04 21:13:12'),(100310,110036,11025,5,'2023-08-04 21:13:12'),(100311,110033,11026,5,'2023-08-04 21:13:37'),(100312,110035,11026,5,'2023-08-04 21:13:37'),(100313,110034,11026,5,'2023-08-04 21:13:37'),(100314,110032,11034,5,'2023-08-04 21:21:51'),(100315,110035,11034,5,'2023-08-04 21:21:51'),(100316,110034,11034,5,'2023-08-04 21:21:51');
/*!40000 ALTER TABLE `ldp_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_relations`
--

DROP TABLE IF EXISTS `ldp_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `relation_a` int NOT NULL,
  `relation_b` int NOT NULL,
  `relation_type` int NOT NULL,
  `create_time` datetime NOT NULL,
  `hash` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_relationa_relationb` (`relation_a`,`relation_b`,`relation_type`),
  KEY `index_relationa` (`relation_a`,`relation_type`),
  KEY `index_relationb` (`relation_b`,`relation_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100076 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_relations`
--

LOCK TABLES `ldp_relations` WRITE;
/*!40000 ALTER TABLE `ldp_relations` DISABLE KEYS */;
INSERT INTO `ldp_relations` VALUES (100074,110032,11025,2,'2023-08-03 17:25:08','f897c6d41e991941248ab4c831618e56'),(100075,110031,1100318,1,'2023-08-04 07:05:21','f100fc604ec3f6574af395f95a1f3a7e');
/*!40000 ALTER TABLE `ldp_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_stat_group`
--

DROP TABLE IF EXISTS `ldp_stat_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_stat_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(30) NOT NULL,
  `project_id` varchar(100) NOT NULL,
  `debug_mode` int DEFAULT NULL,
  `columns` varchar(3000) DEFAULT NULL,
  `stat_type` int NOT NULL,
  `secret_key` varchar(60) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user` varchar(45) DEFAULT NULL,
  `state` int NOT NULL,
  `limited_threshold` varchar(200) DEFAULT NULL,
  `debug_params` varchar(500) DEFAULT NULL,
  `refresh_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_token` (`token`),
  KEY `index_project_id` (`project_id`),
  KEY `index_stat_type` (`stat_type`),
  KEY `index_create_time` (`create_time`),
  KEY `index_create_user` (`create_user`),
  KEY `index_refresh_time` (`refresh_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100154 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_stat_group`
--

LOCK TABLES `ldp_stat_group` WRITE;
/*!40000 ALTER TABLE `ldp_stat_group` DISABLE KEYS */;
INSERT INTO `ldp_stat_group` VALUES (100135,'rd_shortvideo_request_stat','11025',0,'[{\"columnName\":\"interface\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"接口名称\"},{\"columnName\":\"ip\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"服务器IP\"},{\"columnName\":\"cost\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"耗时\"},{\"columnName\":\"state\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"接口执行状态，1：正常，2：异常\"}]',1,'vpIeEnH2rNPA07SX7gmT3w2gVnTrUID0','2023-08-03 17:32:16','2023-08-03 18:09:58','0',1,NULL,'{\"startTime\":1691055190110,\"endTime\":1691056990110}','2023-08-03 17:44:04'),(100137,'rd_shortvideo_recall_size_stat','11025',0,'[{\"columnName\":\"request_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"接口请求ID\"},{\"columnName\":\"recall_no\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"召回策略号\"},{\"columnName\":\"abtest_no\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"ABTest标识\"},{\"columnName\":\"item_size\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"召回帖子数量\"}]',1,'iU9m7ftMCxwmexzaX3hqDH6hIDCyANwT','2023-08-03 18:09:56','2023-08-03 18:09:56','0',1,NULL,NULL,'2023-08-03 18:09:56'),(100138,'rd_shortvideo_recall_cost','11025',0,'[{\"columnName\":\"request_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"请求ID\"},{\"columnName\":\"recall_no\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"召回策略号\"},{\"columnName\":\"cost\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"召回策略执行耗时\"}]',1,'PNv6bvEmFie3KvMVs8c5mJ5kv3z9FKOH','2023-08-03 18:14:38','2023-08-03 18:14:38','0',1,NULL,NULL,'2023-08-03 18:14:38'),(100139,'fe_appstart_adv_stat','11026',0,'[{\"columnName\":\"request_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"请求ID\"},{\"columnName\":\"imei\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户标识\"},{\"columnName\":\"adv_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"广告ID\"},{\"columnName\":\"adv_type\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"广告展示类型，1：图片，2：动画\"},{\"columnName\":\"cost\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"总耗时\"},{\"columnName\":\"step1_cost\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"阶段1耗时\"},{\"columnName\":\"step2_cost\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"阶段2耗时\"},{\"columnName\":\"step3_cost\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"阶段3耗时\"},{\"columnName\":\"state\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"状态，1：成功，2：加载失败\"},{\"columnName\":\"net\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户网络类型，1:3G；2:4G；3:5G；4:WIFI;\"},{\"columnName\":\"os\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户手机系统，1：IOS，2：Android\"},{\"columnName\":\"app_version\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"APP版本号\"}]',1,'5cqJ1p4lGsgtt31bPNuuzEXdo5njjsXJ','2023-08-03 18:44:49','2023-08-03 19:00:36','0',1,NULL,NULL,'2023-08-03 19:06:08'),(100140,'ai_shortvideo_training_monitor','11027',0,'[{\"columnName\":\"model_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"模型ID\"},{\"columnName\":\"training_cost\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"模型训练耗时\"},{\"columnName\":\"positive_size\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"正样本数量\"},{\"columnName\":\"negative_size\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"负样本数量\"},{\"columnName\":\"auc\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"模型AUC指标\"},{\"columnName\":\"training_batch\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"训练批次\"},{\"columnName\":\"model_size\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"生成模型文件的大小\"},{\"columnName\":\"state\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"训练结果，1：成功，2：失败\"}]',1,'xwyjuDiEj3ctku559lb9EfAP9us0iGXK','2023-08-03 21:23:57','2023-08-03 21:26:20','0',1,NULL,NULL,'2023-08-03 21:26:20'),(100141,'pm_feednews_behavior_stat','11028',1,'[{\"columnName\":\"request_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"请求ID\"},{\"columnName\":\"imei\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户ID\"},{\"columnName\":\"recall_no\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"召回策略模型\"},{\"columnName\":\"abtest_no\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"ABTest策略模型\"},{\"columnName\":\"rank_no\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"Rank模型模型\"},{\"columnName\":\"tab\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"Tab栏，新闻热点、娱乐、影视、科技\"},{\"columnName\":\"behavior_type\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户行为类型，1:曝光，2:点击，3:点赞，4:分享，5:评论\"},{\"columnName\":\"item_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"帖子ID\"},{\"columnName\":\"top_level\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"帖子一级分类\"},{\"columnName\":\"sec_level\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"帖子二级分类\"},{\"columnName\":\"province\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户所在省份\"},{\"columnName\":\"city\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户所在城市\"},{\"columnName\":\"app_version\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"APP版本\"},{\"columnName\":\"os\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户手机系统，1：IOS，2：Android\"}]',1,'QE5aLwkEWJj80CoDdzftoFeUDq5Jh4WR','2023-08-03 21:52:01','2023-08-04 21:17:55','0',1,NULL,'{\"startTime\":1691155074780,\"endTime\":1691156874780}','2023-08-04 21:17:55'),(100142,'ops_nodes_run_status_monitor','11029',0,'[{\"columnName\":\"idc_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"数据中心机房ID\"},{\"columnName\":\"region_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"机位ID\"},{\"columnName\":\"cabinet_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"机柜ID\"},{\"columnName\":\"mac\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"服务器Mac地址\"},{\"columnName\":\"ip\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"节点IP\"},{\"columnName\":\"mem\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"内存使用量\"},{\"columnName\":\"mem_rate\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"内存使用率\"},{\"columnName\":\"cpu_rate\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"CPU使用率\"},{\"columnName\":\"disk\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"磁盘使用量\"},{\"columnName\":\"disk_rate\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"磁盘使用率\"},{\"columnName\":\"io_wait\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"IO等待时间\"},{\"columnName\":\"in_bytes\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"入网络流量\"},{\"columnName\":\"out_bytes\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"出网络流量\"},{\"columnName\":\"loadaverage\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"节点负载\"},{\"columnName\":\"r_iops\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"磁盘读IOPS\"},{\"columnName\":\"w_iops\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"磁盘写IOPS\"}]',1,'EYYA2wMJZjOEU9Gx0LDzES9ofdklPRax','2023-08-04 10:31:57','2023-08-04 12:03:50','0',1,NULL,NULL,'2023-08-04 12:03:50'),(100143,'ops_nodes_load_state_monitor','11029',0,'[{\"columnName\":\"idc_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"数据中心ID\"},{\"columnName\":\"region_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"机位ID\"},{\"columnName\":\"cabinet_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"机柜ID\"},{\"columnName\":\"ip\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"节点IP\"},{\"columnName\":\"load_average\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"节点负载\"},{\"columnName\":\"load_state\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"节点负载状态，1：负载正常，2：负载过高，3：服务器空闲\"}]',1,'3Xzc53roDmJxBXwBs7VWeIBqwUEd46LL','2023-08-04 12:10:38','2023-08-04 12:11:34','0',1,NULL,NULL,'2023-08-04 12:11:34'),(100144,'ops_nodes_login_state_monitor','11029',0,'[{\"columnName\":\"idc_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"机房ID\"},{\"columnName\":\"ip\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"节点IP\"},{\"columnName\":\"login_name\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"登录用户名\"},{\"columnName\":\"state\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"登录状态,1:登录成功，2:登录失败\"},{\"columnName\":\"user_ip\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"登录用户IP\"}]',1,'njmzHhzWDyuMXdshJMtRAYsZz0yB7pFK','2023-08-04 12:25:14','2023-08-04 13:49:50','0',1,NULL,'{\"startTime\":1691123652006,\"endTime\":1691125452006}','2023-08-04 12:34:12'),(100145,'it_kvdb_request_monitor','11032',0,'[{\"columnName\":\"clusterId\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"KV实例ID\"},{\"columnName\":\"in_bytes\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"请求数据包大小\"},{\"columnName\":\"out_bytes\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"返回数据包大小\"},{\"columnName\":\"cmd\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"操作命令，包括：put、get、del、zadd、scan...\"},{\"columnName\":\"key\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"操作key，假设平台约定使用#号分割，前面部分为Key前缀\"},{\"columnName\":\"cost\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"请求耗时\"},{\"columnName\":\"ip\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"节点IP\"},{\"columnName\":\"request_ip\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"请求IP\"}]',1,'loG16sS1bIBhjkoLxtEGLuxVmPnNePGl','2023-08-04 13:15:02','2023-08-04 13:45:57','0',1,NULL,NULL,'2023-08-04 13:45:57'),(100146,'pm_social_privatechat_msg_dt','11033',0,'[{\"columnName\":\"userId\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"消息发送方ID\"},{\"columnName\":\"type\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"消息类型1:文字,2:表情,3:语音,4:视频通话...\"},{\"columnName\":\"province\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户所在省份\"},{\"columnName\":\"city\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户所在城市\"},{\"columnName\":\"sex\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户性别\"},{\"columnName\":\"age\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户年龄段\"},{\"columnName\":\"education\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"学历\"},{\"columnName\":\"os\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户手机系统\"},{\"columnName\":\"version\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"App版本\"}]',1,'itvnwRgP1T6A2CpSEv4Vvuk4AWqhfsbd','2023-08-04 14:38:10','2023-08-04 14:57:40','0',1,NULL,NULL,'2023-08-04 14:57:40'),(100147,'pm_social_private_envelope_dt','11033',0,'[{\"columnName\":\"enveloperId\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"红包ID\"},{\"columnName\":\"event_type\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"消息类型，1：发送，2：接收，3：拒收，4：超时退回\"},{\"columnName\":\"amount\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"红包金额\"},{\"columnName\":\"sender_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"发送人ID\"},{\"columnName\":\"receiver_id\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"接收人ID\"},{\"columnName\":\"province\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"发送人所在省份\"},{\"columnName\":\"city\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"发送人所在城市\"},{\"columnName\":\"age\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"发送人年龄段\"},{\"columnName\":\"sex\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"发送人性别\"}]',1,'nUNjlq1Oq7T2VBipytoOih0X8Lwq1qTk','2023-08-04 15:31:38','2023-08-04 15:51:47','0',1,NULL,NULL,'2023-08-04 15:51:47'),(100148,'om_appstart_dau_stat','11034',0,'[{\"columnName\":\"imei\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户标识\"},{\"columnName\":\"province\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"省份\"},{\"columnName\":\"city\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"城市\"},{\"columnName\":\"app_version\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"App版本\"},{\"columnName\":\"os\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户手机系统，1：IOS，2：Android\"},{\"columnName\":\"net\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户网络环境，1：3G，2：4G，3：5G，4：WIFI\"},{\"columnName\":\"channel\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"打开渠道，1:主动打开,2:Push调起,3:Wap调起,4:外部广告调起\"}]',1,'y9xyBrK2cMtQEndi71nb0aeyNF61ypTz','2023-08-04 16:27:30','2023-08-04 16:42:16','0',1,NULL,NULL,'2023-08-04 16:42:16'),(100149,'om_dau_promote_monitor','11034',0,'[{\"columnName\":\"imei\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户标识\"},{\"columnName\":\"province\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户所在省份\"},{\"columnName\":\"city\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户所在城市\"},{\"columnName\":\"from\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"来源渠道，1：微信，2：微博，3：抖音，4：腾讯新闻...\"}]',1,'b9ugYk5IagKPdZAtnM3SEg2e94T4cgZQ','2023-08-04 16:57:42','2023-08-04 16:57:42','0',1,NULL,NULL,'2023-08-04 16:57:42'),(100151,'biz_house_price_change_dt','11036',0,'[{\"columnName\":\"houseId\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"房源ID\"},{\"columnName\":\"province\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"房源所在省份\"},{\"columnName\":\"city\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"房源所在城市\"},{\"columnName\":\"town\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"区县ID\"},{\"columnName\":\"district\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"商圈ID\"},{\"columnName\":\"change_type\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"价格调整类型，1：上涨，2：下降\"},{\"columnName\":\"rate\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"调整比率\"},{\"columnName\":\"age\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"房龄区间，1:5年内,2:5-10年,3:10-20年,4:20-30年,5:30年以上\"},{\"columnName\":\"quality\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"房源优质度，1：低档，2：普通，3：高档，4：豪华\"}]',1,'dI3T1lxxRUGKzZT9nvBKSiqERmMOQDHa','2023-08-04 17:42:27','2023-08-04 17:57:28','0',1,NULL,NULL,'2023-08-04 17:57:28'),(100152,'biz_order_stat','11035',0,'[{\"columnName\":\"userId\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户ID\"},{\"columnName\":\"orderId\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"订单ID\"},{\"columnName\":\"supplierId\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"商户ID\"},{\"columnName\":\"age\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户年龄段\"},{\"columnName\":\"sex\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户性别\"},{\"columnName\":\"province\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"省份\"},{\"columnName\":\"city\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"城市\"},{\"columnName\":\"os\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户手机系统\"},{\"columnName\":\"amount\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"订单金额\"},{\"columnName\":\"paymode\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"支付方式,1:银行卡,2:信用卡,3:微信,4:支付宝,5:白条\"},{\"columnName\":\"version\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"App版本\"}]',1,'7RJ3DSpzeYRLN82q2r68AtpiIq2QeiFY','2023-08-04 18:13:50','2023-08-04 20:49:42','0',1,NULL,NULL,'2023-08-04 20:49:42'),(100153,'biz_order_conversion_rate','11035',0,'[{\"columnName\":\"orderId\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"订单ID\"},{\"columnName\":\"action_type\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户操作，1：点击，2：下单，3：支付，4：成功，5：退款\"},{\"columnName\":\"userId\",\"columnType\":1,\"columnLength\":-1,\"columnComment\":\"用户ID\"},{\"columnName\":\"amount\",\"columnType\":2,\"columnLength\":-1,\"columnComment\":\"订单金额\"}]',1,'AE0j79xVILcN3lP9PnXFW359N6ZHGJ7X','2023-08-04 21:06:28','2023-08-04 21:08:33','0',1,NULL,NULL,'2023-08-04 21:08:33');
/*!40000 ALTER TABLE `ldp_stat_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_stat_item`
--

DROP TABLE IF EXISTS `ldp_stat_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_stat_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `group_id` int NOT NULL,
  `project_id` int DEFAULT NULL,
  `template` varchar(500) NOT NULL,
  `time_param` varchar(50) DEFAULT NULL,
  `state` int DEFAULT NULL,
  `filter_config` varchar(500) DEFAULT NULL,
  `data_volume` int DEFAULT NULL,
  `data_expire` bigint NOT NULL,
  `res_meta` int DEFAULT NULL,
  `sequence_flag` tinyint NOT NULL,
  `display_type` int DEFAULT NULL,
  `data_version` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_state` (`state`),
  KEY `index_group_id` (`group_id`),
  KEY `index_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1100462 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_stat_item`
--

LOCK TABLES `ldp_stat_item` WRITE;
/*!40000 ALTER TABLE `ldp_stat_item` DISABLE KEYS */;
INSERT INTO `ldp_stat_item` VALUES (1100266,'每分钟_接口平均耗时',100135,11025,'<stat-item title=\"每分钟_接口平均耗时\" stat=\"avg(cost)\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 17:32:16','2023-08-03 17:32:40',110032),(1100267,'每分钟_各接口_平均耗时',100135,11025,'<stat-item title=\"每分钟_各接口_平均耗时\" stat=\"avg(cost)\" dimens=\"interface\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 17:34:13','2023-08-03 17:34:13',110032),(1100268,'每分钟_各服务器_平均耗时',100135,11025,'<stat-item title=\"每分钟_各服务器_平均耗时\" stat=\"avg(cost)\" dimens=\"ip\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 17:37:22','2023-08-03 17:37:22',110032),(1100269,'每分钟_各服务器_各接口_平均耗时',100135,11025,'<stat-item title=\"每分钟_各服务器_各接口_平均耗时\" stat=\"avg(cost)\" dimens=\"ip;interface\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 17:37:22','2023-08-03 17:37:22',110032),(1100270,'每分钟_服务总调用量',100135,11025,'<stat-item title=\"每分钟_服务总调用量\" stat=\"count()\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 17:37:22','2023-08-03 17:37:22',110032),(1100271,'每分钟_各接口_调用量',100135,11025,'<stat-item title=\"每分钟_各接口_调用量\" stat=\"count()\" dimens=\"interface\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 17:37:22','2023-08-03 17:37:22',110032),(1100272,'每分钟_各服务器_各接口_调用量',100135,11025,'<stat-item title=\"每分钟_各服务器_各接口_调用量\" stat=\"count()\" dimens=\"ip;interface\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 17:37:22','2023-08-03 17:37:22',110032),(1100273,'每10分钟_各接口_各耗时区间_请求量',100135,11025,'<stat-item title=\"每10分钟_各接口_各耗时区间_请求量\" stat=\"count()\" dimens=\"interface;section(cost,\'2,5,10,50,100\')\"/>','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 17:44:03','2023-08-03 17:44:03',110032),(1100274,'每5分钟_各接口_异常率',100135,11025,'<stat-item title=\"每5分钟_各接口_异常率\" stat=\"count(state == \'2\')/count()\" dimens=\"interface\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 17:44:03','2023-08-03 17:44:03',110032),(1100276,'每分钟_总召回帖子量',100137,11025,'<stat-item title=\"每分钟_总召回帖子量\" stat=\"sum(item_size)\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 18:09:56','2023-08-03 18:09:56',110032),(1100277,'每5分钟_各召回策略_召回量',100137,11025,'<stat-item title=\"每5分钟_各召回策略_召回量\" stat=\"sum(item_size)\" dimens=\"recall_no\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 18:09:56','2023-08-03 18:09:56',110032),(1100278,'每5分钟_各ABTest_召回量',100137,11025,'<stat-item title=\"每5分钟_各ABTest_召回量\" stat=\"sum(item_size)\" dimens=\"abtest_no\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 18:09:56','2023-08-03 18:09:56',110032),(1100279,'每5分钟_平均耗时',100138,11025,'<stat-item title=\"每5分钟_平均耗时\" stat=\"avg(cost)\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 18:14:38','2023-08-03 18:14:38',110032),(1100280,'每5分钟_各召回策略_平均耗时',100138,11025,'<stat-item title=\"每5分钟_各召回策略_平均耗时\" stat=\"avg(cost)\" dimens=\"recall_no\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 18:14:38','2023-08-03 18:14:38',110032),(1100282,'每分钟_各APP版本_广告加载次数',100139,11026,'<stat-item title=\"每分钟_各APP版本_广告加载次数\" stat=\"count()\" dimens=\"app_version\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 18:51:32','2023-08-03 18:51:32',110033),(1100283,'每分钟_各系统_广告加载次数',100139,11026,'<stat-item title=\"每分钟_各系统_广告加载次数\" stat=\"count()\" dimens=\"os\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 18:51:32','2023-08-03 19:05:59',110033),(1100284,'每分钟_各系统_广告加载次数',100139,11026,'<stat-item title=\"每分钟_各系统_广告加载次数\" stat=\"count()\" dimens=\"os\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 18:51:32','2023-08-03 18:51:32',110033),(1100285,'每分钟_广告加载平均耗时',100139,11026,'<stat-item title=\"每分钟_广告加载平均耗时\" stat=\"avg(cost)\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 18:51:32','2023-08-03 18:51:32',110033),(1100286,'每5分钟_加载异常率',100139,11026,'<stat-item title=\"每5分钟_加载异常率\" stat=\"count(state == \'2\')/count()\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 18:51:32','2023-08-03 18:51:32',110033),(1100287,'每5分钟_加载异常量',100139,11026,'<stat-item title=\"每5分钟_加载异常量\" stat=\"count(state == \'2\')\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 18:51:32','2023-08-03 18:51:32',110033),(1100288,'每10分钟_各系统_各版本_异常量',100139,11026,'<stat-item title=\"每10分钟_各系统_各版本_异常量\" stat=\"count(state == \'2\')\" dimens=\"os;app_version\"/>','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 18:51:32','2023-08-03 18:51:32',110033),(1100289,'每5分钟_处理阶段1_平均耗时',100139,11026,'<stat-item title=\"每5分钟_处理阶段1_平均耗时\" stat=\"avg(step1_cost)\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 19:00:36','2023-08-03 19:00:36',110033),(1100290,'每5分钟_处理阶段2_平均耗时',100139,11026,'<stat-item title=\"每5分钟_处理阶段2_平均耗时\" stat=\"avg(step2_cost)\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 19:00:36','2023-08-03 19:00:36',110033),(1100291,'每5分钟_处理阶段3_平均耗时',100139,11026,'<stat-item title=\"每5分钟_处理阶段3_平均耗时\" stat=\"avg(step3_cost)\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 19:00:36','2023-08-03 19:00:36',110033),(1100292,'每5分钟_各系统_各耗时区间_请求量',100139,11026,'<stat-item title=\"每5分钟_各系统_各耗时区间_请求量\" stat=\"count()\" dimens=\"os;section(cost,\'5,20,50,100,300\')\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 19:00:36','2023-08-03 19:00:36',110033),(1100293,'每天_模型训练总次数',100140,11027,'<stat-item  title=\"每天_模型训练总次数\" stat=\"count()\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 21:23:56','2023-08-03 21:23:56',110034),(1100294,'每天_各模型_训练次数',100140,11027,'<stat-item  title=\"每天_各模型_训练次数\" stat=\"count()\" dimens=\"model_id\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 21:23:56','2023-08-03 21:23:56',110034),(1100295,'每天_各模型_正负样本比率',100140,11027,'<stat-item  title=\"每天_各模型_正负样本比率\" stat=\"sum(positive_size)/sum(negative_size)\" dimens=\"model_id\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 21:23:56','2023-08-03 21:23:56',110034),(1100296,'每天_各模型_平均auc',100140,11027,'<stat-item  title=\"每天_各模型_平均auc\" stat=\"avg(auc)\" dimens=\"model_id\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 21:23:56','2023-08-03 21:23:56',110034),(1100297,'每天_各模型_各批次_平均auc',100140,11027,'<stat-item  title=\"每天_各模型_各批次_平均auc\" stat=\"seq(auc)\" dimens=\"model_id;training_batch\"/>','1-day',1,NULL,NULL,1209600,10013,1,0,0,'2023-08-03 21:23:56','2023-08-03 21:23:56',110034),(1100298,'每天_各模型_各批次_生成文件大小',100140,11027,'<stat-item  title=\"每天_各模型_各批次_生成文件大小\" stat=\"seq(model_size)\" dimens=\"model_id;training_batch\"/>','1-day',1,NULL,NULL,1209600,10013,1,0,0,'2023-08-03 21:26:19','2023-08-03 21:26:19',110034),(1100299,'每天_各模型_各批次_耗时',100140,11027,'<stat-item  title=\"每天_各模型_各批次_耗时\" stat=\"seq(training_cost)\" dimens=\"model_id;training_batch\"/>','1-day',1,NULL,NULL,1209600,10013,1,0,0,'2023-08-03 21:26:19','2023-08-03 21:26:19',110034),(1100300,'每天_各模型_训练成功率',100140,11027,'<stat-item  title=\"每天_各模型_训练成功率\" stat=\"count(state == \'1\')/count()\" dimens=\"model_id\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 21:26:19','2023-08-03 21:26:19',110034),(1100301,'每分钟_各行为类型_日志量',100141,11028,'<stat-item title=\"每分钟_各行为类型_日志量\" stat=\"count()\" dimens=\"behavior_type\" />','1-minute',1,NULL,NULL,259200,10012,0,0,0,'2023-08-03 21:52:00','2023-08-03 22:20:06',110035),(1100302,'每分钟_访问用户数',100141,11028,'<stat-item title=\"每分钟_访问用户数\" stat=\"bitcount(imei)\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:04:22','2023-08-03 22:04:22',110035),(1100303,'每分钟_各行为类型_用户量',100141,11028,'<stat-item title=\"每分钟_各行为类型_用户量\" stat=\"bitcount(imei)\" dimens=\"behavior_type\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:04:22','2023-08-03 22:04:22',110035),(1100304,'每分钟_各召回号_各行为类型_日志量',100141,11028,'<stat-item title=\"每分钟_各召回号_各行为类型_日志量\" stat=\"count()\" dimens=\"recall_no;behavior_type\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:04:22','2023-08-03 22:04:22',110035),(1100305,'每分钟_各召回策略_覆盖用户数',100141,11028,'<stat-item title=\"每分钟_各召回策略_覆盖用户数\" stat=\"bitcount(imei)\" dimens=\"recall_no\" />','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:04:22','2023-08-04 07:09:46',110035),(1100306,'每分钟_各APP版本_访问用户量',100141,11028,'<stat-item title=\"每分钟_各APP版本_访问用户量\" stat=\"bitcount(imei)\" dimens=\"app_version\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:04:22','2023-08-03 22:04:22',110035),(1100307,'每分钟_各OS_各APP版本_访问用户量',100141,11028,'<stat-item title=\"每分钟_各OS_各APP版本_访问用户量\" stat=\"bitcount(imei)\" dimens=\"os;app_version\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:04:22','2023-08-03 22:04:22',110035),(1100308,'每天_点击率',100141,11028,'<stat-item title=\"每天_点击率\" stat=\"count(behavior_type == \'2\')/count(behavior_type == \'1\')\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:08:15','2023-08-03 22:08:15',110035),(1100309,'每天_各召回_点击率',100141,11028,'<stat-item title=\"每天_各召回_点击率\" stat=\"count(behavior_type == \'2\')/count(behavior_type == \'1\')\" dimens=\"recall_no\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:08:15','2023-08-03 22:08:15',110035),(1100310,'每天_各ABTest_点击率',100141,11028,'<stat-item title=\"每天_各ABTest_点击率\" stat=\"count(behavior_type == \'2\')/count(behavior_type == \'1\')\" dimens=\"abtest_no\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:08:15','2023-08-03 22:08:15',110035),(1100311,'每天_各一级分类_点击率',100141,11028,'<stat-item title=\"每天_各一级分类_点击率\" stat=\"count(behavior_type == \'2\')/count(behavior_type == \'1\')\" dimens=\"top_level\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:08:15','2023-08-03 22:08:15',110035),(1100312,'每天_各Rank模型_点击率',100141,11028,'<stat-item title=\"每天_各Rank模型_点击率\" stat=\"count(behavior_type == \'2\')/count(behavior_type == \'1\')\" dimens=\"rank_no\"/>','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:08:15','2023-08-03 22:08:15',110035),(1100313,'每天_各省份_访问用户数',100141,11028,'<stat-item title=\"每天_各省份_访问用户数\" stat=\"bitcount(imei)\" dimens=\"province\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:09:56','2023-08-03 22:09:56',110035),(1100314,'每天_各召回策略_帖子下发量',100141,11028,'<stat-item title=\"每天_各召回策略_帖子下发量\" stat=\"bitcount(item_id)\" dimens=\"recall_no\" />','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:09:56','2023-08-04 07:09:28',110035),(1100315,'每天_各一级分类_帖子下发量',100141,11028,'<stat-item title=\"每天_各一级分类_帖子下发量\" stat=\"bitcount(item_id)\" dimens=\"top_level\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:11:05','2023-08-03 22:11:05',110035),(1100316,'每天_各二级分类_帖子下发量',100141,11028,'<stat-item title=\"每天_各二级分类_帖子下发量\" stat=\"bitcount(item_id)\" dimens=\"top_level;sec_level\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:11:05','2023-08-03 22:11:05',110035),(1100317,'每天_各Tab栏_访问用户数',100141,11028,'<stat-item title=\"每天_各Tab栏_访问用户数\" stat=\"bitcount(imei)\" dimens=\"tab\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:12:31','2023-08-03 22:12:31',110035),(1100318,'每天_各Tab栏_点击率',100141,11028,'<stat-item title=\"每天_各Tab栏_点击率\" stat=\"count(behavior_type == \'2\')/count(behavior_type == \'1\')\" dimens=\"tab\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-03 22:12:31','2023-08-03 22:12:31',110035),(1100320,'每分钟_总心跳包数量',100142,11029,'<stat-item title=\"每分钟_总心跳包数量\" stat=\"count()\" />','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:07:31','2023-08-04 11:07:31',110036),(1100321,'每分钟_各IDC_心跳包数量',100142,11029,'<stat-item title=\"每分钟_各IDC_心跳包数量\" stat=\"count()\" dimens=\"idc_id\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:07:31','2023-08-04 11:07:31',110036),(1100322,'每分钟_各节点_心跳包数量',100142,11029,'<stat-item title=\"每分钟_各节点_心跳包数量\" stat=\"count()\" dimens=\"idc_id;ip\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:07:31','2023-08-04 11:07:31',110036),(1100323,'每分钟_各节点_CPU使用率',100142,11029,'<stat-item title=\"每分钟_各节点_CPU使用率\" stat=\"avg(cpu_rate)\" dimens=\"idc_id;ip\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:07:31','2023-08-04 11:07:31',110036),(1100324,'每5分钟_各节点_CPU使用率',100142,11029,'<stat-item title=\"每5分钟_各节点_CPU使用率\" stat=\"avg(cpu_rate)\" dimens=\"idc_id;ip\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:07:31','2023-08-04 11:07:31',110036),(1100325,'每分钟_各节点_内存使用率',100142,11029,'<stat-item title=\"每分钟_各节点_内存使用率\" stat=\"avg(mem_rate)\" dimens=\"idc_id;ip\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:07:31','2023-08-04 11:07:31',110036),(1100326,'每5分钟_各节点_内存使用率',100142,11029,'<stat-item title=\"每5分钟_各节点_内存使用率\" stat=\"avg(mem_rate)\" dimens=\"idc_id;ip\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:07:31','2023-08-04 11:07:31',110036),(1100327,'每5分钟_各节点_磁盘使用率',100142,11029,'<stat-item title=\"每5分钟_各节点_磁盘使用率\" stat=\"avg(disk_rate)\" dimens=\"idc_id;ip\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:07:31','2023-08-04 11:07:31',110036),(1100328,'每分钟_各节点_入流量',100142,11029,'<stat-item title=\"每分钟_各节点_入流量\" stat=\"sum(in_bytes)\" dimens=\"idc_id;ip\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:24:07','2023-08-04 11:24:07',110036),(1100329,'每分钟_各节点_出流量',100142,11029,'<stat-item title=\"每分钟_各节点_出流量\" stat=\"sum(out_bytes)\" dimens=\"idc_id;ip\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:24:07','2023-08-04 11:24:07',110036),(1100330,'每5分钟_各节点_入流量',100142,11029,'<stat-item title=\"每5分钟_各节点_入流量\" stat=\"sum(in_bytes)\" dimens=\"idc_id;ip\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:24:07','2023-08-04 11:24:07',110036),(1100331,'每5分钟_各节点_出流量',100142,11029,'<stat-item title=\"每5分钟_各节点_出流量\" stat=\"sum(out_bytes)\" dimens=\"idc_id;ip\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:24:07','2023-08-04 11:24:07',110036),(1100332,'每5分钟_各节点_平均IO-Wait时间',100142,11029,'<stat-item title=\"每5分钟_各节点_平均IO-Wait时间\" stat=\"avg(io_wait)\" dimens=\"idc_id;ip\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:24:07','2023-08-04 11:24:07',110036),(1100333,'每5分钟_各节点_平均读IOPS时间',100142,11029,'<stat-item title=\"每5分钟_各节点_平均读IOPS时间\" stat=\"avg(r_iops)\" dimens=\"idc_id;ip\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:25:08','2023-08-04 11:25:08',110036),(1100334,'每5分钟_各节点_平均写IOPS时间',100142,11029,'<stat-item title=\"每5分钟_各节点_平均写IOPS时间\" stat=\"avg(w_iops)\" dimens=\"idc_id;ip\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 11:25:08','2023-08-04 11:25:08',110036),(1100335,'每分钟_平均负载',100142,11029,'<stat-item title=\"每分钟_平均负载\" stat=\"avg(loadaverage)\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 12:03:50','2023-08-04 12:03:50',110036),(1100336,'每分钟_各IDC_平均负载',100142,11029,'<stat-item title=\"每分钟_各IDC_平均负载\" stat=\"avg(loadaverage)\" dimens=\"idc_id\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 12:03:50','2023-08-04 12:03:50',110036),(1100337,'每分钟_各IDC_各节点_平均负载',100142,11029,'<stat-item title=\"每分钟_各IDC_各节点_平均负载\" stat=\"avg(loadaverage)\" dimens=\"idc_id;ip\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 12:03:50','2023-08-04 12:03:50',110036),(1100338,'每5分钟_各负载状态_节点数量',100143,11029,'<stat-item title=\"每5分钟_各负载状态_节点数量\" stat=\"bitcount(ip)\" dimens=\"load_state\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 12:10:38','2023-08-04 12:10:38',110036),(1100339,'每小时_各负载状态_节点数量',100143,11029,'<stat-item title=\"每小时_各负载状态_节点数量\" stat=\"bitcount(ip)\" dimens=\"load_state\"/>','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 12:11:34','2023-08-04 12:11:34',110036),(1100340,'每10分钟_服务器登录次数',100144,11029,'<stat-item title=\"每10分钟_服务器登录次数\" stat=\"count()\"/>','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 12:25:14','2023-08-04 12:25:14',110036),(1100341,'每10分钟_各状态_登录次数',100144,11029,'<stat-item title=\"每10分钟_各状态_登录次数\" stat=\"count()\" dimens=\"state\"/>','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 12:25:14','2023-08-04 12:25:14',110036),(1100342,'每10分钟_各机房_各状态_登录次数',100144,11029,'<stat-item title=\"每10分钟_各机房_各状态_登录次数\" stat=\"count()\" dimens=\"idc_id;state\"/>','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 12:25:14','2023-08-04 12:25:14',110036),(1100343,'每10分钟_各机房_IP_各状态_登录次数',100144,11029,'<stat-item title=\"每10分钟_各机房_IP_各状态_登录次数\" stat=\"count()\" dimens=\"idc_id;ip;state\"/>','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 12:25:14','2023-08-04 12:25:14',110036),(1100344,'每10分钟_各机房_登录失败次数',100144,11029,'<stat-item title=\"每10分钟_各机房_登录失败次数\" stat=\"count(state == \'2\')\" dimens=\"idc_id\"/>','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 12:25:14','2023-08-04 12:25:14',110036),(1100345,'每10分钟_各机房_失败人数',100144,11029,'<stat-item title=\"每10分钟_各机房_失败人数\" stat=\"bitcount(user_ip,state == \'2\')\" dimens=\"idc_id\"/>','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 12:25:14','2023-08-04 12:25:14',110036),(1100346,'每分钟_总请求次数',100145,11032,'<stat-item  title=\"每分钟_总请求次数\" stat=\"count()\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 13:15:01','2023-08-04 13:15:01',110036),(1100347,'每分钟_各实例_请求次数',100145,11032,'<stat-item  title=\"每分钟_各实例_请求次数\" stat=\"count()\" dimens=\"clusterId\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 13:24:09','2023-08-04 13:24:09',110036),(1100348,'每分钟_各实例_各IP_请求次数',100145,11032,'<stat-item  title=\"每分钟_各实例_各IP_请求次数\" stat=\"count()\" dimens=\"clusterId;ip\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 13:24:09','2023-08-04 13:24:09',110036),(1100349,'每分钟_各实例_各IP_请求数据量',100145,11032,'<stat-item  title=\"每分钟_各实例_各IP_请求数据量\" stat=\"sum(in_bytes)\" dimens=\"clusterId;ip\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 13:35:28','2023-08-04 13:35:28',110036),(1100350,'每分钟_各实例_各IP_返回数据量',100145,11032,'<stat-item  title=\"每分钟_各实例_各IP_返回数据量\" stat=\"sum(out_bytes)\" dimens=\"clusterId;ip\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 13:35:28','2023-08-04 13:35:28',110036),(1100351,'每5分钟_各实例_IP_命令_请求数据量',100145,11032,'<stat-item  title=\"每5分钟_各实例_IP_命令_请求数据量\" stat=\"sum(in_bytes)\" dimens=\"clusterId;ip;cmd\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 13:35:28','2023-08-04 13:35:28',110036),(1100352,'每5分钟_各实例_IP_命令_返回数据量',100145,11032,'<stat-item  title=\"每5分钟_各实例_IP_命令_返回数据量\" stat=\"sum(out_bytes)\" dimens=\"clusterId;ip;cmd\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 13:35:28','2023-08-04 13:35:28',110036),(1100353,'每5分钟_各实例_各命令_平均耗时',100145,11032,'<stat-item  title=\"每5分钟_各实例_各命令_平均耗时\" stat=\"avg(cost)\" dimens=\"clusterId;cmd\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 13:37:32','2023-08-04 13:37:32',110036),(1100356,'每5分钟_各实例_命令_前缀_Req数据量',100145,11032,'<stat-item  title=\"每5分钟_各实例_命令_前缀_Req数据量\" stat=\"sum(in_bytes)\" dimens=\"clusterId;cmd;split(key,\'#\',0)\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 13:45:56','2023-08-04 13:45:56',110036),(1100357,'每5分钟_各实例_命令_前缀_Rep数据量',100145,11032,'<stat-item  title=\"每5分钟_各实例_命令_前缀_Rep数据量\" stat=\"sum(out_bytes)\" dimens=\"clusterId;cmd;split(key,\'#\',0)\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 13:45:56','2023-08-04 13:45:56',110036),(1100358,'每分钟_发送消息量',100146,11033,'<stat-item title=\"每分钟_发送消息量\" stat=\"count()\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:38:09','2023-08-04 14:38:09',110035),(1100359,'每小时_发送消息量',100146,11033,'<stat-item title=\"每小时_发送消息量\" stat=\"count()\"/>','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100360,'每天_发送消息量',100146,11033,'<stat-item title=\"每天_发送消息量\" stat=\"count()\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100361,'每小时_各类型_消息发送量',100146,11033,'<stat-item title=\"每小时_各类型_消息发送量\" stat=\"count()\" dimens=\"type\"/>','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100362,'每天_各类型_消息发送量',100146,11033,'<stat-item title=\"每天_各类型_消息发送量\" stat=\"count()\" dimens=\"type\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100363,'每天_各省份_消息发送量',100146,11033,'<stat-item title=\"每天_各省份_消息发送量\" stat=\"count()\" dimens=\"province\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100364,'每天_各城市_消息发送量',100146,11033,'<stat-item title=\"每天_各城市_消息发送量\" stat=\"count()\" dimens=\"province;city\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100365,'每天_各性别人群_消息发送量',100146,11033,'<stat-item title=\"每天_各性别人群_消息发送量\" stat=\"count()\" dimens=\"sex\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100366,'每天_各学历人群_消息发送量',100146,11033,'<stat-item title=\"每天_各学历人群_消息发送量\" stat=\"count()\" dimens=\"education\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100367,'每分钟_消息发送人数',100146,11033,'<stat-item title=\"每分钟_消息发送人数\" stat=\"bitcount(userId)\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100368,'每小时_消息发送人数',100146,11033,'<stat-item title=\"每小时_消息发送人数\" stat=\"bitcount(userId)\"/>','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100369,'每天_消息发送人数',100146,11033,'<stat-item title=\"每天_消息发送人数\" stat=\"bitcount(userId)\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100370,'每天_各APP版本_消息发送量',100146,11033,'<stat-item title=\"每天_各APP版本_消息发送量\" stat=\"count()\" dimens=\"version\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100371,'每天_各APP版本_消息发送人数',100146,11033,'<stat-item title=\"每天_各APP版本_消息发送人数\" stat=\"bitcount(userId)\" dimens=\"version\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:55:24','2023-08-04 14:55:24',110035),(1100372,'每天_人均发送消息量',100146,11033,'<stat-item title=\"每天_人均发送消息量\" stat=\"count()/bitcount(userId)\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:57:39','2023-08-04 14:57:39',110035),(1100373,'每天_各类型_人均发送消息量',100146,11033,'<stat-item title=\"每天_各类型_人均发送消息量\" stat=\"count()/bitcount(userId)\" dimens=\"type\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:57:39','2023-08-04 14:57:39',110035),(1100374,'每天_各年龄段_人均发送消息量',100146,11033,'<stat-item title=\"每天_各年龄段_人均发送消息量\" stat=\"count()/bitcount(userId)\" dimens=\"age\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 14:57:39','2023-08-04 14:57:39',110035),(1100377,'每分钟_红包发送量',100147,11033,'<stat-item title=\"每分钟_红包发送量\" stat=\"count(event_type == \'1\')\" />','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100378,'每小时_红包发送量',100147,11033,'<stat-item title=\"每小时_红包发送量\" stat=\"count(event_type == \'1\')\" />','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100379,'每天_红包发送量',100147,11033,'<stat-item title=\"每天_红包发送量\" stat=\"count(event_type == \'1\')\" />','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100380,'每小时_各操作类型_红包数量',100147,11033,'<stat-item title=\"每小时_各操作类型_红包数量\" stat=\"count()\" dimens=\"event_type\"/>','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100381,'每天_各操作类型_红包数量',100147,11033,'<stat-item title=\"每天_各操作类型_红包数量\" stat=\"count()\" dimens=\"event_type\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100382,'每小时_红包发送人数',100147,11033,'<stat-item title=\"每小时_红包发送人数\" stat=\"bitcount(sender_id,event_type == \'1\')\"/>','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100383,'每天_红包发送人数',100147,11033,'<stat-item title=\"每天_红包发送人数\" stat=\"bitcount(sender_id,event_type == \'1\')\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100384,'每天_各省份_红包发送人数',100147,11033,'<stat-item title=\"每天_各省份_红包发送人数\" stat=\"bitcount(sender_id,event_type == \'1\')\" dimens=\"province\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100385,'每天_各城市_红包发送人数',100147,11033,'<stat-item title=\"每天_各城市_红包发送人数\" stat=\"bitcount(sender_id,event_type == \'1\')\" dimens=\"province;city\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100386,'每天_各性别_红包发送人数',100147,11033,'<stat-item title=\"每天_各性别_红包发送人数\" stat=\"bitcount(sender_id,event_type == \'1\')\" dimens=\"sex\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100387,'每天_各年龄段_红包发送人数',100147,11033,'<stat-item title=\"每天_各年龄段_红包发送人数\" stat=\"bitcount(sender_id,event_type == \'1\')\" dimens=\"age\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100388,'每小时_红包拒收率',100147,11033,'<stat-item title=\"每小时_红包拒收率\" stat=\"count(event_type == \'3\')/count(event_type == \'1\')\"/>','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100389,'每天_红包拒收率',100147,11033,'<stat-item title=\"每天_红包拒收率\" stat=\"count(event_type == \'3\')/count(event_type == \'1\')\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100390,'每10分钟_红包发送金额',100147,11033,'<stat-item title=\"每10分钟_红包发送金额\" stat=\"sum(amount,event_type == \'1\')\"/>','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100391,'每小时_红包发送金额',100147,11033,'<stat-item title=\"每小时_红包发送金额\" stat=\"sum(amount,event_type == \'1\')\"/>','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100392,'每天_红包发送金额',100147,11033,'<stat-item title=\"每天_红包发送金额\" stat=\"sum(amount,event_type == \'1\')\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100393,'每天_红包平均金额',100147,11033,'<stat-item title=\"每天_红包平均金额\" stat=\"avg(amount,event_type == \'1\')\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100394,'每天_人均金额',100147,11033,'<stat-item title=\"每天_人均金额\" stat=\"sum(amount,event_type == \'1\')/bitcount(sender_id,event_type == \'1\')\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:50:36','2023-08-04 15:50:36',110035),(1100395,'每天_各省份_人均发送金额',100147,11033,'<stat-item title=\"每天_各省份_人均发送金额\" stat=\"sum(amount,event_type == \'1\')/bitcount(sender_id,event_type == \'1\')\" dimens=\"province\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:51:46','2023-08-04 15:51:46',110035),(1100396,'每天_各年龄段_人均发送金额',100147,11033,'<stat-item title=\"每天_各年龄段_人均发送金额\" stat=\"sum(amount,event_type == \'1\')/bitcount(sender_id,event_type == \'1\')\" dimens=\"age\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 15:51:46','2023-08-04 15:51:46',110035),(1100397,'每分钟_实时uv',100148,11034,'<stat-item  title=\"每分钟_实时uv\" stat=\"bitcount(imei)\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:27:30','2023-08-04 16:27:30',110035),(1100398,'每小时_实时uv',100148,11034,'<stat-item  title=\"每小时_实时uv\" stat=\"bitcount(imei)\"/>','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100399,'每天_实时uv',100148,11034,'<stat-item  title=\"每天_实时uv\" stat=\"bitcount(imei)\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100400,'每分钟_app启动次数',100148,11034,'<stat-item  title=\"每分钟_app启动次数\" stat=\"count()\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100401,'每小时_app启动次数',100148,11034,'<stat-item  title=\"每小时_app启动次数\" stat=\"count()\"/>','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100402,'每天_app启动次数',100148,11034,'<stat-item  title=\"每天_app启动次数\" stat=\"count()\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100403,'每天_人均app启动次数',100148,11034,'<stat-item  title=\"每天_人均app启动次数\" stat=\"count()/bitcount(imei)\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100404,'每5分钟_各省份_实时uvTop30',100148,11034,'<stat-item  title=\"每5分钟_各省份_实时uvTop30\" stat=\"bitcount(imei)\" dimens=\"province\" limit=\"top30\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100405,'每分钟_各城市_实时uv',100148,11034,'<stat-item  title=\"每分钟_各城市_实时uv\" stat=\"bitcount(imei)\" dimens=\"province;city\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100406,'每分钟_各渠道_实时uv',100148,11034,'<stat-item  title=\"每分钟_各渠道_实时uv\" stat=\"bitcount(imei)\" dimens=\"channel\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100407,'每分钟_各App版本_实时uv',100148,11034,'<stat-item  title=\"每分钟_各App版本_实时uv\" stat=\"bitcount(imei)\" dimens=\"app_version\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100408,'每天_各网络_实时uv',100148,11034,'<stat-item  title=\"每天_各网络_实时uv\" stat=\"bitcount(imei)\" dimens=\"net\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100409,'每分钟_各OS_实时uv',100148,11034,'<stat-item  title=\"每分钟_各OS_实时uv\" stat=\"bitcount(imei)\" dimens=\"os\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100410,'每天_各OS_实时uv',100148,11034,'<stat-item  title=\"每天_各OS_实时uv\" stat=\"bitcount(imei)\" dimens=\"os\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100411,'每天_各渠道_实时uv',100148,11034,'<stat-item  title=\"每天_各渠道_实时uv\" stat=\"bitcount(imei)\" dimens=\"channel\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:42:16','2023-08-04 16:42:16',110035),(1100412,'每分钟_拉新用户量',100149,11034,'<stat-item title=\"每分钟_拉新用户量\"  stat=\"bitcount(imei)\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:57:41','2023-08-04 16:57:41',110035),(1100413,'每30分钟_拉新用户量',100149,11034,'<stat-item title=\"每30分钟_拉新用户量\"  stat=\"bitcount(imei)\"/>','30-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:57:41','2023-08-04 16:57:41',110035),(1100414,'每天_拉新用户量',100149,11034,'<stat-item title=\"每天_拉新用户量\"  stat=\"bitcount(imei)\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:57:41','2023-08-04 16:57:41',110035),(1100415,'每5分钟_各渠道_拉新用户量',100149,11034,'<stat-item title=\"每5分钟_各渠道_拉新用户量\"  stat=\"bitcount(imei)\" dimens=\"from\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:57:41','2023-08-04 16:57:41',110035),(1100416,'每5分钟_各省份_拉新用户量',100149,11034,'<stat-item title=\"每5分钟_各省份_拉新用户量\"  stat=\"bitcount(imei)\" dimens=\"province\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:57:41','2023-08-04 16:57:41',110035),(1100417,'每5分钟_各城市_拉新用户量',100149,11034,'<stat-item title=\"每5分钟_各城市_拉新用户量\"  stat=\"bitcount(imei)\" dimens=\"province;city\"/>','5-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 16:57:41','2023-08-04 16:57:41',110035),(1100419,'每20分钟_房源价格调整次数',100151,11036,'<stat-item title=\"每20分钟_房源价格调整次数\" stat=\"count()\" />','20-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:42:26','2023-08-04 17:42:26',110035),(1100420,'每20分钟_房源降价调整次数',100151,11036,'<stat-item title=\"每20分钟_房源降价调整次数\" stat=\"count(change_type == \'2\')\" />','20-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:52:15','2023-08-04 17:52:15',110035),(1100421,'每20分钟_房源上涨调整次数',100151,11036,'<stat-item title=\"每20分钟_房源上涨调整次数\" stat=\"count(change_type == \'1\')\" />','20-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:52:15','2023-08-04 17:52:15',110035),(1100422,'每20分钟_价格涨跌比',100151,11036,'<stat-item title=\"每20分钟_价格涨跌比\" stat=\"count(change_type == \'1\')/count(change_type == \'2\')\" />','20-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:52:15','2023-08-04 17:52:15',110035),(1100423,'每20分钟_各省份_价格涨跌比',100151,11036,'<stat-item title=\"每20分钟_各省份_价格涨跌比\" stat=\"count(change_type == \'1\')/count(change_type == \'2\')\" dimens=\"province\"/>','20-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:52:15','2023-08-04 17:52:15',110035),(1100424,'每天_降价房源量',100151,11036,'<stat-item title=\"每天_降价房源量\" stat=\"bitcount(houseId,change_type == \'2\')\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:56:52','2023-08-04 17:56:52',110035),(1100425,'每天_涨价房源量',100151,11036,'<stat-item title=\"每天_涨价房源量\" stat=\"bitcount(houseId,change_type == \'1\')\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:56:52','2023-08-04 17:56:52',110035),(1100426,'每天_各省份_降价房源量',100151,11036,'<stat-item title=\"每天_各省份_降价房源量\" stat=\"bitcount(houseId,change_type == \'2\')\" dimens=\"province\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:56:52','2023-08-04 17:56:52',110035),(1100427,'每天_各省份_涨价房源量',100151,11036,'<stat-item title=\"每天_各省份_涨价房源量\" stat=\"bitcount(houseId,change_type == \'1\')\" dimens=\"province\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:56:52','2023-08-04 17:56:52',110035),(1100428,'每天_各城市_降价房源量',100151,11036,'<stat-item title=\"每天_各城市_降价房源量\" stat=\"bitcount(houseId,change_type == \'2\')\" dimens=\"province;city\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:56:52','2023-08-04 17:56:52',110035),(1100429,'每天_各城市_涨价房源量',100151,11036,'<stat-item title=\"每天_各城市_涨价房源量\" stat=\"bitcount(houseId,change_type == \'1\')\" dimens=\"province;city\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:56:52','2023-08-04 17:56:52',110035),(1100430,'每天_各城市_房质量_涨价房源量',100151,11036,'<stat-item title=\"每天_各城市_房质量_涨价房源量\" stat=\"bitcount(houseId,change_type == \'1\')\" dimens=\"province;city;quality\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:56:52','2023-08-04 17:56:52',110035),(1100431,'每天_各城市_房质量_降价房源量',100151,11036,'<stat-item title=\"每天_各城市_房质量_降价房源量\" stat=\"bitcount(houseId,change_type == \'2\')\" dimens=\"province;city;quality\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 17:57:27','2023-08-04 17:57:27',110035),(1100432,'每分钟_订单量',100152,11035,'<stat-item title=\"每分钟_订单量\" stat=\"count()\" />','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 18:13:50','2023-08-04 18:13:50',110035),(1100433,'每小时_订单量',100152,11035,'<stat-item title=\"每小时_订单量\" stat=\"count()\" />','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:40:37','2023-08-04 20:40:37',110035),(1100434,'每天_订单量',100152,11035,'<stat-item title=\"每天_订单量\" stat=\"count()\" />','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:40:37','2023-08-04 20:40:37',110035),(1100435,'每天_各省份_订单量',100152,11035,'<stat-item title=\"每天_各省份_订单量\" stat=\"count()\" dimens=\"province\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:40:37','2023-08-04 20:40:37',110035),(1100436,'每天_各城市_订单量',100152,11035,'<stat-item title=\"每天_各城市_订单量\" stat=\"count()\" dimens=\"province;city\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:40:37','2023-08-04 20:40:37',110035),(1100437,'每天_各年龄段_订单量',100152,11035,'<stat-item title=\"每天_各年龄段_订单量\" stat=\"count()\" dimens=\"age\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:40:37','2023-08-04 20:40:37',110035),(1100438,'每天_各性别人群_订单量',100152,11035,'<stat-item title=\"每天_各性别人群_订单量\" stat=\"count()\" dimens=\"sex\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:40:37','2023-08-04 20:40:37',110035),(1100439,'每天_各手机系统_订单量',100152,11035,'<stat-item title=\"每天_各手机系统_订单量\" stat=\"count()\" dimens=\"os\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:40:37','2023-08-04 20:40:37',110035),(1100440,'每天_各App版本_订单量',100152,11035,'<stat-item title=\"每天_各App版本_订单量\" stat=\"count()\" dimens=\"version\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:40:37','2023-08-04 20:40:37',110035),(1100441,'每天_各商户_订单量',100152,11035,'<stat-item title=\"每天_各商户_订单量\" stat=\"count()\" dimens=\"supplierId\" limit=\"top100\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:40:37','2023-08-04 20:40:37',110035),(1100442,'每天_各价格区间_订单量',100152,11035,'<stat-item title=\"每天_各价格区间_订单量\" stat=\"count()\" dimens=\"section(amount,\'50,100,500,2000\')\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:44:47','2023-08-04 20:44:47',110035),(1100443,'每分钟_交易金额',100152,11035,'<stat-item title=\"每分钟_交易金额\" stat=\"sum(amount)\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:44:47','2023-08-04 20:44:47',110035),(1100444,'每分钟_各省份_交易金额',100152,11035,'<stat-item title=\"每分钟_各省份_交易金额\" stat=\"sum(amount)\" dimens=\"province\"/>','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:44:47','2023-08-04 20:44:47',110035),(1100445,'每天_交易金额',100152,11035,'<stat-item title=\"每天_交易金额\" stat=\"sum(amount)\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:44:47','2023-08-04 20:44:47',110035),(1100446,'每天_各商户_交易金额',100152,11035,'<stat-item title=\"每天_各商户_交易金额\" stat=\"sum(amount)\" dimens=\"supplierId\" limit=\"top100\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:44:47','2023-08-04 20:44:47',110035),(1100447,'每分钟_下单用户数',100152,11035,'<stat-item title=\"每分钟_下单用户数\" stat=\"bitcount(userId)\" />','1-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:44:47','2023-08-04 20:44:47',110035),(1100448,'每天_各省份_下单用户数',100152,11035,'<stat-item title=\"每天_各省份_下单用户数\" stat=\"bitcount(userId)\" dimens=\"province\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:44:47','2023-08-04 20:44:47',110035),(1100449,'每天_各城市_下单用户数',100152,11035,'<stat-item title=\"每天_各城市_下单用户数\" stat=\"bitcount(userId)\" dimens=\"province;city\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:44:47','2023-08-04 20:44:47',110035),(1100450,'每天_人均消费金额',100152,11035,'<stat-item title=\"每天_人均消费金额\" stat=\"sum(amount)/bitcount(userId)\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:49:41','2023-08-04 20:49:41',110035),(1100451,'每10分钟_各商户_成交额',100152,11035,'<stat-item title=\"每10分钟_各商户_成交额\" stat=\"sum(amount)\" dimens=\"supplierId\"/>','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:49:41','2023-08-04 20:49:41',110035),(1100452,'每10分钟_各商户_订单量',100152,11035,'<stat-item title=\"每10分钟_各商户_订单量\" stat=\"count()\" dimens=\"supplierId\"/>','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 20:49:41','2023-08-04 20:49:41',110035),(1100453,'每小时_下单转化率',100153,11035,'<stat-item title=\"每小时_下单转化率\" stat=\"count(action_type == \'2\')/count(action_type == \'1\')\" />','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 21:06:28','2023-08-04 21:06:28',110035),(1100454,'每天_下单转化率',100153,11035,'<stat-item title=\"每天_下单转化率\" stat=\"count(action_type == \'2\')/count(action_type == \'1\')\" />','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 21:06:28','2023-08-04 21:06:28',110035),(1100455,'每小时_支付转化率',100153,11035,'<stat-item title=\"每小时_支付转化率\" stat=\"count(action_type == \'3\')/count(action_type == \'1\')\" />','1-hour',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 21:06:28','2023-08-04 21:06:28',110035),(1100456,'每天_支付转化率',100153,11035,'<stat-item title=\"每天_支付转化率\" stat=\"count(action_type == \'3\')/count(action_type == \'1\')\" />','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 21:06:28','2023-08-04 21:06:28',110035),(1100457,'每10分钟_退款金额',100153,11035,'<stat-item title=\"每10分钟_退款金额\" stat=\"sum(amount,action_type==\'5\')\" />','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 21:06:28','2023-08-04 21:06:28',110035),(1100458,'每10分钟_退款订单量',100153,11035,'<stat-item title=\"每10分钟_退款订单量\" stat=\"bitcount(orderId,action_type==\'5\')\" />','10-minute',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 21:06:28','2023-08-04 21:06:28',110035),(1100459,'每天_各操作_订单量',100153,11035,'<stat-item title=\"每天_各操作_订单量\" stat=\"bitcount(orderId)\"  dimens=\"action_type\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 21:08:32','2023-08-04 21:08:32',110035),(1100460,'每天_各操作_总金额',100153,11035,'<stat-item title=\"每天_各操作_总金额\" stat=\"sum(amount)\"  dimens=\"action_type\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 21:08:32','2023-08-04 21:08:32',110035),(1100461,'每天_各操作_用户量',100153,11035,'<stat-item title=\"每天_各操作_用户量\" stat=\"bitcount(userId)\"  dimens=\"action_type\"/>','1-day',1,NULL,NULL,1209600,10012,0,0,0,'2023-08-04 21:08:32','2023-08-04 21:08:32',110035);
/*!40000 ALTER TABLE `ldp_stat_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_stat_project`
--

DROP TABLE IF EXISTS `ldp_stat_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_stat_project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `department_id` varchar(100) NOT NULL,
  `private_flag` int NOT NULL,
  `user_id` int NOT NULL,
  `desc` varchar(300) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_department_id` (`department_id`),
  KEY `index_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11037 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_stat_project`
--

LOCK TABLES `ldp_stat_project` WRITE;
/*!40000 ALTER TABLE `ldp_stat_project` DISABLE KEYS */;
INSERT INTO `ldp_stat_project` VALUES (11025,'【后端-短视频】推荐服务接口数据','10046',1,110032,'包括：短视频业务推荐服务的接口调用量、异常量、耗时状况数据！','2023-08-03 17:25:02','2023-08-04 21:13:12'),(11026,'【前端-APP】APP广告加载数据','10045',1,110033,'包括：APP内各主要广告位的广告加载耗时及异常数据！','2023-08-03 18:30:27','2023-08-04 21:13:37'),(11027,'【算法-短视频】推荐模型统计数据','10047',1,110034,'包括：短视频推荐策略模型的训练、预测相关数据指标。','2023-08-03 21:01:22','2023-08-04 21:12:18'),(11028,'【产品-资讯业务】用户行为数据统计','10043',1,110035,'包括：APP首页资讯推荐模块用户的点击量、点击率、帖子下发量等指标数据。','2023-08-03 21:30:18','2023-08-04 21:10:23'),(11029,'【运维-服务器】节点运行指标监控','10053',1,110036,'包括：集团所有服务器运行状态监控指标，如CPU、内存、磁盘、IO等。','2023-08-04 07:18:19','2023-08-04 21:11:46'),(11032,'【基础架构-KV存储】KV数据指标监控','10053',1,110036,'包括：KV存储引擎各实例运行状态监控数据。','2023-08-04 12:50:24','2023-08-04 21:11:32'),(11033,'【产品-社交】即时通讯聊天数据统计','10043',1,110035,'包括：即时通讯业务用户私聊场景相关数据指标。','2023-08-04 14:30:33','2023-08-04 21:10:11'),(11034,'【运营-APP用户】整体DAU数据统计','10043',0,110035,'包括：APP整体的DAU数据。','2023-08-04 16:11:53','2023-08-04 21:21:51'),(11035,'【业务线-电商】订单数据实时统计','10043',1,110035,'包括：电商业务线订单交易相关数据指标。','2023-08-04 17:10:54','2023-08-04 21:09:59'),(11036,'【业务线-二手房】房源调价数据监控','10043',1,110035,'包括：二手房业务所有房源价格调整数据实时监控。','2023-08-04 17:20:26','2023-08-04 21:09:35');
/*!40000 ALTER TABLE `ldp_stat_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_stat_sitebind`
--

DROP TABLE IF EXISTS `ldp_stat_sitebind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_stat_sitebind` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `node_id` int NOT NULL,
  `site_id` int DEFAULT NULL,
  `element_id` int DEFAULT NULL,
  `element_type` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10019 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_stat_sitebind`
--

LOCK TABLES `ldp_stat_sitebind` WRITE;
/*!40000 ALTER TABLE `ldp_stat_sitebind` DISABLE KEYS */;
/*!40000 ALTER TABLE `ldp_stat_sitebind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_stat_sitemap`
--

DROP TABLE IF EXISTS `ldp_stat_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_stat_sitemap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `config` varchar(3000) DEFAULT NULL,
  `star` int NOT NULL,
  `user_id` int NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10019 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_stat_sitemap`
--

LOCK TABLES `ldp_stat_sitemap` WRITE;
/*!40000 ALTER TABLE `ldp_stat_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ldp_stat_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_sys_env`
--

DROP TABLE IF EXISTS `ldp_sys_env`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_sys_env` (
  `param` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`param`),
  KEY `index_param` (`param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_sys_env`
--

LOCK TABLES `ldp_sys_env` WRITE;
/*!40000 ALTER TABLE `ldp_sys_env` DISABLE KEYS */;
/*!40000 ALTER TABLE `ldp_sys_env` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_tasks_history`
--

DROP TABLE IF EXISTS `ldp_tasks_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_tasks_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_type` int NOT NULL,
  `state` int NOT NULL,
  `batch` varchar(45) DEFAULT NULL,
  `task_params` varchar(1000) DEFAULT NULL,
  `task_result` varchar(1000) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_task_type` (`task_type`)
) ENGINE=InnoDB AUTO_INCREMENT=28361 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_tasks_history`
--

LOCK TABLES `ldp_tasks_history` WRITE;
/*!40000 ALTER TABLE `ldp_tasks_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ldp_tasks_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldp_user`
--

DROP TABLE IF EXISTS `ldp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `last_time` datetime NOT NULL,
  `department_id` int DEFAULT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_name` (`user_name`),
  KEY `index_department_id` (`department_id`),
  KEY `index_user_password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=110037 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldp_user`
--

LOCK TABLES `ldp_user` WRITE;
/*!40000 ALTER TABLE `ldp_user` DISABLE KEYS */;
INSERT INTO `ldp_user` VALUES (110031,'admin','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'2023-08-03 17:02:56','2023-08-05 12:39:52',-1,1),(110032,'test1','e10adc3949ba59abbe56e057f20f883e','15011111111','better_test1@126.com','2023-08-03 17:17:53','2023-08-04 21:12:46',10046,1),(110033,'test2','e10adc3949ba59abbe56e057f20f883e','15022222222','better_test2@126.com','2023-08-03 17:18:24','2023-08-04 21:13:25',10045,1),(110034,'test3','e10adc3949ba59abbe56e057f20f883e','15033333333','better_test3@126.com','2023-08-03 17:19:06','2023-08-04 21:11:58',10047,1),(110035,'test4','e10adc3949ba59abbe56e057f20f883e','15044444444','better_test4@126.com','2023-08-03 17:19:38','2023-08-04 21:21:35',10043,1),(110036,'test5','e10adc3949ba59abbe56e057f20f883e','15055555555','better_test5@126.com','2023-08-04 07:16:51','2023-08-04 21:11:11',10053,1);
/*!40000 ALTER TABLE `ldp_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-05 12:52:14
