using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Text;

namespace BD_Proyecto
{
    public partial class AdministrarEmpleados : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("sp_create_empleado", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (TextBox1.Text.Trim() == string.Empty || TextBox2.Text.Trim() == string.Empty || TextBox3.Text.Trim() == string.Empty || TextBox4.Text.Trim() == string.Empty || TextBox5.Text.Trim() == string.Empty)
                    {
                        Page.Response.Write("Campos vacios");
                    }
                    else
                    {
                        cmd.Parameters.Add("@IDFerreteria", SqlDbType.Int).Value = DropDownList2.Text;
                        cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = TextBox1.Text.Trim();
                        cmd.Parameters.Add("@Apellido", SqlDbType.VarChar).Value = TextBox2.Text.Trim();
                        cmd.Parameters.Add("@Foto", SqlDbType.Image).Value = Encoding.ASCII.GetBytes(TextBox3.Text.Trim());
                        cmd.Parameters.Add("@FechaIngreso", SqlDbType.Date).Value = TextBox4.Text.Trim();
                        cmd.Parameters.Add("@Activo", SqlDbType.Bit).Value = CheckBox1.Checked;
                        cmd.Parameters.Add("@NumVacaciones", SqlDbType.Int).Value = TextBox5.Text.Trim();
                        cmd.Parameters.Add("@IDTipoEmpleado", SqlDbType.Int).Value = DropDownList3.SelectedValue;



                        con.Open();
                        cmd.ExecuteNonQuery();

                        
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_empleado", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = DropDownList1.Text;
                    cmd.Parameters.Add("@IDFerreteria", SqlDbType.Int).Value = DropDownList2.Text;
                    if(TextBox1.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = TextBox1.Text.Trim();
                    }
                    if (TextBox2.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@Apellido", SqlDbType.VarChar).Value = TextBox2.Text.Trim();
                    }
                    if (TextBox3.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@Foto", SqlDbType.Image).Value = Encoding.ASCII.GetBytes(TextBox3.Text.Trim());
                    }
                    if (TextBox4.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@FechaIngreso", SqlDbType.Date).Value = TextBox4.Text.Trim();
                    }
                    cmd.Parameters.Add("@Activo", SqlDbType.Bit).Value = CheckBox1.Checked;
                    
                    if (TextBox5.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@NumVacaciones", SqlDbType.Int).Value = TextBox5.Text.Trim();
                    }

                    cmd.Parameters.Add("@IDTipoEmpleado", SqlDbType.Int).Value = DropDownList3.SelectedValue;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_tipoempleado", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (TextBox6.Text.Trim() == string.Empty || TextBox7.Text.Trim() == string.Empty)
                    {
                        Page.Response.Write("Campos vacios");
                    }
                    else
                    {
                        cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = TextBox6.Text.Trim();
                        cmd.Parameters.Add("@descripcion", SqlDbType.VarChar).Value = TextBox7.Text.Trim();
                        con.Open();
                        cmd.ExecuteNonQuery();


                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_tipoempleado", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = DropDownList4.SelectedValue;
                    if (TextBox6.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = TextBox6.Text.Trim();
                    }
                    if (TextBox7.Text.Trim() != string.Empty)
                    {
                        cmd.Parameters.Add("@descripcion", SqlDbType.VarChar).Value = TextBox7.Text.Trim();
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();

                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }
    }
}