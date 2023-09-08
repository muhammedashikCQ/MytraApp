using MediatR;
using Models = MytraModel.Models;
using MediatR;
using MytraApp.DTOs;

namespace MytraApp.Request.Query.User.UserLogin
{
    public class UserLoginQuery : IRequest<UserDto>
    {
        public int UserId { get; set; }
        public string MailId { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    }
}
