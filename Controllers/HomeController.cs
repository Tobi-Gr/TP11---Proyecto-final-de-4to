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
