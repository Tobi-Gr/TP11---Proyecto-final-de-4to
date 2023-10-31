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
	WHERE Usuario_pelicula.idPelicula IN (SELECT Pelicula.idPelicula
			FROM Pelicula
			INNER JOIN Usuario_pelicula
				ON pelicula.idPelicula = Usuario_pelicula.idPelicula
			INNER JOIN Usuario
				ON Usuario.idUsuario = Usuario_pelicula.idUsuario
			WHERE Usuario_pelicula.estado = 'True')
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

ALTER PROCEDURE CambiarEstadoPeli
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


CREATE TRIGGER ActualizarRating
ON Usuario_pelicula
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    -- Verificar si se actualizó el campo 'estado'
    IF UPDATE(estado)
    BEGIN
        -- Obtener los datos actualizados de Usuario_pelicula
        DECLARE @estadoPrevio bit;
        DECLARE @estadoNuevo bit;
        DECLARE @idUsuario int;

        SELECT @estadoPrevio = deleted.estado, @estadoNuevo = inserted.estado, @idUsuario = inserted.idUsuario
        FROM deleted
        JOIN inserted ON deleted.id = inserted.id;

        -- Si el campo 'estado' cambió a TRUE
        IF @estadoNuevo = 1
        BEGIN
            -- Actualizar el campo 'fecha' en la tabla Rating con la fecha actual
            UPDATE Rating
            SET fecha = GETDATE()
            WHERE idRating = @idUsuario;
        END
        -- Si el campo 'estado' cambió a FALSE
        ELSE
        BEGIN
            -- Eliminar la fila en la tabla Rating relacionada con el Usuario_pelicula
            DELETE FROM Rating
            WHERE idRating = @idUsuario;
        END
    END
END;
