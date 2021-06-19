using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace BD_Proyecto.Models
{
    public class CarritoContext : DbContext
    {
        public CarritoContext()
            : base("CarritoDeCompras")
        {
            
        }

        public DbSet<ItemCarrito> ItemsCarrito { get; set; }
    }
}