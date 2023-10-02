--Borrar lo configurable
--DB de admin
DELETE FROM ClienteDireccion
DELETE FROM ClienteDocumentos
DELETE FROM Cliente

DELETE FROM ProveedorDireccion
DELETE FROM ProveedorDocumentos
DELETE FROM ProveedorCategoria
DELETE FROM Proveedor

DELETE FROM Concepto
DELETE FROM Categoria

DELETE FROM TenantModulo
DELETE FROM Tenant


--DB de admin, clientes, proveedores
DELETE FROM usr.AccionMenuRol
DELETE FROM usr.Login
DELETE FROM usr.Notificacion
DELETE FROM usr.RefreshToken
DELETE FROM usr.Usuario
DELETE FROM usr.Rol
DELETE FROM usr.Sexo


--Borrar catalogos
DELETE FROM AccionMenu
DELETE FROM Accion
DELETE FROM Menu
DELETE FROM TipoMenu
DELETE FROM TipoTenant
DELETE FROM Modulo

DELETE FROM Municipio
DELETE FROM Estado

