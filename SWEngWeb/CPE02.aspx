<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CPE02.aspx.cs" Inherits="SWEngWeb.CPE2" %>

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
            height: 1000px;
            float: left;
        }
      
        #tab2 {
            background-color: #FFFFFF;
            width: 900px;
            height: 1000px;
            float: left;
        }
        #tab3 {
            background-color: #f3c5ee ;
            width: 50px;
            height: 1000px;
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
            text-align: left;
        }
        .auto-style46 {
            background-color: #FFFF99;
        }
        

        .auto-style47 {
            background-color: #CC0000;
        }
        .auto-style48 {
            height: 21px;
            text-align: left;
            color: #FFFFFF;
            background-color: #CC0000;
        }
        .auto-style49 {
            height: 25px;
            text-align: left;
        }
        .auto-style50 {
            color: #FFFFFF;
        }
        

        .auto-style51 {
            height: 23px;
            text-align: left;
            background-color: #CC0000;
        }
        .auto-style52 {
            color: #FFFFFF;
            background-color: #00CC00;
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
                                    <asp:Label ID="username" runat="server"></asp:Label>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center" class="auto-style21">
                                    &nbsp;</td>
                                <td class="auto-style38">
                                    <asp:LinkButton ID="HomeButton" runat="server" ForeColor="#CC0000" OnClick="HomeButton_Click">เลือกแบบฟอร์ม</asp:LinkButton>
                                    
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
                        <h3>CPE02-แบบบันทึกการดำเนินงานโครงงาน</h3>
                    </td>
                    
          
              
                    
                </tr>
                <tr>
                    <td class="auto-style19">
                        &nbsp;<div class="auto-style25">
                            <asp:Label ID="TellDetail" runat="server"></asp:Label>
                            <asp:Label ID="ShowProject" runat="server" Text="Label"></asp:Label>
                        </div>
&nbsp;&nbsp;&nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style44">
                        &nbsp;&nbsp;&nbsp;<asp:Label ID="TellDetail2" runat="server"></asp:Label>
                        <asp:Label ID="NameThProject" runat="server"></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style19">
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style48">
                        <span class="auto-style50">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="auto-style47">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ข้อมูลที่เคยอัพเดทแล้ว</span></td>
                    
                </tr>
                <tr>
                    <td class="auto-style49">
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style44">
                        <asp:GridView ID="GVcpe2" runat="server" AutoGenerateColumns="false" Width="889px" Height="188px" >
                            <Columns>
                            <asp:BoundField DataField="c2_idproject" HeaderText=" รหัสโครงงาน " />
                            <asp:BoundField DataField="c2_date" HeaderText=" วันที่ " />
                            <asp:BoundField DataField="c2_topic" HeaderText=" ประเด็น/หัวข้อ/งานที่มอบหมาย " />
                            <asp:BoundField DataField="c2_summary" HeaderText=" ข้อสรุป/ความคืบหน้าของงาน " />
                            <asp:BoundField DataField="c2_comment" HeaderText=" หมายเหตุ " />
                             </Columns>
                        </asp:GridView>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style19">
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style51">
                        <span class="auto-style50">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="auto-style47">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style50">บันทึกข้อมูลเพิ่มเติม</span></span></td>
                    
               
                    <td class="auto-style19" rowspan="2">
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style19">
                        &nbsp;</td>
                    
               
                </tr>
                <tr>
                    <td class="auto-style19">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ประเด็น/หัวหัวข้อ/งานมอบหาย</td>
                    
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:TextBox ID="tbtopic" runat="server" Height="40px" Width="805px" CssClass="auto-style46"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style20">
                        </td>
                    
                </tr>
                <tr>
                    <td class="auto-style45">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ข้อสรุป/ความคืบหน้าของงาน</td>
                    
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:TextBox ID="tbsum" runat="server" Height="40px" Width="805px" CssClass="auto-style46"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style43">
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style45">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; หมายเหตุ</td>
                    
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:TextBox ID="tbcomment" runat="server" Height="40px" Width="805px" CssClass="auto-style46"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style25">
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style44">
                        <asp:Button ID="saveCpe2" runat="server" CssClass="auto-style52" OnClick="saveCpe2_Click" Text="บันทึก" />
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style25">
                        
                    </td>
                    
                </tr>
                </table>

        </div>
        <div id="tab3">
            
        </div>
    </form>
    <p class="auto-style23" style="font-size: 12px">
        &nbsp;</p>
    <p class="auto-style43" style="font-size: 12px">
        <font color="Gray" style="text-align: center">P07</font></p>
</body>
</html>
