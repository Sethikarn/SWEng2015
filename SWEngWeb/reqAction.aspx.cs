using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWEngWeb
{
    public partial class reqAction : System.Web.UI.Page
    {
        public static string connectionString = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(! user.isLogin())
            {
                Response.Redirect("~/About.aspx");
            }

            try {
                string acID = Request.QueryString["acID"].ToString();
                string ac = Request.QueryString["ac"].ToString();
                string rep = Request.QueryString["rep"].ToString();
                string pid = Request.QueryString["pid"].ToString();

                if (ac == "1" && rep == "yes")
                {
                    SqlConnection conn = new SqlConnection(connectionString);
                    conn.Open();
                    String cmd = "DELETE FROM request WHERE requestID = "+ acID +";";
                    SqlCommand com = new SqlCommand(cmd, conn);
                    var reader = com.ExecuteNonQuery();
                    conn.Close();
                    
                    conn.Open();
                    cmd = "UPDATE position SET personStatusID = 1 WHERE personID ="+user.userID()+" AND projectID =" + pid + " AND personStatusID = 11; ";
                    com = new SqlCommand(cmd, conn);
                    reader = com.ExecuteNonQuery();
                    conn.Close();
                }

                if (ac == "3" && rep == "yes")
                {
                    SqlConnection conn = new SqlConnection(connectionString);
                    conn.Open();
                    String cmd = "DELETE FROM request WHERE requestID = " + acID + ";";
                    SqlCommand com = new SqlCommand(cmd, conn);
                    var reader = com.ExecuteNonQuery();
                    conn.Close();

                    conn.Open();
                    cmd = "UPDATE position SET personStatusID = 2 WHERE personID =" + user.userID() + " AND projectID =" + pid + " AND personStatusID = 12; ";
                    com = new SqlCommand(cmd, conn);
                    reader = com.ExecuteNonQuery();
                    conn.Close();
                }

                if (ac == "4" && rep == "yes")
                {
                    SqlConnection conn = new SqlConnection(connectionString);
                    conn.Open();
                    String cmd = "DELETE FROM request WHERE requestID = " + acID + ";";
                    SqlCommand com = new SqlCommand(cmd, conn);
                    var reader = com.ExecuteNonQuery();
                    conn.Close();

                    conn.Open();
                    cmd = "UPDATE position SET personStatusID = 3 WHERE personID =" + user.userID() + " AND projectID =" + pid + " AND personStatusID = 13; ";
                    com = new SqlCommand(cmd, conn);
                    reader = com.ExecuteNonQuery();
                    conn.Close();
                }

                if (ac == "5" && rep == "yes")
                {
                    SqlConnection conn = new SqlConnection(connectionString);
                    conn.Open();
                    String cmd = "DELETE FROM request WHERE requestID = " + acID + ";";
                    SqlCommand com = new SqlCommand(cmd, conn);
                    var reader = com.ExecuteNonQuery();
                    conn.Close();

                    conn.Open();
                    cmd = "UPDATE position SET personStatusID = 4 WHERE personID =" + user.userID() + " AND projectID =" + pid + " AND personStatusID = 14; ";
                    com = new SqlCommand(cmd, conn);
                    reader = com.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch
            {

            }

            Response.Redirect("Notification.aspx");
        }
    }
}