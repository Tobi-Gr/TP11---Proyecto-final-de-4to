public class Pelicula
{
    public static int idPelicula {get; set;}
    public static string titulo {get; set;}
    public static string sinopsis {get; set;}
    public static int anioLanzamiento {get; set;}

    public Pelicula(int id, string title, string sinop, int anio)
    {
        idPelicula = id;
        titulo = title;
        sinopsis = sinop;
        anioLanzamiento = anio;
    }

}