<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SWEngWeb.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>ระบบประเมินและตรวจสอบโครงการ คณะวิศวกรรมศาสตร์ มหาวิทยาลัยนเรศวร</title>
    <!-- CSS  -->
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />


    <style type="text/css">
        html, body {
            height: 100%;
            width: 100%;
            margin: 0px;
            padding: 0px;
        }

        .page-home {
            height: 100%;
            width: 100%;
        }
    </style>
</head>

<body class="page-home">
    <form id="form1" runat="server" style="margin-bottom: 0px;">

        <nav class="red lighten-2 z-depth-1" role="navigation">
            <div class="container">

                <a href="http://www.nu.ac.th" target="_blank">
                    <img src="pic/NU_LOGO1.png" alt="" class="left circle responsive-img z-depth-1" />
                </a>
                <a href="http://www.eng.nu.ac.th" target="_blank">
                    <img src="pic/logoEng.png" alt="" class="left circle responsive-img z-depth-1" style="margin-left: 4px;" />
                </a>

                <a class="waves-effect waves-light btn right " href="About.aspx" style="margin-top: 12px; margin-bottom: 0px;">เกี่ยวกับ</a>

                <%
                    if (SWEngWeb.language.getLanguage() == 0)
                    {
                %>
                <a class="waves-effect waves-light btn right " href="operate.aspx?opType=language&language=en" style="margin-top: 12px; margin-bottom: 0px; margin-right:5px;">EN</a>
                <%
                    }
                    else
                    {
                %>
                <a class="waves-effect waves-light btn right " href="operate.aspx?opType=language&language=th" style="margin-top: 12px; margin-bottom: 0px; margin-right:5px;">TH</a>
                <%
                    }
                %>
            </div>
        </nav>

        <div class="login_background parallax-container" style="width: 100%;">
            <div class="section no-pad-bot" style="top: auto;">
                <div class="row center">
                    <h5 class="header col s12 light"></h5>
                    <h3 class="header center white-text text-darken-2">ยินดีต้อนรับสู่</h3>
                    <h1 class="header center white-text text-darken-2">ระบบประเมินและตรวจสอบโครงการ</h1>
                    <div class="row center">
                        <h5 class="header col s12 white-text text-darken-2">คณะวิศวกรรมศาสตร์ มหาวิทยาลัยนเรศวร</h5>
                    </div>
                </div>
            </div>

            <div class="parallax">
                <img src="data:image/jpg;base64,R0lGODlhAQABAIABAP///wAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="Unsplashed background img 2" style="top: -220px; display: block; background-image: url(pic/sun.jpg);" />
            </div>
        </div>

        <footer class="page-footer red lighten-1" style="padding-top: 0px;">
            <div>
                <p class="center-align grey-text text-lighten-4" style="margin: 0px;">เว็บไซต์นี้ถูกสร้างขึ้นเพื่อเป็นระบบประเมินและตรวจสอบโครงการของนิสิตคณะวิศวกรรมศาสตร์ สาขาวิศวกรรมคอมพิวเตอร์ มหาวิทยาลัยนเรศวร</p>
            </div>
            <div class="footer-copyright" style="height: 35px; line-height: 35px;">
                <div class="container center-align">
                    © 2014 <a class=" grey-text text-lighten-4" href="About.aspx">BagaJN</a> | © 2015 <a class=" grey-text text-lighten-4" href="About.aspx">หัวหลิม</a> | Powered by <a class=" grey-text text-lighten-4" href="http://materializecss.com" target="_blank">Materialize</a><a class="right grey-text text-lighten-1">P01</a>
                </div>
            </div>
        </footer>

        <div class="row" style="margin-bottom: 0px;">
            <div class="right col s12 m7">
                <div class="right card red lighten-4" style="margin-top: -320px; margin-bottom: 0px;">
                    <div class="card-content" style="padding: 0px 20px 0px 20px;">
                        <!-- <div class="row" style="margin-bottom: 0px;">
                            <span class="card-title grey-text text-darken-4 right" style="margin-right: 12px; margin-bottom: 0px;">เข้าสู่ระบบ</span>
                        </div>
                        -->
                        <div class="row valign-wrapper" style="margin-bottom: 0px; margin-top: 15px;">
                            <div class="row">
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="input-field col s12 grey-text text-darken-4">

                                        <i class="material-icons prefix">person_pin</i>
                                        <input placeholder="ชื่อผู้ใช้" id="icon_prefix" type="text" class="validate" name="UserName" autofocus="autofocus" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12 grey-text text-darken-4">
                                        <i class="material-icons prefix">vpn_key</i>
                                        <input placeholder="รหัสผ่าน" id="icon_telephone" type="password" class="validate" name="PassWord" />
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 0px;">
                                    <div class="col s6">
                                        <%--<button id="test1" onserverclick="ButtonLogin_Click" runat="server" class="waves-effect waves-light btn red lighten-2 offset-s1" style="width: 185px; margin-bottom: 0px;">เข้าสู่ระบบ</button>--%>
                                        <button id="test1" onserverclick="ButtonLogin_Click" runat="server" class="waves-effect waves-light btn red lighten-2 offset-s1" style="width: 185px; margin-bottom: 0px;"><%= SWEngWeb.language.login[SWEngWeb.language.getLanguage()] %></button>
                                    </div>
                                    <div class="col s6">
                                        <button id="Button1" runat="server" class="waves-effect waves-light btn red lighten-2 " style="width: 185px; margin-bottom: 0px;">ยกเลิก</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--  Scripts-->
        <!-- <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script> -->

        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

        <!--  ScriptsNew-->
        <script>if (!window.jQuery) { document.write('<script src="bin/jquery-2.1.1.min.js"><\/script>'); }</script>
        <script src="js/jquery.timeago.min.js"></script>
        <script src="js/prism.js"></script>

        <script>
            $(document).ready(function () {
                $('.parallax').parallax();
            });
        </script>

        <script type="text/javascript">

            function homePageResposive() {
                var DisplayHeight = document.documentElement.clientHeight;
                var H = DisplayHeight;
                var minPageHeight = 650;
                var currentHight;

                var DisplayWidth = document.documentElement.clientWidth;
                var minPageWidth = 860;

                $(".page-home").css("min-height", function () {
                    if (DisplayHeight < minPageHeight) {
                        currentHight = minPageHeight;
                        return currentHight;
                    }
                    else {
                        currentHight = DisplayHeight;
                        return currentHight;
                    }
                });

                $(".page-home").css("min-width", function () {
                    if (DisplayWidth < minPageWidth) {
                        return minPageWidth;
                    }
                    else {
                        return DisplayWidth;
                    }
                });

                $(".login_background").css("min-height", function () {
                    H = H - 129;
                    if (H < 650 - 129) {
                        H = 650 - 129;
                    }
                    return H;
                });

                $(".login_background").css("max-height", function () {
                    return H;
                });

                $(".parallax-container").css("height", function () {
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
