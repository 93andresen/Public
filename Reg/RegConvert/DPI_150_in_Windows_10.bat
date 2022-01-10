@Echo Off
Title Reg Converter v1.2 & Color 1A
REM ~ call :IsAdmin

call :RegExport
Exit

:RegExport
Set RegFile="%Temp%\~mmcyjgl.tmp"

If Exist %RegFile% (
 Attrib -R -S -H %RegFile% &  Del /F /Q %RegFile%
 If Exist %RegFile% cls & Echo Could not delete file %RegFile% & Pause
)
> %RegFile% Echo Windows Registry Editor Version 5.00
>> %RegFile% Echo.
>> %RegFile% Echo ; Created by: Shawn Brink
>> %RegFile% Echo ; Created on: October 3rd 2016
>> %RegFile% Echo ; Tutorial: http://www.tenforums.com/tutorials/5990-dpi-scaling-level-displays-change-windows-10-a.html
>> %RegFile% Echo.
>> %RegFile% Echo.
>> %RegFile% Echo [HKEY_CURRENT_USER\Control Panel\Desktop]
>> %RegFile% Echo "LogPixels"=dword:00000144
>> %RegFile% Echo "Win8DpiScaling"=dword:00000001
>> %RegFile% Echo.
>> %RegFile% Echo [-HKEY_CURRENT_USER\Control Panel\Desktop\PerMonitorSettings]
>> %RegFile% Echo.
>> %RegFile% Echo [HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]
>> %RegFile% Echo "AppliedDPI"=dword:00000144

Start /Wait %systemroot%\Regedit.exe /S %RegFile%
Del %RegFile%
goto:eof

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
