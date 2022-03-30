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
WinWaitActive, Administrator: Windows PowerShell, , 10
if errorlevel=0
    WinSetTitle, Administrator: Windows PowerShell, , Updating All Applications And Latest Youtube Playlist ___title_for_closing___
else
{
    Tooltip, Could not set title waited 10 seconds
    log("Could not set title waited 10 seconds")
    sleep, 3000
}
ExitApp





~Esc::
ExitApp
