using MediatR;
using Models = MytraModel.Models;
using MytraRepository.Context;
using MytraApp.Request.Query.User.GetUserQuery;

namespace MytraApp.Request.Query.Services.GetServices
{
    public class GetServicesQueryHandler : IRequestHandler<GetServicesQuery, List<Models.Service>>
    {
        private readonly MytraContext _context;
        public GetServicesQueryHandler(MytraContext context)
        {
            _context = context;
        }
        public async Task<List<Models.Service>> Handle(GetServicesQuery request, CancellationToken cancellationToken)
        {
            return _context.Service.ToList();
        }
    }
}
