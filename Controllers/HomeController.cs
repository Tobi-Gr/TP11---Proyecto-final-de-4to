using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP11___Proyecto_final_de_4to.Models;
using System.Collections.Generic;

namespace TP11___Proyecto_final_de_4to.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Registrarse()
    {
        return View();
    }

    public IActionResult InicioSesion()
    {
        return View();
    }

    public IActionResult Home(int idUsuario)
    {
        ViewBag.idUsuario = idUsuario;
        ViewBag.admin = BD.EsAdmin(idUsuario);
        ViewBag.pelisPorVer = BD.ObtenerPelisPorVer(idUsuario);

        Dictionary<Pelicula, Rating> dicPelisVistas = new Dictionary<Pelicula, Rating>();
        List<Pelicula> pelisVistas = BD.ObtenerPelisVistas(idUsuario);
        foreach(Pelicula item in pelisVistas)
        {
            dicPelisVistas.Add(item, BD.ObtenerRating(idUsuario, item.idPelicula));
        }
        ViewBag.dicPelisVistas = dicPelisVistas;
        return View();
    }

    [HttpPost]
    public IActionResult PostRegistro(string nombre, string username, string contrasena, string confirmacion)
    {
        if(nombre == null || username == null || contrasena == null || confirmacion==null)
        {
            ViewBag.Error = "Tenés que llenar todos los campos";
        }
        else
        {
            Usuario user = BD.ObtenerUsuario(username);
            if (user == null)
            {
                if(contrasena == confirmacion && username != "")
                {
                    BD.CrearUsuario(username, nombre, contrasena);
                    Usuario nuevo = BD.ObtenerUsuario(username);
                    return RedirectToAction("Home", new {idUsuario = nuevo.idUsuario});
                }
                {
                    ViewBag.Error = "Contraseñas no coinciden o no ingresaste el username";
                }
            }
            else {
                ViewBag.Error = "El usuario ya existe en la base";
            }
        }
        return View("Registrarse");
    }

    [HttpPost]
    public IActionResult PostInicioSesion(string username, string contrasena)
    {
        Usuario existente = BD.ObtenerUsuario(username);
        if(existente == null)
        {
            ViewBag.Error = "Ese usuario no existe";
            return View("Index");
        }
        else if(contrasena == existente.contrasena)
        {
            return RedirectToAction("Home", new {idUsuario = existente.idUsuario});
        }
        else
        {
            ViewBag.Error = "Contraseña incorrecta";
            return View("Index");
        }
    }

    public IActionResult Busqueda(string buscar, int idUser)
    {
        ViewBag.resultados = BD.BuscarPeli(buscar);
        ViewBag.idUsuario = idUser;
        ViewBag.admin = BD.EsAdmin(idUser);
        ViewBag.busqueda = buscar;
        return View("Buscar");
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

    [HttpPost]
    public Pelicula VerPeliculaAjax(int idPeli)
    {
        return BD.ObtenerPelicula(idPeli);
    }

    [HttpPost]
    public ActionResult EliminarPeliAjax(int idPelicula, int idUsuario)
    {
        BD.EliminarPeliDeLista(idPelicula, idUsuario);
        return Json(new { success = true });
    }

    [HttpPost]
    public ActionResult CambiarEstadoPeliAjax(int idPelicula, int idUsuario)
    {
        BD.CambiarEstadoPeli(idPelicula, idUsuario);
        return Json(new { success = true });
    }


    [HttpPost]
    public ActionResult EnlistarAjax(int idPelicula, int idUsuario)
    {
        BD.QuieroVer(idPelicula, idUsuario);
        return Json(new { success = true });
    }

    [HttpPost]
    public object ModalOpinionAjax(int idPelicula, int idUsuario)
    {
        return Json(new {pelicula = BD.ObtenerPelicula(idPelicula), rating = BD.ObtenerRating(idUsuario, idPelicula)});
    }

    [HttpPost]
    public IActionResult GuardarRatingAjax(string opinion, int calificacion, int idPelicula, int idUsuario)
    {
        BD.InsertarRating(opinion, calificacion, idPelicula, idUsuario);
        return Json(new { pelicula = BD.ObtenerPelicula(idPelicula), rating = BD.ObtenerRating(idUsuario, idPelicula)});
    }

    [HttpPost]
    public IActionResult AgregarPeli()
    {
        ViewBag.admin = true;
        return View();
    }

    public IActionResult PeliAgregada(string sinopsis, int anio, string titulo, string foto)
    {
        ViewBag.admin = true;
        BD.AgregarPeli(titulo, sinopsis, anio, foto);
        return View("Home");
    }
}
