using Landsight.Application.Abstractions.Models.Dto;
using Landsight.Model.Entities;

namespace Landsight.Application.Models.DTOs
{
    public class TourDTO : GenericDto<Tour>
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public TourDTO(Tour tour)
        {
            Id = tour.Id;
            Name = tour.Name;
            Description = tour.Description;
        }

        public Tour ToEntity()
        {
            return new Tour()
            {
                Id = Id,
                Name = Name,
                Description = Description
            };
        }
    }
}
