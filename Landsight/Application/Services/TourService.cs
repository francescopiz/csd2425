using Landsight.Application.Abstractions.Services;
using Landsight.Application.Models.DTOs;
using Landsight.Model.Repositories;

namespace Landsight.Application.Services
{
    public class TourService : ITourService
    {
        private readonly TourRepository _repository;
        private readonly PoiTourRepository _poiTourRepository;
        //TODO: Implement PoiTour relation (add tours with existing pois, update tables, ...)

        public TourService(TourRepository repository, PoiTourRepository poiTourRepository)
        {
            _repository = repository;
            _poiTourRepository = poiTourRepository;
        }

        public TourDTO? AddTour(TourDTO tour)
        {
            var realTour = tour.ToEntity();
            _repository.Insert(realTour);
            return new TourDTO(realTour);
        }

        public bool DeleteTour(int id)
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

        public TourDTO? GetTour(int id)
        {
            var realTour = _repository.Get(id);
            if(realTour != null) return new TourDTO(realTour);
            else return null;
        }

        public IEnumerable<TourDTO> GetTours()
        {
            var result = new List<TourDTO>();
            foreach(var tour in _repository.GetTours())
            {
                result.Add(new TourDTO(tour));
            }
            return result;
        }
        public IEnumerable<PoiDTO> GetPoisByTour()
        {
            return null; //TODO 
        }
    }
}
