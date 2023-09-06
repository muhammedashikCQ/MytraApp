using MediatR;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Models=MytraModel.Models;
using MytraRepository.Context;
using Microsoft.EntityFrameworkCore;
using MytraModel.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using System.Threading;

namespace MytraApp.Request.Query.User.UserLogin
{
    public class UserLoginQueryHandler : IRequestHandler<UserLoginQuery, bool>
    {
        private readonly MytraContext _context;

        public UserLoginQueryHandler(MytraContext context)
        {
            _context = context;
        }
        public async Task<bool> Handle(UserLoginQuery query, CancellationToken cancellationToken)
        {

            Models.User user = new Models.User();
            bool isEmailAndPasswordExist = await _context.User.AnyAsync(x => x.MailId == query.MailId && x.Password == query.Password);
            if (isEmailAndPasswordExist)
            {
                return true;
            }
            else
            {
                throw new Exception("You have entered wrong username or password");
            }

        }



    }   
}         
