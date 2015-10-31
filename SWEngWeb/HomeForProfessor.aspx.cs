using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWEngWeb
{
    public partial class HomeForProfessor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.PreviousPage != null)
            {
                var user1 = (PreviousPage.FindControl("username")) as Label;
                username.Text = user1.Text;
            }

        }

        protected void about_Click(object sender, EventArgs e)
        {
            Server.Transfer("About.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["sIsAuthenticated"] = false;
            Session["AuthenName"] = null;

            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();

            Response.Redirect("~/");
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx");
        }

        protected void CPE01_Click(object sender, EventArgs e)
        {
            Server.Transfer("ApproveProject.aspx");
        }

        protected void CPE02_Click(object sender, EventArgs e)
        {
            Server.Transfer("CPE2forProfessor.aspx");
        }

        protected void CPE03_Click(object sender, EventArgs e)
        {

            Server.Transfer("CPE3forPr.aspx");
        }
    }
}