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
    public partial class CPE1 : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
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
            ddlProfessor();
            ddlStudent();

            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM student WHERE s_id ='" + username.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();
            string idp = "";
            while (read2.Read())
            {
                idp = read2["idproject"].ToString();
                if (idp != "")
                {
                    foredit.Text = "(สำหรับแก้ไขข้อมูล)";
                    CheckEdit(idp);
                }

            }
 
         }

        protected void CheckEdit(string id)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand1 = new SqlCommand("SELECT * FROM  project where p_id = '" + id + "'", con);
            SqlDataReader read2 = myCommand1.ExecuteReader();
            string edit = "";
            while (read2.Read())
            {
                edit = read2["p_approve"].ToString();
                if (edit == "edit")
                {
                    UpdateProjectToEdit(id);
                }
             }
        }

        protected void UpdateProjectToEdit(string id)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand1 = new SqlCommand("SELECT * FROM  project where p_id = '" + id + "'", con);
            SqlDataReader read2 = myCommand1.ExecuteReader();

            while (read2.Read())
            {
                ThaiNamePJ.Text = read2["p_nameth"].ToString();
                EngNamePJ.Text = read2["p_nameeng"].ToString();
        
            }
 
        }
        protected void UpdateProjectToEdit1(string id)
        {    SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand1 = new SqlCommand("UPDATE project SET  p_approve = 'Not approve', p_nameth ='" + ThaiNamePJ.Text + "' ,p_nameeng ='" + EngNamePJ.Text + "',p_advisor ='" + SearchAdvisor.Text + "',p_coadvisor='" + SearchCoAdvisor.Text + "',p_committee ='" + SearchCommittee.Text + "'  WHERE p_id ='" + id + "'", con);
            SqlDataReader read2 = myCommand1.ExecuteReader();
            Server.Transfer("Home.aspx");

        }


       protected void ddlStudent()
        { 
            SqlConnection conS = new SqlConnection(constr);
            SqlCommand cmdS = new SqlCommand("select s_id,s_name  from student ", conS);
            conS.Open();
            SqlDataReader reader2 = cmdS.ExecuteReader();
           ListItem newItem = new ListItem();

            ddlStudent1.Items.Add(newItem);
            ddlStudent2.Items.Add(newItem);
            ddlStudent3.Items.Add(newItem);

            while (reader2.Read())
            {

                newItem = new ListItem();
               newItem.Text = reader2["s_id"].ToString();
               newItem.Value = reader2["s_id"].ToString();
                ddlStudent1.Items.Add(newItem);
                ddlStudent2.Items.Add(newItem);
                ddlStudent3.Items.Add(newItem);
            }
            reader2.Close();
           conS.Close();
        }

        protected void ddlProfessor()
        {
            SqlConnection conn = new SqlConnection(constr);
            SqlCommand cmd22 = new SqlCommand("select pr_id,pr_name  from professor ", conn);
            conn.Open();
            SqlDataReader reader2 = cmd22.ExecuteReader();
            ListItem newItem = new ListItem();
            SearchAdvisor.Items.Add(newItem);
            SearchCoAdvisor.Items.Add(newItem);
            SearchCommittee.Items.Add(newItem);
            while (reader2.Read())
            {
              
                    newItem = new ListItem();
                    newItem.Text = reader2["pr_name"].ToString();
                    newItem.Value = reader2["pr_name"].ToString();
                    SearchAdvisor.Items.Add(newItem);
                    SearchCoAdvisor.Items.Add(newItem);
                    SearchCommittee.Items.Add(newItem);
            }
            reader2.Close();
            conn.Close();
        }

        protected void FindStudentDetail_Click(object sender, ImageClickEventArgs e)
        {
            if ((ddlStudent1.SelectedIndex != ddlStudent2.SelectedIndex)&&(SearchAdvisor.SelectedIndex != SearchCoAdvisor.SelectedIndex))
            {
                if ((ddlStudent2.SelectedIndex != ddlStudent3.SelectedIndex)&&(SearchCoAdvisor.SelectedIndex != SearchCommittee.SelectedIndex))
                {
                    if ((ddlStudent3.SelectedIndex != ddlStudent1.SelectedIndex)&&(SearchAdvisor.SelectedIndex != SearchCommittee.SelectedIndex))
                    {
                        SearchStudentDetail(student1_fname, student1_lname, student1_tel, student1_email, ddlStudent1);
                        SearchStudentDetail(student2_fname, student2_lname, student2_tel, student2_email, ddlStudent2);
                        SearchStudentDetail(student3_fname, student3_lname, student3_tel, student3_email, ddlStudent3);
                    }
                }
            }
            

        }


        protected void SearchStudentDetail(TextBox tb1, TextBox tb2, TextBox tb3, TextBox tb4, DropDownList ddlStudent)
        {
            
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM student where s_id = '" + ddlStudent.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();
            string name = "";
            string lname = "";
            string tel = "";
            string email = "";

            while (read2.Read())
            {
                name = read2["s_name"].ToString();
                lname = read2["s_lastname"].ToString();
                tel = read2["s_tel"].ToString();
                email = read2["s_email"].ToString();
            }
            tb1.Text = name;
            tb2.Text = lname;
            tb3.Text = tel;
            tb4.Text = email;
        }

        protected void Updateidproject(Label id, DropDownList ddlStudent)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("UPDATE student SET idproject ='" + id.Text + "' WHERE s_id ='" + ddlStudent.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();
        }

        protected void SetLabelid(Label idp, TextBox nameth)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT p_id,p_nameth FROM project ", con);
            SqlDataReader read2 = myCommand.ExecuteReader();
            string id = "";
            string ntext = nameth.Text;
            
            while (read2.Read())
            {   string ndata = read2["p_nameth"].ToString();
                if(ndata==ntext)
                {
                    id = read2["p_id"].ToString();
                    idp.Text = id;
                }
            }
            

        }

       
        protected void SaveStudentTelandEmail(TextBox tbTel, TextBox tbEmail, DropDownList ddlStudent)
        {

            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("UPDATE student SET s_tel ='"+tbTel.Text+"', s_email = '"+tbEmail.Text+"' WHERE s_id ='"+ddlStudent.Text+"'",con);
            SqlDataReader read2 = myCommand.ExecuteReader();
            

        }



        protected void finish_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand myCommand = new SqlCommand("SELECT * FROM student WHERE s_id ='" + username.Text + "'", con);
            SqlDataReader read2 = myCommand.ExecuteReader();
            string idp = "";
            while (read2.Read())
            {
                idp = read2["idproject"].ToString();
                if (idp != "")
                {
                    UpdateProjectToEdit1(idp);
                }
                else
                {
                    SaveProject();
                }
            }
            
            

        }
        protected void SaveProject()
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand myCommand = new SqlCommand("INSERT INTO project VALUES ('" + ThaiNamePJ.Text + "','" + EngNamePJ.Text + "','" + SearchAdvisor.Text + "','" + SearchCoAdvisor.Text + "','" + SearchCommittee.Text + "','Not approve','','')", con);
            myCommand.ExecuteNonQuery();

            SaveStudentTelandEmail(student1_tel, student1_email, ddlStudent1);
            SaveStudentTelandEmail(student2_tel, student2_email, ddlStudent2);
            SaveStudentTelandEmail(student3_tel, student3_email, ddlStudent3);

            SetLabelid(textidproject, ThaiNamePJ);
            Updateidproject(textidproject, ddlStudent1);
            Updateidproject(textidproject, ddlStudent2);
            Updateidproject(textidproject, ddlStudent3);
             Server.Transfer("SaveCPE1.aspx"); 
 
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ddlStudent1_SelectedIndexChanged(object sender, EventArgs e)
        {

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




    }
}