Imports System.Net

Public Class MasterIndexPageForm01
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim ckip As HttpCookie = Request.Cookies("IPcreate")
            Dim ckdate As HttpCookie = Request.Cookies("Datecreate")
            If ckip Is Nothing AndAlso ckdate Is Nothing Then
                checkCookie(Me.Page)
            End If

        End If


    End Sub


    Protected Sub btn_cookie_Click1(sender As Object, e As EventArgs)
        Create_cookie(Me.Page, "")

    End Sub
End Class