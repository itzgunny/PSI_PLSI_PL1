-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 19, 2021 at 04:25 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthify`
--

drop database IF EXISTS healthify;
create database healthify;
use healthify;

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1636111142),
('admin', '5', 1636112894),
('chef', '3', 1636111142),
('client', '10', 1636558188),
('client', '11', 1637596605),
('client', '12', 1637596695),
('client', '13', 1637597156),
('client', '14', 1637599697),
('client', '15', 1637602659),
('client', '16', 1638458790),
('client', '4', 1636111142),
('staff', '2', 1639517856),
('staff', '9', 1636546059);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('accessBackend', 2, 'Access the Back-Office', NULL, NULL, 1636111142, 1636111142),
('admin', 1, NULL, NULL, NULL, 1636111142, 1636111142),
('chef', 1, NULL, NULL, NULL, 1636111142, 1636111142),
('client', 1, NULL, NULL, NULL, 1636111142, 1636111142),
('createPost', 2, 'Create a post', NULL, NULL, 1636111142, 1636111142),
('staff', 1, NULL, NULL, NULL, 1636111142, 1636111142),
('updatePost', 2, 'Update post', NULL, NULL, 1636111142, 1636111142);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'accessBackend'),
('admin', 'staff'),
('admin', 'updatePost'),
('chef', 'accessBackend'),
('client', 'createPost'),
('staff', 'accessBackend');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date',
  `val` int(11) NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'entradas', 'Entradas/petiscos'),
(2, 'sopas', 'Sopas'),
(3, 'carne', 'Pratos de carne'),
(4, 'peixe', 'Pratos de peixe'),
(5, 'vegan', 'Pratos apenas com proteína vegetal'),
(6, 'sobremesa', 'Sobremesas'),
(7, 'bebidas', 'Bebidas');

-- --------------------------------------------------------

--
-- Table structure for table `inforestaurants`
--

CREATE TABLE `inforestaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `adress` varchar(75) NOT NULL,
  `celphone` int(9) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nif` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `sugar_g` float NOT NULL,
  `calories` float NOT NULL,
  `protein_g` float NOT NULL,
  `carbohydrates_total_g` float NOT NULL,
  `fat_saturated_g` float NOT NULL,
  `fat_total_g` float NOT NULL,
  `fiber_g` float NOT NULL,
  `cholesterol_mg` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `sugar_g`, `calories`, `protein_g`, `carbohydrates_total_g`, `fat_saturated_g`, `fat_total_g`, `fiber_g`, `cholesterol_mg`) VALUES
(1, 'Bife de vaca', 0, 291.9, 26.6, 0, 7.8, 19.7, 0, 87),
(2, 'Ovo', 0.4, 147, 12.5, 0.7, 3.1, 9.7, 0, 371),
(3, 'french fries', 0.3, 312.5, 3.4, 42.1, 2.3, 14.4, 3.8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `categoryid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`id`, `name`, `price`, `description`, `categoryid`) VALUES
(1, 'Bitoque', '14.99', 'Bife com ovo', 3),
(2, 'Bacalhau com natas', '14.99', 'Bacalhau servido com natas', 4);

-- --------------------------------------------------------

--
-- Table structure for table `meal_ingredients`
--

CREATE TABLE `meal_ingredients` (
  `id` int(11) NOT NULL,
  `serving_size_g` float DEFAULT NULL,
  `total_sugar_g` float NOT NULL,
  `total_calories` float NOT NULL,
  `total_protein_g` float NOT NULL,
  `total_carbohydrates_total_g` float NOT NULL,
  `total_fat_saturated_g` float NOT NULL,
  `total_fat_total_g` float NOT NULL,
  `total_fiber_g` float NOT NULL,
  `total_cholesterol_mg` float NOT NULL,
  `mealsid` int(11) NOT NULL,
  `ingredientsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meal_ingredients`
--

INSERT INTO `meal_ingredients` (`id`, `serving_size_g`, `total_sugar_g`, `total_calories`, `total_protein_g`, `total_carbohydrates_total_g`, `total_fat_saturated_g`, `total_fat_total_g`, `total_fiber_g`, `total_cholesterol_mg`, `mealsid`, `ingredientsid`) VALUES
(1, 100, 0, 291.9, 26.6, 0, 7.8, 19.7, 0, 87, 1, 1),
(2, 100, 0.4, 147, 12.5, 0.7, 3.1, 9.7, 0, 371, 1, 2),
(3, 100, 0.3, 312.5, 3.4, 42.1, 2.3, 14.4, 3.8, 0, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1634117830),
('m130524_201442_init', 1634117833),
('m140506_102106_rbac_init', 1634117983),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1634117983),
('m180523_151638_rbac_updates_indexes_without_prefix', 1634117983),
('m190124_110200_add_verification_token_column_to_user_table', 1634117833),
('m200409_110543_rbac_update_mssql_trigger', 1634117983);

-- --------------------------------------------------------

--
-- Table structure for table `minerals`
--

CREATE TABLE `minerals` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `ingredientsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `reservedday` date NOT NULL,
  `reservedtime` enum('almoco','jantar') NOT NULL,
  `userprofilesid` int(11) NOT NULL,
  `tableid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `reservedday`, `reservedtime`, `userprofilesid`, `tableid`) VALUES
(4, '2021-12-17', 'almoco', 9, 1),
(5, '2021-12-17', 'almoco', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `rating` decimal(1,0) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `userprofilesid` int(11) NOT NULL,
  `sales_mealsidsales` int(11) NOT NULL,
  `sales_mealsidmeal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `salesday` timestamp NULL DEFAULT NULL,
  `precototal` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `paidamount` decimal(10,2) DEFAULT NULL,
  `paymentmethod` set('cash','card') DEFAULT NULL,
  `paymentstate` varchar(11) NOT NULL,
  `userprofilesid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_meals`
--

CREATE TABLE `sales_meals` (
  `salesid` int(11) NOT NULL,
  `mealid` int(11) NOT NULL,
  `sellingprice` decimal(10,2) NOT NULL,
  `itemquantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `day` date NOT NULL,
  `weekday` varchar(10) NOT NULL,
  `firstentry` time NOT NULL,
  `firstexit` time NOT NULL,
  `secondentry` time NOT NULL,
  `secondexit` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `state` set('occupied','free','reserved') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `state`) VALUES
(1, 'free'),
(2, 'occupied');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(2, 'testeuser', 'IA_ROg-7282xyzU7Eb0x9Ip0z6PhW9ZK', '$2y$13$DpRGCCjE5qk2RqGRWrsL1.8UF9LpQSJx5duJTPnQD9rb7Y3zN3NNG', NULL, 'tiago.gil277@gmail.com', 10, 1634293795, 1634293795, '0HHcgxm6BfuNjOH9vwHra6rj9MLPdlOW_1634293795'),
(5, 'admin', 'GmkIltBSetHrfbFpRL2669P7WqWGshGG', '$2y$13$osVyRKNcEjuJECi0Oja/SOEQ1w5nl43EO/xVEhjnvFE/uEJGETPGC', NULL, 'admin@hoje.pt', 10, 1636112894, 1636112894, 'ewMU_207-OoIxy63axz_h5Yl2rh2NK-C_1636112894'),
(9, 'Pedro', '873xUmF4aWMTVH8wl-iUdJPCxGhorKcv', '$2y$13$b/XsHQcekFuVzyf5fhAqj.1/hL4ga4MioTaqwtBVF68UbqUPaXacC', NULL, 'pedro@hoje.teste', 10, 1636545266, 1636545266, '-9wWSBIU44B7PvO7mwiklcVD_hATzKJl_1636545266'),
(10, 'defesa', 'JqarnlK4bpe8b8iqDhKanoxb9pEO9vRW', '$2y$13$lBp8KR48Pm1kUgvcrX1ak.SBWk5eo/g8k.W1MIHRuT8BOO2eqJtle', NULL, 'wieuvbn@sdvs.pt', 10, 1636558188, 1636558188, '6QZEdWRFEiVfxJ0g6aer-8s6NSOM5Ngs_1636558188'),
(11, 'qweqw', 'n7AGM3RxIS0RAVtwrLjAx8GATbF0qbNP', '$2y$13$sKlqllcUOzrjkFSnANk1POhfhL8aOGcLA1rcuyIH35.ltvGPFdjqa', NULL, 'wqew2@sda.pe', 0, 1637596605, 1637596605, 'MtTHjDEESQjCVQDXdnhK67u_qumAokXs_1637596605'),
(12, 'qweqwa', 'mtV85qYOD6D-RWmb7EsNkCMLH2DB79ra', '$2y$13$gApIsGdW5CTqAnig8KFYF.cVwr.mE8QKxTK6p1R3CvJ5kH7tvNdLm', NULL, 'wqew2@sda.pea', 0, 1637596695, 1637596695, 'POXFBmzmgDDqYzUddTTWDIrPDinQGgz8_1637596695'),
(13, 'aqweqwa', 'sDM1kj0KrLx1Pq9uuEZbKi4iWLw9S5Xs', '$2y$13$qxebr.BGZ/CLyVB7F8AVy.X.slwndLJCJYB/a19bcljELSfpjEclO', NULL, 'wqew2@sda.peaa', 0, 1637597156, 1637597156, 'KIUzYjeCZMZDnJWhtf5c-GzCw5xgVbXv_1637597156'),
(14, 'asda', 'o6TUBCcALIDlrOSmTDZEHGrreK7q1_N3', '$2y$13$CBYn09vBmqBVDVnLghZ1tOmvAFl8hkTZX6EAc4yMWTTDLs2dBz6a.', NULL, 'qwerty@asda.poa', 0, 1637599697, 1637599697, '0-sBEJjYf4pdP5BPOTk6wlkhQA9Vqvlk_1637599697'),
(15, 'testenovo', 'rS0fkhvZmhizOTi6g37dRjbwPTs1kuHW', '$2y$13$JpRGiDIbsVtrS2.T.GcU.u8tqzbMfuWKcA1XpbZ/cUCB82K6gSR96', NULL, 'testenovo@escola.pt', 0, 1637602659, 1637602659, 'xn9nUVQCi0ullaHMYCBuZqvWLzBDf8vp_1637602659'),
(16, 'UserTest', 'leCoTDhnSejhSl5rghOawbAy1diLQmAV', '$2y$13$4qtHeoCeLq7GSxvRXeRA3uyjRPqvB0U06dFG1O3M0NwWhTq47eul.', NULL, 'aulateste@teste.pt', 10, 1638458790, 1638458790, 'XYeKLunbyQSULf3Ig-zaGY-SKi8bMNEY_1638458790');

-- --------------------------------------------------------

--
-- Table structure for table `userprofiles`
--

CREATE TABLE `userprofiles` (
  `id` int(11) NOT NULL,
  `nif` int(9) NOT NULL,
  `name` varchar(20) NOT NULL,
  `cellphone` int(9) NOT NULL,
  `street` varchar(20) NOT NULL,
  `door` int(11) NOT NULL,
  `floor` int(11) DEFAULT NULL,
  `city` varchar(15) NOT NULL,
  `nib` char(25) DEFAULT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userprofiles`
--

INSERT INTO `userprofiles` (`id`, `nif`, `name`, `cellphone`, `street`, `door`, `floor`, `city`, `nib`, `userid`) VALUES
(1, 987654321, 'pedro Lourenço', 987654321, 'fewf', 21, NULL, 'Leiria', NULL, 9),
(2, 123456789, 'testes signup 4th', 987654321, 'fewf', 21, 1, 'Leiria', NULL, 15);

-- --------------------------------------------------------

--
-- Table structure for table `userschedulesregistry`
--

CREATE TABLE `userschedulesregistry` (
  `id` int(11) NOT NULL,
  `employee_entry` datetime NOT NULL,
  `employee_exit` datetime NOT NULL,
  `userprofilesid` int(11) NOT NULL,
  `schedulesid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vitamins`
--

CREATE TABLE `vitamins` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `ingredientsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inforestaurants`
--
ALTER TABLE `inforestaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_meals_id_category` (`categoryid`);

--
-- Indexes for table `meal_ingredients`
--
ALTER TABLE `meal_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ingredientsid_mealingredients` (`ingredientsid`),
  ADD KEY `fk_meals_id_mealingredients` (`mealsid`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `minerals`
--
ALTER TABLE `minerals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ingredientsid_minerals` (`ingredientsid`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_userprofile_id` (`userprofilesid`),
  ADD KEY `fk_table_id` (`tableid`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_userprofile_id_reviews` (`userprofilesid`),
  ADD KEY `fk_salesmeals_idmeal_reviews` (`sales_mealsidmeal`),
  ADD KEY `fk_salesmeals_idsales_reviews` (`sales_mealsidsales`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_userprofile_id_sales` (`userprofilesid`);

--
-- Indexes for table `sales_meals`
--
ALTER TABLE `sales_meals`
  ADD KEY `fk_meal_id_salesmeals` (`mealid`),
  ADD KEY `fk_sales_id_salesmeals` (`salesid`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `userprofiles`
--
ALTER TABLE `userprofiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`userid`);

--
-- Indexes for table `userschedulesregistry`
--
ALTER TABLE `userschedulesregistry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_schedules_id` (`schedulesid`),
  ADD KEY `fk_userprofiles_id` (`userprofilesid`);

--
-- Indexes for table `vitamins`
--
ALTER TABLE `vitamins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ingredientsid_vitamins` (`ingredientsid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inforestaurants`
--
ALTER TABLE `inforestaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meal_ingredients`
--
ALTER TABLE `meal_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `minerals`
--
ALTER TABLE `minerals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `userprofiles`
--
ALTER TABLE `userprofiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userschedulesregistry`
--
ALTER TABLE `userschedulesregistry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vitamins`
--
ALTER TABLE `vitamins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meals`
--
ALTER TABLE `meals`
  ADD CONSTRAINT `fk_meals_id_category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`);

--
-- Constraints for table `meal_ingredients`
--
ALTER TABLE `meal_ingredients`
  ADD CONSTRAINT `fk_ingredientsid_mealingredients` FOREIGN KEY (`ingredientsid`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `fk_meals_id_mealingredients` FOREIGN KEY (`mealsid`) REFERENCES `meals` (`id`);

--
-- Constraints for table `minerals`
--
ALTER TABLE `minerals`
  ADD CONSTRAINT `fk_ingredientsid_minerals` FOREIGN KEY (`ingredientsid`) REFERENCES `ingredients` (`id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_table_id` FOREIGN KEY (`tableid`) REFERENCES `tables` (`id`),
  ADD CONSTRAINT `fk_userprofile_id` FOREIGN KEY (`userprofilesid`) REFERENCES `user` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_salesmeals_idmeal_reviews` FOREIGN KEY (`sales_mealsidmeal`) REFERENCES `sales_meals` (`mealid`),
  ADD CONSTRAINT `fk_salesmeals_idsales_reviews` FOREIGN KEY (`sales_mealsidsales`) REFERENCES `sales_meals` (`salesid`),
  ADD CONSTRAINT `fk_userprofile_id_reviews` FOREIGN KEY (`userprofilesid`) REFERENCES `userprofiles` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_userprofile_id_sales` FOREIGN KEY (`userprofilesid`) REFERENCES `userprofiles` (`id`);

--
-- Constraints for table `sales_meals`
--
ALTER TABLE `sales_meals`
  ADD CONSTRAINT `fk_meal_id_salesmeals` FOREIGN KEY (`mealid`) REFERENCES `meals` (`id`),
  ADD CONSTRAINT `fk_sales_id_salesmeals` FOREIGN KEY (`salesid`) REFERENCES `sales` (`id`);

--
-- Constraints for table `userprofiles`
--
ALTER TABLE `userprofiles`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `userschedulesregistry`
--
ALTER TABLE `userschedulesregistry`
  ADD CONSTRAINT `fk_schedules_id` FOREIGN KEY (`schedulesid`) REFERENCES `schedules` (`id`),
  ADD CONSTRAINT `fk_userprofiles_id` FOREIGN KEY (`userprofilesid`) REFERENCES `userprofiles` (`id`);

--
-- Constraints for table `vitamins`
--
ALTER TABLE `vitamins`
  ADD CONSTRAINT `fk_ingredientsid_vitamins` FOREIGN KEY (`ingredientsid`) REFERENCES `ingredients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
