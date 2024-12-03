using Landsight.Model.Context;
using Landsight.Model.Entities;

namespace Landsight.Model.Repositories
{
    public class MediaFileRepository : GenericRepository<MediaFile>
    {
        public MediaFileRepository(LandsightContext context) : base(context) { }
        
        public override MediaFile? Get(int id)
        {
            return _context.MediaFiles.Find(id);
        }

        public override void Delete(int id)
        {
            var mf = Get(id);
            if(mf != null) _context.Remove(mf);
        }

        public IEnumerable<MediaFile> GetMediaFiles()
        {
            return _context.MediaFiles;
        }

        public IEnumerable<MediaFile> GetMediaFilesByPoi(int poiId)
        {
            return _context.MediaFiles.Where(mf => mf.PoiId == poiId).ToList();
        }
    }
}
