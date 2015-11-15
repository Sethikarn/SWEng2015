﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWEngWeb
{
    public partial class CPE01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;

            /*//////////////////////////////--------------- Check is login ---------------///////////////////////////////
            if not login redirect to login page 
                otherwise continue
            */
            if ( ! user.isLogin())
                Response.Redirect("~/");

            /*//////////////////////////////--------------- Check is user have project ---------------///////////////////////////////
            if user already have project continue
                otherwise redirect to CreateProject
            */
            if (user.userHaveProject())
            {
                CPE01Var.displayNotHaveProject = "style=\"display: none;\"";
                CPE01Var.displayHaveProject = "style=\"display: block;\""; 
            }
            else
            {
                CPE01Var.displayNotHaveProject = "style=\"display: block;\"";
                CPE01Var.displayHaveProject = "style=\"display: none;\""; 

                if (Request.Form["memberCountSelect"] != null)
                    {
                        CPE01Var.memberCount = Request.Form["memberCountSelect"];
                    }
                    else
                    {
                        CPE01Var.memberCount = "1";

                        CPE01Var.memberID[0] = "";
                        CPE01Var.memberInforCS[1, 0] = "";
                        CPE01Var.memberInforCS[1, 1] = "";
                        CPE01Var.memberInforCS[1, 2] = "";
                        CPE01Var.memberInforCS[1, 3] = "";
                        CPE01Var.memberInforCS[1, 4] = "";
                        MemberID2.Text = "";
                        personOp.InnerText = "เพิ่ม";

                        CPE01Var.memberID[1] = "";
                        CPE01Var.memberInforCS[2, 0] = "";
                        CPE01Var.memberInforCS[2, 1] = "";
                        CPE01Var.memberInforCS[2, 2] = "";
                        CPE01Var.memberInforCS[2, 3] = "";
                        CPE01Var.memberInforCS[2, 4] = "";
                        MemberID3.Text = "";
                        personOp2.InnerText = "เพิ่ม";
                    }


                    if (CPE01Var.memberCount == "1")
                    {
                        CPE01Var.displayMember = new string[3] { "selected=\"selected\"", "", "" };

                        CPE01Var.memberID[0] = "";
                        CPE01Var.memberInforCS[1, 0] = "";
                        CPE01Var.memberInforCS[1, 1] = "";
                        CPE01Var.memberInforCS[1, 2] = "";
                        CPE01Var.memberInforCS[1, 3] = "";
                        CPE01Var.memberInforCS[1, 4] = "";
                        MemberID2.Text = "";
                        personOp.InnerText = "เพิ่ม";

                        CPE01Var.memberID[1] = "";
                        CPE01Var.memberInforCS[2, 0] = "";
                        CPE01Var.memberInforCS[2, 1] = "";
                        CPE01Var.memberInforCS[2, 2] = "";
                        CPE01Var.memberInforCS[2, 3] = "";
                        CPE01Var.memberInforCS[2, 4] = "";
                        MemberID3.Text = "";
                        personOp2.InnerText = "เพิ่ม";
                    }
                    else if (CPE01Var.memberCount == "2")
                    {
                        CPE01Var.displayMember = new string[3] { "", "selected=\"selected\"", "" };
                        CPE01Var.memberID[1] = "";
                        CPE01Var.memberInforCS[2, 0] = "";
                        CPE01Var.memberInforCS[2, 1] = "";
                        CPE01Var.memberInforCS[2, 2] = "";
                        CPE01Var.memberInforCS[2, 3] = "";
                        CPE01Var.memberInforCS[2, 4] = "";
                        MemberID3.Text = "";
                        personOp2.InnerText = "เพิ่ม";
                    }
                    else if (CPE01Var.memberCount == "3")
                    {
                        CPE01Var.displayMember = new string[3] { "", "", "selected=\"selected\"" };
                    }


                if (!IsPostBack)
                {
                    List<string[]> TeacherInfor = new List<string[]>();
                    TeacherInfor = information.allTeacher();
                    for (int i = 0; i < TeacherInfor.Count; i++)
                    {
                        CPE01Var.teacherIDList.Add(TeacherInfor[i][0]);
                        adviser.Items.Add(TeacherInfor[i][1] + TeacherInfor[i][2] + " " + TeacherInfor[i][3]);
                        coadviser.Items.Add(TeacherInfor[i][1] + TeacherInfor[i][2] + " " + TeacherInfor[i][3]);
                        committee.Items.Add(TeacherInfor[i][1] + TeacherInfor[i][2] + " " + TeacherInfor[i][3]);
                    }
                }
            }
        }
        protected void memberClear(int index)
        {
            CPE01Var.memberID[index - 1] = "";
            CPE01Var.memberInforCS[index, 0] = "";
            CPE01Var.memberInforCS[index, 1] = "";
            CPE01Var.memberInforCS[index, 2] = "";
            CPE01Var.memberInforCS[index, 3] = "";
            CPE01Var.memberInforCS[index, 4] = "";

            if (index == 2)
                MemberID3.Text = "";

            if (index == 1)
                MemberID2.Text = "";
        }
        protected void cancleCreate(object sender, EventArgs e)
        {
            CPE01Var.clear();
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
                CPE01Var.thaiName = thaiNameInput.Text;
                if (englishNameInput.Text != "") //สรวจสอบชื่ออังกฤษ
                {
                    CPE01Var.englishName = englishNameInput.Text;

                    memCount = 1;  //ตัวเทียบนับจำนวนสมาชิก
                    if (CPE01Var.memberInforCS[1, 1] != "") //นับจากจำนวนชื่อ
                        memCount++;
                    if (CPE01Var.memberInforCS[2, 1] != "")
                        memCount++;

                    if (Request.Form["memberCountSelect"] != null)  //ถ้าตัวเลือกจำนวนสมาชิกไม่เป็นเนา
                    {
                        CPE01Var.memberCount = Request.Form["memberCountSelect"];
                    }
                    else
                    {
                        CPE01Var.memberCount = "1";
                    }
                    if (CPE01Var.memberCount == "1")
                    {
                        memberClear(1);
                        memberClear(2);
                    }
                    if (CPE01Var.memberCount == "2")
                    {
                        memberClear(2);
                    }

                    if (CPE01Var.memberCount == memCount.ToString()) //ถ้ามีสมาชิกตากจำนวนที่กำหนด
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
            string constr = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);

            String getInfor = "select title , firstName , lastName , phoneNumber , email from person where personID ='" + user.userID() + "'";
            conn.Open();
            SqlCommand com = new SqlCommand(getInfor, conn);
            SqlDataReader infor = com.ExecuteReader();
            infor.Read();
            CPE01Var.memberInforCS[0, 0] = infor.GetString(0);
            CPE01Var.memberInforCS[0, 1] = infor.GetString(1) + "  ";
            CPE01Var.memberInforCS[0, 2] = infor.GetString(2);
            CPE01Var.memberInforCS[0, 3] = infor.GetString(3);
            CPE01Var.memberInforCS[0, 4] = infor.GetString(4);
            conn.Close();
        }
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
                    if (input != user.userID() && input != CPE01Var.memberID[1])
                    {
                        string[] studentInfor = information.student(input);
                        if (studentInfor[0] != null)
                        {
                            if (!information.studentHaveProject(input))
                            {
                                CPE01Var.memberID[0] = input;
                                CPE01Var.memberInforCS[1, 0] = studentInfor[0];
                                CPE01Var.memberInforCS[1, 1] = studentInfor[1];
                                CPE01Var.memberInforCS[1, 2] = studentInfor[2];
                                CPE01Var.memberInforCS[1, 3] = studentInfor[3];
                                CPE01Var.memberInforCS[1, 4] = studentInfor[4];
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
                    CPE01Var.memberCount = Request.Form["memberCountSelect"];
                }
                else
                {
                    CPE01Var.memberCount = "1";
                }

                /////////////////////////////////////////////////////////////////////

                if (CPE01Var.memberCount == "3")
                {
                    if (CPE01Var.memberID[1] != "")
                    {
                        CPE01Var.memberID[0] = CPE01Var.memberID[1];
                        CPE01Var.memberInforCS[1, 0] = CPE01Var.memberInforCS[2, 0];
                        CPE01Var.memberInforCS[1, 1] = CPE01Var.memberInforCS[2, 1];
                        CPE01Var.memberInforCS[1, 2] = CPE01Var.memberInforCS[2, 2];
                        CPE01Var.memberInforCS[1, 3] = CPE01Var.memberInforCS[2, 3];
                        CPE01Var.memberInforCS[1, 4] = CPE01Var.memberInforCS[2, 4];
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
                    if (input != user.userID() && input != CPE01Var.memberID[0])
                    {
                        string[] studentInfor = information.student(input);
                        if (studentInfor[0] != null)
                        {
                            if (!information.studentHaveProject(input))
                            {

                                CPE01Var.memberID[1] = input;
                                CPE01Var.memberInforCS[2, 0] = studentInfor[0];
                                CPE01Var.memberInforCS[2, 1] = studentInfor[1];
                                CPE01Var.memberInforCS[2, 2] = studentInfor[2];
                                CPE01Var.memberInforCS[2, 3] = studentInfor[3];
                                CPE01Var.memberInforCS[2, 4] = studentInfor[4];
                                MemberID3.Text = input;
                                personOp2.InnerText = "ลบ";
                                CPE01Var.memberCheck[1] = true;
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
                CPE01Var.memberCheck[1] = false;
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", errorMem3, true);
                MemberID3.Enabled = true;
            }
        }
        protected void queryToDB()
        {
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString))
            {
                // into project table
                string projectIDCS = process.createProject(CPE01Var.thaiName, CPE01Var.englishName, CPE01Var.memberCount);

                //into position
                process.setStatus(user.userID(), projectIDCS, "1");

                //into request student
                if (CPE01Var.memberCount != "1")
                {
                    int loop = Convert.ToInt32(CPE01Var.memberCount);
                    for (int i = 0; i < loop - 1; i++)
                    {
                        if (CPE01Var.memberInforCS[i + 1, 1] != "")
                        {
                            process.makeRequest("1", projectIDCS, CPE01Var.memberID[i]);
                            process.setStatus(CPE01Var.memberID[i], projectIDCS, "11");
                        }
                    }
                }

                //into request avviser
                if (adviser.SelectedIndex != 0)
                {
                    process.makeRequest("3", projectIDCS, CPE01Var.teacherIDList[adviser.SelectedIndex].ToString());
                    process.setStatus(CPE01Var.teacherIDList[adviser.SelectedIndex].ToString(), projectIDCS, "12");
                }

                //into request coadviser
                if (coadviser.SelectedIndex != 0)
                {
                    process.makeRequest("4", projectIDCS, CPE01Var.teacherIDList[coadviser.SelectedIndex].ToString());
                    process.setStatus(CPE01Var.teacherIDList[coadviser.SelectedIndex].ToString(), projectIDCS, "13");
                }

                //into request committee
                if (committee.SelectedIndex != 0)
                {
                    process.makeRequest("5", projectIDCS, CPE01Var.teacherIDList[committee.SelectedIndex].ToString());
                    process.setStatus(CPE01Var.teacherIDList[committee.SelectedIndex].ToString(), projectIDCS, "14");
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