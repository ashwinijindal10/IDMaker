using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class StusentClass
    {
        public List<string> lstStudentClass()
        {
            List<string> cls = new List<string>();
            cls.Add("--- Select Class ---");
            cls.Add("LKG");
            cls.Add("UKG");
            cls.Add("I");
            cls.Add("II");
            cls.Add("III");
            cls.Add("IV");
            cls.Add("V");
            cls.Add("VI");
            cls.Add("VII");
            cls.Add("VIII");
            cls.Add("IX");
            cls.Add("X");
            cls.Add("XI");
            cls.Add("XII");            
            return cls;
        
        }
    }
}