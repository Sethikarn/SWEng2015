using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace no1
{
    public partial class SaveCPE1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user1 = (PreviousPage.FindControl("username")) as Label;
            username.Text = user1.Text;
            CheckUser(username);
        }

        protected void CheckUser(Label user)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM student where s_id = '" + username.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();

            string id = "";
            while (read2.Read())
            {
                id = read2["idproject"].ToString();
                if (id != "")
                {
                    ShowProject.Text = read2["idproject"].ToString();  
                }  
            }
        }


        protected void logout_Click(object sender, EventArgs e)
        {
            Server.Transfer("WebForm1.aspx");
        }

        protected void about_Click(object sender, EventArgs e)
        {
            Server.Transfer("About.aspx");
        }
    }
}
   