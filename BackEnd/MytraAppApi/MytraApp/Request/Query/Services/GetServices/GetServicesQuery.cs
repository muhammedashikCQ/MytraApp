using MediatR;
using Models = MytraModel.Models;

using Microsoft.EntityFrameworkCore.Infrastructure;

namespace MytraApp.Request.Query.Services.GetServices
{
    public class GetServicesQuery:IRequest<List<Models.Service>>
    {
    }
}
