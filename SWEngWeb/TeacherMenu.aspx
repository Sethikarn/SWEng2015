<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherMenu.aspx.cs" Inherits="SWEngWeb.TeacherMenu" %>

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
                <a class="waves-effect waves-light btn right " href="Logout.aspx" style="margin-top: 12px; margin-bottom: 0px;">ออกจากระบบ</a>
                <% 
                    int notiCount = SWEngWeb.user.ontificationCount();
                    if (notiCount != 0)
                    {
                %>
                <a class="waves-effect waves-light btn right red" href="Notification.aspx" style="margin: 12px 5px 0px 0px; padding: 0px 10px 0px 10px;"><i class="material-icons right" style="margin-left: 10px;">textsms</i> <%: notiCount %> </a>
                <%
                    }
                    else
                    {
                %>
                <a class="waves-effect waves-light btn right" href="Notification.aspx" style="margin: 12px 5px 0px 0px; padding: 0px 10px 0px 10px;"><i class="material-icons right" style="margin-left: 10px;">textsms</i>0</a>
                <%
                    }
                %>
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

                    <div class="row" style="margin: 0px 0px; -6px 0px;">
                        <div class="card-panel red lighten-4 z-depth-1" style="margin: 0px 0px 0px 0px; padding: 0px 3px 0px 3px; height: 40px;">
                            <div class="row valign-wrapper" style="margin-bottom: 0px;">
                                <div class="col s1" style="margin: 0px 10px 0px 0px;">
                                    <i class="material-icons prefix" style="margin-left: 5px; margin-right: 2px; margin-top: 8px;">person_pin</i>
                                </div>
                                <div class="col s11" style="margin-left: 0px; line-height: 40px;">
                                    <span class="black-text center">สวัสดี <%: SWEngWeb.user.name() %>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--<div class="card-panel" style="padding: 7px; margin-bottom: 0px;">
                        <a class="waves-effect waves-light btn center red lighten-2" href="under_construction.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">ตรวจสอบหัวข้อโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="under_construction.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">ตรวจสอบบันทึกการดำเนินงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="under_construction.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">ตรวจสอบข้อเสนอโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="under_construction.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">ประเมินข้อเสนอโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="under_construction.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">ประเมินความก้าวหน้า</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="under_construction.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">ตรวจสอบขอสอบโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="under_construction.aspx" style="margin-bottom: -7px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">ประเมินโครงงาน</a>
                    </div>--%>
                </div>
                <div class="col s9" style="margin-left: 0px; padding-left: 0px; padding: 0px;">
                    <div class="card-panel infor" style="padding: 15px; margin: 0px; min-height: 527px;">

                        <div class="col s12">
                            <!-- <div class="section" style="margin-bottom: -20px;"> -->
                            <div class="row" style="margin-bottom: 0px;">

                                <div class="col s12">
                                    <div class="row" style="margin: 0px;">
                                        <div class="information card-panel light" style="height: 470px; padding-top:0px;">
                                            <div class="icon-block">
                                                <h2 class="center brown-text" style="margin-top: 10px; margin-bottom: 0px;"><i class="large material-icons">recent_actors</i></h2>
                                                <h5 class="center" style="margin-top:-10px; margin-bottom: 15px;">โครงงานในความดูแลของท่าน</h5>
                                                <% List<string[]> ctrl = SWEngWeb.user.CTRLprojectID();
                                                    if (ctrl != null && ctrl.Count != 0)
                                                    {
                                                        for (int i = 0; i < ctrl.Count; i++)
                                                        {
                                                %>
                                                <div class="row" style="margin-bottom: 0px;">
                                                    <div class="card-panel grey lighten-4" style="padding-bottom: 8px; padding-top:8px; margin-top: 0px;">
                                                        <div class="row" style="margin-bottom:0px;">
                                                            <div class="col s3 grey-text text-darken-3 col s3 right" style="margin-bottom:0px;">
                                                                <a class="right grey-text"><%= ctrl[i][1] %></a>
                                                            </div>
                                                            <div class="col s9 grey-text text-darken-4 row left" style="margin-bottom:0px;">
                                                               <a class="grey-text text-darken-4 left" href="studentMenu.aspx?pid=<%=ctrl[i][0]%>"><%= SWEngWeb.information.thaiProjectName(ctrl[i][0]) %> : <%= SWEngWeb.information.engProjectName(ctrl[i][0]) %></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%
                                                        }
                                                    }
                                                    else
                                                    {
                                                %>
                                                <p class="light center">ท่านยังไม่มีโครงงานที่อยู่ในการดูแล</p>
                                                <%
                                                    }
                                                %>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                            </div>
                        </div>


                        <asp:GridView ID="GridView1" runat="server" class="striped centered">
                            <Columns>
                                <asp:ButtonField Text="Accept" CommandName="a" />
                            </Columns>
                        </asp:GridView>
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
                    H = H - 139;
                    if (H < 520) {
                        H = 520;
                    }
                    return H;
                });
                /*
                $(".infor").css("max-height", function () {
                    return H;
                });
                */
            }

            homePageResposive();

            window.onresize = function () {
                homePageResposive();
            }
        </script>

    </form>
</body>
</html>
