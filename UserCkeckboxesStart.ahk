#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2


Gui, Add, Text,, if you want to revert settings, use the system restore point ""
Gui, Add, Checkbox, vupdate, Update Windows
Gui, Add, Checkbox, vdebloat, Debloat Windows Including OneDrive
Gui, Add, Checkbox, vapps, Install Applications (Lets you choose Applications)
Gui, Add, Checkbox, vnetflix, Netflix 2.0 (Stream Torrents)
Gui, Add, Checkbox, vreboot, Automaticly Reboot when finished (Many changes require reboot to take effect, Will Reboot fast, meaning you will not have time to save documents etc.)

;Gui, Add, Radio, vMyRadio, Sample radio1
;Gui, Add, Radio,, Sample radio2

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


if update = 1
    inirwTOOLKIT("w", "update", "1")
else
    inirwTOOLKIT("w", "update", "0")
if debloat = 1
    inirwTOOLKIT("w", "debloat", "1")
else
    inirwTOOLKIT("w", "debloat", "0")
if apps = 1
    inirwTOOLKIT("w", "apps", "1")
else
    inirwTOOLKIT("w", "apps", "0")
if netflix = 1
    inirwTOOLKIT("w", "netflix", "1")
else
    inirwTOOLKIT("w", "netflix", "0")
if reboot = 1
    inirwTOOLKIT("w", "reboot", "1")
else
    inirwTOOLKIT("w", "reboot", "0")



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


