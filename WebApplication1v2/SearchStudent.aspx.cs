using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using System.Drawing;
using System.IO;

namespace WebApplication1
{
    public partial class SearchStudent : System.Web.UI.Page
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
                    BindGrid();
                    SchoolID = Session["SchoolId"].ToString();
                    if (Request.QueryString["SearchByName"] != null)
                    {
                        Session["SearchByName"] = Request.QueryString["SearchByName"];
                        SearchbyName(Convert.ToString(Session["SearchByName"].ToString()));
                    }
                }
                catch
                {
                  //  Response.Redirect("Default.aspx");
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

             rpt1.DataSource = studentDetail;
             rpt1.DataBind();

        }
        private void SearchbyName(string Name)
        {
            SchoolID = Session["SchoolId"].ToString();
            var studentDetail = stdCls.GetStudentDetail(SchoolID).ToList();
            if (txttudentName.Text != "")
                studentDetail = studentDetail.Where(a => a.StudentName.ToLower().Contains(txttudentName.Text.ToLower())).ToList();
            rpt1.DataSource = studentDetail;
            rpt1.DataBind();
        }

        private void BindGrid()
        {
            SchoolID = Session["SchoolId"].ToString();
            var studentDetail = stdCls.GetStudentDetail(SchoolID).ToList();
            rpt1.DataSource = studentDetail;
            rpt1.DataBind();
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

                rpt1.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

    }
}