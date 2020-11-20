using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    
    public class Packages
    {
        public int rate_id { get; set; }
        public string team_id { get; set; }
        public string package_name { get; set; }
        public string package_price { get; set; }
        public string package_description { get; set; }
        public string package_maxtime { get; set; }
        public string date_added { get; set; }
        public string date_modified { get; set; }
        public string package_updator { get; set; }

    }

    public class PackagesModel
    {
        public PackagesModel()
        {
            Packages = new List<Packages>();
            packages = new Packages();
        }
        public List<Packages> Packages { get; set; }
        public Packages packages { get; set; }
    }
}