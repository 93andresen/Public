#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, off
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2
DetectHiddenWindows, On
DetectHiddenText, On
SetBatchLines, 10ms
;#Include, AutohotkeyFucktions.ahk
;CompileRun(A_ScriptFullPath)
;log("Started Running")


inirw("w", NFS, "0")
Run, C:\!\Code\GitHub\93andresen_Scripts\Public\SetDnsFast_CountIni.ahk
ooshutup("C:\temp_Windows10ToolkitRichard\Public-main\ooshutup\ooshutup1_EssesinalTweaksProbablyBestForMostPeople.cfg")
run, NFS.ahk "powershell.exe import-module Boxstarter.WinConfig;Disable-GameBarTips;Disable-BingSearch;Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar"
run, NFS.ahk "powershell.exe iwr https://raw.githubusercontent.com/93andresen/Public/main/Windows10ChrisTitusForkRichardFAST.ps1 -UseBasicParsing|iex"
run, NFS.ahk "cmd.exe /c C:\temp_Windows10ToolkitRichard\Public-main\ViVeTool-v0.2.1\ViVeTool.exe addconfig 35908098 2"
run, NFS.ahk "cmd.exe /c C:\temp_Windows10ToolkitRichard\Public-main\ViVeTool-v0.2.1\ViVeTool.exe addconfig 36898195 2"
run, NFS.ahk "powershell.exe choco install explorer-winconfig --params "'/SHOWEXTENSIONS:yes /SHOWFULLPATH:yes /SHOWHIDDEN:yes /SHOWCHECKBOXES:no /SHOWENCRYPTED:yes /SHOWPREVIEWPANE:yes /SHOWDETAILSPANE:no /SHOWDRIVESNOMEDIA:yes /USESHARINGWIZARD:yes'" --force"
run, NFS.ahk "cmd.exe /c C:\temp_Windows10ToolkitRichard\Public-main\ViVeTool-v0.2.1\ViVeTool.exe addconfig 37204171 2"
run, NFS.ahk "C:\temp_Windows10ToolkitRichard\Public-main\Reg\RegConvert\Bluetooth_notification_area_icon_Enable.bat,,max
SetCapsLockState, Off
SetNumLockState, On


loop
{   
    Tooltip, Progress --> %NFS%/9
    inirw("r", NFS)
    if NFS>8
        break
}
run, NFS.ahk "powershell.exe shutdown /r /f /t 1

ooshutup(cfg)
{
    dir=%A_WorkingDir%
    SplitPath, cfg, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    FileCreateDir, %OutDir%
    SetWorkingDir, %OutDir%
    log("UrlDownloadToFile, https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe, OOSU10.exe", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    UrlDownloadToFile, https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe, OOSU10.exe
    log("cfg", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    run, OOSU10.exe %cfg% /quiet
    SetWorkingDir, %dir%
    NFS := inirw("r", NFS)
    NFS +=1
    inirw("w", "NFS", NFS)
}








ExitApp


~Esc::
if esc!=1
{
    esc=1
    log("Escape Pressed Once")
    msgbox, %A_ScriptName% is Paused`n`n%A_ScriptFullPath%`n`n`nPress Esc twice to Exit App
}
else if esc=1
    ExitApp

