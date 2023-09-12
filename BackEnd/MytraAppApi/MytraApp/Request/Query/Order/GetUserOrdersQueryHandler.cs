using MediatR;
using Microsoft.EntityFrameworkCore;
using MytraApp.DTOs;
using MytraModel.Models;
using MytraRepository.Context;
using Models = MytraModel.Models;


namespace MytraApp.Request.Query.Order
{
    public class GetUserOrdersQueryHandler : IRequestHandler<GetUserOrdersQuery, List<UserOrdersDto>>
    {
        private readonly MytraContext context;

        public GetUserOrdersQueryHandler(MytraContext context)
        {
            this.context = context;
        }

        public async Task<List<UserOrdersDto>> Handle(GetUserOrdersQuery request, CancellationToken cancellationToken)
        {
            return await context.Order.Where(x => x.UserId == request.UserId)
                .Include(x => x.OrderDetails)
                //.ThenInclude(x => x.Service)
                .Select(x => new UserOrdersDto
                {
                    UserId = x.UserId,
                    OrderId = x.OrderId,
                    Location = x.Location,
                    Service = x.OrderDetails.Select(y => y.Service).ToList(),
                    BuildingName = x.BuildingName,
                    Description = x.Description,
                }).ToListAsync(cancellationToken: cancellationToken);
        }
    }
}
