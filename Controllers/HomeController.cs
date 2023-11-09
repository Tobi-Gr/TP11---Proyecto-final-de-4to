using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP11___Proyecto_final_de_4to.Models;

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

    public IActionResult Home(int idUsuario)
    {
        ViewBag.pelisVistas = BD.ObtenerPelisVistas(idUsuario);
        ViewBag.pelisPorVer = BD.ObtenerPelisPorVer(idUsuario);
        ViewBag.ratings = BD.ObtenerTodosLosRatings(idUsuario);
        return View();
    }

    [HttpPost]
    public IActionResult PostRegistro(string nombre, string username, string contrasena, string confirmacion)
    {
        if(contrasena == confirmacion && BD.ObtenerUsuario(username) == null)
        {
            BD.CrearUsuario(username, nombre, contrasena);
            Usuario nuevo = BD.ObtenerUsuario(username);
            return RedirectToAction("Home", new {idUsuario = nuevo.idUsuario});
        }
        return RedirectToAction("Registrarse");
    }

    [HttpPost]
    public IActionResult PostInicioSesion(string username, string contrasena)
    {
        Usuario existente = BD.ObtenerUsuario(username);
        if(contrasena == existente.contrasena)
        {
            return RedirectToAction("Home",new {idUsuario = existente.idUsuario});
        }
        else
        {
            return RedirectToAction("Index");
        }
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
}
