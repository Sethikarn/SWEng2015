<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CPE3forPr.aspx.cs" Inherits="no1.CPE3forPr" %>

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

        .auto-style14 {
            font-size: large;
            text-align: center;
            height: 26px;
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
            width: 313px;
        }
        

        .auto-style23 {
            color: #CC0000;
        }
        

        .auto-style24 {
            height: 23px;
            text-align: center;
        }
        .auto-style26 {
            text-align: left;
            color: #FFFFFF;
            background-color: #CC0000;
        }
        .auto-style27 {
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
                                    
                                    User:
                                    <asp:Label ID="username" runat="server" Text="000002"></asp:Label>
                                    
                                </td>
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
                        ">&nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style14">
                        <h3>CPE03-แบบขอสอบข้อเสนอโครงงาน (<span class="auto-style23">เพื่ออนุมัติ</span>)</h3>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style21"></td>
                    
                </tr>
         
                <tr>
                    <td class="auto-style26">&nbsp;&nbsp;&nbsp;&nbsp; โครงงานที่ขอสอบ&nbsp;</td>
                    
                </tr>
         
                <tr>
                    <td class="auto-style24">
                        
                    </td>
                    
                </tr>
         
                <tr>
                    <td class="auto-style24">
                        <asp:GridView ID="GvPj" runat="server" AutoGenerateColumns="false" Width="890px">
                              <Columns>
                                <asp:BoundField DataField="p_id" HeaderText=" รหัสโครงงาน " />
                                <asp:BoundField DataField="p_nameth" HeaderText="  ชื่อภาษาไทย " />
                                <asp:BoundField DataField="p_nameeng" HeaderText=" ชื่อภาษาอังกฤษ " />
                                  <asp:BoundField DataField="p_advisor" HeaderText=" อาจารย์ที่ปรึกษา " />
                                <asp:BoundField DataField="p_coadvisor" HeaderText=" อาจารย์ที่ปรึกษาร่วม " />
                                <asp:BoundField DataField="p_committee" HeaderText=" กรรมการ " />
                                  <asp:BoundField DataField="p_issue" HeaderText=" ประเด็นปัญหา " />
                             </Columns>
                        </asp:GridView>
                    </td>
                    
                </tr>
         
                <tr>
                    <td class="auto-style21"></td>
                    
                </tr>
         
                <tr>
                    <td class="auto-style24">กรุณาเลือกโปรเจคที่ต้องการอนุมัติ&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlSelect" runat="server" Width="150px">
                        </asp:DropDownList>
&nbsp;&nbsp;
                        <asp:Button ID="ตกลง" runat="server" CssClass="auto-style27" Text="อนุมัติ" OnClick="ตกลง_Click" />
                    </td>
                    
                </tr>
         
                <tr>
                    <td class="auto-style21"></td>
                    
                </tr>
         
                <tr>
                    <td class="auto-style21"></td>
                    
                </tr>
         
                </table>

        </div>
        <div id="tab3">

        </div>
    </form>
</body>
</html>


