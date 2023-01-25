-- Etapa 1-1

-- 1)
DROP DATABASE IF EXISTS `laboratorio`;
CREATE DATABASE `laboratorio`;
-- 2)
USE `laboratorio`;
-- 3)
CREATE TABLE `facturas` (
	`letra` char,
    `Numero` integer,
    `ClienteID` integer,
    `ArticuloID` integer,
    `Fecha` date,
    `Monto` double,
PRIMARY KEY (`Letra`,`Numero`));
-- 4)
CREATE TABLE `articulos` (
	`ArticuloID` integer,
    `Nombre` varchar(50),
    `Precio` double,
    `Stock` integer,
PRIMARY KEY(`ArticuloID`));
-- 5)
CREATE TABLE `clientes`(
	`ClienteID` integer,
    `Nombre` varchar(25),
    `Apellido` varchar(25),
    `CUIT` char(16),
    `Direccion` varchar(50),
    `Comentarios` varchar(50),
PRIMARY KEY (`ClienteID`));
-- 6)
SHOW DATABASES;
-- 7) y 8)
-- SHOW TABLES IN `laboratorio`;
-- 9)
DESCRIBE `clientes`;
DESCRIBE `facturas`;

-- Etapa 1-2

-- 1)a)
ALTER TABLE facturas CHANGE COLUMN ClienteID IDCliente INT(11);
-- 1)b)
ALTER TABLE facturas CHANGE COLUMN ArticuloID IDArticulo int(11);
-- 1)c)
ALTER TABLE facturas MODIFY COLUMN Monto DOUBLE UNSIGNED;

-- 2)a)
ALTER TABLE articulos CHANGE COLUMN ArticuloID IDArticulo INT(11) NOT NULL;
-- 2)b)
ALTER TABLE articulos MODIFY COLUMN Nombre varchar(75);
-- 2)c)
ALTER TABLE articulos MODIFY COLUMN Precio double UNSIGNED NOT NULL;
-- 2)d)
ALTER TABLE articulos MODIFY COLUMN Stock int(11) UNSIGNED NOT NULL;

-- 3)a)
ALTER TABLE clientes CHANGE COLUMN ClienteID IDCliente int(11);
-- 3)b)
ALTER TABLE clientes MODIFY COLUMN Nombre varchar(30) NOT NULL;
-- 3)c)
ALTER TABLE clientes MODIFY COLUMN Apellido varchar(35) NOT NULL;
-- 3)d)
ALTER TABLE clientes CHANGE COLUMN Comentarios Observaciones varchar(255);

-- Etapa 1-3

-- 1)
INSERT INTO facturas VALUES
	('A',28,14,335,'2021-03-18',1589.50),
    ('A',39,26,157,'2021-04-12',979.75),
    ('B',8,17,95,'2021-04-25',513.35),
    ('B',12,5,411,'2021-05-03',2387.70),
    ('B',19,50,157,'2021-05-26',979.75);

-- 2)
INSERT INTO articulos VALUES
	(95,'Webcam con Micrófono Plug & Play',513.75,39),
    (157,'Apple AirPods Pro',979.75,152),
    (335,' Lavasecarropas Automático Samsung',1589.50,12),
    (411,'Gloria Trevi / Gloria / CD+DVD',2385.70,2);

-- 3)
INSERT INTO clientes VALUES
	(5,'Santiago','Gonzáles',' 23-24582359-9','Uriburu 558 - 7ºA','VIP'),
    (14,'Gloria','Fernández','23-35965852-5','Constitución 323','GBA'),
    (17,'Gonzalo','López',' 23-33587416-0','Arias 2624','GBA'),
    (26,'Carlos','García',' 23-42321230-9','Pasteur 322 - 2ºC','VIP'),
    (50,'Micaela','Altieri','23-22885566-5','Santamarina 1255','GBA');

-- Etapa 2-1

-- 1)
SELECT * FROM clientes_neptuno;
-- 2)
ALTER TABLE clientes_neptuno
MODIFY COLUMN IDCliente VARCHAR(5) NOT NULL,
MODIFY COLUMN NombreCompania VARCHAR(100) NOT NULL,
MODIFY COLUMN Pais VARCHAR(15) NOT NULL,
ADD PRIMARY KEY (`IDCliente`);
-- 3)
ALTER TABLE clientes RENAME TO Contactos;
-- 4)
select * from clientes;
-- 5)
ALTER TABLE clientes
MODIFY COLUMN COD_CLIENTE VARCHAR(7) NOT NULL,
MODIFY COLUMN EMPRESA VARCHAR(100) NOT NULL,
MODIFY COLUMN DIRECCION TEXT NOT NULL,
MODIFY COLUMN CIUDAD VARCHAR(25) NULL DEFAULT NULL,
MODIFY COLUMN TELEFONO INT(11) UNSIGNED NULL DEFAULT NULL,
MODIFY COLUMN RESPONSABLE VARCHAR(30) NULL DEFAULT NULL,
ADD PRIMARY KEY (`COD_CLIENTE`);
-- 6)
SELECT * FROM  pedidos;
-- 7)
ALTER TABLE pedidos 
MODIFY COLUMN NUMERO_PEDIDO INT(11) NOT NULL,
MODIFY COLUMN CODIGO_CLIENTE VARCHAR(7) NOT NULL,
MODIFY COLUMN FECHA_PEDIDO DATE NOT NULL,
MODIFY COLUMN FORMA_PAGO enum('APLAZADO','CONTADO','TARJETA'),
MODIFY COLUMN ENVIADO enum('SI','NO'),
ADD PRIMARY KEY (`NUMERO_PEDIDO`);
-- 8)
SELECT * FROM productos;
-- 9)
ALTER TABLE productos
MODIFY COLUMN COD_PRODUCTO INT(11) UNSIGNED NOT NULL,
MODIFY COLUMN SECCION VARCHAR(20) NOT NULL,
MODIFY COLUMN NOMBRE VARCHAR(40) NOT NULL,
MODIFY COLUMN IMPORTADO ENUM('VERDADERO','FALSO'),
MODIFY COLUMN ORIGEN VARCHAR(25) NOT NULL,
MODIFY COLUMN DIA INT(11) UNSIGNED NOT NULL,
MODIFY COLUMN MES INT(11) UNSIGNED NOT NULL,
MODIFY COLUMN ANO INT(11) UNSIGNED NOT NULL,
ADD PRIMARY KEY (COD_PRODUCTO);

-- Etapa 2-2
-- 1)
-- 2)
-- 3)
SELECT * FROM nacimientos;
-- 4)
-- 5)
-- 6)
-- 7)
-- 8)
-- 9)

-- Etapa 2-3

-- 1)
SELECT * FROM clientes_neptuno;
-- 2)
SELECT NombreCompania,Ciudad,Pais FROM clientes_neptuno;
-- 3)
SELECT NombreCompania,Ciudad,Pais FROM clientes_neptuno ORDER BY Pais;
-- 4)
SELECT NombreCompania,Ciudad,Pais FROM clientes_neptuno ORDER BY Pais, Ciudad;
-- 5)
SELECT NombreCompania,Ciudad,Pais FROM clientes_neptuno ORDER BY Pais LIMIT 10;
-- 6)
SELECT NombreCompania,Ciudad,Pais FROM clientes_neptuno ORDER BY Pais LIMIT 5 OFFSET 10;

-- Etapa 2-4

-- 1)
SELECT * from nacimientos WHERE NACIONALIDAD = 'Extranjera';
-- 2)
SELECT * from nacimientos where EDAD_MADRE < 18 ORDER BY EDAD_MADRE DESC;
-- 3)
SELECT * from nacimientos WHERE EDAD_MADRE = EDAD_PADRE;
-- 4)
SELECT * FROM nacimientos WHERE EDAD_MADRE <= EDAD_PADRE - 40;
-- 5)
SELECT * FROM clientes_neptuno WHERE Pais = 'Argentina';
-- 6)
SELECT * FROM clientes_neptuno WHERE Pais != 'Argentina' ORDER BY Pais;
-- 7)
SELECT * FROM nacimientos WHERE semanas < 20 ORDER BY SEMANAS DESC;
-- 8)
SELECT * FROM nacimientos WHERE SEXO = 'Femenino' AND NACIONALIDAD = 'Extranjera' AND EDAD_MADRE > 40;
-- 9)
SELECT * FROM clientes_neptuno WHERE PAIS IN ('Argentina','Brasil','Venezuela');
-- 10)
SELECT * FROM nacimientos WHERE SEMANAS BETWEEN 20 and 25;
-- 11)
SELECT * FROM nacimientos WHERE COMUNA in (1101,3201,5606,8108,9204,13120,15202);
-- 12)
SELECT * FROM clientes_neptuno WHERE IDCliente like 'C%';
-- 13)
SELECT * FROM clientes_neptuno WHERE Ciudad like 'B____';
-- 14)
SELECT * FROM nacimientos WHERE HIJOS_TOTAL > 10;

-- Etapa 3-1
-- Hecho

-- Etapa 3-2
-- 1)
SELECT IDCliente,NombreCompania, CONCAT(Direccion,' - ',Ciudad,' - ',Pais) Ubicacion FROM clientes_neptuno;
-- 2)
SELECT IDCliente,NombreCompania, CONCAT_WS(' - ',Direccion,Ciudad,Pais) Ubicacion FROM clientes_neptuno;
-- 3)
SELECT IDCliente, UPPER(NombreCompania) AS EMPRESA, CONCAT_WS(' - ',Direccion,Ciudad,Pais) Ubicacion FROM clientes_neptuno;
-- 4)
SELECT LOWER(IDCliente) AS CODIGO, UPPER(NombreCompania) AS EMPRESA, CONCAT_WS(' - ',Direccion,Ciudad,Pais) Ubicacion FROM clientes_neptuno;
-- 5)
SELECT FECHA, LEFT(SEXO,1) as SEXO, LEFT(tipo_parto,1) AS TIPO FROM nacimientos;
-- 6)
SELECT *, UPPER(CONCAT(LEFT(CIUDAD,1),LEFT(PAIS,1),RIGHT(PAIS,2))) AS CODIGO FROM clientes_neptuno;
-- 7)
SELECT SEXO, FECHA, TIPO_PARTO, ATENC_PART,LOCAL_PART, SUBSTRING(FECHA,4,2) AS MES FROM nacimientos ORDER BY MES;
-- 8)
SELECT SEXO, FECHA, TIPO_PARTO, REPLACE(NACIONALIDAD, 'Chilena', 'Ciudadana') AS NACIONALIDAD FROM nacimientos;

-- Etapa 3-3)

-- 1)
SELECT * FROM pedidos_neptuno WHERE YEAR(FechaPedido) = 1998;
-- 2)
SELECT * FROM pedidos_neptuno WHERE (MONTH(FechaPedido) BETWEEN 08 and 09 and YEAR(FechaPedido) = 1997);
-- 3)
SELECT * FROM pedidos_neptuno WHERE DAY(FechaPedido) = 01;
-- 4)
SELECT *, DATEDIFF(CURDATE(),FechaPedido) 'DIAS TRANSCURRIDOS' FROM pedidos_neptuno;
-- 5)
SELECT *, DATEDIFF(CURDATE(),FechaPedido) 'DIAS TRANSCURRIDOS', DAYNAME(FechaPedido) 'DIA' FROM pedidos_neptuno;
-- 6)
SELECT *, DATEDIFF(CURDATE(),FechaPedido) 'DIAS TRANSCURRIDOS', DAYNAME(FechaPedido) 'DIA', DAYOFYEAR(FechaPedido) 'DIA DEL AÑO' FROM pedidos_neptuno;
-- 7)
SELECT *, DATEDIFF(CURDATE(),FechaPedido) 'DIAS TRANSCURRIDOS', DAYNAME(FechaPedido) 'DIA', DAYOFYEAR(FechaPedido) 'DIA DEL AÑO', MONTHNAME(FechaPedido) 'MES' FROM pedidos_neptuno;
-- 8)
SELECT *, DATEDIFF(CURDATE(),FechaPedido) 'DIAS TRANSCURRIDOS', DAYNAME(FechaPedido) 'DIA', DAYOFYEAR(FechaPedido) 'DIA DEL AÑO', MONTHNAME(FechaPedido) 'MES', ADDDATE(FechaPedido, 30) 'PRIMER VENCIMIENTO' FROM pedidos_neptuno;
-- 9)
SELECT *, DATEDIFF(CURDATE(),FechaPedido) 'DIAS TRANSCURRIDOS', DAYNAME(FechaPedido) 'DIA', DAYOFYEAR(FechaPedido) 'DIA DEL AÑO', MONTHNAME(FechaPedido) 'MES', ADDDATE(FechaPedido, 30) 'PRIMER VENCIMIENTO', ADDDATE(FechaPedido, 60)'SEGUNDO VENCIMIENTO' FROM pedidos_neptuno;

-- Etapa 3-4)

-- 1)
SELECT *, ROUND(Cargo * 0.21,2) 'IVA' FROM pedidos_neptuno;
-- 2)
SELECT *, ROUND(Cargo * 0.21,2) 'IVA', ROUND(Cargo * 1.21,2) 'NETO' FROM pedidos_neptuno;
-- 3)
SELECT *, ROUND(Cargo * 0.21,2) 'IVA', ROUND(Cargo * 1.21,2) 'NETO', FLOOR(Cargo * 1.21) 'REDONDEO A FAVOR CLIENTE' FROM pedidos_neptuno;
-- 4)
SELECT *, ROUND(Cargo * 0.21,2) 'IVA', ROUND(Cargo * 1.21,2) 'NETO', FLOOR(Cargo * 1.21) 'REDONDEO A FAVOR CLIENTE', CEIL(Cargo * 1.21) 'REDONDEO A FAVOR EMPRESA' FROM pedidos_neptuno;

-- Etapa 3-5)

-- 1)
SELECT COUNT(*) FROM pedidos_neptuno;
-- 2)
SELECT COUNT(*) FROM pedidos_neptuno WHERE Transportista = 'Speedy Express';
-- 3)
SELECT COUNT(*) AS VENTAS FROM pedidos_neptuno WHERE Empleado LIKE 'C%';
-- 4)
SELECT ROUND(AVG(PrecioUnidad),2) 'PRECIO PROMEDIO' FROM productos_neptuno;
-- 5)
SELECT MIN(PrecioUnidad) 'PRECIO INFERIOR' FROM productos_neptuno;
-- 6)
SELECT MAX(PrecioUnidad) 'PRECIO MAXIMO' FROM productos_neptuno;
-- 7)
SELECT NombreCategoria 'CATEGORIA', MAX(PrecioUnidad) 'PRECIO MAXIMO' FROM productos_neptuno GROUP BY NombreCategoria;
-- 8)
SELECT COUNT(*) 'ENTREGAS' FROM pedidos_neptuno GROUP BY Transportista;
-- 9)
SELECT COUNT(*) 'NACIMIENTOS' FROM nacimientos GROUP BY Sexo;
-- 10)
SELECT NombreCompania, ROUND(SUM(Cargo),2) AS 'TOTAL GASTOS' FROM pedidos_neptuno GROUP BY NombreCompania;
-- 11)
SELECT SECCION, COUNT(*) AS CANTIDAD FROM productos GROUP BY SECCION ORDER BY CANTIDAD DESC;
-- 12)
SELECT YEAR(FechaPedido)AS AÑO, MONTHNAME(FechaPedido) AS MES,COUNT(*) AS VENTAS FROM pedidos_neptuno GROUP BY MONTH(FechaPedido), YEAR(FechaPedido) ORDER BY AÑO, MES;
-- 13)
SELECT Empleado, ROUND(SUM(Cargo),2) AS FACTURACION, ROUND(AVG(Cargo),2) AS PROMEDIO, MAX(Cargo) AS 'MEJOR VENTA', MIN(Cargo) AS 'PEOR VENTA', COUNT(Cargo) AS 'VENTAS' FROM pedidos_neptuno GROUP BY Empleado;

-- Etapa 4-1

-- 1)
CREATE TABLE VARONES AS (SELECT * FROM nacimientos WHERE SEXO = 'Masculino'); 
-- 2)
CREATE TABLE MUJERES AS (SELECT * FROM nacimientos WHERE SEXO = 'Femenino'); 
-- 3)
CREATE TABLE INDETERMINADOS AS (SELECT * FROM nacimientos WHERE SEXO = 'Indeterminado');
-- 4)
DROP TABLE nacimientos;

-- Etapa 4-2)

-- 1)
SET SQL_SAFE_UPDATES = 0;
UPDATE clientes_neptuno SET Pais = 'USA' WHERE Pais = 'Estados Unidos';
SELECT * FROM clientes_neptuno;
SET SQL_SAFE_UPDATES = 1;
-- 2)
SET SQL_SAFE_UPDATES = 0;
UPDATE clientes_neptuno SET NombreCompania = UPPER(NombreCompania);
SELECT * FROM clientes_neptuno;
SET SQL_SAFE_UPDATES = 1;
-- 3)
SET SQL_SAFE_UPDATES = 0;
UPDATE clientes_neptuno SET Ciudad = UPPER(Ciudad), Pais = UPPER(Pais);
SELECT * FROM clientes_neptuno;
SET SQL_SAFE_UPDATES = 1;
-- 4)
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE empleados ADD NOMBRE_EMPLEADO varchar(30) AFTER IdEmpleado;
UPDATE empleados SET NOMBRE_EMPLEADO = CONCAT_WS(' ', Nombre,Apellidos);
ALTER TABLE empleados DROP Apellidos, DROP Nombre;
SELECT * FROM empleados;
SET SQL_SAFE_UPDATES = 1;
-- 5)
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE clientes ADD TIPO varchar(3);
UPDATE clientes SET TIPO = 'VIP' WHERE CIUDAD = 'MADRID';
SELECT * FROM clientes;
SET SQL_SAFE_UPDATES = 1;
-- 6)
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE clientes MODIFY TELEFONO varchar(20);
UPDATE clientes SET TELEFONO = CONCAT('+34-',TELEFONO) WHERE TELEFONO IS NOT NULL;
SELECT * FROM clientes;
SET SQL_SAFE_UPDATES = 1;
-- 7)
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE productos ADD FECHA DATE;
UPDATE productos SET FECHA = CONCAT_WS('-',ANO,MES,DIA);
ALTER TABLE productos DROP DIA, DROP MES, DROP ANO;
UPDATE productos SET ORIGEN = 'ESPAÑA' WHERE ORIGEN = 'ESPANA';
SELECT * FROM productos;
SET SQL_SAFE_UPDATES = 1;
-- 8)
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE PRODUCTOS_NEPTUNO MODIFY Suspendido varchar(2);
UPDATE productos_neptuno SET SUSPENDIDO = IF(Suspendido = '0','NO','SI');
SELECT * FROM productos_neptuno;
SET SQL_SAFE_UPDATES = 1;
-- 9)
SET SQL_SAFE_UPDATES = 0;
UPDATE productos_neptuno SET PrecioUnidad = ROUND(PrecioUnidad * 1.10,2);
SELECT * FROM productos_neptuno;
SET SQL_SAFE_UPDATES = 1;
-- 10)
SET SQL_SAFE_UPDATES = 0;
UPDATE proveedores SET Region = NULL WHERE Region = '';
SELECT * FROM proveedores;
SET SQL_SAFE_UPDATES = 1;
-- 11)
SET SQL_SAFE_UPDATES = 0;
UPDATE clientes SET Ciudad = CONCAT(UPPER(LEFT(CIUDAD,1)),LOWER(SUBSTRING(CIUDAD,2,LENGTH(CIUDAD))));
SELECT * FROM clientes;
SET SQL_SAFE_UPDATES = 1;
-- 12)
CREATE TABLE PRODUCTOS_SUSPENDIDOS SELECT * FROM PRODUCTOS_NEPTUNO WHERE Suspendido = 'SI';
SELECT * FROM PRODUCTOS_SUSPENDIDOS;

-- Etapa 4-3)

-- 1)a)
SET SQL_SAFE_UPDATES = 0;
UPDATE productos_neptuno SET SUSPENDIDO = 'SI' WHERE IdProveedor = 1;
SELECT * FROM productos_neptuno;
SET SQL_SAFE_UPDATES = 1;
-- 1)b)
SET SQL_SAFE_UPDATES = 0;
INSERT INTO productos_suspendidos SELECT * FROM productos_neptuno WHERE Suspendido = 'SI';
SELECT * FROM productos_suspendidos;
SET SQL_SAFE_UPDATES = 1;
-- 1)c)
SET SQL_SAFE_UPDATES = 0;
DELETE FROM productos_neptuno WHERE IdProveedor = 1;
SELECT * FROM productos_neptuno;
SET SQL_SAFE_UPDATES = 1;

-- Etapa 4-4)

-- 1)
SET SQL_SAFE_UPDATES = 0;
DELETE FROM productos_neptuno WHERE Suspendido = 'SI';
SELECT COUNT(*) FROM productos_neptuno;
SET SQL_SAFE_UPDATES = 1;

-- Etapa 5-1)

-- 1)
SELECT * FROM productos_neptuno WHERE PrecioUnidad > (SELECT AVG(PrecioUnidad) FROM productos_neptuno) ORDER BY NombreProducto;
-- 2)
SELECT * FROM productos_neptuno WHERE PrecioUnidad > (SELECT MAX(PrecioUnidad) FROM productos_suspendidos) ORDER BY PrecioUnidad DESC;
-- 3)
SELECT * FROM varones WHERE SEMANAS < (SELECT MIN(SEMANAS) FROM indeterminados);
-- 4)
SELECT * FROM productos_neptuno WHERE LEFT(NombreProducto,1) = (SELECT LEFT(SUBSTRING_INDEX(NOMBRE_EMPLEADO,' ',-1),1) FROM empleados WHERE IDEmpleado = 8);
-- 5)
SELECT * FROM productos_neptuno WHERE IdProveedor = (SELECT MAX(IDProveedor) FROM proveedores) ORDER BY NombreProducto;
-- 6)
SELECT * FROM productos_neptuno WHERE NombreCategoria = 'BEBIDAS' AND PrecioUnidad > (SELECT MAX(PrecioUnidad) FROM productos_neptuno WHERE NombreCategoria = 'Condimentos');
-- 7)
SELECT * FROM mujeres WHERE EDAD_MADRE > (SELECT MAX(EDAD_MADRE) FROM varones);
-- 8)
SELECT NombreCompania FROM pedidos_neptuno WHERE Cargo > 500 GROUP BY NombreCompania;
SELECT * FROM clientes_neptuno;

-- Etapa 5-2)

-- 1)
SELECT IDCliente,NombreCompania,Ciudad,Pais, CASE 
WHEN Pais = 'Mexico' OR Pais = 'Canada' OR Pais = 'USA' THEN 'America del Norte'
WHEN Pais = 'Argentina' OR Pais = 'Brasil' OR Pais = 'Venezuela' THEN 'America del Sur'
ELSE 'Europa'
END AS Continente FROM clientes_neptuno;
-- 2)
SELECT IDPEDIDO,NOMBRECOMPANIA,FECHAPEDIDO, CARGO, CASE 
WHEN Cargo > 700 THEN 'EXCELENTE'
WHEN Cargo BETWEEN 500 AND 700 THEN 'MUY BUENO'
WHEN Cargo BETWEEN 50 AND 250 THEN 'REGULAR'
WHEN Cargo < 50 THEN 'MALO'
END AS EVALUACION FROM pedidos_neptuno ORDER BY CARGO DESC;
-- 3)
SELECT IDPRODUCTO,NOMBREPRODUCTO,NOMBRECATEGORIA,PRECIOUNIDAD, CASE 
WHEN PrecioUnidad > 100 THEN 'DELUXE'
WHEN PrecioUnidad BETWEEN 10 AND 100 THEN 'REGULAR'
WHEN PrecioUnidad < 10 THEN 'ECONOMICO'
END AS TIPO FROM productos_neptuno ORDER BY PrecioUnidad DESC;

-- Etapa 5-3)

-- 1)
SELECT * FROM varones WHERE SEMANAS < 20 UNION
SELECT * FROM mujeres WHERE SEMANAS < 20 UNION
SELECT * FROM indeterminados WHERE SEMANAS < 20;
-- 2)
SELECT * FROM varones WHERE SUBSTRING(FECHA,4,2) = '09' AND SEMANAS > 40 AND ESTADO_CIVIL_MADRE = 'CASADA' UNION 
SELECT * FROM mujeres WHERE SUBSTRING(FECHA,4,2) = '09' AND SEMANAS > 40 AND ESTADO_CIVIL_MADRE = 'CASADA' UNION
SELECT * FROM indeterminados WHERE SUBSTRING(FECHA,4,2) = '09' AND SEMANAS > 40 AND ESTADO_CIVIL_MADRE = 'CASADA';
-- 3)
SELECT * FROM productos_neptuno WHERE PrecioUnidad > 80 UNION
SELECT * FROM productos_suspendidos WHERE PrecioUnidad > 80
GROUP BY NombreProducto;
-- 4)
SELECT *,'A LA VENTA' AS CONDICION FROM productos_neptuno WHERE PrecioUnidad > 80 UNION
SELECT *,'SUSPENDIDO' AS CONDICION FROM productos_suspendidos WHERE PrecioUnidad > 80
GROUP BY NombreProducto;
-- 5)
SELECT * FROM productos_neptuno WHERE NombreCategoria = 'Bebidas' UNION
SELECT * FROM productos_suspendidos WHERE NombreCategoria = 'Bebidas'
ORDER BY NombreProducto;
-- 6)
INSERT INTO productos_suspendidos SELECT * FROM productos_neptuno WHERE IDProducto = 43;
-- 7)
SELECT * FROM productos_neptuno WHERE NombreCategoria = 'Bebidas' UNION
SELECT * FROM productos_suspendidos WHERE NombreCategoria = 'Bebidas'
ORDER BY NombreProducto;
-- 8)
SELECT * FROM productos_neptuno WHERE NombreCategoria = 'Bebidas' UNION ALL
SELECT * FROM productos_suspendidos WHERE NombreCategoria = 'Bebidas'
ORDER BY NombreProducto;
-- 9)
SET SQL_SAFE_UPDATES = 0;
DELETE FROM productos_suspendidos WHERE IDProducto = 43;
SET SQL_SAFE_UPDATES = 1;

-- Etapa 5-4)

-- 1)
CREATE TABLE equipos(EQUIPO varchar(20) PRIMARY KEY);
-- 2)
INSERT INTO equipos VALUES
	('ARGENTINA'),
    ('BRASIL'),
    ('PARAGUAY'),
    ('CHILE'),
    ('URUGUAY'),
    ('COLOMBIA'),
    ('ECUADOR'),
    ('PERU'),
    ('BOLIVIA'),
    ('VENEZUELA');
-- 3)
SELECT * FROM equipos l CROSS JOIN equipos v WHERE l.equipo != v.equipo ORDER BY l.equipo;

-- Etapa 5-5)

-- 1)
SELECT p.NombreContacto,pn.IdProducto,pn.NombreProducto,pn.PrecioUnidad FROM proveedores p JOIN productos_neptuno pn ON p.IdProveedor = pn.IdProveedor ORDER BY p.NombreContacto, pn.NombreProducto;
-- 2)
SELECT p.NombreContacto,pn.IdProducto,pn.NombreProducto,pn.PrecioUnidad FROM proveedores p, productos_neptuno pn WHERE p.IdProveedor = pn.IdProveedor ORDER BY p.NombreContacto, pn.NombreProducto;
-- 3)
SELECT c.EMPRESA,p.NUMERO_PEDIDO,p.FECHA_PEDIDO,p.FORMA_PAGO FROM clientes c JOIN pedidos p ON c.COD_CLIENTE = p.CODIGO_CLIENTE ORDER BY c.EMPRESA;
-- 4)
SELECT c.EMPRESA,p.NUMERO_PEDIDO,p.FECHA_PEDIDO,p.FORMA_PAGO FROM clientes c LEFT JOIN pedidos p ON c.COD_CLIENTE = p.CODIGO_CLIENTE WHERE p.NUMERO_PEDIDO IS NULL ORDER BY c.EMPRESA;
-- 5)
SELECT c.EMPRESA FROM clientes c LEFT JOIN pedidos p ON c.COD_CLIENTE = p.CODIGO_CLIENTE WHERE p.NUMERO_PEDIDO IS NULL ORDER BY c.EMPRESA;
-- 6)
SELECT p.NombreContacto FROM proveedores p LEFT JOIN productos_neptuno pn ON p.IdProveedor = pn.IdProveedor WHERE pn.IdProducto IS NULL;
-- 7)
SELECT * FROM proveedores p RIGHT JOIN productos_neptuno pn ON p.IdProveedor = pn.IdProveedor WHERE p.IdProveedor IS NULL;
