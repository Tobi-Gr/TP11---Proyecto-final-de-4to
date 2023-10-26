public class Pelicula
{
    public int idPelicula {get; set;}
    public string titulo {get; set;}
    public string sinopsis {get; set;}
    public int anioLanzamiento {get; set;}

    public Pelicula(int id, string title, string sinop, int anio)
    {
        idPelicula = id;
        titulo = title;
        sinopsis = sinop;
        anioLanzamiento = anio;
    }
}