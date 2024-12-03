using Landsight.Application.Models.DTOs;

namespace Landsight.Application.Abstractions.Services
{
    public interface IMediaFileService
    {
        MediaFileDTO? AddMediaFile(MediaFileDTO mediaFile);

        MediaFileDTO? GetMediaFile(int id);

        bool DeleteMediaFile(int id);

        IEnumerable<MediaFileDTO> GetMediaFilesByPoi(int poiId);
    }
}
