-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 02-02-2014 a las 01:57:47
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
(2, 'Lorenzo', 'maal820513612', 'conocida', '77028', 'Lorenzo Martinez Aguilar', 'conocida', '1234', '1', 'tt', 'tt', 'tt', '1234', '1234', '1234', 1, 1, 1, 1234, '1234', '1234', '1234', '1234', '1234', 1234, '0000-00-00', '1234'),
(3, 'dos', 'maal820513612', 'conocida', '43295', 'Lorenzo Martinez Aguilar', 'maal8205132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(4, 'ManaTips', 'maal820513612', 'conocida', '43295', 'Lorenzo Martinez Aguilar', 'maal8205132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
