Imports System.Data.SqlClient

Public Class Log_billing
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim ds As DataSet = get_Lv(Session.Item("username"))
            If ds.Tables(0).Rows.Count > 0 Then

            End If
            load_data()
        End If
    End Sub

    Private Sub load_data()
        Dim ds As DataSet = New DataSet
        Dim sql = "select top(10000) * from Log_Billing order by id desc"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        GridView1.DataSource = ds.Tables(0)
        GridView1.DataBind()

    End Sub

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        load_data()

    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)

    End Sub
End Class