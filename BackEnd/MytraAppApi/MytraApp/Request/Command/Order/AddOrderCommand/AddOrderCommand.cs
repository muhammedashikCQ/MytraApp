using MediatR;
using MytraModel.Models;

namespace MytraApp.Request.Command.Order.AddOrderCommand
{
    public class AddOrderCommand:IRequest<string>
    {
        //order detail
        public int? ServiceId { get; set; }

        //order
        public int UserId { get; set; }
        public int? LocationId { get; set; }
        public string BuildingName { get; set; }
        public string Description { get; set; }

    }
}
