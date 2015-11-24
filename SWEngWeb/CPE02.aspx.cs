using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace SWEngWeb
{
    public partial class CPE2 : System.Web.UI.Page
    {
        public string pid = null;
        string constr1 = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (user.isLogin())
            {
                if (user.userHaveProject() || user.position() == "teacher")
                {
                    
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", "alert('l004 : ท่านยังไม่ผ่านแบบเสนอหัวข้อโครงงาน'); window.location='" + Request.ApplicationPath + "';", true);
                }

            }
            else
            {
                Response.Redirect("~/");
            }

            Page.MaintainScrollPositionOnPostBack = true;

            try
            {
                pid = Request.QueryString["pid"];
            }
            catch
            {
                if (user.userHaveProject())
                {
                    pid = user.projectID();
                }
                else
                {
                    pid = null;
                }
            }

            if (user.userHaveProject())
            {
                pid = user.projectID();
            }
            
        }
    }
}