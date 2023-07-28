<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="sitedeneme.addproduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/bootstrap.bundle.min.js"></script>
    <link rel="icon" href="~/favicon.ico" type="image/x-icon" />
    <style>
    .drop-area {
        border: 2px dashed #ccc;
        padding: 20px;
        text-align: center;
        cursor: pointer;
    }

        .drop-area p {
            margin: 0;
        }

        .drop-area.drag-over {
            background-color: #f7f7f7;
        }
</style>
    <script>

        // Drop alanını seç
        var dropArea = document.getElementById('dropArea');

        // Dosyaları yükleme olayları
        dropArea.addEventListener('dragover', handleDragOver, false);
        dropArea.addEventListener('dragleave', handleDragLeave, false);
        dropArea.addEventListener('drop', handleFileSelect, false);


        function handleDragOver(e) {
            e.preventDefault();
            dropArea.classList.add('drag-over');
        }


        function handleDragLeave(e) {
            e.preventDefault();
            dropArea.classList.remove('drag-over');
        }


        function handleFileSelect(e) {
            dropArea.classList.remove('drag-over');

            var files = e.dataTransfer.files; // Seçilen dosyaları al


            for (var i = 0; i < files.length; i++) {
                var file = files[i];



                console.log('Dosya adı:', file.name);
                console.log('Dosya boyutu:', file.size);
                console.log('Dosya türü:', file.type);

                
            }
        }

    </script>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="WebForm1.aspx">
                <img src="img/logo2.png" alt="Webdenal2" height="40" width="270" /></a>
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
    <form id="form1" runat="server" class="container">











        <h2>Ürün Ekleme</h2>
        <div class="form-group">
            <asp:Label ID="lblUrunAd" runat="server" Text="Ürün Adı:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtUrunAd" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblOzellik" runat="server" Text="Ürün Özellikleri:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtOzellik" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblFiyat" runat="server" Text="Fiyat:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtFiyat" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <br />
        <%--deniyorum--%>
        <div class="form-group">
            <div id="dropArea" class="drop-area">
                <p>Sürükleyip bırakın veya tıklayın</p>
                <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control-file" style="width: 100%; height: 250px;" />

                
            </div>
        </div>
        <%--deniyorum--%>


        <br />
        <asp:Button ID="btnUpload" runat="server" Text="Ürün Ekle" OnClick="btnUpload_Click" CssClass="btn btn-primary" />

    </form>
</body>
</html>
