using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace BD_Proyecto
{
    public partial class AdministrarFerreterias : System.Web.UI.Page
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

        protected void FerreteriaInsert_Click(object sender, EventArgs e)
        {
            if (locFerreteriaText.Text == "")
            {
                errFerreteria.Text = "la localizacion es necesario";
                return;
            }
            if (imgFerreteriaText.Text == "")
            {
                errFerreteria.Text = "la imagen es necesaria";
                return;
            }
            if (telFerreteriaText.Text == "")
            {
                errFerreteria.Text = "el telefono es necesario";
                return;
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_ferreteria", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Localizacion", SqlDbType.NVarChar).Value = locFerreteriaText.Text.Trim();
                    cmd.Parameters.Add("@Foto", SqlDbType.NVarChar).Value = imgFerreteriaText.Text.Trim();
                    cmd.Parameters.Add("@Precio", SqlDbType.VarChar).Value = telFerreteriaText.Text.Trim();

                    con.Open();
                    cmd.ExecuteNonQuery();

                    locFerreteriaText.Text = string.Empty;
                    imgFerreteriaText.Text = string.Empty;
                    telFerreteriaText.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }

        protected void FerreteriaUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_producto", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = idFerreteriaDrop.SelectedValue;
                    cmd.Parameters.Add("@Localizacion", SqlDbType.NVarChar).Value = locFerreteriaText.Text.Trim();
                    cmd.Parameters.Add("@Foto", SqlDbType.NVarChar).Value = imgFerreteriaText.Text.Trim();
                    cmd.Parameters.Add("@Telefono", SqlDbType.VarChar).Value = telFerreteriaText.Text.Trim();
                    if (locFerreteriaText.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Localizacion", SqlDbType.Int).Value = null;
                    }
                    if (imgFerreteriaText.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Foto", SqlDbType.Money).Value = null;
                    }
                    if (telFerreteriaText.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Telefono", SqlDbType.Money).Value = null;
                    }
                    con.Open();
                    cmd.ExecuteNonQuery();

                    locFerreteriaText.Text = string.Empty;
                    imgFerreteriaText.Text = string.Empty;
                    telFerreteriaText.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }

        protected void adminFerreteria_Click(object sender, EventArgs e)
        {
            if (ferreteriasDownList.SelectedItem.Value == "1")
            {
                Response.Redirect("FerreteriaGAM.aspx");
                return;
            }
            if (ferreteriasDownList.SelectedItem.Value == "2")
            {
                Response.Redirect("FerreteriaNorte.aspx");
                return;
            }
            if (ferreteriasDownList.SelectedItem.Value == "3")
            {
                Response.Redirect("FerreteriaSur.aspx");
                return;
            }
        }
    }
}