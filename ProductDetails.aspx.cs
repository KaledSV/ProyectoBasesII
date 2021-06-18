using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BD_Proyecto.Models;
using System.Web.ModelBinding;

namespace BD_Proyecto
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Producto> GetProduct([QueryString("productID")] int? productId)
        {
            var _db = new BD_Proyecto.Models.ProductContext();
            IQueryable<Producto> query = _db.Productos;
            if (productId.HasValue && productId > 0)
            {
                query = query.Where(p => p.ID == productId);
            }
            else
            {
                query = null;
            }
            return query;
        }
    }
}