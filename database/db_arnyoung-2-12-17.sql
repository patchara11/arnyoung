-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 02, 2017 at 09:03 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_arnyoung`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`) VALUES
(1, 'Action'),
(2, 'Drama'),
(3, 'Horror');

-- --------------------------------------------------------

--
-- Table structure for table `like_this`
--

CREATE TABLE `like_this` (
  `like_this_id` int(11) NOT NULL,
  `story_header_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `like_this`
--

INSERT INTO `like_this` (`like_this_id`, `story_header_id`, `member_id`, `timestamp`) VALUES
(17, 36, 2, '2017-12-02 07:23:15'),
(18, 2, 2, '2017-12-02 07:23:16'),
(19, 36, 1, '2017-12-02 07:24:13');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `first_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pesudonym` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `first_name`, `last_name`, `email`, `mobile`, `pesudonym`, `user_id`, `timestamp`) VALUES
(1, 'admin', 'admin', 'admin@mail.com', '0899999999', 'admin', 1, '2017-09-10 10:17:03'),
(2, 'test', 'test', 'test@hotmail.com', '0812345678', 'test', 8, '2017-09-16 09:07:30'),
(3, 't a r a', 'k h o r s a k u l', 'tara@hotmail.com', '1234567890', 'tk', 9, '2017-09-21 09:33:28'),
(4, 'tara', 'khorsakul', 'a-a-story@hotmail.com', '0812345678', 'tara', 11, '2017-10-16 07:39:10'),
(5, 'dd', 'ss', 'cc@hotmail.com', '1234567890', 'ssss', 12, '2017-11-05 04:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `story_detail_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `order_active` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `story_header_id` int(11) NOT NULL,
  `story_detail_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `truemoney` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `slip` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `payment_confirm` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `story_detail`
--

CREATE TABLE `story_detail` (
  `story_detail_id` int(11) NOT NULL,
  `story_detail_act` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `story_detail_content` text COLLATE utf8_unicode_ci NOT NULL,
  `story_header_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `story_detail`
--

INSERT INTO `story_detail` (`story_detail_id`, `story_detail_act`, `story_detail_content`, `story_header_id`, `timestamp`) VALUES
(36, 'aaaa', '<p>ddddd</p>\n', 2, '2017-11-05 08:12:29'),
(37, 'aaaaa', '<p><strong>sssssdddddsgdhjagdjhagdhjsad</strong></p>\n', 2, '2017-11-05 08:15:16'),
(38, 'bbbbb', '<p>bbbb</p>\n', 33, '2017-11-08 03:33:01'),
(39, 'bhjvbhdjv', '<p>chdjbcsjbchjs</p>\n', 33, '2017-11-19 03:33:20'),
(41, 'ghg', '<p>fghfg</p>\n', 33, '2017-11-19 04:16:31'),
(42, 'ddddd', '<p>fsfdgf</p>\n', 33, '2017-11-19 04:17:19'),
(43, 'asdf', '<p>hfhg</p>\n', 2, '2017-11-19 04:19:43'),
(45, 'kkk', '<p>kkk</p>\n', 34, '2017-11-19 06:29:17'),
(46, 'ccascsacsac', '<h2>สูงวัยไทยป่วย &ldquo;ความดันโลหิตสูง&rdquo; เพิ่มมากขึ้น เกี่ยวกับ ความดันโลหิตสูง</h2>\n\n<p>สนับสนุนเนื้อหา</p>\n\n<p>ความดันโลหิตสูงเปรียบเสมือนภัยเงียบที่ไม่แสดงอาการเจ็บป่วย หากไม่ได้ตรวจวัดความดันโลหิต แต่ผู้ป่วยส่วนใหญ่ที่มีอาการมักจะพบแพทย์ด้วยภาวะวิงเวียนศีรษะ มีเลือดกำเดาไหล แน่นหน้าอก หอบหายใจเร็ว มือเท้าชา หรืออาการอื่นๆ ร่วมด้วย ส่วนภาวะแทรกซ้อนที่เกิดจากโรคความดันโลหิตสูง หากไม่สามารถควบคุมระดับความดันโลหิตได้ จะส่งผลทำให้เกิดอันตรายต่ออวัยวะสำคัญต่างๆของร่างกาย ได้แก่ สมอง หัวใจ หลอดเลือด ตา และไต โดยอาการที่เกิดกับอวัยวะต่าง ๆ มีดังนี้</p>\n\n<ol>\n	<li><strong>สมอง&nbsp;</strong>ความดันโลหิตสูง จะเป็นสาเหตุทำให้เกิดหลอดเลือดตีบ อุดตัน หรือหลอดเลือดในสมองแตก มีเลือดออกในเนื้อสมอง ส่งผลให้เกิด อัมพฤกษ์ อัมพาต หากพบอาการปากเบี้ยว &nbsp;&nbsp;พูดไม่ชัด แขนขาอ่อนแรง&nbsp; ต้องรีบมาโรงพยาบาลภายใน 1 ชั่วโมง เพราะอาจทำให้เสียชีวิตหรือทำให้เลือดออกในสมองรุนแรงได้&nbsp;&nbsp;&nbsp;&nbsp;<br />\n	&nbsp;</li>\n	<li><strong>หัวใจ</strong> ความดันโลหิตสูงจะมีผลต่อหัวใจ 2 ทาง คือ ทำให้กล้ามเนื้อหัวใจโต และหลอดเลือดหัวใจ หนาตัวและแข็งตัวขึ้น เกิดจากหลอดเลือดหัวใจตีบหรืออุดตัน &nbsp;อาจจะมีอาการเจ็บหน้าอกจากหัวใจขาดเลือด&nbsp; เหนื่อยหอบ นอนราบไม่ได้จากหัวใจล้มเหลว&nbsp; หัวใจเต้นผิดปกติ &nbsp;ใจสั่น และอาจเสียชีวิต หากมีอาการดังกล่าวควรนั่งพัก 3-5 นาที หากอาการยังไม่ดีขึ้น&nbsp; ต้องรีบพบแพทย์ทันที&nbsp;<br />\n	&nbsp;</li>\n	ความดันโลหิตสูงจะทำให้เกิดการเปลี่ยนแปลงของหลอดเลือดทั่วร่างกาย ทำให้หลอดเลือดแดงตีบแคบ หรือหลอดเลือดแดงใหญ่โป่งพอง อาจเกิดการฉีกขาด เจ็บหน้าอกร้าวไปยังหลังอย่างรุนแรง หรือเสียชีวิตเฉียบพลันได้<br />\n	&nbsp;</li>\n	ความดันโลหิตสูงมีผลต่อหลอดเลือดที่ตา เช่น เลือดออกที่จอประสาทตา หลอดเลือดเล็กที่จอประสาทตาอุดตัน หรือจอประสาทตาหลุดลอกออกได้ ทั้งนี้ ผู้ป่วยอาจไม่มีอาการใดๆ หรืออาจมีอาการตามัว จนถึงตาบอดได้<br />\n	&nbsp;</li>\n	<li><strong>ไต&nbsp;</strong>ความดันโลหิตสูง มีผลต่อหลอดเลือดที่ไต ทำให้เลือดไปเลี้ยงไตไม่เพียงพอ ไตเสื่อมสมรรถภาพและอาจทำให้เกิดไตวายเรื้อรัง อาการของภาวะไตวายเรื้อรัง คือ ขาบวมตอนเช้าหลังตื่นนอน มีอาการอ่อนเพลีย ไม่ค่อยมีแรงจากภาวะซีด หรือมีอาการคลื่นไส้ &nbsp;อาเจียน ซึมลงในผู้ป่วยไตวายระยะท้ายๆ<br />\n	&nbsp;</li>\n</ol>\n\n<p>ดังนั้นจะเห็นได้ว่าหากละเลยการรักษาความดันโลหิตสูงอาจส่งผลให้เกิดภาวะแทรกซ้อนที่อันตรายได้ ฉะนั้นจึงควรได้รับการรักษาและแนะนำอย่างถูกต้อง เมื่อพบภาวะความดันโลหิตสูง ซึ่งความดันโลหิตสูงสามารถควบคุมหรือป้องกันให้อยู่ภาวะปกติได้ด้วยการปรับเปลี่ยนพฤติกรรมและการกินยาลดความดันโลหิตสูง อาหารที่มีผลต่อความดันโลหิต เช่น อาหารประเภทที่มีโซเดียมสูง ก็เป็นปัจจัยเสี่ยงที่ทำให้เกิดความดันโลหิตสูง จึงควรลดการรับประทานอาหารผ่านกระบวนการ อาหารสำเร็จรูป อาหารหมักดอง อาหารกระป๋องและอาหารขยะ (Junk Food) นอกจากนี้แล้ว อาหารประเภท<p><strong>ขอขอบคุณ</strong></p>\n\n<p>ข้อมูล :<small>นพ.สุทัศน์ คันติโต แพทย์สถาบันหัวใจและหลอดเลือด รพ.พระรามเก้า</small></p>\n\n<p>ภาพ :<small>iStock</small></p>', 36, '2017-11-19 07:19:22'),
(47, 'ขขขข', '<p>อออออ</p>\n', 37, '2017-11-26 04:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `story_header`
--

CREATE TABLE `story_header` (
  `story_header_id` int(11) NOT NULL,
  `story_header_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `story_header_content` text COLLATE utf8_unicode_ci NOT NULL,
  `story_header_img` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `story_header_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `categories_id` int(11) NOT NULL,
  `count_click` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `story_header`
--

INSERT INTO `story_header` (`story_header_id`, `story_header_name`, `story_header_content`, `story_header_img`, `story_header_price`, `categories_id`, `count_click`, `member_id`, `timestamp`) VALUES
(2, 'Dungeon Seeker', 'นักล่า', 'esports-wowwc-58e045d40f48c7b0.png', '0.00', 1, 200, 2, '2017-09-30 06:47:28'),
(19, 'hi', 'wowowowow', 'wow.jpg', '0.00', 12, 0, 2, '2017-10-15 04:03:30'),
(21, 'LMFAO', 'partyrock', 'game-logo-wow.png', '0.00', 19, 0, 2, '2017-10-15 04:05:37'),
(22, 'อ้าว', 'ได้เฉย', 'wow.jpg', '0.00', 91, 0, 2, '2017-10-15 06:57:19'),
(23, 'ยึกยือ', 'ยึกยือ', 'esports-wowwc-58e045d40f48c7b0.png', '0.00', 1, 50, 2, '2017-10-15 07:41:41'),
(24, 'ทดลองอีก', 'เพื่อความชัวร์', '', '0.00', 551, 0, 2, '2017-10-15 17:56:35'),
(25, 'Ore no Imoto ga Konna ni Kawaii Wake ga Nai', 'ลท์โนเวลมีเนื้อหาว่าด้วยความสัมพันธ์ระหว่างชายหนุ่มคนหนึ่งกับน้องสาวซึ่งไม่ราบรื่นมาแต่ต้น และต้องการพิสูจน์ให้น้องสาวเห็นว่าตนเป็นพี่ชายที่ดี โดยเมื่อเขาค้นพบว่าน้องสาวชื่นชอบเกมลามกอนาจาร เขาได้สงเคราะห์ให้น้องสาวสามารถใช้ชีวิตอย่างมีความสุขอยู่ในสังคมที่น้อยคนจะยอมรับรสนิยมเช่นว่าได้ ตลอดจนได้ปรับปรุงความสัมพันธ์กับน้องสาวและกลับมารักใคร่กันดังเดิม ไลท์โนเวลนำเสนอปัญหาหลายประการทางครอบครัวและสังคมผ่านเนื้อหาแนวตลก ละคร และวีรคติ โดยทั้งไลท์โนเวลและอะนิเมะซึ่งดัดแปลงมานั้นได้รับความนิยมเป็นอันมาก ถึงขนาดเป็นเหตุให้ฟุชิมิ ผู้เขียน ถูกข่มขู่มากกว่าห้าร้อยครั้งให้มอบบทเด่นแก่ตัวละครบางตัวด้วย', 'Ore_no_imouto_novel_v1_cover.jpg', '0.00', 1, 0, 1, '2017-10-15 17:57:58'),
(28, 'Harem', 'ธาราน้อย', '14039947_1258375147529350_3092149443272334593_n.jpg', '0.00', 1, 0, 4, '2017-10-16 09:39:44'),
(29, 'ทดสอบ', 'ทดสอบ', '', '0.00', 1, 0, 2, '2017-10-19 07:21:54'),
(31, 'testprice1', 'testprice1', '', '5.00', 1, 0, 2, '2017-10-28 04:00:38'),
(32, 'ทดสอบ', 'ทดสอบ', '', '0.00', 1, 0, 2, '2017-11-05 04:07:19'),
(33, 'bnbn', 'vnnnbn', '5688-94453599.jpg', '10.00', 1, 0, 2, '2017-11-08 03:31:54'),
(34, 'knight', 'mo mo', 'a40a7bf0dae4518e4e4b9da068270b11--the-knight-knight-male.jpg', '0.00', 1, 0, 2, '2017-11-19 06:28:54'),
(35, 'kuku', 'kuku', 'Monster-Hunter-World-Hunters_trans_NvBQzQNjv4BqFd0Cus0ye3UncHZco3BM8DHKc40CbyZnyHDO1jrEmGc.jpg', '0.00', 3, 0, 2, '2017-11-19 06:43:49'),
(36, 'awewfwfewf9999', 'ldmbkdbmklgbmlkgdbmlkdgbmlkdg', 'a40a7bf0dae4518e4e4b9da068270b11--the-knight-knight-male.jpg', '0.00', 1, 0, 2, '2017-11-19 07:19:10'),
(37, 'kkvsfkvsfnvl', 'kmfksnlsfknv', 'animals-lizard-redheadedagamapair.jpg', '0.00', 2, 0, 2, '2017-11-19 07:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `timestamp`) VALUES
(1, 'admin', '1234', '2017-09-10 08:17:31'),
(8, 'test', 'test', '2017-09-16 09:07:15'),
(9, 't a r a', '1234567890', '2017-09-21 09:33:28'),
(10, 'null', 'null', '2017-10-08 03:07:57'),
(11, 'tara', '1234', '2017-10-16 07:39:10'),
(12, 'test11', 'test11', '2017-11-05 04:12:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `like_this`
--
ALTER TABLE `like_this`
  ADD PRIMARY KEY (`like_this_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `story_detail`
--
ALTER TABLE `story_detail`
  ADD PRIMARY KEY (`story_detail_id`);

--
-- Indexes for table `story_header`
--
ALTER TABLE `story_header`
  ADD PRIMARY KEY (`story_header_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `like_this`
--
ALTER TABLE `like_this`
  MODIFY `like_this_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `story_detail`
--
ALTER TABLE `story_detail`
  MODIFY `story_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `story_header`
--
ALTER TABLE `story_header`
  MODIFY `story_header_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
