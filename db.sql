-- XAMPP-Lite
-- version 8.4.4
-- https://xampplite.sf.net/
--
-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2025 at 05:49 AM
-- Server version: 11.4.5-MariaDB-log
-- PHP Version: 8.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web`
--
CREATE DATABASE IF NOT EXISTS `web` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `web`;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` mediumint(8) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `amount`, `image`) VALUES
(1, 'shirt', 220, 5, 'shirt.png'),
(2, 'shoe', 600, 3, 'shoe.png'),
(3, 'hat', 199, 1, 'hat.png'),
(4, 'handbag', 899, 2, 'handbag.png'),
(5, 'jeans', 1009, 4, 'jeans.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2b$10$.XHmyJqfbSh8PW8.uqjdFusT6LFYDFnPfklb8BfkMxLALllTxH/Fu', 1),
(2, 'Lisa', '$2b$10$eWi8N1ZzF.2ZCcG2/HOe3emTOAGwmV9plz0obX3kYIptyj6hDEl8C', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
