#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, Force

update := inirwTOOLKIT("r", "update")
debloat := inirwTOOLKIT("r", "debloat")
apps := inirwTOOLKIT("r", "apps")
netflix := inirwTOOLKIT("r", "netflix")
reboot := inirwTOOLKIT("r", "reboot")

; If the script is not elevated, relaunch as administrator and kill current instance:

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



if apps = 1
{
    runwait, C:\temp_Windows10ToolkitRichard\Public-main\Windows10ToolkitRichard2apps.ahk
}


if netflix = 1
    runwait, C:\temp_Windows10ToolkitRichard\Public-main\Netflix_2.0.ahk

;clipboard=C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt
;msgbox, FINISHED`n`nclipboard = the LOG file`nC:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt

if reboot = 1
{
    run, powershell.exe shutdown /r /f /t 1
}





ExitApp

Esc::
ExitApp


AppendFileToLog(readfile)
{
    FileRead, readfilevar, %readfile%
    FileAppend, `n%readfilevar%, C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt
}

HookGUICheckboxes(check, from, too)
{ 
    count=%from%
    loop
    {
        loop
        {
            GuiControlGet, Button%count% ; Retrieves 1 if it is checked, 0 if it is unchecked.
            if Button%count%!=%check%
                ControlClick, Button%count%
            else if Button%count%=%check%
                break
        }
        count+=1
        if count > %too%
            break
    }
}


/*

;Tooltip, Installing VERACRYPT (Innstallation is not silent because of fast boot) --ignore-checksums -y -  `nnSpotify Install tends to bug out and never complete, so i install it now using "run" instead of runwait and let it complete before Chris Titus Windows 10 Debloater Script is finished
run, powershell.exe cup spotify --ignore-checksums -y,,min
run, powershell.exe cup winja --ignore-checksums -y,,min
runwait, powershell.exe cup veracrypt --ignore-checksums -y,,min


;SILENT_INSTALL_AFTER_THIS__________________________________________________________________________
;Tooltip, ONLY KEEPASS (Because I don't ignore checksums on keepass)
runwait, powershell.exe cup keepass -y,,min

;Tooltip, c:\python39\python.exe -m pip install --upgrade pip
runwait, powershell.exe python -m pip install --upgrade pip,,min

;Tooltip, %NESSESCARY_APPS% --ignore-checksums -y
runwait, powershell.exe cup %NESSESCARY_APPS% --ignore-checksums -y,,min

;Tooltip, %KEEPASS_AND_PLUGINS% -y
runwait, powershell.exe cup %KEEPASS_AND_PLUGINS% -y,,min

;Tooltip, %YUBIKEY_APPS% -y
runwait, powershell.exe cup %YUBIKEY_APPS% --ignore-checksums -y,,min

runwait, cmd.exe /c bcdedit /set hypervisorlaunchtype off,,min




*/

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
