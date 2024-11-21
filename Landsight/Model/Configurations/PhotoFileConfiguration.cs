using Landsight.Model.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Landsight.Model.Configurations
{
    public class PhotoFileConfiguration : IEntityTypeConfiguration<PhotoFile>
    {
        public void Configure(EntityTypeBuilder<PhotoFile> builder)
        {
            builder.ToTable("PhotoFiles");
            builder.HasKey(pf => pf.Id);
            builder.Property(pf => pf.Id)
                .ValueGeneratedOnAdd();
            builder.Property(pf => pf.Name)
                .IsRequired()
                .HasMaxLength(50);
            builder.Property(pf => pf.Content)
                .IsRequired();
        }
    }
}
