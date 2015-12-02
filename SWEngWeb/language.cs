using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SWEngWeb
{
    public static class language
    {
        public static int getLanguage()
        {
            int L = 0;

            if (HttpContext.Current.Session["language"] == null)
                HttpContext.Current.Session["language"] = "0";
            else
                L = int.Parse(HttpContext.Current.Session["language"].ToString());

            return L;
        }

        public static string[] login = { "เข้าสู่ระบบ", "Login" };
    }
}