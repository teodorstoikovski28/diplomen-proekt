using System.ComponentModel.DataAnnotations;

namespace MaystorHub.Web.Models;

public class ServiceCategory
{
    public int Id { get; set; }

    [Required, StringLength(80)]
    public string Name { get; set; } = string.Empty;

    [StringLength(400)]
    public string? Description { get; set; }

    public bool IsActive { get; set; } = true;
    public ICollection<MasterService> MasterServices { get; set; } = [];
    public ICollection<ServiceRequest> ServiceRequests { get; set; } = [];
}
