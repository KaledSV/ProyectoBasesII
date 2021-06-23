using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace BD_Proyecto
{
    public partial class AdministrarProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                if (Session["admin"].Equals(0))
                {
                    Page.Response.Redirect("~/Default.aspx", true);
                }
            }
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_producto", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if(TextBox2.Text.Trim() == string.Empty || TextBox3.Text.Trim() == string.Empty || TextBox4.Text.Trim() == string.Empty || TextBox5.Text.Trim() == string.Empty || TextBox1.Text.Trim() == string.Empty)
                    {
                        Page.Response.Write("Campos vacios");
                    }
                    else {
                        cmd.Parameters.Add("@IDMarca", SqlDbType.Int).Value = DropDownList2.SelectedValue;
                        cmd.Parameters.Add("@IDProvedor", SqlDbType.Int).Value = DropDownList3.SelectedValue;
                        cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = TextBox2.Text;
                        cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar).Value = TextBox5.Text;
                        cmd.Parameters.Add("@Fotografias", SqlDbType.NVarChar).Value = TextBox3.Text;
                        cmd.Parameters.Add("@Codigo", SqlDbType.Int).Value = TextBox4.Text;
                        cmd.Parameters.Add("@Precio", SqlDbType.Money).Value = TextBox1.Text;

                        con.Open();
                        cmd.ExecuteNonQuery();

                        TextBox1.Text = string.Empty;
                        TextBox2.Text = string.Empty;
                        TextBox3.Text = string.Empty;
                        TextBox4.Text = string.Empty;
                        TextBox5.Text = string.Empty;
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_producto", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = DropDownList1.Text;
                    cmd.Parameters.Add("@IDMarca", SqlDbType.Int).Value = DropDownList2.SelectedValue;
                    cmd.Parameters.Add("@IDProvedor", SqlDbType.Int).Value = DropDownList3.SelectedValue;
                    cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = TextBox2.Text;
                    cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar).Value = TextBox5.Text;
                    cmd.Parameters.Add("@Fotografias", SqlDbType.NVarChar).Value = TextBox3.Text;
                    if(TextBox4.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Codigo", SqlDbType.Int).Value = -1;
                    }
                    else
                    {
                        cmd.Parameters.Add("@Codigo", SqlDbType.Int).Value = TextBox4.Text;
                    }
                    if (TextBox5.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Precio", SqlDbType.Money).Value = -1;
                    }
                    else
                    {
                        cmd.Parameters.Add("@Precio", SqlDbType.Money).Value = TextBox1.Text;
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();

                    TextBox1.Text = string.Empty;
                    TextBox2.Text = string.Empty;
                    TextBox3.Text = string.Empty;
                    TextBox4.Text = string.Empty;
                    TextBox5.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }
    }
}