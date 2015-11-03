using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWEngWeb
{
    public partial class CPE07 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (user.isLogin())
            {
                Response.Redirect("~/under_construction.aspx");
            }
            else
            {
                Response.Redirect("~/");
            }
        }
    }
}