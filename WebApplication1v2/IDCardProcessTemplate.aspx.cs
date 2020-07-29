using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class IDCardProcessTemplate : System.Web.UI.Page
    {
        protected List<string> processlst;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                var total = clsProcesCardlst.ProcesCardlst.Count();
                var pageSize = 50; // set your page size, which is number of records per page

                int i = Convert.ToInt32(hdn1.Value);

                var page = ++i; // set current page number, must be >= 1

                hdn1.Value = page.ToString();

                var skip = pageSize * (page - 1);

                var canPage = skip < total;

                if (!canPage) // do what you wish if you can page no further
                    return;

                PrintData.pridata = clsProcesCardlst.ProcesCardlst.Skip(skip).Take(pageSize).ToList();

                lblschlorno.Text = PrintData.pridata.FirstOrDefault() + "-" + PrintData.pridata.LastOrDefault();
            }

        }

        protected void next50_Click(object sender, EventArgs e)
        {
            var total = clsProcesCardlst.ProcesCardlst.Count();
            var pageSize = 50; // set your page size, which is number of records per page

            int i = Convert.ToInt32(hdn1.Value);

            var page = ++i; // set current page number, must be >= 1

            hdn1.Value = page.ToString();

            var skip = pageSize * (page - 1);

            var canPage = skip < total;

            if (!canPage) // do what you wish if you can page no further
                return; 

            PrintData.pridata = clsProcesCardlst.ProcesCardlst.Skip(skip).Take(pageSize).ToList();

            lblschlorno.Text = PrintData.pridata.FirstOrDefault() + "-" + PrintData.pridata.LastOrDefault();
        }
    }
}