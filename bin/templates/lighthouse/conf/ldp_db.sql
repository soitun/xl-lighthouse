CREATE DATABASE  IF NOT EXISTS `cluster_${ldp_lighthouse_cluster_id}_ldp_cmdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cluster_${ldp_lighthouse_cluster_id}_ldp_cmdb`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 10.206.6.26    Database: cluster_d5d83a2b_ldp_cmdb
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

DROP TABLE IF EXISTS `ldp_alarm_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_alarm_templates` (
                                       `id` int NOT NULL AUTO_INCREMENT,
                                       `title` varchar(80) NOT NULL,
                                       `config` mediumtext NOT NULL,
                                       `create_user` int NOT NULL,
                                       `desc` varchar(500) DEFAULT NULL,
                                       `user_ids` json DEFAULT NULL,
                                       `department_ids` json DEFAULT NULL,
                                       `create_time` timestamp NOT NULL,
                                       `update_time` timestamp NOT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `index_title` (`title`),
                                       KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ldp_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_alarms` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `title` varchar(60) NOT NULL,
                              `unique_code` varchar(60) NOT NULL,
                              `divide` tinyint DEFAULT NULL,
                              `resource_id` int NOT NULL,
                              `resource_type` tinyint DEFAULT NULL,
                              `state` tinyint NOT NULL,
                              `match` tinyint NOT NULL,
                              `conditions` mediumtext NOT NULL,
                              `template_id` int NOT NULL,
                              `recover` tinyint NOT NULL,
                              `silent` int NOT NULL,
                              `delay` int NOT NULL,
                              `desc` varchar(500) NOT NULL,
                              `dimens` mediumtext,
                              `extend` varchar(3000) DEFAULT NULL,
                              `create_time` timestamp NOT NULL,
                              `update_time` timestamp NOT NULL,
                              PRIMARY KEY (`id`),
                              KEY `index_title` (`title`),
                              KEY `index_uniqueCode` (`unique_code`),
                              KEY `index_relationa` (`resource_id`,`resource_type`),
                              KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ldp_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_notifications` (
                                     `id` int NOT NULL AUTO_INCREMENT,
                                     `resource_id` int DEFAULT NULL,
                                     `resource_type` tinyint DEFAULT NULL,
                                     `content` varchar(1000) NOT NULL,
                                     `state` tinyint NOT NULL,
                                     `user_ids` json DEFAULT NULL,
                                     `department_ids` json DEFAULT NULL,
                                     `notification_type` tinyint NOT NULL,
                                     `p1` varchar(45) DEFAULT NULL,
                                     `p2` varchar(45) DEFAULT NULL,
                                     `p3` varchar(45) DEFAULT NULL,
                                     `create_time` timestamp NOT NULL,
                                     `update_time` timestamp NOT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `index_relationa` (`resource_id`,`resource_type`),
                                     KEY `index_user_ids` ((CAST(user_ids AS UNSIGNED ARRAY))),
                                     KEY `index_department_ids` ((CAST(department_ids AS UNSIGNED ARRAY))),
                                     KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1001011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ldp_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_components` (
                                  `id` int NOT NULL AUTO_INCREMENT,
                                  `title` varchar(100) NOT NULL,
                                  `component_type` tinyint(1) NOT NULL,
                                  `private_type` tinyint(1) NOT NULL,
                                  `configuration` mediumtext NOT NULL,
                                  `user_id` int NOT NULL,
                                  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `update_time` timestamp NOT NULL,
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1052 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_departments`
--

DROP TABLE IF EXISTS `ldp_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_departments` (
                                   `id` int NOT NULL AUTO_INCREMENT,
                                   `name` varchar(60) NOT NULL,
                                   `pid` int NOT NULL,
                                   `third_id` varchar(90) DEFAULT NULL,
                                   `third_pid` varchar(90) DEFAULT NULL,
                                   `create_time` timestamp NOT NULL,
                                   `update_time` timestamp NOT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `index_pid` (`pid`),
                                   KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=10251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `ldp_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_definitions` (
                                   `id` int NOT NULL AUTO_INCREMENT,
                                   `user_id` int NOT NULL,
                                   `type` tinyint NOT NULL,
                                   `name` varchar(100) NOT NULL,
                                   `desc` varchar(300) DEFAULT NULL,
                                   `extend` varchar(5000) DEFAULT NULL,
                                   `create_time` timestamp NOT NULL,
                                   `update_time` timestamp NOT NULL,
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `ldp_domains`
--

DROP TABLE IF EXISTS `ldp_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_domains` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `name` varchar(45) NOT NULL,
                               `default_token_prefix` varchar(10) DEFAULT NULL,
                               `create_time` timestamp NULL DEFAULT NULL,
                               `update_time` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_env`
--

DROP TABLE IF EXISTS `ldp_env`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_env` (
                           `param` varchar(100) NOT NULL,
                           `value` text,
                           PRIMARY KEY (`param`),
                           KEY `index_param` (`param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_groups`
--

DROP TABLE IF EXISTS `ldp_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_groups` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `token` varchar(30) NOT NULL,
                              `project_id` int NOT NULL,
                              `data_version` int NOT NULL DEFAULT '0',
                              `debug_mode` int DEFAULT '0',
                              `columns` TEXT NOT NULL,
                              `desc` varchar(800) NOT NULL,
                              `random_id` varchar(45) NOT NULL,
                              `secret_key` varchar(60) NOT NULL,
                              `state` int NOT NULL,
                              `extend_config` varchar(2000) DEFAULT NULL,
                              `limiting_param` varchar(800) DEFAULT NULL,
                              `debug_param` varchar(800) DEFAULT NULL,
                              `refresh_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                              `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                              `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                              PRIMARY KEY (`id`),
                              KEY `index_token` (`token`),
                              KEY `index_project_id` (`project_id`),
                              KEY `index_create_time` (`create_time`),
                              KEY `index_refresh_time` (`refresh_time`),
                              KEY `index_state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=100309 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ldp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_links` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `short_code` varchar(32) NOT NULL,
                             `full_url` varchar(500) DEFAULT NULL,
                             `resource_id` int NOT NULL,
                             `resource_type` tinyint NOT NULL,
                             `link_type` tinyint NOT NULL,
                             `params` text,
                             `state` tinyint NOT NULL DEFAULT '0',
                             `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `expire_time` timestamp NULL DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `short_code` (`short_code`),
                             KEY `idx_resource` (`resource_id`,`resource_type`),
                             KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `ldp_metas`
--

DROP TABLE IF EXISTS `ldp_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_metas` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `meta_name` varchar(100) DEFAULT NULL,
                             `type` int DEFAULT NULL,
                             `state` int DEFAULT NULL,
                             `template` varchar(3000) DEFAULT NULL,
                             `record_size` int DEFAULT NULL,
                             `content_size` bigint NOT NULL,
                             `desc` varchar(100) DEFAULT NULL,
                             `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (`id`),
                             KEY `index_meta_name` (`meta_name`),
                             KEY `index_state` (`state`),
                             KEY `index_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10043 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_metricsets`
--

DROP TABLE IF EXISTS `ldp_metricsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_metricsets` (
                                  `id` int NOT NULL AUTO_INCREMENT,
                                  `title` varchar(60) DEFAULT NULL,
                                  `private_type` int DEFAULT NULL,
                                  `desc` varchar(500) DEFAULT NULL,
                                  `structure` mediumtext,
                                  `create_user` int DEFAULT NULL,
                                  `create_time` timestamp NULL DEFAULT NULL,
                                  `update_time` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_order_details`
--

DROP TABLE IF EXISTS `ldp_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_order_details` (
                                     `id` int NOT NULL AUTO_INCREMENT,
                                     `order_id` int DEFAULT NULL,
                                     `user_id` int DEFAULT NULL,
                                     `role_type` int DEFAULT NULL,
                                     `state` tinyint(1) DEFAULT NULL,
                                     `role_id` int DEFAULT NULL,
                                     `reply` varchar(300) DEFAULT NULL,
                                     `create_time` timestamp NULL DEFAULT NULL,
                                     `process_time` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `index_order_id` (`order_id`),
                                     KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_orders`
--

DROP TABLE IF EXISTS `ldp_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_orders` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `user_id` int NOT NULL,
                              `order_type` tinyint(1) NOT NULL,
                              `state` tinyint(1) NOT NULL,
                              `steps` varchar(300) DEFAULT NULL,
                              `extend_config` varchar(600) DEFAULT NULL,
                              `hash` varchar(100) NOT NULL,
                              `current_node` int DEFAULT NULL,
                              `reason` varchar(600) DEFAULT NULL,
                              `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                              `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                              PRIMARY KEY (`id`),
                              KEY `index_hash` (`hash`),
                              KEY `index_state` (`state`),
                              KEY `index_current_node` (`current_node`),
                              KEY `index_createtime` (`create_time`),
                              KEY `index_order_type` (`order_type`),
                              KEY `index_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_permissions`
--

DROP TABLE IF EXISTS `ldp_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_permissions` (
                                   `id` int NOT NULL AUTO_INCREMENT,
                                   `owner_id` int DEFAULT NULL,
                                   `owner_type` int DEFAULT NULL,
                                   `role_id` int DEFAULT NULL,
                                   `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                   `update_time` timestamp NULL DEFAULT NULL,
                                   `expire_time` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `index_owner` (`owner_type`,`owner_id`),
                                   KEY `index_role_id` (`role_id`),
                                   KEY `index_createtime` (`create_time`),
                                   KEY `index_expiretime` (`expire_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100713 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_projects`
--

DROP TABLE IF EXISTS `ldp_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_projects` (
                                `id` int NOT NULL AUTO_INCREMENT,
                                `title` varchar(100) NOT NULL,
                                `department_id` int NOT NULL,
                                `private_type` tinyint(1) NOT NULL,
                                `desc` varchar(500) DEFAULT NULL,
                                `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                PRIMARY KEY (`id`),
                                KEY `index_department_id` (`department_id`),
                                KEY `index_title` (`title`),
                                KEY `index_createtime` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=11137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_records`
--

DROP TABLE IF EXISTS `ldp_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_records` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `user_id` int DEFAULT '0',
                               `resource_id` int NOT NULL,
                               `resource_type` int NOT NULL,
                               `record_type` int NOT NULL,
                               `extend` varchar(5000) DEFAULT NULL,
                               `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               PRIMARY KEY (`id`),
                               KEY `index_create_time` (`create_time` DESC),
                               KEY `index_record_type` (`record_type`),
                               KEY `index_resource` (`resource_type`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100514 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_relations`
--

DROP TABLE IF EXISTS `ldp_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_relations` (
                                 `id` int NOT NULL AUTO_INCREMENT,
                                 `subject_id` int NOT NULL,
                                 `relation_type` tinyint(1) NOT NULL,
                                 `resource_id` int NOT NULL,
                                 `resource_type` tinyint(1) NOT NULL,
                                 `hash` varchar(45) DEFAULT NULL,
                                 `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `update_time` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `index_relationa` (`subject_id`,`relation_type`),
                                 KEY `index_relationb` (`resource_id`,`relation_type`),
                                 KEY `index_hash` (`hash`),
                                 KEY `index_updatetime` (`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100503 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_roles`
--

DROP TABLE IF EXISTS `ldp_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_roles` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `role_type` int DEFAULT NULL,
                             `resource_id` int DEFAULT NULL,
                             `pid` int DEFAULT NULL,
                             `create_time` timestamp NULL DEFAULT NULL,
                             `update_time` timestamp NULL DEFAULT NULL,
                             `desc` varchar(300) DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `index_pid` (`pid`),
                             KEY `index_roletype_resourceId` (`role_type`,`resource_id`),
                             KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=10215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_rollbacks`
--

DROP TABLE IF EXISTS `ldp_rollbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_rollbacks` (
                                 `id` int NOT NULL AUTO_INCREMENT,
                                 `user_id` int DEFAULT NULL,
                                 `resource_id` int NOT NULL,
                                 `data_type` int NOT NULL,
                                 `config` mediumtext NOT NULL,
                                 `version` int DEFAULT NULL,
                                 `create_time` timestamp NOT NULL,
                                 `desc` varchar(500) DEFAULT NULL,
                                 `state` tinyint NOT NULL,
                                 `extend` varchar(500) DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `index_resource` (`resource_id`,`data_type`),
                                 KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1100347 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_stats`
--

DROP TABLE IF EXISTS `ldp_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_stats` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `title` varchar(60) NOT NULL,
                             `group_id` int NOT NULL,
                             `project_id` int DEFAULT NULL,
                             `template` varchar(500) NOT NULL,
                             `timeparam` varchar(50) DEFAULT NULL,
                             `expired` bigint NOT NULL,
                             `state` int DEFAULT NULL,
                             `render_config` varchar(2000) DEFAULT NULL,
                             `meta_id` int DEFAULT NULL,
                             `data_version` int DEFAULT '0',
                             `desc` varchar(300) DEFAULT NULL,
                             `limiting_param` varchar(800) DEFAULT NULL,
                             `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `refresh_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `random_id` varchar(45) NOT NULL,
                             PRIMARY KEY (`id`),
                             KEY `index_state` (`state`),
                             KEY `index_group_id` (`group_id`),
                             KEY `index_project_id` (`project_id`),
                             KEY `index_title` (`title`),
                             KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1100607 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_users`
--

DROP TABLE IF EXISTS `ldp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_users` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `username` varchar(60) NOT NULL,
                             `password` varchar(100) NOT NULL,
                             `domain_id` varchar(45) DEFAULT NULL,
                             `phone` varchar(60) DEFAULT NULL,
                             `email` varchar(60) DEFAULT NULL,
                             `department_id` int DEFAULT NULL,
                             `third_id` int DEFAULT NULL,
                             `state` tinyint(1) NOT NULL,
                             `last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (`id`),
                             KEY `index_user_name` (`username`),
                             KEY `index_department_id` (`department_id`),
                             KEY `index_state` (`state`),
                             KEY `index_third_id` (`third_id`),
                             KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=110239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_callers`
--

DROP TABLE IF EXISTS `ldp_callers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_callers` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `name` varchar(45) NOT NULL,
                               `desc` varchar(500) DEFAULT NULL,
                               `state` tinyint(1) NOT NULL,
                               `department_id` int NOT NULL DEFAULT '0',
                               `secret_key` varchar(80) NOT NULL,
                               `create_time` timestamp NOT NULL,
                               `update_time` timestamp NOT NULL,
                               PRIMARY KEY (`id`),
                               KEY `index_name` (`name`),
                               KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=101001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldp_views`
--

DROP TABLE IF EXISTS `ldp_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ldp_views` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `title` varchar(100) NOT NULL,
                             `user_id` int NOT NULL,
                             `state` tinyint(1) NOT NULL,
                             `private_type` tinyint(1) NOT NULL,
                             `caller_id` int,
                             `version` int NOT NULL,
                             `config` mediumtext,
                             `desc` varchar(500) NOT NULL,
                             `create_time` timestamp NOT NULL,
                             `update_time` timestamp NOT NULL,
                             PRIMARY KEY (`id`),
                             KEY `index_state` (`state`),
                             KEY `index_title` (`title`),
                             KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1100023 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-04 22:06:49
