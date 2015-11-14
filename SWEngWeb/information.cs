using System;
using System.Collections;
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
    public static class information
    {
        public static string connectionString = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        public static List<string[]> allTeacher()
        {
            List<string[]> teacher = new List<string[]>();
            string[] teacherInfor = new string[4];

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            String allTeacher = "select personID , title , firstName , lastName from person where position ='" + "T" + "'";
            SqlCommand com = new SqlCommand(allTeacher, conn);
            SqlDataReader TeacherInfor = com.ExecuteReader();
            try
            {
                while (TeacherInfor.Read())
                {
                    teacherInfor = new string[4];
                    teacherInfor[0] = TeacherInfor[0].ToString();
                    teacherInfor[1] = TeacherInfor[1].ToString();
                    teacherInfor[2] = TeacherInfor[2].ToString();
                    teacherInfor[3] = TeacherInfor[3].ToString();
                    teacher.Add(teacherInfor);
                }
            }
            catch
            {

            }
            conn.Close();

            return teacher;
        }

        public static bool studentHaveProject(string studentID)
        {
            bool havePro = false;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            String Checkuser = "select projectID from position where personID ='" + studentID + "'" + " and personStatusID = '1'";
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var projectID = com.ExecuteScalar();
            conn.Close();

            if (projectID != null)
                havePro = true;

            return havePro;
        }

        public static string[] student(string studentID)
        {
            string[] studentInfor = new string[5];

            String getInfor = "select title , firstName , lastName , phoneNumber , email from person where personID ='" + studentID + "'";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = new SqlCommand(getInfor, conn);
            SqlDataReader infor = com.ExecuteReader();
            try
            {
                infor.Read();
                studentInfor[0] = infor.GetString(0);
                studentInfor[1] = infor.GetString(1);
                studentInfor[2] = infor.GetString(2);
                studentInfor[3] = infor.GetString(3);
                studentInfor[4] = infor.GetString(4);
            }
            catch
            {

            }
            conn.Close();

            return studentInfor;
        }

        public static List<string[]> studentInProject(string projectID)
        {
            List<string[]> studentStatusList = new List<string[]>();
            string[] studentStatus = new string[2];

            List<string[]> student = new List<string[]>();
            string[] studentInfor = new string[4];
            
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();
            String studentSta = "select personID , personStatusID from position where projectID ='" + projectID + "'";
            SqlCommand com = new SqlCommand(studentSta, conn);
            SqlDataReader memberSta = com.ExecuteReader();
            try
            {
                while (memberSta.Read())
                {
                    studentInfor = new string[2];
                    studentInfor[0] = memberSta[0].ToString();
                    studentInfor[1] = memberSta[1].ToString();
                    studentStatusList.Add(studentInfor);
                }
            }
            catch
            {

            }
            conn.Close();

            for (int i = 0; i < studentStatusList.Count; i++)
            {
                conn.Open();
                String allstudent = "select personStatus from personStatus where personStatusID ='" + studentStatusList[i][1] + "'";
                com = new SqlCommand(allstudent, conn);
                SqlDataReader inPorInfor = com.ExecuteReader();
                try
                {
                    while (inPorInfor.Read())
                    {
                        string sta = "";
                        sta = inPorInfor[0].ToString();
                        studentStatusList[i][1] = sta;
                    }
                }
                catch
                {

                }
                conn.Close();
            }

            for (int i = 0; i < studentStatusList.Count; i++)
            {
                conn.Open();
                String allstudent = "select personID , title , firstName , lastName from person where personID ='" + studentStatusList[i][0] + "'";
                com = new SqlCommand(allstudent, conn);
                SqlDataReader inPorInfor = com.ExecuteReader();
                try
                {
                    while (inPorInfor.Read())
                    {
                        studentInfor = new string[5];
                        studentInfor[0] = inPorInfor[0].ToString();
                        studentInfor[1] = inPorInfor[1].ToString();
                        studentInfor[2] = inPorInfor[2].ToString();
                        studentInfor[3] = inPorInfor[3].ToString();
                        studentInfor[4] = studentStatusList[i][1];
                        student.Add(studentInfor);
                    }
                }
                catch
                {

                }
                conn.Close();
            }

            return student;
        }
    }
}