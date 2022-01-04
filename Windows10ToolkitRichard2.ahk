#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, Force

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


FileCreateDir, C:\temp_Windows10ToolkitRichard\InstallingApplicationsLists
SetWorkingDir, C:\temp_Windows10ToolkitRichard\InstallingApplicationsLists



gui, Add, Tab2,, Pick Applications to Install 2/2
gui, add, Text,, Keepass And Plugins:
gui, add, checkbox, vALL3, Check All - Keepass and All Plugins
loop, read, Keepass_And_Plugins_List.txt
{
    gui, Tab, 1
    if	!Mod(A_Index, 30)
        gui, add, Text, ys, 
    gui, add, checkbox, vcheckbox3_%A_Index%, %A_LoopReadLine%
    appname3_%A_Index% = %A_LoopReadLine%
    countlines += 1
}
countlines2 = countlines
gui, add, Text, ys, Yubikey Apps:
gui, add, checkbox, vALL4, Check All - Yubikey Apps
loop, read, Yubikey_Apps_List.txt
{
    ;gui, Tab, 2
    if	!Mod(A_Index, 30)
        gui, add, Text, ys
    gui, add, checkbox, vcheckbox4_%A_Index%, %A_LoopReadLine%
    appname4_%A_Index% = %A_LoopReadLine%
    countlines += 1
}
countlines2 = countlines
gui, add, Text, ys, Winget Apps:
loop, read, Winget_List.txt
{
    ;gui, Tab, 2
    if	!Mod(A_Index, 30)
        gui, add, Text, ys
    gui, add, checkbox, vcheckbox5_%A_Index%, %A_LoopReadLine%
    appname5_%A_Index% = %A_LoopReadLine%
    countline += 1
}
countlines2 = countlines
gui, add, Text, ys, Extra Chocolatey Apps (1 per line):
gui, Add, Edit, tab_extra r30  ; r30 means 30 rows tall.
gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.
gui, Add, Button, default xm, INSTALL  ; xm puts it at the bottom left corner.
gui, Show
WinWaitActive, Windows10ToolkitRichard2.ahk
WinSetTitle, Windows10ToolkitRichard2.ahk, , Pick Applications to Install 2/2 - Keepass And Plugins Yubikey Apps and Winget Apps


loop
{
    GuiControlGet, check,, Button1
    if (check = 1 and check_ran3 != 1)
    {
        HookGUICheckboxes(check, "1", "44")
        HookGUICheckboxes(check, countlines1, countlines2)
        check_ran3=1
    }
    else if (check = 0 and check_ran3 != 0)
    {
        HookGUICheckboxes(check, "1", "44")
        check_ran3=0
    }

    GuiControlGet, check,, Button45
    if (check = 1 and check_ran4 != 1)
    {
        HookGUICheckboxes(check, "45", "51")
        check_ran4=1
    }
    else if (check = 0 and check_ran4 != 0)
    {
        HookGUICheckboxes(check, "45", "51")
        check_ran4=0
    }
    sleep, 100
}


ButtonINSTALL:
gui, Submit  ; Save each control's contents to its associated variable.




count=1
loop 500
{
    if checkbox3_%count% = 1
    {
        FileAppend, % appname3_%count%, PICKED_Winget_List.txt
        FileAppend, %A_Space%, PICKED_Winget_List.txt
    }
}
count=1
loop 500
{
    if checkbox4_%count% = 1
    {
        FileAppend, % appname4_%count%, PICKED_Keepass_And_Plugins_List.txt
        FileAppend, %A_Space%, PICKED_Keepass_And_Plugins_List.txt
    }
    count+=1
}
count=1
loop 500
{
    if checkbox5_%count% = 1
    {
        FileAppend, % appname5_%count%, PICKED_Yubikey_Apps_List.txt
        FileAppend, %A_Space%, PICKED_Yubikey_Apps_List.txt
    }
    count+=1
}
FileAppend, %tab_extra%, Extra_Chocolatey_Apps.txt
loop, read, Extra_Chocolatey_Apps.txt
{
    FileAppend, %A_LoopReadLine%%A_Space%, PICKED_Extra_Chocolatey_Apps.txt
}

fileread, PICKED_Chocolatey_Apps_Nessescary_List, PICKED_Chocolatey_Apps_Nessescary_List.txt
fileread, PICKED_Chocolatey_Apps_Maybe_And_Other_List, PICKED_Chocolatey_Apps_Maybe_And_Other_List.txt
fileread, PICKED_Winget_List, PICKED_Winget_List.txt
fileread, PICKED_Keepass_And_Plugins_List, PICKED_Keepass_And_Plugins_List.txt
fileread, PICKED_Yubikey_Apps_List, PICKED_Yubikey_Apps_List.txt
fileread, PICKED_Extra_Chocolatey_Apps, PICKED_Extra_Chocolatey_Apps.txt


runwait, powershell.exe choco feature enable -n=allowGlobalConfirmation -y,,min

if PICKED_Chocolatey_Apps_Nessescary_List contains Setdefaultbrowser Firefox
{
    runwait, powershell.exe cup Setdefaultbrowser firefox --ignore-checksums -y > Installing_Applications_Output.txt,,min
    run, powershell.exe SetDefaultBrowser.exe HKLM Firefox-308046B0AF4A39CB, , min ;this will set the x64 Firefox as my default
}
runwait, powershell.exe choco upgrade %PICKED_Chocolatey_Apps_Nessescary_List% --ignore-checksums -y > Installing_Applications_Output_Chocolatey_Apps_Nessescary_List.txt,,min
runwait, powershell.exe choco upgrade %PICKED_Chocolatey_Apps_Maybe_And_Other_List% --ignore-checksums -y > Installing_Applications_Output_Chocolatey_Apps_Maybe_And_Other_List.txt,,min
runwait, powershell.exe winget install %PICKED_Winget_List% > Installing_Applications_Output_Winget_List.txt,,min
runwait, powershell.exe choco upgrade %PICKED_Keepass_And_Plugins_List% -y > Installing_Applications_Output_Keepass_And_Plugins_List.txt,,min
runwait, powershell.exe choco upgrade %PICKED_Yubikey_Apps_List% -y > Installing_Applications_Output_Yubikey_Apps_List.txt,,min
runwait, powershell.exe choco upgrade %PICKED_Extra_Chocolatey_Apps% --ignore-checksums -y > Installing_Applications_Output_Extra_Chocolatey_Apps.txt,,min


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


;Tooltip, %WINGET_APPS%
FileDelete, WINGET_APPS_LIST_TEMP.txt
loop, Parse, WINGET_APPS, %A_Space%
FileAppend, winget install %A_LoopField%;, WINGET_APPS_LIST_TEMP.txt
FileRead, winget_list, WINGET_APPS_LIST_TEMP.txt
FileDelete, WINGET_APPS_LIST_TEMP.txt
runwait, powershell.exe %winget_list%,,min

*/
msgbox, FINISHED
ExitApp

Esc::
ExitApp


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
