-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: einvoices
-- ------------------------------------------------------
-- Server version	5.5.35-0+wheezy1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CFDIDetalles`
--

DROP TABLE IF EXISTS `CFDIDetalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CFDIDetalles` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CFDIDetalles`
--

LOCK TABLES `CFDIDetalles` WRITE;
/*!40000 ALTER TABLE `CFDIDetalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `CFDIDetalles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CFDIDetalles_before_insert` BEFORE INSERT ON `CFDIDetalles`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CFDIs`
--

DROP TABLE IF EXISTS `CFDIs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CFDIs` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CFDIs`
--

LOCK TABLES `CFDIs` WRITE;
/*!40000 ALTER TABLE `CFDIs` DISABLE KEYS */;
/*!40000 ALTER TABLE `CFDIs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CFDIs_before_insert` BEFORE INSERT ON `CFDIs`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CuentasBancarias`
--

DROP TABLE IF EXISTS `CuentasBancarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CuentasBancarias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cuenta` varchar(100) DEFAULT NULL,
  `Titular` varchar(200) DEFAULT NULL,
  `CLABE` varchar(200) DEFAULT NULL,
  `Tipo` varchar(100) DEFAULT NULL,
  `Observaciones` varchar(300) DEFAULT NULL,
  `Estatus` varchar(20) DEFAULT NULL,
  `Saldo` float DEFAULT NULL,
  `id_Banco` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CuentasBancarias`
--

LOCK TABLES `CuentasBancarias` WRITE;
/*!40000 ALTER TABLE `CuentasBancarias` DISABLE KEYS */;
/*!40000 ALTER TABLE `CuentasBancarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FPago`
--

DROP TABLE IF EXISTS `FPago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FPago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Clave` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Moneda` varchar(50) DEFAULT NULL,
  `id_Empresa` int(11) DEFAULT NULL,
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FPago`
--

LOCK TABLES `FPago` WRITE;
/*!40000 ALTER TABLE `FPago` DISABLE KEYS */;
/*!40000 ALTER TABLE `FPago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegimenFiscales`
--

DROP TABLE IF EXISTS `RegimenFiscales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegimenFiscales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `tenant_id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegimenFiscales`
--

LOCK TABLES `RegimenFiscales` WRITE;
/*!40000 ALTER TABLE `RegimenFiscales` DISABLE KEYS */;
/*!40000 ALTER TABLE `RegimenFiscales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `RegimenFiscales_before_insert` BEFORE INSERT ON `RegimenFiscales`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Clave` varchar(50) DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Sucursal` varchar(100) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Estatus` varchar(20) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RFC` varchar(20) NOT NULL,
  `RazonSocial` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `idcompany` int(11) DEFAULT NULL,
  `id_Sucursal` int(11) DEFAULT NULL,
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'gas9234568s3s','Grupo Asesores Sistemas y Comunicaciones S.A. de C.V.','Av. Kabah # 74 ext a PB',2,2,NULL),(2,'irving sulub','ninguno','reg 99e9e9',5,3,'HfPf2');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `clientes_before_insert` BEFORE INSERT ON `clientes`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (2,'Lorenzo','maal820513612','conocida','77028','Lorenzo Martinez Aguilar','conocida','1234','irving','tt','tt','tt','1234','1234','1234',1,1,2,1,'1234','1234','1234','1234','1234',1234,'2014-10-10','123','qDlTH','8SwwSY3TPp','qDlTH'),(3,'dos','maal820513612','conocida','43295','Lorenzo Martinez Aguilar','maal8205132',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'0Vmn7','HBHNMY1kEj','0Vmn7'),(4,'ManaTips','maal820513612','conocida','43295','Lorenzo Martinez Aguilar','maal8205132',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'IFiJc','RsIJhGVHwI','IFiJc'),(5,'manglesoft','x','x','x','xx','x','x','x','x','x','x','x','x','x',1,2,1,1,'xx','xxx','xxx','xx','xx',0,'0000-00-00','xxx','HfPf2','SVaAlnR781','HfPf2');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `companies_before_insert` BEFORE INSERT ON `companies`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cuentasxcobrar`
--

DROP TABLE IF EXISTS `cuentasxcobrar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentasxcobrar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Folio` varchar(20) DEFAULT NULL,
  `Cliente` varchar(100) DEFAULT NULL,
  `Factura` varchar(20) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Monto` float DEFAULT NULL,
  `Saldo` float DEFAULT NULL,
  `Tipo` varchar(20) DEFAULT NULL,
  `Observaciones` varchar(300) DEFAULT NULL,
  `Estatus` varchar(20) DEFAULT NULL,
  `id_Movimiento` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentasxcobrar`
--

LOCK TABLES `cuentasxcobrar` WRITE;
/*!40000 ALTER TABLE `cuentasxcobrar` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentasxcobrar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentasxpagar`
--

DROP TABLE IF EXISTS `cuentasxpagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentasxpagar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Folio` varchar(20) DEFAULT NULL,
  `Cliente` varchar(100) DEFAULT NULL,
  `Factura` varchar(20) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Concepto` varchar(300) DEFAULT NULL,
  `IVACalculado` float DEFAULT NULL,
  `Subtotal` float DEFAULT NULL,
  `Impuesto` float DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `Estatus` varchar(20) DEFAULT NULL,
  `id_Movimiento` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentasxpagar`
--

LOCK TABLES `cuentasxpagar` WRITE;
/*!40000 ALTER TABLE `cuentasxpagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentasxpagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folios`
--

DROP TABLE IF EXISTS `folios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Folio` varchar(20) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `Fecha` datetime DEFAULT '0000-00-00 00:00:00',
  `Usuario` varchar(50) NOT NULL,
  `id_Sucursal` int(11) DEFAULT NULL,
  `tenant_id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folios`
--

LOCK TABLES `folios` WRITE;
/*!40000 ALTER TABLE `folios` DISABLE KEYS */;
/*!40000 ALTER TABLE `folios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `folios_before_insert` BEFORE INSERT ON `folios`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime DEFAULT NULL,
  `Tipo` varchar(20) DEFAULT NULL,
  `Concepto` varchar(300) DEFAULT NULL,
  `Monto` float DEFAULT NULL,
  `Observaciones` varchar(300) DEFAULT NULL,
  `Estatus` varchar(20) DEFAULT NULL,
  `FPago` varchar(100) DEFAULT NULL,
  `Banco` varchar(100) DEFAULT NULL,
  `Cuenta` varchar(100) DEFAULT NULL,
  `Referencia` varchar(200) DEFAULT NULL,
  `Cheque` varchar(200) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(20) NOT NULL,
  `data` binary(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expiration` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('KZ57RiVhfRMsWHp3OJie','(dp1\nS\'user_id\'\np2\nS\'505PRKXnLg\'\np3\ns.\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','2014-02-01 08:41:07','2014-02-01 08:41:07');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `idcompany` int(11) DEFAULT NULL,
  `tenant_id` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (2,'asdas','asdas','asdasd',2,''),(3,'calle 191','calle 18','calle@gotmail.com',5,'HfPf2');
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sucursales_before_insert` BEFORE INSERT ON `sucursales`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'123','ff','ff','ff','ff','ff',0,'ff','ff','ff','ff','ff','fff','irving_sci@hotmail.com',''),(2,'2x','x','x','x','x','x',0,'x','x','x','x','x','x','x@x.com','HfPf2');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `suppliers_before_insert` BEFORE INSERT ON `suppliers`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clave` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `idcompany` int(11) NOT NULL,
  `tenant_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (7,'1234','ninguna por ahora',5,'HfPf2');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `unidades_before_insert` BEFORE INSERT ON `unidades`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) CHARACTER SET utf8 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `names` varchar(100) CHARACTER SET utf8 NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `mother_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `tenant_id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'irving_sci@hotmail.com','81dc9bdb52d04dc20036dbd8313ed055','Irving','Sulub','Chan',5,'HfPf2'),(2,'adagio@hotmail.com','81dc9bdb52d04dc20036dbd8313ed055','irving','Chan','Sulub',0,'0'),(6,'yy@yy.com','81dc9bdb52d04dc20036dbd8313ed055','yy','yyy','yy',5,'HfPf2');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `users_before_insert` BEFORE INSERT ON `users`
 FOR EACH ROW thisTrigger: BEGIN 
  IF (SUBSTRING_INDEX(USER(),'@',1) = 'root') THEN 
    LEAVE thisTrigger; 
  END IF; 
  SET new.tenant_id = SUBSTRING_INDEX(USER(),'@',1); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `vCFDIDetalles`
--

DROP TABLE IF EXISTS `vCFDIDetalles`;
/*!50001 DROP VIEW IF EXISTS `vCFDIDetalles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vCFDIDetalles` (
  `id` tinyint NOT NULL,
  `Cantidad` tinyint NOT NULL,
  `Clave` tinyint NOT NULL,
  `Concepto` tinyint NOT NULL,
  `Unidad` tinyint NOT NULL,
  `Precio` tinyint NOT NULL,
  `Importe` tinyint NOT NULL,
  `Impuesto` tinyint NOT NULL,
  `id_CFDI` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vCFDIs`
--

DROP TABLE IF EXISTS `vCFDIs`;
/*!50001 DROP VIEW IF EXISTS `vCFDIs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vCFDIs` (
  `id` tinyint NOT NULL,
  `Folio` tinyint NOT NULL,
  `Tipo` tinyint NOT NULL,
  `Estatus` tinyint NOT NULL,
  `RFC` tinyint NOT NULL,
  `RazonSocial` tinyint NOT NULL,
  `Calle` tinyint NOT NULL,
  `NoExterior` tinyint NOT NULL,
  `NoInterior` tinyint NOT NULL,
  `Colonia` tinyint NOT NULL,
  `CodigoPostal` tinyint NOT NULL,
  `Localidad` tinyint NOT NULL,
  `Municipio` tinyint NOT NULL,
  `Estado` tinyint NOT NULL,
  `Pais` tinyint NOT NULL,
  `Correo` tinyint NOT NULL,
  `Subtotal` tinyint NOT NULL,
  `Descuento` tinyint NOT NULL,
  `Impuesto` tinyint NOT NULL,
  `Total` tinyint NOT NULL,
  `MetodoPago` tinyint NOT NULL,
  `Fecha` tinyint NOT NULL,
  `Sucursal` tinyint NOT NULL,
  `Version` tinyint NOT NULL,
  `UUID` tinyint NOT NULL,
  `CSAT` tinyint NOT NULL,
  `SSAT` tinyint NOT NULL,
  `SCFDI` tinyint NOT NULL,
  `CCFDI` tinyint NOT NULL,
  `CadenaOriginal` tinyint NOT NULL,
  `FechaTimbrado` tinyint NOT NULL,
  `Expedido` tinyint NOT NULL,
  `Observaciones` tinyint NOT NULL,
  `id_Empresa` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vRegimenFiscales`
--

DROP TABLE IF EXISTS `vRegimenFiscales`;
/*!50001 DROP VIEW IF EXISTS `vRegimenFiscales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vRegimenFiscales` (
  `id` tinyint NOT NULL,
  `Nombre` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vclientes`
--

DROP TABLE IF EXISTS `vclientes`;
/*!50001 DROP VIEW IF EXISTS `vclientes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vclientes` (
  `id` tinyint NOT NULL,
  `RFC` tinyint NOT NULL,
  `RazonSocial` tinyint NOT NULL,
  `Direccion` tinyint NOT NULL,
  `idcompany` tinyint NOT NULL,
  `id_Sucursal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vcompanies`
--

DROP TABLE IF EXISTS `vcompanies`;
/*!50001 DROP VIEW IF EXISTS `vcompanies`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vcompanies` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `rfc` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `cp` tinyint NOT NULL,
  `corporateName` tinyint NOT NULL,
  `curp` tinyint NOT NULL,
  `telephone` tinyint NOT NULL,
  `legalRepresentative` tinyint NOT NULL,
  `positionlegalRepresentative` tinyint NOT NULL,
  `rfcLegalRepresentative` tinyint NOT NULL,
  `curpLegalRepresentative` tinyint NOT NULL,
  `idLegalRepresentative` tinyint NOT NULL,
  `emailLegalRepresentative` tinyint NOT NULL,
  `datasLegalRepresentative` tinyint NOT NULL,
  `taxRegime` tinyint NOT NULL,
  `labourSystem` tinyint NOT NULL,
  `financialInformation` tinyint NOT NULL,
  `supervise` tinyint NOT NULL,
  `ciecKey` tinyint NOT NULL,
  `fielKey` tinyint NOT NULL,
  `imssKey` tinyint NOT NULL,
  `digitalSignature` tinyint NOT NULL,
  `accountNumber` tinyint NOT NULL,
  `start_date` tinyint NOT NULL,
  `end_date` tinyint NOT NULL,
  `services` tinyint NOT NULL,
  `user` tinyint NOT NULL,
  `password` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vfolios`
--

DROP TABLE IF EXISTS `vfolios`;
/*!50001 DROP VIEW IF EXISTS `vfolios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vfolios` (
  `id` tinyint NOT NULL,
  `Folio` tinyint NOT NULL,
  `Tipo` tinyint NOT NULL,
  `Fecha` tinyint NOT NULL,
  `Usuario` tinyint NOT NULL,
  `id_Sucursal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vsucursales`
--

DROP TABLE IF EXISTS `vsucursales`;
/*!50001 DROP VIEW IF EXISTS `vsucursales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vsucursales` (
  `id` tinyint NOT NULL,
  `Nombre` tinyint NOT NULL,
  `Direccion` tinyint NOT NULL,
  `Correo` tinyint NOT NULL,
  `idcompany` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vsuppliers`
--

DROP TABLE IF EXISTS `vsuppliers`;
/*!50001 DROP VIEW IF EXISTS `vsuppliers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vsuppliers` (
  `id` tinyint NOT NULL,
  `rfc` tinyint NOT NULL,
  `contacto` tinyint NOT NULL,
  `noExterior` tinyint NOT NULL,
  `colonia` tinyint NOT NULL,
  `localidad` tinyint NOT NULL,
  `pais` tinyint NOT NULL,
  `cp` tinyint NOT NULL,
  `razonsocial` tinyint NOT NULL,
  `calle` tinyint NOT NULL,
  `noInterior` tinyint NOT NULL,
  `referencia` tinyint NOT NULL,
  `municipio` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vunidades`
--

DROP TABLE IF EXISTS `vunidades`;
/*!50001 DROP VIEW IF EXISTS `vunidades`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vunidades` (
  `id` tinyint NOT NULL,
  `clave` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `idcompany` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vusers`
--

DROP TABLE IF EXISTS `vusers`;
/*!50001 DROP VIEW IF EXISTS `vusers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vusers` (
  `id` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `names` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `mother_name` tinyint NOT NULL,
  `company_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vCFDIDetalles`
--

/*!50001 DROP TABLE IF EXISTS `vCFDIDetalles`*/;
/*!50001 DROP VIEW IF EXISTS `vCFDIDetalles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`irving`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vCFDIDetalles` AS select `CFDIDetalles`.`id` AS `id`,`CFDIDetalles`.`Cantidad` AS `Cantidad`,`CFDIDetalles`.`Clave` AS `Clave`,`CFDIDetalles`.`Concepto` AS `Concepto`,`CFDIDetalles`.`Unidad` AS `Unidad`,`CFDIDetalles`.`Precio` AS `Precio`,`CFDIDetalles`.`Importe` AS `Importe`,`CFDIDetalles`.`Impuesto` AS `Impuesto`,`CFDIDetalles`.`id_CFDI` AS `id_CFDI` from `CFDIDetalles` where (`CFDIDetalles`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vCFDIs`
--

/*!50001 DROP TABLE IF EXISTS `vCFDIs`*/;
/*!50001 DROP VIEW IF EXISTS `vCFDIs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`irving`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vCFDIs` AS select `CFDIs`.`id` AS `id`,`CFDIs`.`Folio` AS `Folio`,`CFDIs`.`Tipo` AS `Tipo`,`CFDIs`.`Estatus` AS `Estatus`,`CFDIs`.`RFC` AS `RFC`,`CFDIs`.`RazonSocial` AS `RazonSocial`,`CFDIs`.`Calle` AS `Calle`,`CFDIs`.`NoExterior` AS `NoExterior`,`CFDIs`.`NoInterior` AS `NoInterior`,`CFDIs`.`Colonia` AS `Colonia`,`CFDIs`.`CodigoPostal` AS `CodigoPostal`,`CFDIs`.`Localidad` AS `Localidad`,`CFDIs`.`Municipio` AS `Municipio`,`CFDIs`.`Estado` AS `Estado`,`CFDIs`.`Pais` AS `Pais`,`CFDIs`.`Correo` AS `Correo`,`CFDIs`.`Subtotal` AS `Subtotal`,`CFDIs`.`Descuento` AS `Descuento`,`CFDIs`.`Impuesto` AS `Impuesto`,`CFDIs`.`Total` AS `Total`,`CFDIs`.`MetodoPago` AS `MetodoPago`,`CFDIs`.`Fecha` AS `Fecha`,`CFDIs`.`Sucursal` AS `Sucursal`,`CFDIs`.`Version` AS `Version`,`CFDIs`.`UUID` AS `UUID`,`CFDIs`.`CSAT` AS `CSAT`,`CFDIs`.`SSAT` AS `SSAT`,`CFDIs`.`SCFDI` AS `SCFDI`,`CFDIs`.`CCFDI` AS `CCFDI`,`CFDIs`.`CadenaOriginal` AS `CadenaOriginal`,`CFDIs`.`FechaTimbrado` AS `FechaTimbrado`,`CFDIs`.`Expedido` AS `Expedido`,`CFDIs`.`Observaciones` AS `Observaciones`,`CFDIs`.`id_Empresa` AS `id_Empresa` from `CFDIs` where (`CFDIs`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vRegimenFiscales`
--

/*!50001 DROP TABLE IF EXISTS `vRegimenFiscales`*/;
/*!50001 DROP VIEW IF EXISTS `vRegimenFiscales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`irving`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vRegimenFiscales` AS select `RegimenFiscales`.`id` AS `id`,`RegimenFiscales`.`Nombre` AS `Nombre` from `RegimenFiscales` where (`RegimenFiscales`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vclientes`
--

/*!50001 DROP TABLE IF EXISTS `vclientes`*/;
/*!50001 DROP VIEW IF EXISTS `vclientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`irving`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vclientes` AS select `clientes`.`id` AS `id`,`clientes`.`RFC` AS `RFC`,`clientes`.`RazonSocial` AS `RazonSocial`,`clientes`.`Direccion` AS `Direccion`,`clientes`.`idcompany` AS `idcompany`,`clientes`.`id_Sucursal` AS `id_Sucursal` from `clientes` where (`clientes`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vcompanies`
--

/*!50001 DROP TABLE IF EXISTS `vcompanies`*/;
/*!50001 DROP VIEW IF EXISTS `vcompanies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`irving`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vcompanies` AS select `companies`.`id` AS `id`,`companies`.`name` AS `name`,`companies`.`rfc` AS `rfc`,`companies`.`address` AS `address`,`companies`.`cp` AS `cp`,`companies`.`corporateName` AS `corporateName`,`companies`.`curp` AS `curp`,`companies`.`telephone` AS `telephone`,`companies`.`legalRepresentative` AS `legalRepresentative`,`companies`.`positionlegalRepresentative` AS `positionlegalRepresentative`,`companies`.`rfcLegalRepresentative` AS `rfcLegalRepresentative`,`companies`.`curpLegalRepresentative` AS `curpLegalRepresentative`,`companies`.`idLegalRepresentative` AS `idLegalRepresentative`,`companies`.`emailLegalRepresentative` AS `emailLegalRepresentative`,`companies`.`datasLegalRepresentative` AS `datasLegalRepresentative`,`companies`.`taxRegime` AS `taxRegime`,`companies`.`labourSystem` AS `labourSystem`,`companies`.`financialInformation` AS `financialInformation`,`companies`.`supervise` AS `supervise`,`companies`.`ciecKey` AS `ciecKey`,`companies`.`fielKey` AS `fielKey`,`companies`.`imssKey` AS `imssKey`,`companies`.`digitalSignature` AS `digitalSignature`,`companies`.`accountNumber` AS `accountNumber`,`companies`.`start_date` AS `start_date`,`companies`.`end_date` AS `end_date`,`companies`.`services` AS `services`,`companies`.`user` AS `user`,`companies`.`password` AS `password` from `companies` where (`companies`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vfolios`
--

/*!50001 DROP TABLE IF EXISTS `vfolios`*/;
/*!50001 DROP VIEW IF EXISTS `vfolios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`irving`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vfolios` AS select `folios`.`id` AS `id`,`folios`.`Folio` AS `Folio`,`folios`.`Tipo` AS `Tipo`,`folios`.`Fecha` AS `Fecha`,`folios`.`Usuario` AS `Usuario`,`folios`.`id_Sucursal` AS `id_Sucursal` from `folios` where (`folios`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vsucursales`
--

/*!50001 DROP TABLE IF EXISTS `vsucursales`*/;
/*!50001 DROP VIEW IF EXISTS `vsucursales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`irving`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vsucursales` AS select `sucursales`.`id` AS `id`,`sucursales`.`Nombre` AS `Nombre`,`sucursales`.`Direccion` AS `Direccion`,`sucursales`.`Correo` AS `Correo`,`sucursales`.`idcompany` AS `idcompany` from `sucursales` where (`sucursales`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vsuppliers`
--

/*!50001 DROP TABLE IF EXISTS `vsuppliers`*/;
/*!50001 DROP VIEW IF EXISTS `vsuppliers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`irving`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vsuppliers` AS select `suppliers`.`id` AS `id`,`suppliers`.`rfc` AS `rfc`,`suppliers`.`contacto` AS `contacto`,`suppliers`.`noExterior` AS `noExterior`,`suppliers`.`colonia` AS `colonia`,`suppliers`.`localidad` AS `localidad`,`suppliers`.`pais` AS `pais`,`suppliers`.`cp` AS `cp`,`suppliers`.`razonsocial` AS `razonsocial`,`suppliers`.`calle` AS `calle`,`suppliers`.`noInterior` AS `noInterior`,`suppliers`.`referencia` AS `referencia`,`suppliers`.`municipio` AS `municipio`,`suppliers`.`estado` AS `estado`,`suppliers`.`email` AS `email` from `suppliers` where (`suppliers`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vunidades`
--

/*!50001 DROP TABLE IF EXISTS `vunidades`*/;
/*!50001 DROP VIEW IF EXISTS `vunidades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`irving`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vunidades` AS select `unidades`.`id` AS `id`,`unidades`.`clave` AS `clave`,`unidades`.`description` AS `description`,`unidades`.`idcompany` AS `idcompany` from `unidades` where (`unidades`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vusers`
--

/*!50001 DROP TABLE IF EXISTS `vusers`*/;
/*!50001 DROP VIEW IF EXISTS `vusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`irving`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vusers` AS select `users`.`id` AS `id`,`users`.`email` AS `email`,`users`.`password` AS `password`,`users`.`names` AS `names`,`users`.`last_name` AS `last_name`,`users`.`mother_name` AS `mother_name`,`users`.`company_id` AS `company_id` from `users` where (`users`.`tenant_id` = convert(substring_index(user(),'@',1) using latin1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-26 13:29:06
