#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, off
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetTitleMatchMode, 2
DetectHiddenWindows, On
DetectHiddenText, On
SetBatchLines, 10ms
#Include, AutohotkeyFucktions.ahk
;CompileRun(A_ScriptFullPath)
log("Started Running")


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
NFS := inirw("r", NFS)
NFS +=1
inirw("w", "NFS", NFS)
ExitAppLog()


~Esc::
if esc!=1
{
    esc=1
    log("Escape Pressed Once")
    msgbox, %A_ScriptName% is Paused`n`n%A_ScriptFullPath%`n`n`nPress Esc twice to Exit App
}
else if esc=1
    ExitAppLog("esc")

