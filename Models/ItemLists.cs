using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{
    public class ItemLists
    {
        public string item_id { get; set; }
        public string item_name { get; set; }
        public string storename { get; set; }
        public string description { get; set; }
        public string item_quantity { get; set; }
        public string actual_item_quantity { get; set; }
        public string item_expected_amount { get; set; }
        public string item_bought { get; set; }
        public string payment_method { get; set; }
        public string actual_payment_method { get; set; }
        public string item_timestamp { get; set; }
        public string customer_remakrs { get; set; }
        public string dasher_remakrs { get; set; }
        public string actual_price { get; set; }
        public string purchase_status { get; set; }
    }

    public class ItemListsModel
    {
        public ItemListsModel()
        {
            ItemLists = new List<ItemLists>();
            itemLists = new ItemLists();
        }
        public List<ItemLists> ItemLists { get; set; }
        public ItemLists itemLists { get; set; }
    }
}