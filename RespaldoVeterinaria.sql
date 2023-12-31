USE [master]
GO
/****** Object:  Database [RespaldoVeterinaria]    Script Date: 29-06-2023 19:28:11 ******/
CREATE DATABASE [RespaldoVeterinaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RespaldoVeterinaria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RespaldoVeterinaria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RespaldoVeterinaria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RespaldoVeterinaria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RespaldoVeterinaria] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RespaldoVeterinaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RespaldoVeterinaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RespaldoVeterinaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RespaldoVeterinaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RespaldoVeterinaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RespaldoVeterinaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RespaldoVeterinaria] SET  MULTI_USER 
GO
ALTER DATABASE [RespaldoVeterinaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RespaldoVeterinaria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RespaldoVeterinaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RespaldoVeterinaria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RespaldoVeterinaria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RespaldoVeterinaria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RespaldoVeterinaria] SET QUERY_STORE = ON
GO
ALTER DATABASE [RespaldoVeterinaria] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RespaldoVeterinaria]
GO
/****** Object:  Table [dbo].[Atenciones]    Script Date: 29-06-2023 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atenciones](
	[ID_A] [int] IDENTITY(1,1) NOT NULL,
	[ID_Paciente] [int] NULL,
	[ID_Empleado] [int] NULL,
	[ID_Medicamento] [int] NULL,
	[Fecha_Entrada] [date] NULL,
	[Fecha_Salida] [date] NULL,
	[Costo_Atencion] [varchar](250) NULL,
	[Diagnostico] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_A] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dueños]    Script Date: 29-06-2023 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dueños](
	[ID_D] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Rut] [int] NULL,
	[Direccion] [varchar](50) NULL,
	[Numero_Contacto] [int] NULL,
	[Correo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_D] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 29-06-2023 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[ID_E] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Rut] [varchar](15) NULL,
	[Rol] [varchar](100) NULL,
	[Sueldo] [varchar](150) NULL,
	[Clave] [varchar](30) NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_E] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 29-06-2023 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[ID_M] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](255) NULL,
	[Precio] [int] NULL,
	[Fecha_Vencimiento] [date] NULL,
	[Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_M] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 29-06-2023 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[ID_P] [int] IDENTITY(1,1) NOT NULL,
	[ID_Dueño] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Especie] [varchar](50) NULL,
	[Raza] [varchar](50) NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Peso] [varchar](50) NULL,
	[Estado_Ficha] [varchar](255) NULL,
	[Codigo_Estado] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_P] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Atenciones]  WITH CHECK ADD FOREIGN KEY([ID_Medicamento])
REFERENCES [dbo].[Medicamentos] ([ID_M])
GO
ALTER TABLE [dbo].[Atenciones]  WITH CHECK ADD FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Pacientes] ([ID_P])
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD FOREIGN KEY([ID_Dueño])
REFERENCES [dbo].[Dueños] ([ID_D])
GO
/****** Object:  StoredProcedure [dbo].[ingresar]    Script Date: 29-06-2023 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ingresar]
@Rut int,
@Clave varchar (500)
as begin
select * from Empleados where Rut = @Rut and Clave = @Clave
end
GO
USE [master]
GO
ALTER DATABASE [RespaldoVeterinaria] SET  READ_WRITE 
GO
