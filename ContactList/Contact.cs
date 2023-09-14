using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ContactList
{
    public class Contact
    {
        public int IdContact { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Photo { get; set; } 
        public Contact() { }
        public Contact(string name, string surname, string address,string phoneNum, string email, string photo)
        {
            Name = name;
            Surname = surname;
            Address = address;
            PhoneNumber = phoneNum;
            Email = email;
            Photo = photo;
        }
        public Contact(int idContact, string name, string surname, string address, string phoneNum, string email, string photo)
        {
            IdContact = idContact;
            Name = name;
            Surname = surname;
            Address = address;
            PhoneNumber = phoneNum;
            Email = email;
            Photo = photo;
        }
    }
}