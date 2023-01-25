-- TP - primera parte)
-- 1)
-- hecho

-- 2)
create schema videoclub;
use videoclub;

-- 3)

create table pelicula(
	codigo_pelicula integer not null auto_increment,
    titulo text not null,
    año int not null,
    duracion int,
	primary key(codigo_pelicula)
);

create table amigo (
	codigo_amigo integer not null auto_increment,
    nombre text not null,
    apellido text not null,
    telefono integer not null,
    direccion text not null,
    primary key(codigo_amigo)
);

-- 4)
insert into pelicula (titulo,año,duracion) values
	('Pelicula 1',2001,100),
	('Pelicula 2',2002,110),
	('Pelicula 3',2003,120),
	('Pelicula 4',2004,130),
	('Pelicula 5',2005,140),
	('Pelicula 6',2006,150),
	('Pelicula 7',2007,160),
	('Pelicula 8',2008,180),
	('Pelicula 9',2009,190),
	('Pelicula 10',2010,200);

insert into amigo (nombre,apellido,telefono,direccion) values
	('Nahuel','Dorin',1111111111,'Calle Falsa 1'),
	('Nahuel','Flores',1122222222,'Calle Falsa 2'),
	('Nahuel','Lucero',1133333333,'Calle Falsa 3'),
	('Nehuen','Rosa',1144444444,'Calle Falsa 4'),
	('Federico','Quiñones',1155555555,'Calle Falsa 5'),
	('Florencia','Santamaria',1166666666,'Calle Falsa 6'),
	('Gonzalo','Duarte',1177777777,'Calle Falsa 7'),
	('Luciano','Barrientos',1188888888,'Calle Falsa 8'),
	('Mariano','Chun',1199999999,'Calle Falsa 9'),
	('Pablo','Medina',1100000000,'Calle Falsa 10');
    
-- 5)
update pelicula set titulo = 'duro de matar' where codigo_pelicula = 3;

-- 6)
delete from pelicula where codigo_pelicula = 6;
delete from pelicula where codigo_pelicula = 7;
delete from pelicula where codigo_pelicula = 8;

-- 7)
select * from prestamo;

-- 8)
select * from prestamo;

-- 9)
alter table pelicula rename to peliculas;
alter table amigo rename to amigos;
alter table prestamo rename to prestamos;

-- 10)
select * from prestamos;
select distinct nombre from amigos;
select titulo,duracion from peliculas;

-- TP - Segunda parte)

-- 11)
select * from prestamos where numero_alquiler between 3 and 6;
select * from amigos where codigo_amigo not between 2 and 5;

-- 12)
select * from peliculas where titulo like '%to%';

-- 13)
insert into amigos (nombre,apellido,telefono,direccion) values
	('Marina','Fernandez',45128956,'Parana 555'),
	('Lujan','Tucci',1137589612,'Lavalle 1100'),
	('Gabriel','Dominguez',41109956,'Carlos Calvo 100'),
	('Raul','Vazquez',45120014,'Peru 1120'),
	('Martina','Perez',113202044,'Uruguay 220');
    
-- 14)
SET SQL_SAFE_UPDATES = 0;
update amigos set nombre = 'Lorena', apellido = 'Tucci' where codigo_amigo = 12;
SET SQL_SAFE_UPDATES = 1;

-- 15)
create table amigos_aux like amigos;
insert into amigos_aux select * from amigos;

-- 16)
truncate table amigos_aux;

-- 17)
drop table amigos_aux;

-- 18)
select count(*) from amigos;

-- 19)
select max(año),min(año) from peliculas;