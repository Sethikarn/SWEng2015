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

        public static void setStatus(string personID , string projectID , string status)
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);
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
    }
}