-- Ejercicio 1)
use bonus_track;

-- 1)
SELECT ARTISTA, TITULO FROM ULTIMOS_LANZAMIENTOS WHERE ANO = (SELECT MAX(ANO) FROM ULTIMOS_LANZAMIENTOS) ORDER BY ARTISTA, TITULO;
-- 2)
SELECT TITULO FROM TOP_SPOTIFY WHERE PERMANENCIA = (SELECT MAX(PERMANENCIA) FROM TOP_SPOTIFY) AND ARTISTA = 'LADY GAGA' ORDER BY TITULO;
-- 3)
SELECT TITULO, ARTISTA, CASE 
WHEN GENERO LIKE '%POP%' THEN 'POP'
WHEN GENERO LIKE '%ELECTRO%' OR GENERO LIKE '%HOUSE%' THEN 'ELECTRÓNICA'
ELSE 'OTRO'
END AS TIPO FROM TOP_SPOTIFY ORDER BY ARTISTA, TITULO;

-- Ejercicio 2)

-- 1)
SELECT *, 'ANTERIOR' AS ESTADO FROM TOP_SPOTIFY WHERE TITULO LIKE '%BREAK%' UNION SELECT *, 'ULTIMO' AS ESTADO FROM ULTIMOS_LANZAMIENTOS WHERE TITULO LIKE '%BREAK%' ORDER BY TITULO;

-- Ejercicio 3)
use libreria;

-- 1)
SELECT * FROM LIBROS WHERE PRECIO > (SELECT AVG(PRECIO) FROM LIBROS) ORDER BY TITULO;
-- 2)
SELECT * FROM LIBROS WHERE CATEGORIA = 'NOVELAS' AND PRECIO > (SELECT MAX(PRECIO) FROM LIBROS WHERE CATEGORIA = 'ENSAYOS') ORDER BY PRECIO DESC;
-- 3)
SELECT * FROM EMPLEADOS WHERE PERMANENCIA = (SELECT MAX(PERMANENCIA) FROM EMPLEADOS);
-- 4)
SELECT * FROM EMPLEADOS WHERE PUESTO_ID = (SELECT MAX(PUESTO_ID) FROM EMPLEADOS);
-- 5)
SELECT LIBRO_ID, TITULO, CATEGORIA, PRECIO_PUBLICO, CASE
WHEN PRECIO_PUBLICO < 15 THEN 'ECONOMICO'
WHEN PRECIO_PUBLICO <=30 THEN 'REGULAR'
ELSE 'DELUXE'
END AS TIPO FROM LIBROS WHERE PRECIO_PUBLICO IS NOT NULL ORDER BY TITULO;
-- 6)
SELECT CONCAT(APELLIDO, ', ', NOMBRE) EMPLEADO FROM EMPLEADOS WHERE PUESTO_ID = 9 UNION SELECT CONCAT(APELLIDO, ', ', NOMBRE) FROM EMPLEADOS_ANTERIORES WHERE PUESTO_ID = 9 ORDER BY EMPLEADO;
-- 7)
SELECT V.LIBRO_ID, TITULO, PRECIO_PUBLICO, LOCAL_ID, FACTURA_NRO, CANTIDAD FROM LIBROS L, VENTAS V WHERE L.LIBRO_ID = V.LIBRO_ID ORDER BY L.TITULO;
-- 8)
SELECT V.LIBRO_ID, TITULO, PRECIO_PUBLICO, LOCAL_ID, FACTURA_NRO, CANTIDAD, ROUND(PRECIO_PUBLICO * CANTIDAD, 2) AS TOTAL FROM LIBROS L, VENTAS V WHERE L.LIBRO_ID = V.LIBRO_ID ORDER BY L.TITULO;
-- 9)
SELECT L.TITULO FROM LIBROS L LEFT JOIN VENTAS V ON L.LIBRO_ID = V.LIBRO_ID WHERE FACTURA_NRO IS NULL ORDER BY TITULO;