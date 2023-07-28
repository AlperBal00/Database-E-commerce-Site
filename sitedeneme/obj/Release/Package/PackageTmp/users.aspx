<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="sitedeneme.users" %>

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
    <form id="form1" runat="server">
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
                        <p>5</p>
                    </div>

                </div>
            </div>
        </nav>

        <div class="content">
            <div>
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" DataKeyNames="ID" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="username" HeaderText="Kullanıcı adı" />
                        <asp:BoundField DataField="password" HeaderText="ŞİFRE" />
                        <asp:BoundField DataField="type" HeaderText="YETKİSİ" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button CommandName="Delete" CssClass="btn btn-danger" runat="server" Text="Sil" CommandArgument='<%# Container.DataItemIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button CommandName="Authorize" CssClass="btn btn-success" runat="server" Text="Yetkilendir" CommandArgument='<%# Container.DataItemIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button CommandName="yetkiyi al" CssClass="btn btn-outline-primary" runat="server" Text="Yetkiyi Al" CommandArgument='<%# Container.DataItemIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>



            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
