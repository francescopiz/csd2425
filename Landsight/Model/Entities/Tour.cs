namespace Landsight.Model.Entities
{
    public class Tour
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public virtual ICollection<PoiTour> PoiTours { get; set; }
    }
}
