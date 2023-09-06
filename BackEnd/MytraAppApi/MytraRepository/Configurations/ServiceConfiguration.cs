using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MytraModel.Enums;
using MytraModel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MytraRepository.Configurations
{
    public class ServiceConfiguration : IEntityTypeConfiguration<Service>
    {
        public void Configure(EntityTypeBuilder<Service> builder)
        {
            builder.Property(x=>x.ServiceId)
                .ValueGeneratedNever();
            builder.Property(x => x.ServiceName)
                .IsRequired();
            builder.HasData(new Service[]
            {
                new Service(ServiceEnum.Cleaning),
                new Service(ServiceEnum.Washing),
                new Service(ServiceEnum.Plumbing),
                new Service(ServiceEnum.Painting),   
                new Service(ServiceEnum.Repair)
            });
        }
    }

}
