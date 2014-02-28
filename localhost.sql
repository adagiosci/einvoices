-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-02-2014 a las 02:25:15
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
CREATE DATABASE `einvoices` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `einvoices`;

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
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RFC` varchar(20) NOT NULL,
  `RazonSocial` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `idcompany` int(11) DEFAULT NULL,
  `id_Sucursal` int(11) DEFAULT NULL,
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `RFC`, `RazonSocial`, `Direccion`, `idcompany`, `id_Sucursal`, `tenant_id`) VALUES
(1, 'gas9234568s3s', 'Grupo Asesores Sistemas y Comunicaciones S.A. de C.V.', 'Av. Kabah # 74 ext a PB', 2, 2, NULL),
(2, 'irving sulub', 'ninguno', 'reg 99e9e9', 5, 3, 'HfPf2');

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
  `user` varchar(5) NOT NULL,
  `password` varchar(10) NOT NULL,
  `tenant_id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `name`, `rfc`, `address`, `cp`, `corporateName`, `curp`, `telephone`, `legalRepresentative`, `positionlegalRepresentative`, `rfcLegalRepresentative`, `curpLegalRepresentative`, `idLegalRepresentative`, `emailLegalRepresentative`, `datasLegalRepresentative`, `taxRegime`, `labourSystem`, `financialInformation`, `supervise`, `ciecKey`, `fielKey`, `imssKey`, `digitalSignature`, `accountNumber`, `start_date`, `end_date`, `services`, `user`, `password`, `tenant_id`) VALUES
(2, 'Lorenzo', 'maal820513612', 'conocida', '77028', 'Lorenzo Martinez Aguilar', 'conocida', '1234', 'irving', 'tt', 'tt', 'tt', '1234', '1234', '1234', 1, 1, 2, 1, '1234', '1234', '1234', '1234', '1234', 1234, '2014-10-10', '123', 'qDlTH', '8SwwSY3TPp', 'qDlTH'),
(3, 'dos', 'maal820513612', 'conocida', '43295', 'Lorenzo Martinez Aguilar', 'maal8205132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '0Vmn7', 'HBHNMY1kEj', '0Vmn7'),
(4, 'ManaTips', 'maal820513612', 'conocida', '43295', 'Lorenzo Martinez Aguilar', 'maal8205132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'IFiJc', 'RsIJhGVHwI', 'IFiJc'),
(5, 'manglesoft', 'x', 'x', 'x', 'xx', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 1, 2, 1, 1, 'xx', 'xxx', 'xxx', 'xx', 'xx', 0, '0000-00-00', 'xxx', 'HfPf2', 'SVaAlnR781', 'HfPf2');

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
  `tenant_id` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `Nombre`, `Direccion`, `Correo`, `idcompany`, `tenant_id`) VALUES
(2, 'asdas', 'asdas', 'asdasd', 2, ''),
(3, 'calle 191', 'calle 18', 'calle@gotmail.com', 5, 'HfPf2');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`id`, `rfc`, `contacto`, `noExterior`, `colonia`, `localidad`, `pais`, `cp`, `razonsocial`, `calle`, `noInterior`, `referencia`, `municipio`, `estado`, `email`, `tenant_id`) VALUES
(1, '123', 'ff', 'ff', 'ff', 'ff', 'ff', 0, 'ff', 'ff', 'ff', 'ff', 'ff', 'fff', 'irving_sci@hotmail.com', ''),
(2, '2x', 'x', 'x', 'x', 'x', 'x', 0, 'x', 'x', 'x', 'x', 'x', 'x', 'x@x.com', 'HfPf2');

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
  `idcompany` int(11) NOT NULL,
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `clave`, `description`, `idcompany`, `tenant_id`) VALUES
(7, '1234', 'ninguna por ahora', 5, 'HfPf2');

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
  `tenant_id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `names`, `last_name`, `mother_name`, `company_id`, `tenant_id`) VALUES
(1, 'irving_sci@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Irving', 'Sulub', 'Chan', 5, 'HfPf2'),
(2, 'adagio@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'irving', 'Chan', 'Sulub', 0, '0'),
(6, 'yy@yy.com', '81dc9bdb52d04dc20036dbd8313ed055', 'yy', 'yyy', 'yy', 5, 'HfPf2');

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

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vCFDIDetalles`
--
CREATE TABLE IF NOT EXISTS `vCFDIDetalles` (
`id` int(11)
,`Cantidad` int(11)
,`Clave` varchar(30)
,`Concepto` varchar(100)
,`Unidad` varchar(20)
,`Precio` int(11)
,`Importe` int(11)
,`Impuesto` int(11)
,`id_CFDI` int(11)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vCFDIs`
--
CREATE TABLE IF NOT EXISTS `vCFDIs` (
`id` int(11)
,`Folio` varchar(20)
,`Tipo` varchar(20)
,`Estatus` varchar(20)
,`RFC` varchar(20)
,`RazonSocial` varchar(100)
,`Calle` varchar(100)
,`NoExterior` varchar(20)
,`NoInterior` varchar(20)
,`Colonia` varchar(100)
,`CodigoPostal` int(11)
,`Localidad` varchar(100)
,`Municipio` varchar(100)
,`Estado` varchar(100)
,`Pais` varchar(100)
,`Correo` varchar(50)
,`Subtotal` int(11)
,`Descuento` int(11)
,`Impuesto` int(11)
,`Total` int(11)
,`MetodoPago` varchar(50)
,`Fecha` datetime
,`Sucursal` varchar(100)
,`Version` varchar(10)
,`UUID` varchar(40)
,`CSAT` varchar(20)
,`SSAT` varchar(200)
,`SCFDI` varchar(200)
,`CCFDI` varchar(20)
,`CadenaOriginal` varchar(300)
,`FechaTimbrado` datetime
,`Expedido` varchar(100)
,`Observaciones` text
,`id_Empresa` int(11)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vRegimenFiscales`
--
CREATE TABLE IF NOT EXISTS `vRegimenFiscales` (
`id` int(11)
,`Nombre` varchar(50)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vclientes`
--
CREATE TABLE IF NOT EXISTS `vclientes` (
`id` int(11)
,`RFC` varchar(20)
,`RazonSocial` varchar(100)
,`Direccion` varchar(100)
,`idcompany` int(11)
,`id_Sucursal` int(11)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vcompanies`
--
CREATE TABLE IF NOT EXISTS `vcompanies` (
`id` int(11)
,`name` varchar(150)
,`rfc` varchar(45)
,`address` varchar(250)
,`cp` varchar(10)
,`corporateName` varchar(100)
,`curp` varchar(45)
,`telephone` varchar(15)
,`legalRepresentative` varchar(150)
,`positionlegalRepresentative` varchar(200)
,`rfcLegalRepresentative` varchar(20)
,`curpLegalRepresentative` varchar(20)
,`idLegalRepresentative` varchar(50)
,`emailLegalRepresentative` varchar(70)
,`datasLegalRepresentative` varchar(500)
,`taxRegime` int(11)
,`labourSystem` int(11)
,`financialInformation` int(11)
,`supervise` int(11)
,`ciecKey` varchar(250)
,`fielKey` varchar(200)
,`imssKey` varchar(200)
,`digitalSignature` varchar(250)
,`accountNumber` varchar(40)
,`start_date` int(11)
,`end_date` date
,`services` varchar(100)
,`user` varchar(5)
,`password` varchar(10)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vfolios`
--
CREATE TABLE IF NOT EXISTS `vfolios` (
`id` int(11)
,`Folio` varchar(20)
,`Tipo` varchar(20)
,`Fecha` datetime
,`Usuario` varchar(50)
,`id_Sucursal` int(11)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vsucursales`
--
CREATE TABLE IF NOT EXISTS `vsucursales` (
`id` int(11)
,`Nombre` varchar(100)
,`Direccion` varchar(100)
,`Correo` varchar(50)
,`idcompany` int(11)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vsuppliers`
--
CREATE TABLE IF NOT EXISTS `vsuppliers` (
`id` int(10) unsigned
,`rfc` varchar(45)
,`contacto` varchar(45)
,`noExterior` varchar(20)
,`colonia` varchar(45)
,`localidad` varchar(45)
,`pais` varchar(45)
,`cp` int(10) unsigned
,`razonsocial` varchar(45)
,`calle` varchar(45)
,`noInterior` varchar(20)
,`referencia` varchar(45)
,`municipio` varchar(25)
,`estado` varchar(25)
,`email` varchar(45)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vunidades`
--
CREATE TABLE IF NOT EXISTS `vunidades` (
`id` int(10) unsigned
,`clave` varchar(20)
,`description` text
,`idcompany` int(11)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vusers`
--
CREATE TABLE IF NOT EXISTS `vusers` (
`id` int(10) unsigned
,`email` varchar(45)
,`password` varchar(100)
,`names` varchar(100)
,`last_name` varchar(100)
,`mother_name` varchar(100)
,`company_id` int(11)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `vCFDIDetalles`
--
DROP TABLE IF EXISTS `vCFDIDetalles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`irving`@`localhost` SQL SECURITY INVOKER VIEW `vCFDIDetalles` AS select `CFDIDetalles`.`id` AS `id`,`CFDIDetalles`.`Cantidad` AS `Cantidad`,`CFDIDetalles`.`Clave` AS `Clave`,`CFDIDetalles`.`Concepto` AS `Concepto`,`CFDIDetalles`.`Unidad` AS `Unidad`,`CFDIDetalles`.`Precio` AS `Precio`,`CFDIDetalles`.`Importe` AS `Importe`,`CFDIDetalles`.`Impuesto` AS `Impuesto`,`CFDIDetalles`.`id_CFDI` AS `id_CFDI` from `CFDIDetalles` where (`CFDIDetalles`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1));

-- --------------------------------------------------------

--
-- Estructura para la vista `vCFDIs`
--
DROP TABLE IF EXISTS `vCFDIs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`irving`@`localhost` SQL SECURITY INVOKER VIEW `vCFDIs` AS select `CFDIs`.`id` AS `id`,`CFDIs`.`Folio` AS `Folio`,`CFDIs`.`Tipo` AS `Tipo`,`CFDIs`.`Estatus` AS `Estatus`,`CFDIs`.`RFC` AS `RFC`,`CFDIs`.`RazonSocial` AS `RazonSocial`,`CFDIs`.`Calle` AS `Calle`,`CFDIs`.`NoExterior` AS `NoExterior`,`CFDIs`.`NoInterior` AS `NoInterior`,`CFDIs`.`Colonia` AS `Colonia`,`CFDIs`.`CodigoPostal` AS `CodigoPostal`,`CFDIs`.`Localidad` AS `Localidad`,`CFDIs`.`Municipio` AS `Municipio`,`CFDIs`.`Estado` AS `Estado`,`CFDIs`.`Pais` AS `Pais`,`CFDIs`.`Correo` AS `Correo`,`CFDIs`.`Subtotal` AS `Subtotal`,`CFDIs`.`Descuento` AS `Descuento`,`CFDIs`.`Impuesto` AS `Impuesto`,`CFDIs`.`Total` AS `Total`,`CFDIs`.`MetodoPago` AS `MetodoPago`,`CFDIs`.`Fecha` AS `Fecha`,`CFDIs`.`Sucursal` AS `Sucursal`,`CFDIs`.`Version` AS `Version`,`CFDIs`.`UUID` AS `UUID`,`CFDIs`.`CSAT` AS `CSAT`,`CFDIs`.`SSAT` AS `SSAT`,`CFDIs`.`SCFDI` AS `SCFDI`,`CFDIs`.`CCFDI` AS `CCFDI`,`CFDIs`.`CadenaOriginal` AS `CadenaOriginal`,`CFDIs`.`FechaTimbrado` AS `FechaTimbrado`,`CFDIs`.`Expedido` AS `Expedido`,`CFDIs`.`Observaciones` AS `Observaciones`,`CFDIs`.`id_Empresa` AS `id_Empresa` from `CFDIs` where (`CFDIs`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1));

-- --------------------------------------------------------

--
-- Estructura para la vista `vRegimenFiscales`
--
DROP TABLE IF EXISTS `vRegimenFiscales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`irving`@`localhost` SQL SECURITY INVOKER VIEW `vRegimenFiscales` AS select `RegimenFiscales`.`id` AS `id`,`RegimenFiscales`.`Nombre` AS `Nombre` from `RegimenFiscales` where (`RegimenFiscales`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1));

-- --------------------------------------------------------

--
-- Estructura para la vista `vclientes`
--
DROP TABLE IF EXISTS `vclientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`irving`@`localhost` SQL SECURITY INVOKER VIEW `vclientes` AS select `clientes`.`id` AS `id`,`clientes`.`RFC` AS `RFC`,`clientes`.`RazonSocial` AS `RazonSocial`,`clientes`.`Direccion` AS `Direccion`,`clientes`.`idcompany` AS `idcompany`,`clientes`.`id_Sucursal` AS `id_Sucursal` from `clientes` where (`clientes`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1));

-- --------------------------------------------------------

--
-- Estructura para la vista `vcompanies`
--
DROP TABLE IF EXISTS `vcompanies`;

CREATE ALGORITHM=UNDEFINED DEFINER=`irving`@`localhost` SQL SECURITY INVOKER VIEW `vcompanies` AS select `companies`.`id` AS `id`,`companies`.`name` AS `name`,`companies`.`rfc` AS `rfc`,`companies`.`address` AS `address`,`companies`.`cp` AS `cp`,`companies`.`corporateName` AS `corporateName`,`companies`.`curp` AS `curp`,`companies`.`telephone` AS `telephone`,`companies`.`legalRepresentative` AS `legalRepresentative`,`companies`.`positionlegalRepresentative` AS `positionlegalRepresentative`,`companies`.`rfcLegalRepresentative` AS `rfcLegalRepresentative`,`companies`.`curpLegalRepresentative` AS `curpLegalRepresentative`,`companies`.`idLegalRepresentative` AS `idLegalRepresentative`,`companies`.`emailLegalRepresentative` AS `emailLegalRepresentative`,`companies`.`datasLegalRepresentative` AS `datasLegalRepresentative`,`companies`.`taxRegime` AS `taxRegime`,`companies`.`labourSystem` AS `labourSystem`,`companies`.`financialInformation` AS `financialInformation`,`companies`.`supervise` AS `supervise`,`companies`.`ciecKey` AS `ciecKey`,`companies`.`fielKey` AS `fielKey`,`companies`.`imssKey` AS `imssKey`,`companies`.`digitalSignature` AS `digitalSignature`,`companies`.`accountNumber` AS `accountNumber`,`companies`.`start_date` AS `start_date`,`companies`.`end_date` AS `end_date`,`companies`.`services` AS `services`,`companies`.`user` AS `user`,`companies`.`password` AS `password` from `companies` where (`companies`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1));

-- --------------------------------------------------------

--
-- Estructura para la vista `vfolios`
--
DROP TABLE IF EXISTS `vfolios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`irving`@`localhost` SQL SECURITY INVOKER VIEW `vfolios` AS select `folios`.`id` AS `id`,`folios`.`Folio` AS `Folio`,`folios`.`Tipo` AS `Tipo`,`folios`.`Fecha` AS `Fecha`,`folios`.`Usuario` AS `Usuario`,`folios`.`id_Sucursal` AS `id_Sucursal` from `folios` where (`folios`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1));

-- --------------------------------------------------------

--
-- Estructura para la vista `vsucursales`
--
DROP TABLE IF EXISTS `vsucursales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`irving`@`localhost` SQL SECURITY INVOKER VIEW `vsucursales` AS select `sucursales`.`id` AS `id`,`sucursales`.`Nombre` AS `Nombre`,`sucursales`.`Direccion` AS `Direccion`,`sucursales`.`Correo` AS `Correo`,`sucursales`.`idcompany` AS `idcompany` from `sucursales` where (`sucursales`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1));

-- --------------------------------------------------------

--
-- Estructura para la vista `vsuppliers`
--
DROP TABLE IF EXISTS `vsuppliers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`irving`@`localhost` SQL SECURITY INVOKER VIEW `vsuppliers` AS select `suppliers`.`id` AS `id`,`suppliers`.`rfc` AS `rfc`,`suppliers`.`contacto` AS `contacto`,`suppliers`.`noExterior` AS `noExterior`,`suppliers`.`colonia` AS `colonia`,`suppliers`.`localidad` AS `localidad`,`suppliers`.`pais` AS `pais`,`suppliers`.`cp` AS `cp`,`suppliers`.`razonsocial` AS `razonsocial`,`suppliers`.`calle` AS `calle`,`suppliers`.`noInterior` AS `noInterior`,`suppliers`.`referencia` AS `referencia`,`suppliers`.`municipio` AS `municipio`,`suppliers`.`estado` AS `estado`,`suppliers`.`email` AS `email` from `suppliers` where (`suppliers`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1));

-- --------------------------------------------------------

--
-- Estructura para la vista `vunidades`
--
DROP TABLE IF EXISTS `vunidades`;

CREATE ALGORITHM=UNDEFINED DEFINER=`irving`@`localhost` SQL SECURITY INVOKER VIEW `vunidades` AS select `unidades`.`id` AS `id`,`unidades`.`clave` AS `clave`,`unidades`.`description` AS `description`,`unidades`.`idcompany` AS `idcompany` from `unidades` where (`unidades`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1));

-- --------------------------------------------------------

--
-- Estructura para la vista `vusers`
--
DROP TABLE IF EXISTS `vusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`irving`@`localhost` SQL SECURITY INVOKER VIEW `vusers` AS select `users`.`id` AS `id`,`users`.`email` AS `email`,`users`.`password` AS `password`,`users`.`names` AS `names`,`users`.`last_name` AS `last_name`,`users`.`mother_name` AS `mother_name`,`users`.`company_id` AS `company_id` from `users` where (`users`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
