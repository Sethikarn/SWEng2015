using System;
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
    public partial class Home : System.Web.UI.Page
    {
        public string pid = null;
        string constr1 = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!user.isLogin())
            {
                Response.Redirect("~/");
            }

            Page.MaintainScrollPositionOnPostBack = true;

            try
            {
                pid = Request.QueryString["pid"];
            }
            catch
            {
                if (user.userHaveProject())
                {
                    pid = user.projectID();
                }
                else
                {
                    pid = null;
                }
            }

            if (user.userHaveProject())
            {
                pid = user.projectID();
            }
        }

        protected void CPE01_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Under construction!');</script>");
            /*
            SqlConnection con = new SqlConnection(constr1);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM student WHERE s_id ='" + username.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();
            string idp = "";
            while (read2.Read())
            {
                idp = read2["idproject"].ToString();
                if (idp != "")
                {
                    CheckEdit(idp);
                }
                else
                {
                    Response.Redirect("~/CPE1.aspx");
                }
            }
             * */
        }
        protected void CheckEdit(string id)
        {
            SqlConnection con = new SqlConnection(constr1);
            con.Open();
            SqlCommand myCommand1 = new SqlCommand("SELECT * FROM  project where p_id = '" + id + "'", con);
            SqlDataReader read2 = myCommand1.ExecuteReader();
            string edit = "";
            while (read2.Read())
            {
                edit = read2["p_approve"].ToString();
                if (edit == "edit")
                {
                    if (MessageBox.Show("แก้ไขตอนนี้?", "โครงงานของคุณส่งกลับมาเพื่อแก้ไข", MessageBoxButtons.YesNo) == DialogResult.Yes)
                    {
                        Server.Transfer("CPE1.aspx");
                    }

                }
                else
                {
                    Server.Transfer("CPE1.aspx");
                    //Response.Write("<script>alert('คุณได้เสนอโครงงานไปแล้ว');</script>");
                }
            }
        }
        protected void CheckHavePj()
        {
            SqlConnection con = new SqlConnection(constr1);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM  student where s_id = '" + "username.Text" + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();
            string idp = "";
            while (read2.Read())
            {
                idp = read2["idproject"].ToString();
                if (idp != "")
                {
                    CheckApprove(idp);
                }
                else //if(idp == null)
                {
                    Response.Write("<script>alert('คุณยังไม่ได้ส่งคำขอ CPE01');</script>");
                }

            }
        }

        protected void CPE02_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Under construction!');</script>");
            //CheckHavePj();
        }

        protected void CheckApprove(string id)
        {
            SqlConnection con = new SqlConnection(constr1);
            con.Open();
            SqlCommand myCommand1 = new SqlCommand("SELECT * FROM  project where p_id = '" + id + "'", con);
            SqlDataReader read2 = myCommand1.ExecuteReader();
            string app = "";
            while (read2.Read())
            {
                app = read2["p_approve"].ToString();
                if (app == "Not approve")
                {
                    MessageBox.Show("โครงงานของคุณยังไม่ถูกอนุมัติ");
                }
                else
                {
                    Server.Transfer("CPE2.aspx");
                }
            }
        }


        protected void CheckApprove3(string id)
        {
            SqlConnection con = new SqlConnection(constr1);
            con.Open();
            SqlCommand myCommand1 = new SqlCommand("SELECT * FROM  project where p_id = '" + id + "'", con);
            SqlDataReader read2 = myCommand1.ExecuteReader();
            string app = "";
            while (read2.Read())
            {
                app = read2["p_approve"].ToString();
                if (app == "Not approve")
                {
                    MessageBox.Show("โครงงานของคุณยังไม่ถูกอนุมัติ");
                }
                else
                {
                    Server.Transfer("CPE3.aspx");
                }
            }
        }
        protected void CPE03_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Under construction!');</script>");
            /*
            SqlConnection con = new SqlConnection(constr1);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM  student where s_id = '" + username.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();
            string idp = "";
            while (read2.Read())
            {
                idp = read2["idproject"].ToString();
                if (idp != "")
                {
                    CheckApprove3(idp);
                }
                else
                {
                    Response.Write("<script>alert('คุณยังไม่ได้ส่งคำขอ CPE01');</script>");
                }
            }
             * */
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            user.logout();
        }

        protected void about_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/About.aspx");
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }
    }
}
