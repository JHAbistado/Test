using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    
    public class Dashers
    {
        public int dasher_id { get; set; }
        public string dasher_name { get; set; }
        public string dasher_number { get; set; }
        public string dasher_screened { get; set; }
        public string dasher_datescreened { get; set; }
        public string dasher_dateadded { get; set; }
        public string dasher_car_details { get; set; }
        public string dasher_location { get; set; }
        public string dasher_location_id { get; set; }
    }

    public class DashersModel
    {
        public DashersModel()
        {
            Dashers = new List<Dashers>();
            dashers = new Dashers();
        }
        public List<Dashers> Dashers { get; set; }
        public Dashers dashers { get; set; }
    }
}