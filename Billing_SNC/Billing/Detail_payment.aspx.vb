Option Explicit On
Option Strict On

Imports System.Data.SqlClient
Imports System.IO

Public Class Detail_payment
    Inherits System.Web.UI.Page
    Dim sum_total1 As Double = Nothing
    Dim sum_total2 As Double = Nothing
    Dim ds_bill_supplier As DataSet
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If DirectCast(Session.Item("username"), String) <> "" Then
            sriptmanagerregister()

            If Request.QueryString.Count > 0 Then
                Dim ds_bill_supplier As New DataSet
                Session(Session.Item("username").ToString) = ds_bill_supplier
                'check_owner()

                If Request.QueryString("Payment") <> Nothing Then
                    load_data(Request.QueryString("Payment").ToString)
                    'txt_from_job_id.Text = Request.QueryString("id").ToString
                End If
                If FN_Check_expire_password(DirectCast(Session.Item("username"), String)) = True Then
                    Response.Redirect("..\Billing\Reset_password.aspx")
                End If
            End If
        End If
    End Sub
    Private Sub sriptmanagerregister()
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        '  ScriptManager.RegisterPostBackControl(btn_upload)
        'ScriptManager.RegisterPostBackControl(link_load1)
        ScriptManager.RegisterPostBackControl(GridView2)

    End Sub

    Private Sub load_data(toString As String)
        Dim ds As DataSet = New DataSet
        Dim sql As String = "select * from Des_invoice where Docnumber='" & toString & "' select * from vat where Docnumber='" & toString & "' "
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)

        Dim ds2 As DataSet = New DataSet
        Dim sql2 As String = "select * from User_bill where Username='" & ds.Tables(0).Rows(0).Item("userCreate").ToString & "'"
        Dim ap2 As SqlDataAdapter = New SqlDataAdapter(sql2, connection)
        ap2.Fill(ds2)



        '************
        If ds.Tables(0).Rows.Count > 0 And ds2.Tables(0).Rows.Count > 0 Then
            Dim ds3 As DataSet = New DataSet()
            ds3 = get_Lv(Session.Item("username").ToString)
            If ds.Tables(0).Rows(0).Item("Factory").ToString = DirectCast(ds3.Tables(0).Rows(0).Item("Company"), String) Or DirectCast(ds3.Tables(0).Rows(0).Item("Level"), Integer) >= 3 Then
                GridView1.DataSource = ds.Tables(0)
                GridView1.DataBind()
                lbl_Job_id.Text = ds.Tables(0).Rows(0).Item("Docnumber").ToString
                lbl_fac.Text = ds.Tables(0).Rows(0).Item("Factory").ToString
                lbl_address.Text = ds2.Tables(0).Rows(0).Item("Address").ToString
                lbl_supplier.Text = ds2.Tables(0).Rows(0).Item("Supplier").ToString
                lbl_Phone.Text = ds2.Tables(0).Rows(0).Item("Tel").ToString
                lbl_email.Text = ds2.Tables(0).Rows(0).Item("Email").ToString
                If DirectCast(ds.Tables(0).Rows(0).Item("status_tranfer"), Boolean) = False Then
                    btn_Edit_owner.Visible = True

                End If
            End If
        End If

        '**************
        Dim sqlGetfileupload As String = $"select  Des_invoice_file_upload.[index],Docnumber,fileName from Des_invoice_file_upload where Docnumber='{lbl_Job_id.Text}'"
        Dim dsGetfileupload As New DataSet
        Dim apGetfileipload As SqlDataAdapter = New SqlDataAdapter(sqlGetfileupload, connection)
        apGetfileipload.Fill(dsGetfileupload)
        If dsGetfileupload.Tables(0).Rows.Count > 0 Then
            'link_load1.Text = DirectCast(dsGetfileupload.Tables(0).Rows(0).Item("fileName"), String)
            GridView2.DataSource = dsGetfileupload.Tables(0)
            GridView2.DataBind()
        End If
    End Sub

    Private Sub set_dataset_add_invioce()
        ds_bill_supplier = DirectCast(Session(Session.Item("username").ToString), DataSet)
        ds_bill_supplier.Tables.Add("Supplier")
        ds_bill_supplier.Tables(0).Columns.Add("Jobid", GetType(String))
        ds_bill_supplier.Tables(0).Columns.Add("Factory", GetType(String))
        ds_bill_supplier.Tables(0).Columns.Add("Invoice_number", GetType(String))
        ds_bill_supplier.Tables(0).Columns.Add("Description", GetType(String))
        ds_bill_supplier.Tables(0).Columns.Add("Date_invoice", GetType(Date))
        ds_bill_supplier.Tables(0).Columns.Add("Money", GetType(Double))
        ds_vat = New DataSet
        ds_vat.Tables.Add("Vat")
        ds_vat.Tables(0).Columns.Add("Jobid", GetType(String))
        ds_vat.Tables(0).Columns.Add("Amount_vat", GetType(Double))
        ds_vat.Tables(0).Columns.Add("Vat_rate", GetType(String))
        ds_vat.Tables(0).Columns.Add("pay_rate", GetType(Double))
    End Sub
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                Dim servicename As Double = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "total_money"))
                e.Row.Cells(5).Text = CStr(DataBinder.Eval(e.Row.DataItem, "vat_rate")) & " %"
                sum_total1 += servicename
            End If
            If e.Row.RowType = DataControlRowType.Footer Then
                'e.Row.Cells(3).Text = "Total : " + String.Format("{0:C2}", sum_total)

                e.Row.Cells(6).Text = "Total : "
                e.Row.Cells(7).Text = FormatCurrency(sum_total1).Replace("£", "")
            End If
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)

    End Sub

    Protected Sub GridView2_RowCommand(sender As Object, e As GridViewCommandEventArgs)


        Select Case e.CommandName
            Case "Download"
                ' Dim dr As GridViewRow = DirectCast(DirectCast(e.CommandSource, Control).NamingContainer, GridViewRow)
                Dim index As Integer = CInt(DirectCast(DirectCast(DirectCast(e.CommandSource, Control).NamingContainer, GridViewRow).FindControl("lbl_Index"), Label).Text)

                Dim bytes As Byte()
                Dim fileName As String, contentType As String
                Using con As New SqlConnection(connection)
                    Using cmd As New SqlCommand()
                        cmd.CommandText = "select * from Des_invoice_file_upload where Des_invoice_file_upload.[index]=@index"
                        cmd.Parameters.AddWithValue("@index", index)
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


        End Select
    End Sub

    Protected Sub GridView2_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim servicename As Double = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vat_money"))

            sum_total2 += servicename
        End If
        If e.Row.RowType = DataControlRowType.Footer Then
            'e.Row.Cells(3).Text = "Total : " + String.Format("{0:C2}", sum_total)

            e.Row.Cells(7).Text = "Total : " + FormatCurrency(sum_total2).Replace("£", "")

        End If
    End Sub

    Protected Sub btn_Edit_owner_Click(sender As Object, e As EventArgs)
        Dim doc_id As String = lbl_Job_id.Text
        Response.Redirect("..\Billing\Billing_supplier_edit.aspx?Payment=" + doc_id)
    End Sub

    '    Protected Sub btn_upload_Click(sender As Object, e As EventArgs)
    '        Dim empFilename As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
    '        'fetch the file content type of the file  
    '        Dim FilecontentType As String = FileUpload1.PostedFile.ContentType
    '        'reads a content of the file  
    '        Using s As Stream = FileUpload1.PostedFile.InputStream
    '            Using br As New BinaryReader(s)
    '                Dim Databytes As Byte() = br.ReadBytes(CInt(s.Length))
    '                'fetch connection string from the web.config file   
    '                'create a database connection object  
    '                Using con As New SqlConnection(connection)
    '                    Dim query As String = "INSERT INTO [dbo].[Des_invoice_file_upload] ([Docnumber], [fileName], [dateUpload], [dateTimeUpload], [Userupload], [dataFile], [contentType]) VALUES 
    '(@Docnumber, @fileName, GETDATE(), GETDATE(), @Userupload, @dataFile, @contentType)"
    '                    query += " insert into Log_Billing values('Upload Reciept :" & lbl_Job_id.Text & " ','Upload Reciept','" & lbl_Job_id.Text & "',GETDATE(),'" & Session.Item("username").ToString & "')"
    '                    Using cmd As New SqlCommand(query)
    '                        cmd.Connection = con
    '                        cmd.Parameters.AddWithValue("@Docnumber", lbl_Job_id.Text)
    '                        cmd.Parameters.AddWithValue("@fileName", empFilename)
    '                        cmd.Parameters.AddWithValue("@Userupload", Session.Item("username"))
    '                        cmd.Parameters.AddWithValue("@dataFile", Databytes)
    '                        cmd.Parameters.AddWithValue("@contentType", FilecontentType)
    '                        con.Open()
    '                        cmd.ExecuteNonQuery()
    '                        con.Close()
    '                    End Using
    '                End Using
    '            End Using
    '        End Using
    '        'Response.Redirect(Request.Url.AbsoluteUri)

    '        Response.Redirect(Request.RawUrl)
    '    End Sub

    Protected Sub link_load1_Click(sender As Object, e As EventArgs)
        Dim jobid As String = lbl_Job_id.Text
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

    Protected Sub btnDeleteupload_Click(sender As Object, e As EventArgs)

        'Dim confirmValue As String = Request.Form("confirm_value")
        'If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
        '    Dim sqlDelete As String = $"delete from Des_invoice_file_upload where Docnumber='{lbl_Job_id.Text}'"
        '    sqlDelete += " insert into Log_Billing values('Delete Upload Reciept :" & lbl_Job_id.Text & " ','Delete Upload Reciept','" & lbl_Job_id.Text & "',GETDATE(),'" & Session.Item("username").ToString & "')"
        '    Dim dsDelete As New DataSet
        '    Dim apDelete As SqlDataAdapter = New SqlDataAdapter(sqlDelete, connection)
        '    apDelete.Fill(dsDelete)
        '    Response.Redirect(Request.RawUrl)
        'End If

    End Sub

End Class