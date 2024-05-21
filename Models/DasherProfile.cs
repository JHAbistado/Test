using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    public class DasherProfile
    {
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string phone_number { get; set; }
        public string vehicle_details { get; set; }
        public string activestatus { get; set; }
    }

    public class DasherProfileModel
    {
        public DasherProfileModel()
        {
            DasherProfile = new List<DasherProfile>();
            dasherProfile = new DasherProfile();
        }
        public List<DasherProfile> DasherProfile { get; set; }
        public DasherProfile dasherProfile { get; set; }
    }
}