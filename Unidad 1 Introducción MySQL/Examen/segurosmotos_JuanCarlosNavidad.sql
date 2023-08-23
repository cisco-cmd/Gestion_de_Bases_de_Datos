-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 05-12-2022 a las 12:07:38
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
-- Base de datos: `segurosmotos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentes`
--

DROP TABLE IF EXISTS `agentes`;
CREATE TABLE IF NOT EXISTS `agentes` (
  `idagente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `fingreso` date NOT NULL,
  PRIMARY KEY (`idagente`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `agentes`
--

INSERT INTO `agentes` (`idagente`, `Nombre`, `fingreso`) VALUES
(1, 'Angel Ruiz', '2020-12-07'),
(2, 'Francisca Moreno', '2020-11-02'),
(3, 'Oscar Rubio', '2021-12-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idcli` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `tfno` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  `fnac` date NOT NULL,
  `fcarnet` date NOT NULL,
  `tipocarnet` enum('AM','A1','A2','A') COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idcli`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcli`, `nombre`, `tfno`, `fnac`, `fcarnet`, `tipocarnet`) VALUES
(1, 'Isabel Lopez', '699234156', '1989-01-10', '2010-02-26', 'A'),
(2, 'Maria Molina', '602234157', '1970-12-09', '1990-09-30', 'A'),
(3, 'Vicente Fernandez', '609234158', '1980-01-28', '2005-06-20', 'A1'),
(4, 'Patricia Fernandez', '619234159', '1995-05-14', '2015-11-06', 'A'),
(5, 'Mario Lopez', '629234160', '1999-09-19', '2022-02-15', 'A2'),
(6, 'Maria Dolores Ruiz', '659234161', '2002-12-24', '2021-12-29', 'A'),
(7, 'Samuel Ruiz', '603665183', '1997-07-04', '2019-08-29', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientescp`
--

DROP TABLE IF EXISTS `clientescp`;
CREATE TABLE IF NOT EXISTS `clientescp` (
  `idcli` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `tfno` varchar(9) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fnac` date NOT NULL,
  `fcarnet` date NOT NULL,
  `tipocarnet` enum('AM','A1','A2','A') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientescp`
--

INSERT INTO `clientescp` (`idcli`, `nombre`, `tfno`, `fnac`, `fcarnet`, `tipocarnet`) VALUES
(3, 'Vicente Fernandez', '609234158', '1980-01-28', '2005-06-20', 'A1'),
(5, 'Mario Lopez', '629234160', '1999-09-19', '2022-02-15', 'A2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motos`
--

DROP TABLE IF EXISTS `motos`;
CREATE TABLE IF NOT EXISTS `motos` (
  `matricula` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `modelo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `potencia` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  PRIMARY KEY (`matricula`),
  KEY `idcliente` (`idcliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `motos`
--

INSERT INTO `motos` (`matricula`, `marca`, `modelo`, `potencia`, `anio`, `idcliente`) VALUES
('1137KNK', 'BMW', 'F 750 GS', 77, 2020, 7),
('2200LLS', 'Ducati', 'MultiStrada V4', 170, 2021, 1),
('0212LZD', 'Honda', 'NT1100', 102, 2022, 6),
('9190LSS', 'Triumph', 'Tiger 1200', 150, 2021, 2),
('5055LRZ', 'Harley Davidson', 'Pan America 1250', 150, 2021, 4),
('2210KSS', 'Kymco', 'Agility City 125', 9, 2019, 3),
('0035LBB', 'Honda', '500 CBX', 47, 2021, 5),
('3456LCC', 'Yamaha', 'T-Max', 47, 2022, 5),
('2535LTV', 'Yamaha', 'Tracer 9 GT', 120, 2021, 7),
('0101KNG', 'BMW', 'R 1200 GS', 120, 2018, 7),
('2345MKS', 'Yamaha', 'Scorpio', 150, 2019, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motoscp`
--

DROP TABLE IF EXISTS `motoscp`;
CREATE TABLE IF NOT EXISTS `motoscp` (
  `matricula` varchar(8) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `marca` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `modelo` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `potencia` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `motoscp`
--

INSERT INTO `motoscp` (`matricula`, `marca`, `modelo`, `potencia`, `anio`, `idcliente`) VALUES
('2210KSS', 'Kymco', 'Agility City 125', 9, 2019, 3),
('0035LBB', 'Honda', '500 CBX', 47, 2021, 5),
('3456LCC', 'Yamaha', 'T-Max', 47, 2022, 5),
('2345MKS', 'Yamaha', 'Scorpio', 150, 2019, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polizas`
--

DROP TABLE IF EXISTS `polizas`;
CREATE TABLE IF NOT EXISTS `polizas` (
  `idpoliza` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
  `idagente` int(11) NOT NULL,
  `finicio` date NOT NULL,
  `ffin` date NOT NULL,
  `tipo` enum('TER','TRI','TERR','TRIF') COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idpoliza`),
  KEY `tipo` (`tipo`),
  KEY `idagente` (`idagente`),
  KEY `matricula` (`matricula`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `polizas`
--

INSERT INTO `polizas` (`idpoliza`, `matricula`, `idagente`, `finicio`, `ffin`, `tipo`) VALUES
(1, '1137KNK', 1, '2022-06-01', '2023-06-01', 'TRI'),
(2, '2200LLS', 2, '2022-06-15', '2023-06-15', 'TRIF'),
(3, '0212LZD', 1, '2022-03-01', '2023-03-01', 'TER'),
(4, '9190LSS', 3, '2022-09-15', '2023-09-15', 'TERR'),
(5, '5055LRZ', 3, '2022-02-01', '2023-02-01', 'TRI'),
(6, '2210KSS', 2, '2022-03-10', '2023-03-10', 'TERR'),
(7, '0035LBB', 3, '2022-10-01', '2023-10-01', 'TRIF'),
(8, '3456LCC', 2, '2022-02-12', '2023-02-12', 'TERR'),
(9, '2345MKS', 3, '2022-12-05', '2022-12-07', 'TRI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polizascp`
--

DROP TABLE IF EXISTS `polizascp`;
CREATE TABLE IF NOT EXISTS `polizascp` (
  `idpoliza` int(11) NOT NULL DEFAULT '0',
  `matricula` varchar(8) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `idagente` int(11) NOT NULL,
  `finicio` date NOT NULL,
  `ffin` date NOT NULL,
  `tipo` enum('TER','TRI','TERR','TRIF') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `polizascp`
--

INSERT INTO `polizascp` (`idpoliza`, `matricula`, `idagente`, `finicio`, `ffin`, `tipo`) VALUES
(1, '1137KNK', 1, '2022-06-01', '2023-06-01', 'TRI'),
(2, '2200LLS', 2, '2022-06-15', '2023-06-15', 'TRIF'),
(3, '0212LZD', 1, '2022-03-01', '2023-03-01', 'TER'),
(4, '9190LSS', 3, '2022-09-15', '2023-09-15', 'TERR'),
(5, '5055LRZ', 3, '2022-02-01', '2023-02-01', 'TRI'),
(6, '2210KSS', 2, '2022-03-10', '2023-03-10', 'TERR'),
(7, '0035LBB', 3, '2022-10-01', '2023-10-01', 'TRIF'),
(8, '3456LCC', 2, '2022-02-12', '2023-02-12', 'TERR'),
(9, '2345MKS', 3, '2022-12-05', '2022-12-07', 'TRI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopoliza`
--

DROP TABLE IF EXISTS `tipopoliza`;
CREATE TABLE IF NOT EXISTS `tipopoliza` (
  `idtipo` varchar(4) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipopoliza`
--

INSERT INTO `tipopoliza` (`idtipo`, `descripcion`, `precio`) VALUES
('TER', 'Terceros', 80),
('TERR', 'Terceros + Robo', 120),
('TRI', 'Todo Riesgo', 400),
('TRIF', 'Todo Riesgo con fran', 260);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
