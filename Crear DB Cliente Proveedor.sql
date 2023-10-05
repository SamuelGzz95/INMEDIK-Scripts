-- Declara una variable para el nombre de la base de datos
DECLARE @NombreDeLaBaseDeDatos NVARCHAR(MAX);
SET @NombreDeLaBaseDeDatos = 'Proveedor-02'; -- Puedes cambiar 'NombreDeTuBaseDeDatos' por el nombre que desees

-- Construye el comando SQL dinámico para crear la base de datos con el nombre de la variable
DECLARE @sql NVARCHAR(MAX);
SET @sql = 'CREATE DATABASE ' + QUOTENAME(@NombreDeLaBaseDeDatos);

-- Ejecuta el comando SQL
EXEC sp_executesql @sql;
