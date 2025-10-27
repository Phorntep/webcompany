Imports System.Data.SqlClient
Imports System.Text
Imports System.Security.Cryptography
Imports System.Drawing

Public Class Register_Bill
    Inherits System.Web.UI.Page
    Dim enSCIIEncode As New System.Text.ASCIIEncoding
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sriptmanagerregister()

        If Not IsPostBack Then
            load_level()
            check_permission()

            If FN_Check_expire_password(Session.Item("username")) = True Then
                Response.Redirect("..\Billing\Reset_password.aspx")
            End If
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

    Private Sub load_level()
        Dim ds As New DataSet
        Dim sql As String = "select * from Permission_Lv"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        ddLevel.DataSource = ds.Tables(0)
        ddLevel.DataTextField = "Discription_Lv"
        ddLevel.DataValueField = "Id_lv"
        ddLevel.DataBind()


    End Sub

    Private Sub sriptmanagerregister()
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        ScriptManager.RegisterPostBackControl(Me.ddLevel)
        'ScriptManager.RegisterPostBackControl(Me.txtpassword)

    End Sub

    Protected Sub btn_success_Click(sender As Object, e As EventArgs)

        'Dim confirmValue As String = Request.Form("confirm_value")
        'If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
        '    If txtusername.Text <> "" And txtpassword.Text <> "" And txtconfirmPass.Text <> "" And txtCompany.Text <> "" And txtaddress.Text <> "" Then
        '        If txtpassword.Text.Length >= 4 Then
        '            If txtpassword.Text = txtconfirmPass.Text Then
        '                Try
        '                    Dim ds As DataSet = New DataSet
        '                    Dim sql As String = "insert into User_bill values('" & txtusername.Text & "','" & Encrypt(txtpassword.Text, key) & "','" & txtCompany.Text & "','" & txtSupplier.Text & "',1,GETDATE(),'" & txtaddress.Text & "','" & txtPhone.Text & "'," & ddLevel.SelectedValue & ",'" & ddLevel.SelectedItem.Text & "',null,null,'" & txt_email.text & "')"
        '                    Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        '                    ap.Fill(ds)
        '                    ' send_email_Register(get_current_email, txtusername.Text, "")
        '                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_save_data_success", "alert_save_data_success();", True)
        '                    '  Response.Redirect("..\Billing\Main_bill.aspx")
        '                Catch ex As Exception
        '                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_not_save", "alert_not_save();", True)
        '                End Try
        '            End If
        '        Else
        '            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_length_text", "alert_length_text();", True)
        '        End If
        '    Else
        '        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_Select_all_data", "alert_Select_all_data();", True)
        '    End If

        '    'txtpassword.Text = Encrypt(txtusername.Text, key)
        '    'txtconfirmPass.Text = Decrypt(txtpassword.Text, key)
        'End If
    End Sub

    Protected Sub btn_cancel_Click(sender As Object, e As EventArgs)

    End Sub

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
    Protected Sub txtusername_TextChanged(sender As Object, e As EventArgs)
        Dim ds As New DataSet
        Dim sql As String = "select * from User_bill where Username ='" & txtusername.Text & "'"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            txtusername.BackColor = Color.Red
        Else
            txtusername.BackColor = Color.YellowGreen
        End If

    End Sub


End Class