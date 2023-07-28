using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace sitedeneme { 
// connectionString="Data Source=ALPER\SQLEXPRESS;Initial Catalog=urunler;Integrated Security=True" ve urunler veritabanımın içinde bir tane users tablom var users adında SQL tablosu. Bu users tablosunda ID, username, password, type var. Eğer kullanıcı adı ve şifresi veritabanındaki user ile eşleşiyorsa ve type kısmı user ise  WebForm1.Aspx sayfasına yönlendirsin type kısmı admin ise admin.aspx sayfasına yönlendirsin eğer yanlış veriler girildiyse hata mesajı versin.

    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {                                                       
            DataSet1TableAdapters.urunlerTablo2TableAdapter dt = new DataSet1TableAdapters.urunlerTablo2TableAdapter();
            Repeater1.DataSource = dt.GetData();
            Repeater1.DataBind();
            
        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Detaylar")
            {
                string productId = e.CommandArgument.ToString(); // retrieve the ID of the selected product
                Response.Redirect("ProductDetails.aspx?productId=" + productId); // redirect the user to the ProductDetails page with the ID in the query string
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string productName = txtSearch.Text; // Arama çubuğundan girilen ürün adını alma

            // Ürünü veritabanından arayın ve ID'sini getime
            string connectionString = "Data Source=ALPER\\SQLEXPRESS;Initial Catalog=urunler;Integrated Security=True";
            string query = "SELECT id FROM urunlerTablo2 WHERE urunad LIKE '%' + @productName + '%'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@productName", productName);

                    connection.Open();
                    object result = command.ExecuteScalar(); // İlk sütundaki değeri al

                    if (result != null)
                    {
                        int productId = Convert.ToInt32(result); // ID'yi integer olarak al
                        Response.Redirect("ProductDetails.aspx?id=" + productId); 
                    }
                    else
                    {
                        string script = "setTimeout(function() { showMessage('Ürün bulunamadı.'); location.reload(); }, 1000);";
                        ScriptManager.RegisterStartupScript(this, GetType(), "MessageBox", script, true);
                    }

                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string connectionString = "Data Source=ALPER\\SQLEXPRESS;Initial Catalog=urunler;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                
                string sqlQuery = "SELECT TOP 1 id FROM urunlerTablo2 ORDER BY NEWID()";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    // Rastgele bir satırın ID'sini alma
                    int selectedID = (int)command.ExecuteScalar();

                  
                    string redirectUrl = "ProductDetails.aspx?id=" + selectedID;
                    Response.Redirect(redirectUrl);
                }
            }
        }




    }
}