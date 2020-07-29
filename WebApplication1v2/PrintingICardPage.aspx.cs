using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class PrintingICardPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string id = Request.QueryString[0].ToString();
                    if (!string.IsNullOrWhiteSpace(id))
                    {
                        List<string> scrnoa = new List<string>();
                        scrnoa = clsProcesCardlst.ProcesCardlst;

                        List<clsimgprop> datalist = new List<clsimgprop>();

                        clsimgprop data;

                        string clss = "hori";
                        if (id == "0")
                            clss = "hori";
                        else
                        {
                            for (int i = 0; i < scrnoa.Count; i++)
                            {
                                data = new clsimgprop();
                                data.Img = MapPath("~/StdICard/" + HttpContext.Current.Session["SchoolId"].ToString() + "/School_" + scrnoa[i] + ".jpg");

                                System.Drawing.Image image = System.Drawing.Image.FromFile(data.Img);
                                image.RotateFlip(System.Drawing.RotateFlipType.Rotate90FlipNone);
                                image.Save(data.Img);
                            }
                        }




                        if (scrnoa != null)
                        {
                            for (int i = 0; i < scrnoa.Count; i++)
                            {
                                data = new clsimgprop();
                                data.Img = "StdICard/" + HttpContext.Current.Session["SchoolId"].ToString() + "/School_" + scrnoa[i] + ".jpg";
                                data.cls = clss;
                                datalist.Add(data);
                            }
                            rpt1.DataSource = datalist;
                            rpt1.DataBind();
                        }

                    }
                }
                catch
                {
                    Response.Redirect("PrintDataSelect.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        [WebMethod]
        public static void DeleteCustomer(string id)
        {
             
            List<string> scrnoa = new List<string>();
            scrnoa = clsProcesCardlst.ProcesCardlst;
            clsimgprop data;

            if (id != "0")                
            {
                for (int i = 0; i < scrnoa.Count; i++)
                {
                    data = new clsimgprop();
                    data.Img = HostingEnvironment.MapPath("~/StdICard/" + HttpContext.Current.Session["SchoolId"].ToString() + "/School_" + scrnoa[i] + ".jpg");

                    System.Drawing.Image image = System.Drawing.Image.FromFile(data.Img);
                    image.RotateFlip(System.Drawing.RotateFlipType.Rotate270FlipNone);
                    image.Save(data.Img);
                }
            }
            
        }
         
        protected void rotate_Click(object sender, EventArgs e)
        {
            Response.Redirect("PrintingICardPage.aspx?id=1"); 
        }

        protected void ExportToImage(object sender, EventArgs e)
        {
            string base64 = Request.Form[hfImageData.UniqueID].Split(',')[1];
            byte[] bytes = Convert.FromBase64String(base64);
            Response.Clear();
            Response.ContentType = "image/jpg";
            Response.AddHeader("Content-Disposition", "attachment; filename=download.jpg");
            Response.Buffer = true;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(bytes);
            Response.End();
        }


    }
    public class clsimgprop
    {
        public string Img { get; set; }
        public string cls { get; set; }
    }
}