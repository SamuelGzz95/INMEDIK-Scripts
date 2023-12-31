USE [Proveedor03]
GO
/****** Object:  Schema [usr]    Script Date: 23/10/2023 08:29:28 p. m. ******/
CREATE SCHEMA [usr]
GO
/****** Object:  Table [usr].[AccionMenuRol]    Script Date: 23/10/2023 08:29:28 p. m. ******/
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
/****** Object:  Table [usr].[Login]    Script Date: 23/10/2023 08:29:28 p. m. ******/
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
/****** Object:  Table [usr].[Notificacion]    Script Date: 23/10/2023 08:29:28 p. m. ******/
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
/****** Object:  Table [usr].[RefreshToken]    Script Date: 23/10/2023 08:29:28 p. m. ******/
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
/****** Object:  Table [usr].[Rol]    Script Date: 23/10/2023 08:29:28 p. m. ******/
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
/****** Object:  Table [usr].[Sexo]    Script Date: 23/10/2023 08:29:28 p. m. ******/
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
/****** Object:  Table [usr].[Usuario]    Script Date: 23/10/2023 08:29:28 p. m. ******/
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
