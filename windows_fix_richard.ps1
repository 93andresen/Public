choco feature enable -n=allowGlobalConfirmation -y
cup SetDefaultBrowser firefox
SetDefaultBrowser.exe HKLM Firefox-308046B0AF4A39CB
cup spotify --ignore-checksums -y
cup veracrypt --ignore-checksums -y
chocolatey-misc-helpers.extension --ignore-checksums -y

$FIRST_NESSESCARY_APPS = 'firefox autohotkey fastcopy python 7zip classic-shell altsnap sizer sysinternals cloneapp'
$NESSESCARY_APPS = 'rainmeter firefox autohotkey fastcopy python 7zip winrar classic-shell notepadplusplus intel-dsa altsnap sizer sysinternals cloneapp google-drive-file-stream treesizefree SetDefaultBrowser vscode git revo-uninstaller f.lux launchy authy-desktop Everything fastcopy th-ch-youtube-music winamp equalizerapo steam crystaldiskinfo irfanview irfanviewplugins qalculate throttlestop duplicati microsoft-windows-terminal PowerShell mpc-be greenshot speedyfox geforce-experience msiafterburner directx winja.install epicgameslauncher glaryutilities-free peazip copyq discord eartrumpet youtube-dl choco-package-list-backup battle.net plasso ds4windows obs powertoys workspacer malwarebytes thunderbird qbittorrent webtorrent-desktop ffmpeg regcool.portable defraggler libreoffice-fresh openjdk signal telegram voicemeeter-banana vlc'
$WINGET_APPS = 'Appest.TickTick Shabinder.SpotiFlyer kite.kite'
$KEEPASS_AND_PLUGINS = 'keepass keepass-plugin-trayrecent keepass-plugin-qrcodegen keepass-plugin-rdp keepass-plugin-favicon keepass-rpc keepass-plugin-kpfloatingpanel keepass-plugin-rulebuilder keepass-plugin-keeautoexec keepass-plugin-itanmaster keepass-plugin-autotypecustomfieldpicker plugin-winkee keepass-plugin-kpscript keepass-plugin-certkeyprovider keepass-plugin-qualitycolumn keepass-plugin-fieldsadminconsole keepass-plugin-passwordcounter keepass-plugin-otpkeyprov keepass-plugin-keecloud keepass-plugin-keeotp keepass-plugin-cw3import keepass-plugin-truecryptmount keepass-plugin-autotypesplitter keepass-plugin-pickcharsdeferred keepass-plugin-keeagent keepass-plugin-gost keepass-plugin-keeanywhere keepass-plugin-1p2kp keepass-plugin-keeotp2 keepass-plugin-keechallenge keepass-plugin-keetheme keepass-plugin-twofishcipher keepass-plugin-haveibeenpwned keepass-plugin-mskeyimporter keepass-plugin-keepassotp keepass-plugin-readablepassphrasegen keepass-plugin-kp2fachecker keepass-plugin-webautotype keepass-plugin-winhello keepass-kpentrytemplates keepass-keeagent keepass-plugin-autotypesearch kptransfer'
$YUBIKEY_APPS = 'yubico-authenticator wincrypt-sshagent yubikey-piv-manager yubikey-neo-manager yubikey-personalization-tool yubikey-manager'

cup %FIRST_NESSESCARY_APPS% --ignore-checksums -y






