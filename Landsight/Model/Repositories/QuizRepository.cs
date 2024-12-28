using Landsight.Model.Context;
using Landsight.Model.Entities;

namespace Landsight.Model.Repositories
{
    public class QuizRepository : GenericRepository<Quiz>
    {
        public QuizRepository(LandsightContext context) : base(context)
        {
        }
        
        public override Quiz? Get(int id)
        {
            return _context.Quiz.Find(id);
        }
        public override void Delete(int id)
        {
            var quiz = Get(id);
            if (quiz != null) _context.Remove(quiz);
        }

        public IEnumerable<Quiz> GetQuizByPoiId(int poiId)
        {
            var res = _context.Quiz.Where(q => q.PoiId == poiId);
            return res.ToList();
        }

        public IEnumerable<Quiz> GetAll()
        {
            return _context.Quiz;
        }
    }
}
