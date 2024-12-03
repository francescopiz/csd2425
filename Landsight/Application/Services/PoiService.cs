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

        public PoiDTO? GetPoi(int id)
        {
            var poi = _repository.Get(id);
            if (poi != null) return new PoiDTO(_repository.Get(id));
            else return null;
        }

        public IEnumerable<PoiDTO> GetPois()
        {
            var pois = _repository.GetPois();
            var poisDto = new List<PoiDTO>();
            foreach (var poi in pois)
            {
                poisDto.Add(new PoiDTO(poi)); 
            }
            return poisDto;
        }
    }
}
