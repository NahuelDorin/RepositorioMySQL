USE bonus_track;

-- Ejercicio 1)

-- 2)
select * from top_spotify;
-- 3)
select artista,titulo,genero from top_spotify;
-- 4)
select artista,titulo,genero from top_spotify order by genero;
-- 5) 
select artista,titulo,genero from top_spotify order by genero,artista;

-- Ejercicio 2)

-- 1)
select artista,titulo,genero from top_spotify order by artista,titulo limit 0,10;
-- 2)
select artista,titulo,genero from top_spotify order by artista,titulo limit 10,5;
-- 3)
select * from top_spotify where artista = 'Madonna';
-- 4)
select * from top_spotify where genero = 'pop' order by titulo;
-- 5)
select * from top_spotify where genero = 'pop' and ano = 2015 order by artista,titulo;
-- 6)
select * from top_spotify where genero = 'dance pop' and ano < 2011 order by titulo;

-- Ejercicio 3)
USE libreria;

-- 1)
select * from autores where ciudad = 'Buenos aires';
-- 2)
select * from libros where precio > 30 order by precio desc;
-- 3)
select * from autores where provincia != 'ba' order by provincia;
-- 4)
select * from libros where categoria = 'cuentos' and precio < 20 order by titulo;
-- 5)
select * from libros where categoria = 'novelas' or categoria = 'ensayos' order by titulo;
-- 6)
select * from libros where precio between 20 and 35 order by precio desc;
-- 7)
select * from autores where nombre in ('Jorge','Luis','Victoria','Ernesto','Adolfo') order by nombre;
-- 8)
select * from libros where titulo like '%mundo%';
-- 9)
select * from libros where titulo like '%de %';
-- 10)
select * from libros where precio is null order by titulo;




