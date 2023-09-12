using MediatR;
using MytraRepository.Context;
using Models = MytraModel.Models;

namespace MytraApp.Request.Query.Location.GetLocation
{
    public class GetLocationQueryHandler : IRequestHandler<GetLocationQuery, List<Models.Location>>
    {
        private readonly MytraContext _context;

        public GetLocationQueryHandler(MytraContext context)
        {
            _context = context;
        }
        public async Task<List<Models.Location>> Handle(GetLocationQuery request, CancellationToken cancellationToken)
        {
            return _context.Location.ToList();
        }
    }
}
