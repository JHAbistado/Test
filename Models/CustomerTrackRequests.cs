using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    public class CustomerTrackRequests
    {
        public string request_id { get; set; }
        public string request_status { get; set; }
        public string team_name { get; set; }
        public string date_to_transact { get; set; }
        public string mode_of_transfer { get; set; }
        public string item_received { get; set; }
        public string customer_received { get; set; }
    }

    public class CustomerTrackRequestsModel
    {
        public CustomerTrackRequestsModel()
        {
            CustomerTrackRequests = new List<CustomerTrackRequests>();
            customerTrackRequests = new CustomerTrackRequests();
        }
        public List<CustomerTrackRequests> CustomerTrackRequests { get; set; }
        public CustomerTrackRequests customerTrackRequests { get; set; }
    }
}