-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-01-2014 a las 16:46:12
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `swissportii`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aerolineas`
--

CREATE TABLE IF NOT EXISTS `aerolineas` (
  `idaerolinea` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_iata` varchar(2) NOT NULL,
  `Nombre_general` varchar(100) DEFAULT NULL,
  `Cod_oaci` varchar(3) DEFAULT NULL,
  `direccion_general` varchar(250) DEFAULT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `telefono_general` varchar(45) DEFAULT NULL,
  `nombre_contacto` varchar(100) DEFAULT NULL,
  `telefono_contacto` varchar(25) DEFAULT NULL,
  `email_contacto` varchar(45) DEFAULT NULL,
  `direccion_contacto` varchar(250) DEFAULT NULL,
  `direccion_facturacion` varchar(250) DEFAULT NULL,
  `telefono_facturacion` varchar(25) DEFAULT NULL,
  `email_facturacion` varchar(45) DEFAULT NULL,
  `vigencia_inicia` date DEFAULT NULL,
  `vigencia_finaliza` date DEFAULT NULL,
  `Nombre_facturacion` varchar(200) DEFAULT NULL,
  `contrato` enum('si','no') NOT NULL DEFAULT 'no',
  `rampa` enum('si','no') NOT NULL DEFAULT 'no',
  `servicio` enum('si','no') NOT NULL DEFAULT 'no',
  `despacho` enum('si','no') NOT NULL DEFAULT 'no',
  `mantenimiento` enum('si','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`idaerolinea`),
  UNIQUE KEY `Cod_iata_UNIQUE` (`Cod_iata`),
  UNIQUE KEY `Cod_iata` (`Cod_iata`),
  UNIQUE KEY `Cod_iata_2` (`Cod_iata`),
  UNIQUE KEY `Cod_oaci` (`Cod_oaci`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Volcado de datos para la tabla `aerolineas`
--

INSERT INTO `aerolineas` (`idaerolinea`, `Cod_iata`, `Nombre_general`, `Cod_oaci`, `direccion_general`, `estado`, `telefono_general`, `nombre_contacto`, `telefono_contacto`, `email_contacto`, `direccion_contacto`, `direccion_facturacion`, `telefono_facturacion`, `email_facturacion`, `vigencia_inicia`, `vigencia_finaliza`, `Nombre_facturacion`, `contrato`, `rampa`, `servicio`, `despacho`, `mantenimiento`) VALUES
(22, 'AE', 'AIR ITALY', 'AEY', 'C.SO SEMPIONE 111, 21013 GALLARATE VA, ITALY', 'Activo', '00 39 033121148', 'MICHELE CIMELLI', '00 39 033121148', 'michele.cimelli@airitaly.it', 'C.so Sempione 111, 21013 Gallarate VA Italy', 'C.SO SEMPIONE 111, 21013 GALLARATE VA, ITALY', '00 39 033121148', 'michele.cimelli@airitaly.it', '2008-11-01', '2013-12-31', 'AIR ITALY', 'si', 'si', 'no', 'si', 'no'),
(23, 'AA', 'ALLEGIANT AIR', 'AAY', '8360 S. Durango Drive, Las Vegas NV. 89113', 'Inactivo', '001 702 8534612', 'Laura Gomez', '8920389', 'laurag@interlinklas.com', 'Av Tulum, Plaza Mexico local 22, Cancun Q. Roo', '8360 S. Durango Drive, Las Vegas, NV. 891123', '001 702 8534612', 'kristina.mercado@allegiantair.com', '2010-12-01', '2011-12-31', 'ALLEGIANT AIR', 'si', 'si', 'no', 'si', 'no'),
(24, 'BE', 'AIR BERLIN GROUP', 'BER', 'SAATWINKLER DAMM 42-43, 13627 BERLIN, GERMANY', 'Activo', '00 49 211 94188', 'MIRIAM SCHMIDT', '00 49 211 94188', 'miriam.schmidt@airberlin.com', 'Flughafen Halle 8 40474, Dusseldorf, Germany', 'SAATWINKLER DAMM 42-43, 13627 BERLIN, GERMANY', '00 49 211 94188', '', '2009-10-01', '2015-09-30', 'AIR BERLIN PLC & CO LUFTVERKEHRS KG', 'si', 'si', 'no', 'si', 'no'),
(25, 'DE', 'CONDOR', 'CFG', '104 SOUTH WALNUT ST, ITASCA IL', 'Activo', '0016304678113', 'RONALD LINDNER', '0016304678113', 'rli@condor.de', '104 SOUTH WALNUT ST, ITASCA IL', '104 SOUTH WALNUT ST, ITASCA IL', '0016305678113', 'isabel@condor.de', '2011-04-28', '2013-04-29', 'CONDOR FLUGDIENST GMBH', 'si', 'si', 'si', 'si', 'no'),
(26, 'AM', 'AMERIFLIGHT', 'AMF', 'AV SANTA FE 505 20TH FLOOR, COL. SANTA CRUZ MANCA, SANTA FE, MEXICO', 'Activo', '55 21079200', 'ARMANDO MUñOZ', '55 21079200', 'iccscun@prodigy.net.mx', 'Av Santa Fe 505 20th Floor, Col. Santa Cruz Manca, santa Fe, Mexico', 'AV SANTA FE 505 PISO 20, COL. SANTA CRUZ MANCA, SANTA FE. MÃ©XICO', '55 21079200', 'iccscun@prodigy.net.mx', '2010-12-01', '2014-12-01', 'INTERNATIONAL CORPORATE & CARGO SERVICES, SA DE CV', 'si', 'si', 'no', 'si', 'no'),
(27, 'BP', 'BLUE PANORAMA', 'BPA', 'VALLE DELLE ARTI, 123 - PAL. D 00054 FIUMICINO - ROMA -. ITALY', 'Activo', '00 06 65508737', 'ROSANNA SANGALLI', '8872869', 'rosannasangalli@blue-panorama.com', 'Blvd Luis Donaldo Colosio, Punta Tulum ofic. 3 Planta Alta, Cancun', 'VALLE DELLE ARTI, 123 - PAL. D 00054 FIUMICINO - ROMA - ITALY', '00 06 65508737', '', '2003-07-01', '2013-12-31', 'BLUE PANORAMA AIRLINES SPA', 'si', 'si', 'no', 'si', 'no'),
(28, 'CM', 'COPA AIRLINES', 'CMP', 'BUSINESS PARK, NORTH TOWER, COSTA DEL ESTE, PANAMA CITY, REPUBLICA DE PANAMá', 'Activo', '8860652', 'LINA ESQUIVEL', '8860652', 'lesquivel@copaair.com', 'Aeropuerto Internacional de Cancun T2', 'BUSINESS PARK, NORTH TOWER, COSTA DEL ESTE, PANAMA CITY, REPUBLICA DE PANAMá', '8860652', '', '2005-11-01', '2013-08-31', 'COMPAÑíA PANAMEÑA DE AVIACIóN S.A.', 'si', 'si', 'no', 'si', 'no'),
(29, 'CS', 'CZECH AIRLINES(CSA)', 'CSA', 'Ruzyne Airport, 160 08 Prague 6, Czech Republic', 'Inactivo', '00 420 220 1161', 'Dagmar Vnukova', '00 420 220 1161', 'dagmar.vnukova@csa.cz', 'Ruzine Airport, 160 08 Prague 6, Czech Republic', 'Ruzine Airport, 160 08 Prague 6, Czech republic', '00 420 220 1161', '', '2008-12-31', '2011-12-31', 'Czech Airlines j.s.c', 'si', 'si', 'no', 'si', 'no'),
(31, 'ED', 'EDELWEISS', 'EDW', 'CH-8058 ZüRICH-FLUGHAFEN, SWITZERLAND', 'Activo', '00 41 43 816506', 'CHRISTIAN GFELLER', '00 41 43 816506', 'christian.gfeller@edelweissair.com.ch', 'CH-8058 Zürich-Flughafen, Switzerland', 'CH-8058 ZüRICH-FLUGHAFEN, SWITZERLAND', '00 41 43 816506', 'krisztina.cser@edelweissair.ch; petra.bachman', '2003-04-01', '2013-12-31', 'EDELWEISS AIR', 'si', 'si', 'no', 'si', 'no'),
(32, 'DM', 'GLOBAL AIR', 'DMJ', 'RIO TIBER S/N COL CUAHUTEMOC, MEXICO D.F', 'Activo', '01 55 55887484', 'RAUL MARTINEZ', '01 55 55887484', 'globalcancun@hotmail.com', 'RÃ­o Tiber Col Cuahutemoc, Mexico D.F', 'RIO TIBER, COL. CUAHUTEMOC, MEXICO D.F.', '01 55 55887484', 'globalcancun@hotmail.com', '2006-07-01', '2013-11-30', 'GLOBAL AIR', 'si', 'si', 'no', 'si', 'no'),
(33, 'FA', 'FALCON AIR', 'FAO', 'xx', 'Inactivo', 'xx', 'xx', 'xx', 'xx@xx.com', 'xx', 'xx', 'xx', 'xx@xx.com', '0000-00-00', '0000-00-00', 'FALCON AIR', 'no', 'si', 'no', 'si', 'no'),
(34, 'FI', 'FINNAIR', 'FIN', 'P.O. BOX 15. FI-01053 FINNAIR, FINLAND', 'Activo', '00 358 9 818582', 'JARI KERVINEN', '00 358 9 818582', 'jari.kervinen@finnair.com', 'P.O Box 15, FI-01053 Finnair, Finland', 'P.O. BOX 15, FI-01053 FINNAIR, FINLAND', '00 358 9 818582', '', '2005-11-01', '2013-10-31', 'FINNAIR', 'si', 'si', 'no', 'si', 'no'),
(35, 'GW', 'USA3000', 'GWY', '335 Bishop Hollow Road, Newtown Square, PA 19073', 'Inactivo', '8819551', 'Mario Maldonado', '9987348221', 'amaldona@usa3000.com', 'Aeropuerto Internacional de Cancun T3', '335 Bishop Hollow Road, Newtown Square, PA 19073', '9987348221', '', '2007-10-01', '2011-09-30', 'Brendan Airways LLC d/b/a USA 3000 Airlines', 'si', 'si', 'no', 'si', 'no'),
(36, 'HI', 'STARSHIP', 'HIP', 'xx', 'Inactivo', 'xx', 'xx', 'xx', 'xx@xx.com', 'xx', 'xx', 'xx', 'xx@xx.com', '0000-00-00', '0000-00-00', ' STARSHIP', 'no', 'si', 'no', 'si', 'no'),
(37, 'JB', 'JET BLUE', 'JBU', '118-29 QUEENS BOULEVARD, FOREST HILLS, NEW YORK 11375 USA', 'Activo', '001 718 2867900', 'OMAR YUEN', '8860645', 'omar.yuen@jetblue.com', 'Aeropuerto Internacional de Cancun T2', '118-29 QUEENS BOULEVARD, FOREST HILLS, NEW YORK 11375 U.S.A.', '001 718 2867900', 'geithel.walker@jetblue.com', '2007-09-15', '2013-12-31', 'JET BLUE AIRWAYS CORPORATION', 'si', 'si', 'no', 'si', 'no'),
(38, 'LA', 'LATAM AIRLINES GROUP', 'LAN', 'AV AMERICO VESPUCIO NO. 901, RENCA, SANTIAGO DE CHILE', 'Activo', '998 8860360/61', 'HILDA SALAZAR', '8860360/61', 'hilda.salazar@lan.com', 'Aeropuerto Internacional de Cancun T2', 'IGNACIO RAMíREZ NO. 20 DESP. 302, COLONIA TABACALERA, 06030 MéXICO D.F.', '8860360/61', '', '2005-09-01', '2013-08-31', 'LAN AIRLINES S.A.', 'si', 'si', 'no', 'si', 'no'),
(39, 'PC', 'AEROLINEAS PRINCIPAL DE CHILE SA', 'PCP', 'SAN SEBASTIAN NO. 2839, OFICINA 611, COMUNA DE LOS CONDES, SANTIAGO DE CHILE', 'Activo', '00 562 5960119', 'VJERA SALVO', '00 562 5960119', 'v.salvo@palair.cl', 'San Sebastian No. 2839, Oficina 611, Comuna de los Condes, Santiago de Chile', 'SAN SEBASTIAN NO. 2839, OFICINA 611, COMUNA DE LOS CONDES, SANTIAGO DE CHILE', '00 562 5960119', 'victor.budini@srtc.cl', '2008-01-01', '2013-12-31', 'AEROLINEAS PRINCIPAL DE CHILE SA', 'si', 'si', 'no', 'si', 'no'),
(40, 'MP', 'MARTIN AIR', 'MPH', 'Havenmeesterweg 201, 1118CD, Schiphol Airport, The Netherlands', 'Inactivo', '998 8860943', 'Jose Luis Gomez', '998 8860943', 'jose.gomez@martinair.com', 'Aeropuerto Internacional de Cancun T2', 'Havenmeesterweg 201, 1118CD, Schiphol Airport, The Netherlands', '998 8860943', '', '2008-02-01', '2011-10-14', 'MARTINAIR HOLLAND N.V.', 'si', 'si', 'no', 'si', 'no'),
(41, 'RC', 'REGIONAL CARGO', 'RCQ', 'Aeropuerto Internacional de Queretaro Bodega 9 y 10 Carr Estatal 200 CP 76270 Carr Queretaro-Tequisquiapan No. 22500 Colón, Queretaro, México', 'Inactivo', '01 4423142036', 'Juan manuel Rodríguez Anza', '01 4423142036', '', 'Aeropuerto Internacional de Queretaro Bodega 9 y 10 Carr Estatal 200 CP 76270 Carr Queretaro-Tequisquiapan No. 22500 ColÃ³n, Queretaro, MÃ©xico', 'Aeropuerto Internacional de Queretaro Bodega 9 y 10 Carr Estatal 200 CP 76270 Carr Queretaro-Tequisquiapan No. 22500 Colón, Queretaro, México', '01 4423142036', '', '2008-09-15', '2011-10-31', 'AEROLINEAS REGIONALES SA DE CV', 'si', 'si', 'no', 'si', 'no'),
(42, 'RP', 'AEROREPUBLICA', 'RPB', 'AV EL DORADO, ENTRADA 1 TERMINAL AéREO SIMóN BOLíVAR, BOGOTá, COLOMBIA', 'Activo', '00 571 3578088', 'LINA ESQUIVEL', '8860652', 'lesquivel@copaair.com', 'Aeropuerto Internacional de Cancun T2', 'AV EL DORADO, ENTRADA 1 TERMINAL AéREO SIMóN BOLíVAR, BOGOTá, COLOMBIA', '8860652', '', '2010-12-01', '2013-12-01', 'AEROREPUBLICA', 'si', 'si', 'no', 'si', 'no'),
(43, 'SG', 'SKY KING', 'SGB', 'xx', 'Inactivo', 'xx', 'xx', 'xx', 'xx@xx.com', 'xx', 'xx', 'xx', 'xx@xx.com', '0000-00-00', '0000-00-00', 'SKY KING', 'no', 'si', 'no', 'si', 'no'),
(44, 'SK', 'SKY AIRLINES', 'SKU', 'xx', 'Inactivo', 'xx', 'xx', 'xx', 'xx@xx.com', 'xx', 'xx', 'xx', 'xx@xx.com', '0000-00-00', '0000-00-00', 'SKY AIRLINES', 'no', 'si', 'no', 'si', 'no'),
(45, 'TC', 'TACA', 'TAI', 'EDIFICIO LACSA, LA URUCA, SAN JOSé COSTA RICA', 'Activo', '998 8860243', 'DIONICIO MOCTEZUMA', '998 8860243', 'dionicio.arce@aviancataca.com', 'Aeropuerto Internacional de Cancun T2', 'EDIFICIO LACSA, LA URUCA, SAN JOSé COSTA RICA', '998 8860243', '', '2008-12-01', '2013-12-30', 'LINEAS AEREAS COSTARRICENSES, SA', 'si', 'si', 'no', 'si', 'no'),
(46, 'FL', 'AIR TRAN', 'TRS', '9955 AIR TRAN BLVD. ORLANDO, FL 32827', 'Activo', '407 3185310', 'CATHY MILES', '407 3185310', 'cathy.miles@airtran.com', '9955 AIR TRAN BLVD ORLANDO, FL 32827', '9955 Ar Tran Blvd Orlando, FL 32827', '4073185310', 'cathy.miles@airtran.com', '2010-05-27', '2013-03-20', 'AirTran Airways Inc.', 'si', 'si', 'no', 'si', 'no'),
(47, 'TS', 'GULF AND CARIBBEAN FOR FED', 'TSU', 'AV SANTA FE 505 20TH FLOOR, COL. SANTA CRUZ MANCA, SANTA FE, MEXICO', 'Activo', '55 21079200', 'ARMANDO MUñOZ', '55 21079200', 'iccscun@prodigy.net.mx', 'Av Santa Fe 505 20th Floor, Col. Santa Cruz Manca, santa Fe, Mexico', 'AV SANTA FE 505 PISO 20, COL. SANTA CRUZ MANCA, SANTA FE. MÃ©XICO', '55 21079200', '', '2008-04-01', '2013-12-31', 'GULF AND CARIBBEAN FOR FED', 'si', 'si', 'no', 'si', 'no'),
(48, 'US', 'US AIRWAYS', 'USA', '111 WEST RIO SALADO PARKWAY, TEMPE, AZ 85281', 'Activo', '001 480 6935929', 'FERNANDO RUESGA', '8860451', 'fernando.ruesga@usairways.com', 'Aeropuerto Internacional de Cancun T3', '111 WEST RIO SALADO PARKWAY, TEMPE, AZ 85281', '8860451', '', '2005-10-04', '2013-09-30', 'US AIRWAYS, INC', 'si', 'si', 'no', 'si', 'no'),
(49, 'G3', 'GOL LINHAS AEREAS SA', 'GLO', 'AV VINTE DE JANEIRO S/N, TERMINAL DE PASSAGEIROS NO 02 DO AEROPORTO INERNACIONAL DO RIO DE JANEIRO / GALEAO - ANTONIO CARLOS JOBIM, NIVEL DE EMBARQUE,', 'Activo', '00 55 11 509823', 'SYDNEI LUIZ CASARINI', '55 11 50982321', 'slcasarini@golnaweb.com.br', 'Pca comandante linneu gomez s/n Portaria 3 Predio 4 04626-020 jardim aeroporto, Sao Paulo SP - Brasil', 'PCA COMANDANTE LINNEU GOMEZ S/N PORTARIA 3 PREDIO 4 04626-020 JARDIM AEROPORTO, SAO PAULO SP - BRASIL', '55 11 50982321', '', '2010-12-26', '2013-09-30', 'VRG LINHAS AEREAS SA', 'si', 'si', 'no', 'si', 'no'),
(50, 'LP', 'LANPERU', 'LPE', 'AV AMERICO VESPUCIO NO. 901, RENCA, SANTIAGO DE CHILE', 'Activo', '998 8860360/61', 'HILDA SALAZAR', '8860360/61', 'hilda.salazar@lan.com', 'Aeropuerto Internacional de Cancun T2', 'AV AMERICO VESPUCIO', '8860360/61', '', '2011-10-01', '2013-10-01', 'LAN AIRLINES S.A.', 'si', 'si', 'no', 'si', 'no'),
(51, 'AF', 'AIRFRANCE', 'AFR', 'ATO', 'Activo', '8860474', 'JOSE LUIS GOMEZ', '8860474', '', 'ATO CUN', 'ATO', '8860474', '', '2011-10-30', '2013-10-30', 'AIRFRANCE', 'si', 'si', 'no', 'si', 'no'),
(52, 'SU', 'AEROFLOT', 'AFL', '10, ARBAT STREET, MOSCOW, 119002, RUSIA', 'Activo', '7 499 500 7259', 'EVGENY ZHERGEV', '537 204 3200', 'havrepr@aeroflot.ru', 'Havana Cuba', '10, ARBAT STREET, MOSCOW, 119002, RUSSIA', '7 499 500 7259', 'dcharyshkin@aeroflot.ru', '2011-10-30', '2013-10-29', 'JOINT STOCK COMPANY AEROFLOT - RUSSIAN AIRLINES', 'si', 'si', 'si', 'si', 'no'),
(53, 'QS', 'TRAVEL SERVICE A.S.', 'TVS', 'JANACKOVO NABR.59/138,  150 00 PRAGUE 5 , CZECH REPUBLIC', 'Activo', '00 420 220 114439', 'JIRI DVORAK', '00 420 220 114439', 'JIRI.DVORAK@TRAVELSERVICE.AERO', 'JANACKOVO NABR. 59/138, 150 00 PRAGUE 5, CZECH REPUBLIC', 'JANACKOVO NABR.59/138,  150 00 PRAGUE 5 , CZECH REPUBLIC', '00 420 220 114439', 'JIRI.DVORAK@TRAVELSERVICE.AERO', '2007-12-01', '2013-12-01', 'TRAVEL SERVICE A.S.', 'si', 'si', 'no', 'si', 'no'),
(54, 'AV', 'AVIANCA', 'AVA', 'AV PASEO DE LA REFORMA 195 INT 301 COL CUAUHTEMOC, MEXICO DF', 'Activo', '55 2107900', 'DIONICIO MOCTEZUMA', '55 21079200', 'dionicio.arce@aviancataca.com', 'Aeropuerto Internacional de Cancun T2', 'AV PASEO DE LA REFORMA 195 INT 301 COL. CUAUHTEMOC, MéXICO DF', '55 21079200', '', '2011-04-15', '2014-12-31', 'AEROVIAS DEL CONTINENTE AMERICANO SA, AVIANCA', 'si', 'si', 'no', 'si', 'no'),
(55, 'E7', 'ESTAFETA', 'ESF', 'HAMBURGO 213, PISO 14 COL JUAREZ CP 06600 MéXICO D.F', 'Activo', '55 21079200', 'RICARDO CARREON', '998 8860243', 'ricardo.carreon@estafeta.com', 'Aeropuerto Internacional de Cancun', 'HAMBURGO 213, PISO 14 COL JUAREZ CP 06600. MéXICO DF', '55 21079200', 'rodolfo.tello@estafeta.com', '2011-12-15', '2013-12-15', 'ESTAFETA CARGA AEREA, SA DE CV', 'si', 'si', 'no', 'si', 'no'),
(56, 'IJ', 'INTERJET', 'ITJ', 'IGNACIO LONGARES 102 LOTE 2 M2 COL PARQUE INDUSTRIAL ESPORTEC I, TOLUCA EDO DE MEX', 'Activo', '8487200', 'LAZARO MARTINEZ', '8487200', 'LAZARO.MARTINEZ@INTERJET.COM.MX', 'IGNACIO LONGARES 102 LOTE 2 M2 COL PARQUE INDUSTRIAL ESPORTEC I, TOLUCA EDO DE MEXIGNACIO LONGARES 102 LOTE 2', 'IGNACIO LONGARES 102 LOTE 2 M2 COL PARQUE INDUSTRIAL ESPORTEC I, TOLUCA EDO DE MEX', '8487200', 'LAZARO.MARTINEZ@INTERJET.COM.MX', '0000-00-00', '0000-00-00', 'ABC AEROLINEAS, SA DE CV', 'no', 'si', 'no', 'si', 'no'),
(57, 'AS', 'ASUR', 'ASU', 'CARRETARA CANCUN CHETUMAL KM 22 CANCUN , QUINTANA ROO', 'Activo', '8487200', 'Juan Pablo García Luna Gutierrez', '8487200', 'jgarcia@asur.com.mx', 'CARRETARA CANCUN CHETUMAL KM 22 CANCUN , QUINTANA ROO', 'CARRETARA CANCUN CHETUMAL KM 22 CANCUN , QUINTANA ROO', '8487200', 'cdelfin@asur.com.mx', '2012-04-01', '2014-04-01', 'Aeropuerto de Cancun SA de CV', 'si', 'si', 'no', 'si', 'no'),
(58, 'LR', 'LACSA', 'LRC', 'EDIFICIO LACSA LA URUCA,  SAN JOSE , COSTA RICA', 'Activo', '998 8860243', 'ROBERTO GRIJALVA', '998 8860243', 'ROBERTO.GRIJALVA@AVIANCATACA.COM', 'AVENIDA PASEO DE LA REFORMA , No, 195 PLANTA BAJA', 'AVENIDA PASEO DE LA REFORMA , No, 195 PLANTA BAJA', '998 8860243', 'GRIJALVA@AVIANCATACA.COM', '2008-12-01', '2013-12-01', 'LINEAS AEREAS COSNTARRICENSES, SA DE CV', 'si', 'si', 'no', 'si', 'no'),
(59, 'GU', 'AVIATECA', 'GUG', 'AVENIDA INCAPIE 12-22, ZONA 13 GUATEMALA, GUATEMALA', 'Activo', '998 8860243', 'CRISTINA MOLINA', '998 8860243', 'cristina.molina@aviancataca.com', 'AVENIDA INCAPIE 12-22, ZONA 13 GUATEMALA, GUATEMALA', 'MONTECITO COL NAPOLES, DEL. BENITO JUAREZ', '998 8860243', 'cristina.molina@aviancataca.com', '2008-12-01', '2013-12-01', 'AVIATECA, S.A', 'si', 'si', 'no', 'si', 'no'),
(60, 'VS', 'VIRGIN ATLANTIC', 'VIR', '75 NORTH WATER STREET SOUTH NORWALK CT', 'Activo', '0012037502191', 'GARY BARNHART', '0012037502191', 'GARY.BARNHART@FLY.VIRGIN.COM', '75 NORTH WATER STREET SOUTH NORWALK CT', '75 NORTH WATER STREET SOUTH NORWALK CT', '0012037502191', 'GARY.BARNHART@FLY.VIRGIN.COM', '2012-06-12', '2013-06-12', 'VIRGIN ATLANTIC AIRWAYS LTD', 'si', 'si', 'no', 'si', 'no'),
(61, 'AR', 'AEROLINEAS ARGENTINAS', 'ARG', 'CARR. CANCUN -CHETUMAL  KM 22 LOCALES 6 Y 7 AEROPUERTO DE CANCUN', 'Activo', '8860000', 'HANAHI HERRERA', '8860000', 'aherrera@argentinas.mx', 'CARR. CANCUN -CHETUMAL  KM 22 LOCALES 6 Y 7 AEROPUERTO DE CANCUN', 'CARR. CANCUN -CHETUMAL  KM 22 LOCALES 6 Y 7 AEROPUERTO DE CANCUN', '8860000', 'aherrera@argentinas.mx', '2012-10-07', '2015-10-06', 'AEROLINEAS ARGENTINAS S.A.', 'si', 'si', 'no', 'si', 'no'),
(62, 'OR', 'ORENAIR', 'ORB', 'RUSSIA, 460049, ORENBURG REGION, ORENBURG DISTRICT AIRPORT', 'Activo', '7 3532 67 77 67', 'MR. MIKHAIL SAFRONOV', '7 3532 67 77 67', 'ms@orenair.ru', 'RUSSIA, 460049, ORENBURG REGION, ORENBURG DISTRICT AIRPORT', '1 ST FLOOR , INTERNATIONAL  HOUSE 21 LONDON ENGLAN', '7 3532 67 77 67', 'ms@orenair.ru', '2012-12-07', '2014-12-07', 'PGS INTERNATIONAL LIMITED', 'si', 'si', 'no', 'si', 'no'),
(63, 'S4', 'SATA AIRLINES', 'RZO', 'AV.INF.D.HENRIQUE N. 55,  3° 9904-528 PONTA DELGADA ACORES PORTUGAL', 'Activo', '351296209708', 'SONIA AVELAR', '351296209708', 'sonia.avelar@sata.pt', 'AV.INF.D.HENRIQUE N. 55,  3° 9904-528 PONTA DELGADA ACORES PORTUGAL', 'AV.INF.D.HENRIQUE N. 55,  3° 9904-528 PONTA DELGADA ACORES PORTUGAL', '351296209708', 'sonia.avelar@sata.pt', '2013-02-01', '2015-01-31', 'SATA INTERNACIONAL, SA', 'si', 'si', 'no', 'si', 'no'),
(64, 'NK', 'SPIRIT AIRLINES', 'NKS', '2800 EXECUTIVE WAY  MIRAMAR, FLORIDA  33025  U.S.A.', 'Activo', '8546284852', 'SPIRIT AIRLINES, INC', '8546284852', 'PHILLIP.BERTON@SPIRITAIR.COM', '2800 EXECUTIVE WAY  MIRAMAR, FLORIDA  33025  U.S.A.', '2800 EXECUTIVE WAY  MIRAMAR, FLORIDA  33025  U.S.A.', '8546284852', 'PHILLIP.BERTON@SPIRITAIR.COM', '2013-04-01', '2015-04-01', 'SPIRIT AIRLINES, INC', 'si', 'si', 'no', 'si', 'no'),
(65, 'PM', 'TROPIC AIR', 'TOS', 'PO BOX 20, SAN PEDRO TOWN , AMBERGRIS CAYE BELIZE', 'Activo', '501-9610-4370', 'TROPIC AIR', '501-9610-4370', 'steve@tropicair.com', 'PO BOX 20, SAN PEDRO TOWN , AMBERGRIS CAYE BELIZE', 'PO BOX 20, SAN PEDRO TOWN , AMBERGRIS CAYE BELIZE', '501-9610-4370', 'steve@tropicair.com', '2012-12-01', '2015-11-30', 'TROPIC AIR', 'si', 'no', 'no', 'no', 'no');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
