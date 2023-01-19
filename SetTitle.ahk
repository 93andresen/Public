#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2
DetectHiddenWindows, On
DetectHiddenText, On
;#Include, AutohotkeyFucktions.ahk
;CompileRun(A_ScriptFullPath)

old_title=%1%
new_title=%2%

WinWaitActive, %old_title%, , 60
if errorlevel=0
    WinSetTitle, %old_title%, , %new_title%
else
{
    Tooltip, Could not set title waited 60 seconds
    ;log("Could not set title waited 60 seconds")
    sleep, 3000
}
ExitApp





~Esc::
ExitApp
