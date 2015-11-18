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
    public partial class notification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (user.isLogin())
            {

            }
            else
            {
                Response.Redirect("~/");
            }
        }

        public static string connectionString = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        
        public static List<string[]> getReq()
        {
            string[] data = new string[5];
            List<string[]> result = new List<string[]>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            String cmd = "select * from request where replyID =" + user.userID() + " ORDER BY requestDateTime ASC";
            SqlCommand com = new SqlCommand(cmd, conn);
            var reader = com.ExecuteReader();
            while (reader.Read())
            {
                data = new string[5];
                data[0] = reader["requestID"].ToString();
                data[1] = reader["actionID"].ToString();
                data[2] = reader["projectID"].ToString();
                data[3] = reader["requesterID"].ToString();
                data[4] = reader["requestDateTime"].ToString();
                result.Add(data);
            }
            conn.Close();

            return result;
        }

        protected void tests(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }
    }
}