using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Model.Entities;

namespace Landsight.Model.Configurations
{
    public class PoiConfiguration : IEntityTypeConfiguration<Poi>
    {
        public void Configure(EntityTypeBuilder<Poi> builder)
        {
            builder.ToTable("Pois");
            builder.HasKey(p => p.Id);
            builder.Property(p => p.Id)
                .ValueGeneratedOnAdd();
            builder.Property(p => p.Name)
                .IsRequired()
                .HasMaxLength(50);
        }
    }
}
