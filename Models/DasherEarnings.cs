using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    public class DasherEarnings
    {
        public string request_id { get; set; }
        public string total_item_expected_amount { get; set; }
        public string property_info { get; set; }
        public string used_package { get; set; }
        public string package_price { get; set; }
    }

    public class DasherEarningsModel
    {
        public DasherEarningsModel()
        {
            DasherEarnings = new List<DasherEarnings>();
            dasherEarnings = new DasherEarnings();
        }
        public List<DasherEarnings> DasherEarnings { get; set; }
        public DasherEarnings dasherEarnings { get; set; }
    }
}