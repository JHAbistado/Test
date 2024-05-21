using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
   
    public class History
    {
        public int request_id { get; set; }
        public string client_name { get; set; }
        public string team_name { get; set; }
        public string package { get; set; }
        public string datetotransact { get; set; }
        public string modeofdelivery { get; set; }
        public string status { get; set; }
        public string itemsreceived { get; set; }

       
    }

    public class HistoryModel
    {
        public HistoryModel()
        {
            History = new List<History>();
            history = new History();
        }
        public List<History> History { get; set; }
        public History history { get; set; }
    }


}