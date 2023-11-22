Option Explicit

Dim app
Dim ws
Dim command

Set app = CreateObject("Shell.Application")
Set ws  = CreateObject("WScript.Shell")
command = "/K ""CD /d " + ws.CurrentDirectory + """"
app.ShellExecute "cmd.exe", command, "", "runas", 1

' 引数からディレクトリを取得するする版
' If Wscript.Arguments.Count > 0 Then
'     Dim command
'     command = "/K ""CD /d " + Wscript.Arguments(0) + """"
'     obj.ShellExecute "cmd.exe", command, "", "runas", 1
' Else
'     obj.ShellExecute "cmd.exe", "", "", "runas", 1
' End If
