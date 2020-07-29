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
    public partial class PrintDataSelect : System.Web.UI.Page
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

            GridView1.DataSource = studentDetail.Take(5).ToList();
            GridView1.DataBind();

        }
        private void SearchbyName(string Name)
        {
            SchoolID = Session["SchoolId"].ToString();
            var studentDetail = stdCls.GetStudentDetail(SchoolID).Take(5).ToList();
            if (txttudentName.Text != "")
                studentDetail = studentDetail.Where(a => a.StudentName.ToLower().Contains(txttudentName.Text.ToLower())).ToList();
            GridView1.DataSource = studentDetail;
            GridView1.DataBind();
        }

        private void BindGrid()
        {
            SchoolID = Session["SchoolId"].ToString();
            var studentDetail = stdCls.GetStudentDetail(SchoolID).Take(5).ToList();

            GridView1.DataSource = studentDetail;
            GridView1.DataBind();

        }
        
        protected void btnPrint_Click(object sender, EventArgs e)
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

            PrintData.pridata = data;

            if (PrintData.pridata.Count > 0)
            {


                SchoolID = Session["SchoolId"].ToString();

                string directoryPath = Server.MapPath(string.Format("~/StdICard/{0}/", SchoolID.Trim()));
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                Response.Redirect("IdDesignerPage.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please Select any record for Design');", true);
            }
        }
         
    }

    public class PrintData
    {
        public static List<string> pridata { get; set; }
    }
     
}