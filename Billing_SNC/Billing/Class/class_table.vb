Imports System.Data.SqlClient

Public Class class_table
    'Friend ds_bill_supplierV2 As DataSet, ds_vat As DataSet, ds_usermange As DataSet, ds_billing_list As DataSet
    Public bcheck_create_job As Boolean = False
    Protected Friend Function get_and_Check_JobID() As String
        Dim id_job_check As String
        Dim ds As DataSet = New DataSet
        ' Dim sql As String = "select * from Des_invoice order by id desc"
        Dim sql As String = "select * from Des_invoice order by Docnumber desc"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            Dim id As String = ds.Tables(0).Rows(0).Item("Docnumber").ToString.Replace("SNC-", "")
            Dim date_N As DateTime = Date.Now.ToShortDateString
            If id.Substring(id.IndexOf("-") + 1, 2) = date_N.ToString("MM") Then
                Dim Runnum As Integer = CInt(id.Substring(id.LastIndexOf("-") + 1, 4)) + 1
                Dim format_Runnum As String = Runnum.ToString("D4")
                Dim year As String = date_N.ToString("yyyy")
                Dim month As String = date_N.ToString("MM")
                Dim id_job As String = "SNC-" + year + "-" + month + "-" + format_Runnum
                'txt_job_id.Text = id_job
                id_job_check = id_job
            Else
                Dim Runnum As Integer = 1
                Dim format_Runnum As String = Runnum.ToString("D4")
                Dim month As String = date_N.ToString("MM")
                Dim year As String = date_N.ToString("yyyy")
                Dim id_job As String = "SNC-" + year + "-" + month + "-" + format_Runnum
                'txt_job_id.Text = id_job
                id_job_check = id_job
            End If
        Else
            Dim Runnum As Integer = 1
            Dim format_Runnum As String = Runnum.ToString("D4")
            Dim date_N As DateTime = Date.Now.ToShortDateString
            Dim month As String = date_N.ToString("MM")
            Dim year As String = date_N.ToString("yyyy")
            Dim id_job As String = "SNC-" + year + "-" + month + "-" + format_Runnum
            'txt_job_id.Text = id_job
            id_job_check = id_job
        End If
        'txt_pay_rate.Text = ""
        ' txt_rate_vat.Text = ""
        Return id_job_check

    End Function
End Class
