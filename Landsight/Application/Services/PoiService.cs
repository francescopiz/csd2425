using Landsight.Application.Abstractions.Services;
using Landsight.Application.Models.DTOs;
using Landsight.Model.Repositories;

namespace Landsight.Application.Services
{
    public class PoiService : IPoiService
    {
        private readonly PoiRepository _repository;

        public PoiService(PoiRepository repository)
        {
            _repository = repository;
        }
        public PoiDTO? AddPoi(PoiDTO poi)
        {
            var realPoi = poi.ToEntity();
            _repository.Insert(realPoi);
            return new PoiDTO(realPoi);
        }

        public bool DeletePoi(int id)
        {
            throw new NotImplementedException();
        }

        public PoiDTO? GetPoi(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<PoiDTO> GetPois(int from, int num)
        {
            throw new NotImplementedException();
        }
    }
}
