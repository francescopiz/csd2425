using Landsight.Application.Abstractions.Services;
using Landsight.Application.Models.DTOs;
using Landsight.Model.Repositories;

namespace Landsight.Application.Services
{
    public class MediaFileService : IMediaFileService
    {
        private readonly MediaFileRepository _repository;

        public MediaFileService(MediaFileRepository repository)
        {
            _repository = repository;
        }
        public MediaFileDTO? AddMediaFile(MediaFileDTO mediaFile)
        {
            var realMediaFile = mediaFile.ToEntity();
            _repository.Insert(realMediaFile);
            return new MediaFileDTO(realMediaFile);
        }

        public bool DeleteMediaFile(int id)
        {
            try
            {
                _repository.Delete(id);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public MediaFileDTO? GetMediaFile(int id)
        {
            var mf = _repository.Get(id);
            if (mf != null) return new MediaFileDTO(_repository.Get(id));
            else return null;
        }

        public IEnumerable<MediaFileDTO> GetMediaFilesByPoi(int poiId)
        {
            var result = new List<MediaFileDTO>();
            var mediaFiles = _repository.GetMediaFilesByPoi(poiId);
            foreach (var mediaFile in mediaFiles)
            {
                result.Add(new MediaFileDTO(mediaFile));
            }
            return result;
        }
    }
}
