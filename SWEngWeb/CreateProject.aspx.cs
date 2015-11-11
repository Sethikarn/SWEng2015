using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

static public class globalVar
{
    static public bool creating = false;
    static public string userID;
    static public string userStatus;
    static public string showPage;
    static public string displayNotHaveProjectMenu = "style=\"display: none;\"";
    static public string displayCreateProject = "style=\"display: none;\"";

    //CPE01 var
    static public string thaiName;
    static public string englishName;
    static public string memberCount = "1";
    static public string[] memberID = new string[2];
    static public string[,] memberInforCS = new string[3, 5]; // 3person 5data{title , firstName , lastName , phoneNumber , email}
    static public string[] displayMember = new string[3] { "selected=\"selected\"", "", "" };
    static public ArrayList teacherIDList = new ArrayList();
    static public bool[] memberCheck = new bool[2];

    public static void clear()
    {
        creating = false;
        userID = "";
        userStatus = "";
        showPage = "";
        displayNotHaveProjectMenu = "style=\"display: none;\"";
        displayCreateProject = "style=\"display: none;\"";


        //CPE01 var
        thaiName = "";
        englishName = "";
        memberCount = "1";
        memberID = new string[2];
        memberInforCS = new string[3, 5]; // 3person 5data{title , firstName , lastName , phoneNumber , email}
        displayMember = new string[3] { "selected=\"selected\"", "", "" };
        memberCheck = new bool[2];
    }
}

namespace SWEngWeb
{
    public partial class CPE1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (user.isLogin())
            {

            }
            else
            {
                Response.Redirect("~/");
            }

            Page.MaintainScrollPositionOnPostBack = true;
            // check is login ?

            if (globalVar.userID != user.userID())
            {
                globalVar.clear();
            }
            //for user only!
            globalVar.userID = user.userID();
            string constr = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            String Checkuser = "select projectID from position where personID ='" + globalVar.userID + "'" + "and personStatusID = '1'";
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var projectID = com.ExecuteScalar();
            conn.Close();

            if (projectID != null)
            {
                //Session["userProjectID"] = projectID.ToString();
                globalVar.displayNotHaveProjectMenu = "style=\"display: none;\"";
                globalVar.displayCreateProject = "style=\"display: none;\"";
                Response.Redirect("CPE01.aspx");
            }
            else
            {
                if (!globalVar.creating)
                {
                    globalVar.displayNotHaveProjectMenu = "style=\"display: block;\"";
                    globalVar.displayCreateProject = "style=\"display: none;\"";
                }
                else
                {
                    globalVar.displayNotHaveProjectMenu = "style=\"display: none;\"";
                    globalVar.displayCreateProject = "style=\"display: block;\"";

                    if (Request.Form["memberCountSelect"] != null)
                    {
                        globalVar.memberCount = Request.Form["memberCountSelect"];
                    }
                    else
                    {
                        globalVar.memberCount = "1";

                        globalVar.memberID[0] = "";
                        globalVar.memberInforCS[1, 0] = "";
                        globalVar.memberInforCS[1, 1] = "";
                        globalVar.memberInforCS[1, 2] = "";
                        globalVar.memberInforCS[1, 3] = "";
                        globalVar.memberInforCS[1, 4] = "";
                        MemberID2.Text = "";
                        personOp.InnerText = "เพิ่ม";

                        globalVar.memberID[1] = "";
                        globalVar.memberInforCS[2, 0] = "";
                        globalVar.memberInforCS[2, 1] = "";
                        globalVar.memberInforCS[2, 2] = "";
                        globalVar.memberInforCS[2, 3] = "";
                        globalVar.memberInforCS[2, 4] = "";
                        MemberID3.Text = "";
                        personOp2.InnerText = "เพิ่ม";
                    }

                    if (globalVar.memberCount == "2")
                    {
                        globalVar.displayMember = new string[3] { "", "selected=\"selected\"", "" };
                        globalVar.memberID[1] = "";
                        globalVar.memberInforCS[2, 0] = "";
                        globalVar.memberInforCS[2, 1] = "";
                        globalVar.memberInforCS[2, 2] = "";
                        globalVar.memberInforCS[2, 3] = "";
                        globalVar.memberInforCS[2, 4] = "";
                        MemberID3.Text = "";
                        personOp2.InnerText = "เพิ่ม";
                    }
                    else if (globalVar.memberCount == "3")
                    {
                        globalVar.displayMember = new string[3] { "", "", "selected=\"selected\"" };
                    }
                    else
                    {
                        globalVar.displayMember = new string[3] { "selected=\"selected\"", "", "" };

                        globalVar.memberID[0] = "";
                        globalVar.memberInforCS[1, 0] = "";
                        globalVar.memberInforCS[1, 1] = "";
                        globalVar.memberInforCS[1, 2] = "";
                        globalVar.memberInforCS[1, 3] = "";
                        globalVar.memberInforCS[1, 4] = "";
                        MemberID2.Text = "";
                        personOp.InnerText = "เพิ่ม";

                        globalVar.memberID[1] = "";
                        globalVar.memberInforCS[2, 0] = "";
                        globalVar.memberInforCS[2, 1] = "";
                        globalVar.memberInforCS[2, 2] = "";
                        globalVar.memberInforCS[2, 3] = "";
                        globalVar.memberInforCS[2, 4] = "";
                        MemberID3.Text = "";
                        personOp2.InnerText = "เพิ่ม";
                    }
                }


                if (!IsPostBack)
                {
                    conn.Open();
                    String allTeacher = "select title , firstName , lastName , personID from person where position ='" + "T" + "'";
                    com = new SqlCommand(allTeacher, conn);
                    SqlDataReader TeacherInfor = com.ExecuteReader();
                    try
                    {
                        while (TeacherInfor.Read())
                        {
                            adviser.Items.Add(TeacherInfor[0].ToString() + TeacherInfor[1].ToString() + " " + TeacherInfor[2].ToString());
                            coadviser.Items.Add(TeacherInfor[0].ToString() + TeacherInfor[1].ToString() + " " + TeacherInfor[2].ToString());
                            committee.Items.Add(TeacherInfor[0].ToString() + TeacherInfor[1].ToString() + " " + TeacherInfor[2].ToString());
                            globalVar.teacherIDList.Add(TeacherInfor[3].ToString());
                        }
                    }
                    catch
                    {

                    }
                    conn.Close();
                }



            }
        }
        protected void memberClear(int index)
        {
            globalVar.memberID[index - 1] = "";
            globalVar.memberInforCS[index, 0] = "";
            globalVar.memberInforCS[index, 1] = "";
            globalVar.memberInforCS[index, 2] = "";
            globalVar.memberInforCS[index, 3] = "";
            globalVar.memberInforCS[index, 4] = "";

            if (index == 2)
                MemberID3.Text = "";

            if (index == 1)
                MemberID2.Text = "";
        }
        protected void cancleCreate(object sender, EventArgs e)
        {
            globalVar.clear();
            globalVar.userID = user.userID();
            Response.Redirect(Request.RawUrl);
        }
        protected void create(object sender, EventArgs e)
        {
            string error = "";
            bool isError = true;
            int memCount = 1;

            if (thaiNameInput.Text != "") //สรวจสอบชื่อไทย
            {
                globalVar.thaiName = thaiNameInput.Text;
                if (englishNameInput.Text != "") //สรวจสอบชื่ออังกฤษ
                {
                    globalVar.englishName = englishNameInput.Text;

                    memCount = 1;  //ตัวเทียบนับจำนวนสมาชิก
                    if (globalVar.memberInforCS[1, 1] != "") //นับจากจำนวนชื่อ
                        memCount++;
                    if (globalVar.memberInforCS[2, 1] != "")
                        memCount++;

                    if (Request.Form["memberCountSelect"] != null)  //ถ้าตัวเลือกจำนวนสมาชิกไม่เป็นเนา
                    {
                        globalVar.memberCount = Request.Form["memberCountSelect"];
                    }
                    else
                    {
                        globalVar.memberCount = "1";
                    }
                    if (globalVar.memberCount == "1")
                    {
                        memberClear(1);
                        memberClear(2);
                    }
                    if (globalVar.memberCount == "2")
                    {
                        memberClear(2);
                    }

                    if (globalVar.memberCount == memCount.ToString()) //ถ้ามีสมาชิกตากจำนวนที่กำหนด
                    {
                        if (adviser.SelectedIndex == 0 && coadviser.SelectedIndex == 0 && committee.SelectedIndex == 0)//ไม่เลือก
                        {
                            isError = false;
                        }
                        else if (adviser.SelectedIndex == 0 && coadviser.SelectedIndex == 0)//เลือกหนึ่ง
                        {
                            isError = false;
                        }
                        else if (coadviser.SelectedIndex == 0 && committee.SelectedIndex == 0)//เลือกหนึ่ง
                        {
                            isError = false;
                        }
                        else if (adviser.SelectedIndex == 0 && committee.SelectedIndex == 0)//เลือกหนึ่ง
                        {
                            isError = false;
                        }
                        else if (adviser.SelectedIndex == 0 && committee.SelectedIndex != coadviser.SelectedIndex)//เลือกสอง
                        {
                            isError = false;
                        }
                        else if (coadviser.SelectedIndex == 0 && committee.SelectedIndex != adviser.SelectedIndex)//เลือกสอง
                        {
                            isError = false;
                        }
                        else if (committee.SelectedIndex == 0 && adviser.SelectedIndex != coadviser.SelectedIndex)//เลือกสอง
                        {
                            isError = false;
                        }
                        else if (adviser.SelectedIndex != coadviser.SelectedIndex && coadviser.SelectedIndex != committee.SelectedIndex && committee.SelectedIndex != adviser.SelectedIndex)//เลือกแบบไม่ซ้ำกับ
                        {
                            isError = false;
                        }
                        else
                        {
                            error = "alert(\"ไม่สามารถเลือกอาจารย์ซ้ำได้\");";
                        }

                    }
                    else
                    {
                        error = "alert(\"จำนวนนิสิตไม่ครบ\");";
                    }

                }
                else
                {
                    error = "alert(\"กรุณาใส่ชื่อโครงงานภาษาอังกฤษ\");";
                }
            }
            else
            {
                error = "alert(\"กรุณาใส่ชื่อโครงงานภาษาไทย\");";
            }

            if (isError)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", error, true);
                Page.MaintainScrollPositionOnPostBack = false;
            }
            else
            {
                queryToDB();
                Response.Redirect("CPE01.aspx");
            }
        }
        protected void createProject(object sender, EventArgs e)
        {
            globalVar.displayNotHaveProjectMenu = "style=\"display: none;\"";
            globalVar.displayCreateProject = "style=\"display: block;\"";
            globalVar.creating = true;
            string constr = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);

            String getInfor = "select title , firstName , lastName , phoneNumber , email from person where personID ='" + globalVar.userID + "'";
            conn.Open();
            SqlCommand com = new SqlCommand(getInfor, conn);
            SqlDataReader infor = com.ExecuteReader();
            infor.Read();
            globalVar.memberInforCS[0, 0] = infor.GetString(0);
            globalVar.memberInforCS[0, 1] = infor.GetString(1) + "  ";
            globalVar.memberInforCS[0, 2] = infor.GetString(2);
            globalVar.memberInforCS[0, 3] = infor.GetString(3);
            globalVar.memberInforCS[0, 4] = infor.GetString(4);
            conn.Close();
        }
        protected void CPE01_Click(object sender, EventArgs e)
        {
            globalVar.thaiName = String.Format("{0}", Request.Form["thaiNameInput"]);
            globalVar.englishName = String.Format("{0}", Request.Form["englishNameInput"]);

            //globalVar.memberCount = memberCountSelect.Value;
            //memberCountSelect.SelectedIndex = Convert.ToInt32(globalVar.memberCount);
            //for student only!
            string constr = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            String Checkuser = "select projectID from position where personID ='" + globalVar.userID + "'";
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var projectID = com.ExecuteScalar();
            conn.Close();

            if (projectID == null) //student not have project
            {
                String getInfor = "select title , firstName , lastName , phoneNumber , email from person where personID ='" + globalVar.userID + "'";
                conn.Open();
                com = new SqlCommand(getInfor, conn);
                SqlDataReader infor = com.ExecuteReader();
                infor.Read();
                globalVar.memberInforCS[0, 0] = infor.GetString(0);
                globalVar.memberInforCS[0, 1] = infor.GetString(1) + "  ";
                globalVar.memberInforCS[0, 2] = infor.GetString(2);
                globalVar.memberInforCS[0, 3] = infor.GetString(3);
                globalVar.memberInforCS[0, 4] = infor.GetString(4);
                conn.Close();
            }
            else //student have project
            {
                string script = "alert(\"ไม่สามารถเพิ่มสมาชิกที่ระบุได้เนื่องจากมีรายชื่อในโครงงานอื่นแล้ว\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            }
        }
        protected void memberCountChange(object sender, EventArgs e)
        {

        }
        protected string[] queryStudent(string studentID)
        {
            string[] studentInfor = new string[5];
            string constr = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            String Checkuser = "select projectID from position where personID ='" + studentID + "'";
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var projectID = com.ExecuteScalar();
            conn.Close();

            if (projectID == null) //student not have project
            {
                String getInfor = "select title , firstName , lastName , phoneNumber , email from person where personID ='" + studentID + "'";
                conn.Open();
                com = new SqlCommand(getInfor, conn);
                SqlDataReader infor = com.ExecuteReader();
                try
                {
                    infor.Read();
                    studentInfor[0] = infor.GetString(0);
                    studentInfor[1] = infor.GetString(1) + "  ";
                    studentInfor[2] = infor.GetString(2);
                    studentInfor[3] = infor.GetString(3);
                    studentInfor[4] = infor.GetString(4);
                }
                catch
                {

                }
                conn.Close();
            }
            else //student have project
            {

            }

            return studentInfor;
        }
        protected void addMember2Click(object sender, EventArgs e)
        {
            int temp;
            string input = MemberID2.Text;

            if (personOp.InnerText == "เพิ่ม")
            {
                memberClear(1);

                if (int.TryParse(input, out temp) && input.Length == 8)
                {
                    if (input != globalVar.userID && input != globalVar.memberID[1])
                    {
                        string[] studentInfor = queryStudent(input);
                        if (studentInfor[1] != null)
                        {
                            globalVar.memberID[0] = input;
                            globalVar.memberInforCS[1, 0] = studentInfor[0];
                            globalVar.memberInforCS[1, 1] = studentInfor[1];
                            globalVar.memberInforCS[1, 2] = studentInfor[2];
                            globalVar.memberInforCS[1, 3] = studentInfor[3];
                            globalVar.memberInforCS[1, 4] = studentInfor[4];
                            MemberID2.Text = input;
                            personOp.InnerText = "ลบ";
                            MemberID2.Enabled = false;
                        }
                        else
                        {
                            string error00 = "alert(\"ไม่มีรหัสนิสิตนี้ในระบบ\");";
                            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", error00, true);
                            personOp2.InnerText = "เพิ่ม";
                            MemberID3.Enabled = true;
                        }
                    }
                    else
                    {
                        string error01 = "alert(\"ไม่สามารถเพิ่มสมาชิกที่ระบุได้เนื่องมีชื่อในโครงงานแล้ว\");";
                        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", error01, true);
                        personOp.InnerText = "เพิ่ม";
                        MemberID2.Enabled = true;
                    }
                }
                else
                {
                    string error02 = "alert(\"รหัสนิสิตไม่ถูกต้อง\");";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", error02, true);
                    personOp.InnerText = "เพิ่ม";
                    MemberID2.Enabled = true;
                }
            }
            else
            {
                if (Request.Form["memberCountSelect"] != null)
                {
                    globalVar.memberCount = Request.Form["memberCountSelect"];
                }
                else
                {
                    globalVar.memberCount = "1";
                }

                /////////////////////////////////////////////////////////////////////

                if (globalVar.memberCount == "3")
                {
                    if (globalVar.memberID[1] != "")
                    {
                        globalVar.memberID[0] = globalVar.memberID[1];
                        globalVar.memberInforCS[1, 0] = globalVar.memberInforCS[2, 0];
                        globalVar.memberInforCS[1, 1] = globalVar.memberInforCS[2, 1];
                        globalVar.memberInforCS[1, 2] = globalVar.memberInforCS[2, 2];
                        globalVar.memberInforCS[1, 3] = globalVar.memberInforCS[2, 3];
                        globalVar.memberInforCS[1, 4] = globalVar.memberInforCS[2, 4];
                        MemberID2.Text = MemberID3.Text;
                        personOp.InnerText = "ลบ";
                        MemberID2.Enabled = false;

                        memberClear(2);
                        personOp2.InnerText = "เพิ่ม";
                        MemberID3.Enabled = true;
                    }
                    else
                    {
                        memberClear(1);
                        personOp.InnerText = "เพิ่ม";
                        MemberID2.Enabled = true;
                    }
                }
                else
                {
                    memberClear(1);//input is index begin at 0
                    personOp.InnerText = "เพิ่ม";
                    MemberID2.Enabled = true;
                }
            }
        }
        protected void addMember3Click(object sender, EventArgs e)
        {
            int temp;
            bool isValid = false;
            string input = MemberID3.Text;
            string errorMem3 = "";

            if (personOp2.InnerText == "เพิ่ม")
            {
                memberClear(2);
                if (int.TryParse(input, out temp) && input.Length == 8)
                {
                    if (input != globalVar.userID && input != globalVar.memberID[0])
                    {
                        string[] studentInfor = queryStudent(input);
                        if (studentInfor[1] != null)
                        {
                            globalVar.memberID[1] = input;
                            globalVar.memberInforCS[2, 0] = studentInfor[0];
                            globalVar.memberInforCS[2, 1] = studentInfor[1];
                            globalVar.memberInforCS[2, 2] = studentInfor[2];
                            globalVar.memberInforCS[2, 3] = studentInfor[3];
                            globalVar.memberInforCS[2, 4] = studentInfor[4];
                            MemberID3.Text = input;
                            personOp2.InnerText = "ลบ";
                            globalVar.memberCheck[1] = true;
                            isValid = true;
                            MemberID3.Enabled = false;
                        }
                        else
                        {
                            errorMem3 = "alert(\"ไม่มีรหัสนิสิตนี้ในระบบ\");";
                        }
                    }
                    else
                    {
                        errorMem3 = "alert(\"ไม่สามารถเพิ่มสมาชิกที่ระบุได้เนื่องมีชื่อในโครงงานแล้ว\");";
                    }
                }
                else
                {
                    errorMem3 = "alert(\"รหัสนิสิตไม่ถูกต้อง\");";
                }
            }
            else
            {
                memberClear(2);
            }

            if (!isValid)
            {
                personOp2.InnerText = "เพิ่ม";
                globalVar.memberCheck[1] = false;
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", errorMem3, true);
                MemberID3.Enabled = true;
            }
        }
        protected void queryToDB()
        {
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString))
            {
                // into project table
                SqlCommand cmd = new SqlCommand("INSERT INTO project (thaiName, englishName , memberCount, lastStatus ,lastUpdate) OUTPUT INSERTED.projectID VALUES (@thaiName, @englishName , @memberCount, @lastStatus , @lastUpdate)");
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@thaiName", globalVar.thaiName);
                cmd.Parameters.AddWithValue("@englishName", globalVar.englishName);
                cmd.Parameters.AddWithValue("@memberCount", globalVar.memberCount);
                cmd.Parameters.AddWithValue("@lastStatus", "0");
                DateTime myDateTime = DateTime.Now;
                cmd.Parameters.AddWithValue("@lastUpdate", myDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
                connection.Open();
                var projectIDCS = cmd.ExecuteScalar();
                connection.Close();

                //into position
                cmd = new SqlCommand("INSERT INTO position (personID, projectID , personStatusID) VALUES (@personID, @projectID , @personStatusID)");
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@personID", user.userID());
                cmd.Parameters.AddWithValue("@projectID", projectIDCS.ToString());
                cmd.Parameters.AddWithValue("@personStatusID", "1");
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();

                //into request student
                if (globalVar.memberCount != "1")
                {
                    int loop = Convert.ToInt32(globalVar.memberCount);
                    for (int i = 0; i < loop - 1; i++)
                    {
                        if (globalVar.memberInforCS[i + 1, 1] != "")
                        {
                            cmd = new SqlCommand("INSERT INTO request (actionID, projectID , requesterID, replyID ,requestDateTime) VALUES (@actionID, @projectID , @requesterID, @replyID ,@requestDateTime)");
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = connection;
                            cmd.Parameters.AddWithValue("@actionID", "1");
                            cmd.Parameters.AddWithValue("@projectID", projectIDCS);
                            cmd.Parameters.AddWithValue("@requesterID", user.userID());
                            cmd.Parameters.AddWithValue("@replyID", globalVar.memberID[i]);
                            cmd.Parameters.AddWithValue("@requestDateTime", myDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
                            connection.Open();
                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }
                }

                //into request avviser
                if (adviser.SelectedIndex != 0)
                {
                    cmd = new SqlCommand("INSERT INTO request (actionID, projectID , requesterID, replyID ,requestDateTime) VALUES (@actionID, @projectID , @requesterID, @replyID ,@requestDateTime)");
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = connection;
                    cmd.Parameters.AddWithValue("@actionID", "3");
                    cmd.Parameters.AddWithValue("@projectID", projectIDCS);
                    cmd.Parameters.AddWithValue("@requesterID", user.userID());
                    cmd.Parameters.AddWithValue("@replyID", globalVar.teacherIDList[adviser.SelectedIndex]);
                    cmd.Parameters.AddWithValue("@requestDateTime", myDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }

                //into request coadviser
                if (coadviser.SelectedIndex != 0)
                {
                    cmd = new SqlCommand("INSERT INTO request (actionID, projectID , requesterID, replyID ,requestDateTime) VALUES (@actionID, @projectID , @requesterID, @replyID ,@requestDateTime)");
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = connection;
                    cmd.Parameters.AddWithValue("@actionID", "4");
                    cmd.Parameters.AddWithValue("@projectID", projectIDCS);
                    cmd.Parameters.AddWithValue("@requesterID", user.userID());
                    cmd.Parameters.AddWithValue("@replyID", globalVar.teacherIDList[coadviser.SelectedIndex]);
                    cmd.Parameters.AddWithValue("@requestDateTime", myDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }

                //into request committee
                if (committee.SelectedIndex != 0)
                {
                    cmd = new SqlCommand("INSERT INTO request (actionID, projectID , requesterID, replyID ,requestDateTime) VALUES (@actionID, @projectID , @requesterID, @replyID ,@requestDateTime)");
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = connection;
                    cmd.Parameters.AddWithValue("@actionID", "5");
                    cmd.Parameters.AddWithValue("@projectID", projectIDCS);
                    cmd.Parameters.AddWithValue("@requesterID", user.userID());
                    cmd.Parameters.AddWithValue("@replyID", globalVar.teacherIDList[committee.SelectedIndex]);
                    cmd.Parameters.AddWithValue("@requestDateTime", myDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();

                    Response.Redirect("project.aspx");
                }

                //into activityLog
                cmd = new SqlCommand("INSERT INTO activityLog (personID, projectID , activityNameID, dateTime) VALUES (@personID, @projectID , @activityNameID, @dateTime)");
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@personID", user.userID());
                cmd.Parameters.AddWithValue("@projectID", projectIDCS);
                cmd.Parameters.AddWithValue("@activityNameID", "0");
                cmd.Parameters.AddWithValue("@dateTime", myDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();

                cmd = new SqlCommand("INSERT INTO activityLog (personID, projectID , activityNameID, dateTime) VALUES (@personID, @projectID , @activityNameID, @dateTime)");
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@personID", user.userID());
                cmd.Parameters.AddWithValue("@projectID", projectIDCS);
                cmd.Parameters.AddWithValue("@activityNameID", "50");
                cmd.Parameters.AddWithValue("@dateTime", myDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }
        //UserN = String.Format("{0}", Request.Form["UserName"]);
        //PassW = String.Format("{0}", Request.Form["PassWord"]);
        //protected void addMember(object sender, EventArgs e)
        //{
        //    if(globalVar.memberCount == "1")
        //    {

        //    }
        //}

    }
}