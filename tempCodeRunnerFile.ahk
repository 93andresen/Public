#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, Force

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
https://freefilesync.org/download/FreeFileSync_11.15_Windows_Setup.exe
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
*/

SetCapsLockState, Off
SetNumLockState, On

FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\WinSettings.{ED7BA470-8E54-465E-825C-99712043E01C}
;FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Code\GitHub
FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Empty_Folder_Do_Not_Delete
;FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Desktop
;FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Documents
;FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Downloads
FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Torrents
;FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Videos
;FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Pictures


UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/ApplicationLists/Chocolatey_Apps_Nessescary_List.txt, Chocolatey_Apps_Nessescary_List.txt
UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/ApplicationLists/Chocolatey_Apps_Maybe_And_Other_List.txt, Chocolatey_Apps_Maybe_And_Other_List.txt
UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/ApplicationLists/Winget_List.txt, Winget_List.txt
UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/ApplicationLists/Keepass_And_Plugins_List.txt, Keepass_And_Plugins_List.txt
UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/ApplicationLists/Yubikey_Apps_List.txt, Yubikey_Apps_List.txt


;Gui, Add, Tab2,, 1 Nessescary Apps|2 Maybe And Other|3 Maybe And Other|4 Keepass|5 Yubikey Apps|15 Winget|16 Extra Chocolatey Apps (Type)  ; Tab2 vs. Tab requires [v1.0.47.05+].
Gui, Add, Tab2,, Pick Applications to Install 1/2
gui, add, Text,, Nessescary Apps:
loop, read, Chocolatey_Apps_Nessescary_List.txt
{
    Gui, Tab, 1
    if	!Mod(A_Index, 30)
        gui, add, Text, ys, 
    gui, add, checkbox, checkbox1_%A_Index%, %A_LoopReadLine%
}
gui, add, Text, ys, Maybe And Other:
loop, read, Chocolatey_Apps_Maybe_And_Other_List.txt
{
    ;Gui, Tab, 2
    if	!Mod(A_Index, 30)
        gui, add, Text, ys
    gui, add, checkbox, checkbox2_%A_Index%, %A_LoopReadLine%
}
Gui, Tab, 16
Gui, Add, Edit, tab_extra r30  ; r30 means 30 rows tall.
Gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.
Gui, Add, Button, default xm, OK  ; xm puts it at the bottom left corner.
Gui, Show
WinWaitActive, Windows10ToolkitRichard.ahk
WinSetTitle, Windows10ToolkitRichard.ahk, , Pick Applications to Install 1/2 - Nessescary Apps and Maybe and Other (2/2 is Keepass And Plugins Yubikey Apps and Winget Apps)
;Gui, Show, x115 y87 h709 w1327, New GUI Window
return
GuiClose:
GuiEscape:
ButtonOK:
Gui, Submit  ; Save each control's contents to its associated variable.

gui, GUI2:Add, Tab2,, Pick Applications to Install 2/2
gui, GUI2:add, Text,, Keepass And Plugins:
loop, read, Keepass_And_Plugins_List.txt
{
    gui, GUI2:Tab, 1
    if	!Mod(A_Index, 30)
        gui, GUI2:add, Text, ys, 
    gui, GUI2:add, checkbox, checkbox3_%A_Index%, %A_LoopReadLine%
}
gui, GUI2:add, Text, ys, Yubikey Apps:
loop, read, Yubikey_Apps_List.txt
{
    ;gui, GUI2:Tab, 2
    if	!Mod(A_Index, 30)
        gui, GUI2:add, Text, ys
    gui, GUI2:add, checkbox, checkbox4_%A_Index%, %A_LoopReadLine%
}
gui, GUI2:add, Text, ys, Winget Apps:
loop, read, Winget_List.txt
{
    ;gui, GUI2:Tab, 2
    if	!Mod(A_Index, 30)
        gui, GUI2:add, Text, ys
    gui, GUI2:add, checkbox, checkbox5_%A_Index%, %A_LoopReadLine%
}
gui, GUI2:Add, Edit, tab_extra r30  ; r30 means 30 rows tall.
gui, GUI2:Tab  ; i.e. subsequently-added controls will not belong to the tab control.
gui, GUI2:Add, Button, default xm, OK  ; xm puts it at the bottom left corner.
gui, GUI2:Show
WinWaitActive, Windows10ToolkitRichard.ahk
WinSetTitle, Windows10ToolkitRichard.ahk, , Pick Applications to Install 2/2 - Keepass And Plugins Yubikey Apps and Winget Apps
;gui, GUI2:Show, x115 y87 h709 w1327, New GUI Window
return


ExitApp
gui, GUI2:Submit  ; Save each control's contents to its associated variable.
MsgBox You entered:`n%MyCheckbox%`n%MyRadio%`n%MyEdit%
ExitApp




runwait, powershell.exe choco feature enable -n=allowGlobalConfirmation -y,,min

;Tooltip, Directories Created, Installing Firefox and setting it as Default Browser

runwait, powershell.exe cup SetDefaultBrowser firefox,,min
run, powershell.exe SetDefaultBrowser.exe HKLM Firefox-308046B0AF4A39CB, , min ;this will set the x64 Firefox as my default

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






/*



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







