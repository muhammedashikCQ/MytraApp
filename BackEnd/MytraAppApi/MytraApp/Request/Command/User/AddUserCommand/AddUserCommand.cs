using MediatR;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace MytraApp.Request.Command.User.AddUserCommand
{
    public class AddUserCommand:IRequest<string>
    {
        public string UserName { get; set; } = string.Empty;
        public string MailId { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;       
    }
}
