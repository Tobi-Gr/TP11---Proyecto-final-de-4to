public class Rating
{
    public int idRating {get; set;}
    public int calificacion {get; set;}
    public string opinion {get; set;}
    public DateTime fecha {get; set;}

    public Rating (int id, int puntaje, int op, DateTime date)
    {
        idRating = id;
        calificacion = puntaje;
        opinion = op;
        fecha = date;
    }
}