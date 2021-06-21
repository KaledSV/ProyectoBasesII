<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdministrarFerreterias.aspx.cs" Inherits="BD_Proyecto.AdministrarFerreterias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT [ID], [Telefono], [Localizacion].ToString() as localizacion FROM [Ferreteria]"></asp:SqlDataSource>
    <section>
        <hr />
    </section>
    <table class="nav-justified" align="center">
        <tr>
            <td colspan="7">
                <asp:ListView ID="Ferreterias" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="Ferreterias_SelectedIndexChanged">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TelefonoLabel" runat="server" Text='<%# Eval("Telefono") %>' />
                        </td>
                        <td>
                            <asp:Label ID="localizacionLabel" runat="server" Text='<%# Eval("localizacion") %>' />
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
                            <asp:TextBox ID="TelefonoTextBox" runat="server" Text='<%# Bind("Telefono") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="localizacionTextBox" runat="server" Text='<%# Bind("localizacion") %>' />
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
                            <asp:TextBox ID="TelefonoTextBox" runat="server" Text='<%# Bind("Telefono") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="localizacionTextBox" runat="server" Text='<%# Bind("localizacion") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TelefonoLabel" runat="server" Text='<%# Eval("Telefono") %>' />
                        </td>
                        <td>
                            <asp:Label ID="localizacionLabel" runat="server" Text='<%# Eval("localizacion") %>' />
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
                                        <th runat="server">Telefono</th>
                                        <th runat="server">localizacion</th>
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
                            <asp:Label ID="TelefonoLabel" runat="server" Text='<%# Eval("Telefono") %>' />
                        </td>
                        <td>
                            <asp:Label ID="localizacionLabel" runat="server" Text='<%# Eval("localizacion") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="idFerreteriaLabel" runat="server" Text="ID"></asp:Label>
                <asp:TextBox ID="idFerreteriaText" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="locFerreteriaLabel" runat="server" Text="Localizacion"></asp:Label>
                <asp:TextBox ID="locFerreteriaText" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="imgFerreteriaLabel" runat="server" Text="Imagen"></asp:Label>
                <asp:TextBox ID="imgFerreteriaText" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="telFerreteriaLabel" runat="server" Text="Telefono"></asp:Label>
                <asp:TextBox ID="telFerreteriaText" runat="server"></asp:TextBox>
            </td>
            <td> 
                <asp:Button ID="FerreteriaInsert" runat="server" Text="Insert" OnClick="FerreteriaInsert_Click" />
            </td>
            <td> 
                <asp:Button ID="FerreteriaUpdate" runat="server" Text="Update" OnClick="FerreteriaUpdate_Click" />
            </td>
            <td> 
                <asp:Label ID="errFerreteria" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ferreteriasDownList" runat="server" ForeColor="Black">
                    <asp:ListItem Value="1">GAM</asp:ListItem>
                    <asp:ListItem Value="2">Norte</asp:ListItem>
                    <asp:ListItem Value="3">Sur</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="adminFerreteria" runat="server" Text="Administrar Ferreteria" OnClick="adminFerreteria_Click" />
            </td>            
        </tr>
    </table>
</asp:Content>
