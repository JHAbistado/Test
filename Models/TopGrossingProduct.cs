using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    public class TopGrossingProduct
    {
        public string item_name { set; get; }
        public string item_sold { set; get; }
    }
    
    public class TopGrossingProductModel
    {
        public TopGrossingProductModel()
        {
            TopGrossingProduct = new List<TopGrossingProduct>();
            topGrossingProduct = new TopGrossingProduct();
        }
        public List<TopGrossingProduct> TopGrossingProduct { get; set; }
        public TopGrossingProduct topGrossingProduct { get; set; }
    }
}