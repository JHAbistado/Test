using MHD.FetchConfig;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MHD.Controllers
{
    public class TestController : Controller
    {
        // GET: Test
        public ActionResult Index()
        {
            return View();
        }
        public DataTable dt_content { get; set; }

        public string cashier_test(string a)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("chef_test", new string[][]
            {
                new string[] {"chef_a",  a}
            });

            return (new Data.Convert().toJson(dt_content));
        }
    }
}