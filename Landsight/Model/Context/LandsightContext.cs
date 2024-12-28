using Landsight.Model.Entities;
using Microsoft.EntityFrameworkCore;
using Model.Entities;

namespace Landsight.Model.Context
{
    public class LandsightContext : DbContext
    {
        public DbSet<Poi> Pois { get; set; }
        public DbSet<MediaFile> MediaFiles { get; set; }
        public DbSet<Tour> Tours { get; set; }
        public DbSet<PoiTour> PoiTours { get; set; }
        public DbSet<Quiz> Quiz { get; set; }
        public LandsightContext() : base() { }

        public LandsightContext(DbContextOptions<LandsightContext> options) : base(options) { }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("data source=localhost;Initial catalog=Landsight;Integrated Security=True;TrustServerCertificate=True", builder =>
            {
                builder.EnableRetryOnFailure(5, TimeSpan.FromSeconds(10), null);
            });
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(this.GetType().Assembly);
            base.OnModelCreating(modelBuilder);
        }
    }
}
