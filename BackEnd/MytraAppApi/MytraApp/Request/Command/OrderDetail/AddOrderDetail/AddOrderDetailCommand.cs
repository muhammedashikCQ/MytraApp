using MediatR;

namespace MytraApp.Request.Command.OrderDetail.AddOrderDetail
{
    public class AddOrderDetailCommand:IRequest<string>
    {
        public int ServiceId { get; set; }
        public int OrderId { get; set; }

    }
}
