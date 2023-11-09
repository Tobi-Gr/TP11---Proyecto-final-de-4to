using System.Data.SqlClient;
using Dapper;
public static class BD
{
     private static string _connectionString = @"Server=localhost;DataBase=BDPelis;Trusted_Connection=True;";
     public static List<Pelicula> ObtenerPelisPorVer(int idUsuario)
     {
          List<Pelicula> listaPeliculas = new List<Pelicula>();
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sql = "EXEC ObtenerPelisPorVer @idUsuario = " + idUsuario + ";"; //creo que era así
               listaPeliculas = db.Query<Pelicula>(sql).ToList();
          }
          return listaPeliculas;
     }

     public static Rating ObtenerRating(int idUsuario, int idPelicula)
     {
          Rating rating;
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sql = "EXEC ObtenerRating @idUsuario = " + idUsuario + ", @idPelicula = " + idPelicula + ";"; 
               rating = db.QueryFirstOrDefault<Rating>(sql);
          }
          return rating;
     }

     public static List<Pelicula> ObtenerPelisVistas(int idUsuario)
     {
          List<Pelicula> listaPeliculas = new List<Pelicula>();
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sql = "EXEC ObtenerPelisVistas @idUsuario = " + idUsuario + ";";
               listaPeliculas = db.Query<Pelicula>(sql).ToList();
          }
          return listaPeliculas;
     }

     public static List<Rating> ObtenerTodosLosRatings(int idUsuario)
     {
          List<Rating> listaRatings = new List<Rating>();
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sql = "EXEC ObtenerRatings @idUsuario = " + idUsuario + ";";
               listaRatings = db.Query<Rating>(sql).ToList();
          }
          return listaRatings;
     }

     public static List<Pelicula> BuscarPeli(string busqueda)
     {
          List<Pelicula> listaPelis = new List<Pelicula>();
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sql = "EXEC BuscarPeli @buscar = " + busqueda + ";";
               listaPelis = db.Query<Pelicula>(sql).ToList();
          }
          return listaPelis;
     }

     public static Usuario ObtenerUsuario(string username)
     {
          Usuario usuario;
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sql = "EXEC Obtenerusuario @username = @pusername;"; 
               usuario = db.QueryFirstOrDefault<Usuario>(sql, new {pusername = username});
          }
          return usuario;
     }

     public static void CrearUsuario(string username, string nombre, string contrasena)
     {
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sql = "EXEC CrearUsuario @username = @pusername, @nombre = @pnombre, @contrasena = @pcontrasena;";
               db.Execute(sql, new {pusername = username, pnombre = nombre, pcontrasena = contrasena} );
          }
     }

     public static void CambiarEstadoPeli(string idPelicula, string idUsuario)
     {
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sql = "EXEC CambiarEstadoPeli @idPelicula = @pidPelicula, @idUsuario = @pidUsuario;";
               db.Execute(sql, new {pidPelicula = idPelicula, pidUsuario = idUsuario});
          }
     }

     public static void InsertarRating(string opinion, int calificacion, int idPelicula, int idUsuario)
     {
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sql = "EXEC InsertarRating @opinion = @popinion, @calificacion = @pcalificacion, @idPelicula = @pidPelicula, @idUsuario = @pidUsuario;";
               db.Execute(sql, new {popinion = opinion, pcalificacion = calificacion, pidPelicula = idPelicula, pidUsuario = idUsuario});
          }
     }
     
} 