Public Class test
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        ScriptManager.RegisterPostBackControl(Me.Button1)
        If Not IsPostBack Then
            Return
        End If
    End Sub

End Class