using MHD.FetchConfig;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace MHD.Controllers
{
    public class TestController : Controller
    {
        // GET: Test
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Test()
        {
            return View();
        }
        public ActionResult register_page()
        {
            return View();
        }
        public ActionResult login_page()
        {
            return View();
        }
        public ActionResult profile_page()
        {
            return View();
        }
        public ActionResult contactPage()
        {
            return View();
        }
        public DataTable dt_content { get; set; }

        public string cashier_test(string cashier_a, string cashier_b, string cashier_c)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("test", new string[][]
            {
                new string[] {"a",  cashier_a},
                new string[] {"b", cashier_b},
                new string[] {"c", cashier_c}
            });

            return (new Data.Convert().toJson(dt_content));
        }

        public string cashier_add_data(string cash_first_name, string cash_last_name, string cash_suffix_name, string cash_age)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("add_data", new string[][]
            {
                new string[] {"db_first_name",  cash_first_name},
                new string[] {"db_last_name", cash_last_name},
                new string[] {"db_suffix_name", cash_suffix_name},
                new string[] {"db_age", cash_age}
            });

            return (new Data.Convert().toJson(dt_content));
        }
        public string display_data()
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("display_data", new string[][]
            {
                
            });

            return (new Data.Convert().toJson(dt_content));
        }

        public string update_data(string id, string first_name, string age)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("update_data", new string[][]
            {
                new string[] {"id",  id},
                new string[] { "first_name",  first_name},
                new string[] { "age",  age}
            });

            return (new Data.Convert().toJson(dt_content));
        }

        public string delete_data(string id)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("delete_data", new string[][]
            {
                new string[] {"id",  id}
            });

            return (new Data.Convert().toJson(dt_content));
        }
        public string check_username(string username)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("check_username", new string[][]
            {
                new string[] {"username", username }
            });

            return (new Data.Convert().toJson(dt_content));
        }
        public string register_account(string first_name, string last_name, string suffix_name, string age, string username, string password)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("register_account", new string[][]
            {
                new string[] { "first_name", first_name },
                new string[] { "last_name", last_name },
                new string[] { "suffix_name", suffix_name },
                new string[] { "age", age },
                new string[] { "username", username },
                new string[] { "password", password },
            });

            return (new Data.Convert().toJson(dt_content));
        }
    
        public string login(string username, string password)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("login", new string[][]
            {
                new string[] {"username", username },
                new string[] { "password", password }
            });

            return (new Data.Convert().toJson(dt_content));
        }

       
    }
}