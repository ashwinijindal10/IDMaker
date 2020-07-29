using Business;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class DownloadICard : System.Web.UI.Page
    {
        public static List<string> pridata { get; set; }
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
                    BindGrid();
                    SchoolID = Session["SchoolId"].ToString();
                }
                catch
                {
                    Response.Redirect("Default.aspx");
                }
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SchoolID = Session["SchoolId"].ToString();
            var studentDetail = stdCls.GetStudentDetail(SchoolID).ToList();

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

            GridView1.DataSource = studentDetail.Take(100).ToList();
            GridView1.DataBind();

        }
        private void SearchbyName(string Name)
        {
            SchoolID = Session["SchoolId"].ToString();
            var studentDetail = stdCls.GetStudentDetail(SchoolID).Take(100).ToList();
            if (txttudentName.Text != "")
                studentDetail = studentDetail.Where(a => a.StudentName.ToLower().Contains(txttudentName.Text.ToLower())).ToList();
            GridView1.DataSource = studentDetail;
            GridView1.DataBind();
        }

        private void BindGrid()
        {
            SchoolID = Session["SchoolId"].ToString();
            var studentDetail = stdCls.GetStudentDetail(SchoolID).Take(50).ToList();

            GridView1.DataSource = studentDetail;
            GridView1.DataBind();

        }
        //protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    rpt1.PageIndex = e.NewPageIndex;
        //    this.BindGrid();
        //}

        protected void ExportToExcel(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=StudentDetails " + DateTime.Now.ToShortTimeString() + ".xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                //rpt1.AllowPaging = false;
                //this.BindGrid();

                //rpt1.HeaderRow.BackColor = Color.White;
                //foreach (TableCell cell in GridView1.HeaderRow.Cells)
                //{
                //    cell.BackColor = GridView1.HeaderStyle.BackColor;
                //}
                //foreach (GridViewRow row in GridView1.Rows)
                //{
                //    row.BackColor = Color.White;
                //    foreach (TableCell cell in row.Cells)
                //    {
                //        if (row.RowIndex % 2 == 0)
                //        {
                //            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                //        }
                //        else
                //        {
                //            cell.BackColor = GridView1.RowStyle.BackColor;
                //        }
                //        cell.CssClass = "textmode";
                //    }
                //}

                GridView1.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

        

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            int rowid = 0;
            List<string> data = new List<string>();
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkCtrl") as CheckBox);
                    if (chkRow.Checked)
                    {

                        string storid = row.Cells[1].Text;
                        data.Add(storid);
                    }
                }
            }

            clsProcesCardlst.ProcesCardlst = data;


            if (clsProcesCardlst.ProcesCardlst.Count > 0)
            {

                SchoolID = Session["SchoolId"].ToString();

                string directoryPath = Server.MapPath(string.Format("~/StdICard/{0}/", SchoolID.Trim()));
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                Response.Redirect("PrintingICardPage.aspx?id=0");

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please Select any record for print');", true);
            }
        }

        protected void btnDownloadAll_Click(object sender, EventArgs e)
        {
            var studentDetail = stdCls.GetStudentDetail(SchoolID).Take(5000).ToList();

             clsProcesCardlst.ProcesCardlst  = studentDetail.Select(x => x.ScholarNo).ToList();


            if ( clsProcesCardlst.ProcesCardlst.Count > 0)
            {

                SchoolID = Session["SchoolId"].ToString();

                string directoryPath = Server.MapPath(string.Format("~/StdICard/{0}/", SchoolID.Trim()));
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                Response.Redirect("PrintingICardPage.aspx?id=0");

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please Select any record for print');", true);
            }
        }

    }
}