using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace MHD.FetchConfig
{
    public class Email
    {
        
        public DataTable dt_content { get; set; }

        public void Send(string content, string email, string subject) {
            

            using (MailMessage mail = new MailMessage())
            {
                SmtpClient smtpClient = new SmtpClient("smtp-mail.outlook.com", 587); //587
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new System.Net.NetworkCredential("natania.app@outlook.com", "NatApp2024*");

                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.EnableSsl = true;

                mail.From = new MailAddress("natania.app@outlook.com");
                mail.IsBodyHtml = true;
                mail.Body = content;
                mail.Subject = subject;
                mail.To.Add(new MailAddress(email));
                smtpClient.Send(mail);
            }
        }

    }
}
