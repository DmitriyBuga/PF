using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace PF.Models.Concrete
{
    public class EFDBContext : DbContext
    {
        public DbSet<Users> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
    }
}