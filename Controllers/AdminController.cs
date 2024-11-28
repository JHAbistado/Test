using MHD.FetchConfig;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Mvc;
using System.Web.Services.Description;

namespace MHD.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GSBibleVerse()
        {
            return View();
        }

        public dynamic addBibleVerse(string bible_verse, string bible_passage)
        {
            Connection connection = new Connection();
            DataTable addBibleVerse = connection.StartSEPH("addBibleVerse", new string[][]
            {
                new string[] { "bible_verse", bible_verse  },
                new string[] { "bible_passage", bible_passage }
            });

            return new Data.Convert().toJson(addBibleVerse);

        }
    }
}