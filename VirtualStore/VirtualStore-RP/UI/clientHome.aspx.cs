using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualStore_RP.UI
{
    public partial class clientHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null || Session["UserId"] == null || Session["UserType"] == null || Session["UserEmail"].ToString().Length == 0 || Session["UserId"].ToString().Length == 0 ||
                Session["UserType"].ToString().Length == 0)
            {
                Response.Redirect("index.aspx");
            }
            if (Session["UserType"].ToString() != "client")
            {
                Response.Redirect("home.aspx");
            }
        }
    }
}