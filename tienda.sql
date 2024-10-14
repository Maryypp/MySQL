-- Crear la base de datos
CREATE DATABASE TiendaOnline;

-- Usar la base de datos
USE TiendaOnline;

-- Crear la tabla Direcciones (Relacion 1:1 con Clientes)
CREATE TABLE Direcciones (
ID_Direccion INT auto_increment PRIMARY KEY,                   -- Clave primaria de la direccion
Calle varchar(255) NOT NULL,                                   -- Calle de la direccion
Cuidad varchar(100) NOT NULL,                                  -- Cuidad
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
ID_Direcciones INT UNIQUE,                                      -- Relacion 1:1 con Direcciones
FOREIGN KEY (ID_Direcciones) REFERENCES Direcciones(ID_Direcciones)  -- Clave foranea
);