using System;
using System.Collections;
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
    public static class GlobalVar
    {
        /****************************************** -- user data -- ****************************************************/
        /****************************************** -- user data -- ****************************************************/
        /****************************************** -- user data -- ****************************************************/

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

        public static string userID()
        {
            return HttpContext.Current.Session["userID"].ToString();
        }

        public static int ontificationCount()
        {
            int count = 0;

            string constr = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            String Checkuser = "select * from request where replyID =" + user.userID();
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var reader = com.ExecuteReader();
            while (reader.Read())
            {
                count++;
            }
            conn.Close();
            return count;
        }

        public static int projectID()
        {
            int projectID = 0;

            string constr = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            String Checkuser = "select projectID from position where personID =" + user.userID() + " and personStatusID = 1";
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var reader = com.ExecuteScalar();
            conn.Close();
            if (reader != null)
                projectID = int.Parse(reader.ToString());
            return projectID;
        }

        public static string thaiProjectName()
        {
            string tName = "";
            string constr = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            String Checkuser = "select thaiName from project where projectID =" + projectID().ToString();
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var reader = com.ExecuteScalar();
            if (reader != null)
                tName = reader.ToString();
            conn.Close();
            return tName;
        }

        /****************************************** -- user action -- ****************************************************/
        /****************************************** -- user action -- ****************************************************/
        /****************************************** -- user action -- ****************************************************/

        public static bool login(string userName ,string password)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT password , title , firstName , lastName , position , personID FROM person where username = '" + userName + "'", con);
            SqlDataReader read = myCommand.ExecuteReader();
            if (read.Read())
            {
                if (password == read["password"].ToString())
                {
                    HttpContext.Current.Session["userName"] = userName;
                    HttpContext.Current.Session["name"] = read["title"].ToString() + read["firstName"].ToString() + " " + read["lastName"].ToString();
                    HttpContext.Current.Session["position"] = read["position"].ToString();
                    HttpContext.Current.Session["userID"] = read["personID"].ToString();
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
            HttpContext.Current.Session["personID"] = null;

            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Session.RemoveAll();

            HttpContext.Current.Response.Redirect("~/");
        }

        /****************************************** -- page data -- ****************************************************/
        /****************************************** -- page data -- ****************************************************/
        /****************************************** -- page data -- ****************************************************/

        public static bool creating = false;
        public static string userIDs;
        public static string userStatus;
        public static string showPage;
        public static string displayNotHaveProjectMenu = "style=\"display: none;\"";
        public static string displayCreateProject = "style=\"display: none;\"";

        //CPE01 var
        public static string thaiName;
        public static string englishName;
        public static string memberCount = "1";
        public static string[] memberID = new string[2];
        public static string[,] memberInforCS = new string[3, 5]; // 3person 5data{title , firstName , lastName , phoneNumber , email}
        public static string[] displayMember = new string[3] { "selected=\"selected\"", "", "" };
        public static ArrayList teacherIDList = new ArrayList();
        public static bool[] memberCheck = new bool[2];

        public static void clear()
        {
            creating = false;
            userIDs = "";
            userStatus = "";
            showPage = "";
            displayNotHaveProjectMenu = "style=\"display: none;\"";
            displayCreateProject = "style=\"display: none;\"";


            //CPE01 var
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