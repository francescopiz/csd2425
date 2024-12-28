using Landsight.Application.Abstractions.Services;
using Landsight.Application.Models.DTOs;
using Landsight.Model.Repositories;

namespace Landsight.Application.Services
{
    public class TourService : ITourService
    {
        private readonly TourRepository _repository;
        private readonly PoiTourRepository _poiTourRepository;
        private readonly MediaFileRepository _mediaFileRepository;
        private readonly QuizRepository _quizRepository;

        public TourService(TourRepository repository, PoiTourRepository poiTourRepository, MediaFileRepository mediaFileRepository, QuizRepository quizRepository)
        {
            _repository = repository;
            _poiTourRepository = poiTourRepository;
            _mediaFileRepository = mediaFileRepository;
            _quizRepository = quizRepository;
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
            var tours = _repository.GetTours();
            var result = new List<TourDTO>();

            foreach (var tour in tours)
            {
                var tourDto = new TourDTO(tour);
                tourDto.Pois = tour.PoiTours
                    .Select(pt => new PoiDTO(pt.Poi))
                    .ToList();
                foreach (var poi in tourDto.Pois)
                {
                    foreach (var mediaFile in _mediaFileRepository.GetMediaFilesByPoi(poi.PoiId))
                    {
                        poi.MediaFileDTOs.Add(new MediaFileDTO(mediaFile));
                    }
                    poi.QuizDTOs = _quizRepository.GetQuizByPoiId(poi.PoiId).Select(q => new QuizDTO(q)).ToList();
                }
                result.Add(tourDto);
            }
            return result;
        }

        public IEnumerable<PoiDTO> GetPois(int tourId)
        {
            var result = new List<PoiDTO>();
            foreach (var poi in _repository.GetPois(tourId))
            {
                result.Add(new PoiDTO(poi));
            }
            return result;
        }
    }
}
