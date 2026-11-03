using System.ComponentModel.DataAnnotations;

namespace MaystorHub.Web.Models;

public class ServiceOffer
{
    public int Id { get; set; }
    public int ServiceRequestId { get; set; }
    public int MasterProfileId { get; set; }

    [Range(typeof(decimal), "0.01", "1000000")]
    public decimal ProposedPrice { get; set; }

    [Range(1, 365)]
    public int EstimatedDays { get; set; }

    public DateTime? ProposedStartAtUtc { get; set; }

    [Required, StringLength(1000, MinimumLength = 10)]
    public string Message { get; set; } = string.Empty;

    public ServiceOfferStatus Status { get; set; } = ServiceOfferStatus.Pending;
    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;

    public ServiceRequest? ServiceRequest { get; set; }
    public MasterProfile? MasterProfile { get; set; }
}
