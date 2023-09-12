using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using MytraModel.Models;
using System.Diagnostics;
using System.Reflection;

namespace MytraRepository.Context
{
    public class MytraContext : DbContext
    {
        public MytraContext(DbContextOptions option) : base(option)
        { 

        }
        public DbSet<User> User { get; set; }
        public DbSet<Service> Service { get; set; }
        public DbSet<Location> Location { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<OrderDetail> OrderDetail { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {


            var assemblyName = Assembly.GetExecutingAssembly();
            if (assemblyName is not null)
            
                modelBuilder.ApplyConfigurationsFromAssembly(assemblyName);
            
            //foreach (IMutableEntityType entity in modelBuilder.Model.GetEntityTypes())
            //{
            //    entity.GetForeignKeys().Where(fk => !fk.IsOwnership && fk.DeleteBehavior == DeleteBehavior.Cascade).
            //        ToList().
            //        ForEach(fk => fk.DeleteBehavior = DeleteBehavior.Restrict);
            //}
        }
    }
}
