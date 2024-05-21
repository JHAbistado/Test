using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    
    public class Customers
    {
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string viber_contact { get; set; }
        public string email_add { get; set; }
        public string date_added { get; set; }
        public string delivery_address { get; set; }    
    }

    public class CustomersModel
    {
        public CustomersModel()
        {
            Customers = new List<Customers>();
            customers = new Customers();
        }
        public List<Customers> Customers { get; set; }
        public Customers customers { get; set; }
    }
}