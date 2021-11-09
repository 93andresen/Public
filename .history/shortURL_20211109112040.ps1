Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
if (Test-Path "C:\ProgramData\chocolatey\bin\choco.exe"){
    'Chocolatey Allready Installed'
}  
else{
    'Installing Chocolatey'
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}
choco feature enable -n=allowGlobalConfirmation -y

if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
    'Winget Already Installed'
}  
else{
    # Installing winget from the Microsoft Store
    Write-Host "Winget not found, installing it now."
    Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
    $nid = (Get-Process AppInstaller).Id
    Wait-Process -Id $nid
    Write-Host Winget Installed
}

if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
    'Autohotkey Already Installed'
}  
else{
    choco install Autohotkey
    if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
        'Chocolatey Sucsessfully installed Autohotkey'
    }  
    else{
        winget install -e Lexikos.AutoHotkey | Out-Host
        if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
            'Chocolatey COULD NOT install Autohotkey'
            'Winget Sucsessfully installed Autohotkey'
        }  
        else{
            'Could not install Autohotkey with Winget OR Chocolatey!!!'
        }
    }
}


'Downloading ahk script to C:\zzz_temp'
if (Test-Path "C:\zzz_temp"){
}  
else{
    mkdir C:\zzz_temp
}
Set-Location C:\zzz_temp
# Source file location
$source = 'https://raw.githubusercontent.com/93andresen/Richard_Public/main/RunAnywhere.ahk'
# Destination to save the file
$destination = 'RunAnywhere.ahk'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
& "C:\Program Files\AutoHotkey\AutoHotkey.exe" c:\zzz_temp\RunAnywhere.ahk
'running c:\zzz_temp\RunAnywhere.ahk'

#Set-Location C:\
#Remove-Item C:\zzz_temp -Recurse