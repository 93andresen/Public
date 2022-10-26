Set-ExecutionPolicy RemoteSigned -scope CurrentUser

Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
# Short Version
# iwr -useb get.scoop.sh | iex

# iwr -useb 'https://raw.githubusercontent.com/shovel-org/Install/main/install.ps1' | iex
# scoop config SCOOP_REPO 'https://github.com/ScoopInstaller/Scoop master'
# scoop config SCOOP_REPO 'https://github.com/Ash258/Scoop-Core'


scoop config virustotal_api_key 74d630ba1d36da2977493b5921ba04cce95e359063e827473796abc549c8c949 # TODO Remove SENSITIVE INFORMATION API KEY
scoop install modern7z
scoop install git
git config --global credential.helper manager-core
scoop install sudo
sudo Add-MpPreference -ExclusionPath 'C:\Users\93and\scoop'
scoop bucket add main https://github.com/ScoopInstaller/Main
scoop bucket add extras https://github.com/ScoopInstaller/Extras
scoop bucket add versions https://github.com/ScoopInstaller/Versions
scoop bucket add nirsoft https://github.com/kodybrown/scoop-nirsoft
scoop bucket add nonportable https://github.com/ScoopInstaller/Nonportable
scoop bucket add java https://github.com/ScoopInstaller/Java
scoop bucket add galaxy-integrations https://github.com/borger/scoop-galaxy-integrations.git
scoop bucket add ACooper81_scoop-apps https://github.com/ACooper81/scoop-apps
scoop bucket add nerd-fonts https://github.com/matthewjberger/scoop-nerd-fonts
scoop bucket add games https://github.com/Calinou/scoop-games
scoop bucket add php https://github.com/ScoopInstaller/PHP
scoop bucket add skellygore_scoop-bucket https://github.com/skellygore/scoop-bucket
scoop bucket add wangzq https://github.com/wangzq/scoop-bucket
scoop bucket add dorado https://github.com/chawyehsu/dorado



scoop install lessmsi
scoop config MSIEXTRACT_USE_LESSMSI true
scoop install innoextract
scoop config INNOSETUP_USE_INNOEXTRACT true
scoop install dark
scoop install aria2
scoop config aria2-enabled true
scoop config aria2-retry-wait 2
scoop config aria2-split 16
scoop config aria2-max-connection-per-server 16
scoop config aria2-min-split-size 4M
scoop config aria2-warning-enabled false
scoop install alias-additions
scoop install scoop-completion
C:\Users\93and\scoop\apps\scoop-completion\current\add-profile-content.ps1

scoop alias add reinstall 'scoop uninstall $args[0]; scoop install $args[0]' 'Uninstall and then install app'

# git config --global --add safe.directory C:/Users/93and/scoop/apps/scoop/current TODO: make dynamic uusername


# Pre- and Post Install Stuff:
scoop install everything
    reg import "C:\Users\93and\scoop\apps\everything\current\install-context.reg"
Autohotkey
    FileCopy, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\WindowSpy.ahk, C:\Program Files\AutoHotkey\WindowSpy.ahk, 1
    FileCopy, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\WindowSpyFollowMouse.ahk, C:\Program Files\AutoHotkey\WindowSpyFollowMouse.ahk, 1
# Scoop powertoys never worked no matter what i did had to use chocolatey
#Scoop install Powertoys
#    winget install Microsoft.DotNet.DesktopRuntime.6    #NESSESCARY



# MAYBE scoop install UniExtract2
# MAYBE scoop install curl
scoop install utagoe
Utagoe is a program that can invert a song with its instrumental version to extract the vocals.
# https://github.com/shilangyu/scoop-search
# scoops - scoop seaarch multiple sources
scoop search multiple sources
scoop install aria2 curl grep sed less touch


Also dont lose any of these:
autojump link-shell-extension mediatab neofetch nirlauncher scoop-find scoop-hook scoop-search-multisource sysinternals utagoe LinkShellExtension-Install pshazz qrencode scoop-backup winobjex64 osulazer bongocat-osu audiosurf2 7tt 7zip 7zip-zstd adb alldup altsnap aria2 audacity AutoIt autojump bfg bombermaaan busybox cheat cheat-engine choeazycopy Clink clink-completions concfg Coreutils cpu-z crystaldiskinfo crystaldiskmark dark ditto docker dockercompletion eartrumpet electerm Fastcopy ffmpeg-yt-dlp fileoptimizer firefox flux glary-utilities glogg gog-galaxy-plugin-downloader gpg4win greenshot gtools handbrake handbrake-cli innoextract innounp irfanview keepassxc kitty lazydocker less lessmsi link-shell-extension LinkShellExtension-Install losslesscut lsd macrocreator Mailsend-Go mediatab modern7z msedgeredirect neofetch nirlauncher nodejs notepadplusplus oh-my-posh openjdk patheditor pngquant pshazz pskubectlcompletion psutils python qr qrencode quicklook RapidEE rclone rclone-browser resource-hacker restic scoop-backup scoop-completion scoop-find scoop-hook scoop-search scoop-search-multisource scoop-shim scoop-validator sejda-pdf shotcut signal spicetify-cli spotify sysinternals tor-browser tortoisesvn UniExtract2 utagoe uutils-coreutils vcredist2015 vlc watchexec windowsdesktop-runtime-lts winobjex64 wireshark youtube-music yt-dlp zstd

Also These are not silent:
gpg4win 7tt LinkShellExtension-Install 

Since Scoop uses pwsh.exe internally, to update PowerShell Core itself,
run `scoop update pwsh` from Windows PowerShell, i.e. powershell.exe.
Add PowerShell Core as a explorer context menu by running: 'C:\Users\93and\scoop\apps\pwsh\current\install-explorer-context.reg'
For file context menu, run 'C:\Users\93and\scoop\apps\pwsh\current\install-file-context.reg'









polaris - Polaris is a music streaming application, designed to let you enjoy your music collection from any computer or mobile device. Polaris works by streaming your music directly from your own computer, without uploading it to a third-party. It is free and open-source software, without any kind of premium version. The only requirement is that your computer stays on while it streams music! 
gauge - Test automation tool
gof - Fuzzy search tool written in Go
pueue - Command-line task management tool for sequential and parallel execution of long-running tasks.
psake                                    A build automation tool, now with less XML.
qrcp                                     Transfers files over wifi from computer to mobile device by scanning a QR code without leaving the terminal.
psutils                                  A collection of command line utilities written in PowerShell proudly ignoring PowerShell Verb-Noun naming conventions.
powersession-rs                          Terminal session recorder (Asciinema format) written in Rust.
powersession                             Terminal session recorder (Asciinema format) written in C#
pelook                                   Information tool for Windows EXE, DLL, driver and OBJ files (PE/COFF images)
outwit                                   Command-line tools for accessing the Windows clipboard, registry, databases, document properties, and links.
opus-tools                               Command-line utilities to encode, inspect, and decode .opus files.
magic-wormhole-rs                        Securely transfer data between computers. Rust implementation of Magic Wormhole, with new features and enhancements
magic-wormhole                           Securely transfer data between computers.
lsd                                      The next gen ls command
lsd                                      The next gen ls command
ln                                       An approximation of the Unix ln command.
lf                                       A terminal file manager written in Go
hashcat                                  Advanced password recovery tool
gof                                      Fuzzy search tool written in Go
fossil                                   A simple, high-reliability, distributed software configuration management system.
forcebindip                              Bind any Windows application to a specific interface or IP address.
findutils                                Basic file searching utilities.
fciv                                     A command-prompt utility that computes and verifies cryptographic hash values of files.
fd                                       A simple, fast and user-friendly alternative to 'find'.
everything-cli                           Command line interface to Everyting.
danser-go                                Dancing visualizer of osu! standard maps and custom osu! client written in Go. Also a generator for osu! videos.
cloak                                    a Command Line OTP Authenticator applicationbusybox-lean                             BusyBox is a single binary that contains many common Unix tools
busybox                                  BusyBox is a single binary that contains many common Unix tools
hygen                                    The scalable code generator that saves you time
switcheroo - The humble incremental-search task switcher for Windows
ag - A tool for searching code.
recmd - Command-line Registry tool for searching, multi-hive support, plugins, and more.
packer - Automates the creation of any type of virtual machine image.
ahoy - Automate and organize your workflows, no matter what technology you use
tinytask - Windows automation app for recording and repeating actions.
scoop install gink


