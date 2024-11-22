using Landsight.Application.Abstractions.Models.Dto;
using Landsight.Model.Entities;

namespace Landsight.Application.Models.DTOs
{
    public abstract class MediaFileDTO : GenericDto<MediaFile>
    {
        public MediaFile ToEntity()
        {
            return new MediaFile();
        }
    }
}
