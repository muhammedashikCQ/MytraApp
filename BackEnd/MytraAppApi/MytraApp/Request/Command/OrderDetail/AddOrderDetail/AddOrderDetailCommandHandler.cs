using MediatR;
using MytraModel.Models;
using MytraRepository.Context;
using Models = MytraModel.Models;


namespace MytraApp.Request.Command.OrderDetail.AddOrderDetail
{
    public class AddOrderDetailCommandHandler : IRequestHandler<AddOrderDetailCommand, string>
    {
        private readonly MytraContext context;

        public AddOrderDetailCommandHandler(MytraContext context)
        {
            this.context = context;
        }

        public async Task<string> Handle(AddOrderDetailCommand command, CancellationToken cancellationToken)
        {
            Models.OrderDetail orderDetail = new Models.OrderDetail();
            orderDetail.OrderId = command.OrderId;
            context.OrderDetail.Add(orderDetail);
            await context.SaveChangesAsync(cancellationToken);

            return "success";
        }
    }
}
