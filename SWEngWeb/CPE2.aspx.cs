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
    public partial class CPE2 : System.Web.UI.Page
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
            gvCPE2(); 
        }

        protected void gvCPE2()
        {
            SqlConnection conn = new SqlConnection(constr1);
            SqlCommand cmd = new SqlCommand("select  * FROM cpe2 WHERE c2_idproject = '"+ShowProject.Text+"' ", conn);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            GVcpe2.DataSource = ds;
            GVcpe2.DataBind();

            conn.Close();
        }

        protected void Savecpe2()
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            DateTime d;
            TimeZone zone = TimeZone.CurrentTimeZone;
            DateTime local = zone.ToLocalTime(DateTime.Now);
            d = local;
            int idint = Int32.Parse(ShowProject.Text);
            if((tbtopic.Text != "")&&(tbsum.Text)!="")
            {SqlCommand myCommand = new SqlCommand("INSERT INTO cpe2 VALUES ('" + idint + "','" + d + "','" + tbtopic.Text + "','" + tbsum.Text + "','" + tbcomment.Text + "')", con);
            myCommand.ExecuteNonQuery();
            }
            
        }

        protected void CheckUser(Label user)
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
                    ShowProject.Text = read2["idproject"].ToString();
                    TellDetail.Text = "รหัสโครงงาน :  ";
                    ShowProjectName();
                }
               
            }
      
        }

        protected void ShowProjectName()
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand myCommand = new SqlCommand("SELECT * FROM project where p_id = '" + ShowProject.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();

            while (read2.Read())
            {
                NameThProject.Text = read2["p_nameth"].ToString();
                TellDetail2.Text = "ชื่อโครงงาน :  ";
            }  
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

        protected void saveCpe2_Click(object sender, EventArgs e)
        {
            Savecpe2();
            Server.Transfer("CPE2.aspx");
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx");
        }

        


    }
}