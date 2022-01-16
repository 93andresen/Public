#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2


Gui, Add, Checkbox, vupdate, Update Windows
Gui, Add, Checkbox, vdebloat, Debloat Windows (Including OneDrive)
Gui, Add, Checkbox, vapps, Install Applications (Lets you choose Applications)

;Gui, Add, Radio, vMyRadio, Sample radio1
;Gui, Add, Radio,, Sample radio2

;Gui, Add, Edit, vMyEdit r5  ; r5 means 5 rows tall.
;Gui +AlwaysOnTop +Disabled -SysMenu +Owner
Gui +AlwaysOnTop +Owner
Gui, Add, Button, default xm, OK  ; xm puts it at the bottom left corner.
Gui, Show

counter=1
loop 3
{
    ControlClick, Button%counter%, %A_ScriptName%
    counter+=1
}
return

ButtonOK:
GuiClose:
GuiEscape:
Gui, Submit  ; Save each control's contents to its associated variable.


if update = 1
    inirw("w", "update", "1")
if debloat = 1
    inirw("w", "debloat", "1")
if apps = 1
    inirw("w", "apps", "1")


ExitApp


inirw(rw, key, value:="")
{
    if rw=w
        IniWrite, %value%, C:\!\TEMP\InifilesAndOther\GLOBAL_VARIABLES.ini, Section, %key%
    else if rw=r
        IniRead, value, C:\!\TEMP\InifilesAndOther\GLOBAL_VARIABLES.ini, Section, %key%
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


