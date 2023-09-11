using MytraModel.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MytraModel.Models
{
    public class Service
    {
        public int ServiceId { get; set; }
        public string ServiceName { get; }
        public Service() { 
            ServiceName=string.Empty;
        }
        public Service(ServiceEnum serviceEnum)
        {
            ServiceId=(byte)serviceEnum;
            ServiceName = serviceEnum.ToString();
        }
    }
}
