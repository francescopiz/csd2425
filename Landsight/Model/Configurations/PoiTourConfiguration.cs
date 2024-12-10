using Landsight.Model.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Landsight.Model.Configurations
{
    public class PoiTourConfiguration : IEntityTypeConfiguration<PoiTour>
    {
        public void Configure(EntityTypeBuilder<PoiTour> builder)
        {
            builder.ToTable("PoiTours");
            builder.HasKey(pt => new { pt.PoiId, pt.TourId });
            builder.HasOne(pt => pt.Poi)
                .WithMany(p => p.PoiTours)
                .HasForeignKey(pt => pt.PoiId);
            builder.HasOne(pt => pt.Tour)
                .WithMany(t => t.PoiTours)
                .HasForeignKey(pt => pt.TourId);
        }
    }
}
