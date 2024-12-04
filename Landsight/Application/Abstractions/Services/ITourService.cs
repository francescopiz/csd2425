using Landsight.Application.Models.DTOs;

namespace Landsight.Application.Abstractions.Services
{
    public interface ITourService
    {
        TourDTO? AddTour(TourDTO tour);
        TourDTO? GetTour(int id);
        bool DeleteTour(int id);
        IEnumerable<TourDTO> GetTours();
        IEnumerable<PoiDTO> GetPois(int tourId);
    }
}
