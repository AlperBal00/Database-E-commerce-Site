<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="sitedeneme.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kayıt Ol</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="formRegister" runat="server">
        <div class="container">
            <h1>Kayıt Ol</h1>
            <div class="form-group">
                <label for="txtUsername">Kullanıcı Adı:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı" required></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPassword">Şifre:</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Şifre" required></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtConfirmPassword">Şifre Tekrar:</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Şifre Tekrar" required></asp:TextBox>
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Kayıt Ol" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
        </div>
    </form>
</body>
</html>