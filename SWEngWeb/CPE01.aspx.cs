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
    public partial class CPE01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*//////////////////////////////--------------- Check is login ---------------///////////////////////////////
            if not login redirect to login page 
                otherwise continue
            */
            if ( ! user.isLogin())
                Response.Redirect("~/");

            /*//////////////////////////////--------------- Check is user have project ---------------///////////////////////////////
            if user already have project continue
                otherwise redirect to CreateProject
            */
            if ( ! user.userHaveProject())
                Response.Redirect("CreateProject.aspx");
        }
    }
}