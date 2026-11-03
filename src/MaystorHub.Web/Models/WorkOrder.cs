using System.ComponentModel.DataAnnotations;

namespace MaystorHub.Web.Models;

public class WorkOrder
{
    public int Id { get; set; }
    public int ServiceRequestId { get; set; }
    public int ServiceOfferId { get; set; }

    [Range(typeof(decimal), "0.01", "1000000")]
    public decimal AgreedPrice { get; set; }

    public WorkOrderStatus Status { get; set; } = WorkOrderStatus.Confirmed;
    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;
    public DateTime? CompletedAtUtc { get; set; }

    public ServiceRequest? ServiceRequest { get; set; }
    public ServiceOffer? ServiceOffer { get; set; }
    public ICollection<Visit> Visits { get; set; } = [];
    public Review? Review { get; set; }
}
