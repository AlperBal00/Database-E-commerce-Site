<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="sitedeneme.ProductDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-commerce</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/bootstrap.bundle.min.js"></script>
    <link rel="icon" href="~/favicon.ico" type="image/x-icon" />
    <style>
        .card {
            transition: transform 0.2s ease-out, background-color 0.2s ease-out;
        }

            .card:hover {
                transform: scale(1.05);
                background-color: rgba(0, 0, 0, 0.1);
            }

        .bg-custom {
            background-color: #2e7cee;
        }



        /*.card:hover .card-img {
            transform: scale(1.1);
            transition: transform 0.3s ease-in-out;
        }

        .card .card-img {
            transition: transform 0.3s ease-in-out;
        }*/












        /*.zoom-img {
            display: none;
            position: absolute;
            top: 0;
            left: 100%;
            width: 200%;
            height: 100%;
            z-index: 1;
            transform: translate(-50%, 0);
            transition: opacity 0.2s ease-in-out, transform 0.2s ease-in-out;
        }

        .card:hover .zoom-img {
            display: block;
            opacity: 0.9;
            transform: translate(-50%, 0) scale(1.5);
        }*/



                .top-bar {
            background-color: #333;
            color: #fff;
            height: 40px;
            line-height: 40px;
            text-align: center;
        }

            .top-bar i {
                margin-right: 5px;
            }

            .top-bar a {
                color: #fff;
                text-decoration: none;
            }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="top-bar">
            <a href="tel:+1234567890" style="float: right;">
                <i class="fas fa-phone">Whatsapp İletişim</i>
            </a>
        </div>




        <%--E-commerce menüsü--%>
        <nav class="navbar navbar-expand-lg navbar-light bg-custom">
            <div class="container-fluid">
                <a class="navbar-brand" href="WebForm1.aspx">
                    <img src="img/logo.png" alt="Webdenal2" height="40" width="270" /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="WebForm1.aspx" style="color: white;">Anasayfa</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: white;">Hakkımızda</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: white;">Ürünler</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: white;">İletişim</a>
                        </li>
                    </ul>

                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Aramak istediğiniz ürünü buraya giriniz.." TextMode="SingleLine"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Ara" OnClick="btnSearch_Click" CssClass="btn btn-primary" />

                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script>
                        function showMessage(message) {
                            $('<div>').appendTo('body')
                                .html('<div><h4>' + message + '</h4></div>')
                                .dialog({
                                    modal: true,
                                    title: 'Bildirim',
                                    zIndex: 10000,
                                    autoOpen: true,
                                    width: 'auto',
                                    resizable: false,
                                    buttons: {
                                        Tamam: function () {
                                            $(this).dialog("close");
                                        }
                                    },
                                    close: function (event, ui) {
                                        $(this).remove();
                                    }
                                });
                        }
                    </script>
                    <div class="col-md-2 text-end">
                        <a href="#" class="btn btn-primary">Kayıt Ol</a>
                        <a href="#" class="btn btn-primary">Giriş Yap</a>
                    </div>
                </div>
            </div>
        </nav>









        <%-- çalışıyor
        <div class="card" style="width: 18rem; margin: 0 auto;">

            <img src="<%= ViewState["resim"] %>" class="card-img-top" alt="Product Image" />

            <div class="card-body">
                <h5 class="card-title"><%= ViewState["urunad"] %></h5>
                <p class="card-text"><%= ViewState["ozellik"] %></p>
                <p class="card-text"><%= ViewState["gelenyorum"] %></p>
                <p class="card-text"><strong>Fiyat:</strong> <%= Convert.ToInt32(ViewState["fiyat"]) %> TL</p>
            </div>

        </div>--%>

        <%--çalışıyor büyütüyor the best--%>

        <%--Seçilen ürünün tanıtıldığı kısım--%>
        <table style="margin: 0 auto;">
            <tr>
                <td>
                    <div>
                        <div class="cardd">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img src="<%= ViewState["resim"] %>" class="card-img" alt="Product Image" />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= ViewState["urunad"] %></h5>
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <td><strong>Özellikleri:</strong></td>
                                                    <td><%= ViewState["ozellik"] %></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Fiyat:</strong></td>
                                                    <td><%= Convert.ToInt32(ViewState["fiyat"]) %> TL</td>
                                                </tr>
                                                <tr>
                                                    <td><a href="https://wa.me/+905309595622" class="btn btn-success">Satın Al</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td style="padding: 50px;">
                    <%--Diğer Ürünlere Göz Atın kısmı--%>


                    <%--Küçük şekilde tek tek gösteriyor --%>
                    <div class="row">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div class="col-md-2">
                                    <div class="card-group">
                                        <div class="card" style="height: 300px;">
                                            <img src='<%# "img/" + Eval("resim") %>' class="card-img-top" alt="..." style="object-fit: cover; height: 200px;" />
                                            <div class="card-body" style="font-size: 12px;">
                                                <h5 class="card-title"><%# Eval("urunad") %></h5>
                                                <p class="card-text"><%# Eval("ozellik") %></p>
                                                <p class="card-text">
                                                    <h4><%# Eval("fiyat") %> ₺</h4>
                                                    <a href="ProductDetails.aspx?id=<%# Eval("id") %>" class="btn btn-primary">Detaylar</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>


                </td>
            </tr>


        </table>










        <%--zoom-img ve .card:hover .zoom-img css ile çalışıyor
            <div class="card" style="width: 18rem; margin: 0 auto; position: relative;">
            <img src="<%= ViewState["resim"] %>" class="card-img-top" alt="Product Image" />
            <img src="<%= ViewState["resim"] %>" class="zoom-img" alt="Product Image" />
            <div class="card-body">
                <h5 class="card-title"><%= ViewState["urunad"] %></h5>
                <p class="card-text"><%= ViewState["ozellik"] %></p>
                <p class="card-text"><%= ViewState["gelenyorum"] %></p>
                <p class="card-text"><strong>Fiyat:</strong> <%= Convert.ToInt32(ViewState["fiyat"]) %> TL</p>
            </div>

        </div>--%>










        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />



        <footer style="background-color: #333; color: #fff; padding: 50px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <h3>Kategoriler</h3>
                        <ul class="list-unstyled">
                            <li><a href="#" style="color: white; text-decoration: none; border-bottom: none;">Kategori 1</a></li>
                            <li><a href="#" style="color: white; text-decoration: none; border-bottom: none;">Kategori 2</a></li>
                            <li><a href="#" style="color: white; text-decoration: none; border-bottom: none;">Kategori 3</a></li>
                            <li><a href="#" style="color: white; text-decoration: none; border-bottom: none;">Kategori 4</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <h3>Hakkımızda</h3>
                        <ul class="list-unstyled">
                            <li><a href="#" style="color: white; text-decoration: none; border-bottom: none;">Hakkımızda 1</a></li>
                            <li><a href="#" style="color: white; text-decoration: none; border-bottom: none;">Hakkımızda 2</a></li>
                            <li><a href="#" style="color: white; text-decoration: none; border-bottom: none;">Hakkımızda 3</a></li>
                            <li><a href="#" style="color: white; text-decoration: none; border-bottom: none;">Hakkımızda 4</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <h3>İletişim</h3>
                        <p style="color: white; text-decoration: none; border-bottom: none;">Adres: 1234 Sokak No: 56</p>
                        <p style="color: white; text-decoration: none; border-bottom: none;">Telefon: +90 555 555 55 55</p>
                        <p style="color: white; text-decoration: none; border-bottom: none;">E-posta: info@example.com</p>
                    </div>
                    <div class="col-md-3">
                        <h3>Sosyal Medya</h3>
                        <ul class="list-unstyled">
                            <li><a href="#" style="color: white; text-decoration: none; border-bottom: none;"><i class="fa fa-facebook"></i>Facebook</a></li>
                            <li><a href="#" style="color: white; text-decoration: none; border-bottom: none;"><i class="fa fa-twitter"></i>Twitter</a></li>
                            <li><a href="#" style="color: white; text-decoration: none; border-bottom: none;"><i class="fa fa-instagram"></i>Instagram</a></li>
                            <li><a href="#" style="color: white; text-decoration: none; border-bottom: none;"><i class="fa fa-linkedin"></i>LinkedIn</a></li>
                        </ul>
                    </div>
                    <hr />
                    <p style="text-align: center;">&copy; 2023 - Webdenal2</p>
                </div>
            </div>
        </footer>
    </form>
</body>
</html>
