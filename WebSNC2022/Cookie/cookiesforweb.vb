Imports System.Net
Imports System
Module cookies

    Public Sub checkCookie(ByVal _me As Page)
        If Read_cookie(_me) Then
            ScriptManager.RegisterStartupScript(_me, _me.GetType(), "hide_modelCookie", "hide_modelCookie();", True)
        Else
            ScriptManager.RegisterStartupScript(_me, _me.GetType(), "show_modelCookie", "show_modelCookie();", True)
        End If
    End Sub
    Public Sub Create_cookie(ByVal _me As Page, ByVal userIP As String)
        'Create cookie

        Dim IPHost As String = Dns.GetHostName()
        Dim ckIP As HttpCookie = New HttpCookie("TPcreate")
        Dim ckdate As HttpCookie = New HttpCookie("DateCreate")
        Dim IP As IPHostEntry = Dns.GetHostEntry(IPHost)
        Dim address As String = Dns.GetHostByName(IPHost).AddressList(0).ToString()
        'set value to cookie
        ckdate.Value = Date.Now.ToString("dd-MM-yyy HH:mm:ss")
        ckIP.Expires = DateTime.Now.AddDays(180) ' 180 days  expires
        ckdate.Expires = DateTime.Now.AddDays(180)
        ckIP.Value = address
        'add cookie object in system
        _me.Response.Cookies.Add(ckIP)
        _me.Response.Cookies.Add(ckdate)
    End Sub
    Public Function Read_cookie(ByVal _me As Page) As Boolean
        'Read cookie
        Dim ckIP As HttpCookie = _me.Request.Cookies("IPcreate")
        Dim ckdate As HttpCookie = _me.Request.Cookies("DateCreate")

        If ckIP IsNot Nothing AndAlso ckdate IsNot Nothing Then
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
