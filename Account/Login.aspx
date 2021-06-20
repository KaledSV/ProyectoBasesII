<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BD_Proyecto.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <link href="Default/Index.css" rel="stylesheet" />
        <div id="cajita">
            <div id="left">
                <img src="Default/user.png" alt="Login" id="UserIMG"/>
                <div id="login">Login</div>
            </div>
            <div id="right">
                <label id="labelStart">Nombre de usuario</label>
                <asp:TextBox ID="user" runat="server" CssClass="inputClass"></asp:TextBox>
                <label>Contraseña</label>
                <asp:TextBox ID="pass" runat="server" CssClass="inputClass"></asp:TextBox>
                <asp:Label ID="Err" runat="server" Text=""></asp:Label>
                <asp:Button ID="submit" runat="server" Text="Continuar" onclick="buttomLogin" CssClass="submit"/>
            </div>
        </div>
    </section>
</asp:Content>
