using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BD_Proyecto.Models;
using BD_Proyecto.Logic;
using System.Collections.Specialized;
using System.Collections;
using System.Web.ModelBinding;

namespace BD_Proyecto
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (AccionesCarrito usersShoppingCart = new AccionesCarrito())
            {
                decimal cartTotal = 0;
                cartTotal = usersShoppingCart.GetTotal();
                if (cartTotal > 0)
                {
                    // Display Total.
                    lblTotal.Text = String.Format("{0:c}", cartTotal);
                }
                else
                {
                    LabelTotalText.Text = "";
                    lblTotal.Text = "";
                    ShoppingCartTitle.InnerText = "";
                    UpdateBtn.Visible = false;
                }
            }
        }

        public List<ItemCarrito> GetShoppingCartItems()
        {
            AccionesCarrito acciones = new AccionesCarrito();
            return acciones.GetCartItems();
        }

        public Producto GetProducto(int id)
        {
            AccionesCarrito acciones = new AccionesCarrito();
            return acciones.GetProducto(id);
        }

        public List<ItemCarrito> UpdateCartItems()
        {
            using (AccionesCarrito usersShoppingCart = new AccionesCarrito())
            {
                String cartId = usersShoppingCart.GetCartId();

                AccionesCarrito.ShoppingCartUpdates[] cartUpdates = new AccionesCarrito.ShoppingCartUpdates[CartList.Rows.Count];
                for (int i = 0; i < CartList.Rows.Count; i++)
                {
                    IOrderedDictionary rowValues = new OrderedDictionary();
                    rowValues = GetValues(CartList.Rows[i]);
                    cartUpdates[i].ProductId = Convert.ToInt32(rowValues["IDProducto"]);

                    CheckBox cbRemove = new CheckBox();
                    cbRemove = (CheckBox)CartList.Rows[i].FindControl("Remove");
                    cartUpdates[i].RemoveItem = cbRemove.Checked;

                    TextBox quantityTextBox = new TextBox();
                    quantityTextBox = (TextBox)CartList.Rows[i].FindControl("PurchaseQuantity");
                    cartUpdates[i].PurchaseQuantity = Convert.ToInt16(quantityTextBox.Text.ToString());
                }
                usersShoppingCart.UpdateShoppingCartDatabase(cartId, cartUpdates);
                CartList.DataBind();
                lblTotal.Text = String.Format("{0:c}", usersShoppingCart.GetTotal());
                return usersShoppingCart.GetCartItems();
            }
        }

        public static IOrderedDictionary GetValues(GridViewRow row)
        {
            IOrderedDictionary values = new OrderedDictionary();
            foreach (DataControlFieldCell cell in row.Cells)
            {
                if (cell.Visible)
                {
                    // Extract values from the cell.
                    cell.ContainingField.ExtractValuesFromCell(values, cell, row.RowState, true);
                }
            }
            return values;
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            UpdateCartItems();
        }

        protected void CompraButton_Click(object sender, EventArgs e)
        {
            if (Session["admin"] != null) { 
                AccionesCarrito acciones = new AccionesCarrito();
                int test = acciones.comprar(Int32.Parse(Session["admin"].ToString()), Int32.Parse(Session["ferreteria"].ToString()), Int32.Parse(Session["id"].ToString()));
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }
    }
}