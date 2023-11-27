USE [master]
GO
/****** Object:  Database [BDPelis]    Script Date: 27/11/2023 09:59:59 ******/
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
/****** Object:  User [alumno]    Script Date: 27/11/2023 09:59:59 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 27/11/2023 10:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelicula](
	[idPelicula] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[sinopsis] [varchar](500) NOT NULL,
	[anioLanzamiento] [int] NOT NULL,
	[foto] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Pelicula] PRIMARY KEY CLUSTERED 
(
	[idPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 27/11/2023 10:00:00 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/11/2023 10:00:00 ******/
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
/****** Object:  Table [dbo].[Usuario_pelicula]    Script Date: 27/11/2023 10:00:00 ******/
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

INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (1, N'Barbie', N'Después de ser expulsada de Barbieland por no ser una muñeca de aspecto perfecto, Barbie parte hacia el mundo humano para encontrar la verdadera felicidad.', 2023, N'https://image.tmdb.org/t/p/original/lF3ViyfgJ8VEwQSlqPhuhm6WW43.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (3, N'Spider-Man: Into the Spider-Verse', N'Luego de ser mordido por una araña radioactiva, el joven Miles Morales desarrolla misteriosos poderes que lo transforman en el Hombre Araña. Ahora deberá usar sus nuevas habilidades ante el malvado Kingpin, un enorme demente que puede abrir portales hacia otros universos.', 2019, N'https://upload.wikimedia.org/wikipedia/en/thumb/f/fa/Spider-Man_Into_the_Spider-Verse_poster.png/220px-Spider-Man_Into_the_Spider-Verse_poster.png')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (6, N'Enredados', N'Rapunzel, quien fue confinada a una torre cuando era pequeña, desea salir al mundo exterior. Cuando el ladrón más buscado del reino, Flynn Rider, se esconde en la torre, la adolescente decide hacer un trato con él.', 2010, N'https://es.web.img2.acsta.net/c_310_420/medias/nmedia/18/79/96/30/19541005.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (7, N'Taylor Swift: The Eras Tour', N'Taylor Swift: The Eras Tour? es una película de concierto estadounidense dirigida por Sam Wrench que documenta el Eras Tour, la gira de conciertos 2023-2024 de la cantautora estadounidense Taylor Swift.', 2023, N'https://pics.filmaffinity.com/Taylor_Swift_The_Eras_Tour-775811773-large.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (8, N'Maze Runner: correr o morir', N'Thomas es un adolescente cuya memoria fue borrada y que ha sido encerrado junto a otros chicos de su edad en un laberinto plagado de monstruos y misterios. Para sobrevivir, tendrá que adaptarse a las normas y a los demás habitantes del laberinto.', 2014, N'https://pics.filmaffinity.com/El_corredor_del_laberinto-377064363-large.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (10, N'Cars', N'De camino al prestigiado campeonato Copa Pistón, un automóvil de carreras que sólo se preocupa por ganar aprende sobre lo que realmente es importante en la vida de varios vehículos que viven en un pueblo a lo largo de la histórica Ruta 66.', 2006, N'https://m.media-amazon.com/images/I/91nG1qkExWL.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (11, N'Un lugar llamado Notting Hill', N'Anna Scott, estrella de cine, y William Thacker, un hombre común, se conocen en un lugar llamado Notting Hill. Nace un inusitado romance, obstaculizado por el acecho de la prensa y las presiones que ejercen sus propias diferencias.', 1999, N'https://m.media-amazon.com/images/I/61Mwao8ydOL._AC_UF894,1000_QL80_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (12, N'¿Conoces a Joe Black?', N'William Parrish es un poderoso y meticuloso magnate cuya vida se ve alterada por la llegada de un enigmático joven llamado Joe Black que se enamora de su hija. Joe es, en realidad, la personificación de la muerte, que tiene una misión que cumplir.', 1998, N'https://pics.filmaffinity.com/Conoces_a_Joe_Black-143070741-large.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (14, N'Relatos salvajes', N'Seis relatos que alternan la intriga, la comedia y la violencia. Sus personajes se verán empujados hacia el abismo y hacia el innegable placer de perder el control al cruzar la delgada línea que separa la civilización de la barbarie.', 2014, N'https://es.web.img3.acsta.net/c_310_420/pictures/14/11/17/11/15/381594.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (15, N'10 cosas que odio de ti', N'Las hermanas Stratford son muy distintas. La bella y popular Bianca nunca ha salido con un chico, pero lo está deseando, y Kat, su hermana mayor, es arisca y con mal genio. Su padre no deja que Bianca tenga novio hasta que Kat consiga uno.', 1999, N'https://c8.alamy.com/compes/2jdpn41/poster-de-pelicula-10-cosas-que-odio-acerca-de-usted-1999-2jdpn41.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (16, N'Argentina, 1985', N'Durante la década de 1980, un grupo de abogados investiga y lleva a juicio a los responsables de la dictadura cívico-militar argentina.', 2022, N'https://i0.wp.com/cineargentinohoy.com.ar/wp-content/uploads/2022/09/ARGENTINA-1985-PV-esp-2-scaled.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (17, N'Alien - El octavo pasajero', N'La tripulación de la nave espacial Nostromo atiende una señal de auxilio y, sin saberlo, sube a bordo una letal forma de vida extraterrestre.', 1979, N'https://ratondevideoteca.files.wordpress.com/2014/11/alien_poster_1979_01.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (18, N'Ant-Man: el hombre hormiga', N'Un ladrón con la habilidad de encogerse de tamaño pero crecer en fuerza debe sacar su héroe interior y ayudar a su mentor a llevar a cabo un plan para salvar al mundo.', 2015, N'https://moviefilmsla.files.wordpress.com/2015/07/304cd-ant_man_posterlat6_mf.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (19, N'Annabelle', N'John Form encuentra el regalo perfecto para Mia, su esposa embarazada: una preciosa muñeca antigua llamada Annabelle. Una noche, una secta satánica les ataca brutalmente y provocan que un ente maligno se apodere de Annabelle.', 2014, N'https://m.media-amazon.com/images/I/81Jj8g2BFdL.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (20, N'El último maestro del aire', N'Las cuatro naciones de Aire, Agua, Tierra y Fuego viven en armonía hasta que la Nación Fuego declara la guerra. Un siglo después, todavía no se avizora el final de la destrucción, y un Avatar llamado Aang descubre que él tiene el poder para controlar a los cuatro elementos. Él une fuerzas con Katara, una Waterbender, y su hermano, Sokka, para restaurar el equilibrio y armonía a su mundo.', 2010, N'https://i.ebayimg.com/images/g/rhwAAOSwgMde4qwi/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (21, N'Annie', N'La huerfanita especial va a la casa de Daddy Warbucks, en esta adaptación de la tira cómica y el show de Broadway.', 1982, N'https://www.originalfilmart.com/cdn/shop/products/annie_1982_original_film_art_9132bd55-265f-4172-aaa5-2f9afe7ba9b9_5000x.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (22, N'Buscando a Nemo', N'Marlin, un pez payaso, siempre ha intentado proteger de todos los peligros a su hijo. Sin embargo, un buzo atrapa al pequeño, y ahora el padre deberá embarcarse en una increíble aventura por las aguas australianas para encontrarlo.', 2003, N'https://www.originalfilmart.com/cdn/shop/products/Finding_Nemo_2003_original_film_art_spo_5000x.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (23, N'But Im a Cheerleader', N'Unos padres con sospechas envían a su hija adolescente a un centro de rehabilitación para ser curada de su lesbianismo.', 1999, N'https://m.media-amazon.com/images/I/71xgDCw9FCL._RI_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (24, N'Bohemian Rhapsody', N'Freddie Mercury desafía los estereotipos y se convierte en uno de los vocalistas más reconocidos de la música mundial. Después de dejar la banda Queen para seguir una carrera como solista, Mercury se reúne con la banda para dar una de las mejores actuaciones en la historia del rock n roll.', 2018, N'https://i.ebayimg.com/images/g/w48AAOSwWe1bI~mg/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (25, N'Bastardos sin gloria', N'Es el primer año de la ocupación alemana de Francia. El oficial aliado, teniente Aldo Raine, ensambla un equipo de soldados judíos para cometer actos violentos en contra de los nazis, incluyendo la toma de cabelleras. Él y sus hombres unen fuerzas con Bridget von Hammersmark, una actriz alemana y agente encubierto, para derrocar a los líderes del Tercer Reich. Sus destinos convergen con la dueña de teatro Shosanna Dreyfus, quien busca vengar la ejecución de su familia.', 2009, N'https://i.ebayimg.com/images/g/EHgAAOSwoudW7aI~/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (26, N'Bumblebee', N'En 1987, Charlie, una adolescente, encuentra a Bumblebee, muy herido, en el depósito de chatarra al que había llegado mientras huía. Mientras lo restaura, Charlie percibe que lo que ha hallado no es un Volkswagen amarillo corriente.', 2018, N'https://i.ebayimg.com/images/g/DQYAAOSw84Nfqnnw/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (27, N'Kung Fu Panda', N'El panda Po trabaja en la tienda de fideos de su familia y sueña en convertirse en un maestro del kung-fu. Su sueño se hace una realidad cuando es inesperadamente elegido para cumplir una antigua profecía y debe estudiar artes marciales con sus ídolos, los Cinco Furiosos. Po necesitará toda la sabiduría, fortaleza y habilidades para poder proteger a su gente de Tai Lung, un maldito leopardo de nieve.', 2008, N'https://i.ebayimg.com/images/g/SEAAAOSwWVFczF3m/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (28, N'Jumanji', N'La historia de un juego mágico que libera una estampida de peligros de la selva contra sus jugadores y un hombre que desapareció en 1969 mientras jugaba.', 1995, N'https://i.ebayimg.com/images/g/XmYAAOSw5cNYOfb4/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (29, N'Jurassic Park', N'Tres expertos y otras personas son invitados a un parque de diversiones, donde se encuentran dinosaurios creados en base al ADN.', 1993, N'https://i.ebayimg.com/images/g/eXEAAOSwXZ1f1LBg/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (30, N'Intensa-Mente', N'Las cinco emociones que conviven en el interior de una niña llamada Riley, alegría, miedo, desagrado, ira y tristeza, compiten por tomar el control de sus acciones cuando la pequeña se traslada, junto a su familia, a vivir a San Francisco. La adaptación a una nueva ciudad, una nueva escuela y unos nuevos compañeros no será sencilla para Riley.', 2015, N'https://i.ebayimg.com/images/g/gtIAAOSwmAJhXhW1/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (31, N'Iron Man: el hombre de hierro', N'Un empresario millonario construye un traje blindado y lo usa para combatir el crimen y el terrorismo.', 2008, N'https://i.ebayimg.com/images/g/5ogAAOSw6JlfVPKh/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (32, N'It: capítulo dos', N'En el misterioso pueblo de Derry, un payaso llamado Pennywise vuelve 27 años después para atormentar a los ahora adultos miembros del Club de los Perdedores, que se encuentran alejados unos de otros.', 2019, N'https://i.ebayimg.com/images/g/qHwAAOSw1Y5dcuMC/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (33, N'Harry Potter y el prisionero de Azkaban', N'El tercer año de estudios de Harry en Hogwarts se ve amenazado por la fuga de Sirius Black de la prisión de Azkaban. Al parecer, se trata de un peligroso mago que fue cómplice de Lord Voldemort y que intentará vengarse de Harry Potter.', 2004, N'https://i.ebayimg.com/images/g/iCwAAOxy-WxTC-lB/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (34, N'High School Musical', N'Troy y Gabriela se conocen en un karaoke durante las vacaciones. Troy es una estrella de baloncesto, y Gabriela es la nueva estudiante. Al volver al colegio, se presentan al casting para el musical de la escuela, pero deben superar varios obstáculos.', 2006, N'https://i.ebayimg.com/images/g/XrEAAOSwgX9cpWJf/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (35, N'Ella', N'En Los Ángeles, un escritor desanimado desarrolla una especial relación amorosa con el sistema operativo de su computadora, una intuitiva y sensible entidad llamada Samantha.', 2013, N'https://i.ebayimg.com/images/g/PK4AAOSwykdfBQW2/s-l500.png')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (36, N'Godzilla 1985', N'El dinosaurio japonés despierta y nada hacia Tokio, provocando una gran destrucción nuclear.', 1985, N'https://i.ebayimg.com/images/g/jjMAAOxyFrNRsoQ5/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (37, N'Fight Club', N'Un empleado de oficina insomne, harto de su vida, se cruza con un vendedor peculiar. Ambos crean un club de lucha clandestino como forma de terapia y, poco a poco, la organización crece y sus objetivos toman otro rumbo.', 1999, N'https://i.ebayimg.com/images/g/0jYAAOSwef9a8PCb/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (38, N'Frankenstein', N'Basada en la historia de Mary Shelley sobre un científico que crea un ser viviente con cadáveres robados.', 1931, N'https://i.ebayimg.com/images/g/7q4AAOSwxs9dgfuR/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (39, N'Forrest Gump', N'Forrest Gump, un joven sureño, tenaz e inocente, es protagonista de acontecimientos cruciales en la historia de los Estados Unidos.', 1994, N'https://i.ebayimg.com/images/g/e2UAAMXQR-dRFNzP/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (40, N'Filadelfia', N'Despiden a un abogado portador de VIH por su enfermedad, por lo que decide demandar a su empleador. Para ello, contrata al único profesional que acepta tomar su caso: un abogado homofóbico.', 1993, N'https://m.media-amazon.com/images/I/51Ir2LpODRL._AC_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (41, N'Footloose', N'Un joven excéntrico de Chicago se instala en un pequeño pueblo en el que el pastor de la iglesia local ha prohibido el baile. Su llegada provoca una revolución entre los jóvenes de la localidad.', 1984, N'https://i.ebayimg.com/images/g/1AwAAOSw--xbJEp1/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (42, N'Entrenando a papá', N'La estrella de fútbol Joe Kingman parece tenerlo todo. Él es rico, cuidadoso y su equipo está por obtener el campeonato. Repentinamente, Joe recibe una noticia inesperada: tiene una hija, fruto de su último encuentro íntimo con su exesposa. Joe debe aprender a equilibrar su carrera profesional, su vida personal y las responsabilidades que conlleva la paternidad.', 2007, N'https://i.ebayimg.com/images/g/BMkAAOSwHsRYCplx/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (43, N'Elena sabe', N'Elena busca al responsable de la repentina muerte de su hija Rita. Al no obtener respuestas, es ella quien, aun padeciendo un Parkinson terminal, encarna la investigación.', 2023, N'https://www.infobae.com/new-resizer/WAc7XUFylK5n9qeL8GKD22Jn4CA=/768x1024/filters:format(webp):quality(85)/cloudfront-us-east-1.images.arcpublishing.com/infobae/6LK7N6TBWRAKJDPK7TIHW64K5U.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (44, N'El mago de Oz', N'Dorothy, una pequeña que sueña con viajar más allá del arco iris, cumple su deseo cuando un tornado se la lleva con su perrito al mundo de Oz. Allí, se dirige por el Camino Amarillo hacia la Ciudad Esmeralda, donde vive el poderoso Mago de Oz, quien puede ayudarla a regresar a Kansas. Durante el viaje, se hace amiga del Espantapájaros que desea un cerebro, el Hombre de Hojalata que quiere un corazón y el León Cobarde que desea ser valiente, por lo que deciden unirse a Dorothy en su odisea.', 1939, N'https://i.ebayimg.com/images/g/lwQAAOSwUKxYYBQw/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (45, N'E.T., el extraterrestre', N'Elliott es un niño de nueve años que se encuentra con un extraterrestre y decide esconderlo en su casa para protegerlo. Contará con la ayuda de su pequeña hermana y su hermano mayor para mantener el secreto y juntos vivirán una aventura inolvidable.', 1982, N'https://i.ebayimg.com/images/g/fzoAAOSwAClZ4GDt/s-l1600.jpg')
SET IDENTITY_INSERT [dbo].[Pelicula] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [username], [nombre], [contrasena]) VALUES (1, N'mica', N'mica', N'a')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario_pelicula] ON 

INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (5, 1, 3, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (7, 1, 1, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (13, 0, 10, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (14, 1, 8, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (15, 0, 12, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (16, 0, 14, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (17, 0, 6, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (18, 0, 7, 1)
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
/****** Object:  StoredProcedure [dbo].[ActualizarRating]    Script Date: 27/11/2023 10:00:00 ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarPeli]    Script Date: 27/11/2023 10:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarPeli]
	@titulo VARCHAR(100),
	@sinopsis VARCHAR(500),
	@anio INT,
	@foto VARCHAR(500)
AS
BEGIN
	INSERT INTO Pelicula(titulo, sinopsis, anioLanzamiento, foto)
	VALUES (@titulo, @sinopsis, @anio, @foto)
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarPeli]    Script Date: 27/11/2023 10:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarPeli]
	@pbuscar varchar(100)
AS
BEGIN
	SELECT * 
	FROM Pelicula
	WHERE titulo LIKE '%' + @pbuscar + '%'
	ORDER BY titulo;
END
GO
/****** Object:  StoredProcedure [dbo].[CambiarEstadoPeli]    Script Date: 27/11/2023 10:00:00 ******/
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
/****** Object:  StoredProcedure [dbo].[CrearUsuario]    Script Date: 27/11/2023 10:00:00 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarPeliParaVer]    Script Date: 27/11/2023 10:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPeliParaVer]
	@pIdPelicula int,
	@pIdUsuario int
AS
BEGIN
	DELETE FROM Usuario_pelicula
	WHERE idUsuario = @pIdUsuario AND idPelicula = @pIdPelicula
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarRating]    Script Date: 27/11/2023 10:00:00 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPeli]    Script Date: 27/11/2023 10:00:00 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPelisPorVer]    Script Date: 27/11/2023 10:00:00 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPelisVistas]    Script Date: 27/11/2023 10:00:00 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerRating]    Script Date: 27/11/2023 10:00:00 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerRatings]    Script Date: 27/11/2023 10:00:00 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerUsuario]    Script Date: 27/11/2023 10:00:00 ******/
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
/****** Object:  StoredProcedure [dbo].[QuieroVer]    Script Date: 27/11/2023 10:00:00 ******/
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
