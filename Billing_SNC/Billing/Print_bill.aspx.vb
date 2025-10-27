Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms

Public Class Print_bill
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Request.QueryString.Count > 0 Then
                Dim item As String = Request.QueryString.ToString.Substring(0, Request.QueryString.ToString.IndexOf("="))
                Select Case item
                    Case "Payment"
                        If Request.QueryString("Payment") <> Nothing Then
                            load_data(Request.QueryString("Payment").ToString)
                            'txt_from_job_id.Text = Request.QueryString("id").ToString
                        End If
                    Case "Tranfer"
                        If Request.QueryString("Tranfer") <> Nothing Then
                            load_data_tranfer(Request.QueryString("Tranfer").ToString)
                            'txt_from_job_id.Text = Request.QueryString("id").ToString
                        End If
                End Select

            End If
            If FN_Check_expire_password(Session.Item("username")) = True Then
                Response.Redirect("..\Billing\Reset_password.aspx")
            End If
        End If
    End Sub

    Private Sub load_data_tranfer(toString As String)
        Dim ds As DataSet = New DataSet
        Dim sql As String = "select * from Des_invoice where Docnumber='" & toString & "' order by Date_invoice  "
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)



        Dim ds_user As DataSet = New DataSet
        Dim sql_user As String = "select * from User_bill where Username='" & ds.Tables(0).Rows(0).Item("userCreate").ToString & "' "
        Dim ap_user As SqlDataAdapter = New SqlDataAdapter(sql_user, connection)
        ap_user.Fill(ds_user)


        ReportViewer1.LocalReport.ReportPath = "Billing\Report_rldc\Report_Tranfer.rdlc"
        Dim totals As Double = get_sumtax(ds)

        Dim totalTax As ReportParameter() = New ReportParameter() {New ReportParameter("WithholdingTax", totals)}
        ReportViewer1.LocalReport.SetParameters(totalTax)
        ReportViewer1.LocalReport.DataSources.Clear()
        ReportViewer1.LocalReport.DataSources.Add(New ReportDataSource("DS_Invoice", ds.Tables(0)))

        ReportViewer1.LocalReport.DataSources.Add(New ReportDataSource("DS_User", ds_user.Tables(0)))
        ReportViewer1.LocalReport.Refresh()
    End Sub

    Private Sub load_data(doc As String)
        Dim ds As DataSet = New DataSet
        Dim sql As String = "select * from Des_invoice where Docnumber='" & doc & "' order by Date_invoice   "
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)

        Dim ds_user As DataSet = New DataSet
        Dim sql_user As String = "select * from User_bill where Username='" & ds.Tables(0).Rows(0).Item("userCreate").ToString & "' "
        Dim ap_user As SqlDataAdapter = New SqlDataAdapter(sql_user, connection)
        ap_user.Fill(ds_user)


        ReportViewer1.LocalReport.ReportPath = "Billing\Report_rldc\Report_Bill_Supplier.rdlc"

        ReportViewer1.LocalReport.DataSources.Clear()
        Dim totals As Decimal = get_sumtax(ds)

        Dim totalTax As ReportParameter() = New ReportParameter() {New ReportParameter("WithholdingTax", totals)}
        ReportViewer1.LocalReport.SetParameters(totalTax)
        ReportViewer1.LocalReport.DataSources.Add(New ReportDataSource("DS_Invoice", ds.Tables(0)))

        ReportViewer1.LocalReport.DataSources.Add(New ReportDataSource("DS_User", ds_user.Tables(0)))
        ReportViewer1.LocalReport.Refresh()
    End Sub

    Private Function get_sumtax(ds As DataSet) As Decimal
        '/////////////////////////////////////
        Dim ds_Withholding_Tax As New DataSet
        ds_Withholding_Tax.Tables.Add()
        ds_Withholding_Tax.Tables(0).Columns.Add("withholdingTax", GetType(Decimal))
        ds_Withholding_Tax.Tables(0).Columns.Add("taxrate", GetType(Decimal))
        ds_Withholding_Tax.Tables(0).Columns.Add("total", GetType(Decimal))
        Dim wt As Decimal = 0.00, tr As Decimal = 0.00, totaltax As Decimal = 0.00
        For i = 0 To ds.Tables(0).Rows.Count - 1
            If ds_Withholding_Tax.Tables(0).Rows.Count > 0 Then
                Dim Badd As Boolean = False
                wt = 0
                tr = 0
                totaltax = 0
                For j = 0 To ds_Withholding_Tax.Tables(0).Rows.Count - 1
                    If CDbl(ds.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "")) = CDbl(ds_Withholding_Tax.Tables(0).Rows(j).Item("taxrate").ToString) Then
                        Badd = True
                        wt = CDbl(ds_Withholding_Tax.Tables(0).Rows(j).Item("withholdingTax").ToString)
                        wt = wt + ds.Tables(0).Rows(i).Item("amount_money")
                        tr = ds.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "")
                        totaltax = (wt * tr) / 100
                        totaltax = Math.Round(totaltax, 2, MidpointRounding.AwayFromZero)

                        ds_Withholding_Tax.Tables(0).Rows(j).Item("withholdingTax") = wt
                        ds_Withholding_Tax.Tables(0).Rows(j).Item("taxrate") = tr
                        ds_Withholding_Tax.Tables(0).Rows(j).Item("total") = totaltax
                        Exit For
                    End If
                Next
                If Badd = False Then
                    wt = ds.Tables(0).Rows(i).Item("amount_money")
                    tr = ds.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "")
                    totaltax = (wt * tr) / 100
                    totaltax = Math.Round(totaltax, 2, MidpointRounding.AwayFromZero)

                    ds_Withholding_Tax.Tables(0).Rows.Add(wt, tr, totaltax)
                End If
            Else
                wt = ds.Tables(0).Rows(i).Item("amount_money")
                tr = ds.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "")
                totaltax = (wt * tr) / 100
                totaltax = Math.Round(totaltax, 2, MidpointRounding.AwayFromZero)

                ds_Withholding_Tax.Tables(0).Rows.Add(wt, tr, totaltax)
            End If
        Next
        Dim totals_a As Double = 0
        If ds_Withholding_Tax.Tables(0).Rows.Count > 0 Then
            For i = 0 To ds_Withholding_Tax.Tables(0).Rows.Count - 1
                totals_a += CDbl(ds_Withholding_Tax.Tables(0).Rows(i).Item("total"))
            Next
        End If
        '////////////////////////////
        Return totals_a

    End Function
End Class