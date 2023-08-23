-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 26-09-2022 a las 09:49:06
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
-- Base de datos: `deportes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artículos`
--

DROP TABLE IF EXISTS `artículos`;
CREATE TABLE IF NOT EXISTS `artículos` (
  `CodArt` varchar(4) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripción` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `PrecioCompra` decimal(6,0) NOT NULL,
  `PVP` decimal(6,0) NOT NULL,
  `FechaCompra` date NOT NULL,
  `Stock` int(11) NOT NULL,
  `Proveedor` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`CodArt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `artículos`
--

INSERT INTO `artículos` (`CodArt`, `Descripción`, `PrecioCompra`, `PVP`, `FechaCompra`, `Stock`, `Proveedor`) VALUES
('H003', 'Raqueta Head Graphene Xt Prestige', '56', '205', '2020-12-12', -13, 'HEA'),
('A020', 'Chanclas Hombre Adilette', '4', '25', '2019-07-15', 6, 'ADI'),
('H002', 'Pala Padel Head Evolution', '19', '56', '2020-12-12', 6, 'HEA'),
('A103', 'Gorra con visera', '2', '15', '2019-03-15', 12, 'ADI'),
('J004', 'Camiseta Termica Negra L', '2', '9', '2019-09-30', 14, 'JOM'),
('J008', 'Chaqueton Snow Negro XL', '39', '117', '2019-10-30', 2, 'NIK'),
('N001', 'Zapatillas Running 40-43', '24', '70', '2019-06-15', 3, 'NIK'),
('N010', 'Zapatillas Basket 44-46', '22', '66', '2019-06-15', 2, 'NIK'),
('R504', 'Malla Gimnasio Mujer', '6', '18', '2019-08-15', 7, 'REE'),
('R512', 'Calcetines Unisex 38-42 P', '1', '6', '2020-10-09', 7, 'REE'),
('H020', 'Pala Padel Head Omega Pro', '38', '100', '2020-12-12', 3, 'HEA'),
('M010', 'Mizuno Wave Unitus 4', '39', '65', '2019-11-28', 0, 'MIZ'),
('N002', 'Chandal Nike Rojo', '29', '59', '2020-10-30', 6, 'NIK'),
('H100', 'Zapatilla Head Revolt Pro', '23', '94', '2020-12-12', 7, 'HEA'),
('R222', 'Pack Calcetines Rebook', '2', '9', '2022-08-22', 25, 'REE'),
('R223', 'Chandal Rebook Blanco', '25', '100', '2022-08-22', 6, 'REE'),
('R220', 'Chandal Rebook Gris', '25', '90', '2022-08-22', 2, 'REE'),
('R221', 'Chandal Rebook Negro', '25', '100', '2022-08-22', 5, 'REE'),
('R224', 'Chandal Rebook Rojo', '25', '90', '2022-08-22', 6, 'REE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `CodCli` varchar(4) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaNac` date NOT NULL,
  `Tfno` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`CodCli`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`CodCli`, `Nombre`, `FechaNac`, `Tfno`) VALUES
('2478', 'Jesus Martinez', '1982-10-16', '600875920'),
('2648', 'Felix Avila', '2000-05-25', '619625586'),
('2656', 'Mario Lopez', '1990-11-01', '953758722'),
('2678', 'Ana Rodriguez', '1970-10-16', '619500487'),
('2700', 'Carmen Matinez', '1985-07-11', '619669335'),
('2866', 'Patricia Fernandez', '2000-09-19', '602557441'),
('2985', 'Carlos Martinez', '2001-04-18', '625879954'),
('3387', 'Violeta Ruiz', '2000-09-03', '687558905'),
('2245', 'Cristobal Cano', '1970-10-15', '666789003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `Código` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripción` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `Tfno` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  `Web` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Código`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`Código`, `Descripción`, `Tfno`, `Web`) VALUES
('HEA', 'Head', '610123456', 'www.head.com'),
('ADI', 'Adidas', '917788221', 'www.adidas.es'),
('JOM', 'Joma', '912345098', 'www.joma.es'),
('NIK', 'Nike', '930101010', 'www.nike.com/es'),
('REE', 'Reebok', '911098567', 'www.rebook.es'),
('MIZ', 'Mizuno', '936128027', 'www.mizuno.com'),
('FIL', 'Fila', '951887654', 'www.fila.com'),
('CON', 'Converse', '666854792', 'www.converse.com'),
('NBA', 'New Balance', '666666666', 'www.newbalance.es'),
('ASI', 'Asics', '912987654', 'www.asics.es'),
('PUM', 'Puma', '917652918', 'www.puma.es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `CodCli` varchar(4) COLLATE utf8_spanish2_ci NOT NULL,
  `CodArt` varchar(4) COLLATE utf8_spanish2_ci NOT NULL,
  `Unidades` int(11) NOT NULL,
  `Descuento` decimal(5,2) NOT NULL,
  `FechaVenta` datetime NOT NULL,
  PRIMARY KEY (`CodCli`,`CodArt`,`FechaVenta`),
  KEY `CodArt` (`CodArt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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
