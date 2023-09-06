using MediatR;
using Models=MytraModel.Models;
using MytraRepository.Context;
using System.Reflection.Metadata.Ecma335;

namespace MytraApp.Request.Query.User.GetUserQuery
{
    public class GetAllUserQueryHandler:IRequestHandler<GetAllUserQuery,List<Models.User>>
    {
        private readonly MytraContext _context;
        public GetAllUserQueryHandler(MytraContext context) 
        {
            _context = context;
        }
        public async Task<List<Models.User>> Handle(GetAllUserQuery query,CancellationToken cancellationToken)
        {
            return _context.User.ToList();
        }

        
    }
}
