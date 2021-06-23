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
    public partial class AdministrarAmonestaciones : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_amonestacion", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (TextBox1.Text.Trim() == string.Empty || TextBox2.Text.Trim() == string.Empty)
                    {
                        Page.Response.Write("Campos vacios");
                    }
                    else
                    {
                        cmd.Parameters.Add("@IDEmpleado", SqlDbType.Int).Value = DropDownList2.SelectedValue;
                        cmd.Parameters.Add("@Fecha", SqlDbType.Date).Value = TextBox1.Text.Trim();
                        cmd.Parameters.Add("@Monto", SqlDbType.Money).Value = TextBox2.Text.Trim();



                        con.Open();
                        cmd.ExecuteNonQuery();

                        TextBox1.Text = string.Empty;
                        TextBox2.Text = string.Empty;
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_amonestacion", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = DropDownList1.SelectedValue;
                    cmd.Parameters.Add("@IDEmpleado", SqlDbType.Int).Value = DropDownList2.SelectedValue;
                    if (TextBox1.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@Fecha", SqlDbType.Date).Value = TextBox1.Text.Trim();
                    }
                    if(TextBox2.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@Monto", SqlDbType.Money).Value = TextBox2.Text.Trim();
                    }
                    con.Open();
                    cmd.ExecuteNonQuery();

                    TextBox1.Text = string.Empty;
                    TextBox2.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }
    }
}