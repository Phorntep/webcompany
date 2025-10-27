Imports System.Data.SqlClient

Public Class Billing_all1
    Inherits System.Web.UI.Page
    Dim ds_bill_list_All As DataSet
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sriptmanagerregister()
        If Not IsPostBack Then
            Try
                If Not IsNothing(Session.Item("username")) Then
                    Dim ds_infouser As DataSet = get_Lv(Session.Item("username"))
                    Session.Add("Level" + Session.Item("username"), ds_infouser.Tables(0).Rows(0).Item("Level").ToString)
                End If

            Catch ex As Exception
                Response.Redirect("..\Login_Bill.aspx")
            End Try

            loaddata()
            chkPermis()
            If FN_Check_expire_password(Session.Item("username")) = True Then
                Response.Redirect("..\Billing\Reset_password.aspx")
            End If
        End If
    End Sub

    Private Sub chkPermis() 'Enable permis user
        Dim ds_infouser As DataSet = get_Lv(Session.Item("username"))
        If ds_infouser.Tables(0).Rows.Count > 0 Then

            If ds_infouser.Tables(0).Rows(0).Item("Level").ToString = 1 Then

                GridView1.Columns(3).Visible = False
                GridView1.Columns(9).Visible = False
                GridView1.Columns(10).Visible = False
                GridView1.Columns(11).Visible = False
                'column Delete
                'GridView1.Columns(12).Visible = False
                btn_confirm.Visible = False
                box_search.Visible = False
            End If
        End If
        GridView1.Columns(10).Visible = False
        ' New CultureInfo("en-US"))
    End Sub

    Private Sub loaddata()
        Dim ds As DataSet = ds_billing_list
        ds = New DataSet
        Dim ds_infouser As DataSet = get_Lv(Session.Item("username"))
        Dim sql As String
        Dim ap As SqlDataAdapter
        If ds_infouser.Tables(0).Rows.Count > 0 Then
            If ds_infouser.Tables(0).Rows(0).Item("Level").ToString <> 1 Then
                'sql = "select Docnumber,Factory,dateCreate,date_confirm,status_pay,Datetranfer,status_tranfer,status_edit from Des_invoice  group by Docnumber,Factory,status_pay,date_confirm,dateCreate,Datetranfer,status_tranfer,status_edit order by status_pay,status_tranfer , date_confirm desc  ,Docnumber desc"
                ' sql = "select top(10000) Docnumber,Factory,convert(date, dateCreate ,105) as 'dateCreate',date_confirm,status_pay,Datetranfer,status_tranfer,status_edit from Des_invoice   group by Docnumber,Factory,status_pay,date_confirm,convert(date, dateCreate ,105),Datetranfer,status_tranfer,status_edit order by status_pay,status_tranfer , date_confirm desc  ,Docnumber desc"
                'sql = "select top(10000) Docnumber,Factory,convert(date, dateCreate ,105) as 'dateCreate',date_confirm,status_pay,Datetranfer,status_tranfer,status_edit from Des_invoice where Factory like '%" & txt_company.Text & "%' and convert(date, dateCreate ,105) like '%%' group by Docnumber,Factory,status_pay,date_confirm,convert(date, dateCreate ,105),Datetranfer,status_tranfer,status_edit order by status_pay,status_tranfer , date_confirm desc  ,Docnumber desc"
                '                Select Case top(10000) Docnumber,Factory,convert(Date, dateCreate ,105) As 'dateCreate',date_confirm,status_pay,Datetranfer,status_tranfer,status_edit from Des_invoice where Factory like '%%' and (dateCreate  between '2020/12/11 0:00:0' and '2020/12/11 23:59:59')  group by Docnumber,Factory,status_pay,date_confirm,convert(date, dateCreate ,105),Datetranfer,status_tranfer,status_edit order by status_pay,status_tranfer , date_confirm desc  ,Docnumber desc
                'Select Case top(10000) Docnumber,Factory,convert(Date, dateCreate ,105) As 'dateCreate',date_confirm,status_pay,Datetranfer,status_tranfer,status_edit from Des_invoice where Factory like '%%' group by Docnumber,Factory,status_pay,date_confirm,convert(date, dateCreate ,105),Datetranfer,status_tranfer,status_edit order by status_pay,status_tranfer , date_confirm desc  ,Docnumber desc                '
                If chk_use_date.Checked = True Then
                    sql = "Select top(10000) Docnumber,Factory,convert(Date, dateCreate ,105) As 'dateCreate',date_confirm,status_pay,Datetranfer,status_tranfer,status_edit,pay_total from Des_invoice where Factory like '%" & txt_company.Text & "%' and (dateCreate  between '" & txt_date_start.Text & " 0:00:0' and '" & txt_date_End.Text & " 23:59:59')  group by Docnumber,Factory,status_pay,date_confirm,convert(date, dateCreate ,105),Datetranfer,status_tranfer,status_edit,pay_total order by status_pay,status_tranfer , date_confirm desc  ,Docnumber desc"
                Else
                    sql = "Select top(10000) Docnumber,Factory,convert(Date, dateCreate ,105) As 'dateCreate',date_confirm,status_pay,Datetranfer,status_tranfer,status_edit,pay_total from Des_invoice where Factory like '%" & txt_company.Text & "%' group by Docnumber,Factory,status_pay,date_confirm,convert(date, dateCreate ,105),Datetranfer,status_tranfer,status_edit,pay_total order by status_pay,status_tranfer,date_confirm desc,Docnumber desc"
                End If
                ap = New SqlDataAdapter(sql, connection)
                ap.Fill(ds)
                gridbinding(ds)
            Else
                'sql = "select Docnumber,Factory,dateCreate,date_confirm,status_pay,Datetranfer,status_tranfer,status_edit from Des_invoice where Factory='" & ds_infouser.Tables(0).Rows(0).Item("Company").ToString & "' group by Docnumber,Factory,status_pay,date_confirm,dateCreate,Datetranfer,status_tranfer,status_edit order by status_pay ,status_tranfer, date_confirm desc  ,Docnumber desc"
                sql = "select top(1000) Docnumber,Factory,convert(date, dateCreate ,105) as 'dateCreate',date_confirm,status_pay,Datetranfer,status_tranfer,status_edit,pay_total from Des_invoice where userCreate='" & ds_infouser.Tables(0).Rows(0).Item("Username").ToString & "' group by Docnumber,Factory,status_pay,date_confirm,convert(date, dateCreate ,105),Datetranfer,status_tranfer,status_edit,pay_total order by status_pay ,status_tranfer, date_confirm desc  ,Docnumber desc"

                ap = New SqlDataAdapter(sql, connection)
                ap.Fill(ds)
                gridbinding(ds)
            End If
        End If
    End Sub

    Public Sub gridbinding(ds As DataSet)
        Dim ds_bill_list_All As DataSet = ds
        Session(Session.Item("username") + "BillListAll") = ds_bill_list_All
        Try
            Session.Remove(Session.Item("username") + "BillListAll")

        Finally
            Session(Session.Item("username") + "BillListAll") = ds_bill_list_All

        End Try
        GridView1.DataSource = ds_bill_list_All.Tables(0)
        GridView1.DataBind()
    End Sub

    Private Sub sriptmanagerregister()
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)

        ScriptManager.RegisterPostBackControl(Me.btn_confirm)
        ScriptManager.RegisterPostBackControl(Me.btn_search)
        'datepickup()
    End Sub

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        loaddata()

    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        Dim bEditdate1 As Boolean = False
        Dim bEditdate2 As Boolean = False

        If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "status_pay")) Then
            If e.Row.RowType = DataControlRowType.DataRow Then
                If DataBinder.Eval(e.Row.DataItem, "status_pay") = True Then
                    Dim btn As ImageButton = e.Row.FindControl("ImageButton2")
                    btn.ImageUrl = "..\Billing\Image_billing\icon\check.png"

                    'Dim chk2 As CheckBox = e.Row.FindControl("chk_edit")

                    'chk2.Enabled = False
                    Dim chk1 As CheckBox = e.Row.FindControl("chk_confirm")

                    chk1.Enabled = False
                    bEditdate1 = True

                    If Session("Level" + Session.Item("username")).ToString = 1 Then
                        Dim btnDelete As ImageButton = e.Row.FindControl("image_delete")
                        btnDelete.Enabled = False

                    End If

                Else
                    Dim chk3 As CheckBox = e.Row.FindControl("chk_editdateTranfer")
                    chk3.Enabled = False
                    If Session("Level" + Session.Item("username")).ToString = 1 Then
                        Dim btnDelete As ImageButton = e.Row.FindControl("image_delete")
                        btnDelete.Enabled = True

                    End If
                End If
            End If
        Else
            'If DataBinder.Eval(e.Row.DataItem, "Status_Job_id") = "1" Or DataBinder.Eval(e.Row.DataItem, "Status_Job_id") = 2 Then
            '    e.Row.BackColor = Drawing.Color.Yellow
            'End If
        End If
        If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "status_tranfer")) Then
            If e.Row.RowType = DataControlRowType.DataRow Then
                If DataBinder.Eval(e.Row.DataItem, "status_tranfer") = True Then
                    Dim btn As ImageButton = e.Row.FindControl("ImageButton3")
                    btn.ImageUrl = "..\Billing\Image_billing\icon\check.png"
                    Dim chk1 As CheckBox = e.Row.FindControl("chk_confirm")
                    Dim chk2 As CheckBox = e.Row.FindControl("chk_edit")
                    chk1.Enabled = False
                    chk2.Enabled = False
                    ' Dim chk3 As CheckBox = e.Row.FindControl("chk_editdateTranfer")
                    'chk3.Enabled = False
                    bEditdate2 = True


                End If

            End If

        End If
        'If bEditdate1 = True And bEditdate2 = False Then
        '    Dim chk3 As CheckBox = e.Row.FindControl("chk_editdateTranfer")
        '    chk3.Enabled = True
        'End If
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        Dim dr As GridViewRow
        Dim index As Integer
        Dim doc_id As String = ""
        If e.CommandName <> "Page" Then
            dr = e.CommandSource.NamingContainer
            index = dr.RowIndex
            doc_id = DirectCast(dr.Cells(1).Controls(1), LinkButton).[Text]
        End If

        Select Case e.CommandName
            Case "JobPrint"
                Dim ds As New DataSet
                Dim sql As String = "select * from des_invoice where Docnumber='" & doc_id & "' and status_pay=1"
                Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                ap.Fill(ds)
                Response.Redirect("..\Billing\Print_bill.aspx?Payment=" + doc_id)
                'If ds.Tables(0).Rows.Count > 0 Then
                '    Response.Redirect("..\Billing\Print_bill.aspx?Payment=" + doc_id)
                'Else
                '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Alert_status_not_confirm", "Alert_status_not_confirm();", True)
                'End If
            Case "link_tranfer"
                Dim ds As New DataSet
                Dim sql As String = "select * from des_invoice where Docnumber='" & doc_id & "' and status_pay=1"
                Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                ap.Fill(ds)
                If ds.Tables(0).Rows.Count > 0 Then
                    If ds.Tables(0).Rows(0).Item("status_tranfer") = True Then
                        Response.Redirect("..\Billing\Billing_list_tranfer.aspx?IdTranfer=" + doc_id)
                    End If
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Alert_status_not_Open", "Alert_status_not_Open();", True)
                End If

            Case "Jobload"
                Dim ds As New DataSet
                Dim sql As String = "select * from des_invoice where Docnumber='" & doc_id & "' and status_edit=1"
                Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                ap.Fill(ds)
                If ds.Tables(0).Rows.Count > 0 Then
                    Response.Redirect("..\Billing\Billing_supplier_edit.aspx?Payment=" + doc_id)
                Else
                    Response.Redirect("..\Billing\Detail_payment.aspx?Payment=" + doc_id)
                End If
            Case "Delete1"
                Dim ds_infouser As DataSet = get_Lv(Session.Item("username"))
                If ds_infouser.Tables(0).Rows.Count > 0 Then
                    'If ds_infouser.Tables(0).Rows(0).Item("Level").ToString <> 1 Then
                    Dim confirmValue As String = Request.Form("confirm_value")
                        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
                            Dim ds As New DataSet
                            Dim sql As String = "delete from Des_invoice where Docnumber ='" & doc_id & "'"
                            sql += " insert into Log_Billing values('Delete Billing :" & doc_id & " ','Delete Billing ','" & doc_id.ToUpper & "',GETDATE(),'" & Session.Item("username").ToString & "')"
                            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                            ap.Fill(ds)
                            Response.Redirect("..\Billing\Billing_all1.aspx")
                        End If
                    'End If
                End If
                'Dim ds As New DataSet
                'Dim sql As String = "select * from des_invoice where Docnumber='" & doc_id & "' and status_edit=1"
                'Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                'ap.Fill(ds)
                'If ds.Tables(0).Rows.Count > 0 Then
                '    Response.Redirect("..\Billing\Billing_supplier_edit.aspx?Payment=" + doc_id)
                'Else
                '    Response.Redirect("..\Billing\Detail_payment.aspx?Payment=" + doc_id)
                'End If
        End Select
    End Sub
    Sub datepickup()
        Dim script As String = " 
                $(function () {
                    $('[id*=txt_date_start]').datepicker({
                        changeMonth: true,
                        changeYear: true,
                        format: ""yyyy/mm/dd"",
                        language: ""tr"",
                        autoclose: true
                    });
                });
                 $(function () {
                    $('[id*=txt_date_End]').datepicker({
                        changeMonth: true,
                        changeYear: true,
                        format: ""yyyy/mm/dd"",
                        language: ""tr"",
                        autoclose: true
                    });
                });
            "
        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "a", script, True)


    End Sub


    Protected Sub btn_confirm_Click(sender As Object, e As EventArgs)
        ds_confirm_payjob = New DataSet
        ds_confirm_payjob.Tables.Add(0)
        ds_confirm_payjob.Tables(0).Columns.Add("Docnumber", GetType(String))
        ds_confirm_payjob.Tables(0).Columns.Add("Factory", GetType(String))


        For Each row As GridViewRow In GridView1.Rows
            Dim chk As CheckBox = row.FindControl("chk_confirm")
            Dim link_job As LinkButton = row.FindControl("link_job")
            Dim lbl_factory As Label = row.FindControl("lbl_factory")
            If chk.Checked = True Then
                ds_confirm_payjob.Tables(0).Rows.Add(link_job.Text, lbl_factory.Text)
            End If
        Next
        Response.Redirect("..\Billing\Billing_confirm.aspx?status=1")
        'GridView2.DataSource = tb
        'GridView2.DataBind()



        'Page.ClientScript.RegisterStartupScript(Me.GetType(), "OpenModeeel", "OpenModel();", True)
        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "OpenModeeel", "OpenModel();", True)
    End Sub

    Protected Sub btn_save_upload_file_supplier_Click(sender As Object, e As EventArgs)

        ' ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Alert_status_not_confirm", "Alert_status_not_confirm();", True)

        'btn_save_upload_file_supplier.Attributes.Add("onclick", "return false;")
    End Sub

    'Protected Sub btn_confirm_check_Click(sender As Object, e As EventArgs)
    '    Dim ds As New DataSet
    '    Dim sql As String = ""

    '    Dim confirmValue As String = Request.Form("confirm_value")
    '    If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
    '        For Each row As GridViewRow In GridView2.Rows
    '            Dim lbl_documentnumber As LinkButton = row.FindControl("link_job")
    '            sql += " update Des_invoice set status_pay= 1 where Docnumber='" & lbl_documentnumber.Text & "' "
    '            sql += " insert into Log_Billing values('Confirm billing :" & lbl_documentnumber.Text & " ','Confirm billing ','" & lbl_documentnumber.Text & "',GETDATE(),'" & Session.Item("username").ToString & "')"
    '        Next

    '        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
    '        ap.Fill(ds)
    '        loaddata()
    '        chkPermis()
    '    End If
    'End Sub 
    Protected Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs)
        Dim ChkBoxHeader As CheckBox = GridView1.HeaderRow.FindControl("CheckBox1")
        For Each row As GridViewRow In GridView1.Rows
            Dim chk_status As CheckBox = row.FindControl("chk_confirm")
            If ChkBoxHeader.Checked = True Then
                If chk_status.Enabled = True Then
                    chk_status.Checked = True
                End If
            Else
                chk_status.Checked = False
            End If
        Next

    End Sub

    Protected Sub chk_edit_CheckedChanged1(sender As Object, e As EventArgs)

        Dim dr As GridViewRow = TryCast((TryCast(sender, CheckBox)).NamingContainer, GridViewRow)
            Dim id As LinkButton = dr.FindControl("link_job")
        Dim chk_e As CheckBox = dr.FindControl("chk_edit")
        If GridView1.Columns(9).Visible = True Then
            Dim IntBool As Int32 = Math.Abs(CInt(chk_e.Checked))
            Dim ds As New DataSet
            Dim sql As String = "update Des_invoice set status_edit= " & IntBool & " where Docnumber = '" & id.Text & "'"
            sql += " insert into Log_Billing values('select Edit billing :" & id.Text & " ','select Edit billing ','" & id.Text & "',GETDATE(),'" & Session.Item("username").ToString & "')"
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)

        End If


    End Sub

    Protected Sub btn_search_Click(sender As Object, e As EventArgs)
        loaddata()

    End Sub

    Protected Sub btnEditDateTranfer_Click(sender As Object, e As EventArgs)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "OpenModel", "OpenModel();", True)

        Dim script As String = " 
               $(function () {
                    $('.form_datetime').datepicker({
                        changeMonth: true,
                        changeYear: true,
                        format: 'yyyy/mm/dd',
                        language: 'tr',
                        autoclose: true
                    });
                }); 
            "
        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "a", script, True)
        GetSelectedRecords()

    End Sub


    Protected Sub GetSelectedRecords()
        Dim dtEditdate As New DataTable
        Dim dtEditstatusTranfer As New DataTable

        dtEditdate.Columns.AddRange(New DataColumn(1) {New DataColumn("Docnumber"), New DataColumn("Factory")})
        dtEditstatusTranfer.Columns.AddRange(New DataColumn(1) {New DataColumn("Docnumber"), New DataColumn("Factory")})
        For Each row As GridViewRow In GridView1.Rows
            If row.RowType = DataControlRowType.DataRow Then
                Dim chkRow As CheckBox = TryCast(row.Cells(0).FindControl("chk_editdateTranfer"), CheckBox)
                If chkRow.Checked Then
                    Dim link_job As LinkButton = row.FindControl("link_job")
                    Dim lbl_factory As Label = row.FindControl("lbl_factory")
                    Dim introw As Integer = row.RowIndex
                    ds_bill_list_All = Session(Session.Item("username") + "BillListAll")
                    Dim bCheckPay As Boolean = ds_bill_list_All.Tables(0).Rows(introw).Item("status_pay")
                    Dim bChecktranfer As Boolean = ds_bill_list_All.Tables(0).Rows(introw).Item("status_tranfer")
                    If bCheckPay AndAlso bChecktranfer Then

                        dtEditstatusTranfer.Rows.Add(link_job.Text, lbl_factory.Text)
                    ElseIf bCheckPay Then
                        dtEditdate.Rows.Add(link_job.Text, lbl_factory.Text)
                    End If
                End If
            End If
        Next
        GridView2.DataSource = dtEditdate
        GridView2.DataBind()

        GridView3.DataSource = dtEditstatusTranfer
        GridView3.DataBind()
    End Sub

    Protected Sub btn_edit_Click(sender As Object, e As EventArgs)
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            Dim sql As String = ""
            Dim ap As SqlDataAdapter = New SqlDataAdapter
            Dim ds As DataSet = New DataSet
            For Each row As GridViewRow In GridView2.Rows
                If row.RowType = DataControlRowType.DataRow Then
                    Dim docNumber As LinkButton = TryCast(row.Cells(0).FindControl("link_job"), LinkButton)
                    sql += $" update Des_invoice set date_confirm=GETDATE(),status_pay= 1,Datetranfer = '{txt_date_tranfer.Text}',check_send_email_Confirm=1   where Docnumber='{docNumber.Text}' "
                    sql += $" insert into Log_Billing values('Edit Date Confrim Tranfer :" & docNumber.Text & " ','Edit Date Confrim Tranfer','" & docNumber.Text & "',GETDATE(),'" & Session.Item("username").ToString & "')"
                End If
            Next
            ap = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            Response.Redirect("..\Billing\Billing_all1.aspx")
        End If
    End Sub

    Protected Sub btn_edit_status_tranfer_Click(sender As Object, e As EventArgs)
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            Dim sql As String = ""
            Dim ap As SqlDataAdapter = New SqlDataAdapter
            Dim ds As DataSet = New DataSet
            For Each row As GridViewRow In GridView3.Rows
                If row.RowType = DataControlRowType.DataRow Then
                    Dim docNumber As LinkButton = TryCast(row.Cells(0).FindControl("link_job"), LinkButton)
                    sql += $" update Des_invoice set status_tranfer = 0 where Docnumber ='" & docNumber.Text & "' "
                    sql += $" insert into Log_Billing values('Edit Date Confrim Tranfer :" & docNumber.Text & " ','Edit Date Confrim Tranfer','" & docNumber.Text & "',GETDATE(),'" & Session.Item("username").ToString & "')"
                End If
            Next
            ap = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            Response.Redirect("..\Billing\Billing_all1.aspx")
        End If
    End Sub
End Class