using Model.Entities;

namespace Landsight.Model.Entities
{
    public class MediaFile
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public long Size { get; set; }
        public byte[] Content { get; set; }
        public int PoiId { get; set; }
        public virtual Poi POI { get; set; }
    }
}
