using Landsight.Model.Context;
using Model.Entities;

namespace Landsight.Model.Repositories
{
    public class PoiRepository : GenericRepository<Poi>
    {
        public PoiRepository(LandsightContext context) : base(context) { }
    }
}
