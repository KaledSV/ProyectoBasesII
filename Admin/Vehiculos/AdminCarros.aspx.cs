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
    public partial class AdminCarros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].Equals(0))
            {
                Page.Response.Redirect("~/Default.aspx", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_vehiculo", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (TextBox1.Text.Trim() == string.Empty)
                    {
                        Page.Response.Write("Campos vacios");
                    }
                    else
                    {
                        cmd.Parameters.Add("@Placa", SqlDbType.VarChar).Value = TextBox1.Text.Trim();
                        cmd.Parameters.Add("@IDModelo", SqlDbType.Int).Value = DropDownList2.SelectedValue;


                        con.Open();
                        cmd.ExecuteNonQuery();

                        TextBox1.Text = string.Empty;
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_vehiculo", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    if(TextBox1.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@Placa", SqlDbType.VarChar).Value = TextBox1.Text.Trim();
                    }
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = DropDownList1.SelectedValue;
                    cmd.Parameters.Add("@IDModelo", SqlDbType.Int).Value = DropDownList2.SelectedValue;
                    
                    con.Open();
                    cmd.ExecuteNonQuery();

                    TextBox1.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_modelo", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (TextBox2.Text.Trim() == string.Empty || TextBox3.Text.Trim() == string.Empty || TextBox4.Text.Trim() == string.Empty)
                    {
                        Page.Response.Write("Campos vacios");
                    }
                    else
                    {
                        cmd.Parameters.Add("@Anio", SqlDbType.Date).Value = TextBox2.Text.Trim();
                        cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar).Value = TextBox3.Text.Trim();
                        cmd.Parameters.Add("@LitrosXKilometro", SqlDbType.Money).Value = TextBox4.Text.Trim();
                        cmd.Parameters.Add("@IDMarcaVehiculo", SqlDbType.Int).Value = DropDownList4.SelectedValue;


                        con.Open();
                        cmd.ExecuteNonQuery();

                        TextBox2.Text = string.Empty;
                        TextBox3.Text = string.Empty;
                        TextBox4.Text = string.Empty;
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_modelo", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (TextBox2.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@Anio", SqlDbType.Date).Value = TextBox2.Text.Trim();
                    }
                    if (TextBox3.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar).Value = TextBox3.Text.Trim();
                    }
                    if (TextBox4.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@LitrosXKilometro", SqlDbType.Money).Value = TextBox4.Text.Trim();
                    }
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = DropDownList3.SelectedValue;
                    cmd.Parameters.Add("@IDMarcaVehiculo", SqlDbType.Int).Value = DropDownList4.SelectedValue;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    TextBox2.Text = string.Empty;
                    TextBox3.Text = string.Empty;
                    TextBox4.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_marcaVehiculo", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (TextBox5.Text.Trim() == string.Empty)
                    {
                        Page.Response.Write("Campos vacios");
                    }
                    else
                    {
                        
                        cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = TextBox5.Text.Trim();
                        


                        con.Open();
                        cmd.ExecuteNonQuery();

                        TextBox5.Text = string.Empty;
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                }
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_modelo", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (TextBox5.Text.Trim() == string.Empty)
                    {
                        Page.Response.Write("Campos vacios");
                    }
                    else
                    {
                        cmd.Parameters.Add("@ID", SqlDbType.Int).Value = DropDownList5.SelectedValue;
                        cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = TextBox5.Text.Trim();

                        con.Open();
                        cmd.ExecuteNonQuery();

                        TextBox5.Text = string.Empty;
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                }
            }
        }
    }
}