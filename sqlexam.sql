-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2023 at 10:16 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sqlexam`
--

-- --------------------------------------------------------

Open https://www.mashupstack.com/share/table to find the sample table
Answer the questions based on the above table

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `leave_taken` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `department`, `leave_taken`) VALUES
(1, 'raju', 'sales', 1),
(2, 'sangeetha', 'sales', 3),
(3, 'vinay', 'operations', 8),
(4, 'abey', 'packing', 2),
(5, 'thomas', 'packing', 1),
(6, 'muneer', 'operations', 7),
(7, 'aparna', 'sales', 3),
(8, 'abid', 'operations', 9),
(9, 'fathima', 'sales', 11),
(10, 'varghese', 'operations', 14);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(10) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `exam_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `employee_id`, `exam_status`) VALUES
(1, 2, 'pass'),
(2, 5, 'fail'),
(3, 1, 'fail'),
(4, 8, 'pass'),
(5, 3, 'pass'),
(6, 4, 'pass'),
(7, 6, 'fail'),
(8, 9, 'pass'),
(9, 10, 'pass');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ForeignKey` (`employee_id`);

--
ALTER TABLE `exam`
  ADD CONSTRAINT `ForeignKey` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);
COMMIT;


(1)Write a query to get the list of employees who took more than 5 leaves and are in
sales department

SELECT * FROM `employee` WHERE department ='sales' AND leave_taken>5;

(2)Write a query to get the number of employees working in operations department

SELECT department,COUNT(*) AS employees FROM `employee` WHERE department='operations';

(3)Write a single query to get the count of employees working in each department

SELECT department,COUNT(*) FROM `employee` GROUP BY department;

(4)Write a query to list the departments where all its employee altogether took more
than 10 leaves

SELECT department,SUM(leave_taken) FROM `employee` GROUP BY department HAVING SUM(leave_taken)>10;

(5)Write a query to list all the employee names who have passed the exam

SELECT name FROM `employee` WHERE id IN (SELECT employee_id FROM exam WHERE exam_status='pass');

(6)Write a query to list all the employee names who have not attended the exam

SELECT name FROM `employee` WHERE id NOT IN (SELECT employee_id FROM exam);