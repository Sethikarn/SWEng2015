using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SWEngWeb
{
    static public class CPE01Var
    {
        //CPE01 var
        static public string thaiName;
        static public string englishName;
        static public string memberCount = "1";
        static public string[] memberID = new string[2];
        static public string[,] memberInforCS = new string[3, 5]; // 3person 5data{title , firstName , lastName , phoneNumber , email}
        static public string[] displayMember = new string[3] { "selected=\"selected\"", "", "" };
        static public ArrayList teacherIDList = new ArrayList();
        static public bool[] memberCheck = new bool[2];

        public static void clear()
        {
            thaiName = "";
            englishName = "";
            memberCount = "1";
            memberID = new string[2];
            memberInforCS = new string[3, 5]; // 3person 5data{title , firstName , lastName , phoneNumber , email}
            displayMember = new string[3] { "selected=\"selected\"", "", "" };
            memberCheck = new bool[2];
        }
    }
}