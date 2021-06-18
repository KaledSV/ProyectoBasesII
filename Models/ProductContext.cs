using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace BD_Proyecto.Models
{
    public class ProductContext : DbContext
    {
        public ProductContext() : base("BD_Proyecto")
        {
        }

        public DbSet<Producto> Productos { get; set; }
    }
    
}