<%@ Page Title="Ferreteria" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdministrarClientes.aspx.cs" Inherits="BD_Proyecto.AdministrarClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT id, nombre, apellido, tarjeta, usuario, pass FROM FGAM...cliente"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT id, descripcion, localizacion, id_cliente FROM FGAM...direccion"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT id, id_cliente, id_empleado, fecha FROM FGAM...venta "></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT id_venta, id_producto, cantidad, backorder FROM FGAM...venta_producto"></asp:SqlDataSource>
    <section>
        <hr />
    </section>
    <table class="nav-justified" align="center">
        <tr>
            <td>
                <asp:DropDownList ID="ferreteriasDownList" runat="server" ForeColor="Black">
                    <asp:ListItem Value="1">GAM</asp:ListItem>
                    <asp:ListItem Value="2">Norte</asp:ListItem>
                    <asp:ListItem Value="3">Sur</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="cambiarFerreteria" runat="server" Text="Administrar Ferreteria" OnClick="cambiarFerreteria_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="9">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFFFFF;color: #284775;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            </td>
                            <td>
                                <asp:Label ID="apellidoLabel" runat="server" Text='<%# Eval("apellido") %>' />
                            </td>
                            <td>
                                <asp:Label ID="tarjetaLabel" runat="server" Text='<%# Eval("tarjeta") %>' />
                            </td>
                            <td>
                                <asp:Label ID="usuarioLabel" runat="server" Text='<%# Eval("usuario") %>' />
                            </td>
                            <td>
                                <asp:Label ID="passLabel" runat="server" Text='<%# Eval("pass") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: #999999;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </td>
                            <td>
                                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="apellidoTextBox" runat="server" Text='<%# Bind("apellido") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="tarjetaTextBox" runat="server" Text='<%# Bind("tarjeta") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="usuarioTextBox" runat="server" Text='<%# Bind("usuario") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="passTextBox" runat="server" Text='<%# Bind("pass") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </td>
                            <td>
                                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="apellidoTextBox" runat="server" Text='<%# Bind("apellido") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="tarjetaTextBox" runat="server" Text='<%# Bind("tarjeta") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="usuarioTextBox" runat="server" Text='<%# Bind("usuario") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="passTextBox" runat="server" Text='<%# Bind("pass") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #E0FFFF;color: #333333;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            </td>
                            <td>
                                <asp:Label ID="apellidoLabel" runat="server" Text='<%# Eval("apellido") %>' />
                            </td>
                            <td>
                                <asp:Label ID="tarjetaLabel" runat="server" Text='<%# Eval("tarjeta") %>' />
                            </td>
                            <td>
                                <asp:Label ID="usuarioLabel" runat="server" Text='<%# Eval("usuario") %>' />
                            </td>
                            <td>
                                <asp:Label ID="passLabel" runat="server" Text='<%# Eval("pass") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                            <th runat="server">id</th>
                                            <th runat="server">nombre</th>
                                            <th runat="server">apellido</th>
                                            <th runat="server">tarjeta</th>
                                            <th runat="server">usuario</th>
                                            <th runat="server">pass</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            </td>
                            <td>
                                <asp:Label ID="apellidoLabel" runat="server" Text='<%# Eval("apellido") %>' />
                            </td>
                            <td>
                                <asp:Label ID="tarjetaLabel" runat="server" Text='<%# Eval("tarjeta") %>' />
                            </td>
                            <td>
                                <asp:Label ID="usuarioLabel" runat="server" Text='<%# Eval("usuario") %>' />
                            </td>
                            <td>
                                <asp:Label ID="passLabel" runat="server" Text='<%# Eval("pass") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="idClienteLabel" runat="server" Text="ID"></asp:Label>
                <asp:DropDownList ID="idClienteDrop" runat="server" DataSourceID="SqlDataSource1" DataValueField="ID" ForeColor="Black"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="nombreClienteLabel" runat="server" Text="Nombre"></asp:Label>
                <asp:TextBox ID="nombreClienteText" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="apellidoClienteLabel" runat="server" Text="Apellido"></asp:Label>
                <asp:TextBox ID="apellidoClienteText" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="tarjetaClienteLabel" runat="server" Text="Tarjeta Registrada"></asp:Label>
                <asp:TextBox ID="tarjetaClienteText" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="usuarioClienteLabel" runat="server" Text="Usuario"></asp:Label>
                <asp:TextBox ID="usuarioClienteText" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="passClienteLabel" runat="server" Text="password"></asp:Label>
                <asp:TextBox ID="passClienteText" runat="server"></asp:TextBox>
            </td>
            <td> 
                <asp:Button ID="ClienteInsert" runat="server" Text="Insert" OnClick="ClienteInsert_Click"/>
            </td>
            <td> 
                <asp:Button ID="ClienteUpdate" runat="server" Text="Update" OnClick="ClienteUpdate_Click"/>
            </td>
            <td> 
                <asp:Label ID="errCliente" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="9">
                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFFFFF;color: #284775;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                            </td>
                            <td>
                                <asp:Label ID="localizacionLabel" runat="server" Text='<%# Eval("localizacion") %>' />
                            </td>
                            <td>
                                <asp:Label ID="id_clienteLabel" runat="server" Text='<%# Eval("id_cliente") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: #999999;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </td>
                            <td>
                                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="localizacionTextBox" runat="server" Text='<%# Bind("localizacion") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="id_clienteTextBox" runat="server" Text='<%# Bind("id_cliente") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </td>
                            <td>
                                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="localizacionTextBox" runat="server" Text='<%# Bind("localizacion") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="id_clienteTextBox" runat="server" Text='<%# Bind("id_cliente") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #E0FFFF;color: #333333;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                            </td>
                            <td>
                                <asp:Label ID="localizacionLabel" runat="server" Text='<%# Eval("localizacion") %>' />
                            </td>
                            <td>
                                <asp:Label ID="id_clienteLabel" runat="server" Text='<%# Eval("id_cliente") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                            <th runat="server">id</th>
                                            <th runat="server">descripcion</th>
                                            <th runat="server">localizacion</th>
                                            <th runat="server">id_cliente</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                            </td>
                            <td>
                                <asp:Label ID="localizacionLabel" runat="server" Text='<%# Eval("localizacion") %>' />
                            </td>
                            <td>
                                <asp:Label ID="id_clienteLabel" runat="server" Text='<%# Eval("id_cliente") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BuscarCliente" runat="server" Text="Buscar Cliente" OnClick="BuscarCliente_Click"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="idDireccionLabel" runat="server" Text="ID"></asp:Label>
                <asp:DropDownList ID="idDireccionDrop" runat="server" DataSourceID="SqlDataSource2" DataValueField="ID" ForeColor="Black"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="desDireccionLabel" runat="server" Text="Descripcion"></asp:Label>
                <asp:TextBox ID="desDireccionText" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="locDireccionLabel" runat="server" Text="localizacion"></asp:Label>
                <asp:TextBox ID="locDireccionText" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="idClienteDireccionLabel" runat="server" Text="idCliente"></asp:Label>
                <asp:DropDownList ID="idClienteDireccionDrop" runat="server" DataSourceID="SqlDataSource1" DataValueField="ID" ForeColor="Black"></asp:DropDownList>
            </td>
            <td> 
                <asp:Button ID="DireccionInsert" runat="server" Text="Insert" OnClick="DireccionInsert_Click"/>
            </td>
            <td> 
                <asp:Button ID="DireccionUpdate" runat="server" Text="Update" OnClick="DireccionUpdate_Click"/>
            </td>
            <td> 
                <asp:Label ID="errDireccion" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFFFFF;color: #284775;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="id_clienteLabel" runat="server" Text='<%# Eval("id_cliente") %>' />
                            </td>
                            <td>
                                <asp:Label ID="id_empleadoLabel" runat="server" Text='<%# Eval("id_empleado") %>' />
                            </td>
                            <td>
                                <asp:Label ID="fechaLabel" runat="server" Text='<%# Eval("fecha") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: #999999;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </td>
                            <td>
                                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="id_clienteTextBox" runat="server" Text='<%# Bind("id_cliente") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="id_empleadoTextBox" runat="server" Text='<%# Bind("id_empleado") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="fechaTextBox" runat="server" Text='<%# Bind("fecha") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </td>
                            <td>
                                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="id_clienteTextBox" runat="server" Text='<%# Bind("id_cliente") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="id_empleadoTextBox" runat="server" Text='<%# Bind("id_empleado") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="fechaTextBox" runat="server" Text='<%# Bind("fecha") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #E0FFFF;color: #333333;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="id_clienteLabel" runat="server" Text='<%# Eval("id_cliente") %>' />
                            </td>
                            <td>
                                <asp:Label ID="id_empleadoLabel" runat="server" Text='<%# Eval("id_empleado") %>' />
                            </td>
                            <td>
                                <asp:Label ID="fechaLabel" runat="server" Text='<%# Eval("fecha") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                            <th runat="server">id</th>
                                            <th runat="server">id_cliente</th>
                                            <th runat="server">id_empleado</th>
                                            <th runat="server">fecha</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="id_clienteLabel" runat="server" Text='<%# Eval("id_cliente") %>' />
                            </td>
                            <td>
                                <asp:Label ID="id_empleadoLabel" runat="server" Text='<%# Eval("id_empleado") %>' />
                            </td>
                            <td>
                                <asp:Label ID="fechaLabel" runat="server" Text='<%# Eval("fecha") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
            </td>
            <td>
                <asp:Label ID="ventasLabel" runat="server" Text="idCliente"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ventasDrop" runat="server" DataSourceID="SqlDataSource3" DataValueField="ID" ForeColor="Black"></asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="BuscarDetalles" runat="server" Text="Buscar Cliente" OnClick="BuscarDetalles_Click"/>
            </td>
            <td colspan="3">
                <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource4">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFFFFF;color: #284775;">
                            <td>
                                <asp:Label ID="id_ventaLabel" runat="server" Text='<%# Eval("id_venta") %>' />
                            </td>
                            <td>
                                <asp:Label ID="id_productoLabel" runat="server" Text='<%# Eval("id_producto") %>' />
                            </td>
                            <td>
                                <asp:Label ID="cantidadLabel" runat="server" Text='<%# Eval("cantidad") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="backorderCheckBox" runat="server" Checked='<%# Eval("backorder") %>' Enabled="false" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: #999999;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </td>
                            <td>
                                <asp:TextBox ID="id_ventaTextBox" runat="server" Text='<%# Bind("id_venta") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="id_productoTextBox" runat="server" Text='<%# Bind("id_producto") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="cantidadTextBox" runat="server" Text='<%# Bind("cantidad") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="backorderCheckBox" runat="server" Checked='<%# Bind("backorder") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </td>
                            <td>
                                <asp:TextBox ID="id_ventaTextBox" runat="server" Text='<%# Bind("id_venta") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="id_productoTextBox" runat="server" Text='<%# Bind("id_producto") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="cantidadTextBox" runat="server" Text='<%# Bind("cantidad") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="backorderCheckBox" runat="server" Checked='<%# Bind("backorder") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #E0FFFF;color: #333333;">
                            <td>
                                <asp:Label ID="id_ventaLabel" runat="server" Text='<%# Eval("id_venta") %>' />
                            </td>
                            <td>
                                <asp:Label ID="id_productoLabel" runat="server" Text='<%# Eval("id_producto") %>' />
                            </td>
                            <td>
                                <asp:Label ID="cantidadLabel" runat="server" Text='<%# Eval("cantidad") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="backorderCheckBox" runat="server" Checked='<%# Eval("backorder") %>' Enabled="false" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                            <th runat="server">id_venta</th>
                                            <th runat="server">id_producto</th>
                                            <th runat="server">cantidad</th>
                                            <th runat="server">backorder</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                            <td>
                                <asp:Label ID="id_ventaLabel" runat="server" Text='<%# Eval("id_venta") %>' />
                            </td>
                            <td>
                                <asp:Label ID="id_productoLabel" runat="server" Text='<%# Eval("id_producto") %>' />
                            </td>
                            <td>
                                <asp:Label ID="cantidadLabel" runat="server" Text='<%# Eval("cantidad") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="backorderCheckBox" runat="server" Checked='<%# Eval("backorder") %>' Enabled="false" />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
            </td>
        </tr>
    </table>
</asp:Content>
