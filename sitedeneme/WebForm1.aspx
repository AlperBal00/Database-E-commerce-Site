<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="sitedeneme.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-commerce</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="StyleSheet1.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/bootstrap.bundle.min.js"></script>
    <link rel="icon" href="~/favicon.ico" type="image/x-icon" />
    <style>
        .card {
            transition: transform 0.2s ease-out, background-color 0.2s ease-out;
        }

            .card:hover {
                /*transform: scale(1.05);*/
                background-color: rgba(0, 0, 0, 0.1);
            }

        .bg-custom {
            background-color: #2e7cee;
        }





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




        .img-border {
            border: 10px solid #4f78ee;
            transition: border-color 2s;
        }

            .img-border:hover {
                /*border-color: 10px solid blue;*/
                border: 15px solid #000000;
                transition: border-color 2s;
            }

        .rounded-circle {
            height: 250px;
            width: 250px;
        }
        body {
  overflow-x: hidden; /* Dikey scroll'u gizler */
}
    </style>

</head>
<body>

    <form id="form1" runat="server">
        <div class="top-bar">
            <a href="https://wa.me/+905309595622" style="float: right;">
                <i class="fas fa-phone">Whatsapp İletişim</i>
            </a>
        </div>
        <div>

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
                            <a href="register.aspx" class="btn btn-primary">Kayıt Ol</a>
                            <a href="loginn.aspx" class="btn btn-primary" id="girisButton">Giriş Yap</a>
                        </div>

                    </div>
                </div>
            </nav>

            <div class="dd" style="padding-top: 50px; padding-right: 50px; padding-bottom: 50px; padding-left: 50px;">
                <div id="imageSlider" class="carousel slide" data-bs-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-bs-target="#imageSlider" data-bs-slide-to="0" class="active"></li>
                        <li data-bs-target="#imageSlider" data-bs-slide-to="1"></li>
                        <li data-bs-target="#imageSlider" data-bs-slide-to="2"></li>
                        <!-- New indicator for the third image -->
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="img/1.png" class="d-block w-100" alt="Image 1" <%--style="width: 1500px; height: 412px;"--%> />
                        </div>
                        <div class="carousel-item">
                            <img src="img/2.png" class="d-block w-100" alt="Image 2" <%--style="width: 1500px; height: 412px;"--%> />
                        </div>
                        <div class="carousel-item">
                            <!-- New carousel item for the third image -->
                            <img src="img/3.png" class="d-block w-100" alt="Image 3" <%--style="width: 1500px; height: 412px;"--%> />
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#imageSlider" role="button" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#imageSlider" role="button" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </a>
                </div>
            </div>


            <%--balonlar--%>
            <div class="row justify-content-center">
                <div class="col-md-3 col-xs-6 home-mode-item text-center">
                    <a href="https://www.vatanbilgisayar.com/oem-hazir-sistemler/">
                        <div class="home-mode-main">
                            <img src="https://cdn.vatanbilgisayar.com/Upload/general/frontend/home/oem-hazir-sistemler.jpg" class="rounded-circle img-border">
                            <div class="home-mode-border">
                                <span class="badge badge-primary" style="font-size: 20px; color: darkblue;">Gamer Sistemleri</span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3 col-xs-6 home-mode-item text-center">
                    <a href="https://www.vatanbilgisayar.com/temizlik-isi-robotta">
                        <div class="home-mode-main">
                            <img src="https://cdn.vatanbilgisayar.com/Upload/general/frontend/home/robot.png?v=sdadasasdasd" class="rounded-circle img-border">
                            <div class="home-mode-border">
                                <span class="badge badge-primary" style="font-size: 20px; color: darkblue;">Temizlik İşi Robot'ta</span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3 col-xs-6 home-mode-item text-center">
                    <a href="https://www.vatanbilgisayar.com/evde-stadyum-keyfi">
                        <div class="home-mode-main">
                            <img src="https://cdn.vatanbilgisayar.com/Upload/general/frontend/home/mac-keyfi.png?v=sdadasasdasd" class="rounded-circle img-border">
                            <div class="home-mode-border">
                                <span class="badge badge-primary" style="font-size: 20px; color: darkblue;">Evde Stadyum Keyfi</span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3 col-xs-6 home-mode-item text-center">
                    <a href="https://www.vatanbilgisayar.com/airfryer/">
                        <div class="home-mode-main">
                            <img src="https://cdn.vatanbilgisayar.com/Upload/general/frontend/home/airfry.jpg?v=sdadasasdasd" class="rounded-circle img-border">
                            <div class="home-mode-border">
                                <span class="badge badge-primary" style="font-size: 20px; color: darkblue;">Airfryer Ürünleri</span>

                            </div>
                        </div>
                    </a>
                </div>
            </div>


            <%--balon--%>
            <br />
            <br />
            <br />
            <hr />
            <br />


            <div style="text-align: center; margin: 0 auto; padding: 0 60px;">
                <%--Sayfa içeriği--%>
                <style>
                    .card {
                        height: 100%;
                    }
                </style>

                <div class="row">
                    <div class="col-md-12">
                        <h3 style="font-family: Arial, sans-serif; text-align: left;">Öne Çıkan Ürünler</h3>



                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <%# Container.ItemIndex % 4 == 0 ? "<div class='row'>" : "" %>

                                <div class="col-md-3">
                                    <div class="card">
                                        <img src='<%# "img/" + Eval("resim") %>' class="card-img-top" alt="..." />
                                        <div class="card-body">
                                            <h5 class="card-title"><%# Eval("urunad") %></h5>
                                            <p class="card-text"><%# Eval("ozellik") %></p>
                                            <p class="card-text">
                                                <h4><%# Eval("fiyat") %> ₺</h4>
                                                <a href="ProductDetails.aspx?id=<%# Eval("id") %>" class="btn btn-primary">Detaylar</a>
                                                <a href="https://wa.me/+905309595622" class="btn btn-success">Satın Al</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <%# Container.ItemIndex % 4 == 3 ? "</div>" : "" %>
                            </ItemTemplate>
                        </asp:Repeater>
                        <%# Container.Controls.Count % 4 != 0 ? "</div>" : "" %>
                        <br />
                    </div>
                </div>


            </div>
            <hr />
            <br />
            <div class="col-md-4" style="margin-left: auto; margin-right: auto;">
                <asp:Button ID="sans" runat="server" Text="ŞANSIMI DENEMEK İSTİYORUM" OnClick="Button1_Click" CssClass="btn btn-warning btn-lg" />
                <hr />

                <h2>E-Mail adresimize abone olun!</h2>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" />
                    <div id="emailHelp" class="form-text">Adresiniz başka kimseyle paylaşılmayacaktır.</div>
                </div>
                <button type="submit" class="btn btn-primary">Abone ol</button>
                <br />
                <h2>Kategorilerimiz</h2>
                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between align-items-center">Bilgisayar
            <span class="badge bg-primary rounded-pill">15</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">Bilgisayar
            <span class="badge bg-primary rounded-pill">2</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">Bilgisayar
            <span class="badge bg-primary rounded-pill">8</span>
                    </li>
                </ul>
            </div>
            <br />

        </div>









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
