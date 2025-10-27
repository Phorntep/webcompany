Imports System.Data.SqlClient

Public Class Index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Check_expire_password()

        End If
        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "show_model", "show_model();", True)


    End Sub



    Private Sub Check_expire_password()
        If Session.Count > 0 Then
            Try
                Dim ds As DataSet = New DataSet
                Dim sql As String = "select Username,time_out from User_bill where Username = '" & Session.Item("username").ToString & "' and username <> 'admin'"
                Dim ap As SqlDataAdapter = New SqlDataAdapter(sql, connection)
                ap.Fill(ds)
                If ds.Tables(0).Rows.Count > 0 Then
                    If IsDBNull(ds.Tables(0).Rows(0).Item("time_out")) = True Then
                        Dim ds2 As DataSet = New DataSet
                        Dim sql2 As String = "update User_bill set time_out = GETDATE() where Username = '" & Session.Item("username").ToString & "'"
                        Dim ap2 As SqlDataAdapter = New SqlDataAdapter(sql2, connection)
                        ap2.Fill(ds2)
                        Check_expire_password()
                    Else
                        Dim date_t_old As DateTime = ds.Tables(0).Rows(0).Item("time_out") '08/12/2020 2:16:48 PM
                        Dim date_t_now As DateTime = DateTime.Today
                        date_t_old = date_t_old.AddDays(90)
                        Dim day As String = CInt((date_t_old - date_t_now).TotalDays.ToString)
                        lbl_day.Text = "The password will expire in " + day + " days."
                        If day >= 0 And day <= 30 Then
                            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "show_model", "show_model();", True)
                        ElseIf (day <= 0) Then
                            Response.Redirect("..\Billing\Reset_password.aspx")
                        End If
                    End If
                End If
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert_User_worng", "alert_User_worng();", True)
            End Try
        End If
    End Sub
End Class