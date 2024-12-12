using Landsight.Model.Context;
using Landsight.Model.Entities;
using Microsoft.EntityFrameworkCore;
using Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Landsight.Model.Repositories
{
    public class TourRepository : GenericRepository<Tour>
    {
        public TourRepository(LandsightContext context) : base(context) { }

        public override Tour? Get(int id)
        {
            return _context.Tours.Find(id);
        }

        public override void Delete(int id)
        {
            var tour = Get(id);
            if (tour != null) _context.Remove(tour);
        }

        public IEnumerable<Tour> GetTours()
        {
            return _context.Set<Tour>()
            .Include(t => t.PoiTours)
            .ThenInclude(pt => pt.Poi)
            .ToList();
        }
        public IEnumerable<Poi> GetPois(int idTour)
        {
            return _context.Tours
                .Where(w => w.Id == idTour)
                .SelectMany(p => p.PoiTours)
                .Select(p => p.Poi)
                .ToList();
        }
    }
}
