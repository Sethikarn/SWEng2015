<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notification.aspx.cs" Inherits="SWEngWeb.notification" %>

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
                        <a class="waves-effect waves-light btn center red lighten-2" href="~/" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">เมนูหลัก</a>
                    </div>
                </div>
                <div class="col s9" style="margin-left: 0px; padding-left: 0px; padding: 0px;">
                    <div class="card-panel infor" style="padding: 15px; margin: 0px; min-height: 527px;">



                        <%int nocount = SWEngWeb.user.ontificationCount();
                            if (!(nocount > 0))
                            {
                        %>
                        <div class="card-panel red lighten-4" style="margin: 0px;">
                            <div class="grey-text text-darken-4 col s12" style="margin-top: -10px;">
                                <h5 style="margin: 0px;">ไม่มีการแจ้งเตือน</h5>
                            </div>
                        </div>
                        <%
                            }
                            else
                            {
                        %>
                        <div class="card-panel red lighten-4" style="margin: 0px;">
                            <div class="grey-text text-darken-4 col s12" style="margin-top: -10px;">
                                <h5 style="margin: 0px;">ท่านมี <%= nocount %> การแจ้งเตือน</h5>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 0px; margin-top: 0px;">
                            <div class="col s12 center">
                                <div class="information card-panel light" style="margin-top: 0px; padding-top:5px;">
                                    <%
                                        List<string[]> req = getReq();
                                        for (int i = 0; i < req.Count; i++)
                                        {
                                            if (req[i][1] == "1")
                                            {
                                                string linkOk = "href=\"reqAction.aspx?acID=" + req[i][0] + "&ac=" + req[i][1] + "&pid=" + req[i][2] + "&rep=yes\"";
                                                string linkNot = "href=\"reqAction.aspx?acID=" + req[i][0] + "&ac=" + req[i][1] + "&pid=" + req[i][2] + "&rep=no\"";
                                    %>
                                    <div class="row" style="margin-bottom:0px;">
                                        <div class="card-panel grey lighten-4" style="padding-bottom: 8px; margin-bottom:0px;">
                                            <div class="row">
                                            <div class="grey-text text-darken-3 col s4 right">
                                                เมื่อ <%= req[i][4] %> 
                                            </div>
                                            </div>
                                            <div class="grey-text text-darken-4 row">
                                                <%= SWEngWeb.information.getNamebyID(req[i][3]) %> ชวนคุณเข้าเป็นสมาชิกโครงการ <%= SWEngWeb.information.thaiProjectName(req[i][2]) %> : <%= SWEngWeb.information.engProjectName(req[i][2]) %>

                                            </div>
                                            <div class="row" style="margin-bottom: 0px;">
                                                <a class="waves-effect waves-light btn right red lighten-2" style="margin: 0px 0px 0px 0px;" <%= linkNot %>>ยกเลิก</a>
                                                <a class="waves-effect waves-light btn right red lighten-2" style="margin: 0px 5px 0px 0px;" <%= linkOk %>>ตกลง</a>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                            }



                                            if (req[i][1] == "3")
                                            {
                                                string linkOk = "href=\"reqAction.aspx?acID=" + req[i][0] + "&ac=" + req[i][1] + "&pid=" + req[i][2] + "&rep=yes\"";
                                                string linkNot = "href=\"reqAction.aspx?acID=" + req[i][0] + "&ac=" + req[i][1] + "&pid=" + req[i][2] + "&rep=no\"";
                                    %>
                                    <div class="row" style="margin-bottom:0px;">
                                        <div class="card-panel grey lighten-4" style="padding-bottom: 8px; margin-bottom:0px;">
                                            <div class="row">
                                            <div class="grey-text text-darken-3 col s4 right">
                                                เมื่อ <%= req[i][4] %> 
                                            </div>
                                            </div>
                                            <div class="grey-text text-darken-4 row">
                                                <%= SWEngWeb.information.getNamebyID(req[i][3]) %> เชิญคุณเป็นอาจารย์ที่ปรึกษา โครงการ<%= SWEngWeb.information.thaiProjectName(req[i][2]) %> : <%= SWEngWeb.information.engProjectName(req[i][2]) %>

                                            </div>
                                            <div class="row" style="margin-bottom: 0px;">
                                                <a class="waves-effect waves-light btn right red lighten-2" style="margin: 0px 0px 0px 0px;" <%= linkNot %>>ยกเลิก</a>
                                                <a class="waves-effect waves-light btn right red lighten-2" style="margin: 0px 5px 0px 0px;" <%= linkOk %>>ตกลง</a>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                            }



                                            if (req[i][1] == "4")
                                            {
                                                string linkOk = "href=\"reqAction.aspx?acID=" + req[i][0] + "&ac=" + req[i][1] + "&pid=" + req[i][2] + "&rep=yes\"";
                                                string linkNot = "href=\"reqAction.aspx?acID=" + req[i][0] + "&ac=" + req[i][1] + "&pid=" + req[i][2] + "&rep=no\"";
                                    %>
                                    <div class="row" style="margin-bottom:0px;">
                                        <div class="card-panel grey lighten-4" style="padding-bottom: 8px; margin-bottom:0px;">
                                            <div class="row">
                                            <div class="grey-text text-darken-3 col s4 right">
                                                เมื่อ <%= req[i][4] %> 
                                            </div>
                                            </div>
                                            <div class="grey-text text-darken-4 row">
                                                <%= SWEngWeb.information.getNamebyID(req[i][3]) %> เชิญคุณเป็นอาจารย์ที่ปรึกษาร่วม โครงการ<%= SWEngWeb.information.thaiProjectName(req[i][2]) %> : <%= SWEngWeb.information.engProjectName(req[i][2]) %>

                                            </div>
                                            <div class="row" style="margin-bottom: 0px;">
                                                <a class="waves-effect waves-light btn right red lighten-2" style="margin: 0px 0px 0px 0px;" <%= linkNot %>>ยกเลิก</a>
                                                <a class="waves-effect waves-light btn right red lighten-2" style="margin: 0px 5px 0px 0px;" <%= linkOk %>>ตกลง</a>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                            }



                                            if (req[i][1] == "5")
                                            {
                                                string linkOk = "href=\"reqAction.aspx?acID=" + req[i][0] + "&ac=" + req[i][1] + "&pid=" + req[i][2] + "&rep=yes\"";
                                                string linkNot = "href=\"reqAction.aspx?acID=" + req[i][0] + "&ac=" + req[i][1] + "&pid=" + req[i][2] + "&rep=no\"";
                                    %>
                                    <div class="row" style="margin-bottom:0px;">
                                        <div class="card-panel grey lighten-4" style="padding-bottom: 8px; margin-bottom:0px;">
                                            <div class="row">
                                            <div class="grey-text text-darken-3 col s4 right">
                                                เมื่อ <%= req[i][4] %> 
                                            </div>
                                            </div>
                                            <div class="grey-text text-darken-4 row">
                                                <%= SWEngWeb.information.getNamebyID(req[i][3]) %> เชิญคุณเป็นกรรมการ โครงการ<%= SWEngWeb.information.thaiProjectName(req[i][2]) %> : <%= SWEngWeb.information.engProjectName(req[i][2]) %>

                                            </div>
                                            <div class="row" style="margin-bottom: 0px;">
                                                <a class="waves-effect waves-light btn right red lighten-2" style="margin: 0px 0px 0px 0px;" <%= linkNot %>>ยกเลิก</a>
                                                <a class="waves-effect waves-light btn right red lighten-2" style="margin: 0px 5px 0px 0px;" <%= linkOk %>>ตกลง</a>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                            }


                                        }
                                    %>
                                </div>
                            </div>
                        </div>

                        <%
                            }
                        %>
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
