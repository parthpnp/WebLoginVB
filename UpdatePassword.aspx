<%@ Page Title="" Language="C#" MasterPageFile="~/AdminProfile.master" AutoEventWireup="true" CodeFile="UpdatePassword.aspx.cs" Inherits="UpdatePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <form runat="server">

        <div style="margin-left:60px">
         

          <div class="row collapse">

            

            <div class="small-10  columns">
              
              <asp:TextBox Id="email" runat="server" placeholder="Email Id" ValidationGroup="logout"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email ID Required." ControlToValidate="email" ViewStateMode="Disabled" ValidateRequestMode="Inherit" ForeColor="red"></asp:RequiredFieldValidator> 
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Proper Email Id" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ViewStateMode="Disabled" ForeColor="Red"></asp:RegularExpressionValidator>

            </div> 

          </div>

          <div class="row collapse">

          

            <div class="small-10 columns ">
               <asp:TextBox Id="password" runat="server" placeholder="New Password" ValidationGroup="logout"/>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password Required." ControlToValidate="Password" ViewStateMode="Disabled" ValidateRequestMode="Inherit" ForeColor="red"></asp:RequiredFieldValidator> 

            

                         
            
              

           
                           
             
         
              <asp:Button ID="btnUpdatePassword" Text="Update Password" runat="server" CssClass="button" OnClick="btnUpdatePassword_Click" />
              </div>
               </div>
        </div>
                                <asp:Button ID="logout" runat="server" Text="Log Out" OnClick="logout_Click" CssClass="button" ValidationGroup="logout"/>

        </form>

</asp:Content>

