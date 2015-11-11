<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentMenu.aspx.cs" Inherits="SWEngWeb.Home" %>

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
                    <div class="row" style="margin: 0px 0px; -6px 0px;">
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
                        <a class="waves-effect waves-light btn center red" href="Notification.aspx" style="margin-bottom: 0px; width: 100%;" runat="server"><i class="material-icons left">info</i> ไม่มีการแจ้งเตือนใหม่</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE01.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบเสนอหัวข้อโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE02.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบบันทึกการดำเนินงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE03.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบขอสอบข้อเสนอโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE04.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบประเมินข้อเสนอโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE05.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบประเมินความก้าวหน้า</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE06.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบขอสอบโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE07.aspx" style="margin-bottom: -7px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบประเมินโครงงาน</a>
                    </div>
                </div>
                <div class="col s9" style="margin-left: 0px; padding-left: 0px; padding: 0px;">
                    <div class="card-panel infor" style="padding: 15px; margin: 0px; min-height: 527px;">

                        <div class="col s12">
                            <!-- <div class="section" style="margin-bottom: -20px;"> -->
                            <div class="row" style="margin-bottom: 0px;">
                                
                                <div class="col s6">
                                    <div class="row" style="margin:0px;">
                                    <div class="information card-panel light" style="height: 225px;">
                                        <div class="icon-block">
                                            <h2 class="center brown-text" style="margin-top:10px; margin-bottom:10px;"><i class="large material-icons">info</i></h2>
                                            <h5 class="center">สถานะล่าสุด</h5>

                                            <p class="light center">ท่านยังไม่มีแบบเสนอหัวข้อโครงงาน</p>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin:0px;">
                                    <div class="information card-panel light" style="height: 225px;">
                                        <div class="icon-block">
                                            <h2 class="center brown-text" style="margin-top:10px; margin-bottom:10px;"><i class="large material-icons">web</i></h2>
                                            <h5 class="center">โครงงานของท่าน</h5>

                                            <p class="light center">ท่านยังไม่มีโครงงาน</p>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                                
                                

                                <div class="col s6">
                                    <div class="information card-panel light">
                                        <div class="icon-block" style="padding: 0px;">
                                            <h2 class="center brown-text"><i class="large material-icons">assessment</i></h2>
                                            <h5 class="center">ภาพรวม</h5>
                                            <br />
                                            <div>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่มีแบบเสนอหัวข้อโครงงาน</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่มีแบบบันทึกการดำเนินงาน</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่มีแบบขอสอบข้อเสนอโครงงาน</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่มีแบบประเมินข้อเสนอโครงงาน</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่มีแบบประเมินความก้าวหน้า</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่มีแบบขอสอบโครงงาน</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่มีแบบประเมินโครงงาน</a>
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
                    H = H - 147;
                    if (H < 650 - 147) {
                        H = 650 - 147;
                    }
                    return H;
                });

                $(".infor").css("max-height", function () {
                    return H;
                });
            }

            homePageResposive();

            window.onresize = function () {
                homePageResposive();
            }
        </script>

    </form>
</body>
</html>
