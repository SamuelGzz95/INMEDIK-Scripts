IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'Administracion')
  BEGIN
    CREATE DATABASE Administracion
  END