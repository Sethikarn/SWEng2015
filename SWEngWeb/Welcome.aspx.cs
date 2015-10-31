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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sIsAuthenticated"] != null)
            {
                if (Session["sIsAuthenticated"].Equals(true))
                {
                    Response.Redirect("~/Home.aspx");
                }
            }
        }

        protected void checkProfessor(TextBox user, TextBox pass)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM person where username = '" + user.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();

            while (read2.Read())
            {
                if (pass.Text == read2["password"].ToString() && read2["position"].ToString() == "T")
                {
                    Server.Transfer("HomeForProfessor.aspx");
                }

            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            string n = user.Text;
            //username.Text = n;
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM person where username = '" + user.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();

            while (read2.Read())
            {
                if (TextBox2.Text == read2["password"].ToString())
                {
                    Session["sIsAuthenticated"] = true;
                    Session["AuthenName"] = n;
                    Response.Redirect("~/Home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('l001 : ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง');</script>");
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