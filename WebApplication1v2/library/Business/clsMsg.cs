using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
    public class clsMsg
    {
        #region Get School Registration
        DataClasses1DataContext db = new DataClasses1DataContext();
        public List<PR_MessagetoSchool> GetWholeSecmessage(string UID)
        {
            List<PR_MessagetoSchool> objRegDetail = (from AM in db.MessagetoSchools
                                                         select new PR_MessagetoSchool
                                                         {
                                                             id = AM.id,
                                                             Mesage = AM.Mesage,
                                                             updatetime = AM.updatetime,
                                                             UID = AM.UID                                                            
                                                         }).ToList();
            return objRegDetail;
        }
        public List<PR_MessagetoSchool> Gettopmessage(string UID)
        {
            List<PR_MessagetoSchool> objRegDetail = (from AM in db.MessagetoSchools
                                                     where AM.id>(db.MessagetoSchools.Select(a=>a.UID).Count()-10)
                                                     select new PR_MessagetoSchool
                                                     {
                                                         id = AM.id,
                                                         Mesage = AM.Mesage,
                                                         updatetime = AM.updatetime,
                                                         UID = AM.UID
                                                     }).ToList();
            return objRegDetail;
        }



        public int InsertMessage(string UID, string Msg)
        {
            try
            {
                db.SP_Message(UID, Msg, System.DateTime.Now);
                return 1;
            }
            catch { return 0; }
        }
        #endregion
    }
}
