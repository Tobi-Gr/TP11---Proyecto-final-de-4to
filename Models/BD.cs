using System.Data.SqlClient;
using Dapper;
public static class BD
{
     private static string _connectionString = @"Server=localhost;DataBase=BDPelis;Trusted_Connection=True;";
     public static ObtenerPelisPorVer(int idUsuario)
     {
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sql = "EXEC ObtenerPelisPorVer @idUsuario = " + idUsuario; //creo que era así
               ListaPeliculas = db.Query<Pelicula>(sql).ToList();
          }
     }

     public static ObtenerRating(int idUsuario, int idPelicula)
     {
          using(SqlConnection db = new SqlConnection(_connectionString))
          {
               string sql = "EXEC ObtenerRating @idUsuario = " + idUsuario + ", @idPelicula = " + idPelicula; //creo que era así
               ListaSeries = db.QueryFirstOrDefault<Rating>(sql).ToList();
          }
     }
} 