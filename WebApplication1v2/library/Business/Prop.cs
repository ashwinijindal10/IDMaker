using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
    public class Prop
    {
    }
    public class PR_SchoolRegistration : School_Ragistration
    { }
    public class PR_SchoolProfile : SchoolProfile
    { }
    public class PR_StudentDetail : StudentDetail
    {
        public string ScholarNo_Old { get; set; }
    }

    public class PR_SchoolFild : SchoolIdFild
    { }

    public class PR_HeaderFild
    {
        public string Header { get; set; }
    }

    public class PR_SuplierSrgistration : TBL_SP_Ragistration
    { }
    public class PR_MessagetoSchool :MessagetoSchool
    { }
    public class PR_AdminRegistration :tbl_Admin_Registration
    { }
}
