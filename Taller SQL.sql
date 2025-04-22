#Crear base de datos
CREATE DATABASE Tienda_Taller;
USE Tienda_Taller;
#Crear tablas
CREATE TABLE Productos (
id INT PRIMARY KEY,
nombre VARCHAR (100),
precio DECIMAL (10, 2)
);
CREATE TABLE Categorias (
id INT PRIMARY KEY,
nombre VARCHAR (100)
);
CREATE TABLE Productos_Categorias (
producto_id INT,
categoria_id INT,
FOREIGN KEY (producto_id) REFERENCES Productos (id),
FOREIGN KEY (categoria_id) REFERENCES Categorias (id)
);
#Insertar datos
INSERT INTO Categorias (id, nombre) VALUES (1, 'Bebidas');
INSERT INTO Categorias (id, nombre) VALUES (2, 'Dulces');
INSERT INTO Productos (id, nombre, precio) VALUES (1, 'Pepsi', 2.500);
INSERT INTO Productos (id, nombre, precio) VALUES (2, 'Arequipe', 1.000);
INSERT INTO Productos (id, nombre, precio) VALUES (3, 'Aguila light', 12.000);
INSERT INTO Productos_Categorias (producto_id, categoria_id) VALUES (1, 1);
INSERT INTO Productos_Categorias (producto_id, categoria_id) VALUES (2, 2);
INSERT INTO Productos_Categorias (producto_id, categoria_id) VALUES (3, 1);
#Consultas
#Productos disponibles y precios
SELECT nombre, precio FROM Productos;
#Productos con precio mayor a 10k
SELECT nombre, precio FROM Productos WHERE precio >10;
#Productos y sus categorias
SELECT p.nombre AS producto, c.nombre AS categoria
FROM Productos p
JOIN Productos_Categorias pc ON p.id = pc.producto_id
JOIN Categorias c ON pc.categoria_id = c.id;
#Categorias con o sin productos
SELECT c.nombre AS categoria, p.nombre AS producto
FROM Categorias c
LEFT JOIN Productos_Categorias pc ON c.id = pc.categoria_id
LEFT JOIN Productos p ON p.id = pc.producto_id;
#Preguntas abiertas
#Claves foraneas: sirven para relacionar datos entre tablas
#inner join: muestra registros que coinciden en ambas tablas
#left join: Devuelve todos los registros de la tabla izquierda y los coincidentes (si los hay) de la tabla derecha

