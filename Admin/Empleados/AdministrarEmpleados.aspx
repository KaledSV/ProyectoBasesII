<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdministrarEmpleados.aspx.cs" Inherits="BD_Proyecto.AdministrarEmpleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT * FROM [Empleado]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT [ID] FROM [Ferreteria]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT * FROM [TipoEmpleado]"></asp:SqlDataSource>
    <section>
        <hr />
    </section>
    <section>
        <div>
            
          <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IDFerreteriaLabel" runat="server" Text='<%# Eval("IDFerreteria") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ApellidoLabel" runat="server" Text='<%# Eval("Apellido") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FotoLabel" runat="server" Text='<%# Eval("Foto") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FechaIngresoLabel" runat="server" Text='<%# Eval("FechaIngreso") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="ActivoCheckBox" runat="server" Checked='<%# Eval("Activo") %>' Enabled="false" />
                    </td>
                    <td>
                        <asp:Label ID="NumVacacionesLabel" runat="server" Text='<%# Eval("NumVacaciones") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IDTipoEmpleadoLabel" runat="server" Text='<%# Eval("IDTipoEmpleado") %>' />
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
                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IDFerreteriaTextBox" runat="server" Text='<%# Bind("IDFerreteria") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ApellidoTextBox" runat="server" Text='<%# Bind("Apellido") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FotoTextBox" runat="server" Text='<%# Bind("Foto") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FechaIngresoTextBox" runat="server" Text='<%# Bind("FechaIngreso") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="ActivoCheckBox" runat="server" Checked='<%# Bind("Activo") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NumVacacionesTextBox" runat="server" Text='<%# Bind("NumVacaciones") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IDTipoEmpleadoTextBox" runat="server" Text='<%# Bind("IDTipoEmpleado") %>' />
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
                        &nbsp;</td>
                    <td>
                        <asp:TextBox ID="IDFerreteriaTextBox" runat="server" Text='<%# Bind("IDFerreteria") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ApellidoTextBox" runat="server" Text='<%# Bind("Apellido") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FotoTextBox" runat="server" Text='<%# Bind("Foto") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FechaIngresoTextBox" runat="server" Text='<%# Bind("FechaIngreso") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="ActivoCheckBox" runat="server" Checked='<%# Bind("Activo") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NumVacacionesTextBox" runat="server" Text='<%# Bind("NumVacaciones") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IDTipoEmpleadoTextBox" runat="server" Text='<%# Bind("IDTipoEmpleado") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IDFerreteriaLabel" runat="server" Text='<%# Eval("IDFerreteria") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ApellidoLabel" runat="server" Text='<%# Eval("Apellido") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FotoLabel" runat="server" Text='<%# Eval("Foto") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FechaIngresoLabel" runat="server" Text='<%# Eval("FechaIngreso") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="ActivoCheckBox" runat="server" Checked='<%# Eval("Activo") %>' Enabled="false" />
                    </td>
                    <td>
                        <asp:Label ID="NumVacacionesLabel" runat="server" Text='<%# Eval("NumVacaciones") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IDTipoEmpleadoLabel" runat="server" Text='<%# Eval("IDTipoEmpleado") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    <th runat="server">ID</th>
                                    <th runat="server">IDFerreteria</th>
                                    <th runat="server">Nombre</th>
                                    <th runat="server">Apellido</th>
                                    <th runat="server">Foto</th>
                                    <th runat="server">FechaIngreso</th>
                                    <th runat="server">Activo</th>
                                    <th runat="server">NumVacaciones</th>
                                    <th runat="server">IDTipoEmpleado</th>
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
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IDFerreteriaLabel" runat="server" Text='<%# Eval("IDFerreteria") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ApellidoLabel" runat="server" Text='<%# Eval("Apellido") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FotoLabel" runat="server" Text='<%# Eval("Foto") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FechaIngresoLabel" runat="server" Text='<%# Eval("FechaIngreso") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="ActivoCheckBox" runat="server" Checked='<%# Eval("Activo") %>' Enabled="false" />
                    </td>
                    <td>
                        <asp:Label ID="NumVacacionesLabel" runat="server" Text='<%# Eval("NumVacaciones") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IDTipoEmpleadoLabel" runat="server" Text='<%# Eval("IDTipoEmpleado") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>        
        </div>
    </section>
    
            <div>
    
                <hr />
    
            <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataValueField="ID" ForeColor="Black"></asp:DropDownList>
            <asp:Label ID="Label2" runat="server" Text="IDFerreteria"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="ID" DataValueField="ID" ForeColor="Black">
            </asp:DropDownList>
            <asp:Label ID="Label3" runat="server" Text="Nombre"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Label ID="Label8" runat="server" Text="Apellido"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>
            <div>
            <asp:Label ID="Label4" runat="server" Text="Foto"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Label ID="Label5" runat="server" Text="FechaIngreso"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:Label ID="Label7" runat="server" Text="Activo"></asp:Label>
                <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" />
                
                <div>
                    <asp:Label ID="Label9" runat="server" Text="NumVacaciones"></asp:Label>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    <asp:Label ID="Label10" runat="server" Text="TipoEmpleado"></asp:Label>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="nombre" DataValueField="ID" ForeColor="Black">
                    </asp:DropDownList>
                </div>
                
                <div>
                    <asp:Button ID="Button1" runat="server" Text="Insert" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" />
                    <hr />
                    <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource3">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
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
                                    <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
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
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server">ID</th>
                                                <th runat="server">nombre</th>
                                                <th runat="server">descripcion</th>
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
                                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:Label ID="Label11" runat="server" Text="ID"></asp:Label>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataValueField="ID" ForeColor="Black">
                    </asp:DropDownList>
                    <asp:Label ID="Label12" runat="server" Text="Nombre"></asp:Label>
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    <asp:Label ID="Label13" runat="server" Text="Descripcion"></asp:Label>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Insert" />
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Update" />
                </div>
    </div>
                
</asp:Content>
