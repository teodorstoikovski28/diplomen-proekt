using MaystorHub.Web.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MaystorHub.Web.Controllers;

public class CategoriesController(ApplicationDbContext db) : Controller
{
    public async Task<IActionResult> Index()
    {
        var categories = await db.ServiceCategories
            .AsNoTracking()
            .Where(category => category.IsActive)
            .OrderBy(category => category.Name)
            .ToListAsync();

        return View(categories);
    }
}
