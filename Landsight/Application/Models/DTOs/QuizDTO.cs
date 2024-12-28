using Landsight.Application.Abstractions.Models.Dto;
using Landsight.Model.Entities;

namespace Landsight.Application.Models.DTOs
{
    public class QuizDTO : GenericDto<Quiz>
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public int PoiId { get; set; }
        public string Answer1 { get; set; }
        public string Answer2 { get; set; }
        public string? Answer3 { get; set; }
        public string? Answer4 { get; set; }
        public int CorrectAnswer { get; set; }
        public PoiDTO PoiDTO { get; set; }

        public Quiz ToEntity()
        {
            return new Quiz()
            {
                Id = Id,
                Description = Description,
                PoiId = PoiId,
                Answer1 = Answer1,
                Answer2 = Answer2,
                Answer3 = Answer3,
                Answer4 = Answer4,
                CorrectAnswer = CorrectAnswer,
                POI = PoiDTO.ToEntity()
            };
        }
        public QuizDTO(Quiz quiz)
        {
            Id = quiz.Id;
            Description = quiz.Description;
            PoiId = quiz.PoiId;
            Answer1 = quiz.Answer1;
            Answer2 = quiz.Answer2;
            Answer3 = quiz.Answer3;
            Answer4 = quiz.Answer4;
            CorrectAnswer = quiz.CorrectAnswer;
            PoiDTO = null;
        }
    }
}
