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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttomLogin(object sender, EventArgs e){
            string username = Request.Form["username"];
            string password = Request.Form["password"];
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
                        //return RedirectToAction("Index", new { message = "Ingresando..." });
                        return;
                    }
                    else
                    {
                        if ((string)data[0] == "password incorrecta")
                        {
                            conn.Close();
                            Debug.WriteLine("Contraseña incorrecta");
                            //return RedirectToAction("Index", new { message = "Contraseña incorrecta" });
                            return;
                        }
                        else
                        {
                            conn.Close();
                            Debug.WriteLine("No se encontro ningun usuario con esas credenciales");
                            //return RedirectToAction("Index", new { message = "No se encontro ningun usuario con esas credenciales" });
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
            //return RedirectToAction("Index");
        }
    }
}