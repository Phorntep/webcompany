Imports System.Data.SqlClient
Imports System.Security.Cryptography

Public Class Register_snc_resp
    Inherits System.Web.UI.Page
    Dim enSCIIEncode As New System.Text.ASCIIEncoding
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtusername.Text = String.Empty
            txtpassword.Text = String.Empty
            txtconfirmPass.Text = String.Empty
            txtCompany.Text = String.Empty
            txtaddress.Text = String.Empty
            txtPhone.Text = String.Empty
            txtSupplier.Text = String.Empty
            txt_email.Text = String.Empty
        End If
        txtpassword.Attributes("value") = txtpassword.Text
        txtconfirmPass.Attributes("value") = txtconfirmPass.Text
    End Sub

    Protected Sub txtusername_TextChanged(sender As Object, e As EventArgs)
        Dim bCheckUSer As Boolean = Checkusername(txtusername.Text)
    End Sub

    Function Checkusername(ByVal username As String) As Boolean
        Dim b_user As Boolean = False
        txtusername.CssClass = txtusername.CssClass.Replace("is-invalid", "")
        txtusername.CssClass = txtusername.CssClass.Replace("is-valid", "")
        If Not String.IsNullOrWhiteSpace(txtusername.Text) And txtusername.Text.Length > 4 Then

            Dim ds As New DataSet
            Dim sql As String = $"select * from User_bill where Username ='{username}'"

            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            If ds.Tables(0).Rows.Count > 0 Then
                txtusername.CssClass += "is-invalid"
                b_user = False
            Else
                txtusername.CssClass += "is-valid"
                b_user = True
            End If

        Else
            txtusername.CssClass += "is-invalid"
            b_user = False
        End If
        Return b_user
    End Function

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Dim bCheckUSer As Boolean = Checkusername(txtusername.Text)
        Dim b_email As Boolean = CheckEmail(txt_email.Text)
        If bCheckUSer And b_email Then
            If txtpassword.Text = txtconfirmPass.Text Then
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "a", "showModel();", True)
            End If
        End If
    End Sub
    Protected Sub btnSave_Click1(sender As Object, e As EventArgs)
        Dim bCheckUSer As Boolean = Checkusername(txtusername.Text)
        Dim b_email As Boolean = CheckEmail(txt_email.Text)
        If bCheckUSer And b_email Then
            Dim bpassword As Boolean = match_password(txtpassword.Text, txtconfirmPass.Text)
            If bpassword Then
                Try
                    Dim ds As DataSet = New DataSet
                    Dim sql As String = "insert into User_bill values('" & txtusername.Text & "','" & Encrypt(txtpassword.Text, key) & "','" & txtCompany.Text.Replace("'", "''") & "','" & txtSupplier.Text.Replace("'", "''") & "',0,GETDATE(),'" & txtaddress.Text.Replace("'", "''") & "','" & txtPhone.Text.Replace("'", "''") & "',1,'User',GETDATE(),null,'" & txt_email.Text.Replace("'", "''") & "')"
                    sql += " insert into Log_Billing values('Resgister User " & txtusername.Text & "','Register','',GETDATE(),'')"
                    Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                    'ap.Fill(ds)
                    send_email_Register(get_current_email, txtusername.Text, "")
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_save_data_success", "alert_save_data_success();", True)
                    '  Response.Redirect("..\Billing\Main_bill.aspx")
                Catch ex As Exception
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_not_save", "alert_not_save();", True)
                End Try
            Else
                txtpassword.CssClass = txtpassword.CssClass.Replace("is-invalid", "")
                txtconfirmPass.CssClass = txtconfirmPass.CssClass.Replace("is-invalid", "")

            End If
        End If
    End Sub

    Private Function match_password(ByVal fPass As String, ByVal sPass As String) As Boolean
        txtpassword.CssClass = txtpassword.CssClass.Replace("is-invalid", "")
        txtconfirmPass.CssClass = txtconfirmPass.CssClass.Replace("is-invalid", "")
        txtpassword.CssClass = txtpassword.CssClass.Replace("is-valid", "")
        txtconfirmPass.CssClass = txtconfirmPass.CssClass.Replace("is-valid", "")

        If fPass = sPass Then
            If Not Regex.IsMatch(txtusername.Text, "^[a-zA-Z0-9'.]{7,25}$") Then
                txtpassword.CssClass += "is-valid"
                txtconfirmPass.CssClass += "is-valid"
                Return True
            Else
                Return False
            End If

        Else
            txtpassword.CssClass += "is-invalid"
            txtconfirmPass.CssClass += "is-invalid"
            Return False
        End If

    End Function

    Protected Sub txt_email_TextChanged(sender As Object, e As EventArgs)
        Dim b_email As Boolean = CheckEmail(txt_email.Text)
    End Sub
    Function CheckEmail(ByVal email As String) As Boolean
        Dim b_email As Boolean = False
        txt_email.CssClass = txt_email.CssClass.Replace("is-invalid", "")
        txt_email.CssClass = txt_email.CssClass.Replace("is-valid", "")
        If Not String.IsNullOrWhiteSpace(txt_email.Text) Then

            Dim ds As New DataSet
            Dim sql As String = $"select * from User_bill where email ='{email}'"
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            If ds.Tables(0).Rows.Count > 0 Then
                txt_email.CssClass += "is-invalid"
                b_email = False
            Else
                txt_email.CssClass += "is-valid"
                b_email = True
            End If
        Else
            txt_email.CssClass += "is-invalid"
            b_email = False
        End If
        Return b_email
    End Function
    Protected Sub txtconfirmPass_TextChanged(sender As Object, e As EventArgs)
        Dim bpassword As Boolean = match_password(txtpassword.Text, txtconfirmPass.Text)
    End Sub


    Function EnASCII_MD51(str As String)
        'Dim ASCIIenc As New ASCIIEncoding
        'Dim strReturn As String = ""
        'Dim ByteSourceText() As Byte = ASCIIenc.GetBytes(str)
        'Dim Md5Hash As New MD5CryptoServiceProvider
        'Dim ByteHash() As Byte = Md5Hash.ComputeHash(ByteSourceText)
        'For Each b As Byte In ByteHash
        '    strReturn = strReturn & b.ToString("x2")
        'Next
        'Return strReturn
        '**********************************************
        Dim md5Provider As New MD5CryptoServiceProvider
        Dim EnASCII As Byte() = enSCIIEncode.GetBytes(str)
        Dim encryteddata As Byte() = md5Provider.ComputeHash(EnASCII)
        Dim encrytrdpassword As String = Convert.ToBase64String(encryteddata)
        Return encrytrdpassword
    End Function

#Region "Enctyption & Dectyption : MD5"


    Private Shared DES As New TripleDESCryptoServiceProvider
    Private Shared MD5 As New MD5CryptoServiceProvider
    Public Shared Function MD5Hash(ByVal value As String) As Byte()
        Return MD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(value)) ' convert key to hash
    End Function
    Public Function Encrypt(ByVal stringToEncrypt As String, ByVal key As String) As String
        DES.Key = Crypto.MD5Hash(key) 'set key extention byte from MD5Hash
        DES.Mode = CipherMode.ECB ' set mode ECB = 2
        Dim Buffer As Byte() = ASCIIEncoding.ASCII.GetBytes(stringToEncrypt) ' convert text to byte array
        Return Convert.ToBase64String(DES.CreateEncryptor().TransformFinalBlock(Buffer, 0, Buffer.Length)) 'return string of convert from byte enctyption
    End Function
    Public Function Decrypt(ByVal encryptedString As String, ByVal key As String) As String
        Try
            DES.Key = Crypto.MD5Hash(key) 'set key extention byte from MD5Hash
            DES.Mode = CipherMode.ECB ' set mode ECB = 2
            Dim Buffer As Byte() = Convert.FromBase64String(encryptedString) ' convert text to byte array
            Return ASCIIEncoding.ASCII.GetString(DES.CreateDecryptor().TransformFinalBlock(Buffer, 0, Buffer.Length)) 'return string of convert from byte dectyption
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_Error_crypTO", "alert_Error_crypTO();", True) ' if key not math .Alert Error
            'MessageBox.Show("Invalid Key", "Decryption Failed", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)

        End Try
    End Function


#End Region
End Class