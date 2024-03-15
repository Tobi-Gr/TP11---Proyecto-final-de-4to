using System.Data.SqlClient;
using System.Data;
using Dapper;
public static class BD
{
     private static string _connectionString = @"Server=localhost;DataBase=BDPelis;Trusted_Connection=True;";
     public static List<Pelicula> ObtenerPelisPorVer(int idUsuario)
     {
          List<Pelicula> listaPeliculas = new List<Pelicula>();
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "ObtenerPelisPorVer";
               listaPeliculas = db.Query<Pelicula>(sp, new {pidUsuario = idUsuario}, commandType:CommandType.StoredProcedure).ToList();
          }
          return listaPeliculas;
     }

     public static Rating ObtenerRating(int idUsuario, int idPelicula)
     {
          Rating rating;
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "ObtenerRating"; 
               rating = db.QueryFirstOrDefault<Rating>(sp, new {pidUsuario = idUsuario, pidPelicula = idPelicula}, commandType: CommandType.StoredProcedure);
          }
          return rating;
     }

     public static List<Pelicula> ObtenerPelisVistas(int idUsuario)
     {
          List<Pelicula> listaPeliculas = new List<Pelicula>();
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "ObtenerPelisVistas";
               listaPeliculas = db.Query<Pelicula>(sp, new {pidUsuario = idUsuario}, commandType: CommandType.StoredProcedure).ToList();
          }
          return listaPeliculas;
     }

     public static List<Rating> ObtenerTodosLosRatings(int idUsuario)
     {
          List<Rating> listaRatings = new List<Rating>();
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "ObtenerRatings";
               listaRatings = db.Query<Rating>(sp, new {pidUsuario = idUsuario}, commandType: CommandType.StoredProcedure).ToList();
          }
          return listaRatings;
     }

     public static List<Pelicula> BuscarPeli(string busqueda)
     {
          List<Pelicula> listaPelis = new List<Pelicula>();
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "BuscarPeli";
               listaPelis = db.Query<Pelicula>(sp, new {pbuscar = busqueda}, commandType: CommandType.StoredProcedure).ToList();
          }
          return listaPelis;
     }

     public static Usuario ObtenerUsuario(string username)
     {
          Usuario usuario;
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "ObtenerUsuario";
               usuario = db.QueryFirstOrDefault<Usuario>(sp, new {pusername = username}, commandType: CommandType.StoredProcedure);
          }
          return usuario;
     }

     public static Pelicula ObtenerPelicula(int idPeli)
     {
          Pelicula pelicula;
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "ObtenerPeli";
               pelicula = db.QueryFirstOrDefault<Pelicula>(sp, new {pidPelicula = idPeli}, commandType: CommandType.StoredProcedure);
          }
          return pelicula;
     }

     public static void CrearUsuario(string username, string nombre, string contrasena)
     {
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "CrearUsuario";
               db.Execute(sp, new {pusername = username, pnombre = nombre, pcontrasena = contrasena}, commandType: CommandType.StoredProcedure);
          }
     }

     public static void AgregarPeli(string titulo, string sinopsis, int anio, string foto)
     {
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "AgregarPeli";
               db.Execute(sp, new {ptitulo = titulo, psinopsis = sinopsis, panio = anio, pfoto = foto}, commandType: CommandType.StoredProcedure);
          }
     }

     public static void CambiarEstadoPeli(int idPelicula, int idUsuario)
     {
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "CambiarEstadoPeli";
               db.Execute(sp, new {pidPelicula = idPelicula, pidUsuario = idUsuario}, commandType: CommandType.StoredProcedure);
          }
     }

     public static void EliminarPeliDeLista(int idPelicula, int idUsuario)
     {
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "EliminarPeliParaVer";
               db.Execute(sp, new {pIdPelicula = idPelicula, pIdUsuario = idUsuario}, commandType: CommandType.StoredProcedure);
          }
     }

     public static void InsertarRating(string opinion, int calificacion, int idPelicula, int idUsuario)
     {
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "InsertarRating";
               db.Execute(sp, new {popinion = opinion, pcalificacion = calificacion, pidPelicula = idPelicula, pidUsuario = idUsuario}, commandType: CommandType.StoredProcedure);
          }
     }

     public static void QuieroVer(int idPelicula, int idUsuario)
     {
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sp = "QuieroVer";
               db.Execute(sp, new {pidPelicula = idPelicula, pidUsuario = idUsuario}, commandType: CommandType.StoredProcedure);
          }
     }
     
} 