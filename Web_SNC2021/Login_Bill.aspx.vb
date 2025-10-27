Imports System.Data.SqlClient
Public Class Login_Bill
    Inherits System.Web.UI.Page
    Dim ds As DataSet
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btn_login_Click(sender As Object, e As EventArgs)
        ds = New DataSet
        Dim enctypPass As String = Crypto.Encrypt(password.Text, key)
        Dim sql As String = "select  * from user_bill where Username = '" & username.Text & "' and Password= '" & enctypPass & "' and Status = 1"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            Session.Timeout = 10
            'Application("username") = username.Text + "5521"
            Session.Add("username", username.Text)
            Response.Redirect("~\Billing\Main_bill.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_Error_Password_not_math", "alert_Error_Password_not_math();", True) ' if key not math .Alert Error
        End If
    End Sub
End Class