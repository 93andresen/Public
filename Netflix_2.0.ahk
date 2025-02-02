#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2
DetectHiddenWindows, On
DetectHiddenText, On
SetBatchLines, 10ms
#Include C:\_\Code\GitHub\93andresen_Scripts\Autohotkey\lib\AutohotkeyFucktions.ahk
;CompileRun(A_ScriptFullPath)
log("Started Running")

/*
for netflix 2.0 
https://github.com/webtorrent/webtorrent-cli
*/

shortcut=C:\Users\%A_UserName%\Desktop\Netflix_2.0.ink
shortcut2=%A_Desktop%\Netflix_2.0.ink
if not FileExist(shortcut)
    FileCreateShortcut, C:\temp_Windows10ToolkitRichard\Public-main\Netflix_2.0.ahk, C:\Users\%A_UserName%\Desktop\Netflix_2.0.ink
if not FileExist(shortcut2)
    FileCreateShortcut, C:\temp_Windows10ToolkitRichard\Public-main\Netflix_2.0.ahk, %A_Desktop%\Netflix_2.0.ink


IniRead, count, C:\Users\93and\AppData\Local\Temp\counter.ini, Section, count
count += 1
IniWrite, %count%, C:\Users\93and\AppData\Local\Temp\counter.ini, Section, count

if clipboard contains magnet:?
{
    magnet=%clipboard%
    goto, here
}

Gui, Add, Edit, vsearch x23 y52 w340 h50 ,
Gui, Add, Button, x83 y112 w220 h70 , Arr Arr I'm a pirate!
Gui, Add, Text, x83 y12 w220 h30 +Center, Search Series and Movies!
; Generated using SmartGUI Creator 4.0
Gui, Show, x393 y164 h194 w391, Netflix 2.0
Return

GuiClose:
run, https://www.youtube.com/watch?v=dQw4w9WgXcQ,,max
ExitApp

ButtonArrArrI'mapirate!:
~Enter::
WinGetActiveTitle, AT
if AT != Netflix 2.0
    return
Gui, submit
Random, rnd, 0, 9
IniRead, porn, C:\Users\93and\AppData\Local\Temp\counter.ini, Section, porn
IniWrite, 0, C:\Users\93and\AppData\Local\Temp\counter.ini, Section, porn
if porn = 1
{
    goto, skip_porn
}
if count > 5
{
    if count = 5
    {
        rnd = 9
    }
    if rnd = 9
    {
        skiptoporn:
        run, https://thepiratebay0.org/top/500,,max
        porn=1
        IniWrite, 1, C:\Users\93and\AppData\Local\Temp\counter.ini, Section, porn
        goto, endporn
    }
}
skip_porn:
run, https://thepiratebay0.org/s/?page=0&orderby=99&q=%search%,,max
waitforlink:
loop
{
    if clipboard contains magnet:?
    {
        magnet=%clipboard%
        Tooltip, 
        goto, here
    }
    else
        sleep, 10
    Tooltip, Waiting for magnet link in clipboard
}

Mbutton::
MouseGetPos, mx, my
WinGetActiveTitle, AT
if clipboard contains magnet:?
{
    magnet=%clipboard%
}
else if AT contains Chrome
    {
        msgbox, You are using Chrome, Right-click the magnet and click "copy link adress"
        goto, waitforlink
    }
else if AT contains Firefox
{
    loop 3
    {
        mouse_click_func(mx, my, button:="right", sleep_ms:=0, speed:=0)
        sleep, 100
        send, l
        sleep, 100
        if clipboard contains magnet:?
        {
            var=1
            magnet=%clipboard%
            goto, here
        }
        sleep, 200
    }
    if clipboard contains magnet:?
    {
        magnet=%clipboard%
    }
    else
        goto, waitforlink
}
else
    goto, skip_porn
here:
Gui, submit
file=C:\Users\%A_UserName%\AppData\Local\WebTorrent\WebTorrent.exe
if not FileExist(file)
{
    full_command_line := DllCall("GetCommandLine", "str")
    if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
    {
        try ; leads to having the script re-launching itself as administrator
        {
            if A_IsCompiled
                Run *RunAs "%A_ScriptFullPath%" /restart
            else
                Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
        }
        ExitApp
    }
    Tooltip, Webtorrent is not Installed - Installing now
    if not FileExist("C:\ProgramData\chocolatey\bin\choco.exe")
        runwait, powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')),,max
    runwait, powershell.exe cup webtorrent-desktop,,max
    countdown = 300
    loop %countdown%
    {
        if not FileExist(file)
            Tooltip, Waiting for file to appear:`n`nC:\Users\%A_UserName%\AppData\Local\WebTorrent\WebTorrent.exe`n`nTimeout - %countdown%/300
        countdown -= 1
        sleep, 100
    }
    if not FileExist(file)
    {
        Tooltip, 
        msgbox, ERROR, can't seem to install webtorrent, try again or install it manually first... Exiting App...
        ExitApp
    }
}
Tooltip, 
run, cmd.exe /k %file% "%magnet%",,hide

loop 300
{
    WinActivate, WebTorrent
    winmaximize, WebTorrent
    WinGetActiveTitle, AT
    if AT = WebTorrent
    {
        WinActivate, WebTorrent
        winmaximize, WebTorrent
        break
    }
    sleep, 100
}

Esc::
endporn:
if porn = 1
{
    msgbox, There's no Escaping Destiny. . .
    msgbox, Never gonna give you up!
    run, https://www.youtube.com/watch?v=dQw4w9WgXcQ,,max
}
msgbox, FINISHED
ExitApp



