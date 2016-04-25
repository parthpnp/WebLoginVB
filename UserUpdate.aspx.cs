using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserUpdate : System.Web.UI.Page
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
    protected void btnUpdateProfile_Click(object sender, EventArgs e)
    {
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand("update [user] set f_name = @f_name, dob = @dob, gender = @gender, merital_status = @merital_status, password = @password where emailid = @emailid ", cnn);

            cmd.Parameters.AddWithValue("f_name", FirstName.Text);
            cmd.Parameters.AddWithValue("dob", dob.Text);
            cmd.Parameters.AddWithValue("gender", Gender.SelectedValue);
            cmd.Parameters.AddWithValue("merital_status", Merital_status.SelectedValue);
            cmd.Parameters.AddWithValue("emailid", Session["emailid"]);
            cmd.Parameters.AddWithValue("password", md5Hash.ComputeHash(Encoding.UTF8.GetBytes(password.Text)));
            cmd.ExecuteReader();
            Response.Write("Profile Updated Sccessfully");
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