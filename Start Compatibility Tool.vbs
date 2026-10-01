Option Explicit

Dim fileSystem, shell, installRoot, pythonWindowed, command, exitCode, logPath

Set fileSystem = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

installRoot = fileSystem.GetParentFolderName(WScript.ScriptFullName)
pythonWindowed = fileSystem.BuildPath(installRoot, "runtime\pythonw.exe")
logPath = fileSystem.BuildPath(installRoot, "logs\latest-session.log")

If Not fileSystem.FileExists(pythonWindowed) Then
    MsgBox "The portable Python runtime is missing." & vbCrLf & vbCrLf & _
        "Extract the complete ZIP before starting the tool.", _
        vbCritical, "QT9 Web Service Compatibility Tool"
    WScript.Quit 2
End If

shell.CurrentDirectory = installRoot
command = Quote(pythonWindowed) & " -I -B -m qms_compare.gui_launcher"

On Error Resume Next
exitCode = shell.Run(command, 0, True)
If Err.Number <> 0 Then
    MsgBox "Windows could not start the compatibility tool." & vbCrLf & vbCrLf & _
        "For more detail, run Start With Diagnostics.cmd.", _
        vbCritical, "QT9 Web Service Compatibility Tool"
    WScript.Quit 2
End If
On Error GoTo 0

If exitCode <> 0 Then
    MsgBox "The compatibility tool closed because of an error." & vbCrLf & vbCrLf & _
        "Diagnostic log:" & vbCrLf & logPath & vbCrLf & vbCrLf & _
        "You can also run Start With Diagnostics.cmd for live details.", _
        vbCritical, "QT9 Web Service Compatibility Tool"
End If

WScript.Quit exitCode

Function Quote(value)
    Quote = Chr(34) & value & Chr(34)
End Function
