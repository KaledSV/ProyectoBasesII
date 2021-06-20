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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Producto> GetProducts([QueryString("id")] int? categoryId)
        {
            var _db = new BD_Proyecto.Models.ProductContext();
            IQueryable<Producto> query = _db.Productos;
            return query;
        }

        protected void LoginView1_ViewChanged(object sender, EventArgs e)
        {

        }
    }
}