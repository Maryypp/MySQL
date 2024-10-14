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