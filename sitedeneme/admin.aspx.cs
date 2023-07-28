using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sitedeneme
{
    public partial class admin : System.Web.UI.Page
    {
        DataTable dataTable;
        public static string connectionString = "Data Source=ALPER\\SQLEXPRESS;Initial Catalog=urunler;Integrated Security=True";
        public static SqlConnection connection = new SqlConnection(connectionString);
        void Tablo()
        {
            string query = "SELECT id,urunad, ozellik, fiyat FROM urunlerTablo2";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlDataAdapter adapter = new SqlDataAdapter(query,connection))
            {
                dataTable = new DataTable();

                adapter.Fill(dataTable);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Tablo();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM urunlerTablo2 WHERE id=@ID";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@ID", id);

                connection.Open();
                int result = cmd.ExecuteNonQuery();
                connection.Close();

                if (result == 1)
                {  Label1.Text = "Kayıt başarıyla silindi."; }
                else
                { Label1.Text = "Kayıt silinirken bir hata oluştu."; }


                Tablo();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Kayıt başarıyla silindi.');", true);

            }
        }


    }
}