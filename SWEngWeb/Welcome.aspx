<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="SWEngWeb.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    
</head>

<body>




    <form id="form1" runat="server">
        <div id="header">
            <asp:Image ID="Image1" runat="server" Height="145px" ImageUrl="~/banner.jpg" Width="1000px" />
        </div>

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
                        <asp:Image ID="Image6" runat="server" Height="163px" ImageUrl="~/login.PNG" Width="260px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <asp:Image ID="Image3" runat="server" Height="40px" ImageUrl="~/username.PNG" Width="115px" Style="text-align: right" />
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="user" runat="server" BackColor="#FFCC99" ForeColor="Black" Height="23px" Style="margin-left: 0px; text-align: left;" Width="181px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <asp:Image ID="Image4" runat="server" Height="40px" ImageUrl="~/pw.PNG" />
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="TextBox2" type="password" runat="server" BackColor="#FFCC99" Height="23px" Width="181px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="47px" ImageUrl="~/liw.PNG" OnClick="ImageButton2_Click" Width="140px" />
                    </td>
                </tr>
            </table>

            <asp:Label ID="username" runat="server" Style="text-align: center"></asp:Label>

        </div>
        <div id="tab3">
        </div>

        <div style="text-align: right">
            <div id="tab4">
                <br />
                <p class="auto-style7"><font color="White">เว็บไซต์นี้ถูกสร้างขึ้นเพื่อเป็นระบบประเมินและตรวจสอบโครงการของนิสิตคณะวิศวกรรมศาสตร์ สาขาวิศวกรรมคอมพิวเตอร์ มหาวิทยาลัยนเรศวร</font></p>

                 <div class="auto-style20">
                     <div class="auto-style7">
                <font color="White">© 2014 BagaJN  |  © 2015 หัวหลิม</font>
                     <br />
                     </div>
                     <p style="font-size:12px" class="auto-style20"><font color="Gray">P01</font></div>

            </div>
            </div>
            
            
        <div class="footer-copyright" style="height: 35px; line-height: 35px;">
           
    </form>




</body>
</html>
