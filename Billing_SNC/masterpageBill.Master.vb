Imports System.Data.SqlClient
Imports System.Web.Security

Public Class masterpageBill
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '_ScriptManager()
        'If Not Me.Page.User.Identity.IsAuthenticated Then
        '    FormsAuthentication.RedirectToLoginPage()
        'End If
        'Response.Cookies.Set(New HttpCookie("theCookie", "SomeValue"))
        'ResetCache()

        If Not IsPostBack Then

            If Session.Item("username") <> "" Then
                'lblusername.Text = Session.Item("username") 
                'Session.Remove("username")
                Check_permission()
                checkCookie(Me.Page)
            Else
                Response.Redirect("..\Login_Bill.aspx")
            End If
        End If

    End Sub
    Private Sub _ScriptManager()
        'ScriptManager.GetCurrent(Me.Page).RegisterPostBackControl(Me.Button1)
        Dim ScriptManager As ScriptManager = ScriptManager.GetCurrent(Me.Page)
        ScriptManager.RegisterPostBackControl(Me.btn_cookie)
    End Sub
    Private Sub ResetCache()
        Dim allCaches As IDictionaryEnumerator = HttpRuntime.Cache.GetEnumerator()

        While allCaches.MoveNext()
            Cache.Remove(allCaches.Key.ToString())
        End While

        Response.Write("Remove all caches!")
    End Sub
    Private Sub Check_permission()
        Dim ds As New DataSet
        Dim sql As String = "select * from User_bill where Username = '" & Session.Item("username") & "'"
        Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
        Try
            ap.Fill(ds)
            If ds.Tables(0).Rows(0).Item("Level") < 3 Then
                'Response.Redirect("..\Billing\Main_bill.aspx")
                ' link_regis.Visible = False
                but_billing.Visible = False
                ' a_add_payment.Visible = False
                Chk_tranfer.Visible = False
                btn_icon_userinsystem.Visible = False
                div_dd2.Visible = False

            End If
        Catch ex As Exception
            Response.Redirect("..\Login_Bill.aspx")
        End Try

    End Sub

    Protected Sub btnlogout_Click1(sender As Object, e As EventArgs)
        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue.Substring(confirmValue.LastIndexOf(",") + 1) = "Yes" Then
            Session.Remove("username")
            Response.Redirect(Request.RawUrl)
        End If
    End Sub
    Protected Sub btn_cookie_Click1(sender As Object, e As EventArgs)
        Create_cookie(Me.Page, DirectCast(Session.Item("username"), String))
        checkCookie(Me.Page)
    End Sub

End Class