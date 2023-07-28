using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sitedeneme
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataSet1TableAdapters.urunlerTablo2TableAdapter dt = new DataSet1TableAdapters.urunlerTablo2TableAdapter();
            Repeater1.DataSource = dt.GetData();
            Repeater1.DataBind();

            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                string connectionString = "Data Source=ALPER\\SQLEXPRESS;Initial Catalog=urunler;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM urunlerTablo2 WHERE id = @id";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@id", id);
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string urunad = reader.GetString(reader.GetOrdinal("urunad"));
                                string ozellik = reader.GetString(reader.GetOrdinal("ozellik"));
                                string resim = reader.GetString(reader.GetOrdinal("resim"));
                                int fiyat = reader.GetInt32(reader.GetOrdinal("fiyat"));

                                ViewState["urunad"] = urunad;
                                ViewState["ozellik"] = ozellik;
                                ViewState["resim"] = "img/" + resim; // append "img/" folder path to the image file name
                                ViewState["fiyat"] = fiyat;
                            }
                        }
                    }
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string productName = txtSearch.Text; // Arama çubuğundan girilen ürün adını alın

            // Ürünü veritabanından arayın ve ID'sini getirin
            string connectionString = "Data Source=ALPER\\SQLEXPRESS;Initial Catalog=urunler;Integrated Security=True";
            string query = "SELECT id FROM urunlerTablo2 WHERE urunad LIKE '%' + @productName + '%'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@productName", productName);

                    connection.Open();
                    object result = command.ExecuteScalar(); // İlk sütundaki değeri alın

                    if (result != null)
                    {
                        int productId = Convert.ToInt32(result); // ID'yi integer olarak alın
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
        

    }
}