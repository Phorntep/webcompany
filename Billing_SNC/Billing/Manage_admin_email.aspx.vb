Imports System.Data.SqlClient

Public Class Manage_admin_email
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            check_permission()
            Load_email()
            'load_create
            If FN_Check_expire_password(Session.Item("username")) = True Then
                Response.Redirect("..\Billing\Reset_password.aspx")
            End If
        End If
    End Sub

    Private Sub load_create()
        Dim ds As New DataSet
        Dim sql As String = "select * from Setting_billing_create "
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)

        If ds.Tables(0).Rows.Count > 0 Then
            dd_status_function.SelectedIndex = CInt(ds.Tables(0).Rows(0).Item("status_function"))
        End If
    End Sub

    Private Sub check_permission()
        If Session.Count > 0 Then
            If Session.Item("username") <> "" Then
                Dim ds As New DataSet
                Dim sql As String = "select * from User_bill where Username = '" & Session.Item("username") & "'"
                Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                ap.Fill(ds)
                If ds.Tables(0).Rows(0).Item("Level") < 3 Then
                    Response.Redirect("..\Billing\index.aspx")
                End If
            Else
                Response.Redirect("..\Billing\index.aspx")
            End If
        Else
            Response.Redirect("..\Login_Bill.aspx")
        End If
    End Sub
    Private Sub Load_email()
        Dim ds As New DataSet
        Dim sql As String = "select Email,Supplier from User_bill where Level between 2 and 4 "
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        dd_email.DataSource = ds
        dd_email.DataTextField = "Email"
        dd_email.DataValueField = "Email"
        dd_email.DataBind()

        Dim ds_c As New DataSet
        Dim sql_c As String = "select * from CurentEmail_admin"
        Dim ap_c As SqlDataAdapter = New SqlDataAdapter(sql_c, connection)
        ap_c.Fill(ds_c)
        txt_current_email.Text = ds_c.Tables(0).Rows(0).Item("EmailAdmin").ToString

    End Sub

    Protected Sub btn_select_email_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            Dim ds As New DataSet
            Dim sql As String = "update CurentEmail_admin set EmailAdmin='" & dd_email.SelectedItem.Text.Replace("'", "''") & "', Name='' where id = 1"
            sql += " insert into Log_Billing values('Update Current Email :" & dd_email.SelectedItem.Text.Replace("'", "''") & " ','Update Current Email','',GETDATE(),'" & Session.Item("username").ToString & "')"
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_save_data_success", "alert_save_data_success();", True)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_not_save", "alert_not_save();", True)
        End Try

    End Sub

    Protected Sub btn_open_create_Click(sender As Object, e As EventArgs)
        Try
            Dim ds As New DataSet
            Dim sql As String = "update Setting_billing_create set status_function = " & dd_status_function.SelectedValue & ""
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
        Catch ex As Exception

        End Try

    End Sub
End Class