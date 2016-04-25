<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <title>Login | Login Managment System</title>
    <div class="row">

  <div class="medium-6 medium-centered large-4 large-centered columns">



    <form runat="server">

      <div class="row column log-in-form">

        <h4 class="text-center">Log in with you email account</h4>

        <label>Email
          <asp:TextBox ID="emailid" runat="server" placeholder="Email Id"></asp:TextBox>
        </label>

        <label>Password
        <asp:TextBox Id="password" runat="server" placeholder="Password"/>
        </label>
    </div>  
        <p><asp:Button ID="login" runat="server" Text="Log In" CssClass="button" OnClick="login_Click"/>
        <a href="#">Forgot your password?</a></p>
        <p>Don't Have Account Yet,<a href="SignUp.aspx"> Create One Now &raquo</a></p> 

    </form>
</div>
        </div>

</asp:Content>

