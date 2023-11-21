CREATE PROCEDURE ObtenerPelisPorVer
	@pidUsuario INT 
AS
BEGIN 
	SELECT *
	FROM Pelicula
	INNER JOIN Usuario_pelicula
		ON @pidUsuario = Usuario_pelicula.idUsuario
	WHERE Usuario_pelicula.estado = 'False'
END

CREATE PROCEDURE ObtenerRating
	@pidUsuario INT,
	@pidPelicula INT
AS
BEGIN
	SELECT *
	FROM Rating
	WHERE idPelicula = @pidPelicula
		AND idUsuario = @pidUsuario 
END

CREATE PROCEDURE BuscarPeli
	@pbuscar TEXT
AS
BEGIN
	SELECT * 
	FROM Pelicula
	WHERE titulo LIKE '%@pbuscar%'
END

ALTER PROCEDURE ObtenerUsuario
	@pusername text
AS
BEGIN
	SELECT *
	FROM Usuario
	WHERE username LIKE @pusername
END

CREATE PROCEDURE ObtenerPelisVistas
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

CREATE PROCEDURE ObtenerRatings
	@pidUsuario INT
AS
BEGIN
	SELECT *
	FROM Rating
	WHERE idUsuario = @pidUsuario
END

ALTER PROCEDURE CrearUsuario
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

CREATE PROCEDURE CambiarEstadoPeli
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


CREATE PROCEDURE InsertarRating
	@pcalificacion int,
	@popinion text,
	@pidUsuario int,
	@pidPelicula int
AS
BEGIN
	INSERT INTO Rating (calificacion, opinion, fecha, idUsuario, idPelicula)
		VALUES(@pcalificacion, @popinion, (SELECT GETDATE()), @pidUsuario, @pidPelicula)
END

CREATE PROCEDURE ActualizarRating
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

CREATE PROCEDURE QuieroVer
	@pidUsuario int,
	@pidPelicula int
AS
BEGIN
	INSERT INTO Usuario_pelicula(estado, idPelicula, idUsuario)
		VALUES('False', @pidPelicula, @pidUsuario)
END