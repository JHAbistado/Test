using MHD.FetchConfig;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MHD.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        public DataTable dt_content { get; set; }

        public ActionResult login() {
            return View();
        }

        public ActionResult landing()
        {
            return View();
        }

        public ActionResult homeowners_list()
        {
            return View();
        }

        public string admin_login(string email, string password)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("admin_login", new string[][]
            {
                new string[] {"email", email },
                new string[] {"password", password }
            });

            return (new Data.Convert().toJson(dt_content));
        }
        public string get_admin_details()
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("get_admin_details", new string[][]
            {
                
            });

            return (new Data.Convert().toJson(dt_content));
        }
        public string get_homeowners_details(string acc_id)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("get_homeowners_details", new string[][]
            {
                new string[] {"acc_id", acc_id }
            });

            return (new Data.Convert().toJson(dt_content));
        }
        public string get_homeowners_family(string acc_id)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("get_homeowners_family", new string[][]
            {
                new string[] {"acc_id", acc_id }
            });

            return (new Data.Convert().toJson(dt_content));
        }
        public string get_homeowners_pets(string acc_id)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("get_homeowners_pets", new string[][]
            {
                new string[] {"acc_id", acc_id }
            });

            return (new Data.Convert().toJson(dt_content));
        }
        public string get_homeowners_vehicles(string acc_id)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("get_homeowners_vehicles", new string[][]
            {
                new string[] {"acc_id", acc_id }
            });

            return (new Data.Convert().toJson(dt_content));
        }

    }
}