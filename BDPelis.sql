USE [master]
GO
/****** Object:  Database [BDPelis]    Script Date: 26/10/2023 09:11:09 ******/
CREATE DATABASE [BDPelis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDPelis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDPelis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDPelis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDPelis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BDPelis] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDPelis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDPelis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDPelis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDPelis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDPelis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDPelis] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDPelis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDPelis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDPelis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDPelis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDPelis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDPelis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDPelis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDPelis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDPelis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDPelis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDPelis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDPelis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDPelis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDPelis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDPelis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDPelis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDPelis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDPelis] SET RECOVERY FULL 
GO
ALTER DATABASE [BDPelis] SET  MULTI_USER 
GO
ALTER DATABASE [BDPelis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDPelis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDPelis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDPelis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDPelis] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDPelis', N'ON'
GO
ALTER DATABASE [BDPelis] SET QUERY_STORE = OFF
GO
USE [BDPelis]
GO
/****** Object:  User [alumno]    Script Date: 26/10/2023 09:11:09 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 26/10/2023 09:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelicula](
	[idPelicula] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [text] NOT NULL,
	[sinopsis] [varchar](500) NOT NULL,
	[anioLanzamiento] [int] NOT NULL,
 CONSTRAINT [PK_Pelicula] PRIMARY KEY CLUSTERED 
(
	[idPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 26/10/2023 09:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[idRating] [int] IDENTITY(1,1) NOT NULL,
	[calificacion] [int] NULL,
	[opinion] [text] NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[idRating] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 26/10/2023 09:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[username] [text] NOT NULL,
	[nombre] [text] NOT NULL,
	[contrasena] [text] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_pelicula]    Script Date: 26/10/2023 09:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_pelicula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estado] [bit] NOT NULL,
	[idPelicula] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idRating] [int] NULL,
 CONSTRAINT [PK_Usuario_pelicula] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pelicula] ON 

INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento]) VALUES (1, N'Pride and Predjudice', N'Elizabeth Bennet conoce al apuesto y adinerado Sr. Darcy, con quien, rapidamente, inicia una intensa y compleja relacion.', 2005)
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento]) VALUES (7, N'The Hunger Gamer', N'En lo que alguna vez fue Norteamérica, la capital de Panem mantiene sus 12 distritos obligandolos a seleccionar a un niño y a una niña, llamados Tributos, a competir en un evento televisado nacionalmente llamado los Juegos del Hambre. Cada ciudadano debe ver pelear a muerte a los jovenes. El Tributo del Distrito 12, Katniss Everdeen, solo confia en sus habilidades de caza y buenos instintos en un escenario en donde debe sobrevivir contra la humanidad.', 2012)
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento]) VALUES (8, N'Letters to Juliet', N'En Italia, una joven encuentra una carta de amor para Julieta Capuleto y decide investigar para encontrar al autor.', 2010)
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento]) VALUES (9, N'Back to the Future', N'El adolescente Marty McFly es amigo de Doc, un cientifico que ha construido una maquina del tiempo. Cuando los dos prueban el artefacto, un error fortuito hace que Marty llegue a 1955, año en el que sus padres iban al instituto y todavía no se habían conocido. Despues de impedir su primer encuentro, Marty debera conseguir que se conozcan y se enamoren, de lo contrario su existencia no seria posible.', 1985)
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento]) VALUES (10, N'Little Women', N'En los primeros años que prosiguen a la guerra civil estadounidense, la vida de una familia se ve alterada para siempre luego de que Beth, una de las hermanas, revela que padece una terrible enfermedad.', 2019)
SET IDENTITY_INSERT [dbo].[Pelicula] OFF
GO
ALTER TABLE [dbo].[Usuario_pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_pelicula_Pelicula] FOREIGN KEY([idPelicula])
REFERENCES [dbo].[Pelicula] ([idPelicula])
GO
ALTER TABLE [dbo].[Usuario_pelicula] CHECK CONSTRAINT [FK_Usuario_pelicula_Pelicula]
GO
ALTER TABLE [dbo].[Usuario_pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_pelicula_Rating] FOREIGN KEY([idRating])
REFERENCES [dbo].[Rating] ([idRating])
GO
ALTER TABLE [dbo].[Usuario_pelicula] CHECK CONSTRAINT [FK_Usuario_pelicula_Rating]
GO
ALTER TABLE [dbo].[Usuario_pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_pelicula_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Usuario_pelicula] CHECK CONSTRAINT [FK_Usuario_pelicula_Usuario]
GO
USE [master]
GO
ALTER DATABASE [BDPelis] SET  READ_WRITE 
GO
