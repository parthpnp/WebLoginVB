using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emailid"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        MD5 md5Hash = MD5.Create();
        String email = (String) Session["emailid"];
        try { 
        
        SqlDataReader rdr1 = null;
        cnn.Open();
        SqlCommand cmd1 = new SqlCommand("select * from [user] where emailid=@email ;", cnn);
        cmd1.Parameters.AddWithValue("email", email);
        rdr1 = cmd1.ExecuteReader();

        if (rdr1.Read())
        {
                Label2.Text = rdr1[0].ToString();
                Label4.Text = rdr1[1].ToString();
                Label41.Text = rdr1[1].ToString();
                Label6.Text = rdr1[2].ToString();
                Label8.Text = rdr1[3].ToString();
                Label10.Text = rdr1[4].ToString();
                Label12.Text = rdr1[5].ToString();
            rdr1.Close();
            cnn.Close();
        }
        else
        {
            rdr1.Close();
            cnn.Close();
        }
    }

        catch (Exception ex)
        {
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