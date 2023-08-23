-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 10-10-2022 a las 20:13:37
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
-- Base de datos: `pizzería`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `idcat` enum('C','R') COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `sueldo` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`idcat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcat`, `descripcion`, `sueldo`) VALUES
('C', 'Cocinero', '1284.00'),
('R', 'Repartidor', '918.75');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idcli` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `tfno` varchar(9) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fnac` date DEFAULT NULL,
  `Sexo` enum('M','F') COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idcli`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcli`, `nombre`, `direccion`, `tfno`, `fnac`, `Sexo`) VALUES
('001', 'Carlos Martinez', 'Constitucion, 8 - 5ºB', '629001005', '1980-01-05', 'M'),
('002', 'Lola Ruiz', 'Nueva, 12 - 3ºA', '600987253', '1985-02-14', 'F'),
('003', 'Luis Lopez', 'Av. Linares, 8 - 5ºB', '629001077', '1982-03-05', 'M'),
('004', 'Maria Ruiz', 'Explanada, 10 - 3ºA', '600987881', '1990-04-14', 'F'),
('005', 'Jose Maria Lopez', 'Canos, 5 - 5ºB', '629995077', '1989-05-25', 'M'),
('006', 'Cristina Rodriguez', 'Esperanza, 8', '605438881', '1990-04-18', 'F'),
('007', 'Rafael Martinez', 'Pz. 1 Mayo, 5', '62666782', '1970-06-17', 'M'),
('008', 'Rosa Fernandez', 'Corredera, 12 - 2A', '605438005', '1991-07-01', 'F'),
('009', 'Andres Lopez', 'Antigua, 1 - 3C', '61166782', '1970-08-07', 'M'),
('010', 'Isabel Torres', 'Rastro, 2 - 2C', '611438004', '1979-08-15', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `idemp` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `tfno` varchar(9) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `FIngreso` date DEFAULT NULL,
  `Sexo` enum('M','F') COLLATE utf8_spanish2_ci NOT NULL,
  `categoria` enum('C','R') COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idemp`),
  KEY `categoria` (`categoria`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idemp`, `nombre`, `tfno`, `FIngreso`, `Sexo`, `categoria`) VALUES
('C01', 'Pepe Rodriguez', '603775975', '2018-01-07', 'M', 'C'),
('C02', 'Jordi Cruz', '609451934', '2018-01-12', 'M', 'C'),
('R01', 'Carlos Sanchez', '633961003', '2018-01-12', 'M', 'R'),
('R02', 'Miriam Valero', '669992664', '2018-01-15', 'F', 'R'),
('C03', 'Belen de la Torre', '955661662', '2018-01-18', 'F', 'C'),
('R03', 'Susana Alameda', '600226335', '2018-01-20', 'F', 'R'),
('R04', 'Juan Lopez', '677894256', '2020-01-30', 'M', 'R');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineaspedido`
--

DROP TABLE IF EXISTS `lineaspedido`;
CREATE TABLE IF NOT EXISTS `lineaspedido` (
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idped` int(11) NOT NULL,
  `idproducto` varchar(4) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `unidades` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlinea`,`idped`),
  KEY `idped` (`idped`),
  KEY `idproducto` (`idproducto`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `lineaspedido`
--

INSERT INTO `lineaspedido` (`idlinea`, `idped`, `idproducto`, `unidades`) VALUES
(1, 1, 'B001', 2),
(1, 2, 'P003', 1),
(1, 3, 'H001', 1),
(1, 4, 'H002', 5),
(1, 5, 'P004', 2),
(1, 6, 'B004', 2),
(1, 7, 'B002', 4),
(1, 8, 'H001', 2),
(1, 9, 'B008', 10),
(1, 10, 'B003', 10),
(2, 1, 'B004', 2),
(2, 2, 'P006', 1),
(2, 3, 'P006', 1),
(2, 4, 'B005', 3),
(2, 5, 'P002', 1),
(2, 6, 'P003', 3),
(2, 7, 'B007', 8),
(2, 8, 'P006', 2),
(2, 9, 'H001', 10),
(3, 2, 'P001', 1),
(3, 3, 'H003', 2),
(3, 5, 'B007', 1),
(3, 8, 'P002', 1),
(4, 2, 'H002', 4),
(4, 3, 'P005', 1),
(4, 5, 'H003', 2),
(4, 8, 'P002', 1),
(5, 3, 'B007', 4),
(5, 5, 'B001', 2),
(5, 8, 'B007', 10),
(1, 11, 'I001', 2),
(2, 11, 'I002', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `idped` int(11) NOT NULL AUTO_INCREMENT,
  `idemp` varchar(3) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `idcli` varchar(6) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`idped`),
  KEY `idcli` (`idcli`),
  KEY `idempleado` (`idemp`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idped`, `idemp`, `idcli`, `fecha`, `total`) VALUES
(1, 'R01', '006', '2021-01-13', '7.40'),
(2, 'R02', '004', '2021-01-13', '48.13'),
(3, 'R01', '010', '2021-01-19', '40.88'),
(4, 'R02', '003', '2021-01-19', '21.55'),
(5, 'R02', '007', '2021-01-20', '49.46'),
(6, 'R02', '002', '2021-01-20', '42.65'),
(7, 'R01', '010', '2021-01-22', '24.20'),
(8, 'R02', '007', '2021-01-22', '69.24'),
(9, 'C01', '007', '2021-02-07', '51.70'),
(10, 'R02', '010', '2021-02-05', '24.20'),
(11, 'R02', '010', '2021-02-14', '18.50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `idprod` varchar(4) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `precio` decimal(4,2) DEFAULT NULL,
  `tipo` enum('H','B','P','E','F') COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idprod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idprod`, `descripcion`, `precio`, `tipo`) VALUES
('B001', 'Budweiser', '1.71', 'B'),
('B002', 'Coca Cola', '1.66', 'B'),
('B003', 'Coca Cola Light', '1.71', 'B'),
('B004', 'Fanta Naranja', '1.81', 'B'),
('B005', 'Fanta Limon', '1.81', 'B'),
('B006', 'Mahou', '1.47', 'B'),
('B007', 'Heineken', '2.04', 'B'),
('B008', 'Paulaner ', '2.61', 'B'),
('H001', 'Hamburguesa Basica', '2.30', 'H'),
('H002', 'Hamburguesa con Queso', '3.01', 'H'),
('H003', 'Hamburguesa Maxi', '4.21', 'H'),
('H004', 'Hamburguesa Completa', '3.90', 'H'),
('H005', 'Hamburguesa Vegana', '6.33', 'H'),
('P001', 'Pizza Barbacoa', '11.40', 'P'),
('P002', 'Pizza Oliva', '10.40', 'P'),
('P003', 'Pizza Carbonara', '12.30', 'P'),
('P004', 'Pizza Peperoni', '11.35', 'P'),
('P005', 'Pizza Napolitana', '9.98', 'P'),
('P006', 'Pizza Pimientos', '9.98', 'P'),
('E001', 'Ensalada mixta', '3.77', 'E'),
('E002', 'Ensalada Cesar', '4.77', 'E'),
('E003', 'Ensalada Caprese', '4.77', 'E'),
('F001', 'Patatas fritas', '3.75', 'F'),
('F002', 'Patatas fritas con huevo', '4.70', 'F'),
('F003', 'Pollo frito', '5.65', 'F'),
('F004', 'Nuggets de Pollo', '5.94', 'F'),
('X001', 'Helado Chocolate', '2.25', ''),
('I001', 'Spaguetti Bolognesa', '4.50', ''),
('I002', 'Macarrones Gratinados', '4.75', ''),
('I003', 'Risotto de Setas', '7.75', ''),
('I010', 'Lasaña de Verduras', '9.75', ''),
('I013', 'Canelones de Ternera', '8.75', ''),
('X020', 'Flan de la casa', '2.95', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
