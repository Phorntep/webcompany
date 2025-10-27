Imports System.Data.SqlClient

Public Class Billing_confirm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Request.QueryString.Count > 0 Then
                If Request.QueryString.Item("Status").ToString = 1 Then
                    loadgrid()

                End If

            End If
            If FN_Check_expire_password(Session.Item("username")) = True Then
                Response.Redirect("..\Billing\Reset_password.aspx")
            End If
        End If
    End Sub

    Private Sub loadgrid()
        GridView2.DataSource = ds_confirm_payjob
        GridView2.DataBind()

        'ds_confirm_payjob.Clear()


    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs)
        txt_date_invoice.Text = Calendar1.SelectedDate.ToShortDateString
        Calendar1.SelectedDate = "01-01-2000"
        Calendar1.Visible = False
    End Sub

    Protected Sub lnk_get_date_Click(sender As Object, e As EventArgs)
        Calendar1.Visible = True
    End Sub

    Protected Sub btn_confirm_check_Click(sender As Object, e As EventArgs) Handles btn_confirm_check.Click
        Dim ds As New DataSet
        Dim sql As String = ""
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            'For Each row As GridViewRow In GridView2.Rows
            '    Dim lbl_documentnumber As LinkButton = row.FindControl("link_job")
            '    sql += " update Des_invoice set date_confirm=GETDATE(),status_pay= 1,Datetranfer = '" & CDate(txt_date_invoice.Text).ToString("yyyy/MM/dd") & "' where Docnumber='" & lbl_documentnumber.Text & "' "
            '    sql += " insert into Log_Billing values('Confrim Tranfer :" & lbl_documentnumber.Text & " ','Confrim Tranfer','" & lbl_documentnumber.Text & "',GETDATE(),'" & Session.Item("username").ToString & "')"

            'Next
            For i = 0 To ds_confirm_payjob.Tables(0).Rows.Count - 1
                Dim lbl_documentnumber As String = ds_confirm_payjob.Tables(0).Rows(i).Item("Docnumber")
                sql += " update Des_invoice set date_confirm=GETDATE(),status_pay= 1,Datetranfer = '" & CDate(txt_date_invoice.Text).ToString("yyyy/MM/dd") & "',check_send_email_Confirm=1   where Docnumber='" & lbl_documentnumber & "' "
                sql += " insert into Log_Billing values('Confrim Tranfer :" & lbl_documentnumber & " ','Confrim Tranfer','" & lbl_documentnumber & "',GETDATE(),'" & Session.Item("username").ToString & "')"

            Next
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            'For Each row As GridViewRow In GridView2.Rows
            '    Dim lbl_documentnumber As LinkButton = row.FindControl("link_job")

            '    send_email_Tranfer_all(get_owner_Email(lbl_documentnumber.Text), lbl_documentnumber.Text, CDate(txt_date_invoice.Text).ToString("yyyy/MM/dd"), "Confirm")
            'Next
            ds_confirm_payjob.Clear()
            Response.Redirect("..\Billing\Billing_all1.aspx")
        End If
    End Sub

    Function get_owner_Email(user As String)
        Dim ds As New DataSet
        Dim sql As String = "select email Des_invoice where Username='" & user & "'"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        Return ds.Tables(0).Rows(0).Item("Email").ToString
    End Function

End Class