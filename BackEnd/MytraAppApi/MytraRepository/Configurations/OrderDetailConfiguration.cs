using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.Identity.Client;
using MytraModel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MytraRepository.Configurations
{
    public class OrderDetailConfiguration : IEntityTypeConfiguration<OrderDetail>
    {
        public void Configure(EntityTypeBuilder<OrderDetail> builder)
            
        {
         
            builder.Property(x => x.ServiceId)
                .IsRequired();
            builder.HasOne(x => x.Service).WithMany()
                .HasForeignKey(x => x.ServiceId)
                .OnDelete(DeleteBehavior.Restrict);
            builder.Property(x => x.OrderId)
                .IsRequired();
            builder.HasOne(x => x.Order).WithMany()
                .HasForeignKey(x => x.OrderId)
                .OnDelete(DeleteBehavior.Restrict);


        }
    }
}
