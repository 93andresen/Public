#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, force
SetWorkingDir, %A_ScriptDir%

FIRST_NESSESCARY_APPS = firefox autohotkey fastcopy python 7zip winrar classic-shell sysinternals cloneapp

NESSESCARY_APPS = autohotkey fastcopy python 7zip winrar classic-shell sysinternals cloneapp google-drive-file-stream f.lux launchy Everything fastcopy keepass th-ch-youtube-music steam crystaldiskinfo irfanview irfanviewplugins treesizefree SetDefaultBrowser vscode revo-uninstaller qalculate throttlestop duplicati firefox microsoft-windows-terminal PowerShell mpc-be greenshot speedyfox geforce-experience msiafterburner winja.install epicgameslauncher glaryutilities-free peazip copyq discord eartrumpet youtube-dl choco-package-list-backup battle.net plasso ds4windows obs powertoys workspacer malwarebytes thunderbird qbittorrent webtorrent-desktop ffmpeg regcool.portable libreoffice-fresh openjdk signal telegram

WINGET_APPS = Appest.TickTick Shabinder.SpotiFlyer kite.kite

KEEPASS_AND_PLUGINS = keepass keepass-plugin-trayrecent keepass-plugin-qrcodegen keepass-plugin-rdp keepass-plugin-favicon keepass-rpc keepass-plugin-kpfloatingpanel keepass-plugin-rulebuilder keepass-plugin-keeautoexec keepass-plugin-itanmaster keepass-plugin-autotypecustomfieldpicker plugin-winkee keepass-plugin-kpscript keepass-plugin-certkeyprovider keepass-plugin-qualitycolumn keepass-plugin-fieldsadminconsole keepass-plugin-passwordcounter keepass-plugin-otpkeyprov keepass-plugin-keecloud keepass-plugin-keeotp keepass-plugin-cw3import keepass-plugin-truecryptmount keepass-plugin-autotypesplitter keepass-plugin-pickcharsdeferred keepass-plugin-keeagent keepass-plugin-gost keepass-plugin-keeanywhere keepass-plugin-1p2kp keepass-plugin-keeotp2 keepass-plugin-keechallenge keepass-plugin-keetheme keepass-plugin-twofishcipher keepass-plugin-haveibeenpwned keepass-plugin-mskeyimporter keepass-plugin-keepassotp keepass-plugin-readablepassphrasegen keepass-plugin-kp2fachecker keepass-plugin-webautotype keepass-plugin-winhello keepass-kpentrytemplates keepass-keeagent keepass-plugin-autotypesearch kptransfer

YUBIKEY_APPS = yubico-authenticator wincrypt-sshagent yubikey-piv-manager yubikey-neo-manager yubikey-personalization-tool yubikey-manager

FileCreateDir, %A_Desktop%\WinSettings.{ED7BA470-8E54-465E-825C-99712043E01C}
FileCreateDir, C:\zzz_Spotify_Offline_Storage
FileCreateDir, C:\!\GitHubClonedRepositories
FileCreateDir, C:\!\Empty_Folder_Do_Not_Delete
FileCreateDir, C:\!\Desktop
FileCreateDir, C:\!\Documents
FileCreateDir, C:\!\Downloads
FileCreateDir, C:\!\Torrents
FileCreateDir, C:\!\Videos
FileCreateDir, C:\!\Pictures

Tooltip, Directories Created, running Windows10Debloater_Fork_Richard.ps1
runwait, powershell.exe iwr https://raw.githubusercontent.com/93andresen/Richard_Public/main/Windows10Debloater_Fork_Richard.ps1|iex

Tooltip, Installing Chocolatey
runwait, powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')), , max
Tooltip, choco feature enable -n=allowGlobalConfirmation -y
runwait, powershell.exe choco feature enable -n=allowGlobalConfirmation -y, , max

Tooltip, cup firefox SetDefaultBrowser, , max
runwait, powershell.exe cup firefox SetDefaultBrowser, , max
runwait, powershell.exe SetDefaultBrowser.exe HKLM Firefox-308046B0AF4A39CB, , max ;this will set the x64 Firefox as my default

Tooltip, Installing VERACRYPT (Innstallation is not silent because of fast boot) --ignore-checksums -y -  `nnSpotify Install tends to bug out and never complete, so i install it now using "run" instead of runwait and let it complete before Chris Titus Windows 10 Debloater Script is finished
run, powershell.exe cup spotify --ignore-checksums -y, , max
runwait, powershell.exe cup veracrypt --ignore-checksums -y, , max

temp=%A_WorkingDir%
FileCreateDir, C:\TEMP\oosu10_apps.ahk_temp_folder
SetWorkingDir, C:\TEMP\oosu10_apps.ahk_temp_folder
Tooltip, Maybe need "App Installer" (Used to at least)`n`nSILENT_INSTALL_AFTER_THIS
runwait, powershell.exe iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4')), , max   ;Chris Titus
SetWorkingDir, %temp%
FileMove, C:\TEMP\oosu10_apps.ahk_temp_folder\ooshutup10.cfg, C:\!\Format\App_Settings\Chris_Titus_Debloater_ooshutup10.cfg
FileRemoveDir, C:\TEMP\oosu10_apps.ahk_temp_folder, 1


;SILENT_INSTALL_AFTER_THIS__________________________________________________________________________
Tooltip, cup chocolatey-misc-helpers.extension --ignore-checksums -y
runwait, powershell.exe cup chocolatey-misc-helpers.extension --ignore-checksums -y, , max

Tooltip, %FIRST_NESSESCARY_APPS%  --ignore-checksums -y`n`n
runwait, powershell.exe cup %FIRST_NESSESCARY_APPS% --ignore-checksums -y, , max

Tooltip, ONLY KEEPASS (Because I don't ignore checksums on keepass)
runwait, powershell.exe cup keepass -y, , max

Tooltip, c:\python39\python.exe -m pip install --upgrade pip
runwait, powershell.exe c:\python39\python.exe -m pip install --upgrade pip, , max

Tooltip, c:\python310\python.exe -m pip install --upgrade pip
runwait, powershell.exe c:\python310\python.exe -m pip install --upgrade pip, , max

Tooltip, %NESSESCARY_APPS% --ignore-checksums -y
runwait, powershell.exe cup %NESSESCARY_APPS% --ignore-checksums -y, , max

Tooltip, %KEEPASS_AND_PLUGINS% -y
runwait, powershell.exe cup %KEEPASS_AND_PLUGINS% -y, , max

Tooltip, %YUBIKEY_APPS% -y
runwait, powershell.exe cup %YUBIKEY_APPS% --ignore-checksums -y, , max

Tooltip, %WINGET_APPS%
FileDelete, WINGET_APPS_LIST_TEMP.txt
loop, Parse, WINGET_APPS, %A_Space%
FileAppend, winget install %A_LoopField%;, WINGET_APPS_LIST_TEMP.txt
FileRead, winget_list, WINGET_APPS_LIST_TEMP.txt
FileDelete, WINGET_APPS_LIST_TEMP.txt
runwait, powershell.exe %winget_list%, , max












msgbox, FINISHED
ExitApp

Esc::
ExitApp



;SCRIPT_END___________________________________________________________________________