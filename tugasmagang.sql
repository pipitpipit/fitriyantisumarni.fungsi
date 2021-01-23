-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2021 at 08:57 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugasmagang`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`) VALUES
(1, 'Widget 1'),
(2, 'widget 2'),
(3, 'widget 3');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `variant_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`variant_id`, `product_id`, `name`) VALUES
(1, 1, 'size'),
(2, 1, 'color'),
(3, 2, 'size'),
(4, 2, 'class'),
(5, 3, 'size');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_options`
--

CREATE TABLE `product_variant_options` (
  `id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_variant_options`
--

INSERT INTO `product_variant_options` (`id`, `product_variant_id`, `name`) VALUES
(1, 1, 'small'),
(2, 1, 'large'),
(3, 2, 'white'),
(4, 2, 'black'),
(5, 3, 'small'),
(6, 3, 'medium'),
(7, 4, 'Amateur'),
(8, 4, 'Profesional'),
(9, 5, 'medium'),
(10, 5, 'large');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_option_id`
--

CREATE TABLE `product_variant_option_id` (
  `product_variant_option_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_variant_option_id`
--

INSERT INTO `product_variant_option_id` (`product_variant_option_id`, `sku_id`) VALUES
(1, 1),
(3, 1),
(1, 2),
(4, 2),
(2, 3),
(3, 3),
(2, 4),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(9, 7),
(7, 8),
(10, 8),
(8, 9),
(9, 9),
(8, 10),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `skus`
--

CREATE TABLE `skus` (
  `sku_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `skus`
--

INSERT INTO `skus` (`sku_id`, `product_id`, `sku`, `price`) VALUES
(4, 1, 'W1SLCB', 15),
(3, 1, 'W1SLCW', 12),
(2, 1, 'W1SSCB', 10),
(1, 1, 'W1SSCW', 10),
(6, 2, 'W2SM', 100),
(5, 2, 'W2SS', 100),
(8, 3, 'W3CASL', 50),
(7, 3, 'W3CASM', 50),
(10, 3, 'W3CPSL', 160),
(9, 3, 'W3CPSM', 150);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`variant_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_variant_options`
--
ALTER TABLE `product_variant_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variant_id` (`product_variant_id`);

--
-- Indexes for table `product_variant_option_id`
--
ALTER TABLE `product_variant_option_id`
  ADD KEY `product_variant_option_id` (`product_variant_option_id`),
  ADD KEY `sku_id` (`sku_id`);

--
-- Indexes for table `skus`
--
ALTER TABLE `skus`
  ADD PRIMARY KEY (`sku_id`),
  ADD KEY `options_id` (`product_id`,`sku`,`price`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_variant_options`
--
ALTER TABLE `product_variant_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `skus`
--
ALTER TABLE `skus`
  MODIFY `sku_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_variant_options`
--
ALTER TABLE `product_variant_options`
  ADD CONSTRAINT `product_variant_options_ibfk_1` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`variant_id`);

--
-- Constraints for table `product_variant_option_id`
--
ALTER TABLE `product_variant_option_id`
  ADD CONSTRAINT `product_variant_option_id_ibfk_1` FOREIGN KEY (`sku_id`) REFERENCES `skus` (`sku_id`),
  ADD CONSTRAINT `product_variant_option_id_ibfk_2` FOREIGN KEY (`product_variant_option_id`) REFERENCES `product_variant_options` (`id`);

--
-- Constraints for table `skus`
--
ALTER TABLE `skus`
  ADD CONSTRAINT `skus_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_variants` (`variant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
