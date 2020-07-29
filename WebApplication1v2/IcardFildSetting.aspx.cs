using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using System.Data;
using System.IO;


namespace WebApplication1
{
    public partial class IcardFildSetting : System.Web.UI.Page
    {
       
        SchoolRagistration objreg = new SchoolRagistration();
        PR_SchoolFild oSCFild = new PR_SchoolFild();
        clsStudentDetail objStdDetail = new clsStudentDetail();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string scid = Session["SchoolId"].ToString();
                    getandUpdateFildtoChk(scid);
                }
                catch
                {
                    //Response.Redirect("Default.aspx");
                }

            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InsertOrUpdateProfile();

        }

        protected void InsertOrUpdateProfile()
        {
            string id = Session["SchoolId"].ToString();
            string Filds = objStdDetail.GetSchoolFild(id).Select(a => a.MyIdFild).FirstOrDefault().ToString();
             
            try
            {

                if (Filds.Count() == 0)
                {
                    insertSchoolFild(id);  //Insert School Id Card Fild                     
                }
                else
                {
                    UpdateSchoolFild(id);  //Insert School Id Card Fild                     
                }
                getandUpdateFildtoChk(id);
            }
            catch (Exception e)
            {
                divsucrss.Style.Add("display", "none");
                divUnsucrss.Style.Remove("display");
                ltrNotSucess.Text = e.Message + "     There are some error contact to admin !!";
                return;
            }
        }

        private string FildData()
        {

            string Fild = string.Empty;
            if (ScholarNo.Checked)
                Fild += "[ScholarNo],";
            if (StudentName.Checked)
                Fild += "[StudentName],";
            if (FatherName.Checked)
                Fild += "[FatherName],";
            if (MotherName.Checked)
                Fild += "[MotherName],";
            if (BloodGroup.Checked)
                Fild += "[BloodGroup],";
            if (PhoneNumber.Checked)
                Fild += "[PhoneNumber],";
            if (DateofBarth.Checked)
                Fild += "[DateofBarth],";
            if (Class.Checked)
                Fild += "[Class],";
            if (EmailId.Checked)
                Fild += "[EmailId],";
            if (Addres.Checked)
                Fild += "[Addres],";
            if (F2.Checked)
                Fild += "[F2],";
            if (F3.Checked)
                Fild += "[F3],";
            if (F4.Checked)
                Fild += "[F4],";
            if (StudentPhoto.Checked)
                Fild += "[StudentPhoto],";
            if (Status.Checked)
                Fild += "[Status]";
            return Fild;
        }

        private void insertSchoolFild(string schoolID)
        {
            PR_SchoolFild oSCFild = new PR_SchoolFild();
            clsStudentDetail objStdDetail = new clsStudentDetail();

            oSCFild.MyIdFild = FildData();
            oSCFild.SchoolID = schoolID;
            oSCFild.lasUpdatedTime = DateTime.Now;
            string returncode = objStdDetail.InsertSchoolFild(oSCFild);
            if (returncode == "1")
            {
                divUnsucrss.Style.Add("display", "none");
                divsucrss.Style.Remove("display");
                ltrSucess.Text = "Data Updated Sucess  ";

            }
            else
            {
                divsucrss.Style.Add("display", "none");
                divUnsucrss.Style.Remove("display");
                ltrNotSucess.Text = "There are some error contact to admin !!";
                return;
            }

        }
        private void UpdateSchoolFild(string schoolID)
        {

            oSCFild.MyIdFild = FildData();
            oSCFild.SchoolID = schoolID;
            oSCFild.lasUpdatedTime = DateTime.Now;
            string returncode = objStdDetail.UpdateSchoolFild(oSCFild);
            if (returncode == "1")
            {
                divUnsucrss.Style.Add("display", "none");
                divsucrss.Style.Remove("display");
                ltrSucess.Text = "Data Updated Sucess  ";

            }
            else
            {
                divsucrss.Style.Add("display", "none");
                divUnsucrss.Style.Remove("display");
                ltrNotSucess.Text = "There are some error contact to admin !!";
                return;
            }

        }

        private void getandUpdateFildtoChk(string ScholID)
        {
            try
            {
                string Filds = objStdDetail.GetSchoolFild(ScholID).Select(a => a.MyIdFild).FirstOrDefault().ToString();
                if (Filds.Count() == 0)
                    return;
                var lstFild = Filds;

                if (lstFild.Contains("[ScholarNo]"))
                    ScholarNo.Checked = true;
                if (lstFild.Contains("[StudentName]"))
                    StudentName.Checked = true;
                if (lstFild.Contains("[FatherName]"))
                    FatherName.Checked = true;
                if (lstFild.Contains("[MotherName]"))
                    MotherName.Checked = true;
                if (lstFild.Contains("[BloodGroup]"))
                    BloodGroup.Checked = true;
                if (lstFild.Contains("[PhoneNumber]"))
                    PhoneNumber.Checked = true;
                if (lstFild.Contains("[DateofBarth]"))
                    DateofBarth.Checked = true;
                if (lstFild.Contains("[Class]"))
                    Class.Checked = true;
                if (lstFild.Contains("[EmailId]"))
                    EmailId.Checked = true;
                if (lstFild.Contains("[Addres]"))
                    Addres.Checked = true;
                if (lstFild.Contains("[F2]"))
                    F2.Checked = true;
                if (lstFild.Contains("[F3]"))
                    F3.Checked = true;
                if (lstFild.Contains("[F4]"))
                    F4.Checked = true;
                if (lstFild.Contains("[StudentPhoto]"))
                    StudentPhoto.Checked = true;
                if (lstFild.Contains("[Status]"))
                    Status.Checked = true;
            }
            catch { }
        }
    }
}