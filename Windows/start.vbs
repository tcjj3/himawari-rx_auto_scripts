





Function PathRemoveFileSpec2(strFileName)
  Dim RegEx
  Set RegEx = New RegExp
    RegEx.Pattern = "([^\\/]*)$"
    PathRemoveFileSpec2 = RegEx.Replace(strFileName, "")
  Set RegEx = Nothing
End Function


Function PathRemoveFileSpec4(strFileName)
  Dim fso,file
  Set fso = WSH.CreateObject("Scripting.FileSystemObject")
    If fso.FileExists(strFileName) Then
      Set file = fso.GetFile(strFileName)
      PathRemoveFileSpec4 = fso.GetParentFolderName(file)
      Set file = Nothing
    ElseIf fso.FolderExists(strFileName) Then
      PathRemoveFileSpec4 = strFileName
    Else
      PathRemoveFileSpec4 = PathRemoveFileSpec2(strFileName)
    End If
  Set fso = Nothing
End Function







ThisDirPath = PathRemoveFileSpec4(WScript.ScriptFullName)









Set objArgs = WScript.Arguments
argumentsCount = objArgs.Count




Device = ""
If argumentsCount > 0 Then
Device = objArgs.item(0)
Device = Trim(Device)
End If








Dim oShell,sCommand



set oShell	= CreateObject("WScript.Shell")






'sCommand = "cmd /c " & ThisDirPath & "\" & "himawari-rx__auto.bat"
'If Not Device = "" Then
'sCommand = sCommand & " " & Device
'End If

If Device = "" Then
sCommand = "cmd /c " & Chr (34) & ThisDirPath & "\" & "himawari-rx__auto.bat" & Chr (34)
Else
sCommand = "cmd /c " & Chr (34) & Chr (34) & ThisDirPath & "\" & "himawari-rx__auto.bat" & Chr (34) & " " & Device & Chr (34)
End If







oShell.Run sCommand, 1, False











'sCommand = "cmd /c time_monitor_to_terminate_TSDuck.bat"

sCommand = "cmd /c " & Chr (34) & ThisDirPath & "\" & "time_monitor_to_terminate_TSDuck.bat" & Chr (34)


oShell.Run sCommand, 1, False












set oShell	= Nothing










