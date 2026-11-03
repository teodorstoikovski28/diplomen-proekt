using System.ComponentModel.DataAnnotations;

namespace MaystorHub.Web.Models;

public class MasterService
{
    public int Id { get; set; }
    public int MasterProfileId { get; set; }
    public int ServiceCategoryId { get; set; }

    [Range(typeof(decimal), "0", "1000000")]
    public decimal? StartingPrice { get; set; }

    [StringLength(20)]
    public string PriceUnit { get; set; } = "лв./услуга";

    public MasterProfile? MasterProfile { get; set; }
    public ServiceCategory? ServiceCategory { get; set; }
}
