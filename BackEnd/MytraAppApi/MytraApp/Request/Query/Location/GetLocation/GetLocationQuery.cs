using MediatR;
using Models = MytraModel.Models;

namespace MytraApp.Request.Query.Location.GetLocation
{
    public class GetLocationQuery:IRequest<List<Models.Location>>
    {

    }
}
