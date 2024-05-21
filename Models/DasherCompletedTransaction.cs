using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MHD.Models
{

    public class DasherCompletedTransaction
    {
        public string request_id { get; set; }
        public string name { get; set; }
        public string tcr_modeoftransfer { get; set; }
        public string tcr_rate { get; set; }
        public string package { get; set; }
        public string date_to_transact { get; set; }
        public string actual_cost { get; set; }
        public string delivery_address { get; set; }
        public string last_item_bought { get; set; }
        public string customer_received_datetime { get; set; }
    }

    public class DasherCompletedTransactionModel
    {
        public DasherCompletedTransactionModel()
        {
            DasherCompletedTransaction = new List<DasherCompletedTransaction>();
            dasherCompletedTransaction = new DasherCompletedTransaction();
        }
        public List<DasherCompletedTransaction> DasherCompletedTransaction { get; set; }
        public DasherCompletedTransaction dasherCompletedTransaction { get; set; }
    }
}