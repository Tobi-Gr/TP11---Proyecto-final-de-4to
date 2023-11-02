CREATE PROCEDURE ObtenerPelisPorVer
	@idUsuario INT 
AS
BEGIN 
	SELECT *
	FROM Pelicula
	INNER JOIN Usuario_pelicula
		ON @idUsuario = Usuario_pelicula.idUsuario
	WHERE Usuario_pelicula.estado = 'False'
END

CREATE PROCEDURE ObtenerRating
	@idUsuario INT,
	@idPelicula INT
AS
BEGIN
	SELECT *
	FROM Rating
	WHERE idPelicula = @idPelicula
		AND idUsuario = @idUsuario 
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
	WHERE @idUsuario = @idUsuario
END

CREATE PROCEDURE CrearUsuario
	@username TEXT,
	@nombre TEXT,
	@contrasena TEXT
AS
BEGIN
	IF NOT EXISTS(SELECT 1 FROM Usuario WHERE username LIKE @username)
		BEGIN
			INSERT INTO Usuario(username, nombre, contrasena)
				VALUES(@username, @nombre, @contrasena)
		END
END

CREATE PROCEDURE CambiarEstadoPeli
	@idPelicula INT,
	@idUsuario INT
AS
BEGIN
	IF 'True' = (SELECT estado FROM Usuario_pelicula WHERE idPelicula = @idPelicula AND @idUsuario = idUsuario)
		BEGIN
			UPDATE Usuario_pelicula
			SET estado = 'False'
			WHERE @idPelicula = idPelicula
				AND @idUsuario = idUsuario
		END
	ELSE
		BEGIN
			UPDATE Usuario_pelicula
				SET estado = 'True'
				WHERE @idPelicula = idPelicula
					AND @idUsuario = idUsuario
		END
END


CREATE PROCEDURE InsertarRating
	@calificacion int,
	@opinion text,
	@idUsuario int,
	@idPelicula int
AS
BEGIN
	INSERT INTO Rating (calificacion, opinion, fecha, idUsuario, idPelicula)
		VALUES(@calificacion, @opinion, (SELECT GETDATE()), @idUsuario, @idPelicula)
END

CREATE PROCEDURE ActualizarRating
	@calificacion int,
	@opinion text,
	@fecha date,
	@idUsuario int,
	@idPelicula int
AS 
BEGIN
	UPDATE Rating
		SET calificacion = @calificacion, 
			opinion = @opinion,
			fecha = (SELECT GETDATE())
	WHERE idUsuario = @idUsuario
		AND idPelicula = @idPelicula
END

CREATE PROCEDURE QuieroVer
	@idUsuario int,
	@idPelicula int
AS
BEGIN
	INSERT INTO Usuario_pelicula(estado, idPelicula, idUsuario)
		VALUES('False', @idPelicula, @idUsuario)
END