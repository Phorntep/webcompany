Imports System.Web.Security

Public Class masterpageBill
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'ScriptManager.GetCurrent(Me.Page).RegisterPostBackControl(Me.Button1)
        'Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        'ScriptManager.RegisterPostBackControl(Me.Button1)
        'If Not Me.Page.User.Identity.IsAuthenticated Then
        '    FormsAuthentication.RedirectToLoginPage()
        'End If
        '********
        'If Session.Item("username") <> "" Then
        '    'lblusername.Text = Session.Item("username")

        '    'Session.Remove("username")
        'Else
        '    Response.Redirect("..\Login_Bill.aspx")
        'End If

    End Sub


    Protected Sub btnlogout_Click1(sender As Object, e As EventArgs)
        'Dim confirmValue As String = Request.Form("confirm_value")
        'If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
        '    Session.Remove("username")
        '    Response.Redirect(Request.RawUrl)
        'End If



    End Sub

End Class