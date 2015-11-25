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

                    <%if (pid != null)
                      {
                    %>
                    <div class="card-panel" style="padding: 7px; margin-bottom: 0px;">
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE01.aspx?pid=<%=pid%>" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;">แบบเสนอหัวข้อโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE02.aspx?pid=<%=pid%>" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;">แบบบันทึกการดำเนินงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE03.aspx?pid=<%=pid%>" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;">แบบขอสอบข้อเสนอโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE04.aspx?pid=<%=pid%>" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;">แบบประเมินข้อเสนอโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE05.aspx?pid=<%=pid%>" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;">แบบประเมินความก้าวหน้า</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE06.aspx?pid=<%=pid%>" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;">แบบขอสอบโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE07.aspx?pid=<%=pid%>" style="margin-bottom: -7px; padding-left: 0px; padding-right: 0px; width: 100%;">แบบประเมินโครงงาน</a>
                    </div>
                    <%
                     }
                     else
                     {
                    %>
                    <div class="card-panel" style="padding: 7px; margin-bottom: 0px;">
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE01.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบเสนอหัวข้อโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE02.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบบันทึกการดำเนินงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE03.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบขอสอบข้อเสนอโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE04.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบประเมินข้อเสนอโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE05.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบประเมินความก้าวหน้า</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE06.aspx" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบขอสอบโครงงาน</a>
                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE07.aspx" style="margin-bottom: -7px; padding-left: 0px; padding-right: 0px; width: 100%;" runat="server">แบบประเมินโครงงาน</a>
                    </div>
                    <%} %>
                </div>
                <div class="col s9" style="margin-left: 0px; padding-left: 0px; padding: 0px;">
                    <div class="card-panel infor" style="padding: 15px; margin: 0px; min-height: 527px;">

                        <div class="col s12">


                            <%
                                if (SWEngWeb.user.userHaveProject() || SWEngWeb.user.position() == "teacher")
                                {
                            %>
                            <div class="card-panel red lighten-4" style="margin: 0px 0px 10px 0px;">
                                <div class="grey-text text-darken-4 col s12" style="margin-top: -12px;">
                                    <h5 style="margin: 0px;">โครงงาน  <%= SWEngWeb.information.thaiProjectName(pid) + " : " + SWEngWeb.information.engProjectName(pid) %></h5>
                                </div>
                            </div>
                            <!-- <div class="section" style="margin-bottom: -20px;"> -->
                            <div class="row" style="margin-bottom: 0px;">

                                <div class="col s6">
                                    <div class="row" style="margin: 0px;">
                                        <div class="information card-panel light" style="height: 225px; padding:10px; margin-bottom:5px;">
                                            <div class="icon-block">
                                                <h2 class="center brown-text" style="margin-top: 0px; margin-bottom: 0px;"><i class="large material-icons">info</i></h2>
                                                <h5 class="center">สถานะล่าสุด</h5>

                                                <p class="light center"><%= SWEngWeb.information.projectLastStatus(pid) %></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin: 0px;">
                                        <div class="information card-panel light" style="height: 225px; padding:10px;">
                                            <div class="icon-block">
                                                <h2 class="center brown-text" style="margin-top: 0px; margin-bottom: 0px;"><i class="large material-icons">web</i></h2>
                                                <h5 class="center">"NEWS" Coming soon !</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col s6">
                                    <div class="information card-panel light">
                                        <div class="icon-block" style="padding: 0px;">
                                            <h2 class="center brown-text" style="margin-top: 0px; margin-bottom: 0px;"><i class="large material-icons">assessment</i></h2>
                                            <h5 class="center" style="margin-bottom:0px;">ภาพรวม</h5>
                                            <br />
                                            <%
                                                int lastStatus = 0;

                                    SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);
                                    try
                                    {
                                    conn.Open();
                                    String cmd = "select lastStatus from project where projectID =" + pid;
                                    SqlCommand com = new SqlCommand(cmd, conn);
                                    var reader = com.ExecuteScalar();
                                    conn.Close();

                                    lastStatus = int.Parse(reader.ToString());
                                    }
                                    catch
                                    {
                                        Response.Write("<script>alert('E010 : อ้าว! เกิดข้อพลาดบ้างประการ');</script>");
                                    }
                                    
                                    %>
                                            <div>
                                                <%
                                                string status = "";
                                                string textColor = "red-text";
                                                string iconInProgress = "fast_forward";
                                                   
                                                if(lastStatus == 0 )
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if(lastStatus == 1 )
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if(lastStatus == 2 )
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if(lastStatus >= 3 )
                                                {
                                                    iconInProgress = "done";
                                                    textColor = "green-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                %>
                                                <a class="waves-effect waves-light center <%=textColor %>"><i class="material-icons left red-text"><%=iconInProgress%></i> <%=status %></a>
                                                
                                                
                                                
                                                <%
                                                if(lastStatus < 4)
                                                {
                                                    iconInProgress = "warning";
                                                    textColor = "red-text";
                                                    status = "ยังไม่มีบันทึกการดำเนินโครงงาน";
                                                }
                                                if (lastStatus >= 4)
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "green-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                %>
                                                <a class="waves-effect waves-light center <%=textColor %>"><i class="material-icons left red-text"><%=iconInProgress%></i> <%=status %></a>
                                                
                                                <%
                                                if(lastStatus < 5)
                                                {
                                                    iconInProgress = "warning";
                                                    textColor = "red-text";
                                                    status = "ยังไม่ได้สอบข้อเสนอโครงงาน";
                                                }
                                                if (lastStatus == 5)
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if (lastStatus == 6)
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if (lastStatus >= 7)
                                                {
                                                    iconInProgress = "done";
                                                    textColor = "green-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                %>
                                                <a class="waves-effect waves-light center <%=textColor %>"><i class="material-icons left red-text"><%=iconInProgress%></i> <%=status %></a>
                                                

                                                <%
                                                if (lastStatus < 8)
                                                {
                                                    iconInProgress = "warning";
                                                    textColor = "red-text";
                                                    status = "ยังไม่ผ่านการประเมินข้อเสนอโครงงาน";
                                                }
                                                if (lastStatus == 8)
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if (lastStatus == 9)
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if (lastStatus == 10)
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if (lastStatus >= 11)
                                                {
                                                    iconInProgress = "done";
                                                    textColor = "green-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                %>
                                                <a class="waves-effect waves-light center <%=textColor%>"><i class="material-icons left red-text"><%=iconInProgress%></i> <%=status%></a>
                                              
                                                 
                                                <%
                                                if(lastStatus < 12)
                                                {
                                                    iconInProgress = "warning";
                                                    textColor = "red-text";
                                                    status = "ยังไม่ผ่านความก้าวหน้าโครงงาน";
                                                }
                                                if (lastStatus == 12)
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if (lastStatus >= 13)
                                                {
                                                    iconInProgress = "done";
                                                    textColor = "green-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                %>
                                                <a class="waves-effect waves-light center <%=textColor %>"><i class="material-icons left red-text"><%=iconInProgress%></i> <%=status %></a>
                                                
                                                
                                                <%
                                                if(lastStatus < 14)
                                                {
                                                    iconInProgress = "warning";
                                                    textColor = "red-text";
                                                    status = "ยังไม่มีแบบขอสอบโครงงาน";
                                                }
                                                if (lastStatus == 14)
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if (lastStatus == 15)
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if (lastStatus >= 16)
                                                {
                                                    iconInProgress = "done";
                                                    textColor = "green-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                %>
                                                <a class="waves-effect waves-light center <%=textColor %>"><i class="material-icons left red-text"><%=iconInProgress%></i> <%=status %></a>
                                                
                                                
                                                <%
                                                if(lastStatus < 17)
                                                {
                                                    iconInProgress = "warning";
                                                    textColor = "red-text";
                                                    status = "ยังไม่ได้ดำเนินการขอสอบโครงงาน";
                                                }
                                                if (lastStatus == 17)
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if (lastStatus == 18)
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if (lastStatus == 19)
                                                {
                                                    iconInProgress = "fast_forward";
                                                    textColor = "amber-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                if (lastStatus >= 20)
                                                {
                                                    iconInProgress = "done_all";
                                                    textColor = "green-text";
                                                    status = SWEngWeb.information.projectStatus(lastStatus.ToString());
                                                }
                                                %>
                                                <a class="waves-effect waves-light center <%=textColor %>"><i class="material-icons left red-text"><%=iconInProgress%></i> <%=status %></a>
                                                

                                            <%--<div>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> under construction</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่มีแบบเสนอหัวข้อโครงงาน</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่มีแบบบันทึกการดำเนินงาน</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่ได้ขอสอบข้อเสนอโครงงาน</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านไม่มีแบบประเมินข้อเสนอโครงงาน</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่มีแบบประเมินความก้าวหน้า</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่มีแบบขอสอบโครงงาน</a>
                                                <a class="waves-effect waves-light center red-text" runat="server"><i class="material-icons left red-text">warning</i> ท่านยังไม่มีแบบประเมินโครงงาน</a>
                                            </div>--%>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% 
                                }
                                else
                                {
                            %>
                            <div class="card-panel red lighten-4" style="margin: 0px 0px 10px 0px;">
                                <div class="grey-text text-darken-4 col s12" style="margin-top: -12px;">
                                    <h5 style="margin: 0px;">ท่านยังไม่มีโครงงาน</h5>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 0px; margin-top: -10px;">
                                <div class="col s12 center">
                                    <div class="information card-panel light" style="margin-top: 0px;">
                                        <a class="waves-effect waves-light btn center red lighten-2" href="CPE01.aspx" style="margin-top: 200px; margin-bottom: 200px; margin-right: 5px;">เริ่มสร้างโครงงาน</a>
                                        <%--<a href="http://www.eng.nu.ac.th" target="_blank">
                                                <img src="pic/doc_forbidden.png" alt="" class="center responsive-img z-depth-1" style="margin: 0px;" />
                                            </a>--%>
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
