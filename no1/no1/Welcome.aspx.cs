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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void checkProfessor(TextBox user, TextBox pass)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM professor where pr_id = '" + user.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();

            while (read2.Read())
            {
                if (pass.Text == read2["pr_password"].ToString())
                {
                    Server.Transfer("HomeForProfessor.aspx");
                }

            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            string n = user.Text;
            username.Text = n;
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM student where s_id = '" + user.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();

            while (read2.Read())
            {
                if (TextBox2.Text == read2["s_password"].ToString())
                {
                    Session["sIsAuthenticated"] = true;
                    Session["AuthenName"] = n;
                    Response.Redirect("~/Home.aspx");
                }
                else
                {
                    username.Text = "Incorect username or password!";
                }
            }
            checkProfessor(user, TextBox2);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("About.aspx");
        }

        protected void btabout_Click(object sender, EventArgs e)
        {
            Server.Transfer("About.aspx");
        }

    }
}