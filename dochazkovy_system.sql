-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Ned 06. bře 2022, 00:32
-- Verze serveru: 10.4.22-MariaDB
-- Verze PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `dochazkovy_system`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `class`
--

INSERT INTO `class` (`id`, `name`) VALUES
(1, 'C3b'),
(2, 'A4');

-- --------------------------------------------------------

--
-- Struktura tabulky `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ucitel'),
(2, 'zak');

-- --------------------------------------------------------

--
-- Struktura tabulky `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role_id`, `class_id`) VALUES
(1, 'Jan', 'jan', 2, 1),
(2, 'Lenka', 'lenka', 2, 2),
(3, 'David', 'david', 2, 1),
(4, 'Tomáš', 'tomas', 2, 2),
(5, 'Jaromír', 'jaromir', 2, 2),
(6, 'Eva', 'eva', 2, 2),
(7, 'Anna', 'anna', 1, 2),
(8, 'Martin', 'martin', 2, 1),
(9, 'Iva', 'iva', 2, 1),
(10, 'Marie', 'marie', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `userlogin`
--

CREATE TABLE `userlogin` (
  `id` int(11) NOT NULL,
  `login` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `userlogin`
--

INSERT INTO `userlogin` (`id`, `login`, `user_id`) VALUES
(1, '2021-12-08 06:07:30', 1),
(2, '2021-12-06 10:30:37', 2),
(3, '2021-03-01 17:34:27', 3),
(4, '2021-10-21 13:42:49', 4),
(5, '2021-08-20 09:40:15', 5),
(6, '2021-01-28 02:37:05', 6),
(7, '2022-03-06 00:31:22', 7),
(8, '2020-12-23 17:04:28', 8),
(9, '2022-03-06 00:28:11', 9),
(10, '2021-06-15 05:50:03', 10);

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexy pro tabulku `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Omezení pro tabulku `userlogin`
--
ALTER TABLE `userlogin`
  ADD CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
