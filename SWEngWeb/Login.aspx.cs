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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*//////////////////////////////--------------- Check is login ---------------///////////////////////////////
            if not login continue
                otherwise if login as student redirect to StudentMenu
                          if login as teacher redirect to teacher
            */
            if (user.isLogin())
            {
                if (user.position() == "student")
                {
                    Response.Redirect("~/StudentMenu.aspx");
                }
                else
                {
                    Response.Redirect("~/TeacherMenu.aspx");
                }
                    
            }
        }


        /*//////////////////////////////--------------- login on click ---------------///////////////////////////////
        */
        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            if (user.login(String.Format("{0}", Request.Form["UserName"]), String.Format("{0}", Request.Form["PassWord"])))
            {
                if (user.position() == "student")
                {
                    Response.Redirect("~/StudentMenu.aspx");
                }
                else
                {
                    Response.Redirect("~/TeacherMenu.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('l001 : ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง');</script>");
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/About.aspx");
        }

        protected void btabout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/About.aspx");
        }

    }
}