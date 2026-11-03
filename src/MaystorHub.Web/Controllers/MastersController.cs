using MaystorHub.Web.Data;
using MaystorHub.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MaystorHub.Web.Controllers;

public class MastersController(ApplicationDbContext db) : Controller
{
    public async Task<IActionResult> Index()
    {
        var masters = await db.MasterProfiles
            .AsNoTracking()
            .Where(profile => profile.Status == MasterProfileStatus.Approved)
            .Include(profile => profile.Services)
                .ThenInclude(service => service.ServiceCategory)
            .OrderBy(profile => profile.DisplayName)
            .ToListAsync();

        return View(masters);
    }
}
