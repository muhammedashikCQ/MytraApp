using MediatR;
using MytraModel.Models;

namespace MytraApp.Request.Command.Order.AddOrderCommand
{
    public class AddOrderCommand:IRequest<string>
    {
        public int? ServiceId { get; set; }
        public int? LocationId { get; set; }
        public string BuildingName { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;

    }
}
