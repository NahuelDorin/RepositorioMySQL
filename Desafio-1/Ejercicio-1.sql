/*
CREATE DATABASE bonus_track;

USE bonus_track;

CREATE TABLE agenda (
  `IDContacto` INT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Apellido` VARCHAR(15) NOT NULL,
  `Domicilio` VARCHAR(50) NULL,
  `Telefono` INT NOT NULL,
  PRIMARY KEY (`IDContacto`));
*/

SELECT * FROM agenda;

ALTER TABLE agenda ADD Mail varchar(50) NOT NULL;

INSERT INTO `agenda` 
	(IDContacto, Nombre, Apellido, Domicilio, Telefono, Mail)
VALUES
	(1,'Nahuel','Dorin','Calle Falsa 1',1111111111,'nahueldorin@gmail.com'),
    (2,'Nahuel','Flores','Calle Falsa 2',1122222222,'nahuelflores@gmail.com'),
    (3,'Nahuel','Perez','Calle Falsa 3',1133333333,'nahuelperez@gmail.com'),
    (4,'Nahuel','Medina','Calle Falsa 4',1144444444,'nahuelmedina@gmail.com');
    
SELECT * FROM agenda;