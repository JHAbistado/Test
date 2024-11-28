using MHD.FetchConfig;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MHD.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public DataTable dt_content { get; set; }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult contactPage()
        {
            return View();
        }

        public string addInquiries(string name, string subject, string message)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("addInquiries", new string[][]
            {
                new string[] {"name",  name},
                new string[] {"subject", subject},
                new string[] {"message", message}
            });

            return (new Data.Convert().toJson(dt_content));
        }

    }
}