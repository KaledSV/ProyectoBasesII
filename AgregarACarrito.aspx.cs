using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BD_Proyecto.Logic;
using System.Diagnostics;


namespace BD_Proyecto
{
    public partial class AgregarACarrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string rawId = Request.QueryString["ProductID"];
            int productId;
            if (!String.IsNullOrEmpty(rawId) && int.TryParse(rawId, out productId))
            {
                using (AccionesCarrito usersShoppingCart = new AccionesCarrito())
                {
                    usersShoppingCart.AddToCart(Convert.ToInt16(rawId));
                }

            }
            else
            {
                Debug.Fail("Error, no se tiene un ID de producto");
                throw new Exception("Error, no se tiene un ID de producto");
            }
            Response.Redirect("Carrito.aspx");
        }
    }
}