using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ionic.Zip;
using System.IO;

namespace WebApplication1
{
    public partial class UploadStudentImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
        } 
        protected void Upload(object sender, EventArgs e)
        {
            try
            {
                string SchoolID = Session["SchoolId"].ToString();
                string extractPath = Server.MapPath("~/StdPhoto/" + SchoolID.Trim()+"/");
                using (ZipFile zip = ZipFile.Read(FileUpload1.PostedFile.InputStream))
                {
                    zip.ExtractAll(extractPath, ExtractExistingFileAction.OverwriteSilently);
                }
                divUnsucrss.Style.Add("display", "none");
                divsucrss.Style.Remove("display");
                ltrSucess.Text = "Data Inserted Sucess  ";
            }
            catch
            {
                divsucrss.Style.Add("display", "none");
                divUnsucrss.Style.Remove("display");
                ltrNotSucess.Text = " Not Available    !!";
                return;
            } 
        }

    }
}