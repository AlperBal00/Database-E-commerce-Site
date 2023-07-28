using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace sitedeneme
{
    public partial class register : Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Kayıt işlemi 
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (password != confirmPassword)
            {
                // Şifreler uyuşmuyor, hata mesajı
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Şifreler uyuşmuyor.');", true);
            }
            else
            {
                // Şifreler uyuşuyor
                RegisterUser(username, password);
            }
        }

        protected void RegisterUser(string username, string password)
        {
            string connectionString = "Data Source=ALPER\\SQLEXPRESS;Initial Catalog=urunler;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Kullanıcı adının kullanılıp kullanılmadığını kontrol et
                string checkQuery = "SELECT COUNT(*) FROM users WHERE username = @Username";
                SqlCommand checkCmd = new SqlCommand(checkQuery, connection);
                checkCmd.Parameters.AddWithValue("@Username", username);

                connection.Open();
                int existingUserCount = (int)checkCmd.ExecuteScalar();
                connection.Close();

                if (existingUserCount > 0)
                {
                    // Kullanıcı adı zaten kullanılıyor, hata mesajı göster
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Bu kullanıcı adı zaten kullanılıyor.');", true);
                }
                else
                {
                    // Şifreler uyuşuyor, kullanıcıyı kaydet
                    string insertQuery = "INSERT INTO users (username, password, type) VALUES (@Username, @Password, 'user')";
                    SqlCommand cmd = new SqlCommand(insertQuery, connection);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    connection.Open();
                    int result = cmd.ExecuteNonQuery();
                    connection.Close();

                    if (result == 1)
                    {
                        // Kayıt başarılı, bilgi mesajı göster
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Kayıt başarıyla gerçekleştirildi.');", true);
                        ClearForm();
                    }
                    else
                    {
                        // Kayıt başarısız, hata mesajı göster
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Kayıt sırasında bir hata oluştu.');", true);
                    }
                }
            }
        }

        protected void ClearForm()
        {
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
        }
    }
}
