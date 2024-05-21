using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    public class Properties
    {
        public string propertyid { get; set; }
        public string propertyname { get; set; }
    }

    public class PropertiesModel
    {
        public PropertiesModel()
        {
            Properties = new List<Properties>();
            properties = new Properties();
        }
        public List<Properties> Properties { get; set; }
        public Properties properties { get; set; }
    }
}