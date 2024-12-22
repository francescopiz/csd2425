using Landsight.Model.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Landsight.Model.Configurations
{
    public class MediaFileConfiguration : IEntityTypeConfiguration<MediaFile>
    {
        public void Configure(EntityTypeBuilder<MediaFile> builder)
        {
            builder.ToTable("MediaFiles");
            builder.HasKey(mf => mf.Id);
            builder.Property(mf => mf.Id)
                .ValueGeneratedOnAdd();
            builder.Property(mf => mf.Name)
                .HasMaxLength(100);
            builder.HasOne(mf => mf.POI)
                .WithMany(p => p.MediaFiles)
                .HasForeignKey(mf => mf.PoiId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
