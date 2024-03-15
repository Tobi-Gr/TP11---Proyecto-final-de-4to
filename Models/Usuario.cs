public class Usuario 
{
    public int idUsuario {get; set;}
    public string username {get; set;}
    public string nombre {get; set;}
    public string contrasena {get; set;}
    public bool admin {get; set;}


    public Usuario(int id, string user, string nom, string contra, bool owner)
    {
        idUsuario = id;
        username = user;
        nombre = nom;
        contrasena = contra;
        admin = owner;
    }
    
    public Usuario(){}

}