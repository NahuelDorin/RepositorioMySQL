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