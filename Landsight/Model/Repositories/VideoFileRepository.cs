using Landsight.Model.Context;
using Landsight.Model.Entities;

namespace Landsight.Model.Repositories
{
    public class VideoFileRepository : GenericRepository<VideoFile>
    {
        public VideoFileRepository(LandsightContext context) : base(context) { }
    }
}
