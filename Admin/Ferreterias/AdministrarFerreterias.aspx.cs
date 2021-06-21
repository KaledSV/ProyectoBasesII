using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;

namespace BD_Proyecto
{
    public partial class AdministrarFerreterias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

            string connString = @"Server =LAPTOP-R470LE7F\NITROSODB; Database = CasaMatriz; Trusted_Connection = True;"; //Conexion a casa matriz
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_create_ferreteria";

                    cmd.Parameters.Add("@Localizacion", SqlDbType.VarBinary);
                    cmd.Parameters.Add("@Foto", SqlDbType.VarBinary);
                    cmd.Parameters.Add("@Telefono", SqlDbType.VarChar);

                    cmd.Parameters["@Localizacion"].Value = locFerreteriaText.Text;
                    cmd.Parameters["@Foto"].Value = imgFerreteriaText.Text;
                    cmd.Parameters["@Telefono"].Value = telFerreteriaText.Text;

                    cmd.Connection = conn;
                    conn.Open();
                }
            }
            catch (Exception ex)
            {
                //display error message
                Console.WriteLine("Exception: " + ex.Message);
                Debug.WriteLine("ded");
            }
        }

        protected void FerreteriaUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void Ferreterias_SelectedIndexChanged(object sender, EventArgs e)
        {

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