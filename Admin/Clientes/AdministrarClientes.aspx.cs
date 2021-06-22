using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

using System.Diagnostics;

namespace BD_Proyecto
{
    public partial class AdministrarClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void cambiarFerreteria_Click(object sender, EventArgs e)
        {
            if (ferreteriasDownList.SelectedItem.Value == "1")
            {
                SqlDataSource1.SelectCommand = "SELECT id, nombre, apellido, tarjeta, usuario, pass FROM FGAM...cliente";
                SqlDataSource2.SelectCommand = "SELECT id, descripcion, localizacion, id_cliente FROM FGAM...direccion";
                SqlDataSource3.SelectCommand = "SELECT id, id_cliente, id_empleado, fecha FROM FGAM...venta";
                SqlDataSource4.SelectCommand = "SELECT id_venta, id_producto, cantidad, backorder FROM FGAM...venta_producto";
            }
            if (ferreteriasDownList.SelectedItem.Value == "2")
            {
                SqlDataSource1.SelectCommand = "SELECT id, nombre, apellido, tarjeta, usuario, pass FROM FNORTE...cliente";
                SqlDataSource2.SelectCommand = "SELECT id, descripcion, localizacion, id_cliente FROM FNORTE...direccion";
                SqlDataSource3.SelectCommand = "SELECT id, id_cliente, id_empleado, fecha FROM FNORTE...venta";
                SqlDataSource4.SelectCommand = "SELECT id_venta, id_producto, cantidad, backorder FROM FNORTE...venta_producto";
            }
            if (ferreteriasDownList.SelectedItem.Value == "3")
            {
                SqlDataSource1.SelectCommand = "SELECT id, nombre, apellido, tarjeta, usuario, pass FROM FSUR...cliente";
                SqlDataSource2.SelectCommand = "SELECT id, descripcion, localizacion, id_cliente FROM FSUR...direccion";
                SqlDataSource3.SelectCommand = "SELECT id, id_cliente, id_empleado, fecha FROM FSUR...venta";
                SqlDataSource4.SelectCommand = "SELECT id_venta, id_producto, cantidad, backorder FROM FSUR...venta_producto";
            }
        }

        protected void BuscarCliente_Click(object sender, EventArgs e)
        {
            if (ferreteriasDownList.SelectedItem.Value == "1")
            {
                SqlDataSource2.SelectCommand = "SELECT id, descripcion, localizacion, id_cliente FROM FGAM...direccion WHERE id_cliente =" + idClienteDrop.SelectedValue.ToString();
                SqlDataSource3.SelectCommand = "SELECT id, id_cliente, id_empleado, fecha FROM FGAM...venta WHERE id_cliente =" + idClienteDrop.SelectedValue.ToString();
                SqlDataSource4.SelectCommand = "SELECT id_venta, id_producto, cantidad, backorder FROM FGAM...venta_producto WHERE id_venta in (SELECT id FROM FGAM...venta WHERE id_cliente = " + idClienteDrop.SelectedValue.ToString() + ")";
            }
            if (ferreteriasDownList.SelectedItem.Value == "2")
            {
                SqlDataSource2.SelectCommand = "SELECT id, descripcion, localizacion, id_cliente FROM FNORTE...direccion WHERE id_cliente =" + idClienteDrop.SelectedValue.ToString();
                SqlDataSource3.SelectCommand = "SELECT id, id_cliente, id_empleado, fecha FROM FNORTE...venta WHERE id_cliente =" + idClienteDrop.SelectedValue.ToString();
                SqlDataSource4.SelectCommand = "SELECT id_venta, id_producto, cantidad, backorder FROM FNORTE...venta_producto WHERE id_venta in (SELECT id FROM FNORTE...venta WHERE id_cliente = " + idClienteDrop.SelectedValue.ToString() + ")";
            }
            if (ferreteriasDownList.SelectedItem.Value == "3")
            {
                SqlDataSource2.SelectCommand = "SELECT id, descripcion, localizacion, id_cliente FROM FSUR...direccion WHERE id_cliente =" + idClienteDrop.SelectedValue.ToString();
                SqlDataSource3.SelectCommand = "SELECT id, id_cliente, id_empleado, fecha FROM FSUR...venta WHERE id_cliente =" + idClienteDrop.SelectedValue.ToString();
                SqlDataSource4.SelectCommand = "SELECT id_venta, id_producto, cantidad, backorder FROM FSUR...venta_producto WHERE id_venta in (SELECT id FROM FSUR...venta WHERE id_cliente = " + idClienteDrop.SelectedValue.ToString() + ")";
            }
        }

        protected void BuscarDetalles_Click(object sender, EventArgs e)
        {
            if (ferreteriasDownList.SelectedItem.Value == "1")
            {
                SqlDataSource4.SelectCommand = "SELECT id_venta, id_producto, cantidad, backorder FROM FGAM...venta_producto WHERE id_venta = " + ventasDrop.SelectedValue.ToString();
            }
            if (ferreteriasDownList.SelectedItem.Value == "2")
            {
                SqlDataSource4.SelectCommand = "SELECT id_venta, id_producto, cantidad, backorder FROM FNORTE...venta_producto WHERE id_venta = " + ventasDrop.SelectedValue.ToString();
            }
            if (ferreteriasDownList.SelectedItem.Value == "3")
            {
                SqlDataSource4.SelectCommand = "SELECT id_venta, id_producto, cantidad, backorder FROM FSUR...venta_producto WHERE id_venta = " + ventasDrop.SelectedValue.ToString();
            }
        }
        
        protected void ClienteInsert_Click(object sender, EventArgs e)
        {
            if (nombreClienteText.Text == "")
            {
                errCliente.Text = "Se necesita especificar el nombre";
                return;
            }
            if (apellidoClienteText.Text == "")
            {
                errCliente.Text = "Se necesita especificar el apellido";
                return;
            }
            if (tarjetaClienteText.Text == "")
            {
                errCliente.Text = "Se necesita asociar una tarjeta";
                return;
            }
            if (usuarioClienteText.Text == "")
            {
                errCliente.Text = "Se necesita asociar un usuario";
                return;
            }
            if (passClienteText.Text == "")
            {
                errCliente.Text = "Se necesita asociar un contraseña";
                return;
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_cliente", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = nombreClienteText.Text.Trim();
                    cmd.Parameters.Add("@Apellido", SqlDbType.VarChar).Value = apellidoClienteText.Text.Trim();
                    cmd.Parameters.Add("@Tarjeta", SqlDbType.VarChar).Value = tarjetaClienteText.Text.Trim();
                    cmd.Parameters.Add("@Usuario", SqlDbType.VarChar).Value = usuarioClienteText.Text.Trim();
                    cmd.Parameters.Add("@Pass", SqlDbType.VarChar).Value = passClienteText.Text.Trim();
                    cmd.Parameters.Add("@Ferreteria", SqlDbType.Int).Value = Int32.Parse(ferreteriasDownList.SelectedValue);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    SqlDataReader data = cmd.ExecuteReader();
                    data.Read();

                    if ((string)data[0] == "El usuario se ha registrado")
                    {
                        nombreClienteText.Text = string.Empty;
                        apellidoClienteText.Text = string.Empty;
                        tarjetaClienteText.Text = string.Empty;
                        usuarioClienteText.Text = string.Empty;
                        passClienteText.Text = string.Empty;
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                    else
                    {
                        errCliente.Text = "El usuario ya ha sido tomado";
                        return;
                    }
                }
            }
        }

        protected void ClienteUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_cliente", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = idClienteDrop.SelectedValue;
                    cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = nombreClienteText.Text.Trim();
                    cmd.Parameters.Add("@Apellido", SqlDbType.VarChar).Value = apellidoClienteText.Text.Trim();
                    cmd.Parameters.Add("@Tarjeta", SqlDbType.VarChar).Value = tarjetaClienteText.Text.Trim();
                    cmd.Parameters.Add("@Usuario", SqlDbType.VarChar).Value = usuarioClienteText.Text.Trim();
                    cmd.Parameters.Add("@Pass", SqlDbType.VarChar).Value = passClienteText.Text.Trim();
                    cmd.Parameters.Add("@Ferreteria", SqlDbType.Int).Value = Int32.Parse(ferreteriasDownList.SelectedValue);
                    if (nombreClienteText.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = null;
                    }
                    if (apellidoClienteText.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Apellido", SqlDbType.VarChar).Value = null;
                    }
                    if (tarjetaClienteText.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Tarjeta", SqlDbType.VarChar).Value = null;
                    }
                    if (usuarioClienteText.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Usuario", SqlDbType.VarChar).Value = null;
                    }
                    if (passClienteText.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Pass", SqlDbType.VarChar).Value = null;
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();
                    SqlDataReader data = cmd.ExecuteReader();
                    data.Read();

                    if ((string)data[0] == "El usuario se ha modificado")
                    {
                        nombreClienteText.Text = string.Empty;
                        apellidoClienteText.Text = string.Empty;
                        tarjetaClienteText.Text = string.Empty;
                        usuarioClienteText.Text = string.Empty;
                        passClienteText.Text = string.Empty;
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                    else
                    {
                        errCliente.Text = "El usuario ya ha sido tomado";
                        return;
                    }
                }
            }
        }

        protected void DireccionInsert_Click(object sender, EventArgs e)
        {
            if (desDireccionText.Text == "")
            {
                errCliente.Text = "Se necesita especificar una descripcion";
                return;
            }
            if (locDireccionText.Text == "")
            {
                errCliente.Text = "Se necesita especificar la localizacion";
                return;
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_create_direccion", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@IDCliente", SqlDbType.Int).Value = idClienteDrop.SelectedValue;
                    cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar).Value = desDireccionText.Text.Trim();
                    cmd.Parameters.Add("@Localizacion", SqlDbType.NVarChar).Value = locDireccionText.Text.Trim();
                    cmd.Parameters.Add("@Ferreteria", SqlDbType.Int).Value = Int32.Parse(ferreteriasDownList.SelectedValue);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    nombreClienteText.Text = string.Empty;
                    apellidoClienteText.Text = string.Empty;
                    tarjetaClienteText.Text = string.Empty;
                    usuarioClienteText.Text = string.Empty;
                    passClienteText.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }

        protected void DireccionUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Proyecto"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_direccion", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = idDireccionDrop.SelectedValue;
                    cmd.Parameters.Add("@IDCliente", SqlDbType.Int).Value = idClienteDrop.SelectedValue;
                    cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar).Value = desDireccionText.Text.Trim();
                    cmd.Parameters.Add("@Localizacion", SqlDbType.NVarChar).Value = locDireccionText.Text.Trim();
                    cmd.Parameters.Add("@Ferreteria", SqlDbType.Int).Value = Int32.Parse(ferreteriasDownList.SelectedValue);

                    if (desDireccionText.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar).Value = null;
                    }
                    if (locDireccionText.Text.Trim() == string.Empty)
                    {
                        cmd.Parameters.Add("@Localizacion", SqlDbType.VarChar).Value = null;
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();

                    nombreClienteText.Text = string.Empty;
                    apellidoClienteText.Text = string.Empty;
                    tarjetaClienteText.Text = string.Empty;
                    usuarioClienteText.Text = string.Empty;
                    passClienteText.Text = string.Empty;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }
    }
}