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
-- Table structure for table `CFDI`
--

DROP TABLE IF EXISTS `CFDI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CFDI` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CFDI`
--

LOCK TABLES `CFDI` WRITE;
/*!40000 ALTER TABLE `CFDI` DISABLE KEYS */;
/*!40000 ALTER TABLE `CFDI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CFDIDetalle`
--

DROP TABLE IF EXISTS `CFDIDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CFDIDetalle` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CFDIDetalle`
--

LOCK TABLES `CFDIDetalle` WRITE;
/*!40000 ALTER TABLE `CFDIDetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `CFDIDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RFC` varchar(20) NOT NULL,
  `RazonSocial` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `id_Empresa` int(11) DEFAULT NULL,
  `id_Sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa`
--

DROP TABLE IF EXISTS `Empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `RFC` varchar(20) NOT NULL,
  `RazonSocial` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `id_RegimenFiscal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa`
--

LOCK TABLES `Empresa` WRITE;
/*!40000 ALTER TABLE `Empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Folios`
--

DROP TABLE IF EXISTS `Folios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Folios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Folio` varchar(20) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `Fecha` datetime DEFAULT '0000-00-00 00:00:00',
  `Usuario` varchar(50) NOT NULL,
  `id_Sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Folios`
--

LOCK TABLES `Folios` WRITE;
/*!40000 ALTER TABLE `Folios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Folios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegimenFiscal`
--

DROP TABLE IF EXISTS `RegimenFiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegimenFiscal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegimenFiscal`
--

LOCK TABLES `RegimenFiscal` WRITE;
/*!40000 ALTER TABLE `RegimenFiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `RegimenFiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sucursal`
--

DROP TABLE IF EXISTS `Sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `id_Empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sucursal`
--

LOCK TABLES `Sucursal` WRITE;
/*!40000 ALTER TABLE `Sucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sucursal` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (2,'Lorenzo','maal820513612','conocida','77028','Lorenzo Martinez Aguilar','maal8205132'),(3,'dos','maal820513612','conocida','43295','Lorenzo Martinez Aguilar','maal8205132'),(4,'ManaTips','maal820513612','conocida','43295','Lorenzo Martinez Aguilar','maal8205132');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,'AL0013970','cuenta de correo o lo que sea',3),(2,'asdwsd','Cupones más cerca de ti...',3),(5,'dsfsjfls','compras por pagar',4),(6,'AALA','sda',4);
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `second_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-29 22:46:02
