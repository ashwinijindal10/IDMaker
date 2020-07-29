using Ionic.Zip;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class exportSchoolProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DownImg();
        }
        protected void DownImg()
        {
            string schilID = Request.QueryString["Supp_SchoolID"];
            // string SourceFolderPath = System.IO.Path.Combine("E:\\Project\\Fab-March15\\Online Id Card generater\\Code\\WebApplication1\\WebApplication1\\Img\\A1");
            string SourceFolderPath = string.Empty;
            if (schilID == "0")
                SourceFolderPath = System.IO.Path.Combine(Server.MapPath("~/Img"));
            else
                SourceFolderPath = System.IO.Path.Combine(Server.MapPath("~/Img/" + schilID));


            Response.Clear();
            Response.ContentType = "application/zip";
            Response.AddHeader("Content-Disposition", String.Format("attachment; filename={0}", schilID + ".zip"));

            bool recurseDirectories = true;
            using (ZipFile zip = new ZipFile())
            {
                zip.AddSelectedFiles("*", SourceFolderPath, string.Empty, recurseDirectories);
                zip.Save(Response.OutputStream);
            }
            Response.End();
        }
    }
}