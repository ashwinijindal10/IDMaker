using System;
using System.Collections.Generic; 
using System.Linq;
using System.Text;
using System.Configuration;

namespace Business
{
    public class SchoolRagistration
    {
        
        DataClasses1DataContext db = new DataClasses1DataContext();
        #region Add new School Ragistation or Login
        public string InsertRagistration(PR_SchoolRegistration oRegData)
        {
            try
            {
                db.SP_InsertschoolRegistration(oRegData.Id, oRegData.Pwd, oRegData.Email, oRegData.ScholName, oRegData.Phno, oRegData.F1, oRegData.F2, oRegData.F3, oRegData.F4, oRegData.IsActive);
                return "1";
            }
            catch(Exception e)
            {
                return e.Message+"";
            }
        }
        public int UpdateRagistration(PR_SchoolRegistration oRegData)
        {
            try
            {
                db.SP_UpdateRegistration(oRegData.Id, oRegData.Pwd, oRegData.Email, oRegData.ScholName, oRegData.Phno, oRegData.F1, oRegData.F2, oRegData.F3, oRegData.F4, oRegData.IsActive);
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int UpdateStudentPhotoID(string ScholUID,string SchoolerId,string PhotoID)
        {
            try
            {
                db.Sp_UpdateStudentPHOTOID(ScholUID, SchoolerId, PhotoID);
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        #endregion
        #region Get School Registration
        public List<PR_SchoolRegistration> GetWholeSecRegDetail()
        {
            List<PR_SchoolRegistration> objRegDetail = (from AM in db.School_Ragistrations
                                                        where AM.IsActive==1
                                                        select new PR_SchoolRegistration
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
                var secD = (from AM in db.School_Ragistrations
                            where AM.Id == id && AM.Pwd == pwd && AM.IsActive == 1
                            select new PR_SchoolRegistration
                            {
                                Uid = AM.Uid
                            }).ToList();
                if (secD.Count() != 0) { return 1; }
                else return 2;
            }
            catch { return 3; }

        }
        public List<PR_SchoolRegistration> ForgetPassword(string email)
        {
            try
            {
                var objUserDetail = (from AM in db.School_Ragistrations
                                     where AM.Email.ToLower() == email.ToLower() && AM.IsActive == 1
                                     select new PR_SchoolRegistration
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

        #region Add new School Profile
        public int InsertSchoolProfile(PR_SchoolProfile objProfile)
        {
            try
            {
                db.Sp_insertSchoolProfile(objProfile.id, objProfile.SchoolName, objProfile.PrincipalName, objProfile.DiectorName, objProfile.Address, objProfile.Village, objProfile.Tehsil, objProfile.District, objProfile.State, objProfile.PIN, objProfile.Phno1, objProfile.Phno2, objProfile.LandLine1, objProfile.LandLine2, objProfile.SchoolLogo, objProfile.SchoolWebSite, objProfile.Emailid, objProfile.SchoolEstb, objProfile.AuthSign, objProfile.F1, objProfile.F2, objProfile.F3, objProfile.F4, objProfile.IsActive);
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int UpdateSchoolProfile(PR_SchoolProfile objProfile)
        {
            try
            {
                db.Sp_UpdateSchoolProfile(objProfile.id, objProfile.SchoolName, objProfile.PrincipalName, objProfile.DiectorName, objProfile.Address, objProfile.Village, objProfile.Tehsil, objProfile.District, objProfile.State, objProfile.PIN, objProfile.Phno1, objProfile.Phno2, objProfile.LandLine1, objProfile.LandLine2, objProfile.SchoolLogo, objProfile.SchoolWebSite, objProfile.Emailid, objProfile.SchoolEstb, objProfile.AuthSign, objProfile.F1, objProfile.F2, objProfile.F3, objProfile.F4, objProfile.IsActive);
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        #endregion

        #region Get School Profile
        public List<PR_SchoolProfile> GetSchoolProfile(string id)
        {
            try
            {
                var oData = (from AM in db.SchoolProfiles
                             where AM.id == id && AM.IsActive == 1
                             select new PR_SchoolProfile 
                             { 
                                 SchoolName=AM.SchoolName,
                                 PrincipalName=AM.PrincipalName,
                                 DiectorName=AM.DiectorName,
                                 Address=AM.Address,
                                 Village=AM.Village,
                                 Tehsil=AM.Tehsil,
                                 District=AM.District,
                                 State=AM.State,
                                 PIN=AM.PIN,
                                 Phno1=AM.Phno1,
                                 Phno2 =AM.Phno1,
                                 LandLine1 =AM.LandLine1,
                                 LandLine2=AM.LandLine2,
                                 SchoolLogo=AM.SchoolLogo,
                                 SchoolWebSite=AM.SchoolWebSite,
                                 Emailid=AM.Emailid,
                                 SchoolEstb=AM.SchoolEstb,
                                 AuthSign=AM.AuthSign,
                                 F1 =AM.F1,
                                 F2 =AM.F2,
                                 F3 =AM.F3,
                                 F4 =AM.F4,
                                 IsActive=AM.IsActive
                             }).ToList();
                return oData;

            }
            catch
            { return null; }
        }

        #endregion 

        
    }
}