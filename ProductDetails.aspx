<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="BD_Proyecto.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="productDetail" runat="server" ItemType="BD_Proyecto.Models.Producto" SelectMethod ="GetProduct" RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <h1><%#:Item.Nombre %></h1>
            </div>
            <br />
            <table>
                <tr>
                    <td>
                        <img src="/Productos_img/<%#:Item.Fotografias %>" style="border:solid; height:300px" alt="<%#:Item.Nombre %>"/>
                    </td>
                    <td>&nbsp;</td>  
                    <td style="vertical-align: top; text-align:left;">
                        <b>Description:</b><br /><%#:Item.Descripcion %>
                        <br />
                        <span><b>Price:</b>&nbsp;<%#: String.Format("{0:c}", Item.Precio) %></span>
                        <br />
                        <span><b>Product Number:</b>&nbsp;<%#:Item.Codigo %></span>
                        <br />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>