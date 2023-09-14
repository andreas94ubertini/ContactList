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
    public partial class Default : System.Web.UI.Page
    {
        public List<Contact> contactList = new List<Contact>();
        private bool trig = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
                SqlConnection conn = new SqlConnection(connectionString);

                SqlCommand cmd = new SqlCommand("select * from Contacts", conn);
                SqlDataReader sqlDataReader;

                conn.Open();

               
                sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    Contact contact = new Contact();
                    contact.IdContact = Convert.ToInt32(sqlDataReader["IdContact"]);
                    contact.Name = sqlDataReader["Name"].ToString();
                    contact.Surname = sqlDataReader["Surname"].ToString();
                    contact.Address = sqlDataReader["Address"].ToString();
                    contact.PhoneNumber = sqlDataReader["PhoneNumber"].ToString();
                    contact.Email = sqlDataReader["Email"].ToString();
                    contact.Photo = sqlDataReader["Photo"].ToString();
                    contactList.Add(contact);

                }
                GridView1.DataSource = contactList;
                GridView1.DataBind();

                conn.Close();
                if (contactList.Count > 0)
                {
                    addIf.Visible = false;
                }

            }
        }

        protected void OrderBy_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd;
            if (trig == false) { 
                
                 cmd = new SqlCommand("select * from Contacts order by Name asc", conn);
                trig = true;

            }
            else
            {
                
                 cmd = new SqlCommand("select * from Contacts", conn);
                trig = false;
            }

           
            SqlDataReader sqlDataReader;

            conn.Open();


            sqlDataReader = cmd.ExecuteReader();
            while (sqlDataReader.Read())
            {
                Contact contact = new Contact();
                contact.IdContact = Convert.ToInt32(sqlDataReader["IdContact"]);
                contact.Name = sqlDataReader["Name"].ToString();
                contact.Surname = sqlDataReader["Surname"].ToString();
                contact.Address = sqlDataReader["Address"].ToString();
                contact.PhoneNumber = sqlDataReader["PhoneNumber"].ToString();
                contact.Email = sqlDataReader["Email"].ToString();
                contact.Photo = sqlDataReader["Photo"].ToString();
                contactList.Add(contact);

            }
            GridView1.DataSource = contactList;
            GridView1.DataBind();
        }
    }
}