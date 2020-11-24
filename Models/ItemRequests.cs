using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    public class ItemRequests
    {

        public int requestid { set; get; }
        public string teamname { set; get; }
        public string requestor { set; get; }
        public string property { set; get; }
        public string modeoftransfer { set; get; }
        public string datetobuy { set; get; }
        public string teamid { set; get; }

        public class ItemRequestsModel
        {

            public ItemRequestsModel()
            {
                ItemRequests = new List<ItemRequests>();
                itemrequests = new ItemRequests();
            }
            public List<ItemRequests> ItemRequests { get; set; }
            public ItemRequests itemrequests { get; set; }
        }
    }
}