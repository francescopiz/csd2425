using Landsight.Model.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Landsight.Model.Configurations
{
    public class QuizConfiguration : IEntityTypeConfiguration<Quiz>
    {
        public void Configure(EntityTypeBuilder<Quiz> builder)
        {
            builder.ToTable("Quiz");
            builder.HasKey(q => q.Id);
            builder.Property(q => q.Id)
                .ValueGeneratedOnAdd();
            builder.HasOne(q => q.POI)
                .WithMany(p => p.Quiz)
                .HasForeignKey(q => q.PoiId)
                .OnDelete(DeleteBehavior.Cascade);
            builder.Property(q => q.Description)
                .IsRequired()
                .HasMaxLength(100);
            builder.Property(q => q.Answer1)
                .IsRequired()
                .HasMaxLength(100);
            builder.Property(q => q.Answer2)
                .IsRequired()
                .HasMaxLength(100);
            builder.Property(q => q.Answer3)
                .HasMaxLength(100);
            builder.Property(q => q.Answer4)
                .HasMaxLength(100);
            builder.Property(q => q.CorrectAnswer)
                .IsRequired();
        }
    }
}
