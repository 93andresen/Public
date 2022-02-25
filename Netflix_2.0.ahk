#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2


shortcut=C:\Users\%A_UserName%\Desktop\Netflix_2.0.ink
shortcut2=%A_Desktop%\Netflix_2.0.ink
if not FileExist(shortcut)
    FileCreateShortcut, C:\temp_Windows10ToolkitRichard\Public-main\Netflix_2.0.ahk, C:\Users\%A_UserName%\Desktop\Netflix_2.0.ink
if not FileExist(shortcut2)
    FileCreateShortcut, C:\temp_Windows10ToolkitRichard\Public-main\Netflix_2.0.ahk, %A_Desktop%\Netflix_2.0.ink


IniRead, count, C:\Users\93and\AppData\Local\Temp\counter.ini, Section, count
count += 1
IniWrite, %count%, C:\Users\93and\AppData\Local\Temp\counter.ini, Section, count

if clipboard contains magnet:?
{
    magnet=%clipboard%
    goto, here
}

Gui, Add, Edit, vsearch x23 y52 w340 h50 ,
Gui, Add, Button, x83 y112 w220 h70 , Arr Arr I'm a pirate!
Gui, Add, Text, x83 y12 w220 h30 +Center, Search Series and Movies!
; Generated using SmartGUI Creator 4.0
Gui, Show, x393 y164 h194 w391, Netflix 2.0
Return

GuiClose:
run, https://www.youtube.com/watch?v=dQw4w9WgXcQ,,max
ExitApp

ButtonArrArrI'mapirate!:
~Enter::
WinGetActiveTitle, AT
if AT != Netflix 2.0
    return
Gui, submit
Random, rnd, 0, 9
IniRead, porn, C:\Users\93and\AppData\Local\Temp\counter.ini, Section, porn
IniWrite, 0, C:\Users\93and\AppData\Local\Temp\counter.ini, Section, porn
if porn = 1
{
    goto, skip_porn
}
if count > 5
{
    if count = 5
    {
        rnd = 9
    }
    if rnd = 9
    {
        skiptoporn:
        run, https://thepiratebay0.org/top/500,,max
        porn=1
        IniWrite, 1, C:\Users\93and\AppData\Local\Temp\counter.ini, Section, porn
        goto, endporn
    }
}
skip_porn:
run, https://thepiratebay0.org/s/?page=0&orderby=99&q=%search%,,max
waitforlink:
loop
{
    if clipboard contains magnet:?
    {
        magnet=%clipboard%
        Tooltip, 
        goto, here
    }
    else
        sleep, 10
    Tooltip, Waiting for magnet link in clipboard
}

Mbutton::
MouseGetPos, mx, my
WinGetActiveTitle, AT
if clipboard contains magnet:?
{
    magnet=%clipboard%
}
else if AT contains Chrome
    {
        msgbox, You are using Chrome, Right-click the magnet and click "copy link adress"
        goto, waitforlink
    }
else if AT contains Firefox
{
    loop 3
    {
        mouse_rightclick_func(mx, my)
        sleep, 100
        send, l
        sleep, 100
        if clipboard contains magnet:?
        {
            var=1
            magnet=%clipboard%
            goto, here
        }
        sleep, 200
    }
    if clipboard contains magnet:?
    {
        magnet=%clipboard%
    }
    else
        goto, waitforlink
}
else
    goto, skip_porn
here:
Gui, submit
file=C:\Users\%A_UserName%\AppData\Local\WebTorrent\WebTorrent.exe
if not FileExist(file)
{
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
    Tooltip, Webtorrent is not Installed - Installing now
    if not FileExist("C:\ProgramData\chocolatey\bin\choco.exe")
        runwait, powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')),,max
    runwait, powershell.exe cup webtorrent-desktop,,max
    countdown = 300
    loop %countdown%
    {
        if not FileExist(file)
            Tooltip, Waiting for file to appear:`n`nC:\Users\%A_UserName%\AppData\Local\WebTorrent\WebTorrent.exe`n`nTimeout - %countdown%/300
        countdown -= 1
        sleep, 100
    }
    if not FileExist(file)
    {
        Tooltip, 
        msgbox, ERROR, can't seem to install webtorrent, try again or install it manually first... Exiting App...
        ExitApp
    }
}
Tooltip, 
run, cmd.exe /k %file% "%magnet%",,hide

loop 300
{
    WinActivate, WebTorrent
    winmaximize, WebTorrent
    WinGetActiveTitle, AT
    if AT = WebTorrent
    {
        WinActivate, WebTorrent
        winmaximize, WebTorrent
        break
    }
    sleep, 100
}

Esc::
endporn:
if porn = 1
{
    msgbox, There's no Escaping Destiny. . .
    msgbox, Never gonna give you up!
    run, https://www.youtube.com/watch?v=dQw4w9WgXcQ,,max
}
msgbox, FINISHED
ExitApp
























































get_size(file_or_folder)
{
    AttributeString := FileExist(file_or_folder)
    if AttributeString = D
    {
        SetBatchLines, -1  ; Make the operation run at maximum speed.
        FolderSize := 0
        Loop, %file_or_folder%\*.*, , 1
            FolderSize += A_LoopFileSize
        return FolderSize
    }
    if AttributeString != D
    {
        FileGetSize, Filesize, %file_or_folder%
        return Filesize
    }
}
DesktopIcons( Show:=-1 )    ; Usage: DesktopIcons(True) to show, DesktopIcons(False) to hide, DesktopIcons() to toggle the current state.
{
    Local hProgman := WinExist("ahk_class WorkerW", "FolderView") ? WinExist()
                   :  WinExist("ahk_class Progman", "FolderView")

    Local hShellDefView := DllCall("user32.dll\GetWindow", "ptr",hProgman,      "int",5, "ptr")
    Local hSysListView  := DllCall("user32.dll\GetWindow", "ptr",hShellDefView, "int",5, "ptr")

    If ( DllCall("user32.dll\IsWindowVisible", "ptr",hSysListView) != Show )
         DllCall("user32.dll\SendMessage", "ptr",hShellDefView, "ptr",0x111, "ptr",0x7402, "ptr",0)
}
Print(string){
	ListVars
	WinWait ahk_id %A_ScriptHwnd%
	ControlSetText Edit1, %string%
	WinWaitClose
}
PrintDebug(string:=""){
	Static
	string := string ? string . "`r`n" . lastStr : "", lastStr := string
	If !WinActive("ahk_class AutoHotkey"){
		ListVars
		WinWait ahk_id %A_ScriptHwnd%
		WinGetTitle, title, ahk_id %A_ScriptHwnd%
	}Else If !string{
		PostMessage, 0x112, 0xF060,,, %title% ; 0x112 = WM_SYSCOMMAND, 0xF060 = SC_CLOSE
		Return
	}
	ControlSetText Edit1, %string%, ahk_id %A_ScriptHwnd%
}
inirw(rw, key, value:="")
{
    if rw=w
        IniWrite, %value%, C:\!\TEMP\InifilesAndOther\GLOBAL_VARIABLES.ini, Section, %key%
    else if rw=r
        IniRead, value, C:\!\TEMP\InifilesAndOther\GLOBAL_VARIABLES.ini, Section, %key%
    Else
        msgbox, ERROR, rw was not r or w`nrw=%rw%
    return %value%
}
CheckIfEmptyFolder(path)
{
    Loop, %path%\*.*,1,1
    {
        If A_Index
        {
            return 1
        }
    }
    return 0
}
ConvertRegToBat(regfile)
{
    SplitPath, regfile, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    FileCreateDir, %OutDir%\RegConvert
    run, C:\!\PortableApplications\RegConvert_v1.2\RegConvert.exe /S=%regfile% /T=%OutDir%\RegConvert\%OutNameNoExt%.bat /O=BAT2
}
Counter(x, y)
{
    x+=1
    Tooltip, %x%
    sleep, %y%
    ytot+=y
    Tooltip, 
    Return
}
GetParentDir(path)
{
    SplitPath, %path%, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    run, %OutDir%
}
FullScreenPhoto(path)
{
    run, C:\Program Files\IrfanView\i_view64.exe %path% /fs
}
PauseGooglesync()
{
    mouse_click_func("1781", "1056")
    sleep, 500
    mouse_click_func("1579", "254")
    sleep, 500
    ClickPhoto("C:\!\Pictures\Greenshot\2021-12-15 11_28_30-Google Drive Status Window.png")
}
ResumeGooglesync()
{
    mouse_click_func("1781", "1056")
    sleep, 500
    mouse_click_func("1579", "254")
    sleep, 500
    ClickPhoto("C:\!\Pictures\Greenshot\2021-12-15 11_30_42-Google Drive Status Window.png")
}
ToggleFirefoxYoutube()
{
    Process, Exist, firefox.exe
    if errorlevel = 0
        ContinueYoutube()
    else
        CloseYoutube()
}
ContinueYoutube()
{
    IniRead, inilink, C:\!\TEMP\InifilesAndOther\YoutubeCloseContinue.ini, %link%, %link%
    ;HopBackwards(seconds, inilink)
    clipboard=%inilink%
    run, %inilink%
    tmp=clipboard
    Process, Exist, firefox.exe
    if errorlevel = 0
    {
        WaitForPixelColor("129", "884", 0xC000CA, 30000)
        WinGetActiveTitle, AT
        if AT contains YouTube
        {
            mouse_click_func("685", "469")  ;   fullscreen
            mouse_click_func("685", "469")  ;   fullscreen
        }
        ExitApp
    }
}
CloseYoutube()  ;   And save playtime (TO LINK_INI)
{
    WinGetActiveTitle, AT
    WinActivate, ahk_exe firefox.exe
    CoordMode, Mouse, Screen
    MouseGetPos, mx, my
    BlockInput, MouseMove
    WinGetActiveTitle, AT
    mouse_click_func("1080", "82")
    mousemove, 435, 368, 0
    sleep, 10
    WinGetActiveTitle, AT2
    send, {WheelUp 400}
    sleep, 10
    loop 1
    {
        send, {space}
        sleep, 100
        send, {left}
    }
    mousemove, %mx%, %my%, 0
    BlockInput, MouseMoveOff
    temp=%clipboard%
    mouse_rightclick_func("435", "368")
    mouse_click_func("601", "508")
    ;Got the youtubeLink
    link = %clipboard%
    IniWrite, %link%, C:\!\TEMP\InifilesAndOther\YoutubeCloseContinue.ini, %link%, %link%
    mouse_click_func("1796", "81")
    sleep, 250
    send, ^v
    sleep, 400
    FormatTime, TimeLong,, yyyy-MM-dd_HH.mm.ss
    savepath=%clipboard%_
    if clipboard contains https://youtu.be/
    {
        send, ^{PrintScreen}
        sleep, 400
        MouseClickDrag_func("left", "1415", "64", "1841", "537", "5")
        sleep, 30
        path=%clipboard%
        send, ^wq
        sleep, 100
        send, !{f4}
        sleep, 100
        run, C:\Program Files\IrfanView\i_view64.exe %path% /fs
        MouseMove, "1556", "510", 2
    }
    else
        msgbox, error clipboard doesent contain https://youtu.be/`nclipboard = %clipboard%
}
RunCompiledAHK(exe)
{
    SplitPath, exe, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    compiled_path = C:\!\ScriptsNotSynced\CompiledAutohotkeyScripts\%OutNameNoExt%.exe
    ;run, C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe
    runwait, Ahk2Exe.exe /in %exe% /out %compiled_path% /bin "Unicode 64-bit.bin"
    run, %compiled_path%
    Tooltip, done
    sleep, 500
    Tooltip, 
}
RunActivate(title, exe_path, commands, multiple, maximize)
{
    SplitPath, exe_path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    if multiple = 1
    {
        if exe_path contains http
            PID := run, %exe_path% %commands%,,,PID
        else
            PID := run_file_if_it_exists(exe_path, commands)

    }
    else if ProcExist(OutFileName)
        if exe_path contains .exe
            WinActivate, ahk_exe %OutFileName%
        else
            WinActivate, %title%
    else
    {
        if exe_path contains http
            run, %exe_path% %commands%
        else
            PID := run_file_if_it_exists(exe_path, commands)

    }
    count=100
    loop
    {
        if exe_path contains .exe
            WinActivate, ahk_exe %OutFileName%
        else
            WinActivate, %title%
        WinGetActiveTitle, AT
        if AT contains %title%
            break
        else if count < 1
        {
            Tooltip, RunActivate Function Timed out after 10 seconds...
            sleep, 3000
            Tooltip, 
            return %PID%
        }
        count-=1
        sleep, 100
    }
    if maximize=1
    {
        WinMaximize, ahk_exe %OutFileName%
        WinMaximize, %AT%
        WinMaximize, %title%
        WinMaximize, %OutDir%
    }
    return %PID%

; Windows-Shift-S: launches new Chrome instance or activates existing one (and opens new tab)
;#+s::
;    SetTitleMatchMode, 2
;    if WinExist("ahk_class Chrome_WidgetWin_1") {
;        ifWinNotActive, ahk_class Chrome_WidgetWin_1
;        {
;            WinActivate, ahk_class Chrome_WidgetWin_1
;            WinWaitActive
;        }
;        Send, ^t ; shortcut for new tab
;    } else {
;        Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
;        Sleep 100
;        WinActivate
;        WinWaitActive
;    }
;return
}
WaitForPixelColor(x, y, color, ms)  ;CHANGE THIS WITH PixelSearch
{
    ms /= 100
    loop %ms%
    {
        CoordMode, Pixel, Screen
        PixelGetColor, real_color, x, y, RGB
        if real_color = %color%
            return %color%
        else
        {
            sleep, 100
            ;Tooltip, color = %color%`nreal_color = %real_color%
        }
    }
    return %real_color%
}
PlayYoutubePlaylist(link)
{
    SetTitleMatchMode, 2
    CoordMode mouse, screen
    RunActivate("Watch later", link, "", "0", "1")
    back:
    loop 350
    {
        WaitForPixelColor("437", "857", "0x000000", "100")
        ;WaitForPixelColor("1505", "317", "0x000000", "10000")
        ;WaitForPixelColor("1505", "317", "0x000000", "10000")
        WinActivate, ahk_exe Firefox.exe
        WinMaximize, ahk_exe Firefox.exe
        WinGetActiveTitle, AT
        sleep, 100
        if AT contains YouTube
        {
            if AT contains Watch later
            {
                send, ^0
                PixelGetColor, newcolor, 437, 857, RGB    ; Play Pause Button should be white either way
                if newcolor=0x000000
                    mouse_click_func("473", "399")      ;   press top video (latest)
                sleep, 1000
            }
            else break
        }
    }
    loop 300
    {
        loop_counter+=1
        Var := Mod(loop_counter, 10)
        if Var = 0
        {
            WinActivate, ahk_exe Firefox.exe
            WinMaximize, ahk_exe Firefox.exe
        }
        MouseMove, 216, 830, 0
        Tooltip, [%sucsess%/10] [%this_color%]-[%last_color%]
        Random, xm, 107, 1260
        Random, ym, 208, 794
        MouseMove, %xm%, %ym%, 0
        last_color = %this_color%
        PixelGetColor, this_color, %xm%, %ym%, RGB
        if this_color=%last_color%
            sucsess=0
        else
            sucsess+=1
        if sucsess>10
            goto, skip_playcheck
    }
    PixelGetColor, pause_middle, 218, 828, RGB    ; In the middle of pause button
    if pause_middle != 0xFFFFFF
        mouse_click_func("218", "828")
    skip_playcheck:
    mouse_click_func("1223", "832") ;   fullscreen
    ;mouse_click_func("685", "469")  ;   fullscreen
    ;mouse_click_func("685", "469")  ;   fullscreen
}
ClickPhoto(photo)
{
    CoordMode, Mouse, Screen
    ImageSearch, OutX, OutY, 9, 9, 1928, 1088, %photo%
    mouse_click_func(OutX, OutY)
}
WinActivateWaitActive(AT, seconds)
{
    count := seconds*100
    loop
    {
        Tooltip, Waiting for %AT%`nTimeout in %count%
        WinGetActiveTitle, ACTIVE
        if ACTIVE Contains %AT%
        {
            Tooltip, 
            break
        }
        WinActivate, %AT%
        sleep, 10
        count -= 1
        if count < 1
        {
            Tooltip, 
            break
        }
    }
}
wait_for_fastcopy_to_finish()
{
    Random, rng, 500, 600
    loop
    {
        Process, Exist, FastCopy.exe
        if Errorlevel=0
        {
            Tooltip, 
            break
        }
        else
        {
            Tooltip, Waiting for FastCopy to finish
            sleep, %rng%
        }
    }
}
CleanYTMusicFolder(path, deleteparts)
{
    SplitPath, path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    FileCreateDir, %path%
    SetWorkingDir, %path%
    metafolderTEMP = C:\!\TEMP\zzz_%OutFileName%_MetadataTEMP
    ;metafolder = %path%\zzz_Metadata
    metafolder = %path%\..\..\zzz_Metadata\zzz_Metadata_Playlists_%format%\Metadata_%OutFileName%
    FileCreateDir, %metafolder%
    source = %path%
    dest = %metafolderTEMP%
    mode = /cmd=move
    include = "*.json;*.url;*.description;*.webp;*.jpg;*.png"
    wait_for_fastcopy_to_finish()
    runwait, "fastcopy" /include=%include% /postproc=nosound /cmd=%mode% /open_window /force_close /force_start(=N) "%source%" /to="%dest%",,min
    source = %metafolderTEMP%
    dest = %metafolder%
    mode = /cmd=move
    wait_for_fastcopy_to_finish()
    runwait, "fastcopy" /include=%include% /postproc=nosound /cmd=%mode% /open_window /force_close /force_start(=N) "%source%" /to="%dest%",,min
    FileRemoveDir, %metafolderTEMP%, 1

    loop 10
        FileDelete, *.webm
    if deleteparts = 1
    {
        loop 10
            FileDelete, *.part
    }
}
fastcopy_wait_func(source, dest, mode) ;   File or Folder, will create destination folders, Close even if error.
{
    if FileExist(source)
    {
        SplitPath, dest, dest_OutFileName, dest_OutDir, dest_OutExtension, dest_OutNameNoExt, dest_OutDrive
        if FileExist(dest_OutDrive)
        {
            runwait, fastcopy /postproc=nosound %mode% /open_window /force_close /force_start(=N) "%source%" /to="%dest%"
        }
    }
}
fastcopy_func(source, dest, mode) ;   File or Folder, will create destination folders, Close even if error.
{
    if FileExist(source)
    {
        SplitPath, dest, dest_OutFileName, dest_OutDir, dest_OutExtension, dest_OutNameNoExt, dest_OutDrive
        if FileExist(dest_OutDrive)
        {
            run, fastcopy /postproc=nosound %mode% /open_window /force_close /force_start(=N) "%source%" /to="%dest%"
            sleep, 500
        }
    }
}
StopwatchTooltip(tooltip)
{
    run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\StopwatchTooltip.ahk %tooltip%
}
LogTime(x)
{
	FormatTime,TimeLongms,, yyyy-MM-dd_HH-mm-ss.%A_msec%
	FileAppend, `n%TimeLongms% %x%, C:\!\Logs\LogTime.txt
}
LogTimeEscape(x)
{
	FormatTime,TimeLongms,, yyyy-MM-dd_HH-mm-ss.%A_msec%
	FileAppend, `n%TimeLongms% %x% Triggered by pressing Escape - Implement this --> HOW_MANY Seconds Have Passed Since %x%, C:\!\Logs\LogTime.txt
}
WriteNewAutohotkeyFunctionAHK()
{
    CoordMode, Mouse, Screen
    Process,Exist,Code.exe
    if Errorlevel=0
    {
        msgbox, Code.exe not Running
    }
    else
    {
        loop 100
        {
            winactivate ahk_exe Code.exe
            WinGetActiveTitle, AT
            if AT contains Visual
            {
                ;send, ^+e
                mouse_click_func("31", "83")
                mousemove, 276, 251, 0
                sleep, 150
                send, {WheelUp 2000}
                mouse_rightclick_func(243, 133)
                sleep, 200
                mouse_click_func(281, 158)
                sleep, 400
                ;send, {down 3}
                sleep, 100
                send, ^b
                break
            }
            sleep, 1
        }
    }
}
sleep_tooltip(seconds, tooltip)
{
    loop %seconds%
    {
        seconds -= 1
        Tooltip, %seconds%`n%tooltip%
        sleep, 1000
    }
    Tooltip, 
}
ConnectedToInternet(flag=0x40) 
{ 
    Return DllCall("Wininet.dll\InternetGetConnectedState", "Str", flag,"Int",0) 
}
kill_task(exe, force:="1")
{
    if force=0
    {
        run, cmd.exe /c Taskkill /IM "%exe%",,hide
    }
    else
    {
        run, cmd.exe /c Taskkill /IM "%exe%" /F,,hide
    }
}
RepeatSound(sound, seconds, tooltip)
{
    SoundPlay, %sound%
    minutes := % seconds/60
    ms := % (seconds*1000)-5000
    Tooltip, %tooltip%`n`nRepeatSound: %sound%`nEvery %seconds% seconds`n(Every %minutes% Minutes)
    sleep, 5000
    Tooltip, 
    loop
    {
        sleep, %ms%
        SoundPlay, %sound%
    }
}
FileCreateJunctionLink(x, y)
{
    run, cmd.exe /c mklink /j %x% %y%
}
;C:\!\Code\GitHub\93andresen C:\!\Code\GitHub\93andresen_Scripts

;You can use either mklink /j or junction in Windows 10 to create junctions. You can use mklink /d in Windows 10 to create directory symbolic links. Notes: junction can also list junctions and determine if a file is a junction unlike mklink .
;How can I create a symbolic link on Windows 10? - Super User

MouseClickDrag_func(button, x1, y1, x2, y2, speed)
{
    CoordMode, Mouse, Screen
    MouseGetPos, mx, my
    mx2 := mx+5
    my2 := my+5
    BlockInput, MouseMove
    mousemove, %x1%, %y1%, 0
    sleep, 10
    mousemove, %mx2%, %my2%, 0
    sleep, 10
    mousemove, %x1%, %y1%, 0
    sleep, 10
    MouseClickDrag, %button%, %x1%, %y1%, %x2%, %y2%, %speed%
    mousemove, %mx%, %my%, 0
    sleep, 10
    BlockInput, MouseMoveOff
    sleep, 20
}
mouse_click_func(x, y)
{
    CoordMode, Mouse, Screen
    MouseGetPos, mx, my
    mx2 := mx+5
    my2 := my+5
    BlockInput, MouseMove
    mousemove, %x%, %y%, 0
    sleep, 10
    mousemove, %x2%, %y2%, 0
    sleep, 10
    mousemove, %x%, %y%, 0
    sleep, 10
    MouseClick, left, %x%, %y%, 1, 0
    mousemove, %mx%, %my%, 0
    BlockInput, MouseMoveOff
}
mouse_rightclick_func(x, y)
{
    CoordMode, Mouse, Screen
    MouseGetPos, mx, my
    mx2 := mx+5
    my2 := my+5
    BlockInput, MouseMove
    mousemove, %x%, %y%, 0
    sleep, 10
    mousemove, %x2%, %y2%, 0
    sleep, 10
    mousemove, %x%, %y%, 0
    sleep, 10
    MouseClick, right, %x%, %y%, 1, 0
    mousemove, %mx%, %my%, 0
    BlockInput, MouseMoveOff
}
wait_for_title(title, timeout)
{
    timeout *= 5
    loop
    {
        WinGetActiveTitle, AT
        if AT contains %title%
        {
            break
        }
        timeout -= 1
        if timeout < 1
        {
            MsgBox, TIMEOUT, wait_for_title(title, timeout)... Exiting App...
            ExitApp
        }
        sleep, 200
        timeout+=1
    }
}

wait_until_title_change(title, timeout)
{
    timeout *= 5
    loop
    {
        WinGetActiveTitle, AT
        if AT contains %title%
        {
            timeout -= 1
            if timeout < 1
            {
                MsgBox, TIMEOUT, wait_for_title(title, timeout)... Exiting App...
                ExitApp
            }
            sleep, 200
            timeout+=1
        }
        else
            break
    }
}


rename_current_pattern_and_a_new_one(ATSPOT)
{
    IniRead, past_TimeLong, C:\!\ScriptsNotSynced\FL_STUDIO_START_NEW_LOOP.ini, Section, past_TimeLong
    IniRead, past_ATSPOT, C:\!\ScriptsNotSynced\FL_STUDIO_START_NEW_LOOP.ini, Section, past_ATSPOT
    FormatTime, TimeLong,, yyyy-MM-dd_HH.mm.ss
    FormatTime, TimeClock,, HH.mm.ss
    IniWrite, %TimeLong%, C:\!\ScriptsNotSynced\FL_STUDIO_START_NEW_LOOP.ini, Section, past_TimeLong
    IniWrite, %ATSPOT%, C:\!\ScriptsNotSynced\FL_STUDIO_START_NEW_LOOP.ini, Section, past_ATSPOT

    if ATSPOT = Spotify Premium
        ATSPOT = Spotify_Inactive
    if past_ATSPOT = Spotify Premium
        past_ATSPOT = Spotify_Inactive
    if ATSPOT = %past_ATSPOT%
    {
        send, {F2}
        sleep, 100
        send, %past_TimeLong%_->_%TimeClock%_%past_ATSPOT%  ;if spotify is inactive OR the same song still plays
        sleep, 50
        send, {enter}
        sleep, 100
    }
    else
    {
        send, {F2}
        sleep, 100
        send, %past_TimeLong%_->_%TimeClock%_%past_ATSPOT%_->_%ATSPOT%   ;2 different songs were playing
        sleep, 50
        send, {enter}
        sleep, 100
    }
    send, {F4}
    sleep, 100
    send, %TimeLong%_%ATSPOT%
    sleep, 50
    send, {enter}
    sleep, 100

}
Process_Suspend(PID_or_Name){
    PID := (InStr(PID_or_Name,".")) ? ProcExist(PID_or_Name) : PID_or_Name
    h:=DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", pid)
    If !h   
        Return -1
    DllCall("ntdll.dll\NtSuspendProcess", "Int", h)
    DllCall("CloseHandle", "Int", h)
}

Process_Resume(PID_or_Name){
    PID := (InStr(PID_or_Name,".")) ? ProcExist(PID_or_Name) : PID_or_Name
    h:=DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", pid)
    If !h   
        Return -1
    DllCall("ntdll.dll\NtResumeProcess", "Int", h)
    DllCall("CloseHandle", "Int", h)
}

ProcExist(PID_or_Name=""){
    Process, Exist, % (PID_or_Name="") ? DllCall("GetCurrentProcessID") : PID_or_Name
    Return Errorlevel
}
end_process(exe_filelist_path)
{
    Loop, Read, %exe_filelist_path%
    {
        Progress := A_Index
        Progress *= 2
    }
    Tooltip, Asking applications Gracefully to end - %A_LoopReadLine%`n`nProgress=%Progress%
    Loop, Read, %exe_filelist_path%
    {
        Tooltip, Asking applications Gracefully to end - %A_LoopReadLine%`n`nProgress=%Progress%
        Process, Exist, %A_LoopReadLine%
        If (ErrorLevel != 0)
        {
            run, cmd.exe /c Taskkill /IM "%A_LoopReadLine%",,hide
        }
        Progress-=1
    }
    Tooltip, Killing Tasks Forcefully - %A_LoopReadLine%`n`nProgress=%Progress%
    Loop, Read, %exe_filelist_path%
    {
        Tooltip, Killing Tasks Forcefully - %A_LoopReadLine%`n`nProgress=%Progress%
        Process, Exist, %A_LoopReadLine%
        If (ErrorLevel != 0)
        {
            run, cmd.exe /c Taskkill /IM "%A_LoopReadLine%" /F,,hide
        }
        Progress-=1
    }
}
end_process_wait(exe_filelist_path)
{
    Loop, Read, %exe_filelist_path%
    {
        Progress := A_Index
        Progress *= 2
    }
    ;Tooltip, Asking applications Gracefully to end WAITING - %A_LoopReadLine%`n`nProgress=%Progress%
    Loop, Read, %exe_filelist_path%
    {
        Tooltip, Asking applications Gracefully to end - %A_LoopReadLine%`n`nProgress=%Progress%
        Process, Exist, %A_LoopReadLine%
        If (ErrorLevel != 0)
        {
            runwait, cmd.exe /c Taskkill /IM "%A_LoopReadLine%",,hide
        }
        Progress-=1
    }
    ;Tooltip, Killing Tasks Forcefully WAITING - %A_LoopReadLine%`n`nProgress=%Progress%
    Loop, Read, %exe_filelist_path%
    {
        Tooltip, Killing Tasks Forcefully - %A_LoopReadLine%`n`nProgress=%Progress%
        Process, Exist, %A_LoopReadLine%
        If (ErrorLevel != 0)
        {
            runwait, cmd.exe /c Taskkill /IM "%A_LoopReadLine%" /F,,hide
        }
        Progress-=1
    }
}
AHKPanicExcept(Kill=0, Pause=0, Suspend=0, SelfToo=0, path=0) 
{
  DetectHiddenWindows, On
  WinGet, IDList ,List, ahk_class AutoHotkey

  Loop, %IDList%
  {
      Progress := A_Index
      ;Progress *= 2
  }
  Loop %IDList%
  {
    ID:=IDList%A_Index%
    WinGetTitle, ATitle, ahk_id %ID%
    Tooltip, Killing Autohotkey Scripts - %ATitle%`n`nProgress=%Progress%
    Progress-=1
    IfNotInString, ATitle, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Shutdown_Restart_Reboot_Computer.ahk
    {
        IfNotInString, ATitle, %path%
        {
            IfNotInString, ATitle, %A_ScriptFullPath%
            {
                If Suspend
                PostMessage, 0x111, 65305,,, ahk_id %ID%  ; Suspend. 
                If Pause
                PostMessage, 0x111, 65306,,, ahk_id %ID%  ; Pause.
                If Kill
                WinClose, ahk_id %ID% ;kill
            }
        }
    }
  }
  If SelfToo
  {
  If Suspend
    Suspend, Toggle  ; Suspend. 
  If Pause
    Pause, Toggle, 1  ; Pause.
  If Kill
    ExitApp
  }
}
AHKPanicOLD(Kill=0, Pause=0, Suspend=0, SelfToo=0) {
DetectHiddenWindows, On
WinGet, IDList ,List, ahk_class AutoHotkey
Loop %IDList%
  {
  ID:=IDList%A_Index%
  WinGetTitle, ATitle, ahk_id %ID%
  IfNotInString, ATitle, %A_ScriptFullPath%
    {
    If Suspend
      PostMessage, 0x111, 65305,,, ahk_id %ID%  ; Suspend. 
    If Pause
      PostMessage, 0x111, 65306,,, ahk_id %ID%  ; Pause.
    If Kill
      WinClose, ahk_id %ID% ;kill
    }
  }
If SelfToo
  {
  If Suspend
    Suspend, Toggle  ; Suspend. 
  If Pause
    Pause, Toggle, 1  ; Pause.
  If Kill
    ExitApp
  }
}
run_run_process(process, path, cmd)
{
    Process, Exist, %process%
    If (ErrorLevel = 0)
    {
        run_file_if_it_exists(path, cmd)
    }
}

run_file_if_it_exists(path, cmd)
{
    if FileExist(path)
    {
        run, %path% %cmd%,,,PID
        return %PID%
    }
}
runwait_file_if_it_exists(path, cmd)
{
    if FileExist(path)
    {
        runwait, %path% %cmd%,,,PID
        return %PID%
    }
}

;Convert These to functions
;C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\GetFileListOfClipboardFolder.ahk

LockWorkStation()
{
    DllCall("LockWorkStation")
}

TurnMonitorsOff()
{
    ; from http://autohotkey.com/board/topic/105261-turn-monitor-off-even-when-using-the-computer/?p=642266
    SendMessage,0x112,0xF170,2,,Program Manager
}

ActivateOrOpen(window, program)
{
	; check if window exists
	if WinExist(window)
	{
		WinActivate  ; Uses the last found window.
	}
	else
	{   ; else start requested program
		 Run cmd /c "start ^"^" ^"%program%^"",, Hide ;use cmd in hidden mode to launch requested program
		 WinWait, %window%,,5		; wait up to 5 seconds for window to exist
		 IfWinNotActive, %window%, , WinActivate, %window%
		 {
			  WinActivate  ; Uses the last found window.
		 }
	}
	return
}
ActivateOrOpenChrome(tab, url)
{
    Transform, url, Deref, "%url%" ;expand variables inside url
    Transform, tab, Deref, "%tab%" ;expand variables inside tab
    chrome := "- Google Chrome"
    found := "false"
    tabSearch := tab
    curWinNum := 0

    SetTitleMatchMode, 2
    if WinExist(Chrome)
	{
		WinGet, numOfChrome, Count, %chrome% ; Get the number of chrome windows
		WinActivateBottom, %chrome% ; Activate the least recent window
		WinWaitActive %chrome% ; Wait until the window is active

		ControlFocus, Chrome_RenderWidgetHostHWND1 ; Set the focus to tab control ???

		; Loop until all windows are tried, or until we find it
		while (curWinNum < numOfChrome and found = "false") {
			WinGetTitle, firstTabTitle, A ; The initial tab title
			title := firstTabTitle
			Loop
			{
				if(InStr(title, tabSearch)>0){
					found := "true"
					break
				}
				Send {Ctrl down}{Tab}{Ctrl up}
				Sleep, 50
				WinGetTitle, title, A  ;get active window title
				if(title = firstTabTitle){
					break
				}
			}
			WinActivateBottom, %chrome%
			curWinNum := curWinNum + 1
		}
	}

    ; If we did not find it, start it
    if(found = "false"){
        Run chrome.exe "%url%"
    }
	return
}
; from https://stackoverflow.com/a/28448693
SendUnicodeChar(charCode)
{
    ; if in unicode mode, use Send, {u+####}, else, use the encode method.
    if A_IsUnicode = 1
    {
        Send, {u+%charCode%}
    }
    else
    {
        VarSetCapacity(ki, 28 * 2, 0)
        EncodeInteger(&ki + 0, 1)
        EncodeInteger(&ki + 6, charCode)
        EncodeInteger(&ki + 8, 4)
        EncodeInteger(&ki +28, 1)
        EncodeInteger(&ki +34, charCode)
        EncodeInteger(&ki +36, 4|2)

        DllCall("SendInput", "UInt", 2, "UInt", &ki, "Int", 28)
    }
}
EncodeInteger(ref, val)
{
	DllCall("ntdll\RtlFillMemoryUlong", "Uint", ref, "Uint", 4, "Uint", val)
}
Stdout(output:="", sciteCheck := true){	;output to console	-	sciteCheck reduces Stdout/Stdin performance,so where performance is necessary disable it accordingly
	Global ___console___
	If (sciteCheck && ProcessExist("SciTE.exe") && GetScriptParentProcess() = "SciTE.exe"){	;if script parent is scite,output to scite console & return
		FileAppend, %output%`n, *
		Return
	}																												;CONOUT$ is a special file windows uses to expose attached console output
	( output ? ( !___console___? (DllCall("AttachConsole", "int", -1) || DllCall("AllocConsole")) & (___console___:= true) : "" ) & FileAppend(output . "`n","CONOUT$") : DllCall("FreeConsole") & (___console___:= false) & StdExit() )
}

Stdin(output:="", sciteCheck := true){	;output to console & wait for input & return input
	Global ___console___
	If (sciteCheck && ProcessExist("SciTE.exe") && GetScriptParentProcess() = "SciTE.exe"){	;if script parent is scite,output to scite console & return
		FileAppend, %output%`n, *
		Return
	}
	( output ? ( !___console___? (DllCall("AttachConsole", "int", -1) || DllCall("AllocConsole")) & (___console___:= true) : "" ) & FileAppend(output . "`n","CONOUT$") & (Stdin := FileReadLine("CONIN$",1)) : DllCall("FreeConsole") & (___console___:= false) & StdExit() )
	Return Stdin
}

StdExit(){
	If GetScriptParentProcess() = "cmd.exe"		;couldn't get this: 'DllCall("GenerateConsoleCtrlEvent", CTRL_C_EVENT, 0)' to work so...
		ControlSend, , {Enter}, % "ahk_pid " . GetParentProcess(GetCurrentProcess())
}

FileAppend(str, file){
	FileAppend, %str%, %file%
}

FileReadLine(file,lineNum){
	FileReadLine, retVal, %file%, %lineNum%
	return retVal
}

ProcessExist(procName){
	Process, Exist, % procName
	Return ErrorLevel
}

GetScriptParentProcess(){
	return GetProcessName(GetParentProcess(GetCurrentProcess()))
}

GetParentProcess(PID)
{
	static function := DllCall("GetProcAddress", "ptr", DllCall("GetModuleHandle", "str", "kernel32.dll", "ptr"), "astr", "Process32Next" (A_IsUnicode ? "W" : ""), "ptr")
	if !(h := DllCall("CreateToolhelp32Snapshot", "uint", 2, "uint", 0))
		return
	VarSetCapacity(pEntry, sz := (A_PtrSize = 8 ? 48 : 36)+(A_IsUnicode ? 520 : 260))
	Numput(sz, pEntry, 0, "uint")
	DllCall("Process32First" (A_IsUnicode ? "W" : ""), "ptr", h, "ptr", &pEntry)
	loop
	{
		if (pid = NumGet(pEntry, 8, "uint") || !DllCall(function, "ptr", h, "ptr", &pEntry))
			break
	}
	DllCall("CloseHandle", "ptr", h)
	return Numget(pEntry, 16+2*A_PtrSize, "uint")
}

GetProcessName(PID)
{
	static function := DllCall("GetProcAddress", "ptr", DllCall("GetModuleHandle", "str", "kernel32.dll", "ptr"), "astr", "Process32Next" (A_IsUnicode ? "W" : ""), "ptr")
	if !(h := DllCall("CreateToolhelp32Snapshot", "uint", 2, "uint", 0))
		return
	VarSetCapacity(pEntry, sz := (A_PtrSize = 8 ? 48 : 36)+260*(A_IsUnicode ? 2 : 1))
	Numput(sz, pEntry, 0, "uint")
	DllCall("Process32First" (A_IsUnicode ? "W" : ""), "ptr", h, "ptr", &pEntry)
	loop
	{
		if (pid = NumGet(pEntry, 8, "uint") || !DllCall(function, "ptr", h, "ptr", &pEntry))
			break
	}
	DllCall("CloseHandle", "ptr", h)
	return StrGet(&pEntry+28+2*A_PtrSize, A_IsUnicode ? "utf-16" : "utf-8")
}

GetCurrentProcess()
{
	return DllCall("GetCurrentProcessId")
}


