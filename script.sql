USE [master]
GO
/****** Object:  Database [Autospare]    Script Date: 19/11/2021 08:43:46 a. m. ******/
CREATE DATABASE [Autospare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Autospare', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER12\MSSQL\DATA\Autospare.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Autospare_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER12\MSSQL\DATA\Autospare_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Autospare] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Autospare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Autospare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Autospare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Autospare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Autospare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Autospare] SET ARITHABORT OFF 
GO
ALTER DATABASE [Autospare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Autospare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Autospare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Autospare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Autospare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Autospare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Autospare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Autospare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Autospare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Autospare] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Autospare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Autospare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Autospare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Autospare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Autospare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Autospare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Autospare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Autospare] SET RECOVERY FULL 
GO
ALTER DATABASE [Autospare] SET  MULTI_USER 
GO
ALTER DATABASE [Autospare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Autospare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Autospare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Autospare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Autospare] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Autospare] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Autospare', N'ON'
GO
ALTER DATABASE [Autospare] SET QUERY_STORE = OFF
GO
USE [Autospare]
GO
/****** Object:  Table [dbo].[AltaProducto]    Script Date: 19/11/2021 08:43:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AltaProducto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [varchar](100) NOT NULL,
	[Precio] [decimal](18, 0) NOT NULL,
	[Stock] [varchar](100) NOT NULL,
	[Foto] [varchar](100) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_AltaProducto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 19/11/2021 08:43:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompra] [varchar](100) NULL,
	[CantidadCompra] [int] NULL,
	[Precio] [decimal](18, 0) NULL,
	[IdCliente] [int] NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Correo]    Script Date: 19/11/2021 08:43:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Correo](
	[IdCorreo] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Correo] PRIMARY KEY CLUSTERED 
(
	[IdCorreo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 19/11/2021 08:43:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCompra](
	[IdCliente] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdCompra] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 19/11/2021 08:43:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domicilio](
	[IdDomicilio] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Municipio] [varchar](150) NOT NULL,
	[Estado] [varchar](150) NOT NULL,
	[CodigoPostal] [int] NOT NULL,
 CONSTRAINT [PK_Domicilio] PRIMARY KEY CLUSTERED 
(
	[IdDomicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nuevocliente]    Script Date: 19/11/2021 08:43:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nuevocliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[ApellidoP] [varchar](100) NOT NULL,
	[ApellidoM] [varchar](100) NOT NULL,
	[IdDomicilio] [int] NOT NULL,
	[IdCorreo] [int] NOT NULL,
	[IdCompra] [int] NOT NULL,
	[IdTarjeta] [int] NOT NULL,
 CONSTRAINT [PK_Nuevocliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 19/11/2021 08:43:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[IdTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[NumeroTarjeta] [int] NULL,
	[Vencimiento] [date] NULL,
	[Verificacion] [int] NULL,
	[IdCompra] [int] NULL,
 CONSTRAINT [PK_Tarjeta] PRIMARY KEY CLUSTERED 
(
	[IdTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_AltaProducto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[AltaProducto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_AltaProducto]
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_Compra] FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compra] ([IdCompra])
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_Compra]
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_Nuevocliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Nuevocliente] ([IdCliente])
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_Nuevocliente]
GO
ALTER TABLE [dbo].[Nuevocliente]  WITH CHECK ADD  CONSTRAINT [FK_Nuevocliente_Compra] FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compra] ([IdCompra])
GO
ALTER TABLE [dbo].[Nuevocliente] CHECK CONSTRAINT [FK_Nuevocliente_Compra]
GO
ALTER TABLE [dbo].[Nuevocliente]  WITH CHECK ADD  CONSTRAINT [FK_Nuevocliente_Correo] FOREIGN KEY([IdCorreo])
REFERENCES [dbo].[Correo] ([IdCorreo])
GO
ALTER TABLE [dbo].[Nuevocliente] CHECK CONSTRAINT [FK_Nuevocliente_Correo]
GO
ALTER TABLE [dbo].[Nuevocliente]  WITH CHECK ADD  CONSTRAINT [FK_Nuevocliente_Domicilio] FOREIGN KEY([IdDomicilio])
REFERENCES [dbo].[Domicilio] ([IdDomicilio])
GO
ALTER TABLE [dbo].[Nuevocliente] CHECK CONSTRAINT [FK_Nuevocliente_Domicilio]
GO
ALTER TABLE [dbo].[Nuevocliente]  WITH CHECK ADD  CONSTRAINT [FK_Nuevocliente_Tarjeta] FOREIGN KEY([IdTarjeta])
REFERENCES [dbo].[Tarjeta] ([IdTarjeta])
GO
ALTER TABLE [dbo].[Nuevocliente] CHECK CONSTRAINT [FK_Nuevocliente_Tarjeta]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_Tarjeta_Compra] FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compra] ([IdCompra])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_Tarjeta_Compra]
GO
USE [master]
GO
ALTER DATABASE [Autospare] SET  READ_WRITE 
GO
