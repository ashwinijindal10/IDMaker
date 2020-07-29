using Business;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebApplication1
{
    [ScriptService]
    public partial class IdDesignerPage : System.Web.UI.Page
    {

        [WebMethod]
        public static IList<IDField> GetIDsFieldList()
        {
            //  Request.QueryString["name"];
            var flist = new[] {
                new IDField { label="Student Id"   ,title="ID", key="stdId" },
                new IDField { label="Name"         ,title="Name", key="stdName"},
                new IDField { label="Class"        ,title="Std.", key="stdClass"},
                new IDField { label="Date of birth",title="Dob", key="stdDOB"},
                new IDField { label="Phone No."    ,title="Ph.", key="stdPhone"},
                new IDField { label="Father's Name",title="Father's Name", key="stdFatherName" },
                new IDField { label="Gender"       ,title="Gender", key="stdGender" },
                new IDField { label="Address"      ,title="Add.", key="stdAddress"},
            };
            return flist;
        }

        [WebMethod]
        public static bool SaveIdTemplate(string name, string format, object imgs)
        {
            string SchoolId = HttpContext.Current.Session["SchoolId"].ToString();
            string ContentImgPah = string.Format("StdICard//{0}//Content//", SchoolId);

            var template = new IDTemplate();
            foreach (var items in (object[])imgs)
            {
                var iDic = ((ICollection<KeyValuePair<string, object>>)items).ToDictionary(f => f.Key, f => f.Value);
                if (iDic.ContainsKey("data") && iDic["data"] != null)
                {
                    var imgpath = ContentImgPah + iDic["name"].ToString() + ".jpg";
                    SaveImage(iDic["data"].ToString(), imgpath);
                }
            }

            var cls = new clsICardTemplate();
            cls.SaveTemplate(new IDTemplate { Name = name, Format = format, SecUID = SchoolId });
            return true;
        }

        [WebMethod]
        public static IList<IDTemplate> LoadTemplate()
        {
            string SchoolId = HttpContext.Current.Session["SchoolId"].ToString();
            var cls = new clsICardTemplate();
            return cls.GetIDTemplates(SchoolId);
        }

        [WebMethod]
        public static object GetIdData()
        {
            string SchoolID = string.Empty;
            clsStudentDetail stdCls = new clsStudentDetail();

            List<string> scrnoa = new List<string>();
            scrnoa = PrintData.pridata; // (List<String>)HttpContext.Current.Session["printScID"];
            PrintData.pridata = null;

            SchoolID = HttpContext.Current.Session["SchoolId"].ToString();

            List<PR_StudentDetail> studentDetail = stdCls.GetStudentDetail(SchoolID).ToList();

            List<PR_StudentDetail> lstdetail = new List<PR_StudentDetail>();

            if (scrnoa != null)
            {
                for (int i = 0; i < scrnoa.Count; i++)
                {
                    lstdetail.Add(studentDetail.Where(x => x.ScholarNo == scrnoa[i]).FirstOrDefault());
                }
                return lstdetail.Select(f =>
                   new
                   {
                       stdId = f.ScholarNo,
                       stdPhoto = f.StudentPhoto,
                       stdName = f.StudentName,
                       stdClass = f.Class,
                       stdDOB = f.DateofBarth,
                       stdPhone = f.PhoneNumber,
                       stdFatherName = f.FatherName,
                       stdGender = f.F1,
                       stdAddress = f.Addres
                   });
            }
            else
            {                
                return lstdetail.Select(f =>
                   new
                   {
                       stdId = "123",
                       stdPhoto = "",
                       stdName = "Test Name",
                       stdClass = "I",
                       stdDOB = "20/07/2016",
                       stdPhone ="9500000000",
                       stdFatherName = "Father Name",
                       stdGender = "Mr.",
                       stdAddress = "Delhi India"
                   });
            }
        }

        [WebMethod]
        public static bool SaveStudentIdImage(object data)
        {
            string SchoolId = HttpContext.Current.Session["SchoolId"].ToString();
            var rs = ((ICollection<KeyValuePair<string, object>>)data).ToDictionary(f => f.Key, f => f.Value);
            var schoolName = "School";
            var imgpath = string.Format("StdICard\\{0}\\{1}_{2}.jpg", SchoolId, schoolName, rs["stdId"].ToString());
            SaveImage(rs["img"].ToString(), imgpath);
            return true;
        }

        [WebMethod]
        public static bool DeleteTemplate(int id)
        {
            string SchoolId = HttpContext.Current.Session["SchoolId"].ToString();
            string error = "";
            var cls = new clsICardTemplate();
            return cls.DeleteTemplate(id, SchoolId, out error);
        }

        private static string SaveImage(string ImageByteArray, string path)
        {
            string SchoolId = HttpContext.Current.Session["SchoolId"].ToString();
            string ContentImgPah = string.Format("StdICard//{0}//Content//", SchoolId);

            var pathToSave = String.Format("{0}{1}", AppDomain.CurrentDomain.BaseDirectory, path);
            try
            {
                if (ImageByteArray.Split(',').Length > 1)
                    ImageByteArray = ImageByteArray.Split(',')[1];
                byte[] bytes = Convert.FromBase64String(ImageByteArray);
                var pth = String.Format("{0}{1}", AppDomain.CurrentDomain.BaseDirectory, ContentImgPah);
                if (!Directory.Exists(pth))
                {
                    Directory.CreateDirectory(pth);
                }
                File.WriteAllBytes(pathToSave, bytes);

                return pathToSave;
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string SchoolId = HttpContext.Current.Session["SchoolId"].ToString();
            string ContentImgPah = string.Format("StdICard//{0}//Content//", SchoolId);

            contentImgPath.Value = ContentImgPah;
        }
    }


    public class IDField
    {
        public string label { get; set; }
        public string title { get; set; }
        public string key { get; set; }
    }


}