Module cookies

    Public Sub checkCookie(ByVal _me As Page)
        If Read_cookie(_me) Then
            ScriptManager.RegisterStartupScript(_me, _me.GetType(), "hide_modelCookie", "hide_modelCookie();", True)
        Else
            ScriptManager.RegisterStartupScript(_me, _me.GetType(), "show_modelCookie", "show_modelCookie();", True)
        End If
    End Sub
    Public Sub Create_cookie(ByVal _me As Page, ByVal username As String)
        'Create cookie
        Dim ckUsername As HttpCookie = New HttpCookie("Username")
        Dim ckdate As HttpCookie = New HttpCookie("DateCreate")
        ' Dim ckdate As HttpCookie = New HttpCookie("DateCreate")
        ckUsername.Value = DirectCast(username, String)
        ckdate.Value = Date.Now.ToString("dd-MM-yyy HH:mm:ss")
        ckUsername.Expires = DateTime.Now.AddDays(60) ' 60 days  expires
        ckdate.Expires = DateTime.Now.AddDays(60)
        _me.Response.Cookies.Add(ckUsername)
        _me.Response.Cookies.Add(ckdate)
    End Sub
    Public Function Read_cookie(ByVal _me As Page) As Boolean
        'Read cookie
        Dim ckUsername As HttpCookie = _me.Request.Cookies("Username")
        Dim ckdate As HttpCookie = _me.Request.Cookies("DateCreate")
        If ckUsername IsNot Nothing AndAlso ckdate IsNot Nothing Then
            Return True
        Else
            Return False
        End If
    End Function


    Private Sub cookie()
        Dim script As String = "   
var modalCookie = document.getElementById('myModalCookie');
               modalCookie.style.display = 'none';
 
            "
        'btn_cookie.OnClientClick = script
        'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "a", script, True)
    End Sub
End Module
