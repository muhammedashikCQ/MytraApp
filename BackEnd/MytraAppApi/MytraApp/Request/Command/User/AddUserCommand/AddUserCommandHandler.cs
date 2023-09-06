using MediatR;
using Models=MytraModel.Models;
using MytraRepository.Context;

namespace MytraApp.Request.Command.User.AddUserCommand
{
    public class AddUserCommandHandler:IRequestHandler<AddUserCommand, bool>
    {
        private readonly MytraContext _context;
        public AddUserCommandHandler(MytraContext context)
        {
            _context = context;
        }
        public async Task<bool> Handle(AddUserCommand command, CancellationToken cancellationToken)
        {
            Models.User user=new Models.User();
            user.UserName=command.UserName;
            user.Password=command.Password;
            user.MailId=command.MailId;
            _context.User.Add(user);
            await _context.SaveChangesAsync();
            return true;
        }

        
    }
}
