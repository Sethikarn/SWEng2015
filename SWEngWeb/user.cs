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
        public static string connectionString = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        public static string name()
        {
            return HttpContext.Current.Session["name"].ToString();
        }

        public static int ontificationCount()
        {
            int count = 0;
            
            SqlConnection conn = new SqlConnection(connectionString);
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

        public static bool userHaveProject()
        {
            bool havePro = false;
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            String Checkuser = "select projectID from position where personID ='" + user.userID() + "'" + "and personStatusID = '1'";
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var projectID = com.ExecuteScalar();
            conn.Close();

            if (projectID != null)
                havePro = true;

            return havePro;
        }

        public static int projectID()
        {
            int projectID = 0;
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            String Checkuser = "select projectID from position where personID =" + user.userID() + " and personStatusID = 1";
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var reader = com.ExecuteScalar();
            conn.Close();
            if(reader != null)
               projectID = int.Parse(reader.ToString());
            return projectID;
        }

        public static string thaiProjectName()
        {
            string tName = "";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            String Checkuser = "select thaiName from project where projectID =" + projectID().ToString() ;
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var reader = com.ExecuteScalar();
            if(reader != null)
               tName = reader.ToString();
            conn.Close();
            return tName;
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

        public static bool login(string userName ,string password)
        {
            SqlConnection con = new SqlConnection(connectionString);
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
    }
}