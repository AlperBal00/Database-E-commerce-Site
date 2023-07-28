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
    public partial class users : System.Web.UI.Page
    {
        DataTable dataTable;
        public static string connectionString = "Data Source=ALPER\\SQLEXPRESS;Initial Catalog=urunler;Integrated Security=True";
        public static SqlConnection connection = new SqlConnection(connectionString);
        void Tablo()
        {
            string query = "SELECT ID,username, password, type FROM users";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
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
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);

            if (e.CommandName == "Authorize")
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string updateQuery = "UPDATE users SET type='admin' WHERE ID=@ID";
                    SqlCommand updateCmd = new SqlCommand(updateQuery, connection);
                    updateCmd.Parameters.AddWithValue("@ID", id);

                    connection.Open();
                    updateCmd.ExecuteNonQuery();
                    connection.Close();

                    Tablo();
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Kayıt yetkilendirildi.');", true);
                }
            }
            else if (e.CommandName == "Delete")
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string deleteQuery = "DELETE FROM users WHERE ID=@ID";
                    SqlCommand deleteCmd = new SqlCommand(deleteQuery, connection);
                    deleteCmd.Parameters.AddWithValue("@ID", id);

                    connection.Open();
                    deleteCmd.ExecuteNonQuery();
                    connection.Close();

                    Tablo();
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Kayıt başarıyla silindi.');", true);
                }
            }
            else if (e.CommandName == "yetkiyi al")
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string updateQuery = "UPDATE users SET type='user' WHERE ID=@ID";
                    SqlCommand updateCmd = new SqlCommand(updateQuery, connection);
                    updateCmd.Parameters.AddWithValue("@ID", id);

                    connection.Open();
                    updateCmd.ExecuteNonQuery();
                    connection.Close();

                    Tablo();
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Yetki alındı.');", true);
                }
            }
        }




    }
}