#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2
DetectHiddenWindows, On
DetectHiddenText, On
#Include, AutohotkeyFucktions.ahk
;CompileRun(A_ScriptFullPath)

old_title=%1%
new_title=%2%


loop 100
{
    WinActivate, ahk_exe powershell.exe
    WinGetActiveTitle, AT
    if AT contains PowerShell
        break
    sleep, 100
}
WinWaitActive, Administrator: Windows PowerShell, , 3
if errorlevel=0
    WinSetTitle, Administrator: Windows PowerShell, , Windows10ToolkitRichard.ps1 update debloat darktsk reboot ooshutup3 dns4c6a personal
else
{
    Tooltip, Could not set title waited 3 seconds
    log("Could not set title waited 3 seconds")
    sleep, 3000
}
ExitApp





~Esc::
ExitApp
