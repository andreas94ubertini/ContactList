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
    public partial class ContactDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand("select * from Contacts where IdContact=@id", conn);
            cmd.Parameters.AddWithValue("id", Request.QueryString["IdContact"]);
            SqlDataReader sqlDataReader;

            conn.Open();
            sqlDataReader = cmd.ExecuteReader();

            while (sqlDataReader.Read())
            {
                string Id = sqlDataReader["IdContact"].ToString();
                string Name = sqlDataReader["Name"].ToString();
                string Surname = sqlDataReader["Surname"].ToString();
                string Phone = sqlDataReader["PhoneNumber"].ToString();
                string Email = sqlDataReader["Email"].ToString();
                string Address = sqlDataReader["Address"].ToString();
                string Photo = sqlDataReader["Photo"].ToString();

                profileImg.ImageUrl = $"Content/img/{Photo}";
                name.InnerText = Name;
                surname.InnerText = Surname;
                phone.InnerText = Phone;
                email.InnerText = Email;
                address.InnerText = Address;
                modify.HRef = $"ModifyContact.aspx?IdContact={Id}";
            }
           

            conn.Close();
        }


    }
}