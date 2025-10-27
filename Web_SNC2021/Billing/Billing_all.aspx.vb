Imports System.Data.OleDb
Imports System.IO
Imports OfficeOpenXml

Public Class Billing_all
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sriptmanagerregister()
    End Sub


    Private Sub sriptmanagerregister()
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        ScriptManager.RegisterPostBackControl(Me.btnUpload)
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
    Public Function ConvertToDataTable2(oSheet As ExcelWorksheet)
        Dim totalrows = oSheet.Dimension.End.Row
        Dim totalcols = oSheet.Dimension.End.Column
        Dim ds As DataSet = New DataSet
        ds.Tables.Add(oSheet.Name)
        For i = 0 To totalrows - 1
            If i = 0 Then ds.Tables(0).Rows.Add(0)
            For j = 0 To totalcols - 1
                If i = 1 Then
                    ds.Tables(0).Columns.Add(oSheet.Cells(i, j).Value.ToString)

                Else
                    ds.Tables(0).Rows.Add(oSheet.Cells(i, j).Value.ToString)
                End If
            Next
        Next
        Return ds.Tables(0)
    End Function
    Private Function ConvertToDataTable(oSheet As ExcelWorksheet) As DataTable
        Dim totalRows As Integer = oSheet.Dimension.[End].Row
        Dim totalCols As Integer = oSheet.Dimension.[End].Column
        Dim dt As New DataTable(oSheet.Name)
        Dim dr As DataRow = Nothing
        For i As Integer = 1 To totalRows
            If i > 1 Then
                dr = dt.Rows.Add()
            End If
            For j As Integer = 1 To totalCols
                If i = 1 Then
                    dt.Columns.Add(oSheet.Cells(i, j).Value.ToString())
                Else
                    dr(j - 1) = oSheet.Cells(i, j).Value.ToString()
                End If
            Next
        Next
        Return dt
    End Function



    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")

        Dim FileName As String = GridView1.Caption

        Dim Extension As String = Path.GetExtension(FileName)

        Dim FilePath As String = Server.MapPath(FolderPath + FileName)



        Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text)

        GridView1.PageIndex = e.NewPageIndex

        GridView1.DataBind()
    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs)
        If FileUpload1.HasFile Then

            Dim FileName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)

            Dim Extension As String = Path.GetExtension(FileUpload1.PostedFile.FileName)

            Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")



            'Dim FilePath As String = Server.MapPath(FolderPath + FileName)
            Dim FilePath As String = FileUpload1.PostedFile.FileName

            FileUpload1.SaveAs(FilePath)

            Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text)

        End If
    End Sub
    Private Sub Import_To_Grid(ByVal FilePath As String, ByVal Extension As String, ByVal isHDR As String)

        Dim conStr As String = ""

        Select Case Extension

            Case ".xls"

                'Excel 97-03

                conStr = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString

                Exit Select

            Case ".xlsx"

                'Excel 07

                conStr = ConfigurationManager.ConnectionStrings("Excel07ConString").ConnectionString
                ''conStr = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString

                Exit Select

        End Select

        conStr = String.Format(conStr, FilePath, isHDR)



        Dim connExcel As New OleDbConnection(conStr)

        Dim cmdExcel As New OleDbCommand()

        Dim oda As New OleDbDataAdapter()

        Dim dt As New DataTable()



        cmdExcel.Connection = connExcel
        'Get the name of First Sheet

        connExcel.Open()

        Dim dtExcelSchema As DataTable

        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing)

        Dim SheetName As String = dtExcelSchema.Rows(0)("TABLE_NAME").ToString()

        connExcel.Close()
        'Read Data from First Sheet

        connExcel.Open()

        cmdExcel.CommandText = "SELECT * From [" & SheetName & "]"

        oda.SelectCommand = cmdExcel

        oda.Fill(dt)

        connExcel.Close()



        'Bind Data to GridView

        GridView1.Caption = Path.GetFileName(FilePath)

        GridView1.DataSource = dt

        GridView1.DataBind()

    End Sub
End Class