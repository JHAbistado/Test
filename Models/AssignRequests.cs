using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    public class AssignRequests
    {
        public int assign_id { get; set; }
        public string request_id { get; set; }
        public string dasher_id { get; set; }
        public string ratings { get; set; }
        public string date_added { get; set; }
    }

    public class AssignRequestModel
    {
        public AssignRequestModel()
        {
            AssignRequests = new List<AssignRequests>();
            assignRequests = new AssignRequests();
        }
        public List<AssignRequests> AssignRequests { get; set; }
        public AssignRequests assignRequests{ get; set; }
    }
}