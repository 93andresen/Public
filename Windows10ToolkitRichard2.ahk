#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, Force

update := inirwTOOLKIT("r", "update")
debloat := inirwTOOLKIT("r", "debloat")
apps := inirwTOOLKIT("r", "apps")
netflix := inirwTOOLKIT("r", "netflix")
reboot := inirwTOOLKIT("r", "reboot")
;if apps = 1
{
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

    FileCreateDir, C:\temp_Windows10ToolkitRichard\Public-main\ApplicationLists
    SetWorkingDir, C:\temp_Windows10ToolkitRichard\Public-main\ApplicationLists

    gui, Add, Tab2,, Pick Applications to Install 2/2
    gui, add, Text,, Keepass And Plugins:
    Gui, Add, CheckBox, gGoHereWhenClicked3, Check All - Keepass and All Plugins
    countlines += 1
    loop, read, Keepass_And_Plugins_List.txt
    {
        gui, Tab, 1
        if	!Mod(A_Index, 30)
            gui, add, Text, ys, 
        gui, add, checkbox, vcheckbox3_%A_Index%, %A_LoopReadLine%
        appname3_%A_Index% = %A_LoopReadLine%
        countlines += 1
    }
    countlines1 = %countlines%
    countlines += 1
    check_button_3 := % countlines
    gui, add, Text, ys, Yubikey Apps:
    Gui, Add, CheckBox, gGoHereWhenClicked4, Check All - Yubikey Apps
    loop, read, Yubikey_Apps_List.txt
    {
        ;gui, Tab, 2
        if	!Mod(A_Index, 30)
            gui, add, Text, ys
        gui, add, checkbox, vcheckbox4_%A_Index%, %A_LoopReadLine%
        appname4_%A_Index% = %A_LoopReadLine%
        countlines += 1
    }
    countlines2 = %countlines%
    countlines += 1
    gui, add, Text, ys, Winget Apps:
    loop, read, Winget_List.txt
    {
        ;gui, Tab, 2
        if	!Mod(A_Index, 30)
            gui, add, Text, ys
        gui, add, checkbox, vcheckbox5_%A_Index%, %A_LoopReadLine%
        appname5_%A_Index% = %A_LoopReadLine%
        countlines += 1
    }
    countlines3 = countlines
    gui, add, Text, ys, Extra Chocolatey Apps (1 per line):
    gui, Add, Edit, vtab_extra r30  ; r30 means 30 rows tall.
    gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.
    gui, Add, Button, default xm, INSTALL  ; xm puts it at the bottom left corner.
    gui, Show
    WinWaitActive, Windows10ToolkitRichard2.ahk
    WinSetTitle, Windows10ToolkitRichard2.ahk, , Pick Applications to Install 2/2 - Keepass And Plugins Yubikey Apps and Winget Apps
    check_ran=0
    GoHereWhenClicked3:
    GuiControlGet, check,, Button1
    if (check = 1 and check_ran3 != 1)
    {
        HookGUICheckboxes(check, "1", countlines1)
        check_ran3=1
    }
    else if (check = 0 and check_ran3 != 0)
    {
        HookGUICheckboxes(check, "1", countlines1)
        check_ran3=0
    }
    return
    GoHereWhenClicked4:
    GuiControlGet, check,, Button%check_button_3%
    if (check = 1 and check_ran4 != 1)
    {
        HookGUICheckboxes(check, check_button_3, countlines2)
        check_ran4=1
    }
    else if (check = 0 and check_ran4 != 0)
    {
        HookGUICheckboxes(check, check_button_3, countlines2)
        check_ran4=0
    }
    return

    ButtonINSTALL:
    WinSet, AlwaysOnTop, on, Windows Toolkit Richard Console Output
    gui, Submit  ; Save each control's contents to its associated variable.

    FileCreateDir, C:\temp_Windows10ToolkitRichard\PICKEDApplicationsLists
    SetWorkingDir, C:\temp_Windows10ToolkitRichard\PICKEDApplicationsLists

    Filedelete, PICKED_Chocolatey_Apps_Nessescary_List.txt
    Filedelete, PICKED_Chocolatey_Apps_Maybe_And_Other_List.txt
    Filedelete, PICKED_Winget_List.txt
    Filedelete, PICKED_Keepass_And_Plugins_List.txt
    Filedelete, PICKED_Yubikey_Apps_List.txt
    Filedelete, PICKED_Extra_Chocolatey_Apps.txt

    count=1
    loop %countlines2%
    {
        if checkbox3_%count% = 1
        {
            keepass_app = % appname3_%count%
            FileAppend, %keepass_app%, PICKED_Keepass_And_Plugins_List.txt
            FileAppend, %A_Space%, PICKED_Keepass_And_Plugins_List.txt
        }
        count+=1
    }
    count=1
    loop %countlines2%
    {
        if checkbox4_%count% = 1
        {
            yubikey_apps = % appname4_%count%
            FileAppend, %yubikey_apps%, PICKED_Yubikey_Apps_List.txt
            FileAppend, %A_Space%, PICKED_Yubikey_Apps_List.txt
        }
        count+=1
    }
    count=1
    loop %countlines2%
    {
        if checkbox5_%count% = 1
        {
            winget_app = % appname5_%count%
            FileAppend, winget install %winget_app% --accept-package-agreements --accept-source-agreements;, PICKED_Winget_List.txt
        }
        count+=1
    }

    FileAppend, %tab_extra%, PICKED_Extra_Chocolatey_AppsTEMP.txt

    loop, read, PICKED_Extra_Chocolatey_AppsTEMP.txt
    {
        FileAppend, %A_LoopReadLine%%A_Space%, PICKED_Extra_Chocolatey_Apps.txt
    }
    filedelete, PICKED_Extra_Chocolatey_AppsTEMP.txt

    runwait, powershell.exe choco feature enable -n=allowGlobalConfirmation -y,,max
    runwait, powershell.exe choco feature enable -n allowEmptyChecksums -y,,max


    fileread, PICKED_Chocolatey_Apps_Nessescary_List, PICKED_Chocolatey_Apps_Nessescary_List.txt
    fileread, PICKED_Chocolatey_Apps_Maybe_And_Other_List, PICKED_Chocolatey_Apps_Maybe_And_Other_List.txt
    fileread, PICKED_Winget_List, PICKED_Winget_List.txt
    fileread, PICKED_Keepass_And_Plugins_List, PICKED_Keepass_And_Plugins_List.txt
    fileread, PICKED_Yubikey_Apps_List, PICKED_Yubikey_Apps_List.txt
    fileread, PICKED_Extra_Chocolatey_Apps, PICKED_Extra_Chocolatey_Apps.txt

    FileCreateDir, C:\temp_Windows10ToolkitRichard\Installing_Applications_Output
    SetWorkingDir, C:\temp_Windows10ToolkitRichard\Installing_Applications_Output


    if PICKED_Chocolatey_Apps_Nessescary_List contains Setdefaultbrowser Firefox
    {
        runwait, powershell.exe cup Setdefaultbrowser firefox --ignore-checksums -y | Tee-Object -file Installing_Applications_Output_Firefox.txt;SetDefaultBrowser.exe HKLM Firefox-308046B0AF4A39CB | Tee-Object -file Installing_Applications_Output_SetDefaultBrowser.txt,,max
    }
    runwait, powershell.exe choco upgrade %PICKED_Chocolatey_Apps_Nessescary_List% --ignore-checksums -y | Tee-Object -file Installing_Applications_Output_Chocolatey_Apps_Nessescary_List.txt;choco upgrade %PICKED_Chocolatey_Apps_Maybe_And_Other_List% --ignore-checksums -y | Tee-Object -file Installing_Applications_Output_Chocolatey_Apps_Maybe_And_Other_List.txt;choco upgrade %PICKED_Keepass_And_Plugins_List% -y | Tee-Object -file Installing_Applications_Output_Keepass_And_Plugins_List.txt;choco upgrade %PICKED_Yubikey_Apps_List% -y | Tee-Object -file Installing_Applications_Output_Yubikey_Apps_List.txt;choco upgrade %PICKED_Extra_Chocolatey_Apps% --ignore-checksums -y | Tee-Object -file Installing_Applications_Output_Extra_Chocolatey_Apps.txt;%PICKED_Winget_List% | Tee-Object -file Installing_Applications_Output_Winget_List.txt,,max



    AppendFileToLog("Installing_Applications_Output_Firefox.txt")
    AppendFileToLog("Installing_Applications_Output_SetDefaultBrowser.txt")
    AppendFileToLog("Installing_Applications_Output_Chocolatey_Apps_Nessescary_List.txt")
    AppendFileToLog("Installing_Applications_Output_Chocolatey_Apps_Maybe_And_Other_List.txt")
    AppendFileToLog("Installing_Applications_Output_Keepass_And_Plugins_List.txt")
    AppendFileToLog("Installing_Applications_Output_Yubikey_Apps_List.txt")
    AppendFileToLog("Installing_Applications_Output_Extra_Chocolatey_Apps.txt")
    AppendFileToLog("Installing_Applications_Output_Winget_List.txt")
}


if netflix = 1
    runwait, C:\temp_Windows10ToolkitRichard\Public-main\Netflix_2.0.ahk

clipboard=C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt
msgbox, FINISHED`n`nclipboard = the LOG file`nC:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt

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
