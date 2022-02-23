USE [master]
GO
/****** Object:  Database [pt1]    Script Date: 2/18/2022 10:01:08 PM ******/
CREATE DATABASE [pt1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pt1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pt1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pt1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pt1_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pt1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pt1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pt1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pt1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pt1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pt1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pt1] SET ARITHABORT OFF 
GO
ALTER DATABASE [pt1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pt1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pt1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pt1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pt1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pt1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pt1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pt1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pt1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pt1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pt1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pt1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pt1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pt1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pt1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pt1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pt1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pt1] SET RECOVERY FULL 
GO
ALTER DATABASE [pt1] SET  MULTI_USER 
GO
ALTER DATABASE [pt1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pt1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pt1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pt1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pt1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pt1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'pt1', N'ON'
GO
ALTER DATABASE [pt1] SET QUERY_STORE = OFF
GO
USE [pt1]
GO
/****** Object:  Table [dbo].[actividad]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actividad](
	[IDActividad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](256) NULL,
	[departamento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comentarios]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comentarios](
	[idcomentario] [int] IDENTITY(1,1) NOT NULL,
	[comentario] [varchar](512) NULL,
	[solicitud] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [char](80) NOT NULL,
	[CompanyAddress] [char](200) NOT NULL,
	[Phone] [char](14) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[DepartamentoId] [int] IDENTITY(1,1) NOT NULL,
	[NombreDepartamento] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evidencia]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evidencia](
	[IdEvidencia] [int] IDENTITY(1,1) NOT NULL,
	[fechaCreacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEvidencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[layout]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[layout](
	[noDeDocumento] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](512) NULL,
	[docVersion] [char](2) NULL,
	[modelo] [varchar](64) NULL,
	[OEMDoc] [varchar](64) NULL,
	[elaborador] [int] NULL,
	[fechaCreacion] [date] NULL,
	[revisionTecnica] [varchar](8) NULL,
	[aprobacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[noDeDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[planta]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planta](
	[id_planta] [int] IDENTITY(1,1) NOT NULL,
	[nom_planta] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_planta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[propiedad]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[propiedad](
	[id_propiedad] [int] IDENTITY(1,1) NOT NULL,
	[desc_propiedad] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_propiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puesto](
	[PuestoID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PuestoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecursosEvidencia]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecursosEvidencia](
	[IdEvidencia] [int] IDENTITY(1,1) NOT NULL,
	[RutaEvidencia] [nvarchar](1000) NOT NULL,
	[FKIDEvidencia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEvidencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[FKIDEvidencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salidaMaterial]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salidaMaterial](
	[idSalida] [int] IDENTITY(1,1) NOT NULL,
	[tipoSalida] [int] NOT NULL,
	[numControl] [varchar](64) NULL,
	[numFolio] [varchar](64) NULL,
	[fechaSalida] [datetime] NULL,
	[planta] [varchar](64) NULL,
	[cantidad] [int] NULL,
	[descripcion] [varchar](256) NULL,
	[proveedor] [varchar](128) NULL,
	[solicitante] [int] NOT NULL,
	[aprobacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSalida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitud]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitud](
	[IdSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[solicitante] [int] NOT NULL,
	[Evidencia] [int] NOT NULL,
	[actividad] [int] NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[FechaCierre] [date] NOT NULL,
	[departamento] [int] NOT NULL,
	[statusSolicitud] [int] NOT NULL,
	[FirmaSolicitante] [int] NOT NULL,
	[FirmaSupervisor] [int] NOT NULL,
	[FirmaMateriales] [int] NOT NULL,
	[FirmaMantenimiento] [int] NOT NULL,
	[FirmaFinanzas] [int] NOT NULL,
	[FirmaRH] [int] NOT NULL,
	[FirmaDireccion] [int] NOT NULL,
	[FirmaSeguridad] [int] NOT NULL,
	[FirmaSEH] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitud_dispositivo]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitud_dispositivo](
	[folio] [int] IDENTITY(1,1) NOT NULL,
	[tipo_solicitud] [int] NULL,
	[tipo_dispositivo] [int] NULL,
	[solicitante] [varchar](30) NOT NULL,
	[imei] [int] NOT NULL,
	[num_serie] [varchar](32) NOT NULL,
	[marca] [varchar](64) NULL,
	[modelo] [varchar](64) NULL,
	[color] [varchar](32) NULL,
	[num_telefono] [varchar](10) NULL,
	[planta] [int] NULL,
	[propiedad] [int] NULL,
	[aprobacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitudVacaciones]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitudVacaciones](
	[folio] [int] IDENTITY(1,1) NOT NULL,
	[Company] [int] NULL,
	[empleado] [int] NOT NULL,
	[dias] [int] NOT NULL,
	[periodo] [int] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[semanaPagara] [int] NOT NULL,
	[observaciones] [varchar](256) NULL,
	[aprobacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statusfirmas]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statusfirmas](
	[idStatusFirmas] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [char](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[idStatusFirmas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statusSolicitud]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statusSolicitud](
	[idStatus] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[idStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_dispositivo]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_dispositivo](
	[id_dispositivo] [int] IDENTITY(1,1) NOT NULL,
	[desc_dispositivo] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_dispositivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_solicitud]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_solicitud](
	[id_tipo] [int] IDENTITY(1,1) NOT NULL,
	[desc_solicitud] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoSalida]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoSalida](
	[idTipoSalida] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoSalida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[UserPassword] [varchar](60) NOT NULL,
	[NumEmpleado] [varchar](15) NOT NULL,
	[nombre] [char](40) NOT NULL,
	[apellido] [char](50) NOT NULL,
	[Email] [varchar](60) NULL,
	[Company] [int] NULL,
	[Departamento] [int] NULL,
	[Puesto] [int] NULL,
	[UserRole] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VacacionesDisponibles]    Script Date: 2/18/2022 10:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VacacionesDisponibles](
	[idPeriodoAnual] [int] IDENTITY(1,1) NOT NULL,
	[periodo_anual] [int] NULL,
	[dias_disponibles] [int] NOT NULL,
	[usuario] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPeriodoAnual] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[actividad]  WITH CHECK ADD FOREIGN KEY([departamento])
REFERENCES [dbo].[Departamento] ([DepartamentoId])
GO
ALTER TABLE [dbo].[comentarios]  WITH CHECK ADD FOREIGN KEY([solicitud])
REFERENCES [dbo].[solicitud] ([IdSolicitud])
GO
ALTER TABLE [dbo].[layout]  WITH CHECK ADD FOREIGN KEY([elaborador])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[layout]  WITH CHECK ADD FOREIGN KEY([aprobacion])
REFERENCES [dbo].[solicitud] ([IdSolicitud])
GO
ALTER TABLE [dbo].[RecursosEvidencia]  WITH CHECK ADD FOREIGN KEY([IdEvidencia])
REFERENCES [dbo].[evidencia] ([IdEvidencia])
GO
ALTER TABLE [dbo].[salidaMaterial]  WITH CHECK ADD FOREIGN KEY([aprobacion])
REFERENCES [dbo].[solicitud] ([IdSolicitud])
GO
ALTER TABLE [dbo].[salidaMaterial]  WITH CHECK ADD FOREIGN KEY([solicitante])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[salidaMaterial]  WITH CHECK ADD FOREIGN KEY([tipoSalida])
REFERENCES [dbo].[tipoSalida] ([idTipoSalida])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([actividad])
REFERENCES [dbo].[actividad] ([IDActividad])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([Evidencia])
REFERENCES [dbo].[RecursosEvidencia] ([IdEvidencia])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([FirmaSolicitante])
REFERENCES [dbo].[statusfirmas] ([idStatusFirmas])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([FirmaMateriales])
REFERENCES [dbo].[statusfirmas] ([idStatusFirmas])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([FirmaMantenimiento])
REFERENCES [dbo].[statusfirmas] ([idStatusFirmas])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([FirmaFinanzas])
REFERENCES [dbo].[statusfirmas] ([idStatusFirmas])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([FirmaRH])
REFERENCES [dbo].[statusfirmas] ([idStatusFirmas])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([FirmaDireccion])
REFERENCES [dbo].[statusfirmas] ([idStatusFirmas])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([FirmaSeguridad])
REFERENCES [dbo].[statusfirmas] ([idStatusFirmas])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([FirmaSEH])
REFERENCES [dbo].[statusfirmas] ([idStatusFirmas])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([solicitante])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([statusSolicitud])
REFERENCES [dbo].[statusSolicitud] ([idStatus])
GO
ALTER TABLE [dbo].[solicitud_dispositivo]  WITH CHECK ADD FOREIGN KEY([tipo_solicitud])
REFERENCES [dbo].[tipo_solicitud] ([id_tipo])
GO
ALTER TABLE [dbo].[solicitud_dispositivo]  WITH CHECK ADD FOREIGN KEY([aprobacion])
REFERENCES [dbo].[solicitud] ([IdSolicitud])
GO
ALTER TABLE [dbo].[solicitud_dispositivo]  WITH CHECK ADD FOREIGN KEY([planta])
REFERENCES [dbo].[planta] ([id_planta])
GO
ALTER TABLE [dbo].[solicitud_dispositivo]  WITH CHECK ADD FOREIGN KEY([propiedad])
REFERENCES [dbo].[propiedad] ([id_propiedad])
GO
ALTER TABLE [dbo].[solicitud_dispositivo]  WITH CHECK ADD FOREIGN KEY([tipo_dispositivo])
REFERENCES [dbo].[tipo_dispositivo] ([id_dispositivo])
GO
ALTER TABLE [dbo].[solicitudVacaciones]  WITH CHECK ADD FOREIGN KEY([empleado])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[solicitudVacaciones]  WITH CHECK ADD FOREIGN KEY([aprobacion])
REFERENCES [dbo].[solicitud] ([IdSolicitud])
GO
ALTER TABLE [dbo].[solicitudVacaciones]  WITH CHECK ADD FOREIGN KEY([periodo])
REFERENCES [dbo].[VacacionesDisponibles] ([idPeriodoAnual])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Company])
REFERENCES [dbo].[Company] ([CompanyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Departamento])
REFERENCES [dbo].[Departamento] ([DepartamentoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Puesto])
REFERENCES [dbo].[Puesto] ([PuestoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[UserRole] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VacacionesDisponibles]  WITH CHECK ADD FOREIGN KEY([usuario])
REFERENCES [dbo].[Users] ([UserName])
GO
USE [master]
GO
ALTER DATABASE [pt1] SET  READ_WRITE 
GO
