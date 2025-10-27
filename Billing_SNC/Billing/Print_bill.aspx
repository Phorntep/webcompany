<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Print_bill.aspx.vb" Inherits="Billing_SNC.Print_bill" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <br />
    <br />
    <br />
    <div style="background-color:white;width:750px;margin:0 auto; height:1200px;">
       <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="100%"  ClientIDMode="AutoID" >
           <%--           
            <LocalReport ReportPath="Billing\Report_rldc\Report_Bill_Supplier.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet2" />
                </DataSources>
            </LocalReport>
             --%>
       </rsweb:ReportViewer> 
      
    </div> 

</asp:Content>
