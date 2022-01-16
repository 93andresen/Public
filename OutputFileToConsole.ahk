#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2
#Include, AutohotkeyFucktions.ahk


logfile=%1%
logfile=C:\!\testdelete.txt

x=1
loop
{
    
    FileReadLine, v, %logfile%, %x%
    if Errorlevel=0
    {
        Stdout(v)	;output to new console
        x+=1
    }
    else
    {
        sleep, 100
    }
}

