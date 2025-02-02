#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2
DetectHiddenWindows, On
DetectHiddenText, On
SetBatchLines, 10ms
#Include, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutohotkeyFucktions.ahk
;CompileRun(A_ScriptFullPath)
log("Started Running")

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
bypass=Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
count=91
command=powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
count := runwait_tooltip(command, count)
command=powershell.exe choco feature enable -n=allowGlobalConfirmation
count := runwait_tooltip(command, count)
command=powershell.exe choco feature enable -n=allowEmptyChecksums
count := runwait_tooltip(command, count)
command=powershell.exe choco upgrade chocolatey --force -y
count := runwait_tooltip(command, count)
command=powershell.exe choco feature enable -n=allowGlobalConfirmation
count := runwait_tooltip(command, count)
command=powershell.exe choco feature enable -n=allowEmptyChecksums
count := runwait_tooltip(command, count)
command=powershell.exe choco unpackself --force -y
count := runwait_tooltip(command, count)
command=powershell.exe choco feature enable -n=allowGlobalConfirmation
count := runwait_tooltip(command, count)
command=powershell.exe choco feature enable -n=allowEmptyChecksums
count := runwait_tooltip(command, count)

UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/chocolatey.config, chocolatey.config
if FileExist("chocolatey.config")
    FileCopy, chocolatey.config, C:\ProgramData\chocolatey\config\chocolatey.config, 1

command=powershell.exe choco config set cacheLocation C:\zzz_Chocolatey_Cache -y
count := runwait_tooltip(command, count)

FileCreateDir, C:\zzz_Pip_Cache
command=powershell.exe pip config set global.cache-dir "C:\\zzz_Pip_Cache"
count := runwait_tooltip(command, count)

command=powershell.exe choco uninstall chocolateygui --force --params="'/HidePackageDownloadCount=$false /PreventAutomatedOutdatedPackagesCheck=$false /PreventPreload=$false /ShowAggregatedSourceView=$false /UseDelayedSearch=$false /ExcludeInstalledPackages=$true /DefaultToTileViewForRemoteSource=$true /DefaultToTileViewForLocalSource=$true /ShowAdditionalPackageInformation=$true /ShowConsoleOutput=$false /UseKeyboardBindings=$true /UseLanguage=en /OutdatedPackagesCacheDurationInMinutes=10080'" -y
count := runwait_tooltip(command, count)
command=powershell.exe choco upgrade chocolateygui --force --params="'/HidePackageDownloadCount=$false /PreventAutomatedOutdatedPackagesCheck=$false /PreventPreload=$false /ShowAggregatedSourceView=$false /UseDelayedSearch=$false /ExcludeInstalledPackages=$true /DefaultToTileViewForRemoteSource=$true /DefaultToTileViewForLocalSource=$true /ShowAdditionalPackageInformation=$true /ShowConsoleOutput=$false /UseKeyboardBindings=$true /UseLanguage=en /OutdatedPackagesCacheDurationInMinutes=10080'" -y
count := runwait_tooltip(command, count)
command=powershell.exe choco upgrade chocolateygui --force --params="'/HidePackageDownloadCount=$false /PreventAutomatedOutdatedPackagesCheck=$false /PreventPreload=$false /ShowAggregatedSourceView=$false /UseDelayedSearch=$false /ExcludeInstalledPackages=$true /DefaultToTileViewForRemoteSource=$true /DefaultToTileViewForLocalSource=$true /ShowAdditionalPackageInformation=$true /ShowConsoleOutput=$false /UseKeyboardBindings=$true /UseLanguage=en /OutdatedPackagesCacheDurationInMinutes=10080 /global'" -y
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature enable --name="'ExcludeInstalledPackages'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature enable --name="'DefaultToTileViewForRemoteSource'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature enable --name="'DefaultToTileViewForLocalSource'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature disable --name="'HidePackageDownloadCount'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature disable --name="'PreventAutomatedOutdatedPackagesCheck'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature disable --name="'PreventPreload'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature enable --name="'ShowAdditionalPackageInformation'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature disable --name="'ShowAggregatedSourceView'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature enable --name="'ShowConsoleOutput'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature disable --name="'UseDelayedSearch'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature enable --name="'UseKeyboardBindings'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli config set --name="'UseLanguage'" --value="'en'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature enable --name="'ExcludeInstalledPackages'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature enable --name="'DefaultToTileViewForRemoteSource'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature enable --name="'DefaultToTileViewForLocalSource'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature disable --name="'HidePackageDownloadCount'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature disable --name="'PreventAutomatedOutdatedPackagesCheck'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature disable --name="'PreventPreload'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature enable --name="'ShowAdditionalPackageInformation'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature disable --name="'ShowAggregatedSourceView'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature enable --name="'ShowConsoleOutput'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature disable --name="'UseDelayedSearch'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli feature enable --name="'UseKeyboardBindings'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli config set --name="'UseLanguage'" --value="'en'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature enable --name="'ExcludeInstalledPackages'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature enable --name="'DefaultToTileViewForRemoteSource'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature enable --name="'DefaultToTileViewForLocalSource'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature disable --name="'HidePackageDownloadCount'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature disable --name="'PreventAutomatedOutdatedPackagesCheck'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature disable --name="'PreventPreload'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature enable --name="'ShowAdditionalPackageInformation'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature disable --name="'ShowAggregatedSourceView'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature enable --name="'ShowConsoleOutput'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature disable --name="'UseDelayedSearch'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature enable --name="'UseKeyboardBindings'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe config set --name="'UseLanguage'" --value="'en'" --global
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature enable --name="'ExcludeInstalledPackages'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature enable --name="'DefaultToTileViewForRemoteSource'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature enable --name="'DefaultToTileViewForLocalSource'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature disable --name="'HidePackageDownloadCount'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature disable --name="'PreventAutomatedOutdatedPackagesCheck'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature disable --name="'PreventPreload'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature enable --name="'ShowAdditionalPackageInformation'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature disable --name="'ShowAggregatedSourceView'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature enable --name="'ShowConsoleOutput'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature disable --name="'UseDelayedSearch'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe feature enable --name="'UseKeyboardBindings'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'"
count := runwait_tooltip(command, count)
command=powershell.exe chocolateyguicli.exe config set --name="'UseLanguage'" --value="'en'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ExcludeInstalledPackages'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'DefaultToTileViewForRemoteSource'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'DefaultToTileViewForLocalSource'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'HidePackageDownloadCount'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'PreventAutomatedOutdatedPackagesCheck'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'PreventPreload'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ShowAdditionalPackageInformation'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'ShowAggregatedSourceView'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ShowConsoleOutput'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'UseDelayedSearch'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'UseKeyboardBindings'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" config set --name="'UseLanguage'" --value="'en'" --global
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ExcludeInstalledPackages'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'DefaultToTileViewForRemoteSource'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'DefaultToTileViewForLocalSource'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'HidePackageDownloadCount'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'PreventAutomatedOutdatedPackagesCheck'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'PreventPreload'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ShowAdditionalPackageInformation'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'ShowAggregatedSourceView'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ShowConsoleOutput'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'UseDelayedSearch'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'UseKeyboardBindings'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'"
count := runwait_tooltip(command, count)
command=powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" config set --name="'UseLanguage'" --value="'en'"
count := runwait_tooltip(command, count)
Tooltip, FINISHED
sleep, 3000
ExitAppLog()

runwait_tooltip(command, count)
{
    Tooltip, running %command%`n%count% commands left`nlast 70 commands are fast
    runwait, %command%,,min
    count-=1
    return count
}

~^Esc::
if esc!=1
{
    esc=1
    log("Escape Pressed Once")
    msgbox, %A_ScriptName% is Paused`n`n%A_ScriptFullPath%`n`n`nPress Esc twice to Exit App
}
else if esc=1
    ExitAppLog("esc", "Exited via Escape Button")




