CREATE PROCEDURE ObtenerPelisPorVer
	@idUsuario INT 
AS
BEGIN 
	SELECT *
	FROM Pelicula
	INNER JOIN Usuario_pelicula
		ON @idUsuario = Usuario_pelicula.idUsuario
	WHERE Usuario_pelicula.estado = 'por ver'
END

CREATE PROCEDURE ObtenerRating
	@idUsuario INT,
	@idPelicula INT
AS
BEGIN
	SELECT *
	FROM Rating
	INNER JOIN Usuario_pelicula
		ON Usuario_pelicula.idRating = Rating.idRating
	WHERE @idUsuario = Usuario_pelicula.idUsuario
		AND @idPelicula = Usuario_pelicula.idPelicula
END

CREATE PROCEDURE BuscarPeli
	@buscar TEXT
AS
BEGIN
	SELECT * 
	FROM Pelicula
	WHERE titulo LIKE '%@buscar%'
END

CREATE PROCEDURE ObtenerUsuario
	@username text
AS
BEGIN
	SELECT *
	FROM Usuario
	WHERE @username LIKE username
END

CREATE PROCEDURE ObtenerPelisVistas
	@idUsuario INT
AS
BEGIN
	SELECT *
	FROM Pelicula
	INNER JOIN Usuario_pelicula
		ON pelicula.idPelicula = Usuario_pelicula.idPelicula
	INNER JOIN Usuario
		ON Usuario.idUsuario = Usuario_pelicula.idUsuario
	WHERE Usuario_pelicula.estado = 'True'
END

CREATE PROCEDURE ObtenerRatings
	@idUsuario INT
AS
BEGIN
	SELECT *
	FROM Rating
	INNER JOIN Usuario_pelicula
		ON Usuario_pelicula.idRating = Rating.idRating
	WHERE Usuario_pelicula.idRating IN (SELECT *
			FROM Pelicula
			INNER JOIN Usuario_pelicula
				ON pelicula.idPelicula = Usuario_pelicula.idPelicula
			INNER JOIN Usuario
				ON Usuario.idUsuario = Usuario_pelicula.idUsuario
			WHERE Usuario_pelicula.estado = 'True')
END