using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SWEngWeb
{
    public static class user
    {
        public static string name()
        {
            return HttpContext.Current.Session["name"].ToString();
        }

        public static string userName()
        {
            return HttpContext.Current.Session["userName"].ToString();
        }

        public static string position()
        {
            if (HttpContext.Current.Session["position"].ToString() == "S")
            {
                return "student";
            }
            return "teacher";
        }

        public static bool login(string userName ,string password)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT password , title , firstName , lastName , position FROM person where username = '" + userName + "'", con);
            SqlDataReader read = myCommand.ExecuteReader();
            if (read.Read())
            {
                if (password == read["password"].ToString())
                {
                    HttpContext.Current.Session["userName"] = userName;
                    HttpContext.Current.Session["name"] = read["title"].ToString() + read["firstName"].ToString() + " " + read["lastName"].ToString();
                    HttpContext.Current.Session["position"] = read["position"].ToString();
                    con.Close();
                    return true;
                }
                else
                {
                    con.Close();
                    return false;
                }
            }
            con.Close();
            return false;
        }

        public static bool isLogin()
        {
            return (HttpContext.Current.Session["userName"] != null);
        }

        public static void logout()
        {
            HttpContext.Current.Session["userName"] = null;
            HttpContext.Current.Session["name"] = null;
            HttpContext.Current.Session["position"] = null;

            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Session.RemoveAll();

            HttpContext.Current.Response.Redirect("~/");
        }
    }
}