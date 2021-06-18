<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BD_Proyecto.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Content/Default/Index.css" rel="stylesheet" />
</head>
<body>
    <div id="cajita">
        <div id="left">
            <img src="Content/Default/user.png" alt="Login" id="UserIMG"/>
            <div id="login">Login</div>
        </div>
        <form runat="server" id="right">
            <label id="labelStart">Nombre de usuario</label>
            <input type="text" id="username" value="" runat="server"/>
            <label>Contraseña</label>
            <input type="password" id="password" value="" runat="server"/>
            <asp:Button ID="submit" runat="server" Text="Continuar" onclick="buttomLogin"/>
        </form>
    </div>
</body>
</html>
