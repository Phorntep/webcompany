Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports Microsoft.Office.Interop

Public Class Manage_user
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sriptmanagerregister()

        If Not IsPostBack Then
            b_filter_company = False
            b_filter_status = False
            load_level_And_check_permission()
            '  check_permission()
            load_user()
            If FN_Check_expire_password(Session.Item("username")) = True Then
                Response.Redirect("..\Billing\Reset_password.aspx")
            End If
        End If
    End Sub
    Private Sub load_level_And_check_permission()
        If Session.Count > 0 Then
            If Session.Item("username") <> "" Then
                Dim ds As New DataSet, ds_l As New DataSet
                Dim sql_l As String = "select * from User_bill where Username = '" & Session.Item("username") & "'"
                Dim ap_l As SqlDataAdapter = New SqlDataAdapter(sql_l, connection)
                ap_l.Fill(ds_l)
                If ds_l.Tables(0).Rows.Count > 0 Then
                    If ds_l.Tables(0).Rows(0).Item("Level") < 3 Then
                        Response.Redirect("..\Billing\index.aspx")
                    Else
                        Dim sql As String = "select * from Permission_Lv where Id_lv <= " & check_permission() & ""
                        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                        ap.Fill(ds)
                        ddLevel.DataSource = ds.Tables(0)
                        ddLevel.DataTextField = "Discription_Lv"
                        ddLevel.DataValueField = "Id_lv"
                        ddLevel.DataBind()
                    End If
                End If
            Else
                Response.Redirect("..\Billing\index.aspx")
            End If
        Else
            Response.Redirect("..\Login_Bill.aspx")
        End If
    End Sub
    Private Function check_permission()
        If Session.Count > 0 Then
            If Session.Item("username") <> "" Then
                Dim ds As New DataSet
                Dim sql As String = "select * from User_bill where Username = '" & Session.Item("username") & "'"
                Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                ap.Fill(ds)
                Return CInt(ds.Tables(0).Rows(0).Item("Level"))
            Else
                Response.Redirect("..\Login_Bill.aspx")
            End If
        End If

    End Function
    Private Sub load_user()
        ds_usermange = New DataSet
        Dim sql As String = "select * from User_bill where Username <> 'admin' and Level <= " & check_permission() & ""
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds_usermange)
        GridView1.DataSource = ds_usermange.Tables(0)
        GridView1.DataBind()
    End Sub

    Private Sub sriptmanagerregister()
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        'ScriptManager.RegisterPostBackControl(Me.ddLevel)
        'ScriptManager.RegisterPostBackControl(Me.txtpassword)
        'ScriptManager.RegisterPostBackControl(Me.myBtn)
        ScriptManager.RegisterPostBackControl(Me.GridView1)
        ScriptManager.RegisterPostBackControl(Me.btn_ExportExcel)

    End Sub
    Protected Sub btn_cancel_Click(sender As Object, e As EventArgs)
        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Close_model", "Close_model();", True)
    End Sub

    Protected Sub btn_success_Click(sender As Object, e As EventArgs)
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            Dim ds As DataSet = New DataSet
            Dim sql As String
            Dim ap As SqlDataAdapter
            If txtpassword.Text.Length >= 4 Then
                If txtpassword.Text = txtconfirmPass.Text Then
                    sql = "Update User_bill set Password='" & Crypto.Encrypt(txtpassword.Text, key) & "', Company='" & txtCompany.Text.ToString.Replace("'", "''") & "', Supplier = '" & txtSupplier.Text.Replace("'", "''") & "', status='" & dd_status.SelectedValue & "',Address='" & txtaddress.Text.ToString.Replace("'", "''") & "',Tel='" & txtPhone.Text & "',Level=" & ddLevel.SelectedValue & ",Description_lv='" & ddLevel.SelectedItem.Text & "',Email='" & txt_email.Text.ToString.Replace("'", "''") & "' where Username='" & txtusername.Text & "'"
                    sql += " insert into Log_Billing values('Update & Edit user :" & txtusername.Text & " ','Update & Edit user','',GETDATE(),'" & Session.Item("username").ToString & "')"
                    ap = New SqlDataAdapter(sql, connection)
                    ap.Fill(ds)
                    If dd_status.SelectedValue = 1 Then
                        send_email_Tranfer_all(txt_email.Text, txtusername.Text, Format(Now, "yyyy-MM-dd"), "AppoveUser")
                    End If
                    load_user()
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_password_not_math", "alert_password_not_math();", True)
                End If
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_password_not_math", "alert_password_not_math();", True)
            End If
        End If
    End Sub

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataSource = ds_usermange.Tables(0)
        GridView1.DataBind()


    End Sub


    Protected Sub btn_close_Click(sender As Object, e As EventArgs)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Close_model", "Close_model();", True)
        Clear_data_inedit()
    End Sub

    Private Sub Clear_data_inedit()
        txtusername.Text = ""
        txtpassword.Text = ""
        txtconfirmPass.Text = ""
        txtCompany.Text = ""
        txtSupplier.Text = ""
        txtaddress.Text = ""
        txtPhone.Text = ""
        txt_email.Text = ""
        ddLevel.SelectedIndex = 0
        dd_status.SelectedIndex = 0
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim ds As New DataSet
        Dim sql As String = "select * from User_bill where Username <> 'admin' and Level <= " & check_permission() & ""
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        Dim username As String = DirectCast(GridView1.SelectedRow.FindControl("Label2"), Label).Text
        'sql = "select * from User_bill where Username   ='" & ds.Tables(0).Rows(CInt(GridView1.SelectedRow.DataItemIndex)).Item("Username").ToString & "'"
        sql = "select * from User_bill where Username ='" & username & "'"
        ap = New SqlDataAdapter(sql, connection)
        ds = New DataSet
        ap.Fill(ds)
        txtusername.Enabled = False
        txtusername.Text = ds.Tables(0).Rows(0).Item("Username").ToString
        'txtpassword.Text = ds.Tables(0).Rows(0).Item("Password").ToString
        txtpassword.Attributes.Add("value", Crypto.Decrypt(ds.Tables(0).Rows(0).Item("Password").ToString, key))
        txtconfirmPass.Attributes.Add("value", Crypto.Decrypt(ds.Tables(0).Rows(0).Item("Password").ToString, key))
        txtCompany.Text = ds.Tables(0).Rows(0).Item("Company").ToString
        txtSupplier.Text = ds.Tables(0).Rows(0).Item("Supplier").ToString
        txtaddress.Text = ds.Tables(0).Rows(0).Item("Address").ToString
        txtPhone.Text = ds.Tables(0).Rows(0).Item("Tel").ToString
        txt_email.Text = ds.Tables(0).Rows(0).Item("Email").ToString
        ddLevel.SelectedIndex = ds.Tables(0).Rows(0).Item("Level") - 1
        If ds.Tables(0).Rows(0).Item("Status") = True Then
            dd_status.SelectedIndex = 0
        Else
            dd_status.SelectedIndex = 1
        End If
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "OpenModel", "OpenModel();", True)
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "Status")) Then

            If e.Row.RowType = DataControlRowType.DataRow Then

                If DataBinder.Eval(e.Row.DataItem, "Status") = True Then
                    e.Row.Cells(4).Text = "Approve"
                Else
                    e.Row.Cells(4).Text = "Not Approve"
                End If

            End If
        End If
    End Sub

    Protected Sub btn_search_Click(sender As Object, e As EventArgs)
        ds_usermange = New DataSet
        Dim sql As String = "select * from User_bill where Username <> 'admin' and Level <= " & check_permission() & " and Company like '%" & txt_company.Text & "%' and Status like '%" & DropDownList1.SelectedValue & "%'"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds_usermange)
        GridView1.DataSource = ds_usermange.Tables(0)
        GridView1.DataBind()
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        ds_usermange = New DataSet
        Dim sql As String
        If b_filter_status = False Then
            sql = "select * from User_bill where Username <> 'admin' and Level <= " & check_permission() & " and Company like '%" & txt_company.Text & "%' order by Status desc"
            b_filter_status = True
        Else
            b_filter_status = False
            sql = "select * from User_bill where Username <> 'admin' and Level <= " & check_permission() & " and Company like '%" & txt_company.Text & "%' order by Status  "
        End If

        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds_usermange)
        GridView1.DataSource = ds_usermange.Tables(0)
        GridView1.DataBind()
    End Sub

    Protected Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs)
        ds_usermange = New DataSet
        Dim sql As String
        If b_filter_company = False Then
            b_filter_company = True
            sql = "select * from User_bill where Username <> 'admin' and Level <= " & check_permission() & " and Company like '%" & txt_company.Text & "%' order by Company desc"
        Else
            b_filter_company = False
            sql = "select * from User_bill where Username <> 'admin' and Level <= " & check_permission() & " and Company like '%" & txt_company.Text & "%' order by Company"
        End If

        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds_usermange)
        GridView1.DataSource = ds_usermange.Tables(0)
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then

            'Dim username As String = DirectCast(GridView1.SelectedRow.FindControl("Label2"), Label).Text
            Dim username As String = e.Values(0).ToString
            Dim ds As New DataSet
            Dim sql As String = "delete from user_bill where username ='" & username & "'"
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            load_user()
        End If
    End Sub

    Protected Sub ExportToExcel()
        Dim dsResult = New DataSet
        Dim sql As String = "select * from User_bill where Username <> 'admin' and Level <= " & check_permission() & ""
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(dsResult)
        '  ExportToExcel(dsResult.Tables(0), "UserBilling")
        toExcel(dsResult)
    End Sub
    Protected Sub btn_ExportExcel_Click(sender As Object, e As EventArgs)
        ExportToExcel()

    End Sub


    Sub toExcel(ds As DataSet)
        'Dim attachment = "attachment; filename=UserBilling.xls"
        'Response.ClearContent()
        'Response.AddHeader("content-disposition", attachment)
        'Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-8")
        'Response.ContentType = "application/vnd.ms-excel"
        'Dim sw = New StringWriter()
        'Dim htw = New HtmlTextWriter(sw)
        'Dim dgGrid As DataGrid = New DataGrid()
        ''ds.Tables(0).Columns(7).DataType = System.Type.GetType("System.String")
        'dgGrid.DataSource = ds.Tables(0)

        'dgGrid.DataBind()
        'dgGrid.RenderControl(htw)
        'Response.Write(sw.ToString())
        'Response.Flush()
        'Response.End()

        'Response.Clear()
        'Response.Buffer = True
        'Response.ClearContent()
        'Response.ClearHeaders()
        'Response.Charset = ""
        'Dim FileName = "Vithal" + DateTime.Now + ".xls"
        'Dim strwritter = New StringWriter()
        'Dim htmltextwrtter = New HtmlTextWriter(strwritter)
        'Response.Cache.SetCacheability(HttpCacheability.NoCache)
        'Response.ContentType = "application/vnd.ms-excel"
        'Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName)
        'Dim dgGrid As DataGrid = New DataGrid()
        'dgGrid.DataSource = ds.Tables(0)
        'dgGrid.GridLines = GridLines.Both
        'dgGrid.HeaderStyle.Font.Bold = True
        'dgGrid.DataBind()
        'dgGrid.RenderControl(htmltextwrtter)
        'Response.Write(strwritter.ToString())
        'Response.End()



        Dim dgGrid As GridView = New GridView()
        dgGrid.DataSource = ds.Tables(0)
        dgGrid.DataBind()

        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=UserBilling.xls")
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"

        Using sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)

            'To Export all pages
            dgGrid.AllowPaging = False


            dgGrid.HeaderRow.BackColor = Color.White
            For Each cell As TableCell In dgGrid.HeaderRow.Cells
                cell.BackColor = dgGrid.HeaderStyle.BackColor
            Next
            For Each row As GridViewRow In dgGrid.Rows
                row.BackColor = Color.White
                For Each cell As TableCell In row.Cells
                    If row.RowIndex Mod 2 = 0 Then
                        cell.BackColor = dgGrid.AlternatingRowStyle.BackColor
                    Else
                        cell.BackColor = dgGrid.RowStyle.BackColor
                    End If
                    cell.CssClass = "textmode"
                Next
            Next

            dgGrid.RenderControl(hw)
            'style to format numbers to string
            Dim style As String = "<style> .textmode { } </style>"

            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.[End]()

        End Using
    End Sub

End Class