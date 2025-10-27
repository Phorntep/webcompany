Imports System.Data.SqlClient
Imports System.IO

Public Class Billing_supplier_edit
    Inherits System.Web.UI.Page
    Dim sum_total As Double
    Dim ds_bill_supplier As DataSet
    Dim ds_bill_supplier_file_upload As DataSet
    Dim userCreate As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("username") <> "" Then
            sriptmanagerregister()

            If Not IsPostBack Then
                If Request.QueryString.Count > 0 Then
                    Dim ds_bill_supplier As New DataSet("Bill_supplier")
                    Dim ds_bill_supplier_file_upload As New DataSet("file_upload")
                    Session(Session.Item("username") + "edit") = ds_bill_supplier
                    Session(Session.Item("username") + "file_upload") = ds_bill_supplier_file_upload
                    Try
                        Session.Remove(Session.Item("username") + "edit")
                        Session.Remove(Session.Item("username") + "file_upload")

                    Catch ex As Exception
                    Finally
                        Session(Session.Item("username") + "edit") = ds_bill_supplier
                        Session(Session.Item("username") + "file_upload") = ds_bill_supplier_file_upload
                    End Try
                    set_dataset_add_invioce()
                    load_data(Request.QueryString("Payment").ToString)
                    If FN_Check_expire_password(Session.Item("username")) = True Then
                        Response.Redirect("..\Billing\Reset_password.aspx")
                    End If
                End If
            End If
        End If
    End Sub
    Private Sub sriptmanagerregister()
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        ScriptManager.RegisterPostBackControl(btn_upload)
        ScriptManager.RegisterPostBackControl(btn_Add_invoice)

    End Sub
    Private Sub load_file_upload(id As String)
        Dim dsfileUpload As DataSet = New DataSet
        Dim sqlfileUpload As String = $"select * from Des_invoice_file_upload where Docnumber='{id}'"
        Dim apfileUpload As SqlDataAdapter = New SqlDataAdapter(sqlfileUpload, connection)
        apfileUpload.Fill(dsfileUpload)

        If dsfileUpload.Tables(0).Rows.Count > 0 Then
            Dim Docnumber As String = ""
            Dim fileName As String = ""
            Dim Userupload As String = ""
            Dim dataFile As Byte() = Nothing
            Dim contentType As String = ""
            Dim statusSent As Boolean = False

            For i = 0 To dsfileUpload.Tables(0).Rows.Count - 1
                Docnumber = dsfileUpload.Tables(0).Rows(i).Item("Docnumber")
                fileName = dsfileUpload.Tables(0).Rows(i).Item("fileName")
                Userupload = dsfileUpload.Tables(0).Rows(i).Item("Userupload")
                dataFile = dsfileUpload.Tables(0).Rows(i).Item("dataFile")
                contentType = dsfileUpload.Tables(0).Rows(i).Item("contentType")
                statusSent = dsfileUpload.Tables(0).Rows(i).Item("statusSent")

                ds_bill_supplier_file_upload.Tables(0).Rows.Add(Docnumber, fileName, Userupload, dataFile, contentType, statusSent)
            Next
            GridView2.DataSource = ds_bill_supplier_file_upload.Tables(0)
            GridView2.DataBind()
        End If

    End Sub
    Private Sub load_data(toString As String)
        ds_bill_supplier = Session(Session.Item("username") + "edit")
        ds_bill_supplier_file_upload = Session(Session.Item("username") + "file_upload")
        Dim ds As DataSet = New DataSet
        Dim sql As String = "select * from Des_invoice where Docnumber='" & toString & "' select * from vat where Docnumber='" & toString & "' "
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)

        Dim ds2 As DataSet = New DataSet
        Dim sql2 As String = "select * from User_bill where Username='" & ds.Tables(0).Rows(0).Item("userCreate").ToString & "'"
        Dim ap2 As SqlDataAdapter = New SqlDataAdapter(sql2, connection)
        ap2.Fill(ds2)
        '************

        Dim ds_lv As DataSet = get_Lv(Session.Item("username"))
        If ds_lv.Tables(0).Rows.Count > 0 Then

            If CInt(ds_lv.Tables(0).Rows(0).Item("Level")) >= 3 Then '' level 3 
                If ds.Tables(0).Rows.Count > 0 And ds2.Tables(0).Rows.Count > 0 Then
                    Dim Jobid As String = ""
                    Dim Factory As String = ""
                    Dim Number_invoice As String = ""
                    Dim Description As String = ""
                    Dim Date_invoice As Date
                    Dim invioce_money As Double = 0
                    Dim amount_money As Double = 0
                    Dim vat_rate As String = ""
                    Dim amount_vat As Double = 0
                    Dim total_money As Double = 0
                    Dim status_vat As Boolean = 0


                    For i = 0 To ds.Tables(0).Rows.Count - 1
                        Jobid = ds.Tables(0).Rows(i).Item("Docnumber")
                        Factory = ds.Tables(0).Rows(i).Item("Factory")
                        Number_invoice = ds.Tables(0).Rows(i).Item("Number_invoice")
                        Description = ds.Tables(0).Rows(i).Item("Description")
                        Date_invoice = ds.Tables(0).Rows(i).Item("Date_invoice")
                        invioce_money = ds.Tables(0).Rows(i).Item("invioce_money")
                        amount_money = ds.Tables(0).Rows(i).Item("amount_money")
                        vat_rate = ds.Tables(0).Rows(i).Item("vat_rate")
                        amount_vat = ds.Tables(0).Rows(i).Item("amount_vat")
                        total_money = ds.Tables(0).Rows(i).Item("total_money")

                        Session.Remove(Session.Item("userCreate"))
                        Session.Add("userCreate", ds.Tables(0).Rows(i).Item("userCreate") + "Create")
                        userCreate = Session("userCreate")

                        ds_bill_supplier.Tables(0).Rows.Add(Jobid, Factory, Number_invoice.ToUpper, Description, Date_invoice, invioce_money, amount_money, vat_rate + "%", amount_vat, total_money, 1, userCreate)

                    Next
                    GridView1.DataSource = ds_bill_supplier.Tables(0)
                    GridView1.DataBind()
                    txt_job_id.Text = ds.Tables(0).Rows(0).Item("Docnumber").ToString
                    txt_factory.Text = ds.Tables(0).Rows(0).Item("Factory").ToString
                    load_file_upload(ds.Tables(0).Rows(0).Item("Docnumber").ToString)

                End If
            Else
                Dim ds3 As DataSet = New DataSet()
                ds3 = get_Lv(Session.Item("username").ToString)
                If ds3.Tables(0).Rows(0).Item("Company") = ds.Tables(0).Rows(0).Item("Factory").ToString Then

                    '     If Session.Item("username") = ds.Tables(0).Rows(0).Item("userCreate").ToString Then
                    If ds.Tables(0).Rows.Count > 0 And ds2.Tables(0).Rows.Count > 0 Then
                        Dim Jobid As String = ""
                        Dim Factory As String = ""
                        Dim Number_invoice As String = ""
                        Dim Description As String = ""
                        Dim Date_invoice As Date
                        Dim invioce_money As Double = 0
                        Dim amount_money As Double = 0
                        Dim vat_rate As String = ""
                        Dim amount_vat As Double = 0
                        Dim total_money As Double = 0
                        Dim status_vat As Boolean = 0

                        For i = 0 To ds.Tables(0).Rows.Count - 1
                            Jobid = ds.Tables(0).Rows(i).Item("Docnumber")
                            Factory = ds.Tables(0).Rows(i).Item("Factory")
                            Number_invoice = ds.Tables(0).Rows(i).Item("Number_invoice")
                            Description = ds.Tables(0).Rows(i).Item("Description")
                            Date_invoice = ds.Tables(0).Rows(i).Item("Date_invoice")
                            invioce_money = ds.Tables(0).Rows(i).Item("invioce_money")
                            amount_money = ds.Tables(0).Rows(i).Item("amount_money")
                            vat_rate = ds.Tables(0).Rows(i).Item("vat_rate")
                            amount_vat = ds.Tables(0).Rows(i).Item("amount_vat")
                            total_money = ds.Tables(0).Rows(i).Item("total_money")
                            Session.Remove(Session.Item("userCreate"))
                            Session.Add("userCreate", ds.Tables(0).Rows(i).Item("userCreate") + "Create")
                            userCreate = Session("userCreate")

                            ds_bill_supplier.Tables(0).Rows.Add(Jobid, Factory, Number_invoice.ToUpper, Description, Date_invoice, invioce_money, amount_money, vat_rate + "%", amount_vat, total_money, 1, userCreate)
                        Next
                        GridView1.DataSource = ds_bill_supplier.Tables(0)
                        GridView1.DataBind()
                        txt_job_id.Text = ds.Tables(0).Rows(0).Item("Docnumber").ToString
                        txt_factory.Text = ds.Tables(0).Rows(0).Item("Factory").ToString
                        load_file_upload(ds.Tables(0).Rows(0).Item("Docnumber").ToString)
                    End If
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Not_owner_job", "Not_owner_job();", True)
                End If
            End If
        End If
    End Sub
    Private Sub set_dataset_add_invioce()
        ds_bill_supplier = Session(Session.Item("username") + "edit")
        ds_bill_supplier.Tables.Add("Supplier")
        ds_bill_supplier.Tables(0).Columns.Add("Jobid", GetType(String))
        ds_bill_supplier.Tables(0).Columns.Add("Factory", GetType(String))
        ds_bill_supplier.Tables(0).Columns.Add("Number_invoice", GetType(String)) '2
        ds_bill_supplier.Tables(0).Columns.Add("Description", GetType(String)) '3
        ds_bill_supplier.Tables(0).Columns.Add("Date_invoice", GetType(Date)) '1
        ds_bill_supplier.Tables(0).Columns.Add("invioce_money", GetType(Double)) '4
        ds_bill_supplier.Tables(0).Columns.Add("amount_money", GetType(Double)) '5
        ds_bill_supplier.Tables(0).Columns.Add("vat_rate", GetType(String)) '6
        ds_bill_supplier.Tables(0).Columns.Add("amount_vat", GetType(Double)) '7
        ds_bill_supplier.Tables(0).Columns.Add("total_money", GetType(Double)) '8
        ds_bill_supplier.Tables(0).Columns.Add("status_vat", GetType(Boolean))
        ds_bill_supplier.Tables(0).Columns.Add("userCreate", GetType(String))



        ds_bill_supplier_file_upload = Session(Session.Item("username") + "file_upload")
        ds_bill_supplier_file_upload.Tables.Add("Supplier")
        ds_bill_supplier_file_upload.Tables(0).Columns.Add("Docnumber", GetType(String))
        ds_bill_supplier_file_upload.Tables(0).Columns.Add("fileName", GetType(String))
        ds_bill_supplier_file_upload.Tables(0).Columns.Add("Userupload", GetType(String))
        ds_bill_supplier_file_upload.Tables(0).Columns.Add("dataFile", GetType(Byte()))
        ds_bill_supplier_file_upload.Tables(0).Columns.Add("contentType", GetType(String))
        ds_bill_supplier_file_upload.Tables(0).Columns.Add("statusSent", GetType(Boolean))


        'ds_vat = New DataSet
        'ds_vat.Tables.Add("Vat")
        'ds_vat.Tables(0).Columns.Add("Jobid", GetType(String))
        'ds_vat.Tables(0).Columns.Add("Amount_vat", GetType(Double))
        'ds_vat.Tables(0).Columns.Add("Vat_rate", GetType(String))
        'ds_vat.Tables(0).Columns.Add("pay_rate", GetType(Double))
    End Sub

    Protected Sub lnk_get_date_Click(sender As Object, e As EventArgs)
        ' Calendar1.Visible = True
    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs)
        ' txt_date_invoice.Text = Calendar1.SelectedDate.ToShortDateString
        ' Calendar1.SelectedDate = "01-01-2000"
        ' Calendar1.Visible = False
    End Sub

    Protected Sub btn_Add_invoice_Click(sender As Object, e As EventArgs) Handles btn_Add_invoice.Click
        ds_bill_supplier = Session(Session.Item("username") + "edit")
        ds_bill_supplier_file_upload = Session(Session.Item("username") + "file_upload")
        Dim bCHK_vat As Boolean = False
        Dim amount_vat As Double = 0
        'Dim _txt_pay_rate As Double = CInt(txt_pay_rate.Text)
        'Dim _txt_rate_vat As Double = CInt(txt_rate_vat.Text)


        If txt_pay_rate.Text = "" Or CInt(txt_pay_rate.Text) < 0 Or txt_rate_vat.Text = "" Or CInt(txt_rate_vat.Text) < 0 Then
            bCHK_vat = False
        Else
            bCHK_vat = True
            amount_vat = (CDbl(txt_pay_rate.Text) * CInt(txt_rate_vat.Text)) / 100
            amount_vat = Math.Round(amount_vat, 2, MidpointRounding.AwayFromZero)
        End If
        '***************************
        Dim txt_moneys As Double = CDbl(txt_money.Text)
        txt_moneys = txt_moneys - amount_vat
        txt_moneys = Math.Round(txt_moneys, 2, MidpointRounding.AwayFromZero)
        '***********************************
        If txt_date_invoice.Text = "" Or txt_factory.Text = "" Or txt_invoice_number.Text = "" Or txt_money.Text = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Nothing_Data", "Nothing_Data();", True)
            Return
        End If
        If bCHK_vat = True Then
            userCreate = Session("userCreate")
            ds_bill_supplier.Tables(0).Rows.Add(txt_job_id.Text, txt_factory.Text, txt_invoice_number.Text.ToUpper, txt_des.Text, txt_date_invoice.Text, txt_money.Text, txt_pay_rate.Text, txt_rate_vat.Text + "%", amount_vat, txt_moneys, 1, userCreate)
            'ds_bill_supplier.Tables(0).Rows.Add(txt_job_id.Text, txt_factory.Text, txt_invoice_number.Text.ToUpper, txt_des.Text, txt_date_invoice.Text, txt_money.Text, txt_pay_rate.Text, txt_rate_vat.Text + "%", amount_vat, CDbl(txt_money.Text) - amount_vat, 1)
            'ds_bill_supplier.Tables(0).Rows.Add(txt_job_id.Text, txt_factory.Text, txt_invoice_number.Text, txt_des.Text, Nothing, txt_money.Text)
        Else
            userCreate = Session("userCreate")
            ds_bill_supplier.Tables(0).Rows.Add(txt_job_id.Text, txt_factory.Text, txt_invoice_number.Text.ToUpper, txt_des.Text, txt_date_invoice.Text, txt_money.Text, txt_pay_rate.Text, txt_rate_vat.Text + "%", amount_vat, txt_moneys, 0, userCreate)
            'ds_bill_supplier.Tables(0).Rows.Add(txt_job_id.Text, txt_factory.Text, txt_invoice_number.Text.ToUpper, txt_des.Text, txt_date_invoice.Text, txt_money.Text, txt_pay_rate.Text, txt_rate_vat.Text + "%", amount_vat, CDbl(txt_money.Text) - amount_vat, 0)
        End If
        BindGridView()
        txt_invoice_number.Text = ""
        txt_date_invoice.Text = ""
        txt_des.Text = ""
        txt_money.Text = ""
        txt_pay_rate.Text = "0"
        txt_rate_vat.Text = "0"

    End Sub

    Protected Sub btn_Save_Click(sender As Object, e As EventArgs) Handles btn_Save.Click
        ds_bill_supplier = Session(Session.Item("username") + "edit")
        ds_bill_supplier_file_upload = Session(Session.Item("username") + "file_upload")
        Dim ds_user As DataSet = New DataSet
        Dim sql_user As String = "select * from User_bill  where Username = '" & Session.Item("Username") & "'"
        Dim ap_user As SqlDataAdapter = New SqlDataAdapter(sql_user, connection)
        ap_user.Fill(ds_user)
        Dim iBool As Integer = 0
        Dim ds As DataSet = New DataSet
        Dim sql As String = ""
        userCreate = Session("userCreate").ToString.Replace("Create", "")

        If ds_bill_supplier.Tables(0).Rows.Count > 0 Then
            sql = " delete from Des_invoice where Docnumber ='" & ds_bill_supplier.Tables(0).Rows(0).Item("Jobid") & "' "
            sql += " delete from Des_invoice_file_upload where Docnumber ='" & ds_bill_supplier.Tables(0).Rows(0).Item("Jobid") & "' "

            '/////////////////////////////////////
            Dim ds_Withholding_Tax As New DataSet
            ds_Withholding_Tax.Tables.Add()
            ds_Withholding_Tax.Tables(0).Columns.Add("withholdingTax", GetType(Double))
            ds_Withholding_Tax.Tables(0).Columns.Add("taxrate", GetType(Double))
            ds_Withholding_Tax.Tables(0).Columns.Add("total", GetType(Double))
            Dim wt As Double = 0.00, tr As Double = 0.00, totaltax As Double = 0.00
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
            Dim totals_a As Double = 0
            If ds_Withholding_Tax.Tables(0).Rows.Count > 0 Then
                For i = 0 To ds_Withholding_Tax.Tables(0).Rows.Count - 1
                    totals_a += CDbl(ds_Withholding_Tax.Tables(0).Rows(i).Item("total"))
                Next
            End If
            Dim totals_amount As Double = 0
            For i = 0 To ds_bill_supplier.Tables(0).Rows.Count - 1
                totals_amount += ds_bill_supplier.Tables(0).Rows(i).Item("invioce_money")
            Next
            '////////////////////////////

            For i = 0 To ds_bill_supplier.Tables(0).Rows.Count - 1
                If ds_bill_supplier.Tables(0).Rows(i).Item("status_vat") = True Then
                    iBool = 1
                Else
                    iBool = 0
                End If
                Dim description As String = If(Not IsDBNull(ds_bill_supplier.Tables(0).Rows(i).Item("Description")), ds_bill_supplier.Tables(0).Rows(i).Item("Description").Replace("'", "''"), "")

                sql += " insert into Des_invoice values('" & ds_bill_supplier.Tables(0).Rows(i).Item("Jobid").ToString.ToUpper.Replace("'", "''") & "','" & description & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Factory").Replace("'", "''") & "','" & CDate(ds_bill_supplier.Tables(0).Rows(i).Item("Date_invoice").ToString).ToString("yyyy-MM-dd") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Number_invoice").Replace("'", "''") & "','" & ds_user.Tables(0).Rows(0).Item("Email").Replace("'", "''") & "',0," & ds_bill_supplier.Tables(0).Rows(i).Item("invioce_money") & ",'" & userCreate.Replace("'", "''") & "',GETDATE()," & ds_bill_supplier.Tables(0).Rows(i).Item("amount_money") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("amount_vat") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("total_money") & "," & iBool & ",null," & totals_amount - totals_a & ",null,0,null,0,null,0,0,0)"
                'sql += " insert into Des_invoice values('" & ds_bill_supplier.Tables(0).Rows(i).Item("Jobid").ToString.ToUpper.Replace("'", "''") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Description").Replace("'", "''") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Factory").Replace("'", "''") & "','" & CDate(ds_bill_supplier.Tables(0).Rows(i).Item("Date_invoice").ToString).ToString("yyyy-MM-dd") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Number_invoice").Replace("'", "''") & "','" & ds_user.Tables(0).Rows(0).Item("Email").Replace("'", "''") & "',0," & ds_bill_supplier.Tables(0).Rows(i).Item("invioce_money") & ",'" & Session.Item("username").ToString.Replace("'", "''") & "',GETDATE()," & ds_bill_supplier.Tables(0).Rows(i).Item("amount_money") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("amount_vat") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("total_money") & "," & iBool & ",null," & totals_amount - totals_a & ",null,0,null,0,null,0,0,0)"
                'sql += " insert into Des_invoice values('" & ds_bill_supplier.Tables(0).Rows(i).Item("Jobid").ToString.ToUpper.Replace("'", "''") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Description").Replace("'", "''") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Factory").Replace("'", "''") & "','" & CDate(ds_bill_supplier.Tables(0).Rows(i).Item("Date_invoice").ToString).ToString("yyyy-MM-dd") & "','" & ds_bill_supplier.Tables(0).Rows(i).Item("Number_invoice").Replace("'", "''") & "','" & ds_user.Tables(0).Rows(0).Item("Email").Replace("'", "''") & "',0," & ds_bill_supplier.Tables(0).Rows(i).Item("invioce_money") & ",'" & Session.Item("username").ToString.Replace("'", "''") & "',GETDATE()," & ds_bill_supplier.Tables(0).Rows(i).Item("amount_money") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("vat_rate").ToString.Replace("%", "") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("amount_vat") & "," & ds_bill_supplier.Tables(0).Rows(i).Item("total_money") & "," & iBool & ",null," & CDbl(GridView1.FooterRow.Cells(8).Text.Replace("'", "''")) & ",null,0,null,0,null,0,0,0)"
                'insert into Des_invoice values('SNC-2020-05-0002','TEST','SNC','2020-05-21','1112','nattiko@sncspundproof.com')
            Next
            sql += " insert into Log_Billing values('Edit Billing :" & ds_bill_supplier.Tables(0).Rows(0).Item("Jobid").ToString.ToUpper & " ','Edit Billing','" & ds_bill_supplier.Tables(0).Rows(0).Item("Jobid").ToString.ToUpper & "',GETDATE(),'" & Session.Item("username").ToString & "')"


        End If
        'If ds_vat.Tables(0).Rows.Count > 0 Then
        '    For i = 0 To ds_vat.Tables(0).Rows.Count - 1
        '        sql += " insert into vat values('" & ds_vat.Tables(0).Rows(i).Item("Jobid") & "'," & ds_vat.Tables(0).Rows(i).Item("Amount_vat") & " ," & ds_vat.Tables(0).Rows(i).Item("Vat_rate").ToString.Replace("%", "") & "," & ds_vat.Tables(0).Rows(i).Item("pay_rate") & ",0 )"
        '    Next
        'End If
        ' End If
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
                        cmd.Parameters.AddWithValue("@Docnumber", txt_job_id.Text)
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
            send_email_Tranfer_all(get_current_email, txt_job_id.Text, Format(Now, "yyyy-MM-dd"), "BillingEdit")
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "complete_send_data", "complete_send_data();", True)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "complete_eRROR_send_data", "complete_eRROR_send_data();", True)

        End Try
    End Sub

   Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)
       If e.Row.RowType = DataControlRowType.DataRow Then
            Dim servicename As Double = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "total_money"))
            sum_total += servicename
        End If
        If e.Row.RowType = DataControlRowType.Footer Then
            'e.Row.Cells(3).Text = "Total : " + String.Format("{0:C2}", sum_total)
            e.Row.Cells(7).Text = "Total : "
            e.Row.Cells(8).Text = FormatCurrency(sum_total).Replace("£", "")
        End If
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        ds_bill_supplier = Session(Session.Item("username") + "edit")
        ds_bill_supplier_file_upload = Session(Session.Item("username") + "file_upload")
        Dim dr As GridViewRow
        dr = e.CommandSource.NamingContainer
        ' dr = DirectCast(e.CommandSource.NamingContainer, GridViewRow) 
        Dim index As Integer = dr.RowIndex
        Select Case e.CommandName
            Case "Delete1"
                Dim confirmValue As String = Request.Form("confirm_value")
                If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
                    ds_bill_supplier.Tables(0).Rows(index).Delete()
                    Session(Session.Item("username") + "edit") = ds_bill_supplier
                    BindGridView()
                End If
            Case "Edit"

        End Select
    End Sub

    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        BindGridView()
        GridView1.Columns(10).Visible = False

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
        'ds_bill_supplier.Tables(0).Rows(RowsIndex).Item("total_money") = e.NewValues.Item("total_money")


        'amount_vat = (CDbl(txt_pay_rate.Text) * CInt(txt_rate_vat.Text)) / 100
        'amount_vat = Math.Round(amount_vat, 2, MidpointRounding.AwayFromZero)
        ' ds_bill_supplier.Tables(0).Rows.Add(txt_job_id.Text, txt_factory.Text, txt_invoice_number.Text.ToUpper, txt_des.Text, txt_date_invoice.Text, txt_money.Text, txt_pay_rate.Text, txt_rate_vat.Text + "%", amount_vat, txt_moneys, 0)


        'For i = 0 To e.NewValues.Keys.Count - 1
        '    Dim item As String = e.NewValues.Keys(i)
        '    ds_bill_supplier.Tables(0).Rows(RowsIndex).Item(item) = e.NewValues.Item(item)
        'Next
        BindGridView()
    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        GridView1.EditIndex = -1
        BindGridView()
        GridView1.Columns(10).Visible = True

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

    Protected Sub btn_upload_Click(sender As Object, e As EventArgs) Handles btn_upload.Click
        ds_bill_supplier = Session(Session.Item("username") + "edit")
        ds_bill_supplier_file_upload = Session(Session.Item("username") + "file_upload")
        Dim empFilename As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
        If empFilename <> String.Empty Then
            'fetch the file content type of the file  
            Dim FilecontentType As String = FileUpload1.PostedFile.ContentType
            'reads a content of the file  
            Using s As Stream = FileUpload1.PostedFile.InputStream
                Using br As New BinaryReader(s)
                    If s.Length < 3145728 Then
                        Dim Databytes As Byte() = br.ReadBytes(CInt(s.Length))

                        ds_bill_supplier_file_upload.Tables(0).Rows.Add(txt_job_id.Text, empFilename, Session.Item("username"), Databytes, FilecontentType, False)
                        BindGridView()
                    Else
                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Filemaximum10MB", "Filemaximum10MB();", True)
                    End If
                    'fetch connection string from the web.config file   
                    'create a database connection object  
                    '        Using con As New SqlConnection(connection)
                    '            Dim query As String = " INSERT INTO [dbo].[Des_invoice_file_upload] ([Docnumber], [fileName], [dateUpload], [dateTimeUpload], [Userupload], [dataFile], [contentType], [statusSent]) VALUES 
                    '( @Docnumber, @fileName, GETDATE(), GETDATE(), @Userupload, @dataFile, @contentType, 0)"
                    '            query += " insert into Log_Billing values('Upload Reciept :" & txt_job_id.Text & " ','Upload Reciept','" & txt_job_id.Text & "',GETDATE(),'" & Session.Item("username").ToString & "')"
                    '            Using cmd As New SqlCommand(query)
                    '                cmd.Connection = con
                    '                cmd.Parameters.AddWithValue("@Docnumber", txt_job_id.Text)
                    '                cmd.Parameters.AddWithValue("@fileName", empFilename)
                    '                cmd.Parameters.AddWithValue("@Userupload", Session.Item("username"))
                    '                cmd.Parameters.AddWithValue("@dataFile", Databytes)
                    '                cmd.Parameters.AddWithValue("@contentType", FilecontentType)
                    '                con.Open()
                    '                cmd.ExecuteNonQuery()
                    '                con.Close()
                    '            End Using
                    '        End Using
                End Using
            End Using

            'Response.Redirect(Request.RawUrl)
        End If
    End Sub

    Private Sub link_load1_Click()
        Dim jobid As String = txt_job_id.Text
        Dim bytes As Byte()
        Dim fileName As String, contentType As String
        Using con As New SqlConnection(connection)
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from Des_invoice_file_upload where Docnumber=@Docnumber"
                cmd.Parameters.AddWithValue("@Docnumber", jobid)
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

    Protected Sub GridView2_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        ds_bill_supplier = Session(Session.Item("username") + "edit")
        ds_bill_supplier_file_upload = Session(Session.Item("username") + "file_upload")
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
End Class