using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace WebApplication1
{
    public partial class School : System.Web.UI.MasterPage
    { 
        SchoolRagistration objScReg = new SchoolRagistration();
        PR_SchoolRegistration precReg = new PR_SchoolRegistration();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    var uid = Session["SchoolId"];
                    if (uid == "" || uid == null)
                        Response.Redirect("Default.aspx");
                    Bind();
                }
                catch { Response.Redirect("Default.aspx"); }
            }
        }
        private void Bind()
        {
            try
            {
            string SchoolID = Session["SchoolId"].ToString();
            var data = objScReg.GetSchoolProfile(SchoolID);

           // imglogo.ImageUrl = data.Select(a => a.SchoolLogo).FirstOrDefault().ToString();
            //ltrNam.Text = data.Select(a => a.SchoolName).FirstOrDefault().ToString();
            Image1.ImageUrl = data.Select(a => a.SchoolLogo).FirstOrDefault().ToString();
            Literal1.Text = data.Select(a => a.SchoolName).FirstOrDefault().ToString();

              }
            catch { }
        }


    }
}