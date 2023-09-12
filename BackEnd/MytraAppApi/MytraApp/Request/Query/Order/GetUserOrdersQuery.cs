using MediatR;
using MytraApp.DTOs;
using Models = MytraModel.Models;


namespace MytraApp.Request.Query.Order
{
    public class GetUserOrdersQuery:IRequest<List<UserOrdersDto>>
    {
        public int UserId { get; set; }
    }
}
