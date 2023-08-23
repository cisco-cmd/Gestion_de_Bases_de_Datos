-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-09-2022 a las 07:24:08
-- Versión del servidor: 8.0.27
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `deportes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `CodCli` varchar(4) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `CodArt` varchar(4) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Unidades` int NOT NULL,
  `Descuento` decimal(5,2) NOT NULL,
  `FechaVenta` datetime NOT NULL,
  PRIMARY KEY (`CodCli`,`CodArt`,`FechaVenta`),
  KEY `CodArt` (`CodArt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`CodCli`, `CodArt`, `Unidades`, `Descuento`, `FechaVenta`) VALUES
('2648', 'N001', 1, '5.00', '2018-10-15 00:00:00'),
('3387', 'N045', 2, '0.00', '2018-11-03 00:00:00'),
('2985', 'N010', 1, '3.75', '2018-11-12 00:00:00'),
('2656', 'J008', 1, '10.95', '2018-11-14 00:00:00'),
('2866', 'R504', 2, '1.95', '2018-11-15 00:00:00'),
('2866', 'R512', 1, '0.00', '2018-11-15 00:00:00'),
('2778', 'A025', 1, '0.00', '2018-11-03 00:00:00'),
('2778', 'J004', 2, '0.00', '2018-11-03 00:00:00'),
('2678', 'N010', 1, '3.00', '2018-11-02 00:00:00'),
('3387', 'M010', 2, '5.25', '2019-01-12 00:00:00'),
('2648', 'M010', 2, '5.00', '2019-06-14 00:00:00'),
('2648', 'M010', 3, '3.00', '2019-09-24 00:00:00'),
('2648', 'H002', 1, '25.00', '2019-11-13 00:00:00'),
('3387', 'H003', 3, '0.00', '2019-12-09 00:00:00'),
('3387', 'R512', 2, '0.00', '2019-10-10 00:00:00'),
('3387', 'H003', 3, '10.00', '2021-10-23 00:00:00'),
('3387', 'H003', 7, '1.00', '2021-10-23 11:45:20'),
('3387', 'H003', 3, '1.00', '2021-10-23 11:49:46'),
('3387', 'H003', 5, '1.00', '2021-10-23 11:52:20'),
('3387', 'H003', 5, '1.00', '2021-10-23 11:55:06'),
('3387', 'H003', 5, '1.00', '2021-10-23 12:12:21'),
('3387', 'H003', 5, '1.00', '2022-09-19 12:16:37');

--
-- Disparadores `ventas`
--
DROP TRIGGER IF EXISTS `sinstock`;
DELIMITER $$
CREATE TRIGGER `sinstock` AFTER INSERT ON `ventas` FOR EACH ROW begin
declare stock1 int;
select stock into stock1 from articulos where codart=new.codart;
if (new.unidades< stock1) then
  insert into ventas values (new.codcli,new.codart,new.unidades,descuento,now() );
  ELSE
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: No se ha realizado la venta';
end if;
end
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
