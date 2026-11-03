using System.ComponentModel.DataAnnotations;

namespace MaystorHub.Web.Models;

public class Visit
{
    public int Id { get; set; }
    public int WorkOrderId { get; set; }
    public DateTime StartsAtUtc { get; set; }
    public DateTime? EndsAtUtc { get; set; }
    public VisitStatus Status { get; set; } = VisitStatus.Proposed;

    [StringLength(500)]
    public string? Notes { get; set; }

    public WorkOrder? WorkOrder { get; set; }
}
