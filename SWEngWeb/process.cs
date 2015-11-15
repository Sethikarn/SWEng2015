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
    }
}