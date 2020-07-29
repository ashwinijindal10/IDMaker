using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using System.IO;
using System.Drawing;
using System.Web.Services;
using System.Xml.Serialization;

namespace WebApplication1
{
    public partial class StudentDetailByPhotoDelete : System.Web.UI.Page
    {
        StusentClass stdClassNum = new StusentClass();
        clsStudentDetail clsStdDetail = new clsStudentDetail();
        PR_StudentDetail prStdDetail = new PR_StudentDetail();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var stdclasss = stdClassNum.lstStudentClass().ToList();
                ddlClass.DataSource = stdclasss;
                ddlClass.DataBind();
                txtClass.DataSource = stdclasss;
                txtClass.DataBind();
                loadData();
            }
                
        }


        private void loadData()
        {
            try
            {
                string SchoolID = Session["SchoolId"].ToString();
                var detail = clsStdDetail.GetStudentDetail(SchoolID);
                gvCustomers.DataSource = detail;
                gvCustomers.DataBind();
            }
            catch { }


        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void rptShipAddressDetail_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string SchoolID = Session["SchoolId"].ToString();
            try
            {
                //  PR_Address objAdd = (PR_Address)e.Item.DataItem;
                if (e.CommandName == "Delete")
                {
                    string StudentScrolNo = e.CommandArgument.ToString();
                    prStdDetail.SchoolUID = SchoolID;
                    prStdDetail.ScholarNo = StudentScrolNo;
                    string retCode = clsStdDetail.DeleteStudetDetail(prStdDetail);

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
                        ltrSucess.Text = "Data Deleted Sucess  ";
                    }
                    loadData();

                }
                if (e.CommandName == "Edit")
                {

                }
            }
            catch
            { }
        }
        private void BindGrid()
        {
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }

        public static string Serialize<T>(T dataToSerialize)
        {
            try
            {
                var stringwriter = new System.IO.StringWriter();
                var serializer = new XmlSerializer(typeof(T));
                serializer.Serialize(stringwriter, dataToSerialize);
                return stringwriter.ToString();
            }
            catch
            {
                throw;
            }
        }

        public static T Deserialize<T>(string xmlText)
        {
            try
            {
                var stringReader = new System.IO.StringReader(xmlText);
                var serializer = new XmlSerializer(typeof(T));
                return (T)serializer.Deserialize(stringReader);
            }
            catch
            {
                throw;
            }
        }


        [WebMethod]
        public static string GetCustomers()
        {
            clsStudentDetail clsStdDetail = new clsStudentDetail();
            string SchoolID = HttpContext.Current.Session["SchoolId"].ToString();
            var detail = clsStdDetail.GetStudentDetail(SchoolID);
            return Serialize<List<PR_StudentDetail>>(detail);
        }

        [WebMethod]
        public static string InsertCustomer(string ScholarNo, string F1, string StudentName, string FatherName, string DateofBarth, string Class, string PhoneNumber, string Addres)
        {
            string Schoolid = HttpContext.Current.Session["SchoolId"].ToString();
            clsStudentDetail stdCls = new clsStudentDetail();
            if (!string.IsNullOrWhiteSpace(ScholarNo))
            {
                PR_StudentDetail oStdData = new PR_StudentDetail();
                oStdData.SchoolUID = Schoolid;
                oStdData.ScholarNo = ScholarNo;
                oStdData.StudentName = StudentName;
                oStdData.FatherName = FatherName;
                oStdData.MotherName = "";
                oStdData.BloodGroup = "";
                oStdData.DateofBarth = DateofBarth;
                oStdData.EmailId = "";
                oStdData.PhoneNumber = PhoneNumber;
                oStdData.Addres = Addres;
                oStdData.LastUpdated = DateTime.Now;
                oStdData.Status = 0;
                oStdData.IsActive = 1;
                oStdData.Class = Class;
                oStdData.F1 = F1;
                oStdData.StudentPhoto = "";

                string retCode = stdCls.InsertStudetDetail(oStdData);
                if (retCode != "1")
                {

                    retCode = retCode + "There are some error contact to admin !!";
                    return retCode;
                }
                else
                {                    
                    retCode  = "Data Inserted Sucess  ";
                    return ScholarNo;
                }
                
            }
            else
                return ScholarNo; 
        }

        [WebMethod]
        public static void UpdateCustomer(string ScholarNo, string F1, string StudentName, string FatherName, string DateofBarth, string Class, string PhoneNumber, string Addres)
        {
            string Schoolid = HttpContext.Current.Session["SchoolId"].ToString();
            clsStudentDetail stdCls = new clsStudentDetail();
            var oldStdData = stdCls.GetStudentDetail(Schoolid, ScholarNo).FirstOrDefault();

            if (!string.IsNullOrWhiteSpace(ScholarNo))
            {
                PR_StudentDetail oStdData = new PR_StudentDetail();
                oStdData.SchoolUID = Schoolid;
                oStdData.ScholarNo_Old = ScholarNo;
                oStdData.ScholarNo = ScholarNo;
                oStdData.StudentName = StudentName;
                oStdData.FatherName = FatherName;
                oStdData.MotherName = oldStdData.MotherName;
                oStdData.BloodGroup = oldStdData.BloodGroup;
                oStdData.DateofBarth = DateofBarth;
                oStdData.EmailId = oldStdData.EmailId;
                oStdData.PhoneNumber = PhoneNumber;
                oStdData.Addres = Addres;
                oStdData.LastUpdated = DateTime.Now;
                oStdData.Status = 0;
                oStdData.IsActive = 1;
                oStdData.Class = Class;
                oStdData.F1 = F1;
                oStdData.StudentPhoto = oldStdData.StudentPhoto;

                string retCode = stdCls.UpdateStudetDetail(oStdData);
                if (retCode != "1")
                {

                    retCode = retCode + "There are some error contact to admin !!";                  
                }
                else
                {
                    retCode = "Data Inserted Sucess  ";                   
                }
            } 
        }

        [WebMethod]
        public static void DeleteCustomer(string ScholarNo)
        {
            string Schoolid = HttpContext.Current.Session["SchoolId"].ToString();

            clsStudentDetail clsStdDetail = new clsStudentDetail();

            PR_StudentDetail oldStdData = new PR_StudentDetail();
            oldStdData.SchoolUID = Schoolid;

            oldStdData.ScholarNo = ScholarNo;
            string retCode = clsStdDetail.DeleteStudetDetail(oldStdData);
        }



        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string SchoolID = Session["SchoolId"].ToString();
            var studentDetail = clsStdDetail.GetStudentDetail(SchoolID).ToList();

            if (txtScholarNo.Text != "")
                studentDetail = studentDetail.Where(a => a.ScholarNo == txtScholarNo.Text).ToList();
            if (txttudentName.Text != "")
                studentDetail = studentDetail.Where(a => a.StudentName.ToLower().Contains(txttudentName.Text.ToLower())).ToList();
            if (txtEmail.Text != "")
                studentDetail = studentDetail.Where(a => a.EmailId.ToLower().Contains(txtEmail.Text.ToLower())).ToList();
            if (ddlClass.SelectedIndex != 0)
                studentDetail = studentDetail.Where(a => a.Class == ddlClass.SelectedItem.Text).ToList();
            if (txtphno1.Text != "")
                studentDetail = studentDetail.Where(a => a.PhoneNumber.ToLower().Contains(txtphno1.Text.ToLower())).ToList();
            if (txtFather.Text != "")
                studentDetail = studentDetail.Where(a => a.FatherName.ToLower().Contains(txtFather.Text.ToLower())).ToList();
            if (txtAddress.Text != "")
                studentDetail = studentDetail.Where(a => a.Addres.ToLower().Contains(txtAddress.Text.ToLower())).ToList();

            gvCustomers.DataSource = studentDetail;
            gvCustomers.DataBind();

        }



        protected void ExportToExcel(object sender, EventArgs e)
        {
            ExportExlefun();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            string SchoolID = Session["SchoolId"].ToString();


            exportdiv.Style.Remove("display");
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=StudentDetails " + DateTime.Now.ToShortTimeString() + ".xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView1.AllowPaging = false;
                this.BindGrid();

                GridView1.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridView1.HeaderRow.Cells)
                {
                    cell.BackColor = GridView1.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView1.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridView1.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());


                //Retrieve the state of the CheckBox 
                prStdDetail.SchoolUID = SchoolID;
                prStdDetail.ScholarNo = "0000";
                string retCode = clsStdDetail.DeleteStudetDetail(prStdDetail);
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
                    ltrSucess.Text = "Data Deleted Sucess  ";
                }

                Response.Flush();
                Response.End();
                exportdiv.Style.Add("display", "none");
            }
        }
        protected void ExportExlefun()
        {
            exportdiv.Style.Remove("display");
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=StudentDetails " + DateTime.Now.ToShortTimeString() + ".xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView1.AllowPaging = false;
                this.BindGrid();

                GridView1.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridView1.HeaderRow.Cells)
                {
                    cell.BackColor = GridView1.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView1.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridView1.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
                exportdiv.Style.Add("display", "none");
            }
        }
         
        //protected void UpdateCustomer(object sender, GridViewUpdateEventArgs e)
        //{

        //    string txtScholarNo = ((TextBox)GridView2.Rows[e.RowIndex]
        //                        .FindControl("txtScholarNo")).Text;
        //    string ddltital = ((DropDownList)GridView2.Rows[e.RowIndex]
        //                        .FindControl("ddltital")).SelectedItem.Text;
        //    string txtStudentName = ((TextBox)GridView2.Rows[e.RowIndex]
        //                        .FindControl("txtStudentName")).Text;
        //    string txtFatherName = ((TextBox)GridView2.Rows[e.RowIndex]
        //                        .FindControl("txtFatherName")).Text;
        //    string ddlClass = ((DropDownList)GridView2.Rows[e.RowIndex]
        //                        .FindControl("ddlClass")).SelectedItem.Text;
        //    string txtPhoneNumber = ((TextBox)GridView2.Rows[e.RowIndex]
        //                        .FindControl("txtPhoneNumber")).Text;



        //    string Schoolid = Session["SchoolId"].ToString();
        //    PR_StudentDetail oldStdData = new PR_StudentDetail();
        //    oldStdData = clsStdDetail.GetStudentDetail(Schoolid, txtScholarNo).FirstOrDefault();
        //    //    isAvelabal = stdData.Count();
        //    try
        //    {
        //        PR_StudentDetail oStdData = new PR_StudentDetail();
        //        oStdData.SchoolUID = Schoolid;
        //        oStdData.ScholarNo = txtScholarNo;
        //        oStdData.StudentName = txtStudentName;
        //        oStdData.FatherName = txtFatherName;
        //        oStdData.MotherName = oldStdData.MotherName;
        //        oStdData.BloodGroup = oldStdData.BloodGroup;
        //        oStdData.DateofBarth = oldStdData.DateofBarth;
        //        oStdData.EmailId = oldStdData.EmailId;
        //        oStdData.PhoneNumber = txtPhoneNumber;
        //        oStdData.Addres = oldStdData.Addres;
        //        oStdData.LastUpdated = DateTime.Now;
        //        oStdData.Status = 0;
        //        oStdData.IsActive = 1;
        //        oStdData.Class = ddlClass;
        //        oStdData.F1 = ddltital;
        //        oStdData.StudentPhoto = oldStdData.StudentPhoto;

        //        string retCode = clsStdDetail.UpdateStudetDetail(oStdData);


        //        GridView2.EditIndex = -1;
        //        loadData();
        //        divUnsucrss.Style.Add("display", "none");
        //        divsucrss.Style.Remove("display");
        //        ltrSucess.Text = "Data Updated Sucess  ";
        //    }
        //    catch (Exception ex)
        //    {
        //        divsucrss.Style.Add("display", "none");
        //        divUnsucrss.Style.Remove("display");
        //        ltrNotSucess.Text = ex.Message + "There are some error contact to admin !!";

        //    }
        //}

        //protected void DeleteCustomer(object sender, EventArgs e)
        //{
        //    string Schoolid = Session["SchoolId"].ToString();
        //    LinkButton lnkRemove = (LinkButton)sender;

        //    string txtScholarNo = lnkRemove.CommandArgument;

        //    PR_StudentDetail oldStdData = new PR_StudentDetail();
        //    oldStdData.SchoolUID = Schoolid;

        //    oldStdData.ScholarNo = txtScholarNo;
        //    string retCode = clsStdDetail.DeleteStudetDetail(oldStdData);
        //    if (retCode != "1")
        //    {
        //        divsucrss.Style.Add("display", "none");
        //        divUnsucrss.Style.Remove("display");
        //        ltrNotSucess.Text = retCode + "There are some error contact to admin !!";
        //    }
        //    else
        //    {
        //        divUnsucrss.Style.Add("display", "none");
        //        divsucrss.Style.Remove("display");
        //        ltrSucess.Text = "Data Deleted Sucess  ";
        //    }
        //    loadData();
        //}

        //protected void AddNewCustomer(object sender, EventArgs e)
        //{
        //    string Schoolid = Session["SchoolId"].ToString();
        //    PR_StudentDetail oldStdData = new PR_StudentDetail();

        //    string txtScholarNo = ((TextBox)GridView2.FooterRow.FindControl("txtScholarNo")).Text;
        //    string ddltital = ((DropDownList)GridView2.FooterRow.FindControl("ddltital")).SelectedItem.Text;
        //    string txtStudentName = ((TextBox)GridView2.FooterRow.FindControl("txtStudentName")).Text;
        //    string txtFatherName = ((TextBox)GridView2.FooterRow.FindControl("txtFatherName")).Text;
        //    string ddlClass = ((DropDownList)GridView2.FooterRow.FindControl("ddlClass")).SelectedItem.Text;
        //    string txtPhoneNumber = ((TextBox)GridView2.FooterRow.FindControl("txtPhoneNumber")).Text;

        //   // oldStdData.Addres= 


        //   // oldStdData = clsStdDetail.GetStudentDetail(Schoolid, txtScholarNo).FirstOrDefault();

        //    loadData();
             
        //}

        //protected void OnPaging(object sender, GridViewPageEventArgs e)
        //{
        //    loadData();
        //    gvCustomers.PageIndex = e.NewPageIndex;
        //    gvCustomers.DataBind();
        //}

        //protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        //{

        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        if ((e.Row.RowState & DataControlRowState.Edit) > 0)
        //        {
        //            StusentClass stdClassNum = new StusentClass();
        //            var data = stdClassNum.lstStudentClass().ToList();

        //            DropDownList ddList = (DropDownList)e.Row.FindControl("ddlClass");
        //            DropDownList ddTital = (DropDownList)e.Row.FindControl("ddltital");

        //            //return DataTable havinf department data

        //            ddList.DataSource = data;
        //            ddList.DataBind();

        //            ddList.SelectedValue = ((Label)GridView2.Rows[e.Row.RowIndex].FindControl("lblClass")).Text;
        //            ddTital.SelectedValue = ((Label)GridView2.Rows[e.Row.RowIndex].FindControl("lblF1")).Text;
        //        }
        //    }
        //}

    }
}