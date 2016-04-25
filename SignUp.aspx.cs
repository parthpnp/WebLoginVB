using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    MD5 md5Hash = MD5.Create();
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        try
        {
            cnn.Open();
            //SqlCommand cmd = new SqlCommand("select * from student", cnn);
            SqlCommand cmd = new SqlCommand("insert into [user] (f_name,dob,gender,merital_status,username,password,emailid) values (@f_name,@dob,@gender,@merital_status,@username,@password,@emailid)", cnn);

            cmd.Parameters.AddWithValue("f_name", FirstName.Text);
            cmd.Parameters.AddWithValue("dob", dob.Text);
            cmd.Parameters.AddWithValue("gender",Gender.SelectedValue);
            cmd.Parameters.AddWithValue("merital_status",Merital_status.SelectedValue);
            cmd.Parameters.AddWithValue("emailid", email.Text);
            cmd.Parameters.AddWithValue("username", username.Text);
            cmd.Parameters.AddWithValue("password", md5Hash.ComputeHash(Encoding.UTF8.GetBytes(password.Text)));
            cmd.ExecuteReader();
           Response.Write("Account Created Sucessfully");
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
}