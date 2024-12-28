using Model.Entities;

namespace Landsight.Model.Entities
{
    public class Quiz
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public int PoiId { get; set; }
        public string Answer1 { get; set; }
        public string Answer2 { get; set; }
        public string? Answer3 { get; set; }
        public string? Answer4 { get; set; }
        public int CorrectAnswer { get; set; }
        public virtual Poi POI { get; set; }
    }
}
