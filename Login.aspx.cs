using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    MD5 md5Hash = MD5.Create();
    protected void login_Click(object sender, EventArgs e)
    {
        try
        {

            String uname = emailid.Text;
            // User_Page userpage = new User_Page(uname);
            SqlDataReader rdr = null;
            cnn.Open();
            //SqlCommand cmd = new SqlCommand("select * from student", cnn);
            SqlCommand cmd = new SqlCommand("select * from admin where username=@username and password=@password ;", cnn);
            cmd.Parameters.AddWithValue("username", emailid.Text);
            cmd.Parameters.AddWithValue("password", password.Text);
            rdr = cmd.ExecuteReader();
            // MessageBox.Show(rdr.GetSqlValue(0).ToString());
            if (rdr.Read())
            {
                Session["emailid"] = emailid.Text;
                Response.Redirect("AdminProfile.aspx");
                rdr.Close();
            }

            else
            {
                rdr.Close();
                cnn.Close();
                SqlDataReader rdr1 = null;
                cnn.Open();
                SqlCommand cmd1 = new SqlCommand("select * from [user] where emailid=@username and password=@1password ;", cnn);
                cmd1.Parameters.AddWithValue("username", emailid.Text);
                cmd1.Parameters.AddWithValue("1password", md5Hash.ComputeHash(Encoding.UTF8.GetBytes(password.Text)));
                rdr1 = cmd1.ExecuteReader();

                if (rdr1.Read())
                {
                    Session["emailid"] = emailid.Text;
                    Response.Redirect("user.aspx");
                    rdr1.Close();
                    cnn.Close();
                }
                else
                {
                    Response.Write("Wrong Email id and/or Password");
                    rdr1.Close();
                    cnn.Close();
                }
            }

        }
        catch (Exception)
        {
                                Response.Write("Wrong Email id and/or Password");
        }
        finally
        {
         
            cnn.Close();
        }
    }
}