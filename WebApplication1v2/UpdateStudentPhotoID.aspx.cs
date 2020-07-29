using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace WebApplication1
{
    public partial class UpdateStudentPhotoID : System.Web.UI.Page
    {
        SchoolRagistration schrg = new SchoolRagistration();
        protected string SchoolID = string.Empty;  
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    SchoolID = Session["SchoolId"].ToString();

                }
                catch
                {
                      Response.Redirect("Default.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SchoolID = Session["SchoolId"].ToString();
            int returncode = 0;
            if(!string.IsNullOrEmpty(TextBox1.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox1.Text, TextBox2.Text);
            if (!string.IsNullOrEmpty(TextBox3.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox3.Text, TextBox4.Text);
            if (!string.IsNullOrEmpty(TextBox5.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox5.Text, TextBox6.Text);
            if (!string.IsNullOrEmpty(TextBox7.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox7.Text, TextBox8.Text);
            if (!string.IsNullOrEmpty(TextBox9.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox9.Text, TextBox10.Text);
            if (!string.IsNullOrEmpty(TextBox11.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox11.Text, TextBox12.Text);
            if (!string.IsNullOrEmpty(TextBox13.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox13.Text, TextBox14.Text);
            if (!string.IsNullOrEmpty(TextBox15.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox15.Text, TextBox16.Text);
            if (!string.IsNullOrEmpty(TextBox17.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox17.Text, TextBox18.Text);
            if (!string.IsNullOrEmpty(TextBox19.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox19.Text, TextBox20.Text);
            if (!string.IsNullOrEmpty(TextBox21.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox21.Text, TextBox22.Text);
            if (!string.IsNullOrEmpty(TextBox23.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox23.Text, TextBox24.Text);
            if (!string.IsNullOrEmpty(TextBox25.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox25.Text, TextBox26.Text);
            if (!string.IsNullOrEmpty(TextBox27.Text))
                returncode = schrg.UpdateStudentPhotoID(SchoolID, TextBox27.Text, TextBox28.Text);
            if (!string.IsNullOrEmpty(TextBox29.Text))
              returncode=  schrg.UpdateStudentPhotoID(SchoolID, TextBox29.Text, TextBox30.Text);

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

    }
}