-- Crear la base de datos
CREATE DATABASE TiendaOnline;

-- Usar la base de datos
USE TiendaOnline;

-- Crear la tabla Direcciones (Relacion 1:1 con Clientes)
CREATE TABLE Direcciones (
ID_Direccion INT auto_increment PRIMARY KEY,                   -- Clave primaria de la direccion
Calle varchar(255) NOT NULL,                                   -- Calle de la direccion
Ciudad varchar(100) NOT NULL,                                  -- Cuidad
Estado varchar(100) NOT NULL,                                  -- Estado
Codigo_Postal varchar(10) NOT NULL,                            -- Codigo postal
Pais varchar(100) NOT NULL                                     -- País
);

-- Crear la tabla clientes ( CON RELACION 1:1 CON Direcciones)
CREATE TABLE Clientes (
ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,                      -- Clave primaria de clientes
Nombre varchar(100) not null,                                   -- Nombre del cliente
Email varchar(100) not null unique,                             -- Email unico del cliente
Telefono varchar(15),                                           -- Telefono del cliente
Fecha_Registro DATE,                                            -- Fecha de registro del cliente
ID_Direccion INT UNIQUE,                                      -- Relacion 1:1 con Direcciones
FOREIGN KEY (ID_Direccion) REFERENCES Direcciones(ID_Direccion)  -- Clave foranea
);

-- Crear la tabla productos
CREATE TABLE Productos (
ID_Producto INT AUTO_INCREMENT PRIMARY KEY,                      -- Clave primaria de productos
Nombre varchar(100) not null,                                    -- Nombre del producto
Descripcion text,                                                -- Descripcion del producto
Precio DECIMAL(10,2) NOT NULL,                                   -- Precio del producto
Stock INT NOT NULL,                                              -- Cantidad en stock
Fecha_Agregado DATE                                              -- Fecha en la que se agregó el producto
);

CREATE TABLE Pedidos (
ID_Pedido INT auto_increment PRIMARY KEY,
ID_Cliente INT,
Fecha_Pedido DATE NOT NULL,
Estado varchar(50),
total decimal(10,2),
foreign key (ID_Cliente) references Clientes(ID_Cliente)
);

CREATE TABLE Pedidos_Productos (
ID_Pedido INT,
ID_Producto INT,
Cantidad INT NOT NULL,
Precio_Unitario DECIMAL(10,2) NOT NULL,
PRIMARY KEY (ID_Pedido, ID_Producto),
foreign key (ID_Pedido) references Pedidos(ID_Pedido),
foreign key (ID_Producto) references Productos(ID_Producto)
);