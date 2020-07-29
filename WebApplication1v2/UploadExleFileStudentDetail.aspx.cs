using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace WebApplication1
{
    public partial class UploadExleFileStudentDetail : System.Web.UI.Page
    {
        clsStudentDetail clsStdDetail = new clsStudentDetail();
        PR_StudentDetail objStd = new PR_StudentDetail();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string Schoolid = Session["SchoolId"].ToString();


            string directoryPath = Server.MapPath(string.Format("~/ExcelFile/{0}/", Schoolid.Trim()));
            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }

            //Get path from web.config file to upload
            string FilePath = string.Format("~/ExcelFile/{0}/", Schoolid.Trim());//ConfigurationManager.AppSettings["FilePath"].ToString();
            string filename = string.Empty;
            //To check whether file is selected or not to uplaod
            if (FileUploadToServer.HasFile)
            {
                try
                {
                    string[] allowdFile = { ".xls" };//, ".xlsx" };
                    //Here we are allowing only excel file so verifying selected file pdf or not
                    string FileExt = System.IO.Path.GetExtension(FileUploadToServer.PostedFile.FileName);
                    //Check whether selected file is valid extension or not
                    bool isValidFile = allowdFile.Contains(FileExt);
                    if (!isValidFile)
                    {
                        divsucrss.Style.Add("display", "none");
                        divUnsucrss.Style.Remove("display");
                        ltrNotSucess.Text = "Please upload only Excel";

                    }
                    else
                    {
                        // Get size of uploaded file, here restricting size of file
                        int FileSize = FileUploadToServer.PostedFile.ContentLength;
                        if (FileSize <= 3048576)//1048576 byte = 1MB
                        {
                            //Get file name of selected file
                            filename = Path.GetFileName(Server.MapPath(FileUploadToServer.FileName));

                            //Save selected file into server location
                            FileUploadToServer.SaveAs(Server.MapPath(FilePath) + filename);
                            //Get file path
                            string filePath = Server.MapPath(FilePath) + filename;
                            //Open the connection with excel file based on excel version
                            OleDbConnection con = null;
                            if (FileExt == ".xls")
                            {
                                con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";Extended Properties=Excel 8.0;");

                            }
                            else if (FileExt == ".xlsx")
                            {
                                // con = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties=Excel 12.0;");
                            }
                            con.Open();
                            //Get the list of sheet available in excel sheet
                            DataTable dt = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                            //Get first sheet name
                            string getExcelSheetName = dt.Rows[0]["Table_Name"].ToString();
                            //Select rows from first sheet in excel sheet and fill into dataset
                            OleDbCommand ExcelCommand = new OleDbCommand(@"SELECT * FROM [" + getExcelSheetName + @"]", con);
                            OleDbDataAdapter ExcelAdapter = new OleDbDataAdapter(ExcelCommand);
                            DataSet ExcelDataSet = new DataSet();
                            ExcelAdapter.Fill(ExcelDataSet);
                            con.Close();
                            // var aa=ExcelDataSet.Tables[0].Rows.
                            try
                            {
                                string Filds = clsStdDetail.GetSchoolFild(Schoolid).Select(x => x.MyIdFild).FirstOrDefault().ToString();
                                var lstFild = Filds;

                                //if (lstFild.Contains("[StudentPhoto]"))
                                //    dtxtStudentPhoto.Style.Remove("display");
                                //if (lstFild.Contains("[Status]"))
                                //    dtxtStatus.Style.Remove("display");


                                for (int i = 0; i < ExcelDataSet.Tables[0].Rows.Count; i++)
                                {

                                    objStd.SchoolUID = Schoolid;

                                    if (lstFild.Contains("[ScholarNo]"))
                                        objStd.ScholarNo = ExcelDataSet.Tables[0].Rows[i]["ScholarNo"].ToString();
                                    else
                                        objStd.ScholarNo = "";
                                    if (lstFild.Contains("[StudentName]"))
                                        objStd.StudentName = ExcelDataSet.Tables[0].Rows[i]["StudentName"].ToString();
                                    else
                                        objStd.StudentName = ""; 
                                     
                                    if (lstFild.Contains("[FatherName]"))
                                        objStd.FatherName = ExcelDataSet.Tables[0].Rows[i]["FatherName"].ToString();
                                    else
                                        objStd.FatherName = "";
                                    if (lstFild.Contains("[MotherName]"))
                                        objStd.MotherName = ExcelDataSet.Tables[0].Rows[i]["MotherName"].ToString();
                                    else
                                        objStd.MotherName = "";
                                    if (lstFild.Contains("[BloodGroup]"))
                                        objStd.BloodGroup = ExcelDataSet.Tables[0].Rows[i]["BloodGroup"].ToString();
                                    else
                                        objStd.BloodGroup = "";
                                    if (lstFild.Contains("[PhoneNumber]"))
                                        objStd.PhoneNumber = ExcelDataSet.Tables[0].Rows[i]["PhoneNumber"].ToString();
                                    else
                                        objStd.PhoneNumber = "";
                                    if (lstFild.Contains("[DateofBarth]"))
                                    {
                                        try {
                                            objStd.DateofBarth = Convert.ToDateTime(ExcelDataSet.Tables[0].Rows[i]["DateofBirth"]).ToString("dd/MM/yyyy");
                                        }
                                        catch { objStd.DateofBarth = "";
                                            ltrupdaterecorddetail.Text += " <spain style='color:red'>"+ ExcelDataSet.Tables[0].Rows[i]["ScholarNo"].ToString() + "</spain>";
                                        }
                                        
                                    }
                                    else
                                        objStd.DateofBarth = "";
                                    if (lstFild.Contains("[Class]"))
                                        objStd.Class = ExcelDataSet.Tables[0].Rows[i]["Class"].ToString();
                                    else
                                        objStd.Class = "";
                                    if (lstFild.Contains("[EmailId]"))
                                        objStd.EmailId = ExcelDataSet.Tables[0].Rows[i]["EmailId"].ToString();
                                    else
                                        objStd.EmailId = "";
                                    if (lstFild.Contains("[Addres]"))
                                        objStd.Addres = ExcelDataSet.Tables[0].Rows[i]["ADDRESS"].ToString();
                                    else
                                        objStd.Addres = "";
                                    if (lstFild.Contains("[F2]"))
                                        objStd.F2 = ExcelDataSet.Tables[0].Rows[i]["OTHER1"].ToString();
                                    else
                                        objStd.F2 = "";
                                    if (lstFild.Contains("[F3]"))
                                        objStd.F3 = ExcelDataSet.Tables[0].Rows[i]["OTHER2"].ToString();
                                    else
                                        objStd.F3 = "";
                                    if (lstFild.Contains("[F4]"))
                                        objStd.F4 = ExcelDataSet.Tables[0].Rows[i]["OTHER3"].ToString();
                                    else
                                        objStd.F4 = "";
                                    if (lstFild.Contains("[StudentPhoto]"))
                                    {
                                        string pto=ExcelDataSet.Tables[0].Rows[i]["StudentPhoto"].ToString();

                                        objStd.StudentPhoto = "StdPhoto/" + Schoolid + "/" +  (pto.Contains(".") ?  pto : pto+".jpg" ) ;
                                    }
                                    else
                                        objStd.StudentPhoto = "";

                                    objStd.F1 = ExcelDataSet.Tables[0].Rows[i]["TITLE"].ToString();
                                    objStd.LastUpdated = DateTime.Now;
                                    objStd.IsActive = 1;
                                    objStd.Status = 0;
                                    //objStd.StudentPhoto= //img
                                    int isExist = clsStdDetail.GetStudentDetail(Schoolid, objStd.ScholarNo).Count;
                                    if (isExist > 0)
                                    {
                                        objStd.ScholarNo_Old = ExcelDataSet.Tables[0].Rows[i]["ScholarNo"].ToString();
                                         
                                        string retCode = clsStdDetail.UpdateStudetDetail(objStd);
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

                                            divupdatedrecord.Style.Remove("display");
                                            ltrupdaterecorddetail.Text += objStd.ScholarNo_Old + "   ";
                                        }

                                    }
                                    else
                                    {                                        
                                        string retCode = clsStdDetail.InsertStudetDetail(objStd);
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
                                }
                                GridView1.DataSource = ExcelDataSet;
                                GridView1.DataBind();
                            }
                            catch (Exception s)
                            {
                                divsucrss.Style.Add("display", "none");
                                divUnsucrss.Style.Remove("display");
                                ltrNotSucess.Text = s.Message + "There are some error contact to admin !!";
                            }
                        }
                        else
                        {
                            divsucrss.Style.Add("display", "none");
                            divUnsucrss.Style.Remove("display");
                            ltrNotSucess.Text = "Attachment file size should not be greater then 1 MB !";

                        }
                    }
                }
                catch (Exception ex)
                {
                    divsucrss.Style.Add("display", "none");
                    divUnsucrss.Style.Remove("display");
                    ltrNotSucess.Text = "Error occurred while uploading a file: " + ex.Message;

                }
            }
            else
            {
                divsucrss.Style.Add("display", "none");
                divUnsucrss.Style.Remove("display");
                ltrNotSucess.Text = "Please select a file to upload.";
            }
        }
    }
}