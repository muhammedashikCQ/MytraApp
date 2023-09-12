using MediatR;
using Microsoft.EntityFrameworkCore;
using MytraModel.Models;
using MytraRepository.Context;
using System.Reflection.Metadata.Ecma335;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using static System.Runtime.InteropServices.JavaScript.JSType;
using Models = MytraModel.Models;


namespace MytraApp.Request.Command.Order.AddOrderCommand
{
    public class AddOrderCommandHandler : IRequestHandler<AddOrderCommand,string>
    {
        private readonly MytraContext context;

        public AddOrderCommandHandler(MytraContext context)
        {
            this.context = context;
        }

        public async Task<string> Handle(AddOrderCommand command, CancellationToken cancellationToken)
        {
            Models.Order order = new Models.Order();
            
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

            if (command.UserId >0)
            {
                order.UserId = (int)command.UserId;
            }
            else throw new Exception("Please select a location");


            if (command.LocationId is not null)
            {
                order.LocationId = (int)command.LocationId;
            }
            else throw new Exception("Please select a location");
            await context.Order.AddAsync(order);
            var orderdetails =  command.ServiceId.Select(x =>
            {
                return new Models.OrderDetail
                {
                    Order = order,
                    ServiceId = x
                };
            }
            );
            await context.OrderDetail.AddRangeAsync(orderdetails);
            await context.SaveChangesAsync(cancellationToken);

            return "success";

        }
    }
}
