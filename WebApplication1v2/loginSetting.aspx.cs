using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace WebApplication1
{
    public partial class loginSetting : System.Web.UI.Page
    {
        string logo = null;
        string sign = null;
        int isAvelabal = 0;
        SchoolRagistration objreg = new SchoolRagistration();
        PR_SchoolRegistration oScProf = new PR_SchoolRegistration();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    txtUserID.Text = Session["SchoolId"].ToString();
                    LoadData();
                }
                catch
                {
                   // Response.Redirect("Default.aspx");
                }

            }
        }
        protected void LoadData()
        {

            string id = Session["SchoolId"].ToString();
            var objData = objreg.GetWholeSecRegDetail().Where(a => a.Id == id).ToList();
            isAvelabal = objData.Count();
            if (objData.Count() != 0)
            {

                txtSchoolName.Text = objData.Select(a => a.ScholName).FirstOrDefault().ToString();                 
                txtPassword.Text = objData.Select(a => a.Pwd).FirstOrDefault().ToString();                
                txtphno1.Text = objData.Select(a => a.Phno).FirstOrDefault().ToString();
                txtEmail.Text = objData.Select(a => a.Email).FirstOrDefault().ToString();
                
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InsertOrUpdateProfile();

        }
        protected void InsertOrUpdateProfile()
        {
            string id = Session["SchoolId"].ToString();
            var objData = objreg.GetWholeSecRegDetail().Where(a => a.Id == id).ToList();
            isAvelabal = objData.Count();
            try
            {
                oScProf.Id = txtUserID.Text;
                oScProf.Pwd = txtPassword.Text;
                oScProf.ScholName = txtSchoolName.Text;
                oScProf.Phno = txtphno1.Text;
                oScProf.Email = txtEmail.Text; 
                oScProf.F1 = null;
                oScProf.F2 = null;
                oScProf.F3 = null;
                oScProf.F4 = null;
                oScProf.IsActive = 1;
                 
                    int returncode = objreg.UpdateRagistration(oScProf);
                    if (returncode == 0)
                    {

                        divsucrss.Style.Add("display", "none");
                        divUnsucrss.Style.Remove("display");
                        ltrNotSucess.Text = "There are some error contact to admin !!";
                    }
                    else
                    {
                        divUnsucrss.Style.Add("display", "none");
                        divsucrss.Style.Remove("display");
                        ltrSucess.Text = "Data Uploaded Sucess  ";
                    }
                
                LoadData();
            }
            catch (Exception e)
            {
                divsucrss.Style.Add("display", "none");
                divUnsucrss.Style.Remove("display");
                ltrNotSucess.Text = e.Message + "     There are some error contact to admin !!";
                return;
            }



        }
    }
}