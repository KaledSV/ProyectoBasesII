<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BD_Proyecto._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>
            <hgroup>
                <h2><%: Page.Title %>
                </h2>
            </hgroup>
            <asp:LoginView ID="LoginView1" runat="server" >
                <AnonymousTemplate>
                    You are not logged in. Click the Login link to sign in. 
                </AnonymousTemplate>  
                <LoggedInTemplate>
                    <asp:ListView ID="productList" runat="server" 
                        DataKeyNames="ID" GroupItemCount="4"
                        ItemType="BD_Proyecto.Models.Producto" SelectMethod="GetProducts">
                        <EmptyDataTemplate>
                            <table >
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <td/>
                        </EmptyItemTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </GroupTemplate>
                        <ItemTemplate>
                            <td runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <a href="ProductDetails.aspx?productID=<%#:Item.ID%>">
                                                <img src="/Productos_img/<%#:Item.Fotografias%>"
                                                    width="100" height="75" style="border: solid" /></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="ProductDetails.aspx?productID=<%#:Item.ID%>">
                                                <span>
                                                    <%#:Item.Nombre%>
                                                </span>
                                            </a>
                                            <br />
                                            <span>
                                                <b>Price: </b><%#:String.Format("{0:c}", Item.Precio)%>
                                            </span>
                                            <br />
                                            <a href="/AgregarACarrito.aspx?productID=<%#:Item.ID %>">               
                                                <span class="ProductListItem">
                                                    <b>Agregar a Carrito<b>
                                                </span>           
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                                </p>
                            </td>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table style="width:100%;">
                                <tbody>
                                    <tr>
                                        <td>
                                            <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                                <tr id="groupPlaceholder"></tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr></tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                    </asp:ListView>
                    </LoggedInTemplate>
            </asp:LoginView>
        </div>
    </section>
</asp:Content>