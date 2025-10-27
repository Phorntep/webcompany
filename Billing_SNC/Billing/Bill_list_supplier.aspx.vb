Imports System.Data.SqlClient
Imports System.Drawing.Printing
Imports Microsoft.Reporting.WebForms

Public Class Bill_list_supplier
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then


            Dim ds As DataSet = New DataSet
            Dim sql As String = "select * from Des_invoice where Docnumber='SNC-2020-09-0002' select * from vat where Docnumber='SNC-2020-09-0002'"
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)

            Dim ds_user As DataSet = New DataSet
            Dim sql_user As String = "select * from User_bill where Username='" & ds.Tables(0).Rows(0).Item("userCreate").ToString & "'"
            Dim ap_user As SqlDataAdapter = New SqlDataAdapter(sql_user, connection)
            ap_user.Fill(ds_user)


            ReportViewer1.LocalReport.ReportPath = "Billing\Report_rldc\Report_Bill_Supplier.rdlc"

            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(New ReportDataSource("DS_invioce", ds.Tables(0)))
            ReportViewer1.LocalReport.DataSources.Add(New ReportDataSource("DS_vat", ds.Tables(1)))
            ReportViewer1.LocalReport.DataSources.Add(New ReportDataSource("DS_User", ds_user.Tables(0)))
            ReportViewer1.LocalReport.Refresh()
            If FN_Check_expire_password(Session.Item("username")) = True Then
                Response.Redirect("..\Billing\Reset_password.aspx")
            End If
        End If
    End Sub
End Class