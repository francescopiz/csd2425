using Landsight.Application.Abstractions.Models.Dto;
using Landsight.Model.Entities;

namespace Landsight.Application.Models.DTOs
{
    public class PhotoFileDTO : MediaFileDTO, GenericDto<PhotoFile>
    {


        public override PhotoFile ToEntity()
        {
            return new PhotoFile()
            {
                Id = Id,
                Name = Name,
                Size = Size,
                Content = Content,
                PoiId = PoiId,
                POI = PoiDTO.ToEntity()
            };
        }
    }
}
