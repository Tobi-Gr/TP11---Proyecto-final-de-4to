USE [master]
GO
/****** Object:  Database [BDPelis]    Script Date: 23/11/2023 10:00:29 ******/
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
/****** Object:  User [alumno]    Script Date: 23/11/2023 10:00:30 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelicula](
	[idPelicula] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [text] NOT NULL,
	[sinopsis] [varchar](500) NOT NULL,
	[anioLanzamiento] [int] NOT NULL,
	[foto] [text] NOT NULL,
 CONSTRAINT [PK_Pelicula] PRIMARY KEY CLUSTERED 
(
	[idPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[idRating] [int] IDENTITY(1,1) NOT NULL,
	[calificacion] [int] NULL,
	[opinion] [text] NULL,
	[fecha] [date] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idPelicula] [int] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[idRating] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/11/2023 10:00:30 ******/
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
/****** Object:  Table [dbo].[Usuario_pelicula]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_pelicula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estado] [bit] NOT NULL,
	[idPelicula] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_pelicula] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pelicula] ON 

INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (1, N'Barbie', N'Después de ser expulsada de Barbieland por no ser una muñeca de aspecto perfecto, Barbie parte hacia el mundo humano para encontrar la verdadera felicidad.', 2023, N'https://www.themoviedb.org/t/p/w220_and_h330_face/fNtqD4BTFj0Bgo9lyoAtmNFzxHN.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (3, N'Spider-Man: Into the Spider-Verse', N'Luego de ser mordido por una araña radioactiva, el joven Miles Morales desarrolla misteriosos poderes que lo transforman en el Hombre Araña. Ahora deberá usar sus nuevas habilidades ante el malvado Kingpin, un enorme demente que puede abrir portales hacia otros universos.', 2019, N'https://upload.wikimedia.org/wikipedia/en/thumb/f/fa/Spider-Man_Into_the_Spider-Verse_poster.png/220px-Spider-Man_Into_the_Spider-Verse_poster.png')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (6, N'Enredados', N'Rapunzel, quien fue confinada a una torre cuando era pequeña, desea salir al mundo exterior. Cuando el ladrón más buscado del reino, Flynn Rider, se esconde en la torre, la adolescente decide hacer un trato con él.', 2010, N'https://es.web.img2.acsta.net/c_310_420/medias/nmedia/18/79/96/30/19541005.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (7, N'Taylor Swift: The Eras Tour', N'Taylor Swift: The Eras Tour? es una película de concierto estadounidense dirigida por Sam Wrench que documenta el Eras Tour, la gira de conciertos 2023-2024 de la cantautora estadounidense Taylor Swift.', 2023, N'https://pics.filmaffinity.com/Taylor_Swift_The_Eras_Tour-775811773-large.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (8, N'Maze Runner: correr o morir', N'Thomas es un adolescente cuya memoria fue borrada y que ha sido encerrado junto a otros chicos de su edad en un laberinto plagado de monstruos y misterios. Para sobrevivir, tendrá que adaptarse a las normas y a los demás habitantes del laberinto.', 2014, N'https://pics.filmaffinity.com/El_corredor_del_laberinto-377064363-large.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (10, N'Cars', N'De camino al prestigiado campeonato Copa Pistón, un automóvil de carreras que sólo se preocupa por ganar aprende sobre lo que realmente es importante en la vida de varios vehículos que viven en un pueblo a lo largo de la histórica Ruta 66.', 2006, N'https://m.media-amazon.com/images/I/91nG1qkExWL.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (11, N'
Un lugar llamado Notting Hill', N'Anna Scott, estrella de cine, y William Thacker, un hombre común, se conocen en un lugar llamado Notting Hill. Nace un inusitado romance, obstaculizado por el acecho de la prensa y las presiones que ejercen sus propias diferencias.', 1999, N'https://m.media-amazon.com/images/I/61Mwao8ydOL._AC_UF894,1000_QL80_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (12, N'¿Conoces a Joe Black?', N'William Parrish es un poderoso y meticuloso magnate cuya vida se ve alterada por la llegada de un enigmático joven llamado Joe Black que se enamora de su hija. Joe es, en realidad, la personificación de la muerte, que tiene una misión que cumplir.', 1998, N'https://pics.filmaffinity.com/Conoces_a_Joe_Black-143070741-large.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (14, N'Relatos salvajes', N'Seis relatos que alternan la intriga, la comedia y la violencia. Sus personajes se verán empujados hacia el abismo y hacia el innegable placer de perder el control al cruzar la delgada línea que separa la civilización de la barbarie.', 2014, N'https://es.web.img3.acsta.net/c_310_420/pictures/14/11/17/11/15/381594.jpg')
SET IDENTITY_INSERT [dbo].[Pelicula] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [username], [nombre], [contrasena]) VALUES (1, N'mica', N'mica', N'a')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario_pelicula] ON 

INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (1, 0, 1, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (2, 0, 6, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (3, 0, 7, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (4, 0, 10, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (5, 0, 3, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (6, 0, 8, 1)
SET IDENTITY_INSERT [dbo].[Usuario_pelicula] OFF
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Pelicula] FOREIGN KEY([idPelicula])
REFERENCES [dbo].[Pelicula] ([idPelicula])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Pelicula]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Usuario]
GO
ALTER TABLE [dbo].[Usuario_pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_pelicula_Pelicula] FOREIGN KEY([idPelicula])
REFERENCES [dbo].[Pelicula] ([idPelicula])
GO
ALTER TABLE [dbo].[Usuario_pelicula] CHECK CONSTRAINT [FK_Usuario_pelicula_Pelicula]
GO
ALTER TABLE [dbo].[Usuario_pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_pelicula_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Usuario_pelicula] CHECK CONSTRAINT [FK_Usuario_pelicula_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarRating]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarRating]
	@pcalificacion int,
	@popinion text,
	@pfecha date,
	@pidUsuario int,
	@pidPelicula int
AS 
BEGIN
	UPDATE Rating
		SET calificacion = @pcalificacion, 
			opinion = @popinion,
			fecha = (SELECT GETDATE())
	WHERE idUsuario = @pidUsuario
		AND idPelicula = @pidPelicula
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarPeli]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarPeli]
	@pbuscar TEXT
AS
BEGIN
	SELECT * 
	FROM Pelicula
	WHERE titulo LIKE '%@pbuscar%'
END
GO
/****** Object:  StoredProcedure [dbo].[CambiarEstadoPeli]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CambiarEstadoPeli]
	@pidPelicula INT,
	@pidUsuario INT
AS
BEGIN
	IF 'True' = (SELECT estado FROM Usuario_pelicula WHERE idPelicula = @pidPelicula AND @pidUsuario = idUsuario)
		BEGIN
			UPDATE Usuario_pelicula
			SET estado = 'False'
			WHERE @pidPelicula = idPelicula
				AND @pidUsuario = idUsuario
		END
	ELSE
		BEGIN
			UPDATE Usuario_pelicula
				SET estado = 'True'
				WHERE @pidPelicula = idPelicula
					AND @pidUsuario = idUsuario
		END
END
GO
/****** Object:  StoredProcedure [dbo].[CrearUsuario]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearUsuario]
	@pusername TEXT,
	@pnombre TEXT,
	@pcontrasena TEXT
AS
BEGIN
	IF NOT EXISTS(SELECT 1 FROM Usuario WHERE username LIKE @pusername)
		BEGIN
			INSERT INTO Usuario(username, nombre, contrasena)
				VALUES(@pusername, @pnombre, @pcontrasena)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarRating]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarRating]
	@pcalificacion int,
	@popinion text,
	@pidUsuario int,
	@pidPelicula int
AS
BEGIN
	INSERT INTO Rating (calificacion, opinion, fecha, idUsuario, idPelicula)
		VALUES(@pcalificacion, @popinion, (SELECT GETDATE()), @pidUsuario, @pidPelicula)
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeli]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeli]
	@pidPelicula int
AS
BEGIN
	SELECT *
	FROM Pelicula
	WHERE idPelicula = @pidPelicula
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPelisPorVer]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPelisPorVer]
	@pidUsuario INT 
AS
BEGIN 
	SELECT *
	FROM Pelicula p
	INNER JOIN Usuario_pelicula up
		ON p.idPelicula = up.idPelicula
	WHERE up.estado = 'False' AND @pidUsuario = up.idUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPelisVistas]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPelisVistas]
	@pidUsuario INT
AS
BEGIN
	SELECT *
	FROM Pelicula
	INNER JOIN Usuario_pelicula
		ON pelicula.idPelicula = Usuario_pelicula.idPelicula
	INNER JOIN Usuario
		ON Usuario.idUsuario = Usuario_pelicula.idUsuario
	WHERE Usuario_pelicula.estado = 'True' AND Usuario.idUsuario = @pidUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerRating]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerRating]
	@pidUsuario INT,
	@pidPelicula INT
AS
BEGIN
	SELECT *
	FROM Rating
	WHERE idPelicula = @pidPelicula
		AND idUsuario = @pidUsuario 
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerRatings]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerRatings]
	@pidUsuario INT
AS
BEGIN
	SELECT *
	FROM Rating
	WHERE idUsuario = @pidUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuario]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUsuario]
	@pusername text
AS
BEGIN
	SELECT *
	FROM Usuario
	WHERE username LIKE @pusername
END

GO
/****** Object:  StoredProcedure [dbo].[QuieroVer]    Script Date: 23/11/2023 10:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QuieroVer]
	@pidUsuario int,
	@pidPelicula int
AS
BEGIN
	INSERT INTO Usuario_pelicula(estado, idPelicula, idUsuario)
		VALUES('False', @pidPelicula, @pidUsuario)
END
GO
USE [master]
GO
ALTER DATABASE [BDPelis] SET  READ_WRITE 
GO
