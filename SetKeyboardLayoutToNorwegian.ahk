#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2
DetectHiddenWindows, On
DetectHiddenText, On
SetBatchLines, 10ms
#Include, AutohotkeyFucktions.ahk
;CompileRun(A_ScriptFullPath)
log("Started Running")


clipboard=$UserLanguageList = New-WinUserLanguageList -Language "no-NO"; $UserLanguageList.Add("no-NO"); Set-WinUserLanguageList -LanguageList $UserLanguageList -Force
run, powershell.exe,,max
winwaitactive, ahk_exe powershell.exe
send, ^v{enter}
ExitAppLog()