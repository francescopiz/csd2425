using Landsight.Application.Abstractions.Models.Dto;
using Landsight.Model.Entities;

namespace Landsight.Application.Models.DTOs
{
    public abstract class MediaFileDTO : GenericDto<MediaFile>
    {
        protected int Id { get; set; }
        protected string Name { get; set; }
        protected long Size { get; set; }
        protected byte[] Content { get; set; }
        protected int PoiId { get; set; }
        protected PoiDTO PoiDTO { get; set; }

        public abstract MediaFile ToEntity();
    }
}
