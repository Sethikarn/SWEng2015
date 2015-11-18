<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CPE02.aspx.cs" Inherits="SWEngWeb.CPE2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>ระบบประเมินและตรวจสอบโครงการ คณะวิศวกรรมศาสตร์ มหาวิทยาลัยนเรศวร</title>
    <!-- CSS  -->
    <!-- CSS  -->
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
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
                        <%--<a class="waves-effect waves-light btn center red lighten-2" href="Notification.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แก้ไข</a>--%>
                    </div>
                </div>
                <div class="col s9" style="margin-left: 0px; padding-left: 0px; padding: 0px;">
                    <div class="card-panel infor" style="padding: 15px; margin: 0px; min-height: 527px;">


                        <!-- ชื่อform -->

                        <div class="card-panel red lighten-4 center">
                            <div class="grey-text text-darken-4 col s12 center" style="margin-top: -10px;">
                                <h5 style="margin: 0px;" class="center">แบบบันทึกการดำเนินงาน (CPE02) * Under Construction</h5>
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
                                    <input value="<%= SWEngWeb.user.thaiProjectName() %>" id="thaiNameInput2" type="text" class="validate" disabled="disabled" />
                                    <label for="thaiNameInput2">ชื่อไทย</label>
                                </div>
                                <div class="input-field col s6">
                                    <input value="<%= SWEngWeb.user.engProjectName() %>" id="englishNameInput2" type="text" class="validate" disabled="disabled" />
                                    <label for="englishNameInput">ชื่ออังกฤษ</label>
                                </div>

                            </div>
                        </div>



                        <!-- เลือกอาจารย์ -->

                        <div class="card-panel red lighten-4" style="padding: 5px;">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="grey-text text-darken-4 col" style="margin-left: 5px; margin-top: 5px;">
                                    <h5>ใส่รายละเอียด</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-panel" style="padding: 0px 0px 20px 20px; margin-top: -14px;">
                            <div class="row" style="margin-bottom: 0px;">
                                <div class="col s12">


                                    <div class="row" style="margin: 20px 0px 0px 0px;">
                                        <div class="col s4 right" style="padding-bottom: 5px; ">
                                            <label>วันที่</label>
                                            <input id="datepic" type="date" class="datepicker"/>
                                            
                                        </div>

                                       
                                            
                                                <div class="input-field col s12" style="margin: 5px 0px 5px 0px">
                                                    <textarea id="textarea1" class="materialize-textarea"></textarea>
                                                    <label for="textarea1">ประเด็น / งาน / หัวข้อที่มอบหมาย</label>
                                                </div>
                                                <div class="input-field col s12">
                                                    <textarea id="textarea2" class="materialize-textarea"></textarea>
                                                    <label for="textarea2">ข้อสรุป / ความคืบหน้า</label>
                                                </div>
                                            </div>
                                        
                                   


                                </div>

                            </div>
                        </div>

                                        <!-- บันทึก/ยกเลิก -->

                    <div class="row" style="margin-bottom: 0px;">
                        <a runat="server" class="waves-effect waves-light btn right red lighten-2" style="margin: 10px;">ยกเลิก</a>
                        <a id="submit" runat="server" class="waves-effect waves-light btn right red lighten-2" style="margin: 10px;">บันทึก</a>
                    </div>
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

        <script>
            $('.datepicker').pickadate({
                //selectMonths: true, // Creates a dropdown to control month
                //selectYears: 15 // Creates a dropdown of 15 years to control year
            });
              </script>

    </form>
</body>
</html>
