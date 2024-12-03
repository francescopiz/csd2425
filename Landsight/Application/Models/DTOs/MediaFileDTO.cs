using Landsight.Application.Abstractions.Models.Dto;
using Landsight.Model.Entities;

namespace Landsight.Application.Models.DTOs
{
    public class MediaFileDTO : GenericDto<MediaFile>
    {
        protected int Id { get; set; }
        protected string Name { get; set; }
        protected long Size { get; set; }
        protected byte[] Content { get; set; }
        protected int PoiId { get; set; }
        protected PoiDTO PoiDTO { get; set; }

        public MediaFileDTO(MediaFile mediaFile)
        {
            Id = mediaFile.Id;
            Name = mediaFile.Name;
            Size = mediaFile.Size;
            Content = mediaFile.Content;
            PoiId = mediaFile.PoiId;
            PoiDTO = new PoiDTO(mediaFile.POI);
        }

        public MediaFile ToEntity()
        {
            return new MediaFile()
            {
                Id = Id,
                Name = Name,
                Size = Size,
                Content = Content,
                PoiId = PoiDTO.PoiId,
                POI = PoiDTO.ToEntity()
            };
        }

    }
}
