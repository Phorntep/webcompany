Imports System.Collections.Generic


Public Class Test_list
    Inherits System.Web.UI.Page
    Shared SocialNetworkList As List(Of String)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            SocialNetworkList = New List(Of String)()
            SocialNetworkList.Add("Facebook")
            SocialNetworkList.Add("Linkedin")
            SocialNetworkList.Add("Twitter")
            SocialNetworkList.Add("Google+")
            SocialNetworkList.Add("Orkut")
        End If

    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        If txtListItem.Text.Trim() <> "" Then
            SocialNetworkList.Add(txtListItem.Text.Trim())
            lblListDisplay.Text = "List Item Added"
        Else
            lblListDisplay.Text = "List - Please Enter an Item to Add"
        End If

        DisplayListBoxData()
    End Sub

    Private Sub DisplayListBoxData()
        lstSocialNetwork.Items.Clear()
        For Each str As String In SocialNetworkList
            lstSocialNetwork.Items.Add(str)
        Next
    End Sub
End Class