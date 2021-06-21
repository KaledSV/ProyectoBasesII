<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FerreteriaNorte.aspx.cs" Inherits="BD_Proyecto.FerreteriaNorte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT id, id_producto, cantidad, id_estante FROM FNORTE...Inventario"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT id, nombre, id_ferreteria FROM FNORTE...Departamento"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT id, id_departamento FROM FNORTE...Pasillo"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT id, id_pasillo FROM FNORTE...Estante "></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT * FROM [Producto]"></asp:SqlDataSource>
    
    <section>
        <hr />
    </section>
    
    <table align="center" class="nav-justified">
        <tr>
            <td colspan="7">
                <div>
                    Inventario</div>
                <asp:ListView ID="inventarioList" runat="server" DataSourceID="SqlDataSource1">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="id_productoLabel" runat="server" Text='<%# Eval("id_producto") %>' />
                        </td>
                        <td>
                            <asp:Label ID="cantidadLabel" runat="server" Text='<%# Eval("cantidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="id_estanteLabel" runat="server" Text='<%# Eval("id_estante") %>' />
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
                            <asp:TextBox ID="id_productoTextBox" runat="server" Text='<%# Bind("id_producto") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="cantidadTextBox" runat="server" Text='<%# Bind("cantidad") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="id_estanteTextBox" runat="server" Text='<%# Bind("id_estante") %>' />
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
                            <asp:TextBox ID="id_productoTextBox" runat="server" Text='<%# Bind("id_producto") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="cantidadTextBox" runat="server" Text='<%# Bind("cantidad") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="id_estanteTextBox" runat="server" Text='<%# Bind("id_estante") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="id_productoLabel" runat="server" Text='<%# Eval("id_producto") %>' />
                        </td>
                        <td>
                            <asp:Label ID="cantidadLabel" runat="server" Text='<%# Eval("cantidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="id_estanteLabel" runat="server" Text='<%# Eval("id_estante") %>' />
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
                                        <th runat="server">id_producto</th>
                                        <th runat="server">cantidad</th>
                                        <th runat="server">id_estante</th>
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
                            <asp:Label ID="id_productoLabel" runat="server" Text='<%# Eval("id_producto") %>' />
                        </td>
                        <td>
                            <asp:Label ID="cantidadLabel" runat="server" Text='<%# Eval("cantidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="id_estanteLabel" runat="server" Text='<%# Eval("id_estante") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="idInventarioLabel" runat="server" Text="ID"></asp:Label>
                <asp:DropDownList ID="idInventarioDrop" runat="server" DataSourceID="SqlDataSource1" DataValueField="id" ForeColor="Black"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="idProductoInventarioLabel" runat="server" Text="Producto"></asp:Label>
                <asp:DropDownList ID="idProductoInventarioDrop" runat="server" DataSourceID="SqlDataSource5" DataValueField="ID" ForeColor="Black" DataTextField="Nombre"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="cantiadInventarioLabel" runat="server" Text="Cantidad"></asp:Label>
                <asp:TextBox ID="cantiadInventarioText" runat="server" ForeColor="Black"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="idEstanteInventarioLabel" runat="server" Text="IDEstante"></asp:Label>
                <asp:DropDownList ID="idEstanteInventarioDrop" runat="server" DataSourceID="SqlDataSource4" DataValueField="id" ForeColor="Black"></asp:DropDownList>
            </td>
            <td> 
                <asp:Button ID="InventarioInsert" runat="server" Text="Insert" OnClick="InventarioInsert_Click" />
            </td>
            <td> 
                <asp:Button ID="InventarioUpdate" runat="server" Text="Update" OnClick="InventarioUpdate_Click" />
            </td>
            <td> 
                <asp:Label ID="errInventario" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <hr />
                <div>
                    Departamento</div>
                <asp:ListView ID="departamentosList" runat="server" DataSourceID="SqlDataSource2">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                        </td>
                        <td>
                            <asp:Label ID="id_ferreteriaLabel" runat="server" Text='<%# Eval("id_ferreteria") %>' />
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
                            <asp:TextBox ID="id_ferreteriaTextBox" runat="server" Text='<%# Bind("id_ferreteria") %>' />
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
                            <asp:TextBox ID="id_ferreteriaTextBox" runat="server" Text='<%# Bind("id_ferreteria") %>' />
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
                            <asp:Label ID="id_ferreteriaLabel" runat="server" Text='<%# Eval("id_ferreteria") %>' />
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
                                        <th runat="server">id_ferreteria</th>
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
                            <asp:Label ID="id_ferreteriaLabel" runat="server" Text='<%# Eval("id_ferreteria") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="idDepartamentoLabel" runat="server" Text="ID"></asp:Label>
                <asp:DropDownList ID="idDepartamentoDrop" runat="server" DataSourceID="SqlDataSource2" DataValueField="id" ForeColor="Black"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="nombreDepartamentoLabel" runat="server" Text="Nombre"></asp:Label>
                <asp:TextBox ID="nombreDepartamentoText" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="idFerreteriaDepartamentoLabel" runat="server" Text="IDFerreteria"></asp:Label>
                <asp:TextBox ID="idFerreteriaDepartamentoText" runat="server"></asp:TextBox>
            </td>
            <td> 
                <asp:Button ID="DepartamentoInsert" runat="server" Text="Insert"/>
            </td>
            <td> 
                <asp:Button ID="DepartamentoUpdate" runat="server" Text="Update"/>
            </td>
            <td> 
                <asp:Label ID="ErrDepartamento" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <hr />
                <div>
                    Pasillo</div>
                <asp:ListView ID="pasillosList" runat="server" DataSourceID="SqlDataSource3">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="id_departamentoLabel" runat="server" Text='<%# Eval("id_departamento") %>' />
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
                            <asp:TextBox ID="id_departamentoTextBox" runat="server" Text='<%# Bind("id_departamento") %>' />
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
                            <asp:TextBox ID="id_departamentoTextBox" runat="server" Text='<%# Bind("id_departamento") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="id_departamentoLabel" runat="server" Text='<%# Eval("id_departamento") %>' />
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
                                        <th runat="server">id_departamento</th>
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
                            <asp:Label ID="id_departamentoLabel" runat="server" Text='<%# Eval("id_departamento") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="idPasilloLabel" runat="server" Text="id"></asp:Label>
                <asp:DropDownList ID="idPasilloDrop" runat="server" DataSourceID="SqlDataSource3" DataValueField="id" ForeColor="Black"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="idDepartamentoPasilloLabel" runat="server" Text="IDDepartamento"></asp:Label>
                <asp:DropDownList ID="idDepartamentoPasilloDrop" runat="server" DataSourceID="SqlDataSource2" DataValueField="id" ForeColor="Black"></asp:DropDownList>
            </td>
            <td> 
                <asp:Button ID="PasilloInsert" runat="server" Text="Insert"/>
            </td>
            <td> 
                <asp:Button ID="PasilloUpdate" runat="server" Text="Update"/>
            </td>
            <td> 
                <asp:Label ID="errPasillo" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <hr />
                <div>
                    Estante</div>
                <asp:ListView ID="estantesList" runat="server" DataSourceID="SqlDataSource4">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="id_pasilloLabel" runat="server" Text='<%# Eval("id_pasillo") %>' />
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
                            <asp:TextBox ID="id_pasilloTextBox" runat="server" Text='<%# Bind("id_pasillo") %>' />
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
                            <asp:TextBox ID="id_pasilloTextBox" runat="server" Text='<%# Bind("id_pasillo") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="id_pasilloLabel" runat="server" Text='<%# Eval("id_pasillo") %>' />
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
                                        <th runat="server">id_pasillo</th>
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
                            <asp:Label ID="id_pasilloLabel" runat="server" Text='<%# Eval("id_pasillo") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            </td>
        </tr>
        <tr>
             <td>
                <asp:Label ID="idEstanteLabel" runat="server" Text="id"></asp:Label>
                <asp:DropDownList ID="idEstanteDrop" runat="server" DataSourceID="SqlDataSource4" DataValueField="id" ForeColor="Black"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="idPasilloEstanteLabel" runat="server" Text="IDPasillo"></asp:Label>
                <asp:DropDownList ID="idPasilloEstanteDrop" runat="server" DataSourceID="SqlDataSource3" DataValueField="id" ForeColor="Black"></asp:DropDownList>
            </td>
            <td> 
                <asp:Button ID="EstanteInsert" runat="server" Text="Insert"/>
            </td>
            <td> 
                <asp:Button ID="EstanteUpdate" runat="server" Text="Update"/>
            </td>
            <td> 
                <asp:Label ID="errEstante" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    
</asp:Content>
