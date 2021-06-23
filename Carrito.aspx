<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="BD_Proyecto.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="ShoppingCartTitle" runat="server" class="ContentHead"><h1>Carrito de Compras</h1></div>
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
        ItemType="BD_Proyecto.Models.ItemCarrito" SelectMethod="GetShoppingCartItems" Width="1053px" >   
        <Columns>
        <asp:BoundField DataField="IDProducto" HeaderText="ID" SortExpression="ProductID" />        
        <asp:TemplateField   HeaderText="Nombre">            
                <ItemTemplate>
                    <%#:GetProducto(Item.IDProducto).Nombre %>
                </ItemTemplate>        
        </asp:TemplateField>  
        <asp:TemplateField   HeaderText="Precio (individual)">            
                <ItemTemplate>
                    <%#: String.Format("{0:c}",(Convert.ToDouble(GetProducto(Item.IDProducto).Precio))) %>
                </ItemTemplate>        
        </asp:TemplateField>
        <asp:TemplateField   HeaderText="Cantidad">            
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="100" runat="server" Text="<%#:Item.Cantidad %>"></asp:TextBox> 
                </ItemTemplate>        
        </asp:TemplateField>    
        <asp:TemplateField HeaderText="Total por Item">            
                <ItemTemplate>
                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Cantidad)) *  Convert.ToDouble(GetProducto(Item.IDProducto).Precio)))%>
                </ItemTemplate>        
        </asp:TemplateField> 
        <asp:TemplateField HeaderText="Quitar Item">            
                <ItemTemplate>
                    <asp:CheckBox id="Remove" runat="server"></asp:CheckBox>
                </ItemTemplate>        
        </asp:TemplateField>    
        </Columns>    
    </asp:GridView>
    <div>
        <p></p>
        <strong>
            <asp:Label ID="LabelTotalText" runat="server" Text="Total Carrito: "></asp:Label>
            <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
        </strong> 
    </div>
    <br />
    <table> 
    <tr>
      <td>
          <asp:Button ID="CompraButton" runat="server" OnClick="CompraButton_Click" Text="Facturar" />
        <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" />
      </td>
      <td>
        <!--Checkout Placeholder -->
      </td>
    </tr>
    </table>
</asp:Content>
