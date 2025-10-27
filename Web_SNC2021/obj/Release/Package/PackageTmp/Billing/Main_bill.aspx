<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Main_bill.aspx.vb" Inherits="Web_SNC.Main_bill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br />
    <div style="width:100%;height:auto;">
         <div style="margin: 0 auto; width:800px;height:1100px;  border: 2px solid  ; margin-top: 70px; border-radius: 5px;background-image: url('../Billing/Image_billing/billing2020.jpg');background-size:cover;background-repeat:repeat-x;position:center;">
              
         </div>
        <br />
        <div style="margin: 0 auto; width:800px; background-color:whitesmoke;padding:5px;border:2px solid black;border-radius:5px; ">
            <div id ="www" runat="server"></div>
        </div>
        <br />
        <br />
        
    </div>
</asp:Content>
