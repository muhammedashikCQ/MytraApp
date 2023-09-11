using MediatR;
using Microsoft.EntityFrameworkCore;
using MytraRepository.Context;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using Models = MytraModel.Models;


namespace MytraApp.Request.Command.Order.AddOrderCommand
{
    public class AddOrderCommandHandler : IRequestHandler<AddOrderCommand, string>
    {
        private readonly MytraContext context;

        public AddOrderCommandHandler(MytraContext context)
        {
            this.context = context;
        }

        public async Task<string> Handle(AddOrderCommand command, CancellationToken cancellationToken)
        {
            Models.Order order = new Models.Order();
            Models.Service service = new Models.Service();
            Models.OrderDetail orderDetail = new Models.OrderDetail();
            if (command.Description != "")
            {
                order.Description = command.Description;

            }
            else throw new Exception("Description cannot be empty");

            if (command.BuildingName != "")
            {
                order.BuildingName = command.BuildingName;
            }
            else throw new Exception("BuildingName cannot be empty");

            if (command.ServiceId is not null)
            {
                orderDetail.ServiceId = (int)command.ServiceId;
            }
            else throw new Exception("Please select a service");

            if (command.LocationId is not null)
            {
                order.LocationId = (int)command.LocationId;
            }
            else throw new Exception("Please select a location");
            orderDetail.Order = order;
            orderDetail.Service = service;

            context.Order.Add(order);
            context.OrderDetail.Add(orderDetail);
            await context.SaveChangesAsync(cancellationToken);

            return "success";

        }
    }
}
