Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail

Public Class Main_bill
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        load_patment()
        'lblusername.Text = Application("username") 
        If FN_Check_expire_password(Session.Item("username")) = True Then
            Response.Redirect("..\Billing\Reset_password.aspx")
        End If
    End Sub
    Private Sub load_patment()
        Dim ds As DataSet = New DataSet
        Dim sql As String = "select * from FilepdfBill"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        www.InnerHtml = "<b>Name of Payment  </b>"
        For i = 0 To ds.Tables(0).Rows.Count - 1
            www.InnerHtml += "<a style=""color:orange;"" href=""File/" & ds.Tables(0).Rows(i).Item(2).ToString & """>" + ds.Tables(0).Rows(i).Item(1).ToString + "</a> | "
        Next

    End Sub
End Class