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
    public partial class CPE01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*//////////////////////////////--------------- Check is login ---------------///////////////////////////////
            if not login redirect to login page 
                otherwise continue
            */
            if (!user.isLogin())
            {
                Response.Redirect("~/");
            }

            /*//////////////////////////////--------------- Check is user have project ---------------///////////////////////////////
            connect to database by userID and get projectID

            if user have projectID that mean user already have project continue
                otherwise redirect to CreateProject
            */
            Page.MaintainScrollPositionOnPostBack = true;
            string constr = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            String Checkuser = "select projectID from position where personID ='" + user.userID() + "'" + "and personStatusID = '1'";
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var projectID = com.ExecuteScalar();
            conn.Close();

            if (projectID == null)
                Response.Redirect("CreateProject.aspx");

            /*//////////////////////////////--------------- Check is user have project ---------------///////////////////////////////
            */
        }
    }
}