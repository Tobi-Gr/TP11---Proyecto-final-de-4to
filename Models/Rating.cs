public  class Rating
{
    public int idRating {get; set;}
    public int calificacion {get; set;}
    public string opinion {get; set;}
    public DateTime fecha {get; set;}
    public int idPeli {get; set;}
    public int idUsuario {get; set;}

    public Rating (int id, int puntaje, string op, DateTime date, int idPelicula, int idUser)
    {
        idRating = id;
        calificacion = puntaje;
        opinion = op;
        fecha = date;
        idPeli = idPelicula;
        idUsuario = idUser;
    }

    public Rating(){}
}