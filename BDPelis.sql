USE [master]
GO
/****** Object:  Database [BDPelis]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  User [alumno]    Script Date: 30/11/2023 08:38:17 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  Table [dbo].[Rating]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  Table [dbo].[Usuario_pelicula]    Script Date: 30/11/2023 08:38:17 ******/
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
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (15, N'10 cosas que odio de ti', N'Las hermanas Stratford son muy distintas. La bella y popular Bianca nunca ha salido con un chico, pero lo está deseando, y Kat, su hermana mayor, es arisca y con mal genio. Su padre no deja que Bianca tenga novio hasta que Kat consiga uno.', 1999, N'https://m.media-amazon.com/images/I/71dgB-Pj61S._AC_SY879_.jpg')
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
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (46, N'Metegol', N'Amadeo es un chico tímido y virtuoso que deberá enfrentarse a un habilidoso rival sobre el campo de fútbol, conocido con el apodo de El Crack. Para ello, contará con la inestimable ayuda de unos jugadores de futbolín liderados por el Wing, un carismático extremo derecho. Las aventuras de Amadeo y los jugadores tendrán como telón de fondo no solo el fútbol, sino también el amor, la amistad y la pasión.', 2013, N'https://futbolclubdelectura.files.wordpress.com/2018/10/futbolin-sacheri.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (47, N'Mi villano favorito', N'Mientras intenta cumplir su diabólico plan para robarse a la luna, un supervillano enfrenta su reto más grande, tres pequeñas huérfanas que desean convertirlo en su papá.', 2010, N'https://i.ebayimg.com/thumbs/images/g/FEAAAOSwXchdOe7m/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (48, N'El Club de los Villanos con Mickey y sus Amigos', N'Mickeys House of Villains es una película de comedia de terror animada directa a video de 2002, producida por Disney Television Animation, basada en la serie animada de televisión House of Mouse.', 2001, N'https://m.media-amazon.com/images/I/518JRkfRzNL._AC_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (49, N'La máscara', N'Una máscara antigua transforma a un monótono empleado bancario en un Romeo sonriente con poderes sobrehumanos.', 1994, N'https://i.ebayimg.com/images/g/bQUAAOSwvjBbK6ph/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (50, N'La princesa y el sapo', N'La trabajadora y ambiciosa, Tiana sueña con abrir el restaurante más fino de Nueva Orleans. Su sueño se desvía un poco cuando conoce al príncipe Naveen, quien ha sido transformado en un anfibio por el Dr. Facilier. Confundiéndola con una princesa y esperando romper el hechizo, Naveen le da un beso a la pobre Tiana, transformándola en una rana. La pareja vive una gran aventura por los pantanos para buscar la ayuda de una poderosa sacerdotisa vudú.', 2009, N'https://m.media-amazon.com/images/I/91EtgpxmZgL._AC_SY679_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (51, N'Guardianes de la Galaxia', N'Un aventurero espacial se convierte en la presa de unos cazadores de tesoros después de robar el orbe de un villano traicionero. Cuando descubre su poder, debe hallar la forma de unir a unos rivales para salvar al universo.', 2014, N'https://www.vintagemovieposters.co.uk/wp-content/uploads/2017/06/IMG_6588.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (52, N'Love Actually', N'Las vidas de varias parejas se entrecruzan en Londres, poco antes de la Navidad, con resultados románticos, divertidos y agridulces.', 2003, N'https://m.media-amazon.com/images/S/pv-target-images/60de9f374c8e941ca652f89d0b63416541c27f75edb892c683bf011ec0059823.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (53, N'Legalmente rubia', N'La reina del colegio afirma que triunfará aun sin su ex novio al obtener admisión en la escuela de leyes de Harvard.', 2001, N'https://i.ebayimg.com/images/g/JYgAAOSw~bZbKPO1/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (54, N'La novicia rebelde', N'La vida de María, una joven novicia austriaca, cambia cuando tiene que cuidar de los siete hijos del capitán Von Trapo, del que se enamorara profundamente.', 1965, N'https://m.media-amazon.com/images/I/61St5ADVRWL._AC_SY450_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (55, N'La La Land: ciudad de sueños', N'Sebastian, un pianista de jazz, y Mia, una aspirante a actriz, se enamoran locamente; pero la ambición desmedida que tienen por triunfar en sus respectivas carreras, en una ciudad como Los Ángeles, repleta de competencia y carente de piedad, pone en peligro su amor.', 2016, N'https://m.media-amazon.com/images/I/91jrKX9xjQL._AC_SY550_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (56, N'La sociedad de los poetas muertos', N'Un maestro en un colegio privado emplea métodos poco convencionales para inspirar las vidas de sus estudiantes.', 1989, N'https://m.media-amazon.com/images/I/91Vz8NECRvL._AC_SY550_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (57, N'La Sirenita', N'La sirena Ariel está fascinada por el mundo de los humanos, pero su padre le prohíbe relacionarse con ellos. En un viaje secreto, se enamora de un humano y recurre a una perversa hechicera para que, mediante un conjuro, su amor triunfe.', 1989, N'https://m.media-amazon.com/images/I/614gs8GTVmL._AC_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (58, N'La familia de mi novia', N'Greg Focker quiere casarse con su novia, Pam, pero antes de proponerle matrimonio, debe ganarse a su formidable padre, Jack Byrnes, un ex agente de la CIA sin ningún sentido del humor, en el casamiento de la hermana de Pam. Greg hace lo imposible por causar una buena impresión, pero su visita a la casa de los Byrnes resulta una hilarante serie de desastres en donde todo lo que puede salir mal sale mal, bajo la mirada crítica y desafiante de Jack.', 2000, N'https://i.ebayimg.com/images/g/FuIAAOSwFg5iJ3Ts/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (59, N'La lista de Schindler', N'El empresario alemán Oskar Schindler, miembro del Partido Nazi, pone en marcha un elaborado, costoso y arriesgado plan para salvar a más de mil judíos del Holocausto.', 1993, N'https://m.media-amazon.com/images/I/91GkZe4emOL._AC_SY679_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (60, N'La familia del futuro', N'El niño genio Lewis pierde la esperanza de recuperar su más reciente invento, el cual fue robado por Bowler Hat Guy, entonces un joven viajero en el tiempo llamado Wilbur Robinson llega a la escena para desaparecer a Lewis en su máquina del tiempo. Los chicos pasan un día en el futuro con la excéntrica familia de Wilbur y descubren un increíble secreto al mismo tiempo.', 2007, N'https://m.media-amazon.com/images/I/71WPUGdu1uL._AC_SY879_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (61, N'Los Simpson: La película', N'La combinación de Homero, su nuevo puerco mascota, y un silo lleno de excremento podrían provocar un desastre que amenace no solo a Springfield, sino al mundo entero. Una muchedumbre enojada llega a la casa de los Simpson y divide a la familia. Con el destino de la Tierra en juego, Homero se prepara para intentar redimirse con la intención de salvar al mundo y ganarse el perdón de Marge.', 2007, N'https://i.ebayimg.com/images/g/8N0AAOSwwkZf4IZ2/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (62, N'Los sospechosos de siempre', N'La vida se les escapa sin control alguno a cinco mafiosos, luego de que su última acción los envía a un destino fatal.', 1995, N'https://i.ebayimg.com/images/g/1CMAAOSwMOli-GGp/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (63, N'Los hijos de la calle', N'Un abogado y un periodista ayudan a dos amigos que dan muerte al guardia que abusó de los cuatro cuando eran niños.', 1996, N'https://cdn.abicart.com/shop/16575/art75/h9607/175519607-origpic-17f26b.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (64, N'La historia oficial', N'Una mujer sospecha que su hija adoptiva es la hija de un prisionero político asesinado.', 1985, N'https://c8.alamy.com/compes/2d4yjp0/la-historia-oficial-1985-titulo-original-la-historia-oficial-dirigida-por-luis-puenzo-credito-virgin-films-album-2d4yjp0.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (65, N'La teoría del todo', N'Durante los años sesenta, el estudiante de la Universidad de Cambridge y futuro físico Stephen Hawking se enamora de su compañera Jane Wilde. A pesar de que le diagnostican una enfermedad devastadora, él y Jane abren nuevos caminos científicos.', 2014, N'https://i.ebayimg.com/images/g/cCMAAOSwft5h9YJx/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (66, N'Karate Kid', N'Daniel llega a Los Ángeles de la costa este y enfrenta la difícil tarea de hacer nuevos amigos. Sin embargo, se convierte en el blanco del acoso de los Cobras, una amenazadora pandilla de estudiantes de karate, cuando inicia una relación con Ali, la ex novia del líder de los Cobras. Deseoso de defenderse e impresionar a su nueva novia, pero temeroso de enfrentar a la peligrosa pandilla, Daniel le pide a su conserje Miyagi, un maestro de las artes marciales, que le enseñe karate.', 1984, N'https://i.ebayimg.com/images/g/5DsAAOSwMyJiiT3F/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (67, N'King Kong', N'Un grupo de exploradores, liderado por un extrovertido director de cine, visitan Skull Island para investigar todo lo relacionado con la leyenda del gorila gigante llamado King Kong. Ahí encuentran una jungla llena de criaturas prehistóricas.', 2005, N'https://i.ebayimg.com/images/g/3ogAAOSwrNdgsXcz/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (68, N'El diablo viste a la moda', N'El mundo de la moda está gobernado por la déspota y sofisticada Miranda Priestly. Trabajar como su ayudante podría abrirle cualquier puerta a la inocente Andy Sachs, pero para ello tendrá que encajar entre las periodistas de la revista Runway.', 2006, N'https://m.media-amazon.com/images/I/41sHRBN+j5L._SY445_SX342_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (69, N'El diario de una princesa', N'La reina de un pequeña comunidad europea instruye a su rebelde nieta en los menesteres de la realeza.', 2001, N'https://i.ebayimg.com/images/g/yiQAAOSwpZpcpWFn/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (70, N'El padrino', N'Una adaptación ganadora del Premio de la Academia, de la novela de Mario Puzo acerca de la familia Corleone.', 1972, N'https://i.ebayimg.com/images/g/s1kAAOSw9KFiaB2t/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (71, N'El planeta de los simios', N'Un astronauta llega a un planeta del futuro, donde los simios son muy inteligentes y dominan a los humanos.', 1968, N'https://www.originalfilmart.com/cdn/shop/products/planet_of_the_apes_1968_original_film_art_f-1.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (72, N'Joker', N'Arthur Fleck adora hacer reír a la gente, pero su carrera como comediante es un fracaso. El repudio social, la marginación y una serie de trágicos acontecimientos lo conducen por el sendero de la locura y, finalmente, cae en el mundo del crimen.', 2019, N'https://i.ebayimg.com/images/g/hWIAAOSwSgddZ-7M/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (73, N'El pianista', N'Un judío polaco, pianista profesional, lucha por la supervivencia en Varsovia frente a la invasión nazi. Después de, gracias a unos amigos, haber evitado la deportación, el pianista debe vivir oculto y constantemente expuesto al peligro.', 2002, N'https://i.ebayimg.com/thumbs/images/g/QxQAAOSw9OFZFjs5/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (74, N'El secreto de sus ojos', N'Un juez tiene dudas acerca de los planes de un oficial de justicia recientemente retirado que intenta descubrir al culpable de la violación y el asesinato de una joven, crimen ocurrido varias décadas atrás.', 2009, N'https://pics.filmaffinity.com/el_secreto_de_sus_ojos-483213496-mmed.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (75, N'El cisne negro', N'Una bailarina empieza a perder el frágil sentido de la realidad cuando una compañera recién llegada amenaza con usurpar su posición en el papel principal de "El lago de los cisnes".', 2010, N'https://www.originalfilmart.com/cdn/shop/products/black_swan_2011_sweden_original_film_art_5000x.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (76, N'Dune', N'Arrakis, también denominado "Dune", se ha convertido en el planeta más importante del universo. A su alrededor comienza una gigantesca lucha por el poder que culmina en una guerra interestelar.', 2021, N'https://cdn.posteritati.com/posters/000/000/068/245/dune-md-web.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (77, N'Deadpool', N'Un exmercenario quien, tras haber sido sometido a un cruel experimento, adquiere el superpoder de sanar rápidamente y pretende vengarse del hombre que destrozó su vida.', 2016, N'https://i.ebayimg.com/images/g/jxAAAOSwHglfg7SF/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (78, N'Diario de una pasión', N'En un hogar de retiro un hombre le lee a una mujer, que sufre de Alzheimer, la historia de dos jóvenes de distintas clases sociales que se enamoraron durante la convulsionada década del 40, y de cómo fueron separados por terceros, y por la guerra.', 2004, N'https://m.media-amazon.com/images/I/81zHy+InA5L._AC_SY741_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (79, N'Casablanca', N'En Marruecos, el dueño (Humphrey Bogart) de un café ayuda a su ex novia (Ingrid Bergman) y a su marido (Paul Henreid) a escapar de los nazis.', 1942, N'https://postercity.com.ar/wp-content/uploads/2019/07/Casablanca-Warner-Brothers-1946-First-Post-War-Release-Italian-4-F-50-x-70-low-510x719.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (80, N'Cómo perder a un hombre en 10 días', N'Andie escribe una divertida columna en la revista Composure, especializada en el comportamiento femenino típico. Pero esta vez le asignaron un artículo inusual: debe escribir la lista de cosas que las mujeres suelen hacer para espantar a los hombres.', 2003, N'https://i.ebayimg.com/images/g/YzwAAOxymiVQ9zfP/s-l960.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (81, N'Cómo entrenar a tu dragón', N'Hipo, un vikingo adolescente, comienza las clases de entrenamiento con dragones y ve por fin una oportunidad para demostrar que es capaz de convertirse en guerrero cuando hace amistad con un dragón herido.', 2010, N'https://i.ebayimg.com/thumbs/images/g/OgIAAOSwnhlb6wku/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (82, N'Los cazafantasmas', N'Cuatro investigadores de sucesos paranormales desempleados crean una empresa en Nueva York con el propósito de limpiar la ciudad de fantasmas.', 1984, N'https://i.ebayimg.com/images/g/8TAAAOSw-IlgNxMD/s-l1600.png')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (83, N'Capitán América: el primer vengador', N'Tras tres meses de someterse a un programa de entrenamiento físico y táctico, encomiendan a Steve Rogers su primera misión como Capitán América. Armado con un escudo indestructible, emprende la guerra contra la perversa organización HYDRA.', 2011, N'https://http2.mlstatic.com/D_NQ_NP_778721-MLA49972306686_052022-O.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (84, N'Coco', N'Miguel es un niño que sueña con ser músico, pero su familia se lo prohíbe porque su tatarabuelo, músico, los abandonó, y quieren obligar a Miguel a ser zapatero, como todos los miembros de la familia. Por accidente, Miguel entra en la Tierra de los Muertos, de donde sólo podrá salir si un familiar difunto le concede su bendición, pero su tatarabuela se niega a dejarlo volver con los vivos si no promete que no será músico. Debido a eso, Miguel escapa de ella y empieza a buscar a su tatarabuelo.', 2017, N'https://i.ebayimg.com/images/g/qD8AAOSwTOtapSLx/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (85, N'Bob Esponja: la película', N'Bob Esponja y Patrick viajan a ciudad Shell para recuperar la corona de Neptuno y salvar la vida del Sr. Krabs.', 2004, N'https://es.web.img3.acsta.net/c_310_420/medias/nmedia/18/89/75/07/20065183.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (86, N'Beethoven', N'Una familia se une para rescatar a su perro San Bernardo, cuando un malvado veterinario lo secuestra.', 1992, N'https://image.tmdb.org/t/p/original/e8TpSf9snnaHP0C8OmLMfOcVouF.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (87, N'Matrix', N'Un experto en computadoras descubre que su mundo es una simulación total creada con maliciosas intenciones por parte de la ciberinteligencia.', 1999, N'https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/59162/4839574/apim8hjnp__28817.1625621174.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (88, N'Monsters, Inc.', N'Monsters, Incorporated es la fábrica de sustos más grande en el mundo de los monstruos y James P. Sullivan es uno de sus mejores asustadores. Sullivan es un monstruo grande e intimidante de piel azul con grandes manchas color púrpura y cuernos. Su asistente, mejor amigo y compañero de cuarto es Mike Wazowski, un pequeño y alegre monstruo verde con un solo ojo. Por una falla durante la jornada de trabajo, conocen a Boo, una niña pequeña que entra a un mundo donde los humanos no están permitidos.', 2001, N'https://i.ebayimg.com/images/g/qfgAAOSwEJ9gQwur/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (89, N'Madagascar', N'Un grupo de animales que pasaron toda su vida en un zoológico de Nueva York terminan por error en la selva de Madagascar y no tienen más remedio que aprender a sobrevivir en la naturaleza.', 2005, N'https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/2909085/5948099/MOVCF5155__12381.1679593422.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (90, N'Miss Peregrine y los niños peculiares', N'Mientras investiga un misterio que le legó su abuelo, un adolescente encuentra en la costa de Gales una isla en la que habitan niños con poderes especiales y terribles enemigos que los amenazan.', 2016, N'https://m.media-amazon.com/images/I/713CLzh1lPL._AC_SY879_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (91, N'Mi vecino Totoro', N'Esta historia animada del director Hayao Miyazaki sigue a las estudiantes y hermanas Satsuke y Mei mientras se establecen en su casa de campo con su padre y esperan a que su madre se recupere de una enfermedad en un hospital del área. Cuando las hermanas exploran su nueva casa, descubren y hacen amistad con unos duendes juguetones, y en el bosque cercano encuentran a una enorme criatura conocida como Totoro.', 1988, N'https://m.media-amazon.com/images/I/81RkM26bXwL._AC_SY879_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (92, N'Titanic', N'Una joven de la alta sociedad abandona a su arrogante pretendiente por un artista humilde en el trasatlántico que se hundió durante su viaje inaugural.', 1997, N'https://i.etsystatic.com/27725708/r/il/3989d8/2912524873/il_794xN.2912524873_6vc1.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (93, N'Volver al futuro', N'Una máquina del tiempo transporta a un adolescente a los años 50, cuando sus padres todavía estudiaban en la secundaria.', 1985, N'https://i.ebayimg.com/images/g/SeUAAOSwa9dggMgH/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (94, N'Shrek', N'Un ogro llamado Shrek vive en su pantano, pero su preciada soledad se ve súbitamente interrumpida por la invasión de los ruidosos personajes de los cuentos de hadas. Todos fueron expulsados de sus reinos por el malvado Lord Farquaad. Decidido a salvar su hogar, Shrek hace un trato con Farquaad y se prepara para rescatar a la princesa Fiona, quien será la esposa de Farquaad.', 2001, N'https://moviepostermexico.com/cdn/shop/products/shrek_ver3_xxlg_1024x1024@2x.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (95, N'Mi pobre angelito', N'Un encantador niño de 8 años desafía a un torpe par de ladrones cuando, accidentalmente, sus padres lo olvidan en casa.', 1990, N'https://i.ebayimg.com/images/g/g2sAAOxy4YdTSEUb/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (96, N'Orgullo y prejuicio', N'Elizabeth Bennet conoce al apuesto y adinerado Sr. Darcy, con quien, rápidamente, inicia una intensa y compleja relación.', 2005, N'https://i.ebayimg.com/images/g/fiYAAOSwDtRe8YD5/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (97, N'Oppenheimer', N'Durante la Segunda Guerra Mundial, el teniente general Leslie Groves designa al físico J. Robert Oppenheimer para un grupo de trabajo que está desarrollando el Proyecto Manhattan, cuyo objetivo consiste en fabricar la primera bomba atómica.', 2023, N'https://m.media-amazon.com/images/I/71lqDylcvGL._AC_SY879_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (98, N'Misión imposible', N'El espía Ethan Hunt debe llevar a cabo una misión imposible: evitar la venta de un disco robado que contiene información confidencial y, al mismo tiempo, limpiar su nombre tras haber sido acusado del asesinato de su mentor.', 1996, N'https://i.ebayimg.com/images/g/3EcAAOSwNnVkuk1o/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (99, N'Men in Black', N'Los hombres de negro son el secreto mejor guardado del universo: su misión es monitorear a los extraterrestres desde la Tierra.', 1997, N'https://es.web.img3.acsta.net/pictures/14/06/20/11/52/053731.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (100, N'Mejor... imposible', N'Melvin Udall, un escritor obsesivo y maniático, es uno de los seres más desagradables que se puede tener como vecino. Pero, un buen día, tiene que hacerse cargo de un perro al que odia a muerte y su presencia le ablandará el corazón.', 1997, N'https://m.media-amazon.com/images/I/712sHkL2R1L._AC_SY879_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (101, N'Máxima Velocidad', N'Un oficial de policía debe detener un autobús metropolitano en el que un psicópata colocó una bomba, la cual explotará si el vehículo baja de los 80 kilómetros por hora.', 1994, N'https://i.etsystatic.com/23647903/r/il/957196/2747014385/il_794xN.2747014385_r44i.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (102, N'Mamma Mia!', N'Donna, una hotelera independiente de las islas griegas, prepara la boda de su hija con la ayuda de dos viejos amigos. Mientras tanto, Sophie, la alegre hija de Donna, tiene su propio plan. Invita a la boda a tres hombres del pasado de su madre con la esperanza de conocer a su padre biológico para que la acompañe al altar.', 2008, N'https://i.ebayimg.com/images/g/l9oAAOSwJZhhXhSQ/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (103, N'Moonlight', N'Un joven de familia humilde que vive en Miami en la época en que los cárteles de la droga libran en la ciudad una auténtica batalla, tiene problemas para aceptar su homosexualidad. Mientras madura en un ambiente hostil, experimenta la alegría, la ira, el placer de la belleza, el éxtasis y el dolor. Todo lo conocerá y de todo aprenderá.', 2016, N'https://i.ebayimg.com/images/g/GR4AAOSwlzZbGIyn/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (104, N'Mujercitas', N'En los primeros años que prosiguen a la guerra civil estadounidense, la vida de una familia se ve alterada para siempre luego de que Beth, una de las hermanas, revela que padece una terrible enfermedad.', 2019, N'https://i.ebayimg.com/images/g/UT4AAOSwilNdxjGE/s-l1600.jpg')
GO
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (105, N'Minority Report', N'Un policía futurista tiene 36 horas para prevenir un asesinato que los psíquicos han predicho que él cometerá.', 2002, N'https://i.ebayimg.com/images/g/-McAAOSwq4Vb1NP9/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (106, N'Nimona', N'Un caballero acusado de un trágico crimen se alía con una audaz adolescente con poderes metamórficos para probar su inocencia. Se cuestiona si ella es el monstruo al que juró destruir.', 2023, N'https://i.ebayimg.com/images/g/SpMAAOSwROJkoreZ/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (107, N'Phineas y Ferb: A través de la segunda dimensión', N'Phineas, Ferb y su mascota ornitorrinco quedan atrapados en una dimensión desconocida donde el Dr. Doofenshmirtz es gobernante.', 2011, N'https://miro.medium.com/v2/resize:fit:720/format:webp/1*nhtRhndzFKDUeGrifVTrIg@2x.jpeg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (108, N'Pixeles', N'Un mecánico de televisión, un criminal y un teórico de la conspiración, todos ellos amigos del presidente y antiguos jugadores de élite de videojuegos, son reclutados por el presidente para ayudar a salvar al país.', 2015, N'https://i.ebayimg.com/images/g/BssAAOSwhA9kdxR0/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (109, N'Perfume de mujer', N'Un excoronel invidente lleva a su joven guía a pasar una aventura maravillosa en Nueva York y enseñarle los placeres de la vida.', 1992, N'https://i.ebayimg.com/images/g/~1QAAMXQR-dRFNBp/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (110, N'Rango', N'Rango es un camaleón que lleva toda su vida viviendo como mascota en un terrario. Sin embargo, un buen día, mientras transportan su terrario, el recipiente se cae del auto en medio del desierto y acaba en un pueblo salvaje donde lo nombran alguacil.', 2011, N'https://i.ebayimg.com/images/g/LmAAAMXQ97RRG0oE/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (111, N'Rápido y furioso', N'El oficial Brian OConner debe decidir dónde queda su lealtad cuando se enamora del mundo de las carreras callejeras, donde trabaja como agente encubierto con la misión de desaparecerlas.', 2001, N'https://i.ebayimg.com/images/g/WFsAAOSwlRdgWV~4/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (112, N'Rescatando al soldado Ryan', N'Después de desembarcar en Normandía, en plena Segunda Guerra Mundial, unos soldados norteamericanos deben arriesgar sus vidas para salvar al soldado James Ryan, cuyos tres hermanos han muerto en la guerra.', 1998, N'https://i.ebayimg.com/images/g/2IUAAOSwNzNkX9xs/s-l1600.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (113, N'Retrato de una mujer en llamas', N'Marianne es una pintora que recibe un encargo muy especial: retratar a Héloïse, quien acaba de salir del convento y va a casarse. Este retrato de bodas tiene que realizarse sin que ella lo sepa, por lo que Marianne la investigará a diario.', 2019, N'https://i.ebayimg.com/images/g/2VgAAOSwNU9fPnoE/s-l500.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (114, N'Raya y el último dragón', N'Raya, una guerrera solitaria, debe localizar a un dragón legendario para restaurar su tierra fracturada y a su gente dividida.', 2021, N'https://lumiere-a.akamaihd.net/v1/images/poster_sin_cine_ad89a921.jpeg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (115, N'Son como niños', N'Un grupo de amigos y excompañeros descubren que envejecer no siempre significa madurar cuando se reúnen para honrar la memoria de su entrenador de baloncesto.', 2010, N'https://m.media-amazon.com/images/M/MV5BMjA0ODYwNzU5Nl5BMl5BanBnXkFtZTcwNTI1MTgxMw@@._V1_.jpg')
INSERT [dbo].[Pelicula] ([idPelicula], [titulo], [sinopsis], [anioLanzamiento], [foto]) VALUES (116, N'WALL-E', N'Luego de pasar años limpiando la Tierra desierta, el robot Wall-E conoce a EVA y la sigue por toda la galaxia.', 2008, N'https://m.media-amazon.com/images/M/MV5BMjExMTg5OTU0NF5BMl5BanBnXkFtZTcwMjMxMzMzMw@@._V1_.jpg')
SET IDENTITY_INSERT [dbo].[Pelicula] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([idRating], [calificacion], [opinion], [fecha], [idUsuario], [idPelicula]) VALUES (1, 4, N'Buena música', CAST(N'2023-11-29' AS Date), 2, 24)
INSERT [dbo].[Rating] ([idRating], [calificacion], [opinion], [fecha], [idUsuario], [idPelicula]) VALUES (2, 5, NULL, CAST(N'2023-11-29' AS Date), 3, 94)
INSERT [dbo].[Rating] ([idRating], [calificacion], [opinion], [fecha], [idUsuario], [idPelicula]) VALUES (3, 3, N'Me re gustó, pero hay partes medio bizarras', CAST(N'2023-11-29' AS Date), 4, 1)
INSERT [dbo].[Rating] ([idRating], [calificacion], [opinion], [fecha], [idUsuario], [idPelicula]) VALUES (4, 4, N'<zxcvbnm', CAST(N'2023-11-29' AS Date), 3, 1)
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [username], [nombre], [contrasena]) VALUES (1, N'mica', N'mica', N'a')
INSERT [dbo].[Usuario] ([idUsuario], [username], [nombre], [contrasena]) VALUES (2, N'tobi-gr', N'Tobias', N'b')
INSERT [dbo].[Usuario] ([idUsuario], [username], [nombre], [contrasena]) VALUES (3, N'brian', N'brian', N'b')
INSERT [dbo].[Usuario] ([idUsuario], [username], [nombre], [contrasena]) VALUES (4, N'potii', N'agustina', N'c')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario_pelicula] ON 

INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (5, 1, 3, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (7, 1, 1, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (13, 1, 10, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (14, 1, 8, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (15, 0, 12, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (17, 1, 6, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (18, 1, 7, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (22, 0, 14, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (23, 1, 15, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (24, 1, 17, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (26, 0, 18, 1)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (27, 0, 1, 2)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (28, 1, 24, 2)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (29, 0, 25, 2)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (30, 0, 3, 2)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (31, 1, 94, 3)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (32, 1, 1, 4)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (33, 1, 1, 3)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (34, 0, 12, 3)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (35, 0, 15, 3)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (36, 0, 24, 3)
INSERT [dbo].[Usuario_pelicula] ([id], [estado], [idPelicula], [idUsuario]) VALUES (37, 0, 10, 3)
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
/****** Object:  StoredProcedure [dbo].[ActualizarRating]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarPeli]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  StoredProcedure [dbo].[BuscarPeli]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  StoredProcedure [dbo].[CambiarEstadoPeli]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  StoredProcedure [dbo].[CrearUsuario]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarPeliParaVer]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarRating]    Script Date: 30/11/2023 08:38:17 ******/
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
	IF NOT EXISTS(SELECT * FROM Rating WHERE idPelicula = @pidPelicula AND idUsuario = @pidUsuario)
		BEGIN
			INSERT INTO Rating (calificacion, opinion, fecha, idUsuario, idPelicula)
				VALUES(@pcalificacion, @popinion, (SELECT GETDATE()), @pidUsuario, @pidPelicula)
		END
	ELSE
		BEGIN
			UPDATE Rating
				SET calificacion = @pcalificacion, opinion = @popinion, fecha = (SELECT GETDATE())
			WHERE idPelicula = @pidPelicula AND idUsuario = @pidUsuario
		END
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeli]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPelisPorVer]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPelisVistas]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerRating]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerRatings]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerUsuario]    Script Date: 30/11/2023 08:38:17 ******/
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
/****** Object:  StoredProcedure [dbo].[QuieroVer]    Script Date: 30/11/2023 08:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QuieroVer]
	@pidUsuario int,
	@pidPelicula int
AS
BEGIN	
	IF NOT EXISTS(SELECT * FROM Usuario_pelicula WHERE idPelicula = @pidPelicula AND idUsuario = @pidUsuario)
	BEGIN
		INSERT INTO Usuario_pelicula(estado, idPelicula, idUsuario)
			VALUES('False', @pidPelicula, @pidUsuario)
	END

	IF EXISTS(SELECT * FROM Usuario_pelicula WHERE idPelicula = @pidPelicula AND idUsuario = @pidUsuario AND estado = 'True')
	BEGIN
		UPDATE Usuario_pelicula
		SET estado = 'False'
		WHERE idUsuario = @pidUsuario AND idPelicula = @pidPelicula
	END
END
GO
USE [master]
GO
ALTER DATABASE [BDPelis] SET  READ_WRITE 
GO
