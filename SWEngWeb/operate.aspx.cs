using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWEngWeb
{
    public partial class operate : System.Web.UI.Page
    {
        public string connectionString = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            switch (HttpContext.Current.Request.QueryString["opType"])
            {
                case "CPE01" :
                    {
                        switch (HttpContext.Current.Request.QueryString["op"])
                        {
                            case "leav":
                                {
                                    string pid = HttpContext.Current.Request.QueryString["pid"];
                                    SqlConnection conn = new SqlConnection(connectionString);
                                    string leavSta = "";

                                    conn.Open();
                                    String cmd = "SELECT personStatusID FROM position WHERE projectID = " + pid + " AND personID = " + user.userID();
                                    SqlCommand com = new SqlCommand(cmd, conn);
                                    try
                                    {
                                        leavSta = com.ExecuteScalar().ToString();
                                    }
                                    catch
                                    {
                                        HttpContext.Current.Response.Write("<script>alert('E013 : เกิดข้อผิดพลาดในการดำเนินการ');</script>");
                                    }
                                    conn.Close();

                                    if (leavSta == "1")
                                        leavSta = "";
                                    else
                                    {
                                        int temp = int.Parse(leavSta);
                                        temp++;
                                        leavSta = temp.ToString();
                                    }

                                    conn.Open();
                                    cmd = "UPDATE position SET personStatusID = " + leavSta + "0 WHERE projectID = " + pid + " AND personID = " + user.userID();
                                    com = new SqlCommand(cmd, conn);
                                    try
                                    {
                                        com.ExecuteNonQuery();
                                    }
                                    catch
                                    {
                                        HttpContext.Current.Response.Write("<script>alert('E006 : เกิดข้อผิดพลาดในการดำเนินการ');</script>");
                                    }
                                    conn.Close();
                                    process.checkCPE01(pid);
                                    break;
                                }
                            case "delete":
                                {
                                    string pid = HttpContext.Current.Request.QueryString["pid"];
                                    SqlConnection conn = new SqlConnection(connectionString);
                                    conn.Open();
                                    String cmd = "DELETE FROM project WHERE projectID = " + pid;
                                    SqlCommand com = new SqlCommand(cmd, conn);
                                    try
                                    {
                                        com.ExecuteNonQuery();
                                        HttpContext.Current.Response.Redirect("/");
                                    }
                                    catch
                                    {
                                        HttpContext.Current.Response.Write("<script>alert('E007 : เกิดข้อผิดพลาดในการดำเนินการ');</script>");
                                    }
                                    conn.Close();
                                    break;
                                }
                        }
                        break;
                    }
                case "CPE02":
                    {
                        string subject = HttpContext.Current.Request.Form["subject"];
                        string conclusion = HttpContext.Current.Request.Form["conclusion"];
                        string op = HttpContext.Current.Request.QueryString["op"];
                        string pid = HttpContext.Current.Request.QueryString["pid"];

                        if (op == "save")
                        {
                            if (subject != null && conclusion != null)
                                process.createCPE02(subject, conclusion);
                        }

                        if (op == "check")
                        {
                            string processID = HttpContext.Current.Request.Form["subYes"];
                            process.checkCPE02(processID);
                        }

                        HttpContext.Current.Response.Redirect("CPE02.aspx?pid="+pid); 
                        break;
                    }
                case "CPE03":
                    {

                        string scope = HttpContext.Current.Request.Form["scope"];
                        string adviserEva = HttpContext.Current.Request.Form["C7"];
                        string coadviserEva = HttpContext.Current.Request.Form["C8"];
                        string committeeEva = HttpContext.Current.Request.Form["C9"];
                        HttpContext.Current.Response.Write("<script>alert('" + scope + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + adviserEva + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + coadviserEva + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + committeeEva + "');</script>"); 
                        break;
                    }
                case "CPE04":
                    {
                        string memNum = HttpContext.Current.Request.Form["C1"];
                        string idea = HttpContext.Current.Request.Form["C2"];
                        string objective = HttpContext.Current.Request.Form["C3"];
                        string theory = HttpContext.Current.Request.Form["C4"];
                        string suitability = HttpContext.Current.Request.Form["C5"];
                        string scope = HttpContext.Current.Request.Form["C6"];
                        string comment = HttpContext.Current.Request.Form["comment"];
                        string opinion = HttpContext.Current.Request.Form["C7"];
                        string sumEva = HttpContext.Current.Request.Form["C8"];

                        HttpContext.Current.Response.Write("<script>alert('" + memNum + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + idea + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + objective + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + theory + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + suitability + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + scope + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + comment + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + opinion + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + sumEva + "');</script>"); 
                        break;
                    }
                case "CPE05":
                    {
                        string progress = HttpContext.Current.Request.Form["C1"];
                        string report = HttpContext.Current.Request.Form["C2"];
                        string understanding = HttpContext.Current.Request.Form["C3"];
                        string teamwork = HttpContext.Current.Request.Form["C4"];
                        string comment = HttpContext.Current.Request.Form["comment"];
                        string opinion = HttpContext.Current.Request.Form["C7"];
                        HttpContext.Current.Response.Write("<script>alert('" + progress + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + report + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + understanding + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + teamwork + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + comment + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + opinion + "');</script>"); 
                        break;
                    }
                case "CPE06":
                    {
                        string comment = HttpContext.Current.Request.Form["comment"];
                        string opinion = HttpContext.Current.Request.Form["C7"];
                        HttpContext.Current.Response.Write("<script>alert('" + comment + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + opinion + "');</script>");
                        break;
                    }
                case "CPE07":
                    {
                        string workResult = HttpContext.Current.Request.Form["C1"];
                        string progress = HttpContext.Current.Request.Form["C2"];
                        string understanding = HttpContext.Current.Request.Form["C3"];
                        string comment = HttpContext.Current.Request.Form["comment"];
                        string opinion = HttpContext.Current.Request.Form["C7"];
                        string sumEva = HttpContext.Current.Request.Form["C8"];
                        HttpContext.Current.Response.Write("<script>alert('" + workResult + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + progress + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + understanding + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + comment + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + opinion + "');</script>");
                        HttpContext.Current.Response.Write("<script>alert('" + sumEva + "');</script>"); 
                        break;
                    }
                case "noti":
                    {
                        //try
                        {
                            string acID = Request.QueryString["acID"].ToString();
                            string ac = Request.QueryString["ac"].ToString();
                            string rep = Request.QueryString["rep"].ToString();
                            string pid = Request.QueryString["pid"].ToString();

                            if (ac == "1" || ac == "3" || ac == "4" || ac == "5")
                            {
                                if (rep == "yes")
                                {

                                    if (ac == "1")
                                    {
                                        SqlConnection conn = new SqlConnection(connectionString);
                                        conn.Open();
                                        String cmd = "DELETE FROM request WHERE requestID = " + acID + ";";
                                        SqlCommand com = new SqlCommand(cmd, conn);
                                        var reader = com.ExecuteNonQuery();
                                        conn.Close();

                                        conn.Open();
                                        cmd = "UPDATE position SET personStatusID = 1 WHERE personID =" + user.userID() + " AND projectID =" + pid + " AND personStatusID = 11; ";
                                        com = new SqlCommand(cmd, conn);
                                        reader = com.ExecuteNonQuery();
                                        conn.Close();

                                        ////////////////////////////////////////////////////////////////////

                                        conn.Open();
                                        cmd = "UPDATE position SET personStatusID = 0 WHERE projectID <> " + pid + " AND personID = " + user.userID();
                                        com = new SqlCommand(cmd, conn);
                                        try
                                        {
                                            com.ExecuteNonQuery();
                                        }
                                        catch
                                        {
                                            HttpContext.Current.Response.Write("<script>alert('E008 : เกิดข้อผิดพลาดในการดำเนินการ');</script>");
                                        }
                                        conn.Close();

                                        process.checkCPE01(pid);
                                    }

                                    if (ac == "3")
                                    {
                                        SqlConnection conn = new SqlConnection(connectionString);
                                        conn.Open();
                                        String cmd = "DELETE FROM request WHERE requestID = " + acID + ";";
                                        SqlCommand com = new SqlCommand(cmd, conn);
                                        var reader = com.ExecuteNonQuery();
                                        conn.Close();

                                        conn.Open();
                                        cmd = "UPDATE position SET personStatusID = 2 WHERE personID =" + user.userID() + " AND projectID =" + pid + " AND personStatusID = 12; ";
                                        com = new SqlCommand(cmd, conn);
                                        reader = com.ExecuteNonQuery();
                                        conn.Close();
                                        process.checkCPE01(pid);
                                    }

                                    if (ac == "4")
                                    {
                                        SqlConnection conn = new SqlConnection(connectionString);
                                        conn.Open();
                                        String cmd = "DELETE FROM request WHERE requestID = " + acID + ";";
                                        SqlCommand com = new SqlCommand(cmd, conn);
                                        var reader = com.ExecuteNonQuery();
                                        conn.Close();

                                        conn.Open();
                                        cmd = "UPDATE position SET personStatusID = 3 WHERE personID =" + user.userID() + " AND projectID =" + pid + " AND personStatusID = 13; ";
                                        com = new SqlCommand(cmd, conn);
                                        reader = com.ExecuteNonQuery();
                                        conn.Close();
                                        process.checkCPE01(pid);
                                    }

                                    if (ac == "5")
                                    {
                                        SqlConnection conn = new SqlConnection(connectionString);
                                        conn.Open();
                                        String cmd = "DELETE FROM request WHERE requestID = " + acID + ";";
                                        SqlCommand com = new SqlCommand(cmd, conn);
                                        var reader = com.ExecuteNonQuery();
                                        conn.Close();

                                        conn.Open();
                                        cmd = "UPDATE position SET personStatusID = 4 WHERE personID =" + user.userID() + " AND projectID =" + pid + " AND personStatusID = 14; ";
                                        com = new SqlCommand(cmd, conn);
                                        reader = com.ExecuteNonQuery();
                                        conn.Close();
                                        process.checkCPE01(pid);
                                    }
                                }
                                if(rep == "no")
                                {
                                    if (ac == "1")
                                    {
                                        process.deleteREQ(acID);

                                        SqlConnection conn = new SqlConnection(connectionString);
                                        conn.Open();
                                        String cmd = "UPDATE position SET personStatusID = 0 WHERE personID =" + user.userID() + " AND projectID =" + pid;
                                        SqlCommand com = new SqlCommand(cmd, conn);
                                        var reader = com.ExecuteNonQuery();
                                        conn.Close();
                                        process.checkCPE01(pid);
                                    }

                                    if (ac == "3" || ac == "4" || ac == "5")
                                    {
                                        process.deleteREQ(acID);

                                        SqlConnection conn = new SqlConnection(connectionString);
                                        conn.Open();
                                        String cmd = "UPDATE position SET personStatusID = "+ac+"0 WHERE personID =" + user.userID() + " AND projectID =" + pid;
                                        SqlCommand com = new SqlCommand(cmd, conn);
                                        var reader = com.ExecuteNonQuery();
                                        conn.Close();
                                        process.checkCPE01(pid);
                                    }
                                }
                            }
                        }
                        //catch
                        {

                        }
                        
                        Response.Redirect("Notification.aspx");
                        break;
                    }
                default:
                    {
                        HttpContext.Current.Response.Redirect("/");
                        break;
                    }
            }
        }
    }
}