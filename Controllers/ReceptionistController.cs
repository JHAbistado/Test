﻿using MHD.FetchConfig;
using MHD.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MHD.Controllers
{
    public class ReceptionistController : Controller
    {
        public DataTable dt_content { get; set; }

        // GET: Receptionist
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public string DisposeTeam(string teamid) {
            Connection connection = new Connection();
            dt_content = connection.Start("SP_DISPOSE_TEAM", new string[][]{
              new string[]{ "TEAMID",       teamid  }
            , new string[]{ "EXECUTOR",     "19"    }
            });
            return (new Data.Convert().toJson(dt_content));
        }

        [HttpPost]
        public string CreateTeam(String teamname, String teamdesc) {
            Connection connection = new Connection();
            dt_content = connection.Start("SP_ADD_NEWTEAM", new string[][] {
              new string[]{ "TEAMNAME",     teamname }
            , new string[]{ "CREATOR",      "1"      }
            , new string[]{ "DESC",         teamdesc }
            });
            return (new Data.Convert().toJson(dt_content));               
        }

        [HttpPost]
        public string UpdateTeam(String teamid, String newteamname, String newteamdesc) {
            Connection connection = new Connection();
            dt_content = connection.Start("SP_UPDATE_TEAMDASHERS", new string[][] {
              new string[] { "TEAMID",      teamid      }
            , new string[] { "UPDATOR",     "19"        }
            , new string[] { "NEWTEAMNAME", newteamname }
            , new string[] { "NEWTEAMDESC", newteamdesc }
            });
            string results = (new Data.Convert().toJson(dt_content));
            return results;
        }

        [HttpGet]
        public ActionResult GetContent() {
            Connection connection = new Connection();
            dt_content = connection.Start("SP_GET_TEAMDASHER", new string[][] { });
            string contents = (new Data.Convert().toJson(dt_content));
            TeamsModel model = new TeamsModel();
            foreach (DataRow row in dt_content.Rows)
            {
                Teams teams =               new Teams();
                teams.team_id =             Convert.ToInt32(row["RTD_TEAMID"]);
                teams.team_name =           Server.HtmlEncode(Convert.ToString(row["RTD_TEAMNAME"]));
                teams.team_creator =        Server.HtmlEncode(Convert.ToString(row["NAME"]));
                teams.team_description =    Convert.ToString(row["RTD_DESC"]);
                teams.date_created =        Server.HtmlEncode(Convert.ToString(row["RTD_DATECREATED"]));
                teams.date_updated =        Server.HtmlEncode(Convert.ToString(row["RTD_DATEUPDATED"]));
                model.Teams.Add(teams);
            }
            return View(model);
        }

        public ActionResult GetMHD()
        {
            return View();

        }

        [HttpGet]
        public ActionResult Packages(String teamid) {
            if (teamid != null)
            {
                PackagesModel model = new PackagesModel();
                if (teamid != null)
                {
                    Connection connection = new Connection();
                    dt_content = connection.Start("SP_GET_TEAMRATES", new string[][] { new string[] {
                        "TEAMID", teamid} 
                    });
                    string contents = (new Data.Convert().toJson(dt_content));
                    foreach (DataRow row in dt_content.Rows)
                    {
                        Packages packages = new Packages();
                        packages.rate_id = Convert.ToInt32(row["RTR_RATEID"]);
                        packages.package_name = Server.HtmlEncode(Convert.ToString(row["RTR_PACKAGENAME"]));
                        packages.package_price = Server.HtmlEncode(Convert.ToString(row["RTR_PRICE"]));
                        packages.package_description = Convert.ToString(row["RTR_DESCRIPTION"]);
                        packages.package_maxtime = Convert.ToString(row["RTR_MAXTIME"]);
                        packages.date_modified = Server.HtmlEncode(Convert.ToString(row["RTR_DATEUPDATED"]));
                        packages.date_added = Server.HtmlEncode(Convert.ToString(row["RTR_DATEADDED"]));
                        model.Packages.Add(packages);
                    }
                }
                return View(model);
            }
            else return View();
        }

        [HttpPost]
        public string NewPackage(string packagename, string packagedesc, string packageprice, string packagemaxtime
            , string teamid) {

            Connection connection = new Connection();
            dt_content = connection.Start("SP_ADD_NEWRATEPACKAGE", new string[][] {
              new string[]{ "PACKAGENAME" ,     packagename         }
            , new string[]{ "PRICE" ,           packageprice        }
            , new string[]{ "DESCRIPTION" ,     packagedesc         }
            , new string[]{ "MAXTIME" ,         packagemaxtime      }
            , new string[]{ "TEAMID" ,          teamid              }
            , new string[]{ "CREATOR" ,         "19"                }       
            });
            string results = (new Data.Convert().toJson(dt_content));
            return (results);

        }

        [HttpPost]
        public string UpdatePackage(String packageid, String new_package_name, String new_package_price
            , String new_package_description , String new_max_time) {
            Connection connection = new Connection();
            dt_content = connection.Start("SP_UPDATE_PACKAGES", new string[][] {
              new string[]{ "RATEID",       packageid }
            , new string[]{ "PACKAGENAME",  new_package_name        }
            , new string[]{ "PRICE",        new_package_price       }
            , new string[]{ "DESCRIPTION",  new_package_description }
            , new string[]{ "MAXTIME",      new_max_time            }
            , new string[]{ "CREATOR",      "19"                    }
            });
            string results = (new Data.Convert().toJson(dt_content));
            return results;
        }

        [HttpPost]
        public string DisposePackage(string packageid) {
            Connection connection = new Connection();
            dt_content = connection.Start("SP_DISPOSE_PACKAGE", new string[][] {
             new string[]{"PACKAGEID",        packageid}    
            });
            string results = (new Data.Convert().toJson(dt_content));
            return results;
        }

        [HttpGet]
        public ActionResult Dashers(string teamid) {
            if (teamid != null)
            {
                Connection connection = new Connection();
                dt_content = connection.Start("SP_GET_DASHERINFO", new string[][] {
                new string[] { "TEAMID", teamid }
            });
                string contents = (new Data.Convert().toJson(dt_content));
                DashersModel model = new DashersModel();
                foreach (DataRow row in dt_content.Rows)
                {
                    Dashers dashers = new Dashers();
                    dashers.dasher_id = Convert.ToInt32(row["RDI_DASHERID"]);
                    dashers.dasher_name = Server.HtmlEncode(Convert.ToString(row["NAME"]));
                    dashers.dasher_number = Server.HtmlEncode(Convert.ToString(row["RDI_PNUMB"]));
                    dashers.dasher_screened = Convert.ToString(row["RDI_SCREENED"]);
                    dashers.dasher_datescreened = Server.HtmlEncode(Convert.ToString(row["RDI_DATESCREENED"]));
                    dashers.dasher_dateadded = Server.HtmlEncode(Convert.ToString(row["RDI_DATEADDED"]));
                    dashers.dasher_car_details = Server.HtmlEncode(Convert.ToString(row["RDI_CARDETAILS"]));
                    model.Dashers.Add(dashers);
                }
                return View(model);
            }
            else return View();
        }

    }
}