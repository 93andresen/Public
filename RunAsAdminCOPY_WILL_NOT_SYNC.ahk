#Include, AutohotkeyFucktions.ahk
CoordMode, Screen
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, force
#Persistent

if A_ComputerName = G3-2
{
    Tooltip, RunAsAdmin.ahk`n`nA_ComputerName = G3-2`nExiting App...
    sleep, 5000
    ExitApp
}
IniWrite, 0, C:\!\ScriptsNotSynced\remember_ADMINMouseLayout.ini, 500, remember

;^down
goto, RELOADHERE

;_____________________________________________BEFORE_RELOAD_________________________________________________________________________________






~Mbutton::
WinGetActiveTitle, AT
if AT contains Visual Studio Code
{
	Tooltip, .
    run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\GoToLinkInVSCode.ahk
    Tooltip, 
    return 
}
if AT contains Chocolatey
{
    run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\ChocolateyInstallMultipleApps.ahk
    return
}
Process Exist, Spotify.exe
spotify_PID := ErrorLevel
WinGet, AT_PID, PID, A
if spotify_PID=%AT_PID%
{
    run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\spotify_add_to_queue.ahk
}
return
~^Mbutton::
;WinGetActiveTitle, AT
;if AT contains Visual Studio Code
;{

;}
;else

Process Exist, Spotify.exe
spotify_PID := ErrorLevel
WinGet, AT_PID, PID, A
if spotify_PID=%AT_PID%
{
    run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\spotify_download_playlist.ahk
}
return







^+!s::
sleep, 500
RunActivate("C:\!\KeePass\synced\rezet.kdbx - KeePass", "", "C:\!\KeePass\synced\rezet.kdbx", 0, maximize)
return

^!+F1::
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\7zipTEMP_PASSWORD_IS_123.ahk
return

;Enter::
send, #5
sleep, 150
send, {down}
sleep, 15
send, #7
return





;run, C:\!\Code\GitHub\93andresen_Scripts\

clipboard = C:\!\PortableApplications\KeePass\Databases\CurrentDatabases\Windows-Locked.kdbx
return
SetTitleMatchMode, 2
winactivate, Chocolatey.ahk - Scripts - Visual Studio Code
sleep, 500
send, ^v`n_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ `n
sleep, 2000
winactivate, Brave
sleep, 1000
send, ^c
sleep, 500
winactivate, Chocolatey.ahk - Scripts - Visual Studio Code
sleep, 1000
send, ^v`n`n
sleep, 1500
winactivate, Brave
sleep, 600
send, ^l
sleep, 300
send, ^c
sleep, 200
send, ^w
sleep, 2000
winactivate, Chocolatey.ahk - Scripts - Visual Studio Code
sleep, 500
send, ^v`n`n___________________________________________________________________________________________________________`n`n
sleep, 1500
winactivate, Brave
return
send, ^c
sleep, 200
FileAppend, %clipboard%%A_Space%, TempFileAppend.txt
return

;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Hotkeys\ROBOCOPYMULTITHREADTESTING.ahk

;Del::
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\RecycleInExplorerFunction.ahk
;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\RobocopyTo7zipRecycleBin.ahk
return

;return

;_________________________________________RELOADHERE_________________________________________________________________________________________

RELOADHERE:
    ;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Idle.ahk
    ;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\RUN_AND_CLOSE_AUTOHOTKEY_SCRIPTS.ahk
    ;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\DelayedStartupAutorun.ahk
    ;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\7zip5.ahk
    ;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\spotify universal hotkeys.ahk
    ;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Auto-Scroll Past Ads.ahk
    ;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Spotify.ahk
    ;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Spotify\SpotifyAddSongToPlaylist.ahk
    ;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\CheckPionterLocation.ahk
    ;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Progress Bar.ahk
    ;Run, C:\Users\Richard\Google Drive (richardandresen54@gmail.com)\Automate Executing These Files\Autohotkey\Warcraft 3 Hotkeys.ahk
    ;Run, C:\Users\Richard\.0A_G3_C_USERS_RICHARD\FL Studio\JAM\13.01.2021---Jam
    ;Winwait C:\Users\Richard\.0A_G3_C_USERS_RICHARD\FL Studio\JAM\13.01.2021---Jam
    ;Send, {Down60}{Enter}
    ;sleep, 2000
    ;Run, C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe
    ;\Google Drive (93andresen@gmail.com)\A100\Android\[UP&DELETE]\Macrodroid Macros
    ;Quick Test Here
    ;+-::
    Tooltip, ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ
    sleep, 100
    Tooltip, 
return
;_____________________________________________AFTER_RELOAD_________________________________________________________________________________

;_________________________________________________________________________________________________________________________________________
!r::
    Reload
    sleep, 300
    msgbox, FAILED TO RELOAD
return

^F5::
    sleep, 300
    send, ^s
Return
^F6::
    run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\SaveTouchTypingResultsOBS.ahk
Return

;^Down::
{
    sleep, 400
    send, !{tab}
    sleep, 560
    send, ^x
    sleep, 500
    send, !{tab}
    WinActivate, Firefox
    sleep, 50
    Sendevent, {WheelUp 20}
    sleep, 600
    send, ^l
    sleep, 500
    send, ^v
    sleep, 500
    send, {enter}
    sleep, 7000
    MouseClick, left, 271, 884, 1, 1
    MouseClick, left, 271, 884, 1, 1
}
return
sleep, 500
send, ^c
sleep, 500
send, ^{tab}
sleep, 500
send, ^v
sleep, 100
send {space}
sleep, 500
send, ^{tab}
return

sendinput, #{1}
MouseGetPos, MX, MY
clipboard=%MX%, %MY%
Tooltip, %MX% %MY%
sleep, 950
MouseClick, left, 1052, 900, 2, 2
sleep, 850
MouseClick, left, 1120, 900, 1, 1
sleep, 2850
MouseClick, left, 1200, 900, 1, 1
sleep, 4500
MouseClick, left, 134, 230, 1, 1
sleep, 1850
MouseClick, left, 1280, 900, 1, 1
sleep, 850
send, !{tab}
Return
::kkkk::
    MouseClick, left, 468, 461, 1, 1
    ;run, powershell.exe, C:\!\Code\GitHub\93andresen_Scripts\Powershell\Downloads\SendEmail.ps1
    
    ^F1::
        CoordMode, Mouse, Screen
        MouseGetPos, MX, MY
        sleep, 100
        Tooltip, %MX%, %MY%
        clipboard=%MX%, %MY%
        sleep, 1000
        Tooltip, 
    return
    
    WinGetActiveTitle, clipboard
    ;send, clipboard
    ;msgbox, clipboard
    if clipboard Contains Visual Studio Code
    {
        Send, {Ctrl Down}s{Ctrl Up}
    } else {
        
    }
    Tooltip, ...
    sleep, 100
    Tooltip, 
    Reload
    loop, 5 {
        Tooltip, COULD NOT RELOAD
        sleep, 300
        Tooltip, 
        sleep, 50
    }
    return
    
    ;SpotifyLikeSongHeart.mcr
    
    ;^+a::
    run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Spotify\SpotifyAddSongToPlaylist.ahk
        return
    
    ;^+d::
        BlockInput, MouseMove
        MouseGetPos, MMX, MMY
        MouseClick, Right, MMX, MMY
        sleep, 100
        send, {up 2}
        send, {enter}
        BlockInput, MouseMoveOff
    Return

::tt::
send, Tooltip,{space}
return
::ss::
send, send,{space}
return
::sss::
send, sleep,{space}
return
::rr::
send, run,{space}
return
::rrr::
send, runwait,{space}
return
::rrrr::
send, return
return
::ee::
send, ExitApp
Return
::eee::
send, Esc::{enter}ExitApp{enter}
Return
::tttt::
send, tr
sleep, 700
send, {down 1}
Return
pass93andresen@gmail.com
::rlrlgl::
SetKeyDelay, 3, 3
sleep, 500
sendevent, {backspace 10}
sleep, 100
sendevent, HEEEY good luck have fun :D
SetKeyDelay, 10, 10
return
::rlrlsry::
SetKeyDelay, 3, 3
sleep, 500
sendevent, {backspace 10}
sleep, 100
sendevent, havent played in a long time and have to rank up again its a little unfair sorry :/
SetKeyDelay, 10, 10
return
::rlrlsry::
SetKeyDelay, 3, 3
sleep, 500
sendevent, {backspace 10}
sleep, 100
sendevent, havent played in a long time and have to rank up again its a little unfair sorry :/
SetKeyDelay, 10, 10
return
::wintit::
WinGetActiveTitle, clipboard
return
F7::
    run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\start_macro_recording.ahk
return

^|::
Tooltip, .
send, ^s
sleep, 10
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\NNNAutohotkey.ahk
Tooltip, 
return

^+F1::
CoordMode, Mouse, Screen
MouseGetPos, MX, MY
sleep, 100
clipboard = mouse_click_func("%MX%", "%MY%")
send, mouse_click_func("%MX%", "%MY%"){enter}
return
^+F2::
CoordMode, Mouse, Screen
MouseGetPos, MX, MY
sleep, 100
clipboard = mouse_rightclick_func("%MX%", "%MY%")
send, mouse_rightclick_func("%MX%", "%MY%"){enter}
return
^+F3::
CoordMode, Pixel, Screen
MouseGetPos, mx, my
PixelGetColor, color, mx, my, RGB
;send, WaitForPixelColor("%mx%", "%my%", "%color%", "ms")
;send, {enter}{left 2}^+{left}
clipboard = WaitForPixelColor(%mx%, %my%, %color%, ms)
sleep, 100
return
^+F4::
WinGetActiveStats, Title, Width, Height, X, Y
clipboard=%Title%, %Width%, %Height%, %X%, %Y%
send, %Title%, %Width%, %Height%, %X%, %Y%
return

^+F5::
WinGet, activePath, ProcessPath, % "ahk_id" winActive("A")	; activePath is the output variable and can be named anything you like, ProcessPath is a fixed parameter, specifying the action of the winget command.
clipboard = %activePath%
send, %activePath%
return


^+F9::
IniWrite, 1, C:\!\TEMP\InifilesAndOther\Autorun_ADMIN.ini, Section, ran_by_hotkey
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Autorun_ADMIN.ahk
return
^+F10::
runwait, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\mount_veracrypt_g3.ahk
return
^+F11::
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Update_Fast.ahk
return
^+F12::
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Update.ahk
Return
    ::tittit::
        WinGetActiveTitle, clipboard
        if clipboard Contains Visual Studio Code
        {
            Send, {Ctrl Down}s{Ctrl Up}
            sleep, 100
            WinGetActiveTitle, clipboard
        }
        sleep, 300
        
        
    return
    
    Launch_App2::
        run, C:\!\Paths\AutoShortcutTemp\Task Manager.lnk, , max
        run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\WinMaximizeTask Manager.ahk
    return
        ^+Space::
            Tooltip, Elevated
            runwait, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\ADMINKeyboardLayout.ahk
            Tooltip, 
        return
        
        ^F3::
            send, hey this is a nmeeefwefgwgswrg
        
        ^!+w::
            BlockInput, MouseMove
            MouseClick, Right
            sleep, 100
            send, {up}
            sleep, 30
            send, {up}
            sleep, 30
            send, {up}
            sleep, 100
            send, {right}
            sleep, 100
            send, {down}
            sleep, 30
            send, {enter}
            BlockInput, MouseMoveOff
        Return
        ^+w::
            BlockInput, MouseMove
            MouseClick, Right
            sleep, 100
            send, {up}
            sleep, 30
            send, {up}
            sleep, 100
            send, {right}
            sleep, 100
            send, {down}
            sleep, 30
            send, {enter}
            BlockInput, MouseMoveOff
        Return
        
        ::77::
            temp = clipboard
            clipboard = {
                send, ^v
                sleep, 200
                clipboard = %temp%
            Return
            ::00::
                temp = clipboard
                clipboard = }
                send, ^v
                sleep, 200
                clipboard = %temp%
            Return
            +Enter::
                send, ^{a}
                send, ^{c}
                send, {Enter}
            Return
            ;run, wmic service Groupy call StartService
            
            ;md "C:\!\Paths\Sources\Programs(Merged)""
            ;cd /d "C:\ProgramData\Microsoft\Windows\Start Menu\Programs""
            ;for /r %d in (*) do copy "%d" "C:\!\Paths\Sources\Programs(Merged)""
            
            
            ::---::
                temp = %clipboard%
                temp2 = --ignore-checksums --force --force-dependencies
                clipboard = %temp2%
                sleep, 30
                Send, {Ctrl Down}v{Ctrl Up}
                sleep, 30
                clipboard = %temp%
            return
            ::--i::
                temp = %clipboard%
                temp2 = --ignore-checksums
                clipboard = %temp2%
                sleep, 30
                Send, {Ctrl Down}v{Ctrl Up}
                sleep, 30
                clipboard = %temp%
            return

            
            ::--f::
                temp = %clipboard%
                temp2 = --force --force-dependencies
                clipboard = %temp2%
                Send, {Ctrl Down}v{Ctrl Up}
                ;clipboard = %temp%
            return
            ::seaa::
                ;run, cmd.exe /k C:\Users\93and\scoop\shims\scoop.exe search %clipboard%, , max
                run, powershell.exe, , max
                winwaitactive, Administrator: Windows PowerShell
                send, choco search %clipboard%{enter}winget search %clipboard%{enter}
            return
            ::wwww::winget search
            return
            ::wwwww::winget install
            return
            ::cccc::choco search
            return
            ::ccccc::choco install
            return
            
            ;F10::
            if VAR1 Contains Google Chrome
            {
                send, {tab 18}
                send {enter}
            }
            
            WinGetActiveTitle, Clipboard
            
            Autonorm = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\NormalAutotype\AutotypeUnlessF10.ahk
            Autopass = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\PasswordOnlyAutotype\AutotypeUnlessF10.ahk
            F10Pressed = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\F10Pressed\AutotypeUnlessF10.ahk
            ActualOpenedFile = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\ActualOpenedFile\AutotypeUnlessF10.ahk
            ActualOpenedFilePath = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\ActualOpenedFile
            
            F10Pressed = 1
            FileDelete, %ActualOpenedFile%
            FileCopy %F10Pressed%, %ActualOpenedFilePath%, 1
            ToolTip, A
            sleep, 50
            ToolTip, Au
            sleep, 50
            ToolTip, Aut
            sleep, 50
            ToolTip, Auto
            sleep, 50
            ToolTip, Autot
            sleep, 50
            ToolTip, Autoty
            sleep, 50
            ToolTip, Autotyp
            sleep, 50
            ToolTip, Autotype
            sleep, 50
            ToolTip, Autotype
            sleep, 50
            ToolTip, Autotype C
            sleep, 50
            ToolTip, Autotype Ca
            sleep, 50
            ToolTip, Autotype Can
            sleep, 50
            ToolTip, Autotype Canc
            sleep, 50
            ToolTip, Autotype Cance
            sleep, 50
            ToolTip, Autotype Cancel
            sleep, 50
            ToolTip, Autotype Cancell
            sleep, 50
            ToolTip, Autotype Cancelle
            sleep, 50
            ToolTip, Autotype Cancelled
            sleep, 50
            ToolTip, Autotype Cancelled.
            sleep, 50
            ToolTip, Autotype Cancelled..
            sleep, 50
            ToolTip, Autotype Cancelled...
            sleep, 50
            ToolTip, Autotype Cancelled... 10
            sleep, 1000
            ToolTip, Autotype Cancelled... 9
            sleep, 1000
            ToolTip, Autotype Cancelled... 8
            sleep, 1000
            ToolTip, Autotype Cancelled... 7
            sleep, 1000
            ToolTip, Autotype Cancelled... 6
            sleep, 1000
            ToolTip, Autotype Cancelled... 5
            sleep, 1000
            ToolTip, Autotype Cancelled... 4
            sleep, 1000
            ToolTip, Autotype Cancelled... 3
            sleep, 1000
            ToolTip, Autotype Cancelled... 2
            sleep, 1000
            ToolTip, Autotype Cancelled... 1
            sleep, 1000
            ToolTip, 
            F10Pressed = 0
            
            WinGetActiveTitle, VAR
            ;pick google hit 1
            
            
            
            ;~Control::
            click Down left
            keywait Control
            click Up left
            return
            
            
            
            Check:
                IfGreater, A_TimeIdle, 3000
                {
                    ;	run, C:\Program Files\Google\Drive\googledrivesync.exe
                    ;	run, C:\!\Code\GitHub\93andresen_Scripts\FreeFileSync\C_to_D\93and_Except_Clouds_and_KeePass_and_Scripts.ffs_batch
                }
            return
            
            ;return
            
            ;git clone https://github.com/denolfe/AutoHotkey.git --recursive
            
            
            ;CapsLock::
            ;Do When IDLE
            ;turn off caps lock
            
            
            ;Log into Webpage
            
            
            ::launcherpaths::
                run, C:\!\Code\GitHub\93andresen_Scripts\Bat\FastcopyProgramsShortcuts.bat
            return
            
            return
            ;Numpad2::
            run, C:\!\Code\GitHub\93andresen_Scripts\FreeFileSync+LauncherPaths\Launcher\Sources\Paths
            
            
            temp = %clipboard%
            send, {F2}
            sleep, 100
            Send, {Ctrl Down}c{Ctrl Up}
            sleep, 200
            Send, {Enter}
            sleep, 200
            filename = %clipboard% ;get file address
            sleep, 200
            Send, {Ctrl Down}c{Ctrl Up}
            sleep, 200
            targetpath = %clipboard% ;get file address
            sleep, 200
            linkpath = C:\!\Paths\Sources%filename%.ink
            ;msgbox, %linkpath%
            
            
            
            
            return

            ;F6::
            AutoTrim, off
            
            SetWorkingDir, C:\Users\93and\OneDrive\Skrivebord\
            shortcut = C:\Users\93and\OneDrive\Skrivebord\dddd.txt.ink
            target = C:\Users\93and\OneDrive\Skrivebord\dddd.txt
            
            WshShell := ComObjCreate("WScript.Shell")
            oShellLink := WshShell.CreateShortcut(shortcut)
            oShellLink.TargetPath := target
            oShellLink.Save()
            return
            
            ;FileCreateShortcut, %targetpath%, %linkpath%, C:\!\Paths\Sources
            
            ;FileCreateShortcut, "%InstallFolder%\[Script File]", %A_Programs%\TR Tools\[Script Name]\[Script File].lnk, %InstallFolder%, , [Script File Description]
            ;FileCreateShortcut, "%InstallFolder%\[Script File]", %A_Programs%\TR Tools\[Script Name]\[Script File].lnk, %InstallFolder%, , [Script File Description]
            FileCreateShortcut, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Hotkeys\yyyy.MM.dd_hh.mm.ss_Hotkeys.ahk, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Hotkeys\yyyy.MM.dd_hh.mm.ss_Hotkeys.ink, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Hotkeys\
            return
            ;FileCreateShortcut, C:\!\Paths\Fixes.txt, C:\!\Paths\TESTTT.ink, C:\Users\93and\Paths\Sources
            clipboard = %temp%
            return
            ;FileMove
            
            
            
            ;sleep, 5000
            ;sendinput, f
            return
            13.01.2021---Jam
            ;Enter::
            send, {enter}
            run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Auto-Scroll Past Ads.ahk
            return
            
            ^!+F6::
                temp = %clipboard%
                ;KeyWait, F7, D
                sleep, 100
                send {F2}
                sleep, 100
                Send, {Ctrl Down}c{Ctrl Up}
                sleep, 200
                Send, {Enter}
                sleep, 200
                file = %clipboard% ;get file name
                sleep, 200
                Send, {Ctrl Down}c{Ctrl Up}
                sleep, 200
                path = %clipboard% ;get file address
                sleep, 200
                clipboard = %temp% ;restore clipboard
                ;outdir := getdir(file)
                ;if (A_Is64bitOS = 1)
                
                ;file = filename
                ;path = path
                
                ;command = C:\!\PortableAppsPlatform\PortableApps\7-ZipPortable\App\7-Zip64\7z.exe e -y -r %path%
                
                ;msgbox, %command%
                ;return
                
                ;run, %command%
            Return
            
            
            Delim := ";"
            Str = "Ex1";Ex2;"Ex3";"Ex4"
            
            NewStr := StrReplace(Str, Delim """")
            MsgBox % NewStr ; Ex1Ex2Ex3Ex4



            
            
            NewStr := StrReplace(clipboard, """")
            file_att := FileExist(NewStr)
            SplitPath, NewStr, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
            if file_att=D
                run, %NewStr%
            else
                run, %OutDir%
            Tooltip, 
            return
            
            +!r::	;Run Clipboard as Admin
            Tooltip, .
            run, %clipboard%
            Tooltip, 
            return
            
            
            #F2::
                ;Clipboard:=""
                SendInput, ^c 			     ; copy current selection to clipboard
                ClipWait, 1
                ;Sleep, -1 ; this line is only for extreme cases!
                if !ErrorLevel {
                    original := Clipboard
                    stripped := RegexReplace(original, "`r`n", "")
                    msgbox, %stripped%
                    Run, open %stripped%
                }
            return
            
            
            
            
            temp = %clipboard%
            ;sleep, 100
            ;send {F2}
            ;sleep, 100
            Send, ^c
            sleep, 50
            ;sleep, 200
            clipboard = %clipboard% ;get file address
            ;Run, %fileadress%
            ;clipboard = %fileadress%
            ;sleep, 50
            ;;Sendinput, \
            ;sleep, 50
            ;Send, {Ctrl Down}c{Ctrl Up}
            ;sleep, 50
            ;fileadress = %clipboard% ;get file address
            ;sleep, 50
            ;clipboard = %temp% ;restore clipboard
            ;outdir := getdir(file)
            ;if (A_Is64bitOS = 1)
            
            return
            
            ^+l::
                Send, {Ctrl Down}l{Ctrl Up}
                sleep, 100
                Send, {Ctrl Down}c{Ctrl Up}
            return
            
            ;Robocopy "C:\!" "E:\.#01_G3_D_SYNC\.#01_G3_C_SYNC(Robocopy)" /ZB /SEC /COPYALL /SECFIX /MIR /MON:1 /MOT:1 /MT:8 /R:10 /W:5 /V /ETA
            
            ;Autotype keepass, launch if needed
            
            ;::dd::
            Autonorm = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\NormalAutotype\AutotypeUnlessF10.ahk
            Autopass = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\PasswordOnlyAutotype\AutotypeUnlessF10.ahk
            F10Pressed = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\F10Pressed\AutotypeUnlessF10.ahk
            ActualOpenedFile = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\ActualOpenedFile\AutotypeUnlessF10.ahk
            ActualOpenedFilePath = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\ActualOpenedFile
            FileCopy %Autonorm%, %ActualOpenedFilePath%, 1
            return
            
            <^>!f::
                FormatTime, TimeLong, , yyyy-MM-dd_HH.mm.ss
                FileAppend, %clipboard%`n %TimeLong%, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\ClipboardFileAppend.txt
                Tooltip, %cripboard%
                sleep, 1000
                Tooltip, 
            Return
            
            
            
            
            ;Keepass
            ;<^>!.::
            Autonorm = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\NormalAutotype\AutotypeUnlessF10.ahk
            Autopass = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\PasswordOnlyAutotype\AutotypeUnlessF10.ahk
            F10Pressed = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\F10Pressed\AutotypeUnlessF10.ahk
            ActualOpenedFile = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\ActualOpenedFile\AutotypeUnlessF10.ahk
            ActualOpenedFilePath = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\ActualOpenedFile
            
            Run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\CheckIfKeepassIsInBackground.ahk
            Process, Exist, KeePass.exe
            if !errorlevel=0
            {
                sleep, 100
                Send {LCtrl Down}
                sendinput {f11}
                send {LCtrl Up}
            } else {
                sleep, 100
                if F10Pressed = 1
                {
                    run, C:\!\KeePass\Databases\Current\Windows-Locked.kdbx
                } else {
                    FileDelete, %ActualOpenedFile%
                    FileCopy %Autonorm%, %ActualOpenedFilePath%, 1
                    run, C:\!\KeePass\Databases\Current\Windows-Locked.kdbx
                }
            }
            Return
            
            ;<^>!, ::
            Autonorm = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\NormalAutotype\AutotypeUnlessF10.ahk
            Autopass = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\PasswordOnlyAutotype\AutotypeUnlessF10.ahk
            F10Pressed = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\F10Pressed\AutotypeUnlessF10.ahk
            ActualOpenedFile = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\ActualOpenedFile\AutotypeUnlessF10.ahk
            ActualOpenedFilePath = C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutotypeUnlessF10\ActualOpenedFile
            
            Run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\CheckIfKeepassIsInBackground.ahk
            Process, Exist, KeePass.exe
            if !errorlevel=0
            {
                sleep, 100
                Send {LCtrl Down}
                sendinput {f10}
                send {LCtrl Up}
            } else {
                sleep, 100
                if F10Pressed = 1
                {
                    run, C:\!\KeePass\Databases\Current\Windows-Locked.kdbx
                } else {
                    msgbox, 11111
                    FileDelete, %ActualOpenedFile%
                    FileCopy %Autonorm%, %ActualOpenedFilePath%, 1
                    run, C:\!\KeePass\Databases\Current\Windows-Locked.kdbx
                }
            }
            Return
            
            
            ;f10::
            WinWaitActive, Keepass
            {
                Send {LCtrl Down}
                sendinput {f11}
                send {LCtrl Up}
            }
            
            ;!{, }::
            ;ProcessExist(Name){
            ;	Process, Exist, %Name%
            ;	return Errorlevel
            ;}
            
            
            ;::extract::
            ;send terre
            ;return
            
            
            ;^!+F3::
            ;:R*?:xxx::
            
            
            ;$Insert::
            ;msgbox, % "your game fps is " getfpscounter("Rocket League")
            ;getfpscounter()
            ;{
            ;what can i do?
            ;return fps
            ;}
            ;return
            
            
            
            
            
            
            
            
            
            
            $Insert::
                FormatTime, TimeSingle, , yyyy-MM-dd
                FormatTime, TimeDouble, , dd-MM-yyyy
                FormatTime, TimeLong, , yyyy-MM-dd_HH.mm.ss
                ;FormatTime, Time, , dddd dd MMMM yyyy
                ;FormatTime, Time, , dd/MM/yyyy
                ;FormatTime, CurrentDateTime6, , yyyy.MM.dd_HH:mm:ss
                
                
                KeyWait, Insert, T1.0
                if cooldown = 1 ;cooldown so long won't trigger single after
            return
            else
                if (ErrorLevel) ;long
            {
                SendInput %TimeLong%
                cooldown = %1%
                sleep, 1000
                cooldown = %0%
            } else {
                KeyWait, Insert, D T0.5		;single
                if (ErrorLevel) {
                    SendInput %TimeSingle%
                }else						;double {
                    SendInput %TimeDouble%
                }
            
            
            ;Process, Exist, keepass.exe
            ;If (ErrorLevel = 0)
            {
                ;	Run, C:\Users\Richard\Google Drive (richardandresen54@gmail.com)\Automate Executing These Files\Autohotkey\keepass autotype.ahk
                ;sleep, 3000
                ;Send, !{tab}
                ;sleep, 3000
                ;Send, ^!+{u}
                ;	msgbox Program was not running.
            }
            ;Else ; If it is running, ErrorLevel equals the process id for the target program (Printkey). Then close it.
            {
                ;	sleep, 100
                ;	Send, ^!+{u}
                ;	Process, Close, %ErrorLevel%
                ;	msgbox Closed process %ErrorLevel%
            }
            
            ;WinWait, Macro Recorder (licensed to fasdgds)
            return
            
            
            
            
            return
            
            
            ;Loop
            ;{
            ;    WinWait, VirusTotal Uploader
            ;    WinClose, VirusTotal Uploader
            ;}
            
            ;^!r::Reload  ; Assign Ctrl-Alt-R as a hotkey to restart the script.
            ;return
            ; Retrieve the ID/HWND of the active window
            id := WinExist("A")
            MsgBox % id
            
            ; Press Win+↑ to maximize the active window
            #Up::WinMaximize, A
            
            ;MsgBox, % ComObjCreate("Scripting.FileSystemObject").GetFolder(Hotkeys).Files.Count
            
            
            ;^!+s:: Save
            
            SaveVersion = %A_ScriptName%
            
            FullName = Hotkeys_%SaveVersion%.ahk
            WindowTitle = Visual Studio Code
            SetTitleMatchMode, 2
            if WinActive(ahk_class "Visual Studio Code") {
                sleep, 250
                send, ^{s}
                sleep, 250
                send, ^+s
                sleep, 250
                WinWaitActive, Save As
                sleep, 250
                send, {right}
                sleep, 50
                send, {backspace 4}
                sleep, 50
                send, {left 50}
                sleep, 50
                send, {right 19}
                sleep, 50
                send, {backspace 19}
                sleep, 50
                send, ^{a}
                sleep, 50
                clipboardtemp = %clipboard%
                sleep, 50
                send, ^{c}
                sleep, 50
                SaveVersionNew = %clipboard%
                sleep, 50
                clipboard = %clipboardtemp%
                sleep, 50
                send, {BackSpace}
                sleep, 50
                FormatTime, CurrentDateTime, , yyyy.MM.dd_hh.mm.ss
                sleep, 250
                SendInput %CurrentDateTime%
                sleep, 250
                send, %SaveVersionNew%
                sleep, 250
                send, {tab 3}
                sleep, 250
                send, {Enter}
                sleep, 1000
                send, ^+s
                sleep, 250
                WinWaitActive, Save As
                sleep, 250
                send, yyyy.MM.dd_hh.mm.ss
                sleep, 250
                send, %SaveVersionNew%
                sleep, 250
                send, .ahk
                sleep, 250
                send, {tab 3}
                sleep, 250
                send, {Enter}
                sleep, 250
                send, {left}
                sleep, 250
                send, {enter}
                sleep, 500
                run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Hotkeys\yyyy.MM.dd_hh.mm.ss_Hotkeys.ahk
                sleep 550
                send, {Enter}
            }
             else
                sleep, 250
            send, ^+s
            sleep, 250
            WinWaitActive, Save As
            sleep, 250
            send, {right}
            sleep, 50
            send, {backspace 4}
            sleep, 50
            send, {left 50}
            sleep, 50
            send, {right 19}
            sleep, 50
            send, {backspace 19}
            sleep, 50
            send, ^{a}
            sleep, 50
            clipboardtemp = %clipboard%
            sleep, 50
            send, ^{c}
            sleep, 50
            SaveVersionNew = %clipboard%
            sleep, 50
            clipboard = %clipboardtemp%
            sleep, 50
            send, {BackSpace}
            sleep, 50
            FormatTime, CurrentDateTime, , yyyy.MM.dd_hh.mm.ss
            sleep, 250
            SendInput %CurrentDateTime%
            sleep, 250
            send, %SaveVersionNew%
            sleep, 250
            send, {tab 3}
            sleep, 250
            send, {Enter}
            sleep, 1000
            send, ^+s
            sleep, 250
            WinWaitActive, Save As
            sleep, 250
            send, yyyy.MM.dd_hh.mm.ss
            sleep, 250
            send, %SaveVersionNew%
            sleep, 250
            send, .ahk
            sleep, 250
            send, {tab 3}
            sleep, 250
            send, {Enter}
            sleep, 250
            send, {left}
            sleep, 250
            send, {enter}
            sleep, 1500
            run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Hotkeys\yyyy.MM.dd_hh.mm.ss_Hotkeys.ahk
            sleep 200
            send, {Enter}
            return
            
            
            
            ;^1::
            setformat, float, 0003
            if not number
                number = 0.0
            number += 1.0
            send %number%
            send !d
            Return
            
            ;^2::
            {
                number = 0.0
                return
            }
            
            
            
            
            return
            
            
            
            
            ;+NumLock::
            ;FormatTime, CurrentDateTime, , yyyy.MM.dd_HH:mm:ss
            
            
            
            ;https://autohotkey.com/board/to1c/83571-autohotkey-connect-to-bluetooth/
            ^!b::
                run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\ToggleBluetooth.ahk
            return
            
            ;Hotkeys for Macrorecorder
            ;f8::
            ;Winclose, Macro Recorder (licensed to fasdgds)
            ;Process, Close, MacroRecorder.exe
            ;sleep, 500
            if MacroRec = 1
            {
                Sendinput, {F2}
                MacroRec = 0
                msgbox, %MacroRec%
            } else {
                Process, Exist, MacroRecorder.exe
                if (ErrorLevel = 0) {
                    MacroRec = %0%
                    MacroPlaying = %0%
                    Run C:\Program Files (x86)\MacroRecorder\MacroRecorder.exe
                    ;sleep, 3000
                    WinWaitActive, Macro Recorder (licensed to fasdgds)
                    ;Send, !{tab}
                    ;sleep, 3000
                    
                    ;Send, ^!+{u}
                    ;	msgbox Program was not running.
                }
                Else ; If it is running, ErrorLevel equals the process id for the target program (Printkey). Then close it.
                {
                    ;	Process, Close, %ErrorLevel%
                    ;	msgbox Closed process %ErrorLevel%
                }
                Sendinput, {f1}
                MacroRec = %1%
                MacroPlaying = %0%
                msgbox, %MacroRec%
            }
            return
            ;f9::
            if MacroPlaying = 0
            {
                sendinput, {f3}
                MacroPlaying = %1%
            } else {
                sendinput, {F4}
                MacroRec = %0%
                MacroPlaying = %0%
            }
            return
            
            ;^+F3:: Winset, Alwaysontop, , Administrator: Windows PowerShell
            Return
            !a::Send, Autohotkey
            return
            !v::Send, Visual Studio Code
            return
            !c::send, chocolatey
            return
            
            ;Run Applizations=========================================================================
            ;[Right-ALT]
            
            
            
            
            ;Open Folders===========================================================================
            ;[Left-ALT]+[SHIFT]
            
            ;+1::
            ;Run, %A_MyDocuments%
            ;return
            ^!+2::
                Run, Explorer, C:\Users\Richard\Google Drive (richardandresen54@gmail.com)\Automate Executing These Files\Autohotkey
            return
            ;+3::
            ;Run, C:\Users\Richard\A100
            ;return
            ;+<4::
            ;Run, 
            ;return
            ;+<5::
            ;Run, 
            ;return
            ;+<6::
            ;Run, 
            ;return
            ;+<7::
            ;Run, 
            ;return
            
            
            ;^Numpad9::
            WinGetActiveTitle, ACTIVEWINDOW
            runwait, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AddSontToAutohotkeyPlaylist.ahk
            WinActivate, %ACTIVEWINDOW%
            return
            
            
            ^+!F::
                run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Fix_script_later_leave_timestamp.ahk
            return
            
            ::nm::
                Tooltip, .
                IniWrite, 1, tmp.ini, kp, kp
                sleep, 100
                Tooltip, 
            return
            
            ; Custom volume buttons
            ;Numpad9:: Send {Volume_Up} ;shift + numpad plus
            ;return
            ;Numpad8:: Send {Volume_Down} ;shift + numpad minus
            ;return
            ;break::Send {Volume_Mute} ; Break key mutes
            ;return
            
            
            ^!+F12::
                run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\KILL_APPS.ahk
            return
            ^!o::
                run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\c
            return
            
            ;CapsLock::
            clipboard_orginal=%clipboard%
            send, ^c
            clipboard_2=%clipboard%
            clipboard=%clipboard_orginal%
            if (A_PriorHotkey != "~CapsLock" or A_TimeSincePriorHotkey > 400) {
                ; Too much time between presses, so this isn't a double-press.
                KeyWait, CapsLock
                Tooltip, SD
                send, %clipboard_2%
                return
            }
            MsgBox, ytttttttttttttfg, Title, Text, Timeout]
            return
            ;~LControl::
            send, ^c
            return
            ;Shift::
            send, ^v
            return
            ;~CapsLock::
            KeyWait, CapsLock  ; Wait for user to physically release it.
            MsgBox You pressed and released the CapsLock key.
            return
            
^q::
ToggleFirefoxYoutube()
return
;~^+a::
Process, Exist, KeePass.exe
if Errorlevel = 0
{
    FileAppend, 1, C:\!\ScriptsNotSynced\autotupe_NOW.txt
    run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\autotype_keepass.ahk
}
return

::iiiii::
send, {#}Include, AutohotkeyFucktions.ahk{right}
sleep, 1
send, {left}
return


^+e::
WinGetActiveTitle, AT
if AT contains :\
{
    ;tmp=%clipboard%
    send, ^c
    sleep, 50
    path=%clipboard%
    sleep, 10
    clipboard=%path%
    Tooltip, %path%
    ;GetParentDir(path)
    sleep, 500
    Tooltip, 
    return
}

;^+f1::
return
send, ^c
sleep, 60
path=%clipboard%
clipboard=%tmp%
path_parsing := SubStr(path, 1, instr(path, "\", false, -1)-1)	;Remove chars to the right of \
;Tooltip, path_parsing=%path_parsing%
;sleep, 400
len_path := StrLen(path)
len_path_parsing := StrLen(path_parsing)
;Tooltip, %len_path% %len_path_parsing%
;sleep, 400
len_path -= %len_path_parsing%
;Tooltip, %len_path% %len_path_parsing%
;sleep, 400
path_parsed_left := SubStr(path_parsing, 1, instr(path_parsing, ":\", false, -1)-1)
len_path_parsed_left := StrLen(path_parsed_left)
;Tooltip, %len_path% %len_path_parsing% %len_path_parsed_left%
;sleep, 400
path_parsed_complete := SubStr(path_parsing, len_path_parsed_left, instr(path_parsing, "\", false, -1))
run, %path_parsed_complete%
Tooltip, %path_parsed_complete%
sleep, 500
Tooltip, 
return




