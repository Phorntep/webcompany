Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.IO
Imports OfficeOpenXml
Imports System

Public Class Billing_all
    Inherits System.Web.UI.Page
    Dim dt As DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sriptmanagerregister()
        If Not IsPostBack Then
            loaddata()
            If FN_Check_expire_password(Session.Item("username")) = True Then
                Response.Redirect("..\Billing\Reset_password.aspx")
            End If
        End If
    End Sub


    Private Sub sriptmanagerregister()
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        'ScriptManager.RegisterPostBackControl(Me.btnUpload)
        'ScriptManager.RegisterPostBackControl(Me.txtpassword)

    End Sub
    'Private Function get_Lv()
    '    Dim ds As DataSet = New DataSet
    '    Dim sql As String = "select * from User_bill where Username = '" & Session.Item("username") & "'"
    '    Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
    '    ap.Fill(ds)
    '    Return ds
    'End Function
    Private Sub loaddata()
        Dim ds As DataSet = New DataSet
        Dim ds_infouser As DataSet = get_Lv(Session.Item("username"))
        Dim sql As String
        Dim ap As SqlDataAdapter
        If ds_infouser.Tables(0).Rows.Count > 0 Then
            If ds_infouser.Tables(0).Rows(0).Item("Level").ToString <> 1 Then
                sql = "select * from Payment order by Id desc"
                ap = New SqlDataAdapter(sql, connection)
                ap.Fill(ds)
                GridView1.DataSource = ds.Tables(0)
                GridView1.DataBind()
                GridView1.UseAccessibleHeader = True
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader
            Else
                sql = "select * from Payment where Factory ='" & ds_infouser.Tables(0).Rows(0).Item("Company").ToString & "' order by Id desc"
                ap = New SqlDataAdapter(sql, connection)
                ap.Fill(ds)
                GridView1.DataSource = ds.Tables(0)
                GridView1.DataBind()
                GridView1.UseAccessibleHeader = True
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader
            End If
        End If

    End Sub

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        loaddata()

    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "status_pay")) Then

            If e.Row.RowType = DataControlRowType.DataRow Then
                If DataBinder.Eval(e.Row.DataItem, "status_pay") = True Then
                    Dim btn As ImageButton = e.Row.FindControl("ImageButton2")
                    btn.ImageUrl = "..\Billing\Image_billing\icon\check.png"
                End If
            End If
        Else
            If DataBinder.Eval(e.Row.DataItem, "Status_Job_id") = "1" Or DataBinder.Eval(e.Row.DataItem, "Status_Job_id") = 2 Then
                e.Row.BackColor = Drawing.Color.Yellow
            End If
        End If
    End Sub


    Protected Sub btn_close_Click(sender As Object, e As EventArgs)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Close_model", "Close_model();", True)
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        Dim dr As GridViewRow
        Dim index As Integer
        Dim doc_id As String = ""
        If e.CommandName <> "Page" Then
            dr = e.CommandSource.NamingContainer
            index = dr.RowIndex
            doc_id = DirectCast(dr.Cells(1).Controls(1), Label).[Text]
        End If
        Select Case e.CommandName
            Case "upload"
                upload_doc_supllier(index, doc_id)
            Case "pay"
                Pay(index, doc_id)

        End Select
    End Sub
    Sub upload_doc_supllier(index As Integer, Document_number As String)
        Dim ds As DataSet = Get_Ducument(Document_number)
        Dim ds_infouser As DataSet = get_Lv(Session.Item("username"))

        If ds.Tables(0).Rows.Count > 0 Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "OpenModel", "OpenModel();", True)
            txt_Doc_number.Text = ds.Tables(0).Rows(0).Item("Docnumber").ToString

        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_uploaded", "alert_uploaded();", True)
        End If
        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "OpenModel", "OpenModel();", True)
    End Sub
    Sub Pay(index As Integer, Document_number As String)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "OpenModel", "OpenModel();", True)
    End Sub
    Function Get_Ducument(Document_number As String)
        Dim ds As DataSet = New DataSet
        Dim sql As String = "select *  from Payment inner join User_bill on Payment.Factory = User_bill.Company where Payment.Docnumber = '" & Document_number & "' and User_bill.Username ='" & Session.Item("username") & "' and status_doc_supplier=0 order by Id desc"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        Return ds
    End Function

    Protected Sub btn_save_upload_file_supplier_Click(sender As Object, e As EventArgs)
        Dim path As String = Server.MapPath("File")

        If Directory.Exists(Server.MapPath("File") + "\snc") Then

        Else
            Directory.CreateDirectory(Server.MapPath("File") + "\snc")
        End If
    End Sub

    Protected Sub GridView1_PreRender(sender As Object, e As EventArgs)
        Dim gv As GridView = CType(sender, GridView)

        If (gv.ShowHeader = True AndAlso gv.Rows.Count > 0) OrElse (gv.ShowHeaderWhenEmpty = True) Then
            gv.HeaderRow.TableSection = TableRowSection.TableHeader
        End If

        If gv.ShowFooter = True AndAlso gv.Rows.Count > 0 Then
            gv.FooterRow.TableSection = TableRowSection.TableFooter
        End If
    End Sub
End Class