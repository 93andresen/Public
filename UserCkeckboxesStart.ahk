#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2


inirwTOOLKIT("w", "update", "0")
inirwTOOLKIT("w", "debloat", "0")
inirwTOOLKIT("w", "apps", "0")
inirwTOOLKIT("w", "netflix", "0")
inirwTOOLKIT("w", "darktsk", "0")
inirwTOOLKIT("w", "reboot", "0")
inirwTOOLKIT("w", "ooshutup0", "0")
inirwTOOLKIT("w", "ooshutup1", "0")
inirwTOOLKIT("w", "ooshutup2", "0")
inirwTOOLKIT("w", "ooshutup3", "0")
inirwTOOLKIT("w", "ooshutup4", "0")


Gui, Add, Text,, If you want to revert settings, use the system restore point named "Before_Running_Windows10ToolkitRichard"
Gui, Add, Text,, 
Gui, Add, Checkbox, vupdate, Update Windows
Gui, Add, Checkbox, vdebloat, Debloat Windows Including OneDrive
Gui, Add, Checkbox, vapps, Install Applications (Lets you choose Applications)
Gui, Add, Checkbox, vdarktsk, Task Manager Dark Mode
Gui, Add, Checkbox, vreboot, Automaticly Reboot when finished (Many changes require reboot to take effect. Will Reboot fast, meaning you will not have time to save documents etc.)
Gui, Add, Text,, 
Gui, Add, Text,, Tweak Settings (Privacy, Security and Performance)
Gui, Add, Radio, vooshutup1, Essesinal Tweaks (Probably Best For Most People)
Gui, Add, Radio, vooshutup2, Essesinal Tweaks + Disable Microphone And Webcam
Gui, Add, Radio, vooshutup3, Essesinal Tweaks + Disable App Access (For The Paranoid)
Gui, Add, Radio, vooshutup4, Undo All Changes (Revert To Factory Settings)
Gui, Add, Radio, vooshutup0, Don't Do Anything - Will Keep These Settings As is


;Gui, Add, Edit, vMyEdit r5  ; r5 means 5 rows tall.
;Gui +AlwaysOnTop +Disabled -SysMenu +Owner
Gui +AlwaysOnTop +Owner
Gui, Add, Button, default xm, OK  ; xm puts it at the bottom left corner.
Gui, Add, Text,, 
Gui, Add, Button, default xm, Netflix 2.0
Gui, Add, Button, default xm, ;QuickFix
Gui, Add, Button, default xm, I Don't Care Just don't Waste my time I aint got all day
Gui, Show
count=1
loop 6
{
    loop
    {
        GuiControlGet, v,, Button%count%, %A_ScriptName% ; Retrieves 1 if it is checked, 0 if it is unchecked.
        if v != 1
            ControlClick, Button%count%, %A_ScriptName%
        else if v = 1
            break
    }
        count+=1
}
return

;RunPowershellLoghjkhjkhjkhjk
;msgbox, YYYYYYYYYY
;ExitApp
;ButtonQuickFix:
;ButtonIDontCareJustdontWastemytimeIaintgotallday:
;msgbox, ghghghgh
;ExitApp
;ButtonNetflix2.0:
ButtonIDon'tCareJustdon'tWastemytimeIaintgotallday:
run, C:\temp_Windows10ToolkitRichard\Public-main\NeedForSpeed.ahk
ExitApp
ButtonOK:
GuiClose:
GuiEscape:
Gui, Submit  ; Save each control's contents to its associated variable.


inirwTOOLKIT("w", "update", update)
inirwTOOLKIT("w", "debloat", debloat)
inirwTOOLKIT("w", "apps", apps)
inirwTOOLKIT("w", "netflix", netflix)
inirwTOOLKIT("w", "darktsk", darktsk)
inirwTOOLKIT("w", "reboot", reboot)
inirwTOOLKIT("w", "ooshutup0", ooshutup0)
inirwTOOLKIT("w", "ooshutup1", ooshutup1)
inirwTOOLKIT("w", "ooshutup2", ooshutup2)
inirwTOOLKIT("w", "ooshutup3", ooshutup3)
inirwTOOLKIT("w", "ooshutup4", ooshutup4)

ExitApp

RunPowershellLog(command, path:="C:\_\Logs\Powershell\_PowershellLog.txt", minmaxhide:="max", wait:="0")
{
    ;FormatTime, TimeLong,, yyyy-MM-dd-HH.mm.ss
    ;if temp_path = TimeLong_temp_path
    ;    temp_path = C:\_\Logs\Powershell\%TimeLong%_PowershellLog.txt
    SplitPath, path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    if not FileExist(OutDir)
        FileCreateDir, %OutDir%
    ;SplitPath, temp_path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    ;if not FileExist(OutDir)
    ;    FileCreateDir, %OutDir%
    bypass_command = Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    if wait=1
        runwait, powershell.exe %bypass_command%%command% | Tee-Object -a -file %path%,,%minmaxhide%
    else
        run, powershell.exe %bypass_command%%command% | Tee-Object -a -file %path%,,%minmaxhide%
    ;FileRead, ps_tmp, %temp_path%
    ;FileAppend, `n%ps_tmp%, %path%
}

inirwTOOLKIT(rw, key, value:="")
{
    if rw=w
        IniWrite, %value%, C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichard.ini, Section, %key%
    else if rw=r
        IniRead, value, C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichard.ini, Section, %key%
    Else
        msgbox, ERROR, rw was not r or w`nrw=%rw%
    return %value%
}

Print(string){
	ListVars
	WinWait ahk_id %A_ScriptHwnd%
	ControlSetText Edit1, %string%
	WinWaitClose
}
PrintDebug(string:=""){
	Static
	string := string ? string . "`r`n" . lastStr : "", lastStr := string
	If !WinActive("ahk_class AutoHotkey"){
		ListVars
		WinWait ahk_id %A_ScriptHwnd%
		WinGetTitle, title, ahk_id %A_ScriptHwnd%
	}Else If !string{
		PostMessage, 0x112, 0xF060,,, %title% ; 0x112 = WM_SYSCOMMAND, 0xF060 = SC_CLOSE
		Return
	}
	ControlSetText Edit1, %string%, ahk_id %A_ScriptHwnd%
}

~Esc::
if esc!=1
{
    esc=1
    log("Escape Pressed Once")
    msgbox, %A_ScriptName% is Paused`n`n%A_ScriptFullPath%`n`n`nPress Esc twice to Exit App
}
else if esc=1
    ExitApp

