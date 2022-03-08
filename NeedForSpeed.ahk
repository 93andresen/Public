#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2
DetectHiddenWindows, On
DetectHiddenText, On
SetBatchLines, 10ms
#Include, AutohotkeyFucktions.ahk
;CompileRun(A_ScriptFullPath)
log("Started Running")




runwait, powershell.exe import-module Boxstarter.WinConfig;Disable-GameBarTips;Disable-BingSearch;Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
runwait, powershell.exe iwr https://raw.githubusercontent.com/93andresen/Public/main/Windows10ChrisTitusForkRichardFAST.ps1 -UseBasicParsing|iex
runwait, cmd.exe /c C:\temp_Windows10ToolkitRichard\Public-main\ViVeTool-v0.2.1\ViVeTool.exe addconfig 35908098 2
runwait, cmd.exe /c C:\temp_Windows10ToolkitRichard\Public-main\ViVeTool-v0.2.1\ViVeTool.exe addconfig 36898195 2
runwait, powershell.exe choco install explorer-winconfig --params "'/SHOWEXTENSIONS:yes /SHOWFULLPATH:yes /SHOWHIDDEN:yes /SHOWCHECKBOXES:no /SHOWENCRYPTED:yes /SHOWPREVIEWPANE:yes /SHOWDETAILSPANE:no /SHOWDRIVESNOMEDIA:yes /USESHARINGWIZARD:yes'" --force
runwait, cmd.exe /c C:\temp_Windows10ToolkitRichard\Public-main\ViVeTool-v0.2.1\ViVeTool.exe addconfig 37204171 2

ooshutup("C:\temp_Windows10ToolkitRichard\Public-main\ooshutup\ooshutup1_EssesinalTweaksProbablyBestForMostPeople.cfg")

runwait, C:\temp_Windows10ToolkitRichard\Public-main\Reg\RegConvert\Bluetooth_notification_area_icon_Enable.bat,,max

if dns4a6a = dns4a6a
    SetDNS("automatic", "ipv4", "ipv6")
if dns4c6c = dns4c6c
    SetDNS("cloudflare", "ipv4", "ipv6")
if dns4a6c = dns4a6c
    SetDNS("automatic", "ipv4", "0")
    SetDNS("cloudflare", "0", "ipv6")
if dns4c6a = dns4c6a
    SetDNS("cloudflare", "ipv4", "0")
    SetDNS("automatic", "0", "ipv6")

SetCapsLockState, Off
SetNumLockState, On

run, powershell.exe shutdown /r /f /t 1



ooshutup(cfg)
{
    dir=%A_WorkingDir%
    SplitPath, cfg, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    FileCreateDir, %OutDir%
    SetWorkingDir, %OutDir%
    log("UrlDownloadToFile, https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe, OOSU10.exe", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    UrlDownloadToFile, https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe, OOSU10.exe
    log("cfg", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    runwait, OOSU10.exe %cfg% /quiet
    SetWorkingDir, %dir%
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

