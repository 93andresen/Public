@Echo Off
Title Reg Converter v1.2 & Color 1A
REM ~ call :IsAdmin

call :RegExport
Exit

:RegExport
Set RegFile="%Temp%\~ogesakk.tmp"

If Exist %RegFile% (
 Attrib -R -S -H %RegFile% &  Del /F /Q %RegFile%
 If Exist %RegFile% cls & Echo Could not delete file %RegFile% & Pause
)
> %RegFile% Echo Windows Registry Editor Version 5.00
>> %RegFile% Echo.
>> %RegFile% Echo [HKEY_CLASSES_ROOT\Directory\shell\Search FOLDER with ?Everything]
>> %RegFile% Echo "Icon"=hex(1):22,00,43,00,3a,00,5c,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,\
>> %RegFile% Echo   00,20,00,46,00,69,00,6c,00,65,00,73,00,5c,00,45,00,76,00,65,00,72,00,79,00,\
>> %RegFile% Echo   74,00,68,00,69,00,6e,00,67,00,5c,00,45,00,76,00,65,00,72,00,79,00,74,00,68,\
>> %RegFile% Echo   00,69,00,6e,00,67,00,2e,00,69,00,63,00,6f,00,22,00,00,00
>> %RegFile% Echo.
>> %RegFile% Echo [HKEY_CLASSES_ROOT\Directory\shell\Search FOLDER with ?Everything\Command]
>> %RegFile% Echo @=hex(1):22,00,43,00,3a,00,5c,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,20,\
>> %RegFile% Echo   00,46,00,69,00,6c,00,65,00,73,00,5c,00,45,00,76,00,65,00,72,00,79,00,74,00,\
>> %RegFile% Echo   68,00,69,00,6e,00,67,00,5c,00,45,00,76,00,65,00,72,00,79,00,74,00,68,00,69,\
>> %RegFile% Echo   00,6e,00,67,00,2e,00,65,00,78,00,65,00,22,00,20,00,2d,00,70,00,61,00,74,00,\
>> %RegFile% Echo   68,00,20,00,22,00,25,00,25,00,31,00,22,00,00,00

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
