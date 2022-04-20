-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 185.61.137.168:3306
-- Generation Time: Apr 15, 2022 at 05:49 PM
-- Server version: 10.3.34-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dexteres_butterfly`
--

-- --------------------------------------------------------

--
-- Table structure for table `anti_ddos`
--

CREATE TABLE `anti_ddos` (
  `id` int(11) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(128) NOT NULL DEFAULT '0.0.0.0',
  `timestamp` int(11) NOT NULL,
  `logs_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attention`
--

CREATE TABLE `attention` (
  `id` int(11) NOT NULL,
  `attention_msg` text NOT NULL,
  `attention_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bandwidth_logs`
--

CREATE TABLE `bandwidth_logs` (
  `id` int(11) NOT NULL,
  `server` text NOT NULL,
  `server_ip` text NOT NULL,
  `server_port` text NOT NULL,
  `since_connected` text NOT NULL,
  `username` text NOT NULL,
  `ipaddress` text NOT NULL,
  `bytes_received` text NOT NULL,
  `bytes_sent` text NOT NULL,
  `bandwidth` bigint(20) NOT NULL DEFAULT 0,
  `time` datetime NOT NULL,
  `time_in` datetime NOT NULL,
  `time_out` datetime NOT NULL,
  `status` enum('offline','online') NOT NULL,
  `timestamp` int(11) NOT NULL,
  `category` enum('premium','vip','ph','private','free') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conversion_logs`
--

CREATE TABLE `conversion_logs` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `premium` varchar(755) NOT NULL,
  `vip` varchar(755) NOT NULL,
  `description` varchar(755) NOT NULL,
  `logs_date` datetime NOT NULL,
  `ipaddress` varchar(32) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credits_logs`
--

CREATE TABLE `credits_logs` (
  `id` int(11) NOT NULL,
  `credits_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `credits_id2` int(11) NOT NULL,
  `credits_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `credits_qty` int(11) NOT NULL,
  `credits_date` datetime NOT NULL,
  `seller` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `credits_logs`
--

INSERT INTO `credits_logs` (`id`, `credits_id`, `credits_id2`, `credits_username`, `credits_qty`, `credits_date`, `seller`) VALUES
(840, '10943', 19360, 'gibo10968', 35, '2022-03-28 21:06:24', ''),
(841, '10486', 19487, 'bossrolan', 500000, '2022-04-15 23:43:59', ''),
(842, '19487', 19489, 'Melai012', 20000, '2022-04-15 23:48:34', '');

-- --------------------------------------------------------

--
-- Table structure for table `cronjob_banned_ip`
--

CREATE TABLE `cronjob_banned_ip` (
  `id` int(11) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `content` varchar(128) NOT NULL DEFAULT 'Attempting',
  `ip` varchar(128) NOT NULL DEFAULT '0.0.0.0',
  `logs_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cronjob_logs`
--

CREATE TABLE `cronjob_logs` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `ipaddress` varchar(128) NOT NULL DEFAULT '0.0.0.0',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dns`
--

CREATE TABLE `dns` (
  `dns_id` int(11) NOT NULL,
  `host_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `domain_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `ip_address` varchar(50) CHARACTER SET latin1 NOT NULL,
  `record_type` varchar(50) CHARACTER SET latin1 NOT NULL,
  `status` int(11) NOT NULL,
  `global_api` varchar(255) CHARACTER SET latin1 NOT NULL,
  `zone_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dns`
--

INSERT INTO `dns` (`dns_id`, `host_name`, `domain_name`, `ip_address`, `record_type`, `status`, `global_api`, `zone_id`, `email`) VALUES
(49631, 'demo78', 'firenet.ph', '1.2.33.3', 'A', 1, '20f989db3c168115b85e51e03b07b9c7eb85b', '09b93e9eb90d2ae30b3eb1452b8a6588', 'harulenz@gmail.com'),
(58757, 'test76', 'firenet.ph', '125.36.2.3', 'A', 1, '20f989db3c168115b85e51e03b07b9c7eb85b', '09b93e9eb90d2ae30b3eb1452b8a6588', 'harulenz@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE `download` (
  `id` int(11) NOT NULL,
  `download_category` enum('public','seller') NOT NULL,
  `download_title` varchar(767) NOT NULL,
  `download_msg` text NOT NULL,
  `download_network` enum('NOTICE','UPDATE') NOT NULL,
  `download_device` enum('ANDROID','IOS','WINDOWS','CONFIG','OTHERS') NOT NULL,
  `download_file` varchar(999) NOT NULL,
  `download_date` datetime NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `downloaded` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `download`
--

INSERT INTO `download` (`id`, `download_category`, `download_title`, `download_msg`, `download_network`, `download_device`, `download_file`, `download_date`, `views`, `downloaded`) VALUES
(14, 'public', 'Welcome to Mediatek Vpn', 'The entire team of Mediatek Vpn is thrilled to welcome you on board. We hope you&rsquo;ll do some amazing works here!&nbsp;<br /><br />Congratulations on being part of the team! The whole team welcomes you and we look forward to a successful journey with you! Welcome aboard!', 'NOTICE', 'OTHERS', '', '2020-09-20 18:36:48', 0, 0),
(15, 'public', 'How to update Mediatek Vpn applications', 'MediatekVpn applications get staged automatic updates. It means that some users get their automatic&nbsp;updates earlier than others. The reason for that is to avoid massive issues in case&nbsp;of some failure related to the updates.<br /><br />If you haven&#39;t got an automatic update yet, you will get it within a few days. If you wish to get the latest app version now, you can download it from our&nbsp;News and Updates section. The download page always provides&nbsp;the latest available app versions for all operating systems.', 'NOTICE', 'OTHERS', '', '2020-09-20 18:36:30', 0, 0),
(16, 'public', 'VPN for Netflix: watch Netflix securely', '<p>To ensure&nbsp;secure access to Netflix, you can connect to&nbsp;<strong>any of our&nbsp;<a href=\"https://www.mediafire.com/file/maep1aoi00x28t4/Mediatek+Lite+TunnelDex-Build+1.apk/file\" target=\"_blank\">servers</a>&nbsp;listed below</strong>. We recommend using the servers closest to your location for the best connection speed and stability.<br /><br /><strong>Netflix US:</strong><br />You should connect to any of our servers in countries&nbsp;<strong>other than</strong>&nbsp;Canada, Germany, the United Kingdom, France, Italy, Japan, Australia, the Netherlands, India, Brazil, Spain, Portugal, South Korea, and Finland.</p><p><strong>Netflix CA:</strong><br />You should connect to any of our servers in Canada.</p><p><strong>Netflix DE:</strong><br />You should connect to any of our servers in Germany.</p>', 'NOTICE', 'OTHERS', '', '2020-09-20 18:36:10', 0, 0),
(43, 'public', 'FILE UPLOAD TEST', 'TEST FILE UPLOAD', 'UPDATE', 'ANDROID', '1603515957.zip', '2020-12-12 10:49:44', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `duration`
--

CREATE TABLE `duration` (
  `id` int(11) NOT NULL,
  `duration_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duration_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `duration`
--

INSERT INTO `duration` (`id`, `duration_name`, `duration_time`) VALUES
(1, '1 Hour', 3600),
(2, '2 Hours', 7200),
(3, '3 Hours', 10800),
(4, '4 Hours', 14400),
(5, '5 Hours', 18000),
(6, '6 Hours', 21600),
(7, '7 Hours', 25200),
(8, '8 Hours', 28800),
(9, '9 Hours', 32400),
(10, '10 Hours', 36000),
(11, '11 Hours', 39600),
(12, '12 Hours', 43200),
(13, '13 Hours', 46800),
(14, '14 Hours', 50400),
(15, '15 Hours', 54000),
(16, '16 Hours', 57600),
(17, '17 Hours', 61200),
(18, '18 Hours', 64800),
(19, '19 Hours', 68400),
(20, '20 Hours', 72000),
(21, '21 Hours', 75600),
(22, '22 Hours', 79200),
(23, '23 Hours', 82800),
(24, '1 Day', 86400),
(25, '2 Days', 172800),
(26, '3 Days', 259200),
(27, '4 Days', 345600),
(28, '5 Days', 432000),
(29, '6 Days', 518400),
(30, '7 Days', 604800),
(31, '8 Days', 691200),
(32, '9 Days', 777600),
(33, '10 Days', 864000),
(34, '15 Days', 1296000),
(35, '20 Days', 1728000),
(36, '30 Days', 2592000),
(37, '31 Days', 2678400),
(38, '32 Days', 2764800),
(40, '-1 Hour', -3600),
(41, '-2 Hours', -7200),
(42, '-3 Hours', -10800),
(43, '-4 Hours', -14400),
(44, '-5 Hours', -18000),
(45, '-6 Hours', -21600),
(46, '-7 Hours', -25200),
(47, '-8 Hours', -28800),
(48, '-9 Hours', -32400),
(49, '-10 Hours', -36000),
(50, '-11 Hours', -39600),
(51, '-12 Hours', -43200),
(52, '-13 Hours', -46800),
(53, '-14 Hours', -50400),
(54, '-15 Hours', -54000),
(55, '-16 Hours', -57600),
(56, '-17 Hours', -61200),
(57, '-18 Hours', -64800),
(58, '-19 Hours', -68400),
(59, '-20 Hours', -72000),
(60, '-21 Hours', -75600),
(61, '-22 Hours', -79200),
(62, '-23 Hours', -82800),
(63, '-1 Day', -86400),
(64, '-2 Days', -172800),
(65, '-3 Days', -259200),
(66, '-4 Days', -345600),
(67, '-5 Days', -432000),
(68, '-6 Days', -518400),
(69, '-7 Days', -604800),
(70, '-8 Days', -691200),
(71, '-9 Days', -777600),
(72, '-10 Days', -864000),
(73, '-15 Days', -1296000),
(74, '-20 Days', -1728000),
(75, '-30 Days', -2592000);

-- --------------------------------------------------------

--
-- Table structure for table `duration_logs`
--

CREATE TABLE `duration_logs` (
  `id` int(11) NOT NULL,
  `duration_id` int(11) NOT NULL,
  `duration_id2` int(11) NOT NULL,
  `duration_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `duration_qty` int(11) NOT NULL,
  `duration_item` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `duration_date` datetime NOT NULL,
  `duration_type` enum('premium','vip','private') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'premium',
  `ipaddress` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `duration_logs`
--

INSERT INTO `duration_logs` (`id`, `duration_id`, `duration_id2`, `duration_username`, `duration_qty`, `duration_item`, `duration_date`, `duration_type`, `ipaddress`) VALUES
(558, 10520, 10520, 'bossrolan', 1, '30 Days', '2022-04-14 13:10:30', 'premium', '51.79.255.150');

-- --------------------------------------------------------

--
-- Table structure for table `freeze_request`
--

CREATE TABLE `freeze_request` (
  `id` int(11) NOT NULL,
  `content` varchar(128) NOT NULL DEFAULT 'Freeze Request',
  `status` enum('pending','approved') NOT NULL DEFAULT 'pending',
  `client_id` int(11) NOT NULL,
  `client_name` varchar(128) NOT NULL,
  `client_ipaddress` varchar(128) NOT NULL DEFAULT '0.0.0.0',
  `request_date` datetime NOT NULL DEFAULT current_timestamp(),
  `reseller_id` int(11) NOT NULL,
  `reseller_name` varchar(128) NOT NULL,
  `reseller_ipaddress` varchar(128) NOT NULL DEFAULT '0.0.0.0',
  `process_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `limit_logs`
--

CREATE TABLE `limit_logs` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `username` varchar(64) COLLATE latin1_general_ci NOT NULL,
  `subadmin_limit` int(11) NOT NULL DEFAULT 0,
  `reseller_limit` int(11) NOT NULL DEFAULT 0,
  `subreseller_limit` int(11) NOT NULL DEFAULT 0,
  `client_limit` int(11) NOT NULL,
  `user_level` enum('normal','reseller','subreseller','subadmin','admin','superadmin') COLLATE latin1_general_ci NOT NULL DEFAULT 'normal',
  `logs_date` datetime NOT NULL,
  `ipaddress` varchar(64) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `limit_registration`
--

CREATE TABLE `limit_registration` (
  `id` int(11) NOT NULL,
  `ipaddress` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `regtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `ip` varchar(20) DEFAULT NULL,
  `attempts` int(11) DEFAULT 0,
  `lastlogin` datetime DEFAULT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts_logs`
--

CREATE TABLE `login_attempts_logs` (
  `id` int(11) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `user_name` varchar(64) NOT NULL,
  `logs_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_attempts_logs`
--

INSERT INTO `login_attempts_logs` (`id`, `ip`, `user_name`, `logs_date`) VALUES
(2192, '175.176.58.160', 'babz0215', '2022-03-28 11:14:06'),
(2191, '51.79.255.150', 'Hades', '2022-03-28 08:56:34'),
(2190, '51.79.255.150', 'Hades', '2022-03-28 08:56:18'),
(2193, '112.201.51.105', 'adminmhikka10', '2022-03-29 01:43:30'),
(2194, '112.209.39.63', 'Jan1234', '2022-03-29 03:18:23'),
(2195, '175.176.5.166', 'Daine15', '2022-03-30 13:13:25'),
(2196, '157.230.251.172', 'bossrolan', '2022-04-15 12:14:09'),
(2197, '172.104.178.113', 'bossrolan', '2022-04-15 14:55:49');

-- --------------------------------------------------------

--
-- Table structure for table `login_banned_ip`
--

CREATE TABLE `login_banned_ip` (
  `id` int(11) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(128) NOT NULL DEFAULT '0.0.0.0',
  `logs_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_banned_ip`
--

INSERT INTO `login_banned_ip` (`id`, `attempts`, `ip`, `logs_date`) VALUES
(997, 1, '2405:8d40:bd0:a829:10cb:592c:eca2:4d80, 172.70.147.124', '2022-01-24 06:12:37'),
(996, 2, '119.92.127.50, 119.92.127.50', '2022-01-24 17:17:27'),
(995, 1, '2001:fd8:482:6221:282b:12dd:1d7e:618f, 162.158.179.253', '2022-01-24 16:18:02'),
(994, 3, '110.54.214.14, 110.54.214.14', '2022-01-24 16:09:34'),
(993, 1, '175.176.15.130, 175.176.15.130', '2022-01-24 15:49:05'),
(992, 1, '2405:8d40:b90:d4a4:16cc:d5c5:b763:3414, 162.158.162.40', '2022-01-23 09:57:21'),
(991, 1, '2001:fd8:1f51:778e:14f8:e4b8:c3c0:1c68, 172.70.189.7', '2022-01-23 12:40:05'),
(990, 2, '175.176.81.215, 175.176.81.215', '2022-01-22 16:34:28'),
(989, 2, '110.54.170.207, 110.54.170.207', '2022-01-22 11:59:02'),
(988, 1, '159.223.72.163, 159.223.72.163', '2022-01-21 16:21:35'),
(987, 1, '175.176.81.143, 175.176.81.143', '2022-01-21 15:54:18'),
(986, 1, '136.158.42.225, 136.158.42.225', '2022-01-21 12:43:32'),
(985, 1, '111.125.106.100, 111.125.106.100', '2022-01-20 10:09:48'),
(984, 2, '175.176.28.19, 175.176.28.19', '2022-01-18 11:35:17'),
(983, 2, '13.126.164.194, 13.126.164.194', '2022-01-18 17:21:02'),
(982, 1, '112.201.34.149, 112.201.34.149', '2022-01-17 15:53:05'),
(981, 1, '110.54.173.176, 110.54.173.176', '2022-01-17 14:22:57'),
(980, 3, '54.81.99.164, 54.81.99.164', '2022-01-16 11:14:23'),
(979, 1, '175.176.84.233, 175.176.84.233', '2022-01-16 07:08:10'),
(978, 1, '160.226.137.47, 160.226.137.47', '2022-01-16 06:25:10'),
(977, 1, '119.94.3.244, 119.94.3.244', '2022-01-16 14:28:34'),
(976, 1, '178.62.193.84, 178.62.193.84', '2022-01-15 15:03:41'),
(975, 1, '175.176.82.250, 175.176.82.250', '2022-01-14 10:31:33'),
(974, 1, '175.176.66.66, 175.176.66.66', '2022-01-14 06:44:53'),
(973, 1, '2001:4455:109:b700:40a4:6968:5e3f:f18a, 172.68.253.16', '2022-01-14 14:21:38'),
(972, 1, '2001:4455:109:b700:40a4:6968:5e3f:f18a, 172.68.254.72', '2022-01-14 14:20:35'),
(971, 1, '175.176.84.182, 175.176.84.182', '2022-01-12 13:12:57'),
(970, 1, '107.191.102.197, 107.191.102.197', '2022-01-12 10:52:14'),
(969, 1, '175.176.58.81, 175.176.58.81', '2022-01-11 13:23:10'),
(968, 1, '2405:8d40:cd0:e270:16c9:2762:500e:38d8, 172.70.143.39', '2022-01-11 12:08:16'),
(967, 3, '110.54.160.5, 110.54.160.5', '2022-01-11 06:41:48'),
(966, 1, '2405:8d40:c71:1198:1c13:78e0:3108:a218, 172.70.147.124', '2022-01-10 13:06:59'),
(965, 1, '2405:8d40:c71:1198:1c13:78e0:3108:a218, 172.70.188.6', '2022-01-10 13:02:47'),
(964, 1, '2405:8d40:c71:1198:1c13:78e0:3108:a218, 172.70.143.39', '2022-01-10 12:58:10'),
(963, 1, '2001:4455:6eb:ac00:6c:acc2:268a:ee2f, 162.158.179.243', '2022-01-10 07:23:55'),
(962, 1, '2001:4455:6eb:ac00:6c:acc2:268a:ee2f, 172.68.254.130', '2022-01-10 07:20:20'),
(961, 1, '110.54.182.111, 110.54.182.111', '2022-01-10 14:12:34'),
(960, 1, '49.149.27.93, 49.149.27.93', '2022-01-09 16:14:34'),
(959, 1, '122.52.177.59, 122.52.177.59', '2022-01-09 09:16:08'),
(958, 1, '175.176.50.130, 175.176.50.130', '2022-01-09 16:49:07'),
(957, 3, '2405:8d40:b80:bae3:947a:ba5d:fcf0:6344, 172.70.189.7', '2022-01-08 13:08:22'),
(956, 1, '2001:fd8:481:7154:324e:aaaa:f62:fabd, 162.158.167.184', '2022-01-08 12:25:35'),
(954, 1, '2405:8d40:ce0:db68:e92e:a080:332b:32c, 172.70.147.124', '2022-01-05 13:59:16'),
(953, 2, '2405:8d40:c50:8bd6:16c7:5392:ef5e:ced1, 162.158.166.155', '2022-01-05 10:51:40'),
(952, 1, '2001:fd8:506:192b:2140:18f3:4c13:dab, 162.158.178.249', '2022-01-05 08:32:37'),
(951, 2, '110.54.151.244, 110.54.151.244', '2022-01-05 08:59:25'),
(950, 1, '210.213.238.142, 210.213.238.142', '2022-01-04 13:45:52'),
(949, 1, '175.176.95.24, 175.176.95.24', '2022-01-03 14:05:30'),
(948, 1, '175.176.52.93, 175.176.52.93', '2022-01-03 08:31:32'),
(947, 1, '110.54.205.124, 110.54.205.124', '2022-01-03 15:40:50'),
(946, 2, '175.176.68.132, 175.176.68.132', '2022-01-02 09:16:39'),
(945, 3, '110.54.229.149, 110.54.229.149', '2022-01-02 06:54:25'),
(943, 2, '175.176.64.184, 175.176.64.184', '2021-12-31 12:39:03'),
(942, 1, '175.176.17.59, 175.176.17.59', '2021-12-31 10:55:05'),
(941, 2, '131.226.64.77, 131.226.64.77', '2021-12-30 10:30:10'),
(940, 3, '175.176.95.55, 175.176.95.55', '2021-12-29 13:51:14'),
(939, 1, '175.176.95.6, 175.176.95.6', '2021-12-29 12:17:39'),
(938, 3, '131.226.64.91, 131.226.64.91', '2021-12-29 06:27:09'),
(937, 2, '110.54.197.243, 110.54.197.243', '2021-12-29 13:07:06'),
(936, 3, '112.198.95.40, 112.198.95.40', '2021-12-28 14:36:49'),
(935, 3, '120.28.218.224, 120.28.218.224', '2021-12-28 12:33:50'),
(934, 1, '143.198.84.235, 143.198.84.235', '2021-12-28 11:34:58'),
(933, 1, '175.176.28.101, 175.176.28.101', '2021-12-28 15:54:52'),
(932, 1, '175.176.2.77', '2021-12-28 06:33:05'),
(931, 3, '165.232.170.130, 165.232.170.130', '2021-12-27 16:56:44'),
(930, 2, '112.200.72.91, 112.200.72.91', '2021-12-27 14:30:59'),
(929, 1, '175.176.67.65, 175.176.67.65', '2021-12-27 07:53:54'),
(928, 1, '49.145.163.28, 49.145.163.28', '2021-12-27 17:46:40'),
(927, 1, '128.199.136.172, 128.199.136.172', '2021-12-25 13:56:38'),
(944, 2, '175.176.58.32, 175.176.58.32', '2022-01-01 15:08:38'),
(925, 1, '161.35.180.45, 161.35.180.45', '2021-12-25 07:18:55'),
(924, 2, '175.176.47.200, 175.176.47.200', '2021-12-25 07:12:04'),
(923, 1, '68.183.188.3, 68.183.188.3', '2021-12-24 09:00:44'),
(922, 1, '121.58.250.100, 121.58.250.100', '2021-12-24 16:40:26'),
(921, 1, '112.198.104.253, 112.198.104.253', '2021-12-22 14:06:35'),
(920, 1, '128.199.154.168, 128.199.154.168', '2021-12-22 12:54:34'),
(919, 3, '157.230.38.230, 157.230.38.230', '2021-12-22 17:42:30'),
(918, 1, '175.176.58.63, 175.176.58.63', '2021-12-21 17:17:14'),
(917, 1, '136.158.35.89, 136.158.35.89', '2021-12-21 15:52:23'),
(916, 2, '2001:4451:97f:da00:948b:d66c:e653:1969, 172.68.253.60', '2021-12-21 15:11:06'),
(915, 3, '175.176.28.118, 175.176.28.118', '2021-12-21 14:56:50'),
(914, 3, '119.94.161.96', '2021-12-21 14:28:42'),
(913, 1, '136.158.41.14, 136.158.41.14', '2021-12-20 12:30:06'),
(912, 1, '112.201.52.52, 112.201.52.52', '2021-12-20 10:12:35'),
(911, 2, '175.176.83.236, 175.176.83.236', '2021-12-20 09:18:27'),
(910, 2, '157.230.46.74, 157.230.46.74', '2021-12-20 17:04:40'),
(955, 3, '180.195.138.216, 180.195.138.216', '2022-01-08 14:03:05'),
(908, 1, '136.158.1.26, 136.158.1.26', '2021-12-20 14:48:04'),
(907, 3, '3.36.126.48, 3.36.126.48', '2022-01-20 13:01:26'),
(906, 1, '112.198.87.213, 112.198.87.213', '2021-12-20 12:33:52'),
(905, 3, '175.176.28.86, 175.176.28.86', '2021-12-19 16:44:57'),
(904, 6, '206.189.81.161, 206.189.81.161', '2022-01-08 07:01:43'),
(903, 1, '112.201.42.95, 112.201.42.95', '2021-12-18 13:33:59'),
(902, 2, '110.54.184.15, 110.54.184.15', '2021-12-18 13:09:38'),
(901, 1, '175.176.69.250, 175.176.69.250', '2021-12-18 07:18:44'),
(900, 1, '175.176.29.99, 175.176.29.99', '2021-12-18 13:32:52'),
(899, 1, '157.230.38.195, 157.230.38.195', '2021-12-17 12:31:31'),
(898, 1, '203.92.15.245, 203.92.15.245', '2021-12-16 16:10:06'),
(897, 1, '49.145.40.54, 49.145.40.54', '2021-12-16 11:29:42'),
(896, 1, '2001:fd8:6c0:895a:d30:be16:7359:4b1f, 162.158.179.97', '2021-12-16 07:46:18'),
(895, 1, '110.54.178.227, 110.54.178.227', '2021-12-15 17:56:19'),
(894, 1, '2405:8d40:b40:27aa:16c0:9f50:c3d7:29c, 162.158.165.236', '2021-12-15 12:11:52'),
(893, 1, '131.226.64.127, 131.226.64.127', '2021-12-14 13:33:43'),
(892, 1, '112.198.72.59, 112.198.72.59', '2021-12-14 12:27:39'),
(891, 1, '203.160.170.234, 203.160.170.234', '2021-12-14 14:24:31'),
(890, 1, '167.71.199.79, 167.71.199.79', '2021-12-13 12:05:17'),
(889, 1, '203.92.8.46, 203.92.8.46', '2021-12-13 06:15:18'),
(888, 3, '167.172.81.79, 167.172.81.79', '2021-12-12 10:49:34'),
(887, 1, '112.199.115.20, 112.199.115.20', '2021-12-12 17:25:04'),
(886, 2, '120.89.46.253, 120.89.46.253', '2022-01-24 11:09:18'),
(885, 4, '112.198.69.63, 112.198.69.63', '2021-12-12 17:10:41'),
(884, 6, '206.189.86.42, 206.189.86.42', '2022-01-07 14:43:26'),
(998, 1, '110.54.205.57, 110.54.205.57', '2022-01-24 06:41:00'),
(999, 1, '2001:4451:1b2:4e00:cf2:40e9:8839:5190, 162.158.179.52', '2022-01-24 16:22:54'),
(1000, 1, '175.176.32.216, 175.176.32.216', '2022-01-25 07:50:52'),
(1001, 1, '51.79.255.150, 51.79.255.150', '2022-01-25 10:13:00'),
(1002, 1, '120.29.77.49, 120.29.77.49', '2022-01-25 10:54:10'),
(1003, 1, '103.154.250.8, 103.154.250.8', '2022-01-25 11:23:38'),
(1004, 3, '175.176.9.177, 175.176.9.177', '2022-01-25 13:56:14'),
(1005, 1, '157.245.203.171, 157.245.203.171', '2022-01-26 12:51:51'),
(1006, 1, '165.22.48.67, 165.22.48.67', '2022-01-27 15:04:58'),
(1007, 2, '159.223.64.59, 159.223.64.59', '2022-01-27 08:14:13'),
(1008, 5, '155.137.111.40, 155.137.111.40', '2022-01-27 14:16:27'),
(1009, 1, '122.2.183.57, 122.2.183.57', '2022-01-28 14:41:14'),
(1010, 3, '103.253.145.158, 103.253.145.158', '2022-01-28 15:43:07'),
(1011, 3, '175.176.72.79, 175.176.72.79', '2022-01-28 10:59:23'),
(1012, 2, '136.158.35.35, 136.158.35.35', '2022-01-29 15:44:17'),
(1013, 1, '163.44.159.202, 163.44.159.202', '2022-01-29 16:30:33'),
(1014, 1, '175.176.84.73, 175.176.84.73', '2022-01-29 16:59:14'),
(1015, 2, '175.176.5.131, 175.176.5.131', '2022-01-29 08:19:55'),
(1016, 1, '122.2.183.53, 122.2.183.53', '2022-01-29 09:30:16'),
(1017, 3, '122.2.183.54, 122.2.183.54', '2022-01-30 13:34:52'),
(1018, 1, '175.176.52.116, 175.176.52.116', '2022-01-30 15:42:33'),
(1019, 2, '45.202.21.226, 45.202.21.226', '2022-01-30 17:05:01'),
(1020, 1, '175.176.50.64, 175.176.50.64', '2022-01-30 09:01:30'),
(1021, 2, '175.176.8.18, 175.176.8.18', '2022-01-30 14:51:58'),
(1022, 3, '159.65.2.28, 159.65.2.28', '2022-01-31 13:14:32'),
(1024, 1, '51.79.249.130, 51.79.249.130', '2022-01-31 08:49:06'),
(1025, 1, '122.2.110.11, 122.2.110.11', '2022-02-01 12:57:08'),
(1026, 1, '128.90.43.109, 128.90.43.109', '2022-02-02 17:26:01'),
(1027, 1, '159.223.47.10, 159.223.47.10', '2022-02-02 14:34:20'),
(1028, 1, '159.223.127.151, 159.223.127.151', '2022-02-03 06:08:51'),
(1029, 1, '175.176.85.142, 175.176.85.142', '2022-02-03 12:17:06'),
(1030, 2, '209.97.170.138, 209.97.170.138', '2022-02-03 14:56:59'),
(1031, 3, '157.245.243.211, 157.245.243.211', '2022-02-06 15:38:14'),
(1032, 3, '180.191.120.155, 180.191.120.155', '2022-02-03 12:04:44'),
(1033, 3, '175.176.8.30, 175.176.8.30', '2022-02-04 08:06:42'),
(1034, 2, '2405:8d40:b10:b3a1:a19c:85c1:9e61:e94d, 172.70.189.7', '2022-02-05 17:59:38'),
(1035, 1, '114.108.219.87, 114.108.219.87', '2022-02-05 09:34:17'),
(1036, 3, '142.93.254.211, 142.93.254.211', '2022-02-05 09:32:41'),
(1037, 1, '178.128.27.58, 178.128.27.58', '2022-02-05 09:36:09'),
(1038, 1, '110.54.140.48, 110.54.140.48', '2022-02-05 13:13:27'),
(1039, 2, '2001:4455:165:a900:8032:b3a0:d79e:4beb, 172.68.253.40', '2022-02-05 15:19:03'),
(1040, 3, '2001:4455:165:a900:8032:b3a0:d79e:4beb, 162.158.179.247', '2022-02-05 15:30:25'),
(1041, 3, '2001:4455:165:a900:8032:b3a0:d79e:4beb, 162.158.179.247', '2022-02-05 15:30:25'),
(1042, 3, '2001:4455:165:a900:8032:b3a0:d79e:4beb, 162.158.179.247', '2022-02-05 15:30:25'),
(1043, 3, '2001:4455:165:a900:8032:b3a0:d79e:4beb, 162.158.179.247', '2022-02-05 15:30:25'),
(1044, 3, '2001:4455:165:a900:8032:b3a0:d79e:4beb, 162.158.179.247', '2022-02-05 15:30:25'),
(1045, 1, '175.176.29.86, 175.176.29.86', '2022-02-06 13:40:49'),
(1046, 1, '143.44.196.253, 143.44.196.253', '2022-02-06 08:29:38'),
(1047, 1, '180.190.81.132, 180.190.81.132', '2022-02-06 11:10:18'),
(1199, 1, '62.216.81.89', '2022-03-13 14:26:54'),
(1065, 2, '120.29.107.42', '2022-02-09 12:00:28'),
(1059, 2, '131.226.65.187', '2022-02-08 09:54:04'),
(1068, 1, '110.54.210.79', '2022-02-10 11:31:20'),
(1247, 1, '175.176.85.199', '2022-03-23 10:23:26'),
(1073, 2, '203.92.9.139', '2022-02-11 08:05:26'),
(1074, 2, '175.176.92.154', '2022-02-11 08:49:22'),
(1080, 1, '175.176.21.58', '2022-02-12 09:12:11'),
(1132, 1, '175.176.7.142', '2022-03-01 14:17:56'),
(1195, 1, '202.5.177.251', '2022-03-12 11:12:34'),
(1197, 1, '110.54.207.30', '2022-03-13 16:19:39'),
(1217, 3, '175.176.64.214', '2022-03-17 14:03:37'),
(1206, 1, '110.54.184.36', '2022-03-16 14:11:05'),
(1252, 1, '175.176.84.91', '2022-03-24 15:24:38'),
(1219, 1, '111.90.211.142', '2022-03-17 14:38:09'),
(1230, 1, '175.176.26.139', '2022-03-18 13:03:37'),
(1228, 1, '103.150.221.14', '2022-03-17 14:13:34'),
(1254, 2, '175.176.26.246', '2022-03-25 11:21:54'),
(1264, 1, '112.198.98.75', '2022-03-26 10:36:37'),
(1273, 1, '175.176.58.160', '2022-03-28 15:14:05'),
(1276, 1, '175.176.5.166', '2022-03-30 09:13:25');

-- --------------------------------------------------------

--
-- Table structure for table `nas`
--

CREATE TABLE `nas` (
  `id` int(11) NOT NULL,
  `nasname` varchar(128) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT 'other',
  `ports` int(11) DEFAULT NULL,
  `secret` varchar(60) NOT NULL DEFAULT 'secret',
  `server` varchar(64) DEFAULT NULL,
  `community` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT 'RADIUS Client'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radacct`
--

CREATE TABLE `radacct` (
  `radacctid` bigint(20) NOT NULL,
  `acctsessionid` varchar(64) NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `realm` varchar(64) DEFAULT '',
  `nasipaddress` varchar(15) NOT NULL DEFAULT '',
  `nasportid` varchar(15) DEFAULT NULL,
  `nasporttype` varchar(32) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctsessiontime` int(10) UNSIGNED DEFAULT NULL,
  `acctauthentic` varchar(32) DEFAULT NULL,
  `connectinfo_start` varchar(50) DEFAULT NULL,
  `connectinfo_stop` varchar(50) DEFAULT NULL,
  `acctinputoctets` bigint(20) DEFAULT NULL,
  `acctoutputoctets` bigint(20) DEFAULT NULL,
  `calledstationid` varchar(50) NOT NULL DEFAULT '',
  `callingstationid` varchar(50) NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) NOT NULL DEFAULT '',
  `servicetype` varchar(32) DEFAULT NULL,
  `framedprotocol` varchar(32) DEFAULT NULL,
  `framedipaddress` varchar(15) NOT NULL DEFAULT '',
  `acctstartdelay` int(10) UNSIGNED DEFAULT NULL,
  `acctstopdelay` int(10) UNSIGNED DEFAULT NULL,
  `xascendsessionsvrkey` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radcheck`
--

CREATE TABLE `radcheck` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radgroupcheck`
--

CREATE TABLE `radgroupcheck` (
  `id` int(10) UNSIGNED NOT NULL,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radgroupreply`
--

CREATE TABLE `radgroupreply` (
  `id` int(10) UNSIGNED NOT NULL,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radpostauth`
--

CREATE TABLE `radpostauth` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `pass` varchar(64) NOT NULL DEFAULT '',
  `reply` varchar(32) NOT NULL DEFAULT '',
  `authdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radreply`
--

CREATE TABLE `radreply` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radusergroup`
--

CREATE TABLE `radusergroup` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recovery_logs`
--

CREATE TABLE `recovery_logs` (
  `id` int(11) NOT NULL,
  `recovery_menu` varchar(255) NOT NULL,
  `recovery_ipaddress` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `recovery_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recovery_logs`
--

INSERT INTO `recovery_logs` (`id`, `recovery_menu`, `recovery_ipaddress`, `recovery_date`) VALUES
(1, 'datuzeed@gmail.com', '128.199.219.35', '2021-03-14 01:02:20'),
(2, 'datuzeed@gmail.com', '128.199.219.35', '2021-03-14 01:07:28'),
(3, 'Datuzeed@gmail.com', '128.199.219.35', '2021-03-14 01:11:19'),
(4, 'mansormohammad05@gmail.com', '175.176.93.222', '2021-03-19 21:31:31'),
(5, 'cacayandexter316@gmail.com', '180.191.186.29', '2021-03-23 13:46:05'),
(6, 'angeloagana@gmail.com', '175.176.76.202', '2021-03-31 11:24:43'),
(7, 'reymartmercadoigop21@gmail.com', '46.101.60.228', '2021-04-22 01:17:46'),
(8, 'reymartmercadoigop21@gmail.com', '46.101.60.228', '2021-04-22 01:24:01'),
(9, 'reymartmercadoigop21@gmail.com', '46.101.60.228', '2021-04-22 01:26:12'),
(10, 'lagazonrowell@yahoo.com', '112.198.104.189', '2021-04-27 20:25:29'),
(11, 'Solpicogenesis@gmail.com', '35.168.23.149', '2021-05-17 02:18:58'),
(12, 'Solpicogenesis@gmail.com', '175.176.33.24', '2021-05-21 19:02:47');

-- --------------------------------------------------------

--
-- Table structure for table `reloadduration_logs`
--

CREATE TABLE `reloadduration_logs` (
  `id` int(11) NOT NULL,
  `duration_id` int(11) NOT NULL,
  `duration_id2` int(11) NOT NULL,
  `duration_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `duration_item` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `duration_date` datetime NOT NULL,
  `duration_type` enum('premium','vip','private') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'premium',
  `ipaddress` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `server_list`
--

CREATE TABLE `server_list` (
  `server_id` int(11) NOT NULL,
  `server_name` varchar(255) NOT NULL,
  `server_ip` varchar(20) NOT NULL,
  `server_user` varchar(50) NOT NULL,
  `server_pass` varchar(255) NOT NULL,
  `server_category` enum('premium','vip','free','private') NOT NULL DEFAULT 'premium',
  `server_port` int(11) NOT NULL DEFAULT 80,
  `server_folder` varchar(255) NOT NULL,
  `server_tcp` varchar(15) NOT NULL DEFAULT 'tcp1',
  `server_parser` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `server_list`
--

INSERT INTO `server_list` (`server_id`, `server_name`, `server_ip`, `server_user`, `server_pass`, `server_category`, `server_port`, `server_folder`, `server_tcp`, `server_parser`, `status`) VALUES
(313, 'pc1', '188.166.188.129', '', '', 'premium', 80, '', 'tcp1', 'http://188.166.188.129:80', 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_options`
--

CREATE TABLE `site_options` (
  `email_validation` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `support_message`
--

CREATE TABLE `support_message` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `support_message` text NOT NULL,
  `support_id_user` int(11) NOT NULL,
  `support_name` varchar(767) NOT NULL,
  `support_groupname` varchar(767) NOT NULL,
  `support_date` datetime NOT NULL,
  `support_ipaddress` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket`
--

CREATE TABLE `support_ticket` (
  `id` int(11) NOT NULL,
  `ticket_name` varchar(767) NOT NULL,
  `ticket_subject` varchar(767) NOT NULL,
  `ticket_message` text NOT NULL,
  `ticket_status` enum('open','customer-reply','answered','closed') NOT NULL,
  `ticket_date` datetime NOT NULL,
  `ticket_update` datetime NOT NULL,
  `ip_address` varchar(767) NOT NULL,
  `ticket_id_user` int(11) NOT NULL,
  `ticket_groupname` varchar(767) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suspension_logs`
--

CREATE TABLE `suspension_logs` (
  `id` int(11) NOT NULL,
  `is_suspended` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_username` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `offense` varchar(225) NOT NULL,
  `logs_date` datetime NOT NULL,
  `ipaddress` varchar(32) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suspension_recovery_logs`
--

CREATE TABLE `suspension_recovery_logs` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_username` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `suspend_date` datetime NOT NULL,
  `offense` varchar(225) NOT NULL,
  `logs_date` datetime NOT NULL,
  `is_unsuspended` int(11) NOT NULL,
  `ipaddress` varchar(32) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `username_logs`
--

CREATE TABLE `username_logs` (
  `id` int(11) NOT NULL,
  `old_username` varchar(50) NOT NULL,
  `new_username` varchar(50) NOT NULL,
  `old_level` varchar(64) NOT NULL,
  `new_level` varchar(64) NOT NULL,
  `old_upline` int(11) NOT NULL,
  `new_upline` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `logs_date` datetime NOT NULL,
  `ipaddress` varchar(32) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `username_logs`
--

INSERT INTO `username_logs` (`id`, `old_username`, `new_username`, `old_level`, `new_level`, `old_upline`, `new_upline`, `client_id`, `user_id`, `logs_date`, `ipaddress`) VALUES
(3707, 'Loviedhou', 'Loviedhou', 'normal', 'normal', 15609, 0, 19470, 15609, '2022-03-28 10:40:53', '120.29.90.81'),
(3706, 'gibo10968', 'gibo10968', 'normal', 'reseller', 10943, 10943, 19360, 10943, '2022-03-28 09:05:59', '175.176.79.47'),
(3705, 'Loviedhou', 'Loviedhou', 'normal', 'normal', 15609, 0, 19470, 15609, '2022-03-28 07:02:32', '120.29.90.81'),
(3708, 'reysan69500', 'reysan69500', 'normal', 'normal', 16051, 0, 19481, 16051, '2022-04-02 12:42:17', '192.53.164.169'),
(3709, 'reysan69500', 'reysan69500', 'normal', 'normal', 16051, 0, 19481, 16051, '2022-04-02 12:44:44', '192.53.164.169'),
(3710, 'Mypro', 'Mypro', 'normal', 'normal', 11659, 0, 19378, 11659, '2022-04-15 03:59:01', '172.104.188.90'),
(3711, 'Mypro', 'Mypro', 'normal', 'normal', 11659, 0, 19378, 11659, '2022-04-15 04:01:41', '172.104.188.90');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT 'jho',
  `code` varchar(10) NOT NULL,
  `ss_id` varchar(64) NOT NULL,
  `ssl_id` varchar(50) NOT NULL DEFAULT 'ssl',
  `user_name` varchar(30) NOT NULL DEFAULT '',
  `user_pass` varchar(256) NOT NULL,
  `attribute` varchar(64) NOT NULL DEFAULT 'MD5-Password',
  `op` char(2) NOT NULL DEFAULT ':=',
  `auth_vpn` varchar(256) NOT NULL,
  `user_email` varchar(50) NOT NULL DEFAULT '',
  `full_name` varchar(50) DEFAULT NULL,
  `regdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ipaddress` varchar(50) NOT NULL DEFAULT '0.0.0.0',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `timestamp` int(11) NOT NULL,
  `reset_code` varchar(255) NOT NULL DEFAULT '0',
  `is_groupname` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_freeze` tinyint(1) NOT NULL DEFAULT 1,
  `is_passchange` tinyint(4) NOT NULL DEFAULT 0,
  `freeze_status` tinyint(5) NOT NULL DEFAULT 0,
  `last_freeze_date` datetime NOT NULL,
  `is_validated` tinyint(1) NOT NULL DEFAULT 0,
  `is_connected` int(11) NOT NULL DEFAULT 0,
  `is_offense` int(11) NOT NULL DEFAULT 0,
  `is_ban` int(11) NOT NULL DEFAULT 1,
  `suspended_date` datetime NOT NULL,
  `duration` bigint(20) NOT NULL DEFAULT 18000,
  `vip_duration` bigint(20) NOT NULL,
  `is_vip` int(11) NOT NULL DEFAULT 0,
  `private_duration` bigint(20) NOT NULL DEFAULT 0,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `role_duration` bigint(50) NOT NULL,
  `private_slot` int(11) NOT NULL DEFAULT 0,
  `private_control` tinyint(1) NOT NULL DEFAULT 0,
  `credits` int(11) NOT NULL DEFAULT 0,
  `upline` int(11) NOT NULL DEFAULT 1,
  `login_status` enum('offline','online') NOT NULL DEFAULT 'offline',
  `last_active_time` datetime NOT NULL,
  `user_level` enum('normal','subreseller','reseller','administrator','subadmin','superadmin') NOT NULL,
  `status` enum('live','freeze','suspended','banned','vacation') NOT NULL DEFAULT 'live',
  `bandwidth` int(11) NOT NULL DEFAULT 0,
  `bandwidth_premium` int(11) NOT NULL,
  `bandwidth_vip` int(11) NOT NULL,
  `bandwidth_ph` int(11) NOT NULL,
  `bandwidth_private` int(11) NOT NULL,
  `bandwidth_free` int(11) NOT NULL,
  `device_connected` int(11) NOT NULL DEFAULT 0,
  `device_id` varchar(50) NOT NULL,
  `device_model` varchar(50) NOT NULL,
  `uuid` varchar(155) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `password`, `code`, `ss_id`, `ssl_id`, `user_name`, `user_pass`, `attribute`, `op`, `auth_vpn`, `user_email`, `full_name`, `regdate`, `ipaddress`, `lastlogin`, `timestamp`, `reset_code`, `is_groupname`, `is_active`, `is_freeze`, `is_passchange`, `freeze_status`, `last_freeze_date`, `is_validated`, `is_connected`, `is_offense`, `is_ban`, `suspended_date`, `duration`, `vip_duration`, `is_vip`, `private_duration`, `is_private`, `role_duration`, `private_slot`, `private_control`, `credits`, `upline`, `login_status`, `last_active_time`, `user_level`, `status`, `bandwidth`, `bandwidth_premium`, `bandwidth_vip`, `bandwidth_ph`, `bandwidth_private`, `bandwidth_free`, `device_connected`, `device_id`, `device_model`, `uuid`) VALUES
(1, 'hjhj', '405154310', '45758', 'any', 'dexter_eskalarte', 'jr205qishrKbpprRtbl42rih6oLJz4rH17CNzba4YYM=', 'MD5-Password', ':=', '9d14ae71476aa09be3baa307555d53a2', 'admin@mediatek.com', 'Dexter Eskalarte', '2018-07-09 10:59:14', '175.176.28.73', '2022-04-15 06:31:10', 0, '0', 'superadmin', 1, 0, 0, 3, '2021-10-12 00:00:02', 1, 0, 0, 0, '0000-00-00 00:00:00', 363, 0, 0, 2592000, 0, 99999, 0, 0, 1000, 1, 'online', '2022-04-15 06:31:10', 'superadmin', 'live', 0, 0, 0, 0, 0, 0, 0, 'DEVICEIDHER', 'DEVICEMODELHERE', '');


-- --------------------------------------------------------

--
-- Table structure for table `users_delete`
--

CREATE TABLE `users_delete` (
  `id` int(11) NOT NULL,
  `delete_timestamp` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL DEFAULT '',
  `user_pass` varchar(256) NOT NULL,
  `auth_vpn` varchar(256) NOT NULL,
  `user_email` varchar(50) NOT NULL DEFAULT '',
  `full_name` varchar(50) DEFAULT NULL,
  `regdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ipaddress` varchar(50) NOT NULL DEFAULT '0.0.0.0',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `timestamp` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `reset_code` varchar(255) NOT NULL DEFAULT '0',
  `is_groupname` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_freeze` tinyint(1) NOT NULL DEFAULT 1,
  `last_freeze_date` date NOT NULL,
  `is_validated` tinyint(1) NOT NULL DEFAULT 0,
  `is_connected` int(11) NOT NULL DEFAULT 0,
  `is_offense` int(11) NOT NULL DEFAULT 0,
  `is_ban` int(11) NOT NULL DEFAULT 1,
  `suspended_date` datetime NOT NULL,
  `duration` bigint(20) NOT NULL DEFAULT 7200,
  `vip_duration` bigint(20) NOT NULL,
  `is_vip` int(11) NOT NULL DEFAULT 0,
  `private_duration` bigint(20) NOT NULL DEFAULT 0,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `private_slot` int(11) NOT NULL DEFAULT 0,
  `private_control` tinyint(1) NOT NULL DEFAULT 0,
  `credits` int(11) NOT NULL DEFAULT 0,
  `upline` int(11) NOT NULL DEFAULT 1,
  `login_status` enum('offline','online') NOT NULL DEFAULT 'offline',
  `last_active_time` datetime NOT NULL,
  `user_level` enum('normal','subreseller','reseller','moderator','subadmin','superadmin') NOT NULL,
  `status` enum('live','freeze','suspended','banned','vacation') NOT NULL DEFAULT 'live',
  `bandwidth` int(11) NOT NULL DEFAULT 0,
  `bandwidth_premium` int(11) NOT NULL,
  `bandwidth_vip` int(11) NOT NULL,
  `bandwidth_ph` int(11) NOT NULL,
  `bandwidth_private` int(11) NOT NULL,
  `bandwidth_free` int(11) NOT NULL,
  `device_connected` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `profile_fb` varchar(250) NOT NULL,
  `profile_address` varchar(255) NOT NULL,
  `profile_number` varchar(13) NOT NULL,
  `profile_image` varchar(255) NOT NULL,
  `bdo` int(11) NOT NULL DEFAULT 0,
  `bitcoin` int(11) NOT NULL DEFAULT 0,
  `bpi` int(11) NOT NULL DEFAULT 0,
  `cebuana` int(11) NOT NULL DEFAULT 0,
  `gcash` int(11) NOT NULL DEFAULT 0,
  `lbc` int(11) NOT NULL DEFAULT 0,
  `lbp` int(11) NOT NULL DEFAULT 0,
  `meetup` int(11) NOT NULL DEFAULT 0,
  `mlkwartapadala` int(11) NOT NULL DEFAULT 0,
  `palawanexpress` int(11) NOT NULL DEFAULT 0,
  `paypal` int(11) NOT NULL DEFAULT 0,
  `prepaidload` int(11) NOT NULL DEFAULT 0,
  `rcbc` int(11) NOT NULL DEFAULT 0,
  `rdperapadala` int(11) NOT NULL DEFAULT 0,
  `smartmoney` int(11) NOT NULL DEFAULT 0,
  `unionbank` int(11) NOT NULL DEFAULT 0,
  `westernunion` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_profile`
--

INSERT INTO `users_profile` (`id`, `profile_id`, `profile_fb`, `profile_address`, `profile_number`, `profile_image`, `bdo`, `bitcoin`, `bpi`, `cebuana`, `gcash`, `lbc`, `lbp`, `meetup`, `mlkwartapadala`, `palawanexpress`, `paypal`, `prepaidload`, `rcbc`, `rdperapadala`, `smartmoney`, `unionbank`, `westernunion`) VALUES
(1, 1, 'No Uploaded', 'Mediatek Avenue 2, Cebu City', '09614817656', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_name` varchar(755) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `reseller_name` varchar(64) NOT NULL,
  `is_qty` int(11) NOT NULL DEFAULT 1,
  `is_used` int(11) NOT NULL,
  `duration` bigint(20) NOT NULL DEFAULT 0,
  `gen_date` datetime NOT NULL,
  `date_used` datetime NOT NULL,
  `category` enum('premium','vip','private') NOT NULL DEFAULT 'premium',
  `permission` tinyint(1) NOT NULL DEFAULT 0,
  `ipaddress` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `code_name`, `user_id`, `client_name`, `reseller_id`, `reseller_name`, `is_qty`, `is_used`, `duration`, `gen_date`, `date_used`, `category`, `permission`, `ipaddress`) VALUES
(17047, 'FBKCM-QRRP6-QXOZW', 19489, 'Melai012', 19487, 'bossrolan', 1, 1, 2592000, '2022-04-15 23:48:49', '2022-04-15 23:48:49', 'premium', 0, ''),
(17046, '1AHHS-3JVYS-RDXDJ', 19488, 'v2ray357', 19487, 'bossrolan', 3, 1, 7776000, '2022-04-15 23:45:42', '2022-04-15 23:45:42', 'premium', 0, ''),
(17045, '10F1V-MMNFM-UNXVK', 19487, 'bossrolan', 10486, 'adminmhikka10', 3, 1, 7776000, '2022-04-15 23:44:21', '2022-04-15 23:44:21', 'premium', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_logs`
--

CREATE TABLE `voucher_logs` (
  `id` int(11) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_name` varchar(755) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `reseller_name` varchar(64) NOT NULL,
  `is_qty` int(11) NOT NULL DEFAULT 1,
  `is_used` int(11) NOT NULL,
  `date_used` datetime NOT NULL,
  `is_date` date NOT NULL,
  `category` enum('premium','vip','private') NOT NULL DEFAULT 'premium'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_logs`
--

INSERT INTO `voucher_logs` (`id`, `code_name`, `user_id`, `client_name`, `reseller_id`, `reseller_name`, `is_qty`, `is_used`, `date_used`, `is_date`, `category`) VALUES
(11247, 'FBKCM-QRRP6-QXOZW', 19489, 'Melai012', 19487, 'bossrolan', 1, 1, '2022-04-15 23:48:49', '2022-04-15', 'premium'),
(11246, '1AHHS-3JVYS-RDXDJ', 19488, 'v2ray357', 19487, 'bossrolan', 3, 1, '2022-04-15 23:45:42', '2022-04-15', 'premium'),
(11245, '10F1V-MMNFM-UNXVK', 19487, 'bossrolan', 10486, 'adminmhikka10', 3, 1, '2022-04-15 23:44:21', '2022-04-15', 'premium');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anti_ddos`
--
ALTER TABLE `anti_ddos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attention`
--
ALTER TABLE `attention`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bandwidth_logs`
--
ALTER TABLE `bandwidth_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversion_logs`
--
ALTER TABLE `conversion_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credits_logs`
--
ALTER TABLE `credits_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cronjob_banned_ip`
--
ALTER TABLE `cronjob_banned_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cronjob_logs`
--
ALTER TABLE `cronjob_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dns`
--
ALTER TABLE `dns`
  ADD PRIMARY KEY (`dns_id`) USING BTREE;

--
-- Indexes for table `download`
--
ALTER TABLE `download`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `duration`
--
ALTER TABLE `duration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `duration_logs`
--
ALTER TABLE `duration_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `freeze_request`
--
ALTER TABLE `freeze_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `limit_logs`
--
ALTER TABLE `limit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `limit_registration`
--
ALTER TABLE `limit_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts_logs`
--
ALTER TABLE `login_attempts_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_banned_ip`
--
ALTER TABLE `login_banned_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nas`
--
ALTER TABLE `nas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nasname` (`nasname`);

--
-- Indexes for table `radacct`
--
ALTER TABLE `radacct`
  ADD PRIMARY KEY (`radacctid`),
  ADD UNIQUE KEY `acctuniqueid` (`acctuniqueid`),
  ADD KEY `username` (`username`),
  ADD KEY `framedipaddress` (`framedipaddress`),
  ADD KEY `acctsessionid` (`acctsessionid`),
  ADD KEY `acctsessiontime` (`acctsessiontime`),
  ADD KEY `acctstarttime` (`acctstarttime`),
  ADD KEY `acctstoptime` (`acctstoptime`),
  ADD KEY `nasipaddress` (`nasipaddress`);

--
-- Indexes for table `radcheck`
--
ALTER TABLE `radcheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`(32));

--
-- Indexes for table `radgroupcheck`
--
ALTER TABLE `radgroupcheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupname` (`groupname`(32));

--
-- Indexes for table `radgroupreply`
--
ALTER TABLE `radgroupreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupname` (`groupname`(32));

--
-- Indexes for table `radpostauth`
--
ALTER TABLE `radpostauth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radreply`
--
ALTER TABLE `radreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`(32));

--
-- Indexes for table `radusergroup`
--
ALTER TABLE `radusergroup`
  ADD KEY `username` (`username`(32));

--
-- Indexes for table `recovery_logs`
--
ALTER TABLE `recovery_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reloadduration_logs`
--
ALTER TABLE `reloadduration_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_list`
--
ALTER TABLE `server_list`
  ADD PRIMARY KEY (`server_id`);

--
-- Indexes for table `support_message`
--
ALTER TABLE `support_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket`
--
ALTER TABLE `support_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suspension_logs`
--
ALTER TABLE `suspension_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suspension_recovery_logs`
--
ALTER TABLE `suspension_recovery_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `username_logs`
--
ALTER TABLE `username_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_delete`
--
ALTER TABLE `users_delete`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_name` (`code_name`);

--
-- Indexes for table `voucher_logs`
--
ALTER TABLE `voucher_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_name` (`code_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anti_ddos`
--
ALTER TABLE `anti_ddos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attention`
--
ALTER TABLE `attention`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bandwidth_logs`
--
ALTER TABLE `bandwidth_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

--
-- AUTO_INCREMENT for table `conversion_logs`
--
ALTER TABLE `conversion_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credits_logs`
--
ALTER TABLE `credits_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=843;

--
-- AUTO_INCREMENT for table `cronjob_banned_ip`
--
ALTER TABLE `cronjob_banned_ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cronjob_logs`
--
ALTER TABLE `cronjob_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dns`
--
ALTER TABLE `dns`
  MODIFY `dns_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64538;

--
-- AUTO_INCREMENT for table `download`
--
ALTER TABLE `download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `duration`
--
ALTER TABLE `duration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `duration_logs`
--
ALTER TABLE `duration_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=559;

--
-- AUTO_INCREMENT for table `freeze_request`
--
ALTER TABLE `freeze_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `limit_logs`
--
ALTER TABLE `limit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `limit_registration`
--
ALTER TABLE `limit_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_attempts_logs`
--
ALTER TABLE `login_attempts_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2198;

--
-- AUTO_INCREMENT for table `login_banned_ip`
--
ALTER TABLE `login_banned_ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1279;

--
-- AUTO_INCREMENT for table `nas`
--
ALTER TABLE `nas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `radacct`
--
ALTER TABLE `radacct`
  MODIFY `radacctid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radcheck`
--
ALTER TABLE `radcheck`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radgroupcheck`
--
ALTER TABLE `radgroupcheck`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radgroupreply`
--
ALTER TABLE `radgroupreply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radpostauth`
--
ALTER TABLE `radpostauth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radreply`
--
ALTER TABLE `radreply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recovery_logs`
--
ALTER TABLE `recovery_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reloadduration_logs`
--
ALTER TABLE `reloadduration_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2579;

--
-- AUTO_INCREMENT for table `server_list`
--
ALTER TABLE `server_list`
  MODIFY `server_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT for table `support_message`
--
ALTER TABLE `support_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket`
--
ALTER TABLE `support_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suspension_logs`
--
ALTER TABLE `suspension_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `suspension_recovery_logs`
--
ALTER TABLE `suspension_recovery_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `username_logs`
--
ALTER TABLE `username_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3712;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19490;

--
-- AUTO_INCREMENT for table `users_delete`
--
ALTER TABLE `users_delete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9702;

--
-- AUTO_INCREMENT for table `users_profile`
--
ALTER TABLE `users_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19351;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17048;

--
-- AUTO_INCREMENT for table `voucher_logs`
--
ALTER TABLE `voucher_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11248;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
