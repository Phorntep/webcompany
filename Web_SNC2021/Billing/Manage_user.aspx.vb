Imports System.Data.SqlClient

Public Class Manage_user
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sriptmanagerregister()

        If Not IsPostBack Then
            load_level()

            check_permission()
            load_user()

        End If
    End Sub
    Private Sub load_level()
        Dim ds As New DataSet
        Dim sql As String = "select * from Permission_Lv"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        ddLevel.DataSource = ds.Tables(0)
        ddLevel.DataTextField = "Discription_Lv"
        ddLevel.DataValueField = "Id_lv"
        ddLevel.DataBind()


    End Sub
    Private Sub check_permission()
        If Session.Count > 0 Then
            If Session.Item("username") <> "" Then
                Dim ds As New DataSet
                Dim sql As String = "select * from User_bill where Username = '" & Session.Item("username") & "'"
                Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                ap.Fill(ds)
                If ds.Tables(0).Rows(0).Item("Level") < 4 Then
                    Response.Redirect("..\Billing\Main_bill.aspx")
                End If
            Else
                Response.Redirect("..\Billing\Main_bill.aspx")
            End If
        Else
            Response.Redirect("..\Login_Bill.aspx")
        End If
    End Sub
    Private Sub load_user()
        Dim ds As New DataSet
        Dim sql As String = "select * from User_bill where Username <> 'admin'"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)
        GridView1.DataSource = ds.Tables(0)
        GridView1.DataBind()
    End Sub

    Private Sub sriptmanagerregister()
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        'ScriptManager.RegisterPostBackControl(Me.ddLevel)
        'ScriptManager.RegisterPostBackControl(Me.txtpassword)
        'ScriptManager.RegisterPostBackControl(Me.myBtn)
        ScriptManager.RegisterPostBackControl(Me.GridView1)

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
            If txtpassword.Text.Length > 4 Then
                If txtpassword.Text = txtconfirmPass.Text Then
                    sql = "Update User_bill set Password='" & Crypto.Encrypt(txtpassword.Text, key) & "', Company='" & txtCompany.Text & "', Supplier = '" & txtSupplier.Text & "', status='" & dd_status.SelectedValue & "',Address='" & txtaddress.Text & "',Tel='" & txtPhone.Text & "',Level=" & ddLevel.SelectedValue & ",Description_lv='" & ddLevel.SelectedItem.Text & "' where Username='" & txtusername.Text & "'"
                    ap = New SqlDataAdapter(sql, connection)
                    ap.Fill(ds)
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
        load_user()
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
        ddLevel.SelectedIndex = 0
        dd_status.SelectedIndex = 0


    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim ds As New DataSet
        Dim sql As String = "select * from User_bill where Username <> 'admin'"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        ap.Fill(ds)

        sql = "select * from User_bill where Username   ='" & ds.Tables(0).Rows(CInt(GridView1.SelectedRow.DataItemIndex)).Item("Username").ToString & "'"
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
        ddLevel.SelectedIndex = ds.Tables(0).Rows(0).Item("Level") - 1
        If ds.Tables(0).Rows(0).Item("Status") = True Then
            dd_status.SelectedIndex = 0
        Else
            dd_status.SelectedIndex = 1
        End If

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "OpenModel", "OpenModel();", True)
    End Sub
End Class