-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 17-10-2022 a las 10:52:26
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `NumCli` int(11) NOT NULL,
  `DNI` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Nombre` varchar(60) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Direccion` varchar(80) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Localidad` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Tfno` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `FNac` date NOT NULL,
  `Sexo` enum('M','F') COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`NumCli`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`NumCli`, `DNI`, `Nombre`, `Direccion`, `Localidad`, `Tfno`, `FNac`, `Sexo`) VALUES
(8, '22090080Y', 'Ines Maldonado', 'Av. Linares, 4 1ºC', 'Toledo', '688776410', '1990-02-05', 'F'),
(1, '26002876F', 'Mariano Lopez', 'C/ Antigua, 1 2ºB', 'Sevilla', '619887665', '2000-02-07', 'M'),
(10, '32876007Z', 'Cristina Perez', 'Av. Cristo Rey, 4', 'Almeria', '600345002', '1985-11-20', 'F'),
(2, '45876123R', 'Pedro Martinez', 'C/ Real, 2', 'Motril', '602345987', '1970-09-08', 'M'),
(3, '44798712W', 'Luisa Fernandez', 'Av. Constitucion, 2 1ºC', 'Nerja', '953751197', '1999-06-23', 'F'),
(7, '25878969X', 'Andres Martinez', 'Corredera de San Fernando, 9', 'Ubeda', '677340092', '1967-10-30', 'M'),
(6, '24345987M', 'Antonia Ruiz', 'C/ Ancha, 23', 'Toledo', '629776449', '1980-05-12', 'F'),
(5, '75900123T', 'Carlos Medina', 'C/ Nueva, 12 5ºA', 'Madrid', '608765221', '2000-09-19', 'M'),
(4, '26810032H', 'Silvia Castro', 'Plza. 1 de mayo, 34', 'Pamplona', '604923756', '2005-10-09', 'F'),
(9, '67234076', 'Monica Carrillo', 'C/ Rastro, 24 5ºA', 'Valencia', '669363669', '1974-09-02', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumiciones`
--

DROP TABLE IF EXISTS `consumiciones`;
CREATE TABLE IF NOT EXISTS `consumiciones` (
  `Codigo` int(11) NOT NULL,
  `Codocupacion` int(11) NOT NULL,
  `Codprod` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Unidades` tinyint(4) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `consumiciones`
--

INSERT INTO `consumiciones` (`Codigo`, `Codocupacion`, `Codprod`, `Fecha`, `Unidades`) VALUES
(15, 13, 4, '2020-03-15', 1),
(14, 13, 2, '2020-03-15', 1),
(13, 13, 10, '2020-03-14', 4),
(12, 10, 5, '2020-02-28', 2),
(11, 10, 6, '2020-02-28', 2),
(10, 10, 3, '2020-02-28', 2),
(9, 8, 7, '2020-02-17', 2),
(8, 8, 7, '2020-02-16', 3),
(7, 7, 9, '2020-02-16', 4),
(16, 15, 8, '2020-03-13', 2),
(6, 5, 5, '2020-02-15', 2),
(5, 5, 11, '2020-02-15', 2),
(4, 1, 4, '2020-01-04', 2),
(3, 1, 2, '2020-01-04', 2),
(2, 1, 4, '2020-01-03', 2),
(1, 1, 2, '2020-01-03', 2),
(17, 15, 5, '2020-03-13', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
CREATE TABLE IF NOT EXISTS `habitaciones` (
  `NumHab` varchar(3) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Preciodia` decimal(5,2) NOT NULL,
  `Categoria` enum('Individual','Doble','Triple') COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Fumador` enum('S','N') COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`NumHab`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`NumHab`, `Preciodia`, `Categoria`, `Fumador`) VALUES
('301', '140.00', 'Doble', 'N'),
('203', '80.00', 'Doble', 'S'),
('202', '45.00', 'Individual', 'N'),
('201', '90.00', 'Doble', 'S'),
('104', '80.00', 'Doble', 'S'),
('103', '110.00', 'Triple', 'N'),
('102', '80.00', 'Doble', 'S'),
('101', '45.00', 'Individual', 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupaciones`
--

DROP TABLE IF EXISTS `ocupaciones`;
CREATE TABLE IF NOT EXISTS `ocupaciones` (
  `Codigo` int(11) NOT NULL,
  `Numhab` varchar(3) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Numcli` int(11) NOT NULL,
  `FEntrada` datetime NOT NULL,
  `FSalida` datetime NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `ocupaciones`
--

INSERT INTO `ocupaciones` (`Codigo`, `Numhab`, `Numcli`, `FEntrada`, `FSalida`) VALUES
(18, '203', 1, '2022-03-15 00:00:00', '2022-03-22 00:00:00'),
(17, '103', 2, '2022-03-15 00:00:00', '2022-03-25 00:00:00'),
(15, '201', 7, '2022-03-11 00:00:00', '2022-03-14 00:00:00'),
(14, '101', 9, '2022-03-10 00:00:00', '2022-03-12 00:00:00'),
(13, '301', 4, '2022-03-12 00:00:00', '2022-03-14 00:00:00'),
(12, '203', 10, '2022-03-03 00:00:00', '2022-03-05 00:00:00'),
(11, '101', 5, '2022-03-03 00:00:00', '2022-03-04 00:00:00'),
(10, '301', 4, '2022-02-27 00:00:00', '2022-03-01 00:00:00'),
(9, '103', 1, '2022-02-21 00:00:00', '2022-02-22 00:00:00'),
(8, '102', 2, '2022-02-16 00:00:00', '2022-02-19 00:00:00'),
(7, '101', 6, '2022-02-16 00:00:00', '2022-02-19 00:00:00'),
(6, '301', 9, '2022-02-14 00:00:00', '2022-02-16 00:00:00'),
(5, '203', 8, '2022-02-14 00:00:00', '2022-02-16 00:00:00'),
(4, '202', 1, '2022-02-14 00:00:00', '2022-02-15 00:00:00'),
(3, '201', 7, '2022-01-05 00:00:00', '2022-01-10 00:00:00'),
(2, '301', 3, '2022-01-02 00:00:00', '2022-01-07 00:00:00'),
(1, '101', 9, '2022-02-02 00:00:00', '2022-02-17 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `Codpro` int(11) NOT NULL,
  `Descripcion` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Precio` decimal(4,2) NOT NULL,
  PRIMARY KEY (`Codpro`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Codpro`, `Descripcion`, `Precio`) VALUES
(5, 'Bolleria', '1.75'),
(4, 'Tostada', '0.95'),
(3, 'Cafe Cortado', '1.30'),
(2, 'Cafe con Leche', '1.50'),
(1, 'Cafe Solo', '1.20'),
(6, 'Zumo Naranja', '2.25'),
(7, 'Cerveza', '2.00'),
(8, 'Combinado Nacional', '4.75'),
(10, 'Licores', '4.25'),
(11, 'Te', '1.25'),
(9, 'Combinado Import.', '6.25'),
(12, 'Tostada Jamon', '2.25');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
