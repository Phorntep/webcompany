Imports System.Data.SqlClient

Public Class Billing_list_tranfer
    Inherits System.Web.UI.Page
    Protected sumTotal As Double = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Request.QueryString.Count > 0 Then
                If check_owner_job(Session.Item("username"), Request.QueryString.Item(0)) = True Then
                    load_job(Request.QueryString.Item(0))
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_owner_job", "alert_owner_job();", True)
                End If
            End If
            If FN_Check_expire_password(Session.Item("username")) = True Then
                Response.Redirect("..\Billing\Reset_password.aspx")
            End If
        End If
    End Sub

    Private Sub load_job(toString As String)
        Dim ds As DataSet = New DataSet
        Dim sql As String = "select * from Des_invoice where Docnumber='" & toString & "' "
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)

        Dim ds2 As DataSet = New DataSet
        Dim sql2 As String = "select * from User_bill where Username='" & ds.Tables(0).Rows(0).Item("userCreate").ToString & "'"
        Dim ap2 As SqlDataAdapter = New SqlDataAdapter(sql2, connection)
        ap2.Fill(ds2)

        '************
        If ds.Tables(0).Rows.Count > 0 And ds2.Tables(0).Rows.Count > 0 Then
            GridView1.DataSource = ds.Tables(0)
            GridView1.DataBind()
            lbl_Job_id.Text = ds.Tables(0).Rows(0).Item("Docnumber").ToString
            lbl_fac.Text = ds.Tables(0).Rows(0).Item("Factory").ToString
            lbl_address.Text = ds2.Tables(0).Rows(0).Item("Address").ToString
            lbl_supplier.Text = ds2.Tables(0).Rows(0).Item("Supplier").ToString
            sumTotal = CDbl(ds.Tables(0).Rows(0).Item("pay_total_tranfer").ToString)
        End If
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)

    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                Dim servicename As Double = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "total_money"))

                sumTotal += servicename
            End If
            If e.Row.RowType = DataControlRowType.Footer Then
                'e.Row.Cells(3).Text = "Total : " + String.Format("{0:C2}", sum_total) 
                e.Row.Cells(3).Text = "Total : " + FormatCurrency(sumTotal).Replace("£", "")
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btn_print_Click(sender As Object, e As EventArgs)
        Response.Redirect("..\Billing\Print_bill.aspx?Tranfer=" + lbl_Job_id.Text)
    End Sub
End Class