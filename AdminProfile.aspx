<%@ Page Title="" Language="C#" MasterPageFile="~/AdminProfile.master" AutoEventWireup="true" CodeFile="AdminProfile.aspx.cs" Inherits="AdminProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<% 
    if(Request.Cookies["lastVisit"] != null)
    Label1.Text = Server.HtmlEncode(Request.Cookies["lastVisit"].Value);
%>
        <form runat="server">
                        <asp:Button ID="logout" runat="server" Text="Log Out" OnClick="logout_Click" OnClientClick="lastVisit()" CssClass="button" />
        </form>
     Last Visit On :<asp:Label ID="Label1" runat="server" Text="NULL"></asp:Label>
    <br />

    <div class="row small-up-2 medium-up-3 large-up-4">
<div class="column">
<a href="main.aspx">
<img class="thumbnail" src="img/3.png">
</a>
<h5>Home</h5>
</div>
<div class="column">
<a href="UpdatePassword.aspx">
<img class="thumbnail" src="img/4.png">
</a>
<h5>Update Password</h5>
</div>
<div class="column">
<a href="AddUser.aspx">
<img class="thumbnail" src="img/2.png">
</a>
<h5>Add User</h5>
</div>
<div class="column">
    <a href="DeleteUser.aspx">
<img class="thumbnail" src="img/1.png">
    </a>
<h5>Delete User</h5>
</div>

<div class="column">
    <a href="UserUpdate.aspx">
<img class="thumbnail" src="img/5.png">
    </a>
<h5>Update User</h5>
</div>
        <script>
            function lastVisit() {
                
<%
    Response.Cookies["lastVisit"].Value = DateTime.Now.ToString();
    Response.Cookies["lastVisit"].Expires = DateTime.Now.AddDays(365);
%>

    }
            </script>

</asp:Content>

