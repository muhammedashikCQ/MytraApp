using MediatR;
using MytraModel.Models;
using Models = MytraModel.Models;

using static System.Runtime.InteropServices.JavaScript.JSType;

namespace MytraApp.Request.Command.Order.AddOrderCommand
{
    public class AddOrderCommand:IRequest<string>
    {
        //order detail
        public List<int> ServiceId { get; set; }

        //order
        public int UserId { get; set; }
        public int? LocationId { get; set; }
        public string BuildingName { get; set; }
        public string Description { get; set; }

    }
}
