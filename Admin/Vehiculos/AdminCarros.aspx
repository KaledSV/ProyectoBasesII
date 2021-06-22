<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminCarros.aspx.cs" Inherits="BD_Proyecto.AdminCarros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT * FROM [Vehiculo]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT * FROM [Modelo]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT * FROM [MarcaVehiculo]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT * FROM [EmpleadoXVehiculo]"></asp:SqlDataSource>
<hr />
<div>
    <asp:Label ID="Label1" runat="server" Text="Vehiculos"></asp:Label>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF; color: #284775;">
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Label ID="PlacaLabel" runat="server" Text='<%# Eval("Placa") %>' />
                </td>
                <td>
                    <asp:Label ID="IDModeloLabel" runat="server" Text='<%# Eval("IDModelo") %>' />
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
                    <asp:TextBox ID="PlacaTextBox" runat="server" Text='<%# Bind("Placa") %>' />
                </td>
                <td>
                    <asp:TextBox ID="IDModeloTextBox" runat="server" Text='<%# Bind("IDModelo") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
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
                    <asp:TextBox ID="PlacaTextBox" runat="server" Text='<%# Bind("Placa") %>' />
                </td>
                <td>
                    <asp:TextBox ID="IDModeloTextBox" runat="server" Text='<%# Bind("IDModelo") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF; color: #333333;">
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Label ID="PlacaLabel" runat="server" Text='<%# Eval("Placa") %>' />
                </td>
                <td>
                    <asp:Label ID="IDModeloLabel" runat="server" Text='<%# Eval("IDModelo") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                <th runat="server">ID</th>
                                <th runat="server">Placa</th>
                                <th runat="server">IDModelo</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
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
            <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Label ID="PlacaLabel" runat="server" Text='<%# Eval("Placa") %>' />
                </td>
                <td>
                    <asp:Label ID="IDModeloLabel" runat="server" Text='<%# Eval("IDModelo") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:Label ID="Label2" runat="server" Text="ID"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataValueField="ID" ForeColor="Black">
    </asp:DropDownList>
    <asp:Label ID="Label3" runat="server" Text="Placa"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Label ID="Label4" runat="server" Text="IDModelo"></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataValueField="ID" ForeColor="Black">
    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert" />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update" />
    <hr />
    <div>
        <asp:Label ID="Label5" runat="server" Text="Modelo Vehiculo"></asp:Label>
        <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource2">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF; color: #284775;">
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AnioLabel" runat="server" Text='<%# Eval("Anio") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LitrosXKilometroLabel" runat="server" Text='<%# Eval("LitrosXKilometro") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IDMarcaVehiculoLabel" runat="server" Text='<%# Eval("IDMarcaVehiculo") %>' />
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
                        <asp:TextBox ID="AnioTextBox" runat="server" Text='<%# Bind("Anio") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LitrosXKilometroTextBox" runat="server" Text='<%# Bind("LitrosXKilometro") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IDMarcaVehiculoTextBox" runat="server" Text='<%# Bind("IDMarcaVehiculo") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
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
                        <asp:TextBox ID="AnioTextBox" runat="server" Text='<%# Bind("Anio") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LitrosXKilometroTextBox" runat="server" Text='<%# Bind("LitrosXKilometro") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IDMarcaVehiculoTextBox" runat="server" Text='<%# Bind("IDMarcaVehiculo") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AnioLabel" runat="server" Text='<%# Eval("Anio") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LitrosXKilometroLabel" runat="server" Text='<%# Eval("LitrosXKilometro") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IDMarcaVehiculoLabel" runat="server" Text='<%# Eval("IDMarcaVehiculo") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server">ID</th>
                                    <th runat="server">Anio</th>
                                    <th runat="server">Descripcion</th>
                                    <th runat="server">LitrosXKilometro</th>
                                    <th runat="server">IDMarcaVehiculo</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
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
                <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AnioLabel" runat="server" Text='<%# Eval("Anio") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LitrosXKilometroLabel" runat="server" Text='<%# Eval("LitrosXKilometro") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IDMarcaVehiculoLabel" runat="server" Text='<%# Eval("IDMarcaVehiculo") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:Label ID="Label6" runat="server" Text="ID"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataValueField="ID" ForeColor="Black">
        </asp:DropDownList>
        <asp:Label ID="Label7" runat="server" Text="Año"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" Text="Descripcion"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <div>
            <asp:Label ID="Label9" runat="server" Text="LitroXKilometro"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:Label ID="Label11" runat="server" Text="Marca"></asp:Label>
            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="ID" ForeColor="Black">
            </asp:DropDownList>
            <asp:Button ID="Button3" runat="server" Text="Insert" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" Text="Update" OnClick="Button4_Click" />
            <hr />
            <div>
                <asp:Label ID="Label12" runat="server" Text="Marca Vehiculo"></asp:Label>
                <asp:ListView ID="ListView3" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource3">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFFFFF; color: #284775;">
                            <td>
                                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
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
                                <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
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
                                <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #E0FFFF; color: #333333;">
                            <td>
                                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                            <th runat="server">ID</th>
                                            <th runat="server">Nombre</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
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
                        <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                            <td>
                                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:Label ID="Label13" runat="server" Text="ID"></asp:Label>
                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource3" DataValueField="ID" ForeColor="Black">
                </asp:DropDownList>
                <asp:Label ID="Label14" runat="server" Text="Nombre"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:Button ID="Button5" runat="server" Text="Insert" OnClick="Button5_Click" />
                <asp:Button ID="Button6" runat="server" Text="Update" OnClick="Button6_Click" />
            </div>
        </div>
    </div>
</div>
</asp:Content>
