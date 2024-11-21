using Landsight.Model.Context;
using Landsight.Model.Entities;

namespace Landsight.Model.Repositories
{
    public class PhotoFileRepository : GenericRepository<PhotoFile>
    {
        public PhotoFileRepository(LandsightContext context) : base(context) { }
    }
}
