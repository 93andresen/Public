Start-Transcript -Append C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072


Import-Module BitsTransfer
Start-BitsTransfer -Source "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -Destination OOSU10.exe

$ooshutuppath = $arg[0]

./OOSU10.exe $ooshutuppath /quiet
Write-Host './OOSU10.exe $ooshutuppath /quiet'





