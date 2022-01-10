@Echo Off
Title Reg Converter v1.2 & Color 1A
REM ~ call :IsAdmin

call :RegExport
Exit

:RegExport
Set RegFile="%Temp%\~zwnaeuq.tmp"

If Exist %RegFile% (
 Attrib -R -S -H %RegFile% &  Del /F /Q %RegFile%
 If Exist %RegFile% cls & Echo Could not delete file %RegFile% & Pause
)
> %RegFile% Echo Windows Registry Editor Version 5.00
>> %RegFile% Echo.
>> %RegFile% Echo ; Created by: Shawn Brink
>> %RegFile% Echo ; http://www.tenforums.com
>> %RegFile% Echo ; Tutorial: http://www.tenforums.com/tutorials/38097-drag-drop-default-action-change-windows.html
>> %RegFile% Echo.
>> %RegFile% Echo.
>> %RegFile% Echo [HKEY_CLASSES_ROOT\*]
>> %RegFile% Echo "DefaultDropEffect"=-
>> %RegFile% Echo.
>> %RegFile% Echo [HKEY_CLASSES_ROOT\AllFilesystemObjects]
>> %RegFile% Echo "DefaultDropEffect"=-

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
