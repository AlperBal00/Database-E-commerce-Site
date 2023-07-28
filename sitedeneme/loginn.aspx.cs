using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sitedeneme
{
    public partial class loginn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Logging_BUTTON(object sender, EventArgs e)
        {
            SqlConnection baglanti = new SqlConnection(@"Data Source = ALPER\SQLEXPRESS;Initial Catalog=urunler;Integrated Security=True");

            baglanti.Open();
            SqlCommand komut = new SqlCommand("SELECT * FROM users WHERE username=@P1 AND password=@P2", baglanti);

            komut.Parameters.AddWithValue("@P1", TextBox1.Text);
            komut.Parameters.AddWithValue("@P2", TextBox2.Text);

            SqlDataReader dr = komut.ExecuteReader();

            if (dr.Read())
            {
                string userType = dr["type"].ToString();
                if (userType == "admin")
                {Response.Redirect("admin.aspx");}
                else if (userType == "user")
                { Response.Redirect("WebForm1.aspx");}
                else
                { Response.Write("Bilinmeyen kullanıcı tipi");}
            }
            else
            { Response.Write("Hatalı veri girişi");}
            baglanti.Close();
        }

    }
}