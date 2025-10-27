
Imports System.Data.SqlClient
Imports System.IO
Imports Billing_SNC.class_table
Imports ExcelDataReader


Public Class Billing_supplier
    Inherits System.Web.UI.Page
    Dim sum_total As Decimal
    Dim ds_bill_supplier As DataSet
    Dim ds_bill_supplier_file_upload As DataSet
    Dim clc_tb As class_table
    Dim bcheck_create_job As Boolean
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("username") <> "" Then
            sriptmanagerregister()

            'If Not IsPostBack Then
            '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Alert_use_system_billing", "Alert_use_system_billing();", True)

            '    If chack_function_open_create() = True Or process_day() = True Then

            '        Dim ds_bill_supplier As New DataSet("Bill_supplier")
            '        Dim ds_bill_supplier_file_upload As New DataSet("file_upload")
            '        Session(Session.Item("username") + "dscheck_create_job") = ds_bill_supplier
            '        Session(Session.Item("username") + "dsfile_upload_create") = ds_bill_supplier_file_upload
            '        set_dataset_add_invioce()
            '        get_and_set_JobID()
            '        _load_factory()
            '        Try
            '            Session.Remove(Session.Item("username") + "bcheck_create_job")

            '        Catch ex As Exception
            '        Finally
            '            bcheck_create_job = False
            '            Session(Session.Item("username") + "bcheck_create_job") = bcheck_create_job

            '        End Try
            '        BindGridView()
            '    Else
            '        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "lock_user_of_date", "lock_user_of_date();", True)
            '    End If
            '    If FN_Check_expire_password(Session.Item("username")) = True Then
            '        Response.Redirect("..\Billing\Reset_password.aspx")

            '    End If

            'End If

        End If
    End Sub

    Private Sub sriptmanagerregister()
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        ScriptManager.RegisterPostBackControl(btn_upload)
        ScriptManager.RegisterPostBackControl(btn_Add_invoice)
        ScriptManager.RegisterPostBackControl(btn_UploadExcel)
        ScriptManager.RegisterPostBackControl(Link_download_format)
        'ScriptManager.RegisterPostBackControl(btnHideUpload)
    End Sub
    Function chack_function_open_create()
        Dim ds As New DataSet
        Dim sql As String = "select * from Setting_billing_create where status_function = 1"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If
    End Function
    Function process_day()
        Dim bDay As Boolean = False
        Dim date_chk As String = New Date(Format(Now.Year), Format(Now.Month), Format(Now.Day)).ToString("dd")
        Dim f_day As Integer = 2, s_day As Integer = 3
        Dim d_current2 As Date = New Date(Format(Now.Year), Format(Now.Month), 2)
        Dim d_current3 As Date = New Date(Format(Now.Year), Format(Now.Month), 3)
        If d_current3.ToString("dddd").ToLower = "saturday" Then

            s_day += 2
        ElseIf d_current3.ToString("dddd").ToLower = "sunday" Then
            f_day += 2
            s_day += 2
        End If
        If CInt(date_chk.ToString) <= s_day And CInt(date_chk.ToString) >= f_day Then
            'Dim date_s As String = Date.Today.ToString("dddd")
            Dim date_s As String = New Date(Format(Now.Year), Format(Now.Month), Format(Now.Day)).ToString("dddd")
            If date_s.ToLower <> "saturday" And date_s.ToLower <> "sunday" Then
                ' If date_s.ToLower <> "Thursday" And date_s.ToLower <> "Friday" Then

                bDay = True
            Else
                bDay = False

            End If
        End If
        Return bDay
    End Function
    Private Sub _load_factory()
        If Session.Item("username") <> "" Then
            Dim ds As DataSet = New DataSet
            Dim sql As String = "select * from User_bill  where Username = '" & Session.Item("Username") & "'"
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            txt_factory.Text = ds.Tables(0).Rows(0).Item("Company").ToString
        End If


    End Sub

    Private Sub get_and_set_JobID()
        Dim ds As DataSet = New DataSet
        Dim sql As String = "select * from Des_invoice order by id desc"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            Dim id As String = ds.Tables(0).Rows(0).Item("Docnumber").ToString.Replace("SNC-", "")
            Dim date_N As DateTime = Date.Now.ToShortDateString
            If id.Substring(id.IndexOf("-") + 1, 2) = date_N.ToString("MM") Then
                Dim Runnum As Integer = CInt(id.Substring(id.LastIndexOf("-") + 1, 4)) + 1
                Dim format_Runnum As String = Runnum.ToString("D4")
                Dim year As String = date_N.ToString("yyyy")
                Dim month As String = date_N.ToString("MM")
                Dim id_job As String = "SNC-" + year + "-" + month + "-" + format_Runnum
                txt_job_id.Text = id_job
            Else
                Dim Runnum As Integer = 1
                Dim format_Runnum As String = Runnum.ToString("D4")
                Dim month As String = date_N.ToString("MM")
                Dim year As String = date_N.ToString("yyyy")
                Dim id_job As String = "SNC-" + year + "-" + month + "-" + format_Runnum
                txt_job_id.Text = id_job
            End If
        Else
            Dim Runnum As Integer = 1
            Dim format_Runnum As String = Runnum.ToString("D4")
            Dim date_N As DateTime = Date.Now.ToShortDateString
            Dim month As String = date_N.ToString("MM")
            Dim year As String = date_N.ToString("yyyy")
            Dim id_job As String = "SNC-" + year + "-" + month + "-" + format_Runnum
            txt_job_id.Text = id_job
        End If
        txt_pay_rate.Text = "0.00"
        txt_rate_vat.Text = "0.00"

    End Sub
    Function get_and_Check_JobID()
        Dim id_job_check As String
        Dim ds As DataSet = New DataSet
        ' Dim sql As String = "select * from Des_invoice order by id desc"
        Dim sql As String = "select * from Des_invoice order by Docnumber desc"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            Dim id As String = ds.Tables(0).Rows(0).Item("Docnumber").ToString.Replace("SNC-", "")
            Dim date_N As DateTime = Date.Now.ToShortDateString
            If id.Substring(id.IndexOf("-") + 1, 2) = date_N.ToString("MM") Then
                Dim Runnum As Integer = CInt(id.Substring(id.LastIndexOf("-") + 1, 4)) + 1
                Dim format_Runnum As String = Runnum.ToString("D4")
                Dim year As String = date_N.ToString("yyyy")
                Dim month As String = date_N.ToString("MM")
                Dim id_job As String = "SNC-" + year + "-" + month + "-" + format_Runnum
                txt_job_id.Text = id_job
                id_job_check = id_job
            Else
                Dim Runnum As Integer = 1
                Dim format_Runnum As String = Runnum.ToString("D4")
                Dim month As String = date_N.ToString("MM")
                Dim year As String = date_N.ToString("yyyy")
                Dim id_job As String = "SNC-" + year + "-" + month + "-" + format_Runnum
                txt_job_id.Text = id_job
                id_job_check = id_job
            End If
        Else
            Dim Runnum As Integer = 1
            Dim format_Runnum As String = Runnum.ToString("D4")
            Dim date_N As DateTime = Date.Now.ToShortDateString
            Dim month As String = date_N.ToString("MM")
            Dim year As String = date_N.ToString("yyyy")
            Dim id_job As String = "SNC-" + year + "-" + month + "-" + format_Runnum
            txt_job_id.Text = id_job
            id_job_check = id_job
        End If
        txt_pay_rate.Text = "0.00"
        txt_rate_vat.Text = "0.00"
        Return id_job_check

    End Function
    Private Sub set_dataset_add_invioce()
        ds_bill_supplier = Session(Session.Item("username") + "dscheck_create_job")
        ds_bill_supplier.Tables.Add("Supplier")
        ds_bill_supplier.Tables(0).Columns.Add("Jobid", GetType(String))
        ds_bill_supplier.Tables(0).Columns.Add("Factory", GetType(String))
        ds_bill_supplier.Tables(0).Columns.Add("Number_invoice", GetType(String))
        'ds_bill_supplier.Tables(0).Columns.Add("Invoice_number", GetType(String))
        ds_bill_supplier.Tables(0).Columns.Add("Description", GetType(String))
        ds_bill_supplier.Tables(0).Columns.Add("Date_invoice", GetType(Date))
        ds_bill_supplier.Tables(0).Columns.Add("invioce_money", GetType(Double))
        ds_bill_supplier.Tables(0).Columns.Add("amount_money", GetType(Double))
        ds_bill_supplier.Tables(0).Columns.Add("vat_rate", GetType(String))
        ds_bill_supplier.Tables(0).Columns.Add("amount_vat", GetType(Double))
        ds_bill_supplier.Tables(0).Columns.Add("total_money", GetType(Double))
        ds_bill_supplier.Tables(0).Columns.Add("status_vat", GetType(Boolean))

        ds_bill_supplier_file_upload = Session(Session.Item("username") + "dsfile_upload_create")
        ds_bill_supplier_file_upload.Tables.Add("Supplier")
        ds_bill_supplier_file_upload.Tables(0).Columns.Add("Docnumber", GetType(String))
        ds_bill_supplier_file_upload.Tables(0).Columns.Add("fileName", GetType(String))
        ds_bill_supplier_file_upload.Tables(0).Columns.Add("Userupload", GetType(String))
        ds_bill_supplier_file_upload.Tables(0).Columns.Add("dataFile", GetType(Byte()))
        ds_bill_supplier_file_upload.Tables(0).Columns.Add("contentType", GetType(String))
        ds_bill_supplier_file_upload.Tables(0).Columns.Add("statusSent", GetType(Boolean))
    End Sub

    Protected Sub btn_Add_invoice_Click(sender As Object, e As EventArgs) Handles btn_Add_invoice.Click
        ds_bill_supplier = Session(Session.Item("username") + "dscheck_create_job")
        ds_bill_supplier_file_upload = Session(Session.Item("username") + "dsfile_upload_create")
        Dim bCHK_vat As Boolean = False
        Dim amount_vat As Decimal = 0

        If txt_pay_rate.Text = "" Or CInt(txt_pay_rate.Text) < 0 Or txt_rate_vat.Text = "" Or CInt(txt_rate_vat.Text) < 0 Then
            bCHK_vat = False
        Else
            bCHK_vat = True
            amount_vat = (CDbl(txt_pay_rate.Text) * CDbl(txt_rate_vat.Text)) / 100
            amount_vat = Math.Round(amount_vat, 2, MidpointRounding.AwayFromZero)
        End If
        '***************************
        Dim txt_moneys As Decimal = CDbl(txt_money.Text)
        txt_moneys = txt_moneys - amount_vat
        txt_moneys = Math.Round(txt_moneys, 2, MidpointRounding.AwayFromZero)
        '***********************************
        If txt_date_invoice.Text = "" Or txt_factory.Text = "" Or txt_invoice_number.Text = "" Or txt_money.Text = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Nothing_Data", "Nothing_Data();", True)
            Return
        End If
        If bCHK_vat = True Then
            'ds_bill_supplier.Tables(0).Rows.Add(txt_job_id.Text, txt_factory.Text, txt_invoice_number.Text.ToUpper, txt_des.Text, txt_date_invoice.Text, txt_money.Text, txt_pay_rate.Text, txt_rate_vat.Text + "%", amount_vat, CDbl(txt_money.Text) - amount_vat, 1)
            ds_bill_supplier.Tables(0).Rows.Add(txt_job_id.Text, txt_factory.Text, txt_invoice_number.Text.ToUpper, txt_des.Text, txt_date_invoice.Text, txt_money.Text, txt_pay_rate.Text, txt_rate_vat.Text + "%", amount_vat, txt_moneys, 1)


        Else
            'ds_bill_supplier.Tables(0).Rows.Add(txt_job_id.Text, txt_factory.Text, txt_invoice_number.Text.ToUpper, txt_des.Text, txt_date_invoice.Text, txt_money.Text, txt_pay_rate.Text, txt_rate_vat.Text + "%", amount_vat, CDbl(txt_money.Text) - amount_vat, 0)
            ds_bill_supplier.Tables(0).Rows.Add(txt_job_id.Text, txt_factory.Text, txt_invoice_number.Text.ToUpper, txt_des.Text, txt_date_invoice.Text, txt_money.Text, txt_pay_rate.Text, txt_rate_vat.Text + "%", amount_vat, txt_moneys, 0)

        End If
        Session(Session.Item("username") + "dscheck_create_job") = ds_bill_supplier
        BindGridView()
        txt_invoice_number.Text = ""
        txt_date_invoice.Text = ""
        txt_des.Text = ""
        txt_money.Text = ""
        txt_pay_rate.Text = "0.00"
        txt_rate_vat.Text = "0.00"
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        ds_bill_supplier = Session(Session.Item("username") + "dscheck_create_job")
        ds_bill_supplier_file_upload = Session(Session.Item("username") + "dsfile_upload_create")
        Dim dr As GridViewRow
        dr = e.CommandSource.NamingContainer
        Dim index As Integer = dr.RowIndex
        Select Case e.CommandName
            Case "Delete1"
                Dim confirmValue As String = Request.Form("confirm_value")
                If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
                    ds_bill_supplier.Tables(0).Rows(index).Delete()
                    Session(Session.Item("username") + "dscheck_create_job") = ds_bill_supplier
                    BindGridView()
                End If
        End Select
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim servicename As Decimal = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "total_money"))
            sum_total += servicename
        End If
        If e.Row.RowType = DataControlRowType.Footer Then
            'e.Row.Cells(3).Text = "Total : " + String.Format("{0:C2}", sum_total)
            e.Row.Cells(7).Text = "Total : "
            e.Row.Cells(8).Text = FormatCurrency(sum_total).Replace("£", "")
        End If
    End Sub

    Protected Sub btn_add_vat_Click(sender As Object, e As EventArgs)
        If txt_pay_rate.Text <> "" And txt_rate_vat.Text <> "" Then
            ds_vat.Tables(0).Rows.Add(txt_job_id.Text, txt_pay_rate.Text, txt_rate_vat.Text + "%", (CInt(txt_pay_rate.Text) * CInt(txt_rate_vat.Text)) / 100)


            ' GridView2.DataSource = ds_vat.Tables(0)
            ' GridView2.DataBind()

            txt_rate_vat.Text = "0.00"
            txt_pay_rate.Text = "0.00"
        End If

    End Sub

    'Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
    '    txt_date_invoice.Text = Calendar1.SelectedDate.ToShortDateString
    '    Calendar1.SelectedDate = "01-01-2000"
    '    Calendar1.Visible = False

    'End Sub

    'Protected Sub lnk_get_date_Click(sender As Object, e As EventArgs)
    '    Calendar1.Visible = True
    'End Sub

    Protected Sub GridView2_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        'If e.Row.RowType = DataControlRowType.DataRow Then
        '    Dim servicename As Double = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Money"))
        '    sum_total += servicename
        'End If
        'If e.Row.RowType = DataControlRowType.Footer Then
        '    'e.Row.Cells(3).Text = "Total : " + String.Format("{0:C2}", sum_total)
        '    e.Row.Cells(3).Text = "Total : " + FormatCurrency(sum_total).Replace("$", "")
        'End If
    End Sub
    Private Sub BindGridView()
        GridView1.DataSource = ds_bill_supplier.Tables(0)
        GridView1.DataBind()
        GridView2.DataSource = ds_bill_supplier_file_upload.Tables(0)
        GridView2.DataBind()
        Datetimepicker()
    End Sub
    Private Sub Datetimepicker()
        Dim script As String = " 
               $(function () {
                     $('.form_datetime_ingridview').datepicker({
                            changeMonth: true,
                            changeYear: true,
                            format: 'dd-mm-yyyy',
                            language: 'tr',
                            autoclose: true

                         });
                     }); 
                $(function () {
                      $('.form_datetime ').datepicker({
                              changeMonth: true,
                              changeYear: true,
                              format: 'dd/mm/yyyy',
                              language: 'tr',
                              autoclose: true
                            });
                   });
            "
        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "a", script, True)
    End Sub
    Protected Sub GridView2_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        ds_bill_supplier = Session(Session.Item("username") + "dscheck_create_job")
        ds_bill_supplier_file_upload = Session(Session.Item("username") + "dsfile_upload_create")
        Dim dr As GridViewRow
        dr = e.CommandSource.NamingContainer
        ' dr = DirectCast(e.CommandSource.NamingContainer, GridViewRow)

        Dim index As Integer = dr.RowIndex
        Select Case e.CommandName
            Case "Delete1"
                Dim confirmValue As String = Request.Form("confirm_value")
                If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
                    ds_bill_supplier_file_upload.Tables(0).Rows(index).Delete()
                    Session(Session.Item("username") + "file_upload") = ds_bill_supplier_file_upload
                    BindGridView()
                End If
            Case "Edit"

        End Select
    End Sub

    Protected Sub btn_Save_Click(sender As Object, e As EventArgs) Handles btn_Save.Click
        ds_bill_supplier = Session(Session.Item("username") + "dscheck_create_job")
        ds_bill_supplier_file_upload = Session(Session.Item("username") + "dsfile_upload_create")
        bcheck_create_job = Session(Session.Item("username") + "bcheck_create_job")

        If bcheck_create_job = False Then
            Dim ds_user As DataSet = New DataSet
            Dim sql_user As String = "select * from User_bill  where Username = '" & Session.Item("Username") & "'"
            Dim ap_user As SqlDataAdapter = New SqlDataAdapter(sql_user, connection)
            ap_user.Fill(ds_user)
            Dim iBool As Integer = 0
            Dim ds As DataSet = New DataSet
            Dim sql As String = ""

            '  If txt_email.Text <> "" Then
            If ds_bill_supplier.Tables(0).Rows.Count > 0 Then '*****
                Dim id_job As String = ""
                'id_job = get_and_Check_JobID()
                clc_tb = New class_table
                id_job = clc_tb.get_and_Check_JobID
                '/////////////////////////////////////
                Dim ds_Withholding_Tax As New DataSet
                ds_Withholding_Tax.Tables.Add()
                ds_Withholding_Tax.Tables(0).Columns.Add("withholdingTax", GetType(Decimal))
                ds_Withholding_Tax.Tables(0).Columns.Add("taxrate", GetType(Decimal))
                ds_Withholding_Tax.Tables(0).Columns.Add("total", GetType(Decimal))
                Dim wt As Decimal = 0.00, tr As Decimal = 0.00, totaltax As Decimal = 0.00
                For i = 0 To ds_bill_supplier.Tables(0).Rows.Count - 1
                    If ds_Withholding_Tax.Tables(0).Rows.Count > 0 Then
                        Dim Badd As Boolean = False
                        wt = 0
                        tr = 0
                        totaltax = 0
                        For j = 0 To ds_Withholding_Tax.Tables(0).Rows.Count - 1
                            If CDbl(ds_bill_supplier.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "")) = CDbl(ds_Withholding_Tax.Tables(0).Rows(j).Item("taxrate").ToString) Then
                                Badd = True
                                wt = CDbl(ds_Withholding_Tax.Tables(0).Rows(j).Item("withholdingTax").ToString)
                                wt = wt + ds_bill_supplier.Tables(0).Rows(i).Item("amount_money")
                                tr = ds_bill_supplier.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "")
                                totaltax = (wt * tr) / 100
                                totaltax = Math.Round(totaltax, 2, MidpointRounding.AwayFromZero)
                                ds_Withholding_Tax.Tables(0).Rows(j).Item("withholdingTax") = wt
                                ds_Withholding_Tax.Tables(0).Rows(j).Item("taxrate") = tr
                                ds_Withholding_Tax.Tables(0).Rows(j).Item("total") = totaltax
                                Exit For
                            End If
                        Next
                        If Badd = False Then
                            wt = ds_bill_supplier.Tables(0).Rows(i).Item("amount_money")
                            tr = ds_bill_supplier.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "")
                            totaltax = (wt * tr) / 100
                            totaltax = Math.Round(totaltax, 2, MidpointRounding.AwayFromZero)
                            ds_Withholding_Tax.Tables(0).Rows.Add(wt, tr, totaltax)
                        End If
                    Else
                        wt = ds_bill_supplier.Tables(0).Rows(i).Item("amount_money")
                        tr = ds_bill_supplier.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "")
                        totaltax = (wt * tr) / 100
                        totaltax = Math.Round(totaltax, 2, MidpointRounding.AwayFromZero)
                        ds_Withholding_Tax.Tables(0).Rows.Add(wt, tr, totaltax)
                    End If
                Next
                Dim totals_a As Decimal = 0
                If ds_Withholding_Tax.Tables(0).Rows.Count > 0 Then
                    For i = 0 To ds_Withholding_Tax.Tables(0).Rows.Count - 1
                        totals_a += CDbl(ds_Withholding_Tax.Tables(0).Rows(i).Item("total"))
                    Next
                End If
                Dim totals_amount As Decimal = 0
                For i = 0 To ds_bill_supplier.Tables(0).Rows.Count - 1
                    totals_amount += CDbl(ds_bill_supplier.Tables(0).Rows(i).Item("invioce_money"))
                Next
                '////////////////////////////
                For i = 0 To ds_bill_supplier.Tables(0).Rows.Count - 1
                    If ds_bill_supplier.Tables(0).Rows(i).Item("status_vat") = True Then
                        iBool = 1
                    Else
                        iBool = 0
                    End If
                    sql += " insert into Des_invoice values('" & id_job.Replace("'", "''") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Description").ToString.Replace("'", "''") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Factory").Replace("'", "''") & "','" & CDate(ds_bill_supplier.Tables(0).Rows(i).Item("Date_invoice").ToString).ToString("yyyy-MM-dd") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Number_invoice").Replace("'", "''") & "','" & ds_user.Tables(0).Rows(0).Item("Email").Replace("'", "''") & "',0," & ds_bill_supplier.Tables(0).Rows(i).Item("invioce_money") & ",'" & Session.Item("username").ToString.Replace("'", "''") & "',GETDATE()," & ds_bill_supplier.Tables(0).Rows(i).Item("amount_money") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("amount_vat") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("total_money") & "," & iBool & ",null," & totals_amount - totals_a & ",null,0,null,0,null,0,0,0)"
                    'sql += " insert into Des_invoice values('" & id_job.Replace("'", "''") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Description").ToString.Replace("'", "''") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Factory").Replace("'", "''") & "','" & CDate(ds_bill_supplier.Tables(0).Rows(i).Item("Date_invoice").ToString).ToString("yyyy-MM-dd") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Invoice_number").Replace("'", "''") & "','" & ds_user.Tables(0).Rows(0).Item("Email").Replace("'", "''") & "',0," & ds_bill_supplier.Tables(0).Rows(i).Item("Money") & ",'" & Session.Item("username").ToString.Replace("'", "''") & "',GETDATE()," & ds_bill_supplier.Tables(0).Rows(i).Item("amount_money") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("amount_vat") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("total_money") & "," & iBool & ",null," & CDbl(GridView1.FooterRow.Cells(8).Text.Replace("'", "''")) & ",null,0,null,0,null,0,0,0)"
                    'sql += " insert into Des_invoice values('" & id_job.Replace("'", "''") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Description").ToString.Replace("'", "''") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Factory").Replace("'", "''") & "','" & CDate(ds_bill_supplier.Tables(0).Rows(i).Item("Date_invoice").ToString).ToString("yyyy-MM-dd") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Invoice_number").Replace("'", "''") & "','" & ds_user.Tables(0).Rows(0).Item("Email").Replace("'", "''") & "',0," & ds_bill_supplier.Tables(0).Rows(i).Item("Money") & ",'" & Session.Item("username").ToString.Replace("'", "''") & "',GETDATE()," & ds_bill_supplier.Tables(0).Rows(i).Item("amount_money") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("amount_vat") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("total_money") & "," & iBool & ",null," & CDbl(GridView1.FooterRow.Cells(8).Text.Replace("'", "''")) & ",null,0,null,0,null,0,0,0)"

                    'insert into Des_invoice values('SNC-2020-05-0002','TEST','SNC','2020-05-21','1112','nattiko@sncspundproof.com')
                Next
                sql += " insert into Log_Billing values('Create Billing :" & id_job & " ','Create Billing','" & id_job.ToUpper & "',GETDATE(),'" & Session.Item("username").ToString & "')"
                Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                Try
                    ap.Fill(ds)
                    For i = 0 To ds_bill_supplier_file_upload.Tables(0).Rows.Count - 1
                        Dim Docnumber As String = ""
                        Dim fileName As String = ""
                        Dim Userupload As String = ""
                        Dim dataFile As Byte() = Nothing
                        Dim contentType As String = ""
                        Docnumber = ds_bill_supplier_file_upload.Tables(0).Rows(i).Item("Docnumber")
                        fileName = ds_bill_supplier_file_upload.Tables(0).Rows(i).Item("fileName")
                        Userupload = ds_bill_supplier_file_upload.Tables(0).Rows(i).Item("Userupload")
                        dataFile = ds_bill_supplier_file_upload.Tables(0).Rows(i).Item("dataFile")
                        contentType = ds_bill_supplier_file_upload.Tables(0).Rows(i).Item("contentType")

                        Using con As New SqlConnection(connection)
                            Dim query As String = " INSERT INTO [dbo].[Des_invoice_file_upload] ([Docnumber], [fileName], [dateUpload], [dateTimeUpload], [Userupload], [dataFile], [contentType], [statusSent]) VALUES 
                ( @Docnumber, @fileName, GETDATE(), GETDATE(), @Userupload, @dataFile, @contentType, 0)"
                            query += " insert into Log_Billing values('Upload Reciept :@fileName','Upload Reciept',@Docnumber,GETDATE(),'" & Session.Item("username").ToString & "')"
                            Using cmd As New SqlCommand(query)
                                cmd.Connection = con
                                cmd.Parameters.AddWithValue("@Docnumber", id_job.Replace("'", "''"))
                                cmd.Parameters.AddWithValue("@fileName", fileName)
                                cmd.Parameters.AddWithValue("@Userupload", Session.Item("username"))
                                cmd.Parameters.AddWithValue("@dataFile", dataFile)
                                cmd.Parameters.AddWithValue("@contentType", contentType)
                                con.Open()
                                cmd.ExecuteNonQuery()
                                con.Close()
                            End Using
                        End Using
                    Next
                    Try
                        Session.Remove(Session.Item("username") + "bcheck_create_job")
                    Catch ex As Exception
                    Finally
                        bcheck_create_job = True
                        Session(Session.Item("username") + "bcheck_create_job") = bcheck_create_job

                        'bcheck_create_job = True
                        'Session(Session.Item("username") + "bcheck_create_job") = bcheck_create_job
                    End Try

                    send_email_Tranfer_all(get_current_email, id_job.ToUpper, Format(Now, "yyyy-MM-dd"), "Billing")
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "complete_send_data", "complete_send_data();", True)


                Catch ex As Exception
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "complete_eRROR_send_data", "complete_eRROR_send_data();", True)
                End Try
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Nothing_Data", "Nothing_Data();", True)
            End If
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "complete_send_data", "complete_send_data();", True)
        End If

    End Sub


    Protected Sub btn_upload_Click(sender As Object, e As EventArgs)
        Try
            ds_bill_supplier = Session(Session.Item("username") + "dscheck_create_job")
            ds_bill_supplier_file_upload = Session(Session.Item("username") + "dsfile_upload_create")
            Dim empFilename As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
            If empFilename <> String.Empty Then
                'fetch the file content type of the file  
                Dim FilecontentType As String = FileUpload1.PostedFile.ContentType
                'reads a content of the file  
                Using s As Stream = FileUpload1.PostedFile.InputStream
                    Using br As New BinaryReader(s)
                        If s.Length < 10485760 Then
                            Dim Databytes As Byte() = br.ReadBytes(CInt(s.Length))
                            ds_bill_supplier_file_upload.Tables(0).Rows.Add(txt_job_id.Text, empFilename, Session.Item("username"), Databytes, FilecontentType, False)
                            BindGridView()
                        Else
                            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Filemaximum10MB", "Filemaximum10MB();", True)
                        End If
                    End Using
                End Using

            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "complete_eRROR_send_data", "complete_eRROR_send_data();", True)
        End Try

    End Sub

    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        BindGridView()
        GridView1.Columns(10).Visible = False
    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        GridView1.EditIndex = -1
        BindGridView()
        GridView1.Columns(10).Visible = True
    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        GridView1.Columns(10).Visible = True
        GridView1.EditIndex = -1
        Dim RowsIndex As Integer = e.RowIndex
        ds_bill_supplier.Tables(0).Rows(RowsIndex).Item("Date_invoice") = e.NewValues.Item("Date_invoice")
        ds_bill_supplier.Tables(0).Rows(RowsIndex).Item("Number_invoice") = e.NewValues.Item("Number_invoice")
        ds_bill_supplier.Tables(0).Rows(RowsIndex).Item("Description") = e.NewValues.Item("Description")
        ds_bill_supplier.Tables(0).Rows(RowsIndex).Item("invioce_money") = e.NewValues.Item("invioce_money")
        ds_bill_supplier.Tables(0).Rows(RowsIndex).Item("amount_money") = e.NewValues.Item("amount_money")
        ds_bill_supplier.Tables(0).Rows(RowsIndex).Item("vat_rate") = e.NewValues.Item("vat_rate").ToString.Replace("%", "") + "%"
        ds_bill_supplier.Tables(0).Rows(RowsIndex).Item("amount_vat") = Math.Round(((CDbl(e.NewValues.Item("amount_money")) * CInt(e.NewValues.Item("vat_rate").ToString.Replace("%", ""))) / 100), 2, MidpointRounding.AwayFromZero)    ' e.NewValues.Item("amount_vat")
        ds_bill_supplier.Tables(0).Rows(RowsIndex).Item("total_money") = (CDec(e.NewValues.Item("invioce_money"))) - CDec(ds_bill_supplier.Tables(0).Rows(RowsIndex).Item("amount_vat"))
        BindGridView()
    End Sub


    Private Function UploadExcel(filePath As Stream) As DataSet
        Dim excelReader As IExcelDataReader = ExcelReaderFactory.CreateReader(filePath)
        Dim result As DataSet = excelReader.AsDataSet()
        excelReader.Close()
        Return result
    End Function


    Protected Sub btn_UploadExcel_Click(sender As Object, e As EventArgs) Handles btn_UploadExcel.Click
        ds_bill_supplier = Session(Session.Item("username") + "dscheck_create_job")
        ds_bill_supplier_file_upload = Session(Session.Item("username") + "dsfile_upload_create")
        Dim s As Stream = FileUpload2.PostedFile.InputStream
        Dim ds As DataSet = UploadExcel(s)


        'Dim txt_moneys As Decimal = CDbl(txt_money.Text)
        'txt_moneys = txt_moneys - amount_vat
        'txt_moneys = Math.Round(txt_moneys, 2, MidpointRounding.AwayFromZero)

        If ds.Tables(0).Rows.Count > 0 Then
            Dim DateInvoice As Date = Nothing
            Dim invoiceNumber As String = String.Empty
            Dim descrition As String = String.Empty
            Dim amount As Decimal = 0
            Dim taxbase As Decimal = 0
            Dim tax_rate As Decimal = 0
            Dim WithholdingTax As Decimal = 0
            Dim TotalAmount As Decimal = 0

            For i = 1 To ds.Tables(0).Rows.Count - 1
                If Not IsDBNull(ds.Tables(0).Rows(i).Item(1)) Then
                    DateInvoice = DirectCast(ds.Tables(0).Rows(i).Item(1), Date)
                    invoiceNumber = DirectCast(ds.Tables(0).Rows(i).Item(2).ToString, String)
                    descrition = DirectCast(ds.Tables(0).Rows(i).Item(3), String)
                    amount = Math.Round(CDec(ds.Tables(0).Rows(i).Item(4)), 2, MidpointRounding.AwayFromZero)
                    taxbase = Math.Round(CDec(ds.Tables(0).Rows(i).Item(5)), 2, MidpointRounding.AwayFromZero)
                    tax_rate = Math.Round(CDec(ds.Tables(0).Rows(i).Item(6)), 2, MidpointRounding.AwayFromZero)
                    WithholdingTax = Math.Round(CDec(ds.Tables(0).Rows(i).Item(7)), 2, MidpointRounding.AwayFromZero)
                    TotalAmount = Math.Round(CDec(ds.Tables(0).Rows(i).Item(8)), 2, MidpointRounding.AwayFromZero)

                    ds_bill_supplier.Tables(0).Rows.Add(txt_job_id.Text, txt_factory.Text, invoiceNumber.ToUpper, descrition, DateInvoice.ToString("dd-MM-yyyy"),
                    amount, taxbase, tax_rate.ToString + "%", WithholdingTax, TotalAmount, 0)
                End If
            Next
            Session(Session.Item("username") + "dscheck_create_job") = ds_bill_supplier
            BindGridView()
        End If
    End Sub

    Protected Sub Link_download_format_Click(sender As Object, e As EventArgs)

        Dim bytes As Byte()
        Dim fileName As String, contentType As String
        Using con As New SqlConnection(connection)
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from Des_invoice_file_upload where Des_invoice_file_upload.[Docnumber]=@Docnumber"
                cmd.Parameters.AddWithValue("@Docnumber", "SNC_file_up_master_2021-10-04")
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    bytes = DirectCast(sdr("dataFile"), Byte())
                    contentType = sdr("ContentType").ToString()
                    fileName = sdr("fileName").ToString()
                End Using
                con.Close()
            End Using
        End Using
        Response.Clear()
        Response.Buffer = True
        Response.Charset = ""
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.ContentType = contentType
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
        Response.BinaryWrite(bytes)
        Response.Flush()
        Response.End()
    End Sub

    Protected Sub btnHideUpload_Click(sender As Object, e As EventArgs)

        Dim empFilename As String = Path.GetFileName(FileUpload3.PostedFile.FileName)
        If empFilename <> String.Empty Then
            'fetch the file content type of the file  
            Dim FilecontentType As String = FileUpload3.PostedFile.ContentType
            'reads a content of the file  
            Using s As Stream = FileUpload3.PostedFile.InputStream
                Using br As New BinaryReader(s)
                    If s.Length < 10485760 Then
                        Dim Databytes As Byte() = br.ReadBytes(CInt(s.Length))
                        Using con As New SqlConnection(connection)
                            Dim query As String = " update [dbo].[Des_invoice_file_upload] set [dataFile] =  @dataFile where Docnumber ='SNC_file_up_master_2021-10-04'"

                            Using cmd As New SqlCommand(query)
                                cmd.Connection = con
                                cmd.Parameters.AddWithValue("@dataFile", Databytes)
                                con.Open()
                                cmd.ExecuteNonQuery()
                                con.Close()
                            End Using
                        End Using
                    Else
                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Filemaximum10MB", "Filemaximum10MB();", True)
                    End If
                End Using
            End Using

        End If


    End Sub
End Class