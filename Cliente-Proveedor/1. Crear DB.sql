IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'Proveedor03') -- Ejemplo de nombre de proveedor o cliente
  BEGIN
    CREATE DATABASE Proveedor03
  END