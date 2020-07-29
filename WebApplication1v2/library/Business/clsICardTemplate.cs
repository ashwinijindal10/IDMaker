using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
    public class clsICardTemplate
    {
        DataClasses1DataContext _db = new DataClasses1DataContext();
        public string SaveTemplate(IDTemplate template)
        {
            try
            {
                var result = _db.Sp_saveStudentIDCard(template.Id, template.SecUID, template.Name, template.Format);
                return result.ToString();
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public bool DeleteTemplate(int templateId,string SecUD, out string error)
        {
            try
            {
                error = "";
                var result = _db.StudentIDCardTemplates.Where(x => x.SecUID == SecUD).First(f => f.Id == templateId);
                if (result != null)
                    _db.StudentIDCardTemplates.DeleteOnSubmit(result);
                _db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                error = ex.Message;
            }
            return false;
        }
        public List<IDTemplate> GetIDTemplates(string SecUID)
        {
            return _db.StudentIDCardTemplates.Where(x => x.SecUID == SecUID || x.SecUID == "Admin").Select(t => new IDTemplate { Id = t.Id, Format = t.Format, Name = t.Name, SecUID = t.SecUID }).ToList();
        }

    }


    public class IDTemplate
    {
        public int Id { set; get; }
        public string Name { set; get; }
        public string Format { set; get; }
        public string SecUID { set; get; }
    }
}
