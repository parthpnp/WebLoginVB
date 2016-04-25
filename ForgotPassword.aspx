<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <form runat="server">

        <div style="margin-left:60px">
         

          <div class="row collapse">

            

            <div class="small-10  columns">
              <p>
                  Enter your Email ID :
              </p>
              <asp:TextBox Id="email" runat="server" placeholder="Email Id" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email ID Required." ControlToValidate="email" ViewStateMode="Disabled" ValidateRequestMode="Inherit" ForeColor="red"></asp:RequiredFieldValidator> 
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Proper Email Id" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ViewStateMode="Disabled" ForeColor="Red"></asp:RegularExpressionValidator>

             

        
              <asp:Button ID="btnGenOTP" Text="Get OTP" runat="server" CssClass="button" OnClick="btnGenOTP_Click" />
                </div>
              </div>
            </div>
        </form>

</asp:Content>

