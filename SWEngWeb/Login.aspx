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

    <style>
        body {
            width: 1000px;
            margin: 0 auto;
        }

        #header {
            background-color: #6F0023;
            width: 1000px;
            float: initial;
            height: 145px;
        }

        #tab {
            background-color: #f3c5ee;
            width: 50px;
            height: 520px;
            float: left;
        }

        #tab2 {
            background-color: #FFFFFF;
            width: 900px;
            height: 520px;
            float: left;
            text-align: center;
        }

        #tab3 {
            background-color: #f3c5ee;
            width: 50px;
            height: 520px;
            float: left;
        }

        #tab4 {
            background-color: #6F0023;
            width: 100%;
            height: 100px;
            float: left;
        }

        #tab5 {
            background-color: #f3c5ee;
            width: 50px;
            height: 100px;
            float: right;
        }

        .auto-style1 {
            width: 100%;
        }

        .auto-style7 {
            text-align: center;
        }

        .auto-style9 {
            height: 23px;
            text-align: left;
        }

        .auto-style11 {
            text-align: center;
            height: 23px;
        }

        .auto-style15 {
            width: 125px;
            text-align: center;
        }

        .auto-style16 {
            width: 422px;
            text-align: right;
        }

        .auto-style17 {
            width: 475px;
            text-align: center;
        }

        .auto-style18 {
            text-align: right;
            height: 23px;
            width: 372px;
        }

        .auto-style19 {
            color: #CC0000;
        }

        .auto-style20 {
            text-align: right;
        }
    </style>

    <style type="text/css">
        html, body {
            height: 100%;
            width: 100%;
            margin: 0px;
            padding: 0px;
        }

        .page-home {
            min-height: 100%;
            width: 100%;
        }
    </style>

</head>

<body class="page-home">
    <form id="form1" runat="server">

        <nav class="red lighten-2 z-depth-1" role="navigation">
            <div class="container">

                <a href="http://www.nu.ac.th" target="_blank">
                    <img src="pic/NU_LOGO1.png" alt="" class="left circle responsive-img" /></a>

                <!-- <a class="waves-effect waves-light btn right " href="" style="margin-top: 12px; margin-bottom:0px;"></a>-->

                <ul id="nav-mobile2" class="right">
                    <li><a href="About.aspx">เกี่ยวกับ</a></li>
                </ul>
            </div>
        </nav>

        <div class="login_background parallax-container valign-wrapper" style="width:100%;">
            <div class="section no-pad-bot" style="top: 0%">
                <div class="row center">
                    <h5 class="header col s12 light"></h5>
                    <h3 class="header center  grey-text text-darken-2">ยินดีต้อนรับสู่</h3>
                    <h1 class="header center grey-text text-darken-2">ระบบประเมินและตรวจสอบโครงการ</h1>
                    <div class="row center">
                        <h5 class="header col s12 grey-text text-darken-2">คณะวิศวกรรมศาสตร์ มหาวิทยาลัยนเรศวร</h5>
                    </div>
                </div>
            </div>
            <div class="parallax">
                <img src="data:image/jpg;base64,R0lGODlhAQABAIABAP///wAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="Unsplashed background img 2" style="bottom: -100px; display: block; background-image: url(https://gb8hrw.bn1301.livefilestore.com/y2pArGnPgviBDe4oz3hB7OommJYEwvkhhj0DhxieheoRD_V_emiz3NGrXPnnbl1zzEhxrm1FC3wwjEy4Osjx5ex87k64itDkrOoVAo9RInrlxADKSXaxUfdqEFvE18Th-Ybw7iPuBL6Mg2oD-NJWv0UvQ/2-fix.jpg?psid=1);" />
            </div>
        </div>

        <footer class="page-footer red lighten-1" style="padding-top: 0px;">
            <div>
                <p class="center-align grey-text text-lighten-4" style="margin: 0px;">เว็บไซต์นี้ถูกสร้างขึ้นเพื่อเป็นระบบประเมินและตรวจสอบโครงการของนิสิตคณะวิศวกรรมศาสตร์ สาขาวิศวกรรมคอมพิวเตอร์ มหาวิทยาลัยนเรศวร</p>
            </div>
            <div class="footer-copyright" style="height: 35px; line-height: 35px;">
                <div class="container center-align">
                © 2014 <a class=" grey-text text-lighten-4" href="About.aspx">BagaJN</a> | © 2015 <a class=" grey-text text-lighten-4" href="About.aspx">แอ๊ดหัวหลิม</a> | Powered by <a class=" grey-text text-lighten-4" href="http://materializecss.com">Materialize</a><a class="right grey-text text-lighten-1" href="About.aspx">P01</a>
                </div>
            </div>
        </footer>

        <div style="text-align: center;">
            <div id="tab4">
                <br />
                <p class="auto-style7"><font color="White">เว็บไซต์นี้ถูกสร้างขึ้นเพื่อเป็นระบบประเมินและตรวจสอบโครงการของนิสิตคณะวิศวกรรมศาสตร์ สาขาวิศวกรรมคอมพิวเตอร์ มหาวิทยาลัยนเรศวร</font></p>

                <div class="auto-style20">
                    <div class="auto-style7">
                        <font color="White">© 2014 BagaJN  |  © 2015 หัวหลิม</font>
                        <br />
                    </div>
                    <p style="font-size: 12px" class="auto-style20">
                        <font color="Gray">P01</font>
                </div>

            </div>
        </div>







<%--        <div id="header">
            <asp:Image ID="Image1" runat="server" Height="145px" ImageUrl="~/pic/banner.jpg" Width="1000px" />
        </div>--%>

        <div id="tab">
        </div>

        <div id="tab2">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style16">
                        <asp:LinkButton ID="btabout" runat="server" CssClass="auto-style19" OnClick="btabout_Click">เกี่ยวกับ</asp:LinkButton>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                </tr>
            </table>

            <table class="auto-style1">
                <tr>
                    <td class="auto-style7" colspan="2">
                        <asp:Image ID="Image6" runat="server" Height="163px" ImageUrl="~/pic/login.PNG" Width="260px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <asp:Image ID="Image3" runat="server" Height="40px" ImageUrl="~/pic/username.PNG" Width="115px" Style="text-align: right" />
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="userNameInput" runat="server" BackColor="#FFCC99" ForeColor="Black" Height="23px" Style="margin-left: 0px; text-align: left;" Width="181px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <asp:Image ID="Image4" runat="server" Height="40px" ImageUrl="~/pic/pw.PNG" />
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="TextBox2" type="password" runat="server" BackColor="#FFCC99" Height="23px" Width="181px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="47px" ImageUrl="~/pic/liw.PNG" OnClick="ImageButton2_Click" Width="140px" />
                    </td>
                </tr>
            </table>

        </div>
        <div id="tab3">
        </div>

        


        <div class="footer-copyright" style="height: 35px; line-height: 35px;"></div>




        <!--  Scripts-->
        <!-- <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script> -->

        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

        <script type="text/javascript">

            function homePageResposive() {
                var DisplayHeight = document.documentElement.clientHeight;
                var H = DisplayHeight;
                var minPageHeight = 600;
                var currentHight;

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

                $(".login_background").css("min-height", function () {
                    /*H = (H / 2) - 62;
                    if (H < 236) {
                        H = 236;
                    }*/
                    return H - 129;
                });

                $(".login_background").css("max-height", function () {
                    return H - 129;
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
