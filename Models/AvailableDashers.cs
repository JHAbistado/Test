using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    public class AvailableDashers
    {
        public string dasherid { get; set; }
        public string dasher_name { get; set; }
        public string dasher_team { get; set; }
        public string dasher_cardetails { get; set; }
        public string dasher_teamid { get; set; }
        public string dasher_number { get; set;
        }
    }

    public class AvailableDasherModel
    {
        public AvailableDasherModel()
        {
            AvailableDashers = new List<AvailableDashers>();
            availableDashers = new AvailableDashers();
        }
        public List<AvailableDashers> AvailableDashers { get; set; }
        public AvailableDashers availableDashers{ get; set; }
    }
}