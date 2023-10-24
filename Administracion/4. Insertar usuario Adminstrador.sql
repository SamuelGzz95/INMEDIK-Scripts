--Insert Administracion

BEGIN
DECLARE @tenantId uniqueidentifier;
Declare @rolId tinyint;
DECLARE @sexoId tinyint;
DECLARE @usuarioId uniqueidentifier;
INSERT INTO Tenant(Id,Nombre,TipoTenantId,FechaCreacion,UsuarioCreacion)
VALUES(NEWID(),'Administración',1,SYSDATETIME(),'00000000-0000-0000-0000-000000000000');

SET @tenantId = (SELECT TOP 1 Id FROM Tenant WHERE UsuarioCreacion = '00000000-0000-0000-0000-000000000000')

INSERT INTO TenantModulo(TenantId,ModuloId) VALUES(@tenantId,1);
INSERT INTO TenantModulo(TenantId,ModuloId) VALUES(@tenantId,2);
INSERT INTO TenantModulo(TenantId,ModuloId) VALUES(@tenantId,3);

INSERT INTO usr.Sexo(Nombre,Clave) VALUES('Femenino','F');
INSERT INTO usr.Sexo(Nombre,Clave) VALUES('Masculino','M');
INSERT INTO usr.Sexo(Nombre,Clave) VALUES('Otro','NA');
SET @sexoId = SCOPE_IDENTITY();

INSERT INTO usr.Rol(Nombre,Activo,Nivel,FechaCreacion,UsuarioCreacion)
VALUES('Administrador',1,1,SYSDATETIME(),'00000000-0000-0000-0000-000000000000');

SET @rolId = SCOPE_IDENTITY();
--Menu Usuarios
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(1,@rolId,1); --Accion Agregar
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(1,@rolId,2); --Accion Editar
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(1,@rolId,3); --Accion Ver
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(1,@rolId,8); --Accion Cambiar estatus
--Menu Clientes
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(4,@rolId,1); --Accion Agregar
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(4,@rolId,2); --Accion Editar
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(4,@rolId,3); --Accion Ver
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(4,@rolId,8); --Accion Cambiar estatus
--Menu Proveedores
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(5,@rolId,1); --Accion Agregar
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(5,@rolId,2); --Accion Editar
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(5,@rolId,3); --Accion Ver
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(5,@rolId,8); --Accion Cambiar estatus
--Menu Categorias
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(6,@rolId,1); --Accion Agregar
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(6,@rolId,2); --Accion Editar
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(6,@rolId,3); --Accion Ver
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(6,@rolId,8); --Accion Cambiar estatus
--Menu Conceptos
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(7,@rolId,1); --Accion Agregar
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(7,@rolId,2); --Accion Editar
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(7,@rolId,3); --Accion Ver
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(7,@rolId,8); --Accion Cambiar estatus
--Menu Roles
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(11,@rolId,1); --Accion Agregar
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(11,@rolId,2); --Accion Editar
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(11,@rolId,3); --Accion Ver
INSERT INTO usr.AccionMenuRol(MenuId,RolId,AccionId) Values(11,@rolId,8); --Accion Cambiar estatus


INSERT INTO usr.Usuario(Id ,Nombre ,ApellidoPaterno ,ApellidoMaterno ,SexoId ,FechaNacimiento ,Email ,EmailConfirmado ,Activo ,RolId ,FechaCreacion ,UsuarioCreacion)
VALUES(NEWID(),'Administrador','','',@sexoId,'1995-09-21','admin@administracion.com',1,1,@rolId,SYSDATETIME(),'00000000-0000-0000-0000-000000000000');

SET @usuarioId =(SELECT Id FROM usr.Usuario WHERE UsuarioCreacion ='00000000-0000-0000-0000-000000000000');

INSERT INTO usr.Login(UsuarioId,NombreUsuario,ContrasenaHash,CambioContrasena,FechaCreacion,UsuarioCreacion)
VALUES(@usuarioId,'admin','123456789',1,SYSDATETIME(),'00000000-0000-0000-0000-000000000000');

END