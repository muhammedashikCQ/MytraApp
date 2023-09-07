using MediatR;
using Models=MytraModel.Models;
using MytraRepository.Context;
using System.Text.RegularExpressions;
using System.Diagnostics.Eventing.Reader;
using Microsoft.EntityFrameworkCore;
using MytraModel.Models;
using Microsoft.Identity.Client;

namespace MytraApp.Request.Command.User.AddUserCommand
{
    public class AddUserCommandHandler : IRequestHandler<AddUserCommand, string>
    {
        private readonly MytraContext _context;
        public AddUserCommandHandler(MytraContext context)
        {
            _context = context;
        }
        public async Task<string> Handle(AddUserCommand command, CancellationToken cancellationToken)
        {
            Models.User user = new Models.User();
            if (command.UserName != "")
            {
                user.UserName = command.UserName;
            }
            else throw new Exception("Username Cannot be empty");
            

            var pattern = @"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";
            var regex=new Regex(pattern);

            if (regex.IsMatch(command.MailId))
            {
                user.MailId = command.MailId;
            }
            else throw new Exception("EmailId Invalid");


            if (command.Password.Length >= 8)
            {
                user.Password = command.Password;
            }
            else throw new Exception("Password must contain atleast eight characters");

            bool isEmailExist = await _context.User.AnyAsync(x => x.MailId == command.MailId);
            if (isEmailExist)
            {
                throw new Exception("Email already exists");
            }
            user.MailId = command.MailId;
            _context.User.Add(user);
            await _context.SaveChangesAsync(cancellationToken);
            return "success";
        }      
    }
}
