using Landsight.Model.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Landsight.Model.Configurations
{
    public class VideoFileConfiguration : IEntityTypeConfiguration<VideoFile>
    {
        public void Configure(EntityTypeBuilder<VideoFile> builder)
        {
            builder.ToTable("VideoFiles");
            builder.HasKey(vf => vf.Id);
            builder.Property(vf => vf.Id)
                .ValueGeneratedOnAdd();
            builder.Property(vf => vf.Name)
                .IsRequired()
                .HasMaxLength(50);
            builder.Property(vf => vf.Content)
                .IsRequired();
        }
    }
}
