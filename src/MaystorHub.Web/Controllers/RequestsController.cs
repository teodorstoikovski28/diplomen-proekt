using MaystorHub.Web.Data;
using MaystorHub.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MaystorHub.Web.Controllers;

public class RequestsController(ApplicationDbContext db) : Controller
{
    public async Task<IActionResult> Index()
    {
        var requests = await db.ServiceRequests
            .AsNoTracking()
            .Where(request => request.Status == ServiceRequestStatus.Open)
            .Include(request => request.ServiceCategory)
            .OrderByDescending(request => request.CreatedAtUtc)
            .ToListAsync();

        return View(requests);
    }
}
