using Landsight.Application.Models.DTOs;

namespace Landsight.Application.Abstractions.Services
{
    public interface IPoiService
    {
        PoiDTO? AddPoi(PoiDTO poi);

        PoiDTO? GetPoi(int id);

        bool DeletePoi(int id);

        IEnumerable<PoiDTO> GetPois(int from, int num);
    }
}
