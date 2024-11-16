using Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Landsight.Model.Entities
{
    public abstract class MediaFile
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public long Size { get; set; }
        public byte[] Content { get; set; }
        public int POIId { get; set; }
        public virtual Poi POI { get; set; }
    }
}
