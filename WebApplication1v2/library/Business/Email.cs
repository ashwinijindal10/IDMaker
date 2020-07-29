using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Data.SqlClient;

namespace Business
{
    public class Email
    {
        public int sendEmail(string Subject,string msgbody,string SendTo)
        {
            
            //string path = "D:\\Test.txt";
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(SendTo);
                mail.From = new MailAddress("damodarsharma90@gmail.com");
                mail.Subject = Subject;
                mail.Body = msgbody;
                //  Attachment at = new Attachment("D:\\Text.txt");
                //  mail.Attachments.Add(at);

                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient("localhost", 25);
                smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address  
                smtp.Credentials = new System.Net.NetworkCredential
                     ("damodarsharma90@gmail.com", "Damodar@12311");
                //Or your Smtp Email ID and Password  
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = true;

                smtp.Send(mail);
                return 1;
            }
            catch 
            {
                return 0;
            }
        }
    }
}
