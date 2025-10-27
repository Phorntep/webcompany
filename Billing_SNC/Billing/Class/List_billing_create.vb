Imports System.Collections.Generic
Public Class List_billing_create
    Private strStudentSurname As String
    Private strStudentName As String

    Public Property StudentSurname() As String
        Get
            Return strStudentSurname
        End Get
        Set(ByVal value As String)
            strStudentSurname = value
        End Set
    End Property

    Public Property StudentName() As String
        Get
            Return strStudentName
        End Get
        Set(ByVal value As String)
            strStudentName = value
        End Set
    End Property



End Class
