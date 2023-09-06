using MediatR;
using Models=MytraModel.Models;

namespace MytraApp.Request.Query.User.GetUserQuery
{
    public class GetAllUserQuery:IRequest<List<Models.User>>
    {

    }
}
