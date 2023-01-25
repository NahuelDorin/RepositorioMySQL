CREATE DATABASE libreria;

USE libreria;

CREATE TABLE autores (
  `autor_id` VARCHAR(11),
  `apellido` VARCHAR(40),
  `nombre` VARCHAR(20),
  `telefono` VARCHAR(12),
  `direccion` VARCHAR(40),
  `ciudad` VARCHAR(20),
  `provincia` CHAR(2),
  `c_postal` CHAR(5),
  `estado` tinyint(1));

CREATE TABLE ventas (
  `local_id` CHAR(4),
  `factura_nro` VARCHAR(20),
  `fecha` DATETIME,
  `cantidad` SMALLINT,
  `forma_pago` VARCHAR(12),
  `libro_id` VARCHAR(6));
  
  CREATE TABLE locales(
  `local_id` CHAR(4),
  `nombre` VARCHAR(40),
  `direccion` VARCHAR(40),
  `ciudad` VARCHAR(20),
  `provincia` CHAR(2),
  `c_postal` CHAR(5));
  
CREATE TABLE editoriales(
  `editorial_id` CHAR(4),
  `nombre` VARCHAR(40),
  `ciudad` VARCHAR(20),
  `provincia` char(2),
  `pais` varchar(30));
  
CREATE TABLE libros(
  `libro_id` varchar(6),
  `titulo` varchar(80),
  `categoria` char(12),
  `editorial_id` char(4),
  `precio` double,
  `comentarios` varchar(200),
  `fecha_publicacion` datetime);
  
CREATE TABLE libroautor(
  `autor_id` varchar(11),
  `libro_id` varchar(6));
  
CREATE TABLE empleados(
  `empleado_id` char(9),
  `nombre` varchar(20),
  `apellido` varchar(30),
  `puesto_id` smallint,
  `editorial_id` char(4),
  `fecha_ingreso` datetime);
  
CREATE TABLE puestos(
  `puesto_id` smallint,
  `descripcion` varchar(50));
  
ALTER TABLE autores ADD PRIMARY KEY (autor_id);
ALTER TABLE ventas add primary key(local_id, factura_nro, libro_id);
ALTER TABLE locales ADD PRIMARY KEY (local_id);  
ALTER TABLE editoriales ADD PRIMARY KEY (editorial_id);
ALTER TABLE libros ADD PRIMARY KEY (libro_id);  
ALTER TABLE libroautor ADD PRIMARY KEY (autor_id,libro_id);  
ALTER TABLE empleados ADD PRIMARY KEY (empleado_id);
ALTER TABLE puestos ADD PRIMARY KEY (puesto_id);

INSERT INTO `autores` VALUES
	('444-44-4444','Nahuel','Dorin','11111111','Calle Falsa 1','Argentina','BA',1416,1),
	('555-55-5555','Nahuel','Cortazar','22222222','Calle Falsa 2','Argentina','BA','1417',0),
	('666-66-6666','Nahuel','Piglia','33333333','Calle Falsa 3','Argentina','BA','1418',1);
SELECT * FROM autores;

INSERT INTO `ventas` VALUES
	('1111','1111','2023-01-12 00:00:00',3,'Efectivo','MC2222'),
	('2222','2222','2023-01-13 00:00:00',2,'Cheque','MC3021'),
	('3333','3333','2023-01-14 00:00:00',1,'Trans','PS2092');
SELECT * FROM ventas;

INSERT INTO `locales` VALUES
	('1111','Cars','Calle Falsa 1','Buenos Aires','CF','5743'),
	('2222','Cars 2','Calle Falsa 2','Buenos Aires','CF','6436'),
	('3333','Cars 3','Calle Falsa 3','Buenos Aires','CF','9831');
SELECT * FROM locales;

INSERT INTO `editoriales` VALUES
	('1111','Nahuel','Buenos Aires','CF','Argentina'),
    ('2222','Pedro','Buenos Aires','CF','Argentina'),
    ('3333','Pablo','Buenos Aires','CF','Argentina');
SELECT * FROM editoriales;

INSERT INTO `libros` VALUES
	('AA1111','Como Jugar LoL','Guia','1111',19.99,'','2022-07-10 00:00:00'),
    ('BB2222','C++ Al Completo','Manual','2222',59.99,'','2007-05-23 00:00:00'),
    ('CC3333','Maneja Python Como Un Pro','Manual','3333',49.99,'','2021-01-23 00:00:00');
SELECT * FROM libros;

INSERT INTO `libroautor` VALUES
	('444-44-4444','AA1111'),
    ('555-55-5555','BB2222'),
    ('666-66-6666','CC3333');
SELECT * FROM libroautor;

INSERT INTO `empleados` VALUES
	('AA3A1A3AA','Roberto','Crezzio',7,'0877','1993-08-27 00:00:00'),
    ('BB2B2B2BB','Julio','Audittore',2,'0877','1994-08-27 00:00:00'),
    ('CC3C3C3CC','Paula','Clert',9,'0877','1995-08-27 00:00:00');
SELECT * FROM empleados;

INSERT INTO `puestos` VALUES
	(15,'Ingeniero en Sistemas de Informacion'),
    (16,'Ingeniero Civil'),
    (17,'Ingeniero Aeroespacial');
SELECT * FROM puestos;