using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using MaystorHub.Web.Models;

namespace MaystorHub.Web.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    public IActionResult Status(int code)
    {
        Response.StatusCode = code;
        if (code == 404)
        {
            return View("NotFound");
        }

        ViewData["StatusCode"] = code;
        return View("Status");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

