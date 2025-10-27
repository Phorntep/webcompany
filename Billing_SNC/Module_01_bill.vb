Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.Data.OleDb.OleDbConnection



Module Module_01_bill

    'account youtube of SNC :
    'User: sncsoundproof@gmail.com
    'Password: P@ssw0rd@1
    Public connection As String = "Data Source=192.168.1.105;Initial Catalog=WEBSNCNEW_BILL;Persist Security Info=True;User ID=sa;Password=Passw0rd@1"

    'Public connection As String = "Data Source=NATTIKO-IT\MSSQLSERVER2017;Initial Catalog=WEBSNCNEW_BILL;Integrated Security=True"
    'Public connection As String = "Data Source=NATTIKO-IT\MSSQLSERVER2017;User ID=sa;Password=Passw0rd@1"
    Public key As String = "sncit"
    Public ds_bill_supplierV1 As New DataSet, ds_vat As DataSet, ds_usermange As DataSet, ds_billing_list As DataSet
    Public ds_gridview As DataSet
    Public dt_importExcel As DataTable
    Public bcheck_user As Boolean = False
    Public b_filter_company As Boolean = False, b_filter_status As Boolean = False

    Public emailuser As String = "postmaster@sncsoundproof.com", passemail As String = "P@ssw0rd"
    Public ds_confirm_payjob As DataSet ' this dataset get docnumber of page billing1 .when admin select job and confirm.
    'Public bcheck_create_job As Boolean = False

    Public Function get_Lv(username As String) As DataSet
        Dim ds As DataSet = New DataSet
        Dim sql As String = "select * from User_bill where Username = '" & username & "'"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        Return ds
    End Function

    Public Sub send_email_Tranfer_all(name_email As String, job_id As String, date_ As String, body As String)
        'Dim myMail As New MailMessage
        'myMail.From = New MailAddress("comonline@sncsoundproof.com")
        'myMail.Subject = "SNC Billing Tranfer !!!"
        'myMail.IsBodyHtml = True
        'myMail.BodyEncoding = System.Text.Encoding.UTF8
        ''myMail.Body = "Please unlock Q-gate for Use.<br/>For user :: " + frmMain.Id_user + " <br/>Time :: " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "<br/>PDS :: " + Requisition.Text + ""
        'myMail.Body = "SNC Billing Tranfer!!!<br/> Job Id : " & job_id & "<br/>Date Tranfer : " & date_ & " <br/>  "
        'Dim SmtpClient = New SmtpClient("mailsnc01.sncsoundproof.com")
        ''myMail.To.Add(New MailAddress("nattiko@sncsoundproof.com"))
        'myMail.To.Add(New MailAddress(name_email))
        ''SmtpClient.Send(myMail)
        'SmtpClient.Port = 587
        'SmtpClient.Dispose()
        'myMail.Dispose()


        '************************************************************ 
        Dim Smtp_Server As New SmtpClient
        Dim e_mail As New MailMessage()
        Smtp_Server.UseDefaultCredentials = False
        Smtp_Server.Credentials = New Net.NetworkCredential(emailuser, passemail)
        Smtp_Server.Port = 587
        Smtp_Server.EnableSsl = False
        Smtp_Server.Host = "mailsnc01.sncsoundproof.com"
        e_mail = New MailMessage()
        e_mail.From = New MailAddress(emailuser)

        e_mail.To.Add(name_email)

        e_mail.IsBodyHtml = False
        Dim sb As New StringBuilder
        Select Case body
            Case "Tranfer"
                e_mail.Subject = "SNC soundproof Billing Tranfer !!!"
                sb.AppendLine("SNC soundproof Billing Tranfer!!! ")
                sb.AppendLine("Job Id : " & job_id & "")
                sb.AppendLine("Date Tranfer : " & date_ & "  ")
                sb.AppendLine("")
                sb.AppendLine("")
                sb.AppendLine("URL : http://www.sncsoundproof.com")
            Case "Billing"
                e_mail.Subject = "SNC soundproof  Billing !!!"
                sb.AppendLine("SNC soundproof Billing !!! ")
                sb.AppendLine("Job Id : " & job_id & "")
                sb.AppendLine("Date Tranfer : " & date_ & "  ")
                sb.AppendLine("")
                sb.AppendLine("")
                sb.AppendLine("URL : http://www.sncsoundproof.com")
            Case "AppoveUser"
                e_mail.Subject = "SNC soundproof Billing Appove User!!!"
                sb.AppendLine("SNC soundproof Billing !!! ")
                sb.AppendLine("Your user Appoved : " + job_id)
                sb.AppendLine("")
                sb.AppendLine("")
                sb.AppendLine("")
                sb.AppendLine("URL : http://www.sncsoundproof.com")
            Case "ConfirmJob"
                e_mail.Subject = "SNC soundproof Billing Confirm!!!"
                sb.AppendLine("SNC soundproof Billing !!! ")
                sb.AppendLine("Your user Appoved : " + job_id)
                sb.AppendLine("")
                sb.AppendLine("")
                sb.AppendLine("")
                sb.AppendLine("URL : http://www.sncsoundproof.com")
            Case "BillingEdit"
                e_mail.Subject = "SNC soundproof Billing Edit by User!!!"
                sb.AppendLine("SNC soundproof Edit Billing  !!! ")
                sb.AppendLine("Job Id : " & job_id & "")
                sb.AppendLine("Date Tranfer : " & date_ & "  ")
                sb.AppendLine("")
                sb.AppendLine("")
                sb.AppendLine("URL : http://www.sncsoundproof.com")
        End Select

        e_mail.Body = sb.ToString
        Smtp_Server.Send(e_mail)

        '************************************************************ 
    End Sub
    Public Sub send_email_Register(name_email As String, user As String, date_ As String)
        Dim Smtp_Server As New SmtpClient
        Dim e_mail As New MailMessage()
        Smtp_Server.UseDefaultCredentials = False
        Smtp_Server.Credentials = New Net.NetworkCredential(emailuser, passemail)
        Smtp_Server.Port = 587
        Smtp_Server.EnableSsl = False
        Smtp_Server.Host = "mailsnc01.sncsoundproof.com"
        e_mail = New MailMessage()
        e_mail.From = New MailAddress(emailuser)

        e_mail.To.Add(name_email)
        e_mail.Subject = "SNC soundproof Billing Register !!!"
        e_mail.IsBodyHtml = False
        Dim sb As New StringBuilder
        sb.AppendLine("SNC Billing Register!!! ")
        sb.AppendLine("User Id : " & user & "")
        sb.AppendLine("")
        sb.AppendLine("")
        sb.AppendLine("URL : http://www.sncsoundproof.com")
        e_mail.Body = sb.ToString
        Smtp_Server.Send(e_mail)

    End Sub
    Public Function get_current_email()
        Dim ds_c As New DataSet
        Dim sql_c As String = "select * from CurentEmail_admin"
        Dim ap_c As SqlDataAdapter = New SqlDataAdapter(sql_c, connection)
        ap_c.Fill(ds_c)
        Return ds_c.Tables(0).Rows(0).Item("EmailAdmin").ToString
    End Function

    Function check_owner_job(user As String, job_id As String) 'check owner job in report tranfer
        Dim bCheck As Boolean = False
        Dim ds As New DataSet, ds_j As New DataSet
        Dim sql As String = "select Company,Level from User_bill where Username='" & user & "'"
        Dim sql_j As String = "select Factory from Des_invoice where Docnumber = '" & job_id & "'"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection), ap_j As SqlDataAdapter = New SqlDataAdapter(sql_j, connection)
        Try
            ap.Fill(ds)
            ap_j.Fill(ds_j)
            If ds.Tables(0).Rows.Count > 0 And ds_j.Tables(0).Rows.Count > 0 Then
                If ds.Tables(0).Rows(0).Item(0).ToString = ds_j.Tables(0).Rows(0).Item(0).ToString Then
                    bCheck = True
                ElseIf CInt(ds.Tables(0).Rows(0).Item("Level").ToString) >= 3 Then
                    bCheck = True
                End If

            End If
        Catch ex As Exception
            bCheck = False
        End Try
        Return bCheck
    End Function
    Public Function FN_Check_expire_password(user As String) As Boolean 'change password 90 day
        Dim bc As Boolean = False
        If user <> "" Then
            Dim ds As DataSet = New DataSet
            Dim sql As String = "select Username,time_out from User_bill where Username = '" & user & "' and username <> 'admin'"
            Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
            ap.Fill(ds)
            If ds.Tables(0).Rows.Count > 0 Then
                Dim date_t_old As DateTime = ds.Tables(0).Rows(0).Item("time_out") '08/12/2020 2:16:48 PM
                Dim date_t_now As DateTime = DateTime.Today
                date_t_old = date_t_old.AddDays(90)
                Dim day As String = CInt((date_t_old - date_t_now).TotalDays.ToString)
                If day >= 0 And day <= 30 Then
                    ' ScriptManager.RegisterStartupScript(Me, Me.GetType(), "show_model", "show_model();", True)
                ElseIf (day <= 0) Then
                    bc = True
                End If
            End If
        End If
        Return bc
    End Function


    Public Function Import_To_Grid(ByVal FilePath As String, ByVal Extension As String, ByVal isHDR As String) As DataTable

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

        dt_importExcel = New DataTable()



        cmdExcel.Connection = connExcel
        'Get the name of First Sheet=

        connExcel.Open()

        Dim dtExcelSchema As DataTable

        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing)

        Dim SheetName As String = dtExcelSchema.Rows(0)("TABLE_NAME").ToString()

        connExcel.Close()
        'Read Data from First Sheet

        connExcel.Open()

        cmdExcel.CommandText = "SELECT * From [" & SheetName & "]"

        oda.SelectCommand = cmdExcel

        oda.Fill(dt_importExcel)

        connExcel.Close()



        'Bind Data to GridView


        'GridView1.Caption = Path.GetFileName(FilePath)

        Return dt_importExcel

        'dt_importExcel.Columns("บริษัท/ห้างร้าน").ColumnName = "บริษัทห้างร้าน"
        'GridView1.DataSource = dt_importExcel
        'ds_gridview = New DataSet
        'ds_gridview.Tables.Add(dt_importExcel)
        'GridView1.DataBind()

    End Function
End Module
