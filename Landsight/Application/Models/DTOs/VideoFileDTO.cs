using Landsight.Application.Abstractions.Models.Dto;
using Landsight.Model.Entities;

namespace Landsight.Application.Models.DTOs
{
    public class VideoFileDTO : GenericDto<VideoFile>
    {
        public int VideoFileId { get; set; }
        public string Name { get; set; }
        public long Size { get; set; }
        public byte[] Content { get; set; }
        public int PoiId { get; set; }
        public PoiDTO PoiDto { get; set; }
        public VideoFile ToEntity()
        {
            return new VideoFile()
            {
                Id = VideoFileId,
                Name = Name,
                Size = Size,
                Content = Content,
                PoiId = PoiId,
                POI = PoiDto.ToEntity()
            };
        }
    }
}
