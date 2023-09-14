using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ContactList
{
    public partial class AddContact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            string fileName = "";
            if (ImgUpload.HasFile)
            {
                fileName = ImgUpload.FileName;
                ImgUpload.SaveAs(Server.MapPath($"/Content/img/{ImgUpload.FileName}"));
            }
            else
            {
                fileName = "default.png";
            }


            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "INSERT INTO Contacts VALUES(@Name, @Surname, @Address,@Email, @ImageName, @PhoneNumber)";
                cmd.Parameters.AddWithValue("Name", NameBox.Text);
                cmd.Parameters.AddWithValue("Surname", SurnameBox.Text);
                cmd.Parameters.AddWithValue("Address", AddressBox.Text);
                cmd.Parameters.AddWithValue("Email", EmailBox.Text);
                cmd.Parameters.AddWithValue("ImageName", fileName);
                cmd.Parameters.AddWithValue("PhoneNumber", PhoneBox.Text);


                int inserimentoEffettuato = cmd.ExecuteNonQuery();

                if (inserimentoEffettuato > 0)
                {
                    Response.Redirect("Default");
                }
            }

            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }

        }
    }
}