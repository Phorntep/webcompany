Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Security.Cryptography

Public Class Register_SNC
    Inherits System.Web.UI.Page
    Dim enSCIIEncode As New System.Text.ASCIIEncoding

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sriptmanagerregister()
    End Sub

    Private Sub sriptmanagerregister()
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        'ScriptManager.RegisterPostBackControl(Me.ddLevel)
        'ScriptManager.RegisterPostBackControl(Me.txtpassword)

    End Sub
    Protected Sub txtusername_TextChanged(sender As Object, e As EventArgs)

        If txtusername.Text <> "" And txtusername.Text.Length > 4 Then

            Dim ds As New DataSet
            Dim sql As String = "select * from User_bill where Username ='" & txtusername.Text & "'"

            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            If ds.Tables(0).Rows.Count > 0 Then
                txtusername.BackColor = Color.Red
                bcheck_user = False
            Else
                txtusername.BackColor = Color.YellowGreen
                bcheck_user = True
            End If
            substring()
        Else
            txtusername.BackColor = Color.Red
            bcheck_user = False
        End If


    End Sub
    Private Sub substring()
        Dim _txtusername As Integer = txtusername.Text.Length
        Dim _txt_email As Integer = txt_email.Text.Length

        For b As Integer = 0 To _txtusername - 1
            Dim z As Integer = b + 1
            Dim set1 As String = String.Empty
            set1 = txtusername.Text.Substring(b, 1)

            If Regex.IsMatch(set1.ToString(), "^[A-Za-z0-9/@/_/.]$") Then
                txtusername.BackColor = Color.YellowGreen
                Dim f As Integer = _txtusername - b
                Dim set2 As String = txtusername.Text.Substring(b, f)
                'MessageBox.Show(set2.ToString())
                'Return
            Else

                bcheck_user = False
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_ ", "alert('Only English & Character(@,_,.)');", True)
                txtusername.Text = ""
                txtusername.BackColor = Color.Red
                Return
            End If
        Next
    End Sub
    Protected Sub btn_cancel_Click(sender As Object, e As EventArgs)
        Response.Redirect("Login_Bill.aspx")
    End Sub

    Protected Sub btn_success_Click(sender As Object, e As EventArgs)
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            If bcheck_user = True Then
                If txtusername.Text.Length <= 25 And txtusername.Text.Contains(" ") <> True Then
                    If txtusername.Text <> "" And txtpassword.Text <> "" And txtconfirmPass.Text <> "" And txtCompany.Text <> "" And txtaddress.Text <> "" And txt_email.Text <> "" Then
                        If txtpassword.Text.Length >= 4 Then
                            If txtpassword.Text = txtconfirmPass.Text Then
                                Try
                                    Dim ds As DataSet = New DataSet
                                    Dim sql As String = "insert into User_bill values('" & txtusername.Text & "','" & Encrypt(txtpassword.Text, key) & "','" & txtCompany.Text.Replace("'", "''") & "','" & txtSupplier.Text.Replace("'", "''") & "',0,GETDATE(),'" & txtaddress.Text.Replace("'", "''") & "','" & txtPhone.Text.Replace("'", "''") & "',1,'User',GETDATE(),null,'" & txt_email.Text.Replace("'", "''") & "')"
                                    sql += " insert into Log_Billing values('Resgister User " & txtusername.Text & "','Register','',GETDATE(),'')"
                                    Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                                    ap.Fill(ds)
                                    send_email_Register(get_current_email, txtusername.Text, "")
                                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_save_data_success", "alert_save_data_success();", True)
                                    '  Response.Redirect("..\Billing\Main_bill.aspx")
                                Catch ex As Exception
                                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_not_save", "alert_not_save();", True)
                                End Try
                            Else
                                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertUser_pass_not_math", "alertUser_pass_not_math();", True)
                            End If
                        Else
                            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_length_text", "alert_length_text();", True)
                        End If
                    Else
                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_Select_all_data", "alert_Select_all_data();", True)
                    End If
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertUser_worng_l_SP", "alertUser_worng_l_SP();", True)
                End If
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertUser_worng", "alertUser_worng();", True)
            End If
            'txtpassword.Text = Encrypt(txtusername.Text, key)
            'txtconfirmPass.Text = Decrypt(txtpassword.Text, key)
        End If
    End Sub

#Region "Enctyption & Dectyption : MD5"
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

    Protected Sub txt_email_TextChanged(sender As Object, e As EventArgs)
        If Not String.IsNullOrWhiteSpace(txt_email.Text) Then

            Dim ds As New DataSet
            Dim sql As String = "select * from User_bill where email ='" & txt_email.Text & "'"
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            If ds.Tables(0).Rows.Count > 0 Then
                txt_email.BackColor = Color.Red
                bcheck_user = False
            Else
                txt_email.BackColor = Color.YellowGreen
                bcheck_user = True
            End If
        Else
            txt_email.BackColor = Color.Red
            bcheck_user = False
        End If
    End Sub
#End Region
End Class