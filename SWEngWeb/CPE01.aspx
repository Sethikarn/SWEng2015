<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CPE01.aspx.cs" Inherits="SWEngWeb.CPE1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style>
        body {
            width: 1000px;
            margin: 0 auto;
            height: 1143px;
        }

        #header{
            background-color: #f3c5ee;
            width: 1000px;
            float: initial;
            height: 145px;
        }

        #tab {
            background-color: #f3c5ee ;
            width: 50px;
            height: 968px;
            float: left;
        }
      
        #tab2 {
            background-color: #FFFFFF;
            width: 900px;
            height: 970px;
            float: left;
        }
        #tab3 {
            background-color: #f3c5ee;
            width: 50px;
            height: 968px;
            float:left;
        }

        .auto-style1 {
            background-color: #fff;
            
            width: 100%;
        }

        .auto-style6 {
            background-color: #CD2626;
            text-align: left;
            height: 11px;
        }
        .auto-style7 {
            text-align: center;
            height: 21px;
        }
        .auto-style11 {
        background-color : #CD2626;
            height: 23px;
            color: #FFFFFF;
        }
        
        .auto-style20 {
            background-color : #CD2626;
        }
                
        #color {
            height: 25px;
            background-color: #f3c5ee;
        }
                        
        .auto-style53 {
            background-color : #CD2626;
            height: 8px;
        }

        
        .auto-style58 {
            background-color : #FFFFFF;
            text-align: center;
        }
                

        .auto-style100 {
            text-align: left;
        }
                

        .auto-style157 {
            text-align: center;
            }
                        

        .auto-style170 {
            color: #FFFFFF;
        }
                

        .auto-style174 {
            height: 17px;
            text-align: left;
        }
        .auto-style175 {
            background-color : #FFFFFF;
            text-align: left;
        }
        .auto-style176 {
            height: 80px;
            text-align: left;
        }
                

        .auto-style181 {
            text-align: left;
            height: 21px;
        }
                

        .auto-style182 {
            text-align: right;
            height: 21px;
        }
                

        .auto-style183 {
            text-align: center;
            height: 23px;
        }
                

        .auto-style184 {
            background-color : #FFFFFF;
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
                    <td class="auto-style7">
                        </td>
                    <td class="auto-style7">
                                    </td>
                    <td class="auto-style7">
                        </td>
                    <td class="auto-style7">
                        </td>
                    <td class="auto-style182">
                                    User :
                                    <asp:Label ID="username" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td class="auto-style181">
                                    <asp:LinkButton ID="HomeButton" runat="server" ForeColor="#CC0000" OnClick="HomeButton_Click">เลือกแบบฟอร์ม</asp:LinkButton>
                                    
                    </td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td class="auto-style182">
                        <asp:LinkButton ID="about" runat="server" ForeColor="#CC0000" OnClick="about_Click">เกี่ยวกับ</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton ID="logout" runat="server" ForeColor="Red" OnClick="logout_Click">ออกจากระบบ</asp:LinkButton>
                                    
                    </td>
                    <td class="auto-style7">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7" colspan="6">
                        <h3>CPE01-แบบเสนอหัวข้อโครงงาน<asp:Label ID="foredit" runat="server" ForeColor="#FF3300"></asp:Label>
                        </h3>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="6">
                        <span class="auto-style170"> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; ชื่อโครงงาน</span></td>
                </tr>
                <tr>
                    <td class="auto-style176" colspan="6">
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp; ชื่อภาษาไทย&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="ThaiNamePJ" runat="server" Width="200px" BackColor="#FFFFCC" style="text-align: left" ></asp:TextBox>
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp; ชื่อภาษาอังกฤษ&nbsp;&nbsp; <asp:TextBox ID="EngNamePJ" runat="server" Width="200px" BackColor="#FFFFCC" style="text-align: left" ></asp:TextBox>
                        </td>
                 
                    
                </tr>
                <tr>
                    <td class="auto-style174" colspan="6"></td>
                 
                    
                </tr>
                <tr>
                    <td class="auto-style53" colspan="6"><span class="auto-style170">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; อาจารย์ที่ปรึกษา</span></td>
                </tr>
                <tr>
                    <td class="auto-style100" colspan="6">&nbsp;<br />
&nbsp;&nbsp;&nbsp; อาจารย์ที่ปรึกษา&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="SearchAdvisor" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="150px">
                        </asp:DropDownList>
                        &nbsp;&nbsp;<br />
                        <br />
&nbsp;&nbsp;&nbsp; อาจารที่ปรึกษาร่วม (ถ้ามี)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="SearchCoAdvisor" runat="server" Width="150px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style100" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11" colspan="6">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; เสนอรายชื่อคณะกรรมการ</td>
                </tr>
                <tr>
                    <td class="auto-style100" colspan="6">&nbsp;<br />
&nbsp;&nbsp;&nbsp; ชื่อคณะกรรมการที่เสนอ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="SearchCommittee" runat="server" Width="150px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style100" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="6"><span class="auto-style170">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; รายชื่อนิสิตผู้ทำโครงงาน</span></td>
                </tr>
                <tr>
                    <td class="auto-style175" colspan="3">
                        &nbsp;<br />
&nbsp;&nbsp;&nbsp;
                        โปรดเลือกตามรหัสนิสิต<br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                        1)
                        <asp:DropDownList ID="ddlStudent1" runat="server" OnSelectedIndexChanged="ddlStudent1_SelectedIndexChanged">
                        </asp:DropDownList>
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                        2)
                        <asp:DropDownList ID="ddlStudent2" runat="server">
                        </asp:DropDownList>
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp; 3) <asp:DropDownList ID="ddlStudent3" runat="server">
                        </asp:DropDownList>
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="FindStudentDetail" runat="server" ImageUrl="~/find.gif" Width="50px" OnClick="FindStudentDetail_Click" />
                    </td>
                    <td class="auto-style175" rowspan="2" colspan="3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style175" colspan="3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style20" colspan="6">
                        <span class="auto-style170">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; รายละเอียดนิสิต (กรุณาอัพเดทเบอร์โทรศัพท์และอีเมลล์)</span></td>
                </tr>
                <tr>
                    <td class="auto-style157" colspan="6">
                        <br />
                        ชื่อ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        นามสกุล&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        เบอร์โทรศัพท์&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        อีเมลล์<br />
                        <br />
                        1)&nbsp;&nbsp;<asp:TextBox ID="student1_fname" runat="server" Width="100px" BackColor="#FFFFCC" ReadOnly="True" Height="16px" style="background-color: #FFFFFF"></asp:TextBox>
                        <asp:TextBox ID="student1_lname" runat="server" Width="100px" BackColor="#FFFFCC" ReadOnly="True" style="background-color: #FFFFFF"></asp:TextBox>
                        <asp:TextBox ID="student1_tel" runat="server" Width="100px" BackColor="#FFFFCC"></asp:TextBox>
                        <asp:TextBox ID="student1_email" runat="server" Width="200px" BackColor="#FFFFCC" style="margin-left: 0px"></asp:TextBox>
                        <br />
                        <br />
                        2)&nbsp;
                        <asp:TextBox ID="student2_fname" runat="server" Width="100px" BackColor="#FFFFCC" ReadOnly="True" style="background-color: #FFFFFF"></asp:TextBox>
                        <asp:TextBox ID="student2_lname" runat="server" Width="100px" BackColor="#FFFFCC" ReadOnly="True" style="background-color: #FFFFFF"></asp:TextBox>
                        <asp:TextBox ID="student2_tel" runat="server" Width="100px" BackColor="#FFFFCC"></asp:TextBox>
                        <asp:TextBox ID="student2_email" runat="server" Width="200px" BackColor="#FFFFCC"></asp:TextBox>
                        <br />
                        <br />
                        3)&nbsp;
                        <asp:TextBox ID="student3_fname" runat="server" Width="100px" BackColor="#FFFFCC" ReadOnly="True" style="background-color: #FFFFFF"></asp:TextBox>
                        <asp:TextBox ID="student3_lname" runat="server" Width="100px" BackColor="#FFFFCC" ReadOnly="True" style="background-color: #FFFFFF"></asp:TextBox>
                        <asp:TextBox ID="student3_tel" runat="server" Width="100px" BackColor="#FFFFCC"></asp:TextBox>
                        <asp:TextBox ID="student3_email" runat="server" Width="200px" BackColor="#FFFFCC"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style183" colspan="6">
                        <asp:Label ID="textidproject" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style157" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style58" colspan="6">
                        <asp:Button ID="finish" runat="server"  Text="เรียบร้อย" Width="98px" OnClick="finish_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style184" colspan="6">
                        <font color="Gray">P04</font></td>
                    
                </tr>
                </table>

        </div>
        <div id="tab3">

        </div>
    </form>
</body>
</html>
