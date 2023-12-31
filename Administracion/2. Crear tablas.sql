USE [Administracion]
GO
/****** Object:  Schema [usr]    Script Date: 20/11/2023 10:04:13 p. m. ******/
CREATE SCHEMA [usr]
GO
/****** Object:  Table [dbo].[Accion]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accion](
	[Id] [tinyint] NOT NULL,
	[Clave] [nvarchar](20) NOT NULL,
	[Color] [nvarchar](10) NOT NULL,
	[Icono] [nvarchar](30) NOT NULL,
	[Titulo] [nvarchar](30) NULL,
	[Tooltip] [nvarchar](30) NULL,
 CONSTRAINT [PK_Accion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccionMenu]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccionMenu](
	[MenuId] [smallint] NOT NULL,
	[AccionId] [tinyint] NOT NULL,
 CONSTRAINT [PK_AccionMenu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC,
	[AccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](80) NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[RFC] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](70) NOT NULL,
	[Telefono] [nvarchar](10) NOT NULL,
	[Logo] [bit] NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClienteDireccion]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteDireccion](
	[ClienteId] [uniqueidentifier] NOT NULL,
	[Calle] [nvarchar](100) NOT NULL,
	[Numero] [nvarchar](5) NOT NULL,
	[CodigoPostal] [nvarchar](6) NOT NULL,
	[Colonia] [nvarchar](40) NOT NULL,
	[MunicipioId] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_ClienteDireccion] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClienteDocumentos]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteDocumentos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Extencion] [nvarchar](4) NOT NULL,
	[TamanoKB] [nvarchar](8) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ClienteDocumentos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[Id] [uniqueidentifier] NOT NULL,
	[CategoriaId] [uniqueidentifier] NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Clave] [nvarchar](50) NOT NULL,
	[CodigoBarras] [nvarchar](15) NOT NULL,
	[IVA] [decimal](5, 2) NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Concepto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[Id] [nvarchar](2) NOT NULL,
	[Nombre] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [smallint] NOT NULL,
	[ModuloId] [tinyint] NULL,
	[MenuPadreId] [smallint] NULL,
	[TipoMenuId] [tinyint] NOT NULL,
	[Nombre] [nvarchar](75) NOT NULL,
	[Icono] [nvarchar](35) NULL,
	[URL] [nvarchar](100) NULL,
	[TipoTenantId] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modulo]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modulo](
	[Id] [tinyint] NOT NULL,
	[Nombre] [nvarchar](60) NOT NULL,
	[URL] [nvarchar](200) NOT NULL,
	[Icono] [nvarchar](35) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Premium] [bit] NOT NULL,
 CONSTRAINT [PK_Modulos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipio](
	[Id] [nvarchar](6) NOT NULL,
	[EstadoId] [nvarchar](2) NOT NULL,
	[Nombre] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Municipio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[RFC] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](70) NOT NULL,
	[Telefono] [nvarchar](10) NOT NULL,
	[Logo] [bit] NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProveedorCategoria]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProveedorCategoria](
	[ProveedorId] [uniqueidentifier] NOT NULL,
	[CategoriaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ProveedorCategoria] PRIMARY KEY CLUSTERED 
(
	[ProveedorId] ASC,
	[CategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProveedorDireccion]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProveedorDireccion](
	[ProveedorId] [uniqueidentifier] NOT NULL,
	[Calle] [nvarchar](100) NOT NULL,
	[Numero] [nvarchar](5) NOT NULL,
	[CodigoPostal] [nvarchar](6) NOT NULL,
	[Colonia] [nvarchar](40) NOT NULL,
	[MunicipioId] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_ProveedorDireccion] PRIMARY KEY CLUSTERED 
(
	[ProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProveedorDocumentos]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProveedorDocumentos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProveedorId] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Extencion] [nvarchar](4) NOT NULL,
	[TamanoKB] [nvarchar](8) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ProveedorDocumentos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenant](
	[Id] [uniqueidentifier] NOT NULL,
	[ProveedorId] [uniqueidentifier] NULL,
	[ClienteId] [uniqueidentifier] NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[TipoTenantId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TenantModulo]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenantModulo](
	[TenantId] [uniqueidentifier] NOT NULL,
	[ModuloId] [tinyint] NOT NULL,
	[FechaInicioPremium] [date] NULL,
	[FechaFinPremium] [date] NULL,
 CONSTRAINT [PK_TenantModulo] PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC,
	[ModuloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMenu]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMenu](
	[Id] [tinyint] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTenant]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTenant](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](14) NOT NULL,
 CONSTRAINT [PK_TipoTenant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usr].[AccionMenuRol]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usr].[AccionMenuRol](
	[MenuId] [smallint] NOT NULL,
	[RolId] [tinyint] NOT NULL,
	[AccionId] [tinyint] NOT NULL,
 CONSTRAINT [PK_AccionMenuRol] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC,
	[RolId] ASC,
	[AccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usr].[Login]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usr].[Login](
	[UsuarioId] [uniqueidentifier] NOT NULL,
	[NombreUsuario] [nvarchar](40) NOT NULL,
	[ContrasenaHash] [nvarchar](500) NOT NULL,
	[CambioContrasena] [bit] NOT NULL,
	[ResetToken] [nvarchar](500) NULL,
	[ResetTokenExpires] [datetime] NULL,
	[PasswordReset] [datetime] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usr].[Notificacion]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usr].[Notificacion](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](75) NOT NULL,
	[Mensaje] [nvarchar](500) NOT NULL,
	[Importante] [bit] NOT NULL,
	[Visto] [bit] NOT NULL,
	[FechaCreacion] [nchar](10) NULL,
 CONSTRAINT [PK_Notificacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usr].[RefreshToken]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usr].[RefreshToken](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [uniqueidentifier] NOT NULL,
	[Token] [nvarchar](500) NOT NULL,
	[Expires] [datetime] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedByIp] [nvarchar](50) NOT NULL,
	[Revoked] [datetime] NULL,
	[RevokedByIp] [nvarchar](50) NULL,
	[ReplaceByToken] [nvarchar](500) NULL,
	[ReasonRevoked] [nvarchar](500) NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usr].[Rol]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usr].[Rol](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Nivel] [tinyint] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usr].[Sexo]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usr].[Sexo](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Clave] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Sexo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usr].[Usuario]    Script Date: 20/11/2023 10:04:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usr].[Usuario](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](70) NOT NULL,
	[ApellidoPaterno] [nvarchar](70) NOT NULL,
	[ApellidoMaterno] [nvarchar](70) NOT NULL,
	[SexoId] [tinyint] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Email] [nvarchar](80) NOT NULL,
	[EmailConfirmado] [bit] NOT NULL,
	[Activo] [bit] NOT NULL,
	[RolId] [tinyint] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [UQ_ClienteId_notnull]    Script Date: 20/11/2023 10:04:13 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_ClienteId_notnull] ON [dbo].[Tenant]
(
	[ClienteId] ASC
)
WHERE ([ClienteId] IS NOT NULL AND [ProveedorId] IS NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_IdAdmin]    Script Date: 20/11/2023 10:04:13 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_IdAdmin] ON [dbo].[Tenant]
(
	[ClienteId] ASC,
	[ProveedorId] ASC
)
WHERE ([ClienteId] IS NULL AND [ProveedorId] IS NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_ProveedorId_notnull]    Script Date: 20/11/2023 10:04:13 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_ProveedorId_notnull] ON [dbo].[Tenant]
(
	[ProveedorId] ASC
)
WHERE ([ProveedorId] IS NOT NULL AND [ClienteId] IS NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Login_UserName]    Script Date: 20/11/2023 10:04:13 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Login_UserName] ON [usr].[Login]
(
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Usuario_Email]    Script Date: 20/11/2023 10:04:13 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Usuario_Email] ON [usr].[Usuario]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categoria] ADD  CONSTRAINT [DF_Categoria_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Categoria] ADD  CONSTRAINT [DF_Categoria_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [DF_Cliente_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [DF_Cliente_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ClienteDocumentos] ADD  CONSTRAINT [DF_ClienteDocumentos_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Concepto] ADD  CONSTRAINT [DF_Concepto_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Concepto] ADD  CONSTRAINT [DF_Concepto_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Proveedor] ADD  CONSTRAINT [DF_Proveedor_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Proveedor] ADD  CONSTRAINT [DF_Proveedor_Logo]  DEFAULT ((0)) FOR [Logo]
GO
ALTER TABLE [dbo].[Proveedor] ADD  CONSTRAINT [DF_Proveedor_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ProveedorDocumentos] ADD  CONSTRAINT [DF_ProveedorDocumentos_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Tenant] ADD  CONSTRAINT [DF_Tenants_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Tenant] ADD  CONSTRAINT [DF_Tenants_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [usr].[Login] ADD  CONSTRAINT [DF_Login_CambioContrasena]  DEFAULT ((1)) FOR [CambioContrasena]
GO
ALTER TABLE [usr].[Login] ADD  CONSTRAINT [DF_Login_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [usr].[Notificacion] ADD  CONSTRAINT [DF_Notificacion_Importante]  DEFAULT ((0)) FOR [Importante]
GO
ALTER TABLE [usr].[Notificacion] ADD  CONSTRAINT [DF_Notificacion_Visto]  DEFAULT ((0)) FOR [Visto]
GO
ALTER TABLE [usr].[Rol] ADD  CONSTRAINT [DF_Roles_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [usr].[Usuario] ADD  CONSTRAINT [DF_Usuario_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [usr].[Usuario] ADD  CONSTRAINT [DF_Usuario_EmailConfirmado]  DEFAULT ((0)) FOR [EmailConfirmado]
GO
ALTER TABLE [usr].[Usuario] ADD  CONSTRAINT [DF_Usuario_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[AccionMenu]  WITH CHECK ADD  CONSTRAINT [FK_AccionMenu_Accion] FOREIGN KEY([AccionId])
REFERENCES [dbo].[Accion] ([Id])
GO
ALTER TABLE [dbo].[AccionMenu] CHECK CONSTRAINT [FK_AccionMenu_Accion]
GO
ALTER TABLE [dbo].[AccionMenu]  WITH CHECK ADD  CONSTRAINT [FK_AccionMenu_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[AccionMenu] CHECK CONSTRAINT [FK_AccionMenu_Menu]
GO
ALTER TABLE [dbo].[ClienteDireccion]  WITH CHECK ADD  CONSTRAINT [FK_ClienteDireccion_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[ClienteDireccion] CHECK CONSTRAINT [FK_ClienteDireccion_Cliente]
GO
ALTER TABLE [dbo].[ClienteDireccion]  WITH CHECK ADD  CONSTRAINT [FK_ClienteDireccion_Municipio] FOREIGN KEY([MunicipioId])
REFERENCES [dbo].[Municipio] ([Id])
GO
ALTER TABLE [dbo].[ClienteDireccion] CHECK CONSTRAINT [FK_ClienteDireccion_Municipio]
GO
ALTER TABLE [dbo].[ClienteDocumentos]  WITH CHECK ADD  CONSTRAINT [FK_ClienteDocumentos_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[ClienteDocumentos] CHECK CONSTRAINT [FK_ClienteDocumentos_Cliente]
GO
ALTER TABLE [dbo].[Concepto]  WITH CHECK ADD  CONSTRAINT [FK_Concepto_Categoria] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Concepto] CHECK CONSTRAINT [FK_Concepto_Categoria]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Modulo] FOREIGN KEY([ModuloId])
REFERENCES [dbo].[Modulo] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Modulo]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_TipoMenu] FOREIGN KEY([TipoMenuId])
REFERENCES [dbo].[TipoMenu] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_TipoMenu]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_TipoTenant] FOREIGN KEY([TipoTenantId])
REFERENCES [dbo].[TipoTenant] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_TipoTenant]
GO
ALTER TABLE [dbo].[Municipio]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Estado] FOREIGN KEY([EstadoId])
REFERENCES [dbo].[Estado] ([Id])
GO
ALTER TABLE [dbo].[Municipio] CHECK CONSTRAINT [FK_Municipio_Estado]
GO
ALTER TABLE [dbo].[ProveedorCategoria]  WITH CHECK ADD  CONSTRAINT [FK_ProveedorCategoria_Categoria] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[ProveedorCategoria] CHECK CONSTRAINT [FK_ProveedorCategoria_Categoria]
GO
ALTER TABLE [dbo].[ProveedorCategoria]  WITH CHECK ADD  CONSTRAINT [FK_ProveedorCategoria_Proveedor] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedor] ([Id])
GO
ALTER TABLE [dbo].[ProveedorCategoria] CHECK CONSTRAINT [FK_ProveedorCategoria_Proveedor]
GO
ALTER TABLE [dbo].[ProveedorDireccion]  WITH CHECK ADD  CONSTRAINT [FK_ProveedorDireccion_Municipio] FOREIGN KEY([MunicipioId])
REFERENCES [dbo].[Municipio] ([Id])
GO
ALTER TABLE [dbo].[ProveedorDireccion] CHECK CONSTRAINT [FK_ProveedorDireccion_Municipio]
GO
ALTER TABLE [dbo].[ProveedorDireccion]  WITH CHECK ADD  CONSTRAINT [FK_ProveedorDireccion_Proveedor] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedor] ([Id])
GO
ALTER TABLE [dbo].[ProveedorDireccion] CHECK CONSTRAINT [FK_ProveedorDireccion_Proveedor]
GO
ALTER TABLE [dbo].[ProveedorDocumentos]  WITH CHECK ADD  CONSTRAINT [FK_ProveedorDocumentos_Proveedor] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedor] ([Id])
GO
ALTER TABLE [dbo].[ProveedorDocumentos] CHECK CONSTRAINT [FK_ProveedorDocumentos_Proveedor]
GO
ALTER TABLE [dbo].[Tenant]  WITH CHECK ADD  CONSTRAINT [FK_Tenants_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Tenant] CHECK CONSTRAINT [FK_Tenants_Cliente]
GO
ALTER TABLE [dbo].[Tenant]  WITH CHECK ADD  CONSTRAINT [FK_Tenants_Proveedor] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedor] ([Id])
GO
ALTER TABLE [dbo].[Tenant] CHECK CONSTRAINT [FK_Tenants_Proveedor]
GO
ALTER TABLE [dbo].[Tenant]  WITH CHECK ADD  CONSTRAINT [FK_Tenants_TipoTenant] FOREIGN KEY([TipoTenantId])
REFERENCES [dbo].[TipoTenant] ([Id])
GO
ALTER TABLE [dbo].[Tenant] CHECK CONSTRAINT [FK_Tenants_TipoTenant]
GO
ALTER TABLE [dbo].[TenantModulo]  WITH CHECK ADD  CONSTRAINT [FK_TenantModulo_Modulo] FOREIGN KEY([ModuloId])
REFERENCES [dbo].[Modulo] ([Id])
GO
ALTER TABLE [dbo].[TenantModulo] CHECK CONSTRAINT [FK_TenantModulo_Modulo]
GO
ALTER TABLE [dbo].[TenantModulo]  WITH CHECK ADD  CONSTRAINT [FK_TenantModulo_Tenant] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([Id])
GO
ALTER TABLE [dbo].[TenantModulo] CHECK CONSTRAINT [FK_TenantModulo_Tenant]
GO
ALTER TABLE [usr].[AccionMenuRol]  WITH CHECK ADD  CONSTRAINT [FK_AccionMenuRol_AccionMenu] FOREIGN KEY([MenuId], [AccionId])
REFERENCES [dbo].[AccionMenu] ([MenuId], [AccionId])
GO
ALTER TABLE [usr].[AccionMenuRol] CHECK CONSTRAINT [FK_AccionMenuRol_AccionMenu]
GO
ALTER TABLE [usr].[AccionMenuRol]  WITH CHECK ADD  CONSTRAINT [FK_AccionMenuRol_Rol] FOREIGN KEY([RolId])
REFERENCES [usr].[Rol] ([Id])
GO
ALTER TABLE [usr].[AccionMenuRol] CHECK CONSTRAINT [FK_AccionMenuRol_Rol]
GO
ALTER TABLE [usr].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [usr].[Usuario] ([Id])
GO
ALTER TABLE [usr].[Login] CHECK CONSTRAINT [FK_Login_Usuario]
GO
ALTER TABLE [usr].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [usr].[Usuario] ([Id])
GO
ALTER TABLE [usr].[RefreshToken] CHECK CONSTRAINT [FK_RefreshToken_Usuario]
GO
ALTER TABLE [usr].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([RolId])
REFERENCES [usr].[Rol] ([Id])
GO
ALTER TABLE [usr].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
ALTER TABLE [usr].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Sexo] FOREIGN KEY([SexoId])
REFERENCES [usr].[Sexo] ([Id])
GO
ALTER TABLE [usr].[Usuario] CHECK CONSTRAINT [FK_Usuario_Sexo]
GO
USE [master]
GO
ALTER DATABASE [Administracion] SET  READ_WRITE 
GO
