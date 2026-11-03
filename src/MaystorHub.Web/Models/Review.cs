using System.ComponentModel.DataAnnotations;

namespace MaystorHub.Web.Models;

public class Review
{
    public int Id { get; set; }
    public int WorkOrderId { get; set; }
    public int MasterProfileId { get; set; }

    [Required]
    public string ClientUserId { get; set; } = string.Empty;

    [Range(1, 5)]
    public int Rating { get; set; }

    [StringLength(1000)]
    public string? Comment { get; set; }

    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;
    public WorkOrder? WorkOrder { get; set; }
    public MasterProfile? MasterProfile { get; set; }
}
