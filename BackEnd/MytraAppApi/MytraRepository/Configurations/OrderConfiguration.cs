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
    public class OrderConfiguration : IEntityTypeConfiguration<Order>

    {
        public void Configure(EntityTypeBuilder<Order> builder)
        {
            builder.Property(x => x.UserId)
                .IsRequired();
            builder.HasOne(x => x.User)
                .WithMany()
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Restrict);
            builder.Property(x=>x.LocationId)
                .IsRequired();
            builder.HasOne(x => x.Location)
                .WithMany()
                .HasForeignKey(x => x.LocationId)
                .OnDelete(DeleteBehavior.Restrict);
            builder.Property(x=>x.BuildingName)
                .IsRequired()
                .HasMaxLength(50);
            builder.Property(x=>x.Description)
                .HasMaxLength(200);
        }
    }
}
