using System.ComponentModel.DataAnnotations;

namespace MaystorHub.Web.Models;

public class MasterProfile
{
    public int Id { get; set; }

    [Required]
    public string UserId { get; set; } = string.Empty;

    [Required, StringLength(100)]
    public string DisplayName { get; set; } = string.Empty;

    [Required, StringLength(80)]
    public string City { get; set; } = string.Empty;

    [StringLength(1500)]
    public string? Bio { get; set; }

    [Range(0, 60)]
    public int YearsExperience { get; set; }

    public MasterProfileStatus Status { get; set; } = MasterProfileStatus.Pending;
    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;

    public ICollection<MasterService> Services { get; set; } = [];
    public ICollection<ServiceOffer> Offers { get; set; } = [];
    public ICollection<Review> Reviews { get; set; } = [];
}
