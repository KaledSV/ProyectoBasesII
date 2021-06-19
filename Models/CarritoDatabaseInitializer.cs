using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.Generic;
using System.Data.Entity;

namespace BD_Proyecto.Models
{
    public class CarritoDatabaseInitializer : DropCreateDatabaseIfModelChanges<CarritoContext>
    {
        protected override void Seed(CarritoContext context)
        {
            GetItemsCarrito().ForEach(c => context.ItemsCarrito.Add(c));
        }

        private static List<ItemCarrito> GetItemsCarrito()
        {
            var itemsC = new List<ItemCarrito> { };

            return itemsC;
        }
    }
}