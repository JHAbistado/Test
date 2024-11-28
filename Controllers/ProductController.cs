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
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult addProduct()
        {
            return View();
        }
        public ActionResult viewProduct()
        {
            return View();
        }

        public dynamic addProductCategoryAPI(string api_pc_name, string api_pc_description)
        {
            Connection connection = new Connection();
            DataTable addProductCategory = connection.StartSEPH("sqlAddProductCategory", new string[][]
            {
                new string[] { "sql_pc_name", api_pc_name },
                new string[] { "sql_pc_description", api_pc_description }
            });

            return new Data.Convert().toJson(addProductCategory);
        }

        public dynamic addProductSubCategoryAPI(string api_pc_id, string api_psc_name, string api_psc_description)
        {
            Connection connection = new Connection();
            DataTable addProductSubCategory = connection.StartSEPH("sqlAddProductSubCategory", new string[][]
            {
                new string[] { "sql_pc_id", api_pc_id  },
                new string[] { "sql_psc_name", api_psc_name  },
                new string[] { "sql_psc_description", api_psc_description  }
            });

            return new Data.Convert().toJson(addProductSubCategory);
        }

        public dynamic addProductAPI(string api_prod_sub_cat_id, string api_prod_name, string api_prod_description)
        {
            Connection connection = new Connection();
            DataTable addProduct = connection.StartSEPH("sqlAddProduct", new string[][]
            {
                new string[] { "sql_psc_id", api_prod_sub_cat_id  },
                new string[] { "sql_p_name", api_prod_name  },
                new string[] { "sql_p_description", api_prod_description }
            });

            return new Data.Convert().toJson(addProduct);
        }

        public dynamic getProductAPI()
        {
            Connection connection = new Connection();
            DataTable getProduct = connection.StartSEPH("sqlGetProduct", new string[][]
            {

            });

            return new Data.Convert().toJson(getProduct);
        }

        public dynamic getProductCategoryAPI()
        {
            Connection connection = new Connection();
            DataTable getProductCategory = connection.StartSEPH("sqlGetProductCategory", new string[][]
            {

            });

            return new Data.Convert().toJson(getProductCategory);
        }
        public dynamic getProductSubCategoryAPI()
        {
            Connection connection = new Connection();
            DataTable getProductSubCategory = connection.StartSEPH("sqlGetProductSubCategory", new string[][]
            {

            });

            return new Data.Convert().toJson(getProductSubCategory);
        }
    }
}