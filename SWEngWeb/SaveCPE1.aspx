<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveCPE1.aspx.cs" Inherits="SWEngWeb.SaveCPE1" %>

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
            background-color: #f3c5ee ;
            width: 50px;
            height: 520px;
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
            width: 998px;
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
            width: 619px;
        }
        

        .auto-style25 {
            text-align: center;
        }
        .auto-style38 {
            height: 23px;
            text-align: left;
            width: 106px;
        }
                

        .auto-style43 {
            text-align: right;
        }
        .auto-style44 {
            height: 23px;
            text-align: center;
        }
        

        .auto-style45 {
            text-align: center;
            color: #FFFFFF;
            background-color: #CC0000;
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
                        "><table class="auto-style1">
                            <tr>
                                <td class="auto-style20" colspan="6">
                                    
                                    User :
                                    <asp:Label ID="username" runat="server">55361816</asp:Label>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center" class="auto-style21">
                                    &nbsp;</td>
                                <td class="auto-style38">
                                    <asp:LinkButton ID="HomeButton" runat="server" ForeColor="#CC0000">เลือกแบบฟอร์ม</asp:LinkButton>
                                    
                                </td>
                                <td style="text-align: center" class="auto-style21">
                                    &nbsp;</td>
                                <td class="auto-style22">
                                    <asp:LinkButton ID="about" runat="server" ForeColor="#CC0000" OnClick="about_Click">เกี่ยวกับ</asp:LinkButton>
                                    </td>
                                <td class="auto-style20">
                                    <asp:LinkButton ID="logout" runat="server" ForeColor="Red" OnClick="logout_Click">ออกจากระบบ</asp:LinkButton>
                                    
                                </td>
                                <td class="auto-style20">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style21"></td>
                    
                </tr>
                <tr>
                    <td class="auto-style44">
                        <h3>CPE01-แบบเสนอหัวข้อโครงงาน</h3>
                    </td>
                    
          
              
                    
                </tr>
                <tr>
                    <td class="auto-style19">
                        &nbsp;<div class="auto-style45">
                            บันทึกโครงงานสำเร็จ รอการอนุมัติจากอาจารย์</div>
&nbsp;&nbsp;&nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style44">
                        &nbsp;รหัสโครงงานของคุณคือ :&nbsp;&nbsp;<asp:Label ID="ShowProject" runat="server" Text="Label"></asp:Label>
                        </td>
                    
                </tr>
                <tr>
                    <td class="auto-style19">
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style25">
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style43">
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style43">
                        &nbsp;</td>
                    
                </tr>
                </table>

        </div>
        <div id="tab3">

        </div>
    </form>
</body>
</html>