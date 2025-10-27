Imports System.Data.SqlClient
Imports System.Drawing

Public Class ResetPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Request.QueryString.Count > 0 Then
                If Request.QueryString("email") <> Nothing Then
                    Dim email = Request.QueryString("email").ToString
                    txtEmail.Text = email
                End If
            End If
        End If
    End Sub

    Protected Sub btn_success_Click(sender As Object, e As EventArgs)

        If Not String.IsNullOrWhiteSpace(txt_password.Text) AndAlso Not String.IsNullOrWhiteSpace(txt_OTP.Text) AndAlso Not String.IsNullOrWhiteSpace(txtEmail.Text) Then
            If txt_password.Text = txt_passwordConfrim.Text Then
                If txt_password.Text.Length >= 4 Then
                    Dim _checkExpiredate As Boolean = checkExpiredate(CInt(txt_OTP.Text), txtEmail.Text)
                    If _checkExpiredate Then

                        Try
                            Dim username As String = Request.QueryString("user").ToString
                            If username <> String.Empty Then
                                Dim sql As String = $"Update User_bill set Password='{Crypto.Encrypt(txt_password.Text, key)}',time_out=GETDATE() where Email='{txtEmail.Text}' and username = '{username}' "
                                sql += $" Update OTPForgetpassword set Status=1 where Email='{txtEmail.Text}' and username = '{username}' and OTP = {txt_OTP.Text} "
                                sql += $" insert into Log_Billing values('User Reset password :" & username & " ','Forget password','',GETDATE(),'" & username & "')"
                                Dim ds As DataSet = qeury(sql)
                                txt_OTP.Text = ""
                                lbl_message.Text = "Change password Complete!!!"
                                lbl_message.ForeColor = Color.ForestGreen
                            End If
                        Catch ex As Exception
                            txt_OTP.Text = ""
                            lbl_message.Text = "Change password Fail !!!"
                            lbl_message.ForeColor = Color.Red
                        End Try


                    Else
                        txt_OTP.Text = ""
                        lbl_message.Text = "OTP Expire!!"
                        lbl_message.ForeColor = Color.Red
                    End If
                Else
                    txt_OTP.Text = ""
                    lbl_message.Text = "Please enter more than 4 characters.!!"
                    lbl_message.ForeColor = Color.Red
                End If
            Else
                txt_OTP.Text = ""
                lbl_message.Text = "Password not match!!"
                lbl_message.ForeColor = Color.Red
            End If
        Else
            txt_OTP.Text = ""
            lbl_message.Text = "Please Key data!!"
            lbl_message.ForeColor = Color.Red
        End If
    End Sub

    Private Function checkExpiredate(ByVal OTP As Integer, ByVal email As String) As Boolean
        Dim sql As String = $"select * from OTPForgetpassword where Email='{email}' and OTP ={OTP}"
        Dim ds As DataSet = qeury(sql)
        If ds.Tables(0).Rows.Count > 0 Then
            Dim _dateOTP As Date = CDate(ds.Tables(0).Rows(0).Item("timeExpire"))
            Dim _dateNow As Date = Date.Now
            _dateOTP = _dateOTP.AddMinutes(5)
            If _dateOTP > _dateNow Then
                Return True
            Else
                Return False
            End If
        Else
            Return False
        End If
    End Function

    Public Function qeury(ByVal sql As String) As DataSet
        Dim ds = New DataSet
        Try

            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            Return ds
        Catch ex As Exception
            Return ds
        End Try
    End Function


End Class