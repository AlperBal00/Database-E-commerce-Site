<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginn.aspx.cs" Inherits="sitedeneme.loginn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 100px;
            text-align: center;
        }

        .container {
            max-width: 400px;
        }
    </style>
</head>

<body>

    <div class="container">
                   <a class="navbar-brand" href="WebForm1.aspx"><img src="img/logo2.png" alt="Webdenal2" height="40" width="270" /></a>
        <br /><br /><br />
        <form id="form1" runat="server" method="post">
            <div class="form-group">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="*******" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="Button1" runat="server" Text="Giriş Yap" OnClick="Logging_BUTTON" CssClass="btn btn-primary" />
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
