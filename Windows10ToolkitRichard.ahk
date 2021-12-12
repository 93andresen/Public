#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, force
SetWorkingDir, %A_ScriptDir%

NESSESCARY_APPS = rainmeter firefox SetDefaultBrowser edgedeflector autohotkey chocolatey-misc-helpers.extension fastcopy python 7zip winrar classic-shell notepadplusplus intel-dsa altsnap sizer sysinternals cloneapp google-drive-file-stream treesizefree vscode gh git github revo-uninstaller f.lux launchy authy-desktop Everything plex plexmediaserver fastcopy th-ch-youtube-music winamp equalizerapo steam crystaldiskinfo irfanview irfanviewplugins qalculate throttlestop duplicati microsoft-windows-terminal PowerShell mpc-be greenshot speedyfox geforce-experience msiafterburner directx epicgameslauncher glaryutilities-free peazip copyq discord eartrumpet yt-dlp choco-package-list-backup battle.net plasso ds4windows obs powertoys workspacer malwarebytes thunderbird qbittorrent webtorrent-desktop ffmpeg regcool.portable libreoffice-fresh openjdk vcredist140 signal telegram voicemeeter-banana vlc

WINGET_APPS = Appest.TickTick Shabinder.SpotiFlyer kite.kite

KEEPASS_AND_PLUGINS = keepass keepass-plugin-trayrecent keepass-plugin-qrcodegen keepass-plugin-rdp keepass-plugin-favicon keepass-rpc keepass-plugin-kpfloatingpanel keepass-plugin-rulebuilder keepass-plugin-keeautoexec keepass-plugin-itanmaster keepass-plugin-autotypecustomfieldpicker plugin-winkee keepass-plugin-kpscript keepass-plugin-certkeyprovider keepass-plugin-qualitycolumn keepass-plugin-fieldsadminconsole keepass-plugin-passwordcounter keepass-plugin-otpkeyprov keepass-plugin-keecloud keepass-plugin-keeotp keepass-plugin-cw3import keepass-plugin-truecryptmount keepass-plugin-autotypesplitter keepass-plugin-pickcharsdeferred keepass-plugin-keeagent keepass-plugin-gost keepass-plugin-keeanywhere keepass-plugin-1p2kp keepass-plugin-keeotp2 keepass-plugin-keechallenge keepass-plugin-keetheme keepass-plugin-twofishcipher keepass-plugin-haveibeenpwned keepass-plugin-mskeyimporter keepass-plugin-keepassotp keepass-plugin-readablepassphrasegen keepass-plugin-kp2fachecker keepass-plugin-webautotype keepass-plugin-winhello keepass-kpentrytemplates keepass-keeagent keepass-plugin-autotypesearch kptransfer

YUBIKEY_APPS = yubico-authenticator wincrypt-sshagent yubikey-piv-manager yubikey-neo-manager yubikey-personalization-tool yubikey-manager

/*
MAYBE_AND_OTHER:
rufus bitwarden-cli plex plexmediaserver plex-home-theater tidytabs workspacer sandboxie.install linkshellextension internet-download-manager pingplotter rammap regexcoach accesschk windows-kill fileoptimizer chocolatey-misc-helpers.extension vmmap npackd.install drivermax adwcleaner cmdutils recycle rbcmd recyclenow minibin deletefiles duplicatecleaner alldup dropit googleearthpro imagemanager jre8 laps lastactivityview lastfmscrobbler musicbee netscan powerautomatedesktop putty regexpixie freedownloadmanager Setup-Assistant shellbagsview ShellTools shman Shotcut Silverlight songr specialfoldersview spicetify-cli strokesplus.portable SwissFileKnife sysexp urbackup-client virtualbox VirtualCloneDrive vlc winamp spacesniffer terminal-icons.powershell tidystart.powershell windirstat wiztree winauth ultimate-settings-panel vortex windows-admin-center windowsrepair cmdutils ecm FileOptimizer git.install github-desktop shutup10 raidrive yubico-authenticator yubikey-manager yubikey-personalization-tool yubikey-piv-manager dolphin androidstudio neovim smartftp adb playnite opendns-updater desktop-notifications-for-android-chrome vhdattach reprofiler tccle taskschedulerview mailer siv partitionmasterfree partitionwizard perfmonitor2 fluent-terminal wsl2 ln junction-link-magic ntfslinksview defprof linkshellextension supercopier ultracopier gh act-cli git-lfs GoogleChrome.Canary webstorm gimp win-vind wsl-kalilinux ganttproject defraggler vagrant vagrant-manager

simple-software-restriction-policy  ;   This makes it so i cant install stuff anymore, unless i unlock it og fix the settings...



LIB_BAD:
choco install ntfssecurity-psmodule performance-monitor pal tidystart.powershell
        
WINGET_OTHER:
WhatPulse 3.3           WhatPulse.WhatPulse
Advanced File Copier    9NBLGGH1185X
SteelSeries.GG

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
FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Desktop
FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Documents
FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Downloads
FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Torrents
FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Videos
FileCreateDir, c:\temp_Windows10ToolkitRichard\C_FolderStructure\!\Pictures



runwait, powershell.exe choco feature enable -n=allowGlobalConfirmation -y, , max

;Tooltip, Directories Created, Installing Firefox and setting it as Default Browser

runwait, powershell.exe cup SetDefaultBrowser firefox, , max
run, powershell.exe SetDefaultBrowser.exe HKLM Firefox-308046B0AF4A39CB, , min ;this will set the x64 Firefox as my default

;Tooltip, Installing VERACRYPT (Innstallation is not silent because of fast boot) --ignore-checksums -y -  `nnSpotify Install tends to bug out and never complete, so i install it now using "run" instead of runwait and let it complete before Chris Titus Windows 10 Debloater Script is finished
run, powershell.exe cup spotify --ignore-checksums -y, , max
run, powershell.exe cup winja --ignore-checksums -y, , max
runwait, powershell.exe cup veracrypt --ignore-checksums -y, , max


;SILENT_INSTALL_AFTER_THIS__________________________________________________________________________
;Tooltip, ONLY KEEPASS (Because I don't ignore checksums on keepass)
runwait, powershell.exe cup keepass -y, , max

;Tooltip, c:\python39\python.exe -m pip install --upgrade pip
runwait, powershell.exe python -m pip install --upgrade pip, , max

;Tooltip, %NESSESCARY_APPS% --ignore-checksums -y
runwait, powershell.exe cup %NESSESCARY_APPS% --ignore-checksums -y, , max

;Tooltip, %KEEPASS_AND_PLUGINS% -y
runwait, powershell.exe cup %KEEPASS_AND_PLUGINS% -y, , max

;Tooltip, %YUBIKEY_APPS% -y
runwait, powershell.exe cup %YUBIKEY_APPS% --ignore-checksums -y, , max

runwait, powershell.exe choco install virtualbox --version 6.0.24 --ignore-checksums -y, , max
;runwait, powershell.exe choco pin add -n virtualbox, , max
runwait, cmd.exe /c bcdedit /set hypervisorlaunchtype off, , max


;Tooltip, %WINGET_APPS%
FileDelete, WINGET_APPS_LIST_TEMP.txt
loop, Parse, WINGET_APPS, %A_Space%
FileAppend, winget install %A_LoopField%;, WINGET_APPS_LIST_TEMP.txt
FileRead, winget_list, WINGET_APPS_LIST_TEMP.txt
FileDelete, WINGET_APPS_LIST_TEMP.txt
runwait, powershell.exe %winget_list%, , max


msgbox, FINISHED
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






                        
                        Help Commands:
                            ;choco -h
                            ;choco install -h
                            
                            7zip 19.0
                            7zip.install 19.0
                            8gadgetpack 33.0
                            adb 31.0.1
                            androidstudio 4.2.0.24
                            authpass 1.7.11
                            autohotkey 1.1.33.09
                            autohotkey.install 1.1.33.09
                            autohotkey.portable 1.1.33.09
                            avbin 10.0
                            birdtray 1.9.0
                            blat 3.2.17
                            brave 1.25.68
                            choco-package-list-backup 2021.05.10
                            chocolatey 0.10.15
                            chocolatey-core.extension 1.3.5.1
                            chocolatey-dotnetfx.extension 1.0.1
                            chocolatey-misc-helpers.extension 0.0.4
                            chocolatey-preinstaller-checks.extension 0.0.2.1
                            chocolatey-visualstudio.extension 1.9.0
                            chocolatey-vscode.extension 1.1.0
                            chocolatey-windowsupdate.extension 1.0.4
                            chocolateygui 0.18.1
                            chromelpass-chrome 2.8.1
                            classic-shell 4.3.1.20180405
                            cloneapp 2.15.606
                            cmdutils 1.5
                            copyq 4.1.0
                            crystaldiskinfo 8.12.1
                            crystaldiskinfo.portable 8.12.1
                            davmail 5.5.1.3299
                            directx 9.29.1974.20210222
                            discord 1.0.9001
                            discord.install 1.0.9001
                            dolphin 5.0.0.20201120
                            dotnet 5.0.6
                            dotnet-5.0-desktopruntime 5.0.6
                            dotnet-5.0-runtime 5.0.6
                            dotnet-runtime 5.0.6
                            DotNet4.0 4.0.30319.20141222
                            DotNet4.5 4.5.20120822
                            DotNet4.5.2 4.5.2.20140902
                            DotNet4.6.1 4.6.01055.20170308
                            dotnet4.7.2 4.7.2.20180712
                            dotnetcore-desktopruntime 3.1.15
                            dotnetcore3-desktop-runtime 3.1.16
                            dotnetfx 4.8.0.20190930
                            drivergenius 19.0.0.145
                            ds4windows 3.0.6
                            duplicati 2.0.5.1
                            eartrumpet 2.1.8.0
                            ecm 1.6.0.20190427
                            edecoder 1.20.3
                            epicgameslauncher 1.1.298.0
                            Everything 1.4.11005
                            exiftool 12.26
                                f.lux 4.119
                            f.lux.install 4.119
                            fastcopy 3.92
                            fastcopy.portable 3.92
                            ffdshow 1.3.4531.20140718
                            ffmpeg 4.4
                            FileOptimizer 14.70.2618
                            Firefox 88.0.1
                            folder_size 4.9.0.0
                            geforce-experience 3.22.0.32
                            git.install 2.31.1
                            github-desktop 2.8.2
                            glaryutilities-free 5.148.0.174
                            golang 1.16.4
                            google-backup-and-sync 3.54.3529.0458
                            GoogleChrome 91.0.4472.77
                            googleearthpro 7.3.3.21072020
                            gpmdp 4.7.1
                            greenshot 1.2.10.6
                            imageglass 8.2.6.6
                            imagemanager 7.6.2
                            instchoco 2.11
                            insync 1.5.5.37367
                            intel-mas 1.8
                            jdownloader 2.0
                            jre8 8.0.291
                            KB2533623 2.0.0
                            KB2919355 1.0.20160915
                            KB2919442 1.0.20160915
                            KB2999226 1.0.20181019
                            KB3033929 1.0.5
                            KB3035131 1.0.3
                            KB3063858 1.0.0
                            keepass 2.48.1
                            keepass-classic 1.39
                            keepass-classic-langfiles 1.31
                            keepass-keeagent 0.8.1.20180426
                            keepass-keepasshttp 1.8.4.220170629
                            keepass-kpentrytemplates 1.8.0.20190608
                            keepass-langfiles 2.41
                            keepass-plugin-1p2kp 0.2.1
                            keepass-plugin-autotypecustomfieldpicker 1.0.0.0
                            keepass-plugin-autotypesearch 1.0
                            keepass-plugin-autotypesplitter 1.2
                            keepass-plugin-certkeyprovider 1.0.0
                            keepass-plugin-cw3import 2.10
                            keepass-plugin-databasebackup 2.0.8.6
                            keepass-plugin-enhancedentryview 2.4.1
                            keepass-plugin-favicon 1.9.0
                            keepass-plugin-fieldsadminconsole 0.2.0
                            keepass-plugin-gost 2.1
                            keepass-plugin-haveibeenpwned 1.3.6
                            keepass-plugin-ioprotocolext 1.16
                            keepass-plugin-itanmaster 2.28.0.2
                            keepass-plugin-keeagent 0.12.1
                            keepass-plugin-keeanywhere 2.0.3
                            keepass-plugin-keeautoexec 2.4.0.20200422
                            keepass-plugin-keechallenge 1.5.20210212
                            keepass-plugin-keeotp2 1.5.4
                            keepass-plugin-keepassotp 0.27
                            keepass-plugin-keetheme 0.9.1
                            keepass-plugin-keetraytotp 0.108.0
                            keepass-plugin-kp2fachecker 1.1.1
                            keepass-plugin-kpfloatingpanel 7.5
                            keepass-plugin-kpscript 2.48.1
                            keepass-plugin-mskeyimporter 1.0
                            keepass-plugin-osk 1.2
                            keepass-plugin-otpkeyprov 2.6
                            keepass-plugin-passwordcounter 0.1
                            keepass-plugin-pickcharsdeferred 1.2
                            keepass-plugin-qrcodegen 2.0.12
                            keepass-plugin-qualitycolumn 1.2
                            keepass-plugin-qualityhighlighter 1.3.0.1
                            keepass-plugin-quickunlock 2.4
                            keepass-plugin-rdp 7.0
                            keepass-plugin-readablepassphrasegen 1.2.1.20210104
                            keepass-plugin-rulebuilder 2.0
                            keepass-plugin-spmimport 1.2
                            keepass-plugin-trayrecent 0.0.2
                            keepass-plugin-traytotp 2.0.0.5
                            keepass-plugin-truecryptmount 2.3
                            keepass-plugin-twofishcipher 1.3
                            keepass-plugin-webautotype 6.7.0
                            keepass-plugin-winhello 3.1.1
                            keepass-plugin-winkee 2.39.1
                            keepass-rpc 1.14.0.20210127
                            keepass.install 2.48.1
                            keepassx 2.0.3
                            keepassxc 2.6.4
                            keeweb 1.18.6
                            kptransfer 3.0.0
                            laps 6.2.0.20210510
                            lastactivityview 1.35
                            lastfmscrobbler 3.1.29
                            livecontactsview 1.26
                            lmms 1.2.2.20210505
                            mailer 1.6
                            malwarebytes 4.4.0.220
                            microsoft-teams 1.4.00.11161
                            msiafterburner 4.6.3
                            musicbee 3.4.7805
                            neovim 0.4.4.20210116
                            netscan 6.2.1.20161101
                            ninja 1.10.2
                            obs 0.659.20200402
                            obs-studio 26.1.1
                            obs-studio.install 26.1.1
                            onedrive 21.083.0425.0003
                            onedrivebully 1.3
                            palemoon 29.2.0
                            peazip 7.9.0
                            peazip.install 7.9.0
                            plasso 9.0.0.456
                            playnite 8.12
                            powerautomatedesktop 2.9.29.21133
                            PowerShell 5.1.14409.20180811
                            powertoys 0.37.2
                            putty 0.75
                            putty.portable 0.75
                            python3 3.9.5
                            qalculate 3.19.0
                            qbittorrent 4.3.5
                            raidrive 2020.11.58
                            rclone 1.55.1
                            rclone.portable 1.55.1
                            rclonebrowser 1.2
                            rclonetray 1.0.0
                            recycle 3.0.0
                            recyclenow 1.0.0
                            regexpixie 1.0.0
                            remove-empty-directories 2.2.0.1
                            revo-uninstaller 2.2.5.0
                            rtmpdump 2.4
                            rtmpdumphelper 1.22
                            rufus 3.14
                            Setup-Assistant 1.9.0.34979
                            shellbagsview 1.30
                            ShellTools 1.0.0.13
                            shman 1.10
                            Shotcut 21.05.18
                            shutup10 1.8.1420
                            Silverlight 5.1.50918.0
                            skypecontactsview 1.05
                            smartftp 9.0.2850.0
                            solarwinds-automation-manager 2.15.1.1
                            songr 2.1.1
                            spacesniffer 1.3.0.2
                                specialfoldersview 1.26
                            speedyfox 2.0.30
                            spicetify-cli 1.1.0
                            spotify 1.1.60.672
                                steam 3.0.1.20200226
                            steam-client 2.10.91.91
                            strokesplus.portable 2.8.6.401
                            SwissFileKnife 1.9.8.0
                                syncthing 1.16.1
                            sysexp 1.75
                            sysinternals 2021.5.26
                            terminal-icons.powershell 0.5.1
                            throttlestop 9.3
                            thunderbird 78.10.2
                            tidystart.powershell 1.8
                            totalcommander 9.51
                            treesizefree 4.4.2
                            ultimate-settings-panel 6.5
                            urbackup-client 2.4.10
                            vcredist140 14.29.30037
                            vcredist2010 10.0.40219.32503
                            vcredist2015 14.0.24215.20170201
                            vcredist2017 14.16.27033
                            veracrypt 1.24.20200814
                            vim 8.2.2914
                            virtualbox 6.1.22
                            virtualclonedrive 5.5.2.0
                            visualstudio-installer 2.0.1
                            visualstudio2019community 16.9.5.0
                            visualstudiocode 1.23.1.20180730
                            vlc 3.0.14
                            vscode 1.56.2
                            vscode-autohotkey 0.2.2
                            vscode-insiders 1.57.0.20210531
                            vscode-insiders.install 1.57.0.20210531
                            vscode-java 0.79.2
                            vscode-python 2021.5.842923320
                            vscode.install 1.56.2
                            windirstat 1.1.2.20161210
                            windows-admin-center 1.3.38660.0
                            windowsrepair 4.11.3
                            windowsrepair.install 4.11.3
                            winfsp 1.9.21096
                            winja.install 7.1.0.20201205
                            winrar 6.01
                            wiztree 3.41
                            youtube-dl 2021.05.16
                            youtube-dl-gui 0.4
                            youtube-dl-gui.install 0.4
                            yubico-authenticator 5.0.5
                            yubikey-manager 1.2.3
                            yubikey-personalization-tool 3.1.25
                            yubikey-piv-manager 1.4.2.103
                            256 packages installed.
                            
                            
                            
                            
*/







