using MytraModel.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MytraModel.Models
{
    public class Location
    {
        public int LocationId { get; set; }
        public string LocationName { get; set; }
        private Location() { 
        LocationName = string.Empty;
        }
        public Location(LocationEnum locationEnum) {
            LocationId = (byte)locationEnum;
            LocationName = locationEnum.ToString();

        }
    }
}
