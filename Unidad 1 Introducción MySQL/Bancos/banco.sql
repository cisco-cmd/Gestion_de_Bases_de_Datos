-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 07-10-2022 a las 08:41:32
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
-- Base de datos: `banco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `DNI` varchar(9) CHARACTER SET latin1 NOT NULL,
  `Nombre` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `Direccion` varchar(70) CHARACTER SET latin1 DEFAULT NULL,
  `Localidad` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `FNac` date DEFAULT NULL,
  `Tfno` varchar(9) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`DNI`, `Nombre`, `Direccion`, `Localidad`, `FNac`, `Tfno`) VALUES
('26490761W', 'Isabel Lopez', 'C/Maria de Molina, 12', 'Baeza', '1989-01-10', '699234156'),
('26008123T', 'Maria Molina', 'Av. Cristo Rey, 3', 'Ubeda', '1975-02-17', '687302743'),
('26098234R', 'Vicente Fernandez', 'Plz. Primero de Mayo, 9', 'Ubeda', '1970-10-25', '953758722'),
('28664092D', 'Patricia Fernandez', 'C/ Nueva, 6', 'Ubeda', '1985-04-18', '619669342'),
('26567981F', 'Mario Lopez', 'Av. Libertad, 13', 'Ubeda', '1970-02-20', '600654097'),
('33490761Y', 'Maria Dolores Ruiz', 'C/Estrecha, 5', 'Torreperogil', '1969-12-09', '619661443');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
CREATE TABLE IF NOT EXISTS `cuentas` (
  `CodCuenta` varchar(10) CHARACTER SET latin1 NOT NULL,
  `Sucursal` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `DNI` varchar(9) CHARACTER SET latin1 DEFAULT NULL,
  `Saldo` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`CodCuenta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`CodCuenta`, `Sucursal`, `DNI`, `Saldo`) VALUES
('0045227710', '1239', '28664092D', '34402'),
('0045227610', '1239', '26567981F', '0'),
('9000023745', '1234', '26008123T', '3626'),
('0045864198', '1235', '26490761W', '9675'),
('9983451736', '1239', '26098234R', '-300'),
('234567891', '1234', '26567981F', '424');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE IF NOT EXISTS `sucursales` (
  `Codigo` varchar(4) CHARACTER SET latin1 NOT NULL,
  `Direccion` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `Localidad` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`Codigo`, `Direccion`, `Localidad`) VALUES
('1239', 'C/ Corredera 20', 'Ubeda'),
('1235', 'C/ Minas, 2', 'Baeza'),
('1234', 'Av. Libertad, 20', 'Ubeda'),
('1238', 'C/ Antigua, 3', 'Torreperogil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
CREATE TABLE IF NOT EXISTS `transacciones` (
  `Codigo` int(11) NOT NULL,
  `Concepto` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Cantidad` decimal(12,0) DEFAULT NULL,
  `CodCuenta` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`Codigo`, `Concepto`, `Fecha`, `Cantidad`, `CodCuenta`) VALUES
(14, 'Cargo Endesa', '2022-02-03 00:00:00', '-76', '234567891'),
(13, 'Comision Descubierto', '2022-02-02 08:09:41', '-25', '9000023745'),
(12, 'Ingreso', '2022-05-03 17:03:00', '126', '0045227710'),
(11, 'Ingreso', '2022-05-03 16:31:00', '34526', '0045227710'),
(10, 'Cargo Tarjeta', '2022-01-20 00:00:00', '-500', '9983451736'),
(9, 'Transferencia', '2022-02-20 16:23:00', '300', '234567891'),
(8, 'Recibo Seguro', '2022-02-04 00:00:00', '-150', '234567891'),
(7, 'Transferencia', '2022-02-18 00:00:00', '-1000', '9000023745'),
(6, 'Ingreso', '2022-02-17 19:00:34', '3201', '9000023745'),
(5, 'Cargo Tarjeta', '2022-02-04 19:17:00', '-250', '0045227710'),
(4, 'Transferencia', '2022-02-11 00:00:00', '5675', '0045864198'),
(3, 'Recibo Seguro', '2022-02-04 19:17:00', '1500', '9000023745'),
(2, 'Ingreso', '2022-02-03 09:12:00', '350', '234567891'),
(1, 'Ingreso', '2022-02-03 10:00:00', '200', '9983451736'),
(15, 'Comision Descubierto', '2022-02-03 19:10:53', '-25', '9000023745'),
(16, 'Comision Descubierto', '2022-02-04 09:17:07', '-25', '9000023745'),
(17, 'Loteria', '2022-04-06 00:00:00', '1000', '0045864198'),
(18, 'Bonificacion', '2022-04-06 00:00:00', '3000', '0045864198'),
(19, 'Cargo Multa DGT', '2022-04-15 03:15:00', '-120', '234567891');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
