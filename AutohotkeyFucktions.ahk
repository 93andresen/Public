Process_Suspend_All()
{
    Process_Suspend("Chrome.exe")
    Process_Suspend("Firefox.exe")
    Process_Suspend("Spotify.exe")
;    Process_Suspend("Code.exe")
    Process_Suspend("YouTube Music.exe")
    Process_Suspend("Mailspring.exe")
    Process_Suspend("Thunderird.exe")
    Process_Suspend("MacroRecorder.exe")
    Process_Suspend("Qbittorrent.exe")
    Process_Suspend("Webtorrent.exe")
    Process_Suspend("Fastcopy.exe")
    Process_Suspend("googledriveFS.exe")
}
Process_Resume_All()
{
    Process_Resume("Chrome.exe")
    Process_Resume("Firefox.exe")
    Process_Resume("Spotify.exe")
    Process_Resume("Code.exe")
    Process_Resume("YouTube Music.exe")
    Process_Resume("Mailspring.exe")
    Process_Resume("Thunderird.exe")
    Process_Resume("MacroRecorder.exe")
    Process_Resume("Qbittorrent.exe")
    Process_Resume("Webtorrent.exe")
    Process_Resume("Fastcopy.exe")
    Process_Resume("googledriveFS.exe")
}
FirefoxCleanRAMProcessControl()
{
    Process_Resume("Firefox.exe")
    FirefoxCleanRAM()
    Process_Suspend("Firefox.exe")
}
ChromeCleanRAMProcessControl()
{
    Process_Resume("Chrome.exe")
    ChromeCleanRAM()
    Process_Suspend("Chrome.exe")
}
ChromeCleanRAM()
{
    if ProcExist("Chrome.exe")
    {
        WinGetActiveTitle, AT22
        if AT22 not contains Chrome
            WinActivate, ahk_exe Chrome.exe
        WinMaximize, ahk_exe Chrome.exe
        WinGetActiveTitle, AT73
        if AT73 not contains blank
            run, cmd.exe /c start chrome https://blank.org/
        WinWaitActive, blank, , 5, Firefox
        send, !+n
        sleep, 200
        send, !+n
    }
}

FirefoxCleanRAM()
{
    if ProcExist("Firefox.exe")
    {
        WinGetActiveTitle, AT22
        if AT22 not contains Firefox
            WinActivate, ahk_exe firefox.exe
        WinMaximize, ahk_exe firefox.exe
        WinGetActiveTitle, AT73
        if AT73 not contains blank
            run, firefox.exe -new-tab about:blank -foreground,,max
        WinWaitActive, ahk_exe Firefox.exe
        Tooltip, Discarding Tabs
        send, +!m
        loop 2
        {
            if AT22 not contains about:memory
                run, firefox.exe -new-tab about:memory -foreground,,max
            if WaitForPixelColor("622", "558", "0x23222B", "5000")
            {
                mouse_click_func("774", "171")
                if WaitForPixelColor("722", "250", "0x2B2A33", "5000")
                {
                    WinGetActiveTitle, AT6
                    if AT6 contains about:memory
                    {
                        Tooltip, Discarding Tabs
                        send, +!m
                        sleep, 200
                        send, ^w
                        break
                    }
                }
            }
        }
        sleep, 200
        send, +!m
    }
    else
        msgbox, WHAT
}
MouseIsOver(WinTitle) 
{
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
RAMUsage(tooltip:="0")
{
    static MEMORYSTATUSEX, init := VarSetCapacity(MEMORYSTATUSEX, 64, 0) && NumPut(64, MEMORYSTATUSEX, "UInt")
    if !(DllCall("Kernel32.dll\GlobalMemoryStatusEx", "Ptr", &MEMORYSTATUSEX))
        return DllCall("kernel32.dll\GetLastError")
    currentram := NumGet(MEMORYSTATUSEX, 4, "UInt")
    if tooltip != 0
        Tooltip, %currentram%`% RAM is in USE
    log(currentram)
    return currentram
}
ExitAppLog(x:="")
{
    logthis=%x% - Finished Running
    if x=esc
        log("Finished Running - Exited via Escape Button")
    else
        log(logthis)
    ExitApp
}
PercentDiff(ScriptA, ScriptB, loops:="1")
{
    currentloop=1
    loop %loops%
    {
        
        thisloopA1=%ScriptA% ScriptA loop %currentloop% of %loops% START
        log(thisloopA1, "C:\!\Logs\StopwatchLog.txt", "0", "0")
        RunPath(ScriptA, "1")
        thisloopA2=%ScriptA% ScriptA loop %currentloop% of %loops% ENDED
        ScriptAms := log(thisloopA2, "C:\!\Logs\StopwatchLog.txt", "0", "0")

        thisloopB1=%ScriptB% ScriptB loop %currentloop% of %loops% START
        log(thisloopB1, "C:\!\Logs\StopwatchLog.txt", "0", "0")
        RunPath(ScriptB, "1")
        thisloopB2=%ScriptB% ScriptB loop %currentloop% of %loops% ENDED
        ScriptBms := log(thisloopB2, "C:\!\Logs\StopwatchLog.txt", "0", "0")
        msgbox, ScriptAms=%ScriptAms%
        msgbox, ScriptBms=%ScriptBms%
        ScriptBms-=140
        ScriptAms-=140
        percentA := (((ScriptBms/ScriptAms)-1)*100)
        percentB := -((ScriptAms/ScriptBms)*100)
        percentArounded := Round(percentA, 0)
        percentBrounded := Round(percentB, 0)
        if ScriptAms<=ScriptBms
        {
            Tooltip, A is %percentArounded% `% Faster Then B`nA=%ScriptAms%`nB=%ScriptBms%
            currentA:=A%currentloop%
            currentA+=%percentArounded%
        }
        else
        {
            Tooltip, B is %percentBrounded% `% Faster Then A`nA=%ScriptAms%`nB=%ScriptBms%
            currentB:=B%currentloop%
            currentB+=%percentBrounded%
        }
        currentloop+=1
    }
    return %percentrounded%
}
TooltipPosition(pos, text)
{
    MouseGetPos, mx, my
    ypix:=27*pos
    my2 := my+ypix
    MouseMove, mx, my2, 0
    Tooltip, %text%
    MouseMove, %mx%, %my%, 0
}
CloseUpdateWait()
{
    i=100
    loop %i%
    {
        closeupdate := inirw("r", "closeupdate")
        if closeupdate!=running
            break
        skip=yes
        t=%i% Waiting For CloseUpdate to Finish Closing
        Tooltip, %t%
        sleep, 100
        i-=1
    }
    Tooltip, 
    ;if (closeupdate!="running") and (skip!="yes")
    CloseUpdate()
}
CloseUpdate()
{
    inirw("w", "closeupdate", "running")
    Tooltip, Closing Update Scripts
    ;DetectHiddenWindows, Off
    tit_ok=0
    tit2_ok=0
    loop 100
    {
        ;Tooltip, tit_ok=%tit_ok%`ntit2_ok=%tit2_ok%
        tittit=0
        IfWinExist, ___title_for_closing___
        {
            WinClose, ___title_for_closing___
        }
        else
            tit_ok=1
        IfWinExist, C:\ProgramData\chocolatey\bin\yt-dlp.exe
        {
            WinClose, C:\ProgramData\chocolatey\bin\yt-dlp.exe
        }
        else
            tit2_ok=1
        if (tit_ok="1") and (tit2_ok="1")
            tittit=1
    }
    Tooltip, %tittit%
    if tittit!=1
    {
        loop 20
        {
            ;kill_task("yt-dlp.exe", "0")
            ;kill_task("powershell.exe", "0")
            runwait, cmd.exe /c Taskkill /IM "yt-dlp.exe"
            runwait, cmd.exe /c Taskkill /IM "powershell.exe"
        }
        loop 20
        {
            ;kill_task("yt-dlp.exe", "1")
            ;kill_task("powershell.exe", "1")
            runwait, cmd.exe /c Taskkill /IM "yt-dlp.exe" /F
            runwait, cmd.exe /c Taskkill /IM "powershell.exe" /F
        }
    }
    inirw("w", "closeupdate", "not_running")
    Tooltip, 
}
ReadAppend(ReadFile, AppendTo)
{
    FileRead, ReadFile_var, %ReadFile%
    FileAppend, `n%AppendTo_var%, %AppendTo%
}
InternetWait(seconds)
{
    loop
    {
        If ConnectedToInternet()
        {
            return 1
        }
        else
        {
            timeout-=1
            sleep, 1000
            if timeout>1
                break
        }
    }
}
RunPowershellLog(command, path:="C:\!\Logs\Powershell\_PowershellLog.txt", minmaxhide:="max", wait:="0")
{
    ;FormatTime, TimeLong,, yyyy-MM-dd_HH.mm.ss
    ;if temp_path = TimeLong_temp_path
    ;    temp_path = C:\!\Logs\Powershell\%TimeLong%_PowershellLog.txt
    SplitPath, path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    if not FileExist(OutDir)
        FileCreateDir, %OutDir%
    ;SplitPath, temp_path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    ;if not FileExist(OutDir)
    ;    FileCreateDir, %OutDir%
    bypass_command = Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    if wait=1
        runwait, powershell.exe %bypass_command%%command% | Tee-Object -a -file %path%,,%minmaxhide%
    else
        run, powershell.exe %bypass_command%%command% | Tee-Object -a -file %path%,,%minmaxhide%
    ;FileRead, ps_tmp, %temp_path%
    ;FileAppend, `n%ps_tmp%, %path%
}
AHKPanicYT()
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
        Progress-=1
        Tooltip, Killing Autohotkey Scripts`n`nProgress=%Progress%
        IfInString, ATitle, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\DownloadYoutubeNoWait.ahk
        {
            run, Kill_AHK_Process.ahk %ID%
        }
    }
}
iniToggle(var, tooltip:="")
{
    bolean := inirw("r", var)
    if bolean = 0
        inirw("w", var, "1")
    else if bolean = 1
        inirw("w", var, "0")
    
    if tooltip!=
    {
        Tooltip, %tooltip%
        sleep, 3000
        Tooltip, 
    }
}
ConnectToWifi(hotspot:="")
;Windows 11
{

    loop
    {
        If not ConnectedToInternet()
        {
            WinMinimizeAll
            OpenWifiPanel()
            sleep, 300
            mouse_click_func("1857", "545")
            sleep, 1500
            mouse_click_func("1786", "594")
            sleep 200
            mouse_click_func("1803", "731")
            WinMinimizeAllUndo
            i=10
            loop %i%
            {
                Tooltip, %i% Waiting for wifi
                If ConnectedToInternet()
                    break
                i-=1
                sleep, 1000
            }
            Tooltip, 
        }
        else
            break
    }
    return
    loop
    {
        count+=1
        Tooltip, rounds=%rounds%`ncount=%count%`nwhite=%white%`nblack=%black%`nhooked=%hooked%`ntimeout=%timeout%
        If not ConnectedToInternet()
        {
            OpenWifiPanel()
            mouse_click_func("1676", "973")
            WaitForPixelColor("1669", "987", "0xB60A70", "ms")
            white := MouseHooverCheckColor("1843", "543")   ;   Should Be White if off
            black := MouseHooverCheckColor("1868", "545")   ;   Should Be Black if on
            if white = 0xEFCCE1
            {
                mouse_click_func("1843", "543")
                WaitForPixelColor("1868", "545", "0x000000", "5000", timeout)
                if timeout=0
                {
                    Tooltip, 
                    break
                }
            }
            else if black = 0x000000
            {
                mouse_click_func("1868", "545")
                WaitForPixelColor("1843", "543", "0xE", "2000", timeout)
            }
            else
            {
                Tooltip, PIXEL COLOR SEARCH SCREWED UP... May Still Work tho... Continuing Script...
                sleep, 200
            }
        }
        else, break
    }
    loop 20
    {
        OpenWifiPanel()
        ;checkforwhitenetworkicon := MouseHooverCheckColor("1501", "607")
        ;if checkforwhitenetworkicon contains 0xFFF
        WaitForPixelColor("1797", "670", "0xBF", "2000", timeout)   ;   Looking for disconnect button
        if timeout=0
        {
            Tooltip, 
            break
        }
        mouse_click_func("1685", "595")
        hooked := MouseHooverCheckColor("1533", "664")
        if hooked contains 0xBB267E   ; darkpink
        {
            Tooltip, 11111111111111111111
            mouse_click_func("1533", "664")
            continuebuttonrealcolor := MouseHooverCheckColor("1787", "710")
            if continuebuttonrealcolor contains 0xF84AC2
                mouse_click_func("1787", "710")
        }
        else if hooked contains 0xF84AC2; lightpink
        {
            Tooltip, 22222222222222222
            mouse_click_func("1533", "664")
            WaitForPixelColor("1533", "664", "0x000000", "2000", timeout)
        }
        else
        {
            Tooltip, PIXEL COLOR SEARCH SCREWED UP... May Still Work tho... Continuing Script...
            sleep, 100
        }
    }
    Tooltip, 
    return
    ;runwait, cmd.exe /c netsh wlan connect ssid=Altibox975339 name="All User Profile" interface="Wi-Fi"
    if hotspot=hotspot
    {    
        loop
        {
            hotspotcount+=1
            ;WinClose, Settings
            RunActivate("Settings", "C:\!\Paths\Sources\StartMenu_Programs_Merging_Folders\GodMode(WindowsSettings)\Mobile hotspot.lnk", "", "1", "1")
            x=1622
            y=182
            PixelGetColor, color, "1622", "187", RGB    ;   Should be black when on 0x000000
            PixelGetColor, colordown, "1622", "276", RGB    ;   Should be black when on 0x000000
            ;mousemove, %x%, %y%
            if color = 0xCECECE
                mouse_click_func(x, y)
            else if color = 0x272727
                mouse_click_func(x, y)
            else if color = 0x000000
                hotspotcolor=on
            else if colordown = 0xCECECE
                mouse_click_func(x, y)
            else if colordown = 0x272727
                mouse_click_func(x, y)
            else if colordown = 0x000000
                hotspotcolor=on
            if hotspotcolor=on
            {
                WinClose, Settings
                return hotspot
            }
            if hotspotcount=2
                WinClose, Settings
            if hotspotcount=4
            {
                WinClose, Settings
                break
            }
        }
    }
    else, return wifi
}
/*

Windows 10:

sleep, 500
sleep_tooltip("2", "ConnectToWifiAndTurnOnHotspot")
check_internet:
If ConnectedToInternet()
{
    Tooltip, Turning On Hotspot
    if turned_on!=1
        mouse_click_func("1816", "1058")
    sleep, 4000
    mouse_click_func("1742", "984")
    ;ClickPhoto("C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\WifiHotspot.png")
    Tooltip, 
    ExitApp
}
Else
{
    sleep, 1000
    if turned_on=1
        goto, check_internet
    Tooltip, Connecting to Wifi
    mouse_click_func("1816", "1058")
    sleep, 3000
    mouse_click_func("1601", "347")
    sleep, 1000
    mouse_click_func("1808", "464")
    turned_on=1
    Tooltip, 
    goto, check_internet
}

*/
OpenWifiPanel()
{
    send, #b
    sleep, 50
    send, {left}
    sleep, 50
    send, {left}
    sleep, 50
    send, {left}
    sleep, 50
    send, {left}
    sleep, 50
    send, {left}
    sleep, 50
    send, {enter}
    WaitForPixelColor("1693", "987", "0xB", "5000", "1")    ;   Pink (Wifi Panel)
    mouse_click_func("1571", "566")
}
MouseHooverCheckColor(x, y)
{
    CoordMode, Mouse, Screen
    MouseGetPos, mx, my
    x2 := x+5
    y2 := y+5
    BlockInput, MouseMove
    mousemove, %x%, %y%, 0
    sleep, 3
    mousemove, %x2%, %y2%, 0
    sleep, 3
    mousemove, %x%, %y%, 0
    sleep, 3
    PixelGetColor, color, %x%, %x%, RGB
    mousemove, %mx%, %my%, 0
    BlockInput, MouseMoveOff
    return %color%
}
RunPersistentAHKScripts()
{
    run_file_if_it_exists("Shutdown_Restart_Reboot_Computer_Admin_Listener.ahk", "")
    run_file_if_it_exists("RunAsAdmin.ahk", "")
    run_file_if_it_exists("C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\NO_SOUND_LOOP.ahk", "")
}
KillApps(apps:=0, rocketleague:=0, light:=0, ahkpanic:=0, ahk_except:=0, run_ahk_persistant:=1)
{
    FileDelete, KILL_ALL_APPS_GENERATED.txt
    if apps!=0
    {
        FileRead, KILL_APPS, KILL_APPS.txt
        FileAppend, %KILL_APPS%, KILL_ALL_APPS_GENERATED.txt
    }
    if rocketleague!=0
    {
        FileRead, KILL_ROCKETLEAGUE, KILL_ROCKETLEAGUE.txt
        FileAppend, %KILL_ROCKETLEAGUE%`n, KILL_ALL_APPS_GENERATED.txt
    }
    if light!=0
    {
        FileRead, KILL_The_Last_Light_Apps_List, KILL_The_Last_Light_Apps_List.txt
        FileAppend, %KILL_The_Last_Light_Apps_List%, KILL_ALL_APPS_GENERATED.txt
    }
    run_file_if_it_exists("C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\CloseYoutubeDownloads.ahk", "fast")
    if ahkpanic!=0
    {
        AHKPanicExcept("1", "0", "0", "0", ahk_except)
        if run_ahk_persistant=1
            RunPersistentAHKScripts()
    }
    
    end_process("C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\KILL_ALL_APPS_GENERATED.txt")
    if ahkpanic!=0
    {
        AHKPanicExcept("1", "0", "0", "0", ahk_except)
        if run_ahk_persistant=1
            RunPersistentAHKScripts()
    }
    runwait_file_if_it_exists("C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\CloseYoutubeDownloads.ahk", "fast")
    ;run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\end_process.ahk C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\KILL_ALL_APPS_GENERATED.txt

    ; kill harder and harder:
    ; PostMessage, 0x0112, 0xF060,,, WinTitle, WinText                                        ; 0x0112 = WM_SYSCOMMAND, 0xF060 = SC_CLOSE - This is like alt+F4 or pressing close button
    ; WinClose , WinTitle, WinText, SecondsToWait, ExcludeTitle, ExcludeText                  ; WinClose sends a WM_CLOSE message to the target window, which is a somewhat forceful method of closing it. An alternate method of closing is to send the following message. It might produce different behavior because it is similar in effect to pressing Alt+F4 or clicking the window's close button in its title bar:. If a window does not close via WinClose, you can force it to close with WinKill.
    ; WinKill , WinTitle, WinText, SecondsToWait, ExcludeTitle, ExcludeText                   ; This command first makes a brief attempt to close the window normally. If that fails, it will attempt to force the window closed by terminating its process. If a matching window is active, that window will be closed in preference to any other matching window. In general, if more than one window matches, the topmost (most recently used) will be closed. This command operates only upon a single window except when WinTitle is ahk_group GroupName, in which case all windows in the group are affected. Window titles and text are case sensitive. Hidden windows are not detected unless DetectHiddenWindows has been turned on.
    ; Process, Close , PIDOrName                                                              ; If a matching process is successfully terminated, ErrorLevel is set to its former Process ID (PID). Otherwise (there was no matching process or there was a problem terminating it), it is set to 0. Since the process will be abruptly terminated -- possibly interrupting its work at a critical point or resulting in the loss of unsaved data in its windows (if it has any) -- this method should be used only if a process cannot be closed by using WinClose on one of its windows.
    ; Process, WaitClose, PIDOrName , Timeout                                                 ; Waits for all matching processes to close. Specify for Timeout the number of seconds (can contain a decimal point) to wait before timing out. If Timeout is omitted, the sub-command will wait indefinitely. If all matching processes are closed, ErrorLevel is set to 0. If the sub-command times out, ErrorLevel is set to the Process ID (PID) of the first matching process that still exists.
}
SetDNS(provider, ipv4, ipv6)
{
    if FileExist("c:\tools\nirlauncher\NirSoft\QuickSetDNS.exe")
    {
        status = installed
        exe_path = c:\tools\nirlauncher\NirSoft\QuickSetDNS.exe
    }
    else if FileExist("C:\ProgramData\chocolatey\lib\quicksetdns\tools\QuickSetDNS.exe")
    {
        status = installed
        exe_path = C:\ProgramData\chocolatey\lib\quicksetdns\tools\QuickSetDNS.exe
    }
    else
    {
        status := CheckInstall("C:\ProgramData\chocolatey\lib\quicksetdns\tools\QuickSetDNS.exe", "QuickSetDNS")
        if status = installed
            exe_path = C:\ProgramData\chocolatey\lib\quicksetdns\tools\QuickSetDNS.exe
        else
        {
            status := CheckInstall("c:\tools\nirlauncher\NirSoft\QuickSetDNS.exe", "nirlauncher")
            if status = installed
                exe_path = c:\tools\nirlauncher\NirSoft\QuickSetDNS.exe
        }
    }
    if status = installed
    {
        if provider = cloudflare
        {
            if ipv4=ipv4
                runwait, cmd.exe /c %exe_path% /SetDNS "1.1.1.1,1.0.0.1",,max                                       ;Set Cloudflare dns servers
            if ipv6=ipv6
                runwait, cmd.exe /c %exe_path% /SetDNS6 "2606:4700:4700::1111,2606:4700:4700::1001",,max            ;Set Cloudflare dns servers
        }
        if provider = automatic
        {
            if ipv4=ipv4
                runwait, cmd.exe /c %exe_path% /SetDNS "",,max	                                                    ;Set Automatic dns servers
            if ipv6=ipv6
                runwait, cmd.exe /c %exe_path% /SetDNS6 "",,max	                                                    ;Set Automatic dns servers
        }
    }
    runwait, cmd.exe /c ipconfig /flushdns,,max
}
CheckInstall(path, choconame, toolkit:="0")
{
    filedelete, C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt
    fileappend, Console Output, C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt
    if toolkit != 0
        run, C:\temp_Windows10ToolkitRichard\Public-main\OutputFileToConsole.ahk C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt
    if FileExist(path)
    {
        status = installed
        log("status = installed", "C:\!\Logs\LogToFile.txt")
    }
    else
    {
        status = missing
        if not FileExist("C:\ProgramData\chocolatey\bin\choco.exe")
        {    
            runwait, powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')),,max
            if FileExist("C:\ProgramData\chocolatey\bin\choco.exe")
            {
                choco = 1
                runwait, powershell.exe choco feature enable -n=allowGlobalConfirmation,,max
                runwait, powershell.exe choco feature enable -n=allowEmptyChecksums,,max
                log("Sucsessfully Installed chocolatey", "C:\!\Logs\LogToFile.txt")
                log("choco feature enable -n=allowGlobalConfirmation", "C:\!\Logs\LogToFile.txt")
                log("choco feature enable -n=allowEmptyChecksums", "C:\!\Logs\LogToFile.txt")
            }
            else
            {
                choco = 0
                log("ERROR - tried to install Chocolatey but C:\ProgramData\chocolatey\bin\choco.exe is still missing", "C:\!\Logs\LogToFile.txt")
                Tooltip, ERROR - tried to install Chocolatey but C:\ProgramData\chocolatey\bin\choco.exe is still missing
                sleep, 5000
                Tooltip, 
            }
        }
        log("choco install %choconame%", "C:\!\Logs\LogToFile.txt")
        runwait, powershell.exe choco install %choconame%,,max
        if FileExist(path)
        {
            log("Sucsessfully Installed %choconame%", "C:\!\Logs\LogToFile.txt")
            Tooltip, 
            status = installed
        }
        if not FileExist(path)
        {
            log("choco install %choconame% %--ignore-checksums%", "C:\!\Logs\LogToFile.txt")
            runwait, powershell.exe choco install %choconame% --ignore-checksums,,max
            if FileExist(path)
            {
                log("Sucsessfully Installed %choconame% --ignore-checksums", "C:\!\Logs\LogToFile.txt")
                Tooltip, 
                status = installed
            }
        }
        if not FileExist(path)
        {
            log("choco install %choconame% %--ignore-checksums% %--force%", "C:\!\Logs\LogToFile.txt")
            runwait, powershell.exe choco install %choconame% --ignore-checksums --force,,max
            if FileExist(path)
            {
                log("Sucsessfully Installed %choconame% --ignore-checksums --force --force", "C:\!\Logs\LogToFile.txt")
                Tooltip, 
                status = installed
            }
        }
        if not FileExist(path)
        {
            log("choco install %choconame% %--ignore-checksums% %--force% %--force-dependencies%", "C:\!\Logs\LogToFile.txt")
            runwait, powershell.exe choco install %choconame% --ignore-checksums --force --force-dependencies,,max
            if FileExist(path)
            {
                log("Sucsessfully Installed %choconame% --ignore-checksums --force --force-dependencies", "C:\!\Logs\LogToFile.txt")
                Tooltip, 
                status = installed
            }
            else
            {
                log("ERROR - tried to install %choconame% but %path% is still missing", "C:\!\Logs\LogToFile.txt")
                Tooltip, ERROR - tried to install %choconame% but %path% is still missing
                sleep, 5000
                Tooltip, 
            }
        }
    }
    return %status%
}
WindowSnap(direction){
    SysGet, m, MonitorWorkArea

    if direction = Right
    {
        WinMove, This PC,, mRight/2, 0, mRight/2, mBottom
        return
    }
    if direction = Left
    {
        WinMove, This PC,, 0, 0, mRight/2, mBottom
        return
    }
    if direction = Up
    {
        WinMove, This PC,, 0, mBottom/2, mRight, mBottom/2
        return
    }
    if direction = Down
    {
        WinMove, This PC,, 0, 0, mRight, mBottom/2
        return
    }
    ;#+z::

;WinMove, X, Y
;WinMove, WinTitle, WinText, X, Y , Width, Height, ExcludeTitle, ExcludeText
}

state := GetKeyState("RButton")  ; Right mouse button.
CompileRun(path, cmd:="")
{
    SplitPath, path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    WinClose, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\RunAsAdmin.ahk ahk_exe AutoHotkey.exe
    sleep, 50
    send, ^+{F9}
    sleep, 50
    run_file_if_it_exists("C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\RunAsAdmin.ahk", cmd)
    sleep, 50
    loop
    {  
        compiled=%OutDir%\%OutNameNoExt%.exe
        run_file_if_it_exists(compiled, "")
        sleep, 50
    }
}
ToggleAutorun(ADMIN_RESTRICTED)
{
    PreventNextAutorunADMIN := inirw("r","PreventNextAutorunADMIN")
    if ADMIN_RESTRICTED=ADMIN
        if PreventNextAutorunADMIN=1
        {
            inirw("w", "PreventNextAutorunADMIN", "0")
            Tooltip, Enabled ADMIN Autorun
        }
        else
        {
            inirw("w", "PreventNextAutorunADMIN", "1")
            Tooltip, Disabled ADMIN Autorun ##############################################################################################################
        }

    PreventNextAutorunRESTRICTED := inirw("r","PreventNextAutorunRESTRICTED")
    if ADMIN_RESTRICTED=RESTRICTED
        if PreventNextAutorunRESTRICTED=1
        {
            inirw("w", "PreventNextAutorunRESTRICTED", "0")
            Tooltip, Enabled RESTRICTED Autorun
        }
        else
        {
            inirw("w", "PreventNextAutorunRESTRICTED", "1")
            Tooltip, Disabled RESTRICTED Autorun ##############################################################################################################
        }
}
BeforeShutdown()
{
    run_file_if_it_exists("C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\mount_veracrypt_g3.ahk", "dismount")
    KillApps("apps", "rocketleague", "light", "ahkpanic", "C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\mount_veracrypt_g3.ahk", "0")
    WinClose, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\RunAsUser.ahk ahk_exe AutoHotkey.exe
    ;runwait_file_if_it_exists("C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Start_NVidia_Recording.ahk", "shutdown")
    loop
    {
        dismounting := inirw("r", "dismounting")
        if dismounting = 0
            break
    }
}
get_size(file_or_folder)
{
    AttributeString := FileExist(file_or_folder)
    if AttributeString = D
    {
        SetBatchLines, 20ms  ; Make the operation run at maximum speed.
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
inirw(rw, key, value:="", file:="C:\!\TEMP\InifilesAndOther\GLOBAL_VARIABLES.ini", log:="1")
{
    SplitPath, file, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    FileCreateDir, %OutDir%
    if rw=w
    {
        if log=1
        {
            log_this=Writing ini-file - value=%value% key=%key% File=%file%
            log(log_this)
        }
        IniWrite, %value%, %file%, Section, %key%
    }
    else if rw=r
    {
        if log=1
        {
            log_this=Reading ini-file - value=%value% key=%key% File=%file%
            log(log_this)
        }
        IniRead, value, %file%, Section, %key%
    }
    Else
    {
        log("ERROR")
        msgbox, ERROR, rw was not r or w`nrw=%rw%
    }
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
RunActivate(title, exe_path, commands:="", multiple:="0", minmaxclose:="max", timeout:="20")
{
    SplitPath, exe_path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    if multiple = 1
    {
        if exe_path contains http
            run, %exe_path% %commands%
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
    timeout10 := timeout*10
    loop
    {
        WinActivate, ahk_exe %OutFileName%
        WinActivate, %title%
        WinGetActiveTitle, AT
        if AT contains %title%
            break
        else if timeout10 < 1
        {
            Tooltip, RunActivate Function Timed out after %timeout% seconds...
            sleep, 3000
            Tooltip, 
            return %PID%
        }
        timeout10-=1
        sleep, 100
    }
    if (minmaxclose = max) or (minmaxclose = 1)
    {
        WinMaximize, ahk_exe %OutFileName%
        WinMaximize, %AT%
        WinMaximize, %title%
        WinMaximize, %OutDir%
    }
    else if minmaxclose=min
    {
        WinMinimize, ahk_exe %OutFileName%
        WinMinimize, %AT%
        WinMinimize, %title%
        WinMinimize, %OutDir%
    }
    else if minmaxclose=close
    {
        WinClose, ahk_exe %OutFileName%
        WinClose, %AT%
        WinClose, %title%
        WinClose, %OutDir%
    }
    else if minmaxclose=maxclose
    {
        WinMaximize, ahk_exe %OutFileName%
        WinMaximize, %AT%
        WinMaximize, %title%
        WinMaximize, %OutDir%
        if title = messenger
        {
            WinMinimize, %title%
            sleep, 500
        }
        WinClose, ahk_exe %OutFileName%
        WinClose, %AT%
        WinClose, %title%
        WinClose, %OutDir%
    }
    return %PID%


/*
     Windows-Shift-S: launches new Chrome instance or activates existing one (and opens new tab)
    #+s::
        SetTitleMatchMode, 2
        if WinExist("ahk_class Chrome_WidgetWin_1") {
            ifWinNotActive, ahk_class Chrome_WidgetWin_1
            {
                WinActivate, ahk_class Chrome_WidgetWin_1
                WinWaitActive
            }
            Send, ^t ; shortcut for new tab
        } else {
            Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
            Sleep 100
            WinActivate
            WinWaitActive
        }
    return
*/
}
WaitForPixelColor(x, y, ByRef color, ms, ByRef hit_type="", ByRef real_color:="", ByRef mouse_color:="")  ;CHANGE THIS WITH PixelSearch
{
    rounds_unrounded := ms/100/2.6885
    rounds := Round(rounds_unrounded, 0)
    if rounds=0
        rounds=1
    hit_type=0
    if ms=0
        ms=1
    loop %rounds%
    { 
        CoordMode, Pixel, Screen
        PixelGetColor, real_color, x, y, RGB
        if real_color contains %color%
        {
            hit_type=normalhit
            mouse_color=no_mouse_hit
            return 1
        }
        mouse_color := MouseHooverCheckColor(x, y)
        if mouse_color contains %color%
        {
            hit_type=mousehit
            real_color=no_real_color_hit
            return 1
        }
        else
        {
            Tooltip, %color% Waiting for this color`n%real_color% Real color`n%real_color% Real color when mouse hoover`n%rounds% Timeout (%ms% ms)
            sleep, 50
            ;Tooltip, color = %color%`nreal_color = %real_color%
        }
        rounds-=1
    }
    return 0
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
        ;Tooltip, Waiting for %AT%`nTimeout in %count%
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
DownloadYoutubeMusic(metafiles, openfolder, deleteparts, format, path, link)
{
    FileCreateDir, %path%
    SetWorkingDir, %path%
    if FileExist(path)
        sleep, 1
    else
    {
        log = %path% Doesent Exist
        LogTime(log)
    }
    if A_WorkingDir = %path%
        sleep, 1
    else
    {
        log2 = ERROR! Working Directory is %A_WorkingDir%... Exiting App...
        LogTime(log2)
        msgbox, ERROR! Working Directory is %A_WorkingDir%... Exiting App...
        ExitApp
    }
    SplitPath, path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    if openfolder=1
    {
        Tooltip, 
        runwait, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\DownloadYoutubeNoWait.ahk %metafiles% %openfolder% %deleteparts% %format% %path% %link%
    }
    else
    {
        tooltipstring=%OutFileName%Launching yt-dlp`nmetafiles=%metafiles%`nopenfolder=%openfolder%`ndeleteparts=%deleteparts%`nformat=%format%`npath=%path%
        TooltipPosition("-10", tooltipstring)
        run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\DownloadYoutubeNoWait.ahk %metafiles% %openfolder% %deleteparts% %format% %path% %link%
    }
    rename:
    loop 50
    {
        IfWinExist, C:\ProgramData\chocolatey\bin\yt-dlp.exe
        {
            winactivate, C:\ProgramData\chocolatey\bin\yt-dlp.exe
            WinWaitActive, C:\ProgramData\chocolatey\bin\yt-dlp.exe
            break
        }
        sleep, 200
    }
    loop 20
    {
        WinSetTitle, C:\ProgramData\chocolatey\bin\yt-dlp.exe,, %OutFileName% %format% yt-dlp___title_for_closing___
        IfWinExist, C:\ProgramData\chocolatey\bin\yt-dlp.exe
        {
            sleep, 500
        }
        else
            break
    }
    IfWinExist, C:\ProgramData\chocolatey\bin\yt-dlp.exe
        goto, rename
    ;WinMaximize, %OutFileName% yt-dlp
    ;WinMinimize, %OutFileName% yt-dlp
    ; --paths [TYPES:]PATH
    ; --output %(title)s.%(ext)s
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
    mode = move
    include = "*.json;*.url;*.description;*.webp;*.jpg;*.png"
    wait_for_fastcopy_to_finish()
    runwait, "fastcopy" /include=%include% /postproc=nosound /cmd=%mode% /open_window /force_close /force_start(=N) "%source%" /to="%dest%",,min
    source = %metafolderTEMP%
    dest = %metafolder%
    mode = move
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
            runwait, "fastcopy" /verify /estimate /no_ui /postproc=nosound /cmd=%m% /force_start(=N) "%s%" /to="%d%"
        }
    }
}
fastcopy_func(source, dest, mode, arg:="") ;   Cloneapp_Manual needs this
{
    if FileExist(source)
    {
        SplitPath, dest, dest_OutFileName, dest_OutDir, dest_OutExtension, dest_OutNameNoExt, dest_OutDrive
        if FileExist(dest_OutDrive)
        {
            run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\fastcopy_multiple_instances_ini_wait.ahk "%source%" "%dest%" "%mode%" "%arg%"
            ;run, fastcopy /postproc=nosound %mode% /open_window /force_close /force_start(=N) "%source%" /to="%dest%"
        }
    }
}
fastcopy_func_NEW(source, dest, mode) ;   File or Folder, will create destination folders, Close even if error.
{
    if FileExist(source)
    {
        SplitPath, dest, dest_OutFileName, dest_OutDir, dest_OutExtension, dest_OutNameNoExt, dest_OutDrive
        if FileExist(dest_OutDrive)
        {
            run, "fastcopy" /verify /estimate /no_ui /postproc=nosound /cmd=%m% /force_start(=N) "%s%" /to="%d%"
            sleep, 500
        }
    }
}
FormatTime, TimeLong,, yyyy-MM-dd_HH.mm.ss
StopwatchTooltip(tooltip)
{
    run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\StopwatchTooltip.ahk %tooltip%
}
ElapsedTime(Label:="Stopwatch", byref ElapsedTime_ms:="", byref file_append:="")
{
	LogThisTick := A_TickCount
    ;LogThisTickPrev := inirw("r", Label)
    IniRead, LogThisTickPrev, C:\!\TEMP\InifilesAndOther\Elapsed_Time.ini, Section, %Label%
    ;inirw("w", Label, LogThisTick)
    IniWrite, %LogThisTick%, C:\!\TEMP\InifilesAndOther\Elapsed_Time.ini, Section, %Label%
    ElapsedTime_ms := LogThisTick-LogThisTickPrev
    ElapsedTime_secs := ElapsedTime_ms/1000
    ElapsedTime_mins := ElapsedTime_secs/60
    ElapsedTime_hours := ElapsedTime_mins/60

    if ElapsedTime_hours >= 1 ;Need the python round up thing for this
    {
        ;hours=%ElapsedTime_hours%:
        hours=yes
    }
    if ElapsedTime_mins >= 1
    {
        ;mins=%ElapsedTime_mins%:
        mins=yes
    }
    if ElapsedTime_secs >= 1
    {
        ;secs=%ElapsedTime_secs%.
        secs=yes
    }
    ElapsedTime=%ElapsedTime_hours%%ElapsedTime_mins%%ElapsedTime_secs%%ElapsedTime_ms%
    file_append=%ElapsedTime_hours% Hours - %ElapsedTime_mins% Minutes - %ElapsedTime_secs%Seconds - %ElapsedTime_ms% ms
    ;Tooltip, %ElapsedTime_hours% Hours`n%ElapsedTime_mins% Minutes`n%ElapsedTime_secs%Seconds`n%ElapsedTime_ms% ms`n`nElapsedTime=%ElapsedTime%
    ;return ElapsedTime
}
log(LogThis:="", filename:="C:\!\Logs\LogToFile.txt", tooltip:="0", console:="0")
{
    ElapsedTime(LogThis, ElapsedTime_ms, file_append)
    if tooltip!=0
        Tooltip, %LogThis%`n%filename%
    if filename != C:\!\Logs\LogToFile.txt
    {
        splitpath, filename
        if filename not contains :
            filename=C:\!\Logs\%filename%
    }
    consolefilename=C:\!\Logs\LogToFileConsole.txt
    FormatTime,TimeLong,, yyyy-MM-dd_HH-mm-ss.%A_msec%
	FileAppend, %TimeLong% %LogThis% %ElapsedTime_ms%ms                                           ElapsedTime=%file_append% %A_ScriptFullPath%`n, %filename%
	FileAppend, %TimeLong% %LogThis% %ElapsedTime_ms%ms %A_ScriptFullPath%`n, %consolefilename%
    if console!=0
    {
        
        IfWinNotExist, AutohotkeyLogConsole
        {
            RunPath("C:\!\Code\GitHub\93andresen_Scripts\Public\OutputFileToConsole.ahk", "0", consolefilename)
            WinWaitActive, C:\Program Files\AutoHotkey\AutoHotkey.exe
            WinSetTitle, C:\Program Files\AutoHotkey\AutoHotkey.exe, , AutohotkeyLogConsole %consolefilename%
            if console contains maximize
                WinMaximize, C:\Program Files\AutoHotkey\AutoHotkey.exe
            if console contains alwaysontop
                WinSet, AlwaysOnTop, , AutohotkeyLogConsole %filename%
        }
    }
	if tooltip!=0
        Tooltip, 
    return ElapsedTime_ms
}
LogTime(x)
{
    FormatTime,TimeLong,, yyyy-MM-dd_HH-mm-ss.%A_msec%
	FileAppend, %TimeLong% %x%`n, C:\!\Logs\LogTime.txt
}
LogTimeEscape(x)
{
	FormatTime,TimeLong,, yyyy-MM-dd_HH-mm-ss.%A_msec%
	FileAppend, %TimeLong% %x% Triggered by pressing Escape - Implement this --> HOW_MANY Seconds Have Passed Since %x%`n, C:\!\Logs\LogTime.txt
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
sleep_tooltip(seconds, tooltip:="")
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
        WinClose, ahk_exe C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Drikkelek101.ahk
    }
}
FileCreateJunctionLink(link, target, type:="junction", cmd:="mklink")
{
    ;if cmd=mklink;   See https://www.2brightsparks.com/resources/articles/ntfs-hard-links-junctions-and-symbolic-links.html
    ;{
    file_or_folder := FileExist(target)
    if file_or_folder = D;  Folder
        if type=junction
            run, cmd.exe /k mklink /j "%link%" "%target%"
        else if type=symlink
            run, cmd.exe /k mklink /d "%link%" "%target%"
    else if file_or_folder != D; File
        if type=hard
            run, cmd.exe /k mklink /h "%link%" "%target%"
        if type=symlink
            run, cmd.exe /k mklink "%link%" "%target%"
    ;}
    ;else
    ;{
    ;    status := CheckInstall("C:\ProgramData\chocolatey\lib\sysinternals\tools\junction.exe", "sysinternals")
    ;    if status = installed
    ;    {
    ;        run, cmd /k C:\ProgramData\chocolatey\lib\sysinternals\tools\junction.exe "%link%" "%target%" -nobanner -accepteula
    ;    }
    ;}
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
end_process(exe_filelist_path, tooltip:="yes")
{
    Loop, Read, %exe_filelist_path%
    {
        Progress := A_Index
        Progress *= 2
    }
    if tooltip=yes
        Tooltip, Asking applications Gracefully to end - %A_LoopReadLine%`n`nProgress=%Progress%
    Loop, Read, %exe_filelist_path%
    {
        if tooltip=yes
            Tooltip, Asking applications Gracefully to end - %A_LoopReadLine%`n`nProgress=%Progress%
        Process, Exist, %A_LoopReadLine%
        If (ErrorLevel != 0)
        {
            run, cmd.exe /c Taskkill /IM "%A_LoopReadLine%",,hide
        }
        Progress-=1
    }
    if tooltip=yes
        Tooltip, Killing Tasks Forcefully - %A_LoopReadLine%`n`nProgress=%Progress%
    Loop, Read, %exe_filelist_path%
    {
        if tooltip=yes
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
    if path=0
        path=ahtsdfgsahtdfasghtdfashdtfsd

    Loop, %IDList%
    {
        Progress := A_Index
        ;Progress *= 2
    }
    Loop %IDList%
    {
        ID:=IDList%A_Index%
        WinGetTitle, ATitle, ahk_id %ID%
        Progress-=1
        IfNotInString, ATitle, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Shutdown_Restart_Reboot_Computer.ahk
        {
            IfNotInString, ATitle, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Shutdown_Restart_Reboot_Computer_Admin_Listener.ahk
            {
                IfNotInString, ATitle, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Shutdown_Restart_Reboot_Computer.ahk
                {
                    IfNotInString, ATitle, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\RunAsUser.ahk
                    {
                        IfNotInString, ATitle, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Kill_AHK_Process.ahk
                        {
                            IfNotInString, ATitle, %path%
                            {
                                IfNotInString, ATitle, %A_ScriptFullPath%
                                {
                                    Tooltip, Killing Autohotkey Scripts - %ATitle%`n`nProgress=%Progress%
                                    If Suspend
                                    PostMessage, 0x111, 65305,,, ahk_id %ID%  ; Suspend. 
                                    If Pause
                                    PostMessage, 0x111, 65306,,, ahk_id %ID%  ; Pause.
                                    If Kill
                                    {
                                        run, Kill_AHK_Process.ahk %ID%
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    Tooltip, Kill Self
    If SelfToo
    {
        If Suspend
            Suspend, Toggle  ; Suspend. 
        If Pause
            Pause, Toggle, 1  ; Pause.
        If Kill
        {
            Tooltip, 
            ExitApp
        }
    }
    Tooltip, 
}
AHKPanicOLD(Kill=0, Pause=0, Suspend=0, SelfToo=0)
{
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

run_file_if_it_exists(path, cmd:="")
{
    timeout=100
    loop %timeout%
    {
        if FileExist(path)
        {
            run, %path% %cmd%,,,PID
            return %PID%
        }
        Else
        {
            Tooltip, %path% Doesen't Exist timeout=%timeout%
            timeout-=1
            sleep, 100
        }
    }
}
runwait_file_if_it_exists(path, cmd:="")
{
    if FileExist(path)
    {
        runwait, %path% %cmd%,,,PID
        return %PID%
    }
}
RunPathOLD(path, wait:="0", args:="")
{
    if FileExist(path)
    {
        if wait = 1
            runwait, %path% %args%,,,PID
        else
            run, %path% %args%,,,PID
        return %PID%
    }
    else
        return 0
}
RunPath(path, wait:="0", args:="", WorkingDir:="ScriptPath")
{
    if FileExist(path)
    {
        SplitPath, path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
        if OutExtension=ahk
        {
            loop, read, %path%
            {
                if A_LoopReadLine contains AutohotkeyFucktions.ahk
                {
                    if not FileExist("AutohotkeyFucktions.ahk")
                    {
                        if FileExist("C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutohotkeyFucktions.ahk")
                        {
                            if OutDrive=C:
                                FileCreateJunctionLink(link, target, type:="hard")
                            else
                            lib=C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\AutohotkeyFucktions.ahk
                            FileCreateDir C:\Program Files\AutoHotkey\Lib
                            FileCreateDir C:\Users\%A_UserName%\AppData\Local\Temp\_Autohotkey_Lib
                            templibadmin=C:\Program Files\AutoHotkey\Lib\AutohotkeyFucktions.ahk
                            templibrestricted=C:\Users\%A_UserName%\AppData\Local\Temp\_Autohotkey_Lib\AutohotkeyFucktions.ahk
                            if A_IsAdmin = 1
                            {
                                FileCopy, %lib%, %templibadmin%, 1
                                if FileExist(templibadmin)
                                {
                                    templibfolder=C:\Program Files\AutoHotkey\Lib
                                    templib=%templibadmin%
                                }
                            }
                            else
                            {
                                FileCopy, %lib%, %templibrestricted%, 1
                                if FileExist(templibrestricted)
                                {
                                    templibfolder=C:\Users\%A_UserName%\AppData\Local\Temp\_Autohotkey_Lib
                                    templib=%templibrestricted%
                                }
                            }
                            temp_script_path=%templibfolder%\%OutFileName%
                            FileCopy, %path%, %temp_script_path%, 1
                            Tooltip, COPIED AHK_FUNCTION_LIBRARY TO TEMP LOCATION %A_ScriptFullPath%
                        }
                        else
                        {
                            UrlDownloadToFile, https://raw.githubusercontent.com/93andresen/Public/main/AutohotkeyFucktions.ahk, %templib%\AutohotkeyFucktions.ahk
                            LogThis=Had to Download Functions to %templib%
                            Tooltip, DOWNLOADED AHK_FUNCTION_LIBRARY %A_ScriptFullPath%
                            log(LogThis)
                        }
                        LogThis=had to run %path% in %temp_script_path% Because of missing lib
                        log(LogThis)
                    }
                }
            }
        }
        LogThis=wait=%wait% - command=%command% - WorkingDir=%WorkingDir%
        log(LogThis)
        if WorkingDir=ScriptPath
        {
            if wait = 1
            {
                command=%path% %args%
                Working_Directory=%A_WorkingDir%
                tryrunwait(command, Working_Directory)
            }
            else
            {
                command=%path% %args%
                Working_Directory=%A_WorkingDir%
                tryrun(command, Working_Directory)
            }
        }
        else if WorkingDir=0
        {
            command=%path% %args%
            if wait = 1
            {
                tryrunwait(command)
            }
            else
            {
                tryrun(command)
            }
        }
        else
        {
            command=%path% %args%
            if wait = 1
                tryrunwait(command)
            else
            {
                tryrun(command)
            }
            return %PID%
        }
    }
    else
        return 0
}
tryrun(code, WorkingDir:="")
{
    try
    {
        run, %code%
        LogTry=%ErrorLevel% - %code%
        log(LogTry, , "1", "0")
        return PID
    }
    catch
    {
        LogError=%ErrorLevel% - %code%
        log(LogError, , "1", "0")
        return 0
    }
}
tryrunwait(code, WorkingDir:="")
{
    try
    {
        runwait, %code%
        LogTry=%ErrorLevel% - %code%
        log(LogTry, , "1", "0")
        return PID
    }
    catch
    {
        LogError=%ErrorLevel% - %code%
        log(LogError, , "1", "0")
        return 0
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







