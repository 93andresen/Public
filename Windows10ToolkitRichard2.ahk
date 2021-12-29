#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, Force

FileCreateDir, C:\temp_Windows10ToolkitRichard
SetWorkingDir, C:\temp_Windows10ToolkitRichard



gui, GUI2:Add, Tab2,, Pick Applications to Install 2/2
gui, GUI2:add, Text,, Keepass And Plugins:
loop, read, Keepass_And_Plugins_List.txt
{
    gui, GUI2:Tab, 1
    if	!Mod(A_Index, 30)
        gui, GUI2:add, Text, ys, 
    gui, GUI2:add, checkbox, vcheckbox3_%A_Index%, %A_LoopReadLine%
}
gui, GUI2:add, Text, ys, Yubikey Apps:
loop, read, Yubikey_Apps_List.txt
{
    ;gui, GUI2:Tab, 2
    if	!Mod(A_Index, 30)
        gui, GUI2:add, Text, ys
    gui, GUI2:add, checkbox, vcheckbox4_%A_Index%, %A_LoopReadLine%
}
gui, GUI2:add, Text, ys, Winget Apps:
loop, read, Winget_List.txt
{
    ;gui, GUI2:Tab, 2
    if	!Mod(A_Index, 30)
        gui, GUI2:add, Text, ys
    gui, GUI2:add, checkbox, vcheckbox5_%A_Index%, %A_LoopReadLine%
}
gui, GUI2:add, Text, ys, Extra Chocolatey Apps (1 per line):
gui, GUI2:Add, Edit, tab_extra r30  ; r30 means 30 rows tall.
gui, GUI2:Tab  ; i.e. subsequently-added controls will not belong to the tab control.
gui, GUI2:Add, Button, default xm, INSTALL  ; xm puts it at the bottom left corner.
gui, GUI2:Show
WinWaitActive, Windows10ToolkitRichard.ahk
WinSetTitle, Windows10ToolkitRichard.ahk, , Pick Applications to Install 2/2 - Keepass And Plugins Yubikey Apps and Winget Apps
;gui, GUI2:Show, x115 y87 h709 w1327, New GUI Window
return


ButtonINSTALL:
gui, GUI2:Submit  ; Save each control's contents to its associated variable.
MsgBox You entered:`n%MyCheckbox%`n%MyRadio%`n%MyEdit%
ExitApp


count=1
loop 500
{
    if checkbox3_%count% = 1
    {
        FileAppend, checkbox3_%count%%A_Space%, PICKED_Winget_List.txt
    }
}
count=1
loop 500
{
    if checkbox4_%count% = 1
    {
        FileAppend, checkbox4_%count%%A_Space%, PICKED_Keepass_And_Plugins_List.txt
    }
}
count=1
loop 500
{
    if checkbox5_%count% = 1
    {
        FileAppend, checkbox5_%count%%A_Space%, PICKED_Yubikey_Apps_List.txt
    }
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
runwait, powershell,exe choco upgrade %PICKED_Chocolatey_Apps_Nessescary_List% --ignore-checksums -y > Installing_Applications_Output.txt,,min
runwait, powershell,exe choco upgrade %PICKED_Chocolatey_Apps_Maybe_And_Other_List% --ignore-checksums -y > Installing_Applications_Output.txt,,min
runwait, powershell,exe winget install %PICKED_Winget_List% > Installing_Applications_Output.txt,,min
runwait, powershell,exe choco upgrade %PICKED_Keepass_And_Plugins_List% -y > Installing_Applications_Output.txt,,min
runwait, powershell,exe choco upgrade %PICKED_Yubikey_Apps_List% -y > Installing_Applications_Output.txt,,min
runwait, powershell,exe choco upgrade %PICKED_Extra_Chocolatey_Apps% --ignore-checksums -y > Installing_Applications_Output.txt,,min

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


msgbox, FINISHED
ExitApp



Esc::
ExitApp












