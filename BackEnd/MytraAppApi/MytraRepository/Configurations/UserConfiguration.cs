using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MytraModel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MytraRepository.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.Property(x => x.UserName)
                .IsRequired()
                .HasMaxLength(50);
            builder.Property(x => x.Password)
                .IsRequired()
                .HasMaxLength(50);             
            builder.Property(x=>x.MailId)
                .IsRequired()
                .HasMaxLength(100);
            builder.HasIndex(x=>x.MailId)
                .IsUnique();       
        }
    }
}
