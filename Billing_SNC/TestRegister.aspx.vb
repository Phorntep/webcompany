Imports System.Drawing

Public Class TestRegister
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        'If String.IsNullOrWhiteSpace(txtusername.Text) Then
        '    lbl_alert_Username.Text = "Please Key username"
        '    lbl_alert_Username.ForeColor = Color.Pink

        'End If
    End Sub

    Protected Sub Unnamed_ServerClick(sender As Object, e As EventArgs)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "a", "showmodal();", True)

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)




        If Not Regex.IsMatch(txtName.Text, "^[a-zA-Z0-9'.]{7,25}$") Then
            txtName.BorderColor = Color.Red
        Else
            txtName.BorderColor = Color.Green
        End If
    End Sub
End Class