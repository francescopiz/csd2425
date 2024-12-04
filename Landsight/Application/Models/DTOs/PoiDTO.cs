using Landsight.Application.Abstractions.Models.Dto;
using Model.Entities;

namespace Landsight.Application.Models.DTOs
{
    public class PoiDTO : GenericDto<Poi>
    {
        public int PoiId { get; set; }
        public string Name { get; set; }
        public string? Description { get; set; }
        public float? Latitude { get; set; }
        public float? Longitude { get; set; }
        public byte[]? AudioDescription { get; set; }
        public ICollection<MediaFileDTO> MediaFileDTOs { get; set; }

        public PoiDTO(Poi poi)
        {
            PoiId = poi.Id;
            Name = poi.Name;
            Description = poi.Description;
            Latitude = poi.Latitude;
            Longitude = poi.Longitude;
            AudioDescription = poi.AudioDescription;
            MediaFileDTOs = new List<MediaFileDTO>();
        }
        public Poi ToEntity()
        {
            return new Poi()
            {
                Id = PoiId,
                Name = Name,
                Description = Description,
                Latitude = Latitude,
                Longitude = Longitude,
                AudioDescription = AudioDescription,
                MediaFiles = MediaFileDTOs.Select(m => m.ToEntity()).ToList()
            };
        }
    }
}
