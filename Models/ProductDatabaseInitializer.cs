using System.Collections.Generic;
using System.Data.Entity;

namespace BD_Proyecto.Models
{
    public class ProductDatabaseInitializer : CreateDatabaseIfNotExists<ProductContext>
    {
        protected override void Seed(ProductContext context)
        {
            GetProducts().ForEach(p => context.Productos.Add(p));
        }

        private static List<Producto> GetProducts()
        {
            var products = new List<Producto> {
            };

            return products;
        }
    }
}