using Landsight.Application.Abstractions.Models.Dto;
using Landsight.Model.Entities;

namespace Landsight.Application.Models.DTOs
{
    public class PhotoFileDTO : GenericDto<PhotoFile>
    {

        public PhotoFile ToEntity()
        {
            return new PhotoFile();
        }
    }
}
