using Landsight.Application.Abstractions.Models.Dto;
using Model.Entities;

namespace Landsight.Application.Models.DTOs
{
    public class PoiDTO : GenericDto<Poi>
    {
        public int PoiId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public byte[] AudioDescription { get; set; }
        public ICollection<>

        public Poi ToEntity()
        {
            return new Poi()
            {
                Id = PoiId,
                Name = Name,
                Description = Description,
                Latitude = Latitude,
                Longitude = Longitude

            };
        }
    }
}
