<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SWEngWeb.About" %>

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
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>

    <form id="form2" runat="server" style="margin-bottom: 0px;">

        <nav class="red lighten-2 z-depth-2" role="navigation">
            <div class="container">

                <a href="http://www.nu.ac.th" target="_blank">
                    <img src="pic/NU_LOGO1.png" alt="" class="left circle responsive-img z-depth-1" />
                </a>
                <a href="http://www.eng.nu.ac.th" target="_blank">
                    <img src="pic/logoEng.png" alt="" class="left circle responsive-img z-depth-1" style="margin-left: 4px;" />
                </a>

                <a class="center-align grey-text text-lighten-4 center" style="margin-left: 70px;"><span style="font-size: 21px;">ระบบประเมินและตรวจสอบโครงการคณะวิศวกรรมศาสตร์</span></a>
                <a class="waves-effect waves-light btn right " href="Login.aspx" style="margin-top: 12px; margin-bottom: 0px;">หน้าหลัก</a>

            </div>
        </nav>

        <div class="container">
            <div class="row" style="margin-bottom: 20px; margin-top: 30px;">
                <div class="row" style="margin-bottom: 0px;">
                    <div class="row">
                        <div class="card-panel  red lighten-3 z-depth-1" style="padding: 10px 10px 10px 10px; margin-bottom: 0px;">
                            <div class="row valign-wrapper" style="margin-bottom: 0px;">
                                <div class="col s10">
                                    <span class="white-text center">
                                        <h6>เว็บไซต์นี้ถูกสร้างขึ้นเพื่อใช้เป็นระบบประเมินและตรวจสอบโครงการคณะวิศวะกรรมศาสตร์
                                            <br />
                                        </h6>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="row" style="margin-bottom: 15px;">
                    <div class="card-panel  red z-depth-1" style="padding: 10px 10px 10px 10px; margin-bottom: 0px;">
                        <div class="row valign-wrapper" style="margin-bottom: 0px;">
                            <div class="col s10">
                                <span class="white-text center">
                                    <h5>คณะผู้จัดทำต่อ
                                <br />
                                    </h5>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="row valign-wrapper">
                        <div class="container col s6">
                            <div class="card-panel pink lighten-5 z-depth-1" style="margin-bottom: 0px; margin-top: 0px">
                                <div class="row valign-wrapper">
                                    <div class="col s4">
                                        <img src="pic_new/new/admin_3.jpg" alt="" class="circle responsive-img">
                                    </div>
                                    <div class="col s7">
                                        <span class="black-text">
                                            <h6>รหัสนิสิต 55361113<br />
                                            </h6>
                                            <h6>นายใจภัทร ศรีมาลา 
                                        <br />
                                            </h6>
                                            <h6>โทรศัพท์ 084-595-9532
                                        <br />
                                            </h6>
                                            <h6>อีเมล์ jaipats55@email.nu.ac.th</h6>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="container col s6">
                            <div class="card-panel pink lighten-5 z-depth-1" style="margin-bottom: 0px; margin-top: 0px">
                                <div class="row valign-wrapper">
                                    <div class="col s4">
                                        <img src="pic_new/new/admin_4.jpg" alt="" class="circle responsive-img">
                                    </div>
                                    <div class="col s7">
                                        <span class="black-text">
                                            <h6>รหัสนิสิต 55361274<br />
                                            </h6>
                                            <h6>นายอภิสิทธิ์ เพ็ชรเจริญ 
                                        <br />
                                            </h6>
                                            <h6>โทรศัพท์ 090-997-6669
                                        <br />
                                            </h6>
                                            <h6>อีเมล์ apisitp55@email.nu.ac.th</h6>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row valign-wrapper">
                        <div class="container col s6">
                            <div class="card-panel pink lighten-5 z-depth-1" style="margin-bottom: 0px; margin-top: 0px">
                                <div class="row valign-wrapper">
                                    <div class="col s4">
                                        <img src="pic_new/new/admin_2.jpg" alt="" class="circle responsive-img">
                                    </div>
                                    <div class="col s7">
                                        <span class="black-text">
                                            <h6>รหัสนิสิต 55362097<br />
                                            </h6>
                                            <h6>นายนรินทร  บุญเเร่ 
                                        <br />
                                            </h6>
                                            <h6>โทรศัพท์ 089-438-7761
                                        <br />
                                            </h6>
                                            <h6>อีเมล์ narinthornb55@email.nu.ac.th</h6>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="container col s6">
                            <div class="card-panel pink lighten-5 z-depth-1" style="margin-bottom: 0px; margin-top: 0px">
                                <div class="row valign-wrapper">
                                    <div class="col s4">
                                        <img src="pic_new/new/admin_5.jpg" alt="" class="circle responsive-img">
                                    </div>
                                    <div class="col s7">
                                        <span class="black-text">
                                            <h6>รหัสนิสิต 55362226<br />
                                            </h6>
                                            <h6>นางสาวพรหมภัสสร รัตนเดชานาคินทร์
                                        <br />
                                            </h6>
                                            <h6>โทรศัพท์ 087-845-0507
                                        <br />
                                            </h6>
                                            <h6>อีเมล์ phompassornr55@email.nu.ac.th</h6>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row valign-wrapper">
                        <div class="container col s6">
                            <div class="card-panel pink lighten-5 z-depth-1" style="margin-bottom: 0px; margin-top: 0px">
                                <div class="row valign-wrapper">
                                    <div class="col s4">
                                        <img src="pic_new/new/admin_1.jpg" alt="" class="circle responsive-img">
                                    </div>
                                    <div class="col s7">
                                        <span class="black-text">
                                            <h6>รหัสนิสิต 55362523<br />
                                            </h6>
                                            <h6>นายเสฏฐิกานต์ โชตึก
                                        <br />
                                            </h6>
                                            <h6>โทรศัพท์ 085-561-1218
                                        <br />
                                            </h6>
                                            <h6>อีเมล์ sethakarnp55@email.nu.ac.th</h6>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row" style="margin-bottom: 0px;">
                    <div class="card-panel blue z-depth-1" style="padding: 10px 10px 10px 10px;">
                        <div class="row valign-wrapper" style="margin-bottom: 0px;">
                            <div class="col s10">
                                <span class="white-text center">
                                    <h5>คณะผู้จัดทำเดิม
                                <br />
                                    </h5>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="row valign-wrapper">
                        <div class="container col s6">
                            <div class="card-panel blue lighten-5 z-depth-1" style="margin-bottom: 0px; margin-top: 0px">
                                <div class="row valign-wrapper">
                                    <div class="col s4">
                                        <img src="pic_new/new_old/old_3.jpg" alt="" class="circle responsive-img">
                                    </div>
                                    <div class="col s7">
                                        <span class="black-text">
                                            <h6>รหัสนิสิต 55361267<br />
                                            </h6>
                                            <h6>นางสาวศุภรัตน์ ยงค์เจาะ
                                        <br />
                                            </h6>
                                            <h6>โทรศัพท์ 094-606-4705
                                        <br />
                                            </h6>
                                            <h6>อีเมล์ suparaty55@email.nu.ac.th</h6>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="container col s6">
                            <div class="card-panel blue lighten-5 z-depth-1" style="margin-bottom: 0px; margin-top: 0px">
                                <div class="row valign-wrapper">
                                    <div class="col s4">
                                        <img src="pic_new/new_old/old_4.jpg" alt="" class="circle responsive-img">
                                    </div>
                                    <div class="col s7">
                                        <span class="black-text">
                                            <h6>รหัสนิสิต 55362080<br />
                                            </h6>
                                            <h6>นางสาวนราภรณ์ ทนทาน
                                        <br />
                                            </h6>
                                            <h6>โทรศัพท์ 087-565-6811
                                        <br />
                                            </h6>
                                            <h6>อีเมล์ narapornt55@email.nu.ac.th</h6>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row valign-wrapper">
                        <div class="container col s6">
                            <div class="card-panel blue lighten-5 z-depth-1" style="margin-bottom: 0px; margin-top: 0px">
                                <div class="row valign-wrapper">
                                    <div class="col s4">
                                        <img src="pic_new/new_old/old_5.jpg" alt="" class="circle responsive-img">
                                    </div>
                                    <div class="col s7">
                                        <span class="black-text">
                                            <h6>รหัสนิสิต 55362547<br />
                                            </h6>
                                            <h6>นายอโนชา ขอนทอง
                                        <br />
                                            </h6>
                                            <h6>โทรศัพท์ 082-407-7440
                                        <br />
                                            </h6>
                                            <h6>อีเมล์ anochak55@email.nu.ac.th</h6>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="container col s6">
                            <div class="card-panel blue lighten-5 z-depth-1" style="margin-bottom: 0px; margin-top: 0px">
                                <div class="row valign-wrapper">
                                    <div class="col s4">
                                        <img src="pic_new/new_old/old_6.jpg" alt="" class="circle responsive-img">
                                    </div>
                                    <div class="col s7">
                                        <span class="black-text">
                                            <h6>รหัสนิสิต 55366637<br />
                                            </h6>
                                            <h6>นางสาวจริยา ศรีเอี่ยม
                                        <br />
                                            </h6>
                                            <h6>โทรศัพท์ 088-157 1997
                                        <br />
                                            </h6>
                                            <h6>อีเมล์ jariyas55@email.nu.ac.th</h6>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="page-footer red lighten-1" style="padding-top: 0px;">
            <div>
                <p class="center-align grey-text text-lighten-4" style="margin: 0px;">เว็บไซต์นี้ถูกสร้างขึ้นเพื่อเป็นระบบประเมินและตรวจสอบโครงการของนิสิตคณะวิศวกรรมศาสตร์ สาขาวิศวกรรมคอมพิวเตอร์ มหาวิทยาลัยนเรศวร</p>
            </div>
            <div class="footer-copyright" style="height: 35px; line-height: 35px;">
                <div class="container center-align">
                    © 2014 <a class=" grey-text text-lighten-4" href="About.aspx">BagaJN</a> | © 2015 <a class=" grey-text text-lighten-4" href="About.aspx">แอ๊ดหัวหลิม</a> | Powered by <a class=" grey-text text-lighten-4" href="http://materializecss.com">Materialize</a><a class="right grey-text text-lighten-1">P02</a>
                </div>
            </div>
        </footer>

        <%--
        <div id="header">
            <asp:Image ID="Image1" runat="server" Height="145px" ImageUrl="~/pic/banner.jpg" Width="1000px" />
        </div>

        <div id="tab">
        </div>

        <div id="tab2">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                    <td class="auto-style40"><a href="home.aspx">ย้อนกลับ</a></td>
                </tr>
            </table>

            <table class="auto-style1">
                <tr>
                    <td class="auto-style20" colspan="4">
                        <asp:Image ID="Image7" runat="server" Height="50px" ImageUrl="~/pic/productor.PNG" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31">
                        <asp:Image ID="Image3" runat="server" Height="220px" ImageUrl="~/pic/noon1.jpg" Style="text-align: center" />
                    </td>
                    <td class="auto-style33">55361267<br />
                        นางสาวศุภรัตน์&nbsp;&nbsp; ยงค์เจาะ<br />
                        E-mail<br />
                        &nbsp;<a href="mailto:suparaty55@email.nu.ac.th">suparaty55@email.nu.ac.th</a><br />
                        Facebook <a href="http://www.facebook.com/suparat.yongjoh">www.facebook.com/suparat.yongjoh</a><br />
                        เบอร์โทร
                       
                        <br />
                        094-6064705</td>
                    <td class="auto-style31">
                        <asp:Image ID="Image4" runat="server" Height="220px" ImageUrl="~/pic/noi1.jpg" />
                    </td>
                    <td class="auto-style33">55362080<br />
                        นางสาวนราภรณ์&nbsp;&nbsp; ทนทาน<br />
                        E-mail<br />
                        &nbsp;<a href="mailto:suparaty55@email.nu.ac.th">narapornt55@email.nu.ac.th</a><br />
                        Facebook <a href="http://www.facebook.com/suparat.yongjoh">www.facebook.com/Noiiz.naraporn</a><br />
                        เบอร์โทร
                       
                        <br />
                        087-5656811</td>
                </tr>
                <tr>
                    <td class="auto-style31">
                        <asp:Image ID="Image5" runat="server" Height="220px" ImageUrl="~/pic/jarn1.jpg" />
                    </td>
                    <td class="auto-style33">55362547<br />
                        นายอโนชา&nbsp; ขอนทอง<br />
                        E-mail<br />
                        &nbsp;<a href="mailto:suparaty55@email.nu.ac.th">anochak55@email.nu.ac.th</a><br />
                        Facebook <span class="auto-style34"><a href="http://">www.facebook.com/JarNz.Anocha</a></span><br />
                        เบอร์โทร
                       
                        <br />
                        082-4077440</td>
                    <td class="auto-style31">
                        <asp:Image ID="Image6" runat="server" Height="220px" ImageUrl="~/pic/aey1.jpg" />
                    </td>
                    <td class="auto-style33
                       ">55366637<br />
                        นางสาวจริยา&nbsp;&nbsp; ศรีเอี่ยม<br />
                        E-mail<br />
                        &nbsp;<a href="mailto:suparaty55@email.nu.ac.th">jariyas55@email.nu.ac.th</a><br />
                        Facebook <a href="http://www.facebook.com/suparat.yongjoh">www.facebook.com/jariya.sriiem</a><br />
                        เบอร์โทร
                       
                        <br />
                        088-1571997</td>
                </tr>
                <tr>
                    <td class="auto-style38"></td>
                    <td class="auto-style39"></td>
                    <td class="auto-style38"></td>
                    <td class="auto-style38"></td>
                </tr>
                <tr>
                    <td class="auto-style37" colspan="4">
                        <asp:Image ID="Image8" runat="server" Height="63px" ImageUrl="~/pic_new/owner_next.jpg" Style="text-align: center" Width="156px" />
                    </td>
                </tr>

                <tr>
                    <td class="auto-style35">
                        <asp:Image ID="Image9" runat="server" Height="220px" ImageUrl="~/pic_new/admin_4.jpg" Style="text-align: center" />
                    </td>
                    <td class="auto-style36">55361113<br />
                        นายใจภัทร ศรีมาลา<br />
                        E-mail<br />
                        <a href="mailto:suparaty55@email.nu.ac.th">jaipats55@email.nu.ac.th</a><br />
                        Facebook <a href="http://www.facebook.com/suparat.yongjoh">www.facebook.com/ajaipat.srimala</a><br />
                        เบอร์โทร
                       
                        <br />
                        084-5959532</td>
                    <td class="auto-style35">
                        <asp:Image ID="Image12" runat="server" Height="220px" ImageUrl="~/pic_new/admin_2.jpg" Style="text-align: center" />
                    </td>
                    <td class="auto-style36">55361274<br />
                        นาอภิสิทธิ์&nbsp; เพ็ชรเจริญ<br />
                        E-mail<br />
                        &nbsp;<a href="mailto:suparaty55@email.nu.ac.th">apisitp55@email.nu.ac.th</a><br />
                        Facebook <a href="http://www.facebook.com/suparat.yongjoh">www.facebook.com/mvpphet</a><br />
                        เบอร์โทร
                       
                        <br />
                        090-9976669</td>
                </tr>
                <tr>
                    <td class="auto-style35">
                        <asp:Image ID="Image10" runat="server" Height="220px" ImageUrl="~/pic_new/admin_5.jpg" Style="text-align: center" />
                    </td>
                    <td class="auto-style36">55362097<br />
                        นายนรินทร&nbsp; บุญเเร่<br />
                        E-mail<br />
                        <a href="mailto:suparaty55@email.nu.ac.th">narinthornb55@email.nu.ac.th</a><br />
                        Facebook <a href="http://www.facebook.com/suparat.yongjoh">www.facebook.com/narinthorn.boonrae</a><br />
                        เบอร์โทร
                       
                        <br />
                        089-4387761</td>
                    <td class="auto-style35">
                        <asp:Image ID="Image13" runat="server" Height="220px" ImageUrl="~/pic_new/admin_3.jpg" Style="text-align: center" />
                    </td>
                    <td class="auto-style36">55362226<br />
                        นางสาวพรหมภัสสร รัตนเดชานาคินทร์<br />
                        E-mail<br />
                        &nbsp;<a href="mailto:suparaty55@email.nu.ac.th">phompassornr55@email.nu.ac.th</a><br />
                        Facebook <a href="http://www.facebook.com/suparat.yongjoh">www.facebook.com/profile.php?id=100003032487372</a><br />
                        เบอร์โทร
                       
                        <br />
                        087-8450507</td>
                </tr>
                <tr>
                    <td class="auto-style35">
                        <asp:Image ID="Image11" runat="server" Height="220px" ImageUrl="~/pic_new/admin_1.jpg" Style="text-align: center" />
                    </td>
                    <td class="auto-style36">55362523<br />
                        นายเสฏฐิกานต์ โชตึก<br />
                        E-mail<br />
                        &nbsp;<a href="mailto:suparaty55@email.nu.ac.th">sethakarnp55@email.nu.ac.th</a><br />
                        Facebook <a href="http://www.facebook.com/suparat.yongjoh">www.facebook.com/s.sethikarn</a><br />
                        เบอร์โทร
                       
                        <br />
                        085-561-1218</td>
                    <td class="auto-style35">&nbsp;</td>
                    <td class="auto-style36">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style32" colspan="4">
                        <br />
                        <br />
                        เว็บไซต์นี้เป็นส่วนหนึ่งของรายวิชา 305351 Computer System Engineering&nbsp; และ 305471 Software Engineering<br />
                        สอนโดยอาจารย์สุรเดช จิตประไพกุลศาล ภาควิชาวิศวกรรมไฟฟ้าและคอมพิวเตอร์<br />
                        <br />
                    </td>
                </tr>
            </table>

        </div>
        <div id="tab3">
        </div>
        <div>
            <div id="tab4">
                <br />
                <p class="auto-style7"><font color="White">&nbsp;เว็บไซต์นี้ถูกสร้างขึ้นเพื่อเป็นระบบประเมินและตรวจสอบโครงการของนิสิตคณะวิศวกรรมศาสตร์ สาขาวิศวกรรมคอมพิวเตอร์ มหาวิทยาลัยนเรศวร</font></p>

                <div class="auto-style7">
                    <font color="White">© 2014 BagaJN  |  © 2015 หัวหลิม</font>
                    <br />
                    <p style="font-size: 12px" class="auto-style41">
                        <font color="Gray">P02</font>
                </div>

            </div>
        </div>

        </div>
        
       

        <div class="footer-copyright" style="height: 35px; line-height: 35px;">--%>
    </form>
</body>
</html>

