IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'Cotizacion') -- Ejemplo de nombre de proveedor o cliente
  BEGIN
    CREATE DATABASE Cotizacion
  END