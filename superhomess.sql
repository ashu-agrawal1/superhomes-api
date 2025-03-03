-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2025 at 01:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `superhomess`
--

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `name`) VALUES
(181, '2Bathroom'),
(146, '2beds'),
(183, '3Bedroom'),
(182, '3Beds Hot water'),
(159, '55-inch HDTV with Disney+'),
(162, 'AC – split-type ductless system'),
(187, 'Air conditioning'),
(160, 'Amazon Prime Video'),
(152, 'Bed linen'),
(150, 'bed sheets'),
(163, 'Ceiling fan'),
(156, 'Clothes drying rack'),
(158, 'Clothes storage: wardrobe'),
(153, 'Cotton linen'),
(167, 'Dedicated workspace'),
(174, 'Dining table'),
(171, 'Dishes and cutlery'),
(165, 'Fire extinguisher'),
(166, 'First aid kit'),
(176, 'Free parking on premises'),
(148, 'Free washer – In unit'),
(169, 'Fridge'),
(172, 'Gas cooker'),
(147, 'Hair dryer'),
(164, 'Heating'),
(191, 'Hot water'),
(155, 'Iron'),
(193, 'Jzxcv'),
(173, 'Kettle'),
(168, 'Kitchen'),
(184, 'Laundry'),
(180, 'Lockbox'),
(178, 'Long-term stays allowed'),
(170, 'Microwave'),
(161, 'Netflix'),
(190, 'Parking'),
(177, 'Pets allowed'),
(175, 'Private patio or balcony'),
(154, 'Room-darkening blinds'),
(157, 'Safe'),
(188, 'Security cameras'),
(179, 'Self check-in'),
(151, 'soap and toilet paper'),
(149, 'Towels'),
(186, 'TV'),
(185, 'Washing machine'),
(145, 'wifi'),
(192, 'window'),
(189, 'Workspace');

-- --------------------------------------------------------

--
-- Table structure for table `feature_property`
--

CREATE TABLE `feature_property` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `location` varchar(255) NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `bathrooms` int(11) DEFAULT NULL,
  `is_premium` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `max_guests` int(11) DEFAULT NULL,
  `beds` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feature_property`
--

INSERT INTO `feature_property` (`id`, `title`, `description`, `price`, `location`, `bedrooms`, `bathrooms`, `is_premium`, `created_at`, `max_guests`, `beds`) VALUES
(12, 'SuperHomess Luxe 2BHK Suite Apartmentt', 'Entire rental unit in Jabalpur, India', 3804.00, 'Jabalpur, Madhya Pradesh, India\r\nCentred on Jabalpur', 2, 2, 1, '2024-12-28 08:53:02', 4, 3),
(15, 'SuperHi-luxe ‘2’ 3BHK By Superhomess', 'Entire rental unit in Tilhari, India\r\n10 guests3 bedrooms3 beds2 bathrooms', 3888.00, 'Jabalpur, Madhya Pradesh, India', 3, 2, 0, '2025-01-05 08:38:14', 2, 3),
(17, 'Pearl Luxury Suite Condo (3BHK + 1 Leisure Room)', 'Pearl apartment in Jabalpur, Madhya Pradesh, India, is a great choice for your next holiday. \r\nEnjoy the comfort of a modern home and the convenience of being in the heart of the city. With fully equipped kitchen, in-room WiFi, and convenient access to restaurants and shops. \r\nYou’ll love your stay...', 3088.00, 'Jabalpur, Madhya Pradesh, India', 3, 3, 0, '2025-01-05 09:16:40', 3, 4),
(19, 'Test Property ', 'This is testing', 2.00, 'Jabalpur, Madhya Pradesh, India', 6, 12, 0, '2025-01-09 06:47:45', 3, 2),
(20, 'Test Second', 'This is testing', 2.00, 'Jabalpur, Madhya Pradesh, India', 3, 6, 0, '2025-01-09 06:51:04', 4, 3),
(22, 'kanfkn', 'zNLcnzl;n', 1.00, '1', 1, 1, 0, '2025-01-09 06:54:56', 1, 4),
(24, 'aowierpwuro', 'sfjsojfoi', -7.00, 'Jabalpur, Madhya Pradesh, IndiaCentred on Jabalpur', 1, -1, 0, '2025-01-09 07:04:18', 2, 2),
(25, 'atalhlh', 'kznvkzn', 22.00, '2', 2, 2, 0, '2025-01-09 07:05:16', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `property_amenities`
--

CREATE TABLE `property_amenities` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `amenity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_amenities`
--

INSERT INTO `property_amenities` (`id`, `property_id`, `amenity_id`) VALUES
(561, 12, 145),
(562, 12, 146),
(563, 12, 147),
(564, 12, 148),
(565, 12, 149),
(566, 12, 150),
(567, 12, 151),
(568, 12, 152),
(569, 12, 153),
(570, 12, 154),
(571, 12, 155),
(572, 12, 156),
(573, 12, 157),
(574, 12, 158),
(575, 12, 159),
(576, 12, 160),
(577, 12, 161),
(578, 12, 162),
(579, 12, 163),
(580, 12, 164),
(581, 12, 165),
(582, 12, 166),
(583, 12, 167),
(584, 12, 168),
(585, 12, 169),
(586, 12, 170),
(587, 12, 171),
(588, 12, 172),
(589, 12, 173),
(590, 12, 174),
(591, 12, 175),
(592, 12, 176),
(593, 12, 177),
(594, 12, 178),
(595, 12, 179),
(596, 12, 180),
(347, 15, 145),
(348, 15, 165),
(349, 15, 166),
(350, 15, 168),
(351, 15, 177),
(352, 15, 184),
(353, 15, 185),
(354, 15, 186),
(355, 15, 187),
(356, 15, 188),
(357, 15, 189),
(358, 15, 190),
(359, 15, 191),
(444, 17, 145),
(445, 17, 165),
(446, 17, 166),
(447, 17, 168),
(448, 17, 177),
(449, 17, 184),
(450, 17, 185),
(451, 17, 186),
(452, 17, 187),
(453, 17, 188),
(454, 17, 189),
(455, 17, 190),
(456, 17, 191),
(457, 17, 192),
(496, 19, 166),
(495, 19, 184),
(494, 19, 191),
(597, 20, 185),
(598, 20, 188),
(599, 20, 190),
(509, 22, 165),
(510, 22, 186),
(522, 24, 145),
(521, 24, 188),
(524, 25, 166),
(523, 25, 184);

-- --------------------------------------------------------

--
-- Table structure for table `property_availability`
--

CREATE TABLE `property_availability` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_booked` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `number_of_guests` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `image_url`) VALUES
(29, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375960/superhomess/ny3e7q1zbbyda8nrdhew.jpg'),
(30, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375962/superhomess/pndnrptkbdiqygypxrfl.jpg'),
(31, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375963/superhomess/odow3zyxtbybyhylfkvd.jpg'),
(32, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375964/superhomess/tmccej95jpyqrcdbqgfu.jpg'),
(33, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375965/superhomess/tfqrflkd0csdwzeqx67t.jpg'),
(34, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375966/superhomess/xuxymwbxrs5i7ux1jakf.jpg'),
(35, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375967/superhomess/ulsaotvr2hwxpjox8bwk.jpg'),
(36, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375969/superhomess/m3th0x3rp1leqcgrsbee.jpg'),
(37, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375972/superhomess/fo8nrzbl60xzfoqywqsu.jpg'),
(38, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375974/superhomess/wkqrsfbkusgh64v3aeta.jpg'),
(39, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375976/superhomess/rgxxdcxtu9w0l7h2qwe1.jpg'),
(40, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375977/superhomess/ld6ynmcnirs05smkon7s.jpg'),
(41, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375979/superhomess/ujlpm3dopmeoqnbznue7.jpg'),
(42, 12, 'https://res.cloudinary.com/bazeercloud/image/upload/v1735375980/superhomess/futxfxbg3k5ghqo1tofd.jpg'),
(67, 15, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736066288/superhomess/h09nr7zcpsctpnbkxy5d.jpg'),
(68, 15, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736066289/superhomess/ml8dx8ebsmqxpxgb6ogj.jpg'),
(69, 15, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736066290/superhomess/gtahlg4vhuokqxnkvqr4.jpg'),
(70, 15, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736066291/superhomess/yl1nqgvam6z96v7lnvrx.jpg'),
(71, 15, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736066292/superhomess/vu4z4s45sc7uyngamosz.jpg'),
(72, 15, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736066293/superhomess/m6isb7xiyd8ysw4ke4gu.jpg'),
(79, 17, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736068596/superhomess/yng5favu5u5o155c7hbg.jpg'),
(80, 17, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736068597/superhomess/xm0ummtkgna8bxha5rt9.jpg'),
(81, 17, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736068598/superhomess/zbjlfs3oib8rbtbteuyj.jpg'),
(82, 17, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736068599/superhomess/we6l4nghpc52bdook1w2.jpg'),
(83, 17, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736068599/superhomess/hpqu7kl6csxnoncdvkvt.jpg'),
(89, 19, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736405264/superhomess/kyhjnqsjx4wc2wyh3kiv.jpg'),
(90, 20, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736405463/superhomess/lh3dsxbcm4kuppf7n4ud.jpg'),
(94, 22, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736405695/superhomess/dd7w6xq7uyw3uacptnax.jpg'),
(100, 24, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736406255/superhomess/duzazpkl6stcn1zefptj.jpg'),
(101, 24, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736406256/superhomess/uc02jf5n9elkkegoco7e.jpg'),
(102, 24, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736406257/superhomess/izl9b5i8kannhnjt5amg.jpg'),
(103, 25, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736406310/superhomess/hzcsi0dfcoqait2kf53z.jpg'),
(104, 25, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736406311/superhomess/efxxoyw1te3d86vbg677.jpg'),
(105, 25, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736406313/superhomess/kcvfdffbfmbdeo8fuzna.jpg'),
(106, 25, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736406314/superhomess/je7otmnkwgotnx00cqsg.jpg'),
(107, 25, 'https://res.cloudinary.com/bazeercloud/image/upload/v1736406315/superhomess/tqqsz8lfo1olv49wenf9.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `total_price` decimal(10,2) NOT NULL,
  `payment_status` varchar(50) DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_gateway` varchar(50) DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_currency` varchar(50) DEFAULT NULL,
  `guest` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `property_id`, `user_id`, `start_date`, `end_date`, `status`, `total_price`, `payment_status`, `payment_method`, `payment_id`, `transaction_id`, `created_at`, `payment_gateway`, `payment_amount`, `payment_currency`, `guest`) VALUES
(39, 12, 2, '2024-12-31', '2025-01-01', 'pending', 3804.00, 'success', 'Razorpay', 'order_Pdny5CjphXKO5w', 'pay_PdnyVE6MJQSE5D', '2024-12-31 13:47:23', NULL, NULL, NULL, NULL),
(67, 12, 1, '2025-01-04', '2025-01-05', 'pending', 3804.00, 'success', 'Razorpay', 'order_PfLZCqy1FUm50C', 'pay_PfLZWxPeMHOdz2', '2025-01-04 11:18:20', NULL, NULL, NULL, 1),
(68, 12, 2, '2025-01-06', '2025-01-07', 'pending', 38040.00, 'success', 'Razorpay', 'order_Pfg8j1JgswFuKw', 'pay_Pfg9E2eZooTlvz', '2025-01-05 07:26:03', NULL, NULL, NULL, 1),
(70, 17, 1, '2025-01-06', '2025-01-07', 'pending', 30880.00, 'success', 'Razorpay', 'order_Pfi7LfOpKXo1as', 'pay_Pfi7h6e0jcHRsv', '2025-01-05 09:21:54', NULL, NULL, NULL, 4),
(78, 17, 1, '2025-01-15', '2025-01-16', 'pending', 3088.00, 'success', 'Razorpay', 'order_Pfn7DkK9ql5wpb', 'pay_Pfn7RuFoGnxvQI', '2025-01-05 14:15:10', NULL, NULL, NULL, 4),
(79, 17, 1, '2025-01-17', '2025-01-18', 'pending', 3088.00, 'success', 'Razorpay', 'order_Pfn8hu61qvYyP2', 'pay_Pfn92vxz1PX1Xi', '2025-01-05 14:16:39', NULL, NULL, NULL, 4),
(80, 15, 1, '2025-01-07', '2025-01-08', 'pending', 3888.00, 'success', 'Razorpay', 'order_PfnBSVV6lMSM3m', 'pay_PfnBgysCNS2790', '2025-01-05 14:19:09', NULL, NULL, NULL, 1),
(81, 15, 1, '2025-01-23', '2025-01-24', 'pending', 3888.00, 'success', 'Razorpay', 'order_PfnNLsfSltxrqp', 'pay_PfnNuFEBMHQsPK', '2025-01-05 14:30:45', NULL, NULL, NULL, 1),
(82, 12, 1, '2025-01-22', '2025-01-23', 'pending', 3804.00, 'success', 'Razorpay', 'order_PgU7fEaBcdGnjP', 'pay_PgU7t78dOYKADv', '2025-01-07 08:19:24', NULL, NULL, NULL, 3),
(83, 12, 1, '2025-01-30', '2025-01-31', 'failed', 3804.00, 'checked_in', 'Razorpay', 'order_PgUE2mUo1IP9Ub', 'pay_PgUEGXkgfJ8UtZ', '2025-01-07 08:25:24', NULL, NULL, NULL, 3),
(84, 15, 2, '2025-01-22', '2025-01-23', 'pending', 3888.00, 'success', 'Razorpay', 'order_Pgc5bkOOugnRPs', 'pay_Pgc61x0DtvyZDS', '2025-01-07 16:07:09', NULL, NULL, NULL, 3),
(85, 15, 1, '2025-01-11', '2025-01-12', 'pending', 3888.00, 'success', 'Razorpay', 'order_PhdwFTXyGzfO4G', 'pay_PhdwnLb9zUGyeV', '2025-01-10 06:34:51', NULL, NULL, NULL, 1),
(86, 12, 1, '2025-01-27', '2025-01-29', 'pending', 3804.00, 'success', 'Razorpay', 'order_PnDN2ZpgmvtVUU', 'pay_PnDNKeOF6v8VeN', '2025-01-24 08:29:13', NULL, NULL, NULL, 3),
(87, 12, 1, '2025-12-30', '2025-01-31', 'failed', 380400.00, 'checked_in', 'Razorpay', 'order_Po323gW7AvZTmc', 'pay_Po32fBoDfwKUPp', '2025-01-26 11:01:44', NULL, NULL, NULL, 5),
(88, 15, 1, '2024-12-28', '2025-01-23', 'pending', 4971.20, 'success', 'Razorpay', 'order_Po4NS0RbPscPNK', 'pay_Po4Nvjd6HCrxTu', '2025-01-26 12:20:33', NULL, NULL, NULL, 3),
(89, 15, 1, '2025-01-26', '2025-01-27', 'pending', 4971.20, 'success', 'Razorpay', 'order_Po4QCemZ4qaNOi', 'pay_Po4QRQJfqdXrtF', '2025-01-26 12:22:55', NULL, NULL, NULL, 3),
(90, 12, 2, '2025-01-27', '2025-01-28', 'pending', 100.00, 'pending', 'credit_card', '12sdmfs', 'y124dfmfs', '2025-01-27 05:37:29', NULL, NULL, NULL, NULL),
(91, 15, 1, '2025-02-03', '2025-02-04', 'failed', 5471.20, 'checked_in', 'Razorpay', 'order_PoMgpmbctZh4dp', 'pay_PoMhPe90MwAedK', '2025-01-27 06:15:29', NULL, NULL, NULL, 4),
(92, 15, 1, '2025-02-04', '2025-02-06', 'pending', 4971.20, 'success', 'Razorpay', 'order_PoMjR2cozZqzde', 'pay_PoMjfIKIw9isUt', '2025-01-27 06:17:36', NULL, NULL, NULL, 3),
(93, 15, 1, '2025-02-06', '2025-02-07', 'failed', 4971.20, 'checked_in', 'Razorpay', 'order_PoMm20kM8oBrDc', 'pay_PoMmIvJj0KvXWp', '2025-01-27 06:20:07', NULL, NULL, NULL, 3),
(94, 15, 1, '2025-02-08', '2025-02-09', 'failed', 4971.20, 'checked_in', 'Razorpay', 'order_PoMnvK2qYxnWSA', 'pay_PoMoEJWc6IQtjJ', '2025-01-27 06:21:56', NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `property_id`, `user_id`, `user_name`, `user_email`, `message`, `rating`, `created_at`) VALUES
(6, 12, 2, 'Adi', 'adityasharma10102000@gmail.com', 'Amazing', 3, '2025-01-02 07:48:03'),
(7, 12, 2, 'Adi', 'adityasharma10102000@gmail.com', 'Nice', 5, '2025-01-02 07:48:28'),
(8, 12, 2, 'Adi', 'adityasharma10102000@gmail.com', 'nice ', 5, '2025-01-02 07:48:40'),
(9, 12, 2, 'Adi', 'adityasharma10102000@gmail.com', 'mast', 4, '2025-01-02 07:48:45'),
(10, 12, 2, 'Adi', 'adityasharma10102000@gmail.com', 'ek number', 4, '2025-01-02 07:49:00'),
(11, 12, 2, 'Adi', 'adityasharma10102000@gmail.com', 'gajab', 4, '2025-01-02 07:49:04'),
(12, 12, 2, 'Adi', NULL, 'Best experiences', 5, '2025-01-02 07:49:15'),
(13, 12, 2, 'Adi', NULL, 'Fantastic', 5, '2025-01-02 07:49:22'),
(14, 12, 2, 'Adi', NULL, 'Amazing', 5, '2025-01-02 07:52:09'),
(26, 12, 2, 'Adi', NULL, 'Amazing', 5, '2025-01-02 12:12:08'),
(27, 12, 2, 'Adi', NULL, 'Wonderfull', 5, '2025-01-02 12:38:35'),
(28, 12, 1, 'Test User', NULL, 'Amanzing..', 5, '2025-01-07 08:24:24');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `birthdate` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`user_id`, `name`, `age`, `birthdate`, `email`, `phone_number`, `password`, `confirmPassword`, `role`, `created_at`) VALUES
(1, 'Test User', 30, '1994-01-01', 'test@gmail.com', '1234567890', '123', '123', 'admin', '2024-12-28 07:25:41'),
(2, 'Adi', 0, '0000-00-00', 'adityasharma10102000@gmail.com', '123456789', '123', '', 'user', '2024-12-29 08:57:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `feature_property`
--
ALTER TABLE `feature_property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_amenities`
--
ALTER TABLE `property_amenities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `property_id` (`property_id`,`amenity_id`),
  ADD KEY `amenity_id` (`amenity_id`);

--
-- Indexes for table `property_availability`
--
ALTER TABLE `property_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`),
  ADD KEY `fk_user_property_availability` (`user_id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `feature_property`
--
ALTER TABLE `feature_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `property_amenities`
--
ALTER TABLE `property_amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=636;

--
-- AUTO_INCREMENT for table `property_availability`
--
ALTER TABLE `property_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `property_amenities`
--
ALTER TABLE `property_amenities`
  ADD CONSTRAINT `property_amenities_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `feature_property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `property_amenities_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property_availability`
--
ALTER TABLE `property_availability`
  ADD CONSTRAINT `fk_user_property_availability` FOREIGN KEY (`user_id`) REFERENCES `userdata` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `property_availability_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `feature_property` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property_images`
--
ALTER TABLE `property_images`
  ADD CONSTRAINT `property_images_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `feature_property` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `feature_property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `userdata` (`user_id`);

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `feature_property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `testimonials_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `userdata` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
