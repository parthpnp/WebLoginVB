<%@ Page Title="" Language="C#" MasterPageFile="~/AdminProfile.master" AutoEventWireup="true" CodeFile="DeleteUser.aspx.cs" Inherits="DeleteUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <form runat="server">

        <div style="margin-left:60px">
         

          <div class="row collapse">

            

            <div class="small-10  columns">
              <p>
                  Enter the Email Id Of User of Whome Account you want to Delete :
              </p>
              <asp:TextBox Id="email" runat="server" placeholder="Email Id" ValidationGroup="logout" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email ID Required." ControlToValidate="email" ViewStateMode="Disabled" ValidateRequestMode="Inherit" ForeColor="red"></asp:RequiredFieldValidator> 
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Proper Email Id" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ViewStateMode="Disabled" ForeColor="Red"></asp:RegularExpressionValidator>

             

          
            
              <asp:Button ID="btnDeleteUser" Text="Delete User" runat="server" CssClass="button" OnClick="btnDeleteUser_Click" />
                </div>
              </div>
            </div>
                              <asp:Button ID="logout" runat="server" Text="Log Out" OnClick="logout_Click" CssClass="button" ValidationGroup="logout" />
      </form>

</asp:Content>

