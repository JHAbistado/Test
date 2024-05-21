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

       
        public ActionResult pagekoto(string a)
        {
            return View();
        }

        public ActionResult natania_signin_page()
        {
            
            return View();
        }

        public ActionResult signin_test()
        {
            return View();
        }

        public ActionResult natania_signup_page()
        {

            return View();
        }
        public ActionResult natania_forgotpass_page()
        {
            return View();
        }

        public ActionResult natania_changepass_page()
        {
            return View();
        }

        public ActionResult natania_changepass2_page()
        {
            ViewData["EMAIL"] = HttpContext.Session["EMAIL"].ToString();
            return View();
        }

        public ActionResult natania_verify_page()
        {
            return View();
        }

        public ActionResult natania_landing_page()
        {
            ViewData["FIRST_NAME"] = HttpContext.Session["FIRST_NAME"].ToString();
            ViewData["LAST_NAME"] = HttpContext.Session["LAST_NAME"].ToString();
            ViewData["EMAIL"] = HttpContext.Session["EMAIL"].ToString();
            return View();
        }
        public ActionResult natania_profile_page()
        {
            ViewData["FIRST_NAME"] = HttpContext.Session["FIRST_NAME"].ToString();
            ViewData["LAST_NAME"] = HttpContext.Session["LAST_NAME"].ToString();
            ViewData["EMAIL"] = HttpContext.Session["EMAIL"].ToString();
            ViewData["PHASE"] = HttpContext.Session["PHASE"].ToString();
            ViewData["LOT"] = HttpContext.Session["LOT"].ToString();
            ViewData["BLOCK"] = HttpContext.Session["BLOCK"].ToString();
            ViewData["STREET"] = HttpContext.Session["STREET"].ToString();
            ViewData["BARANGAY"] = HttpContext.Session["BARANGAY"].ToString();
            ViewData["CITY"] = HttpContext.Session["CITY"].ToString();
            ViewData["COUNTRY"] = HttpContext.Session["COUNTRY"].ToString();
            return View();
        }
        public ActionResult natania_personal_information_page()
        {
            ViewData["ACC_ID"] = HttpContext.Session["ACC_ID"].ToString();
            ViewData["FIRST_NAME"] = HttpContext.Session["FIRST_NAME"].ToString();
            ViewData["LAST_NAME"] = HttpContext.Session["LAST_NAME"].ToString();
            ViewData["MIDDLE_NAME"] = HttpContext.Session["MIDDLE_NAME"].ToString();
            ViewData["SUFFIX_NAME"] = HttpContext.Session["SUFFIX_NAME"].ToString();
            ViewData["AGE"] = HttpContext.Session["AGE"].ToString();
            ViewData["GENDER"] = HttpContext.Session["GENDER"].ToString();
            ViewData["EMAIL"] = HttpContext.Session["EMAIL"].ToString();
            ViewData["PHONE_NO"] = HttpContext.Session["phone_no"].ToString();
            return View();
        }
        public ActionResult natania_address_page()
        {
            ViewData["ACC_ID"] = HttpContext.Session["ACC_ID"].ToString();
            
            ViewData["PHASE"] = HttpContext.Session["PHASE"].ToString();
            ViewData["LOT"] = HttpContext.Session["LOT"].ToString();
            ViewData["BLOCK"] = HttpContext.Session["BLOCK"].ToString();
            ViewData["STREET"] = HttpContext.Session["STREET"].ToString();
            ViewData["BARANGAY"] = HttpContext.Session["BARANGAY"].ToString();
            ViewData["CITY"] = HttpContext.Session["CITY"].ToString();
            ViewData["PROVINCE"] = HttpContext.Session["PROVINCE"].ToString();
            ViewData["COUNTRY"] = HttpContext.Session["COUNTRY"].ToString();
            ViewData["POSTAL_CODE"] = HttpContext.Session["POSTAL_CODE"].ToString();
            return View();
        }
        public ActionResult natania_family_page()
        {
            ViewData["ACC_ID"] = HttpContext.Session["ACC_ID"].ToString();
            return View();
        }
        public ActionResult natania_pets_page()
        {
            ViewData["ACC_ID"] = HttpContext.Session["ACC_ID"].ToString();      
            return View();
        }
        public ActionResult natania_vehicle_page()
        {
            ViewData["ACC_ID"] = HttpContext.Session["ACC_ID"].ToString();
            return View();
        }
        public ActionResult natania_payment_history_page()
        {
            ViewData["ACC_ID"] = HttpContext.Session["ACC_ID"].ToString();
            return View();
        }
        public ActionResult natania_payment_dues_page()
        {
            ViewData["ACC_ID"] = HttpContext.Session["ACC_ID"].ToString();
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

        public string check_token(string email)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("check_token", new string[][]
            {
                new string[] {"email",email}
            });
            return (new Data.Convert().toJson(dt_content));
        }

        public string check_cpass_token(string email, string token)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("check_cpass_token", new string[][]
            {
                new string[] {"email",email},
                new string[] {"token",token}
            });
            return (new Data.Convert().toJson(dt_content));
        }

        public string update_password(string email, string password)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("update_password", new string[][]
            {
                new string[] {"email",email},
                new string[] {"password",password}
            });
            return (new Data.Convert().toJson(dt_content));
        }

        public string send_reset_link(string email, string token)
        {
            Connection connection = new Connection();

            
            /*string email_body = "<html>Reset your password by clicking this  " + "<a href='https://localhost:44316/Config/natania_changepass_page?token=" + token + "&email=" + email + "'>link</a></html>";*/

            string template_name = "Reset Password";
            dt_content = connection.StartSEPH("get_firstname_by_email", new string[][]{
            new string[] { "email",email }
            });
            string first_name = dt_content.Rows[0]["first_name"].ToString();

            dt_content = connection.StartSEPH("get_email_template", new string[][]{
            new string[] { "template_name",template_name }
            });
            string content = dt_content.Rows[0]["template"].ToString();

            string link = "https://localhost:44316/Config/natania_changepass_page?token=" + token + "&email=" + email;
            string[,] param = { { "@link", link },{ "@first_name" , first_name} };

            int rows = param.GetLength(0);

            for (int i = 0; i < rows; i++)
            {
                content = content.Replace(param[i, 0], param[i, 1]);
            }

            string email_subject = "Reset Password";
            new Email().Send(content, email, email_subject);

            dt_content = connection.StartSEPH("update_token", new string[][]
            {
                new string[] {"email",email},
                new string[] {"token",token}
            });

            return (new Data.Convert().toJson(dt_content));
        }


        public string compare_email(string id, string email)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("compare_email", new string[][]
            {
                new string[] {"id",id},
                new string[] {"email",email}
            });
            return (new Data.Convert().toJson(dt_content));
        }

        public string add_account(string first_name, string last_name, string email, string password, string token)
        {

            string email_subject = "Verify Email";
            string template_name = email_subject;
            string link = "https://localhost:44316/Config/natania_verify_page?token=" + token + "&email=" + email;

            Connection connection = new Connection();

            dt_content = connection.StartSEPH("get_email_template", new string[][]{
            new string[] { "template_name",template_name }
            });

            string content = dt_content.Rows[0]["template"].ToString();

            dt_content = connection.StartSEPH("add_account", new string[][]
            {
                new string[] {"first_name",  first_name},
                new string[] {"last_name",  last_name},
                new string[] {"email", email},
                new string[] {"password", password},
                new string[] {"token", token}
            });

            string[,] param = { { "@link", link }, { "@first_name", first_name } };

            int rows = param.GetLength(0);

            for (int i = 0; i < rows; i++)
            {
                content = content.Replace(param[i, 0], param[i, 1]);
            }

            
            new Email().Send(content, email, email_subject);

            return (new Data.Convert().toJson(dt_content));
        }

        public string verify_token(string email, string token)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("verify_email", new string[][]
            {
                new string[] {"email",email},
                new string[] {"token",  token}
            });
            return (new Data.Convert().toJson(dt_content));
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

        public string get_details(string acc_id)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("get_details", new string[][]
            {
                new string[] {"acc_id",  acc_id}
            });

            if (dt_content.Rows.Count > 0)
            {
                HttpContext.Session["ACC_ID"] = Convert.ToString(dt_content.Rows[0]["account_id"]);
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

        public string update_details(string account_id, string first_name, string last_name, string middle_name, string suffix_name, string email, 
            string age, string gender, string phone_no)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("update_details", new string[][]
            {
                new string[]{"account_id", account_id},
                new string[]{"first_name", first_name},
                new string[]{"last_name", last_name},
                new string[]{"middle_name", middle_name},
                new string[]{"suffix_name", suffix_name},
                new string[]{"email", email},
                new string[]{"age", age},
                new string[]{"gender", gender},
                new string[]{"phone_no", phone_no}
            });
            return (new Data.Convert().toJson(dt_content));
        }

        public string update_address(string acc_id, string phase, string lot, string block, string street, string barangay, string city, string province, string country, string postal_code)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("update_address", new string[][]
            {
                new string[]{"acc_id", acc_id},
                new string[]{"phase", phase},
                new string[]{"lot", lot},
                new string[]{"block", block},
                new string[]{"street", street},
                new string[]{"barangay", barangay},
                new string[]{"city", city},
                new string[]{"province", province},
                new string[]{"country", country },
                new string[]{"postal_code", postal_code}
            });
            return (new Data.Convert().toJson(dt_content));

        }
        public string add_family_member(string owner_id, string first_name, string last_name, string middle_name, string suffix_name, string age, string gender)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("add_family_member", new string[][]
            {
                new string[] {"owner_id", owner_id},
                new string[]{ "first_name", first_name},
                new string[]{ "last_name", last_name },
                new string[]{ "middle_name", middle_name },
                new string[]{ "suffix_name", suffix_name },
                new string[]{ "age", age },
                new string[]{ "gender", gender },
            });
            return (new Data.Convert().toJson(dt_content));
        }

        public string display_family_member(string owner_id)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("display_family_member", new string[][]
            {
                new string[] {"owner_id", owner_id}
            });
            return (new Data.Convert().toJson(dt_content));
        }


        //ADD PET
        public string add_pet(string owner_id, string name, string type, string breed, string gender, string is_vaccinated)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("add_pet", new string[][]
            {
                new string[] {"owner_id", owner_id},
                new string[] {"name", name},
                new string[] {"type", type},
                new string[] {"breed", breed},
                new string[] {"gender", gender},
                new string[] {"is_vaccinated", is_vaccinated}
            });
            return (new Data.Convert().toJson(dt_content));
        }

        //DISPLAY PETS
        public string display_pets(string owner_id)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("display_pets", new string[][]
            {
                new string[] {"owner_id", owner_id}
            });
            return (new Data.Convert().toJson(dt_content));
        }

        //Vehicle
        //CREATE
        public string register_vehicle(string owner_id, string type, string brand, string model, string plate_number)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("register_vehicle", new string[][]
            {
                new string[] {"owner_id", owner_id},
                new string[]{"type", type},
                new string[]{"brand", brand},
                new string[]{"model", model},
                new string[]{"plate_number", plate_number}
            });
            return (new Data.Convert().toJson(dt_content));
        }
        public string display_vehicle(string owner_id)
        {
            Connection connection = new Connection();

            dt_content = connection.StartSEPH("display_vehicle", new string[][]
            {
                new string[] {"owner_id", owner_id}
            });
            return (new Data.Convert().toJson(dt_content));
        }

        public string display_payment_history(string owner_id)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("display_payment_history", new string[][]
            {
                new string[] {"owner_id", owner_id}
            });
            return (new Data.Convert().toJson(dt_content));
        }
        public string display_payment_dues(string owner_id)
        {
            Connection connection = new Connection();
            dt_content = connection.StartSEPH("display_dues", new string[][]
            {
                new string[] {"owner_id", owner_id}
            });
            return (new Data.Convert().toJson(dt_content));
        }

        public string save_pet_pic(string temp, string id, string name)
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
                    Directory.CreateDirectory(Server.MapPath("~/Upload/PetPicture/"));
                    string patxh = Path.Combine(Server.MapPath("~/Upload/PetPicture/"), image);

                    // save the file
                    file.SaveAs(patxh);
                    string imgpath = "/Upload/PetPicture/" + image;
                    dt_content = connection.StartSEPH("save_pet_pic", new string[][]
                    {
                        new string[] {"owner_id", id},
                        new string[] {"name", name},
                        new string[] {"imgpath", imgpath}
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

        public string save_orcr(string temp, string acc_id, string v_id)
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
                        new string[] {"owner_id", acc_id},
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