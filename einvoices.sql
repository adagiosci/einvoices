-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 11-03-2014 a las 05:36:21
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
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Disparadores `CFDIDetalles`
--
DROP TRIGGER IF EXISTS `CFDIDetalles_before_insert`;
DELIMITER //
CREATE TRIGGER `CFDIDetalles_before_insert` BEFORE INSERT ON `CFDIDetalles`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END
//
DELIMITER ;

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
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Disparadores `CFDIs`
--
DROP TRIGGER IF EXISTS `CFDIs_before_insert`;
DELIMITER //
CREATE TRIGGER `CFDIs_before_insert` BEFORE INSERT ON `CFDIs`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RFC` varchar(20) NOT NULL,
  `RazonSocial` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `id_Sucursal` int(11) DEFAULT NULL,
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `RFC`, `RazonSocial`, `Direccion`, `company_id`, `id_Sucursal`, `tenant_id`) VALUES
(1, 'gas9234568s3s', 'Grupo Asesores Sistemas y Comunicaciones S.A. de C.V.', 'Av. Kabah # 74 ext a PB', 2, 2, NULL),
(2, 'irving sulub', 'ninguno', 'reg 99e9e9', 5, 3, 'HfPf2'),
(3, 'x', 'x', 'x', 6, 4, 'rsJ8W');

--
-- Disparadores `clientes`
--
DROP TRIGGER IF EXISTS `clientes_before_insert`;
DELIMITER //
CREATE TRIGGER `clientes_before_insert` BEFORE INSERT ON `clientes`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END
//
DELIMITER ;

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
  `user` varchar(10) NOT NULL,
  `group` enum('Admin','Cliente') NOT NULL,
  `password` varchar(10) NOT NULL,
  `tenant_id` varchar(10) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `name`, `rfc`, `address`, `cp`, `corporateName`, `curp`, `telephone`, `legalRepresentative`, `positionlegalRepresentative`, `rfcLegalRepresentative`, `curpLegalRepresentative`, `idLegalRepresentative`, `emailLegalRepresentative`, `datasLegalRepresentative`, `taxRegime`, `labourSystem`, `financialInformation`, `supervise`, `ciecKey`, `fielKey`, `imssKey`, `digitalSignature`, `accountNumber`, `start_date`, `end_date`, `services`, `user`, `group`, `password`, `tenant_id`) VALUES
(2, 'Lorenzo', 'maal820513612', 'conocida', '77028', 'Lorenzo Martinez Aguilar', 'conocida', '1234', 'irving', 'tt', 'tt', 'tt', '1234', '1234', '1234', 18, 18, 18, 18, '1234', '1234', '1234', '1234', '1234', 1234, '2014-10-10', '123', 'qDlTH', 'Cliente', '8SwwSY3TPp', 'qDlTH'),
(3, 'dos', 'maal820513612', 'conocida', '43295', 'Lorenzo Martinez Aguilar', 'maal8205132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '0Vmn7', 'Cliente', 'HBHNMY1kEj', '0Vmn7'),
(4, 'ManaTips', 'maal820513612', 'conocida', '43295', 'Lorenzo Martinez Aguilar', 'maal8205132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'IFiJc', 'Cliente', 'RsIJhGVHwI', 'IFiJc'),
(5, 'manglesoft', 'x', 'x', 'x', 'xx', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 1, 2, 1, 1, 'xx', 'xxx', 'xxx', 'xx', 'xx', 0, '0000-00-00', 'xxx', 'HfPf2', 'Admin', '1234', 'HfPf2'),
(6, 'irvingx', 'irving', 'irving', 'irving', 'irving', 'irving', 'irving', '133', 'irving', 'iriving', '133', 'irving', 'irving.sci566@hotmail.com', '1222', 0, 0, 0, 0, '1233', '1222', '1222', '122', '1212', 1212, '0000-00-00', '12212', 'rsJ8W', 'Cliente', 'Z6W2udw97y', 'rsJ8W');

--
-- Disparadores `companies`
--
DROP TRIGGER IF EXISTS `companies_before_insert`;
DELIMITER //
CREATE TRIGGER `companies_before_insert` BEFORE INSERT ON `companies`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END
//
DELIMITER ;

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
  `tenant_id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Disparadores `folios`
--
DROP TRIGGER IF EXISTS `folios_before_insert`;
DELIMITER //
CREATE TRIGGER `folios_before_insert` BEFORE INSERT ON `folios`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission` varchar(200) NOT NULL,
  `value` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `user_id`, `permission`, `value`) VALUES
(1, 2, '/unidades', 0),
(3, 2, '/suppliers', 0),
(4, 2, '/clients', 0),
(5, 2, '/sucursales', 0),
(6, 2, '/users', 1),
(7, 2, '/companies', 0),
(8, 2, '/companies/edit', 1),
(9, 2, '/users/password', 0),
(10, 2, '/users/create', 1),
(11, 2, '/users/update', 1),
(12, 2, '/users/delete', 1),
(13, 2, '/companies/create', 1),
(14, 2, '/companies/update', 1),
(15, 2, '/companies/delete', 1),
(16, 2, '/users/changepassword', 1),
(17, 2, '/unidades/create', 0),
(18, 2, '/unidades/update', 0),
(19, 2, '/unidades/delete', 0),
(20, 2, '/suppliers/create', 0),
(21, 2, '/suppliers/update', 0),
(22, 2, '/suppliers/delete', 0),
(23, 2, '/clients/create', 0),
(24, 2, '/clients/update', 0),
(25, 2, '/clients/delete', 0),
(26, 2, '/sucursales/create', 0),
(27, 2, '/sucursales/update', 0),
(28, 2, '/sucursales/delete', 0),
(29, 1, '/unidades', 0),
(30, 1, '/unidades/create', 0),
(31, 1, '/unidades/update', 0),
(32, 1, '/unidades/delete', 0),
(33, 1, '/suppliers', 0),
(34, 1, '/suppliers/create', 0),
(35, 1, '/suppliers/update', 0),
(36, 1, '/suppliers/delete', 0),
(37, 1, '/clients', 0),
(38, 1, '/clients/create', 0),
(39, 1, '/clients/update', 0),
(40, 1, '/clients/delete', 0),
(41, 1, '/sucursales', 0),
(42, 1, '/sucursales/create', 0),
(43, 1, '/sucursales/update', 0),
(44, 1, '/sucursales/delete', 0),
(45, 1, '/users', 0),
(46, 1, '/users/create', 1),
(47, 1, '/users/update', 1),
(48, 1, '/users/delete', 1),
(54, 1, '/users/password', 0),
(55, 1, '/users/changepassword', 1),
(56, 1, '/companies', 0),
(57, 1, '/companies/create', 1),
(58, 1, '/companies/update', 1),
(59, 1, '/companies/delete', 1),
(60, 1, '/companies/edit', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RegimenFiscales`
--

CREATE TABLE IF NOT EXISTS `RegimenFiscales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `tenant_id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Disparadores `RegimenFiscales`
--
DROP TRIGGER IF EXISTS `RegimenFiscales_before_insert`;
DELIMITER //
CREATE TRIGGER `RegimenFiscales_before_insert` BEFORE INSERT ON `RegimenFiscales`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(20) NOT NULL,
  `data` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expiration` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `data`, `date`, `expiration`) VALUES
('j0TZyKu3eiJYCSuXLHOq', 'a:2:{s:7:"user_id";i:2;s:10:"company_id";s:1:"2";}', '2014-03-11 05:13:42', '2014-03-11 05:10:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE IF NOT EXISTS `sucursales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `tenant_id` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `Nombre`, `Direccion`, `Correo`, `company_id`, `tenant_id`) VALUES
(2, 'asdas', 'asdas', 'asdasd', 2, ''),
(3, 'calle 191', 'calle 18', 'calle@gotmail.com', 5, 'HfPf2'),
(4, 'Reg 96', 'cancun', 'irving.sci@hotmail.com', 6, 'rsJ8W');

--
-- Disparadores `sucursales`
--
DROP TRIGGER IF EXISTS `sucursales_before_insert`;
DELIMITER //
CREATE TRIGGER `sucursales_before_insert` BEFORE INSERT ON `sucursales`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END
//
DELIMITER ;

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
  `tenant_id` varchar(5) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`id`, `rfc`, `contacto`, `noExterior`, `colonia`, `localidad`, `pais`, `cp`, `razonsocial`, `calle`, `noInterior`, `referencia`, `municipio`, `estado`, `email`, `tenant_id`, `company_id`) VALUES
(1, '123', 'ff', 'ff', 'ff', 'ff', 'ff', 0, 'ff', 'ff', 'ff', 'ff', 'ff', 'fff', 'irving_sci@hotmail.com', '', 2),
(2, '2x', 'x', 'x', 'x', 'x', 'x', 0, 'x', 'x', 'x', 'x', 'x', 'x', 'x@x.com', 'HfPf2', 2);

--
-- Disparadores `suppliers`
--
DROP TRIGGER IF EXISTS `suppliers_before_insert`;
DELIMITER //
CREATE TRIGGER `suppliers_before_insert` BEFORE INSERT ON `suppliers`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE IF NOT EXISTS `unidades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clave` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `company_id` int(11) NOT NULL,
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `clave`, `description`, `company_id`, `tenant_id`) VALUES
(7, '1234', 'ninguna por ahora', 5, 'HfPf2'),
(8, 's', 's', 6, 'rsJ8W'),
(9, 'x', 'x', 2, 'irvin');

--
-- Disparadores `unidades`
--
DROP TRIGGER IF EXISTS `unidades_before_insert`;
DELIMITER //
CREATE TRIGGER `unidades_before_insert` BEFORE INSERT ON `unidades`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) CHARACTER SET utf8 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `names` varchar(100) CHARACTER SET utf8 NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `mother_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `tenant_id` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `names`, `last_name`, `mother_name`, `company_id`, `tenant_id`) VALUES
(1, 'irving_sci@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Irving', 'Sulub', 'Chan', 5, 'HfPf2'),
(2, 'adagio@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'irving', 'Chan', 'Sulub', 5, 'HfPf2'),
(6, 'yy@yy.com', '81dc9bdb52d04dc20036dbd8313ed055', 'yy', 'yyy', 'yy', 5, 'HfPf2'),
(18, 'irving_sci2@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'irving', 'sulub', 'chan', 2, 'qDlTH'),
(21, 'prueba@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', 'prueba', 'prueba', 'prueba', 6, 'rsJ8W'),
(22, 'isulub@zaviatravel.com', '81dc9bdb52d04dc20036dbd8313ed055', 'irving', 'sulub', 'chan', 6, 'rsJ8W');

--
-- Disparadores `users`
--
DROP TRIGGER IF EXISTS `users_before_insert`;
DELIMITER //
CREATE TRIGGER `users_before_insert` BEFORE INSERT ON `users`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END
//
DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
