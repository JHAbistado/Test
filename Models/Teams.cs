using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
   
    public class Teams
    {
        public int team_id { get; set; }
        public string team_name { get; set; }
        public string team_creator { get; set; }
        public string team_description { get; set; }
        public string date_created { get; set; }
        public string date_updated { get; set; }

       
    }

    public class TeamsModel
    {
        public TeamsModel()
        {
            Teams = new List<Teams>();
            teams = new Teams();
        }
        public List<Teams> Teams { get; set; }
        public Teams teams { get; set; }
    }


}