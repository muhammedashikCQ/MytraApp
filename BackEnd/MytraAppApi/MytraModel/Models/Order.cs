using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MytraModel.Models
{
    public class Order
    {
        public int OrderId { get; set; }
        public int UserId { get; set; }
        public User User { get; set; }
        public int LocationId { get; set; }
        public Location Location { get; set; }
        public string BuildingName { get; set; }
        public string Description { get; set; }
    }
}
