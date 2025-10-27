Imports System.Data.SqlClient

Public Class Add_Payment_Main
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        managerRegister() 'Set object

        If Not IsPostBack Then
            add_dd_seqeunce() 'add number in dropdown
            load_payment() 'load data to gridview ***
            check_permission()
            If FN_Check_expire_password(Session.Item("username")) = True Then
                Response.Redirect("..\Billing\Reset_password.aspx")
            End If
        End If
    End Sub

    Private Sub check_permission()
        If Session.Item("username") <> "" Then
            Dim ds As New DataSet
            Dim sql As String = "select * from User_bill where Username = '" & Session.Item("username") & "'"
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            If ds.Tables(0).Rows(0).Item("Level") < 3 Then
                Response.Redirect("..\Billing\index.aspx")
            End If
        Else
            Response.Redirect("..\Billing\index.aspx")
        End If
    End Sub

    Private Sub load_payment() 'load data to gridview ***
        Dim ds As DataSet = New DataSet
        Dim sql As String = "select * from FilepdfBill order by id"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            GridView1.DataSource = ds.Tables(0)
            GridView1.DataBind()
        End If
    End Sub

    Private Sub add_dd_seqeunce() 'add number in dropdown
        Dim ds As DataSet = New DataSet
        Dim sql As String = "select * from FilepdfBill order by id "
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)

        Dim list As New List(Of Integer)

        For i = 1 To 12
            list.Add(i)
        Next
        For j = 0 To ds.Tables(0).Rows.Count - 1
            For Each i In list
                If ds.Tables(0).Rows(j).Item(0) = i Then
                    list.RemoveAt(list.IndexOf(i))
                    Exit For
                End If
            Next
        Next
        dd_Seqeunce.Items.Add("Please Select :")
        For Each i In list
            dd_Seqeunce.Items.Add(i)
        Next

    End Sub

    Private Sub managerRegister() 'Set object 
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        ScriptManager.RegisterPostBackControl(Me.dd_Seqeunce)
        ScriptManager.RegisterPostBackControl(Me.btn_upload)
    End Sub

    Protected Sub btn_upload_Click(sender As Object, e As EventArgs) Handles btn_upload.Click
        Dim ds As DataSet
        Dim sql As String = ""
        Dim ap As SqlDataAdapter
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            If dd_Seqeunce.SelectedIndex <> 0 And txtnamePay.Text <> "" Then
                If FileUpload1.HasFile Then
                    'If Not My.Computer.FileSystem.FileExists(Server.MapPath("\Billing\File\" + Format(Now, "dd-MM-yyyy") + FileUpload1.FileName)) Then
                    If Not My.Computer.FileSystem.FileExists("\\192.168.1.53\WebSNCNew\WebSNCSOUNDPROOF\Billing\File\" + Format(Now, "dd-MM-yyyy") + FileUpload1.FileName) Then
                        'Dim path As String = Server.MapPath("\Billing\File\" + Format(Now, "dd-MM-yyyy") + FileUpload1.FileName)
                        Dim path As String = "\\192.168.1.53\WebSNCNew\WebSNCSOUNDPROOF\Billing\File\" + Format(Now, "dd-MM-yyyy") + FileUpload1.FileName
                        Dim extension As String = System.IO.Path.GetExtension(path)
                        If extension.ToLower = ".pdf" Then
                            FileUpload1.PostedFile.SaveAs(path)
                            sql = "insert into FilepdfBill values(" & dd_Seqeunce.SelectedItem.Text & ",'" & txtnamePay.Text & "','" & path.Substring(path.LastIndexOf("\") + 1) & "')"
                            ds = New DataSet
                            ap = New SqlDataAdapter(sql, connection)
                            ap.Fill(ds)
                            Response.Redirect("..\Billing\Add_Payment_Main.aspx")
                        Else
                            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_Tpyefile", "alert_Tpyefile();", True)
                        End If
                    Else
                        Dim num As Integer = 1
                        Dim bExit As Boolean = False
                        Do
                            'If Not My.Computer.FileSystem.FileExists(Server.MapPath("\Billing\File\" + Format(Now, "dd-MM-yyyy") + "_" + "Copy" + num.ToString("0#") + "_" + FileUpload1.FileName)) Then
                            If Not My.Computer.FileSystem.FileExists(Server.MapPath("\Billing\File\" + Format(Now, "dd-MM-yyyy") + "_" + "Copy" + num.ToString("0#") + "_" + FileUpload1.FileName)) Then
                                'Dim path As String = Server.MapPath("\Billing\File\" + Format(Now, "dd-MM-yyyy") + "_" + "Copy" + num.ToString("0#") + "_" + FileUpload1.FileName)
                                Dim path As String = "\\192.168.1.53\WebSNCNew\WebSNCSOUNDPROOF\Billing\File\" + Format(Now, "dd-MM-yyyy") + "_" + "Copy" + num.ToString("0#") + "_" + FileUpload1.FileName
                                Dim extension As String = System.IO.Path.GetExtension(path)
                                    If extension.ToLower = ".pdf" Then
                                        FileUpload1.PostedFile.SaveAs(path)
                                        sql = "insert into FilepdfBill values(" & dd_Seqeunce.SelectedItem.Text & ",'" & txtnamePay.Text & "','" & path.Substring(path.LastIndexOf("\") + 1) & "')"
                                        ds = New DataSet
                                        ap = New SqlDataAdapter(sql, connection)
                                        ap.Fill(ds)
                                        Response.Redirect("..\Billing\Add_Payment_Main.aspx")
                                    Else
                                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_Tpyefile", "alert_Tpyefile();", True)
                                    End If
                                    bExit = True
                                Else
                                    num += 1
                            End If
                        Loop Until bExit = True
                    End If
                End If
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_selectnumber", "alert_selectnumber();", True)
            End If
        End If
    End Sub
    Private Function upload_file(cmd As String)
        'FileUpload1.PostedFile.SaveAs(Server.MapPath(" ") + "\FileUpload\" + FileUpload1.FileName)
        'FileUpload1.Dispose() 
        ' If lbl_namefile.Text <> "" And lbl_namefile.Text.Length > 0 Then
        Select Case cmd
            Case "A"
                If FileUpload1.HasFile Then
                    Dim num As Integer = 0
                    Dim bexit As Boolean = False
                    Dim filename As String = ""
                    Do
                        'If (My.Computer.FileSystem.FileExists(Server.MapPath(" ") + "\Billing\FileUpload\" + txt_CSR.Text + "_" + FileUpload1.FileName.ToString.Replace(" ", "_"))) Then
                        '    num += 1
                        '    filename = txt_CSR.Text + "Coppy" + num.ToString + "_" + FileUpload1.FileName.ToString.Replace(" ", "_")
                        '    If Not (My.Computer.FileSystem.FileExists(Server.MapPath(" ") + "\FileUpload\" + txt_CSR.Text + "Coppy" + num.ToString + "_" + FileUpload1.FileName.ToString.Replace(" ", "_"))) Then
                        '        bexit = True
                        '    End If
                        'Else
                        '    filename = txt_CSR.Text + "_" + FileUpload1.FileName.ToString.Replace(" ", "_")
                        '    bexit = True
                        'End If
                    Loop Until bexit = True
                    Return filename
                End If
            Case "B"
                If FileUpload1.HasFile Then
                    Dim num As Integer = 0
                    Dim bexit As Boolean = False
                    Dim filename As String = ""
                    Do
                        'If (My.Computer.FileSystem.FileExists(Server.MapPath(" ") + "\FileUpload\" + txt_CSR.Text + "_" + FileUpload1.FileName.ToString.Replace(" ", "_"))) Then
                        '    num += 1
                        '    filename = txt_CSR.Text + "Coppy" + num.ToString + "_" + FileUpload1.FileName.ToString.Replace(" ", "_")
                        '    If Not (My.Computer.FileSystem.FileExists(Server.MapPath(" ") + "\FileUpload\" + txt_CSR.Text + "Coppy" + num.ToString + "_" + FileUpload1.FileName.ToString.Replace(" ", "_"))) Then
                        '        bexit = True
                        '    End If
                        'Else
                        '    filename = txt_CSR.Text + "_" + FileUpload1.FileName.ToString.Replace(" ", "_")
                        '    bexit = True
                        'End If
                    Loop Until bexit = True
                    FileUpload1.PostedFile.SaveAs(Server.MapPath(" ") + "\FileUpload\" + filename)
                    FileUpload1.Dispose()
                End If
        End Select

    End Function

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim a As Integer = e.Values(0)

        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            Dim ds As DataSet = New DataSet
            Dim sql As String = "delete from FilepdfBill where id = " & a & ""
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
        End If
        Response.Redirect("..\Billing\Add_Payment_Main.aspx")
    End Sub

    Protected Sub btn_delete_all_Click(sender As Object, e As EventArgs)
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            Dim ds As DataSet = New DataSet
            Dim sql As String = "delete from FilepdfBill"
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            Response.Redirect("..\Billing\Add_Payment_Main.aspx")
        End If
    End Sub
End Class