CREATE TABLE suppliers (id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,rfc VARCHAR(45) NOT NULL, contacto VARCHAR(45), noExterior VARCHAR(20), colonia VARCHAR(45), localidad VARCHAR(45), pais ENUM('Mexico'), cp INT UNSIGNED, razonsocial VARCHAR(45), calle VARCHAR(45), noInterior VARCHAR(20), referencia VARCHAR(45) NOT NULL, municipio VARCHAR(25), estado VARCHAR(25), email VARCHAR(45));


CREATE TABLE suppliers (id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,rfc VARCHAR(45) NOT NULL, contacto VARCHAR(45), noExterior VARCHAR(20), colonia VARCHAR(45), localidad VARCHAR(45), pais VARCHAR(45), cp INT UNSIGNED, razonsocial VARCHAR(45), calle VARCHAR(45), noInterior VARCHAR(20), referencia VARCHAR(45) NOT NULL, municipio VARCHAR(25), estado VARCHAR(25), email VARCHAR(45));
