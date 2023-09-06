using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace MytraModel.Models
{
    public class User
    {
        
        public int UserId { get; set; } 
        public string UserName { get; set; } = string.Empty;
        public string MailId { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    } 
}
