using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


namespace sitedeneme
{
    public partial class addproduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                string fileName = fileUpload.FileName;
                string filePath = Server.MapPath("~/img/") + fileName; // "img" klasörüne yolu belirtiyoruz

                fileUpload.SaveAs(filePath);

                // Veritabanına bağlanmak için connection string'i kullanın
                string connectionString = "Data Source=ALPER\\SQLEXPRESS;Initial Catalog=urunler;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // SQL sorgusu oluşturun
                    string sql = "INSERT INTO urunlerTablo2 (urunad, ozellik, resim, fiyat) VALUES (@urunad, @ozellik, @resim, @fiyat)";

                    // Sorguyu çalıştırmak için SqlCommand nesnesini kullanın
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        // Parametreleri ekleyin
                        command.Parameters.AddWithValue("@urunad", txtUrunAd.Text);
                        command.Parameters.AddWithValue("@ozellik", txtOzellik.Text);
                        command.Parameters.AddWithValue("@resim", fileName);
                        command.Parameters.AddWithValue("@fiyat", Convert.ToInt32(txtFiyat.Text));

                        // Sorguyu çalıştırın
                        command.ExecuteNonQuery();
                    }
                }

                // İşlem tamamlandıktan sonra bir mesaj göstermek için butonun içeriğini değiştirin
                btnUpload.Text = "Yüklendi";
            }
        }

    }
}
