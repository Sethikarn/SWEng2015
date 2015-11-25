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

            if (user.isLogin())
            {
                if (pid != null)
                {
                    if(int.Parse(information.projectLastStatus(pid)) >= 4)
                    {

                    }
                    else
                    {
                        Response.Redirect("~/");
                    }
                }
                else
                {
                    Response.Redirect("~/");
                }
            }
            else
            {
                Response.Redirect("~/");
            }
        }
    }
}