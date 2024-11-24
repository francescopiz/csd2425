using Landsight.Model.Context;
using Model.Entities;

namespace Landsight.Model.Repositories
{
    public class PoiRepository : GenericRepository<Poi>
    {
        public PoiRepository(LandsightContext context) : base(context) { }

        public override Poi? Get(int id)
        {
            return _context.Pois.Find(id);
        }

        public override void Delete(int id)
        {
            var poi = Get(id);
            if (poi != null) _context.Remove(poi);
        }
    }
}
