using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace SWEngWeb
{
    public class process
    {
        public static string connectionString = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        public static string createProject(string thaiName , string englishName , string memberCount)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("INSERT INTO project (thaiName, englishName , memberCount, lastStatus ,lastUpdate) OUTPUT INSERTED.projectID VALUES (@thaiName, @englishName , @memberCount, @lastStatus , @lastUpdate)");
            cmd.CommandType = CommandType.Text;
            cmd.Connection = connection;
            cmd.Parameters.AddWithValue("@thaiName", thaiName);
            cmd.Parameters.AddWithValue("@englishName", englishName);
            cmd.Parameters.AddWithValue("@memberCount", memberCount);
            cmd.Parameters.AddWithValue("@lastStatus", "0");
            DateTime myDateTime = DateTime.Now;
            cmd.Parameters.AddWithValue("@lastUpdate", myDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
            connection.Open();
            var projectIDCS = cmd.ExecuteScalar();
            connection.Close();
            return projectIDCS.ToString();
        }

        public static void setStatus(string personID , string projectID , string status)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("INSERT INTO position (personID, projectID , personStatusID) VALUES (@personID, @projectID , @personStatusID)");
            cmd.CommandType = CommandType.Text;
            cmd.Connection = connection;
            cmd.Parameters.AddWithValue("@personID", personID );
            cmd.Parameters.AddWithValue("@projectID", projectID);
            cmd.Parameters.AddWithValue("@personStatusID", status);
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public static void makeRequest(string actionID , string projectID , string replyID)
        {
            DateTime myDateTime = DateTime.Now;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("INSERT INTO request (actionID, projectID , requesterID, replyID ,requestDateTime) VALUES (@actionID, @projectID , @requesterID, @replyID ,@requestDateTime)");
            cmd.CommandType = CommandType.Text;
            cmd.Connection = connection;
            cmd.Parameters.AddWithValue("@actionID", actionID);
            cmd.Parameters.AddWithValue("@projectID", projectID);
            cmd.Parameters.AddWithValue("@requesterID", user.userID());
            cmd.Parameters.AddWithValue("@replyID", replyID);
            cmd.Parameters.AddWithValue("@requestDateTime", myDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public static void checkCPE01(string pid)
        {
            bool pass = true;
            bool fail = false;
            SqlConnection conn = new SqlConnection(connectionString);
            //try
            {
            conn.Open();
            String cmd = "SELECT personStatusID FROM position WHERE projectID = "+ pid;
            SqlCommand com = new SqlCommand(cmd, conn);
            SqlDataReader reader = com.ExecuteReader();
            while(reader.Read())
            {
                   string temp = reader[0].ToString();
                   if ( temp == "11" || temp == "12" || temp == "13" || temp == "14" || temp == "0" || temp == "30" || temp == "40" || temp == "50")
                    {
                        pass = false;
                        if (temp == "0" || temp == "30" || temp == "40" || temp == "50")
                        {
                            fail = true;
                            break;
                        }
                    }
            }
            conn.Close();
            }
            //catch
            {
                HttpContext.Current.Response.Write("<script>alert('E0011 : เกิดข้อผิดพลาดในการดำเนินการ');</script>");
            }

            ///////////////////////////////////////////////

            if (fail)
            {
                //try
                {
                    conn.Open();
                    String cmd = "UPDATE project SET lastStatus = 2 WHERE projectID = " + pid;
                    SqlCommand com = new SqlCommand(cmd, conn);
                    com.ExecuteNonQuery();
                    conn.Close();
                }
                //catch
                {
                    HttpContext.Current.Response.Write("<script>alert('E0011 : เกิดข้อผิดพลาดในการดำเนินการ');</script>");
                }
            }

            ///////////////////////////////////////////////

            if (pass)
            {
                try
                {
                    conn.Open();
                    String cmd = "UPDATE project SET lastStatus = 3 WHERE projectID = " + pid;
                    SqlCommand com = new SqlCommand(cmd, conn);
                    com.ExecuteNonQuery();
                    conn.Close();
                }
                catch
                {
                    HttpContext.Current.Response.Write("<script>alert('E0011 : เกิดข้อผิดพลาดในการดำเนินการ');</script>");
                }
            }
        }

        public static void deleteREQ(string acID)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
            conn.Open();
            String cmd = "DELETE FROM request WHERE requestID = " + acID + ";";
            SqlCommand com = new SqlCommand(cmd, conn);
            var reader = com.ExecuteNonQuery();
            conn.Close();
            }
            catch
            {
                HttpContext.Current.Response.Write("<script>alert('E012 : เกิดข้อผิดพลาดในการดำเนินการ');</script>");
            }
        }

        public static string createCPE02(string subject, string conclusion)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("INSERT INTO CPE02 (projectID , subject , conclusion , sentDate) OUTPUT INSERTED.projectID VALUES (@projectID, @subject , @conclusion, @sentDate)");
            cmd.CommandType = CommandType.Text;
            cmd.Connection = connection;
            cmd.Parameters.AddWithValue("@projectID", user.projectID());
            cmd.Parameters.AddWithValue("@subject", subject);
            cmd.Parameters.AddWithValue("@conclusion", conclusion);
            DateTime myDateTime = DateTime.Now;
            cmd.Parameters.AddWithValue("@sentDate", myDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
            connection.Open();
            var cpe02ID = cmd.ExecuteScalar();
            connection.Close();


            upto4(user.projectID());
            return cpe02ID.ToString();
        }

        public static void checkCPE02(string processID)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            String cmd = "UPDATE CPE02 SET adviserCheck = 'Y' WHERE processID = " + processID;
            SqlCommand com = new SqlCommand(cmd, conn);
            com.ExecuteNonQuery();
            conn.Close();
        }

        public static void upto4(string pid)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();
                String cmd = "UPDATE project SET lastStatus = 4 WHERE projectID = " + pid;
                SqlCommand com = new SqlCommand(cmd, conn);
                com.ExecuteNonQuery();
                conn.Close();
            }
            catch
            {
                HttpContext.Current.Response.Write("<script>alert('E0018 : เกิดข้อผิดพลาดในการดำเนินการ');</script>");
            }

            ///////////////////////////////////////////////
        }
    }
}