using System.ComponentModel.DataAnnotations;

namespace MaystorHub.Web.Models;

public class ConversationMessage
{
    public int Id { get; set; }
    public int ServiceRequestId { get; set; }

    [Required]
    public string SenderUserId { get; set; } = string.Empty;

    [Required, StringLength(2000, MinimumLength = 1)]
    public string Body { get; set; } = string.Empty;

    public DateTime SentAtUtc { get; set; } = DateTime.UtcNow;
    public DateTime? ReadAtUtc { get; set; }
    public ServiceRequest? ServiceRequest { get; set; }
}
