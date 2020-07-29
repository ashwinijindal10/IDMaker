using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class TransferToAdmin : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["IdCardPublicationConnectionString"].ConnectionString.ToString());
            loadddlClass();
        }
        protected void loadddlClass()
        {
            ddlClass.DataSource = lstStudentClass();
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, new ListItem("All Unprinted Id Card", "0"));
        }
        public List<string> lstStudentClass()
        {
            List<string> cls = new List<string>();            
            cls.Add("LKG");
            cls.Add("UKG");
            cls.Add("I");
            cls.Add("II");
            cls.Add("III");
            cls.Add("IV");
            cls.Add("V");
            cls.Add("VI");
            cls.Add("VII");
            cls.Add("VIII");
            cls.Add("IX");
            cls.Add("X");
            cls.Add("XI");
            cls.Add("XII");            
            return cls;
        
        }

        protected void SendByClass_Click(object sender, EventArgs e)
        {
            string SchoolID = Convert.ToString(Session["SchoolId"]);
            if (ddlClass.SelectedIndex == 0)
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("update  StudentDetail set [Status]=@Status  where SchoolUID=@SchoolUID and Status=0", con);
                    cmd.Parameters.AddWithValue("@SchoolUID", SchoolID);
                    cmd.Parameters.AddWithValue("@Status", 4);
                    con.Open();
                    cmd.ExecuteScalar();
                    con.Close();
                }
                catch
                {
                    con.Close();
                }
            }
            else
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("update  StudentDetail set [Status]=@Status  where SchoolUID=@SchoolUID and ScholarNo=@Class", con);
                    cmd.Parameters.AddWithValue("@SchoolUID", SchoolID);
                    cmd.Parameters.AddWithValue("@Status", 4);
                    cmd.Parameters.AddWithValue("@Class", ddlClass.SelectedItem.ToString());
                    con.Open();
                    cmd.ExecuteScalar();
                    con.Close();
                }
                catch
                {
                    con.Close();
                }
            }

        }

        protected void SendBySchoolr_Click(object sender, EventArgs e)
        {
            string SchoolID = Convert.ToString(Session["SchoolId"]);
            if (txtsch01.Text != null)
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("update  StudentDetail set [Status]=@Status  where SchoolUID=@SchoolUID and ScholarNo=@ScholarNo", con);
                    cmd.Parameters.AddWithValue("@SchoolUID", SchoolID);
                    cmd.Parameters.AddWithValue("@Status", 4);
                    cmd.Parameters.AddWithValue("@ScholarNo", txtsch01.Text.ToString());
                    con.Open();
                    cmd.ExecuteScalar();
                    con.Close();
                }
                catch
                {
                    con.Close();
                }
            }
        }
    }
}