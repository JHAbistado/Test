using MHD.FetchConfig;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MHD.Controllers
{
    public class NataniaController : Controller
    {
        public DataTable dt_content { get; set; }

        // GET: Natania
        public ActionResult Index()
        {
            return View();
        }

        public string sign_in(string email, string password)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("sign_in", new string[][]
            {
                new string[] {"email",  email},
                new string[] {"password",  password}
            });

            return (new Data.Convert().toJson(dt_content));
        }
    }
}