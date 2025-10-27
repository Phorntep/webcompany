<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Bill_list_supplier.aspx.vb" Inherits="Billing_SNC.Bill_list_supplier" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
 
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
 
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
