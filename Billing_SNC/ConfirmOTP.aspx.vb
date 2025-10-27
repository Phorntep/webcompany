Imports System.Net.Mail
Imports System.Security.Cryptography
Imports System.Text
Imports System.Net

Public Class ConfirmOTP
    Inherits System.Web.UI.Page
    Private otpCode As String
    Private otpExpiry As DateTime
    Private attemptCount As Integer = 0
    Private Const MaxAttempts As Integer = 5
    Private lockoutTime As DateTime
    Private Const lockoutDuration As Integer = 5 ' in minutes

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Generate OTP when the page loads
            GenerateAndSendOTP("nana.pan.nar@gmail.com")
        End If
    End Sub
    ' Function to generate OTP and send it via email
    Private Sub GenerateAndSendOTP(email As String)
        otpCode = GenerateOTPCode()
        otpExpiry = DateTime.Now.AddMinutes(2) ' OTP expires in 2 minutes
        SendOTPEmail(email, otpCode)
        Session("OTPCode") = otpCode
        Session("OTPExpiry") = otpExpiry
    End Sub

    ' Function to generate a random 6-digit OTP
    Private Function GenerateOTPCode() As String
        Dim otp As String = String.Empty
        Using rng As New RNGCryptoServiceProvider()
            Dim randomNumber As Byte() = New Byte(3) {}
            rng.GetBytes(randomNumber)
            otp = (BitConverter.ToUInt32(randomNumber, 0) Mod 1000000).ToString("D6") ' Ensure 6-digit OTP
        End Using
        Return otp
    End Function

    ' Function to send OTP via email
    Private Sub SendOTPEmail(email As String, otpCode As String)
        Try
            ' กำหนดค่า SMTP Server
            Dim Smtp_Server As New SmtpClient
            Smtp_Server.UseDefaultCredentials = False
            Smtp_Server.Credentials = New Net.NetworkCredential(emailuser, passemail)
            Smtp_Server.Port = 587 ' ใช้พอร์ต 587 สำหรับ TLS
            Smtp_Server.EnableSsl = True ' เปิดใช้งาน SSL/TLS
            Smtp_Server.Host = "mailsnc01.sncsoundproof.com"

            ' สร้างอีเมลข้อความ
            Dim e_mail As New MailMessage()
            e_mail.From = New MailAddress(emailuser)
            e_mail.To.Add(email)
            e_mail.IsBodyHtml = False
            e_mail.Subject = "SNC REGISTER OTP!!!"

            ' สร้างเนื้อหาของอีเมล
            Dim sb As New StringBuilder
            sb.AppendLine("OTP password")
            sb.AppendLine("Email : " + email)
            sb.AppendLine("OTP : " + otpCode)
            e_mail.Body = sb.ToString

            ' ส่งอีเมล
            Smtp_Server.Send(e_mail)

        Catch ex As SmtpException
            ' แสดงข้อความข้อผิดพลาด SMTP
            Response.Write("<script>alert('SMTP Error: " & ex.StatusCode.ToString() & " - " & ex.Message.Replace("'", "\'") & "');</script>")
        Catch ex As Exception
            ' แสดงข้อความข้อผิดพลาดทั่วไป
            Response.Write("<script>alert('Error sending OTP email: " & ex.Message.Replace("'", "\'") & "');</script>")
        End Try
    End Sub




    ' Function to verify OTP on form submission
    Protected Sub VerifyOTP_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim enteredOtp As String = Request.Form("otp")
        Dim sessionOtp As String = Session("OTPCode").ToString()
        Dim expiryTime As DateTime = CType(Session("OTPExpiry"), DateTime)

        ' Check if lockout period is active
        If DateTime.Now < lockoutTime Then
            Response.Write("<script>alert('You are locked out. Please try again later.')</script>")
            Return
        End If

        ' Check if OTP has expired
        If DateTime.Now > expiryTime Then
            Response.Write("<script>alert('OTP has expired.')</script>")
            Return
        End If

        ' Verify OTP
        If enteredOtp = sessionOtp Then
            Response.Write("<script>alert('OTP verified successfully!')</script>")
        Else
            attemptCount += 1
            If attemptCount >= MaxAttempts Then
                lockoutTime = DateTime.Now.AddMinutes(lockoutDuration)
                Response.Write("<script>alert('Too many attempts. Please wait 5 minutes.')</script>")
            Else
                Response.Write("<script>alert('Incorrect OTP. Please try again.')</script>")
            End If
        End If
    End Sub
End Class