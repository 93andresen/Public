;RunAsUser

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance,force
#Persistent
CoordMode, Screen
Tooltip, ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ
sleep, 100
Tooltip, 
return

^+F8::
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Autorun_RESTRICTED.ahk
return

^+!t::

return
!t::
Reload
sleep, 300
msgbox, FAILED TO RELOAD    
return


MouseGetPos, MX, MY
clipboard=%MX%, %MY%
return
send, !{tab}
sleep, 200
sendinput, %MX%, %MY%
return

; Google Search clipbpard
^+c::
{
 Run, http://www.google.com/search?q=%clipboard%
}

return
;Chocolatey Search
^+!c::
{
	Run, https://chocolatey.org/packages?q=%clipboard%
}

return
^+r::
Tooltip, .
run, %clipboard%
Tooltip, 
return


^Space::
runwait, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\RESTRICTEDKeyboardLayout.ahk
return

<^>!,::
send, {;}{Down}{Left}
return


^F2::
WinGetActiveStats, Title, Width, Height, X, Y
clipboard=%Title%, %Width%, %Height%, %X%, %Y%
ExitApp


::aaaa::ADMIN_


;^D::
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\DownloadSpotifyPlaylistOnMousePosition.ahk
Return

#!x::	;Open Folder ! Explorer
run, explorer.exe
return

#!c::	;Open Folder ! Explorer
run, C:\!
return
#!v::	;Open Folder ! Explorer
run, D:\!
return
#!b::	;Open Folder ! Explorer
run, E:\!
return

#!d::	;Open Folder ! Explorer
run, K:\c_dynamic
return
#!f::	;Open Folder ! Explorer
run, L:\d_dynamic
return
#!g::	;Open Folder ! Explorer
run, M:\e_dynamic
return

#!n::	;Open Folder ! Explorer
run, R:\My Drive
return
#!j::	;Open Folder ! Explorer
run, S:\My Drive
return

#!a::	;Open Folder ! Explorer
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey
return


Launch_App1::
msgbox, Launch_App1 button pressed!
return

F12::
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\switch_task_dynalist.ahk
return

;!<::
;send, #1
;return
;!z::
;send, #2
;return
;!x::
;send, #3	
;return
;!c::
;send, #4
;return
;!v::
;send, #5
;return
;!b::
;send, #6
;return
;!n::
;send, #7
;return
;!m:
;send, #8
;return
;!,::
;send, #9
;return
;!.::
;send, #0
;return

