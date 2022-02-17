#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2



Gui, Add, Text,, If you want to revert settings, use the system restore point named "Before_Running_Windows10ToolkitRichard"
Gui, Add, Text,, 
Gui, Add, Checkbox, vupdate, Update Windows
Gui, Add, Checkbox, vdebloat, Debloat Windows Including OneDrive
Gui, Add, Checkbox, vapps, Install Applications (Lets you choose Applications)
Gui, Add, Checkbox, vnetflix, Netflix 2.0 (Stream Torrents)
Gui, Add, Checkbox, vreboot, Automaticly Reboot when finished (Many changes require reboot to take effect. Will Reboot fast, meaning you will not have time to save documents etc.)
Gui, Add, Text,, 
Gui, Add, Text,, Tweak Settings (Privacy and Performance)
Gui, Add, Radio, vooshutup1, Will Keep These Settings As is
Gui, Add, Radio, vooshutup2, Basic Protection (Probably best for most people)
Gui, Add, Radio, vooshutup3, 
Gui, Add, Radio, vooshutup4, 


;Gui, Add, Edit, vMyEdit r5  ; r5 means 5 rows tall.
;Gui +AlwaysOnTop +Disabled -SysMenu +Owner
Gui +AlwaysOnTop +Owner
Gui, Add, Button, default xm, OK  ; xm puts it at the bottom left corner.
Gui, Show
count=1
loop 5
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

ButtonOK:
GuiClose:
GuiEscape:
Gui, Submit  ; Save each control's contents to its associated variable.

if ooshutup1 = 1
    ooshutup = 1
else if ooshutup2 = 1
    ooshutup = 2
else if ooshutup3 = 1
    ooshutup = 3
else if ooshutup4 = 1
    ooshutup = 4

inirwTOOLKIT("w", "update", update)
inirwTOOLKIT("w", "debloat", debloat)
inirwTOOLKIT("w", "apps", apps)
inirwTOOLKIT("w", "netflix", netflix)
inirwTOOLKIT("w", "reboot", reboot)
inirwTOOLKIT("w", "ooshutup", ooshutup)



ExitApp


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


