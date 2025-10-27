Public Class JobPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnGomain_Click(sender As Object, e As EventArgs)
        Response.Redirect("../Index.aspx")

    End Sub

End Class