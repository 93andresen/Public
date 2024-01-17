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
#Include C:\_\Code\GitHub\93andresen_Scripts\Autohotkey\lib\AutohotkeyFucktions.ahk
;CompileRun(A_ScriptFullPath)
log("Started Running")


Process, Priority, , A
SetBatchLines, 10ms

logfile=%1%
x=1
loop
{
	SplitPath, logfile, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
	d=%OutDir%%OutNameNoExt%_ConsoleCopy.%OutExtension%
	FileCopy, logfile, d, 1
	FileReadLine, v, %d%, %x%
	Tooltip, Errorlevel=%Errorlevel%`nv=%v%`nd=%d%`nx=%x%
	Listvars
    if Errorlevel=0
    {
        if v=
        {
            Stdout("`n")
        }
        else
            Stdout(v)	;output to new console
        x+=1
    }
}



~Esc::
if esc!=1
{
    esc=1
    log("Escape Pressed Once")
    msgbox, %A_ScriptName% is Paused`n`n%A_ScriptFullPath%`n`n`nPress Esc twice to Exit App
}
else if esc=1
    ExitApp





















