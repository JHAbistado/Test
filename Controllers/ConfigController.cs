using MHD.FetchConfig;
using MHD.Models;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography.Xml;
using System.ServiceProcess;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI;
using System.Xml.Linq;
using static System.Net.Mime.MediaTypeNames;
using Microsoft.AspNetCore.Http;
using static System.Net.WebRequestMethods;

namespace MHD.Controllers
{
    public class ConfigController : Controller
    {
        public DataTable dt_content { get; set; }

        public string get_user_id()
        {
            return HttpContext.Session["ACC_ID"].ToString();
        }
        

        public ActionResult natania_landing_page()
        {
            ViewData["FIRST_NAME"] = HttpContext.Session["FIRST_NAME"].ToString();
            ViewData["LAST_NAME"] = HttpContext.Session["LAST_NAME"].ToString();
            ViewData["EMAIL"] = HttpContext.Session["EMAIL"].ToString();
            return View();
        }
        

        public string check_email(string email)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("check_email", new string[][]
            {
                new string[] {"email",email}
            });
            return(new Data.Convert().toJson(dt_content));  
        }


        public string get_details()
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("get_details", new string[][]
            {
                new string[] {"acc_id", get_user_id()}
            });

            if (dt_content.Rows.Count > 0)
            {
                HttpContext.Session["FIRST_NAME"] = Convert.ToString(dt_content.Rows[0]["first_name"]);
                HttpContext.Session["LAST_NAME"] = Convert.ToString(dt_content.Rows[0]["last_name"]);
                HttpContext.Session["MIDDLE_NAME"] = Convert.ToString(dt_content.Rows[0]["middle_name"]);
                HttpContext.Session["SUFFIX_NAME"] = Convert.ToString(dt_content.Rows[0]["suffix"]);
                HttpContext.Session["AGE"] = Convert.ToString(dt_content.Rows[0]["age"]);
                HttpContext.Session["GENDER"] = Convert.ToString(dt_content.Rows[0]["gender"]);
                HttpContext.Session["EMAIL"] = Convert.ToString(dt_content.Rows[0]["email"]);
                HttpContext.Session["PHONE_NO"] = Convert.ToString(dt_content.Rows[0]["phone_no"]);
                HttpContext.Session["PHASE"] = Convert.ToString(dt_content.Rows[0]["phase"]);
                HttpContext.Session["LOT"] = Convert.ToString(dt_content.Rows[0]["lot"]);
                HttpContext.Session["BLOCK"] = Convert.ToString(dt_content.Rows[0]["block"]);
                HttpContext.Session["STREET"] = Convert.ToString(dt_content.Rows[0]["street"]);
                HttpContext.Session["BARANGAY"] = Convert.ToString(dt_content.Rows[0]["barangay"]);
                HttpContext.Session["CITY"] = Convert.ToString(dt_content.Rows[0]["city"]);
                HttpContext.Session["PROVINCE"] = Convert.ToString(dt_content.Rows[0]["province"]);
                HttpContext.Session["COUNTRY"] = Convert.ToString(dt_content.Rows[0]["country"]);
                HttpContext.Session["POSTAL_CODE"] = Convert.ToString(dt_content.Rows[0]["postal_code"]);
            }


            return (new Data.Convert().toJson(dt_content));
        }

       
        public string save_orcr(string temp, string v_id)
        {

            string image = "", result = "0";

            Connection connection = new Connection();
            if (Request.Files.Count > 0)
            {
                try
                {
                    HttpFileCollectionBase files = Request.Files;

                    HttpPostedFileBase file = files[0];
                    string fileName = file.FileName;
                    string extension = Path.GetExtension(file.FileName);


                    image = Path.GetRandomFileName();
                    image = image.Replace(".", "");
                    image = image.Substring(0, 6);
                    image += extension;
                    // create the uploads folder if it doesn't exist
                    Directory.CreateDirectory(Server.MapPath("~/Upload/ORCR/"));
                    string patxh = Path.Combine(Server.MapPath("~/Upload/ORCR/"), image);

                    // save the file
                    file.SaveAs(patxh);
                    string imgpath = "/Upload/ORCR/" + image;
                    dt_content = connection.StartSEPH("save_orcr", new string[][]
                    {
                        new string[] {"owner_id", get_user_id() },
                        new string[] {"v_id", v_id},
                        new string[] {"orcr", imgpath}
                    });
                    result = (new Data.Convert().toJson(dt_content));
                }

                catch (Exception e)
                {

                    result = "0";
                }
            }



            return result;


        }

        public string LoginMortal(string email, string password, string app)
        {

            Connection connection = new Connection();
            dt_content = connection.StartSEPH("SP_GET_APPLICATION_SIGNATURE", new string[][] {
                 new string[] { "APP", app }
            });
            try
            {
                string signature = dt_content.Rows[0]["RA_SIGNATURE"].ToString();
                string uri = dt_content.Rows[0]["RA_URI"].ToString();
                dt_content = connection.StartSEPH("SP_LOGIN_MORTAL", new string[][] {
                 new string[] { "EMAIL", email }
                ,new string[] { "PASSWORD", password }
                ,new string[] { "SIGNATURE", signature }
            });
                if (dt_content.Rows.Count > 0)
                {
                    
                        HttpContext.Session["sesaid"] = Convert.ToString(dt_content.Rows[0]["RM_SESAID"]);
                        HttpContext.Session["name"] = Convert.ToString(dt_content.Rows[0]["FULLNAME"]);
                        HttpContext.Session["signature"] = signature;
                 

                }
            }
            catch (Exception ex) { 
            }    
            return (new Data.Convert().toJson(dt_content));
        }



    }
}