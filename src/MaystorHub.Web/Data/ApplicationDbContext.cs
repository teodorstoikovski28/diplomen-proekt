using MaystorHub.Web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace MaystorHub.Web.Data;

public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
    : IdentityDbContext<IdentityUser>(options)
{
    public DbSet<ServiceCategory> ServiceCategories => Set<ServiceCategory>();
    public DbSet<MasterProfile> MasterProfiles => Set<MasterProfile>();
    public DbSet<MasterService> MasterServices => Set<MasterService>();
    public DbSet<ServiceRequest> ServiceRequests => Set<ServiceRequest>();
    public DbSet<ServiceOffer> ServiceOffers => Set<ServiceOffer>();
    public DbSet<WorkOrder> WorkOrders => Set<WorkOrder>();
    public DbSet<Visit> Visits => Set<Visit>();
    public DbSet<ConversationMessage> ConversationMessages => Set<ConversationMessage>();
    public DbSet<Review> Reviews => Set<Review>();

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        builder.Entity<IdentityRole>().HasData(
            new IdentityRole { Id = "a1111111-1111-1111-1111-111111111111", Name = "Client", NormalizedName = "CLIENT", ConcurrencyStamp = "a1111111-1111-1111-1111-111111111111" },
            new IdentityRole { Id = "a2222222-2222-2222-2222-222222222222", Name = "Master", NormalizedName = "MASTER", ConcurrencyStamp = "a2222222-2222-2222-2222-222222222222" },
            new IdentityRole { Id = "a3333333-3333-3333-3333-333333333333", Name = "Admin", NormalizedName = "ADMIN", ConcurrencyStamp = "a3333333-3333-3333-3333-333333333333" }
        );

        builder.Entity<ServiceCategory>()
            .HasIndex(category => category.Name)
            .IsUnique();

        builder.Entity<ServiceCategory>().HasData(
            new ServiceCategory { Id = 1, Name = "ВиК услуги", Description = "Ремонт и монтаж на водопроводни и канализационни инсталации" },
            new ServiceCategory { Id = 2, Name = "Електро услуги", Description = "Електроинсталации, осветление и дребни ремонти" },
            new ServiceCategory { Id = 3, Name = "Боядисване и шпакловка", Description = "Подготовка и освежаване на стени и тавани" },
            new ServiceCategory { Id = 4, Name = "Монтаж на мебели", Description = "Сглобяване и монтаж на мебели и оборудване" },
            new ServiceCategory { Id = 5, Name = "Дребни домашни ремонти", Description = "Разнообразни услуги и поправки в дома" }
        );

        builder.Entity<MasterProfile>()
            .HasIndex(profile => profile.UserId)
            .IsUnique();
        builder.Entity<MasterProfile>()
            .HasOne<IdentityUser>()
            .WithOne()
            .HasForeignKey<MasterProfile>(profile => profile.UserId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.Entity<MasterService>()
            .HasIndex(service => new { service.MasterProfileId, service.ServiceCategoryId })
            .IsUnique();
        builder.Entity<MasterService>()
            .Property(service => service.StartingPrice)
            .HasPrecision(10, 2);
        builder.Entity<MasterService>()
            .HasOne(service => service.MasterProfile)
            .WithMany(profile => profile.Services)
            .HasForeignKey(service => service.MasterProfileId)
            .OnDelete(DeleteBehavior.Cascade);
        builder.Entity<MasterService>()
            .HasOne(service => service.ServiceCategory)
            .WithMany(category => category.MasterServices)
            .HasForeignKey(service => service.ServiceCategoryId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.Entity<ServiceRequest>()
            .Property(request => request.BudgetMin)
            .HasPrecision(10, 2);
        builder.Entity<ServiceRequest>()
            .Property(request => request.BudgetMax)
            .HasPrecision(10, 2);
        builder.Entity<ServiceRequest>()
            .HasOne<IdentityUser>()
            .WithMany()
            .HasForeignKey(request => request.ClientUserId)
            .OnDelete(DeleteBehavior.Restrict);
        builder.Entity<ServiceRequest>()
            .HasOne(request => request.ServiceCategory)
            .WithMany(category => category.ServiceRequests)
            .HasForeignKey(request => request.ServiceCategoryId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.Entity<ServiceOffer>()
            .Property(offer => offer.ProposedPrice)
            .HasPrecision(10, 2);
        builder.Entity<ServiceOffer>()
            .HasIndex(offer => new { offer.ServiceRequestId, offer.MasterProfileId })
            .IsUnique();
        builder.Entity<ServiceOffer>()
            .HasOne(offer => offer.ServiceRequest)
            .WithMany(request => request.Offers)
            .HasForeignKey(offer => offer.ServiceRequestId)
            .OnDelete(DeleteBehavior.Cascade);
        builder.Entity<ServiceOffer>()
            .HasOne(offer => offer.MasterProfile)
            .WithMany(profile => profile.Offers)
            .HasForeignKey(offer => offer.MasterProfileId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.Entity<WorkOrder>()
            .Property(order => order.AgreedPrice)
            .HasPrecision(10, 2);
        builder.Entity<WorkOrder>()
            .HasIndex(order => order.ServiceRequestId)
            .IsUnique();
        builder.Entity<WorkOrder>()
            .HasIndex(order => order.ServiceOfferId)
            .IsUnique();
        builder.Entity<WorkOrder>()
            .HasOne(order => order.ServiceRequest)
            .WithOne()
            .HasForeignKey<WorkOrder>(order => order.ServiceRequestId)
            .OnDelete(DeleteBehavior.Restrict);
        builder.Entity<WorkOrder>()
            .HasOne(order => order.ServiceOffer)
            .WithOne()
            .HasForeignKey<WorkOrder>(order => order.ServiceOfferId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.Entity<Visit>()
            .HasOne(visit => visit.WorkOrder)
            .WithMany(order => order.Visits)
            .HasForeignKey(visit => visit.WorkOrderId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.Entity<ConversationMessage>()
            .HasOne(message => message.ServiceRequest)
            .WithMany(request => request.Messages)
            .HasForeignKey(message => message.ServiceRequestId)
            .OnDelete(DeleteBehavior.Cascade);
        builder.Entity<ConversationMessage>()
            .HasOne<IdentityUser>()
            .WithMany()
            .HasForeignKey(message => message.SenderUserId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.Entity<Review>()
            .HasIndex(review => review.WorkOrderId)
            .IsUnique();
        builder.Entity<Review>()
            .ToTable(table => table.HasCheckConstraint("CK_Reviews_Rating", "[Rating] >= 1 AND [Rating] <= 5"));
        builder.Entity<Review>()
            .HasOne(review => review.WorkOrder)
            .WithOne(order => order.Review)
            .HasForeignKey<Review>(review => review.WorkOrderId)
            .OnDelete(DeleteBehavior.Cascade);
        builder.Entity<Review>()
            .HasOne(review => review.MasterProfile)
            .WithMany(profile => profile.Reviews)
            .HasForeignKey(review => review.MasterProfileId)
            .OnDelete(DeleteBehavior.Restrict);
        builder.Entity<Review>()
            .HasOne<IdentityUser>()
            .WithMany()
            .HasForeignKey(review => review.ClientUserId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}


