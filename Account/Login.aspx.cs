using System;
using System.Web.Security;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace BD_Proyecto
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                Err.Text = "hola" + User.Identity.Name;
            }
        }

        protected void buttomLogin(object sender, EventArgs e){
            string username = user.Text;
            string password = pass.Text;
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "buscarUsuario";

                    cmd.Parameters.Add("@User", SqlDbType.VarChar);
                    cmd.Parameters.Add("@Pass", SqlDbType.VarChar);

                    cmd.Parameters["@User"].Value = username;
                    cmd.Parameters["@Pass"].Value = password;

                    cmd.Connection = conn;
                    conn.Open();
                    SqlDataReader data = cmd.ExecuteReader();
                    data.Read();
                    if ((string)data[0] == "Correcto")
                    {
                        Debug.WriteLine("Ingresando...");
                        Session["username"] = username;
                        Session["id"] = data[1];
                        Session["ferreteria"] = data[2];
                        Session["admin"] = data[3];
                        Response.Write(Session["admin"]);
                        conn.Close();
                        FormsAuthentication.SetAuthCookie(username, true);
                        Response.Redirect("/Default.aspx");
                        return;
                    }
                    else
                    {
                        if ((string)data[0] == "password incorrecta")
                        {
                            conn.Close();
                            Debug.WriteLine("Contraseña incorrecta");
                            Err.Text = "Contraseña incorrecta";
                            return;
                        }
                        else
                        {
                            conn.Close();
                            Debug.WriteLine("No se encontro ningun usuario con esas credenciales");
                            Err.Text = "Usuario no encontrado";
                            return;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //display error message
                Console.WriteLine("Exception: " + ex.Message);
            }
            Debug.WriteLine("ded");
            return;
        }
    }
}