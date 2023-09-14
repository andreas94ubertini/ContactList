using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ContactList
{
    public partial class ModifyContact : System.Web.UI.Page
    {
        private static string photoBase = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
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
                    photoBase = Photo;


                    NameBox.Text = Name;
                    SurnameBox.Text = Surname;
                    PhoneBox.Text = Phone;
                    EmailBox.Text = Email;
                    AddressBox.Text = Address;
                    modalName.InnerText = $"Sei sicuro di voler eliminare {Name} {Surname} dalla tua lista contatti?";
                }
                

                conn.Close();
            }

        }

        protected void ButtonModify_Click(object sender, EventArgs e)
        {
            string fileName = "";
            if (ImgUpload.HasFile)
            {
                fileName = ImgUpload.FileName;
                ImgUpload.SaveAs(Server.MapPath($"/Content/img/{ImgUpload.FileName}"));
            }
            else
            {
                fileName = photoBase;
            }
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "update Contacts SET Name=@Name, Surname=@Surname, Address=@Address, Email=@Email, Photo=@Photo, PhoneNumber=@PhoneNumber where IdContact=@IdContact";
            cmd.Parameters.AddWithValue("Name", NameBox.Text);
            cmd.Parameters.AddWithValue("Surname", SurnameBox.Text);
            cmd.Parameters.AddWithValue("Address", AddressBox.Text);
            cmd.Parameters.AddWithValue("Email", EmailBox.Text);
            cmd.Parameters.AddWithValue("PhoneNumber", PhoneBox.Text);
            cmd.Parameters.AddWithValue("Photo", fileName);
            cmd.Parameters.AddWithValue("IdContact", Request.QueryString["IdContact"].ToString());
            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();
            Response.Redirect($"ContactDetails.aspx?IdContact={Request.QueryString["IdContact"]}");
        }


        protected void ButtonDlt_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "DELETE FROM Contacts where IdContact=@id";
            cmd.Parameters.AddWithValue("id", Request.QueryString["IdContact"]);

            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();
            Response.Redirect($"Default.aspx");
        }
    }
}