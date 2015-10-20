﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;


namespace no1
{
    public partial class Home : System.Web.UI.Page
    {
        string constr1 = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sIsAuthenticated"] != null)
            {
                if (Session["sIsAuthenticated"].Equals(true))
                {
                        var user1 = Session["AuthenName"].ToString();
                        username.Text = Session["AuthenName"].ToString();
                    
                }
                else
                {
                    Response.Redirect("~/");
                }
            }
            else
            {
                Response.Redirect("~/");
            }
        }

        protected void CPE01_Click(object sender, EventArgs e)
        {
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
                    Response.Write("<script>alert('คุณได้เสนอโครงงานไปแล้ว');</script>");
                }
            }
        }
        protected void CheckHavePj()
        {
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
            CheckHavePj();
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
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["sIsAuthenticated"] = false;
            Session["AuthenName"] = null;

            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();

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
    }
}
