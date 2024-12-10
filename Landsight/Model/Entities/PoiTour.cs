using Model.Entities;

namespace Landsight.Model.Entities
{
    public class PoiTour
    {
        public int PoiId { get; set; }
        public virtual Poi Poi { get; set; }
        public int TourId { get; set; }
        public virtual Tour Tour { get; set; }
    }
}
