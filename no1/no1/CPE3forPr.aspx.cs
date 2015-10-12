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
    public partial class CPE3forPr : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.PreviousPage != null)
            {
                var user1 = (PreviousPage.FindControl("username")) as Label;
                username.Text = user1.Text;
            }
            
            CheckProfessor();

        }

        protected void gvPj(string prid)
        {
            SqlConnection conn = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("select  * FROM project WHERE p_advisor = '" + prid + "' and p_askingtest = 'askingtest' ", conn);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            GvPj.DataSource = ds;
            GvPj.DataBind();

            conn.Close();
        }
        protected void CheckProfessor()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM professor WHERE pr_id ='" + username.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();
            string prID = "";
            while (read2.Read())
            {
                prID = read2["pr_name"].ToString();
                CheckPJ(prID);
                gvPj(prID);
            }
        }
        protected void CheckPJ(string prID)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM project WHERE p_advisor ='" + prID + "'and p_askingtest = 'askingtest'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();
            ListItem newItem = new ListItem();
            ddlSelect.Items.Add(newItem);

            while (read2.Read())
            {
                newItem = new ListItem();
                newItem.Text = read2["p_nameth"].ToString();
                newItem.Value = read2["p_id"].ToString();
                ddlSelect.Items.Add(newItem);
            }
            read2.Close();
            con.Close();
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
            Server.Transfer("HomeForProfessor.aspx");
        }

        protected void ตกลง_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("UPDATE project SET  p_askingtest = 'test'   WHERE p_id ='" + ddlSelect.SelectedValue + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();

            Server.Transfer("CPE3forPr.aspx");
        }

    }
}