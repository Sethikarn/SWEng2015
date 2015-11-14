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

static public class createProjectVar
{
    static public bool creating = false;
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
        showPage = "";
        displayNotHaveProjectMenu = "style=\"display: none;\"";
        displayCreateProject = "style=\"display: none;\"";
        
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
            Page.MaintainScrollPositionOnPostBack = true;

            if (!user.isLogin())
            {
                Response.Redirect("~/");
            }

            if (user.userHaveProject())
            {
                Response.Redirect("CPE01.aspx");
            }
            else
            {
                if (!createProjectVar.creating)
                {
                    createProjectVar.displayNotHaveProjectMenu = "style=\"display: block;\"";
                    createProjectVar.displayCreateProject = "style=\"display: none;\"";
                }
                else
                {
                    createProjectVar.displayNotHaveProjectMenu = "style=\"display: none;\"";
                    createProjectVar.displayCreateProject = "style=\"display: block;\"";

                    if (Request.Form["memberCountSelect"] != null)
                    {
                        createProjectVar.memberCount = Request.Form["memberCountSelect"];
                    }
                    else
                    {
                        createProjectVar.memberCount = "1";

                        createProjectVar.memberID[0] = "";
                        createProjectVar.memberInforCS[1, 0] = "";
                        createProjectVar.memberInforCS[1, 1] = "";
                        createProjectVar.memberInforCS[1, 2] = "";
                        createProjectVar.memberInforCS[1, 3] = "";
                        createProjectVar.memberInforCS[1, 4] = "";
                        MemberID2.Text = "";
                        personOp.InnerText = "เพิ่ม";

                        createProjectVar.memberID[1] = "";
                        createProjectVar.memberInforCS[2, 0] = "";
                        createProjectVar.memberInforCS[2, 1] = "";
                        createProjectVar.memberInforCS[2, 2] = "";
                        createProjectVar.memberInforCS[2, 3] = "";
                        createProjectVar.memberInforCS[2, 4] = "";
                        MemberID3.Text = "";
                        personOp2.InnerText = "เพิ่ม";
                    }


                    if (createProjectVar.memberCount == "1")
                    {
                        createProjectVar.displayMember = new string[3] { "selected=\"selected\"", "", "" };

                        createProjectVar.memberID[0] = "";
                        createProjectVar.memberInforCS[1, 0] = "";
                        createProjectVar.memberInforCS[1, 1] = "";
                        createProjectVar.memberInforCS[1, 2] = "";
                        createProjectVar.memberInforCS[1, 3] = "";
                        createProjectVar.memberInforCS[1, 4] = "";
                        MemberID2.Text = "";
                        personOp.InnerText = "เพิ่ม";

                        createProjectVar.memberID[1] = "";
                        createProjectVar.memberInforCS[2, 0] = "";
                        createProjectVar.memberInforCS[2, 1] = "";
                        createProjectVar.memberInforCS[2, 2] = "";
                        createProjectVar.memberInforCS[2, 3] = "";
                        createProjectVar.memberInforCS[2, 4] = "";
                        MemberID3.Text = "";
                        personOp2.InnerText = "เพิ่ม";
                    }
                    else if (createProjectVar.memberCount == "2")
                    {
                        createProjectVar.displayMember = new string[3] { "", "selected=\"selected\"", "" };
                        createProjectVar.memberID[1] = "";
                        createProjectVar.memberInforCS[2, 0] = "";
                        createProjectVar.memberInforCS[2, 1] = "";
                        createProjectVar.memberInforCS[2, 2] = "";
                        createProjectVar.memberInforCS[2, 3] = "";
                        createProjectVar.memberInforCS[2, 4] = "";
                        MemberID3.Text = "";
                        personOp2.InnerText = "เพิ่ม";
                    }
                    else if (createProjectVar.memberCount == "3")
                    {
                        createProjectVar.displayMember = new string[3] { "", "", "selected=\"selected\"" };
                    }
                }


                if (!IsPostBack)
                {
                    List<string[]> TeacherInfor = new List<string[]>();
                    TeacherInfor = information.allTeacher();
                    for (int i = 0; i < TeacherInfor.Count; i++)
                    {
                        createProjectVar.teacherIDList.Add(TeacherInfor[i][0]);
                        adviser.Items.Add(TeacherInfor[i][1] + TeacherInfor[i][2] + " " + TeacherInfor[i][3]);
                        coadviser.Items.Add(TeacherInfor[i][1] + TeacherInfor[i][2] + " " + TeacherInfor[i][3]);
                        committee.Items.Add(TeacherInfor[i][1] + TeacherInfor[i][2] + " " + TeacherInfor[i][3]);
                    }
                }
            }
        }

        protected void memberClear(int index)
        {
            createProjectVar.memberID[index - 1] = "";
            createProjectVar.memberInforCS[index, 0] = "";
            createProjectVar.memberInforCS[index, 1] = "";
            createProjectVar.memberInforCS[index, 2] = "";
            createProjectVar.memberInforCS[index, 3] = "";
            createProjectVar.memberInforCS[index, 4] = "";

            if (index == 2)
                MemberID3.Text = "";

            if (index == 1)
                MemberID2.Text = "";
        }
        protected void cancleCreate(object sender, EventArgs e)
        {
            createProjectVar.clear();
            //Response.Redirect(Request.RawUrl);
            Response.Redirect("~/");
        }
        protected void create(object sender, EventArgs e)
        {
            string error = "";
            bool isError = true;
            int memCount = 1;

            if (thaiNameInput.Text != "") //สรวจสอบชื่อไทย
            {
                createProjectVar.thaiName = thaiNameInput.Text;
                if (englishNameInput.Text != "") //สรวจสอบชื่ออังกฤษ
                {
                    createProjectVar.englishName = englishNameInput.Text;

                    memCount = 1;  //ตัวเทียบนับจำนวนสมาชิก
                    if (createProjectVar.memberInforCS[1, 1] != "") //นับจากจำนวนชื่อ
                        memCount++;
                    if (createProjectVar.memberInforCS[2, 1] != "")
                        memCount++;

                    if (Request.Form["memberCountSelect"] != null)  //ถ้าตัวเลือกจำนวนสมาชิกไม่เป็นเนา
                    {
                        createProjectVar.memberCount = Request.Form["memberCountSelect"];
                    }
                    else
                    {
                        createProjectVar.memberCount = "1";
                    }
                    if (createProjectVar.memberCount == "1")
                    {
                        memberClear(1);
                        memberClear(2);
                    }
                    if (createProjectVar.memberCount == "2")
                    {
                        memberClear(2);
                    }

                    if (createProjectVar.memberCount == memCount.ToString()) //ถ้ามีสมาชิกตากจำนวนที่กำหนด
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
            createProjectVar.displayNotHaveProjectMenu = "style=\"display: none;\"";
            createProjectVar.displayCreateProject = "style=\"display: block;\"";
            createProjectVar.creating = true;
            string constr = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);

            String getInfor = "select title , firstName , lastName , phoneNumber , email from person where personID ='" + user.userID() + "'";
            conn.Open();
            SqlCommand com = new SqlCommand(getInfor, conn);
            SqlDataReader infor = com.ExecuteReader();
            infor.Read();
            createProjectVar.memberInforCS[0, 0] = infor.GetString(0);
            createProjectVar.memberInforCS[0, 1] = infor.GetString(1) + "  ";
            createProjectVar.memberInforCS[0, 2] = infor.GetString(2);
            createProjectVar.memberInforCS[0, 3] = infor.GetString(3);
            createProjectVar.memberInforCS[0, 4] = infor.GetString(4);
            conn.Close();
        }

        /* protected void CPE01_Click(object sender, EventArgs e)
        {
            createProjectVar.thaiName = String.Format("{0}", Request.Form["thaiNameInput"]);
            createProjectVar.englishName = String.Format("{0}", Request.Form["englishNameInput"]);

            //createProjectVar.memberCount = memberCountSelect.Value;
            //memberCountSelect.SelectedIndex = Convert.ToInt32(createProjectVar.memberCount);
            //for student only!
            string constr = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            String Checkuser = "select projectID from position where personID ='" + user.userID() + "'";
            SqlCommand com = new SqlCommand(Checkuser, conn);
            var projectID = com.ExecuteScalar();
            conn.Close();

            if (projectID == null) //student not have project
            {
                String getInfor = "select title , firstName , lastName , phoneNumber , email from person where personID ='" + user.userID() + "'";
                conn.Open();
                com = new SqlCommand(getInfor, conn);
                SqlDataReader infor = com.ExecuteReader();
                infor.Read();
                createProjectVar.memberInforCS[0, 0] = infor.GetString(0);
                createProjectVar.memberInforCS[0, 1] = infor.GetString(1) + "  ";
                createProjectVar.memberInforCS[0, 2] = infor.GetString(2);
                createProjectVar.memberInforCS[0, 3] = infor.GetString(3);
                createProjectVar.memberInforCS[0, 4] = infor.GetString(4);
                conn.Close();
            }
            else //student have project
            {
                string script = "alert(\"ไม่สามารถเพิ่มสมาชิกที่ระบุได้เนื่องจากมีรายชื่อในโครงงานอื่นแล้ว\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            }
        } */

        protected void memberCountChange(object sender, EventArgs e)
        {

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
                    if (input != user.userID() && input != createProjectVar.memberID[1])
                    {
                        string[] studentInfor = information.student(input);
                        if (studentInfor[0] != null)
                        {
                            if (!information.studentHaveProject(input))
                            {
                                createProjectVar.memberID[0] = input;
                                createProjectVar.memberInforCS[1, 0] = studentInfor[0];
                                createProjectVar.memberInforCS[1, 1] = studentInfor[1];
                                createProjectVar.memberInforCS[1, 2] = studentInfor[2];
                                createProjectVar.memberInforCS[1, 3] = studentInfor[3];
                                createProjectVar.memberInforCS[1, 4] = studentInfor[4];
                                MemberID2.Text = input;
                                personOp.InnerText = "ลบ";
                                MemberID2.Enabled = false;
                            }
                            else
                            {
                                string error00 = "alert(\"นิสิตที่ระบุมีโครงานแล้ว\");";
                                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", error00, true);
                                personOp2.InnerText = "เพิ่ม";
                                MemberID3.Enabled = true;
                            }
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
                    createProjectVar.memberCount = Request.Form["memberCountSelect"];
                }
                else
                {
                    createProjectVar.memberCount = "1";
                }

                /////////////////////////////////////////////////////////////////////

                if (createProjectVar.memberCount == "3")
                {
                    if (createProjectVar.memberID[1] != "")
                    {
                        createProjectVar.memberID[0] = createProjectVar.memberID[1];
                        createProjectVar.memberInforCS[1, 0] = createProjectVar.memberInforCS[2, 0];
                        createProjectVar.memberInforCS[1, 1] = createProjectVar.memberInforCS[2, 1];
                        createProjectVar.memberInforCS[1, 2] = createProjectVar.memberInforCS[2, 2];
                        createProjectVar.memberInforCS[1, 3] = createProjectVar.memberInforCS[2, 3];
                        createProjectVar.memberInforCS[1, 4] = createProjectVar.memberInforCS[2, 4];
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
                    if (input != user.userID() && input != createProjectVar.memberID[0])
                    {
                        string[] studentInfor = information.student(input);
                        if (studentInfor[0] != null)
                        {
                            if (!information.studentHaveProject(input))
                            {

                                createProjectVar.memberID[1] = input;
                                createProjectVar.memberInforCS[2, 0] = studentInfor[0];
                                createProjectVar.memberInforCS[2, 1] = studentInfor[1];
                                createProjectVar.memberInforCS[2, 2] = studentInfor[2];
                                createProjectVar.memberInforCS[2, 3] = studentInfor[3];
                                createProjectVar.memberInforCS[2, 4] = studentInfor[4];
                                MemberID3.Text = input;
                                personOp2.InnerText = "ลบ";
                                createProjectVar.memberCheck[1] = true;
                                isValid = true;
                                MemberID3.Enabled = false;

                            }
                            else
                            {
                                string error00 = "alert(\"นิสิตที่ระบุมีโครงานแล้ว\");";
                                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", error00, true);
                                personOp2.InnerText = "เพิ่ม";
                                MemberID3.Enabled = true;
                            }
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
                createProjectVar.memberCheck[1] = false;
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
                cmd.Parameters.AddWithValue("@thaiName", createProjectVar.thaiName);
                cmd.Parameters.AddWithValue("@englishName", createProjectVar.englishName);
                cmd.Parameters.AddWithValue("@memberCount", createProjectVar.memberCount);
                cmd.Parameters.AddWithValue("@lastStatus", "0");
                DateTime myDateTime = DateTime.Now;
                cmd.Parameters.AddWithValue("@lastUpdate", myDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
                connection.Open();
                var projectIDCS = cmd.ExecuteScalar();
                connection.Close();

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

                process.setStatus(user.userID(), projectIDCS.ToString(), "1");

                /*/into position
                cmd = new SqlCommand("INSERT INTO position (personID, projectID , personStatusID) VALUES (@personID, @projectID , @personStatusID)");
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@personID", user.userID());
                cmd.Parameters.AddWithValue("@projectID", projectIDCS.ToString());
                cmd.Parameters.AddWithValue("@personStatusID", "1");
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();

                *///////////////////////////////////////////////////////////////////////////////////////////////////////////////

                //into request student
                if (createProjectVar.memberCount != "1")
                {
                    int loop = Convert.ToInt32(createProjectVar.memberCount);
                    for (int i = 0; i < loop - 1; i++)
                    {
                        if (createProjectVar.memberInforCS[i + 1, 1] != "")
                        {
                            process.setStatus(createProjectVar.memberID[i], projectIDCS.ToString(), "11");

                            cmd = new SqlCommand("INSERT INTO request (actionID, projectID , requesterID, replyID ,requestDateTime) VALUES (@actionID, @projectID , @requesterID, @replyID ,@requestDateTime)");
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = connection;
                            cmd.Parameters.AddWithValue("@actionID", "1");
                            cmd.Parameters.AddWithValue("@projectID", projectIDCS);
                            cmd.Parameters.AddWithValue("@requesterID", user.userID());
                            cmd.Parameters.AddWithValue("@replyID", createProjectVar.memberID[i]);
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
                    cmd.Parameters.AddWithValue("@replyID", createProjectVar.teacherIDList[adviser.SelectedIndex]);
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
                    cmd.Parameters.AddWithValue("@replyID", createProjectVar.teacherIDList[coadviser.SelectedIndex]);
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
                    cmd.Parameters.AddWithValue("@replyID", createProjectVar.teacherIDList[committee.SelectedIndex]);
                    cmd.Parameters.AddWithValue("@requestDateTime", myDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();


                }

                Response.Redirect("CPE01.aspx");

                /*/into activityLog
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

                */
            }
        }
    }
}