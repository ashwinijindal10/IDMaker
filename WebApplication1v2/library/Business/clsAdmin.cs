using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
    public class clsAdmin
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
            #region Add new Admin Ragistation or Login
         public string InsertRagistration(PR_AdminRegistration oRegData)
        {
            try
            {
                db.SP_Tbl_Adm_InsertschoolRegistration(oRegData.Id, oRegData.Pwd, oRegData.Email, oRegData.ScholName, oRegData.Phno, oRegData.F1, oRegData.F2, oRegData.F3, oRegData.F4, oRegData.IsActive);
                return "1";
            }
            catch (Exception e)
            {
                return e.Message + "";
            }
        }
        public int UpdateRagistration(PR_AdminRegistration oRegData)
        {
            try
            {
                db.SP_tbl_Adm_UpdateRegistration(oRegData.Id, oRegData.Pwd, oRegData.Email, oRegData.ScholName, oRegData.Phno, oRegData.F1, oRegData.F2, oRegData.F3, oRegData.F4, oRegData.IsActive);
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        #endregion
        #region Get School Registration
        public List<PR_AdminRegistration> GetWholeSecRegDetail()
        {
            List<PR_AdminRegistration> objRegDetail = (from AM in db.tbl_Admin_Registrations
                                                       where AM.IsActive == 1
                                                       select new PR_AdminRegistration
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
                                                             F4 = AM.F4
                                                         }).ToList();
            return objRegDetail;
        }

        public int LoginAuth(string id, string pwd)
        {
            try
            {
                var secD = (from AM in db.tbl_Admin_Registrations
                            where AM.Id == id && AM.Pwd == pwd && AM.IsActive == 1
                            select new PR_AdminRegistration
                            {
                                Uid = AM.Uid
                            }).ToList();
                if (secD.Count() != 0) { return 1; }
                else return 0;
            }
            catch { return 0; }

        }
        public List<PR_AdminRegistration> ForgetPassword(string email)
        {
            try
            {
                var objUserDetail = (from AM in db.tbl_Admin_Registrations
                                     where AM.Email == email && AM.IsActive == 1
                                     select new PR_AdminRegistration
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

        #region Admin School Alote
        public int AdminSchoolAlote(PR_SchoolRegistration oRegData)
        {
            try
            {
                //F1 is Supplier ID so School Connect to Supplier
                db.SP_AdminSchoolAlote(oRegData.Id, oRegData.F1);
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int AdminSchoolAloteAll(PR_SchoolRegistration oRegData)
        {
            try
            {
                //F1 is Supplier ID so School Connect to Supplier
                db.SP_AdminSchoolAloteAll(oRegData.F1);
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int ActivateDeactivatSupplier(string supID,int isactive)
        {
            try
            {
                //F1 is Supplier ID so School Connect to Supplier
                db.SP_tbl_SP_UpdateRegistrationActive(supID, isactive);
                return 1;
            }
            catch
            {
                return 0;
            }


        }
        #endregion
            
    }
}
