USE [Cotizacion]
GO
/****** Object:  Table [dbo].[Cotizacion]    Script Date: 20/11/2023 10:02:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cotizacion](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
	[EstatusCotizacionId] [tinyint] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Cotizacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CotizacionConcepto]    Script Date: 20/11/2023 10:02:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CotizacionConcepto](
	[CotizacionId] [bigint] NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
	[ConceptoId] [uniqueidentifier] NOT NULL,
	[CategoriaId] [uniqueidentifier] NOT NULL,
	[ProveedorId] [uniqueidentifier] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnidad] [money] NULL,
	[PrecioSubTotal] [money] NULL,
	[PrecioTotal] [money] NULL,
 CONSTRAINT [PK_CotizacionConcepto] PRIMARY KEY CLUSTERED 
(
	[CotizacionId] ASC,
	[ClienteId] ASC,
	[ConceptoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CotizacionConceptoProovedor]    Script Date: 20/11/2023 10:02:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CotizacionConceptoProovedor](
	[CotizacionId] [bigint] NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
	[ConceptoId] [uniqueidentifier] NOT NULL,
	[ProveedorId] [uniqueidentifier] NOT NULL,
	[CategoriaId] [uniqueidentifier] NOT NULL,
	[PrecioSubTotal] [money] NOT NULL,
	[PrecioUnidad] [money] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CotizacionConceptoProovedor] PRIMARY KEY CLUSTERED 
(
	[CotizacionId] ASC,
	[ClienteId] ASC,
	[ConceptoId] ASC,
	[ProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstatusCotizacion]    Script Date: 20/11/2023 10:02:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstatusCotizacion](
	[Id] [tinyint] NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Prioridad] [tinyint] NOT NULL,
 CONSTRAINT [PK_EstatusCotizacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 20/11/2023 10:02:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[CotizacionId] [bigint] NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
	[ProveedorId] [uniqueidentifier] NOT NULL,
	[NoFactura] [int] IDENTITY(1,1) NOT NULL,
	[Total] [money] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[CotizacionId] ASC,
	[ClienteId] ASC,
	[ProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaConcepto]    Script Date: 20/11/2023 10:02:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaConcepto](
	[CotizacionId] [bigint] NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
	[ProveedorId] [uniqueidentifier] NOT NULL,
	[ConceptoID] [uniqueidentifier] NOT NULL,
	[CategoriaID] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnidad] [money] NOT NULL,
	[SubTotal] [money] NOT NULL,
	[IVA] [decimal](5, 2) NOT NULL,
	[Total] [money] NOT NULL,
 CONSTRAINT [PK_FacturaConcepto] PRIMARY KEY CLUSTERED 
(
	[CotizacionId] ASC,
	[ClienteId] ASC,
	[ProveedorId] ASC,
	[ConceptoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oferta]    Script Date: 20/11/2023 10:02:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oferta](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProveedorId] [uniqueidentifier] NOT NULL,
	[ConceptoId] [uniqueidentifier] NOT NULL,
	[CantidadMin] [int] NULL,
	[CantidadMax] [int] NULL,
	[Precio] [money] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [uniqueidentifier] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Oferta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cotizacion] ADD  CONSTRAINT [DF_Cotizacion_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[CotizacionConceptoProovedor] ADD  CONSTRAINT [DF_CotizacionConceptoProovedor_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Factura] ADD  CONSTRAINT [DF_Factura_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Oferta] ADD  CONSTRAINT [DF_Oferta_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_Cotizacion_EstatusCotizacion] FOREIGN KEY([EstatusCotizacionId])
REFERENCES [dbo].[EstatusCotizacion] ([Id])
GO
ALTER TABLE [dbo].[Cotizacion] CHECK CONSTRAINT [FK_Cotizacion_EstatusCotizacion]
GO
ALTER TABLE [dbo].[CotizacionConcepto]  WITH CHECK ADD  CONSTRAINT [FK_CotizacionConcepto_Cotizacion] FOREIGN KEY([CotizacionId], [ClienteId])
REFERENCES [dbo].[Cotizacion] ([Id], [ClienteId])
GO
ALTER TABLE [dbo].[CotizacionConcepto] CHECK CONSTRAINT [FK_CotizacionConcepto_Cotizacion]
GO
ALTER TABLE [dbo].[CotizacionConceptoProovedor]  WITH CHECK ADD  CONSTRAINT [FK_CotizacionConceptoProovedor_Cotizacion] FOREIGN KEY([CotizacionId], [ClienteId])
REFERENCES [dbo].[Cotizacion] ([Id], [ClienteId])
GO
ALTER TABLE [dbo].[CotizacionConceptoProovedor] CHECK CONSTRAINT [FK_CotizacionConceptoProovedor_Cotizacion]
GO
ALTER TABLE [dbo].[CotizacionConceptoProovedor]  WITH CHECK ADD  CONSTRAINT [FK_CotizacionConceptoProovedor_CotizacionConcepto] FOREIGN KEY([CotizacionId], [ClienteId], [ConceptoId])
REFERENCES [dbo].[CotizacionConcepto] ([CotizacionId], [ClienteId], [ConceptoId])
GO
ALTER TABLE [dbo].[CotizacionConceptoProovedor] CHECK CONSTRAINT [FK_CotizacionConceptoProovedor_CotizacionConcepto]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cotizacion] FOREIGN KEY([CotizacionId], [ClienteId])
REFERENCES [dbo].[Cotizacion] ([Id], [ClienteId])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cotizacion]
GO
ALTER TABLE [dbo].[FacturaConcepto]  WITH CHECK ADD  CONSTRAINT [FK_FacturaConcepto_Factura] FOREIGN KEY([CotizacionId], [ClienteId], [ProveedorId])
REFERENCES [dbo].[Factura] ([CotizacionId], [ClienteId], [ProveedorId])
GO
ALTER TABLE [dbo].[FacturaConcepto] CHECK CONSTRAINT [FK_FacturaConcepto_Factura]
GO
