using MediatR;

namespace MytraApp.Request.Command.User.AddUserCommand
{
    public class AddUserCommand:IRequest<bool>
    {
        public string UserName { get; set; }
        public string MailId {get; set; }
        public string Password { get; set; }
    }
}
