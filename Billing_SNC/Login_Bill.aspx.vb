Imports System.Data.SqlClient
Public Class Login_Bill
    Inherits System.Web.UI.Page
    Dim ds As DataSet
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            checkCookie(Me.Page)
            Dim ckUsername As HttpCookie = Request.Cookies("Username")
            Dim ckdate As HttpCookie = Request.Cookies("Date")
            If Request.Cookies("Username") IsNot Nothing Then
                username.Text = ckUsername.Value
            End If

        End If


    End Sub

    Protected Sub btn_login_Click(sender As Object, e As EventArgs) Handles btn_login.Click

        'If username.Text = "admin" Or username.Text = "nattiko" Or username.Text = "wiyada" Then
        '    ds = New DataSet
        '    Dim enctypPass As String = Crypto.Encrypt(password.Text, key)
        '    Dim sql As String = "select  * from user_bill where Username = '" & username.Text & "' and Password= '" & enctypPass & "' and Status = 1 select  * from user_bill where Username = '" & username.Text & "' and Password= '" & enctypPass & "' and Status = 0"
        '    Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        '    ap.Fill(ds)
        '    If ds.Tables(0).Rows.Count > 0 Then
        '        Session.Timeout = 105
        '        'Application("username") = username.Text + "5521"
        '        Session.Add("username", username.Text.ToLower)
        '        Response.Redirect("~\Billing\index.aspx")
        '    Else
        '        If ds.Tables(1).Rows.Count > 0 Then
        '            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_status_not_approve", "alert_status_not_approve();", True) ' if have user in system but status not true

        '        Else
        '            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_Error_Password_not_math", "alert_Error_Password_not_math();", True) ' if key not math .Alert Error
        '        End If

        '    End If
        'Else
        '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_Close", "alert_Close();", True)
        'End If
        ds = New DataSet
        Dim enctypPass As String = Crypto.Encrypt(password.Text, key)
        Dim sql As String = "select  * from user_bill where Username = '" & username.Text & "' and Password= '" & enctypPass & "' and Status = 1 select  * from user_bill where Username = '" & username.Text & "' and Password= '" & enctypPass & "' and Status = 0"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            Session.Timeout = 105
            If Read_cookie(Me.Page) Then
                Create_cookie(Me.Page, username.Text)
            End If

            'Application("username") = username.Text + "5521"
            Session.Add("username", username.Text.ToLower)
                Response.Redirect("~\Billing\index.aspx")
            Else
                If ds.Tables(1).Rows.Count > 0 Then
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_status_not_approve", "alert_status_not_approve();", True) ' if have user in system but status not true

            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_Error_Password_not_math", "alert_Error_Password_not_math();", True) ' if key not math .Alert Error
            End If

        End If

    End Sub


    Protected Sub btn_register_Click(sender As Object, e As EventArgs)
        Response.Redirect("~\Register_SNC.aspx")

    End Sub


    Protected Sub btn_cookie_Click(sender As Object, e As EventArgs)
        Create_cookie(Me.Page, "")
        checkCookie(Me.Page)
    End Sub
End Class