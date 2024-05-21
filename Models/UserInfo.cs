using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    public class UserInfo
    {
        public int userid { set; get; }
        public string firstname { set; get; }
        public string lastname { set; get; }
    }
    
    public class UserInfoModel
    {
        public UserInfoModel()
        {
            UserInfo = new List<UserInfo>();
            userInfo = new UserInfo();
        }
        public List<UserInfo> UserInfo  { get; set; }
        public UserInfo userInfo{ get; set; }
    }
}