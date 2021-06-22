<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdministrarMarcaProveedor.aspx.cs" Inherits="BD_Proyecto.AdministrarMarcaProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT ID, Nombre as &quot;Nombre Marca&quot; FROM [Marca]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT ID, Nombre as &quot;Nombre Proveedor&quot; FROM [Provedor]" OnSelecting="SqlDataSource2_Selecting"></asp:SqlDataSource>
    <section>
        <hr />
    </section>
    <section>
        <div>
            
            <table style="width:100%;">
                <tr>
                    <td>

                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                            <AlternatingItemTemplate>
                                <tr style="background-color: #FFFFFF;color: #284775;">
                                    <td>
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Nombre_MarcaLabel" runat="server" Text='<%# Eval("[Nombre Marca]") %>' />
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
                                        <asp:TextBox ID="Nombre_MarcaTextBox" runat="server" Text='<%# Bind("[Nombre Marca]") %>' />
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
                                        <asp:TextBox ID="Nombre_MarcaTextBox" runat="server" Text='<%# Bind("[Nombre Marca]") %>' />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #E0FFFF;color: #333333;">
                                    <td>
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Nombre_MarcaLabel" runat="server" Text='<%# Eval("[Nombre Marca]") %>' />
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
                                                    <th runat="server">Nombre Marca</th>
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
                                        <asp:Label ID="Nombre_MarcaLabel" runat="server" Text='<%# Eval("[Nombre Marca]") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>

                    </td>
                    <td>

                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                            <AlternatingItemTemplate>
                                <tr style="background-color: #FFFFFF;color: #284775;">
                                    <td>
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Nombre_ProveedorLabel" runat="server" Text='<%# Eval("[Nombre Proveedor]") %>' />
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
                                        <asp:TextBox ID="Nombre_ProveedorTextBox" runat="server" Text='<%# Bind("[Nombre Proveedor]") %>' />
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
                                        <asp:TextBox ID="Nombre_ProveedorTextBox" runat="server" Text='<%# Bind("[Nombre Proveedor]") %>' />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #E0FFFF;color: #333333;">
                                    <td>
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Nombre_ProveedorLabel" runat="server" Text='<%# Eval("[Nombre Proveedor]") %>' />
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
                                                    <th runat="server">Nombre Proveedor</th>
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
                                        <asp:Label ID="Nombre_ProveedorLabel" runat="server" Text='<%# Eval("[Nombre Proveedor]") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>

                    </td>
                </tr>
                <tr>
                    <td>

                        <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataValueField="ID" ForeColor="Black">
                        </asp:DropDownList>
                        <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="Insert" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" />

                    </td>
                    <td>

                        <asp:Label ID="Label3" runat="server" Text="ID"></asp:Label>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataValueField="ID" ForeColor="Black">
                        </asp:DropDownList>
                        <asp:Label ID="Label4" runat="server" Text="Nombre"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:Button ID="Button3" runat="server" Text="Insert" OnClick="Button3_Click" />
                        <asp:Button ID="Button4" runat="server" Text="Update" OnClick="Button4_Click" />

                    </td>
                </tr>
            </table>
        </div>
    </section>
    
            <div>
    
                <hr />
    
            </div>
                            
</asp:Content>
