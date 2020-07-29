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
    public partial class SchoolProfileSetting : System.Web.UI.Page
    {
        string logo = null;
        string sign = null;
        int isAvelabal = 0;
        SchoolRagistration objreg = new SchoolRagistration();
        PR_SchoolProfile oScProf = new PR_SchoolProfile();
        PR_SchoolFild oSCFild = new PR_SchoolFild();
        clsStudentDetail objStdDetail = new clsStudentDetail();
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
            var objData = objreg.GetSchoolProfile(id);
            isAvelabal = objData.Count();
            if (objData.Count() != 0)
            {

                txtSchoolName.Text = objData.Select(a => a.SchoolName).FirstOrDefault().ToString();
                txtPrincepalName.Text = objData.Select(a => a.PrincipalName).FirstOrDefault().ToString();
                txtDirectorName.Text = objData.Select(a => a.DiectorName).FirstOrDefault().ToString();
                txtAddress.Text = objData.Select(a => a.Address).FirstOrDefault().ToString();
                txtVillage.Text = objData.Select(a => a.Village).FirstOrDefault().ToString();
                txtTehsil.Text = objData.Select(a => a.Tehsil).FirstOrDefault().ToString();
                txtDistrict.Text = objData.Select(a => a.District).FirstOrDefault().ToString();
                txtState.Text = objData.Select(a => a.State).FirstOrDefault().ToString();
                txtPIN.Text = objData.Select(a => a.PIN).FirstOrDefault().ToString();
                txtphno1.Text = objData.Select(a => a.Phno1).FirstOrDefault().ToString();
                txtphno2.Text = objData.Select(a => a.Phno2).FirstOrDefault().ToString();
                txtlandlone1.Text = objData.Select(a => a.LandLine1).FirstOrDefault().ToString();
                txtlandlone2.Text = objData.Select(a => a.LandLine2).FirstOrDefault().ToString();

                imglogo.Visible = true;
                imglogo.ImageUrl = objData.Select(a => a.SchoolLogo).FirstOrDefault().ToString();

                txtSchoolWebSite.Text = objData.Select(a => a.SchoolWebSite).FirstOrDefault().ToString();
                txtEmail.Text = objData.Select(a => a.Emailid).FirstOrDefault().ToString();
                txtSchoolEstablish.Text = objData.Select(a => a.SchoolEstb).FirstOrDefault().ToString();

                imgAuthSign.Visible = true;
                imgAuthSign.ImageUrl = objData.Select(a => a.AuthSign).FirstOrDefault().ToString();

                getandUpdateFildtoChk(id);
            }
           if(string.IsNullOrEmpty(txtEmail.Text))
           {
                var objDatal = objreg.GetWholeSecRegDetail().Where(x => x.Id == id);
                if (objDatal.Count() != 0)
                {

                    txtEmail.Text = objDatal.Select(a => a.Email).FirstOrDefault().ToString();
                    txtphno1.Text = objDatal.Select(a => a.Phno).FirstOrDefault().ToString();
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
            var objData = objreg.GetSchoolProfile(id);
            isAvelabal = objData.Count();
            try
            {
                oScProf.id = txtUserID.Text; ;
                oScProf.SchoolName = txtSchoolName.Text;
                oScProf.PrincipalName = txtPrincepalName.Text;
                oScProf.DiectorName = txtDirectorName.Text;
                oScProf.Address = txtAddress.Text;
                oScProf.Village = txtVillage.Text;
                oScProf.Tehsil = txtTehsil.Text;
                oScProf.District = txtDistrict.Text;
                oScProf.State = txtState.Text;
                oScProf.PIN = Convert.ToInt32(txtPIN.Text);
                oScProf.Phno1 = txtphno1.Text;
                oScProf.Phno2 = txtphno2.Text;
                oScProf.LandLine1 = txtlandlone1.Text;
                oScProf.LandLine2 = txtlandlone2.Text;
                if (SchoolLogo.FileName != "")
                    oScProf.SchoolLogo = "Img/" + id.Trim()+ "/" + SchoolLogo.FileName;
                else
                    oScProf.SchoolLogo = imglogo.ImageUrl.ToString();
                oScProf.SchoolWebSite = txtSchoolWebSite.Text;
                oScProf.Emailid = txtEmail.Text;
                oScProf.SchoolEstb = txtSchoolEstablish.Text;
                if (AuthSign.FileName != "")
                    oScProf.AuthSign = "Img/" + id.Trim() + "/" + AuthSign.FileName;
                else
                    oScProf.AuthSign = imgAuthSign.ImageUrl.ToString();
                oScProf.F1 = null;
                oScProf.F2 = null;
                oScProf.F3 = null;
                oScProf.F4 = null;
                oScProf.IsActive = 1;



                string directoryPath = Server.MapPath(string.Format("~/Img/{0}/", id.Trim()));
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }
                //Save img
                if (SchoolLogo.FileName != "")
                    SchoolLogo.PostedFile.SaveAs(Request.PhysicalApplicationPath + @"Img\" + id.Trim() +"\\" +SchoolLogo.FileName);
                if (AuthSign.FileName != "")
                    AuthSign.PostedFile.SaveAs(Request.PhysicalApplicationPath + @"Img\" + id.Trim() + "\\" + AuthSign.FileName);



                if (isAvelabal == 0)
                {
                    insertSchoolFild(id);  //Insert School Id Card Fild 
                    int returncode = objreg.InsertSchoolProfile(oScProf);
                    if (returncode == 0)
                    {

                        divsucrss.Style.Add("display", "none");
                        divUnsucrss.Style.Remove("display");
                        ltrNotSucess.Text = "There are some error contact to admin !!";
                    }
                    else
                    {

                        ltrSucess.Text = "Data Uploaded Sucess  ";
                    }
                }
                else
                {
                    UpdateSchoolFild(id);  //Insert School Id Card Fild 
                    int returncode = objreg.UpdateSchoolProfile(oScProf);
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
                        ltrSucess.Text = "Data Updated Sucess  ";
                    }
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