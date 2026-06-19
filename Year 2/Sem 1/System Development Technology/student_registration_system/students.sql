-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2024 at 02:45 PM
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
-- Database: `student_registration_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `matricno` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `dob` date NOT NULL,
  `programme` varchar(50) NOT NULL,
  `yearstudy` enum('Year 1','Year 2','Year 3','Year 4') NOT NULL,
  `subject` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `matricno`, `email`, `phone`, `gender`, `dob`, `programme`, `yearstudy`, `subject`) VALUES
(2, 'LIM YU HAN', 'A23CS0241', 'yuhan7876@gmail.com', '0167727876', 'Female', '2003-08-13', 'Data Engineering', 'Year 1', 'Digital Logic,Discrete Structure'),
(8, 'LIM YU HAN', 'A23CS0241', 'yuhan7876@gmail.com', '0167727876', 'Female', '2024-09-30', 'Data Engineering', 'Year 1', 'Digital Logic'),
(9, 'LIM YU HAN', 'A23CS0241', 'yuhan7876@gmail.com', '0167727876', 'Female', '2024-09-30', 'Software Engineering', 'Year 2', 'Discrete Structure'),
(10, 'LIM YU HAN', 'A23CS0241', 'yuhan7876@gmail.com', '0167167876', 'Female', '2024-10-15', 'Network Security', 'Year 3', 'Programming Technique 1'),
(11, 'LIM YU HAN', 'A23CS0241', 'yuhan7876@gmail.com', '0167167876', 'Female', '2024-10-03', 'Bioinfometrics', 'Year 4', 'Programming Technique 2'),
(12, 'LIM YU HAN', 'A23CS0241', 'yuhan7876@gmail.com', '0167167876', 'Female', '2024-10-02', 'Data Engineering', 'Year 1', 'Digital Logic'),
(13, 'LIM YU HAN', 'A23CS0241', 'yuhan7876@gmail.com', '0167727876', 'Female', '2024-10-03', 'Bioinfometrics', 'Year 3', 'Digital Logic,Discrete Structure');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
