use TiendaOnline;

-- Ejercicios 1-10

-- 1  Obtén todos los clientes cuyo nombre sea "Juan Pérez".
SELECT * FROM Clientes WHERE Nombre = 'Juan Peréz';


-- 2 Muestra todos los productos cuyo precio no sea igual a 100.
SELECT * FROM Productos WHERE Precio != 100;

-- 3 Encuentra todos los pedidos cuyo total sea mayor a 500.
SELECT * FROM Pedidos WHERE Total > 500;

-- 4 Encuentra todos los productos con menos de 20 unidades en stock.
SELECT * FROM Productos WHERE Stock < 20;

-- 5 Muestra todos los clientes registrados después del 1 de enero de 2024.
SELECT * FROM Clientes WHERE Fecha_Registro > '2024-01-01';

-- 6 Obtén todos los productos con un precio entre 100 y 500.
SELECT * FROM Productos WHERE Precio between 100 AND 500;

-- 7 Encuentra todos los pedidos cuyo total no esté entre 200 y 1000.
SELECT * FROM Pedidos WHERE Total NOT between 200 AND 1000;

-- 8 Muestra todos los clientes cuyo ID_Cliente sea 1, 3, o 5.
SELECT * FROM Clientes WHERE ID_Cliente IN (1,3,5);

-- 9 Encuentra todos los productos cuyo ID_Producto no sea 2 ni 4.
SELECT * FROM Productos WHERE ID_Producto NOT IN (2,4);

-- 10 Muestra todos los pedidos realizados en el año 2024.
SELECT * FROM Pedidos WHERE Fecha_Pedido like '2024%';



-- Ejercicios 11-20

-- 11 Muestra todos los clientes y sus pedidos.
SELECT Clientes.Nombre as Nombre, Pedidos.ID_Pedido as Pedido, Pedidos.Fecha_Pedido as fecha,
Pedidos.total as total 
FROM Clientes JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente;

-- 12 Obtén todos los pedidos junto con los nombres de los productos y la cantidad de cada producto en esos pedidos.
SELECT Pedidos.ID_Pedido, Productos.Nombre as Nombre, Pedidos_Productos.Cantidad
FROM Pedidos 
JOIN Pedidos_Productos ON Pedidos.ID_Pedido = Pedidos_Productos.ID_Pedido
JOIN Productos ON Pedidos_Productos.ID_Producto = Productos.ID_Producto;

-- 13 Muestra el nombre de cada cliente y el número total de pedidos que ha realizado. **(usar COUNT, LEFT JOIN, GROUP BY)
SELECT Clientes.Nombre as Cliente, COUNT(Pedidos.ID_Pedido) as Total_Pedido 
from Clientes LEFT JOIN Pedidos on Clientes.ID_Cliente = Pedidos.ID_Cliente
GROUP BY Clientes.ID_Cliente;

-- 14 Encuentra el nombre del cliente y el total gastado por cada uno. **(usar SUM, GROUP BY)
SELECT Clientes.Nombre as Cliente, SUM(Pedidos.Total) as Total_Gastado
from Clientes JOIN Pedidos on Clientes.ID_Cliente = Pedidos.ID_Cliente
group by Clientes.ID_Cliente;


-- 15 Obtén el nombre del cliente y el total de cada uno de sus pedidos realizados después del 1 de febrero de 2024. 
SELECT Clientes.Nombre as Cliente, Pedidos.Total From Clientes 
Join Pedidos on Clientes.ID_Cliente = Pedidos.ID_Cliente
WHERE Fecha_Pedido > '2024-02-01';

-- 16  Encuentra todos los productos que nunca han sido vendidos. **(usar NOT IN con doble SELECT)
SELECT Productos.Nombre from Productos WHERE Productos.ID_Producto
not in (SELECT Pedidos_Productos.ID_Producto from Pedidos_Productos);

-- 17 Muestra el nombre del cliente que ha realizado el pedido más caro. **(usar ORDER BY, DESC, LIMIT) 
SELECT Clientes.Nombre as Cliente from Clientes join Pedidos on Clientes.ID_Cliente = 
Pedidos.ID_Cliente order by Pedidos.Total desc
limit 1;

-- 18 Encuentra el nombre de cada producto y la cantidad total vendida de ese producto. **(usar SUM, GROUP BY) 
SELECT Productos.Nombre as Productos, SUM(Pedidos_Productos.Cantidad) as Total_Ventas
from Productos Join Pedidos_Productos on Productos.ID_Producto = Pedidos_Productos.ID_Producto
group by Productos.Nombre;

-- 19  Muestra el nombre y dirección de todos los clientes junto con sus pedidos realizados.
SELECT Clientes.Nombre as Cliente, Direcciones.Calle, Pedidos.ID_Pedido,
Pedidos.Fecha_Pedido, Pedidos.Estado, Pedidos.Total from Clientes
Join Direcciones on Clientes.ID_Direccion = Direcciones.ID_Direccion
join Pedidos on Clientes.ID_Cliente = Pedidos.ID_Cliente;

-- 20 Muestra todos los productos cuyo nombre contiene la palabra "Sony".
SELECT Productos.Nombre FROM Productos WHERE Nombre LIKE '%Sony%';


