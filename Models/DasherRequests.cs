using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{

    public class DasherRequests
    {
        public int request_id { get; set; }
        public string client_name { get; set; }
        public string client_viber { get; set; }
        public string client_altcontact { get; set; }
        public string total_expected_amount { get; set; }
        public string property_name { get; set; }
        public string package_name { get; set; }
        public string package_price { get; set; }
        public string mode_of_transfer { get; set; }
        public string mode_of_selection { get; set; }
    }

    public class DasherRequestsModel
    {
        public DasherRequestsModel()
        {
            DasherRequests = new List<DasherRequests>();
            dasherRequests = new DasherRequests();
        }
        public List<DasherRequests> DasherRequests { get; set; }
        public DasherRequests dasherRequests { get; set; }
    }
}