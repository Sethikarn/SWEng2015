<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CPE01.aspx.cs" Inherits="SWEngWeb.CPE01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>ระบบประเมินและตรวจสอบโครงการ คณะวิศวกรรมศาสตร์ มหาวิทยาลัยนเรศวร</title>
    <!-- CSS  -->
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />

    <script src="js/jquery-1.10.2.js"></script>
    <script>

        $(document).ready(function () {
            memberSelect();
        });

    </script>
</head>
<body style="min-width: 860px;">
    <form id="form1" runat="server">
        <nav class="red lighten-2 z-depth-2" role="navigation">
            <div class="container">

                <a href="http://www.nu.ac.th" target="_blank">
                    <img src="pic/NU_LOGO1.png" alt="" class="left circle responsive-img z-depth-1" />
                </a>
                <a href="http://www.eng.nu.ac.th" target="_blank">
                    <img src="pic/logoEng.png" alt="" class="left circle responsive-img z-depth-1" style="margin-left: 4px;" />
                </a>

                <a class="center-align grey-text text-lighten-4 center" style="margin-left: 70px;"><span style="font-size: 21px;">ระบบประเมินและตรวจสอบโครงการคณะวิศวกรรมศาสตร์</span></a>
                <a class="waves-effect waves-light btn right " href="Logout.aspx" style="margin: 12px 0px 0px 0px; padding: 0px 10px 0px 10px;">ออกจากระบบ</a>
                <a class="waves-effect waves-light btn right " href="Notification.aspx" style="margin: 12px 5px 0px 0px; padding: 0px 10px 0px 10px;"><i class="material-icons right" style="margin-left: 10px;">textsms</i> 0 </a>


            </div>
        </nav>

        <div class="container">
            <div class="row" style="margin-bottom: 5px;">
                <div id="menubar" class="col s3 left" style="margin-right: 0px; min-height: 538px; padding-right: 5px; padding-left: 5px;" runat="server">

                    <div class="row red lighten-5" style="margin: 0px;">
                        <a href="http://www.eng.nu.ac.th" target="_blank">
                            <img src="pic/imageedit_6_2524784814.png" alt="" class="responsive-img center" />
                        </a>
                    </div>

                    <%string UName = SWEngWeb.user.name(); %>
                    <div class="row" style="margin: 0px 0px;">
                        <div class="card-panel red lighten-4 z-depth-1" style="margin: 0px 0px 0px 0px; padding: 0px 3px 0px 3px; height: 40px;">
                            <div class="row valign-wrapper" style="margin-bottom: 0px;">
                                <div class="col s1" style="margin: 0px 10px 0px 0px;">
                                    <i class="material-icons prefix" style="margin-left: 5px; margin-right: 2px; margin-top: 8px;">person_pin</i>
                                </div>
                                <div class="col s11" style="margin-left: 0px; line-height: 40px;">
                                    <span class="black-text center">สวัสดี <%: UName %>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="card-panel" style="padding: 7px; margin-bottom: 0px;">
                        <a class="waves-effect waves-light btn center red lighten-2" href="StudentMenu.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">เมนูหลัก</a>
                        <% 
                            if (SWEngWeb.user.userHaveProject())
                            {
                        %>
                        <a class="waves-effect waves-light btn center red lighten-2" href="under_construction.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แก้ไข</a>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="col s9" style="margin-left: 0px; padding-left: 0px; padding: 0px;">
                    <div class="card-panel infor" style="padding: 15px; margin: 0px; min-height: 527px;">




                        <% 
                            if (!SWEngWeb.user.userHaveProject())
                            {
                        %>
                        <!-- ชื่อform -->

                        <div class="card-panel red lighten-4 center">
                            <div class="grey-text text-darken-4 col s12 center" style="margin-top: -10px;">
                                <h5 style="margin: 0px;" class="center">แบบเสนอหัวข้อโครงงาน (CPE01)</h5>
                            </div>
                        </div>

                        <!-- ชื่อโครงงาน -->

                        <div class="card-panel red lighten-4" style="padding: 5px;">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="grey-text text-darken-4 col" style="margin-left: 5px; margin-top: 5px;">
                                    <h5>ชื่อโครงงาน</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-panel" style="padding-bottom: 5px; margin-top: -14px;">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="input-field col s6">
                                    <asp:TextBox ID="thaiNameInput" names="thaiNameInput" runat="server"></asp:TextBox>
                                    <label for="thaiNameInput">ชื่อไทย</label>
                                </div>
                                <div class="input-field col s6">
                                    <asp:TextBox ID="englishNameInput" name="englishNameInput" runat="server"></asp:TextBox>
                                    <label for="englishNameInput">ชื่ออังกฤษ</label>
                                </div>
                            </div>
                        </div>

                        <!-- รายชื่อนิสิต -->

                        <div id="my_own_textbox" style="margin: 2px 2px 2px 2px;">

                            <div class="card-panel red lighten-4" style="padding: 5px;">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="grey-text text-darken-4 col" style="margin-left: 5px; margin-top: 5px;">
                                        <h5>รายชื่อนิสิตผู้ทำโครงงาน จำนวน</h5>
                                    </div>
                                    <div class="col s2 left" style="margin-bottom: 0px; margin-top: 0px; padding-top: 0px;">
                                        <div class="red lighten-5" style="margin-top: 5px; border-radius: 2px; padding: 5px; margin-top: 0px;">
                                            <select name="memberCountSelect" id="memberCountSelect" onchange="memberSelect();" class="red lighten-5">
                                                <option value="1" <%= SWEngWeb.CPE01Var.displayMember[0]%>>1 คน</option>
                                                <option value="2" <%= SWEngWeb.CPE01Var.displayMember[1]%>>2 คน</option>
                                                <option value="3" <%= SWEngWeb.CPE01Var.displayMember[2]%>>3 คน</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-panel" style="padding-bottom: 5px; margin-top: -14px;">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="input-field col s2">
                                        <input id="MemberID1" type="text" class="validate" value="<%= SWEngWeb.user.userID() %>" disabled="disabled" />
                                        <label for="MemberID1">รหัสนิสิต</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="MemberName1" type="text" class="validate" value="<%= SWEngWeb.user.name() %>" disabled="disabled" />
                                        <label for="MemberName1">ชื่อ - สกุล</label>
                                    </div>
                                    <div class="input-field col s2">
                                        <input id="MemberTel1" type="tel" class="validate" value="<%= SWEngWeb.user.phone() %>" disabled="disabled" />
                                        <label for="MemberTel1">เบอร์โทร</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="MemberEmail1" type="email" class="validate" value="<%= SWEngWeb.user.email() %>" disabled="disabled" />
                                        <label for="MemberEmail1">อีเมล์</label>
                                    </div>
                                </div>
                            </div>
                            <div class="card-panel" id="my_own_textbox1" style="display: none; padding-bottom: 5px; margin-top: -14px;">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="input-field col s2">
                                        <asp:TextBox name="MemberID2" ID="MemberID2" type="text" CssClass="validate" runat="server"></asp:TextBox>
                                        <label for="MemberID2">รหัสนิสิต</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input name=" MemberName2" id=" MemberName2" type="text" class="validate" value="<%= SWEngWeb.CPE01Var.memberInforCS[1, 0] + SWEngWeb.CPE01Var.memberInforCS[1, 1] + " " + SWEngWeb.CPE01Var.memberInforCS[1, 2] %>" disabled="disabled" />
                                        <label for="MemberName2">ชื่อ - สกุล</label>
                                    </div>
                                    <div class="input-field col s2">
                                        <input id="MemberTel2" type="tel" class="validate" value="<%= SWEngWeb.CPE01Var.memberInforCS[1, 3] %>" disabled="disabled" />
                                        <label for="MemberTel2">เบอร์โทร</label>
                                    </div>
                                    <div class="input-field col s3">
                                        <input id="MemberEmail2" type="email" class="validate" value="<%= SWEngWeb.CPE01Var.memberInforCS[1, 4] %>" disabled="disabled" />
                                        <label for="MemberEmail2">อีเมล์</label>
                                    </div>
                                    <div class="col s1">
                                        <a id="personOp" runat="server" onserverclick="addMember2Click" class="waves-effect waves-light btn right red" style="margin: 10px;">เพิ่ม</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-panel" id="my_own_textbox2" style="display: none; padding-bottom: 0px; margin-top: -14px;">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="input-field col s2">
                                        <asp:TextBox name="MemberID3" ID="MemberID3" type="text" CssClass="validate" runat="server"></asp:TextBox>
                                        <label for="MemberID3">รหัสนิสิต</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input name=" MemberName3" id=" MemberName3" type="text" class="validate" value="<%= SWEngWeb.CPE01Var.memberInforCS[2, 0] + SWEngWeb.CPE01Var.memberInforCS[2, 1] + " " + SWEngWeb.CPE01Var.memberInforCS[2, 2] %>" disabled="disabled" />
                                        <label for="MemberName2">ชื่อ - สกุล</label>
                                    </div>
                                    <div class="input-field col s2">
                                        <input id="MemberTel3" type="tel" class="validate" value="<%= SWEngWeb.CPE01Var.memberInforCS[2, 3] %>" disabled="disabled" />
                                        <label for="MemberTel2">เบอร์โทร</label>
                                    </div>
                                    <div class="input-field col s3">
                                        <input id="MemberEmail3" type="email" class="validate" value="<%= SWEngWeb.CPE01Var.memberInforCS[2, 4] %>" disabled="disabled" />
                                        <label for="MemberEmail2">อีเมล์</label>
                                    </div>
                                    <div class="col s1">
                                        <a id="personOp2" runat="server" onserverclick="addMember3Click" class="waves-effect waves-light btn right red" style="margin: 10px;">เพิ่ม</a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- เลือกอาจารย์ -->

                        <div class="card-panel red lighten-4" style="padding: 5px;">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="grey-text text-darken-4 col" style="margin-left: 5px; margin-top: 5px;">
                                    <h5>อาจารย์ประจำโครงงาน</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-panel" style="padding: 0px 20px 20px 20px; margin-top: -14px;">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="col s12">
                                    <br />
                                    <h6>อาจารย์ที่ปรึกษาโครงการ 
                                    <br />
                                    </h6>
                                    <asp:DropDownList ID="adviser" runat="server">
                                        <asp:ListItem Selected>กรุณาเลือก</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                                <div class="col s12">
                                    <br />
                                    <h6>อาจารย์ที่ปรึกษาโครงการร่วม(ถ้ามี) 
                                    <br />
                                    </h6>

                                    <asp:DropDownList ID="coadviser" runat="server">
                                        <asp:ListItem Selected>กรุณาเลือก</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col s12">
                                    <br />
                                    <h6>เสนอรายชื่อกรรมการ 
                                    <br />
                                    </h6>
                                    <asp:DropDownList ID="committee" runat="server">
                                        <asp:ListItem Selected>กรุณาเลือก</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <!-- บันทึก/ยกเลิก -->

                        <div class="row" style="margin-bottom: 0px;">
                            <a runat="server" onserverclick="cancleCreate" class="waves-effect waves-light btn right red lighten-2" style="margin: 10px;">ยกเลิก</a>
                            <a id="submit" runat="server" onserverclick="create" class="waves-effect waves-light btn right red lighten-2" style="margin: 10px;">บันทึก</a>
                        </div>



                        <%

                            }
                            else
                            {
                        %>

                        <div class="center">

                            <% 
                                List<string[]> memSta = new List<string[]>();
                                memSta = SWEngWeb.information.studentInProject(SWEngWeb.user.projectID().ToString());
                                /* for (int i = 0; i < memSta.Count; i++)
                                 {
                                     Response.Write(
                                         "<div class=\"card\" >"
                                         + " " + memSta[i][0] + " " + memSta[i][1] + " " + memSta[i][2] + " " + memSta[i][3] +
                                         "<a class=\"right\">" + memSta[i][4] + "</a>" +
                                         "</div>"
                                         );
                                 }*/

                                string[] ad = SWEngWeb.information.adviserInProject(SWEngWeb.user.projectID().ToString());
                                string[] coad = SWEngWeb.information.coadviserInProject(SWEngWeb.user.projectID().ToString());
                                string[] com = SWEngWeb.information.committeeInProject(SWEngWeb.user.projectID().ToString());

                                //Response.Write(ad[1] + " " + ad[2] + " " + ad[3] + " " + ad[4] + "</br>");
                                //Response.Write(coad[1] + " " + coad[2] + " " + coad[3] + " " + coad[4] + "</br>");
                                //Response.Write(com[1] + " " + com[2] + " " + com[3] + " " + com[4] + "</br>");
                            %>
                        </div>



                        <!-- ชื่อform -->

                        <div class="card-panel grey lighten-2 center">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="grey-text text-darken-4 col s12 center" style="margin-top: 5px;">
                                    <h5 style="margin: 0px;" class="center">แบบเสนอหัวข้อโครงงาน (CPE01)</h5>
                                </div>
                            </div>
                        </div>

                        <!-- ชื่อโครงงาน -->

                        <div class="card-panel grey lighten-2" style="padding: 5px;">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="grey-text text-darken-4 col" style="margin-left: 5px; margin-top: 5px;">
                                    <h5>ชื่อโครงงาน</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-panel" style="padding-bottom: 5px; margin-top: -14px;">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="input-field col s6">
                                    <input value="<%= SWEngWeb.user.thaiProjectName() %>" id="thaiNameInput2" type="text" class="validate" disabled="disabled" />
                                    <label for="thaiNameInput2">ชื่อไทย</label>
                                </div>
                                <div class="input-field col s6">
                                    <input value="<%= SWEngWeb.user.engProjectName() %>" id="englishNameInput2" type="text" class="validate" disabled="disabled" />
                                    <label for="englishNameInput">ชื่ออังกฤษ</label>
                                </div>
                            </div>
                        </div>

                        <!-- รายชื่อนิสิต -->
                        <%
                            int memCount = SWEngWeb.information.memberCount(SWEngWeb.user.projectID().ToString());
                        %>
                        <div id="my_own_textbox" style="margin: 2px 2px 2px 2px;">
                            <div class="card-panel grey lighten-2" style="padding: 5px;">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="grey-text text-darken-4 col" style="margin-left: 5px; margin-top: 5px;">
                                        <h5>รายชื่อนิสิตผู้ทำโครงงาน จำนวน <%= memCount.ToString() + " คน" %></h5>
                                    </div>
                                </div>
                            </div>

                            <a class="waves-effect waves-light btn-flat right grey lighten-2" style="margin: -14px 0px -15px 0px;"><%= memSta[0][6] %></a>
                            <div class="card-panel" style="padding-bottom: 5px; margin-top: -14px;">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="input-field col s2">
                                        <input id="MemberID1" type="text" class="validate" value="<%= memSta[0][0] %>" disabled="disabled" />
                                        <label for="MemberID1">รหัสนิสิต</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="MemberName1" type="text" class="validate" value="<%= memSta[0][1] + memSta[0][2] + " " + memSta[0][3] %>" disabled="disabled" />
                                        <label for="MemberName1">ชื่อ - สกุล</label>
                                    </div>
                                    <div class="input-field col s2">
                                        <input id="MemberTel1" type="tel" class="validate" value="<%= memSta[0][5] %>" disabled="disabled" />
                                        <label for="MemberTel1">เบอร์โทร</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="MemberEmail1" type="email" class="validate" value="<%= memSta[0][4] %>" disabled="disabled" />
                                        <label for="MemberEmail1">อีเมล์</label>
                                    </div>
                                </div>
                            </div>

                            <%
                                if (memCount > 1)
                                {
                            %>

                            <a class="waves-effect waves-light btn-flat right grey lighten-2" style="margin: -14px 0px -15px 0px;"><%= memSta[1][6] %></a>
                            <div class="card-panel" id="my_own_textbox1" style="padding-bottom: 5px; margin-top: -14px;">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="input-field col s2">
                                        <input id="MemberID1" type="text" class="validate" value="<%= memSta[1][0] %>" disabled="disabled" />
                                        <label for="MemberID1">รหัสนิสิต</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="MemberName1" type="text" class="validate" value="<%= memSta[1][1] + memSta[1][2] + " " + memSta[1][3] %>" disabled="disabled" />
                                        <label for="MemberName1">ชื่อ - สกุล</label>
                                    </div>
                                    <div class="input-field col s2">
                                        <input id="MemberTel1" type="tel" class="validate" value="<%= memSta[1][5] %>" disabled="disabled" />
                                        <label for="MemberTel1">เบอร์โทร</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="MemberEmail1" type="email" class="validate" value="<%= memSta[1][4] %>" disabled="disabled" />
                                        <label for="MemberEmail1">อีเมล์</label>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>

                            <%
                                if (memCount > 2)
                                {
                            %>

                            <a class="waves-effect waves-light btn-flat right grey lighten-2" style="margin: -14px 0px -15px 0px;"><%= memSta[2][6] %></a>
                            <div class="card-panel" id="my_own_textbox2" style="padding-bottom: 0px; margin-top: -14px;">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="input-field col s2">
                                        <input id="MemberID1" type="text" class="validate" value="<%= memSta[2][0] %>" disabled="disabled" />
                                        <label for="MemberID1">รหัสนิสิต</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="MemberName1" type="text" class="validate" value="<%= memSta[2][1] + memSta[2][2] + " " + memSta[2][3] %>" disabled="disabled" />
                                        <label for="MemberName1">ชื่อ - สกุล</label>
                                    </div>
                                    <div class="input-field col s2">
                                        <input id="MemberTel1" type="tel" class="validate" value="<%= memSta[2][5] %>" disabled="disabled" />
                                        <label for="MemberTel1">เบอร์โทร</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="MemberEmail1" type="email" class="validate" value="<%= memSta[2][4] %>" disabled="disabled" />
                                        <label for="MemberEmail1">อีเมล์</label>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>

                        <!-- เลือกอาจารย์ -->
                        <div style="margin: 2px 2px 2px 2px;">
                            <div class="card-panel grey lighten-2" style="padding: 5px;">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="grey-text text-darken-4 col" style="margin-left: 5px; margin-top: 5px;">
                                        <h5>อาจารย์ประจำโครงงาน</h5>
                                    </div>
                                </div>
                            </div>

                            <a class="waves-effect waves-light btn-flat right grey lighten-2" style="margin: -14px 0px -15px 0px;"><%= ad[4] %></a>
                            <div class="card-panel" style="padding-bottom: 5px; margin-top: -14px;">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="input-field col s12">
                                        <input id="ad" type="text" class="validate" value="<%= ad[1] + " " + ad[2] + " " + ad[3] %>" disabled="disabled" />
                                        <label for="ad">อาจารย์ที่ปรึกษาโครงการ</label>
                                    </div>
                                </div>
                            </div>

                            <a class="waves-effect waves-light btn-flat right grey lighten-2" style="margin: -14px 0px -15px 0px;"><%= coad[4] %></a>
                            <div class="card-panel" style="padding-bottom: 5px; margin-top: -14px;">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="input-field col s12">
                                        <input id="coad" type="text" class="validate" value="<%= coad[1] + " " + coad[2] + " " + coad[3] %>" disabled="disabled" />
                                        <label for="coad">อาจารย์ที่ปรึกษาโครงการร่วม</label>
                                    </div>
                                </div>
                            </div>

                            <a class="waves-effect waves-light btn-flat right grey lighten-2" style="margin: -14px 0px -15px 0px;"><%= com[4] %></a>
                            <div class="card-panel" style="padding-bottom: 5px; margin-top: -14px;">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="input-field col s12">
                                        <input id="com" type="text" class="validate" value="<%= com[1] + " " + com[2] + " " + com[3] %>" disabled="disabled" />
                                        <label for="com">กรรมการ</label>
                                    </div>
                                </div>
                            </div>



                        </div>


                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <footer class="page-footer red lighten-1" style="padding-top: 0px;">
            <div>
                <p class="center-align grey-text text-lighten-4" style="margin: 0px;">เว็บไซต์นี้ถูกสร้างขึ้นเพื่อเป็นระบบประเมินและตรวจสอบโครงการของนิสิตคณะวิศวกรรมศาสตร์ สาขาวิศวกรรมคอมพิวเตอร์ มหาวิทยาลัยนเรศวร</p>
            </div>
            <div class="footer-copyright" style="height: 40px; line-height: 40px;">
                <div class="container center-align">
                    © 2014 <a class=" grey-text text-lighten-4" href="About.aspx">BagaJN</a> | © 2015 <a class=" grey-text text-lighten-4" href="About.aspx">หัวหลิม</a> | Powered by <a class=" grey-text text-lighten-4" href="http://materializecss.com" target="_blank">Materialize</a><a class="right grey-text text-lighten-1">P03</a><a class="waves-effect waves-light btn right " href="About.aspx" style="margin-top: 2px; margin-bottom: 0px; margin-right: 5px;">เกี่ยวกับ</a>
                </div>
            </div>
        </footer>

        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

        <script type="text/javascript">

            function homePageResposive() {
                var DisplayHeight = document.documentElement.clientHeight;
                var H = DisplayHeight;
                var minPageHeight = 650;
                var currentHight;

                var DisplayWidth = document.documentElement.clientWidth;
                var minPageWidth = 860;

                $(".infor").css("min-height", function () {
                    H = H - 147;
                    if (H < 650 - 147) {
                        H = 650 - 147;
                    }
                    return H;
                });
            }

            homePageResposive();

            window.onresize = function () {
                homePageResposive();
            }
        </script>

        <script>
            function memberSelect() {
                if (document.getElementById('memberCountSelect').value == 1) {
                    document.getElementById('my_own_textbox1').style.display = 'none';
                    document.getElementById('my_own_textbox2').style.display = 'none';

                }
                else if (document.getElementById('memberCountSelect').value == 2) {
                    document.getElementById('my_own_textbox1').style.display = 'block';
                    document.getElementById('my_own_textbox2').style.display = 'none';

                }
                else if (document.getElementById('memberCountSelect').value == 3) {
                    document.getElementById('my_own_textbox1').style.display = 'block';
                    document.getElementById('my_own_textbox2').style.display = 'block';
                }
            }

        </script>

        <script>
            $(document).ready(function () {
                $('.collapsible').collapsible({
                    accordion: false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $('select').material_select();
            });
        </script>

    </form>
</body>
</html>

