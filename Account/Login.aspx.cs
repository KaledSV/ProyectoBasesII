using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Diagnostics;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using BD_Proyecto.Logic;
using BD_Proyecto.Models;
using Microsoft.Owin.Security;

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
            string connString = @"Server =LAPTOP-R470LE7F\NITROSODB; Database = CasaMatriz; Trusted_Connection = True;";
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
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
                        conn.Close();
                        Debug.WriteLine("Ingresando...");
                        Session["username"] = username;
                        Session["id"] = 1;
                        Session["ferreteria"] = 1;
                        Session["admin"] = 0;

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