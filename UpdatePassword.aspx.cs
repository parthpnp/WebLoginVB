using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdatePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emailid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }
    SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    MD5 md5Hash = MD5.Create();
    protected void btnUpdatePassword_Click(object sender, EventArgs e)
    {
        try
        {

            SqlDataReader rdr = null;
            cnn.Open();
            SqlCommand cmd = new SqlCommand("update [user] set password=@password where emailid=@emailid;", cnn);
            cmd.Parameters.AddWithValue("emailid", email.Text);
            cmd.Parameters.AddWithValue("password", md5Hash.ComputeHash(Encoding.UTF8.GetBytes(password.Text)));
            rdr = cmd.ExecuteReader();
            Response.Write("Password Updated.");
        }
        catch (Exception)
        {
            Response.Write("Password could not Updated.");
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