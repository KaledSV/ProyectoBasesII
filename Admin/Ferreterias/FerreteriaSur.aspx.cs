using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BD_Proyecto
{
    public partial class FerreteriaSur : System.Web.UI.Page
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

        protected void InventarioInsert_Click(object sender, EventArgs e)
        {
            if (cantiadInventarioText.Text == "")
            {
                errInventario.Text = "Se necesita especificar la cantidad actual";
                return;
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_inventario", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@IdProducto", SqlDbType.Int).Value = idProductoInventarioDrop.SelectedValue;
                    cmd.Parameters.Add("@IdEstante", SqlDbType.Int).Value = idEstanteInventarioDrop.SelectedValue;
                    cmd.Parameters.Add("@Cantidad", SqlDbType.Int).Value = cantiadInventarioText.Text.Trim();
                    cmd.Parameters.Add("@Ferreteria", SqlDbType.Int).Value = 3;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    cantiadInventarioText.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }

        protected void InventarioUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_inventario", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = idInventarioDrop.SelectedValue;
                    cmd.Parameters.Add("@IdProducto", SqlDbType.Int).Value = idProductoInventarioDrop.SelectedValue;
                    cmd.Parameters.Add("@IdEstante", SqlDbType.Int).Value = idEstanteInventarioDrop.SelectedValue;
                    cmd.Parameters.Add("@Cantidad", SqlDbType.Int).Value = cantiadInventarioText.Text.Trim();
                    cmd.Parameters.Add("@Ferreteria", SqlDbType.Int).Value = 3;
                    if (cantiadInventarioText.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Cantidad", SqlDbType.Int).Value = 1;
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();

                    cantiadInventarioText.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }

        protected void DepartamentoInsert_Click(object sender, EventArgs e)
        {
            if (nombreDepartamentoText.Text == "")
            {
                ErrDepartamento.Text = "el nombre es necesario";
                return;
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_departamento", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@IdFerreteria", SqlDbType.Int).Value = idFerreteriaDepartamentoText.Text.Trim();
                    cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = nombreDepartamentoText.Text.Trim();
                    cmd.Parameters.Add("@Ferreteria", SqlDbType.Int).Value = 3;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    nombreDepartamentoText.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }

        }

        protected void DepartamentoUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_departamento", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = idDepartamentoDrop.SelectedValue;
                    cmd.Parameters.Add("@IdFerreteria", SqlDbType.NVarChar).Value = idFerreteriaDepartamentoText.Text.Trim();
                    cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = nombreDepartamentoText.Text.Trim();
                    cmd.Parameters.Add("@Ferreteria", SqlDbType.Int).Value = 3;
                    if (nombreDepartamentoText.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Nombre", SqlDbType.Int).Value = null;
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();

                    cantiadInventarioText.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }

        protected void PasilloInsert_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_pasillo", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@IdDepartamento", SqlDbType.Int).Value = idDepartamentoPasilloDrop.SelectedValue;
                    cmd.Parameters.Add("@Ferreteria", SqlDbType.Int).Value = 3;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    cantiadInventarioText.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }

        protected void PasilloUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_pasillo", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = idPasilloDrop.SelectedValue;
                    cmd.Parameters.Add("@IdDepartamento", SqlDbType.Int).Value = idDepartamentoPasilloDrop.SelectedValue;
                    cmd.Parameters.Add("@Ferreteria", SqlDbType.Int).Value = 3;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }

        protected void EstanteInsert_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_estante", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@IdPasillo", SqlDbType.Int).Value = idPasilloEstanteDrop.SelectedValue;
                    cmd.Parameters.Add("@Ferreteria", SqlDbType.Int).Value = 3;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    cantiadInventarioText.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }

        protected void EstanteUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_estante", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = idEstanteDrop.SelectedValue;
                    cmd.Parameters.Add("@IdPasillo", SqlDbType.Int).Value = idPasilloEstanteDrop.SelectedValue;
                    cmd.Parameters.Add("@Ferreteria", SqlDbType.Int).Value = 3;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }
    }
}