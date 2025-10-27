Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.IO
Imports OfficeOpenXml

Public Class Add_Payment_All
    Inherits System.Web.UI.Page
    Dim dt As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sriptmanagerregister()
        If FN_Check_expire_password(Session.Item("username")) = True Then
            Response.Redirect("..\Billing\Reset_password.aspx")
        End If

    End Sub

    Protected Sub btn_upload_Click(sender As Object, e As EventArgs)
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            If FileUpload1.HasFile Then
                Dim FileName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
                Dim Extension As String = Path.GetExtension(FileUpload1.PostedFile.FileName)
                Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")
                'Dim FilePath As String = Server.MapPath(FolderPath + FileName)
                'Dim FilePath As String = FileUpload1.PostedFile.FileName
                Dim FilePath As String = Server.MapPath(" ") + "\File\ExcelImportSNCBilling" + Extension
                'FileUpload1.SaveAs(FilePath)
                FileUpload1.PostedFile.SaveAs(FilePath)
                ' Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text)

                dt = Import_To_Grid(FilePath, Extension, "Yes")
                GridView1.Caption = Path.GetFileName(FilePath)
                dt.Columns("บริษัท/ห้างร้าน").ColumnName = "บริษัทห้างร้าน"
                GridView1.DataSource = dt
                ds_gridview = New DataSet
                ds_gridview.Tables.Add(dt)
                GridView1.DataBind()
            End If
        End If
    End Sub
    Private Sub sriptmanagerregister()
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        ScriptManager.RegisterPostBackControl(Me.btn_upload)
        ScriptManager.RegisterPostBackControl(Me.GridView1)
        'ScriptManager.RegisterPostBackControl(Me.txtpassword)
    End Sub

    Private Sub upload()
        If FileUpload1.HasFile Then
            Dim fileExcel As FileInfo = New FileInfo(FileUpload1.PostedFile.FileName)
            'Using package = New ExcelPackage(fileExcel)
            '    Dim workbook = package.Workbook
            '    Dim worksheetre = workbook.Worksheets.First
            '    Dim totalrows = worksheetre.Dimension.End.Row
            '    Dim totalcols = worksheetre.Dimension.End.Column
            '    Dim ds As DataSet = New DataSet
            '    ' ds = ImportExcelXLS
            '    ds.Tables.Add(0)
            '    For i = 0 To totalcols - 1
            '        ds.Tables(0).Columns.Add("Col" + i + 1.ToString)
            '    Next
            '    For i = 0 To totalrows - 1
            '        Dim dr As DataRow = ds.Tables(0).NewRow

            '        Dim str As String()
            '        ReDim str(totalcols - 1)
            '        For j = 0 To totalcols - 1
            '            dr(j) = worksheetre.Cells(i, j).Value.ToString

            '        Next
            '        ds.Tables(0).Rows.Add()
            '    Next

            '    GridView1.DataSource = ds.Tables(0)
            '    GridView1.DataBind()
            'End Using

            ' Dim constr As String = "Provider=Microsoft.Jet.Oledb.4.0;Data Source=" & FileUpload1.PostedFile.FileName & ";Extended Properties=Excel 8.0"
            'Dim conn As OleDbConnection = New OleDbConnection(constr)
            ' Dim strsql As String = "SELECT * FROM [Sheet$]"

            ' Dim cmd As OleDbCommand = New OleDbCommand(strsql, conn)
            Dim ds As DataSet = New DataSet

            'Dim da As OleDbDataAdapter = New OleDbDataAdapter(cmd)
            'da.Fill(ds)
            GridView1.DataSource = ds.Tables(0)
            GridView1.DataBind()


        End If

    End Sub
    'Public Function ConvertToDataT222able2(oSheet As ExcelWorksheet)
    '    Dim totalrows = oSheet.Dimension.End.Row
    '    Dim totalcols = oSheet.Dimension.End.Column
    '    Dim ds As DataSet = New DataSet
    '    ds.Tables.Add(oSheet.Name)
    '    For i = 0 To totalrows - 1
    '        If i = 0 Then ds.Tables(0).Rows.Add(0)
    '        For j = 0 To totalcols - 1
    '            If i = 1 Then
    '                ds.Tables(0).Columns.Add(oSheet.Cells(i, j).Value.ToString)

    '            Else
    '                ds.Tables(0).Rows.Add(oSheet.Cells(i, j).Value.ToString)
    '            End If
    '        Next
    '    Next
    '    Return ds.Tables(0)
    'End Function
    'Private Function ConvertToDataTabl222e(oSheet As ExcelWorksheet) As DataTable
    '    Dim totalRows As Integer = oSheet.Dimension.[End].Row
    '    Dim totalCols As Integer = oSheet.Dimension.[End].Column
    '    Dim dt As New DataTable(oSheet.Name)
    '    Dim dr As DataRow = Nothing
    '    For i As Integer = 1 To totalRows
    '        If i > 1 Then
    '            dr = dt.Rows.Add()
    '        End If
    '        For j As Integer = 1 To totalCols
    '            If i = 1 Then
    '                dt.Columns.Add(oSheet.Cells(i, j).Value.ToString())
    '            Else
    '                dr(j - 1) = oSheet.Cells(i, j).Value.ToString()
    '            End If
    '        Next
    '    Next
    '    Return dt
    'End Function

    'Private Sub Import_To_Grid(ByVal FilePath As String, ByVal Extension As String, ByVal isHDR As String)

    '    Dim conStr As String = ""

    '    Select Case Extension

    '        Case ".xls"

    '            'Excel 97-03

    '            conStr = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString

    '            Exit Select

    '        Case ".xlsx"

    '            'Excel 07

    '            conStr = ConfigurationManager.ConnectionStrings("Excel07ConString").ConnectionString
    '            ''conStr = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString

    '            Exit Select

    '    End Select

    '    conStr = String.Format(conStr, FilePath, isHDR)



    '    Dim connExcel As New OleDbConnection(conStr)

    '    Dim cmdExcel As New OleDbCommand()

    '    Dim oda As New OleDbDataAdapter()

    '    dt = New DataTable()



    '    cmdExcel.Connection = connExcel
    '    'Get the name of First Sheet=

    '    connExcel.Open()

    '    Dim dtExcelSchema As DataTable

    '    dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing)

    '    Dim SheetName As String = dtExcelSchema.Rows(0)("TABLE_NAME").ToString()

    '    connExcel.Close()
    '    'Read Data from First Sheet

    '    connExcel.Open()

    '    cmdExcel.CommandText = "SELECT * From [" & SheetName & "]"

    '    oda.SelectCommand = cmdExcel

    '    oda.Fill(dt)

    '    connExcel.Close()



    '    'Bind Data to GridView


    '    'GridView1.Caption = Path.GetFileName(FilePath)
    '    dt.Columns("บริษัท/ห้างร้าน").ColumnName = "บริษัทห้างร้าน"
    '    GridView1.DataSource = dt
    '    ds_gridview = New DataSet
    '    ds_gridview.Tables.Add(dt)
    '    GridView1.DataBind()

    'End Sub



    Protected Sub btn_delete_all_Click(sender As Object, e As EventArgs)
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            validate_data()
            'Dim ds As DataSet = New DataSet
            'Dim sql As String = ""
            'Dim ap As SqlDataAdapter
            'Dim user As String = Session.Item("username")
            '' Dim a As String = GridView1.Rows(2).FindControl("Label2").ToString
            'For i = 0 To GridView1.Rows.Count - 1

            'Sql += " insert into Payment values( '" & ds_gridview.Tables(0).Rows(i).Item(2).ToString & "','" & Convert.ToDateTime(ds_gridview.Tables(0).Rows(i).Item(1).ToString).ToString("yyyy/MM/dd") & "','" & ds_gridview.Tables(0).Rows(i).Item(3).ToString & "'," & ds_gridview.Tables(0).Rows(i).Item(4).ToString & ",0,null,0,null,'" & User & "')"
            'Next
            'ap = New SqlDataAdapter(sql, connection)
            'Try
            '    ap.Fill(ds)
            '    Response.Redirect("..\Billing\Billing_all.aspx")
            'Catch ex As Exception
            '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_uploadFialed", "alert_uploadFialed();", True)
            'End Try

        End If


    End Sub

    Private Sub validate_data()
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            Dim ds As DataSet = New DataSet
            Dim sql As String = "select Docnumber,Factory,dateCreate,date_confirm,status_pay,Datetranfer,status_tranfer,pay_total,Email from Des_invoice where status_pay = 1 and status_tranfer != 1 and status_reject != 1  group by Docnumber,Factory,status_pay,date_confirm,dateCreate,Datetranfer,status_tranfer,pay_total,Email order by status_pay,status_tranfer , date_confirm desc  ,Docnumber desc"
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            Dim ds_validate As DataSet = New DataSet
            Dim sql_validate As String = ""
            Dim ap_validate As SqlDataAdapter
            Dim user As String = Session.Item("username")
            ' Dim a As String = GridView1.Rows(2).FindControl("Label2").ToString
            Dim ds_email As New DataSet
            ds_email.Tables.Add(0)
            ds_email.Tables(0).Columns.Add("email")
            ds_email.Tables(0).Columns.Add("job_id")
            ds_email.Tables(0).Columns.Add("date_tranfer")


            If ds.Tables(0).Rows.Count > 0 Then
                For i = 0 To ds_gridview.Tables(0).Rows.Count - 1
                    For j = 0 To ds.Tables(0).Rows.Count - 1
                        Dim fac_gid As String = ds_gridview.Tables(0).Rows(i).Item(3).ToString

                        fac_gid = fac_gid.ToLower
                        fac_gid = fac_gid.Replace(" ", "")
                        Dim fac_ds As String = ds.Tables(0).Rows(j).Item(1)
                        fac_ds = fac_ds.ToLower
                        fac_ds = fac_ds.Replace(" ", "")
                        If fac_gid = fac_ds Then
                            Dim monney_grid As Double = ds_gridview.Tables(0).Rows(i).Item(4).ToString
                            Dim monney_ds As Double = 0
                            If Not IsDBNull(ds.Tables(0).Rows(j).Item("pay_total")) Then
                                monney_ds = ds.Tables(0).Rows(j).Item("pay_total")
                            End If
                            If monney_grid = monney_ds Then
                                'Dim Email As String = ds.Tables(0).Rows(j).Item("Email")
                                'Dim job_id As String = ds.Tables(0).Rows(j).Item("Docnumber")
                                'Dim date_tranfer As String = ds.Tables(0).Rows(j).Item("Datetranfer")
                                'sql_validate += " update Des_invoice set pay_total= " & monney_ds & ",status_tranfer = 1,check_send_email_tranfer  = 1,pay_total_tranfer=" & monney_ds & " where Docnumber ='" & job_id & "' "
                                'ds_email.Tables(0).Rows.Add(Email, job_id, date_tranfer)

                                Dim Email As String = ds.Tables(0).Rows(j).Item("Email")
                                Dim job_id As String = ds.Tables(0).Rows(j).Item("Docnumber")
                                Dim date_tranfer As String = ds.Tables(0).Rows(j).Item("Datetranfer")
                                Dim date_tranfer_upload As String = CDate(ds_gridview.Tables(0).Rows(i).ItemArray(1)).ToString("dd/MM/yyyy")
                                If date_tranfer = date_tranfer_upload Then
                                    sql_validate += " update Des_invoice set pay_total= " & monney_ds & ",status_tranfer = 1,check_send_email_tranfer  = 1,pay_total_tranfer=" & monney_ds & " where Docnumber ='" & job_id & "' "
                                    ds_email.Tables(0).Rows.Add(Email, job_id, date_tranfer)
                                End If
                            End If
                        End If
                    Next
                Next
                sql_validate += " insert into Log_Billing values('Add tranfer ','Add tranfer ','',GETDATE(),'" & Session.Item("username").ToString & "')"
                ap_validate = New SqlDataAdapter(sql_validate, connection)
                Try
                    ap_validate.Fill(ds)
                    'If ds_email.Tables(0).Rows.Count > 0 Then
                    '    For Each row As DataRow In ds_email.Tables(0).Rows
                    '        send_email_Tranfer_all(row.Item("email"), row.Item("job_id"), row.Item("date_tranfer"), "Tranfer")
                    '    Next
                    'End If
                    Response.Redirect("..\Billing\Billing_all1.aspx")
                Catch ex As Exception
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_uploadFialed", "alert_uploadFialed();", True)
                End Try
            End If
        End If
    End Sub

    Protected Sub GridView1_PageIndexChanging1(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
    End Sub
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then

        End If
    End Sub

    Protected Sub btn_upload_all_Click(sender As Object, e As EventArgs)
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            validate_data()
        End If
    End Sub
End Class