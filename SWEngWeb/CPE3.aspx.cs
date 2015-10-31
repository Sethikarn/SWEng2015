using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWEngWeb
{
    public partial class CPE3 : System.Web.UI.Page
    {
        string constr1 = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (user.isLogin())
            {

            }
            else
            {
                Response.Redirect("~/");
            }

            if (Page.PreviousPage != null)
            {
                var user1 = (PreviousPage.FindControl("username")) as Label;
                username.Text = user1.Text;
            }
            CheckUser(username);
            gvStdDe();
        }

        protected void CheckUser(Label username)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM  student where s_id = '" + username.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();
            string id = "";
            while (read2.Read())
            {
                id = read2["idproject"].ToString();
                if (id != "")
                {
                    idp.Text = read2["idproject"].ToString();
                    ShowProjectName();
                }

            }

        }
        protected void ShowProjectName()
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand myCommand = new SqlCommand("SELECT * FROM project where p_id = '" + idp.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();

            while (read2.Read())
            {
                namethp.Text = read2["p_nameth"].ToString();
                nameengp.Text = read2["p_nameeng"].ToString();
            }  
        }
        protected void gvStdDe()
        {
            SqlConnection conn = new SqlConnection(constr1);
            SqlCommand cmd = new SqlCommand("select  * FROM student WHERE idproject = '" + idp.Text + "' ", conn);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            GVstdDetail.DataSource = ds;
            GVstdDetail.DataBind();

            conn.Close();
        }


        protected void logout_Click(object sender, EventArgs e)
        {
            user.logout();
            Response.Redirect("~/");
        }

        protected void about_Click(object sender, EventArgs e)
        {
            Server.Transfer("About.aspx");
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx");
        }

        protected void tbsave_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(constr1);
            con.Open();
            SqlCommand myCommand = new SqlCommand("UPDATE project SET  p_askingtest = 'askingtest', p_issue = '"+ tbissue.Text +"' where p_id = '"+ idp.Text+"'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();

        }
    }
}