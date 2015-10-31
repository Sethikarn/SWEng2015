<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SWEngWeb.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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
            //background-color: #fff;
            text-align: center;
        }

        .auto-style13 {
            width: 998px;
            height: 139px;
        }

        .auto-style14 {
            font-size: large;
            text-align: center;
            height: 26px;
        }

        .auto-style16 {
            height: 23px;
            width: 358px;
            text-align: right;
        }

        .auto-style17 {
            width: 358px;
            text-align: right;
        }

        .auto-style18 {
            text-align: left;
        }

        .auto-style19 {
            height: 23px;
            text-align: left;
        }

        .auto-style20 {
            text-align: right;
            height: 23px;
        }

        .auto-style21 {
            height: 23px;
        }


        .auto-style22 {
            text-align: right;
            height: 23px;
            width: 381px;
        }
        .auto-style23 {
            text-align: right;
        }
    </style>
</head>





<body>
    <form id="form1" runat="server">
        <div id="header">
            <img alt="" class="auto-style13" src="banner.jpg" />
        </div>

        <div id="tab">
        </div>

        <div id="tab2">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style7
                        "
                        colspan="2">
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style19" style="text-align: right" colspan="6">User :&nbsp;&nbsp;<asp:Label ID="username" runat="server" Text="55361267"></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center" class="auto-style21">&nbsp;</td>
                                <td class="auto-style19">
                                    &nbsp;</td>
                                <td style="text-align: center" class="auto-style21"></td>
                                <td class="auto-style22">&nbsp;</td>
                                <td class="auto-style20">
                                    <asp:LinkButton ID="about" runat="server" ForeColor="#CC0000" OnClick="about_Click">เกี่ยวกับ</asp:LinkButton>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton ID="logout" runat="server" ForeColor="Red" OnClick="logout_Click">ออกจากระบบ</asp:LinkButton>

                                </td>
                                <td class="auto-style20">&nbsp;</td>
                            </tr>
                        </table>

                    </td>

                </tr>
                <tr>
                    <td class="auto-style7
                        "
                        colspan="2">&nbsp;</td>

                </tr>
                <tr>
                    <td class="auto-style14" colspan="2">
                        <h3>กรุณาเลือกแบบฟอร์ม</h3>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style7
                        "
                        colspan="2">&nbsp;</td>

                </tr>
                <tr>
                    <td class="auto-style16">
                        <asp:LinkButton ID="CPE01" runat="server" OnClick="CPE01_Click">CPE01</asp:LinkButton>

                    </td>

                    <td class="auto-style19">&nbsp; : แบบเสนอหัวข้อโครงงาน</td>

                </tr>
                <tr>
                    <td class="auto-style16">
                        <asp:LinkButton ID="CPE02" runat="server" OnClick="CPE02_Click">CPE02</asp:LinkButton>

                    </td>

                    <td class="auto-style19">&nbsp; : แบบบันทึกการดำเนินงานโครงงาน</td>

                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:LinkButton ID="CPE03" runat="server" OnClick="CPE03_Click">CPE03</asp:LinkButton>

                    </td>

                    <td class="auto-style18">&nbsp; : แบบขอสอบข้อเสนอโครงงาน</td>

                </tr>
                <tr>
                    <td class="auto-style17">


                        <asp:LinkButton ID="CPE04" runat="server">CPE04</asp:LinkButton>


                    </td>

                    <td class="auto-style18">&nbsp; : &nbsp;แบบประเมินข้อเสนอโครงงาน</td>

                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:LinkButton ID="CPE05" runat="server">CPE05</asp:LinkButton>
                    </td>

                    <td class="auto-style18">&nbsp; : &nbsp;แบบประเมินความก้าวหน้าโครงงาน</td>

                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:LinkButton ID="LinkButton6" runat="server">CPE05</asp:LinkButton>
                    </td>

                    <td class="auto-style18">&nbsp; : &nbsp;แบบขอสอบโครงงาน</td>

                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:LinkButton ID="CPE07" runat="server">CPE07</asp:LinkButton>
                    </td>

                    <td class="auto-style18">&nbsp; : &nbsp;แบบประเมินโครงงาน</td>

                </tr>
            </table>

        </div>
        <div id="tab3">
        </div>
    
     <div>
            <div id="tab4">
                <br />
                <p class="auto-style7"><font color="White">เว็บไซต์นี้ถูกสร้างขึ้นเพื่อเป็นระบบประเมินและตรวจสอบโครงการของนิสิตคณะวิศวกรรมศาสตร์ สาขาวิศวกรรมคอมพิวเตอร์ มหาวิทยาลัยนเรศวร</font></p>

                 <div class="auto-style7">

                <font color="White">© 2014 BagaJN  |  © 2015 หัวหลิม</font></font>

            </div>
            </div>
            
        </div>
        <p style="font-size:12px" class="auto-style23"><font color="Gray">P03</font></div>
        <div class="footer-copyright" style="height: 35px; line-height: 35px;">            
                
        
        
            </form>
</body>
</html>
