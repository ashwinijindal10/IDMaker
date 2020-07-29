using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;


namespace WebApplication1
{
    public partial class Home : System.Web.UI.Page
    {
        SchoolRagistration objScReg = new SchoolRagistration();
        PR_SchoolRegistration precReg = new PR_SchoolRegistration();
        clsMsg clsMessage = new clsMsg();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Bind();
                rpt();
            }
            catch
            { //Response.Redirect("Default.aspx");
            }
        }

        private void Bind()
        {
            try
            {
                string SchoolID = Session["SchoolId"].ToString();
                var data = objScReg.GetSchoolProfile(SchoolID);

                ltrDeshBord.Text = data.Select(a => a.SchoolName).FirstOrDefault().ToString();
            }
            catch { }
        }



        private void rpt()
        { 
            string SchoolID = Session["SchoolId"].ToString();
            var data = clsMessage.Gettopmessage(SchoolID);
            rpt111.DataSource = data;
            rpt111.DataBind();

        }
    }
}