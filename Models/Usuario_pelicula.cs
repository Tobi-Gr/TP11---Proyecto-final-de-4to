public class Usuario_pelicula
{
    public int id {get; set;}
    public bool estado {get; set;}
    public int idPelicula {get; set;}
    public int idUsuario {get; set;}
    public int idRating {get; set;}

    public Usuario_pelicula(int ID, bool state, int idP, int idU, int idR)
    {
        id = ID;
        estado = state;
        idPelicula = idP;
        idUsuario = idU;
        idRating = idR;
    }
}