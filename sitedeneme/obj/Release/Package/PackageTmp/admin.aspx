<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="sitedeneme.admin" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Paneli</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .sidebar {
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            padding: 20px;
            background-color: #f8f9fa;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
        }
    </style>
</head>
<body>

    <%--    <div class="sidebar">
        <h4>Admin Paneli</h4>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="admin.aspx">Ürünler</a>
            </li>

            <li class="nav-item">
                <a class="nav-link active" href="users.aspx">Kullanıcılar</a>
            </li>
        </ul>
    </div>--%>
    <nav class="navbar navbar-expand-lg navbar-light bg-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="WebForm1.aspx"><img src="img/logo2.png" alt="Webdenal2" height="40" width="270" /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="admin.aspx">Ürünler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="users.aspx">Kullanıcılar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="addproduct.aspx">Ürün Ekle</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" style="color: white;">Ürünler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" style="color: white;">İletişim</a>
                    </li>
                </ul>

                <div class="col-md-2 text-end">
                    <a href="#" class="btn btn-primary">Kayıt Ol</a>
                    <a href="loginn.aspx" class="btn btn-primary" id="girisButton">Giriş Yap</a>
                </div>

            </div>
        </div>
    </nav>


    <form id="form1" runat="server">
        <div>


<asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" DataKeyNames="ID"
    OnRowDeleting="GridView1_RowDeleting" >
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:BoundField DataField="urunad" HeaderText="ÜRÜN ADI" />
                    <asp:BoundField DataField="ozellik" HeaderText="ÖZELLİK" />
                    <asp:BoundField DataField="fiyat" HeaderText="FİYAT" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button CommandName="Delete" CssClass="btn btn-danger" runat="server" Text="Sil" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>


        </div>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    </form>





    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

