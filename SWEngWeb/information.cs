using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;

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
                    if(memberSta[1].ToString() == "1" || memberSta[1].ToString() == "11" || memberSta[1].ToString() == "0")
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
                String allstudent = "select personID , title , firstName , lastName , email , phoneNumber from person where personID ='" + studentStatusList[i][0] + "'";
                com = new SqlCommand(allstudent, conn);
                SqlDataReader inPorInfor = com.ExecuteReader();
                try
                {
                    while (inPorInfor.Read())
                    {
                        studentInfor = new string[7];
                        studentInfor[0] = inPorInfor[0].ToString();
                        studentInfor[1] = inPorInfor[1].ToString();
                        studentInfor[2] = inPorInfor[2].ToString();
                        studentInfor[3] = inPorInfor[3].ToString();
                        studentInfor[4] = inPorInfor[4].ToString();
                        studentInfor[5] = inPorInfor[5].ToString();
                        studentInfor[6] = studentStatusList[i][1];

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

        public static string[] adviserInProject(string projectID)
        {
            string[] studentStatus = new string[2];

            string[] studentInfor1 = new string[5];
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
                    
                    if (memberSta[1].ToString() == "2" || memberSta[1].ToString() == "12" || memberSta[1].ToString() == "30")
                    {
                        studentInfor = new string[2];
                        studentInfor[0] = memberSta[0].ToString();
                        studentInfor[1] = memberSta[1].ToString();
                    }
                }
            }
            catch
            {

            }
            conn.Close();
            
                conn.Open();
                String allstudent = "select personStatus from personStatus where personStatusID ='" + studentInfor[1] + "'";
                com = new SqlCommand(allstudent, conn);
                SqlDataReader inPorInfor = com.ExecuteReader();
                try
                {
                    while (inPorInfor.Read())
                    {
                        string sta = "";
                        sta = inPorInfor[0].ToString();
                        studentInfor[1] = sta;
                    }
                }
                catch
                {

                }
                conn.Close();
        
                conn.Open();
                allstudent = "select personID , title , firstName , lastName from person where personID ='" + studentInfor[0] + "'";
                com = new SqlCommand(allstudent, conn);
                inPorInfor = com.ExecuteReader();
                try
                {
                    while (inPorInfor.Read())
                    {
                        studentInfor1 = new string[5];
                        studentInfor1[0] = inPorInfor[0].ToString();
                        studentInfor1[1] = inPorInfor[1].ToString();
                        studentInfor1[2] = inPorInfor[2].ToString();
                        studentInfor1[3] = inPorInfor[3].ToString();
                        studentInfor1[4] = studentInfor[1];
                    }
                }
                catch
                {

                }
                conn.Close();

            return studentInfor1;
        }

        public static string[] coadviserInProject(string projectID)
        {
            string[] studentStatus = new string[2];

            string[] studentInfor1 = new string[5];
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

                    if (memberSta[1].ToString() == "3" || memberSta[1].ToString() == "13" || memberSta[1].ToString() == "40")
                    {
                        studentInfor = new string[2];
                        studentInfor[0] = memberSta[0].ToString();
                        studentInfor[1] = memberSta[1].ToString();
                    }
                }
            }
            catch
            {

            }
            conn.Close();

            conn.Open();
            String allstudent = "select personStatus from personStatus where personStatusID ='" + studentInfor[1] + "'";
            com = new SqlCommand(allstudent, conn);
            SqlDataReader inPorInfor = com.ExecuteReader();
            try
            {
                while (inPorInfor.Read())
                {
                    string sta = "";
                    sta = inPorInfor[0].ToString();
                    studentInfor[1] = sta;
                }
            }
            catch
            {

            }
            conn.Close();

            conn.Open();
            allstudent = "select personID , title , firstName , lastName from person where personID ='" + studentInfor[0] + "'";
            com = new SqlCommand(allstudent, conn);
            inPorInfor = com.ExecuteReader();
            try
            {
                while (inPorInfor.Read())
                {
                    studentInfor1 = new string[5];
                    studentInfor1[0] = inPorInfor[0].ToString();
                    studentInfor1[1] = inPorInfor[1].ToString();
                    studentInfor1[2] = inPorInfor[2].ToString();
                    studentInfor1[3] = inPorInfor[3].ToString();
                    studentInfor1[4] = studentInfor[1];
                }
            }
            catch
            {

            }
            conn.Close();

            return studentInfor1;
        }

        public static string[] committeeInProject(string projectID)
        {
            string[] studentStatus = new string[2];

            string[] studentInfor1 = new string[5];
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

                    if (memberSta[1].ToString() == "4" || memberSta[1].ToString() == "14" || memberSta[1].ToString() == "50")
                    {
                        studentInfor = new string[2];
                        studentInfor[0] = memberSta[0].ToString();
                        studentInfor[1] = memberSta[1].ToString();
                    }
                }
            }
            catch
            {

            }
            conn.Close();

            conn.Open();
            String allstudent = "select personStatus from personStatus where personStatusID ='" + studentInfor[1] + "'";
            com = new SqlCommand(allstudent, conn);
            SqlDataReader inPorInfor = com.ExecuteReader();
            try
            {
                while (inPorInfor.Read())
                {
                    string sta = "";
                    sta = inPorInfor[0].ToString();
                    studentInfor[1] = sta;
                }
            }
            catch
            {

            }
            conn.Close();

            conn.Open();
            allstudent = "select personID , title , firstName , lastName from person where personID ='" + studentInfor[0] + "'";
            com = new SqlCommand(allstudent, conn);
            inPorInfor = com.ExecuteReader();
            try
            {
                while (inPorInfor.Read())
                {
                    studentInfor1 = new string[5];
                    studentInfor1[0] = inPorInfor[0].ToString();
                    studentInfor1[1] = inPorInfor[1].ToString();
                    studentInfor1[2] = inPorInfor[2].ToString();
                    studentInfor1[3] = inPorInfor[3].ToString();
                    studentInfor1[4] = studentInfor[1];
                }
            }
            catch
            {

            }
            conn.Close();

            return studentInfor1;
        }

        public static int memberCount(string projectID)
        {
            int mem = 1;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            String cmd = "select memberCount from project where projectID ='" + projectID + "'";
            SqlCommand com = new SqlCommand(cmd, conn);
            mem = int.Parse(com.ExecuteScalar().ToString());
            conn.Close();

            return mem;
        }

        public static string projectLastStatus(string projectID)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            string staID = "";
            string lastSta = "";
            conn.Open();
            String cmd = "select lastStatus from project where projectID =" + projectID;
            SqlCommand com = new SqlCommand(cmd, conn);

            try
            {
                staID = com.ExecuteScalar().ToString();
            }
            catch
            {

            }
            conn.Close();

            conn.Open();
            cmd = "select projectStatusName from projectStatus where projectStatusID ='" + staID + "'";
            com = new SqlCommand(cmd, conn);
            
            try
            {
                lastSta = com.ExecuteScalar().ToString();
            }
            catch
            {

            }
            conn.Close();

            return lastSta;
        }

        public static string getNamebyID(string personID)
        {
            string name = "";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            String Checkuser = "select title , firstName , lastName from person where personID =" + personID;
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var reader = com.ExecuteReader();
            if (reader != null)
                reader.Read();

            name += reader[0].ToString() + reader[1].ToString() + " " + reader[2].ToString();
            conn.Close();
            return name;
        }

        public static string thaiProjectName(string projectID)
        {
            string tName = "";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            String Checkuser = "select thaiName from project where projectID =" + projectID;
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var reader = com.ExecuteScalar();
            if (reader != null)
                tName = reader.ToString();
            conn.Close();
            return tName;
        }

        public static string engProjectName(string projectID)
        {
            string eName = "";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            String Checkuser = "select englishName from project where projectID =" + projectID;
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var reader = com.ExecuteScalar();
            if (reader != null)
                eName = reader.ToString();
            conn.Close();
            return eName;
        }

        public static bool isInproject(string projectID)
        {
            bool inPro = false;

            if (projectID != null)
            {
                SqlConnection conn = new SqlConnection(connectionString);
                try
                {
                    conn.Open();
                    String cmd = "SELECT personStatusID FROM position WHERE projectID = " + projectID + " AND personID = " + user.userID();
                    SqlCommand com = new SqlCommand(cmd, conn);
                    var reader = com.ExecuteReader();
                    while (reader.Read())
                    {
                        if (reader[0] != null)
                        {
                            if(reader[0].ToString() == "1" || reader[0].ToString() == "2" || reader[0].ToString() == "3" || reader[0].ToString() == "4")
                            {
                                inPro = true;
                            }
                        }
                    }
                    conn.Close();
                }
                catch
                {
                    HttpContext.Current.Response.Write("<script>alert('E006 : เกิดข้อผิดพลาดในการดำเนินการ');</script>");
                }
            }
            

            return inPro;
        }

        public static int studentConfirmMemCount(string projectID)
        {
            int inPro = 0;

            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();
                String cmd = "SELECT * FROM position WHERE projectID = " + projectID + " AND personStatusID = 1";
                SqlCommand com = new SqlCommand(cmd, conn);
                SqlDataReader reader = com.ExecuteReader();
                while (reader.Read())
                {
                    inPro++;
                }
                conn.Close();
            }
            catch
            {
                HttpContext.Current.Response.Write("<script>alert('E007 : เกิดข้อผิดพลาดในการดำเนินการ');</script>");
            }


            return inPro;
        }
    }
}