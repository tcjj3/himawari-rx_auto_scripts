

Dim oShell,sCommand



set oShell	= CreateObject("WScript.Shell")



sCommand = "cmd /c himawari-rx__auto.bat"
oShell.Run sCommand, 1, False


sCommand = "cmd /c time_monitor_to_terminate_TSDuck.bat"
oShell.Run sCommand, 1, False



set oShell	= Nothing




