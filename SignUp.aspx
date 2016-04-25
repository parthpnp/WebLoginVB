<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <style>
        .signup-panel {

  border-radius: 5px;

  border: 1px solid #ccc;

  padding: 15px;

  margin-top: 15px;
  margin-bottom: 15px;

}

.signup-panel i {

  font-size: 30px;

  line-height: 50px;

  color: #999;

}

.signup-panel form input, .signup-panel form span {

  height: 50px;

}

.signup-panel .welcome {

  font-size: 26px;

  text-align: center;

  margin-left: 0;

}

.signup-panel p {

  font-size: 13px;

  font-weight: 200;

  margin-left: 25%;

}

.signup-panel .button {

  margin-left: 40%;

}

    </style>
     <div class="row" style="margin-left:30%">

    <div class="large-6 columns">

      <div class="signup-panel">

        <p class="welcome"> Welcome to LMS awesome app!</p>
         
        <form runat="server">

        <div style="margin-left:60px">
          <div class="row collapse">


            <div class="small-10  columns">

              <asp:TextBox Id="username" runat="server" placeholder="username" />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Username Required." ControlToValidate="username" ViewStateMode="Disabled" ValidateRequestMode="Inherit" ForeColor="red"></asp:RequiredFieldValidator>

            </div>

          </div>

          <div class="row collapse">

            

            <div class="small-10  columns">
              
              <asp:TextBox Id="email" runat="server" placeholder="Email Id" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email ID Required." ControlToValidate="email" ViewStateMode="Disabled" ValidateRequestMode="Inherit" ForeColor="red"></asp:RequiredFieldValidator> 
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Proper Email Id" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ViewStateMode="Disabled" ForeColor="Red"></asp:RegularExpressionValidator>

            </div> 

          </div>

          <div class="row collapse">

          

            <div class="small-10 columns ">
               <asp:TextBox Id="password" runat="server" placeholder="Password" />
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password Required." ControlToValidate="Password" ViewStateMode="Disabled" ValidateRequestMode="Inherit" ForeColor="red"></asp:RequiredFieldValidator> 

            </div>

                           <div class="small-10 columns ">
               <asp:TextBox Id="FirstName" runat="server" placeholder="First Name" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="First Name Required." ControlToValidate="FirstName" ViewStateMode="Disabled" ValidateRequestMode="Inherit" ForeColor="red"></asp:RequiredFieldValidator> 

            </div>
            <div class="small-10 columns ">
                <asp:DropDownList ID="Gender" runat="server">
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                    <asp:ListItem Value="Other">Other</asp:ListItem>
                </asp:DropDownList>
              

            </div>
             
               <div class="small-10 columns ">
                <asp:DropDownList ID="Merital_status" runat="server">
                    <asp:ListItem Value="Merried">Merried</asp:ListItem>
                    <asp:ListItem Value="Un-Merried">Un-Merried</asp:ListItem>
                </asp:DropDownList>
              

            </div>
                           
             <div class="small-10 columns ">
              <asp:TextBox Id="dob" runat="server" placeholder="Date of Birth (DD/MM/YYYY)" />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Date of Birth Required." ControlToValidate="dob" ViewStateMode="Disabled" ValidateRequestMode="Inherit" ForeColor="red"></asp:RequiredFieldValidator>

            </div>
          </div>
        </div>
              <asp:Button ID="btnSignUp" Text="Sign Up" runat="server" CssClass="button" OnClick="btnSignUp_Click" />
        </form>

         <p>Already have an account? <a href="login.aspx">Login here &raquo</a></p>

      </div>

    </div>

   </div>

</asp:Content>

