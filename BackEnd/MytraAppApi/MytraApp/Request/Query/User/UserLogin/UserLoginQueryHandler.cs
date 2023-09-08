using MediatR;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Models=MytraModel.Models;
using MytraRepository.Context;
using Microsoft.EntityFrameworkCore;
using MytraModel.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using System.Threading;
using MytraApp.DTOs;

namespace MytraApp.Request.Query.User.UserLogin
{
    public class UserLoginQueryHandler : IRequestHandler<UserLoginQuery, UserDto>
    {
        private readonly MytraContext _context;

        public UserLoginQueryHandler(MytraContext context)
        {
            _context = context;
        }
        public async Task<UserDto> Handle(UserLoginQuery query, CancellationToken cancellationToken)
        {


            var user =  await _context.User.FirstOrDefaultAsync(x => x.MailId == query.MailId && x.Password == query.Password);
            if (user is not null)
            {

                UserDto userDto = new UserDto();
                userDto.UserName= user.UserName;
                userDto.UserId= user.UserId;
                userDto.MailId= user.MailId;
                return userDto;
            }
            else
            {
                throw new Exception("You have entered wrong username or password");
            }

        }

    }   
}         
