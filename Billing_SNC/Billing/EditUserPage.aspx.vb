Option Explicit On
Option Strict On
Imports System.Data.SqlClient

Public Class EditUserPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim username As String = CType(Session.Item("username"), String)
            Dim sql As String = $"select * from User_bill where Username ='{username}'"
            Dim ds = New DataSet
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            If ds.Tables(0).Rows.Count > 0 Then
                txtusername.Text = ds.Tables(0).Rows(0).Item("Username").ToString
                txtpassword.Attributes.Add("value", Crypto.Decrypt(ds.Tables(0).Rows(0).Item("Password").ToString, key))
                txtconfirmPass.Attributes.Add("value", Crypto.Decrypt(ds.Tables(0).Rows(0).Item("Password").ToString, key))
                txtCompany.Text = ds.Tables(0).Rows(0).Item("Company").ToString
                txtSupplier.Text = ds.Tables(0).Rows(0).Item("Supplier").ToString
                txtaddress.Text = ds.Tables(0).Rows(0).Item("Address").ToString
                txtPhone.Text = ds.Tables(0).Rows(0).Item("Tel").ToString
                txt_email.Text = ds.Tables(0).Rows(0).Item("Email").ToString
            End If
        End If

    End Sub

    Protected Sub btn_success_Click(sender As Object, e As EventArgs) Handles btn_success.Click
        'btn_success.Attributes.Add("onclick", "fnConfirm();")

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "OpenModel", "OpenModel();", True)
        'If txtpassword.Text = txtconfirmPass.Text Then
        '    If Not String.IsNullOrWhiteSpace(txtpassword.Text) Then
        '        Dim sql As String = $"Update User_bill set Password='{Crypto.Encrypt(txtpassword.Text, key)}', Company='{txtCompany.Text.ToString.Replace("'", "''")}', Supplier = '{txtSupplier.Text.Replace("'", "''")}',time_out=GETDATE(),Address='{txtaddress.Text.ToString.Replace("'", "''")}',Tel='{txtPhone.Text}' ,Email='{txt_email.Text.ToString.Replace("'", "''")}' where Username='{txtusername.Text}3'"

        '        Using cons As SqlConnection = New SqlConnection(connection)
        '            cons.Open()
        '            Dim app As SqlCommand = New SqlCommand(sql, cons)

        '            If app.ExecuteNonQuery() > 0 Then
        '                Dim a As String = "2"
        '            Else
        '                Dim a As String = "1"

        '            End If
        '            cons.Close()
        '        End Using

        '    Else
        '        'not white space
        '    End If

        '    End If


        'Dim confirmValue As String = Request.Form("confirm_value")
        'If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
        '    Dim ds As DataSet = New DataSet
        '    Dim sql As String
        '    Dim ap As SqlDataAdapter
        '    If txtpassword.Text.Length >= 4 Then
        '        If txtpassword.Text = txtconfirmPass.Text Then
        '            sql = "Update User_bill set Password='" & Crypto.Encrypt(txtpassword.Text, key) & "', Company='" & txtCompany.Text.ToString.Replace("'", "''") & "', Supplier = '" & txtSupplier.Text.Replace("'", "''") & "',time_out=GETDATE(),Address='" & txtaddress.Text.ToString.Replace("'", "''") & "',Tel='" & txtPhone.Text & "' ,Email='" & txt_email.Text.ToString.Replace("'", "''") & "' where Username='" & txtusername.Text & "'"
        '            sql += " insert into Log_Billing values('Update & Edit user :" & txtusername.Text & " ','Update & Edit user','',GETDATE(),'" & Session.Item("username").ToString & "')"
        '            ap = New SqlDataAdapter(sql, connection)
        '            '  ap.Fill(ds) 
        '        Else
        '            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_password_not_math", "alert_password_not_math();", True)
        '        End If
        '    Else
        '        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_password_not_math", "alert_password_not_math();", True)
        '    End If
        'End If
    End Sub

    Protected Sub btn_confirm_Edit_Click(sender As Object, e As EventArgs)

        If txtpassword.Text = txtconfirmPass.Text Then
            If Not String.IsNullOrWhiteSpace(txtpassword.Text) Then
                If txtpassword.Text.Length >= 4 Then
                    Dim sql As String = $"Update User_bill set Password='{Crypto.Encrypt(txtpassword.Text, key)}', Company='{txtCompany.Text.ToString.Replace("'", "''")}', Supplier = '{txtSupplier.Text.Replace("'", "''")}',time_out=GETDATE(),Address='{txtaddress.Text.ToString.Replace("'", "''")}',Tel='{txtPhone.Text}' ,Email='{txt_email.Text.ToString.Replace("'", "''")}' where Username='{txtusername.Text}'"
                    sql += " insert into Log_Billing values('User Edit Profile :" & txtusername.Text & " ','User Edit Profile ','',GETDATE(),'" & Session.Item("username").ToString & "')"
                    Using cons As SqlConnection = New SqlConnection(connection)
                        cons.Open()
                        Dim cmd As SqlCommand = New SqlCommand(sql, cons)
                        Dim _int As Integer = cmd.ExecuteNonQuery()
                        If _int > 0 Then
                            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_save_complete", "alert_save_complete();", True)
                        Else
                            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_not_save", "alert_not_save();", True)

                        End If
                        cons.Close()
                    End Using
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_length_text", "alert_length_text();", True)
                End If
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_password_not_math", "alert_password_not_math();", True)
            End If
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_password_not_math", "alert_password_not_math();", True)
        End If


        'Dim confirmValue As String = Request.Form("confirm_value")
        'If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
        '    Dim ds As DataSet = New DataSet
        '    Dim sql As String
        '    Dim ap As SqlDataAdapter
        '    If txtpassword.Text.Length >= 4 Then
        '        If txtpassword.Text = txtconfirmPass.Text Then
        '            sql = "Update User_bill set Password='" & Crypto.Encrypt(txtpassword.Text, key) & "', Company='" & txtCompany.Text.ToString.Replace("'", "''") & "', Supplier = '" & txtSupplier.Text.Replace("'", "''") & "', status='" & dd_status.SelectedValue & "',Address='" & txtaddress.Text.ToString.Replace("'", "''") & "',Tel='" & txtPhone.Text & "',Level=" & ddLevel.SelectedValue & ",Description_lv='" & ddLevel.SelectedItem.Text & "',Email='" & txt_email.Text.ToString.Replace("'", "''") & "' where Username='" & txtusername.Text & "'"
        '            sql += " insert into Log_Billing values('Update & Edit user :" & txtusername.Text & " ','Update & Edit user','',GETDATE(),'" & Session.Item("username").ToString & "')"
        '            ap = New SqlDataAdapter(sql, connection)
        '            'ap.Fill(ds)

        '        Else
        '            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_password_not_math", "alert_password_not_math();", True)
        '        End If
        '    Else
        '        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_password_not_math", "alert_password_not_math();", True)
        '    End If
        'End If
    End Sub
End Class