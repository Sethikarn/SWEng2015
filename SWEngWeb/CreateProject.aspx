<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateProject.aspx.cs" Inherits="SWEngWeb.CPE1" %>

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
<body>
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
                <a class="waves-effect waves-light btn right " href="Logout.aspx" style="margin-top: 12px; margin-bottom: 0px;">ออกจากระบบ</a>

            </div>
        </nav>

        <div <%= globalVar.displayNotHaveProjectMenu %> class="row" style="height: 620px;">
            <div class="card-panel" style="padding: 7px; margin-bottom: 0px; height: 515px;">
                <br />
                <br />
                <br />
                <br />
                <br />
                <div class="center">
                    <a class="center-align grey-text text-darken-4 center"><span style="font-size: 21px;">ท่านยังไม่มีแบบเสนอหัวข้อโครงงาน</span></a>
                </div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <div class="center">
                    <a id="createProjectBTN" class="waves-effect waves-light btn red lighten-2" runat="server" onserverclick="createProject">สร้างโครงงาน</a>
                </div>
            </div>
        </div>

        <div class="container col s12 m9 offset-m2 l8 offset-l3" id="testt" <%= globalVar.displayCreateProject %>>
            <div class="card-panel grey lighten-5 z-depth-1">

                <!-- ชื่อform -->

                <div class="card-panel red lighten-4">

                    <div class="grey-text text-darken-4 col" style="margin-left: 5px; margin-top: 5px;">
                        <h4 style="margin:0px;">แบบเสนอหัวข้อโครงงาน (CPE01)</h4>
                    </div>
                </div>

                <!-- ชื่อโครงงาน -->

                <div class="card-panel">
                    <div class="card-panel red lighten-4" style="padding: 5px;">
                        <div class="row" style="margin-bottom: 0px;">
                            <div class="grey-text text-darken-4 col" style="margin-left: 5px; margin-top: 5px;">
                                <h5>ชื่อโครงงาน</h5>
                            </div>
                        </div>
                    </div>
                    <div class="card-panel" style="padding-bottom: 5px;">
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
                </div>

                <!-- รายชื่อนิสิต -->

                <div class="card-panel">
                    <div id="my_own_textbox" style="margin: 2px 2px 2px 2px;">

                        <div class="card-panel red lighten-4" style="padding: 5px;">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="grey-text text-darken-4 col" style="margin-left: 5px; margin-top: 5px;">
                                    <h5>รายชื่อนิสิตผู้ทำโครงงาน จำนวน</h5>
                                </div>
                                <div class="col s2 left" style="margin-bottom: 0px; margin-top: 0px; padding-top: 0px;">
                                    <div class="red lighten-5" style="margin-top: 5px; border-radius: 2px; padding: 5px; margin-top: 0px;">

                                        <select name="memberCountSelect" id="memberCountSelect" onchange="memberSelect();" class="red lighten-5">
                                            <option value="1" <%= globalVar.displayMember[0]%>>1 คน</option>
                                            <option value="2" <%= globalVar.displayMember[1]%>>2 คน</option>
                                            <option value="3" <%= globalVar.displayMember[2]%>>3 คน</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-panel" style="padding-bottom: 5px;">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="input-field col s2">
                                    <input id="MemberID1" type="text" class="validate" value="<%= globalVar.userID %>" disabled="disabled" />
                                    <label for="MemberID1">รหัสนิสิต</label>
                                </div>
                                <div class="input-field col s4">
                                    <input id="MemberName1" type="text" class="validate" value="<%= globalVar.memberInforCS[0,0] + globalVar.memberInforCS[0,1] + globalVar.memberInforCS[0,2] %>" disabled="disabled" />
                                    <label for="MemberName1">ชื่อ - สกุล</label>
                                </div>
                                <div class="input-field col s2">
                                    <input id="MemberTel1" type="tel" class="validate" value="<%= globalVar.memberInforCS[0,3] %>" disabled="disabled" />
                                    <label for="MemberTel1">เบอร์โทร</label>
                                </div>
                                <div class="input-field col s4">
                                    <input id="MemberEmail1" type="email" class="validate" value="<%= globalVar.memberInforCS[0,4] %>" disabled="disabled" />
                                    <label for="MemberEmail1">อีเมล์</label>
                                </div>
                            </div>
                        </div>
                        <div class="card-panel" id="my_own_textbox1" style="display: none; padding-bottom: 5px;">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="input-field col s2">
                                    <asp:TextBox name="MemberID2" ID="MemberID2" type="text" CssClass="validate" runat="server"></asp:TextBox>
                                    <label for="MemberID2">รหัสนิสิต</label>
                                </div>
                                <div class="input-field col s4">
                                    <input name=" MemberName2" id=" MemberName2" type="text" class="validate" value="<%= globalVar.memberInforCS[1,0] + globalVar.memberInforCS[1,1] + globalVar.memberInforCS[1,2] %>" disabled="disabled" />
                                    <label for="MemberName2">ชื่อ - สกุล</label>
                                </div>
                                <div class="input-field col s2">
                                    <input id="MemberTel2" type="tel" class="validate" value="<%= globalVar.memberInforCS[1,3] %>" disabled="disabled" />
                                    <label for="MemberTel2">เบอร์โทร</label>
                                </div>
                                <div class="input-field col s3">
                                    <input id="MemberEmail2" type="email" class="validate" value="<%= globalVar.memberInforCS[1,4] %>" disabled="disabled" />
                                    <label for="MemberEmail2">อีเมล์</label>
                                </div>
                                <div class="col s1">
                                    <a id="personOp" runat="server" onserverclick="addMember2Click" class="waves-effect waves-light btn right red" style="margin: 10px;">เพิ่ม</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-panel" id="my_own_textbox2" style="display: none; padding-bottom: 0px;">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="input-field col s2">
                                    <asp:TextBox name="MemberID3" ID="MemberID3" type="text" CssClass="validate" runat="server"></asp:TextBox>
                                    <label for="MemberID3">รหัสนิสิต</label>
                                </div>
                                <div class="input-field col s4">
                                    <input name=" MemberName3" id=" MemberName3" type="text" class="validate" value="<%= globalVar.memberInforCS[2,0] + globalVar.memberInforCS[2,1] + globalVar.memberInforCS[2,2] %>" disabled="disabled" />
                                    <label for="MemberName2">ชื่อ - สกุล</label>
                                </div>
                                <div class="input-field col s2">
                                    <input id="MemberTel3" type="tel" class="validate" value="<%= globalVar.memberInforCS[2,3] %>" disabled="disabled" />
                                    <label for="MemberTel2">เบอร์โทร</label>
                                </div>
                                <div class="input-field col s3">
                                    <input id="MemberEmail3" type="email" class="validate" value="<%= globalVar.memberInforCS[2,4] %>" disabled="disabled" />
                                    <label for="MemberEmail2">อีเมล์</label>
                                </div>
                                <div class="col s1">
                                    <a id="personOp2" runat="server" onserverclick="addMember3Click" class="waves-effect waves-light btn right red" style="margin: 10px;">เพิ่ม</a>
                                </div>

                            </div>
                        </div>


                        <%--<div id="insertMem" runat="server" class="card-panel" style="padding-bottom: 0px;" >
                        <div class="row" style="margin-bottom: 0px;">
                            <div class="input-field col s2">
                                <asp:TextBox name="MemberID3" id="TextBox1" type="text" Cssclass="validate" runat="server"></asp:TextBox>
                                <label for="MemberID3">รหัสนิสิต</label>
                            </div>
                            <div class="col s1">
                                <a id="A1" runat="server" onserverclick="addMember" class="waves-effect waves-light btn right red" style="margin: 10px;">เพิ่ม</a>
                            </div>
                        </div>
                    </div>--%>
                    </div>
                </div>

                <!-- เลือกอาจารย์ -->

                <div class="card-panel">
                    <div class="card-panel red lighten-4" style="padding: 5px;">
                        <div class="row" style="margin-bottom: 0px;">
                            <div class="grey-text text-darken-4 col" style="margin-left: 5px; margin-top: 5px;">
                                <h5>อาจารย์ประจำโครงงาน</h5>
                            </div>
                        </div>
                    </div>
                    <div class="card-panel" style="padding: 20px;">
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
                </div>

                <!-- บันทึก/ยกเลิก -->

                <div class="row" style="margin-bottom: 0px;">
                    <a runat="server" onserverclick="cancleCreate" class="waves-effect waves-light btn right red lighten-2" style="margin: 10px;">ยกเลิก</a>
                    <a id="submit" runat="server" onserverclick="create" class="waves-effect waves-light btn right red lighten-2" style="margin: 10px;">บันทึก</a>
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

        <!--  Scripts-->
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

        <!--  ScriptsNew-->
        <script>if (!window.jQuery) { document.write('<script src="bin/jquery-2.1.1.min.js"><\/script>'); }</script>
        <script src="js/jquery.timeago.min.js"></script>
        <script src="js/prism.js"></script>

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
