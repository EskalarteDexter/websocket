-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 09, 2021 at 11:27 AM
-- Server version: 5.7.32-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mediatek`
--

-- --------------------------------------------------------

--
-- Table structure for table `anti_ddos`
--

CREATE TABLE `anti_ddos` (
  `id` int(11) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(128) NOT NULL DEFAULT '0.0.0.0',
  `timestamp` int(11) NOT NULL,
  `logs_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anti_ddos`
--

INSERT INTO `anti_ddos` (`id`, `attempts`, `ip`, `timestamp`, `logs_date`) VALUES
(1, 1, '139.162.4.110', 1594903734, '2020-07-16 06:33:54');

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
  `bandwidth` bigint(50) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  `time_in` datetime NOT NULL,
  `time_out` datetime NOT NULL,
  `status` enum('offline','online') NOT NULL,
  `timestamp` int(11) NOT NULL,
  `category` enum('premium','vip','ph','private','free') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bandwidth_logs`
--

INSERT INTO `bandwidth_logs` (`id`, `server`, `server_ip`, `server_port`, `since_connected`, `username`, `ipaddress`, `bytes_received`, `bytes_sent`, `bandwidth`, `time`, `time_in`, `time_out`, `status`, `timestamp`, `category`) VALUES
(22, '', '188.166.235.240', '35032', 'Wed Sep  9 22:59:08 2020', 'test45', '188.166.235.240:35032', '65029', '199539', 0, '0000-00-00 00:00:00', '2020-09-09 22:59:10', '2020-09-09 22:59:34', 'offline', 2020, 'premium'),
(21, '', '188.166.235.240', '35020', 'Wed Sep  9 22:57:03 2020', 'test45', '188.166.235.240:35020', '204770', '369475', 0, '0000-00-00 00:00:00', '2020-09-09 22:57:05', '2020-09-09 22:59:02', 'offline', 2020, 'premium'),
(20, '', '188.166.235.240', '35006', 'Wed Sep  9 22:56:26 2020', 'test45', '188.166.235.240:35006', '43491', '105397', 0, '0000-00-00 00:00:00', '2020-09-09 22:56:28', '2020-09-09 22:56:36', 'offline', 2020, 'premium'),
(19, '', '188.166.235.240', '34992', 'Wed Sep  9 22:55:33 2020', 'test45', '188.166.235.240:34992', '154544', '612835', 0, '0000-00-00 00:00:00', '2020-09-09 22:55:35', '2020-09-09 22:56:01', 'offline', 2020, 'premium'),
(18, '', '188.166.235.240', '64843', 'Wed Sep  9 21:10:57 2020', 'test45', '110.54.204.125:64843', '62469', '214103', 0, '0000-00-00 00:00:00', '2020-09-09 21:11:00', '2020-09-09 21:11:52', 'offline', 2020, 'premium'),
(17, '', '188.166.235.240', '34106', 'Wed Sep  9 15:10:54 2020', 'test45', '110.54.204.125:34106', '8841', '7548', 0, '0000-00-00 00:00:00', '2020-09-09 15:10:55', '2020-09-09 15:11:19', 'offline', 2020, 'premium'),
(16, '', '188.166.235.240', '18964', 'Wed Sep  9 15:07:13 2020', 'test45', '110.54.204.125:18964', '80025', '236661', 0, '0000-00-00 00:00:00', '2020-09-09 15:07:15', '2020-09-09 15:08:00', 'offline', 2020, 'premium'),
(15, '', '188.166.235.240', '49146', 'Wed Sep  9 15:07:05 2020', 'test45', '110.54.204.125:49146', '5535', '6486', 0, '0000-00-00 00:00:00', '2020-09-09 15:07:07', '2020-09-09 15:07:12', 'offline', 2020, 'premium'),
(14, '', '188.166.235.240', '49060', 'Wed Sep  9 14:38:24 2020', 'test45', '110.54.204.125:49060', '199250', '246461', 0, '0000-00-00 00:00:00', '2020-09-09 14:38:26', '2020-09-09 15:06:59', 'offline', 2020, 'premium'),
(13, '', '188.166.235.240', '64119', 'Wed Sep  9 14:30:34 2020', 'test45', '110.54.204.125:64119', '78302', '81187', 0, '0000-00-00 00:00:00', '2020-09-09 14:30:36', '2020-09-09 14:35:27', 'offline', 2020, 'premium'),
(23, '', '188.166.235.240', '35044', 'Wed Sep  9 23:00:57 2020', 'test45', '188.166.235.240:35044', '8739', '9889', 0, '0000-00-00 00:00:00', '2020-09-09 23:00:59', '2020-09-09 23:01:04', 'offline', 2020, 'premium'),
(24, '', '188.166.235.240', '35058', 'Wed Sep  9 23:02:57 2020', 'test45', '188.166.235.240:35058', '224539', '715433', 0, '0000-00-00 00:00:00', '2020-09-09 23:02:59', '2020-09-09 23:05:32', 'offline', 2020, 'premium'),
(25, '', '188.166.235.240', '45656', 'Wed Sep  9 23:07:15 2020', 'test45', '188.166.235.240:45656', '12495', '18840', 0, '0000-00-00 00:00:00', '2020-09-09 23:07:16', '2020-09-09 23:07:21', 'offline', 2020, 'premium'),
(26, '', '188.166.235.240', '45674', 'Thu Sep 10 00:58:17 2020', 'test45', '188.166.235.240:45674', '463798', '103518', 0, '0000-00-00 00:00:00', '2020-09-10 00:58:21', '2020-09-10 01:00:45', 'offline', 2020, 'premium'),
(27, '', '188.166.235.240', '45742', 'Thu Sep 10 20:13:11 2020', 'test45', '188.166.235.240:45742', '14479', '36294', 0, '0000-00-00 00:00:00', '2020-09-10 20:13:14', '2020-09-10 20:13:26', 'offline', 2020, 'premium'),
(28, '', '138.68.110.195', '38932', 'Sun Sep 13 00:36:49 2020', 'tech5411', '110.54.204.125:38932', '114948', '168119', 0, '0000-00-00 00:00:00', '2020-09-13 00:36:52', '2020-09-13 01:10:12', 'offline', 2020, 'premium'),
(29, '', '138.68.110.195', '23834', 'Sun Sep 13 00:40:38 2020', 'tech5411', '110.54.204.125:23834', '114948', '168119', 0, '0000-00-00 00:00:00', '2020-09-13 00:40:41', '2020-09-13 01:10:12', 'offline', 2020, 'premium'),
(30, '', '138.68.110.195', '54045', 'Sun Sep 13 00:43:26 2020', 'tech5411', '110.54.204.125:54045', '114948', '168119', 0, '0000-00-00 00:00:00', '2020-09-13 00:43:29', '2020-09-13 01:10:12', 'offline', 2020, 'premium'),
(31, '', '138.68.110.195', '23898', 'Sun Sep 13 01:11:21 2020', 'tech5411', '110.54.204.125:23898', '10378', '12573', 0, '0000-00-00 00:00:00', '2020-09-13 01:11:24', '2020-09-13 01:11:41', 'offline', 2020, 'premium'),
(32, '', '138.68.110.195', '39026', 'Sun Sep 13 01:13:47 2020', 'tech5411', '110.54.204.125:39026', '12845', '6683', 0, '0000-00-00 00:00:00', '2020-09-13 01:13:50', '2020-09-13 01:14:05', 'offline', 2020, 'premium'),
(33, '', '138.68.110.195', '8850', 'Sun Sep 13 01:20:32 2020', 'tech5411', '110.54.204.125:8850', '702879', '1667885', 0, '0000-00-00 00:00:00', '2020-09-13 01:20:36', '2020-09-13 01:54:23', 'offline', 2020, 'premium'),
(34, '', '138.68.110.195', '38534', 'Sun Sep 13 01:36:01 2020', 'than', '120.29.91.200:38534', '423313', '932144', 0, '0000-00-00 00:00:00', '2020-09-13 01:36:02', '2020-09-13 01:39:10', 'offline', 2020, 'premium'),
(35, '', '138.68.110.195', '8994', 'Sun Sep 13 01:55:03 2020', 'test93932', '110.54.204.125:8994', '12829', '7344', 0, '0000-00-00 00:00:00', '2020-09-13 01:55:06', '2020-09-13 01:55:42', 'offline', 2020, 'premium'),
(36, '', '138.68.110.195', '38677', 'Sun Sep 13 02:08:05 2020', 'than', '120.29.91.200:38677', '1237', '3831', 0, '0000-00-00 00:00:00', '2020-09-13 02:08:06', '2020-09-13 02:08:08', 'offline', 2020, 'premium'),
(37, '', '', '47360', 'Fri Nov 13 02:08:59 2020', 'admin1', '172.104.40.175:47360', '17847', '28866', 0, '0000-00-00 00:00:00', '2020-11-13 02:09:02', '2020-11-13 02:09:39', 'offline', 2020, 'premium'),
(38, '', '', '47376', 'Fri Nov 13 02:09:42 2020', 'admin1', '172.104.40.175:47376', '15316', '26813', 0, '0000-00-00 00:00:00', '2020-11-13 02:09:44', '2020-11-13 02:10:15', 'offline', 2020, 'premium'),
(39, '', '', '47400', 'Fri Nov 13 02:11:49 2020', 'admin1', '172.104.40.175:47400', '14795', '25250', 0, '0000-00-00 00:00:00', '2020-11-13 02:11:51', '2020-11-13 02:12:19', 'offline', 2020, 'premium'),
(40, '', '', '47738', 'Fri Nov 13 02:22:30 2020', 'admin1', '172.104.40.175:47738', '9504', '13115', 0, '0000-00-00 00:00:00', '2020-11-13 02:22:32', '2020-11-13 02:22:50', 'offline', 2020, 'premium'),
(41, '', '', '47750', 'Fri Nov 13 02:22:53 2020', 'admin1', '172.104.40.175:47750', '38793', '132156', 0, '0000-00-00 00:00:00', '2020-11-13 02:22:55', '2020-11-13 02:24:53', 'offline', 2020, 'premium'),
(42, '', '', '47782', 'Fri Nov 13 02:26:26 2020', 'admin1', '172.104.40.175:47782', '17992538', '429331380', 0, '0000-00-00 00:00:00', '2020-11-13 02:26:28', '2020-11-13 03:31:05', 'offline', 2020, 'premium'),
(43, '', '', '36078', 'Mon Dec 28 04:00:01 2020', 'client', '108.61.178.217:36078', '246266', '623128', 0, '0000-00-00 00:00:00', '2020-12-28 04:00:03', '2020-12-28 04:01:10', 'offline', 2020, 'premium'),
(44, '', '', '36092', 'Mon Dec 28 04:03:10 2020', 'client', '108.61.178.217:36092', '611779', '1253313', 0, '0000-00-00 00:00:00', '2020-12-28 04:03:11', '2020-12-28 04:08:49', 'offline', 2020, 'premium'),
(45, '', '', '46362', 'Mon Dec 28 23:18:46 2020', 'client', '207.148.87.34:46362', '5832', '4754', 0, '0000-00-00 00:00:00', '2020-12-28 23:18:50', '2020-12-28 23:19:00', 'offline', 2020, 'premium'),
(46, '', '', '46606', 'Tue Dec 29 00:05:07 2020', 'client', '207.148.87.34:46606', '11461', '7312', 0, '2016-09-17 15:13:00', '2020-12-29 00:05:13', '2020-12-29 00:05:27', 'offline', 2020, 'premium'),
(47, '', '', '41986', 'Tue Dec 29 00:05:35 2020', 'client', '127.0.0.1:41986', '7563', '18380', 0, '2016-09-17 15:39:00', '2020-12-29 00:05:39', '2020-12-29 00:05:50', 'offline', 2020, 'premium'),
(48, '', '', '46682', 'Tue Dec 29 00:09:09 2020', 'client', '207.148.87.34:46682', '5839', '4258', 0, '2016-09-17 17:56:00', '2020-12-29 00:09:16', '2020-12-29 00:09:23', 'offline', 2020, 'premium'),
(49, '', '', '46726', 'Tue Dec 29 00:18:26 2020', 'client', '207.148.87.34:46726', '11477', '7501', 0, '2016-09-17 23:12:00', '2020-12-29 00:18:32', '2020-12-29 00:18:41', 'offline', 2020, 'premium'),
(50, '', '', '55886', 'Thu Dec 31 22:58:25 2020', 'client', '207.148.87.34:55886', '16045', '13182', 0, '0000-00-00 00:00:00', '2020-12-31 22:58:28', '2020-12-31 22:58:38', 'offline', 2020, 'premium');

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
(922, '12104', 12109, 'resellerlenz1', 3, '2020-10-23 15:12:15', ''),
(923, '1', 12122, 'adminhh', 1000, '2020-10-26 05:41:58', ''),
(924, '1', 12122, 'adminhh', 15000, '2020-10-26 05:42:28', ''),
(925, '1', 12122, 'adminhh', -16500, '2020-10-26 12:44:11', ''),
(926, '1', 12127, 'ufigkgig', -1, '2020-10-30 15:42:45', ''),
(927, '1', 12164, 'lenz-914579', 1, '2020-11-14 20:04:45', ''),
(928, '1', 12164, 'lenz-914579', 1, '2020-11-14 20:10:50', ''),
(929, '1', 12164, 'lenz-914579', 77, '2020-11-17 10:53:59', ''),
(930, '1', 12104, 'lenz541', 15, '2020-11-17 16:12:28', ''),
(931, '1', 12253, 'getz221', 1, '2020-11-18 10:08:35', ''),
(932, '1', 12253, 'getz221', 1, '2020-11-19 16:17:37', ''),
(933, '1', 12253, 'getz221', 1, '2020-11-19 16:18:23', '');

-- --------------------------------------------------------

--
-- Table structure for table `cronjob_banned_ip`
--

CREATE TABLE `cronjob_banned_ip` (
  `id` int(11) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `content` varchar(128) NOT NULL DEFAULT 'Attempting',
  `ip` varchar(128) NOT NULL DEFAULT '0.0.0.0',
  `logs_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cronjob_logs`
--

CREATE TABLE `cronjob_logs` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `ipaddress` varchar(128) NOT NULL DEFAULT '0.0.0.0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dns`
--

CREATE TABLE `dns` (
  `dns_id` int(255) NOT NULL,
  `host_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `domain_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `ip_address` varchar(50) CHARACTER SET latin1 NOT NULL,
  `record_type` varchar(50) CHARACTER SET latin1 NOT NULL,
  `status` int(10) NOT NULL,
  `global_api` varchar(255) CHARACTER SET latin1 NOT NULL,
  `zone_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dns`
--

INSERT INTO `dns` (`dns_id`, `host_name`, `domain_name`, `ip_address`, `record_type`, `status`, `global_api`, `zone_id`, `email`) VALUES
(33069, 'www.viber.com.edgekey.xx', 'octaviavpn.net', '139.162.63.64', 'A', 1, '20f989db3c168115b85e51e03b07b9c7eb85b', '5d4b5f36e83e90745aa0f4323fd04f16', 'harulenz@gmail.com'),
(50355, 'www.viber.com.edgekey.net.003', 'octaviavpn.com', '128.199.187.80', 'A', 1, '20f989db3c168115b85e51e03b07b9c7eb85b', '884fb13c9e199c4fe0f5e40dd71f839b', 'harulenz@gmail.com');

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
  `views` int(11) NOT NULL DEFAULT '0',
  `downloaded` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `download`
--

INSERT INTO `download` (`id`, `download_category`, `download_title`, `download_msg`, `download_network`, `download_device`, `download_file`, `download_date`, `views`, `downloaded`) VALUES
(14, 'public', 'Welcome to Realnet', 'The entire team of Realnet is thrilled to welcome you on board. We hope you&rsquo;ll do some amazing works here!&nbsp;<br /><br />Congratulations on being part of the team! The whole team welcomes you and we look forward to a successful journey with you! Welcome aboard!', 'NOTICE', 'OTHERS', '', '2020-09-20 18:36:48', 0, 0),
(15, 'public', 'How to update RealnetVPN applications', 'RealnetVPN applications get staged automatic updates. It means that some users get their automatic&nbsp;updates earlier than others. The reason for that is to avoid massive issues in case&nbsp;of some failure related to the updates.<br /><br />If you haven&#39;t got an automatic update yet, you will get it within a few days. If you wish to get the latest app version now, you can download it from our&nbsp;News and Updates section. The download page always provides&nbsp;the latest available app versions for all operating systems.', 'NOTICE', 'OTHERS', '', '2020-09-20 18:36:30', 0, 0),
(16, 'public', 'VPN for Netflix: watch Netflix securely', '<p>To ensure&nbsp;secure access to Netflix, you can connect to&nbsp;<strong>any of our&nbsp;<a href=\"https://demo01.firenetvpn.com\" target=\"_blank\">servers</a>&nbsp;listed below</strong>. We recommend using the servers closest to your location for the best connection speed and stability.<br /><br /><strong>Netflix US:</strong><br />You should connect to any of our servers in countries&nbsp;<strong>other than</strong>&nbsp;Canada, Germany, the United Kingdom, France, Italy, Japan, Australia, the Netherlands, India, Brazil, Spain, Portugal, South Korea, and Finland.</p><p><strong>Netflix CA:</strong><br />You should connect to any of our servers in Canada.</p><p><strong>Netflix DE:</strong><br />You should connect to any of our servers in Germany.</p>', 'NOTICE', 'OTHERS', '', '2020-09-20 18:36:10', 0, 0),
(46, 'public', 'Test Update with APK', 'Test Notice and Update with apk file attachment.', 'UPDATE', 'ANDROID', '1605592512.apk', '2020-11-17 13:55:12', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `duration`
--

CREATE TABLE `duration` (
  `id` int(11) NOT NULL,
  `duration_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duration_time` int(50) NOT NULL
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
(39, '-3 Days', -259200);

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
  `request_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reseller_id` int(11) NOT NULL,
  `reseller_name` varchar(128) NOT NULL,
  `reseller_ipaddress` varchar(128) NOT NULL DEFAULT '0.0.0.0',
  `process_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
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
  `subadmin_limit` int(11) NOT NULL DEFAULT '0',
  `reseller_limit` int(11) NOT NULL DEFAULT '0',
  `subreseller_limit` int(11) NOT NULL DEFAULT '0',
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
  `attempts` int(11) DEFAULT '0',
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
(231, '110.54.169.111', 'lenz', '2020-11-17 23:32:42'),
(230, '110.54.169.111', 'admin', '2020-11-17 06:05:50'),
(229, '110.54.169.111', 'admin', '2020-11-17 03:14:06'),
(228, '103.84.173.28', 'admin', '2020-11-09 12:01:37'),
(227, '110.54.205.179', 'admin', '2020-11-09 09:41:49'),
(226, '172.105.125.125', 'ovpn', '2020-11-09 00:21:23'),
(225, '110.54.185.211', 'lenz541', '2020-10-25 23:09:37'),
(224, '110.54.185.211', 'admin', '2020-10-25 20:33:28'),
(223, '110.54.185.211', 'admin', '2020-10-25 20:33:20'),
(222, '110.54.185.211', 'lenz541', '2020-10-25 10:30:13'),
(221, '110.54.185.211', 'admin', '2020-10-25 07:58:44'),
(220, '110.54.227.154', 'lenz541', '2020-10-23 02:58:20'),
(219, '110.54.227.154', 'lenz541', '2020-10-22 13:59:03'),
(218, '110.54.227.154', 'admin', '2020-10-22 13:29:32'),
(217, '110.54.216.45', 'lenz541', '2020-10-22 01:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `login_banned_ip`
--

CREATE TABLE `login_banned_ip` (
  `id` int(11) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(128) NOT NULL DEFAULT '0.0.0.0',
  `logs_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_banned_ip`
--

INSERT INTO `login_banned_ip` (`id`, `attempts`, `ip`, `logs_date`) VALUES
(142, 1, '103.84.173.28, 172.69.135.108', '2020-11-10 06:01:37'),
(141, 1, '110.54.205.179, 162.158.118.56', '2020-11-09 15:41:49'),
(140, 1, '172.105.125.125, 103.22.201.158', '2020-11-09 06:21:23'),
(139, 2, '110.54.185.211, 162.158.119.87', '2020-10-26 12:33:28'),
(138, 1, '110.54.185.211, 103.22.201.138', '2020-10-25 14:30:13'),
(137, 1, '110.54.185.211, 162.158.118.216', '2020-10-25 11:58:44'),
(136, 1, '110.54.227.154, 162.158.118.244', '2020-10-23 06:58:20'),
(135, 1, '110.54.227.154, 162.158.118.40', '2020-10-23 05:29:32'),
(134, 1, '110.54.216.45, 162.158.118.198', '2020-10-22 05:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `nas`
--

CREATE TABLE `nas` (
  `id` int(10) NOT NULL,
  `nasname` varchar(128) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT 'other',
  `ports` int(5) DEFAULT NULL,
  `secret` varchar(60) NOT NULL DEFAULT 'secret',
  `server` varchar(64) DEFAULT NULL,
  `community` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT 'RADIUS Client'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nas`
--

INSERT INTO `nas` (`id`, `nasname`, `shortname`, `type`, `ports`, `secret`, `server`, `community`, `description`) VALUES
(1, '10.8.8.0/24', 'SoftEther Authentication', 'other', 5555, 'pisovpn-123', 'us2.pisovpn.com', '', 'RADIUS Client');

-- --------------------------------------------------------

--
-- Table structure for table `radacct`
--

CREATE TABLE `radacct` (
  `radacctid` bigint(21) NOT NULL,
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
  `acctsessiontime` int(12) UNSIGNED DEFAULT NULL,
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
  `acctstartdelay` int(12) UNSIGNED DEFAULT NULL,
  `acctstopdelay` int(12) UNSIGNED DEFAULT NULL,
  `xascendsessionsvrkey` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radcheck`
--

CREATE TABLE `radcheck` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `id` int(11) UNSIGNED NOT NULL,
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
  `id` int(11) UNSIGNED NOT NULL,
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
  `authdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radreply`
--

CREATE TABLE `radreply` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `priority` int(11) NOT NULL DEFAULT '1'
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
  `server_id` int(255) NOT NULL,
  `server_name` varchar(255) NOT NULL,
  `server_ip` varchar(20) NOT NULL,
  `server_user` varchar(50) NOT NULL,
  `server_pass` varchar(255) NOT NULL,
  `server_category` enum('premium','vip','free','private') NOT NULL DEFAULT 'premium',
  `server_port` int(11) NOT NULL DEFAULT '80',
  `server_folder` varchar(255) NOT NULL,
  `server_tcp` varchar(15) NOT NULL DEFAULT 'tcp1',
  `server_parser` varchar(255) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `server_list`
--

INSERT INTO `server_list` (`server_id`, `server_name`, `server_ip`, `server_user`, `server_pass`, `server_category`, `server_port`, `server_folder`, `server_tcp`, `server_parser`, `status`) VALUES
(333, 'Germany', '108.61.178.217', '', '', 'premium', 80, '', 'tcp1', 'http://108.61.178.217:80', 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_options`
--

CREATE TABLE `site_options` (
  `email_validation` tinyint(1) NOT NULL DEFAULT '1'
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
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_freeze` tinyint(1) NOT NULL DEFAULT '1',
  `last_freeze_date` datetime NOT NULL,
  `is_validated` tinyint(1) NOT NULL DEFAULT '0',
  `is_connected` int(1) NOT NULL DEFAULT '0',
  `is_offense` int(11) NOT NULL DEFAULT '0',
  `is_ban` int(11) NOT NULL DEFAULT '1',
  `suspended_date` datetime NOT NULL,
  `duration` bigint(50) NOT NULL DEFAULT '18000',
  `vip_duration` bigint(50) NOT NULL,
  `is_vip` int(11) NOT NULL DEFAULT '0',
  `private_duration` bigint(50) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `private_slot` int(11) NOT NULL DEFAULT '0',
  `private_control` tinyint(1) NOT NULL DEFAULT '0',
  `credits` int(20) NOT NULL DEFAULT '0',
  `upline` int(10) NOT NULL DEFAULT '1',
  `login_status` enum('offline','online') NOT NULL DEFAULT 'offline',
  `last_active_time` datetime NOT NULL,
  `user_level` enum('normal','subreseller','reseller','administrator','subadmin','superadmin','bulk') NOT NULL,
  `status` enum('live','freeze','suspended','banned','vacation') NOT NULL DEFAULT 'live',
  `bandwidth` int(11) NOT NULL DEFAULT '0',
  `bandwidth_premium` int(11) NOT NULL,
  `bandwidth_vip` int(11) NOT NULL,
  `bandwidth_ph` int(11) NOT NULL,
  `bandwidth_private` int(11) NOT NULL,
  `bandwidth_free` int(11) NOT NULL,
  `device_connected` int(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `password`, `code`, `ss_id`, `ssl_id`, `user_name`, `user_pass`, `attribute`, `op`, `auth_vpn`, `user_email`, `full_name`, `regdate`, `ipaddress`, `lastlogin`, `timestamp`, `reset_code`, `is_groupname`, `is_active`, `is_freeze`, `is_passchange`, `freeze_status`, `last_freeze_date`, `is_validated`, `is_connected`, `is_offense`, `is_ban`, `suspended_date`, `duration`, `vip_duration`, `is_vip`, `private_duration`, `is_private`, `role_duration`, `private_slot`, `private_control`, `credits`, `upline`, `login_status`, `last_active_time`, `user_level`, `status`, `bandwidth`, `bandwidth_premium`, `bandwidth_vip`, `bandwidth_ph`, `bandwidth_private`, `bandwidth_free`, `device_connected`, `device_id`, `device_model`) VALUES
(1, 'hjhj', '405154310', '45758', 'any', 'admin', 'jr205qishrKbpprRtbl42rih6oLJz4rH17CNzba4YYM=', 'MD5-Password', ':=', '9d14ae71476aa09be3baa307555d53a2', 'admin@mediatek.com', 'Dexter Eskalarte', '2018-07-09 10:59:14', '120.29.77.213', '2022-02-07 17:34:15', 0, '0', 'superadmin', 1, 0, 0, 3, '2021-10-12 00:00:02', 1, 0, 0, 0, '0000-00-00 00:00:00', 363, 0, 0, 2592000, 0, 99999, 0, 0, 1000, 1, 'online', '2022-02-07 17:34:15', 'superadmin', 'live', 0, 0, 0, 0, 0, 0, 0, 'DEVICEIDHER', 'DEVICEMODELHERE');
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
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_freeze` tinyint(1) NOT NULL DEFAULT '1',
  `last_freeze_date` date NOT NULL,
  `is_validated` tinyint(1) NOT NULL DEFAULT '0',
  `is_connected` int(1) NOT NULL DEFAULT '0',
  `is_offense` int(11) NOT NULL DEFAULT '0',
  `is_ban` int(11) NOT NULL DEFAULT '1',
  `suspended_date` datetime NOT NULL,
  `duration` bigint(50) NOT NULL DEFAULT '7200',
  `vip_duration` bigint(50) NOT NULL,
  `is_vip` int(11) NOT NULL DEFAULT '0',
  `private_duration` bigint(50) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `private_slot` int(11) NOT NULL DEFAULT '0',
  `private_control` tinyint(1) NOT NULL DEFAULT '0',
  `credits` int(20) NOT NULL DEFAULT '0',
  `upline` int(10) NOT NULL DEFAULT '1',
  `login_status` enum('offline','online') NOT NULL DEFAULT 'offline',
  `last_active_time` datetime NOT NULL,
  `user_level` enum('normal','subreseller','reseller','moderator','subadmin','superadmin') NOT NULL,
  `status` enum('live','freeze','suspended','banned','vacation') NOT NULL DEFAULT 'live',
  `bandwidth` int(11) NOT NULL DEFAULT '0',
  `bandwidth_premium` int(11) NOT NULL,
  `bandwidth_vip` int(11) NOT NULL,
  `bandwidth_ph` int(11) NOT NULL,
  `bandwidth_private` int(11) NOT NULL,
  `bandwidth_free` int(11) NOT NULL,
  `device_connected` int(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

CREATE TABLE `users_profile` (
  `id` int(5) NOT NULL,
  `profile_id` int(5) NOT NULL,
  `profile_fb` varchar(250) NOT NULL,
  `profile_address` varchar(255) NOT NULL,
  `profile_number` varchar(13) NOT NULL DEFAULT '0',
  `profile_image` varchar(255) NOT NULL,
  `bdo` int(1) NOT NULL DEFAULT '0',
  `bitcoin` int(1) NOT NULL DEFAULT '0',
  `bpi` int(1) NOT NULL DEFAULT '0',
  `cebuana` int(1) NOT NULL DEFAULT '0',
  `gcash` int(1) NOT NULL DEFAULT '0',
  `lbc` int(1) NOT NULL DEFAULT '0',
  `lbp` int(1) NOT NULL DEFAULT '0',
  `meetup` int(1) NOT NULL DEFAULT '0',
  `mlkwartapadala` int(1) NOT NULL DEFAULT '0',
  `palawanexpress` int(1) NOT NULL DEFAULT '0',
  `paypal` int(1) NOT NULL DEFAULT '0',
  `prepaidload` int(1) NOT NULL DEFAULT '0',
  `rcbc` int(1) NOT NULL DEFAULT '0',
  `rdperapadala` int(1) NOT NULL DEFAULT '0',
  `smartmoney` int(1) NOT NULL DEFAULT '0',
  `unionbank` int(1) NOT NULL DEFAULT '0',
  `westernunion` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_profile`
--

INSERT INTO `users_profile` (`id`, `profile_id`, `profile_fb`, `profile_address`, `profile_number`, `profile_image`, `bdo`, `bitcoin`, `bpi`, `cebuana`, `gcash`, `lbc`, `lbp`, `meetup`, `mlkwartapadala`, `palawanexpress`, `paypal`, `prepaidload`, `rcbc`, `rdperapadala`, `smartmoney`, `unionbank`, `westernunion`) VALUES
(1, 1, '', '115 Firenet Road, Taft Avenue', '639212345678', '1604992639.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12030, 12257, '', '', '0', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12029, 12256, '', '', '0', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `user_id` int(100) NOT NULL,
  `client_name` varchar(755) NOT NULL,
  `reseller_id` int(100) NOT NULL,
  `reseller_name` varchar(64) NOT NULL,
  `is_qty` int(11) NOT NULL DEFAULT '1',
  `is_used` int(1) NOT NULL,
  `duration` bigint(50) NOT NULL DEFAULT '0',
  `gen_date` datetime NOT NULL,
  `date_used` datetime NOT NULL,
  `category` enum('premium','vip','private') NOT NULL DEFAULT 'premium',
  `permission` tinyint(1) NOT NULL DEFAULT '0',
  `ipaddress` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `code_name`, `user_id`, `client_name`, `reseller_id`, `reseller_name`, `is_qty`, `is_used`, `duration`, `gen_date`, `date_used`, `category`, `permission`, `ipaddress`) VALUES
(6019, 'QNLS5-WDNCP-BU0WX', 12251, 'rnet848934', 1, 'admin', 1, 1, 2592000, '2020-11-19 16:17:18', '2020-11-19 16:17:18', 'premium', 0, ''),
(6018, 'BPFY6-AP1HM-DWSKO', 12254, 'lenz543', 1, 'admin', 1, 1, 2592000, '2020-11-19 16:16:24', '2020-11-19 16:16:24', 'premium', 0, ''),
(6017, 'TV5XV-GODPX-6IS4C', 12254, 'lenz543', 1, 'admin', 1, 1, 2592000, '2020-11-19 16:15:49', '2020-11-19 16:15:49', 'premium', 0, ''),
(6016, 'XXQVX-FI1T5-FRJXE', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 16:15:11', '2020-11-19 16:15:11', 'premium', 0, ''),
(6015, 'TXVNY-QHMSV-GE5UG', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 16:14:47', '2020-11-19 16:14:47', 'premium', 0, ''),
(6014, 'NKJ4T-IBRLB-GZL4N', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 16:10:26', '2020-11-19 16:10:26', 'premium', 0, ''),
(6013, 'YHXEA-0WWLU-LVKRV', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 16:10:12', '2020-11-19 16:10:12', 'premium', 0, ''),
(6012, 'ERGZH-N0XUK-JK6VV', 12254, 'lenz543', 1, 'admin', 1, 1, 2592000, '2020-11-19 16:10:00', '2020-11-19 16:10:00', 'premium', 0, ''),
(6011, 'AE010-0NHSE-DYFJK', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 02:04:47', '2020-11-19 02:04:47', 'premium', 0, ''),
(6010, 'VSDIL-H3Q0G-HE5XL', 12178, 'Testpin1', 1, 'admin', 1, 1, 2592000, '2020-11-19 02:02:50', '2020-11-19 02:02:50', 'premium', 0, ''),
(6009, '4PHZG-MBZ1Q-KKDGX', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 02:00:07', '2020-11-19 02:00:07', 'premium', 0, ''),
(6008, 'VJH32-B43LG-25JF1', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:59:08', '2020-11-19 01:59:08', 'premium', 0, ''),
(6007, 'I2GH1-MUNBB-KJTME', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:57:01', '2020-11-19 01:57:01', 'premium', 0, ''),
(6006, 'FA24C-WQCFU-CWJHO', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:56:11', '2020-11-19 01:56:11', 'premium', 0, ''),
(6005, 'F3XKV-CBKHA-YRVAY', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:54:25', '2020-11-19 01:54:25', 'premium', 0, ''),
(6004, 'AVDHB-A00R2-OIR5N', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:53:47', '2020-11-19 01:53:47', 'premium', 0, ''),
(6003, 'YD1JI-YSF5V-2QKFG', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:53:40', '2020-11-19 01:53:40', 'premium', 0, ''),
(6002, '0GT4N-65URB-NDE2D', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:53:11', '2020-11-19 01:53:11', 'premium', 0, ''),
(6001, 'P06VT-V0UWI-31K4P', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:52:45', '2020-11-19 01:52:45', 'premium', 0, ''),
(6000, 'O6I4J-VZUIF-ZKXZN', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:50:49', '2020-11-19 01:50:49', 'premium', 0, ''),
(5999, 'KIA55-UNBNU-WDEMP', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:48:29', '2020-11-19 01:48:29', 'premium', 0, ''),
(5998, 'YMHVG-EWXEK-PN3BX', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:47:54', '2020-11-19 01:47:54', 'premium', 0, ''),
(5997, 'BZFHN-YLWBD-3WJCL', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:47:31', '2020-11-19 01:47:31', 'premium', 0, ''),
(5996, 'KKXL5-C31FH-5SULI', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:46:55', '2020-11-19 01:46:55', 'premium', 0, ''),
(5995, 'PI201-F4Y1B-EZ0M1', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:41:21', '2020-11-19 01:41:21', 'premium', 0, ''),
(5994, '55VME-WVDSW-MIRMI', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:39:15', '2020-11-19 01:39:15', 'premium', 0, ''),
(5993, 'MBNIY-ZMGIJ-ZA3LU', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:37:08', '2020-11-19 01:37:08', 'premium', 0, ''),
(5992, 'CZ5J6-BHC6G-MHVML', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:36:10', '2020-11-19 01:36:10', 'premium', 0, ''),
(5991, 'RKXZM-2IVMX-3K3K6', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:34:54', '2020-11-19 01:34:54', 'premium', 0, ''),
(5990, 'LT3TW-E3WJU-QQCOJ', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:33:52', '2020-11-19 01:33:52', 'premium', 0, ''),
(5989, 'SSZZH-GK5TP-FNB3X', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:31:49', '2020-11-19 01:31:49', 'premium', 0, ''),
(5988, 'EYL0H-4MFJU-PNBTJ', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-19 01:30:40', '2020-11-19 01:30:40', 'premium', 0, ''),
(5987, '3UAHN-PO4XY-W4RV5', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-18 23:47:53', '2020-11-18 23:47:53', 'premium', 0, ''),
(5986, 'HLY5V-H0P43-M4GBZ', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-18 23:46:25', '2020-11-18 23:46:25', 'premium', 0, ''),
(5985, 'NY21V-1HLKC-DTIEN', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-18 23:44:38', '2020-11-18 23:44:38', 'premium', 0, ''),
(5984, 'NNNAW-65RWM-LLNBC', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-18 23:44:08', '2020-11-18 23:44:08', 'premium', 0, ''),
(5983, 'Q3VJA-WA200-56ZYZ', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-18 23:41:29', '2020-11-18 23:41:29', 'premium', 0, ''),
(5982, 'MMK05-TYSXZ-NDODF', 0, 'lenz543', 12104, 'lenz541', 1, 1, 1, '2020-11-17 23:54:50', '2020-11-17 23:54:50', 'premium', 0, ''),
(5981, 'UQHT2-JGN6B-M4YAZ', 0, 'getz221', 12104, 'lenz541', 3, 1, 3, '2020-11-17 19:23:22', '2020-11-17 19:23:22', 'premium', 0, ''),
(5980, 'LRMRH-BP1EX-2JXWG', 0, 'getz55', 12104, 'lenz541', 5, 1, 5, '2020-11-17 19:17:27', '2020-11-17 19:17:27', 'premium', 0, ''),
(5979, 'UZCGU-RL0IH-SWART', 12179, 'test12', 1, 'admin', 1, 1, 2592000, '2020-11-17 17:50:12', '2020-11-17 17:50:12', 'premium', 0, ''),
(5978, 'HDQO1-FHHS1-E3UKX', 0, 'Bulk Clients', 12104, 'lenz541', 5, 5, 0, '2020-11-17 16:13:51', '2020-11-17 16:13:51', 'premium', 0, ''),
(5977, 'UV6TE-4KULF-JX1AP', 4, 'lenz56565', 12104, 'lenz541', 1, 1, 1, '2020-11-17 16:13:17', '2020-11-17 16:13:17', 'premium', 0, ''),
(5976, 'BN2X0-M5OGN-UM61E', 12145, 'lenz-751552', 1, 'admin', 1, 1, 2592000, '2020-11-15 18:44:32', '2020-11-15 18:44:32', 'premium', 0, ''),
(5975, 'VZJRS-XUJOQ-PPFPK', 12148, 'lenz-70116', 1, 'admin', 1, 1, 2592000, '2020-11-15 18:44:20', '2020-11-15 18:44:20', 'premium', 0, ''),
(5974, 'DIG02-1LHYZ-OWK32', 1, 'Goxgjxjgx', 12109, 'resellerlenz1', 1, 1, 1, '2020-11-13 06:12:08', '2020-11-13 06:12:08', 'premium', 0, ''),
(5973, 'GMV0C-WW0CZ-FXQM6', 12161, 'testg2', 1, 'admin', 1, 1, 2592000, '2020-11-10 17:46:02', '2020-11-10 17:46:02', 'premium', 0, ''),
(5972, 'IJBWJ-I3K4M-G2ZKO', 12161, 'testg2', 1, 'admin', 1, 1, 2592000, '2020-11-10 17:44:42', '2020-11-10 17:44:42', 'premium', 0, ''),
(5971, 'K3YVO-ZSDOV-V3Z6R', 12161, 'testg2', 1, 'admin', 1, 1, 2592000, '2020-11-10 17:43:04', '2020-11-10 17:43:04', 'premium', 0, ''),
(5970, 'FIRD2-WZUAL-MKAYX', 12161, 'testg2', 1, 'admin', 1, 1, 2592000, '2020-11-10 17:42:15', '2020-11-10 17:42:15', 'premium', 0, ''),
(5969, 'WCODN-F6Z6L-40XGW', 12161, 'testg2', 1, 'admin', 1, 1, 2592000, '2020-11-10 17:41:19', '2020-11-10 17:41:19', 'premium', 0, ''),
(5968, 'PAMWX-PDTRD-XJXY4', 12106, 'bulk324029', 1, 'admin', 1, 1, 2592000, '2020-10-26 12:46:38', '2020-10-26 12:46:38', 'premium', 0, ''),
(5967, 'RNTMG-Q31UI-0YZVL', 0, 'lenz65', 12104, 'lenz541', 1, 1, 1, '2020-10-23 17:06:17', '2020-10-23 17:06:17', 'premium', 0, ''),
(5964, '4RXSO-6E5QH-JUZBK', 600000, 'Bulk Clients', 12104, 'lenz541', 2, 2, 0, '2020-10-23 13:17:35', '2020-10-23 13:17:35', 'premium', 0, ''),
(5965, 'MQP14-DHXVK-E5TKP', 0, 'Bulk Clients', 12104, 'lenz541', 1, 1, 0, '2020-10-23 15:01:00', '2020-10-23 15:01:00', 'premium', 0, ''),
(5966, 'JPE40-BNGQ4-EDZR1', 0, 'testress', 12104, 'lenz541', 5, 1, 5, '2020-10-23 17:04:47', '2020-10-23 17:04:47', 'premium', 0, ''),
(5963, 'ZDVE3-0XNEH-CH3FI', 0, 'Bulk Clients', 12104, 'lenz541', 2, 2, 0, '2020-10-23 11:20:28', '2020-10-23 11:20:28', 'premium', 0, ''),
(5962, 'LQAWU-N35D4-EEDUD', 0, 'inactivetest', 12104, 'lenz541', 1, 1, 1, '2020-10-22 11:57:57', '2020-10-22 11:57:57', 'premium', 0, ''),
(5961, '3AZQT-1SH4N-JLA3C', 1, 'Bulk Clients', 12104, 'lenz541', 2, 2, 0, '2020-10-22 11:57:32', '2020-10-22 11:57:32', 'premium', 0, ''),
(5960, 'FV54Z-JA0HN-S6STG', 0, 'lenztest1', 12104, 'lenz541', 1, 1, 1, '2020-10-22 11:48:43', '2020-10-22 11:48:43', 'premium', 0, ''),
(6020, 'NSPXW-3LQ2I-TKOTJ', 12256, 'client', 1, 'ProxyVPNadmin', 1, 1, 2592000, '2020-12-27 20:12:18', '2020-12-27 20:12:18', 'premium', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_logs`
--

CREATE TABLE `voucher_logs` (
  `id` int(11) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `user_id` int(100) NOT NULL,
  `client_name` varchar(755) NOT NULL,
  `reseller_id` int(100) NOT NULL,
  `reseller_name` varchar(64) NOT NULL,
  `is_qty` int(11) NOT NULL DEFAULT '1',
  `is_used` int(1) NOT NULL,
  `date_used` datetime NOT NULL,
  `is_date` date NOT NULL,
  `category` enum('premium','vip','private') NOT NULL DEFAULT 'premium'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_logs`
--

INSERT INTO `voucher_logs` (`id`, `code_name`, `user_id`, `client_name`, `reseller_id`, `reseller_name`, `is_qty`, `is_used`, `date_used`, `is_date`, `category`) VALUES
(179, 'BN2X0-M5OGN-UM61E', 12145, 'lenz-751552', 1, 'admin', 1, 1, '2020-11-15 18:44:32', '2020-11-15', 'premium'),
(178, 'VZJRS-XUJOQ-PPFPK', 12148, 'lenz-70116', 1, 'admin', 1, 1, '2020-11-15 18:44:20', '2020-11-15', 'premium'),
(177, 'DIG02-1LHYZ-OWK32', 1, 'Goxgjxjgx', 12109, 'resellerlenz1', 1, 1, '2020-11-13 06:12:08', '2020-11-13', 'premium'),
(176, 'GMV0C-WW0CZ-FXQM6', 12161, 'testg2', 1, 'admin', 1, 1, '2020-11-10 17:46:02', '2020-11-10', 'premium'),
(175, 'IJBWJ-I3K4M-G2ZKO', 12161, 'testg2', 1, 'admin', 1, 1, '2020-11-10 17:44:42', '2020-11-10', 'premium'),
(174, 'K3YVO-ZSDOV-V3Z6R', 12161, 'testg2', 1, 'admin', 1, 1, '2020-11-10 17:43:04', '2020-11-10', 'premium'),
(173, 'FIRD2-WZUAL-MKAYX', 12161, 'testg2', 1, 'admin', 1, 1, '2020-11-10 17:42:15', '2020-11-10', 'premium'),
(172, 'WCODN-F6Z6L-40XGW', 12161, 'testg2', 1, 'admin', 1, 1, '2020-11-10 17:41:19', '2020-11-10', 'premium'),
(171, 'PAMWX-PDTRD-XJXY4', 12106, 'bulk324029', 1, 'admin', 1, 1, '2020-10-26 12:46:38', '2020-10-26', 'premium'),
(170, 'RNTMG-Q31UI-0YZVL', 0, 'lenz65', 12104, 'lenz541', 1, 1, '2020-10-23 17:06:17', '2020-10-23', 'premium'),
(169, 'JPE40-BNGQ4-EDZR1', 0, 'testress', 12104, 'lenz541', 5, 1, '2020-10-23 17:04:47', '2020-10-23', 'premium'),
(168, 'MQP14-DHXVK-E5TKP', 0, 'Bulk Clients', 12104, 'lenz541', 1, 1, '2020-10-23 15:01:00', '2020-10-23', 'premium'),
(167, '4RXSO-6E5QH-JUZBK', 600000, 'Bulk Clients', 12104, 'lenz541', 2, 2, '2020-10-23 13:17:35', '2020-10-23', 'premium'),
(166, 'ZDVE3-0XNEH-CH3FI', 0, 'Bulk Clients', 12104, 'lenz541', 2, 2, '2020-10-23 11:20:28', '2020-10-23', 'premium'),
(165, 'LQAWU-N35D4-EEDUD', 0, 'inactivetest', 12104, 'lenz541', 1, 1, '2020-10-22 11:57:57', '2020-10-22', 'premium'),
(164, '3AZQT-1SH4N-JLA3C', 1, 'Bulk Clients', 12104, 'lenz541', 2, 2, '2020-10-22 11:57:32', '2020-10-22', 'premium'),
(163, 'FV54Z-JA0HN-S6STG', 0, 'lenztest1', 12104, 'lenz541', 1, 1, '2020-10-22 11:48:43', '2020-10-22', 'premium'),
(180, 'UV6TE-4KULF-JX1AP', 4, 'lenz56565', 12104, 'lenz541', 1, 1, '2020-11-17 16:13:17', '2020-11-17', 'premium'),
(181, 'HDQO1-FHHS1-E3UKX', 0, 'Bulk Clients', 12104, 'lenz541', 5, 5, '2020-11-17 16:13:51', '2020-11-17', 'premium'),
(182, 'UZCGU-RL0IH-SWART', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-17 17:50:12', '2020-11-17', 'premium'),
(183, 'LRMRH-BP1EX-2JXWG', 0, 'getz55', 12104, 'lenz541', 5, 1, '2020-11-17 19:17:27', '2020-11-17', 'premium'),
(184, 'UQHT2-JGN6B-M4YAZ', 0, 'getz221', 12104, 'lenz541', 3, 1, '2020-11-17 19:23:22', '2020-11-17', 'premium'),
(185, 'MMK05-TYSXZ-NDODF', 0, 'lenz543', 12104, 'lenz541', 1, 1, '2020-11-17 23:54:50', '2020-11-17', 'premium'),
(186, 'Q3VJA-WA200-56ZYZ', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-18 23:41:29', '2020-11-18', 'premium'),
(187, 'NNNAW-65RWM-LLNBC', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-18 23:44:08', '2020-11-18', 'premium'),
(188, 'NY21V-1HLKC-DTIEN', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-18 23:44:38', '2020-11-18', 'premium'),
(189, 'HLY5V-H0P43-M4GBZ', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-18 23:46:25', '2020-11-18', 'premium'),
(190, '3UAHN-PO4XY-W4RV5', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-18 23:47:53', '2020-11-18', 'premium'),
(191, 'EYL0H-4MFJU-PNBTJ', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:30:40', '2020-11-19', 'premium'),
(192, 'SSZZH-GK5TP-FNB3X', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:31:49', '2020-11-19', 'premium'),
(193, 'LT3TW-E3WJU-QQCOJ', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:33:52', '2020-11-19', 'premium'),
(194, 'RKXZM-2IVMX-3K3K6', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:34:54', '2020-11-19', 'premium'),
(195, 'CZ5J6-BHC6G-MHVML', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:36:10', '2020-11-19', 'premium'),
(196, 'MBNIY-ZMGIJ-ZA3LU', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:37:08', '2020-11-19', 'premium'),
(197, '55VME-WVDSW-MIRMI', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:39:15', '2020-11-19', 'premium'),
(198, 'PI201-F4Y1B-EZ0M1', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:41:21', '2020-11-19', 'premium'),
(199, 'KKXL5-C31FH-5SULI', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:46:55', '2020-11-19', 'premium'),
(200, 'BZFHN-YLWBD-3WJCL', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:47:31', '2020-11-19', 'premium'),
(201, 'YMHVG-EWXEK-PN3BX', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:47:54', '2020-11-19', 'premium'),
(202, 'KIA55-UNBNU-WDEMP', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:48:29', '2020-11-19', 'premium'),
(203, 'O6I4J-VZUIF-ZKXZN', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:50:49', '2020-11-19', 'premium'),
(204, 'P06VT-V0UWI-31K4P', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:52:45', '2020-11-19', 'premium'),
(205, '0GT4N-65URB-NDE2D', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:53:11', '2020-11-19', 'premium'),
(206, 'YD1JI-YSF5V-2QKFG', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:53:40', '2020-11-19', 'premium'),
(207, 'AVDHB-A00R2-OIR5N', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:53:47', '2020-11-19', 'premium'),
(208, 'F3XKV-CBKHA-YRVAY', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:54:25', '2020-11-19', 'premium'),
(209, 'FA24C-WQCFU-CWJHO', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:56:11', '2020-11-19', 'premium'),
(210, 'I2GH1-MUNBB-KJTME', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:57:01', '2020-11-19', 'premium'),
(211, 'VJH32-B43LG-25JF1', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 01:59:08', '2020-11-19', 'premium'),
(212, '4PHZG-MBZ1Q-KKDGX', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 02:00:07', '2020-11-19', 'premium'),
(213, 'VSDIL-H3Q0G-HE5XL', 12178, 'Testpin1', 1, 'admin', 1, 1, '2020-11-19 02:02:50', '2020-11-19', 'premium'),
(214, 'AE010-0NHSE-DYFJK', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 02:04:47', '2020-11-19', 'premium'),
(215, 'ERGZH-N0XUK-JK6VV', 12254, 'lenz543', 1, 'admin', 1, 1, '2020-11-19 16:10:00', '2020-11-19', 'premium'),
(216, 'YHXEA-0WWLU-LVKRV', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 16:10:12', '2020-11-19', 'premium'),
(217, 'NKJ4T-IBRLB-GZL4N', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 16:10:26', '2020-11-19', 'premium'),
(218, 'TXVNY-QHMSV-GE5UG', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 16:14:47', '2020-11-19', 'premium'),
(219, 'XXQVX-FI1T5-FRJXE', 12179, 'test12', 1, 'admin', 1, 1, '2020-11-19 16:15:11', '2020-11-19', 'premium'),
(220, 'TV5XV-GODPX-6IS4C', 12254, 'lenz543', 1, 'admin', 1, 1, '2020-11-19 16:15:49', '2020-11-19', 'premium'),
(221, 'BPFY6-AP1HM-DWSKO', 12254, 'lenz543', 1, 'admin', 1, 1, '2020-11-19 16:16:24', '2020-11-19', 'premium'),
(222, 'QNLS5-WDNCP-BU0WX', 12251, 'rnet848934', 1, 'admin', 1, 1, '2020-11-19 16:17:18', '2020-11-19', 'premium'),
(223, 'NSPXW-3LQ2I-TKOTJ', 12256, 'client', 1, 'ProxyVPNadmin', 1, 1, '2020-12-27 20:12:18', '2020-12-27', 'premium');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `conversion_logs`
--
ALTER TABLE `conversion_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credits_logs`
--
ALTER TABLE `credits_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=934;

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
  MODIFY `dns_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64538;

--
-- AUTO_INCREMENT for table `download`
--
ALTER TABLE `download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `duration`
--
ALTER TABLE `duration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `duration_logs`
--
ALTER TABLE `duration_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeze_request`
--
ALTER TABLE `freeze_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT for table `login_banned_ip`
--
ALTER TABLE `login_banned_ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `nas`
--
ALTER TABLE `nas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `radacct`
--
ALTER TABLE `radacct`
  MODIFY `radacctid` bigint(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radcheck`
--
ALTER TABLE `radcheck`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radgroupcheck`
--
ALTER TABLE `radgroupcheck`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radgroupreply`
--
ALTER TABLE `radgroupreply`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radpostauth`
--
ALTER TABLE `radpostauth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radreply`
--
ALTER TABLE `radreply`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recovery_logs`
--
ALTER TABLE `recovery_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reloadduration_logs`
--
ALTER TABLE `reloadduration_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_list`
--
ALTER TABLE `server_list`
  MODIFY `server_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suspension_recovery_logs`
--
ALTER TABLE `suspension_recovery_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `username_logs`
--
ALTER TABLE `username_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1058;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12258;

--
-- AUTO_INCREMENT for table `users_delete`
--
ALTER TABLE `users_delete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1151;

--
-- AUTO_INCREMENT for table `users_profile`
--
ALTER TABLE `users_profile`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12031;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6021;

--
-- AUTO_INCREMENT for table `voucher_logs`
--
ALTER TABLE `voucher_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
