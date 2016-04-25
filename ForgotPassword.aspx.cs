using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

    protected void btnGenOTP_Click(object sender, EventArgs e)
    {
        try
        {
            Random rnd = new Random();
            int otp_number = rnd.Next(1000, 10000);
            SqlDataReader rdr = null;
            cnn.Open();
            SqlCommand cmd = new SqlCommand("select * from [user] where emailid=@emailid ;", cnn);
            cmd.Parameters.AddWithValue("emailid", email.Text);
            rdr = cmd.ExecuteReader();
            rdr.Read();
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            mail.From = new MailAddress("parth.pnp@gmail.com");
            mail.To.Add(rdr[4].ToString());
            mail.Subject = "Forgoten Password";
            mail.Body = "Please Enter the given OTP in your field ---> " + otp_number;
            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("parth.pnp3@gmail.com", "pnp@gmail");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
          //  MessageBox.Show("mail Send");
            cnn.Close();
            cnn.Open();
            cmd = new SqlCommand("update [user] set otp=@otp where emailid=@emailid and pincode=@pincode ;", cnn);
            cmd.Parameters.AddWithValue("emailid", email.Text);
            cmd.Parameters.AddWithValue("otp", otp_number);
            cmd.ExecuteNonQuery();
            // MessageBox.Show(rdr.GetSqlValue(0).ToString());
           // otp.Visible = true;
            //Reset_New_password.Visible = true;
            rdr.Close();

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);

        }
        finally
        {
            cnn.Close();
        }
    }
}