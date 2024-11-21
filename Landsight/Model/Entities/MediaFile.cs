using Model.Entities;

namespace Landsight.Model.Entities
{
    public abstract class MediaFile
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public long Size { get; set; }
        public byte[] Content { get; set; }
        public int POIId { get; set; }
        public virtual Poi POI { get; set; }
    }
}
