;6
#NoTrayIcon
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


try
{
    run, powershell.exe scoop uninstall peazip,,hide
}
catch
{
    sleep, 1
}



ExitApp


