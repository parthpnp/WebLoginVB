<%@ Page Title="" Language="C#" MasterPageFile="~/UserProfile.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <% 
    if(Request.Cookies["lastVisitUser"] != null)
    Label13.Text = Server.HtmlEncode(Request.Cookies["lastVisitUser"].Value);
    %>
    <div class="off-canvas-wrapper">
<div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
<div class="off-canvas position-left reveal-for-large" id="my-info" data-off-canvas data-position="left">
<div class="row column">
<br>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/2.png" />

<h5><asp:Label ID="Label41" runat="server" Text="NULL" Font-Bold="True" Font-Size="Large"></asp:Label></h5> <br />
         Last Visit On :<asp:Label ID="Label13" runat="server" Text="NULL"></asp:Label>

</div>
</div>
<div class="off-canvas-content" data-off-canvas-content>
<div class="title-bar hide-for-large">
<div class="title-bar-left">
<button class="menu-icon" type="button" data-open="my-info"></button>
<span class="title-bar-title"></span>
</div>
</div>
<div class="callout primary">
<div class="row column">
<h1>Hello! This is the portfolio of a very witty person.</h1>
</div>
</div><center>
        <asp:Label ID="Label1" runat="server" Text=" Username : " Font-Bold="False" Font-Size="Large"></asp:Label> <asp:Label ID="Label2" runat="server" Text="NULL" Font-Bold="True" Font-Size="Large"></asp:Label> <br />
        <asp:Label ID="Label3" runat="server" Text=" First Name : " Font-Bold="False" Font-Size="Large"></asp:Label> <asp:Label ID="Label4" runat="server" Text="NULL" Font-Bold="True" Font-Size="Large"></asp:Label> <br />
        <asp:Label ID="Label5" runat="server" Text=" Gender : " Font-Bold="False" Font-Size="Large"></asp:Label> <asp:Label ID="Label6" runat="server" Text="NULL" Font-Bold="True" Font-Size="Large"></asp:Label> <br />
        <asp:Label ID="Label7" runat="server" Text=" Date Of Birth : " Font-Bold="False" Font-Size="Large"></asp:Label> <asp:Label ID="Label8" runat="server" Text="NULL" Font-Bold="True" Font-Size="Large"></asp:Label> <br />
        <asp:Label ID="Label9" runat="server" Text=" Email Id : " Font-Bold="False" Font-Size="Large"></asp:Label> <asp:Label ID="Label10" runat="server" Text="NULL" Font-Bold="True" Font-Size="Large"></asp:Label> <br />
        <asp:Label ID="Label11" runat="server" Text="Merital Status : " Font-Bold="False" Font-Size="Large"></asp:Label> <asp:Label ID="Label12" runat="server" Text="NULL" Font-Bold="True" Font-Size="Large"></asp:Label> <br />

</center>
<div class="row small-up-2 medium-up-3 large-up-4">
                        <form runat="server">
                            <asp:Button ID="logout" runat="server" Text="Log Out" OnClick="logout_Click" CssClass="button" OnClientClick="lastVisit()" />
                        </form>
</div>
    <script>
            function lastVisit() {
                
<%
    Response.Cookies["lastVisitUser"].Value = DateTime.Now.ToString();
    Response.Cookies["lastVisitUser"].Expires = DateTime.Now.AddDays(365);
%>

    }
            </script>
</asp:Content>

