Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Net.Mail

Public Class Forgetpassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btn_success_Click(sender As Object, e As EventArgs)
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then


            If Not String.IsNullOrWhiteSpace(txtEmail.Text) Then
                Dim strusername As String = DetectUser(txtEmail.Text)

                If strusername <> String.Empty Then
                    Dim OTP As Integer = GenarateOTP(txtEmail.Text, strusername)
                    If OTP > 0 Then
                        Dim Smtp_Server As New SmtpClient
                        Dim e_mail As New MailMessage()
                        Smtp_Server.UseDefaultCredentials = False
                        Smtp_Server.Credentials = New Net.NetworkCredential(emailuser, passemail)
                        Smtp_Server.Port = 587
                        Smtp_Server.EnableSsl = False
                        Smtp_Server.Host = "mailsnc01.sncsoundproof.com"
                        e_mail = New MailMessage()
                        e_mail.From = New MailAddress(emailuser)
                        e_mail.To.Add(txtEmail.Text)
                        ' e_mail.To.Add("nattiko6190@gmail.com")
                        e_mail.IsBodyHtml = False
                        Dim sb As New StringBuilder

                        e_mail.Subject = "SNC soundproof Billing Forget password!!!"
                        sb.AppendLine("Reset password")
                        sb.AppendLine("email : " + txtEmail.Text)
                        sb.AppendLine("Username : " + strusername)
                        sb.AppendLine("OTP : " + OTP.ToString)

                        sb.AppendLine("Click Link : http://www.sncsoundproof.com/Billings/Forgetpassword/ResetPassword.aspx?email=" + txtEmail.Text + "&user=" + strusername)
                        e_mail.Body = sb.ToString
                        Smtp_Server.Send(e_mail)

                        txtEmail.Text = ""
                        lbl_message.ForeColor = Color.ForestGreen
                        lbl_message.Text = "The system has sent the information to your email.!!! "
                    End If
                Else
                    lbl_message.Text = "This email could not be found in the system.!!! "
                    lbl_message.ForeColor = Color.Red
                End If
            End If
        End If

    End Sub

    Private Function GenarateOTP(ByVal email As String, ByVal username As String) As Integer
        Dim random As New Random
        'Dim OTP As Integer = CInt(Int((999999 * Rnd()) + 1)) 
        Dim OTP As Integer = random.Next(100000, 999999)
        Dim sql As String = $" INSERT INTO [dbo].[OTPForgetpassword] ([Email], [Username], [OTP], [timeExpire], [Status]) VALUES (N'{email}', N'{username}', {OTP}, GETDATE(), 0)"
        sql += $" insert into Log_Billing values('Request change password :" & username & " ','Forget password','',GETDATE(),'" & username & "')"
        Dim ds As New DataSet
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        Return OTP

    End Function

    Private Function DetectUser(email As String) As String
        Dim sql As String = $"select top(1) * from User_bill where Email='{email}' order by DateStart "
        Dim ds As New DataSet
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            Return ds.Tables(0).Rows(0).Item("Username").ToString
        Else
            Return String.Empty
        End If
    End Function
End Class