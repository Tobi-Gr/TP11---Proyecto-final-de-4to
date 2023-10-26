CREATE PROCEDURE ObtenerPelisPorVer
	@idUsuario int 
AS
BEGIN 
	SELECT *
	FROM Pelicula
	INNER JOIN Usuario_pelicula
		ON @idUsuario = Usuario_pelicula.idUsuario
	WHERE Usuario_pelicula.estado = 'por ver'
END

CREATE PROCEDURE ObtenerRating
	@idUsuario int
	@idPelicula int
AS
BEGIN
	SELECT *
	FROM Rating
	INNER JOIN Usuario_pelicula
		ON Usuario_pelicula.idRating = Rating.idRating
	WHERE @idUsuario = Usuario_pelicula.idUsuario
		AND @idPelicula = Usuario_pelicula.idPelicula
END