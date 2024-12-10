using Landsight.Model.Context;
using Landsight.Model.Entities;
using Model.Entities;

namespace Landsight.Model.Repositories
{
    public class PoiTourRepository : GenericRepository<PoiTour>
    {
        public PoiTourRepository(LandsightContext context) : base(context) { }

        public override PoiTour? Get(int id)
        {
            return _context.PoiTours.Find(id);
        }

        public override void Delete(int id)
        {
            var pt = Get(id);
            if (pt != null) _context.Remove(pt);
        }

        public List<PoiTour> GetPoiToursByTour(int tourId)
        {
            return _context.PoiTours.Where(pt => pt.TourId == tourId).ToList();
        }
    }
}
