use bonus_track;

-- Ejercicio 1)

-- 1)
select concat(artista, '-', titulo) as 'cancion', genero from top_spotify order by cancion;
-- 2)
select concat_ws('-',artista, titulo) as 'cancion', genero from top_spotify order by cancion;
-- 3)
select concat_ws('-',artista, titulo) as 'cancion', upper(genero) from top_spotify order by cancion;
-- 4)
select concat_ws('-',artista, titulo) as 'cancion', upper(genero), year(curdate() - ano) as 'años' from top_spotify order by cancion;
-- 5)
select count(*) as canciones from top_spotify;
-- 6)
select ano,count(*) as canciones from top_spotify group by ano;
-- 7)
select ano,count(*) as canciones from top_spotify group by ano having canciones >= 50;

-- Ejercicio 2)

-- 1)
use libreria;
select concat(apellido,', ',nombre) as autor,provincia from autores order by autor;
-- 2)
select concat_ws(', ',apellido,nombre) as autor,provincia from autores order by autor;
-- 3)
select upper(concat_ws(', ',apellido,nombre)) as autor,provincia from autores order by autor;
-- 4)
select concat_ws(', ',apellido,upper(left(nombre,1))) as autor,provincia from autores order by autor;
-- 5)
select CONCAT(apellido, ', ', nombre) as empleado, year(FECHA_INGRESO) as ingreso from empleados order by ingreso desc;

-- Ejercicio 3)

-- 1)
select concat(apellido, ', ', nombre) as empleado, year(fecha_ingreso) as ingreso, timestampdiff(year, fecha_ingreso, curdate()) as antiguedad from empleados order by ingreso desc;
-- 2)
select min(precio) as 'menor precio' from libros;
-- 3)
select min(precio) as 'menor precio', max(precio) as 'mayor precio' from libros;
-- 4)
select min(precio) as 'menor precio', max(precio) as 'mayor precio', round(avg(precio),2) as 'precio promedio' from libros;
-- 5)
select categoria,min(precio) as 'menor precio', max(precio) as 'mayor precio', round(avg(precio),2) as 'precio promedio' from libros group by categoria;
-- 6)
select categoria,min(precio) as 'menor precio', max(precio) as 'mayor precio', round(avg(precio),2) as 'precio promedio' from libros group by categoria having categoria != 'sin asignar';
