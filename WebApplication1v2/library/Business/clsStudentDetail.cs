using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
        
    public class clsStudentDetail
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        public string InsertStudetDetail(PR_StudentDetail oStd)
        {
            try
            {
                db.Sp_insertStudentDetail(oStd.SchoolUID, oStd.ScholarNo, oStd.StudentName, oStd.FatherName, oStd.MotherName, oStd.BloodGroup, oStd.PhoneNumber, oStd.DateofBarth, oStd.Class, oStd.EmailId, oStd.Addres, oStd.StudentPhoto, oStd.F1, oStd.F2, oStd.F3, oStd.F4, oStd.LastUpdated, oStd.Status, oStd.IsActive);
                return "1";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
        public string UpdateStudetDetail(PR_StudentDetail oStd)
        {
            try
            {
                db.Sp_UpdateStudentDetail(oStd.ScholarNo_Old, oStd.SchoolUID, oStd.ScholarNo, oStd.StudentName, oStd.FatherName, oStd.MotherName, oStd.BloodGroup, oStd.PhoneNumber, oStd.DateofBarth, oStd.Class, oStd.EmailId, oStd.Addres, oStd.StudentPhoto, oStd.F1, oStd.F2, oStd.F3, oStd.F4, oStd.LastUpdated, oStd.Status, oStd.IsActive);
                return "1";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
        public string UpdateStudetDetailStatus(PR_StudentDetail oStd)
        {
            try
            {
                db.Sp_UpdateStudentDetailStatus(oStd.SchoolUID, oStd.ScholarNo, oStd.Status);
                return "1";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
        public string UpdateSchoolWiseStudetDetailStatus(string  oStd,int status)
        {
            try
            {
                db.Sp_UpdateSchoolWiseStudentDetailStatus(oStd,status);
                return "1";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
        public string DeleteStudetDetail(PR_StudentDetail oStd)
        {
            try
            {
                db.Sp_DeleteStudentDetail(oStd.SchoolUID, oStd.ScholarNo);
                return "1";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
        public List<PR_StudentDetail> GetStudentDetail(string vSchoolID, string SchoralID)
        {
            var lst = (from m in db.StudentDetails
                       where m.SchoolUID == vSchoolID && m.ScholarNo == SchoralID && m.IsActive==1
                       select new PR_StudentDetail 
                       {
                           SchoolUID=m.SchoolUID,
                           ScholarNo  =m.ScholarNo,
                           StudentName=m.StudentName,
                           FatherName =m.FatherName,
                           MotherName =m.MotherName,
                           BloodGroup =m.BloodGroup,
                           PhoneNumber=m.PhoneNumber,
                           DateofBarth=m.DateofBarth,
                           Class=m.Class,
                           EmailId =m.EmailId,
                           Addres =m.Addres,
                           StudentPhoto=m.StudentPhoto,
                           F1 =m.F1,
                           F2 =m.F2,
                           F3 =m.F3,
                           F4 =m.F4,
                           LastUpdated=m.LastUpdated,
                           Status =m.Status,
                           IsActive =m.IsActive                       
                       }).ToList();
            return lst;
        }
        public List<PR_StudentDetail> GetStudentDetail(string vSchoolID)
        {
            var lst = (from m in db.StudentDetails
                       where m.SchoolUID == vSchoolID  && m.IsActive == 1
                       select new PR_StudentDetail
                       {
                           SchoolUID = m.SchoolUID,
                           ScholarNo = m.ScholarNo,
                           StudentName = m.StudentName,
                           FatherName = m.FatherName,
                           MotherName = m.MotherName,
                           BloodGroup = m.BloodGroup,
                           PhoneNumber = m.PhoneNumber,
                           DateofBarth = m.DateofBarth,
                           Class = m.Class,
                           EmailId = m.EmailId,
                           Addres = m.Addres,
                           StudentPhoto = m.StudentPhoto,
                           F1 = m.F1,
                           F2 = m.F2,
                           F3 = m.F3,
                           F4 = m.F4,
                           LastUpdated = m.LastUpdated,
                           Status = m.Status,
                           IsActive = m.IsActive
                       }).ToList();
            return lst;
        }
        public List<PR_StudentDetail> GetStudentDetail()
        {
            var lst = (from m in db.StudentDetails
                       where m.IsActive == 1
                       select new PR_StudentDetail
                       {
                           SchoolUID = m.SchoolUID,
                           ScholarNo = m.ScholarNo,
                           StudentName = m.StudentName,
                           FatherName = m.FatherName,
                           MotherName = m.MotherName,
                           BloodGroup = m.BloodGroup,
                           PhoneNumber = m.PhoneNumber,
                           DateofBarth = m.DateofBarth,
                           Class = m.Class,
                           EmailId = m.EmailId,
                           Addres = m.Addres,
                           StudentPhoto = m.StudentPhoto,
                           F1 = m.F1,
                           F2 = m.F2,
                           F3 = m.F3,
                           F4 = m.F4,
                           LastUpdated = m.LastUpdated,
                           Status = m.Status,
                           IsActive = m.IsActive
                       }).ToList();
            return lst;
        }

        public string InsertSchoolFild(PR_SchoolFild oStd)
        {
            try
            {
                db.Sp_insertSchoolIDFild(oStd.SchoolID, oStd.MyIdFild, oStd.lasUpdatedTime);
                return "1";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
        public string UpdateSchoolFild(PR_SchoolFild oStd)
        {
            try
            {
                db.Sp_UpdateSchoolIDFild(oStd.SchoolID, oStd.MyIdFild, oStd.lasUpdatedTime);
                return "1";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }


        public List<PR_SchoolFild> GetSchoolFild(string SchoolID)
        {
            var lst = (from m in db.SchoolIdFilds
                       where m.SchoolID == SchoolID
                       select new PR_SchoolFild
                       {
                           MyIdFild = m.MyIdFild,
                           lasUpdatedTime=m.lasUpdatedTime
                       }).ToList();
            return lst;
        }
        

    }
}
