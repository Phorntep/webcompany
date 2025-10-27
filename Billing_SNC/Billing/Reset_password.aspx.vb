Imports System.Data.SqlClient
Imports Billing_SNC.Crypto
Public Class Reset_password
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtusername.Text = Session.Item("username")
        End If
    End Sub

    Protected Sub btn_success_Click(sender As Object, e As EventArgs)
        Dim ds As New DataSet
        Dim sql As String = ""
        Dim ap As SqlDataAdapter
        If txtusername.Text <> "" And txtpassword.Text <> "" And txtconfirmPass.Text <> "" Then
            If txtpassword.Text.Length >= 4 Then
                If txtpassword.Text = txtconfirmPass.Text Then
                    sql = "update User_bill set Password='" & Encrypt(txtpassword.Text, key) & "',time_out=GETDATE() where Username='" & txtusername.Text.Replace("'", "''") & "'"
                    sql += " insert into Log_Billing values('Reset password :" & txtusername.Text & " ','Reset password','" & txtusername.Text & "',GETDATE(),'" & Session.Item("username").ToString & "')"
                    ap = New SqlDataAdapter(sql, connection)
                    ap.Fill(ds)
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_save_data_success", "alert_save_data_success();", True)

                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertUser_pass_not_math", "alertUser_pass_not_math();", True)
                End If
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_length_text", "alert_length_text();", True)
            End If
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_Select_all_data", "alert_Select_all_data();", True)
        End If




    End Sub
End Class