<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Billing_all.aspx.vb" Inherits="Web_SNC.Billing_all" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" />

<asp:Button ID="btnUpload" runat="server" Text="Upload"

            OnClick="btnUpload_Click" />

<br />

<asp:Label ID="Label1" runat="server" Text="Has Header ?" />

<asp:RadioButtonList ID="rbHDR" runat="server">

    <asp:ListItem Text = "Yes" Value = "Yes" Selected = "True" >

    </asp:ListItem>

    <asp:ListItem Text = "No" Value = "No"></asp:ListItem>

</asp:RadioButtonList>

<asp:GridView ID="GridView1" runat="server"

OnPageIndexChanging ="GridView1_PageIndexChanging" AllowPaging = "true">

</asp:GridView>
</asp:Content>
