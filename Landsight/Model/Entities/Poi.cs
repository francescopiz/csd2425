using Landsight.Model.Entities;

namespace Model.Entities
{
    public class Poi
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string? Description { get; set; }
        public float? Latitude { get; set; }
        public float? Longitude { get; set; }
        public byte[]? AudioDescription { get; set; }
        public virtual ICollection<MediaFile> MediaFiles { get; set; }
        public virtual ICollection<PoiTour> PoiTours { get; set; }
    }
}