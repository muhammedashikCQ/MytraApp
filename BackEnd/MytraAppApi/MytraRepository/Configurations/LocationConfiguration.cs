﻿using Microsoft.EntityFrameworkCore;
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
    public class LocationConfiguration : IEntityTypeConfiguration<Location>
    {
        public void Configure(EntityTypeBuilder<Location> builder)
        {
            builder.Property(x => x.LocationName)
                .IsRequired()
                .HasMaxLength(50);
            builder.Property(x => x.LocationId).ValueGeneratedNever();
            builder.HasData(new Location[]
            {
                new Location(LocationEnum.Trivandrum),
                new Location(LocationEnum.Kollam),
                new Location(LocationEnum.Kochi),
                new Location(LocationEnum.Kottayam),
                new Location(LocationEnum.Idukki)
            });
        }
    }
}
 