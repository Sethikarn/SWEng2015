using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace no1
{
    public partial class ApproveProject : System.Web.UI.Page
    {
        string constr1 = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlProject1();
            gvProject();
        }
        protected void ddlProject1()
        {
            SqlConnection conS = new SqlConnection(constr1);
            SqlCommand cmdS = new SqlCommand("select  * FROM project WHERE p_approve = 'Not approve' ", conS);
            conS.Open();
            SqlDataReader reader2 = cmdS.ExecuteReader();
            ListItem newItem = new ListItem();

            ddlProject.Items.Add(newItem);

            while (reader2.Read())
            {

                newItem = new ListItem();
                newItem.Text = reader2["p_nameth"].ToString();
                newItem.Value = reader2["p_id"].ToString();
                ddlProject.Items.Add(newItem);
            }

            reader2.Close();
            conS.Close();

        }


        protected void gvProject()
        {
            SqlConnection conn = new SqlConnection(constr1);
            SqlCommand cmd = new SqlCommand("select  * FROM project WHERE p_approve = 'Not approve' ", conn);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            GVproject.DataSource = ds;
            GVproject.DataBind();

            conn.Close();
        }


        protected void logout_Click(object sender, EventArgs e)
        {
            Server.Transfer("WebForm1.aspx");
        }

        protected void about_Click(object sender, EventArgs e)
        {
            Server.Transfer("About.aspx");
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx");
        }

        protected void approve_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(constr1);
            con.Open();
            SqlCommand myCommand = new SqlCommand("UPDATE project SET  p_approve = 'approve'   WHERE p_id ='"+ddlProject.SelectedValue+"'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();

            Server.Transfer("ApproveProject.aspx");

        }

        protected void btedit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(constr1);
            con.Open();
            SqlCommand myCommand = new SqlCommand("UPDATE project SET  p_approve = 'edit'   WHERE p_id ='" + ddlProject.SelectedValue + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();

            Server.Transfer("ApproveProject.aspx");
        }

        protected void HomeButton_Click1(object sender, EventArgs e)
        {
            Server.Transfer("HomeForProfessor.aspx");
        }

     



    }
}