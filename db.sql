-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 11-02-2014 a las 04:33:51
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `einvoices`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CFDIDetalles`
--

CREATE TABLE IF NOT EXISTS `CFDIDetalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cantidad` int(11) NOT NULL,
  `Clave` varchar(30) NOT NULL,
  `Concepto` varchar(100) DEFAULT NULL,
  `Unidad` varchar(20) DEFAULT NULL,
  `Precio` int(11) NOT NULL,
  `Importe` int(11) NOT NULL,
  `Impuesto` int(11) NOT NULL,
  `id_CFDI` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CFDIs`
--

CREATE TABLE IF NOT EXISTS `CFDIs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Folio` varchar(20) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `Estatus` varchar(20) DEFAULT NULL,
  `RFC` varchar(20) NOT NULL,
  `RazonSocial` varchar(100) NOT NULL,
  `Calle` varchar(100) NOT NULL,
  `NoExterior` varchar(20) DEFAULT NULL,
  `NoInterior` varchar(20) DEFAULT NULL,
  `Colonia` varchar(100) DEFAULT NULL,
  `CodigoPostal` int(11) DEFAULT NULL,
  `Localidad` varchar(100) DEFAULT NULL,
  `Municipio` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  `Pais` varchar(100) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Subtotal` int(11) DEFAULT NULL,
  `Descuento` int(11) DEFAULT NULL,
  `Impuesto` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  `MetodoPago` varchar(50) DEFAULT NULL,
  `Fecha` datetime DEFAULT '0000-00-00 00:00:00',
  `Sucursal` varchar(100) DEFAULT NULL,
  `Version` varchar(10) DEFAULT NULL,
  `UUID` varchar(40) DEFAULT NULL,
  `CSAT` varchar(20) DEFAULT NULL,
  `SSAT` varchar(200) DEFAULT NULL,
  `SCFDI` varchar(200) DEFAULT NULL,
  `CCFDI` varchar(20) DEFAULT NULL,
  `CadenaOriginal` varchar(300) DEFAULT NULL,
  `FechaTimbrado` datetime DEFAULT '0000-00-00 00:00:00',
  `Expedido` varchar(100) DEFAULT NULL,
  `Observaciones` text,
  `id_Empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RFC` varchar(20) NOT NULL,
  `RazonSocial` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `idcompany` int(11) DEFAULT NULL,
  `id_Sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `RFC`, `RazonSocial`, `Direccion`, `idcompany`, `id_Sucursal`) VALUES
(1, 'gas9234568s3s', 'Grupo Asesores Sistemas y Comunicaciones S.A. de C.V.', 'Av. Kabah # 74 ext a PB', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `corporateName` varchar(100) DEFAULT NULL,
  `curp` varchar(45) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `legalRepresentative` varchar(150) DEFAULT NULL,
  `positionlegalRepresentative` varchar(200) DEFAULT NULL,
  `rfcLegalRepresentative` varchar(20) DEFAULT NULL,
  `curpLegalRepresentative` varchar(20) DEFAULT NULL,
  `idLegalRepresentative` varchar(50) DEFAULT NULL,
  `emailLegalRepresentative` varchar(70) DEFAULT NULL,
  `datasLegalRepresentative` varchar(500) DEFAULT NULL,
  `taxRegime` int(11) DEFAULT NULL,
  `labourSystem` int(11) DEFAULT NULL,
  `financialInformation` int(11) DEFAULT NULL,
  `supervise` int(11) DEFAULT NULL,
  `ciecKey` varchar(250) DEFAULT NULL,
  `fielKey` varchar(200) DEFAULT NULL,
  `imssKey` varchar(200) DEFAULT NULL,
  `digitalSignature` varchar(250) DEFAULT NULL,
  `accountNumber` varchar(40) DEFAULT NULL,
  `start_date` int(11) NOT NULL,
  `end_date` date DEFAULT NULL,
  `services` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `name`, `rfc`, `address`, `cp`, `corporateName`, `curp`, `telephone`, `legalRepresentative`, `positionlegalRepresentative`, `rfcLegalRepresentative`, `curpLegalRepresentative`, `idLegalRepresentative`, `emailLegalRepresentative`, `datasLegalRepresentative`, `taxRegime`, `labourSystem`, `financialInformation`, `supervise`, `ciecKey`, `fielKey`, `imssKey`, `digitalSignature`, `accountNumber`, `start_date`, `end_date`, `services`) VALUES
(2, 'Lorenzo', 'maal820513612', 'conocida', '77028', 'Lorenzo Martinez Aguilar', 'conocida', '1234', 'irving', 'tt', 'tt', 'tt', '1234', '1234', '1234', 1, 1, 2, 1, '1234', '1234', '1234', '1234', '1234', 1234, '2014-10-10', '123'),
(3, 'dos', 'maal820513612', 'conocida', '43295', 'Lorenzo Martinez Aguilar', 'maal8205132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(4, 'ManaTips', 'maal820513612', 'conocida', '43295', 'Lorenzo Martinez Aguilar', 'maal8205132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `folios`
--

CREATE TABLE IF NOT EXISTS `folios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Folio` varchar(20) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `Fecha` datetime DEFAULT '0000-00-00 00:00:00',
  `Usuario` varchar(50) NOT NULL,
  `id_Sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RegimenFiscales`
--

CREATE TABLE IF NOT EXISTS `RegimenFiscales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(20) NOT NULL,
  `data` binary(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expiration` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `data`, `date`, `expiration`) VALUES
('KZ57RiVhfRMsWHp3OJie', '(dp1\nS''user_id''\np2\nS''505PRKXnLg''\np3\ns.\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2014-02-01 08:41:07', '2014-02-01 08:41:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE IF NOT EXISTS `sucursales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `idcompany` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `Nombre`, `Direccion`, `Correo`, `idcompany`) VALUES
(2, 'asdas', 'asdas', 'asdasd', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rfc` varchar(45) NOT NULL,
  `contacto` varchar(45) DEFAULT NULL,
  `noExterior` varchar(20) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `cp` int(10) unsigned DEFAULT NULL,
  `razonsocial` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `noInterior` varchar(20) DEFAULT NULL,
  `referencia` varchar(45) NOT NULL,
  `municipio` varchar(25) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`id`, `rfc`, `contacto`, `noExterior`, `colonia`, `localidad`, `pais`, `cp`, `razonsocial`, `calle`, `noInterior`, `referencia`, `municipio`, `estado`, `email`) VALUES
(1, '123', 'ff', 'ff', 'ff', 'ff', 'ff', 0, 'ff', 'ff', 'ff', 'ff', 'ff', 'fff', 'irving_sci@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE IF NOT EXISTS `unidades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clave` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `idcompany` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `clave`, `description`, `idcompany`) VALUES
(1, 'AL0013970', 'cuenta de correo o lo que sea', 2),
(2, 'asdwsd', 'Cupones más cerca de ti...', 3),
(5, 'dsfsjfls', 'compras por pagar', 4),
(6, 'AALA', 'sda', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) CHARACTER SET utf8 NOT NULL,
  `password` mediumtext CHARACTER SET utf8 NOT NULL,
  `names` varchar(100) CHARACTER SET utf8 NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `mother_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `names`, `last_name`, `mother_name`) VALUES
(1, 'irving_sci@hotmail.com', '1234', 'Irving', 'Sulub', 'Chan'),
(2, 'irving.sci@gmail.com', '90b0cfe1e13b2f9e0c2908b448400c47', 'irving', 'Chan', 'Sulub');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
