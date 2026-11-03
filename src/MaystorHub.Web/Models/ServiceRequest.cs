using System.ComponentModel.DataAnnotations;

namespace MaystorHub.Web.Models;

public class ServiceRequest
{
    public int Id { get; set; }

    [Required]
    public string ClientUserId { get; set; } = string.Empty;

    public int ServiceCategoryId { get; set; }

    [Required, StringLength(120)]
    public string Title { get; set; } = string.Empty;

    [Required, StringLength(3000, MinimumLength = 20)]
    public string Description { get; set; } = string.Empty;

    [Required, StringLength(80)]
    public string City { get; set; } = string.Empty;

    [StringLength(250)]
    public string? AddressDetails { get; set; }

    [Range(typeof(decimal), "0", "1000000")]
    public decimal? BudgetMin { get; set; }

    [Range(typeof(decimal), "0", "1000000")]
    public decimal? BudgetMax { get; set; }

    public DateTime? PreferredFromUtc { get; set; }
    public DateTime? PreferredToUtc { get; set; }
    public ServiceRequestStatus Status { get; set; } = ServiceRequestStatus.Open;
    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;

    public ServiceCategory? ServiceCategory { get; set; }
    public ICollection<ServiceOffer> Offers { get; set; } = [];
    public ICollection<ConversationMessage> Messages { get; set; } = [];
}
