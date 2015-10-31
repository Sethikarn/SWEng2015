<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CPE3.aspx.cs" Inherits="SWEngWeb.CPE3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style>
        body {
            width: 1000px;
            margin: 0 auto;
        }

        #header{
            background-color: #6F0023;
            width: 1000px;
            float: initial;
            height: 145px;
        }

        #tab {
            background-color: #f3c5ee ;
            width: 50px;
            height: 600px;
            float: left;
        }
      
        #tab2 {
            background-color: #FFFFFF;
            width: 900px;
            height: 600px;
            float: left;
        }
        #tab3 {
            background-color: #f3c5ee ;
            width: 50px;
            height: 600px;
            float:left;
        }

        .auto-style1 {
            width: 100%;
        }

        .auto-style7 {
            background-color : #fff;
            text-align: center;
            }
                
        .auto-style13 {
            width: 1001px;
            height: 139px;
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
            width: 411px;
        }
        .auto-style24 {
            width: 411px;
        }
        .auto-style25 {
            text-align: right;
            width: 411px;
            height: 23px;
        }
        .auto-style26 {
            text-align: left;
        }
        .auto-style27 {
            color: #FFFFFF;
            background-color: #CC0000;
        }
        .auto-style29 {
            text-align: left;
            background-color: #CC0000;
            height: 11px;
        }
        .auto-style30 {
            color: #FFFFFF;
        }
        

        .auto-style31 {
            background-color: #CC0000;
        }
        .auto-style32 {
            text-align: left;
            background-color: #CC0000;
        }
        .auto-style33 {
            height: 31px;
            text-align: center;
        }
        

        .auto-style34 {
            color: #FFFFFF;
            background-color: #00CC00;
        }
        .auto-style35 {
            background-color: #FFFF99;
        }
        

        </style>
</head>





<body>
    <form id="form1" runat="server">
    <div id="header">
        <img alt="" class="auto-style13" src="banner.jpg" /></div>

        <div id="tab" >
            

        </div>

        <div id="tab2">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style7
                        " colspan="4"><table class="auto-style1">
                            <tr>
                                <td class="auto-style19" style="text-align: right" colspan="6">
                                    
                              User :&nbsp;&nbsp;<asp:Label ID="username" runat="server" Text="55366637"></asp:Label>
&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: center" class="auto-style21">
                                    &nbsp;</td>
                                <td class="auto-style19">
                                    <asp:LinkButton ID="HomeButton" runat="server" ForeColor="#CC0000" OnClick="HomeButton_Click">เลือกแบบฟอร์ม</asp:LinkButton>
                                    
                                </td>
                                <td style="text-align: center" class="auto-style21">
                                    </td>
                                <td class="auto-style22">
                                    &nbsp;</td>
                                <td class="auto-style20">
                                    <asp:LinkButton ID="about" runat="server" ForeColor="#CC0000" OnClick="about_Click">เกี่ยวกับ</asp:LinkButton>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton ID="logout" runat="server" ForeColor="Red" OnClick="logout_Click">ออกจากระบบ</asp:LinkButton>
                                    
                                </td>
                                <td class="auto-style20">
                                    &nbsp;</td>
                            </tr>
                        </table>
                                
                    </td>
                   </tr>


                <tr>
                    <td class="auto-style7
                        " colspan="4">&nbsp;</td>
                   </tr>


                <tr>
                    <td class="auto-style7
                        " colspan="4">
                        <h3>CPE03-แบบขอสอบข้อเสนอโครงงาน</h3>
                                
                    </td>
                   </tr>


                <tr>
                    <td class="auto-style7
                        " colspan="4">&nbsp;</td>
                   </tr>


                <tr>
                    <td class="auto-style27" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; รายละเอียดโครงงาน</td>
                   </tr>


                <tr>
                    <td class="auto-style7
                        " colspan="4">
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style23">รหัสโครงงาน : </td>
                                <td class="auto-style26">
                                    <asp:Label ID="idp" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style23">ชื่อโครงงานภาษาไทย : </td>
                                <td class="auto-style26">
                                    <asp:Label ID="namethp" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">ชื่อโครงงานภาษาอังกฤษ : </td>
                                <td class="auto-style19">
                                    <asp:Label ID="nameengp" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style29" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style30">&nbsp;รายชื่อนิสิตที่ทำโครงงาน</span></td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                                
                    </td>
                   </tr>


                <tr>
                    <td class="auto-style7
                        ">
                        &nbsp;</td>
                    <td class="auto-style7
                        ">
                        &nbsp;</td>
                    <td class="auto-style7
                        ">
                        <asp:GridView ID="GVstdDetail" runat="server" AutoGenerateColumns="false" Width="643px">
                            <Columns>
                                <asp:BoundField DataField="s_id" HeaderText=" รหัสนิสิต " />
                                <asp:BoundField DataField="s_name" HeaderText=" ชื่อ " />
                                <asp:BoundField DataField="s_lastname" HeaderText=" นามสกุล " />
                                <asp:BoundField DataField="s_tel" HeaderText=" เบอร์โทรศัพท์ " />
                                <asp:BoundField DataField="s_email" HeaderText=" อีเมลล์ " />
                            </Columns>
                        </asp:GridView>
                                
                    </td>
                    <td class="auto-style7
                        ">
                        &nbsp;</td>
                   </tr>


                <tr>
                    <td class="auto-style7
                        " colspan="4">&nbsp;</td>
                   </tr>


                <tr>
                    <td class="auto-style32" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style31">&nbsp;&nbsp;&nbsp; </span> <span class="auto-style27">&nbsp;ประเด็นปัญหาและขอบเขตโครงงานโดยย่อ</span></td>
                   </tr>


                <tr>
                    <td class="auto-style7
                        " colspan="4">&nbsp;</td>
                   </tr>


                <tr>
                    <td class="auto-style33" colspan="4">
                        <asp:TextBox ID="tbissue" runat="server" Height="21px" Width="770px" CssClass="auto-style35"></asp:TextBox>
                    </td>
                   </tr>


                <tr>
                    <td class="auto-style21" colspan="4"></td>
                   </tr>


                <tr>
                    <td class="auto-style7
                        " colspan="4">
                        <asp:Button ID="tbsave" runat="server" CssClass="auto-style34" OnClick="tbsave_Click" Text="บันทึก" />
                    </td>
                   </tr>


                <tr>
                    <td class="auto-style7
                        " colspan="4">&nbsp;</td>
                   </tr>


                <tr>
                    <td class="auto-style7
                        " colspan="4">&nbsp;</td>
                   </tr>


                </table>

        </div>
        <div id="tab3">

        </div>
    </form>
</body>
</html>
