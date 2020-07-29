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
    public partial class AddStudentDetail : System.Web.UI.Page
    {
        protected string SchoolID = string.Empty;         
        StusentClass stdClassNum = new StusentClass();
        clsStudentDetail stdCls = new clsStudentDetail();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ddlClass.DataSource = stdClassNum.lstStudentClass().ToList();
                    ddlClass.DataBind();
                    SchoolID = Session["SchoolId"].ToString();
                    SchoolFild(SchoolID);
                    if (Request.QueryString["Scro_Num"] != null)
                    {
                        Session["Scro_Num_old"] = Request.QueryString["Scro_Num"];
                        LoadData(Convert.ToString(Session["Scro_Num_old"].ToString()));
                    }
                }
                catch
                {
                   // Response.Redirect("Default.aspx");
                }

            }
        }

        protected void SchoolFild(string SchoolID)
        {
            try
            {
                string Filds = stdCls.GetSchoolFild(SchoolID).Select(x => x.MyIdFild).FirstOrDefault().ToString();

                if (Filds.Count() != 0)
                {
                    var lstFild = Filds;
                    if (lstFild.Contains("[ScholarNo]"))
                        dtxtScholarNo.Style.Remove("display");
                    if (lstFild.Contains("[StudentName]"))
                        txtstdName.Style.Remove("display");
                    if (lstFild.Contains("[FatherName]"))
                        dtxtFName.Style.Remove("display");
                    if (lstFild.Contains("[MotherName]"))
                        dtxtMName.Style.Remove("display");
                    if (lstFild.Contains("[BloodGroup]"))
                        dtxtBloodGroup.Style.Remove("display");
                    if (lstFild.Contains("[PhoneNumber]"))
                        dtxtPhno.Style.Remove("display");
                    if (lstFild.Contains("[DateofBarth]"))
                        dtxtDOB.Style.Remove("display");
                    if (lstFild.Contains("[Class]"))
                        dddlClass.Style.Remove("display");
                    if (lstFild.Contains("[EmailId]"))
                        dtxtEmail.Style.Remove("display");
                    if (lstFild.Contains("[Addres]"))
                        dtxtAddress.Style.Remove("display");

                    if (lstFild.Contains("[F2]"))
                        dtxtOther1.Style.Remove("display");
                    if (lstFild.Contains("[F3]"))
                        dtxtOther2.Style.Remove("display");
                    if (lstFild.Contains("[F4]"))
                        dtxtOther3.Style.Remove("display");

                    //if (lstFild.Contains("[StudentPhoto]"))
                    //    dtxtStudentPhoto.Style.Remove("display");
                    //if (lstFild.Contains("[Status]"))
                    //    dtxtStatus.Style.Remove("display");
                }
            }
            catch { }

        }
        protected void LoadData(string SchrolID)
        {
            string Schoolid = Session["SchoolId"].ToString();
            SchoolFild(Schoolid);
            try
            {
                
                var stdData = stdCls.GetStudentDetail(Schoolid, SchrolID);
                txtScholarNo.Text = stdData.Select(a => a.ScholarNo).FirstOrDefault().ToString();
                txtstdName.Text = stdData.Select(a => a.StudentName).FirstOrDefault().ToString();
                txtFName.Text = stdData.Select(a => a.FatherName).FirstOrDefault().ToString();
                txtMName.Text = stdData.Select(a => a.MotherName).FirstOrDefault().ToString();
                txtBloodGroup.Text = stdData.Select(a => a.BloodGroup).FirstOrDefault().ToString();
                txtDOB.Text = stdData.Select(a => a.DateofBarth).FirstOrDefault().ToString();
                txtEmail.Text = stdData.Select(a => a.EmailId).FirstOrDefault().ToString();
                txtPhno.Text = stdData.Select(a => a.PhoneNumber).FirstOrDefault().ToString();
                txtAddress.Text = stdData.Select(a => a.Addres).FirstOrDefault().ToString();
                ddlClass.SelectedItem.Text = stdData.Select(a => a.Class).FirstOrDefault();
                ddltital.SelectedValue = stdData.Select(a => a.F1).FirstOrDefault();
                imgStudentPhoto.Visible = true;
                imgStudentPhoto.ImageUrl = stdData.Select(a => a.StudentPhoto).FirstOrDefault().ToString();

                txtOther1.Text = stdData.Select(a => a.F2).FirstOrDefault();
                txtOther1.Text = stdData.Select(a => a.F3).FirstOrDefault();
                txtOther1.Text = stdData.Select(a => a.F4).FirstOrDefault();
            }
            catch (Exception e)
            {
                divsucrss.Style.Add("display", "none");
                divUnsucrss.Style.Remove("display");
                ltrNotSucess.Text = " Not Avelabal    !!";
                return;
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InsertOrUpdateProfile();

        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (txtScholarNo.Text != "")
            {
                divUnsucrss.Style.Add("display", "none");
                LoadData(txtScholarNo.Text);
                

            }
            else
            {

                divsucrss.Style.Add("display", "none");
                divUnsucrss.Style.Remove("display");
                ltrNotSucess.Text = " Enter Valid Scholar No    !!";
                return;
            }

        }
        protected void InsertOrUpdateProfile()
        {
            string Schoolid = Session["SchoolId"].ToString();
            var stdData = stdCls.GetStudentDetail(Schoolid, txtScholarNo.Text);
            //    isAvelabal = stdData.Count();
            try
            {
                PR_StudentDetail oStdData = new PR_StudentDetail();
                oStdData.SchoolUID = Schoolid;
                oStdData.ScholarNo = txtScholarNo.Text;
                oStdData.StudentName = txtstdName.Text;
                oStdData.FatherName = txtFName.Text;
                oStdData.MotherName = txtMName.Text;
                oStdData.BloodGroup = txtBloodGroup.Text;
                oStdData.DateofBarth = txtDOB.Text;
                oStdData.EmailId = txtEmail.Text;
                oStdData.PhoneNumber = txtPhno.Text;
                oStdData.Addres = txtAddress.Text;
                oStdData.LastUpdated = DateTime.Now;
                oStdData.Status = 0;
                oStdData.IsActive = 1;
                oStdData.Class = ddlClass.SelectedItem.Text;
                oStdData.F1 = ddltital.SelectedValue.ToString();

                oStdData.F2 = txtOther1.Text;
                oStdData.F3 = txtOther2.Text;
                oStdData.F4 = txtOther3.Text;

                //create Folder
                string directoryPath = Server.MapPath(string.Format("~/StdPhoto/{0}/", Schoolid.Trim()));
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }




                //Save File in DB
                if (uploadStudentPhoto.FileName != "")
                    oStdData.StudentPhoto = "StdPhoto/" + Schoolid.Trim() + "/" + oStdData.ScholarNo.Trim()+".jpg";
                else
                    oStdData.StudentPhoto = imgStudentPhoto.ImageUrl.ToString();
                
                //Save file in Folder
                if (uploadStudentPhoto.FileName != "")
                {
                    string extension = Path.GetExtension(uploadStudentPhoto.PostedFile.FileName);
                    uploadStudentPhoto.SaveAs(Request.PhysicalApplicationPath + @"StdPhoto\" + Schoolid.Trim() + "\\" + oStdData.ScholarNo.Trim()+ extension);  

                  //  uploadStudentPhoto.PostedFile.SaveAs(Request.PhysicalApplicationPath + @"StdPhoto\" + Schoolid.Trim() + "\\" + uploadStudentPhoto.FileName);
                }



                if (stdData.Count() == 0)  //Insert
                {
                    string retCode = stdCls.InsertStudetDetail(oStdData);
                    if (retCode != "1")
                    {
                        divsucrss.Style.Add("display", "none");
                        divUnsucrss.Style.Remove("display");
                        ltrNotSucess.Text = retCode + "There are some error contact to admin !!";
                    }
                    else
                    {
                        divUnsucrss.Style.Add("display", "none");
                        divsucrss.Style.Remove("display");
                        ltrSucess.Text = "Data Inserted Sucess  ";
                    }
                }
                else //Update
                {
                    try {   oStdData.ScholarNo_Old = Session["Scro_Num_old"].ToString();  }
                    catch { oStdData.ScholarNo_Old = txtScholarNo.Text; }
                   
                    string retCode = stdCls.UpdateStudetDetail(oStdData);
                    if (retCode != "1")
                    {
                        divsucrss.Style.Add("display", "none");
                        divUnsucrss.Style.Remove("display");
                        ltrNotSucess.Text = retCode + "There are some error contact to admin !!";
                    }
                    else
                    {
                        Response.Redirect("StudentDetailByPhotoDelete.aspx");
                        //divUnsucrss.Style.Add("display", "none");
                        //divsucrss.Style.Remove("display");
                        //ltrSucess.Text = "Data Updated Sucess  ";
                    }

                }
                clearData();
            }
            catch (Exception e)
            {
                divsucrss.Style.Add("display", "none");
                divUnsucrss.Style.Remove("display");
                ltrNotSucess.Text = e.Message + "     There are some error contact to admin !!";
                return;
            }

        }

        private void clearData()
        {
            txtScholarNo.Text = "";
            txtstdName.Text = "";
            txtFName.Text = "";
            txtMName.Text = "";
            txtBloodGroup.Text = "";
            txtDOB.Text = "";
            txtEmail.Text = "";
            txtPhno.Text = "";
            txtAddress.Text = "";
            imgStudentPhoto.ImageUrl = "";
            ddlClass.SelectedIndex = 0;
            txtOther1.Text = "";
            txtOther2.Text = "";
            txtOther3.Text = "";

        }


    }
}