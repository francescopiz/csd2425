using Landsight.Model.Entities;

namespace Model.Entities
{
    public class Poi
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public byte[] AudioDescription { get; set; }
        public virtual ICollection<MediaFile> MediaFiles { get; set; }
    }
}