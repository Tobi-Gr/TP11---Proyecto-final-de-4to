public class Usuario 
{
    public int idUsuario {get; set;}
    public string username {get; set;}
    public string nombre {get; set;}
    public string contrasena {get; set;}

    public Usuario(){}

    public Usuario(int id, string user, string nom, string contra)
    {
        idUsuario = id;
        username = user;
        nombre = nom;
        contrasena = contra;
    }
}