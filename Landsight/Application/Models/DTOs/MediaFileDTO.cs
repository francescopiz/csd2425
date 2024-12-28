using Landsight.Application.Abstractions.Models.Dto;
using Landsight.Model.Entities;

namespace Landsight.Application.Models.DTOs
{
    public class MediaFileDTO : GenericDto<MediaFile>
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public long Size { get; set; }
        public byte[] Content { get; set; }
        public int PoiId { get; set; }
        public PoiDTO PoiDTO { get; set; }

        public MediaFileDTO(MediaFile mediaFile)
        {
            Id = mediaFile.Id;
            Name = mediaFile.Name;
            Size = mediaFile.Size;
            Content = mediaFile.Content;
            PoiId = mediaFile.PoiId;
            PoiDTO = null;
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
