using Landsight.Model.Context;
using Microsoft.EntityFrameworkCore;

namespace Landsight.Model.Repositories
{
    public class GenericRepository<T> where T : class
    {
        protected LandsightContext _context;

        public GenericRepository(LandsightContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Method used to obtain a certain entity.
        /// </summary>
        /// <param name="id"> The Id of the Entity. </param>
        /// <returns>The Entity if it exists, null otherwise. </returns>
        public virtual T? Get(int id)
        {
            return _context.Set<T>().Find(id);
        }

        public virtual T? Get(T entity)
        {
            return _context.Set<T>().Find(entity);
        }

        /// <summary>
        /// Method used to insert an entity.
        /// </summary>
        /// <param name="entity"> The entity to add. </param>
        public virtual void Insert(T entity)
        {
            _context.Add(entity);
        }

        /// <summary>
        /// Method used to modify an entity.
        /// </summary>
        /// <param name="entity"> The entity that will be modified o </param>
        public virtual void Modify(T entity)
        {
            _context.Entry(entity).State = EntityState.Modified;
        }

        public virtual void Delete(int id)
        {
            _context.Entry(id).State = EntityState.Deleted;
        }

        public void Save()
        {
            _context.SaveChanges();
        }
    }
}
