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

FileCreateDir, C:\temp_Windows10ToolkitRichard
SetWorkingDir, C:\temp_Windows10ToolkitRichard

/*
MAYBE_AND_OTHER:


simple-software-restriction-policy  ;   This makes it so i cant install stuff anymore, unless i unlock it og fix the settings...



LIB_BAD:
choco install ntfssecurity-psmodule performance-monitor pal tidystart.powershell
        
WINGET_OTHER:
WhatPulse 3.3           WhatPulse.WhatPulse
Advanced File Copier    9NBLGGH1185X
SteelSeries.GG
BinanceTech.Binance

LINKS:
https://freefilesync.org/download.php
https://downloads.yubico.com/products/Yubico-Login-for-Windows-2.0.3-win64.msi
https://maxlauncher.sourceforge.io/downloads.html
https://aka.ms/vs/17/release/vc_redist.x64.exe  ;Permalink for latest supported x64 version. The X64 redistributable package contains both ARM64 and X64 binaries. This package makes it easy to install required Visual C++ ARM64 binaries when the X64 redistributable is installed on an ARM64 device.

EMULATORS:
genymotion dosbox ppsspp mame pcsx2 fs-uae snes9x scummvm visualboyadvance nestopia project64 emulationstation fusion
WINDOWS_STORE:
musicxmatch

--allow-empty-checksums -y

FormatTime, TFileCreateDir, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Remember_for_Later.ahkd_HH-mm-ss
%clipboard% > FileCreateDir, C:\!\Logs\CMD\%TIME%CMD.txt

FormatTime, TIME, , yyyy-MM-dd_HH-mm-ss
;%clipboard% | Out-File -FilePath FileCreateDir, C:\!\Logs\Powershell\%TIME%Powershell.txt


Get-Content -Path C:\Users\pass9\OneDrive\Documents\PowerShell_transcript.DELL-G3-3579.Bw+4eX4a.20210408204538.txt

Start-Transcript -IncludeInvocationHeader -NoClobber -Append

Start-Transcript -Path FileCreateDir, C:\!\Logs\Powershell_Transcript.log
-Append
[-Force -NoClobber -IncludeInvocationHeader
[-WhatIf]
[<CommonParameters>]

C:\Users\pass9\OneDrive\Documents\WindowsPowerShell\

https://github.com/builtbybel/CloneApp/archive/refs/heads/master.zip


;loop 3    ;SCOOP    Make sure PowerShell 5 (or later, include PowerShell Core) and .NET Framework 4.5 (or later) are installed. Then run:
;{
;     run, powershell.exe cup powershell powershell-core dotnet4.6.1 powershell;Set-ExecutionPolicy RemoteSigned -scope CurrentUser;Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
;     sleep, 5000
;     send, a
;     send, {enter}
;     sleep, 3000
;     runwait, cmd.exe /c C:\Users\93and\scoop\shims\scoop install git
;     runwait, cmd.exe /c C:\Users\93and\scoop\shims\scoop update
;}

*/

runwait, powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;cup boxstarter;import-module Boxstarter.WinConfig;Install-WindowsUpdate;Disable-GameBarTips;Disable-BingSearch;Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar,,max
FileCreateDir, C:\temp_Windows10ToolkitRichard\ABC-Update_Logs
FormatTime, TimeLong,, yyyy-MM-dd_HH.mm.ss
FileAppend, ===================%TimeLong%_NEW_LOG_HERE=====================`n, C:\temp_Windows10ToolkitRichard\ABC-Update_Logs\%TimeLong%_ABC_Update_Log.txt
runwait, powershell.exe cup abc-update,,max
if FileExist("C:\temp_Windows10ToolkitRichard\progress.ini")
    IniRead, reboots, C:\temp_Windows10ToolkitRichard\progress.ini, Section, reboots
    if task_created != 1
        msgbox, MAKE TASK HERE Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
else
    IniWrite, 0, C:\temp_Windows10ToolkitRichard\progress.ini, Section, reboots

runwait, powershell.exe ABC-Update.exe /A:Install /R:10 /T:Driver`,Software /Log_Append:C:\temp_Windows10ToolkitRichard\ABC-Update_Logs\%TimeLong%_ABC_Update_Log.txt
IniWrite, 1, C:\temp_Windows10ToolkitRichard\progress.ini, Section, reboots

SetCapsLockState, Off
SetNumLockState, On

filedelete, Windows10ToolkitRichard2.ahk
UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/Windows10ToolkitRichard2.ahk, Windows10ToolkitRichard2.ahk

FileCreateDir, C:\temp_Windows10ToolkitRichard\ApplicationLists
SetWorkingDir, C:\temp_Windows10ToolkitRichard\ApplicationLists

filedelete, Chocolatey_Apps_Nessescary_List.txt
filedelete, Chocolatey_Apps_Maybe_And_Other_List.txt
filedelete, Winget_List.txt
filedelete, Keepass_And_Plugins_List.txt
filedelete, Yubikey_Apps_List.txt

filedelete, PICKED_Chocolatey_Apps_Nessescary_List.txt
filedelete, PICKED_Chocolatey_Apps_Maybe_And_Other_List.txt
filedelete, PICKED_Winget_List.txt
filedelete, PICKED_Keepass_And_Plugins_List.txt
filedelete, PICKED_Yubikey_Apps_List.txt
filedelete, Extra_Chocolatey_Apps.txt
filedelete, PICKED_Extra_Chocolatey_Apps.txt



UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/ApplicationLists/Chocolatey_Apps_Nessescary_List.txt, Chocolatey_Apps_Nessescary_List.txt
UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/ApplicationLists/Chocolatey_Apps_Maybe_And_Other_List.txt, Chocolatey_Apps_Maybe_And_Other_List.txt
UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/ApplicationLists/Winget_List.txt, Winget_List.txt
UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/ApplicationLists/Keepass_And_Plugins_List.txt, Keepass_And_Plugins_List.txt
UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/ApplicationLists/Yubikey_Apps_List.txt, Yubikey_Apps_List.txt



;Gui, Add, Tab2,, 1 Nessescary Apps|2 Maybe And Other|3 Maybe And Other|4 Keepass|5 Yubikey Apps|15 Winget|16 Extra Chocolatey Apps (Type)  ; Tab2 vs. Tab requires [v1.0.47.05+].
Gui, Add, Tab2,, Pick Applications to Install 1/2
gui, add, Text,, Nessescary Apps:
gui, add, checkbox, vALL1, Check All - Nessescary Applications
loop, read, Chocolatey_Apps_Nessescary_List.txt
{
    Gui, Tab, 1
    if	!Mod(A_Index, 30)
        gui, add, Text, ys, 
    gui, add, checkbox, vcheckbox1_%A_Index%, %A_LoopReadLine%
    appname1_%A_Index% = %A_LoopReadLine%
    countlines += 1
}
countlines1 = countlines
gui, add, Text, ys, Maybe And Other:
gui, add, checkbox, vALL2, Check All - Maybe And Other
loop, read, Chocolatey_Apps_Maybe_And_Other_List.txt
{
    ;Gui, Tab, 2
    if	!Mod(A_Index, 30)
        gui, add, Text, ys
    gui, add, checkbox, vcheckbox2_%A_Index%, %A_LoopReadLine%
    appname2_%A_Index% = %A_LoopReadLine%
    countlines += 1
}
countlines2 = countlines
Gui, Tab, 16
Gui, Add, Edit, tab_extra r30  ; r30 means 30 rows tall.
Gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.
Gui, Add, Button, default xm, ContinueToPage2/2  ; xm puts it at the bottom left corner.
Gui, Show

WinWaitActive, Windows10ToolkitRichard.ahk
WinSetTitle, Windows10ToolkitRichard.ahk, , Pick Applications to Install 1/2 - Nessescary Apps and Maybe and Other (2/2 is Keepass And Plugins Yubikey Apps and Winget Apps)


loop
{
    GuiControlGet, check,, Button1
    if (check = 1 and check_ran != 1)
    {
        HookGUICheckboxes(check, "1", countlines1)
        check_ran=1
    }
    else if (check = 0 and check_ran != 0)
    {
        HookGUICheckboxes(check, "1", countlines1)
        check_ran=0
    }
    countlines1 += 1
    GuiControlGet, check,, Button%countlines1%
    if (check = 1 and check_ran2 != 1)
    {
        HookGUICheckboxes(check, countlines1, countlines2)
    }
    else if (check = 0 and check_ran2 != 0)
    {
        HookGUICheckboxes(check, countlines1, countlines2)
        check_ran2=0
    }
    sleep, 100
}
return
GuiClose:
GuiEscape:
msgbox, Script Ended Because of GuiClose or GuiEscape... Exiting App....
ExitApp
ButtonContinueToPage2/2:
run, C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichard2.ahk
Gui, Submit  ; Save each control's contents to its associated variable.

FileCreateDir, C:\temp_Windows10ToolkitRichard\PICKEDApplicationsLists
SetWorkingDir, C:\temp_Windows10ToolkitRichard\PICKEDApplicationsLists

count=1
loop 500
{
    if checkbox1_%count% = 1
    {
        FileAppend, % appname1_%count%, PICKED_Chocolatey_Apps_Nessescary_List.txt
        FileAppend, %A_Space%, PICKED_Chocolatey_Apps_Nessescary_List.txt
    }
    count+=1
}
count=1
loop 500
{
    if checkbox2_%count% = 1
    {
        FileAppend, % appname2_%count%, PICKED_Chocolatey_Apps_Maybe_And_Other_List.txt
        FileAppend, %A_Space%, PICKED_Chocolatey_Apps_Maybe_And_Other_List.txt
    }
    count+=1
}
ExitApp



Esc::
ExitApp




HookGUICheckboxes(check, from, too)
{
    too += 1
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
        if count = %too%
            break
    }
}

