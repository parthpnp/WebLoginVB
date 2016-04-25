using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emailid"] == null)
        {
            Response.Redirect("Login.aspx");
        }

       
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Session.RemoveAll();
        System.Web.Security.FormsAuthentication.SignOut();
        Response.Redirect("Login.aspx");
    }
}