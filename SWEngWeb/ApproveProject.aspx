<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApproveProject.aspx.cs" Inherits="SWEngWeb.ApproveProject" %>

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
        

        .auto-style25 {
            text-align: center;
        }
        .auto-style27 {
            color: #FFFFFF;
            background-color: #CC0000;
        }
        .auto-style38 {
            height: 23px;
            text-align: left;
            width: 106px;
        }
        .auto-style42 {
            color: #FFFFFF;
            background-color: #33CC33;
        }
        

        .auto-style43 {
            text-align: right;
        }
        .auto-style44 {
            background-color: #FFFFCC;
        }
        

        .auto-style45 {
            background-color: #FFFF00;
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
                                <td class="auto-style21" style="text-align: center" colspan="6">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center" class="auto-style21">
                                    &nbsp;</td>
                                <td class="auto-style38">
                                    <asp:LinkButton ID="HomeButton" runat="server" ForeColor="#CC0000" OnClick="HomeButton_Click1">เลือกแบบฟอร์ม</asp:LinkButton>
                                    
                                </td>
                                <td style="text-align: center" class="auto-style21">
                                    &nbsp;</td>
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
                        <h3 class="auto-style27">โครงงานที่รอการอนุมัติ</h3>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style19">
                        &nbsp;<div class="auto-style25">
                        <asp:GridView ID="GVproject" runat="server" AutoGenerateColumns="false" CssClass="auto-style44" >
                            <Columns>
                                <asp:BoundField DataField="p_id" HeaderText=" รหัสโครงงาน " />
                                <asp:BoundField DataField="p_nameth" HeaderText=" ชื่อภาษาไทย " />
                                <asp:BoundField DataField="p_nameeng" HeaderText=" ชื่อภาษาอังกฤษ " />
                                <asp:BoundField DataField="p_advisor" HeaderText=" ชื่ออาจารย์ที่ปรึกษา " />
                                <asp:BoundField DataField="p_coadvisor" HeaderText=" ชื่ออาจารย์ที่ปรึกษาร่วม " />
                                <asp:BoundField DataField="p_committee" HeaderText=" ชื่อคณะกรรมการที่เสนอ " />
                                <asp:BoundField DataField="p_approve" HeaderText="สถานะ" />
                            </Columns>
                        </asp:GridView>
                        </div>
&nbsp;&nbsp;&nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style19">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; กรุณาเลือกโครงงานที่ต้องการอนุมัติ&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlProject" runat="server" Width="200px">
                        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
                        <strong>
                        <asp:Button ID="approve" runat="server" CssClass="auto-style42" Text="อนุมัติ" OnClick="approve_Click" />
                        &nbsp;
                        <asp:Button ID="btedit" runat="server" CssClass="auto-style45" OnClick="btedit_Click" Text="แก้ไข" />
                        </strong>
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

