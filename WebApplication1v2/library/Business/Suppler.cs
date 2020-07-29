using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
    public class Suppler
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        #region Add new School Ragistation or Login
        public string InsertRagistration(PR_SuplierSrgistration oRegData)
        {
            try
            {
                db.SP_Tbl_Sp_InsertschoolRegistration(oRegData.Id, oRegData.Pwd, oRegData.Email, oRegData.ScholName, oRegData.Phno, oRegData.F1, oRegData.F2, oRegData.F3, oRegData.F4, oRegData.IsActive);
                return "1";
            }
            catch (Exception e)
            {
                return e.Message + "";
            }
        }
        public int UpdateRagistration(PR_SuplierSrgistration oRegData)
        {
            try
            {
                db.SP_tbl_SP_UpdateRegistration(oRegData.Id, oRegData.Pwd, oRegData.Email, oRegData.ScholName, oRegData.Phno, oRegData.F1, oRegData.F2, oRegData.F3, oRegData.F4, oRegData.IsActive);
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        #endregion
        #region Get School Registration
        public List<PR_SuplierSrgistration> GetWholeSecRegDetail()
        {
            List<PR_SuplierSrgistration> objRegDetail = (from AM in db.TBL_SP_Ragistrations
                                                       //  where AM.IsActive == 1
                                                         select new PR_SuplierSrgistration
                                                        {
                                                            Uid = AM.Uid,
                                                            Id = AM.Id,
                                                            Email = AM.Email,
                                                            ScholName = AM.ScholName,
                                                            Phno = AM.Phno,
                                                            Pwd = AM.Pwd,
                                                            F1 = AM.F1,
                                                            F2 = AM.F2,
                                                            F3 = AM.F3,
                                                            F4 = AM.F4,
                                                            IsActive=AM.IsActive
                                                        }).ToList();
            return objRegDetail;
        }

        public int LoginAuth(string id, string pwd)
        {
            try
            {
                var secD = (from AM in db.TBL_SP_Ragistrations
                            where AM.Id == id && AM.Pwd == pwd && AM.IsActive == 1
                            select new PR_SuplierSrgistration
                            {
                                Uid = AM.Uid
                            }).ToList();
                if (secD.Count() != 0) { return 1; }
                else return 0;
            }
            catch { return 0; }

        }
        public List<PR_SuplierSrgistration> ForgetPassword(string email)
        {
            try
            {
                var objUserDetail = (from AM in db.TBL_SP_Ragistrations
                                     where AM.Email == email && AM.IsActive == 1
                                     select new PR_SuplierSrgistration
                                     {
                                         Id = AM.Id,
                                         Pwd = AM.Pwd,
                                         Uid = AM.Uid
                                     }).ToList();
                return objUserDetail;
            }
            catch { return null; }

        }

        #endregion
    }
}
