using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using System.IO;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        PR_SchoolRegistration objSchoolData = new PR_SchoolRegistration();
        SchoolRagistration objSchReg = new SchoolRagistration();
        string UID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["SchoolId"] = "";
        }
        protected void SignUp()
        {
            objSchoolData.Email = txtEmailSignUP.Text;
            var chkEmail =   objSchReg.GetWholeSecRegDetail().Where(x => x.Email == txtEmailSignUP.Text).ToList();

            if (chkEmail.Count > 0)
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Email ID already registered');", true);
            else
            {
                objSchoolData.Email = txtEmailSignUP.Text;
                objSchoolData.Id = txtUserNameSignUP.Text;
                objSchoolData.Pwd = txtPwdSignUP.Text;
                objSchoolData.ScholName = txtSchoolNameSignUP.Text;
                objSchoolData.Phno = txtPhnoSignUP.Text;
                objSchoolData.F1 = null;
                objSchoolData.F2 = null;
                objSchoolData.F3 = null;
                objSchoolData.F4 = null;
                objSchoolData.IsActive = 1;
                string returncode = objSchReg.InsertRagistration(objSchoolData);
                if (returncode == "1")
                {
                    Session["SchoolId"] = txtUserNameSignUP.Text;
                    Session.Timeout = 36000;

                    string SchoolID = Session["SchoolId"].ToString();
                    string directoryPath = Server.MapPath(string.Format("~/StdPhoto/{0}/", SchoolID.Trim()));
                    if (!Directory.Exists(directoryPath))
                    {
                        Directory.CreateDirectory(directoryPath);
                    }
                    insertSchoolFild(txtUserNameSignUP.Text);

                    Response.Redirect("Home.aspx");
                }
                else
                {

                    divsucrss.Style.Add("display", "none");
                    divUnsucrss.Style.Remove("display");
                    ltrNotSucess.Text = "User ID already available try again by different ID";
                }
            }

        }
        protected void Login()
        {
            if (txtUsername.Text == "")
            {
                Response.Write("<script>alert(' Enter Username ID ?? ')</script>");
                txtUsername.Focus();
                return;
            }
            if (txtpassword.Text == "")
            {
                Response.Write("<script>alert(' Enter  Password ?? ')</script>");
                txtpassword.Focus();
                return;
            }
            try
            {

                int returncode = objSchReg.LoginAuth(txtUsername.Text, txtpassword.Text);
                if (returncode == 1)
                {
                    Session["SchoolId"] = txtUsername.Text;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    txtUsername.Text = "";
                    txtpassword.Text = "";
                    txtUsername.Focus(); 
                    divsucrss.Style.Add("display", "none");
                    divUnsucrss.Style.Remove("display");
                    ltrNotSucess.Text =  "Id or Password missmatch" ;
                    Response.Write("<script>alert(' Id or Password missmatch !! ')</script>");

                }
            }
            catch
            {
                divsucrss.Style.Add("display", "none");
                divUnsucrss.Style.Remove("display");
                ltrNotSucess.Text = "Some thing problam contact to admin ???..." ;  
            }
        }
        protected void ForgetPass()
        {
            if (txtForgetEmail.Text == "")
            {
                Response.Write("<script>alert(' Enter Email ID ?? ')</script>");
                txtForgetEmail.Focus();
                return;
            }
            var data=objSchReg.ForgetPassword(txtForgetEmail.Text).ToList();
            if (data.Count == 0)
            {
                divsucrss.Style.Add("display", "none");
                divUnsucrss.Style.Remove("display");
                ltrNotSucess.Text = "Enter Valid Email ID ?? ";  
                txtForgetEmail.Focus();
                return;
            }
            string subject="Password Recovery";
            string Msg = "Your id = " + data.Select(a => a.Id).FirstOrDefault().ToString() + "   and Password = " + data.Select(a => a.Pwd).FirstOrDefault().ToString() + "";
            string SendTo = txtForgetEmail.Text;
            Email objEmail = new Email();
            objEmail.sendEmail(subject,Msg,SendTo);
        
        }

        protected void txtbtnLoginSubmit_Click(object sender, EventArgs e)
        {
            Login();
        }

        protected void btnForgetPassword_Click(object sender, EventArgs e)
        {
            ForgetPass();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            SignUp();
        }

        private string insertSchoolFild(string schoolID)
        {
            PR_SchoolFild oSCFild = new PR_SchoolFild();
            clsStudentDetail objStdDetail = new clsStudentDetail();

            oSCFild.MyIdFild = FildData();
            oSCFild.SchoolID = schoolID;
            oSCFild.lasUpdatedTime = DateTime.Now;
            string returncode = objStdDetail.InsertSchoolFild(oSCFild);
            return returncode;
        }
        private string FildData()
        {
            string Fild = string.Empty;            
                Fild += "[ScholarNo],";            
                Fild += "[StudentName],";            
                Fild += "[Class],";            
                Fild += "[StudentPhoto],";           
                Fild += "[Status]";
            return Fild;
        }
    }
}