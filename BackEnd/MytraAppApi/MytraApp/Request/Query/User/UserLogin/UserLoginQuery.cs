using MediatR;
using Models = MytraModel.Models;
using MediatR;
namespace MytraApp.Request.Query.User.UserLogin
{
    public class UserLoginQuery : IRequest<bool>
    {
        public string MailId { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    }
}
