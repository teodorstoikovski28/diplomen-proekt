using MaystorHub.Web.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MaystorHub.Web.Controllers;

public class ReviewsController(ApplicationDbContext db) : Controller
{
    public async Task<IActionResult> Index()
    {
        var reviews = await db.Reviews
            .AsNoTracking()
            .Include(review => review.MasterProfile)
            .OrderByDescending(review => review.CreatedAtUtc)
            .Take(50)
            .ToListAsync();

        return View(reviews);
    }
}
