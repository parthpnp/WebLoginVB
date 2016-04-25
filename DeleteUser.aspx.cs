using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emailid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }
    SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

    protected void btnDeleteUser_Click(object sender, EventArgs e)
    {
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand("delete from [user] where emailid = @emailid", cnn);

            cmd.Parameters.AddWithValue("emailid", email.Text);
            cmd.ExecuteReader();
            Response.Write("Account Deleted Sucessfully");
            cnn.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            // Response.Write("Invalid Username or Password");
        }
        finally
        {
            cnn.Close();
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