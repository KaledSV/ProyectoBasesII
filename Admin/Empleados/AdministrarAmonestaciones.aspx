<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdministrarAmonestaciones.aspx.cs" Inherits="BD_Proyecto.AdministrarAmonestaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT * FROM [Amonestacion]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Proyecto %>" SelectCommand="SELECT * FROM [Empleado]"></asp:SqlDataSource>
    </p>
    <hr />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Label ID="IDEmpleadoLabel" runat="server" Text='<%# Eval("IDEmpleado") %>' />
                </td>
                <td>
                    <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                </td>
                <td>
                    <asp:Label ID="MontoLabel" runat="server" Text='<%# Eval("Monto") %>' />
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
                    <asp:TextBox ID="IDEmpleadoTextBox" runat="server" Text='<%# Bind("IDEmpleado") %>' />
                </td>
                <td>
                    <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
                </td>
                <td>
                    <asp:TextBox ID="MontoTextBox" runat="server" Text='<%# Bind("Monto") %>' />
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
                    <asp:TextBox ID="IDEmpleadoTextBox" runat="server" Text='<%# Bind("IDEmpleado") %>' />
                </td>
                <td>
                    <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
                </td>
                <td>
                    <asp:TextBox ID="MontoTextBox" runat="server" Text='<%# Bind("Monto") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Label ID="IDEmpleadoLabel" runat="server" Text='<%# Eval("IDEmpleado") %>' />
                </td>
                <td>
                    <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                </td>
                <td>
                    <asp:Label ID="MontoLabel" runat="server" Text='<%# Eval("Monto") %>' />
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
                                <th runat="server">IDEmpleado</th>
                                <th runat="server">Fecha</th>
                                <th runat="server">Monto</th>
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
                    <asp:Label ID="IDEmpleadoLabel" runat="server" Text='<%# Eval("IDEmpleado") %>' />
                </td>
                <td>
                    <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                </td>
                <td>
                    <asp:Label ID="MontoLabel" runat="server" Text='<%# Eval("Monto") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataValueField="ID" ForeColor="Black">
    </asp:DropDownList>
    <asp:Label ID="Label2" runat="server" Text="IDEmpleado"></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="ID" ForeColor="Black">
    </asp:DropDownList>
    <asp:Label ID="Label3" runat="server" Text="Fecha"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Label ID="Label4" runat="server" Text="Monto"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update" />
    </div>
</asp:Content>
