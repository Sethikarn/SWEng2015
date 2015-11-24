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
                                    conn.Open();
                                    String cmd = "DELETE FROM position WHERE projectID = " + pid + " AND personID = " + user.userID();
                                    SqlCommand com = new SqlCommand(cmd, conn);
                                    try
                                    {
                                        com.ExecuteNonQuery();
                                        HttpContext.Current.Response.Redirect("/");
                                    }
                                    catch
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", "alert('l005 : เกิดข้อผิดพลาดในการดำเนินการ'); window.location='" + Request.ApplicationPath + "/CPE01.aspx';", true);
                                    }
                                    conn.Close();
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
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", "alert('l005 : เกิดข้อผิดพลาดในการดำเนินการ'); window.location='" + Request.ApplicationPath + "/CPE01.aspx';", true);
                                    }
                                    conn.Close();
                                    break;
                                }
                        }
                        //HttpContext.Current.Response.Redirect("/CPE01.aspx");
                        break;
                    }
                case "CPE02":
                    {
                        // 
                        break;
                    }
                case "CPE03":
                    {
                        // 
                        break;
                    }
                case "CPE04":
                    {
                        // 
                        break;
                    }
                case "CPE05":
                    {
                        // 
                        break;
                    }
                case "CPE06":
                    {
                        // 
                        break;
                    }
                case "CPE07":
                    {
                        // 
                        break;
                    }
                case "noti":
                    {
                        // 
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