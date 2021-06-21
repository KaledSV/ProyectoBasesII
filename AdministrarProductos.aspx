<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdministrarProductos.aspx.cs" Inherits="BD_Proyecto.AdministrarProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT p.ID, m.Nombre as Marca, pr.Nombre as Provedor, p.Nombre as Producto, p.Descripcion, p.Fotografias, p.Codigo, p.Precio FROM [Producto] p, [Marca] m, [Provedor] pr WHERE m.ID = p.IDMarca AND pr.ID = p.IDProvedor"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT * FROM [Provedor]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT * FROM [Marca]"></asp:SqlDataSource>
    <section>
        <hr />
    </section>
    <section>
        <div>
            
          <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="MarcaLabel" runat="server" Text='<%# Eval("Marca") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ProvedorLabel" runat="server" Text='<%# Eval("Provedor") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ProductoLabel" runat="server" Text='<%# Eval("Producto") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FotografiasLabel" runat="server" Text='<%# Eval("Fotografias") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CodigoLabel" runat="server" Text='<%# Eval("Codigo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PrecioLabel" runat="server" Text='<%# Eval("Precio") %>' />
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
                        <asp:TextBox ID="MarcaTextBox" runat="server" Text='<%# Bind("Marca") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ProvedorTextBox" runat="server" Text='<%# Bind("Provedor") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ProductoTextBox" runat="server" Text='<%# Bind("Producto") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FotografiasTextBox" runat="server" Text='<%# Bind("Fotografias") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PrecioTextBox" runat="server" Text='<%# Bind("Precio") %>' />
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
                        <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="MarcaTextBox" runat="server" Text='<%# Bind("Marca") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ProvedorTextBox" runat="server" Text='<%# Bind("Provedor") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ProductoTextBox" runat="server" Text='<%# Bind("Producto") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FotografiasTextBox" runat="server" Text='<%# Bind("Fotografias") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PrecioTextBox" runat="server" Text='<%# Bind("Precio") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="MarcaLabel" runat="server" Text='<%# Eval("Marca") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ProvedorLabel" runat="server" Text='<%# Eval("Provedor") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ProductoLabel" runat="server" Text='<%# Eval("Producto") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FotografiasLabel" runat="server" Text='<%# Eval("Fotografias") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CodigoLabel" runat="server" Text='<%# Eval("Codigo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PrecioLabel" runat="server" Text='<%# Eval("Precio") %>' />
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
                                    <th runat="server">Marca</th>
                                    <th runat="server">Provedor</th>
                                    <th runat="server">Producto</th>
                                    <th runat="server">Descripcion</th>
                                    <th runat="server">Fotografias</th>
                                    <th runat="server">Codigo</th>
                                    <th runat="server">Precio</th>
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
                        <asp:Label ID="MarcaLabel" runat="server" Text='<%# Eval("Marca") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ProvedorLabel" runat="server" Text='<%# Eval("Provedor") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ProductoLabel" runat="server" Text='<%# Eval("Producto") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FotografiasLabel" runat="server" Text='<%# Eval("Fotografias") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CodigoLabel" runat="server" Text='<%# Eval("Codigo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PrecioLabel" runat="server" Text='<%# Eval("Precio") %>' />
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
            <asp:Label ID="Label2" runat="server" Text="IDMarca"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="ID" ForeColor="Black">
            </asp:DropDownList>
            <asp:Label ID="Label6" runat="server" Text="IDProveedor"></asp:Label>
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="ID" ForeColor="Black">
            </asp:DropDownList>
            </div>
            <div>
            <asp:Label ID="Label3" runat="server" Text="Nombre"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:Label ID="Label8" runat="server" Text="Descripcion"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text="Fotografias"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Label ID="Label5" runat="server" Text="Codigo"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:Label ID="Label7" runat="server" Text="Precio"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                
                <div>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert" />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update" />
                </div>
    </div>
                
</asp:Content>
