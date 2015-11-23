using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWEngWeb
{
    public partial class CPE04 : System.Web.UI.Page
    {
        public string pid = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (user.isLogin())
            {

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