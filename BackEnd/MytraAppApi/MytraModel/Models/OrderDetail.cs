using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MytraModel.Models
{
    public class OrderDetail
    {
        public int OrderDetailId { get; set; }
        public int ServiceId { get; set; }
        public Service Service { get; set; }
        public int OrderId { get; set; }
        public Order Order { get; set; }
     
       
    }
}
